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

import 'v2014_10_31.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Neptune is a fast, reliable, fully-managed graph database service
/// that makes it easy to build and run applications that work with highly
/// connected datasets. The core of Amazon Neptune is a purpose-built,
/// high-performance graph database engine optimized for storing billions of
/// relationships and querying the graph with milliseconds latency. Amazon
/// Neptune supports popular graph models Property Graph and W3C's RDF, and
/// their respective query languages Apache TinkerPop Gremlin and SPARQL,
/// allowing you to easily build queries that efficiently navigate highly
/// connected datasets. Neptune powers graph use cases such as recommendation
/// engines, fraud detection, knowledge graphs, drug discovery, and network
/// security.
class Neptune {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Neptune({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rds',
            signingName: 'rds',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Associates an Identity and Access Management (IAM) role with an Neptune DB
  /// cluster.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBClusterRoleAlreadyExistsFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterRoleQuotaExceededFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the DB cluster to associate the IAM role with.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to associate with the
  /// Neptune DB cluster, for example
  /// <code>arn:aws:iam::123456789012:role/NeptuneAccessRole</code>.
  ///
  /// Parameter [featureName] :
  /// The name of the feature for the Neptune DB cluster that the IAM role is to
  /// be associated with. For the list of supported feature names, see
  /// <a>DBEngineVersion</a>.
  Future<void> addRoleToDBCluster({
    required String dBClusterIdentifier,
    required String roleArn,
    String? featureName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['RoleArn'] = roleArn;
    featureName?.also((arg) => $request['FeatureName'] = arg);
    await _protocol.send(
      $request,
      action: 'AddRoleToDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddRoleToDBClusterMessage'],
      shapes: shapes,
    );
  }

  /// Adds a source identifier to an existing event notification subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SourceNotFoundFault].
  ///
  /// Parameter [sourceIdentifier] :
  /// The identifier of the event source to be added.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If the source type is a DB instance, then a
  /// <code>DBInstanceIdentifier</code> must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB security group, a
  /// <code>DBSecurityGroupName</code> must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB parameter group, a
  /// <code>DBParameterGroupName</code> must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB snapshot, a <code>DBSnapshotIdentifier</code>
  /// must be supplied.
  /// </li>
  /// </ul>
  ///
  /// Parameter [subscriptionName] :
  /// The name of the event notification subscription you want to add a source
  /// identifier to.
  Future<AddSourceIdentifierToSubscriptionResult>
      addSourceIdentifierToSubscription({
    required String sourceIdentifier,
    required String subscriptionName,
  }) async {
    final $request = <String, dynamic>{};
    $request['SourceIdentifier'] = sourceIdentifier;
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      action: 'AddSourceIdentifierToSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddSourceIdentifierToSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'AddSourceIdentifierToSubscriptionResult',
    );
    return AddSourceIdentifierToSubscriptionResult.fromXml($result);
  }

  /// Adds metadata tags to an Amazon Neptune resource. These tags can also be
  /// used with cost allocation reporting to track cost associated with Amazon
  /// Neptune resources, or used in a Condition statement in an IAM policy for
  /// Amazon Neptune.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon Neptune resource that the tags are added to. This value is an
  /// Amazon Resource Name (ARN). For information about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing">
  /// Constructing an Amazon Resource Name (ARN)</a>.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Amazon Neptune resource.
  Future<void> addTagsToResource({
    required String resourceName,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'AddTagsToResource',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddTagsToResourceMessage'],
      shapes: shapes,
    );
  }

  /// Applies a pending maintenance action to a resource (for example, to a DB
  /// instance).
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [applyAction] :
  /// The pending maintenance action to apply to this resource.
  ///
  /// Valid values: <code>system-update</code>, <code>db-upgrade</code>
  ///
  /// Parameter [optInType] :
  /// A value that specifies the type of opt-in request, or undoes an opt-in
  /// request. An opt-in request of type <code>immediate</code> can't be undone.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>immediate</code> - Apply the maintenance action immediately.
  /// </li>
  /// <li>
  /// <code>next-maintenance</code> - Apply the maintenance action during the
  /// next maintenance window for the resource.
  /// </li>
  /// <li>
  /// <code>undo-opt-in</code> - Cancel any existing
  /// <code>next-maintenance</code> opt-in requests.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceIdentifier] :
  /// The Amazon Resource Name (ARN) of the resource that the pending
  /// maintenance action applies to. For information about creating an ARN, see
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing">
  /// Constructing an Amazon Resource Name (ARN)</a>.
  Future<ApplyPendingMaintenanceActionResult> applyPendingMaintenanceAction({
    required String applyAction,
    required String optInType,
    required String resourceIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplyAction'] = applyAction;
    $request['OptInType'] = optInType;
    $request['ResourceIdentifier'] = resourceIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'ApplyPendingMaintenanceAction',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ApplyPendingMaintenanceActionMessage'],
      shapes: shapes,
      resultWrapper: 'ApplyPendingMaintenanceActionResult',
    );
    return ApplyPendingMaintenanceActionResult.fromXml($result);
  }

  /// Copies the specified DB cluster parameter group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  ///
  /// Parameter [sourceDBClusterParameterGroupIdentifier] :
  /// The identifier or Amazon Resource Name (ARN) for the source DB cluster
  /// parameter group. For information about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing">
  /// Constructing an Amazon Resource Name (ARN)</a>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid DB cluster parameter group.
  /// </li>
  /// <li>
  /// If the source DB cluster parameter group is in the same Amazon Region as
  /// the copy, specify a valid DB parameter group identifier, for example
  /// <code>my-db-cluster-param-group</code>, or a valid ARN.
  /// </li>
  /// <li>
  /// If the source DB parameter group is in a different Amazon Region than the
  /// copy, specify a valid DB cluster parameter group ARN, for example
  /// <code>arn:aws:rds:us-east-1:123456789012:cluster-pg:custom-cluster-group1</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetDBClusterParameterGroupDescription] :
  /// A description for the copied DB cluster parameter group.
  ///
  /// Parameter [targetDBClusterParameterGroupIdentifier] :
  /// The identifier for the copied DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Cannot be null, empty, or blank
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster-param-group1</code>
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the copied DB cluster parameter group.
  Future<CopyDBClusterParameterGroupResult> copyDBClusterParameterGroup({
    required String sourceDBClusterParameterGroupIdentifier,
    required String targetDBClusterParameterGroupDescription,
    required String targetDBClusterParameterGroupIdentifier,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SourceDBClusterParameterGroupIdentifier'] =
        sourceDBClusterParameterGroupIdentifier;
    $request['TargetDBClusterParameterGroupDescription'] =
        targetDBClusterParameterGroupDescription;
    $request['TargetDBClusterParameterGroupIdentifier'] =
        targetDBClusterParameterGroupIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyDBClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CopyDBClusterParameterGroupResult',
    );
    return CopyDBClusterParameterGroupResult.fromXml($result);
  }

  /// Copies a snapshot of a DB cluster.
  ///
  /// To copy a DB cluster snapshot from a shared manual DB cluster snapshot,
  /// <code>SourceDBClusterSnapshotIdentifier</code> must be the Amazon Resource
  /// Name (ARN) of the shared DB cluster snapshot.
  ///
  /// May throw [DBClusterSnapshotAlreadyExistsFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [sourceDBClusterSnapshotIdentifier] :
  /// The identifier of the DB cluster snapshot to copy. This parameter is not
  /// case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid system snapshot in the "available" state.
  /// </li>
  /// <li>
  /// Specify a valid DB snapshot identifier.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster-snapshot1</code>
  ///
  /// Parameter [targetDBClusterSnapshotIdentifier] :
  /// The identifier of the new DB cluster snapshot to create from the source DB
  /// cluster snapshot. This parameter is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster-snapshot2</code>
  ///
  /// Parameter [copyTags] :
  /// True to copy all tags from the source DB cluster snapshot to the target DB
  /// cluster snapshot, and otherwise false. The default is false.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon Amazon KMS key ID for an encrypted DB cluster snapshot. The KMS
  /// key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS
  /// key alias for the KMS encryption key.
  ///
  /// If you copy an encrypted DB cluster snapshot from your Amazon account, you
  /// can specify a value for <code>KmsKeyId</code> to encrypt the copy with a
  /// new KMS encryption key. If you don't specify a value for
  /// <code>KmsKeyId</code>, then the copy of the DB cluster snapshot is
  /// encrypted with the same KMS key as the source DB cluster snapshot.
  ///
  /// If you copy an encrypted DB cluster snapshot that is shared from another
  /// Amazon account, then you must specify a value for <code>KmsKeyId</code>.
  ///
  /// KMS encryption keys are specific to the Amazon Region that they are
  /// created in, and you can't use encryption keys from one Amazon Region in
  /// another Amazon Region.
  ///
  /// You cannot encrypt an unencrypted DB cluster snapshot when you copy it. If
  /// you try to copy an unencrypted DB cluster snapshot and specify a value for
  /// the KmsKeyId parameter, an error is returned.
  ///
  /// Parameter [preSignedUrl] :
  /// Not currently supported.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the new DB cluster snapshot copy.
  Future<CopyDBClusterSnapshotResult> copyDBClusterSnapshot({
    required String sourceDBClusterSnapshotIdentifier,
    required String targetDBClusterSnapshotIdentifier,
    bool? copyTags,
    String? kmsKeyId,
    String? preSignedUrl,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SourceDBClusterSnapshotIdentifier'] =
        sourceDBClusterSnapshotIdentifier;
    $request['TargetDBClusterSnapshotIdentifier'] =
        targetDBClusterSnapshotIdentifier;
    copyTags?.also((arg) => $request['CopyTags'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    preSignedUrl?.also((arg) => $request['PreSignedUrl'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyDBClusterSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyDBClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CopyDBClusterSnapshotResult',
    );
    return CopyDBClusterSnapshotResult.fromXml($result);
  }

  /// Copies the specified DB parameter group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  /// May throw [DBParameterGroupQuotaExceededFault].
  ///
  /// Parameter [sourceDBParameterGroupIdentifier] :
  /// The identifier or ARN for the source DB parameter group. For information
  /// about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing">
  /// Constructing an Amazon Resource Name (ARN)</a>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid DB parameter group.
  /// </li>
  /// <li>
  /// Must specify a valid DB parameter group identifier, for example
  /// <code>my-db-param-group</code>, or a valid ARN.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetDBParameterGroupDescription] :
  /// A description for the copied DB parameter group.
  ///
  /// Parameter [targetDBParameterGroupIdentifier] :
  /// The identifier for the copied DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Cannot be null, empty, or blank.
  /// </li>
  /// <li>
  /// Must contain from 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-db-parameter-group</code>
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the copied DB parameter group.
  Future<CopyDBParameterGroupResult> copyDBParameterGroup({
    required String sourceDBParameterGroupIdentifier,
    required String targetDBParameterGroupDescription,
    required String targetDBParameterGroupIdentifier,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SourceDBParameterGroupIdentifier'] =
        sourceDBParameterGroupIdentifier;
    $request['TargetDBParameterGroupDescription'] =
        targetDBParameterGroupDescription;
    $request['TargetDBParameterGroupIdentifier'] =
        targetDBParameterGroupIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CopyDBParameterGroupResult',
    );
    return CopyDBParameterGroupResult.fromXml($result);
  }

  /// Creates a new Amazon Neptune DB cluster.
  ///
  /// You can use the <code>ReplicationSourceIdentifier</code> parameter to
  /// create the DB cluster as a Read Replica of another DB cluster or Amazon
  /// Neptune DB instance.
  ///
  /// Note that when you create a new cluster using <code>CreateDBCluster</code>
  /// directly, deletion protection is disabled by default (when you create a
  /// new production cluster in the console, deletion protection is enabled by
  /// default). You can only delete a DB cluster if its
  /// <code>DeletionProtection</code> field is set to <code>false</code>.
  ///
  /// May throw [DBClusterAlreadyExistsFault].
  /// May throw [InsufficientStorageClusterCapacityFault].
  /// May throw [DBClusterQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBSubnetGroupStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBClusterParameterGroupNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [GlobalClusterNotFoundFault].
  /// May throw [InvalidGlobalClusterStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier. This parameter is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster1</code>
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used for this DB cluster.
  ///
  /// Valid Values: <code>neptune</code>
  ///
  /// Parameter [availabilityZones] :
  /// A list of EC2 Availability Zones that instances in the DB cluster can be
  /// created in.
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automated backups are retained. You must
  /// specify a minimum value of 1.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be a value from 1 to 35
  /// </li>
  /// </ul>
  ///
  /// Parameter [characterSetName] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// <i>If set to <code>true</code>, tags are copied to any snapshot of the DB
  /// cluster that is created.</i>
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to associate with this DB
  /// cluster. If this argument is omitted, the default is used.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// A DB subnet group to associate with this DB cluster.
  ///
  /// Constraints: Must match the name of an existing DBSubnetGroup. Must not be
  /// default.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [databaseName] :
  /// The name for your database of up to 64 alpha-numeric characters. If you do
  /// not provide a name, Amazon Neptune will not create a database in the DB
  /// cluster you are creating.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB cluster has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is enabled.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// A list of the log types that this DB cluster should export to CloudWatch
  /// Logs. Valid log types are: <code>audit</code> (to publish audit logs) and
  /// <code>slowquery</code> (to publish slow-query logs). See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html">Publishing
  /// Neptune logs to Amazon CloudWatch logs</a>.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// If set to <code>true</code>, enables Amazon Identity and Access Management
  /// (IAM) authentication for the entire DB cluster (this cannot be set at an
  /// instance level).
  ///
  /// Default: <code>false</code>.
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to use for the new DB cluster.
  ///
  /// Example: <code>1.0.2.1</code>
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The ID of the Neptune global database to which this new DB cluster should
  /// be added.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon KMS key identifier for an encrypted DB cluster.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a DB cluster with the same Amazon
  /// account that owns the KMS encryption key used to encrypt the new DB
  /// cluster, then you can use the KMS key alias instead of the ARN for the KMS
  /// encryption key.
  ///
  /// If an encryption key is not specified in <code>KmsKeyId</code>:
  ///
  /// <ul>
  /// <li>
  /// If <code>ReplicationSourceIdentifier</code> identifies an encrypted
  /// source, then Amazon Neptune will use the encryption key used to encrypt
  /// the source. Otherwise, Amazon Neptune will use your default encryption
  /// key.
  /// </li>
  /// <li>
  /// If the <code>StorageEncrypted</code> parameter is true and
  /// <code>ReplicationSourceIdentifier</code> is not specified, then Amazon
  /// Neptune will use your default encryption key.
  /// </li>
  /// </ul>
  /// Amazon KMS creates the default encryption key for your Amazon account.
  /// Your Amazon account has a different default encryption key for each Amazon
  /// Region.
  ///
  /// If you create a Read Replica of an encrypted DB cluster in another Amazon
  /// Region, you must set <code>KmsKeyId</code> to a KMS key ID that is valid
  /// in the destination Amazon Region. This key is used to encrypt the Read
  /// Replica in that Amazon Region.
  ///
  /// Parameter [masterUserPassword] :
  /// Not supported by Neptune.
  ///
  /// Parameter [masterUsername] :
  /// Not supported by Neptune.
  ///
  /// Parameter [optionGroupName] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [port] :
  /// The port number on which the instances in the DB cluster accept
  /// connections.
  ///
  /// Default: <code>8182</code>
  ///
  /// Parameter [preSignedUrl] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled using the <code>BackupRetentionPeriod</code>
  /// parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each Amazon Region. To see the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-maintaining.html#manage-console-maintaining-window">Neptune
  /// Maintenance Window</a> in the <i>Amazon Neptune User Guide.</i>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format <code>hh24:mi-hh24:mi</code>.
  /// </li>
  /// <li>
  /// Must be in Universal Coordinated Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each Amazon Region, occurring on a random day of the week. To
  /// see the time blocks available, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-maintaining.html#manage-console-maintaining-window">Neptune
  /// Maintenance Window</a> in the <i>Amazon Neptune User Guide.</i>
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [replicationSourceIdentifier] :
  /// The Amazon Resource Name (ARN) of the source DB instance or DB cluster if
  /// this DB cluster is created as a Read Replica.
  ///
  /// Parameter [serverlessV2ScalingConfiguration] :
  /// Contains the scaling configuration of a Neptune Serverless DB cluster.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html">Using
  /// Amazon Neptune Serverless</a> in the <i>Amazon Neptune User Guide</i>.
  ///
  /// Parameter [storageEncrypted] :
  /// Specifies whether the DB cluster is encrypted.
  ///
  /// Parameter [storageType] :
  /// The storage type to associate with the DB cluster.
  ///
  /// Valid Values:
  ///
  /// <ul>
  /// <li>
  /// <code>standard | iopt1</code>
  /// </li>
  /// </ul>
  /// Default:
  ///
  /// <ul>
  /// <li>
  /// <code>standard</code>
  /// </li>
  /// </ul> <note>
  /// When you create a Neptune cluster with the storage type set to
  /// <code>iopt1</code>, the storage type is returned in the response. The
  /// storage type isn't returned when you set it to <code>standard</code>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tags to assign to the new DB cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with this DB cluster.
  Future<CreateDBClusterResult> createDBCluster({
    required String dBClusterIdentifier,
    required String engine,
    List<String>? availabilityZones,
    int? backupRetentionPeriod,
    String? characterSetName,
    bool? copyTagsToSnapshot,
    String? dBClusterParameterGroupName,
    String? dBSubnetGroupName,
    String? databaseName,
    bool? deletionProtection,
    List<String>? enableCloudwatchLogsExports,
    bool? enableIAMDatabaseAuthentication,
    String? engineVersion,
    String? globalClusterIdentifier,
    String? kmsKeyId,
    String? masterUserPassword,
    String? masterUsername,
    String? optionGroupName,
    int? port,
    String? preSignedUrl,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    String? replicationSourceIdentifier,
    ServerlessV2ScalingConfiguration? serverlessV2ScalingConfiguration,
    bool? storageEncrypted,
    String? storageType,
    List<Tag>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['Engine'] = engine;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    characterSetName?.also((arg) => $request['CharacterSetName'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    databaseName?.also((arg) => $request['DatabaseName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    globalClusterIdentifier
        ?.also((arg) => $request['GlobalClusterIdentifier'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    masterUsername?.also((arg) => $request['MasterUsername'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preSignedUrl?.also((arg) => $request['PreSignedUrl'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    replicationSourceIdentifier
        ?.also((arg) => $request['ReplicationSourceIdentifier'] = arg);
    serverlessV2ScalingConfiguration
        ?.also((arg) => $request['ServerlessV2ScalingConfiguration'] = arg);
    storageEncrypted?.also((arg) => $request['StorageEncrypted'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBClusterResult',
    );
    return CreateDBClusterResult.fromXml($result);
  }

  /// Creates a new custom endpoint and associates it with an Amazon Neptune DB
  /// cluster.
  ///
  /// May throw [DBClusterEndpointQuotaExceededFault].
  /// May throw [DBClusterEndpointAlreadyExistsFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterEndpointIdentifier] :
  /// The identifier to use for the new endpoint. This parameter is stored as a
  /// lowercase string.
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  ///
  /// Parameter [endpointType] :
  /// The type of the endpoint. One of: <code>READER</code>,
  /// <code>WRITER</code>, <code>ANY</code>.
  ///
  /// Parameter [excludedMembers] :
  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  ///
  /// Parameter [staticMembers] :
  /// List of DB instance identifiers that are part of the custom endpoint
  /// group.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Amazon Neptune resource.
  Future<CreateDBClusterEndpointOutput> createDBClusterEndpoint({
    required String dBClusterEndpointIdentifier,
    required String dBClusterIdentifier,
    required String endpointType,
    List<String>? excludedMembers,
    List<String>? staticMembers,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterEndpointIdentifier'] = dBClusterEndpointIdentifier;
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['EndpointType'] = endpointType;
    excludedMembers?.also((arg) => $request['ExcludedMembers'] = arg);
    staticMembers?.also((arg) => $request['StaticMembers'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBClusterEndpoint',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBClusterEndpointMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBClusterEndpointResult',
    );
    return CreateDBClusterEndpointOutput.fromXml($result);
  }

  /// Creates a new DB cluster parameter group.
  ///
  /// Parameters in a DB cluster parameter group apply to all of the instances
  /// in a DB cluster.
  ///
  /// A DB cluster parameter group is initially created with the default
  /// parameters for the database engine used by instances in the DB cluster. To
  /// provide custom values for any of the parameters, you must modify the group
  /// after creating it using <a>ModifyDBClusterParameterGroup</a>. Once you've
  /// created a DB cluster parameter group, you need to associate it with your
  /// DB cluster using <a>ModifyDBCluster</a>. When you associate a new DB
  /// cluster parameter group with a running DB cluster, you need to reboot the
  /// DB instances in the DB cluster without failover for the new DB cluster
  /// parameter group and associated settings to take effect.
  /// <important>
  /// After you create a DB cluster parameter group, you should wait at least 5
  /// minutes before creating your first DB cluster that uses that DB cluster
  /// parameter group as the default parameter group. This allows Amazon Neptune
  /// to fully complete the create action before the DB cluster parameter group
  /// is used as the default for a new DB cluster. This is especially important
  /// for parameters that are critical when creating the default database for a
  /// DB cluster, such as the character set for the default database defined by
  /// the <code>character_set_database</code> parameter. You can use the
  /// <i>Parameter Groups</i> option of the <a
  /// href="https://console.aws.amazon.com/rds/">Amazon Neptune console</a> or
  /// the <a>DescribeDBClusterParameters</a> command to verify that your DB
  /// cluster parameter group has been created or modified.
  /// </important>
  ///
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul> <note>
  /// This value is stored as a lowercase string.
  /// </note>
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The DB cluster parameter group family name. A DB cluster parameter group
  /// can be associated with one and only one DB cluster parameter group family,
  /// and can be applied only to a DB cluster running a database engine and
  /// engine version compatible with that DB cluster parameter group family.
  ///
  /// Parameter [description] :
  /// The description for the DB cluster parameter group.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the new DB cluster parameter group.
  Future<CreateDBClusterParameterGroupResult> createDBClusterParameterGroup({
    required String dBClusterParameterGroupName,
    required String dBParameterGroupFamily,
    required String description,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    $request['Description'] = description;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBClusterParameterGroupResult',
    );
    return CreateDBClusterParameterGroupResult.fromXml($result);
  }

  /// Creates a snapshot of a DB cluster.
  ///
  /// May throw [DBClusterSnapshotAlreadyExistsFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The identifier of the DB cluster to create a snapshot for. This parameter
  /// is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBCluster.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster1</code>
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier of the DB cluster snapshot. This parameter is stored as a
  /// lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster1-snapshot1</code>
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the DB cluster snapshot.
  Future<CreateDBClusterSnapshotResult> createDBClusterSnapshot({
    required String dBClusterIdentifier,
    required String dBClusterSnapshotIdentifier,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['DBClusterSnapshotIdentifier'] = dBClusterSnapshotIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBClusterSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBClusterSnapshotResult',
    );
    return CreateDBClusterSnapshotResult.fromXml($result);
  }

  /// Creates a new DB instance.
  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DomainNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The identifier of the DB cluster that the instance will belong to.
  ///
  /// For information on creating a DB cluster, see <a>CreateDBCluster</a>.
  ///
  /// Type: String
  ///
  /// Parameter [dBInstanceClass] :
  /// The compute and memory capacity of the DB instance, for example,
  /// <code>db.m4.large</code>. Not all DB instance classes are available in all
  /// Amazon Regions.
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier. This parameter is stored as a lowercase
  /// string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>mydbinstance</code>
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used for this instance.
  ///
  /// Valid Values: <code>neptune</code>
  ///
  /// Parameter [allocatedStorage] :
  /// Not supported by Neptune.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// Indicates that minor engine upgrades are applied automatically to the DB
  /// instance during the maintenance window.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [availabilityZone] :
  /// The EC2 Availability Zone that the DB instance is created in
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's
  /// Amazon Region.
  ///
  /// Example: <code>us-east-1d</code>
  ///
  /// Constraint: The AvailabilityZone parameter can't be specified if the
  /// MultiAZ parameter is set to <code>true</code>. The specified Availability
  /// Zone must be in the same Amazon Region as the current endpoint.
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automated backups are retained.
  ///
  /// Not applicable. The retention period for automated backups is managed by
  /// the DB cluster. For more information, see <a>CreateDBCluster</a>.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be a value from 0 to 35
  /// </li>
  /// <li>
  /// Cannot be set to 0 if the DB instance is a source to Read Replicas
  /// </li>
  /// </ul>
  ///
  /// Parameter [characterSetName] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// True to copy all tags from the DB instance to snapshots of the DB
  /// instance, and otherwise false. The default is false.
  ///
  /// Parameter [dBName] :
  /// Not supported.
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group to associate with this DB instance. If
  /// this argument is omitted, the default DBParameterGroup for the specified
  /// engine is used.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSecurityGroups] :
  /// A list of DB security groups to associate with this DB instance.
  ///
  /// Default: The default DB security group for the database engine.
  ///
  /// Parameter [dBSubnetGroupName] :
  /// A DB subnet group to associate with this DB instance.
  ///
  /// If there is no DB subnet group, then it is a non-VPC DB instance.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB instance has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-instances-delete.html">Deleting
  /// a DB Instance</a>.
  ///
  /// DB instances in a DB cluster can be deleted even when deletion protection
  /// is enabled in their parent DB cluster.
  ///
  /// Parameter [domain] :
  /// Specify the Active Directory Domain to create the instance in.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Specify the name of the IAM role to be used when making API calls to the
  /// Directory Service.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of log types that need to be enabled for exporting to CloudWatch
  /// Logs.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// Not supported by Neptune (ignored).
  ///
  /// Parameter [enablePerformanceInsights] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to use. Currently, setting this
  /// parameter has no effect.
  ///
  /// Parameter [iops] :
  /// The amount of Provisioned IOPS (input/output operations per second) to be
  /// initially allocated for the DB instance.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon KMS key identifier for an encrypted DB instance.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a DB instance with the same Amazon
  /// account that owns the KMS encryption key used to encrypt the new DB
  /// instance, then you can use the KMS key alias instead of the ARN for the KM
  /// encryption key.
  ///
  /// Not applicable. The KMS key identifier is managed by the DB cluster. For
  /// more information, see <a>CreateDBCluster</a>.
  ///
  /// If the <code>StorageEncrypted</code> parameter is true, and you do not
  /// specify a value for the <code>KmsKeyId</code> parameter, then Amazon
  /// Neptune will use your default encryption key. Amazon KMS creates the
  /// default encryption key for your Amazon account. Your Amazon account has a
  /// different default encryption key for each Amazon Region.
  ///
  /// Parameter [licenseModel] :
  /// License model information for this DB instance.
  ///
  /// Valid values: <code>license-included</code> |
  /// <code>bring-your-own-license</code> | <code>general-public-license</code>
  ///
  /// Parameter [masterUserPassword] :
  /// Not supported by Neptune.
  ///
  /// Parameter [masterUsername] :
  /// Not supported by Neptune.
  ///
  /// Parameter [monitoringInterval] :
  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the DB instance. To disable collecting Enhanced
  /// Monitoring metrics, specify 0. The default is 0.
  ///
  /// If <code>MonitoringRoleArn</code> is specified, then you must also set
  /// <code>MonitoringInterval</code> to a value other than 0.
  ///
  /// Valid Values: <code>0, 1, 5, 10, 15, 30, 60</code>
  ///
  /// Parameter [monitoringRoleArn] :
  /// The ARN for the IAM role that permits Neptune to send enhanced monitoring
  /// metrics to Amazon CloudWatch Logs. For example,
  /// <code>arn:aws:iam:123456789012:role/emaccess</code>.
  ///
  /// If <code>MonitoringInterval</code> is set to a value other than 0, then
  /// you must supply a <code>MonitoringRoleArn</code> value.
  ///
  /// Parameter [multiAZ] :
  /// Specifies if the DB instance is a Multi-AZ deployment. You can't set the
  /// AvailabilityZone parameter if the MultiAZ parameter is set to true.
  ///
  /// Parameter [optionGroupName] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [performanceInsightsKMSKeyId] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [port] :
  /// The port number on which the database accepts connections.
  ///
  /// Not applicable. The port is managed by the DB cluster. For more
  /// information, see <a>CreateDBCluster</a>.
  ///
  /// Default: <code>8182</code>
  ///
  /// Type: Integer
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created.
  ///
  /// Not applicable. The daily time range for creating automated backups is
  /// managed by the DB cluster. For more information, see
  /// <a>CreateDBCluster</a>.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The time range each week during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each Amazon Region, occurring on a random day of the week.
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [promotionTier] :
  /// A value that specifies the order in which an Read Replica is promoted to
  /// the primary instance after a failure of the existing primary instance.
  ///
  /// Default: 1
  ///
  /// Valid Values: 0 - 15
  ///
  /// Parameter [publiclyAccessible] :
  /// This flag should no longer be used.
  ///
  /// Parameter [storageEncrypted] :
  /// Specifies whether the DB instance is encrypted.
  ///
  /// Not applicable. The encryption for DB instances is managed by the DB
  /// cluster. For more information, see <a>CreateDBCluster</a>.
  ///
  /// Default: false
  ///
  /// Parameter [storageType] :
  /// Specifies the storage type to be associated with the DB instance.
  ///
  /// Not applicable. Storage is managed by the DB Cluster.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the new instance.
  ///
  /// Parameter [tdeCredentialArn] :
  /// The ARN from the key store with which to associate the instance for TDE
  /// encryption.
  ///
  /// Parameter [tdeCredentialPassword] :
  /// The password for the given ARN from the key store in order to access the
  /// device.
  ///
  /// Parameter [timezone] :
  /// The time zone of the DB instance.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with this DB instance.
  ///
  /// Not applicable. The associated list of EC2 VPC security groups is managed
  /// by the DB cluster. For more information, see <a>CreateDBCluster</a>.
  ///
  /// Default: The default EC2 VPC security group for the DB subnet group's VPC.
  Future<CreateDBInstanceResult> createDBInstance({
    required String dBClusterIdentifier,
    required String dBInstanceClass,
    required String dBInstanceIdentifier,
    required String engine,
    int? allocatedStorage,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    int? backupRetentionPeriod,
    String? characterSetName,
    bool? copyTagsToSnapshot,
    String? dBName,
    String? dBParameterGroupName,
    List<String>? dBSecurityGroups,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    List<String>? enableCloudwatchLogsExports,
    bool? enableIAMDatabaseAuthentication,
    bool? enablePerformanceInsights,
    String? engineVersion,
    int? iops,
    String? kmsKeyId,
    String? licenseModel,
    String? masterUserPassword,
    String? masterUsername,
    int? monitoringInterval,
    String? monitoringRoleArn,
    bool? multiAZ,
    String? optionGroupName,
    String? performanceInsightsKMSKeyId,
    int? port,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    int? promotionTier,
    bool? publiclyAccessible,
    bool? storageEncrypted,
    String? storageType,
    List<Tag>? tags,
    String? tdeCredentialArn,
    String? tdeCredentialPassword,
    String? timezone,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['DBInstanceClass'] = dBInstanceClass;
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['Engine'] = engine;
    allocatedStorage?.also((arg) => $request['AllocatedStorage'] = arg);
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    characterSetName?.also((arg) => $request['CharacterSetName'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSecurityGroups?.also((arg) => $request['DBSecurityGroups'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    enablePerformanceInsights
        ?.also((arg) => $request['EnablePerformanceInsights'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    masterUsername?.also((arg) => $request['MasterUsername'] = arg);
    monitoringInterval?.also((arg) => $request['MonitoringInterval'] = arg);
    monitoringRoleArn?.also((arg) => $request['MonitoringRoleArn'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    performanceInsightsKMSKeyId
        ?.also((arg) => $request['PerformanceInsightsKMSKeyId'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    promotionTier?.also((arg) => $request['PromotionTier'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    storageEncrypted?.also((arg) => $request['StorageEncrypted'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    tdeCredentialArn?.also((arg) => $request['TdeCredentialArn'] = arg);
    tdeCredentialPassword
        ?.also((arg) => $request['TdeCredentialPassword'] = arg);
    timezone?.also((arg) => $request['Timezone'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBInstanceResult',
    );
    return CreateDBInstanceResult.fromXml($result);
  }

  /// Creates a new DB parameter group.
  ///
  /// A DB parameter group is initially created with the default parameters for
  /// the database engine used by the DB instance. To provide custom values for
  /// any of the parameters, you must modify the group after creating it using
  /// <i>ModifyDBParameterGroup</i>. Once you've created a DB parameter group,
  /// you need to associate it with your DB instance using
  /// <i>ModifyDBInstance</i>. When you associate a new DB parameter group with
  /// a running DB instance, you need to reboot the DB instance without failover
  /// for the new DB parameter group and associated settings to take effect.
  /// <important>
  /// After you create a DB parameter group, you should wait at least 5 minutes
  /// before creating your first DB instance that uses that DB parameter group
  /// as the default parameter group. This allows Amazon Neptune to fully
  /// complete the create action before the parameter group is used as the
  /// default for a new DB instance. This is especially important for parameters
  /// that are critical when creating the default database for a DB instance,
  /// such as the character set for the default database defined by the
  /// <code>character_set_database</code> parameter. You can use the
  /// <i>Parameter Groups</i> option of the Amazon Neptune console or the
  /// <i>DescribeDBParameters</i> command to verify that your DB parameter group
  /// has been created or modified.
  /// </important>
  ///
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The DB parameter group family name. A DB parameter group can be associated
  /// with one and only one DB parameter group family, and can be applied only
  /// to a DB instance running a database engine and engine version compatible
  /// with that DB parameter group family.
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul> <note>
  /// This value is stored as a lowercase string.
  /// </note>
  ///
  /// Parameter [description] :
  /// The description for the DB parameter group.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the new DB parameter group.
  Future<CreateDBParameterGroupResult> createDBParameterGroup({
    required String dBParameterGroupFamily,
    required String dBParameterGroupName,
    required String description,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    $request['DBParameterGroupName'] = dBParameterGroupName;
    $request['Description'] = description;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBParameterGroupResult',
    );
    return CreateDBParameterGroupResult.fromXml($result);
  }

  /// Creates a new DB subnet group. DB subnet groups must contain at least one
  /// subnet in at least two AZs in the Amazon Region.
  ///
  /// May throw [DBSubnetGroupAlreadyExistsFault].
  /// May throw [DBSubnetGroupQuotaExceededFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  ///
  /// Parameter [dBSubnetGroupDescription] :
  /// The description for the DB subnet group.
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name for the DB subnet group. This value is stored as a lowercase
  /// string.
  ///
  /// Constraints: Must contain no more than 255 letters, numbers, periods,
  /// underscores, spaces, or hyphens. Must not be default.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [subnetIds] :
  /// The EC2 Subnet IDs for the DB subnet group.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the new DB subnet group.
  Future<CreateDBSubnetGroupResult> createDBSubnetGroup({
    required String dBSubnetGroupDescription,
    required String dBSubnetGroupName,
    required List<String> subnetIds,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBSubnetGroupDescription'] = dBSubnetGroupDescription;
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSubnetGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBSubnetGroupResult',
    );
    return CreateDBSubnetGroupResult.fromXml($result);
  }

  /// Creates an event notification subscription. This action requires a topic
  /// ARN (Amazon Resource Name) created by either the Neptune console, the SNS
  /// console, or the SNS API. To obtain an ARN with SNS, you must create a
  /// topic in Amazon SNS and subscribe to the topic. The ARN is displayed in
  /// the SNS console.
  ///
  /// You can specify the type of source (SourceType) you want to be notified
  /// of, provide a list of Neptune sources (SourceIds) that triggers the
  /// events, and provide a list of event categories (EventCategories) for
  /// events you want to be notified of. For example, you can specify SourceType
  /// = db-instance, SourceIds = mydbinstance1, mydbinstance2 and
  /// EventCategories = Availability, Backup.
  ///
  /// If you specify both the SourceType and SourceIds, such as SourceType =
  /// db-instance and SourceIdentifier = myDBInstance1, you are notified of all
  /// the db-instance events for the specified source. If you specify a
  /// SourceType but do not specify a SourceIdentifier, you receive notice of
  /// the events for that source type for all your Neptune sources. If you do
  /// not specify either the SourceType nor the SourceIdentifier, you are
  /// notified of events generated from all Neptune sources belonging to your
  /// customer account.
  ///
  /// May throw [EventSubscriptionQuotaExceededFault].
  /// May throw [SubscriptionAlreadyExistFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  /// May throw [SourceNotFoundFault].
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the SNS topic created for event
  /// notification. The ARN is created by Amazon SNS when you create a topic and
  /// subscribe to it.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the subscription.
  ///
  /// Constraints: The name must be less than 255 characters.
  ///
  /// Parameter [enabled] :
  /// A Boolean value; set to <b>true</b> to activate the subscription, set to
  /// <b>false</b> to create the subscription but not active it.
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories for a SourceType that you want to subscribe to.
  /// You can see a list of the categories for a given SourceType by using the
  /// <b>DescribeEventCategories</b> action.
  ///
  /// Parameter [sourceIds] :
  /// The list of identifiers of the event sources for which events are
  /// returned. If not specified, then all sources are included in the response.
  /// An identifier must begin with a letter and must contain only ASCII
  /// letters, digits, and hyphens; it can't end with a hyphen or contain two
  /// consecutive hyphens.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If SourceIds are supplied, SourceType must also be provided.
  /// </li>
  /// <li>
  /// If the source type is a DB instance, then a
  /// <code>DBInstanceIdentifier</code> must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB security group, a
  /// <code>DBSecurityGroupName</code> must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB parameter group, a
  /// <code>DBParameterGroupName</code> must be supplied.
  /// </li>
  /// <li>
  /// If the source type is a DB snapshot, a <code>DBSnapshotIdentifier</code>
  /// must be supplied.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceType] :
  /// The type of source that is generating the events. For example, if you want
  /// to be notified of events generated by a DB instance, you would set this
  /// parameter to db-instance. if this value is not specified, all events are
  /// returned.
  ///
  /// Valid values: <code>db-instance</code> | <code>db-cluster</code> |
  /// <code>db-parameter-group</code> | <code>db-security-group</code> |
  /// <code>db-snapshot</code> | <code>db-cluster-snapshot</code>
  ///
  /// Parameter [tags] :
  /// The tags to be applied to the new event subscription.
  Future<CreateEventSubscriptionResult> createEventSubscription({
    required String snsTopicArn,
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    List<String>? sourceIds,
    String? sourceType,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SnsTopicArn'] = snsTopicArn;
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    sourceIds?.also((arg) => $request['SourceIds'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateEventSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'CreateEventSubscriptionResult',
    );
    return CreateEventSubscriptionResult.fromXml($result);
  }

  /// Creates a Neptune global database spread across multiple Amazon Regions.
  /// The global database contains a single primary cluster with read-write
  /// capability, and read-only secondary clusters that receive data from the
  /// primary cluster through high-speed replication performed by the Neptune
  /// storage subsystem.
  ///
  /// You can create a global database that is initially empty, and then add a
  /// primary cluster and secondary clusters to it, or you can specify an
  /// existing Neptune cluster during the create operation to become the primary
  /// cluster of the global database.
  ///
  /// May throw [GlobalClusterAlreadyExistsFault].
  /// May throw [GlobalClusterQuotaExceededFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The cluster identifier of the new global database cluster.
  ///
  /// Parameter [deletionProtection] :
  /// The deletion protection setting for the new global database. The global
  /// database can't be deleted when deletion protection is enabled.
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used in the global database.
  ///
  /// Valid values: <code>neptune</code>
  ///
  /// Parameter [engineVersion] :
  /// The Neptune engine version to be used by the global database.
  ///
  /// Valid values: <code>1.2.0.0</code> or above.
  ///
  /// Parameter [sourceDBClusterIdentifier] :
  /// (<i>Optional</i>) The Amazon Resource Name (ARN) of an existing Neptune DB
  /// cluster to use as the primary cluster of the new global database.
  ///
  /// Parameter [storageEncrypted] :
  /// The storage encryption setting for the new global database cluster.
  Future<CreateGlobalClusterResult> createGlobalCluster({
    required String globalClusterIdentifier,
    bool? deletionProtection,
    String? engine,
    String? engineVersion,
    String? sourceDBClusterIdentifier,
    bool? storageEncrypted,
  }) async {
    final $request = <String, dynamic>{};
    $request['GlobalClusterIdentifier'] = globalClusterIdentifier;
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    sourceDBClusterIdentifier
        ?.also((arg) => $request['SourceDBClusterIdentifier'] = arg);
    storageEncrypted?.also((arg) => $request['StorageEncrypted'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateGlobalCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateGlobalClusterMessage'],
      shapes: shapes,
      resultWrapper: 'CreateGlobalClusterResult',
    );
    return CreateGlobalClusterResult.fromXml($result);
  }

  /// The DeleteDBCluster action deletes a previously provisioned DB cluster.
  /// When you delete a DB cluster, all automated backups for that DB cluster
  /// are deleted and can't be recovered. Manual DB cluster snapshots of the
  /// specified DB cluster are not deleted.
  ///
  /// Note that the DB Cluster cannot be deleted if deletion protection is
  /// enabled. To delete it, you must first set its
  /// <code>DeletionProtection</code> field to <code>False</code>.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterSnapshotAlreadyExistsFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier for the DB cluster to be deleted. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match an existing DBClusterIdentifier.
  /// </li>
  /// </ul>
  ///
  /// Parameter [finalDBSnapshotIdentifier] :
  /// The DB cluster snapshot identifier of the new DB cluster snapshot created
  /// when <code>SkipFinalSnapshot</code> is set to <code>false</code>.
  /// <note>
  /// Specifying this parameter and also setting the
  /// <code>SkipFinalShapshot</code> parameter to true results in an error.
  /// </note>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [skipFinalSnapshot] :
  /// Determines whether a final DB cluster snapshot is created before the DB
  /// cluster is deleted. If <code>true</code> is specified, no DB cluster
  /// snapshot is created. If <code>false</code> is specified, a DB cluster
  /// snapshot is created before the DB cluster is deleted.
  /// <note>
  /// You must specify a <code>FinalDBSnapshotIdentifier</code> parameter if
  /// <code>SkipFinalSnapshot</code> is <code>false</code>.
  /// </note>
  /// Default: <code>false</code>
  Future<DeleteDBClusterResult> deleteDBCluster({
    required String dBClusterIdentifier,
    String? finalDBSnapshotIdentifier,
    bool? skipFinalSnapshot,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    finalDBSnapshotIdentifier
        ?.also((arg) => $request['FinalDBSnapshotIdentifier'] = arg);
    skipFinalSnapshot?.also((arg) => $request['SkipFinalSnapshot'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBClusterResult',
    );
    return DeleteDBClusterResult.fromXml($result);
  }

  /// Deletes a custom endpoint and removes it from an Amazon Neptune DB
  /// cluster.
  ///
  /// May throw [InvalidDBClusterEndpointStateFault].
  /// May throw [DBClusterEndpointNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBClusterEndpointIdentifier] :
  /// The identifier associated with the custom endpoint. This parameter is
  /// stored as a lowercase string.
  Future<DeleteDBClusterEndpointOutput> deleteDBClusterEndpoint({
    required String dBClusterEndpointIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterEndpointIdentifier'] = dBClusterEndpointIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBClusterEndpoint',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBClusterEndpointMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBClusterEndpointResult',
    );
    return DeleteDBClusterEndpointOutput.fromXml($result);
  }

  /// Deletes a specified DB cluster parameter group. The DB cluster parameter
  /// group to be deleted can't be associated with any DB clusters.
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be the name of an existing DB cluster parameter group.
  /// </li>
  /// <li>
  /// You can't delete a default DB cluster parameter group.
  /// </li>
  /// <li>
  /// Cannot be associated with any DB clusters.
  /// </li>
  /// </ul>
  Future<void> deleteDBClusterParameterGroup({
    required String dBClusterParameterGroupName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBClusterParameterGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a DB cluster snapshot. If the snapshot is being copied, the copy
  /// operation is terminated.
  /// <note>
  /// The DB cluster snapshot must be in the <code>available</code> state to be
  /// deleted.
  /// </note>
  ///
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier of the DB cluster snapshot to delete.
  ///
  /// Constraints: Must be the name of an existing DB cluster snapshot in the
  /// <code>available</code> state.
  Future<DeleteDBClusterSnapshotResult> deleteDBClusterSnapshot({
    required String dBClusterSnapshotIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterSnapshotIdentifier'] = dBClusterSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBClusterSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBClusterSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBClusterSnapshotResult',
    );
    return DeleteDBClusterSnapshotResult.fromXml($result);
  }

  /// The DeleteDBInstance action deletes a previously provisioned DB instance.
  /// When you delete a DB instance, all automated backups for that instance are
  /// deleted and can't be recovered. Manual DB snapshots of the DB instance to
  /// be deleted by <code>DeleteDBInstance</code> are not deleted.
  ///
  /// If you request a final DB snapshot the status of the Amazon Neptune DB
  /// instance is <code>deleting</code> until the DB snapshot is created. The
  /// API action <code>DescribeDBInstance</code> is used to monitor the status
  /// of this operation. The action can't be canceled or reverted once
  /// submitted.
  ///
  /// Note that when a DB instance is in a failure state and has a status of
  /// <code>failed</code>, <code>incompatible-restore</code>, or
  /// <code>incompatible-network</code>, you can only delete it when the
  /// <code>SkipFinalSnapshot</code> parameter is set to <code>true</code>.
  ///
  /// You can't delete a DB instance if it is the only instance in the DB
  /// cluster, or if it has deletion protection enabled.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier for the DB instance to be deleted. This
  /// parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the name of an existing DB instance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [finalDBSnapshotIdentifier] :
  /// The DBSnapshotIdentifier of the new DBSnapshot created when
  /// SkipFinalSnapshot is set to <code>false</code>.
  /// <note>
  /// Specifying this parameter and also setting the SkipFinalShapshot parameter
  /// to true results in an error.
  /// </note>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// <li>
  /// Cannot be specified when deleting a Read Replica.
  /// </li>
  /// </ul>
  ///
  /// Parameter [skipFinalSnapshot] :
  /// Determines whether a final DB snapshot is created before the DB instance
  /// is deleted. If <code>true</code> is specified, no DBSnapshot is created.
  /// If <code>false</code> is specified, a DB snapshot is created before the DB
  /// instance is deleted.
  ///
  /// Note that when a DB instance is in a failure state and has a status of
  /// 'failed', 'incompatible-restore', or 'incompatible-network', it can only
  /// be deleted when the SkipFinalSnapshot parameter is set to "true".
  ///
  /// Specify <code>true</code> when deleting a Read Replica.
  /// <note>
  /// The FinalDBSnapshotIdentifier parameter must be specified if
  /// SkipFinalSnapshot is <code>false</code>.
  /// </note>
  /// Default: <code>false</code>
  Future<DeleteDBInstanceResult> deleteDBInstance({
    required String dBInstanceIdentifier,
    String? finalDBSnapshotIdentifier,
    bool? skipFinalSnapshot,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    finalDBSnapshotIdentifier
        ?.also((arg) => $request['FinalDBSnapshotIdentifier'] = arg);
    skipFinalSnapshot?.also((arg) => $request['SkipFinalSnapshot'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBInstanceResult',
    );
    return DeleteDBInstanceResult.fromXml($result);
  }

  /// Deletes a specified DBParameterGroup. The DBParameterGroup to be deleted
  /// can't be associated with any DB instances.
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be the name of an existing DB parameter group
  /// </li>
  /// <li>
  /// You can't delete a default DB parameter group
  /// </li>
  /// <li>
  /// Cannot be associated with any DB instances
  /// </li>
  /// </ul>
  Future<void> deleteDBParameterGroup({
    required String dBParameterGroupName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBParameterGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a DB subnet group.
  /// <note>
  /// The specified database subnet group must not be associated with any DB
  /// instances.
  /// </note>
  ///
  /// May throw [InvalidDBSubnetGroupStateFault].
  /// May throw [InvalidDBSubnetStateFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name of the database subnet group to delete.
  /// <note>
  /// You can't delete the default subnet group.
  /// </note>
  /// Constraints:
  ///
  /// Constraints: Must match the name of an existing DBSubnetGroup. Must not be
  /// default.
  ///
  /// Example: <code>mySubnetgroup</code>
  Future<void> deleteDBSubnetGroup({
    required String dBSubnetGroupName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBSubnetGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBSubnetGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes an event notification subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [InvalidEventSubscriptionStateFault].
  ///
  /// Parameter [subscriptionName] :
  /// The name of the event notification subscription you want to delete.
  Future<DeleteEventSubscriptionResult> deleteEventSubscription({
    required String subscriptionName,
  }) async {
    final $request = <String, dynamic>{};
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteEventSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteEventSubscriptionResult',
    );
    return DeleteEventSubscriptionResult.fromXml($result);
  }

  /// Deletes a global database. The primary and all secondary clusters must
  /// already be detached or deleted first.
  ///
  /// May throw [GlobalClusterNotFoundFault].
  /// May throw [InvalidGlobalClusterStateFault].
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The cluster identifier of the global database cluster being deleted.
  Future<DeleteGlobalClusterResult> deleteGlobalCluster({
    required String globalClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['GlobalClusterIdentifier'] = globalClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteGlobalCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteGlobalClusterMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteGlobalClusterResult',
    );
    return DeleteGlobalClusterResult.fromXml($result);
  }

  /// Returns information about endpoints for an Amazon Neptune DB cluster.
  /// <note>
  /// This operation can also return information for Amazon RDS clusters and
  /// Amazon DocDB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [dBClusterEndpointIdentifier] :
  /// The identifier of the endpoint to describe. This parameter is stored as a
  /// lowercase string.
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  ///
  /// Parameter [filters] :
  /// A set of name-value pairs that define which endpoints to include in the
  /// output. The filters are specified as name-value pairs, in the format
  /// <code>Name=<i>endpoint_type</i>,Values=<i>endpoint_type1</i>,<i>endpoint_type2</i>,...</code>.
  /// <code>Name</code> can be one of: <code>db-cluster-endpoint-type</code>,
  /// <code>db-cluster-endpoint-custom-type</code>,
  /// <code>db-cluster-endpoint-id</code>,
  /// <code>db-cluster-endpoint-status</code>. <code>Values</code> for the
  /// <code> db-cluster-endpoint-type</code> filter can be one or more of:
  /// <code>reader</code>, <code>writer</code>, <code>custom</code>.
  /// <code>Values</code> for the <code>db-cluster-endpoint-custom-type</code>
  /// filter can be one or more of: <code>reader</code>, <code>any</code>.
  /// <code>Values</code> for the <code>db-cluster-endpoint-status</code> filter
  /// can be one or more of: <code>available</code>, <code>creating</code>,
  /// <code>deleting</code>, <code>inactive</code>, <code>modifying</code>.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterEndpoints</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so you can retrieve the
  /// remaining results.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBClusterEndpointMessage> describeDBClusterEndpoints({
    String? dBClusterEndpointIdentifier,
    String? dBClusterIdentifier,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBClusterEndpointIdentifier
        ?.also((arg) => $request['DBClusterEndpointIdentifier'] = arg);
    dBClusterIdentifier?.also((arg) => $request['DBClusterIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterEndpoints',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterEndpointsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterEndpointsResult',
    );
    return DBClusterEndpointMessage.fromXml($result);
  }

  /// Returns a list of <code>DBClusterParameterGroup</code> descriptions. If a
  /// <code>DBClusterParameterGroupName</code> parameter is specified, the list
  /// will contain only the description of the specified DB cluster parameter
  /// group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of a specific DB cluster parameter group to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterParameterGroups</code> request. If this parameter
  /// is specified, the response includes only records beyond the marker, up to
  /// the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBClusterParameterGroupsMessage> describeDBClusterParameterGroups({
    String? dBClusterParameterGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterParameterGroups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterParameterGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterParameterGroupsResult',
    );
    return DBClusterParameterGroupsMessage.fromXml($result);
  }

  /// Returns the detailed parameter list for a particular DB cluster parameter
  /// group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of a specific DB cluster parameter group to return parameter
  /// details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterParameters</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [source] :
  /// A value that indicates to return only parameters for a specific source.
  /// Parameter sources can be <code>engine</code>, <code>service</code>, or
  /// <code>customer</code>.
  Future<DBClusterParameterGroupDetails> describeDBClusterParameters({
    required String dBClusterParameterGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? source,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    source?.also((arg) => $request['Source'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterParameters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterParametersResult',
    );
    return DBClusterParameterGroupDetails.fromXml($result);
  }

  /// Returns a list of DB cluster snapshot attribute names and values for a
  /// manual DB cluster snapshot.
  ///
  /// When sharing snapshots with other Amazon accounts,
  /// <code>DescribeDBClusterSnapshotAttributes</code> returns the
  /// <code>restore</code> attribute and a list of IDs for the Amazon accounts
  /// that are authorized to copy or restore the manual DB cluster snapshot. If
  /// <code>all</code> is included in the list of values for the
  /// <code>restore</code> attribute, then the manual DB cluster snapshot is
  /// public and can be copied or restored by all Amazon accounts.
  ///
  /// To add or remove access for an Amazon account to copy or restore a manual
  /// DB cluster snapshot, or to make the manual DB cluster snapshot public or
  /// private, use the <a>ModifyDBClusterSnapshotAttribute</a> API action.
  ///
  /// May throw [DBClusterSnapshotNotFoundFault].
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier for the DB cluster snapshot to describe the attributes for.
  Future<DescribeDBClusterSnapshotAttributesResult>
      describeDBClusterSnapshotAttributes({
    required String dBClusterSnapshotIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterSnapshotIdentifier'] = dBClusterSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterSnapshotAttributes',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterSnapshotAttributesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterSnapshotAttributesResult',
    );
    return DescribeDBClusterSnapshotAttributesResult.fromXml($result);
  }

  /// Returns information about DB cluster snapshots. This API action supports
  /// pagination.
  ///
  /// May throw [DBClusterSnapshotNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The ID of the DB cluster to retrieve the list of DB cluster snapshots for.
  /// This parameter can't be used in conjunction with the
  /// <code>DBClusterSnapshotIdentifier</code> parameter. This parameter is not
  /// case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the identifier of an existing DBCluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// A specific DB cluster snapshot identifier to describe. This parameter
  /// can't be used in conjunction with the <code>DBClusterIdentifier</code>
  /// parameter. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the identifier of an existing DBClusterSnapshot.
  /// </li>
  /// <li>
  /// If this identifier is for an automated snapshot, the
  /// <code>SnapshotType</code> parameter must also be specified.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [includePublic] :
  /// True to include manual DB cluster snapshots that are public and can be
  /// copied or restored by any Amazon account, and otherwise false. The default
  /// is <code>false</code>. The default is false.
  ///
  /// You can share a manual DB cluster snapshot as public by using the
  /// <a>ModifyDBClusterSnapshotAttribute</a> API action.
  ///
  /// Parameter [includeShared] :
  /// True to include shared manual DB cluster snapshots from other Amazon
  /// accounts that this Amazon account has been given permission to copy or
  /// restore, and otherwise false. The default is <code>false</code>.
  ///
  /// You can give an Amazon account permission to restore a manual DB cluster
  /// snapshot from another Amazon account by the
  /// <a>ModifyDBClusterSnapshotAttribute</a> API action.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterSnapshots</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [snapshotType] :
  /// The type of DB cluster snapshots to be returned. You can specify one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>automated</code> - Return all DB cluster snapshots that have been
  /// automatically taken by Amazon Neptune for my Amazon account.
  /// </li>
  /// <li>
  /// <code>manual</code> - Return all DB cluster snapshots that have been taken
  /// by my Amazon account.
  /// </li>
  /// <li>
  /// <code>shared</code> - Return all manual DB cluster snapshots that have
  /// been shared to my Amazon account.
  /// </li>
  /// <li>
  /// <code>public</code> - Return all DB cluster snapshots that have been
  /// marked as public.
  /// </li>
  /// </ul>
  /// If you don't specify a <code>SnapshotType</code> value, then both
  /// automated and manual DB cluster snapshots are returned. You can include
  /// shared DB cluster snapshots with these results by setting the
  /// <code>IncludeShared</code> parameter to <code>true</code>. You can include
  /// public DB cluster snapshots with these results by setting the
  /// <code>IncludePublic</code> parameter to <code>true</code>.
  ///
  /// The <code>IncludeShared</code> and <code>IncludePublic</code> parameters
  /// don't apply for <code>SnapshotType</code> values of <code>manual</code> or
  /// <code>automated</code>. The <code>IncludePublic</code> parameter doesn't
  /// apply when <code>SnapshotType</code> is set to <code>shared</code>. The
  /// <code>IncludeShared</code> parameter doesn't apply when
  /// <code>SnapshotType</code> is set to <code>public</code>.
  Future<DBClusterSnapshotMessage> describeDBClusterSnapshots({
    String? dBClusterIdentifier,
    String? dBClusterSnapshotIdentifier,
    List<Filter>? filters,
    bool? includePublic,
    bool? includeShared,
    String? marker,
    int? maxRecords,
    String? snapshotType,
  }) async {
    final $request = <String, dynamic>{};
    dBClusterIdentifier?.also((arg) => $request['DBClusterIdentifier'] = arg);
    dBClusterSnapshotIdentifier
        ?.also((arg) => $request['DBClusterSnapshotIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    includePublic?.also((arg) => $request['IncludePublic'] = arg);
    includeShared?.also((arg) => $request['IncludeShared'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    snapshotType?.also((arg) => $request['SnapshotType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusterSnapshots',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClusterSnapshotsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClusterSnapshotsResult',
    );
    return DBClusterSnapshotMessage.fromXml($result);
  }

  /// Returns information about provisioned DB clusters, and supports
  /// pagination.
  /// <note>
  /// This operation can also return information for Amazon RDS clusters and
  /// Amazon DocDB clusters.
  /// </note>
  ///
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The user-supplied DB cluster identifier. If this parameter is specified,
  /// information from only the specific DB cluster is returned. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match an existing DBClusterIdentifier.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more DB clusters to describe.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB clusters identified by these ARNs.
  /// </li>
  /// <li>
  /// <code>engine</code> - Accepts an engine name (such as
  /// <code>neptune</code>), and restricts the results list to DB clusters
  /// created by that engine.
  /// </li>
  /// </ul>
  /// For example, to invoke this API from the Amazon CLI and filter so that
  /// only Neptune DB clusters are returned, you could use the following
  /// command:
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <a>DescribeDBClusters</a> request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBClusterMessage> describeDBClusters({
    String? dBClusterIdentifier,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBClusterIdentifier?.also((arg) => $request['DBClusterIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBClusters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBClustersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBClustersResult',
    );
    return DBClusterMessage.fromXml($result);
  }

  /// Returns a list of the available DB engines.
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The name of a specific DB parameter group family to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match an existing DBParameterGroupFamily.
  /// </li>
  /// </ul>
  ///
  /// Parameter [defaultOnly] :
  /// Indicates that only the default version of the specified engine or engine
  /// and major version combination is returned.
  ///
  /// Parameter [engine] :
  /// The database engine to return.
  ///
  /// Parameter [engineVersion] :
  /// The database engine version to return.
  ///
  /// Example: <code>5.1.49</code>
  ///
  /// Parameter [filters] :
  /// Not currently supported.
  ///
  /// Parameter [listSupportedCharacterSets] :
  /// If this parameter is specified and the requested engine supports the
  /// <code>CharacterSetName</code> parameter for <code>CreateDBInstance</code>,
  /// the response includes a list of supported character sets for each engine
  /// version.
  ///
  /// Parameter [listSupportedTimezones] :
  /// If this parameter is specified and the requested engine supports the
  /// <code>TimeZone</code> parameter for <code>CreateDBInstance</code>, the
  /// response includes a list of supported time zones for each engine version.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more than the
  /// <code>MaxRecords</code> value is available, a pagination token called a
  /// marker is included in the response so that the following results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBEngineVersionMessage> describeDBEngineVersions({
    String? dBParameterGroupFamily,
    bool? defaultOnly,
    String? engine,
    String? engineVersion,
    List<Filter>? filters,
    bool? listSupportedCharacterSets,
    bool? listSupportedTimezones,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBParameterGroupFamily
        ?.also((arg) => $request['DBParameterGroupFamily'] = arg);
    defaultOnly?.also((arg) => $request['DefaultOnly'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    listSupportedCharacterSets
        ?.also((arg) => $request['ListSupportedCharacterSets'] = arg);
    listSupportedTimezones
        ?.also((arg) => $request['ListSupportedTimezones'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBEngineVersions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBEngineVersionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBEngineVersionsResult',
    );
    return DBEngineVersionMessage.fromXml($result);
  }

  /// Returns information about provisioned instances, and supports pagination.
  /// <note>
  /// This operation can also return information for Amazon RDS instances and
  /// Amazon DocDB instances.
  /// </note>
  ///
  /// May throw [DBInstanceNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The user-supplied instance identifier. If this parameter is specified,
  /// information from only the specific DB instance is returned. This parameter
  /// isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more DB instances to describe.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB instances associated with the DB clusters
  /// identified by these ARNs.
  /// </li>
  /// <li>
  /// <code>engine</code> - Accepts an engine name (such as
  /// <code>neptune</code>), and restricts the results list to DB instances
  /// created by that engine.
  /// </li>
  /// </ul>
  /// For example, to invoke this API from the Amazon CLI and filter so that
  /// only Neptune DB instances are returned, you could use the following
  /// command:
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBInstances</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBInstanceMessage> describeDBInstances({
    String? dBInstanceIdentifier,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceIdentifier?.also((arg) => $request['DBInstanceIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBInstances',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBInstancesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBInstancesResult',
    );
    return DBInstanceMessage.fromXml($result);
  }

  /// Returns a list of <code>DBParameterGroup</code> descriptions. If a
  /// <code>DBParameterGroupName</code> is specified, the list will contain only
  /// the description of the specified DB parameter group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of a specific DB parameter group to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBParameterGroups</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBParameterGroupsMessage> describeDBParameterGroups({
    String? dBParameterGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBParameterGroups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBParameterGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBParameterGroupsResult',
    );
    return DBParameterGroupsMessage.fromXml($result);
  }

  /// Returns the detailed parameter list for a particular DB parameter group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of a specific DB parameter group to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeDBParameters</code> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [source] :
  /// The parameter types to return.
  ///
  /// Default: All parameter types returned
  ///
  /// Valid Values: <code>user | system | engine-default</code>
  Future<DBParameterGroupDetails> describeDBParameters({
    required String dBParameterGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? source,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    source?.also((arg) => $request['Source'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBParameters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBParametersResult',
    );
    return DBParameterGroupDetails.fromXml($result);
  }

  /// Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is
  /// specified, the list will contain only the descriptions of the specified
  /// DBSubnetGroup.
  ///
  /// For an overview of CIDR ranges, go to the <a
  /// href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia
  /// Tutorial</a>.
  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name of the DB subnet group to return details for.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous DescribeDBSubnetGroups
  /// request. If this parameter is specified, the response includes only
  /// records beyond the marker, up to the value specified by
  /// <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBSubnetGroupMessage> describeDBSubnetGroups({
    String? dBSubnetGroupName,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSubnetGroups',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBSubnetGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBSubnetGroupsResult',
    );
    return DBSubnetGroupMessage.fromXml($result);
  }

  /// Returns the default engine and system parameter information for the
  /// cluster database engine.
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The name of the DB cluster parameter group family to return engine
  /// parameter information for.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeEngineDefaultClusterParameters</code> request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeEngineDefaultClusterParametersResult>
      describeEngineDefaultClusterParameters({
    required String dBParameterGroupFamily,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEngineDefaultClusterParameters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEngineDefaultClusterParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEngineDefaultClusterParametersResult',
    );
    return DescribeEngineDefaultClusterParametersResult.fromXml($result);
  }

  /// Returns the default engine and system parameter information for the
  /// specified database engine.
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The name of the DB parameter group family.
  ///
  /// Parameter [filters] :
  /// Not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeEngineDefaultParameters</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeEngineDefaultParametersResult>
      describeEngineDefaultParameters({
    required String dBParameterGroupFamily,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEngineDefaultParameters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEngineDefaultParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEngineDefaultParametersResult',
    );
    return DescribeEngineDefaultParametersResult.fromXml($result);
  }

  /// Displays a list of categories for all event source types, or, if
  /// specified, for a specified source type.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [sourceType] :
  /// The type of source that is generating the events.
  ///
  /// Valid values: db-instance | db-parameter-group | db-security-group |
  /// db-snapshot
  Future<EventCategoriesMessage> describeEventCategories({
    List<Filter>? filters,
    String? sourceType,
  }) async {
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventCategories',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventCategoriesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventCategoriesResult',
    );
    return EventCategoriesMessage.fromXml($result);
  }

  /// Lists all the subscription descriptions for a customer account. The
  /// description for a subscription includes SubscriptionName, SNSTopicARN,
  /// CustomerID, SourceType, SourceID, CreationTime, and Status.
  ///
  /// If you specify a SubscriptionName, lists the description for that
  /// subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// DescribeOrderableDBInstanceOptions request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code> .
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the event notification subscription you want to describe.
  Future<EventSubscriptionsMessage> describeEventSubscriptions({
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? subscriptionName,
  }) async {
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    subscriptionName?.also((arg) => $request['SubscriptionName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventSubscriptions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventSubscriptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventSubscriptionsResult',
    );
    return EventSubscriptionsMessage.fromXml($result);
  }

  /// Returns events related to DB instances, DB security groups, DB snapshots,
  /// and DB parameter groups for the past 14 days. Events specific to a
  /// particular DB instance, DB security group, database snapshot, or DB
  /// parameter group can be obtained by providing the name as a parameter. By
  /// default, the past hour of events are returned.
  ///
  /// Parameter [duration] :
  /// The number of minutes to retrieve events for.
  ///
  /// Default: 60
  ///
  /// Parameter [endTime] :
  /// The end of the time interval for which to retrieve events, specified in
  /// ISO 8601 format. For more information about ISO 8601, go to the <a
  /// href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a>
  ///
  /// Example: 2009-07-08T18:00Z
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories that trigger notifications for a event
  /// notification subscription.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous DescribeEvents
  /// request. If this parameter is specified, the response includes only
  /// records beyond the marker, up to the value specified by
  /// <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [sourceIdentifier] :
  /// The identifier of the event source for which events are returned. If not
  /// specified, then all sources are included in the response.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If SourceIdentifier is supplied, SourceType must also be provided.
  /// </li>
  /// <li>
  /// If the source type is <code>DBInstance</code>, then a
  /// <code>DBInstanceIdentifier</code> must be supplied.
  /// </li>
  /// <li>
  /// If the source type is <code>DBSecurityGroup</code>, a
  /// <code>DBSecurityGroupName</code> must be supplied.
  /// </li>
  /// <li>
  /// If the source type is <code>DBParameterGroup</code>, a
  /// <code>DBParameterGroupName</code> must be supplied.
  /// </li>
  /// <li>
  /// If the source type is <code>DBSnapshot</code>, a
  /// <code>DBSnapshotIdentifier</code> must be supplied.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceType] :
  /// The event source to retrieve events for. If no value is specified, all
  /// events are returned.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time interval to retrieve events for, specified in
  /// ISO 8601 format. For more information about ISO 8601, go to the <a
  /// href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a>
  ///
  /// Example: 2009-07-08T18:00Z
  Future<EventsMessage> describeEvents({
    int? duration,
    DateTime? endTime,
    List<String>? eventCategories,
    List<Filter>? filters,
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
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    sourceIdentifier?.also((arg) => $request['SourceIdentifier'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg.toValue());
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEvents',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventsResult',
    );
    return EventsMessage.fromXml($result);
  }

  /// Returns information about Neptune global database clusters. This API
  /// supports pagination.
  ///
  /// May throw [GlobalClusterNotFoundFault].
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The user-supplied DB cluster identifier. If this parameter is specified,
  /// only information about the specified DB cluster is returned. This
  /// parameter is not case-sensitive.
  ///
  /// Constraints: If supplied, must match an existing DB cluster identifier.
  ///
  /// Parameter [marker] :
  /// (<i>Optional</i>) A pagination token returned by a previous call to
  /// <code>DescribeGlobalClusters</code>. If this parameter is specified, the
  /// response will only include records beyond the marker, up to the number
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination
  /// marker token is included in the response that you can use to retrieve the
  /// remaining results.
  ///
  /// Default: <code>100</code>
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<GlobalClustersMessage> describeGlobalClusters({
    String? globalClusterIdentifier,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    globalClusterIdentifier
        ?.also((arg) => $request['GlobalClusterIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeGlobalClusters',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeGlobalClustersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeGlobalClustersResult',
    );
    return GlobalClustersMessage.fromXml($result);
  }

  /// Returns a list of orderable DB instance options for the specified engine.
  ///
  /// Parameter [engine] :
  /// The name of the engine to retrieve DB instance options for.
  ///
  /// Parameter [dBInstanceClass] :
  /// The DB instance class filter value. Specify this parameter to show only
  /// the available offerings matching the specified DB instance class.
  ///
  /// Parameter [engineVersion] :
  /// The engine version filter value. Specify this parameter to show only the
  /// available offerings matching the specified engine version.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [licenseModel] :
  /// The license model filter value. Specify this parameter to show only the
  /// available offerings matching the specified license model.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// DescribeOrderableDBInstanceOptions request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code> .
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [vpc] :
  /// The VPC filter value. Specify this parameter to show only the available
  /// VPC or non-VPC offerings.
  Future<OrderableDBInstanceOptionsMessage> describeOrderableDBInstanceOptions({
    required String engine,
    String? dBInstanceClass,
    String? engineVersion,
    List<Filter>? filters,
    String? licenseModel,
    String? marker,
    int? maxRecords,
    bool? vpc,
  }) async {
    final $request = <String, dynamic>{};
    $request['Engine'] = engine;
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    vpc?.also((arg) => $request['Vpc'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOrderableDBInstanceOptions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeOrderableDBInstanceOptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeOrderableDBInstanceOptionsResult',
    );
    return OrderableDBInstanceOptionsMessage.fromXml($result);
  }

  /// Returns a list of resources (for example, DB instances) that have at least
  /// one pending maintenance action.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more resources to return pending
  /// maintenance actions for.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include pending
  /// maintenance actions for the DB clusters identified by these ARNs.
  /// </li>
  /// <li>
  /// <code>db-instance-id</code> - Accepts DB instance identifiers and DB
  /// instance ARNs. The results list will only include pending maintenance
  /// actions for the DB instances identified by these ARNs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribePendingMaintenanceActions</code> request. If this parameter
  /// is specified, the response includes only records beyond the marker, up to
  /// a number of records specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ARN of a resource to return pending maintenance actions for.
  Future<PendingMaintenanceActionsMessage> describePendingMaintenanceActions({
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? resourceIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    resourceIdentifier?.also((arg) => $request['ResourceIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribePendingMaintenanceActions',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribePendingMaintenanceActionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribePendingMaintenanceActionsResult',
    );
    return PendingMaintenanceActionsMessage.fromXml($result);
  }

  /// You can call <a>DescribeValidDBInstanceModifications</a> to learn what
  /// modifications you can make to your DB instance. You can use this
  /// information when you call <a>ModifyDBInstance</a>.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The customer identifier or the ARN of your DB instance.
  Future<DescribeValidDBInstanceModificationsResult>
      describeValidDBInstanceModifications({
    required String dBInstanceIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeValidDBInstanceModifications',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeValidDBInstanceModificationsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeValidDBInstanceModificationsResult',
    );
    return DescribeValidDBInstanceModificationsResult.fromXml($result);
  }

  /// Forces a failover for a DB cluster.
  ///
  /// A failover for a DB cluster promotes one of the Read Replicas (read-only
  /// instances) in the DB cluster to be the primary instance (the cluster
  /// writer).
  ///
  /// Amazon Neptune will automatically fail over to a Read Replica, if one
  /// exists, when the primary instance fails. You can force a failover when you
  /// want to simulate a failure of a primary instance for testing. Because each
  /// instance in a DB cluster has its own endpoint address, you will need to
  /// clean up and re-establish any existing connections that use those endpoint
  /// addresses when the failover is complete.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// A DB cluster identifier to force a failover for. This parameter is not
  /// case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBCluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetDBInstanceIdentifier] :
  /// The name of the instance to promote to the primary instance.
  ///
  /// You must specify the instance identifier for an Read Replica in the DB
  /// cluster. For example, <code>mydbcluster-replica1</code>.
  Future<FailoverDBClusterResult> failoverDBCluster({
    String? dBClusterIdentifier,
    String? targetDBInstanceIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    dBClusterIdentifier?.also((arg) => $request['DBClusterIdentifier'] = arg);
    targetDBInstanceIdentifier
        ?.also((arg) => $request['TargetDBInstanceIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'FailoverDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['FailoverDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'FailoverDBClusterResult',
    );
    return FailoverDBClusterResult.fromXml($result);
  }

  /// Initiates the failover process for a Neptune global database.
  ///
  /// A failover for a Neptune global database promotes one of secondary
  /// read-only DB clusters to be the primary DB cluster and demotes the primary
  /// DB cluster to being a secondary (read-only) DB cluster. In other words,
  /// the role of the current primary DB cluster and the selected target
  /// secondary DB cluster are switched. The selected secondary DB cluster
  /// assumes full read/write capabilities for the Neptune global database.
  /// <note>
  /// This action applies <b>only</b> to Neptune global databases. This action
  /// is only intended for use on healthy Neptune global databases with healthy
  /// Neptune DB clusters and no region-wide outages, to test disaster recovery
  /// scenarios or to reconfigure the global database topology.
  /// </note>
  ///
  /// May throw [GlobalClusterNotFoundFault].
  /// May throw [InvalidGlobalClusterStateFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [globalClusterIdentifier] :
  /// Identifier of the Neptune global database that should be failed over. The
  /// identifier is the unique key assigned by the user when the Neptune global
  /// database was created. In other words, it's the name of the global database
  /// that you want to fail over.
  ///
  /// Constraints: Must match the identifier of an existing Neptune global
  /// database.
  ///
  /// Parameter [targetDbClusterIdentifier] :
  /// The Amazon Resource Name (ARN) of the secondary Neptune DB cluster that
  /// you want to promote to primary for the global database.
  Future<FailoverGlobalClusterResult> failoverGlobalCluster({
    required String globalClusterIdentifier,
    required String targetDbClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['GlobalClusterIdentifier'] = globalClusterIdentifier;
    $request['TargetDbClusterIdentifier'] = targetDbClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'FailoverGlobalCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['FailoverGlobalClusterMessage'],
      shapes: shapes,
      resultWrapper: 'FailoverGlobalClusterResult',
    );
    return FailoverGlobalClusterResult.fromXml($result);
  }

  /// Lists all tags on an Amazon Neptune resource.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon Neptune resource with tags to be listed. This value is an
  /// Amazon Resource Name (ARN). For information about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing">
  /// Constructing an Amazon Resource Name (ARN)</a>.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  Future<TagListMessage> listTagsForResource({
    required String resourceName,
    List<Filter>? filters,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    filters?.also((arg) => $request['Filters'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListTagsForResource',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTagsForResourceMessage'],
      shapes: shapes,
      resultWrapper: 'ListTagsForResourceResult',
    );
    return TagListMessage.fromXml($result);
  }

  /// Modify a setting for a DB cluster. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidDBSubnetGroupStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [DBClusterParameterGroupNotFoundFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBClusterAlreadyExistsFault].
  /// May throw [StorageTypeNotSupportedFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier for the cluster being modified. This parameter
  /// is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBCluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [allowMajorVersionUpgrade] :
  /// A value that indicates whether upgrades between different major versions
  /// are allowed.
  ///
  /// Constraints: You must set the allow-major-version-upgrade flag when
  /// providing an <code>EngineVersion</code> parameter that uses a different
  /// major version than the DB cluster's current version.
  ///
  /// Parameter [applyImmediately] :
  /// A value that specifies whether the modifications in this request and any
  /// pending modifications are asynchronously applied as soon as possible,
  /// regardless of the <code>PreferredMaintenanceWindow</code> setting for the
  /// DB cluster. If this parameter is set to <code>false</code>, changes to the
  /// DB cluster are applied during the next maintenance window.
  ///
  /// The <code>ApplyImmediately</code> parameter only affects
  /// <code>NewDBClusterIdentifier</code> values. If you set the
  /// <code>ApplyImmediately</code> parameter value to false, then changes to
  /// <code>NewDBClusterIdentifier</code> values are applied during the next
  /// maintenance window. All other changes are applied immediately, regardless
  /// of the value of the <code>ApplyImmediately</code> parameter.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automated backups are retained. You must
  /// specify a minimum value of 1.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be a value from 1 to 35
  /// </li>
  /// </ul>
  ///
  /// Parameter [cloudwatchLogsExportConfiguration] :
  /// The configuration setting for the log types to be enabled for export to
  /// CloudWatch Logs for a specific DB cluster. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html#cloudwatch-logs-cli">Using
  /// the CLI to publish Neptune audit logs to CloudWatch Logs</a>.
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// <i>If set to <code>true</code>, tags are copied to any snapshot of the DB
  /// cluster that is created.</i>
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to use for the DB cluster.
  ///
  /// Parameter [dBInstanceParameterGroupName] :
  /// The name of the DB parameter group to apply to all instances of the DB
  /// cluster.
  /// <note>
  /// When you apply a parameter group using
  /// <code>DBInstanceParameterGroupName</code>, parameter changes aren't
  /// applied during the next maintenance window but instead are applied
  /// immediately.
  /// </note>
  /// Default: The existing name setting
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// The DB parameter group must be in the same DB parameter group family as
  /// the target DB cluster version.
  /// </li>
  /// <li>
  /// The <code>DBInstanceParameterGroupName</code> parameter is only valid in
  /// combination with the <code>AllowMajorVersionUpgrade</code> parameter.
  /// </li>
  /// </ul>
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB cluster has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// True to enable mapping of Amazon Identity and Access Management (IAM)
  /// accounts to database accounts, and otherwise false.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to which you want to upgrade.
  /// Changing this parameter results in an outage. The change is applied during
  /// the next maintenance window unless the <code>ApplyImmediately</code>
  /// parameter is set to true.
  ///
  /// For a list of valid engine versions, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/engine-releases.html">Engine
  /// Releases for Amazon Neptune</a>, or call <a>DescribeDBEngineVersions</a>.
  ///
  /// Parameter [masterUserPassword] :
  /// Not supported by Neptune.
  ///
  /// Parameter [newDBClusterIdentifier] :
  /// The new DB cluster identifier for the DB cluster when renaming a DB
  /// cluster. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// The first character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster2</code>
  ///
  /// Parameter [optionGroupName] :
  /// <i>Not supported by Neptune.</i>
  ///
  /// Parameter [port] :
  /// The port number on which the DB cluster accepts connections.
  ///
  /// Constraints: Value must be <code>1150-65535</code>
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled, using the
  /// <code>BackupRetentionPeriod</code> parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each Amazon Region.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format <code>hh24:mi-hh24:mi</code>.
  /// </li>
  /// <li>
  /// Must be in Universal Coordinated Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each Amazon Region, occurring on a random day of the week.
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [serverlessV2ScalingConfiguration] :
  /// Contains the scaling configuration of a Neptune Serverless DB cluster.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html">Using
  /// Amazon Neptune Serverless</a> in the <i>Amazon Neptune User Guide</i>.
  ///
  /// Parameter [storageType] :
  /// The storage type to associate with the DB cluster.
  ///
  /// Valid Values:
  ///
  /// <ul>
  /// <li>
  /// <code>standard | iopt1</code>
  /// </li>
  /// </ul>
  /// Default:
  ///
  /// <ul>
  /// <li>
  /// <code>standard</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security groups that the DB cluster will belong to.
  Future<ModifyDBClusterResult> modifyDBCluster({
    required String dBClusterIdentifier,
    bool? allowMajorVersionUpgrade,
    bool? applyImmediately,
    int? backupRetentionPeriod,
    CloudwatchLogsExportConfiguration? cloudwatchLogsExportConfiguration,
    bool? copyTagsToSnapshot,
    String? dBClusterParameterGroupName,
    String? dBInstanceParameterGroupName,
    bool? deletionProtection,
    bool? enableIAMDatabaseAuthentication,
    String? engineVersion,
    String? masterUserPassword,
    String? newDBClusterIdentifier,
    String? optionGroupName,
    int? port,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    ServerlessV2ScalingConfiguration? serverlessV2ScalingConfiguration,
    String? storageType,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    allowMajorVersionUpgrade
        ?.also((arg) => $request['AllowMajorVersionUpgrade'] = arg);
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    cloudwatchLogsExportConfiguration
        ?.also((arg) => $request['CloudwatchLogsExportConfiguration'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBInstanceParameterGroupName
        ?.also((arg) => $request['DBInstanceParameterGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    newDBClusterIdentifier
        ?.also((arg) => $request['NewDBClusterIdentifier'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    serverlessV2ScalingConfiguration
        ?.also((arg) => $request['ServerlessV2ScalingConfiguration'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBClusterResult',
    );
    return ModifyDBClusterResult.fromXml($result);
  }

  /// Modifies the properties of an endpoint in an Amazon Neptune DB cluster.
  ///
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBClusterEndpointStateFault].
  /// May throw [DBClusterEndpointNotFoundFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterEndpointIdentifier] :
  /// The identifier of the endpoint to modify. This parameter is stored as a
  /// lowercase string.
  ///
  /// Parameter [endpointType] :
  /// The type of the endpoint. One of: <code>READER</code>,
  /// <code>WRITER</code>, <code>ANY</code>.
  ///
  /// Parameter [excludedMembers] :
  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  ///
  /// Parameter [staticMembers] :
  /// List of DB instance identifiers that are part of the custom endpoint
  /// group.
  Future<ModifyDBClusterEndpointOutput> modifyDBClusterEndpoint({
    required String dBClusterEndpointIdentifier,
    String? endpointType,
    List<String>? excludedMembers,
    List<String>? staticMembers,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterEndpointIdentifier'] = dBClusterEndpointIdentifier;
    endpointType?.also((arg) => $request['EndpointType'] = arg);
    excludedMembers?.also((arg) => $request['ExcludedMembers'] = arg);
    staticMembers?.also((arg) => $request['StaticMembers'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBClusterEndpoint',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBClusterEndpointMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBClusterEndpointResult',
    );
    return ModifyDBClusterEndpointOutput.fromXml($result);
  }

  /// Modifies the parameters of a DB cluster parameter group. To modify more
  /// than one parameter, submit a list of the following:
  /// <code>ParameterName</code>, <code>ParameterValue</code>, and
  /// <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a
  /// single request.
  /// <note>
  /// Changes to dynamic parameters are applied immediately. Changes to static
  /// parameters require a reboot without failover to the DB cluster associated
  /// with the parameter group before the change can take effect.
  /// </note> <important>
  /// After you create a DB cluster parameter group, you should wait at least 5
  /// minutes before creating your first DB cluster that uses that DB cluster
  /// parameter group as the default parameter group. This allows Amazon Neptune
  /// to fully complete the create action before the parameter group is used as
  /// the default for a new DB cluster. This is especially important for
  /// parameters that are critical when creating the default database for a DB
  /// cluster, such as the character set for the default database defined by the
  /// <code>character_set_database</code> parameter. You can use the
  /// <i>Parameter Groups</i> option of the Amazon Neptune console or the
  /// <a>DescribeDBClusterParameters</a> command to verify that your DB cluster
  /// parameter group has been created or modified.
  /// </important>
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InvalidDBParameterGroupStateFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to modify.
  ///
  /// Parameter [parameters] :
  /// A list of parameters in the DB cluster parameter group to modify.
  Future<DBClusterParameterGroupNameMessage> modifyDBClusterParameterGroup({
    required String dBClusterParameterGroupName,
    required List<Parameter> parameters,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    $request['Parameters'] = parameters;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBClusterParameterGroupResult',
    );
    return DBClusterParameterGroupNameMessage.fromXml($result);
  }

  /// Adds an attribute and values to, or removes an attribute and values from,
  /// a manual DB cluster snapshot.
  ///
  /// To share a manual DB cluster snapshot with other Amazon accounts, specify
  /// <code>restore</code> as the <code>AttributeName</code> and use the
  /// <code>ValuesToAdd</code> parameter to add a list of IDs of the Amazon
  /// accounts that are authorized to restore the manual DB cluster snapshot.
  /// Use the value <code>all</code> to make the manual DB cluster snapshot
  /// public, which means that it can be copied or restored by all Amazon
  /// accounts. Do not add the <code>all</code> value for any manual DB cluster
  /// snapshots that contain private information that you don't want available
  /// to all Amazon accounts. If a manual DB cluster snapshot is encrypted, it
  /// can be shared, but only by specifying a list of authorized Amazon account
  /// IDs for the <code>ValuesToAdd</code> parameter. You can't use
  /// <code>all</code> as a value for that parameter in this case.
  ///
  /// To view which Amazon accounts have access to copy or restore a manual DB
  /// cluster snapshot, or whether a manual DB cluster snapshot public or
  /// private, use the <a>DescribeDBClusterSnapshotAttributes</a> API action.
  ///
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [SharedSnapshotQuotaExceededFault].
  ///
  /// Parameter [attributeName] :
  /// The name of the DB cluster snapshot attribute to modify.
  ///
  /// To manage authorization for other Amazon accounts to copy or restore a
  /// manual DB cluster snapshot, set this value to <code>restore</code>.
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier for the DB cluster snapshot to modify the attributes for.
  ///
  /// Parameter [valuesToAdd] :
  /// A list of DB cluster snapshot attributes to add to the attribute specified
  /// by <code>AttributeName</code>.
  ///
  /// To authorize other Amazon accounts to copy or restore a manual DB cluster
  /// snapshot, set this list to include one or more Amazon account IDs, or
  /// <code>all</code> to make the manual DB cluster snapshot restorable by any
  /// Amazon account. Do not add the <code>all</code> value for any manual DB
  /// cluster snapshots that contain private information that you don't want
  /// available to all Amazon accounts.
  ///
  /// Parameter [valuesToRemove] :
  /// A list of DB cluster snapshot attributes to remove from the attribute
  /// specified by <code>AttributeName</code>.
  ///
  /// To remove authorization for other Amazon accounts to copy or restore a
  /// manual DB cluster snapshot, set this list to include one or more Amazon
  /// account identifiers, or <code>all</code> to remove authorization for any
  /// Amazon account to copy or restore the DB cluster snapshot. If you specify
  /// <code>all</code>, an Amazon account whose account ID is explicitly added
  /// to the <code>restore</code> attribute can still copy or restore a manual
  /// DB cluster snapshot.
  Future<ModifyDBClusterSnapshotAttributeResult>
      modifyDBClusterSnapshotAttribute({
    required String attributeName,
    required String dBClusterSnapshotIdentifier,
    List<String>? valuesToAdd,
    List<String>? valuesToRemove,
  }) async {
    final $request = <String, dynamic>{};
    $request['AttributeName'] = attributeName;
    $request['DBClusterSnapshotIdentifier'] = dBClusterSnapshotIdentifier;
    valuesToAdd?.also((arg) => $request['ValuesToAdd'] = arg);
    valuesToRemove?.also((arg) => $request['ValuesToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBClusterSnapshotAttribute',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBClusterSnapshotAttributeMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBClusterSnapshotAttributeResult',
    );
    return ModifyDBClusterSnapshotAttributeResult.fromXml($result);
  }

  /// Modifies settings for a DB instance. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request. To learn what modifications you can make to your DB
  /// instance, call <a>DescribeValidDBInstanceModifications</a> before you call
  /// <a>ModifyDBInstance</a>.
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
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [CertificateNotFoundFault].
  /// May throw [DomainNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [allocatedStorage] :
  /// Not supported by Neptune.
  ///
  /// Parameter [allowMajorVersionUpgrade] :
  /// Indicates that major version upgrades are allowed. Changing this parameter
  /// doesn't result in an outage and the change is asynchronously applied as
  /// soon as possible.
  ///
  /// Parameter [applyImmediately] :
  /// Specifies whether the modifications in this request and any pending
  /// modifications are asynchronously applied as soon as possible, regardless
  /// of the <code>PreferredMaintenanceWindow</code> setting for the DB
  /// instance.
  ///
  /// If this parameter is set to <code>false</code>, changes to the DB instance
  /// are applied during the next maintenance window. Some parameter changes can
  /// cause an outage and are applied on the next call to
  /// <a>RebootDBInstance</a>, or the next failure reboot.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// Indicates that minor version upgrades are applied automatically to the DB
  /// instance during the maintenance window. Changing this parameter doesn't
  /// result in an outage except in the following case and the change is
  /// asynchronously applied as soon as possible. An outage will result if this
  /// parameter is set to <code>true</code> during the maintenance window, and a
  /// newer minor version is available, and Neptune has enabled auto patching
  /// for that engine version.
  ///
  /// Parameter [backupRetentionPeriod] :
  /// Not applicable. The retention period for automated backups is managed by
  /// the DB cluster. For more information, see <a>ModifyDBCluster</a>.
  ///
  /// Default: Uses existing setting
  ///
  /// Parameter [cACertificateIdentifier] :
  /// Indicates the certificate that needs to be associated with the instance.
  ///
  /// Parameter [cloudwatchLogsExportConfiguration] :
  /// The configuration setting for the log types to be enabled for export to
  /// CloudWatch Logs for a specific DB instance or DB cluster.
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// True to copy all tags from the DB instance to snapshots of the DB
  /// instance, and otherwise false. The default is false.
  ///
  /// Parameter [dBInstanceClass] :
  /// The new compute and memory capacity of the DB instance, for example,
  /// <code>db.m4.large</code>. Not all DB instance classes are available in all
  /// Amazon Regions.
  ///
  /// If you modify the DB instance class, an outage occurs during the change.
  /// The change is applied during the next maintenance window, unless
  /// <code>ApplyImmediately</code> is specified as <code>true</code> for this
  /// request.
  ///
  /// Default: Uses existing setting
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group to apply to the DB instance. Changing
  /// this setting doesn't result in an outage. The parameter group name itself
  /// is changed immediately, but the actual parameter changes are not applied
  /// until you reboot the instance without failover. The db instance will NOT
  /// be rebooted automatically and the parameter changes will NOT be applied
  /// during the next maintenance window.
  ///
  /// Default: Uses existing setting
  ///
  /// Constraints: The DB parameter group must be in the same DB parameter group
  /// family as this DB instance.
  ///
  /// Parameter [dBPortNumber] :
  /// The port number on which the database accepts connections.
  ///
  /// The value of the <code>DBPortNumber</code> parameter must not match any of
  /// the port values specified for options in the option group for the DB
  /// instance.
  ///
  /// Your database will restart when you change the <code>DBPortNumber</code>
  /// value regardless of the value of the <code>ApplyImmediately</code>
  /// parameter.
  ///
  /// Default: <code>8182</code>
  ///
  /// Parameter [dBSecurityGroups] :
  /// A list of DB security groups to authorize on this DB instance. Changing
  /// this setting doesn't result in an outage and the change is asynchronously
  /// applied as soon as possible.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match existing DBSecurityGroups.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The new DB subnet group for the DB instance. You can use this parameter to
  /// move your DB instance to a different VPC.
  ///
  /// Changing the subnet group causes an outage during the change. The change
  /// is applied during the next maintenance window, unless you specify
  /// <code>true</code> for the <code>ApplyImmediately</code> parameter.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: <code>mySubnetGroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB instance has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-instances-delete.html">Deleting
  /// a DB Instance</a>.
  ///
  /// Parameter [domain] :
  /// Not supported.
  ///
  /// Parameter [domainIAMRoleName] :
  /// Not supported
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// True to enable mapping of Amazon Identity and Access Management (IAM)
  /// accounts to database accounts, and otherwise false.
  ///
  /// You can enable IAM database authentication for the following database
  /// engines
  ///
  /// Not applicable. Mapping Amazon IAM accounts to database accounts is
  /// managed by the DB cluster. For more information, see
  /// <a>ModifyDBCluster</a>.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [enablePerformanceInsights] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to upgrade to. Currently,
  /// setting this parameter has no effect. To upgrade your database engine to
  /// the most recent release, use the <a>ApplyPendingMaintenanceAction</a> API.
  ///
  /// Parameter [iops] :
  /// The new Provisioned IOPS (I/O operations per second) value for the
  /// instance.
  ///
  /// Changing this setting doesn't result in an outage and the change is
  /// applied during the next maintenance window unless the
  /// <code>ApplyImmediately</code> parameter is set to <code>true</code> for
  /// this request.
  ///
  /// Default: Uses existing setting
  ///
  /// Parameter [licenseModel] :
  /// Not supported by Neptune.
  ///
  /// Parameter [masterUserPassword] :
  /// Not supported by Neptune.
  ///
  /// Parameter [monitoringInterval] :
  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the DB instance. To disable collecting Enhanced
  /// Monitoring metrics, specify 0. The default is 0.
  ///
  /// If <code>MonitoringRoleArn</code> is specified, then you must also set
  /// <code>MonitoringInterval</code> to a value other than 0.
  ///
  /// Valid Values: <code>0, 1, 5, 10, 15, 30, 60</code>
  ///
  /// Parameter [monitoringRoleArn] :
  /// The ARN for the IAM role that permits Neptune to send enhanced monitoring
  /// metrics to Amazon CloudWatch Logs. For example,
  /// <code>arn:aws:iam:123456789012:role/emaccess</code>.
  ///
  /// If <code>MonitoringInterval</code> is set to a value other than 0, then
  /// you must supply a <code>MonitoringRoleArn</code> value.
  ///
  /// Parameter [multiAZ] :
  /// Specifies if the DB instance is a Multi-AZ deployment. Changing this
  /// parameter doesn't result in an outage and the change is applied during the
  /// next maintenance window unless the <code>ApplyImmediately</code> parameter
  /// is set to <code>true</code> for this request.
  ///
  /// Parameter [newDBInstanceIdentifier] :
  /// The new DB instance identifier for the DB instance when renaming a DB
  /// instance. When you change the DB instance identifier, an instance reboot
  /// will occur immediately if you set <code>Apply Immediately</code> to true,
  /// or will occur during the next maintenance window if <code>Apply
  /// Immediately</code> to false. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>mydbinstance</code>
  ///
  /// Parameter [optionGroupName] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [performanceInsightsKMSKeyId] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled.
  ///
  /// Not applicable. The daily time range for creating automated backups is
  /// managed by the DB cluster. For more information, see
  /// <a>ModifyDBCluster</a>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the format hh24:mi-hh24:mi
  /// </li>
  /// <li>
  /// Must be in Universal Time Coordinated (UTC)
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window
  /// </li>
  /// <li>
  /// Must be at least 30 minutes
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range (in UTC) during which system maintenance can occur,
  /// which might result in an outage. Changing this parameter doesn't result in
  /// an outage, except in the following situation, and the change is
  /// asynchronously applied as soon as possible. If there are pending actions
  /// that cause a reboot, and the maintenance window is changed to include the
  /// current time, then changing this parameter will cause a reboot of the DB
  /// instance. If moving this window to the current time, there must be at
  /// least 30 minutes between the current time and end of the window to ensure
  /// pending changes are applied.
  ///
  /// Default: Uses existing setting
  ///
  /// Format: ddd:hh24:mi-ddd:hh24:mi
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Must be at least 30 minutes
  ///
  /// Parameter [promotionTier] :
  /// A value that specifies the order in which a Read Replica is promoted to
  /// the primary instance after a failure of the existing primary instance.
  ///
  /// Default: 1
  ///
  /// Valid Values: 0 - 15
  ///
  /// Parameter [publiclyAccessible] :
  /// This flag should no longer be used.
  ///
  /// Parameter [storageType] :
  /// Not supported.
  ///
  /// Parameter [tdeCredentialArn] :
  /// The ARN from the key store with which to associate the instance for TDE
  /// encryption.
  ///
  /// Parameter [tdeCredentialPassword] :
  /// The password for the given ARN from the key store in order to access the
  /// device.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to authorize on this DB instance. This
  /// change is asynchronously applied as soon as possible.
  ///
  /// Not applicable. The associated list of EC2 VPC security groups is managed
  /// by the DB cluster. For more information, see <a>ModifyDBCluster</a>.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match existing VpcSecurityGroupIds.
  /// </li>
  /// </ul>
  Future<ModifyDBInstanceResult> modifyDBInstance({
    required String dBInstanceIdentifier,
    int? allocatedStorage,
    bool? allowMajorVersionUpgrade,
    bool? applyImmediately,
    bool? autoMinorVersionUpgrade,
    int? backupRetentionPeriod,
    String? cACertificateIdentifier,
    CloudwatchLogsExportConfiguration? cloudwatchLogsExportConfiguration,
    bool? copyTagsToSnapshot,
    String? dBInstanceClass,
    String? dBParameterGroupName,
    int? dBPortNumber,
    List<String>? dBSecurityGroups,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    String? domain,
    String? domainIAMRoleName,
    bool? enableIAMDatabaseAuthentication,
    bool? enablePerformanceInsights,
    String? engineVersion,
    int? iops,
    String? licenseModel,
    String? masterUserPassword,
    int? monitoringInterval,
    String? monitoringRoleArn,
    bool? multiAZ,
    String? newDBInstanceIdentifier,
    String? optionGroupName,
    String? performanceInsightsKMSKeyId,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    int? promotionTier,
    bool? publiclyAccessible,
    String? storageType,
    String? tdeCredentialArn,
    String? tdeCredentialPassword,
    List<String>? vpcSecurityGroupIds,
  }) async {
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
    cACertificateIdentifier
        ?.also((arg) => $request['CACertificateIdentifier'] = arg);
    cloudwatchLogsExportConfiguration
        ?.also((arg) => $request['CloudwatchLogsExportConfiguration'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBPortNumber?.also((arg) => $request['DBPortNumber'] = arg);
    dBSecurityGroups?.also((arg) => $request['DBSecurityGroups'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    domain?.also((arg) => $request['Domain'] = arg);
    domainIAMRoleName?.also((arg) => $request['DomainIAMRoleName'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    enablePerformanceInsights
        ?.also((arg) => $request['EnablePerformanceInsights'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    monitoringInterval?.also((arg) => $request['MonitoringInterval'] = arg);
    monitoringRoleArn?.also((arg) => $request['MonitoringRoleArn'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    newDBInstanceIdentifier
        ?.also((arg) => $request['NewDBInstanceIdentifier'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    performanceInsightsKMSKeyId
        ?.also((arg) => $request['PerformanceInsightsKMSKeyId'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    promotionTier?.also((arg) => $request['PromotionTier'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tdeCredentialArn?.also((arg) => $request['TdeCredentialArn'] = arg);
    tdeCredentialPassword
        ?.also((arg) => $request['TdeCredentialPassword'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBInstanceResult',
    );
    return ModifyDBInstanceResult.fromXml($result);
  }

  /// Modifies the parameters of a DB parameter group. To modify more than one
  /// parameter, submit a list of the following: <code>ParameterName</code>,
  /// <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20
  /// parameters can be modified in a single request.
  /// <note>
  /// Changes to dynamic parameters are applied immediately. Changes to static
  /// parameters require a reboot without failover to the DB instance associated
  /// with the parameter group before the change can take effect.
  /// </note> <important>
  /// After you modify a DB parameter group, you should wait at least 5 minutes
  /// before creating your first DB instance that uses that DB parameter group
  /// as the default parameter group. This allows Amazon Neptune to fully
  /// complete the modify action before the parameter group is used as the
  /// default for a new DB instance. This is especially important for parameters
  /// that are critical when creating the default database for a DB instance,
  /// such as the character set for the default database defined by the
  /// <code>character_set_database</code> parameter. You can use the
  /// <i>Parameter Groups</i> option of the Amazon Neptune console or the
  /// <i>DescribeDBParameters</i> command to verify that your DB parameter group
  /// has been created or modified.
  /// </important>
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InvalidDBParameterGroupStateFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [parameters] :
  /// An array of parameter names, values, and the apply method for the
  /// parameter update. At least one parameter name, value, and apply method
  /// must be supplied; subsequent arguments are optional. A maximum of 20
  /// parameters can be modified in a single request.
  ///
  /// Valid Values (for the application method): <code>immediate |
  /// pending-reboot</code>
  /// <note>
  /// You can use the immediate value with dynamic parameters only. You can use
  /// the pending-reboot value for both dynamic and static parameters, and
  /// changes are applied when you reboot the DB instance without failover.
  /// </note>
  Future<DBParameterGroupNameMessage> modifyDBParameterGroup({
    required String dBParameterGroupName,
    required List<Parameter> parameters,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    $request['Parameters'] = parameters;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBParameterGroupResult',
    );
    return DBParameterGroupNameMessage.fromXml($result);
  }

  /// Modifies an existing DB subnet group. DB subnet groups must contain at
  /// least one subnet in at least two AZs in the Amazon Region.
  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [SubnetAlreadyInUse].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name for the DB subnet group. This value is stored as a lowercase
  /// string. You can't modify the default subnet group.
  ///
  /// Constraints: Must match the name of an existing DBSubnetGroup. Must not be
  /// default.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [subnetIds] :
  /// The EC2 subnet IDs for the DB subnet group.
  ///
  /// Parameter [dBSubnetGroupDescription] :
  /// The description for the DB subnet group.
  Future<ModifyDBSubnetGroupResult> modifyDBSubnetGroup({
    required String dBSubnetGroupName,
    required List<String> subnetIds,
    String? dBSubnetGroupDescription,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    dBSubnetGroupDescription
        ?.also((arg) => $request['DBSubnetGroupDescription'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBSubnetGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBSubnetGroupResult',
    );
    return ModifyDBSubnetGroupResult.fromXml($result);
  }

  /// Modifies an existing event notification subscription. Note that you can't
  /// modify the source identifiers using this call; to change source
  /// identifiers for a subscription, use the
  /// <a>AddSourceIdentifierToSubscription</a> and
  /// <a>RemoveSourceIdentifierFromSubscription</a> calls.
  ///
  /// You can see a list of the event categories for a given SourceType by using
  /// the <b>DescribeEventCategories</b> action.
  ///
  /// May throw [EventSubscriptionQuotaExceededFault].
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  ///
  /// Parameter [subscriptionName] :
  /// The name of the event notification subscription.
  ///
  /// Parameter [enabled] :
  /// A Boolean value; set to <b>true</b> to activate the subscription.
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories for a SourceType that you want to subscribe to.
  /// You can see a list of the categories for a given SourceType by using the
  /// <b>DescribeEventCategories</b> action.
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the SNS topic created for event
  /// notification. The ARN is created by Amazon SNS when you create a topic and
  /// subscribe to it.
  ///
  /// Parameter [sourceType] :
  /// The type of source that is generating the events. For example, if you want
  /// to be notified of events generated by a DB instance, you would set this
  /// parameter to db-instance. if this value is not specified, all events are
  /// returned.
  ///
  /// Valid values: db-instance | db-parameter-group | db-security-group |
  /// db-snapshot
  Future<ModifyEventSubscriptionResult> modifyEventSubscription({
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    String? snsTopicArn,
    String? sourceType,
  }) async {
    final $request = <String, dynamic>{};
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    snsTopicArn?.also((arg) => $request['SnsTopicArn'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyEventSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyEventSubscriptionResult',
    );
    return ModifyEventSubscriptionResult.fromXml($result);
  }

  /// Modify a setting for an Amazon Neptune global cluster. You can change one
  /// or more database configuration parameters by specifying these parameters
  /// and their new values in the request.
  ///
  /// May throw [GlobalClusterNotFoundFault].
  /// May throw [InvalidGlobalClusterStateFault].
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The DB cluster identifier for the global cluster being modified. This
  /// parameter is not case-sensitive.
  ///
  /// Constraints: Must match the identifier of an existing global database
  /// cluster.
  ///
  /// Parameter [allowMajorVersionUpgrade] :
  /// A value that indicates whether major version upgrades are allowed.
  ///
  /// Constraints: You must allow major version upgrades if you specify a value
  /// for the <code>EngineVersion</code> parameter that is a different major
  /// version than the DB cluster's current version.
  ///
  /// If you upgrade the major version of a global database, the cluster and DB
  /// instance parameter groups are set to the default parameter groups for the
  /// new version, so you will need to apply any custom parameter groups after
  /// completing the upgrade.
  ///
  /// Parameter [deletionProtection] :
  /// Indicates whether the global database has deletion protection enabled. The
  /// global database cannot be deleted when deletion protection is enabled.
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to which you want to upgrade.
  /// Changing this parameter will result in an outage. The change is applied
  /// during the next maintenance window unless <code>ApplyImmediately</code> is
  /// enabled.
  ///
  /// To list all of the available Neptune engine versions, use the following
  /// command:
  ///
  /// Parameter [newGlobalClusterIdentifier] :
  /// A new cluster identifier to assign to the global database. This value is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster2</code>
  Future<ModifyGlobalClusterResult> modifyGlobalCluster({
    required String globalClusterIdentifier,
    bool? allowMajorVersionUpgrade,
    bool? deletionProtection,
    String? engineVersion,
    String? newGlobalClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['GlobalClusterIdentifier'] = globalClusterIdentifier;
    allowMajorVersionUpgrade
        ?.also((arg) => $request['AllowMajorVersionUpgrade'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    newGlobalClusterIdentifier
        ?.also((arg) => $request['NewGlobalClusterIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyGlobalCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyGlobalClusterMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyGlobalClusterResult',
    );
    return ModifyGlobalClusterResult.fromXml($result);
  }

  /// Not supported.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// Not supported.
  Future<PromoteReadReplicaDBClusterResult> promoteReadReplicaDBCluster({
    required String dBClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'PromoteReadReplicaDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PromoteReadReplicaDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'PromoteReadReplicaDBClusterResult',
    );
    return PromoteReadReplicaDBClusterResult.fromXml($result);
  }

  /// You might need to reboot your DB instance, usually for maintenance
  /// reasons. For example, if you make certain modifications, or if you change
  /// the DB parameter group associated with the DB instance, you must reboot
  /// the instance for the changes to take effect.
  ///
  /// Rebooting a DB instance restarts the database engine service. Rebooting a
  /// DB instance results in a momentary outage, during which the DB instance
  /// status is set to rebooting.
  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The DB instance identifier. This parameter is stored as a lowercase
  /// string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBInstance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [forceFailover] :
  /// When <code>true</code>, the reboot is conducted through a MultiAZ
  /// failover.
  ///
  /// Constraint: You can't specify <code>true</code> if the instance is not
  /// configured for MultiAZ.
  Future<RebootDBInstanceResult> rebootDBInstance({
    required String dBInstanceIdentifier,
    bool? forceFailover,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    forceFailover?.also((arg) => $request['ForceFailover'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RebootDBInstance',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RebootDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'RebootDBInstanceResult',
    );
    return RebootDBInstanceResult.fromXml($result);
  }

  /// Detaches a Neptune DB cluster from a Neptune global database. A secondary
  /// cluster becomes a normal standalone cluster with read-write capability
  /// instead of being read-only, and no longer receives data from a the primary
  /// cluster.
  ///
  /// May throw [GlobalClusterNotFoundFault].
  /// May throw [InvalidGlobalClusterStateFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [dbClusterIdentifier] :
  /// The Amazon Resource Name (ARN) identifying the cluster to be detached from
  /// the Neptune global database cluster.
  ///
  /// Parameter [globalClusterIdentifier] :
  /// The identifier of the Neptune global database from which to detach the
  /// specified Neptune DB cluster.
  Future<RemoveFromGlobalClusterResult> removeFromGlobalCluster({
    required String dbClusterIdentifier,
    required String globalClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['DbClusterIdentifier'] = dbClusterIdentifier;
    $request['GlobalClusterIdentifier'] = globalClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'RemoveFromGlobalCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveFromGlobalClusterMessage'],
      shapes: shapes,
      resultWrapper: 'RemoveFromGlobalClusterResult',
    );
    return RemoveFromGlobalClusterResult.fromXml($result);
  }

  /// Disassociates an Identity and Access Management (IAM) role from a DB
  /// cluster.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBClusterRoleNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the DB cluster to disassociate the IAM role from.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to disassociate from the DB
  /// cluster, for example
  /// <code>arn:aws:iam::123456789012:role/NeptuneAccessRole</code>.
  ///
  /// Parameter [featureName] :
  /// The name of the feature for the DB cluster that the IAM role is to be
  /// disassociated from. For the list of supported feature names, see
  /// <a>DescribeDBEngineVersions</a>.
  Future<void> removeRoleFromDBCluster({
    required String dBClusterIdentifier,
    required String roleArn,
    String? featureName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['RoleArn'] = roleArn;
    featureName?.also((arg) => $request['FeatureName'] = arg);
    await _protocol.send(
      $request,
      action: 'RemoveRoleFromDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveRoleFromDBClusterMessage'],
      shapes: shapes,
    );
  }

  /// Removes a source identifier from an existing event notification
  /// subscription.
  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SourceNotFoundFault].
  ///
  /// Parameter [sourceIdentifier] :
  /// The source identifier to be removed from the subscription, such as the
  /// <b>DB instance identifier</b> for a DB instance or the name of a security
  /// group.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the event notification subscription you want to remove a
  /// source identifier from.
  Future<RemoveSourceIdentifierFromSubscriptionResult>
      removeSourceIdentifierFromSubscription({
    required String sourceIdentifier,
    required String subscriptionName,
  }) async {
    final $request = <String, dynamic>{};
    $request['SourceIdentifier'] = sourceIdentifier;
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      action: 'RemoveSourceIdentifierFromSubscription',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveSourceIdentifierFromSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'RemoveSourceIdentifierFromSubscriptionResult',
    );
    return RemoveSourceIdentifierFromSubscriptionResult.fromXml($result);
  }

  /// Removes metadata tags from an Amazon Neptune resource.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon Neptune resource that the tags are removed from. This value is
  /// an Amazon Resource Name (ARN). For information about creating an ARN, see
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing">
  /// Constructing an Amazon Resource Name (ARN)</a>.
  ///
  /// Parameter [tagKeys] :
  /// The tag key (name) of the tag to be removed.
  Future<void> removeTagsFromResource({
    required String resourceName,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'RemoveTagsFromResource',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveTagsFromResourceMessage'],
      shapes: shapes,
    );
  }

  /// Modifies the parameters of a DB cluster parameter group to the default
  /// value. To reset specific parameters submit a list of the following:
  /// <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the
  /// entire DB cluster parameter group, specify the
  /// <code>DBClusterParameterGroupName</code> and
  /// <code>ResetAllParameters</code> parameters.
  ///
  /// When resetting the entire group, dynamic parameters are updated
  /// immediately and static parameters are set to <code>pending-reboot</code>
  /// to take effect on the next DB instance restart or <a>RebootDBInstance</a>
  /// request. You must call <a>RebootDBInstance</a> for every DB instance in
  /// your DB cluster that you want the updated static parameter to apply to.
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to reset.
  ///
  /// Parameter [parameters] :
  /// A list of parameter names in the DB cluster parameter group to reset to
  /// the default values. You can't use this parameter if the
  /// <code>ResetAllParameters</code> parameter is set to <code>true</code>.
  ///
  /// Parameter [resetAllParameters] :
  /// A value that is set to <code>true</code> to reset all parameters in the DB
  /// cluster parameter group to their default values, and <code>false</code>
  /// otherwise. You can't use this parameter if there is a list of parameter
  /// names specified for the <code>Parameters</code> parameter.
  Future<DBClusterParameterGroupNameMessage> resetDBClusterParameterGroup({
    required String dBClusterParameterGroupName,
    List<Parameter>? parameters,
    bool? resetAllParameters,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterParameterGroupName'] = dBClusterParameterGroupName;
    parameters?.also((arg) => $request['Parameters'] = arg);
    resetAllParameters?.also((arg) => $request['ResetAllParameters'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ResetDBClusterParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResetDBClusterParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ResetDBClusterParameterGroupResult',
    );
    return DBClusterParameterGroupNameMessage.fromXml($result);
  }

  /// Modifies the parameters of a DB parameter group to the engine/system
  /// default value. To reset specific parameters, provide a list of the
  /// following: <code>ParameterName</code> and <code>ApplyMethod</code>. To
  /// reset the entire DB parameter group, specify the
  /// <code>DBParameterGroup</code> name and <code>ResetAllParameters</code>
  /// parameters. When resetting the entire group, dynamic parameters are
  /// updated immediately and static parameters are set to
  /// <code>pending-reboot</code> to take effect on the next DB instance restart
  /// or <code>RebootDBInstance</code> request.
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBParameterGroupName] :
  /// The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the name of an existing DBParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [parameters] :
  /// To reset the entire DB parameter group, specify the
  /// <code>DBParameterGroup</code> name and <code>ResetAllParameters</code>
  /// parameters. To reset specific parameters, provide a list of the following:
  /// <code>ParameterName</code> and <code>ApplyMethod</code>. A maximum of 20
  /// parameters can be modified in a single request.
  ///
  /// Valid Values (for Apply method): <code>pending-reboot</code>
  ///
  /// Parameter [resetAllParameters] :
  /// Specifies whether (<code>true</code>) or not (<code>false</code>) to reset
  /// all parameters in the DB parameter group to default values.
  ///
  /// Default: <code>true</code>
  Future<DBParameterGroupNameMessage> resetDBParameterGroup({
    required String dBParameterGroupName,
    List<Parameter>? parameters,
    bool? resetAllParameters,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    parameters?.also((arg) => $request['Parameters'] = arg);
    resetAllParameters?.also((arg) => $request['ResetAllParameters'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ResetDBParameterGroup',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResetDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ResetDBParameterGroupResult',
    );
    return DBParameterGroupNameMessage.fromXml($result);
  }

  /// Creates a new DB cluster from a DB snapshot or DB cluster snapshot.
  ///
  /// If a DB snapshot is specified, the target DB cluster is created from the
  /// source DB snapshot with a default configuration and default security
  /// group.
  ///
  /// If a DB cluster snapshot is specified, the target DB cluster is created
  /// from the source DB cluster restore point with the same configuration as
  /// the original source DB cluster, except that the new DB cluster is created
  /// with the default security group.
  ///
  /// May throw [DBClusterAlreadyExistsFault].
  /// May throw [DBClusterQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [InsufficientDBClusterCapacityFault].
  /// May throw [InsufficientStorageClusterCapacityFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [InvalidSubnet].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [DBClusterParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the DB cluster to create from the DB snapshot or DB cluster
  /// snapshot. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  /// Example: <code>my-snapshot-id</code>
  ///
  /// Parameter [engine] :
  /// The database engine to use for the new DB cluster.
  ///
  /// Default: The same as source
  ///
  /// Constraint: Must be compatible with the engine of the source
  ///
  /// Parameter [snapshotIdentifier] :
  /// The identifier for the DB snapshot or DB cluster snapshot to restore from.
  ///
  /// You can use either the name or the Amazon Resource Name (ARN) to specify a
  /// DB cluster snapshot. However, you can use only the ARN to specify a DB
  /// snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing Snapshot.
  /// </li>
  /// </ul>
  ///
  /// Parameter [availabilityZones] :
  /// Provides the list of EC2 Availability Zones that instances in the restored
  /// DB cluster can be created in.
  ///
  /// Parameter [copyTagsToSnapshot] :
  /// <i>If set to <code>true</code>, tags are copied to any snapshot of the
  /// restored DB cluster that is created.</i>
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to associate with the new DB
  /// cluster.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name of the DB subnet group to use for the new DB cluster.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [databaseName] :
  /// Not supported.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB cluster has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of logs that the restored DB cluster is to export to Amazon
  /// CloudWatch Logs.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// True to enable mapping of Amazon Identity and Access Management (IAM)
  /// accounts to database accounts, and otherwise false.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [engineVersion] :
  /// The version of the database engine to use for the new DB cluster.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon KMS key identifier to use when restoring an encrypted DB
  /// cluster from a DB snapshot or DB cluster snapshot.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are restoring a DB cluster with the same Amazon
  /// account that owns the KMS encryption key used to encrypt the new DB
  /// cluster, then you can use the KMS key alias instead of the ARN for the KMS
  /// encryption key.
  ///
  /// If you do not specify a value for the <code>KmsKeyId</code> parameter,
  /// then the following will occur:
  ///
  /// <ul>
  /// <li>
  /// If the DB snapshot or DB cluster snapshot in
  /// <code>SnapshotIdentifier</code> is encrypted, then the restored DB cluster
  /// is encrypted using the KMS key that was used to encrypt the DB snapshot or
  /// DB cluster snapshot.
  /// </li>
  /// <li>
  /// If the DB snapshot or DB cluster snapshot in
  /// <code>SnapshotIdentifier</code> is not encrypted, then the restored DB
  /// cluster is not encrypted.
  /// </li>
  /// </ul>
  ///
  /// Parameter [optionGroupName] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [port] :
  /// The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: Value must be <code>1150-65535</code>
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// Parameter [serverlessV2ScalingConfiguration] :
  /// Contains the scaling configuration of a Neptune Serverless DB cluster.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html">Using
  /// Amazon Neptune Serverless</a> in the <i>Amazon Neptune User Guide</i>.
  ///
  /// Parameter [storageType] :
  /// Specifies the storage type to be associated with the DB cluster.
  ///
  /// Valid values: <code>standard</code>, <code>iopt1</code>
  ///
  /// Default: <code>standard</code>
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the restored DB cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security groups that the new DB cluster will belong to.
  Future<RestoreDBClusterFromSnapshotResult> restoreDBClusterFromSnapshot({
    required String dBClusterIdentifier,
    required String engine,
    required String snapshotIdentifier,
    List<String>? availabilityZones,
    bool? copyTagsToSnapshot,
    String? dBClusterParameterGroupName,
    String? dBSubnetGroupName,
    String? databaseName,
    bool? deletionProtection,
    List<String>? enableCloudwatchLogsExports,
    bool? enableIAMDatabaseAuthentication,
    String? engineVersion,
    String? kmsKeyId,
    String? optionGroupName,
    int? port,
    ServerlessV2ScalingConfiguration? serverlessV2ScalingConfiguration,
    String? storageType,
    List<Tag>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['Engine'] = engine;
    $request['SnapshotIdentifier'] = snapshotIdentifier;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    copyTagsToSnapshot?.also((arg) => $request['CopyTagsToSnapshot'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    databaseName?.also((arg) => $request['DatabaseName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    serverlessV2ScalingConfiguration
        ?.also((arg) => $request['ServerlessV2ScalingConfiguration'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBClusterFromSnapshot',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBClusterFromSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreDBClusterFromSnapshotResult',
    );
    return RestoreDBClusterFromSnapshotResult.fromXml($result);
  }

  /// Restores a DB cluster to an arbitrary point in time. Users can restore to
  /// any point in time before <code>LatestRestorableTime</code> for up to
  /// <code>BackupRetentionPeriod</code> days. The target DB cluster is created
  /// from the source DB cluster with the same configuration as the original DB
  /// cluster, except that the new DB cluster is created with the default DB
  /// security group.
  /// <note>
  /// This action only restores the DB cluster, not the DB instances for that DB
  /// cluster. You must invoke the <a>CreateDBInstance</a> action to create DB
  /// instances for the restored DB cluster, specifying the identifier of the
  /// restored DB cluster in <code>DBClusterIdentifier</code>. You can create DB
  /// instances only after the <code>RestoreDBClusterToPointInTime</code> action
  /// has completed and the DB cluster is available.
  /// </note>
  ///
  /// May throw [DBClusterAlreadyExistsFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [DBClusterQuotaExceededFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [InsufficientDBClusterCapacityFault].
  /// May throw [InsufficientStorageClusterCapacityFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBClusterParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the new DB cluster to be created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 letters, numbers, or hyphens
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceDBClusterIdentifier] :
  /// The identifier of the source DB cluster from which to restore.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing DBCluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the DB cluster parameter group to associate with the new DB
  /// cluster.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If supplied, must match the name of an existing DBClusterParameterGroup.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The DB subnet group name to use for the new DB cluster.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the DB cluster has deletion protection
  /// enabled. The database can't be deleted when deletion protection is
  /// enabled. By default, deletion protection is disabled.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// The list of logs that the restored DB cluster is to export to CloudWatch
  /// Logs.
  ///
  /// Parameter [enableIAMDatabaseAuthentication] :
  /// True to enable mapping of Amazon Identity and Access Management (IAM)
  /// accounts to database accounts, and otherwise false.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon KMS key identifier to use when restoring an encrypted DB
  /// cluster from an encrypted DB cluster.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are restoring a DB cluster with the same Amazon
  /// account that owns the KMS encryption key used to encrypt the new DB
  /// cluster, then you can use the KMS key alias instead of the ARN for the KMS
  /// encryption key.
  ///
  /// You can restore to a new DB cluster and encrypt the new DB cluster with a
  /// KMS key that is different than the KMS key used to encrypt the source DB
  /// cluster. The new DB cluster is encrypted with the KMS key identified by
  /// the <code>KmsKeyId</code> parameter.
  ///
  /// If you do not specify a value for the <code>KmsKeyId</code> parameter,
  /// then the following will occur:
  ///
  /// <ul>
  /// <li>
  /// If the DB cluster is encrypted, then the restored DB cluster is encrypted
  /// using the KMS key that was used to encrypt the source DB cluster.
  /// </li>
  /// <li>
  /// If the DB cluster is not encrypted, then the restored DB cluster is not
  /// encrypted.
  /// </li>
  /// </ul>
  /// If <code>DBClusterIdentifier</code> refers to a DB cluster that is not
  /// encrypted, then the restore request is rejected.
  ///
  /// Parameter [optionGroupName] :
  /// <i>(Not supported by Neptune)</i>
  ///
  /// Parameter [port] :
  /// The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: Value must be <code>1150-65535</code>
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// Parameter [restoreToTime] :
  /// The date and time to restore the DB cluster to.
  ///
  /// Valid Values: Value must be a time in Universal Coordinated Time (UTC)
  /// format
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be before the latest restorable time for the DB instance
  /// </li>
  /// <li>
  /// Must be specified if <code>UseLatestRestorableTime</code> parameter is not
  /// provided
  /// </li>
  /// <li>
  /// Cannot be specified if <code>UseLatestRestorableTime</code> parameter is
  /// true
  /// </li>
  /// <li>
  /// Cannot be specified if <code>RestoreType</code> parameter is
  /// <code>copy-on-write</code>
  /// </li>
  /// </ul>
  /// Example: <code>2015-03-07T23:45:00Z</code>
  ///
  /// Parameter [restoreType] :
  /// The type of restore to be performed. You can specify one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>full-copy</code> - The new DB cluster is restored as a full copy of
  /// the source DB cluster.
  /// </li>
  /// <li>
  /// <code>copy-on-write</code> - The new DB cluster is restored as a clone of
  /// the source DB cluster.
  /// </li>
  /// </ul>
  /// If you don't specify a <code>RestoreType</code> value, then the new DB
  /// cluster is restored as a full copy of the source DB cluster.
  ///
  /// Parameter [serverlessV2ScalingConfiguration] :
  /// Contains the scaling configuration of a Neptune Serverless DB cluster.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html">Using
  /// Amazon Neptune Serverless</a> in the <i>Amazon Neptune User Guide</i>.
  ///
  /// Parameter [storageType] :
  /// Specifies the storage type to be associated with the DB cluster.
  ///
  /// Valid values: <code>standard</code>, <code>iopt1</code>
  ///
  /// Default: <code>standard</code>
  ///
  /// Parameter [tags] :
  /// The tags to be applied to the restored DB cluster.
  ///
  /// Parameter [useLatestRestorableTime] :
  /// A value that is set to <code>true</code> to restore the DB cluster to the
  /// latest restorable backup time, and <code>false</code> otherwise.
  ///
  /// Default: <code>false</code>
  ///
  /// Constraints: Cannot be specified if <code>RestoreToTime</code> parameter
  /// is provided.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security groups that the new DB cluster belongs to.
  Future<RestoreDBClusterToPointInTimeResult> restoreDBClusterToPointInTime({
    required String dBClusterIdentifier,
    required String sourceDBClusterIdentifier,
    String? dBClusterParameterGroupName,
    String? dBSubnetGroupName,
    bool? deletionProtection,
    List<String>? enableCloudwatchLogsExports,
    bool? enableIAMDatabaseAuthentication,
    String? kmsKeyId,
    String? optionGroupName,
    int? port,
    DateTime? restoreToTime,
    String? restoreType,
    ServerlessV2ScalingConfiguration? serverlessV2ScalingConfiguration,
    String? storageType,
    List<Tag>? tags,
    bool? useLatestRestorableTime,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['SourceDBClusterIdentifier'] = sourceDBClusterIdentifier;
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    enableIAMDatabaseAuthentication
        ?.also((arg) => $request['EnableIAMDatabaseAuthentication'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    restoreToTime
        ?.also((arg) => $request['RestoreToTime'] = _s.iso8601ToJson(arg));
    restoreType?.also((arg) => $request['RestoreType'] = arg);
    serverlessV2ScalingConfiguration
        ?.also((arg) => $request['ServerlessV2ScalingConfiguration'] = arg);
    storageType?.also((arg) => $request['StorageType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    useLatestRestorableTime
        ?.also((arg) => $request['UseLatestRestorableTime'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBClusterToPointInTime',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBClusterToPointInTimeMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreDBClusterToPointInTimeResult',
    );
    return RestoreDBClusterToPointInTimeResult.fromXml($result);
  }

  /// Starts an Amazon Neptune DB cluster that was stopped using the Amazon
  /// console, the Amazon CLI stop-db-cluster command, or the StopDBCluster API.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the Neptune DB cluster to be started. This
  /// parameter is stored as a lowercase string.
  Future<StartDBClusterResult> startDBCluster({
    required String dBClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'StartDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'StartDBClusterResult',
    );
    return StartDBClusterResult.fromXml($result);
  }

  /// Stops an Amazon Neptune DB cluster. When you stop a DB cluster, Neptune
  /// retains the DB cluster's metadata, including its endpoints and DB
  /// parameter groups.
  ///
  /// Neptune also retains the transaction logs so you can do a point-in-time
  /// restore if necessary.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The DB cluster identifier of the Neptune DB cluster to be stopped. This
  /// parameter is stored as a lowercase string.
  Future<StopDBClusterResult> stopDBCluster({
    required String dBClusterIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'StopDBCluster',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StopDBClusterMessage'],
      shapes: shapes,
      resultWrapper: 'StopDBClusterResult',
    );
    return StopDBClusterResult.fromXml($result);
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

extension ApplyMethodValueExtension on ApplyMethod {
  String toValue() {
    switch (this) {
      case ApplyMethod.immediate:
        return 'immediate';
      case ApplyMethod.pendingReboot:
        return 'pending-reboot';
    }
  }
}

extension ApplyMethodFromString on String {
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

class ApplyPendingMaintenanceActionResult {
  final ResourcePendingMaintenanceActions? resourcePendingMaintenanceActions;

  ApplyPendingMaintenanceActionResult({
    this.resourcePendingMaintenanceActions,
  });
  factory ApplyPendingMaintenanceActionResult.fromXml(_s.XmlElement elem) {
    return ApplyPendingMaintenanceActionResult(
      resourcePendingMaintenanceActions: _s
          .extractXmlChild(elem, 'ResourcePendingMaintenanceActions')
          ?.let(ResourcePendingMaintenanceActions.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePendingMaintenanceActions =
        this.resourcePendingMaintenanceActions;
    return {
      if (resourcePendingMaintenanceActions != null)
        'ResourcePendingMaintenanceActions': resourcePendingMaintenanceActions,
    };
  }
}

/// Specifies an Availability Zone.
class AvailabilityZone {
  /// The name of the availability zone.
  final String? name;

  AvailabilityZone({
    this.name,
  });
  factory AvailabilityZone.fromXml(_s.XmlElement elem) {
    return AvailabilityZone(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Specifies a character set.
class CharacterSet {
  /// The description of the character set.
  final String? characterSetDescription;

  /// The name of the character set.
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

/// The configuration setting for the log types to be enabled for export to
/// CloudWatch Logs for a specific DB instance or DB cluster.
///
/// The <code>EnableLogTypes</code> and <code>DisableLogTypes</code> arrays
/// determine which logs will be exported (or not exported) to CloudWatch Logs.
///
/// Valid log types are: <code>audit</code> (to publish audit logs) and
/// <code>slowquery</code> (to publish slow-query logs). See <a
/// href="https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html">Publishing
/// Neptune logs to Amazon CloudWatch logs</a>.
class CloudwatchLogsExportConfiguration {
  /// The list of log types to disable.
  final List<String>? disableLogTypes;

  /// The list of log types to enable.
  final List<String>? enableLogTypes;

  CloudwatchLogsExportConfiguration({
    this.disableLogTypes,
    this.enableLogTypes,
  });

  Map<String, dynamic> toJson() {
    final disableLogTypes = this.disableLogTypes;
    final enableLogTypes = this.enableLogTypes;
    return {
      if (disableLogTypes != null) 'DisableLogTypes': disableLogTypes,
      if (enableLogTypes != null) 'EnableLogTypes': enableLogTypes,
    };
  }
}

/// This data type is used as a response element in the
/// <code>ModifyDBCluster</code> operation and contains changes that will be
/// applied during the next maintenance window.
class ClusterPendingModifiedValues {
  /// The allocated storage size in gibibytes (GiB) for database engines. For
  /// Neptune, <code>AllocatedStorage</code> always returns 1, because Neptune DB
  /// cluster storage size isn't fixed, but instead automatically adjusts as
  /// needed.
  final int? allocatedStorage;

  /// The number of days for which automatic DB snapshots are retained.
  final int? backupRetentionPeriod;

  /// The DBClusterIdentifier value for the DB cluster.
  final String? dBClusterIdentifier;

  /// The database engine version.
  final String? engineVersion;

  /// A value that indicates whether mapping of Amazon Web Services Identity and
  /// Access Management (IAM) accounts to database accounts is enabled.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// The Provisioned IOPS (I/O operations per second) value. This setting is only
  /// for non-Aurora Multi-AZ DB clusters.
  final int? iops;

  /// This <code>PendingCloudwatchLogsExports</code> structure specifies pending
  /// changes to which CloudWatch logs are enabled and which are disabled.
  final PendingCloudwatchLogsExports? pendingCloudwatchLogsExports;

  /// The storage type for the DB cluster.
  final String? storageType;

  ClusterPendingModifiedValues({
    this.allocatedStorage,
    this.backupRetentionPeriod,
    this.dBClusterIdentifier,
    this.engineVersion,
    this.iAMDatabaseAuthenticationEnabled,
    this.iops,
    this.pendingCloudwatchLogsExports,
    this.storageType,
  });
  factory ClusterPendingModifiedValues.fromXml(_s.XmlElement elem) {
    return ClusterPendingModifiedValues(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      pendingCloudwatchLogsExports: _s
          .extractXmlChild(elem, 'PendingCloudwatchLogsExports')
          ?.let(PendingCloudwatchLogsExports.fromXml),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final dBClusterIdentifier = this.dBClusterIdentifier;
    final engineVersion = this.engineVersion;
    final iAMDatabaseAuthenticationEnabled =
        this.iAMDatabaseAuthenticationEnabled;
    final iops = this.iops;
    final pendingCloudwatchLogsExports = this.pendingCloudwatchLogsExports;
    final storageType = this.storageType;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (dBClusterIdentifier != null)
        'DBClusterIdentifier': dBClusterIdentifier,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iAMDatabaseAuthenticationEnabled != null)
        'IAMDatabaseAuthenticationEnabled': iAMDatabaseAuthenticationEnabled,
      if (iops != null) 'Iops': iops,
      if (pendingCloudwatchLogsExports != null)
        'PendingCloudwatchLogsExports': pendingCloudwatchLogsExports,
      if (storageType != null) 'StorageType': storageType,
    };
  }
}

class CopyDBClusterParameterGroupResult {
  final DBClusterParameterGroup? dBClusterParameterGroup;

  CopyDBClusterParameterGroupResult({
    this.dBClusterParameterGroup,
  });
  factory CopyDBClusterParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CopyDBClusterParameterGroupResult(
      dBClusterParameterGroup: _s
          .extractXmlChild(elem, 'DBClusterParameterGroup')
          ?.let(DBClusterParameterGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterParameterGroup = this.dBClusterParameterGroup;
    return {
      if (dBClusterParameterGroup != null)
        'DBClusterParameterGroup': dBClusterParameterGroup,
    };
  }
}

class CopyDBClusterSnapshotResult {
  final DBClusterSnapshot? dBClusterSnapshot;

  CopyDBClusterSnapshotResult({
    this.dBClusterSnapshot,
  });
  factory CopyDBClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return CopyDBClusterSnapshotResult(
      dBClusterSnapshot: _s
          .extractXmlChild(elem, 'DBClusterSnapshot')
          ?.let(DBClusterSnapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterSnapshot = this.dBClusterSnapshot;
    return {
      if (dBClusterSnapshot != null) 'DBClusterSnapshot': dBClusterSnapshot,
    };
  }
}

class CopyDBParameterGroupResult {
  final DBParameterGroup? dBParameterGroup;

  CopyDBParameterGroupResult({
    this.dBParameterGroup,
  });
  factory CopyDBParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CopyDBParameterGroupResult(
      dBParameterGroup: _s
          .extractXmlChild(elem, 'DBParameterGroup')
          ?.let(DBParameterGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBParameterGroup = this.dBParameterGroup;
    return {
      if (dBParameterGroup != null) 'DBParameterGroup': dBParameterGroup,
    };
  }
}

/// This data type represents the information you need to connect to an Amazon
/// Neptune DB cluster. This data type is used as a response element in the
/// following actions:
///
/// <ul>
/// <li>
/// <code>CreateDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DescribeDBClusterEndpoints</code>
/// </li>
/// <li>
/// <code>ModifyDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DeleteDBClusterEndpoint</code>
/// </li>
/// </ul>
/// For the data structure that represents Amazon Neptune DB instance endpoints,
/// see <code>Endpoint</code>.
class CreateDBClusterEndpointOutput {
  /// The type associated with a custom endpoint. One of: <code>READER</code>,
  /// <code>WRITER</code>, <code>ANY</code>.
  final String? customEndpointType;

  /// The Amazon Resource Name (ARN) for the endpoint.
  final String? dBClusterEndpointArn;

  /// The identifier associated with the endpoint. This parameter is stored as a
  /// lowercase string.
  final String? dBClusterEndpointIdentifier;

  /// A unique system-generated identifier for an endpoint. It remains the same
  /// for the whole life of the endpoint.
  final String? dBClusterEndpointResourceIdentifier;

  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  final String? dBClusterIdentifier;

  /// The DNS address of the endpoint.
  final String? endpoint;

  /// The type of the endpoint. One of: <code>READER</code>, <code>WRITER</code>,
  /// <code>CUSTOM</code>.
  final String? endpointType;

  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  final List<String>? excludedMembers;

  /// List of DB instance identifiers that are part of the custom endpoint group.
  final List<String>? staticMembers;

  /// The current status of the endpoint. One of: <code>creating</code>,
  /// <code>available</code>, <code>deleting</code>, <code>inactive</code>,
  /// <code>modifying</code>. The <code>inactive</code> state applies to an
  /// endpoint that cannot be used for a certain kind of cluster, such as a
  /// <code>writer</code> endpoint for a read-only secondary cluster in a global
  /// database.
  final String? status;

  CreateDBClusterEndpointOutput({
    this.customEndpointType,
    this.dBClusterEndpointArn,
    this.dBClusterEndpointIdentifier,
    this.dBClusterEndpointResourceIdentifier,
    this.dBClusterIdentifier,
    this.endpoint,
    this.endpointType,
    this.excludedMembers,
    this.staticMembers,
    this.status,
  });
  factory CreateDBClusterEndpointOutput.fromXml(_s.XmlElement elem) {
    return CreateDBClusterEndpointOutput(
      customEndpointType: _s.extractXmlStringValue(elem, 'CustomEndpointType'),
      dBClusterEndpointArn:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointArn'),
      dBClusterEndpointIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointIdentifier'),
      dBClusterEndpointResourceIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointResourceIdentifier'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      endpointType: _s.extractXmlStringValue(elem, 'EndpointType'),
      excludedMembers: _s
          .extractXmlChild(elem, 'ExcludedMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      staticMembers: _s
          .extractXmlChild(elem, 'StaticMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final customEndpointType = this.customEndpointType;
    final dBClusterEndpointArn = this.dBClusterEndpointArn;
    final dBClusterEndpointIdentifier = this.dBClusterEndpointIdentifier;
    final dBClusterEndpointResourceIdentifier =
        this.dBClusterEndpointResourceIdentifier;
    final dBClusterIdentifier = this.dBClusterIdentifier;
    final endpoint = this.endpoint;
    final endpointType = this.endpointType;
    final excludedMembers = this.excludedMembers;
    final staticMembers = this.staticMembers;
    final status = this.status;
    return {
      if (customEndpointType != null) 'CustomEndpointType': customEndpointType,
      if (dBClusterEndpointArn != null)
        'DBClusterEndpointArn': dBClusterEndpointArn,
      if (dBClusterEndpointIdentifier != null)
        'DBClusterEndpointIdentifier': dBClusterEndpointIdentifier,
      if (dBClusterEndpointResourceIdentifier != null)
        'DBClusterEndpointResourceIdentifier':
            dBClusterEndpointResourceIdentifier,
      if (dBClusterIdentifier != null)
        'DBClusterIdentifier': dBClusterIdentifier,
      if (endpoint != null) 'Endpoint': endpoint,
      if (endpointType != null) 'EndpointType': endpointType,
      if (excludedMembers != null) 'ExcludedMembers': excludedMembers,
      if (staticMembers != null) 'StaticMembers': staticMembers,
      if (status != null) 'Status': status,
    };
  }
}

class CreateDBClusterParameterGroupResult {
  final DBClusterParameterGroup? dBClusterParameterGroup;

  CreateDBClusterParameterGroupResult({
    this.dBClusterParameterGroup,
  });
  factory CreateDBClusterParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBClusterParameterGroupResult(
      dBClusterParameterGroup: _s
          .extractXmlChild(elem, 'DBClusterParameterGroup')
          ?.let(DBClusterParameterGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterParameterGroup = this.dBClusterParameterGroup;
    return {
      if (dBClusterParameterGroup != null)
        'DBClusterParameterGroup': dBClusterParameterGroup,
    };
  }
}

class CreateDBClusterResult {
  final DBCluster? dBCluster;

  CreateDBClusterResult({
    this.dBCluster,
  });
  factory CreateDBClusterResult.fromXml(_s.XmlElement elem) {
    return CreateDBClusterResult(
      dBCluster: _s.extractXmlChild(elem, 'DBCluster')?.let(DBCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBCluster = this.dBCluster;
    return {
      if (dBCluster != null) 'DBCluster': dBCluster,
    };
  }
}

class CreateDBClusterSnapshotResult {
  final DBClusterSnapshot? dBClusterSnapshot;

  CreateDBClusterSnapshotResult({
    this.dBClusterSnapshot,
  });
  factory CreateDBClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateDBClusterSnapshotResult(
      dBClusterSnapshot: _s
          .extractXmlChild(elem, 'DBClusterSnapshot')
          ?.let(DBClusterSnapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterSnapshot = this.dBClusterSnapshot;
    return {
      if (dBClusterSnapshot != null) 'DBClusterSnapshot': dBClusterSnapshot,
    };
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
  factory CreateDBParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBParameterGroupResult(
      dBParameterGroup: _s
          .extractXmlChild(elem, 'DBParameterGroup')
          ?.let(DBParameterGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBParameterGroup = this.dBParameterGroup;
    return {
      if (dBParameterGroup != null) 'DBParameterGroup': dBParameterGroup,
    };
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
  factory CreateEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return CreateEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let(EventSubscription.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

class CreateGlobalClusterResult {
  final GlobalCluster? globalCluster;

  CreateGlobalClusterResult({
    this.globalCluster,
  });
  factory CreateGlobalClusterResult.fromXml(_s.XmlElement elem) {
    return CreateGlobalClusterResult(
      globalCluster:
          _s.extractXmlChild(elem, 'GlobalCluster')?.let(GlobalCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalCluster = this.globalCluster;
    return {
      if (globalCluster != null) 'GlobalCluster': globalCluster,
    };
  }
}

/// Contains the details of an Amazon Neptune DB cluster.
///
/// This data type is used as a response element in the
/// <a>DescribeDBClusters</a>.
class DBCluster {
  /// <code>AllocatedStorage</code> always returns 1, because Neptune DB cluster
  /// storage size is not fixed, but instead automatically adjusts as needed.
  final int? allocatedStorage;

  /// Provides a list of the Amazon Identity and Access Management (IAM) roles
  /// that are associated with the DB cluster. IAM roles that are associated with
  /// a DB cluster grant permission for the DB cluster to access other Amazon
  /// services on your behalf.
  final List<DBClusterRole>? associatedRoles;

  /// Time at which the DB cluster will be automatically restarted.
  final DateTime? automaticRestartTime;

  /// Provides the list of EC2 Availability Zones that instances in the DB cluster
  /// can be created in.
  final List<String>? availabilityZones;

  /// Specifies the number of days for which automatic DB snapshots are retained.
  final int? backupRetentionPeriod;

  /// Not supported by Neptune.
  final String? characterSetName;

  /// Identifies the clone group to which the DB cluster is associated.
  final String? cloneGroupId;

  /// Specifies the time when the DB cluster was created, in Universal Coordinated
  /// Time (UTC).
  final DateTime? clusterCreateTime;

  /// <i>If set to <code>true</code>, tags are copied to any snapshot of the DB
  /// cluster that is created.</i>
  final bool? copyTagsToSnapshot;

  /// If set to <code>true</code>, the DB cluster can be cloned across accounts.
  final bool? crossAccountClone;

  /// The Amazon Resource Name (ARN) for the DB cluster.
  final String? dBClusterArn;

  /// Contains a user-supplied DB cluster identifier. This identifier is the
  /// unique key that identifies a DB cluster.
  final String? dBClusterIdentifier;

  /// Provides the list of instances that make up the DB cluster.
  final List<DBClusterMember>? dBClusterMembers;

  /// Not supported by Neptune.
  final List<DBClusterOptionGroupStatus>? dBClusterOptionGroupMemberships;

  /// Specifies the name of the DB cluster parameter group for the DB cluster.
  final String? dBClusterParameterGroup;

  /// Specifies information on the subnet group associated with the DB cluster,
  /// including the name, description, and subnets in the subnet group.
  final String? dBSubnetGroup;

  /// Contains the name of the initial database of this DB cluster that was
  /// provided at create time, if one was specified when the DB cluster was
  /// created. This same name is returned for the life of the DB cluster.
  final String? databaseName;

  /// The Amazon Region-unique, immutable identifier for the DB cluster. This
  /// identifier is found in Amazon CloudTrail log entries whenever the Amazon KMS
  /// key for the DB cluster is accessed.
  final String? dbClusterResourceId;

  /// Indicates whether or not the DB cluster has deletion protection enabled. The
  /// database can't be deleted when deletion protection is enabled.
  final bool? deletionProtection;

  /// Specifies the earliest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime? earliestRestorableTime;

  /// A list of the log types that this DB cluster is configured to export to
  /// CloudWatch Logs. Valid log types are: <code>audit</code> (to publish audit
  /// logs to CloudWatch) and slowquery (to publish slow-query logs to
  /// CloudWatch). See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html">Publishing
  /// Neptune logs to Amazon CloudWatch logs</a>.
  final List<String>? enabledCloudwatchLogsExports;

  /// Specifies the connection endpoint for the primary instance of the DB
  /// cluster.
  final String? endpoint;

  /// Provides the name of the database engine to be used for this DB cluster.
  final String? engine;

  /// Indicates the database engine version.
  final String? engineVersion;

  /// Contains a user-supplied global database cluster identifier. This identifier
  /// is the unique key that identifies a global database.
  final String? globalClusterIdentifier;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.
  final String? hostedZoneId;

  /// True if mapping of Amazon Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// The next time you can modify the DB cluster to use the <code>iopt1</code>
  /// storage type.
  final DateTime? iOOptimizedNextAllowedModificationTime;

  /// If <code>StorageEncrypted</code> is true, the Amazon KMS key identifier for
  /// the encrypted DB cluster.
  final String? kmsKeyId;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime? latestRestorableTime;

  /// Not supported by Neptune.
  final String? masterUsername;

  /// Specifies whether the DB cluster has instances in multiple Availability
  /// Zones.
  final bool? multiAZ;

  /// This data type is used as a response element in the
  /// <code>ModifyDBCluster</code> operation and contains changes that will be
  /// applied during the next maintenance window.
  final ClusterPendingModifiedValues? pendingModifiedValues;

  /// Specifies the progress of the operation as a percentage.
  final String? percentProgress;

  /// Specifies the port that the database engine is listening on.
  final int? port;

  /// Specifies the daily time range during which automated backups are created if
  /// automated backups are enabled, as determined by the
  /// <code>BackupRetentionPeriod</code>.
  final String? preferredBackupWindow;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String? preferredMaintenanceWindow;

  /// Contains one or more identifiers of the Read Replicas associated with this
  /// DB cluster.
  final List<String>? readReplicaIdentifiers;

  /// The reader endpoint for the DB cluster. The reader endpoint for a DB cluster
  /// load-balances connections across the Read Replicas that are available in a
  /// DB cluster. As clients request new connections to the reader endpoint,
  /// Neptune distributes the connection requests among the Read Replicas in the
  /// DB cluster. This functionality can help balance your read workload across
  /// multiple Read Replicas in your DB cluster.
  ///
  /// If a failover occurs, and the Read Replica that you are connected to is
  /// promoted to be the primary instance, your connection is dropped. To continue
  /// sending your read workload to other Read Replicas in the cluster, you can
  /// then reconnect to the reader endpoint.
  final String? readerEndpoint;

  /// Not supported by Neptune.
  final String? replicationSourceIdentifier;

  /// Shows the scaling configuration for a Neptune Serverless DB cluster.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html">Using
  /// Amazon Neptune Serverless</a> in the <i>Amazon Neptune User Guide</i>.
  final ServerlessV2ScalingConfigurationInfo? serverlessV2ScalingConfiguration;

  /// Specifies the current state of this DB cluster.
  final String? status;

  /// Specifies whether the DB cluster is encrypted.
  final bool? storageEncrypted;

  /// The storage type associated with the DB cluster.
  final String? storageType;

  /// Provides a list of VPC security groups that the DB cluster belongs to.
  final List<VpcSecurityGroupMembership>? vpcSecurityGroups;

  DBCluster({
    this.allocatedStorage,
    this.associatedRoles,
    this.automaticRestartTime,
    this.availabilityZones,
    this.backupRetentionPeriod,
    this.characterSetName,
    this.cloneGroupId,
    this.clusterCreateTime,
    this.copyTagsToSnapshot,
    this.crossAccountClone,
    this.dBClusterArn,
    this.dBClusterIdentifier,
    this.dBClusterMembers,
    this.dBClusterOptionGroupMemberships,
    this.dBClusterParameterGroup,
    this.dBSubnetGroup,
    this.databaseName,
    this.dbClusterResourceId,
    this.deletionProtection,
    this.earliestRestorableTime,
    this.enabledCloudwatchLogsExports,
    this.endpoint,
    this.engine,
    this.engineVersion,
    this.globalClusterIdentifier,
    this.hostedZoneId,
    this.iAMDatabaseAuthenticationEnabled,
    this.iOOptimizedNextAllowedModificationTime,
    this.kmsKeyId,
    this.latestRestorableTime,
    this.masterUsername,
    this.multiAZ,
    this.pendingModifiedValues,
    this.percentProgress,
    this.port,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.readReplicaIdentifiers,
    this.readerEndpoint,
    this.replicationSourceIdentifier,
    this.serverlessV2ScalingConfiguration,
    this.status,
    this.storageEncrypted,
    this.storageType,
    this.vpcSecurityGroups,
  });
  factory DBCluster.fromXml(_s.XmlElement elem) {
    return DBCluster(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      associatedRoles: _s.extractXmlChild(elem, 'AssociatedRoles')?.let(
          (elem) => elem
              .findElements('DBClusterRole')
              .map(DBClusterRole.fromXml)
              .toList()),
      automaticRestartTime:
          _s.extractXmlDateTimeValue(elem, 'AutomaticRestartTime'),
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AvailabilityZone')),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
      cloneGroupId: _s.extractXmlStringValue(elem, 'CloneGroupId'),
      clusterCreateTime: _s.extractXmlDateTimeValue(elem, 'ClusterCreateTime'),
      copyTagsToSnapshot: _s.extractXmlBoolValue(elem, 'CopyTagsToSnapshot'),
      crossAccountClone: _s.extractXmlBoolValue(elem, 'CrossAccountClone'),
      dBClusterArn: _s.extractXmlStringValue(elem, 'DBClusterArn'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      dBClusterMembers: _s.extractXmlChild(elem, 'DBClusterMembers')?.let(
          (elem) => elem
              .findElements('DBClusterMember')
              .map(DBClusterMember.fromXml)
              .toList()),
      dBClusterOptionGroupMemberships: _s
          .extractXmlChild(elem, 'DBClusterOptionGroupMemberships')
          ?.let((elem) => elem
              .findElements('DBClusterOptionGroup')
              .map(DBClusterOptionGroupStatus.fromXml)
              .toList()),
      dBClusterParameterGroup:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroup'),
      dBSubnetGroup: _s.extractXmlStringValue(elem, 'DBSubnetGroup'),
      databaseName: _s.extractXmlStringValue(elem, 'DatabaseName'),
      dbClusterResourceId:
          _s.extractXmlStringValue(elem, 'DbClusterResourceId'),
      deletionProtection: _s.extractXmlBoolValue(elem, 'DeletionProtection'),
      earliestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'EarliestRestorableTime'),
      enabledCloudwatchLogsExports: _s
          .extractXmlChild(elem, 'EnabledCloudwatchLogsExports')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      globalClusterIdentifier:
          _s.extractXmlStringValue(elem, 'GlobalClusterIdentifier'),
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      iOOptimizedNextAllowedModificationTime: _s.extractXmlDateTimeValue(
          elem, 'IOOptimizedNextAllowedModificationTime'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      latestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'LatestRestorableTime'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let(ClusterPendingModifiedValues.fromXml),
      percentProgress: _s.extractXmlStringValue(elem, 'PercentProgress'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      preferredBackupWindow:
          _s.extractXmlStringValue(elem, 'PreferredBackupWindow'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      readReplicaIdentifiers: _s
          .extractXmlChild(elem, 'ReadReplicaIdentifiers')
          ?.let((elem) =>
              _s.extractXmlStringListValues(elem, 'ReadReplicaIdentifier')),
      readerEndpoint: _s.extractXmlStringValue(elem, 'ReaderEndpoint'),
      replicationSourceIdentifier:
          _s.extractXmlStringValue(elem, 'ReplicationSourceIdentifier'),
      serverlessV2ScalingConfiguration: _s
          .extractXmlChild(elem, 'ServerlessV2ScalingConfiguration')
          ?.let(ServerlessV2ScalingConfigurationInfo.fromXml),
      status: _s.extractXmlStringValue(elem, 'Status'),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map(VpcSecurityGroupMembership.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final associatedRoles = this.associatedRoles;
    final automaticRestartTime = this.automaticRestartTime;
    final availabilityZones = this.availabilityZones;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final characterSetName = this.characterSetName;
    final cloneGroupId = this.cloneGroupId;
    final clusterCreateTime = this.clusterCreateTime;
    final copyTagsToSnapshot = this.copyTagsToSnapshot;
    final crossAccountClone = this.crossAccountClone;
    final dBClusterArn = this.dBClusterArn;
    final dBClusterIdentifier = this.dBClusterIdentifier;
    final dBClusterMembers = this.dBClusterMembers;
    final dBClusterOptionGroupMemberships =
        this.dBClusterOptionGroupMemberships;
    final dBClusterParameterGroup = this.dBClusterParameterGroup;
    final dBSubnetGroup = this.dBSubnetGroup;
    final databaseName = this.databaseName;
    final dbClusterResourceId = this.dbClusterResourceId;
    final deletionProtection = this.deletionProtection;
    final earliestRestorableTime = this.earliestRestorableTime;
    final enabledCloudwatchLogsExports = this.enabledCloudwatchLogsExports;
    final endpoint = this.endpoint;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final globalClusterIdentifier = this.globalClusterIdentifier;
    final hostedZoneId = this.hostedZoneId;
    final iAMDatabaseAuthenticationEnabled =
        this.iAMDatabaseAuthenticationEnabled;
    final iOOptimizedNextAllowedModificationTime =
        this.iOOptimizedNextAllowedModificationTime;
    final kmsKeyId = this.kmsKeyId;
    final latestRestorableTime = this.latestRestorableTime;
    final masterUsername = this.masterUsername;
    final multiAZ = this.multiAZ;
    final pendingModifiedValues = this.pendingModifiedValues;
    final percentProgress = this.percentProgress;
    final port = this.port;
    final preferredBackupWindow = this.preferredBackupWindow;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final readReplicaIdentifiers = this.readReplicaIdentifiers;
    final readerEndpoint = this.readerEndpoint;
    final replicationSourceIdentifier = this.replicationSourceIdentifier;
    final serverlessV2ScalingConfiguration =
        this.serverlessV2ScalingConfiguration;
    final status = this.status;
    final storageEncrypted = this.storageEncrypted;
    final storageType = this.storageType;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (associatedRoles != null) 'AssociatedRoles': associatedRoles,
      if (automaticRestartTime != null)
        'AutomaticRestartTime': iso8601ToJson(automaticRestartTime),
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (characterSetName != null) 'CharacterSetName': characterSetName,
      if (cloneGroupId != null) 'CloneGroupId': cloneGroupId,
      if (clusterCreateTime != null)
        'ClusterCreateTime': iso8601ToJson(clusterCreateTime),
      if (copyTagsToSnapshot != null) 'CopyTagsToSnapshot': copyTagsToSnapshot,
      if (crossAccountClone != null) 'CrossAccountClone': crossAccountClone,
      if (dBClusterArn != null) 'DBClusterArn': dBClusterArn,
      if (dBClusterIdentifier != null)
        'DBClusterIdentifier': dBClusterIdentifier,
      if (dBClusterMembers != null) 'DBClusterMembers': dBClusterMembers,
      if (dBClusterOptionGroupMemberships != null)
        'DBClusterOptionGroupMemberships': dBClusterOptionGroupMemberships,
      if (dBClusterParameterGroup != null)
        'DBClusterParameterGroup': dBClusterParameterGroup,
      if (dBSubnetGroup != null) 'DBSubnetGroup': dBSubnetGroup,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (dbClusterResourceId != null)
        'DbClusterResourceId': dbClusterResourceId,
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
      if (earliestRestorableTime != null)
        'EarliestRestorableTime': iso8601ToJson(earliestRestorableTime),
      if (enabledCloudwatchLogsExports != null)
        'EnabledCloudwatchLogsExports': enabledCloudwatchLogsExports,
      if (endpoint != null) 'Endpoint': endpoint,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (globalClusterIdentifier != null)
        'GlobalClusterIdentifier': globalClusterIdentifier,
      if (hostedZoneId != null) 'HostedZoneId': hostedZoneId,
      if (iAMDatabaseAuthenticationEnabled != null)
        'IAMDatabaseAuthenticationEnabled': iAMDatabaseAuthenticationEnabled,
      if (iOOptimizedNextAllowedModificationTime != null)
        'IOOptimizedNextAllowedModificationTime':
            iso8601ToJson(iOOptimizedNextAllowedModificationTime),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (latestRestorableTime != null)
        'LatestRestorableTime': iso8601ToJson(latestRestorableTime),
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (pendingModifiedValues != null)
        'PendingModifiedValues': pendingModifiedValues,
      if (percentProgress != null) 'PercentProgress': percentProgress,
      if (port != null) 'Port': port,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (readReplicaIdentifiers != null)
        'ReadReplicaIdentifiers': readReplicaIdentifiers,
      if (readerEndpoint != null) 'ReaderEndpoint': readerEndpoint,
      if (replicationSourceIdentifier != null)
        'ReplicationSourceIdentifier': replicationSourceIdentifier,
      if (serverlessV2ScalingConfiguration != null)
        'ServerlessV2ScalingConfiguration': serverlessV2ScalingConfiguration,
      if (status != null) 'Status': status,
      if (storageEncrypted != null) 'StorageEncrypted': storageEncrypted,
      if (storageType != null) 'StorageType': storageType,
      if (vpcSecurityGroups != null) 'VpcSecurityGroups': vpcSecurityGroups,
    };
  }
}

/// This data type represents the information you need to connect to an Amazon
/// Neptune DB cluster. This data type is used as a response element in the
/// following actions:
///
/// <ul>
/// <li>
/// <code>CreateDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DescribeDBClusterEndpoints</code>
/// </li>
/// <li>
/// <code>ModifyDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DeleteDBClusterEndpoint</code>
/// </li>
/// </ul>
/// For the data structure that represents Amazon Neptune DB instance endpoints,
/// see <code>Endpoint</code>.
class DBClusterEndpoint {
  /// The type associated with a custom endpoint. One of: <code>READER</code>,
  /// <code>WRITER</code>, <code>ANY</code>.
  final String? customEndpointType;

  /// The Amazon Resource Name (ARN) for the endpoint.
  final String? dBClusterEndpointArn;

  /// The identifier associated with the endpoint. This parameter is stored as a
  /// lowercase string.
  final String? dBClusterEndpointIdentifier;

  /// A unique system-generated identifier for an endpoint. It remains the same
  /// for the whole life of the endpoint.
  final String? dBClusterEndpointResourceIdentifier;

  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  final String? dBClusterIdentifier;

  /// The DNS address of the endpoint.
  final String? endpoint;

  /// The type of the endpoint. One of: <code>READER</code>, <code>WRITER</code>,
  /// <code>CUSTOM</code>.
  final String? endpointType;

  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  final List<String>? excludedMembers;

  /// List of DB instance identifiers that are part of the custom endpoint group.
  final List<String>? staticMembers;

  /// The current status of the endpoint. One of: <code>creating</code>,
  /// <code>available</code>, <code>deleting</code>, <code>inactive</code>,
  /// <code>modifying</code>. The <code>inactive</code> state applies to an
  /// endpoint that cannot be used for a certain kind of cluster, such as a
  /// <code>writer</code> endpoint for a read-only secondary cluster in a global
  /// database.
  final String? status;

  DBClusterEndpoint({
    this.customEndpointType,
    this.dBClusterEndpointArn,
    this.dBClusterEndpointIdentifier,
    this.dBClusterEndpointResourceIdentifier,
    this.dBClusterIdentifier,
    this.endpoint,
    this.endpointType,
    this.excludedMembers,
    this.staticMembers,
    this.status,
  });
  factory DBClusterEndpoint.fromXml(_s.XmlElement elem) {
    return DBClusterEndpoint(
      customEndpointType: _s.extractXmlStringValue(elem, 'CustomEndpointType'),
      dBClusterEndpointArn:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointArn'),
      dBClusterEndpointIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointIdentifier'),
      dBClusterEndpointResourceIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointResourceIdentifier'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      endpointType: _s.extractXmlStringValue(elem, 'EndpointType'),
      excludedMembers: _s
          .extractXmlChild(elem, 'ExcludedMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      staticMembers: _s
          .extractXmlChild(elem, 'StaticMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final customEndpointType = this.customEndpointType;
    final dBClusterEndpointArn = this.dBClusterEndpointArn;
    final dBClusterEndpointIdentifier = this.dBClusterEndpointIdentifier;
    final dBClusterEndpointResourceIdentifier =
        this.dBClusterEndpointResourceIdentifier;
    final dBClusterIdentifier = this.dBClusterIdentifier;
    final endpoint = this.endpoint;
    final endpointType = this.endpointType;
    final excludedMembers = this.excludedMembers;
    final staticMembers = this.staticMembers;
    final status = this.status;
    return {
      if (customEndpointType != null) 'CustomEndpointType': customEndpointType,
      if (dBClusterEndpointArn != null)
        'DBClusterEndpointArn': dBClusterEndpointArn,
      if (dBClusterEndpointIdentifier != null)
        'DBClusterEndpointIdentifier': dBClusterEndpointIdentifier,
      if (dBClusterEndpointResourceIdentifier != null)
        'DBClusterEndpointResourceIdentifier':
            dBClusterEndpointResourceIdentifier,
      if (dBClusterIdentifier != null)
        'DBClusterIdentifier': dBClusterIdentifier,
      if (endpoint != null) 'Endpoint': endpoint,
      if (endpointType != null) 'EndpointType': endpointType,
      if (excludedMembers != null) 'ExcludedMembers': excludedMembers,
      if (staticMembers != null) 'StaticMembers': staticMembers,
      if (status != null) 'Status': status,
    };
  }
}

class DBClusterEndpointMessage {
  /// Contains the details of the endpoints associated with the cluster and
  /// matching any filter conditions.
  final List<DBClusterEndpoint>? dBClusterEndpoints;

  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterEndpoints</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  final String? marker;

  DBClusterEndpointMessage({
    this.dBClusterEndpoints,
    this.marker,
  });
  factory DBClusterEndpointMessage.fromXml(_s.XmlElement elem) {
    return DBClusterEndpointMessage(
      dBClusterEndpoints: _s.extractXmlChild(elem, 'DBClusterEndpoints')?.let(
          (elem) => elem
              .findElements('DBClusterEndpointList')
              .map(DBClusterEndpoint.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterEndpoints = this.dBClusterEndpoints;
    final marker = this.marker;
    return {
      if (dBClusterEndpoints != null) 'DBClusterEndpoints': dBClusterEndpoints,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains information about an instance that is part of a DB cluster.
class DBClusterMember {
  /// Specifies the status of the DB cluster parameter group for this member of
  /// the DB cluster.
  final String? dBClusterParameterGroupStatus;

  /// Specifies the instance identifier for this member of the DB cluster.
  final String? dBInstanceIdentifier;

  /// Value that is <code>true</code> if the cluster member is the primary
  /// instance for the DB cluster and <code>false</code> otherwise.
  final bool? isClusterWriter;

  /// A value that specifies the order in which a Read Replica is promoted to the
  /// primary instance after a failure of the existing primary instance.
  final int? promotionTier;

  DBClusterMember({
    this.dBClusterParameterGroupStatus,
    this.dBInstanceIdentifier,
    this.isClusterWriter,
    this.promotionTier,
  });
  factory DBClusterMember.fromXml(_s.XmlElement elem) {
    return DBClusterMember(
      dBClusterParameterGroupStatus:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroupStatus'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      isClusterWriter: _s.extractXmlBoolValue(elem, 'IsClusterWriter'),
      promotionTier: _s.extractXmlIntValue(elem, 'PromotionTier'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterParameterGroupStatus = this.dBClusterParameterGroupStatus;
    final dBInstanceIdentifier = this.dBInstanceIdentifier;
    final isClusterWriter = this.isClusterWriter;
    final promotionTier = this.promotionTier;
    return {
      if (dBClusterParameterGroupStatus != null)
        'DBClusterParameterGroupStatus': dBClusterParameterGroupStatus,
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (isClusterWriter != null) 'IsClusterWriter': isClusterWriter,
      if (promotionTier != null) 'PromotionTier': promotionTier,
    };
  }
}

class DBClusterMessage {
  /// Contains a list of DB clusters for the user.
  final List<DBCluster>? dBClusters;

  /// A pagination token that can be used in a subsequent DescribeDBClusters
  /// request.
  final String? marker;

  DBClusterMessage({
    this.dBClusters,
    this.marker,
  });
  factory DBClusterMessage.fromXml(_s.XmlElement elem) {
    return DBClusterMessage(
      dBClusters: _s.extractXmlChild(elem, 'DBClusters')?.let((elem) =>
          elem.findElements('DBCluster').map(DBCluster.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusters = this.dBClusters;
    final marker = this.marker;
    return {
      if (dBClusters != null) 'DBClusters': dBClusters,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Not supported by Neptune.
class DBClusterOptionGroupStatus {
  /// Not supported by Neptune.
  final String? dBClusterOptionGroupName;

  /// Not supported by Neptune.
  final String? status;

  DBClusterOptionGroupStatus({
    this.dBClusterOptionGroupName,
    this.status,
  });
  factory DBClusterOptionGroupStatus.fromXml(_s.XmlElement elem) {
    return DBClusterOptionGroupStatus(
      dBClusterOptionGroupName:
          _s.extractXmlStringValue(elem, 'DBClusterOptionGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterOptionGroupName = this.dBClusterOptionGroupName;
    final status = this.status;
    return {
      if (dBClusterOptionGroupName != null)
        'DBClusterOptionGroupName': dBClusterOptionGroupName,
      if (status != null) 'Status': status,
    };
  }
}

/// Contains the details of an Amazon Neptune DB cluster parameter group.
///
/// This data type is used as a response element in the
/// <a>DescribeDBClusterParameterGroups</a> action.
class DBClusterParameterGroup {
  /// The Amazon Resource Name (ARN) for the DB cluster parameter group.
  final String? dBClusterParameterGroupArn;

  /// Provides the name of the DB cluster parameter group.
  final String? dBClusterParameterGroupName;

  /// Provides the name of the DB parameter group family that this DB cluster
  /// parameter group is compatible with.
  final String? dBParameterGroupFamily;

  /// Provides the customer-specified description for this DB cluster parameter
  /// group.
  final String? description;

  DBClusterParameterGroup({
    this.dBClusterParameterGroupArn,
    this.dBClusterParameterGroupName,
    this.dBParameterGroupFamily,
    this.description,
  });
  factory DBClusterParameterGroup.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroup(
      dBClusterParameterGroupArn:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroupArn'),
      dBClusterParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroupName'),
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterParameterGroupArn = this.dBClusterParameterGroupArn;
    final dBClusterParameterGroupName = this.dBClusterParameterGroupName;
    final dBParameterGroupFamily = this.dBParameterGroupFamily;
    final description = this.description;
    return {
      if (dBClusterParameterGroupArn != null)
        'DBClusterParameterGroupArn': dBClusterParameterGroupArn,
      if (dBClusterParameterGroupName != null)
        'DBClusterParameterGroupName': dBClusterParameterGroupName,
      if (dBParameterGroupFamily != null)
        'DBParameterGroupFamily': dBParameterGroupFamily,
      if (description != null) 'Description': description,
    };
  }
}

class DBClusterParameterGroupDetails {
  /// An optional pagination token provided by a previous
  /// DescribeDBClusterParameters request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value specified
  /// by <code>MaxRecords</code> .
  final String? marker;

  /// Provides a list of parameters for the DB cluster parameter group.
  final List<Parameter>? parameters;

  DBClusterParameterGroupDetails({
    this.marker,
    this.parameters,
  });
  factory DBClusterParameterGroupDetails.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroupDetails(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('Parameter').map(Parameter.fromXml).toList()),
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

class DBClusterParameterGroupNameMessage {
  /// The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 letters or numbers.
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul> <note>
  /// This value is stored as a lowercase string.
  /// </note>
  final String? dBClusterParameterGroupName;

  DBClusterParameterGroupNameMessage({
    this.dBClusterParameterGroupName,
  });
  factory DBClusterParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroupNameMessage(
      dBClusterParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroupName'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterParameterGroupName = this.dBClusterParameterGroupName;
    return {
      if (dBClusterParameterGroupName != null)
        'DBClusterParameterGroupName': dBClusterParameterGroupName,
    };
  }
}

class DBClusterParameterGroupsMessage {
  /// A list of DB cluster parameter groups.
  final List<DBClusterParameterGroup>? dBClusterParameterGroups;

  /// An optional pagination token provided by a previous
  /// <code>DescribeDBClusterParameterGroups</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by <code>MaxRecords</code>.
  final String? marker;

  DBClusterParameterGroupsMessage({
    this.dBClusterParameterGroups,
    this.marker,
  });
  factory DBClusterParameterGroupsMessage.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroupsMessage(
      dBClusterParameterGroups: _s
          .extractXmlChild(elem, 'DBClusterParameterGroups')
          ?.let((elem) => elem
              .findElements('DBClusterParameterGroup')
              .map(DBClusterParameterGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterParameterGroups = this.dBClusterParameterGroups;
    final marker = this.marker;
    return {
      if (dBClusterParameterGroups != null)
        'DBClusterParameterGroups': dBClusterParameterGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Describes an Amazon Identity and Access Management (IAM) role that is
/// associated with a DB cluster.
class DBClusterRole {
  /// The name of the feature associated with the Amazon Identity and Access
  /// Management (IAM) role. For the list of supported feature names, see
  /// <a>DescribeDBEngineVersions</a>.
  final String? featureName;

  /// The Amazon Resource Name (ARN) of the IAM role that is associated with the
  /// DB cluster.
  final String? roleArn;

  /// Describes the state of association between the IAM role and the DB cluster.
  /// The Status property returns one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - the IAM role ARN is associated with the DB cluster and
  /// can be used to access other Amazon services on your behalf.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - the IAM role ARN is being associated with the DB
  /// cluster.
  /// </li>
  /// <li>
  /// <code>INVALID</code> - the IAM role ARN is associated with the DB cluster,
  /// but the DB cluster is unable to assume the IAM role in order to access other
  /// Amazon services on your behalf.
  /// </li>
  /// </ul>
  final String? status;

  DBClusterRole({
    this.featureName,
    this.roleArn,
    this.status,
  });
  factory DBClusterRole.fromXml(_s.XmlElement elem) {
    return DBClusterRole(
      featureName: _s.extractXmlStringValue(elem, 'FeatureName'),
      roleArn: _s.extractXmlStringValue(elem, 'RoleArn'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final featureName = this.featureName;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (featureName != null) 'FeatureName': featureName,
      if (roleArn != null) 'RoleArn': roleArn,
      if (status != null) 'Status': status,
    };
  }
}

/// Contains the details for an Amazon Neptune DB cluster snapshot
///
/// This data type is used as a response element in the
/// <a>DescribeDBClusterSnapshots</a> action.
class DBClusterSnapshot {
  /// Specifies the allocated storage size in gibibytes (GiB).
  final int? allocatedStorage;

  /// Provides the list of EC2 Availability Zones that instances in the DB cluster
  /// snapshot can be restored in.
  final List<String>? availabilityZones;

  /// Specifies the time when the DB cluster was created, in Universal Coordinated
  /// Time (UTC).
  final DateTime? clusterCreateTime;

  /// Specifies the DB cluster identifier of the DB cluster that this DB cluster
  /// snapshot was created from.
  final String? dBClusterIdentifier;

  /// The Amazon Resource Name (ARN) for the DB cluster snapshot.
  final String? dBClusterSnapshotArn;

  /// Specifies the identifier for a DB cluster snapshot. Must match the
  /// identifier of an existing snapshot.
  ///
  /// After you restore a DB cluster using a
  /// <code>DBClusterSnapshotIdentifier</code>, you must specify the same
  /// <code>DBClusterSnapshotIdentifier</code> for any future updates to the DB
  /// cluster. When you specify this property for an update, the DB cluster is not
  /// restored from the snapshot again, and the data in the database is not
  /// changed.
  ///
  /// However, if you don't specify the <code>DBClusterSnapshotIdentifier</code>,
  /// an empty DB cluster is created, and the original DB cluster is deleted. If
  /// you specify a property that is different from the previous snapshot restore
  /// property, the DB cluster is restored from the snapshot specified by the
  /// <code>DBClusterSnapshotIdentifier</code>, and the original DB cluster is
  /// deleted.
  final String? dBClusterSnapshotIdentifier;

  /// Specifies the name of the database engine.
  final String? engine;

  /// Provides the version of the database engine for this DB cluster snapshot.
  final String? engineVersion;

  /// True if mapping of Amazon Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// If <code>StorageEncrypted</code> is true, the Amazon KMS key identifier for
  /// the encrypted DB cluster snapshot.
  final String? kmsKeyId;

  /// Provides the license model information for this DB cluster snapshot.
  final String? licenseModel;

  /// Not supported by Neptune.
  final String? masterUsername;

  /// Specifies the percentage of the estimated data that has been transferred.
  final int? percentProgress;

  /// Specifies the port that the DB cluster was listening on at the time of the
  /// snapshot.
  final int? port;

  /// Provides the time when the snapshot was taken, in Universal Coordinated Time
  /// (UTC).
  final DateTime? snapshotCreateTime;

  /// Provides the type of the DB cluster snapshot.
  final String? snapshotType;

  /// If the DB cluster snapshot was copied from a source DB cluster snapshot, the
  /// Amazon Resource Name (ARN) for the source DB cluster snapshot, otherwise, a
  /// null value.
  final String? sourceDBClusterSnapshotArn;

  /// Specifies the status of this DB cluster snapshot.
  final String? status;

  /// Specifies whether the DB cluster snapshot is encrypted.
  final bool? storageEncrypted;

  /// The storage type associated with the DB cluster snapshot.
  final String? storageType;

  /// Provides the VPC ID associated with the DB cluster snapshot.
  final String? vpcId;

  DBClusterSnapshot({
    this.allocatedStorage,
    this.availabilityZones,
    this.clusterCreateTime,
    this.dBClusterIdentifier,
    this.dBClusterSnapshotArn,
    this.dBClusterSnapshotIdentifier,
    this.engine,
    this.engineVersion,
    this.iAMDatabaseAuthenticationEnabled,
    this.kmsKeyId,
    this.licenseModel,
    this.masterUsername,
    this.percentProgress,
    this.port,
    this.snapshotCreateTime,
    this.snapshotType,
    this.sourceDBClusterSnapshotArn,
    this.status,
    this.storageEncrypted,
    this.storageType,
    this.vpcId,
  });
  factory DBClusterSnapshot.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshot(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AvailabilityZone')),
      clusterCreateTime: _s.extractXmlDateTimeValue(elem, 'ClusterCreateTime'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      dBClusterSnapshotArn:
          _s.extractXmlStringValue(elem, 'DBClusterSnapshotArn'),
      dBClusterSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterSnapshotIdentifier'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      percentProgress: _s.extractXmlIntValue(elem, 'PercentProgress'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      snapshotCreateTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotCreateTime'),
      snapshotType: _s.extractXmlStringValue(elem, 'SnapshotType'),
      sourceDBClusterSnapshotArn:
          _s.extractXmlStringValue(elem, 'SourceDBClusterSnapshotArn'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final availabilityZones = this.availabilityZones;
    final clusterCreateTime = this.clusterCreateTime;
    final dBClusterIdentifier = this.dBClusterIdentifier;
    final dBClusterSnapshotArn = this.dBClusterSnapshotArn;
    final dBClusterSnapshotIdentifier = this.dBClusterSnapshotIdentifier;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final iAMDatabaseAuthenticationEnabled =
        this.iAMDatabaseAuthenticationEnabled;
    final kmsKeyId = this.kmsKeyId;
    final licenseModel = this.licenseModel;
    final masterUsername = this.masterUsername;
    final percentProgress = this.percentProgress;
    final port = this.port;
    final snapshotCreateTime = this.snapshotCreateTime;
    final snapshotType = this.snapshotType;
    final sourceDBClusterSnapshotArn = this.sourceDBClusterSnapshotArn;
    final status = this.status;
    final storageEncrypted = this.storageEncrypted;
    final storageType = this.storageType;
    final vpcId = this.vpcId;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (clusterCreateTime != null)
        'ClusterCreateTime': iso8601ToJson(clusterCreateTime),
      if (dBClusterIdentifier != null)
        'DBClusterIdentifier': dBClusterIdentifier,
      if (dBClusterSnapshotArn != null)
        'DBClusterSnapshotArn': dBClusterSnapshotArn,
      if (dBClusterSnapshotIdentifier != null)
        'DBClusterSnapshotIdentifier': dBClusterSnapshotIdentifier,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iAMDatabaseAuthenticationEnabled != null)
        'IAMDatabaseAuthenticationEnabled': iAMDatabaseAuthenticationEnabled,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (percentProgress != null) 'PercentProgress': percentProgress,
      if (port != null) 'Port': port,
      if (snapshotCreateTime != null)
        'SnapshotCreateTime': iso8601ToJson(snapshotCreateTime),
      if (snapshotType != null) 'SnapshotType': snapshotType,
      if (sourceDBClusterSnapshotArn != null)
        'SourceDBClusterSnapshotArn': sourceDBClusterSnapshotArn,
      if (status != null) 'Status': status,
      if (storageEncrypted != null) 'StorageEncrypted': storageEncrypted,
      if (storageType != null) 'StorageType': storageType,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Contains the name and values of a manual DB cluster snapshot attribute.
///
/// Manual DB cluster snapshot attributes are used to authorize other Amazon
/// accounts to restore a manual DB cluster snapshot. For more information, see
/// the <a>ModifyDBClusterSnapshotAttribute</a> API action.
class DBClusterSnapshotAttribute {
  /// The name of the manual DB cluster snapshot attribute.
  ///
  /// The attribute named <code>restore</code> refers to the list of Amazon
  /// accounts that have permission to copy or restore the manual DB cluster
  /// snapshot. For more information, see the
  /// <a>ModifyDBClusterSnapshotAttribute</a> API action.
  final String? attributeName;

  /// The value(s) for the manual DB cluster snapshot attribute.
  ///
  /// If the <code>AttributeName</code> field is set to <code>restore</code>, then
  /// this element returns a list of IDs of the Amazon accounts that are
  /// authorized to copy or restore the manual DB cluster snapshot. If a value of
  /// <code>all</code> is in the list, then the manual DB cluster snapshot is
  /// public and available for any Amazon account to copy or restore.
  final List<String>? attributeValues;

  DBClusterSnapshotAttribute({
    this.attributeName,
    this.attributeValues,
  });
  factory DBClusterSnapshotAttribute.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshotAttribute(
      attributeName: _s.extractXmlStringValue(elem, 'AttributeName'),
      attributeValues: _s.extractXmlChild(elem, 'AttributeValues')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AttributeValue')),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeValues = this.attributeValues;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (attributeValues != null) 'AttributeValues': attributeValues,
    };
  }
}

/// Contains the results of a successful call to the
/// <a>DescribeDBClusterSnapshotAttributes</a> API action.
///
/// Manual DB cluster snapshot attributes are used to authorize other Amazon
/// accounts to copy or restore a manual DB cluster snapshot. For more
/// information, see the <a>ModifyDBClusterSnapshotAttribute</a> API action.
class DBClusterSnapshotAttributesResult {
  /// The list of attributes and values for the manual DB cluster snapshot.
  final List<DBClusterSnapshotAttribute>? dBClusterSnapshotAttributes;

  /// The identifier of the manual DB cluster snapshot that the attributes apply
  /// to.
  final String? dBClusterSnapshotIdentifier;

  DBClusterSnapshotAttributesResult({
    this.dBClusterSnapshotAttributes,
    this.dBClusterSnapshotIdentifier,
  });
  factory DBClusterSnapshotAttributesResult.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshotAttributesResult(
      dBClusterSnapshotAttributes: _s
          .extractXmlChild(elem, 'DBClusterSnapshotAttributes')
          ?.let((elem) => elem
              .findElements('DBClusterSnapshotAttribute')
              .map(DBClusterSnapshotAttribute.fromXml)
              .toList()),
      dBClusterSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterSnapshotIdentifier'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterSnapshotAttributes = this.dBClusterSnapshotAttributes;
    final dBClusterSnapshotIdentifier = this.dBClusterSnapshotIdentifier;
    return {
      if (dBClusterSnapshotAttributes != null)
        'DBClusterSnapshotAttributes': dBClusterSnapshotAttributes,
      if (dBClusterSnapshotIdentifier != null)
        'DBClusterSnapshotIdentifier': dBClusterSnapshotIdentifier,
    };
  }
}

class DBClusterSnapshotMessage {
  /// Provides a list of DB cluster snapshots for the user.
  final List<DBClusterSnapshot>? dBClusterSnapshots;

  /// An optional pagination token provided by a previous
  /// <a>DescribeDBClusterSnapshots</a> request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String? marker;

  DBClusterSnapshotMessage({
    this.dBClusterSnapshots,
    this.marker,
  });
  factory DBClusterSnapshotMessage.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshotMessage(
      dBClusterSnapshots: _s.extractXmlChild(elem, 'DBClusterSnapshots')?.let(
          (elem) => elem
              .findElements('DBClusterSnapshot')
              .map(DBClusterSnapshot.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterSnapshots = this.dBClusterSnapshots;
    final marker = this.marker;
    return {
      if (dBClusterSnapshots != null) 'DBClusterSnapshots': dBClusterSnapshots,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// This data type is used as a response element in the action
/// <a>DescribeDBEngineVersions</a>.
class DBEngineVersion {
  /// The description of the database engine.
  final String? dBEngineDescription;

  /// The description of the database engine version.
  final String? dBEngineVersionDescription;

  /// The name of the DB parameter group family for the database engine.
  final String? dBParameterGroupFamily;

  /// <i>(Not supported by Neptune)</i>
  final CharacterSet? defaultCharacterSet;

  /// The name of the database engine.
  final String? engine;

  /// The version number of the database engine.
  final String? engineVersion;

  /// The types of logs that the database engine has available for export to
  /// CloudWatch Logs.
  final List<String>? exportableLogTypes;

  /// <i>(Not supported by Neptune)</i>
  final List<CharacterSet>? supportedCharacterSets;

  /// A list of the time zones supported by this engine for the
  /// <code>Timezone</code> parameter of the <code>CreateDBInstance</code> action.
  final List<Timezone>? supportedTimezones;

  /// A value that indicates whether you can use Aurora global databases with a
  /// specific DB engine version.
  final bool? supportsGlobalDatabases;

  /// A value that indicates whether the engine version supports exporting the log
  /// types specified by ExportableLogTypes to CloudWatch Logs.
  final bool? supportsLogExportsToCloudwatchLogs;

  /// Indicates whether the database engine version supports read replicas.
  final bool? supportsReadReplica;

  /// A list of engine versions that this database engine version can be upgraded
  /// to.
  final List<UpgradeTarget>? validUpgradeTarget;

  DBEngineVersion({
    this.dBEngineDescription,
    this.dBEngineVersionDescription,
    this.dBParameterGroupFamily,
    this.defaultCharacterSet,
    this.engine,
    this.engineVersion,
    this.exportableLogTypes,
    this.supportedCharacterSets,
    this.supportedTimezones,
    this.supportsGlobalDatabases,
    this.supportsLogExportsToCloudwatchLogs,
    this.supportsReadReplica,
    this.validUpgradeTarget,
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
      exportableLogTypes: _s
          .extractXmlChild(elem, 'ExportableLogTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      supportedCharacterSets: _s
          .extractXmlChild(elem, 'SupportedCharacterSets')
          ?.let((elem) => elem
              .findElements('CharacterSet')
              .map(CharacterSet.fromXml)
              .toList()),
      supportedTimezones: _s.extractXmlChild(elem, 'SupportedTimezones')?.let(
          (elem) =>
              elem.findElements('Timezone').map(Timezone.fromXml).toList()),
      supportsGlobalDatabases:
          _s.extractXmlBoolValue(elem, 'SupportsGlobalDatabases'),
      supportsLogExportsToCloudwatchLogs:
          _s.extractXmlBoolValue(elem, 'SupportsLogExportsToCloudwatchLogs'),
      supportsReadReplica: _s.extractXmlBoolValue(elem, 'SupportsReadReplica'),
      validUpgradeTarget: _s.extractXmlChild(elem, 'ValidUpgradeTarget')?.let(
          (elem) => elem
              .findElements('UpgradeTarget')
              .map(UpgradeTarget.fromXml)
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
    final exportableLogTypes = this.exportableLogTypes;
    final supportedCharacterSets = this.supportedCharacterSets;
    final supportedTimezones = this.supportedTimezones;
    final supportsGlobalDatabases = this.supportsGlobalDatabases;
    final supportsLogExportsToCloudwatchLogs =
        this.supportsLogExportsToCloudwatchLogs;
    final supportsReadReplica = this.supportsReadReplica;
    final validUpgradeTarget = this.validUpgradeTarget;
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
      if (exportableLogTypes != null) 'ExportableLogTypes': exportableLogTypes,
      if (supportedCharacterSets != null)
        'SupportedCharacterSets': supportedCharacterSets,
      if (supportedTimezones != null) 'SupportedTimezones': supportedTimezones,
      if (supportsGlobalDatabases != null)
        'SupportsGlobalDatabases': supportsGlobalDatabases,
      if (supportsLogExportsToCloudwatchLogs != null)
        'SupportsLogExportsToCloudwatchLogs':
            supportsLogExportsToCloudwatchLogs,
      if (supportsReadReplica != null)
        'SupportsReadReplica': supportsReadReplica,
      if (validUpgradeTarget != null) 'ValidUpgradeTarget': validUpgradeTarget,
    };
  }
}

class DBEngineVersionMessage {
  /// A list of <code>DBEngineVersion</code> elements.
  final List<DBEngineVersion>? dBEngineVersions;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
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

  Map<String, dynamic> toJson() {
    final dBEngineVersions = this.dBEngineVersions;
    final marker = this.marker;
    return {
      if (dBEngineVersions != null) 'DBEngineVersions': dBEngineVersions,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the details of an Amazon Neptune DB instance.
///
/// This data type is used as a response element in the
/// <a>DescribeDBInstances</a> action.
class DBInstance {
  /// Not supported by Neptune.
  final int? allocatedStorage;

  /// Indicates that minor version patches are applied automatically.
  final bool? autoMinorVersionUpgrade;

  /// Specifies the name of the Availability Zone the DB instance is located in.
  final String? availabilityZone;

  /// Specifies the number of days for which automatic DB snapshots are retained.
  final int? backupRetentionPeriod;

  /// The identifier of the CA certificate for this DB instance.
  final String? cACertificateIdentifier;

  /// <i>(Not supported by Neptune)</i>
  final String? characterSetName;

  /// Specifies whether tags are copied from the DB instance to snapshots of the
  /// DB instance.
  final bool? copyTagsToSnapshot;

  /// If the DB instance is a member of a DB cluster, contains the name of the DB
  /// cluster that the DB instance is a member of.
  final String? dBClusterIdentifier;

  /// The Amazon Resource Name (ARN) for the DB instance.
  final String? dBInstanceArn;

  /// Contains the name of the compute and memory capacity class of the DB
  /// instance.
  final String? dBInstanceClass;

  /// Contains a user-supplied database identifier. This identifier is the unique
  /// key that identifies a DB instance.
  final String? dBInstanceIdentifier;

  /// Specifies the current state of this database.
  final String? dBInstanceStatus;

  /// The database name.
  final String? dBName;

  /// Provides the list of DB parameter groups applied to this DB instance.
  final List<DBParameterGroupStatus>? dBParameterGroups;

  /// Provides List of DB security group elements containing only
  /// <code>DBSecurityGroup.Name</code> and <code>DBSecurityGroup.Status</code>
  /// subelements.
  final List<DBSecurityGroupMembership>? dBSecurityGroups;

  /// Specifies information on the subnet group associated with the DB instance,
  /// including the name, description, and subnets in the subnet group.
  final DBSubnetGroup? dBSubnetGroup;

  /// Specifies the port that the DB instance listens on. If the DB instance is
  /// part of a DB cluster, this can be a different port than the DB cluster port.
  final int? dbInstancePort;

  /// The Amazon Region-unique, immutable identifier for the DB instance. This
  /// identifier is found in Amazon CloudTrail log entries whenever the Amazon KMS
  /// key for the DB instance is accessed.
  final String? dbiResourceId;

  /// Indicates whether or not the DB instance has deletion protection enabled.
  /// The instance can't be deleted when deletion protection is enabled. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-instances-delete.html">Deleting
  /// a DB Instance</a>.
  final bool? deletionProtection;

  /// Not supported
  final List<DomainMembership>? domainMemberships;

  /// A list of log types that this DB instance is configured to export to
  /// CloudWatch Logs.
  final List<String>? enabledCloudwatchLogsExports;

  /// Specifies the connection endpoint.
  final Endpoint? endpoint;

  /// Provides the name of the database engine to be used for this DB instance.
  final String? engine;

  /// Indicates the database engine version.
  final String? engineVersion;

  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log stream that
  /// receives the Enhanced Monitoring metrics data for the DB instance.
  final String? enhancedMonitoringResourceArn;

  /// True if Amazon Identity and Access Management (IAM) authentication is
  /// enabled, and otherwise false.
  final bool? iAMDatabaseAuthenticationEnabled;

  /// Provides the date and time the DB instance was created.
  final DateTime? instanceCreateTime;

  /// Specifies the Provisioned IOPS (I/O operations per second) value.
  final int? iops;

  /// Not supported: The encryption for DB instances is managed by the DB cluster.
  final String? kmsKeyId;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime? latestRestorableTime;

  /// License model information for this DB instance.
  final String? licenseModel;

  /// Not supported by Neptune.
  final String? masterUsername;

  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the DB instance.
  final int? monitoringInterval;

  /// The ARN for the IAM role that permits Neptune to send Enhanced Monitoring
  /// metrics to Amazon CloudWatch Logs.
  final String? monitoringRoleArn;

  /// Specifies if the DB instance is a Multi-AZ deployment.
  final bool? multiAZ;

  /// <i>(Not supported by Neptune)</i>
  final List<OptionGroupMembership>? optionGroupMemberships;

  /// Specifies that changes to the DB instance are pending. This element is only
  /// included when changes are pending. Specific changes are identified by
  /// subelements.
  final PendingModifiedValues? pendingModifiedValues;

  /// <i>(Not supported by Neptune)</i>
  final bool? performanceInsightsEnabled;

  /// <i>(Not supported by Neptune)</i>
  final String? performanceInsightsKMSKeyId;

  /// Specifies the daily time range during which automated backups are created if
  /// automated backups are enabled, as determined by the
  /// <code>BackupRetentionPeriod</code>.
  final String? preferredBackupWindow;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String? preferredMaintenanceWindow;

  /// A value that specifies the order in which a Read Replica is promoted to the
  /// primary instance after a failure of the existing primary instance.
  final int? promotionTier;

  /// This flag should no longer be used.
  final bool? publiclyAccessible;

  /// Contains one or more identifiers of DB clusters that are Read Replicas of
  /// this DB instance.
  final List<String>? readReplicaDBClusterIdentifiers;

  /// Contains one or more identifiers of the Read Replicas associated with this
  /// DB instance.
  final List<String>? readReplicaDBInstanceIdentifiers;

  /// Contains the identifier of the source DB instance if this DB instance is a
  /// Read Replica.
  final String? readReplicaSourceDBInstanceIdentifier;

  /// If present, specifies the name of the secondary Availability Zone for a DB
  /// instance with multi-AZ support.
  final String? secondaryAvailabilityZone;

  /// The status of a Read Replica. If the instance is not a Read Replica, this is
  /// blank.
  final List<DBInstanceStatusInfo>? statusInfos;

  /// Not supported: The encryption for DB instances is managed by the DB cluster.
  final bool? storageEncrypted;

  /// Specifies the storage type associated with DB instance.
  final String? storageType;

  /// The ARN from the key store with which the instance is associated for TDE
  /// encryption.
  final String? tdeCredentialArn;

  /// Not supported.
  final String? timezone;

  /// Provides a list of VPC security group elements that the DB instance belongs
  /// to.
  final List<VpcSecurityGroupMembership>? vpcSecurityGroups;

  DBInstance({
    this.allocatedStorage,
    this.autoMinorVersionUpgrade,
    this.availabilityZone,
    this.backupRetentionPeriod,
    this.cACertificateIdentifier,
    this.characterSetName,
    this.copyTagsToSnapshot,
    this.dBClusterIdentifier,
    this.dBInstanceArn,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.dBInstanceStatus,
    this.dBName,
    this.dBParameterGroups,
    this.dBSecurityGroups,
    this.dBSubnetGroup,
    this.dbInstancePort,
    this.dbiResourceId,
    this.deletionProtection,
    this.domainMemberships,
    this.enabledCloudwatchLogsExports,
    this.endpoint,
    this.engine,
    this.engineVersion,
    this.enhancedMonitoringResourceArn,
    this.iAMDatabaseAuthenticationEnabled,
    this.instanceCreateTime,
    this.iops,
    this.kmsKeyId,
    this.latestRestorableTime,
    this.licenseModel,
    this.masterUsername,
    this.monitoringInterval,
    this.monitoringRoleArn,
    this.multiAZ,
    this.optionGroupMemberships,
    this.pendingModifiedValues,
    this.performanceInsightsEnabled,
    this.performanceInsightsKMSKeyId,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.promotionTier,
    this.publiclyAccessible,
    this.readReplicaDBClusterIdentifiers,
    this.readReplicaDBInstanceIdentifiers,
    this.readReplicaSourceDBInstanceIdentifier,
    this.secondaryAvailabilityZone,
    this.statusInfos,
    this.storageEncrypted,
    this.storageType,
    this.tdeCredentialArn,
    this.timezone,
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
      cACertificateIdentifier:
          _s.extractXmlStringValue(elem, 'CACertificateIdentifier'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
      copyTagsToSnapshot: _s.extractXmlBoolValue(elem, 'CopyTagsToSnapshot'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      dBInstanceArn: _s.extractXmlStringValue(elem, 'DBInstanceArn'),
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
      dbInstancePort: _s.extractXmlIntValue(elem, 'DbInstancePort'),
      dbiResourceId: _s.extractXmlStringValue(elem, 'DbiResourceId'),
      deletionProtection: _s.extractXmlBoolValue(elem, 'DeletionProtection'),
      domainMemberships: _s.extractXmlChild(elem, 'DomainMemberships')?.let(
          (elem) => elem
              .findElements('DomainMembership')
              .map(DomainMembership.fromXml)
              .toList()),
      enabledCloudwatchLogsExports: _s
          .extractXmlChild(elem, 'EnabledCloudwatchLogsExports')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      endpoint: _s.extractXmlChild(elem, 'Endpoint')?.let(Endpoint.fromXml),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      enhancedMonitoringResourceArn:
          _s.extractXmlStringValue(elem, 'EnhancedMonitoringResourceArn'),
      iAMDatabaseAuthenticationEnabled:
          _s.extractXmlBoolValue(elem, 'IAMDatabaseAuthenticationEnabled'),
      instanceCreateTime:
          _s.extractXmlDateTimeValue(elem, 'InstanceCreateTime'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      latestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'LatestRestorableTime'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      monitoringInterval: _s.extractXmlIntValue(elem, 'MonitoringInterval'),
      monitoringRoleArn: _s.extractXmlStringValue(elem, 'MonitoringRoleArn'),
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
      performanceInsightsEnabled:
          _s.extractXmlBoolValue(elem, 'PerformanceInsightsEnabled'),
      performanceInsightsKMSKeyId:
          _s.extractXmlStringValue(elem, 'PerformanceInsightsKMSKeyId'),
      preferredBackupWindow:
          _s.extractXmlStringValue(elem, 'PreferredBackupWindow'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      promotionTier: _s.extractXmlIntValue(elem, 'PromotionTier'),
      publiclyAccessible: _s.extractXmlBoolValue(elem, 'PubliclyAccessible'),
      readReplicaDBClusterIdentifiers: _s
          .extractXmlChild(elem, 'ReadReplicaDBClusterIdentifiers')
          ?.let((elem) => _s.extractXmlStringListValues(
              elem, 'ReadReplicaDBClusterIdentifier')),
      readReplicaDBInstanceIdentifiers: _s
          .extractXmlChild(elem, 'ReadReplicaDBInstanceIdentifiers')
          ?.let((elem) => _s.extractXmlStringListValues(
              elem, 'ReadReplicaDBInstanceIdentifier')),
      readReplicaSourceDBInstanceIdentifier: _s.extractXmlStringValue(
          elem, 'ReadReplicaSourceDBInstanceIdentifier'),
      secondaryAvailabilityZone:
          _s.extractXmlStringValue(elem, 'SecondaryAvailabilityZone'),
      statusInfos: _s.extractXmlChild(elem, 'StatusInfos')?.let((elem) => elem
          .findElements('DBInstanceStatusInfo')
          .map(DBInstanceStatusInfo.fromXml)
          .toList()),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
      tdeCredentialArn: _s.extractXmlStringValue(elem, 'TdeCredentialArn'),
      timezone: _s.extractXmlStringValue(elem, 'Timezone'),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map(VpcSecurityGroupMembership.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final availabilityZone = this.availabilityZone;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final cACertificateIdentifier = this.cACertificateIdentifier;
    final characterSetName = this.characterSetName;
    final copyTagsToSnapshot = this.copyTagsToSnapshot;
    final dBClusterIdentifier = this.dBClusterIdentifier;
    final dBInstanceArn = this.dBInstanceArn;
    final dBInstanceClass = this.dBInstanceClass;
    final dBInstanceIdentifier = this.dBInstanceIdentifier;
    final dBInstanceStatus = this.dBInstanceStatus;
    final dBName = this.dBName;
    final dBParameterGroups = this.dBParameterGroups;
    final dBSecurityGroups = this.dBSecurityGroups;
    final dBSubnetGroup = this.dBSubnetGroup;
    final dbInstancePort = this.dbInstancePort;
    final dbiResourceId = this.dbiResourceId;
    final deletionProtection = this.deletionProtection;
    final domainMemberships = this.domainMemberships;
    final enabledCloudwatchLogsExports = this.enabledCloudwatchLogsExports;
    final endpoint = this.endpoint;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final enhancedMonitoringResourceArn = this.enhancedMonitoringResourceArn;
    final iAMDatabaseAuthenticationEnabled =
        this.iAMDatabaseAuthenticationEnabled;
    final instanceCreateTime = this.instanceCreateTime;
    final iops = this.iops;
    final kmsKeyId = this.kmsKeyId;
    final latestRestorableTime = this.latestRestorableTime;
    final licenseModel = this.licenseModel;
    final masterUsername = this.masterUsername;
    final monitoringInterval = this.monitoringInterval;
    final monitoringRoleArn = this.monitoringRoleArn;
    final multiAZ = this.multiAZ;
    final optionGroupMemberships = this.optionGroupMemberships;
    final pendingModifiedValues = this.pendingModifiedValues;
    final performanceInsightsEnabled = this.performanceInsightsEnabled;
    final performanceInsightsKMSKeyId = this.performanceInsightsKMSKeyId;
    final preferredBackupWindow = this.preferredBackupWindow;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final promotionTier = this.promotionTier;
    final publiclyAccessible = this.publiclyAccessible;
    final readReplicaDBClusterIdentifiers =
        this.readReplicaDBClusterIdentifiers;
    final readReplicaDBInstanceIdentifiers =
        this.readReplicaDBInstanceIdentifiers;
    final readReplicaSourceDBInstanceIdentifier =
        this.readReplicaSourceDBInstanceIdentifier;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final statusInfos = this.statusInfos;
    final storageEncrypted = this.storageEncrypted;
    final storageType = this.storageType;
    final tdeCredentialArn = this.tdeCredentialArn;
    final timezone = this.timezone;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (cACertificateIdentifier != null)
        'CACertificateIdentifier': cACertificateIdentifier,
      if (characterSetName != null) 'CharacterSetName': characterSetName,
      if (copyTagsToSnapshot != null) 'CopyTagsToSnapshot': copyTagsToSnapshot,
      if (dBClusterIdentifier != null)
        'DBClusterIdentifier': dBClusterIdentifier,
      if (dBInstanceArn != null) 'DBInstanceArn': dBInstanceArn,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (dBInstanceStatus != null) 'DBInstanceStatus': dBInstanceStatus,
      if (dBName != null) 'DBName': dBName,
      if (dBParameterGroups != null) 'DBParameterGroups': dBParameterGroups,
      if (dBSecurityGroups != null) 'DBSecurityGroups': dBSecurityGroups,
      if (dBSubnetGroup != null) 'DBSubnetGroup': dBSubnetGroup,
      if (dbInstancePort != null) 'DbInstancePort': dbInstancePort,
      if (dbiResourceId != null) 'DbiResourceId': dbiResourceId,
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
      if (domainMemberships != null) 'DomainMemberships': domainMemberships,
      if (enabledCloudwatchLogsExports != null)
        'EnabledCloudwatchLogsExports': enabledCloudwatchLogsExports,
      if (endpoint != null) 'Endpoint': endpoint,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (enhancedMonitoringResourceArn != null)
        'EnhancedMonitoringResourceArn': enhancedMonitoringResourceArn,
      if (iAMDatabaseAuthenticationEnabled != null)
        'IAMDatabaseAuthenticationEnabled': iAMDatabaseAuthenticationEnabled,
      if (instanceCreateTime != null)
        'InstanceCreateTime': iso8601ToJson(instanceCreateTime),
      if (iops != null) 'Iops': iops,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (latestRestorableTime != null)
        'LatestRestorableTime': iso8601ToJson(latestRestorableTime),
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (monitoringInterval != null) 'MonitoringInterval': monitoringInterval,
      if (monitoringRoleArn != null) 'MonitoringRoleArn': monitoringRoleArn,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (optionGroupMemberships != null)
        'OptionGroupMemberships': optionGroupMemberships,
      if (pendingModifiedValues != null)
        'PendingModifiedValues': pendingModifiedValues,
      if (performanceInsightsEnabled != null)
        'PerformanceInsightsEnabled': performanceInsightsEnabled,
      if (performanceInsightsKMSKeyId != null)
        'PerformanceInsightsKMSKeyId': performanceInsightsKMSKeyId,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (promotionTier != null) 'PromotionTier': promotionTier,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (readReplicaDBClusterIdentifiers != null)
        'ReadReplicaDBClusterIdentifiers': readReplicaDBClusterIdentifiers,
      if (readReplicaDBInstanceIdentifiers != null)
        'ReadReplicaDBInstanceIdentifiers': readReplicaDBInstanceIdentifiers,
      if (readReplicaSourceDBInstanceIdentifier != null)
        'ReadReplicaSourceDBInstanceIdentifier':
            readReplicaSourceDBInstanceIdentifier,
      if (secondaryAvailabilityZone != null)
        'SecondaryAvailabilityZone': secondaryAvailabilityZone,
      if (statusInfos != null) 'StatusInfos': statusInfos,
      if (storageEncrypted != null) 'StorageEncrypted': storageEncrypted,
      if (storageType != null) 'StorageType': storageType,
      if (tdeCredentialArn != null) 'TdeCredentialArn': tdeCredentialArn,
      if (timezone != null) 'Timezone': timezone,
      if (vpcSecurityGroups != null) 'VpcSecurityGroups': vpcSecurityGroups,
    };
  }
}

class DBInstanceMessage {
  /// A list of <a>DBInstance</a> instances.
  final List<DBInstance>? dBInstances;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code> .
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

  Map<String, dynamic> toJson() {
    final dBInstances = this.dBInstances;
    final marker = this.marker;
    return {
      if (dBInstances != null) 'DBInstances': dBInstances,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Provides a list of status information for a DB instance.
class DBInstanceStatusInfo {
  /// Details of the error if there is an error for the instance. If the instance
  /// is not in an error state, this value is blank.
  final String? message;

  /// Boolean value that is true if the instance is operating normally, or false
  /// if the instance is in an error state.
  final bool? normal;

  /// Status of the DB instance. For a StatusType of read replica, the values can
  /// be replicating, error, stopped, or terminated.
  final String? status;

  /// This value is currently "read replication."
  final String? statusType;

  DBInstanceStatusInfo({
    this.message,
    this.normal,
    this.status,
    this.statusType,
  });
  factory DBInstanceStatusInfo.fromXml(_s.XmlElement elem) {
    return DBInstanceStatusInfo(
      message: _s.extractXmlStringValue(elem, 'Message'),
      normal: _s.extractXmlBoolValue(elem, 'Normal'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      statusType: _s.extractXmlStringValue(elem, 'StatusType'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final normal = this.normal;
    final status = this.status;
    final statusType = this.statusType;
    return {
      if (message != null) 'Message': message,
      if (normal != null) 'Normal': normal,
      if (status != null) 'Status': status,
      if (statusType != null) 'StatusType': statusType,
    };
  }
}

/// Contains the details of an Amazon Neptune DB parameter group.
///
/// This data type is used as a response element in the
/// <a>DescribeDBParameterGroups</a> action.
class DBParameterGroup {
  /// The Amazon Resource Name (ARN) for the DB parameter group.
  final String? dBParameterGroupArn;

  /// Provides the name of the DB parameter group family that this DB parameter
  /// group is compatible with.
  final String? dBParameterGroupFamily;

  /// Provides the name of the DB parameter group.
  final String? dBParameterGroupName;

  /// Provides the customer-specified description for this DB parameter group.
  final String? description;

  DBParameterGroup({
    this.dBParameterGroupArn,
    this.dBParameterGroupFamily,
    this.dBParameterGroupName,
    this.description,
  });
  factory DBParameterGroup.fromXml(_s.XmlElement elem) {
    return DBParameterGroup(
      dBParameterGroupArn:
          _s.extractXmlStringValue(elem, 'DBParameterGroupArn'),
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBParameterGroupArn = this.dBParameterGroupArn;
    final dBParameterGroupFamily = this.dBParameterGroupFamily;
    final dBParameterGroupName = this.dBParameterGroupName;
    final description = this.description;
    return {
      if (dBParameterGroupArn != null)
        'DBParameterGroupArn': dBParameterGroupArn,
      if (dBParameterGroupFamily != null)
        'DBParameterGroupFamily': dBParameterGroupFamily,
      if (dBParameterGroupName != null)
        'DBParameterGroupName': dBParameterGroupName,
      if (description != null) 'Description': description,
    };
  }
}

class DBParameterGroupDetails {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// A list of <a>Parameter</a> values.
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
  /// Provides the name of the DB parameter group.
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

  Map<String, dynamic> toJson() {
    final dBParameterGroupName = this.dBParameterGroupName;
    return {
      if (dBParameterGroupName != null)
        'DBParameterGroupName': dBParameterGroupName,
    };
  }
}

/// The status of the DB parameter group.
///
/// This data type is used as a response element in the following actions:
///
/// <ul>
/// <li>
/// <a>CreateDBInstance</a>
/// </li>
/// <li>
/// <a>DeleteDBInstance</a>
/// </li>
/// <li>
/// <a>ModifyDBInstance</a>
/// </li>
/// <li>
/// <a>RebootDBInstance</a>
/// </li>
/// </ul>
class DBParameterGroupStatus {
  /// The name of the DP parameter group.
  final String? dBParameterGroupName;

  /// The status of parameter updates.
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
  /// A list of <a>DBParameterGroup</a> instances.
  final List<DBParameterGroup>? dBParameterGroups;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
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

  Map<String, dynamic> toJson() {
    final dBParameterGroups = this.dBParameterGroups;
    final marker = this.marker;
    return {
      if (dBParameterGroups != null) 'DBParameterGroups': dBParameterGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Specifies membership in a designated DB security group.
class DBSecurityGroupMembership {
  /// The name of the DB security group.
  final String? dBSecurityGroupName;

  /// The status of the DB security group.
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

/// Contains the details of an Amazon Neptune DB subnet group.
///
/// This data type is used as a response element in the
/// <a>DescribeDBSubnetGroups</a> action.
class DBSubnetGroup {
  /// The Amazon Resource Name (ARN) for the DB subnet group.
  final String? dBSubnetGroupArn;

  /// Provides the description of the DB subnet group.
  final String? dBSubnetGroupDescription;

  /// The name of the DB subnet group.
  final String? dBSubnetGroupName;

  /// Provides the status of the DB subnet group.
  final String? subnetGroupStatus;

  /// Contains a list of <a>Subnet</a> elements.
  final List<Subnet>? subnets;

  /// Provides the VpcId of the DB subnet group.
  final String? vpcId;

  DBSubnetGroup({
    this.dBSubnetGroupArn,
    this.dBSubnetGroupDescription,
    this.dBSubnetGroupName,
    this.subnetGroupStatus,
    this.subnets,
    this.vpcId,
  });
  factory DBSubnetGroup.fromXml(_s.XmlElement elem) {
    return DBSubnetGroup(
      dBSubnetGroupArn: _s.extractXmlStringValue(elem, 'DBSubnetGroupArn'),
      dBSubnetGroupDescription:
          _s.extractXmlStringValue(elem, 'DBSubnetGroupDescription'),
      dBSubnetGroupName: _s.extractXmlStringValue(elem, 'DBSubnetGroupName'),
      subnetGroupStatus: _s.extractXmlStringValue(elem, 'SubnetGroupStatus'),
      subnets: _s.extractXmlChild(elem, 'Subnets')?.let(
          (elem) => elem.findElements('Subnet').map(Subnet.fromXml).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSubnetGroupArn = this.dBSubnetGroupArn;
    final dBSubnetGroupDescription = this.dBSubnetGroupDescription;
    final dBSubnetGroupName = this.dBSubnetGroupName;
    final subnetGroupStatus = this.subnetGroupStatus;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (dBSubnetGroupArn != null) 'DBSubnetGroupArn': dBSubnetGroupArn,
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
  /// A list of <a>DBSubnetGroup</a> instances.
  final List<DBSubnetGroup>? dBSubnetGroups;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
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

  Map<String, dynamic> toJson() {
    final dBSubnetGroups = this.dBSubnetGroups;
    final marker = this.marker;
    return {
      if (dBSubnetGroups != null) 'DBSubnetGroups': dBSubnetGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// This data type represents the information you need to connect to an Amazon
/// Neptune DB cluster. This data type is used as a response element in the
/// following actions:
///
/// <ul>
/// <li>
/// <code>CreateDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DescribeDBClusterEndpoints</code>
/// </li>
/// <li>
/// <code>ModifyDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DeleteDBClusterEndpoint</code>
/// </li>
/// </ul>
/// For the data structure that represents Amazon RDS DB instance endpoints, see
/// <code>Endpoint</code>.
class DeleteDBClusterEndpointOutput {
  /// The type associated with a custom endpoint. One of: <code>READER</code>,
  /// <code>WRITER</code>, <code>ANY</code>.
  final String? customEndpointType;

  /// The Amazon Resource Name (ARN) for the endpoint.
  final String? dBClusterEndpointArn;

  /// The identifier associated with the endpoint. This parameter is stored as a
  /// lowercase string.
  final String? dBClusterEndpointIdentifier;

  /// A unique system-generated identifier for an endpoint. It remains the same
  /// for the whole life of the endpoint.
  final String? dBClusterEndpointResourceIdentifier;

  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  final String? dBClusterIdentifier;

  /// The DNS address of the endpoint.
  final String? endpoint;

  /// The type of the endpoint. One of: <code>READER</code>, <code>WRITER</code>,
  /// <code>CUSTOM</code>.
  final String? endpointType;

  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  final List<String>? excludedMembers;

  /// List of DB instance identifiers that are part of the custom endpoint group.
  final List<String>? staticMembers;

  /// The current status of the endpoint. One of: <code>creating</code>,
  /// <code>available</code>, <code>deleting</code>, <code>inactive</code>,
  /// <code>modifying</code>. The <code>inactive</code> state applies to an
  /// endpoint that cannot be used for a certain kind of cluster, such as a
  /// <code>writer</code> endpoint for a read-only secondary cluster in a global
  /// database.
  final String? status;

  DeleteDBClusterEndpointOutput({
    this.customEndpointType,
    this.dBClusterEndpointArn,
    this.dBClusterEndpointIdentifier,
    this.dBClusterEndpointResourceIdentifier,
    this.dBClusterIdentifier,
    this.endpoint,
    this.endpointType,
    this.excludedMembers,
    this.staticMembers,
    this.status,
  });
  factory DeleteDBClusterEndpointOutput.fromXml(_s.XmlElement elem) {
    return DeleteDBClusterEndpointOutput(
      customEndpointType: _s.extractXmlStringValue(elem, 'CustomEndpointType'),
      dBClusterEndpointArn:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointArn'),
      dBClusterEndpointIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointIdentifier'),
      dBClusterEndpointResourceIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointResourceIdentifier'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      endpointType: _s.extractXmlStringValue(elem, 'EndpointType'),
      excludedMembers: _s
          .extractXmlChild(elem, 'ExcludedMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      staticMembers: _s
          .extractXmlChild(elem, 'StaticMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final customEndpointType = this.customEndpointType;
    final dBClusterEndpointArn = this.dBClusterEndpointArn;
    final dBClusterEndpointIdentifier = this.dBClusterEndpointIdentifier;
    final dBClusterEndpointResourceIdentifier =
        this.dBClusterEndpointResourceIdentifier;
    final dBClusterIdentifier = this.dBClusterIdentifier;
    final endpoint = this.endpoint;
    final endpointType = this.endpointType;
    final excludedMembers = this.excludedMembers;
    final staticMembers = this.staticMembers;
    final status = this.status;
    return {
      if (customEndpointType != null) 'CustomEndpointType': customEndpointType,
      if (dBClusterEndpointArn != null)
        'DBClusterEndpointArn': dBClusterEndpointArn,
      if (dBClusterEndpointIdentifier != null)
        'DBClusterEndpointIdentifier': dBClusterEndpointIdentifier,
      if (dBClusterEndpointResourceIdentifier != null)
        'DBClusterEndpointResourceIdentifier':
            dBClusterEndpointResourceIdentifier,
      if (dBClusterIdentifier != null)
        'DBClusterIdentifier': dBClusterIdentifier,
      if (endpoint != null) 'Endpoint': endpoint,
      if (endpointType != null) 'EndpointType': endpointType,
      if (excludedMembers != null) 'ExcludedMembers': excludedMembers,
      if (staticMembers != null) 'StaticMembers': staticMembers,
      if (status != null) 'Status': status,
    };
  }
}

class DeleteDBClusterResult {
  final DBCluster? dBCluster;

  DeleteDBClusterResult({
    this.dBCluster,
  });
  factory DeleteDBClusterResult.fromXml(_s.XmlElement elem) {
    return DeleteDBClusterResult(
      dBCluster: _s.extractXmlChild(elem, 'DBCluster')?.let(DBCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBCluster = this.dBCluster;
    return {
      if (dBCluster != null) 'DBCluster': dBCluster,
    };
  }
}

class DeleteDBClusterSnapshotResult {
  final DBClusterSnapshot? dBClusterSnapshot;

  DeleteDBClusterSnapshotResult({
    this.dBClusterSnapshot,
  });
  factory DeleteDBClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteDBClusterSnapshotResult(
      dBClusterSnapshot: _s
          .extractXmlChild(elem, 'DBClusterSnapshot')
          ?.let(DBClusterSnapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterSnapshot = this.dBClusterSnapshot;
    return {
      if (dBClusterSnapshot != null) 'DBClusterSnapshot': dBClusterSnapshot,
    };
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

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
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

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

class DeleteGlobalClusterResult {
  final GlobalCluster? globalCluster;

  DeleteGlobalClusterResult({
    this.globalCluster,
  });
  factory DeleteGlobalClusterResult.fromXml(_s.XmlElement elem) {
    return DeleteGlobalClusterResult(
      globalCluster:
          _s.extractXmlChild(elem, 'GlobalCluster')?.let(GlobalCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalCluster = this.globalCluster;
    return {
      if (globalCluster != null) 'GlobalCluster': globalCluster,
    };
  }
}

class DescribeDBClusterSnapshotAttributesResult {
  final DBClusterSnapshotAttributesResult? dBClusterSnapshotAttributesResult;

  DescribeDBClusterSnapshotAttributesResult({
    this.dBClusterSnapshotAttributesResult,
  });
  factory DescribeDBClusterSnapshotAttributesResult.fromXml(
      _s.XmlElement elem) {
    return DescribeDBClusterSnapshotAttributesResult(
      dBClusterSnapshotAttributesResult: _s
          .extractXmlChild(elem, 'DBClusterSnapshotAttributesResult')
          ?.let(DBClusterSnapshotAttributesResult.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterSnapshotAttributesResult =
        this.dBClusterSnapshotAttributesResult;
    return {
      if (dBClusterSnapshotAttributesResult != null)
        'DBClusterSnapshotAttributesResult': dBClusterSnapshotAttributesResult,
    };
  }
}

class DescribeEngineDefaultClusterParametersResult {
  final EngineDefaults? engineDefaults;

  DescribeEngineDefaultClusterParametersResult({
    this.engineDefaults,
  });
  factory DescribeEngineDefaultClusterParametersResult.fromXml(
      _s.XmlElement elem) {
    return DescribeEngineDefaultClusterParametersResult(
      engineDefaults: _s
          .extractXmlChild(elem, 'EngineDefaults')
          ?.let(EngineDefaults.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final engineDefaults = this.engineDefaults;
    return {
      if (engineDefaults != null) 'EngineDefaults': engineDefaults,
    };
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

  Map<String, dynamic> toJson() {
    final engineDefaults = this.engineDefaults;
    return {
      if (engineDefaults != null) 'EngineDefaults': engineDefaults,
    };
  }
}

class DescribeValidDBInstanceModificationsResult {
  final ValidDBInstanceModificationsMessage?
      validDBInstanceModificationsMessage;

  DescribeValidDBInstanceModificationsResult({
    this.validDBInstanceModificationsMessage,
  });
  factory DescribeValidDBInstanceModificationsResult.fromXml(
      _s.XmlElement elem) {
    return DescribeValidDBInstanceModificationsResult(
      validDBInstanceModificationsMessage: _s
          .extractXmlChild(elem, 'ValidDBInstanceModificationsMessage')
          ?.let(ValidDBInstanceModificationsMessage.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final validDBInstanceModificationsMessage =
        this.validDBInstanceModificationsMessage;
    return {
      if (validDBInstanceModificationsMessage != null)
        'ValidDBInstanceModificationsMessage':
            validDBInstanceModificationsMessage,
    };
  }
}

/// An Active Directory Domain membership record associated with a DB instance.
class DomainMembership {
  /// The identifier of the Active Directory Domain.
  final String? domain;

  /// The fully qualified domain name of the Active Directory Domain.
  final String? fqdn;

  /// The name of the IAM role to be used when making API calls to the Directory
  /// Service.
  final String? iAMRoleName;

  /// The status of the DB instance's Active Directory Domain membership, such as
  /// joined, pending-join, failed etc).
  final String? status;

  DomainMembership({
    this.domain,
    this.fqdn,
    this.iAMRoleName,
    this.status,
  });
  factory DomainMembership.fromXml(_s.XmlElement elem) {
    return DomainMembership(
      domain: _s.extractXmlStringValue(elem, 'Domain'),
      fqdn: _s.extractXmlStringValue(elem, 'FQDN'),
      iAMRoleName: _s.extractXmlStringValue(elem, 'IAMRoleName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final fqdn = this.fqdn;
    final iAMRoleName = this.iAMRoleName;
    final status = this.status;
    return {
      if (domain != null) 'Domain': domain,
      if (fqdn != null) 'FQDN': fqdn,
      if (iAMRoleName != null) 'IAMRoleName': iAMRoleName,
      if (status != null) 'Status': status,
    };
  }
}

/// A range of double values.
class DoubleRange {
  /// The minimum value in the range.
  final double? from;

  /// The maximum value in the range.
  final double? to;

  DoubleRange({
    this.from,
    this.to,
  });
  factory DoubleRange.fromXml(_s.XmlElement elem) {
    return DoubleRange(
      from: _s.extractXmlDoubleValue(elem, 'From'),
      to: _s.extractXmlDoubleValue(elem, 'To'),
    );
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final to = this.to;
    return {
      if (from != null) 'From': from,
      if (to != null) 'To': to,
    };
  }
}

/// Specifies a connection endpoint.
///
/// For the data structure that represents Amazon Neptune DB cluster endpoints,
/// see <code>DBClusterEndpoint</code>.
class Endpoint {
  /// Specifies the DNS address of the DB instance.
  final String? address;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.
  final String? hostedZoneId;

  /// Specifies the port that the database engine is listening on.
  final int? port;

  Endpoint({
    this.address,
    this.hostedZoneId,
    this.port,
  });
  factory Endpoint.fromXml(_s.XmlElement elem) {
    return Endpoint(
      address: _s.extractXmlStringValue(elem, 'Address'),
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId'),
      port: _s.extractXmlIntValue(elem, 'Port'),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final hostedZoneId = this.hostedZoneId;
    final port = this.port;
    return {
      if (address != null) 'Address': address,
      if (hostedZoneId != null) 'HostedZoneId': hostedZoneId,
      if (port != null) 'Port': port,
    };
  }
}

/// Contains the result of a successful invocation of the
/// <a>DescribeEngineDefaultParameters</a> action.
class EngineDefaults {
  /// Specifies the name of the DB parameter group family that the engine default
  /// parameters apply to.
  final String? dBParameterGroupFamily;

  /// An optional pagination token provided by a previous EngineDefaults request.
  /// If this parameter is specified, the response includes only records beyond
  /// the marker, up to the value specified by <code>MaxRecords</code> .
  final String? marker;

  /// Contains a list of engine default parameters.
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

/// This data type is used as a response element in the <a>DescribeEvents</a>
/// action.
class Event {
  /// Specifies the date and time of the event.
  final DateTime? date;

  /// Specifies the category for the event.
  final List<String>? eventCategories;

  /// Provides the text of this event.
  final String? message;

  /// The Amazon Resource Name (ARN) for the event.
  final String? sourceArn;

  /// Provides the identifier for the source of the event.
  final String? sourceIdentifier;

  /// Specifies the source type for this event.
  final SourceType? sourceType;

  Event({
    this.date,
    this.eventCategories,
    this.message,
    this.sourceArn,
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
      sourceArn: _s.extractXmlStringValue(elem, 'SourceArn'),
      sourceIdentifier: _s.extractXmlStringValue(elem, 'SourceIdentifier'),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType')?.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final eventCategories = this.eventCategories;
    final message = this.message;
    final sourceArn = this.sourceArn;
    final sourceIdentifier = this.sourceIdentifier;
    final sourceType = this.sourceType;
    return {
      if (date != null) 'Date': iso8601ToJson(date),
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (message != null) 'Message': message,
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (sourceIdentifier != null) 'SourceIdentifier': sourceIdentifier,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
    };
  }
}

/// Contains the results of a successful invocation of the
/// <a>DescribeEventCategories</a> action.
class EventCategoriesMap {
  /// The event categories for the specified source type
  final List<String>? eventCategories;

  /// The source type that the returned categories belong to
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
  /// A list of EventCategoriesMap data types.
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

  Map<String, dynamic> toJson() {
    final eventCategoriesMapList = this.eventCategoriesMapList;
    return {
      if (eventCategoriesMapList != null)
        'EventCategoriesMapList': eventCategoriesMapList,
    };
  }
}

/// Contains the results of a successful invocation of the
/// <a>DescribeEventSubscriptions</a> action.
class EventSubscription {
  /// The event notification subscription Id.
  final String? custSubscriptionId;

  /// The Amazon customer account associated with the event notification
  /// subscription.
  final String? customerAwsId;

  /// A Boolean value indicating if the subscription is enabled. True indicates
  /// the subscription is enabled.
  final bool? enabled;

  /// A list of event categories for the event notification subscription.
  final List<String>? eventCategoriesList;

  /// The Amazon Resource Name (ARN) for the event subscription.
  final String? eventSubscriptionArn;

  /// The topic ARN of the event notification subscription.
  final String? snsTopicArn;

  /// A list of source IDs for the event notification subscription.
  final List<String>? sourceIdsList;

  /// The source type for the event notification subscription.
  final String? sourceType;

  /// The status of the event notification subscription.
  ///
  /// Constraints:
  ///
  /// Can be one of the following: creating | modifying | deleting | active |
  /// no-permission | topic-not-exist
  ///
  /// The status "no-permission" indicates that Neptune no longer has permission
  /// to post to the SNS topic. The status "topic-not-exist" indicates that the
  /// topic was deleted after the subscription was created.
  final String? status;

  /// The time the event notification subscription was created.
  final String? subscriptionCreationTime;

  EventSubscription({
    this.custSubscriptionId,
    this.customerAwsId,
    this.enabled,
    this.eventCategoriesList,
    this.eventSubscriptionArn,
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
      eventSubscriptionArn:
          _s.extractXmlStringValue(elem, 'EventSubscriptionArn'),
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
    final eventSubscriptionArn = this.eventSubscriptionArn;
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
      if (eventSubscriptionArn != null)
        'EventSubscriptionArn': eventSubscriptionArn,
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
  /// A list of EventSubscriptions data types.
  final List<EventSubscription>? eventSubscriptionsList;

  /// An optional pagination token provided by a previous
  /// DescribeOrderableDBInstanceOptions request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
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
  /// A list of <a>Event</a> instances.
  final List<Event>? events;

  /// An optional pagination token provided by a previous Events request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code> .
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

  Map<String, dynamic> toJson() {
    final events = this.events;
    final marker = this.marker;
    return {
      if (events != null) 'Events': events,
      if (marker != null) 'Marker': marker,
    };
  }
}

class FailoverDBClusterResult {
  final DBCluster? dBCluster;

  FailoverDBClusterResult({
    this.dBCluster,
  });
  factory FailoverDBClusterResult.fromXml(_s.XmlElement elem) {
    return FailoverDBClusterResult(
      dBCluster: _s.extractXmlChild(elem, 'DBCluster')?.let(DBCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBCluster = this.dBCluster;
    return {
      if (dBCluster != null) 'DBCluster': dBCluster,
    };
  }
}

class FailoverGlobalClusterResult {
  final GlobalCluster? globalCluster;

  FailoverGlobalClusterResult({
    this.globalCluster,
  });
  factory FailoverGlobalClusterResult.fromXml(_s.XmlElement elem) {
    return FailoverGlobalClusterResult(
      globalCluster:
          _s.extractXmlChild(elem, 'GlobalCluster')?.let(GlobalCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalCluster = this.globalCluster;
    return {
      if (globalCluster != null) 'GlobalCluster': globalCluster,
    };
  }
}

/// This type is not currently supported.
class Filter {
  /// This parameter is not currently supported.
  final String name;

  /// This parameter is not currently supported.
  final List<String> values;

  Filter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name,
      'Values': values,
    };
  }
}

/// Contains the details of an Amazon Neptune global database.
///
/// This data type is used as a response element for the
/// <a>CreateGlobalCluster</a>, <a>DescribeGlobalClusters</a>,
/// <a>ModifyGlobalCluster</a>, <a>DeleteGlobalCluster</a>,
/// <a>FailoverGlobalCluster</a>, and <a>RemoveFromGlobalCluster</a> actions.
class GlobalCluster {
  /// The deletion protection setting for the global database.
  final bool? deletionProtection;

  /// The Neptune database engine used by the global database
  /// (<code>"neptune"</code>).
  final String? engine;

  /// The Neptune engine version used by the global database.
  final String? engineVersion;

  /// The Amazon Resource Name (ARN) for the global database.
  final String? globalClusterArn;

  /// Contains a user-supplied global database cluster identifier. This identifier
  /// is the unique key that identifies a global database.
  final String? globalClusterIdentifier;

  /// A list of cluster ARNs and instance ARNs for all the DB clusters that are
  /// part of the global database.
  final List<GlobalClusterMember>? globalClusterMembers;

  /// An immutable identifier for the global database that is unique within in all
  /// regions. This identifier is found in CloudTrail log entries whenever the KMS
  /// key for the DB cluster is accessed.
  final String? globalClusterResourceId;

  /// Specifies the current state of this global database.
  final String? status;

  /// The storage encryption setting for the global database.
  final bool? storageEncrypted;

  GlobalCluster({
    this.deletionProtection,
    this.engine,
    this.engineVersion,
    this.globalClusterArn,
    this.globalClusterIdentifier,
    this.globalClusterMembers,
    this.globalClusterResourceId,
    this.status,
    this.storageEncrypted,
  });
  factory GlobalCluster.fromXml(_s.XmlElement elem) {
    return GlobalCluster(
      deletionProtection: _s.extractXmlBoolValue(elem, 'DeletionProtection'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      globalClusterArn: _s.extractXmlStringValue(elem, 'GlobalClusterArn'),
      globalClusterIdentifier:
          _s.extractXmlStringValue(elem, 'GlobalClusterIdentifier'),
      globalClusterMembers: _s
          .extractXmlChild(elem, 'GlobalClusterMembers')
          ?.let((elem) => elem
              .findElements('GlobalClusterMember')
              .map(GlobalClusterMember.fromXml)
              .toList()),
      globalClusterResourceId:
          _s.extractXmlStringValue(elem, 'GlobalClusterResourceId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
    );
  }

  Map<String, dynamic> toJson() {
    final deletionProtection = this.deletionProtection;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final globalClusterArn = this.globalClusterArn;
    final globalClusterIdentifier = this.globalClusterIdentifier;
    final globalClusterMembers = this.globalClusterMembers;
    final globalClusterResourceId = this.globalClusterResourceId;
    final status = this.status;
    final storageEncrypted = this.storageEncrypted;
    return {
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (globalClusterArn != null) 'GlobalClusterArn': globalClusterArn,
      if (globalClusterIdentifier != null)
        'GlobalClusterIdentifier': globalClusterIdentifier,
      if (globalClusterMembers != null)
        'GlobalClusterMembers': globalClusterMembers,
      if (globalClusterResourceId != null)
        'GlobalClusterResourceId': globalClusterResourceId,
      if (status != null) 'Status': status,
      if (storageEncrypted != null) 'StorageEncrypted': storageEncrypted,
    };
  }
}

/// A data structure with information about any primary and secondary clusters
/// associated with an Neptune global database.
class GlobalClusterMember {
  /// The Amazon Resource Name (ARN) for each Neptune cluster.
  final String? dBClusterArn;

  /// Specifies whether the Neptune cluster is the primary cluster (that is, has
  /// read-write capability) for the Neptune global database with which it is
  /// associated.
  final bool? isWriter;

  /// The Amazon Resource Name (ARN) for each read-only secondary cluster
  /// associated with the Neptune global database.
  final List<String>? readers;

  GlobalClusterMember({
    this.dBClusterArn,
    this.isWriter,
    this.readers,
  });
  factory GlobalClusterMember.fromXml(_s.XmlElement elem) {
    return GlobalClusterMember(
      dBClusterArn: _s.extractXmlStringValue(elem, 'DBClusterArn'),
      isWriter: _s.extractXmlBoolValue(elem, 'IsWriter'),
      readers: _s
          .extractXmlChild(elem, 'Readers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterArn = this.dBClusterArn;
    final isWriter = this.isWriter;
    final readers = this.readers;
    return {
      if (dBClusterArn != null) 'DBClusterArn': dBClusterArn,
      if (isWriter != null) 'IsWriter': isWriter,
      if (readers != null) 'Readers': readers,
    };
  }
}

class GlobalClustersMessage {
  /// The list of global clusters and instances returned by this request.
  final List<GlobalCluster>? globalClusters;

  /// A pagination token. If this parameter is returned in the response, more
  /// records are available, which can be retrieved by one or more additional
  /// calls to <code>DescribeGlobalClusters</code>.
  final String? marker;

  GlobalClustersMessage({
    this.globalClusters,
    this.marker,
  });
  factory GlobalClustersMessage.fromXml(_s.XmlElement elem) {
    return GlobalClustersMessage(
      globalClusters: _s.extractXmlChild(elem, 'GlobalClusters')?.let((elem) =>
          elem
              .findElements('GlobalClusterMember')
              .map(GlobalCluster.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final globalClusters = this.globalClusters;
    final marker = this.marker;
    return {
      if (globalClusters != null) 'GlobalClusters': globalClusters,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// This data type represents the information you need to connect to an Amazon
/// Neptune DB cluster. This data type is used as a response element in the
/// following actions:
///
/// <ul>
/// <li>
/// <code>CreateDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DescribeDBClusterEndpoints</code>
/// </li>
/// <li>
/// <code>ModifyDBClusterEndpoint</code>
/// </li>
/// <li>
/// <code>DeleteDBClusterEndpoint</code>
/// </li>
/// </ul>
/// For the data structure that represents Amazon RDS DB instance endpoints, see
/// <code>Endpoint</code>.
class ModifyDBClusterEndpointOutput {
  /// The type associated with a custom endpoint. One of: <code>READER</code>,
  /// <code>WRITER</code>, <code>ANY</code>.
  final String? customEndpointType;

  /// The Amazon Resource Name (ARN) for the endpoint.
  final String? dBClusterEndpointArn;

  /// The identifier associated with the endpoint. This parameter is stored as a
  /// lowercase string.
  final String? dBClusterEndpointIdentifier;

  /// A unique system-generated identifier for an endpoint. It remains the same
  /// for the whole life of the endpoint.
  final String? dBClusterEndpointResourceIdentifier;

  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  final String? dBClusterIdentifier;

  /// The DNS address of the endpoint.
  final String? endpoint;

  /// The type of the endpoint. One of: <code>READER</code>, <code>WRITER</code>,
  /// <code>CUSTOM</code>.
  final String? endpointType;

  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  final List<String>? excludedMembers;

  /// List of DB instance identifiers that are part of the custom endpoint group.
  final List<String>? staticMembers;

  /// The current status of the endpoint. One of: <code>creating</code>,
  /// <code>available</code>, <code>deleting</code>, <code>inactive</code>,
  /// <code>modifying</code>. The <code>inactive</code> state applies to an
  /// endpoint that cannot be used for a certain kind of cluster, such as a
  /// <code>writer</code> endpoint for a read-only secondary cluster in a global
  /// database.
  final String? status;

  ModifyDBClusterEndpointOutput({
    this.customEndpointType,
    this.dBClusterEndpointArn,
    this.dBClusterEndpointIdentifier,
    this.dBClusterEndpointResourceIdentifier,
    this.dBClusterIdentifier,
    this.endpoint,
    this.endpointType,
    this.excludedMembers,
    this.staticMembers,
    this.status,
  });
  factory ModifyDBClusterEndpointOutput.fromXml(_s.XmlElement elem) {
    return ModifyDBClusterEndpointOutput(
      customEndpointType: _s.extractXmlStringValue(elem, 'CustomEndpointType'),
      dBClusterEndpointArn:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointArn'),
      dBClusterEndpointIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointIdentifier'),
      dBClusterEndpointResourceIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterEndpointResourceIdentifier'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      endpointType: _s.extractXmlStringValue(elem, 'EndpointType'),
      excludedMembers: _s
          .extractXmlChild(elem, 'ExcludedMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      staticMembers: _s
          .extractXmlChild(elem, 'StaticMembers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final customEndpointType = this.customEndpointType;
    final dBClusterEndpointArn = this.dBClusterEndpointArn;
    final dBClusterEndpointIdentifier = this.dBClusterEndpointIdentifier;
    final dBClusterEndpointResourceIdentifier =
        this.dBClusterEndpointResourceIdentifier;
    final dBClusterIdentifier = this.dBClusterIdentifier;
    final endpoint = this.endpoint;
    final endpointType = this.endpointType;
    final excludedMembers = this.excludedMembers;
    final staticMembers = this.staticMembers;
    final status = this.status;
    return {
      if (customEndpointType != null) 'CustomEndpointType': customEndpointType,
      if (dBClusterEndpointArn != null)
        'DBClusterEndpointArn': dBClusterEndpointArn,
      if (dBClusterEndpointIdentifier != null)
        'DBClusterEndpointIdentifier': dBClusterEndpointIdentifier,
      if (dBClusterEndpointResourceIdentifier != null)
        'DBClusterEndpointResourceIdentifier':
            dBClusterEndpointResourceIdentifier,
      if (dBClusterIdentifier != null)
        'DBClusterIdentifier': dBClusterIdentifier,
      if (endpoint != null) 'Endpoint': endpoint,
      if (endpointType != null) 'EndpointType': endpointType,
      if (excludedMembers != null) 'ExcludedMembers': excludedMembers,
      if (staticMembers != null) 'StaticMembers': staticMembers,
      if (status != null) 'Status': status,
    };
  }
}

class ModifyDBClusterResult {
  final DBCluster? dBCluster;

  ModifyDBClusterResult({
    this.dBCluster,
  });
  factory ModifyDBClusterResult.fromXml(_s.XmlElement elem) {
    return ModifyDBClusterResult(
      dBCluster: _s.extractXmlChild(elem, 'DBCluster')?.let(DBCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBCluster = this.dBCluster;
    return {
      if (dBCluster != null) 'DBCluster': dBCluster,
    };
  }
}

class ModifyDBClusterSnapshotAttributeResult {
  final DBClusterSnapshotAttributesResult? dBClusterSnapshotAttributesResult;

  ModifyDBClusterSnapshotAttributeResult({
    this.dBClusterSnapshotAttributesResult,
  });
  factory ModifyDBClusterSnapshotAttributeResult.fromXml(_s.XmlElement elem) {
    return ModifyDBClusterSnapshotAttributeResult(
      dBClusterSnapshotAttributesResult: _s
          .extractXmlChild(elem, 'DBClusterSnapshotAttributesResult')
          ?.let(DBClusterSnapshotAttributesResult.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBClusterSnapshotAttributesResult =
        this.dBClusterSnapshotAttributesResult;
    return {
      if (dBClusterSnapshotAttributesResult != null)
        'DBClusterSnapshotAttributesResult': dBClusterSnapshotAttributesResult,
    };
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
  factory ModifyDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyDBSubnetGroupResult(
      dBSubnetGroup:
          _s.extractXmlChild(elem, 'DBSubnetGroup')?.let(DBSubnetGroup.fromXml),
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
  factory ModifyEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return ModifyEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let(EventSubscription.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

class ModifyGlobalClusterResult {
  final GlobalCluster? globalCluster;

  ModifyGlobalClusterResult({
    this.globalCluster,
  });
  factory ModifyGlobalClusterResult.fromXml(_s.XmlElement elem) {
    return ModifyGlobalClusterResult(
      globalCluster:
          _s.extractXmlChild(elem, 'GlobalCluster')?.let(GlobalCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalCluster = this.globalCluster;
    return {
      if (globalCluster != null) 'GlobalCluster': globalCluster,
    };
  }
}

/// Not supported by Neptune.
class OptionGroupMembership {
  /// Not supported by Neptune.
  final String? optionGroupName;

  /// Not supported by Neptune.
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

  Map<String, dynamic> toJson() {
    final optionGroupName = this.optionGroupName;
    final status = this.status;
    return {
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (status != null) 'Status': status,
    };
  }
}

/// Contains a list of available options for a DB instance.
///
/// This data type is used as a response element in the
/// <a>DescribeOrderableDBInstanceOptions</a> action.
class OrderableDBInstanceOption {
  /// A list of Availability Zones for a DB instance.
  final List<AvailabilityZone>? availabilityZones;

  /// The DB instance class for a DB instance.
  final String? dBInstanceClass;

  /// The engine type of a DB instance.
  final String? engine;

  /// The engine version of a DB instance.
  final String? engineVersion;

  /// The license model for a DB instance.
  final String? licenseModel;

  /// Maximum total provisioned IOPS for a DB instance.
  final int? maxIopsPerDbInstance;

  /// Maximum provisioned IOPS per GiB for a DB instance.
  final double? maxIopsPerGib;

  /// Maximum storage size for a DB instance.
  final int? maxStorageSize;

  /// Minimum total provisioned IOPS for a DB instance.
  final int? minIopsPerDbInstance;

  /// Minimum provisioned IOPS per GiB for a DB instance.
  final double? minIopsPerGib;

  /// Minimum storage size for a DB instance.
  final int? minStorageSize;

  /// Indicates whether a DB instance is Multi-AZ capable.
  final bool? multiAZCapable;

  /// Indicates whether a DB instance can have a Read Replica.
  final bool? readReplicaCapable;

  /// Indicates the storage type for a DB instance.
  final String? storageType;

  /// Indicates whether a DB instance supports Enhanced Monitoring at intervals
  /// from 1 to 60 seconds.
  final bool? supportsEnhancedMonitoring;

  /// A value that indicates whether you can use Neptune global databases with a
  /// specific combination of other DB engine attributes.
  final bool? supportsGlobalDatabases;

  /// Indicates whether a DB instance supports IAM database authentication.
  final bool? supportsIAMDatabaseAuthentication;

  /// Indicates whether a DB instance supports provisioned IOPS.
  final bool? supportsIops;

  /// <i>(Not supported by Neptune)</i>
  final bool? supportsPerformanceInsights;

  /// Indicates whether a DB instance supports encrypted storage.
  final bool? supportsStorageEncryption;

  /// Indicates whether a DB instance is in a VPC.
  final bool? vpc;

  OrderableDBInstanceOption({
    this.availabilityZones,
    this.dBInstanceClass,
    this.engine,
    this.engineVersion,
    this.licenseModel,
    this.maxIopsPerDbInstance,
    this.maxIopsPerGib,
    this.maxStorageSize,
    this.minIopsPerDbInstance,
    this.minIopsPerGib,
    this.minStorageSize,
    this.multiAZCapable,
    this.readReplicaCapable,
    this.storageType,
    this.supportsEnhancedMonitoring,
    this.supportsGlobalDatabases,
    this.supportsIAMDatabaseAuthentication,
    this.supportsIops,
    this.supportsPerformanceInsights,
    this.supportsStorageEncryption,
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
      maxIopsPerDbInstance: _s.extractXmlIntValue(elem, 'MaxIopsPerDbInstance'),
      maxIopsPerGib: _s.extractXmlDoubleValue(elem, 'MaxIopsPerGib'),
      maxStorageSize: _s.extractXmlIntValue(elem, 'MaxStorageSize'),
      minIopsPerDbInstance: _s.extractXmlIntValue(elem, 'MinIopsPerDbInstance'),
      minIopsPerGib: _s.extractXmlDoubleValue(elem, 'MinIopsPerGib'),
      minStorageSize: _s.extractXmlIntValue(elem, 'MinStorageSize'),
      multiAZCapable: _s.extractXmlBoolValue(elem, 'MultiAZCapable'),
      readReplicaCapable: _s.extractXmlBoolValue(elem, 'ReadReplicaCapable'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
      supportsEnhancedMonitoring:
          _s.extractXmlBoolValue(elem, 'SupportsEnhancedMonitoring'),
      supportsGlobalDatabases:
          _s.extractXmlBoolValue(elem, 'SupportsGlobalDatabases'),
      supportsIAMDatabaseAuthentication:
          _s.extractXmlBoolValue(elem, 'SupportsIAMDatabaseAuthentication'),
      supportsIops: _s.extractXmlBoolValue(elem, 'SupportsIops'),
      supportsPerformanceInsights:
          _s.extractXmlBoolValue(elem, 'SupportsPerformanceInsights'),
      supportsStorageEncryption:
          _s.extractXmlBoolValue(elem, 'SupportsStorageEncryption'),
      vpc: _s.extractXmlBoolValue(elem, 'Vpc'),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final dBInstanceClass = this.dBInstanceClass;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final licenseModel = this.licenseModel;
    final maxIopsPerDbInstance = this.maxIopsPerDbInstance;
    final maxIopsPerGib = this.maxIopsPerGib;
    final maxStorageSize = this.maxStorageSize;
    final minIopsPerDbInstance = this.minIopsPerDbInstance;
    final minIopsPerGib = this.minIopsPerGib;
    final minStorageSize = this.minStorageSize;
    final multiAZCapable = this.multiAZCapable;
    final readReplicaCapable = this.readReplicaCapable;
    final storageType = this.storageType;
    final supportsEnhancedMonitoring = this.supportsEnhancedMonitoring;
    final supportsGlobalDatabases = this.supportsGlobalDatabases;
    final supportsIAMDatabaseAuthentication =
        this.supportsIAMDatabaseAuthentication;
    final supportsIops = this.supportsIops;
    final supportsPerformanceInsights = this.supportsPerformanceInsights;
    final supportsStorageEncryption = this.supportsStorageEncryption;
    final vpc = this.vpc;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (maxIopsPerDbInstance != null)
        'MaxIopsPerDbInstance': maxIopsPerDbInstance,
      if (maxIopsPerGib != null) 'MaxIopsPerGib': maxIopsPerGib,
      if (maxStorageSize != null) 'MaxStorageSize': maxStorageSize,
      if (minIopsPerDbInstance != null)
        'MinIopsPerDbInstance': minIopsPerDbInstance,
      if (minIopsPerGib != null) 'MinIopsPerGib': minIopsPerGib,
      if (minStorageSize != null) 'MinStorageSize': minStorageSize,
      if (multiAZCapable != null) 'MultiAZCapable': multiAZCapable,
      if (readReplicaCapable != null) 'ReadReplicaCapable': readReplicaCapable,
      if (storageType != null) 'StorageType': storageType,
      if (supportsEnhancedMonitoring != null)
        'SupportsEnhancedMonitoring': supportsEnhancedMonitoring,
      if (supportsGlobalDatabases != null)
        'SupportsGlobalDatabases': supportsGlobalDatabases,
      if (supportsIAMDatabaseAuthentication != null)
        'SupportsIAMDatabaseAuthentication': supportsIAMDatabaseAuthentication,
      if (supportsIops != null) 'SupportsIops': supportsIops,
      if (supportsPerformanceInsights != null)
        'SupportsPerformanceInsights': supportsPerformanceInsights,
      if (supportsStorageEncryption != null)
        'SupportsStorageEncryption': supportsStorageEncryption,
      if (vpc != null) 'Vpc': vpc,
    };
  }
}

class OrderableDBInstanceOptionsMessage {
  /// An optional pagination token provided by a previous
  /// OrderableDBInstanceOptions request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value specified
  /// by <code>MaxRecords</code> .
  final String? marker;

  /// An <a>OrderableDBInstanceOption</a> structure containing information about
  /// orderable options for the DB instance.
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

/// Specifies a parameter.
class Parameter {
  /// Specifies the valid range of values for the parameter.
  final String? allowedValues;

  /// Indicates when to apply parameter updates.
  final ApplyMethod? applyMethod;

  /// Specifies the engine specific parameters type.
  final String? applyType;

  /// Specifies the valid data type for the parameter.
  final String? dataType;

  /// Provides a description of the parameter.
  final String? description;

  /// Indicates whether (<code>true</code>) or not (<code>false</code>) the
  /// parameter can be modified. Some parameters have security or operational
  /// implications that prevent them from being changed.
  final bool? isModifiable;

  /// The earliest engine version to which the parameter can apply.
  final String? minimumEngineVersion;

  /// Specifies the name of the parameter.
  final String? parameterName;

  /// Specifies the value of the parameter.
  final String? parameterValue;

  /// Indicates the source of the parameter value.
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

/// A list of the log types whose configuration is still pending. In other
/// words, these log types are in the process of being activated or deactivated.
///
/// Valid log types are: <code>audit</code> (to publish audit logs) and
/// <code>slowquery</code> (to publish slow-query logs). See <a
/// href="https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html">Publishing
/// Neptune logs to Amazon CloudWatch logs</a>.
class PendingCloudwatchLogsExports {
  /// Log types that are in the process of being enabled. After they are enabled,
  /// these log types are exported to CloudWatch Logs.
  final List<String>? logTypesToDisable;

  /// Log types that are in the process of being deactivated. After they are
  /// deactivated, these log types aren't exported to CloudWatch Logs.
  final List<String>? logTypesToEnable;

  PendingCloudwatchLogsExports({
    this.logTypesToDisable,
    this.logTypesToEnable,
  });
  factory PendingCloudwatchLogsExports.fromXml(_s.XmlElement elem) {
    return PendingCloudwatchLogsExports(
      logTypesToDisable: _s
          .extractXmlChild(elem, 'LogTypesToDisable')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      logTypesToEnable: _s
          .extractXmlChild(elem, 'LogTypesToEnable')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final logTypesToDisable = this.logTypesToDisable;
    final logTypesToEnable = this.logTypesToEnable;
    return {
      if (logTypesToDisable != null) 'LogTypesToDisable': logTypesToDisable,
      if (logTypesToEnable != null) 'LogTypesToEnable': logTypesToEnable,
    };
  }
}

/// Provides information about a pending maintenance action for a resource.
class PendingMaintenanceAction {
  /// The type of pending maintenance action that is available for the resource.
  final String? action;

  /// The date of the maintenance window when the action is applied. The
  /// maintenance action is applied to the resource during its first maintenance
  /// window after this date. If this date is specified, any
  /// <code>next-maintenance</code> opt-in requests are ignored.
  final DateTime? autoAppliedAfterDate;

  /// The effective date when the pending maintenance action is applied to the
  /// resource. This date takes into account opt-in requests received from the
  /// <a>ApplyPendingMaintenanceAction</a> API, the
  /// <code>AutoAppliedAfterDate</code>, and the <code>ForcedApplyDate</code>.
  /// This value is blank if an opt-in request has not been received and nothing
  /// has been specified as <code>AutoAppliedAfterDate</code> or
  /// <code>ForcedApplyDate</code>.
  final DateTime? currentApplyDate;

  /// A description providing more detail about the maintenance action.
  final String? description;

  /// The date when the maintenance action is automatically applied. The
  /// maintenance action is applied to the resource on this date regardless of the
  /// maintenance window for the resource. If this date is specified, any
  /// <code>immediate</code> opt-in requests are ignored.
  final DateTime? forcedApplyDate;

  /// Indicates the type of opt-in request that has been received for the
  /// resource.
  final String? optInStatus;

  PendingMaintenanceAction({
    this.action,
    this.autoAppliedAfterDate,
    this.currentApplyDate,
    this.description,
    this.forcedApplyDate,
    this.optInStatus,
  });
  factory PendingMaintenanceAction.fromXml(_s.XmlElement elem) {
    return PendingMaintenanceAction(
      action: _s.extractXmlStringValue(elem, 'Action'),
      autoAppliedAfterDate:
          _s.extractXmlDateTimeValue(elem, 'AutoAppliedAfterDate'),
      currentApplyDate: _s.extractXmlDateTimeValue(elem, 'CurrentApplyDate'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      forcedApplyDate: _s.extractXmlDateTimeValue(elem, 'ForcedApplyDate'),
      optInStatus: _s.extractXmlStringValue(elem, 'OptInStatus'),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final autoAppliedAfterDate = this.autoAppliedAfterDate;
    final currentApplyDate = this.currentApplyDate;
    final description = this.description;
    final forcedApplyDate = this.forcedApplyDate;
    final optInStatus = this.optInStatus;
    return {
      if (action != null) 'Action': action,
      if (autoAppliedAfterDate != null)
        'AutoAppliedAfterDate': iso8601ToJson(autoAppliedAfterDate),
      if (currentApplyDate != null)
        'CurrentApplyDate': iso8601ToJson(currentApplyDate),
      if (description != null) 'Description': description,
      if (forcedApplyDate != null)
        'ForcedApplyDate': iso8601ToJson(forcedApplyDate),
      if (optInStatus != null) 'OptInStatus': optInStatus,
    };
  }
}

class PendingMaintenanceActionsMessage {
  /// An optional pagination token provided by a previous
  /// <code>DescribePendingMaintenanceActions</code> request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to a
  /// number of records specified by <code>MaxRecords</code>.
  final String? marker;

  /// A list of the pending maintenance actions for the resource.
  final List<ResourcePendingMaintenanceActions>? pendingMaintenanceActions;

  PendingMaintenanceActionsMessage({
    this.marker,
    this.pendingMaintenanceActions,
  });
  factory PendingMaintenanceActionsMessage.fromXml(_s.XmlElement elem) {
    return PendingMaintenanceActionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      pendingMaintenanceActions: _s
          .extractXmlChild(elem, 'PendingMaintenanceActions')
          ?.let((elem) => elem
              .findElements('ResourcePendingMaintenanceActions')
              .map(ResourcePendingMaintenanceActions.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final pendingMaintenanceActions = this.pendingMaintenanceActions;
    return {
      if (marker != null) 'Marker': marker,
      if (pendingMaintenanceActions != null)
        'PendingMaintenanceActions': pendingMaintenanceActions,
    };
  }
}

/// This data type is used as a response element in the <a>ModifyDBInstance</a>
/// action.
class PendingModifiedValues {
  /// Contains the new <code>AllocatedStorage</code> size for the DB instance that
  /// will be applied or is currently being applied.
  final int? allocatedStorage;

  /// Specifies the pending number of days for which automated backups are
  /// retained.
  final int? backupRetentionPeriod;

  /// Specifies the identifier of the CA certificate for the DB instance.
  final String? cACertificateIdentifier;

  /// Contains the new <code>DBInstanceClass</code> for the DB instance that will
  /// be applied or is currently being applied.
  final String? dBInstanceClass;

  /// Contains the new <code>DBInstanceIdentifier</code> for the DB instance that
  /// will be applied or is currently being applied.
  final String? dBInstanceIdentifier;

  /// The new DB subnet group for the DB instance.
  final String? dBSubnetGroupName;

  /// Indicates the database engine version.
  final String? engineVersion;

  /// Specifies the new Provisioned IOPS value for the DB instance that will be
  /// applied or is currently being applied.
  final int? iops;

  /// Not supported by Neptune.
  final String? licenseModel;

  /// Not supported by Neptune.
  final String? masterUserPassword;

  /// Indicates that the Single-AZ DB instance is to change to a Multi-AZ
  /// deployment.
  final bool? multiAZ;

  /// This <code>PendingCloudwatchLogsExports</code> structure specifies pending
  /// changes to which CloudWatch logs are enabled and which are disabled.
  final PendingCloudwatchLogsExports? pendingCloudwatchLogsExports;

  /// Specifies the pending port for the DB instance.
  final int? port;

  /// Specifies the storage type to be associated with the DB instance.
  final String? storageType;

  PendingModifiedValues({
    this.allocatedStorage,
    this.backupRetentionPeriod,
    this.cACertificateIdentifier,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.dBSubnetGroupName,
    this.engineVersion,
    this.iops,
    this.licenseModel,
    this.masterUserPassword,
    this.multiAZ,
    this.pendingCloudwatchLogsExports,
    this.port,
    this.storageType,
  });
  factory PendingModifiedValues.fromXml(_s.XmlElement elem) {
    return PendingModifiedValues(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      cACertificateIdentifier:
          _s.extractXmlStringValue(elem, 'CACertificateIdentifier'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dBSubnetGroupName: _s.extractXmlStringValue(elem, 'DBSubnetGroupName'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUserPassword: _s.extractXmlStringValue(elem, 'MasterUserPassword'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      pendingCloudwatchLogsExports: _s
          .extractXmlChild(elem, 'PendingCloudwatchLogsExports')
          ?.let(PendingCloudwatchLogsExports.fromXml),
      port: _s.extractXmlIntValue(elem, 'Port'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final cACertificateIdentifier = this.cACertificateIdentifier;
    final dBInstanceClass = this.dBInstanceClass;
    final dBInstanceIdentifier = this.dBInstanceIdentifier;
    final dBSubnetGroupName = this.dBSubnetGroupName;
    final engineVersion = this.engineVersion;
    final iops = this.iops;
    final licenseModel = this.licenseModel;
    final masterUserPassword = this.masterUserPassword;
    final multiAZ = this.multiAZ;
    final pendingCloudwatchLogsExports = this.pendingCloudwatchLogsExports;
    final port = this.port;
    final storageType = this.storageType;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (cACertificateIdentifier != null)
        'CACertificateIdentifier': cACertificateIdentifier,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (dBSubnetGroupName != null) 'DBSubnetGroupName': dBSubnetGroupName,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iops != null) 'Iops': iops,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (pendingCloudwatchLogsExports != null)
        'PendingCloudwatchLogsExports': pendingCloudwatchLogsExports,
      if (port != null) 'Port': port,
      if (storageType != null) 'StorageType': storageType,
    };
  }
}

class PromoteReadReplicaDBClusterResult {
  final DBCluster? dBCluster;

  PromoteReadReplicaDBClusterResult({
    this.dBCluster,
  });
  factory PromoteReadReplicaDBClusterResult.fromXml(_s.XmlElement elem) {
    return PromoteReadReplicaDBClusterResult(
      dBCluster: _s.extractXmlChild(elem, 'DBCluster')?.let(DBCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBCluster = this.dBCluster;
    return {
      if (dBCluster != null) 'DBCluster': dBCluster,
    };
  }
}

/// A range of integer values.
class Range {
  /// The minimum value in the range.
  final int? from;

  /// The step value for the range. For example, if you have a range of 5,000 to
  /// 10,000, with a step value of 1,000, the valid values start at 5,000 and step
  /// up by 1,000. Even though 7,500 is within the range, it isn't a valid value
  /// for the range. The valid values are 5,000, 6,000, 7,000, 8,000...
  final int? step;

  /// The maximum value in the range.
  final int? to;

  Range({
    this.from,
    this.step,
    this.to,
  });
  factory Range.fromXml(_s.XmlElement elem) {
    return Range(
      from: _s.extractXmlIntValue(elem, 'From'),
      step: _s.extractXmlIntValue(elem, 'Step'),
      to: _s.extractXmlIntValue(elem, 'To'),
    );
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final step = this.step;
    final to = this.to;
    return {
      if (from != null) 'From': from,
      if (step != null) 'Step': step,
      if (to != null) 'To': to,
    };
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

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
  }
}

class RemoveFromGlobalClusterResult {
  final GlobalCluster? globalCluster;

  RemoveFromGlobalClusterResult({
    this.globalCluster,
  });
  factory RemoveFromGlobalClusterResult.fromXml(_s.XmlElement elem) {
    return RemoveFromGlobalClusterResult(
      globalCluster:
          _s.extractXmlChild(elem, 'GlobalCluster')?.let(GlobalCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalCluster = this.globalCluster;
    return {
      if (globalCluster != null) 'GlobalCluster': globalCluster,
    };
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

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

/// Describes the pending maintenance actions for a resource.
class ResourcePendingMaintenanceActions {
  /// A list that provides details about the pending maintenance actions for the
  /// resource.
  final List<PendingMaintenanceAction>? pendingMaintenanceActionDetails;

  /// The ARN of the resource that has pending maintenance actions.
  final String? resourceIdentifier;

  ResourcePendingMaintenanceActions({
    this.pendingMaintenanceActionDetails,
    this.resourceIdentifier,
  });
  factory ResourcePendingMaintenanceActions.fromXml(_s.XmlElement elem) {
    return ResourcePendingMaintenanceActions(
      pendingMaintenanceActionDetails: _s
          .extractXmlChild(elem, 'PendingMaintenanceActionDetails')
          ?.let((elem) => elem
              .findElements('PendingMaintenanceAction')
              .map(PendingMaintenanceAction.fromXml)
              .toList()),
      resourceIdentifier: _s.extractXmlStringValue(elem, 'ResourceIdentifier'),
    );
  }

  Map<String, dynamic> toJson() {
    final pendingMaintenanceActionDetails =
        this.pendingMaintenanceActionDetails;
    final resourceIdentifier = this.resourceIdentifier;
    return {
      if (pendingMaintenanceActionDetails != null)
        'PendingMaintenanceActionDetails': pendingMaintenanceActionDetails,
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
    };
  }
}

class RestoreDBClusterFromSnapshotResult {
  final DBCluster? dBCluster;

  RestoreDBClusterFromSnapshotResult({
    this.dBCluster,
  });
  factory RestoreDBClusterFromSnapshotResult.fromXml(_s.XmlElement elem) {
    return RestoreDBClusterFromSnapshotResult(
      dBCluster: _s.extractXmlChild(elem, 'DBCluster')?.let(DBCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBCluster = this.dBCluster;
    return {
      if (dBCluster != null) 'DBCluster': dBCluster,
    };
  }
}

class RestoreDBClusterToPointInTimeResult {
  final DBCluster? dBCluster;

  RestoreDBClusterToPointInTimeResult({
    this.dBCluster,
  });
  factory RestoreDBClusterToPointInTimeResult.fromXml(_s.XmlElement elem) {
    return RestoreDBClusterToPointInTimeResult(
      dBCluster: _s.extractXmlChild(elem, 'DBCluster')?.let(DBCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBCluster = this.dBCluster;
    return {
      if (dBCluster != null) 'DBCluster': dBCluster,
    };
  }
}

/// Contains the scaling configuration of a Neptune Serverless DB cluster.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html">Using
/// Amazon Neptune Serverless</a> in the <i>Amazon Neptune User Guide</i>.
class ServerlessV2ScalingConfiguration {
  /// The maximum number of Neptune capacity units (NCUs) for a DB instance in a
  /// Neptune Serverless cluster. You can specify NCU values in half-step
  /// increments, such as 40, 40.5, 41, and so on.
  final double? maxCapacity;

  /// The minimum number of Neptune capacity units (NCUs) for a DB instance in a
  /// Neptune Serverless cluster. You can specify NCU values in half-step
  /// increments, such as 8, 8.5, 9, and so on.
  final double? minCapacity;

  ServerlessV2ScalingConfiguration({
    this.maxCapacity,
    this.minCapacity,
  });

  Map<String, dynamic> toJson() {
    final maxCapacity = this.maxCapacity;
    final minCapacity = this.minCapacity;
    return {
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (minCapacity != null) 'MinCapacity': minCapacity,
    };
  }
}

/// Shows the scaling configuration for a Neptune Serverless DB cluster.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html">Using
/// Amazon Neptune Serverless</a> in the <i>Amazon Neptune User Guide</i>.
class ServerlessV2ScalingConfigurationInfo {
  /// The maximum number of Neptune capacity units (NCUs) for a DB instance in a
  /// Neptune Serverless cluster. You can specify NCU values in half-step
  /// increments, such as 40, 40.5, 41, and so on.
  final double? maxCapacity;

  /// The minimum number of Neptune capacity units (NCUs) for a DB instance in a
  /// Neptune Serverless cluster. You can specify NCU values in half-step
  /// increments, such as 8, 8.5, 9, and so on.
  final double? minCapacity;

  ServerlessV2ScalingConfigurationInfo({
    this.maxCapacity,
    this.minCapacity,
  });
  factory ServerlessV2ScalingConfigurationInfo.fromXml(_s.XmlElement elem) {
    return ServerlessV2ScalingConfigurationInfo(
      maxCapacity: _s.extractXmlDoubleValue(elem, 'MaxCapacity'),
      minCapacity: _s.extractXmlDoubleValue(elem, 'MinCapacity'),
    );
  }

  Map<String, dynamic> toJson() {
    final maxCapacity = this.maxCapacity;
    final minCapacity = this.minCapacity;
    return {
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (minCapacity != null) 'MinCapacity': minCapacity,
    };
  }
}

enum SourceType {
  dbInstance,
  dbParameterGroup,
  dbSecurityGroup,
  dbSnapshot,
  dbCluster,
  dbClusterSnapshot,
}

extension SourceTypeValueExtension on SourceType {
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
      case SourceType.dbCluster:
        return 'db-cluster';
      case SourceType.dbClusterSnapshot:
        return 'db-cluster-snapshot';
    }
  }
}

extension SourceTypeFromString on String {
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
      case 'db-cluster':
        return SourceType.dbCluster;
      case 'db-cluster-snapshot':
        return SourceType.dbClusterSnapshot;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

class StartDBClusterResult {
  final DBCluster? dBCluster;

  StartDBClusterResult({
    this.dBCluster,
  });
  factory StartDBClusterResult.fromXml(_s.XmlElement elem) {
    return StartDBClusterResult(
      dBCluster: _s.extractXmlChild(elem, 'DBCluster')?.let(DBCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBCluster = this.dBCluster;
    return {
      if (dBCluster != null) 'DBCluster': dBCluster,
    };
  }
}

class StopDBClusterResult {
  final DBCluster? dBCluster;

  StopDBClusterResult({
    this.dBCluster,
  });
  factory StopDBClusterResult.fromXml(_s.XmlElement elem) {
    return StopDBClusterResult(
      dBCluster: _s.extractXmlChild(elem, 'DBCluster')?.let(DBCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dBCluster = this.dBCluster;
    return {
      if (dBCluster != null) 'DBCluster': dBCluster,
    };
  }
}

/// Specifies a subnet.
///
/// This data type is used as a response element in the
/// <a>DescribeDBSubnetGroups</a> action.
class Subnet {
  /// Specifies the EC2 Availability Zone that the subnet is in.
  final AvailabilityZone? subnetAvailabilityZone;

  /// Specifies the identifier of the subnet.
  final String? subnetIdentifier;

  /// Specifies the status of the subnet.
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

/// Metadata assigned to an Amazon Neptune resource consisting of a key-value
/// pair.
class Tag {
  /// A key is the required name of the tag. The string value can be from 1 to 128
  /// Unicode characters in length and can't be prefixed with <code>aws:</code> or
  /// <code>rds:</code>. The string can only contain the set of Unicode letters,
  /// digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  final String? key;

  /// A value is the optional value of the tag. The string value can be from 1 to
  /// 256 Unicode characters in length and can't be prefixed with
  /// <code>aws:</code> or <code>rds:</code>. The string can only contain the set
  /// of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java
  /// regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
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
}

class TagListMessage {
  /// List of tags returned by the ListTagsForResource operation.
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

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

/// A time zone associated with a <a>DBInstance</a>.
class Timezone {
  /// The name of the time zone.
  final String? timezoneName;

  Timezone({
    this.timezoneName,
  });
  factory Timezone.fromXml(_s.XmlElement elem) {
    return Timezone(
      timezoneName: _s.extractXmlStringValue(elem, 'TimezoneName'),
    );
  }

  Map<String, dynamic> toJson() {
    final timezoneName = this.timezoneName;
    return {
      if (timezoneName != null) 'TimezoneName': timezoneName,
    };
  }
}

/// The version of the database engine that a DB instance can be upgraded to.
class UpgradeTarget {
  /// A value that indicates whether the target version is applied to any source
  /// DB instances that have AutoMinorVersionUpgrade set to true.
  final bool? autoUpgrade;

  /// The version of the database engine that a DB instance can be upgraded to.
  final String? description;

  /// The name of the upgrade target database engine.
  final String? engine;

  /// The version number of the upgrade target database engine.
  final String? engineVersion;

  /// A value that indicates whether a database engine is upgraded to a major
  /// version.
  final bool? isMajorVersionUpgrade;

  /// A value that indicates whether you can use Neptune global databases with the
  /// target engine version.
  final bool? supportsGlobalDatabases;

  UpgradeTarget({
    this.autoUpgrade,
    this.description,
    this.engine,
    this.engineVersion,
    this.isMajorVersionUpgrade,
    this.supportsGlobalDatabases,
  });
  factory UpgradeTarget.fromXml(_s.XmlElement elem) {
    return UpgradeTarget(
      autoUpgrade: _s.extractXmlBoolValue(elem, 'AutoUpgrade'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      isMajorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'IsMajorVersionUpgrade'),
      supportsGlobalDatabases:
          _s.extractXmlBoolValue(elem, 'SupportsGlobalDatabases'),
    );
  }

  Map<String, dynamic> toJson() {
    final autoUpgrade = this.autoUpgrade;
    final description = this.description;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final isMajorVersionUpgrade = this.isMajorVersionUpgrade;
    final supportsGlobalDatabases = this.supportsGlobalDatabases;
    return {
      if (autoUpgrade != null) 'AutoUpgrade': autoUpgrade,
      if (description != null) 'Description': description,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (isMajorVersionUpgrade != null)
        'IsMajorVersionUpgrade': isMajorVersionUpgrade,
      if (supportsGlobalDatabases != null)
        'SupportsGlobalDatabases': supportsGlobalDatabases,
    };
  }
}

/// Information about valid modifications that you can make to your DB instance.
/// Contains the result of a successful call to the
/// <a>DescribeValidDBInstanceModifications</a> action. You can use this
/// information when you call <a>ModifyDBInstance</a>.
class ValidDBInstanceModificationsMessage {
  /// Valid storage options for your DB instance.
  final List<ValidStorageOptions>? storage;

  ValidDBInstanceModificationsMessage({
    this.storage,
  });
  factory ValidDBInstanceModificationsMessage.fromXml(_s.XmlElement elem) {
    return ValidDBInstanceModificationsMessage(
      storage: _s.extractXmlChild(elem, 'Storage')?.let((elem) => elem
          .findElements('ValidStorageOptions')
          .map(ValidStorageOptions.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final storage = this.storage;
    return {
      if (storage != null) 'Storage': storage,
    };
  }
}

/// Information about valid modifications that you can make to your DB instance.
///
/// Contains the result of a successful call to the
/// <a>DescribeValidDBInstanceModifications</a> action.
class ValidStorageOptions {
  /// The valid range of Provisioned IOPS to gibibytes of storage multiplier. For
  /// example, 3-10, which means that provisioned IOPS can be between 3 and 10
  /// times storage.
  final List<DoubleRange>? iopsToStorageRatio;

  /// The valid range of provisioned IOPS. For example, 1000-20000.
  final List<Range>? provisionedIops;

  /// The valid range of storage in gibibytes. For example, 100 to 16384.
  final List<Range>? storageSize;

  /// The valid storage types for your DB instance. For example, gp2, io1.
  final String? storageType;

  ValidStorageOptions({
    this.iopsToStorageRatio,
    this.provisionedIops,
    this.storageSize,
    this.storageType,
  });
  factory ValidStorageOptions.fromXml(_s.XmlElement elem) {
    return ValidStorageOptions(
      iopsToStorageRatio: _s.extractXmlChild(elem, 'IopsToStorageRatio')?.let(
          (elem) => elem
              .findElements('DoubleRange')
              .map(DoubleRange.fromXml)
              .toList()),
      provisionedIops: _s.extractXmlChild(elem, 'ProvisionedIops')?.let(
          (elem) => elem.findElements('Range').map(Range.fromXml).toList()),
      storageSize: _s.extractXmlChild(elem, 'StorageSize')?.let(
          (elem) => elem.findElements('Range').map(Range.fromXml).toList()),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
    );
  }

  Map<String, dynamic> toJson() {
    final iopsToStorageRatio = this.iopsToStorageRatio;
    final provisionedIops = this.provisionedIops;
    final storageSize = this.storageSize;
    final storageType = this.storageType;
    return {
      if (iopsToStorageRatio != null) 'IopsToStorageRatio': iopsToStorageRatio,
      if (provisionedIops != null) 'ProvisionedIops': provisionedIops,
      if (storageSize != null) 'StorageSize': storageSize,
      if (storageType != null) 'StorageType': storageType,
    };
  }
}

/// This data type is used as a response element for queries on VPC security
/// group membership.
class VpcSecurityGroupMembership {
  /// The status of the VPC security group.
  final String? status;

  /// The name of the VPC security group.
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

  Map<String, dynamic> toJson() {
    final status = this.status;
    final vpcSecurityGroupId = this.vpcSecurityGroupId;
    return {
      if (status != null) 'Status': status,
      if (vpcSecurityGroupId != null) 'VpcSecurityGroupId': vpcSecurityGroupId,
    };
  }
}

class AuthorizationNotFoundFault extends _s.GenericAwsException {
  AuthorizationNotFoundFault({String? type, String? message})
      : super(type: type, code: 'AuthorizationNotFoundFault', message: message);
}

class CertificateNotFoundFault extends _s.GenericAwsException {
  CertificateNotFoundFault({String? type, String? message})
      : super(type: type, code: 'CertificateNotFoundFault', message: message);
}

class DBClusterAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterAlreadyExistsFault({String? type, String? message})
      : super(
            type: type, code: 'DBClusterAlreadyExistsFault', message: message);
}

class DBClusterEndpointAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterEndpointAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterEndpointAlreadyExistsFault',
            message: message);
}

class DBClusterEndpointNotFoundFault extends _s.GenericAwsException {
  DBClusterEndpointNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterEndpointNotFoundFault',
            message: message);
}

class DBClusterEndpointQuotaExceededFault extends _s.GenericAwsException {
  DBClusterEndpointQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterEndpointQuotaExceededFault',
            message: message);
}

class DBClusterNotFoundFault extends _s.GenericAwsException {
  DBClusterNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBClusterNotFoundFault', message: message);
}

class DBClusterParameterGroupNotFoundFault extends _s.GenericAwsException {
  DBClusterParameterGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterParameterGroupNotFoundFault',
            message: message);
}

class DBClusterQuotaExceededFault extends _s.GenericAwsException {
  DBClusterQuotaExceededFault({String? type, String? message})
      : super(
            type: type, code: 'DBClusterQuotaExceededFault', message: message);
}

class DBClusterRoleAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterRoleAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterRoleAlreadyExistsFault',
            message: message);
}

class DBClusterRoleNotFoundFault extends _s.GenericAwsException {
  DBClusterRoleNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBClusterRoleNotFoundFault', message: message);
}

class DBClusterRoleQuotaExceededFault extends _s.GenericAwsException {
  DBClusterRoleQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterRoleQuotaExceededFault',
            message: message);
}

class DBClusterSnapshotAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterSnapshotAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterSnapshotAlreadyExistsFault',
            message: message);
}

class DBClusterSnapshotNotFoundFault extends _s.GenericAwsException {
  DBClusterSnapshotNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBClusterSnapshotNotFoundFault',
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

class DBSecurityGroupNotFoundFault extends _s.GenericAwsException {
  DBSecurityGroupNotFoundFault({String? type, String? message})
      : super(
            type: type, code: 'DBSecurityGroupNotFoundFault', message: message);
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

class DomainNotFoundFault extends _s.GenericAwsException {
  DomainNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DomainNotFoundFault', message: message);
}

class EventSubscriptionQuotaExceededFault extends _s.GenericAwsException {
  EventSubscriptionQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'EventSubscriptionQuotaExceededFault',
            message: message);
}

class GlobalClusterAlreadyExistsFault extends _s.GenericAwsException {
  GlobalClusterAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'GlobalClusterAlreadyExistsFault',
            message: message);
}

class GlobalClusterNotFoundFault extends _s.GenericAwsException {
  GlobalClusterNotFoundFault({String? type, String? message})
      : super(type: type, code: 'GlobalClusterNotFoundFault', message: message);
}

class GlobalClusterQuotaExceededFault extends _s.GenericAwsException {
  GlobalClusterQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'GlobalClusterQuotaExceededFault',
            message: message);
}

class InstanceQuotaExceededFault extends _s.GenericAwsException {
  InstanceQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'InstanceQuotaExceededFault', message: message);
}

class InsufficientDBClusterCapacityFault extends _s.GenericAwsException {
  InsufficientDBClusterCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientDBClusterCapacityFault',
            message: message);
}

class InsufficientDBInstanceCapacityFault extends _s.GenericAwsException {
  InsufficientDBInstanceCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientDBInstanceCapacityFault',
            message: message);
}

class InsufficientStorageClusterCapacityFault extends _s.GenericAwsException {
  InsufficientStorageClusterCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientStorageClusterCapacityFault',
            message: message);
}

class InvalidDBClusterEndpointStateFault extends _s.GenericAwsException {
  InvalidDBClusterEndpointStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBClusterEndpointStateFault',
            message: message);
}

class InvalidDBClusterSnapshotStateFault extends _s.GenericAwsException {
  InvalidDBClusterSnapshotStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBClusterSnapshotStateFault',
            message: message);
}

class InvalidDBClusterStateFault extends _s.GenericAwsException {
  InvalidDBClusterStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidDBClusterStateFault', message: message);
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

class InvalidGlobalClusterStateFault extends _s.GenericAwsException {
  InvalidGlobalClusterStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidGlobalClusterStateFault',
            message: message);
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

class KMSKeyNotAccessibleFault extends _s.GenericAwsException {
  KMSKeyNotAccessibleFault({String? type, String? message})
      : super(type: type, code: 'KMSKeyNotAccessibleFault', message: message);
}

class OptionGroupNotFoundFault extends _s.GenericAwsException {
  OptionGroupNotFoundFault({String? type, String? message})
      : super(type: type, code: 'OptionGroupNotFoundFault', message: message);
}

class ProvisionedIopsNotAvailableInAZFault extends _s.GenericAwsException {
  ProvisionedIopsNotAvailableInAZFault({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedIopsNotAvailableInAZFault',
            message: message);
}

class ResourceNotFoundFault extends _s.GenericAwsException {
  ResourceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundFault', message: message);
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

class SharedSnapshotQuotaExceededFault extends _s.GenericAwsException {
  SharedSnapshotQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'SharedSnapshotQuotaExceededFault',
            message: message);
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

class StorageTypeNotSupportedFault extends _s.GenericAwsException {
  StorageTypeNotSupportedFault({String? type, String? message})
      : super(
            type: type, code: 'StorageTypeNotSupportedFault', message: message);
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
  'AuthorizationNotFoundFault': (type, message) =>
      AuthorizationNotFoundFault(type: type, message: message),
  'CertificateNotFoundFault': (type, message) =>
      CertificateNotFoundFault(type: type, message: message),
  'DBClusterAlreadyExistsFault': (type, message) =>
      DBClusterAlreadyExistsFault(type: type, message: message),
  'DBClusterEndpointAlreadyExistsFault': (type, message) =>
      DBClusterEndpointAlreadyExistsFault(type: type, message: message),
  'DBClusterEndpointNotFoundFault': (type, message) =>
      DBClusterEndpointNotFoundFault(type: type, message: message),
  'DBClusterEndpointQuotaExceededFault': (type, message) =>
      DBClusterEndpointQuotaExceededFault(type: type, message: message),
  'DBClusterNotFoundFault': (type, message) =>
      DBClusterNotFoundFault(type: type, message: message),
  'DBClusterParameterGroupNotFoundFault': (type, message) =>
      DBClusterParameterGroupNotFoundFault(type: type, message: message),
  'DBClusterQuotaExceededFault': (type, message) =>
      DBClusterQuotaExceededFault(type: type, message: message),
  'DBClusterRoleAlreadyExistsFault': (type, message) =>
      DBClusterRoleAlreadyExistsFault(type: type, message: message),
  'DBClusterRoleNotFoundFault': (type, message) =>
      DBClusterRoleNotFoundFault(type: type, message: message),
  'DBClusterRoleQuotaExceededFault': (type, message) =>
      DBClusterRoleQuotaExceededFault(type: type, message: message),
  'DBClusterSnapshotAlreadyExistsFault': (type, message) =>
      DBClusterSnapshotAlreadyExistsFault(type: type, message: message),
  'DBClusterSnapshotNotFoundFault': (type, message) =>
      DBClusterSnapshotNotFoundFault(type: type, message: message),
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
  'DBSecurityGroupNotFoundFault': (type, message) =>
      DBSecurityGroupNotFoundFault(type: type, message: message),
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
  'DomainNotFoundFault': (type, message) =>
      DomainNotFoundFault(type: type, message: message),
  'EventSubscriptionQuotaExceededFault': (type, message) =>
      EventSubscriptionQuotaExceededFault(type: type, message: message),
  'GlobalClusterAlreadyExistsFault': (type, message) =>
      GlobalClusterAlreadyExistsFault(type: type, message: message),
  'GlobalClusterNotFoundFault': (type, message) =>
      GlobalClusterNotFoundFault(type: type, message: message),
  'GlobalClusterQuotaExceededFault': (type, message) =>
      GlobalClusterQuotaExceededFault(type: type, message: message),
  'InstanceQuotaExceededFault': (type, message) =>
      InstanceQuotaExceededFault(type: type, message: message),
  'InsufficientDBClusterCapacityFault': (type, message) =>
      InsufficientDBClusterCapacityFault(type: type, message: message),
  'InsufficientDBInstanceCapacityFault': (type, message) =>
      InsufficientDBInstanceCapacityFault(type: type, message: message),
  'InsufficientStorageClusterCapacityFault': (type, message) =>
      InsufficientStorageClusterCapacityFault(type: type, message: message),
  'InvalidDBClusterEndpointStateFault': (type, message) =>
      InvalidDBClusterEndpointStateFault(type: type, message: message),
  'InvalidDBClusterSnapshotStateFault': (type, message) =>
      InvalidDBClusterSnapshotStateFault(type: type, message: message),
  'InvalidDBClusterStateFault': (type, message) =>
      InvalidDBClusterStateFault(type: type, message: message),
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
  'InvalidGlobalClusterStateFault': (type, message) =>
      InvalidGlobalClusterStateFault(type: type, message: message),
  'InvalidRestoreFault': (type, message) =>
      InvalidRestoreFault(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'InvalidVPCNetworkStateFault': (type, message) =>
      InvalidVPCNetworkStateFault(type: type, message: message),
  'KMSKeyNotAccessibleFault': (type, message) =>
      KMSKeyNotAccessibleFault(type: type, message: message),
  'OptionGroupNotFoundFault': (type, message) =>
      OptionGroupNotFoundFault(type: type, message: message),
  'ProvisionedIopsNotAvailableInAZFault': (type, message) =>
      ProvisionedIopsNotAvailableInAZFault(type: type, message: message),
  'ResourceNotFoundFault': (type, message) =>
      ResourceNotFoundFault(type: type, message: message),
  'SNSInvalidTopicFault': (type, message) =>
      SNSInvalidTopicFault(type: type, message: message),
  'SNSNoAuthorizationFault': (type, message) =>
      SNSNoAuthorizationFault(type: type, message: message),
  'SNSTopicArnNotFoundFault': (type, message) =>
      SNSTopicArnNotFoundFault(type: type, message: message),
  'SharedSnapshotQuotaExceededFault': (type, message) =>
      SharedSnapshotQuotaExceededFault(type: type, message: message),
  'SnapshotQuotaExceededFault': (type, message) =>
      SnapshotQuotaExceededFault(type: type, message: message),
  'SourceNotFoundFault': (type, message) =>
      SourceNotFoundFault(type: type, message: message),
  'StorageQuotaExceededFault': (type, message) =>
      StorageQuotaExceededFault(type: type, message: message),
  'StorageTypeNotSupportedFault': (type, message) =>
      StorageTypeNotSupportedFault(type: type, message: message),
  'SubnetAlreadyInUse': (type, message) =>
      SubnetAlreadyInUse(type: type, message: message),
  'SubscriptionAlreadyExistFault': (type, message) =>
      SubscriptionAlreadyExistFault(type: type, message: message),
  'SubscriptionCategoryNotFoundFault': (type, message) =>
      SubscriptionCategoryNotFoundFault(type: type, message: message),
  'SubscriptionNotFoundFault': (type, message) =>
      SubscriptionNotFoundFault(type: type, message: message),
};
