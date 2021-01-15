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

import '2014-10-31.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

part '2014-10-31.g.dart';

/// Amazon DocumentDB API documentation
class DocDB {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  DocDB({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rds',
            signingName: 'rds',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Adds metadata tags to an Amazon DocumentDB resource. You can use these
  /// tags with cost allocation reporting to track costs that are associated
  /// with Amazon DocumentDB resources. or in a <code>Condition</code> statement
  /// in an AWS Identity and Access Management (IAM) policy for Amazon
  /// DocumentDB.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon DocumentDB resource that the tags are added to. This value is
  /// an Amazon Resource Name .
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Amazon DocumentDB resource.
  Future<void> addTagsToResource({
    @_s.required String resourceName,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tags, 'tags');
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

  /// Applies a pending maintenance action to a resource (for example, to an
  /// Amazon DocumentDB instance).
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [applyAction] :
  /// The pending maintenance action to apply to this resource.
  ///
  /// Valid values: <code>system-update</code>, <code>db-upgrade</code>
  ///
  /// Parameter [optInType] :
  /// A value that specifies the type of opt-in request or undoes an opt-in
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
  /// maintenance action applies to.
  Future<ApplyPendingMaintenanceActionResult> applyPendingMaintenanceAction({
    @_s.required String applyAction,
    @_s.required String optInType,
    @_s.required String resourceIdentifier,
  }) async {
    ArgumentError.checkNotNull(applyAction, 'applyAction');
    ArgumentError.checkNotNull(optInType, 'optInType');
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
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

  /// Copies the specified cluster parameter group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  ///
  /// Parameter [sourceDBClusterParameterGroupIdentifier] :
  /// The identifier or Amazon Resource Name (ARN) for the source cluster
  /// parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid cluster parameter group.
  /// </li>
  /// <li>
  /// If the source cluster parameter group is in the same AWS Region as the
  /// copy, specify a valid parameter group identifier; for example,
  /// <code>my-db-cluster-param-group</code>, or a valid ARN.
  /// </li>
  /// <li>
  /// If the source parameter group is in a different AWS Region than the copy,
  /// specify a valid cluster parameter group ARN; for example,
  /// <code>arn:aws:rds:us-east-1:123456789012:sample-cluster:sample-parameter-group</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetDBClusterParameterGroupDescription] :
  /// A description for the copied cluster parameter group.
  ///
  /// Parameter [targetDBClusterParameterGroupIdentifier] :
  /// The identifier for the copied cluster parameter group.
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
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster-param-group1</code>
  ///
  /// Parameter [tags] :
  /// The tags that are to be assigned to the parameter group.
  Future<CopyDBClusterParameterGroupResult> copyDBClusterParameterGroup({
    @_s.required String sourceDBClusterParameterGroupIdentifier,
    @_s.required String targetDBClusterParameterGroupDescription,
    @_s.required String targetDBClusterParameterGroupIdentifier,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(sourceDBClusterParameterGroupIdentifier,
        'sourceDBClusterParameterGroupIdentifier');
    ArgumentError.checkNotNull(targetDBClusterParameterGroupDescription,
        'targetDBClusterParameterGroupDescription');
    ArgumentError.checkNotNull(targetDBClusterParameterGroupIdentifier,
        'targetDBClusterParameterGroupIdentifier');
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

  /// Copies a snapshot of a cluster.
  ///
  /// To copy a cluster snapshot from a shared manual cluster snapshot,
  /// <code>SourceDBClusterSnapshotIdentifier</code> must be the Amazon Resource
  /// Name (ARN) of the shared cluster snapshot. You can only copy a shared DB
  /// cluster snapshot, whether encrypted or not, in the same AWS Region.
  ///
  /// To cancel the copy operation after it is in progress, delete the target
  /// cluster snapshot identified by
  /// <code>TargetDBClusterSnapshotIdentifier</code> while that cluster snapshot
  /// is in the <i>copying</i> status.
  ///
  /// May throw [DBClusterSnapshotAlreadyExistsFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [sourceDBClusterSnapshotIdentifier] :
  /// The identifier of the cluster snapshot to copy. This parameter is not case
  /// sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must specify a valid system snapshot in the <i>available</i> state.
  /// </li>
  /// <li>
  /// If the source snapshot is in the same AWS Region as the copy, specify a
  /// valid snapshot identifier.
  /// </li>
  /// <li>
  /// If the source snapshot is in a different AWS Region than the copy, specify
  /// a valid cluster snapshot ARN.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster-snapshot1</code>
  ///
  /// Parameter [targetDBClusterSnapshotIdentifier] :
  /// The identifier of the new cluster snapshot to create from the source
  /// cluster snapshot. This parameter is not case sensitive.
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
  /// Example: <code>my-cluster-snapshot2</code>
  ///
  /// Parameter [copyTags] :
  /// Set to <code>true</code> to copy all tags from the source cluster snapshot
  /// to the target cluster snapshot, and otherwise <code>false</code>. The
  /// default is <code>false</code>.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key ID for an encrypted cluster snapshot. The AWS KMS key ID
  /// is the Amazon Resource Name (ARN), AWS KMS key identifier, or the AWS KMS
  /// key alias for the AWS KMS encryption key.
  ///
  /// If you copy an encrypted cluster snapshot from your AWS account, you can
  /// specify a value for <code>KmsKeyId</code> to encrypt the copy with a new
  /// AWS KMS encryption key. If you don't specify a value for
  /// <code>KmsKeyId</code>, then the copy of the cluster snapshot is encrypted
  /// with the same AWS KMS key as the source cluster snapshot.
  ///
  /// If you copy an encrypted cluster snapshot that is shared from another AWS
  /// account, then you must specify a value for <code>KmsKeyId</code>.
  ///
  /// To copy an encrypted cluster snapshot to another AWS Region, set
  /// <code>KmsKeyId</code> to the AWS KMS key ID that you want to use to
  /// encrypt the copy of the cluster snapshot in the destination Region. AWS
  /// KMS encryption keys are specific to the AWS Region that they are created
  /// in, and you can't use encryption keys from one AWS Region in another AWS
  /// Region.
  ///
  /// If you copy an unencrypted cluster snapshot and specify a value for the
  /// <code>KmsKeyId</code> parameter, an error is returned.
  ///
  /// Parameter [preSignedUrl] :
  /// The URL that contains a Signature Version 4 signed request for the
  /// <code>CopyDBClusterSnapshot</code> API action in the AWS Region that
  /// contains the source cluster snapshot to copy. You must use the
  /// <code>PreSignedUrl</code> parameter when copying a cluster snapshot from
  /// another AWS Region.
  ///
  /// If you are using an AWS SDK tool or the AWS CLI, you can specify
  /// <code>SourceRegion</code> (or <code>--source-region</code> for the AWS
  /// CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying
  /// <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid
  /// request for the operation that can be executed in the source AWS Region.
  ///
  /// The presigned URL must be a valid request for the
  /// <code>CopyDBClusterSnapshot</code> API action that can be executed in the
  /// source AWS Region that contains the cluster snapshot to be copied. The
  /// presigned URL request must contain the following parameter values:
  ///
  /// <ul>
  /// <li>
  /// <code>SourceRegion</code> - The ID of the region that contains the
  /// snapshot to be copied.
  /// </li>
  /// <li>
  /// <code>SourceDBClusterSnapshotIdentifier</code> - The identifier for the
  /// the encrypted cluster snapshot to be copied. This identifier must be in
  /// the Amazon Resource Name (ARN) format for the source AWS Region. For
  /// example, if you are copying an encrypted cluster snapshot from the
  /// us-east-1 AWS Region, then your
  /// <code>SourceDBClusterSnapshotIdentifier</code> looks something like the
  /// following:
  /// <code>arn:aws:rds:us-east-1:12345678012:sample-cluster:sample-cluster-snapshot</code>.
  /// </li>
  /// <li>
  /// <code>TargetDBClusterSnapshotIdentifier</code> - The identifier for the
  /// new cluster snapshot to be created. This parameter isn't case sensitive.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the cluster snapshot.
  Future<CopyDBClusterSnapshotResult> copyDBClusterSnapshot({
    @_s.required String sourceDBClusterSnapshotIdentifier,
    @_s.required String targetDBClusterSnapshotIdentifier,
    bool copyTags,
    String kmsKeyId,
    String preSignedUrl,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        sourceDBClusterSnapshotIdentifier, 'sourceDBClusterSnapshotIdentifier');
    ArgumentError.checkNotNull(
        targetDBClusterSnapshotIdentifier, 'targetDBClusterSnapshotIdentifier');
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

  /// Creates a new Amazon DocumentDB cluster.
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
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The cluster identifier. This parameter is stored as a lowercase string.
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
  /// Example: <code>my-cluster</code>
  ///
  /// Parameter [engine] :
  /// The name of the database engine to be used for this cluster.
  ///
  /// Valid values: <code>docdb</code>
  ///
  /// Parameter [masterUserPassword] :
  /// The password for the master database user. This password can contain any
  /// printable ASCII character except forward slash (/), double quote ("), or
  /// the "at" symbol (@).
  ///
  /// Constraints: Must contain from 8 to 100 characters.
  ///
  /// Parameter [masterUsername] :
  /// The name of the master user for the cluster.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be from 1 to 63 letters or numbers.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Cannot be a reserved word for the chosen database engine.
  /// </li>
  /// </ul>
  ///
  /// Parameter [availabilityZones] :
  /// A list of Amazon EC2 Availability Zones that instances in the cluster can
  /// be created in.
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
  /// Must be a value from 1 to 35.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the cluster parameter group to associate with this cluster.
  ///
  /// Parameter [dBSubnetGroupName] :
  /// A subnet group to associate with this cluster.
  ///
  /// Constraints: Must match the name of an existing
  /// <code>DBSubnetGroup</code>. Must not be default.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// Specifies whether this cluster can be deleted. If
  /// <code>DeletionProtection</code> is enabled, the cluster cannot be deleted
  /// unless it is modified and <code>DeletionProtection</code> is disabled.
  /// <code>DeletionProtection</code> protects clusters from being accidentally
  /// deleted.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// A list of log types that need to be enabled for exporting to Amazon
  /// CloudWatch Logs. You can enable audit logs or profiler logs. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/documentdb/latest/developerguide/event-auditing.html">
  /// Auditing Amazon DocumentDB Events</a> and <a
  /// href="https://docs.aws.amazon.com/documentdb/latest/developerguide/profiling.html">
  /// Profiling Amazon DocumentDB Operations</a>.
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to use. The --engine-version
  /// will default to the latest major engine version. For production workloads,
  /// we recommend explicitly declaring this parameter with the intended major
  /// engine version.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier for an encrypted cluster.
  ///
  /// The AWS KMS key identifier is the Amazon Resource Name (ARN) for the AWS
  /// KMS encryption key. If you are creating a cluster using the same AWS
  /// account that owns the AWS KMS encryption key that is used to encrypt the
  /// new cluster, you can use the AWS KMS key alias instead of the ARN for the
  /// AWS KMS encryption key.
  ///
  /// If an encryption key is not specified in <code>KmsKeyId</code>:
  ///
  /// <ul>
  /// <li>
  /// If the <code>StorageEncrypted</code> parameter is <code>true</code>,
  /// Amazon DocumentDB uses your default encryption key.
  /// </li>
  /// </ul>
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  ///
  /// Parameter [port] :
  /// The port number on which the instances in the cluster accept connections.
  ///
  /// Parameter [preSignedUrl] :
  /// Not currently supported.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled using the <code>BackupRetentionPeriod</code>
  /// parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region.
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
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [storageEncrypted] :
  /// Specifies whether the cluster is encrypted.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with this cluster.
  Future<CreateDBClusterResult> createDBCluster({
    @_s.required String dBClusterIdentifier,
    @_s.required String engine,
    @_s.required String masterUserPassword,
    @_s.required String masterUsername,
    List<String> availabilityZones,
    int backupRetentionPeriod,
    String dBClusterParameterGroupName,
    String dBSubnetGroupName,
    bool deletionProtection,
    List<String> enableCloudwatchLogsExports,
    String engineVersion,
    String kmsKeyId,
    int port,
    String preSignedUrl,
    String preferredBackupWindow,
    String preferredMaintenanceWindow,
    bool storageEncrypted,
    List<Tag> tags,
    List<String> vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    ArgumentError.checkNotNull(masterUserPassword, 'masterUserPassword');
    ArgumentError.checkNotNull(masterUsername, 'masterUsername');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['Engine'] = engine;
    $request['MasterUserPassword'] = masterUserPassword;
    $request['MasterUsername'] = masterUsername;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preSignedUrl?.also((arg) => $request['PreSignedUrl'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    storageEncrypted?.also((arg) => $request['StorageEncrypted'] = arg);
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

  /// Creates a new cluster parameter group.
  ///
  /// Parameters in a cluster parameter group apply to all of the instances in a
  /// cluster.
  ///
  /// A cluster parameter group is initially created with the default parameters
  /// for the database engine used by instances in the cluster. In Amazon
  /// DocumentDB, you cannot make modifications directly to the
  /// <code>default.docdb3.6</code> cluster parameter group. If your Amazon
  /// DocumentDB cluster is using the default cluster parameter group and you
  /// want to modify a value in it, you must first <a
  /// href="https://docs.aws.amazon.com/documentdb/latest/developerguide/cluster_parameter_group-create.html">
  /// create a new parameter group</a> or <a
  /// href="https://docs.aws.amazon.com/documentdb/latest/developerguide/cluster_parameter_group-copy.html">
  /// copy an existing parameter group</a>, modify it, and then apply the
  /// modified parameter group to your cluster. For the new cluster parameter
  /// group and associated settings to take effect, you must then reboot the
  /// instances in the cluster without failover. For more information, see <a
  /// href="https://docs.aws.amazon.com/documentdb/latest/developerguide/cluster_parameter_group-modify.html">
  /// Modifying Amazon DocumentDB Cluster Parameter Groups</a>.
  ///
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must not match the name of an existing
  /// <code>DBClusterParameterGroup</code>.
  /// </li>
  /// </ul> <note>
  /// This value is stored as a lowercase string.
  /// </note>
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The cluster parameter group family name.
  ///
  /// Parameter [description] :
  /// The description for the cluster parameter group.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the cluster parameter group.
  Future<CreateDBClusterParameterGroupResult> createDBClusterParameterGroup({
    @_s.required String dBClusterParameterGroupName,
    @_s.required String dBParameterGroupFamily,
    @_s.required String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
    ArgumentError.checkNotNull(description, 'description');
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

  /// Creates a snapshot of a cluster.
  ///
  /// May throw [DBClusterSnapshotAlreadyExistsFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterNotFoundFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The identifier of the cluster to create a snapshot for. This parameter is
  /// not case sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing <code>DBCluster</code>.
  /// </li>
  /// </ul>
  /// Example: <code>my-cluster</code>
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier of the cluster snapshot. This parameter is stored as a
  /// lowercase string.
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
  /// Example: <code>my-cluster-snapshot1</code>
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the cluster snapshot.
  Future<CreateDBClusterSnapshotResult> createDBClusterSnapshot({
    @_s.required String dBClusterIdentifier,
    @_s.required String dBClusterSnapshotIdentifier,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(
        dBClusterSnapshotIdentifier, 'dBClusterSnapshotIdentifier');
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

  /// Creates a new instance.
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
  /// May throw [DBClusterNotFoundFault].
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The identifier of the cluster that the instance will belong to.
  ///
  /// Parameter [dBInstanceClass] :
  /// The compute and memory capacity of the instance; for example,
  /// <code>db.r5.large</code>.
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The instance identifier. This parameter is stored as a lowercase string.
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
  /// Parameter [engine] :
  /// The name of the database engine to be used for this instance.
  ///
  /// Valid value: <code>docdb</code>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// Indicates that minor engine upgrades are applied automatically to the
  /// instance during the maintenance window.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [availabilityZone] :
  /// The Amazon EC2 Availability Zone that the instance is created in.
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's AWS
  /// Region.
  ///
  /// Example: <code>us-east-1d</code>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The time range each week during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [promotionTier] :
  /// A value that specifies the order in which an Amazon DocumentDB replica is
  /// promoted to the primary instance after a failure of the existing primary
  /// instance.
  ///
  /// Default: 1
  ///
  /// Valid values: 0-15
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the instance. You can assign up to 10 tags to
  /// an instance.
  Future<CreateDBInstanceResult> createDBInstance({
    @_s.required String dBClusterIdentifier,
    @_s.required String dBInstanceClass,
    @_s.required String dBInstanceIdentifier,
    @_s.required String engine,
    bool autoMinorVersionUpgrade,
    String availabilityZone,
    String preferredMaintenanceWindow,
    int promotionTier,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(dBInstanceClass, 'dBInstanceClass');
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['DBInstanceClass'] = dBInstanceClass;
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['Engine'] = engine;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    promotionTier?.also((arg) => $request['PromotionTier'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
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

  /// Creates a new subnet group. subnet groups must contain at least one subnet
  /// in at least two Availability Zones in the AWS Region.
  ///
  /// May throw [DBSubnetGroupAlreadyExistsFault].
  /// May throw [DBSubnetGroupQuotaExceededFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  ///
  /// Parameter [dBSubnetGroupDescription] :
  /// The description for the subnet group.
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name for the subnet group. This value is stored as a lowercase string.
  ///
  /// Constraints: Must contain no more than 255 letters, numbers, periods,
  /// underscores, spaces, or hyphens. Must not be default.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [subnetIds] :
  /// The Amazon EC2 subnet IDs for the subnet group.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the subnet group.
  Future<CreateDBSubnetGroupResult> createDBSubnetGroup({
    @_s.required String dBSubnetGroupDescription,
    @_s.required String dBSubnetGroupName,
    @_s.required List<String> subnetIds,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        dBSubnetGroupDescription, 'dBSubnetGroupDescription');
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
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

  /// Deletes a previously provisioned cluster. When you delete a cluster, all
  /// automated backups for that cluster are deleted and can't be recovered.
  /// Manual DB cluster snapshots of the specified cluster are not deleted.
  /// <p/>
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [DBClusterSnapshotAlreadyExistsFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The cluster identifier for the cluster to be deleted. This parameter isn't
  /// case sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match an existing <code>DBClusterIdentifier</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [finalDBSnapshotIdentifier] :
  /// The cluster snapshot identifier of the new cluster snapshot created when
  /// <code>SkipFinalSnapshot</code> is set to <code>false</code>.
  /// <note>
  /// Specifying this parameter and also setting the
  /// <code>SkipFinalShapshot</code> parameter to <code>true</code> results in
  /// an error.
  /// </note>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be from 1 to 255 letters, numbers, or hyphens.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [skipFinalSnapshot] :
  /// Determines whether a final cluster snapshot is created before the cluster
  /// is deleted. If <code>true</code> is specified, no cluster snapshot is
  /// created. If <code>false</code> is specified, a cluster snapshot is created
  /// before the DB cluster is deleted.
  /// <note>
  /// If <code>SkipFinalSnapshot</code> is <code>false</code>, you must specify
  /// a <code>FinalDBSnapshotIdentifier</code> parameter.
  /// </note>
  /// Default: <code>false</code>
  Future<DeleteDBClusterResult> deleteDBCluster({
    @_s.required String dBClusterIdentifier,
    String finalDBSnapshotIdentifier,
    bool skipFinalSnapshot,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
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

  /// Deletes a specified cluster parameter group. The cluster parameter group
  /// to be deleted can't be associated with any clusters.
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be the name of an existing cluster parameter group.
  /// </li>
  /// <li>
  /// You can't delete a default cluster parameter group.
  /// </li>
  /// <li>
  /// Cannot be associated with any clusters.
  /// </li>
  /// </ul>
  Future<void> deleteDBClusterParameterGroup({
    @_s.required String dBClusterParameterGroupName,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
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

  /// Deletes a cluster snapshot. If the snapshot is being copied, the copy
  /// operation is terminated.
  /// <note>
  /// The cluster snapshot must be in the <code>available</code> state to be
  /// deleted.
  /// </note>
  ///
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [DBClusterSnapshotNotFoundFault].
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier of the cluster snapshot to delete.
  ///
  /// Constraints: Must be the name of an existing cluster snapshot in the
  /// <code>available</code> state.
  Future<DeleteDBClusterSnapshotResult> deleteDBClusterSnapshot({
    @_s.required String dBClusterSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterSnapshotIdentifier, 'dBClusterSnapshotIdentifier');
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

  /// Deletes a previously provisioned instance.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidDBClusterStateFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The instance identifier for the instance to be deleted. This parameter
  /// isn't case sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the name of an existing instance.
  /// </li>
  /// </ul>
  Future<DeleteDBInstanceResult> deleteDBInstance({
    @_s.required String dBInstanceIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
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

  /// Deletes a subnet group.
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
  /// Must match the name of an existing <code>DBSubnetGroup</code>. Must not be
  /// default.
  ///
  /// Example: <code>mySubnetgroup</code>
  Future<void> deleteDBSubnetGroup({
    @_s.required String dBSubnetGroupName,
  }) async {
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
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

  /// Returns a list of certificate authority (CA) certificates provided by
  /// Amazon DocumentDB for this AWS account.
  ///
  /// May throw [CertificateNotFoundFault].
  ///
  /// Parameter [certificateIdentifier] :
  /// The user-supplied certificate identifier. If this parameter is specified,
  /// information for only the specified certificate is returned. If this
  /// parameter is omitted, a list of up to <code>MaxRecords</code> certificates
  /// is returned. This parameter is not case sensitive.
  ///
  /// Constraints
  ///
  /// <ul>
  /// <li>
  /// Must match an existing <code>CertificateIdentifier</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous
  /// <code>DescribeCertificates</code> request. If this parameter is specified,
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
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Minimum: 20
  /// </li>
  /// <li>
  /// Maximum: 100
  /// </li>
  /// </ul>
  Future<CertificateMessage> describeCertificates({
    String certificateIdentifier,
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    certificateIdentifier
        ?.also((arg) => $request['CertificateIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCertificates',
      version: '2014-10-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCertificatesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCertificatesResult',
    );
    return CertificateMessage.fromXml($result);
  }

  /// Returns a list of <code>DBClusterParameterGroup</code> descriptions. If a
  /// <code>DBClusterParameterGroupName</code> parameter is specified, the list
  /// contains only the description of the specified cluster parameter group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of a specific cluster parameter group to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If provided, must match the name of an existing
  /// <code>DBClusterParameterGroup</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBClusterParameterGroupsMessage> describeDBClusterParameterGroups({
    String dBClusterParameterGroupName,
    List<Filter> filters,
    String marker,
    int maxRecords,
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

  /// Returns the detailed parameter list for a particular cluster parameter
  /// group.
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of a specific cluster parameter group to return parameter details
  /// for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If provided, must match the name of an existing
  /// <code>DBClusterParameterGroup</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
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
    @_s.required String dBClusterParameterGroupName,
    List<Filter> filters,
    String marker,
    int maxRecords,
    String source,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
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

  /// Returns a list of cluster snapshot attribute names and values for a manual
  /// DB cluster snapshot.
  ///
  /// When you share snapshots with other AWS accounts,
  /// <code>DescribeDBClusterSnapshotAttributes</code> returns the
  /// <code>restore</code> attribute and a list of IDs for the AWS accounts that
  /// are authorized to copy or restore the manual cluster snapshot. If
  /// <code>all</code> is included in the list of values for the
  /// <code>restore</code> attribute, then the manual cluster snapshot is public
  /// and can be copied or restored by all AWS accounts.
  ///
  /// May throw [DBClusterSnapshotNotFoundFault].
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier for the cluster snapshot to describe the attributes for.
  Future<DescribeDBClusterSnapshotAttributesResult>
      describeDBClusterSnapshotAttributes({
    @_s.required String dBClusterSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterSnapshotIdentifier, 'dBClusterSnapshotIdentifier');
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

  /// Returns information about cluster snapshots. This API operation supports
  /// pagination.
  ///
  /// May throw [DBClusterSnapshotNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The ID of the cluster to retrieve the list of cluster snapshots for. This
  /// parameter can't be used with the <code>DBClusterSnapshotIdentifier</code>
  /// parameter. This parameter is not case sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If provided, must match the identifier of an existing
  /// <code>DBCluster</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// A specific cluster snapshot identifier to describe. This parameter can't
  /// be used with the <code>DBClusterIdentifier</code> parameter. This value is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If provided, must match the identifier of an existing
  /// <code>DBClusterSnapshot</code>.
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
  /// Set to <code>true</code> to include manual cluster snapshots that are
  /// public and can be copied or restored by any AWS account, and otherwise
  /// <code>false</code>. The default is <code>false</code>.
  ///
  /// Parameter [includeShared] :
  /// Set to <code>true</code> to include shared manual cluster snapshots from
  /// other AWS accounts that this AWS account has been given permission to copy
  /// or restore, and otherwise <code>false</code>. The default is
  /// <code>false</code>.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [snapshotType] :
  /// The type of cluster snapshots to be returned. You can specify one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>automated</code> - Return all cluster snapshots that Amazon
  /// DocumentDB has automatically created for your AWS account.
  /// </li>
  /// <li>
  /// <code>manual</code> - Return all cluster snapshots that you have manually
  /// created for your AWS account.
  /// </li>
  /// <li>
  /// <code>shared</code> - Return all manual cluster snapshots that have been
  /// shared to your AWS account.
  /// </li>
  /// <li>
  /// <code>public</code> - Return all cluster snapshots that have been marked
  /// as public.
  /// </li>
  /// </ul>
  /// If you don't specify a <code>SnapshotType</code> value, then both
  /// automated and manual cluster snapshots are returned. You can include
  /// shared cluster snapshots with these results by setting the
  /// <code>IncludeShared</code> parameter to <code>true</code>. You can include
  /// public cluster snapshots with these results by setting the
  /// <code>IncludePublic</code> parameter to <code>true</code>.
  ///
  /// The <code>IncludeShared</code> and <code>IncludePublic</code> parameters
  /// don't apply for <code>SnapshotType</code> values of <code>manual</code> or
  /// <code>automated</code>. The <code>IncludePublic</code> parameter doesn't
  /// apply when <code>SnapshotType</code> is set to <code>shared</code>. The
  /// <code>IncludeShared</code> parameter doesn't apply when
  /// <code>SnapshotType</code> is set to <code>public</code>.
  Future<DBClusterSnapshotMessage> describeDBClusterSnapshots({
    String dBClusterIdentifier,
    String dBClusterSnapshotIdentifier,
    List<Filter> filters,
    bool includePublic,
    bool includeShared,
    String marker,
    int maxRecords,
    String snapshotType,
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

  /// Returns information about provisioned Amazon DocumentDB clusters. This API
  /// operation supports pagination. For certain management features such as
  /// cluster and instance lifecycle management, Amazon DocumentDB leverages
  /// operational technology that is shared with Amazon RDS and Amazon Neptune.
  /// Use the <code>filterName=engine,Values=docdb</code> filter parameter to
  /// return only Amazon DocumentDB clusters.
  ///
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The user-provided cluster identifier. If this parameter is specified,
  /// information from only the specific cluster is returned. This parameter
  /// isn't case sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If provided, must match an existing <code>DBClusterIdentifier</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more clusters to describe.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts cluster identifiers and cluster
  /// Amazon Resource Names (ARNs). The results list only includes information
  /// about the clusters identified by these ARNs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBClusterMessage> describeDBClusters({
    String dBClusterIdentifier,
    List<Filter> filters,
    String marker,
    int maxRecords,
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

  /// Returns a list of the available engines.
  ///
  /// Parameter [dBParameterGroupFamily] :
  /// The name of a specific parameter group family to return details for.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If provided, must match an existing <code>DBParameterGroupFamily</code>.
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
  /// Example: <code>3.6.0</code>
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
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
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBEngineVersionMessage> describeDBEngineVersions({
    String dBParameterGroupFamily,
    bool defaultOnly,
    String engine,
    String engineVersion,
    List<Filter> filters,
    bool listSupportedCharacterSets,
    bool listSupportedTimezones,
    String marker,
    int maxRecords,
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

  /// Returns information about provisioned Amazon DocumentDB instances. This
  /// API supports pagination.
  ///
  /// May throw [DBInstanceNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The user-provided instance identifier. If this parameter is specified,
  /// information from only the specific instance is returned. This parameter
  /// isn't case sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// If provided, must match the identifier of an existing
  /// <code>DBInstance</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filters] :
  /// A filter that specifies one or more instances to describe.
  ///
  /// Supported filters:
  ///
  /// <ul>
  /// <li>
  /// <code>db-cluster-id</code> - Accepts cluster identifiers and cluster
  /// Amazon Resource Names (ARNs). The results list includes only the
  /// information about the instances that are associated with the clusters that
  /// are identified by these ARNs.
  /// </li>
  /// <li>
  /// <code>db-instance-id</code> - Accepts instance identifiers and instance
  /// ARNs. The results list includes only the information about the instances
  /// that are identified by these ARNs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBInstanceMessage> describeDBInstances({
    String dBInstanceIdentifier,
    List<Filter> filters,
    String marker,
    int maxRecords,
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

  /// Returns a list of <code>DBSubnetGroup</code> descriptions. If a
  /// <code>DBSubnetGroupName</code> is specified, the list will contain only
  /// the descriptions of the specified <code>DBSubnetGroup</code>.
  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name of the subnet group to return details for.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DBSubnetGroupMessage> describeDBSubnetGroups({
    String dBSubnetGroupName,
    List<Filter> filters,
    String marker,
    int maxRecords,
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
  /// The name of the cluster parameter group family to return the engine
  /// parameter information for.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeEngineDefaultClusterParametersResult>
      describeEngineDefaultClusterParameters({
    @_s.required String dBParameterGroupFamily,
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
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

  /// Displays a list of categories for all event source types, or, if
  /// specified, for a specified source type.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [sourceType] :
  /// The type of source that is generating the events.
  ///
  /// Valid values: <code>db-instance</code>, <code>db-parameter-group</code>,
  /// <code>db-security-group</code>, <code>db-snapshot</code>
  Future<EventCategoriesMessage> describeEventCategories({
    List<Filter> filters,
    String sourceType,
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

  /// Returns events related to instances, security groups, snapshots, and DB
  /// parameter groups for the past 14 days. You can obtain events specific to a
  /// particular DB instance, security group, snapshot, or parameter group by
  /// providing the name as a parameter. By default, the events of the past hour
  /// are returned.
  ///
  /// Parameter [duration] :
  /// The number of minutes to retrieve events for.
  ///
  /// Default: 60
  ///
  /// Parameter [endTime] :
  /// The end of the time interval for which to retrieve events, specified in
  /// ISO 8601 format.
  ///
  /// Example: 2009-07-08T18:00Z
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories that trigger notifications for an event
  /// notification subscription.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
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
  /// If <code>SourceIdentifier</code> is provided, <code>SourceType</code> must
  /// also be provided.
  /// </li>
  /// <li>
  /// If the source type is <code>DBInstance</code>, a
  /// <code>DBInstanceIdentifier</code> must be provided.
  /// </li>
  /// <li>
  /// If the source type is <code>DBSecurityGroup</code>, a
  /// <code>DBSecurityGroupName</code> must be provided.
  /// </li>
  /// <li>
  /// If the source type is <code>DBParameterGroup</code>, a
  /// <code>DBParameterGroupName</code> must be provided.
  /// </li>
  /// <li>
  /// If the source type is <code>DBSnapshot</code>, a
  /// <code>DBSnapshotIdentifier</code> must be provided.
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
  /// ISO 8601 format.
  ///
  /// Example: 2009-07-08T18:00Z
  Future<EventsMessage> describeEvents({
    int duration,
    DateTime endTime,
    List<String> eventCategories,
    List<Filter> filters,
    String marker,
    int maxRecords,
    String sourceIdentifier,
    SourceType sourceType,
    DateTime startTime,
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

  /// Returns a list of orderable instance options for the specified engine.
  ///
  /// Parameter [engine] :
  /// The name of the engine to retrieve instance options for.
  ///
  /// Parameter [dBInstanceClass] :
  /// The instance class filter value. Specify this parameter to show only the
  /// available offerings that match the specified instance class.
  ///
  /// Parameter [engineVersion] :
  /// The engine version filter value. Specify this parameter to show only the
  /// available offerings that match the specified engine version.
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  ///
  /// Parameter [licenseModel] :
  /// The license model filter value. Specify this parameter to show only the
  /// available offerings that match the specified license model.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [vpc] :
  /// The virtual private cloud (VPC) filter value. Specify this parameter to
  /// show only the available VPC or non-VPC offerings.
  Future<OrderableDBInstanceOptionsMessage> describeOrderableDBInstanceOptions({
    @_s.required String engine,
    String dBInstanceClass,
    String engineVersion,
    List<Filter> filters,
    String licenseModel,
    String marker,
    int maxRecords,
    bool vpc,
  }) async {
    ArgumentError.checkNotNull(engine, 'engine');
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

  /// Returns a list of resources (for example, instances) that have at least
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
  /// <code>db-cluster-id</code> - Accepts cluster identifiers and cluster
  /// Amazon Resource Names (ARNs). The results list includes only pending
  /// maintenance actions for the clusters identified by these ARNs.
  /// </li>
  /// <li>
  /// <code>db-instance-id</code> - Accepts instance identifiers and instance
  /// ARNs. The results list includes only pending maintenance actions for the
  /// DB instances identified by these ARNs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ARN of a resource to return pending maintenance actions for.
  Future<PendingMaintenanceActionsMessage> describePendingMaintenanceActions({
    List<Filter> filters,
    String marker,
    int maxRecords,
    String resourceIdentifier,
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

  /// Forces a failover for a cluster.
  ///
  /// A failover for a cluster promotes one of the Amazon DocumentDB replicas
  /// (read-only instances) in the cluster to be the primary instance (the
  /// cluster writer).
  ///
  /// If the primary instance fails, Amazon DocumentDB automatically fails over
  /// to an Amazon DocumentDB replica, if one exists. You can force a failover
  /// when you want to simulate a failure of a primary instance for testing.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// A cluster identifier to force a failover for. This parameter is not case
  /// sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing <code>DBCluster</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetDBInstanceIdentifier] :
  /// The name of the instance to promote to the primary instance.
  ///
  /// You must specify the instance identifier for an Amazon DocumentDB replica
  /// in the cluster. For example, <code>mydbcluster-replica1</code>.
  Future<FailoverDBClusterResult> failoverDBCluster({
    String dBClusterIdentifier,
    String targetDBInstanceIdentifier,
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

  /// Lists all tags on an Amazon DocumentDB resource.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon DocumentDB resource with tags to be listed. This value is an
  /// Amazon Resource Name (ARN).
  ///
  /// Parameter [filters] :
  /// This parameter is not currently supported.
  Future<TagListMessage> listTagsForResource({
    @_s.required String resourceName,
    List<Filter> filters,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
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

  /// Modifies a setting for an Amazon DocumentDB cluster. You can change one or
  /// more database configuration parameters by specifying these parameters and
  /// the new values in the request.
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
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The cluster identifier for the cluster that is being modified. This
  /// parameter is not case sensitive.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing <code>DBCluster</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [applyImmediately] :
  /// A value that specifies whether the changes in this request and any pending
  /// changes are asynchronously applied as soon as possible, regardless of the
  /// <code>PreferredMaintenanceWindow</code> setting for the cluster. If this
  /// parameter is set to <code>false</code>, changes to the cluster are applied
  /// during the next maintenance window.
  ///
  /// The <code>ApplyImmediately</code> parameter affects only the
  /// <code>NewDBClusterIdentifier</code> and <code>MasterUserPassword</code>
  /// values. If you set this parameter value to <code>false</code>, the changes
  /// to the <code>NewDBClusterIdentifier</code> and
  /// <code>MasterUserPassword</code> values are applied during the next
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
  /// Must be a value from 1 to 35.
  /// </li>
  /// </ul>
  ///
  /// Parameter [cloudwatchLogsExportConfiguration] :
  /// The configuration setting for the log types to be enabled for export to
  /// Amazon CloudWatch Logs for a specific instance or cluster. The
  /// <code>EnableLogTypes</code> and <code>DisableLogTypes</code> arrays
  /// determine which logs are exported (or not exported) to CloudWatch Logs.
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the cluster parameter group to use for the cluster.
  ///
  /// Parameter [deletionProtection] :
  /// Specifies whether this cluster can be deleted. If
  /// <code>DeletionProtection</code> is enabled, the cluster cannot be deleted
  /// unless it is modified and <code>DeletionProtection</code> is disabled.
  /// <code>DeletionProtection</code> protects clusters from being accidentally
  /// deleted.
  ///
  /// Parameter [engineVersion] :
  /// The version number of the database engine to which you want to upgrade.
  /// Changing this parameter results in an outage. The change is applied during
  /// the next maintenance window unless the <code>ApplyImmediately</code>
  /// parameter is set to <code>true</code>.
  ///
  /// Parameter [masterUserPassword] :
  /// The password for the master database user. This password can contain any
  /// printable ASCII character except forward slash (/), double quote ("), or
  /// the "at" symbol (@).
  ///
  /// Constraints: Must contain from 8 to 100 characters.
  ///
  /// Parameter [newDBClusterIdentifier] :
  /// The new cluster identifier for the cluster when renaming a cluster. This
  /// value is stored as a lowercase string.
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
  /// Example: <code>my-cluster2</code>
  ///
  /// Parameter [port] :
  /// The port number on which the cluster accepts connections.
  ///
  /// Constraints: Must be a value from <code>1150</code> to <code>65535</code>.
  ///
  /// Default: The same port as the original cluster.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled, using the
  /// <code>BackupRetentionPeriod</code> parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region.
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
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of virtual private cloud (VPC) security groups that the cluster
  /// will belong to.
  Future<ModifyDBClusterResult> modifyDBCluster({
    @_s.required String dBClusterIdentifier,
    bool applyImmediately,
    int backupRetentionPeriod,
    CloudwatchLogsExportConfiguration cloudwatchLogsExportConfiguration,
    String dBClusterParameterGroupName,
    bool deletionProtection,
    String engineVersion,
    String masterUserPassword,
    String newDBClusterIdentifier,
    int port,
    String preferredBackupWindow,
    String preferredMaintenanceWindow,
    List<String> vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    cloudwatchLogsExportConfiguration
        ?.also((arg) => $request['CloudwatchLogsExportConfiguration'] = arg);
    dBClusterParameterGroupName
        ?.also((arg) => $request['DBClusterParameterGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    newDBClusterIdentifier
        ?.also((arg) => $request['NewDBClusterIdentifier'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
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

  /// Modifies the parameters of a cluster parameter group. To modify more than
  /// one parameter, submit a list of the following: <code>ParameterName</code>,
  /// <code>ParameterValue</code>, and <code>ApplyMethod</code>. A maximum of 20
  /// parameters can be modified in a single request.
  /// <note>
  /// Changes to dynamic parameters are applied immediately. Changes to static
  /// parameters require a reboot or maintenance window before the change can
  /// take effect.
  /// </note> <important>
  /// After you create a cluster parameter group, you should wait at least 5
  /// minutes before creating your first cluster that uses that cluster
  /// parameter group as the default parameter group. This allows Amazon
  /// DocumentDB to fully complete the create action before the parameter group
  /// is used as the default for a new cluster. This step is especially
  /// important for parameters that are critical when creating the default
  /// database for a cluster, such as the character set for the default database
  /// defined by the <code>character_set_database</code> parameter.
  /// </important>
  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InvalidDBParameterGroupStateFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the cluster parameter group to modify.
  ///
  /// Parameter [parameters] :
  /// A list of parameters in the cluster parameter group to modify.
  Future<DBClusterParameterGroupNameMessage> modifyDBClusterParameterGroup({
    @_s.required String dBClusterParameterGroupName,
    @_s.required List<Parameter> parameters,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
    ArgumentError.checkNotNull(parameters, 'parameters');
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
  /// To share a manual cluster snapshot with other AWS accounts, specify
  /// <code>restore</code> as the <code>AttributeName</code>, and use the
  /// <code>ValuesToAdd</code> parameter to add a list of IDs of the AWS
  /// accounts that are authorized to restore the manual cluster snapshot. Use
  /// the value <code>all</code> to make the manual cluster snapshot public,
  /// which means that it can be copied or restored by all AWS accounts. Do not
  /// add the <code>all</code> value for any manual DB cluster snapshots that
  /// contain private information that you don't want available to all AWS
  /// accounts. If a manual cluster snapshot is encrypted, it can be shared, but
  /// only by specifying a list of authorized AWS account IDs for the
  /// <code>ValuesToAdd</code> parameter. You can't use <code>all</code> as a
  /// value for that parameter in this case.
  ///
  /// May throw [DBClusterSnapshotNotFoundFault].
  /// May throw [InvalidDBClusterSnapshotStateFault].
  /// May throw [SharedSnapshotQuotaExceededFault].
  ///
  /// Parameter [attributeName] :
  /// The name of the cluster snapshot attribute to modify.
  ///
  /// To manage authorization for other AWS accounts to copy or restore a manual
  /// cluster snapshot, set this value to <code>restore</code>.
  ///
  /// Parameter [dBClusterSnapshotIdentifier] :
  /// The identifier for the cluster snapshot to modify the attributes for.
  ///
  /// Parameter [valuesToAdd] :
  /// A list of cluster snapshot attributes to add to the attribute specified by
  /// <code>AttributeName</code>.
  ///
  /// To authorize other AWS accounts to copy or restore a manual cluster
  /// snapshot, set this list to include one or more AWS account IDs. To make
  /// the manual cluster snapshot restorable by any AWS account, set it to
  /// <code>all</code>. Do not add the <code>all</code> value for any manual
  /// cluster snapshots that contain private information that you don't want to
  /// be available to all AWS accounts.
  ///
  /// Parameter [valuesToRemove] :
  /// A list of cluster snapshot attributes to remove from the attribute
  /// specified by <code>AttributeName</code>.
  ///
  /// To remove authorization for other AWS accounts to copy or restore a manual
  /// cluster snapshot, set this list to include one or more AWS account
  /// identifiers. To remove authorization for any AWS account to copy or
  /// restore the cluster snapshot, set it to <code>all</code> . If you specify
  /// <code>all</code>, an AWS account whose account ID is explicitly added to
  /// the <code>restore</code> attribute can still copy or restore a manual
  /// cluster snapshot.
  Future<ModifyDBClusterSnapshotAttributeResult>
      modifyDBClusterSnapshotAttribute({
    @_s.required String attributeName,
    @_s.required String dBClusterSnapshotIdentifier,
    List<String> valuesToAdd,
    List<String> valuesToRemove,
  }) async {
    ArgumentError.checkNotNull(attributeName, 'attributeName');
    ArgumentError.checkNotNull(
        dBClusterSnapshotIdentifier, 'dBClusterSnapshotIdentifier');
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

  /// Modifies settings for an instance. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request.
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
  /// May throw [DBUpgradeDependencyFailureFault].
  /// May throw [StorageTypeNotSupportedFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [CertificateNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The instance identifier. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing <code>DBInstance</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [applyImmediately] :
  /// Specifies whether the modifications in this request and any pending
  /// modifications are asynchronously applied as soon as possible, regardless
  /// of the <code>PreferredMaintenanceWindow</code> setting for the instance.
  ///
  /// If this parameter is set to <code>false</code>, changes to the instance
  /// are applied during the next maintenance window. Some parameter changes can
  /// cause an outage and are applied on the next reboot.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// Indicates that minor version upgrades are applied automatically to the
  /// instance during the maintenance window. Changing this parameter doesn't
  /// result in an outage except in the following case, and the change is
  /// asynchronously applied as soon as possible. An outage results if this
  /// parameter is set to <code>true</code> during the maintenance window, and a
  /// newer minor version is available, and Amazon DocumentDB has enabled
  /// automatic patching for that engine version.
  ///
  /// Parameter [cACertificateIdentifier] :
  /// Indicates the certificate that needs to be associated with the instance.
  ///
  /// Parameter [dBInstanceClass] :
  /// The new compute and memory capacity of the instance; for example,
  /// <code>db.r5.large</code>. Not all instance classes are available in all
  /// AWS Regions.
  ///
  /// If you modify the instance class, an outage occurs during the change. The
  /// change is applied during the next maintenance window, unless
  /// <code>ApplyImmediately</code> is specified as <code>true</code> for this
  /// request.
  ///
  /// Default: Uses existing setting.
  ///
  /// Parameter [newDBInstanceIdentifier] :
  /// The new instance identifier for the instance when renaming an instance.
  /// When you change the instance identifier, an instance reboot occurs
  /// immediately if you set <code>Apply Immediately</code> to
  /// <code>true</code>. It occurs during the next maintenance window if you set
  /// <code>Apply Immediately</code> to <code>false</code>. This value is stored
  /// as a lowercase string.
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
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range (in UTC) during which system maintenance can occur,
  /// which might result in an outage. Changing this parameter doesn't result in
  /// an outage except in the following situation, and the change is
  /// asynchronously applied as soon as possible. If there are pending actions
  /// that cause a reboot, and the maintenance window is changed to include the
  /// current time, changing this parameter causes a reboot of the instance. If
  /// you are moving this window to the current time, there must be at least 30
  /// minutes between the current time and end of the window to ensure that
  /// pending changes are applied.
  ///
  /// Default: Uses existing setting.
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Must be at least 30 minutes.
  ///
  /// Parameter [promotionTier] :
  /// A value that specifies the order in which an Amazon DocumentDB replica is
  /// promoted to the primary instance after a failure of the existing primary
  /// instance.
  ///
  /// Default: 1
  ///
  /// Valid values: 0-15
  Future<ModifyDBInstanceResult> modifyDBInstance({
    @_s.required String dBInstanceIdentifier,
    bool applyImmediately,
    bool autoMinorVersionUpgrade,
    String cACertificateIdentifier,
    String dBInstanceClass,
    String newDBInstanceIdentifier,
    String preferredMaintenanceWindow,
    int promotionTier,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    cACertificateIdentifier
        ?.also((arg) => $request['CACertificateIdentifier'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    newDBInstanceIdentifier
        ?.also((arg) => $request['NewDBInstanceIdentifier'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    promotionTier?.also((arg) => $request['PromotionTier'] = arg);
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

  /// Modifies an existing subnet group. subnet groups must contain at least one
  /// subnet in at least two Availability Zones in the AWS Region.
  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [SubnetAlreadyInUse].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name for the subnet group. This value is stored as a lowercase string.
  /// You can't modify the default subnet group.
  ///
  /// Constraints: Must match the name of an existing
  /// <code>DBSubnetGroup</code>. Must not be default.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [subnetIds] :
  /// The Amazon EC2 subnet IDs for the subnet group.
  ///
  /// Parameter [dBSubnetGroupDescription] :
  /// The description for the subnet group.
  Future<ModifyDBSubnetGroupResult> modifyDBSubnetGroup({
    @_s.required String dBSubnetGroupName,
    @_s.required List<String> subnetIds,
    String dBSubnetGroupDescription,
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

  /// You might need to reboot your instance, usually for maintenance reasons.
  /// For example, if you make certain changes, or if you change the cluster
  /// parameter group that is associated with the instance, you must reboot the
  /// instance for the changes to take effect.
  ///
  /// Rebooting an instance restarts the database engine service. Rebooting an
  /// instance results in a momentary outage, during which the instance status
  /// is set to <i>rebooting</i>.
  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  ///
  /// Parameter [dBInstanceIdentifier] :
  /// The instance identifier. This parameter is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing <code>DBInstance</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [forceFailover] :
  /// When <code>true</code>, the reboot is conducted through a Multi-AZ
  /// failover.
  ///
  /// Constraint: You can't specify <code>true</code> if the instance is not
  /// configured for Multi-AZ.
  Future<RebootDBInstanceResult> rebootDBInstance({
    @_s.required String dBInstanceIdentifier,
    bool forceFailover,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
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

  /// Removes metadata tags from an Amazon DocumentDB resource.
  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [DBClusterNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon DocumentDB resource that the tags are removed from. This value
  /// is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// The tag key (name) of the tag to be removed.
  Future<void> removeTagsFromResource({
    @_s.required String resourceName,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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

  /// Modifies the parameters of a cluster parameter group to the default value.
  /// To reset specific parameters, submit a list of the following:
  /// <code>ParameterName</code> and <code>ApplyMethod</code>. To reset the
  /// entire cluster parameter group, specify the
  /// <code>DBClusterParameterGroupName</code> and
  /// <code>ResetAllParameters</code> parameters.
  ///
  /// When you reset the entire group, dynamic parameters are updated
  /// immediately and static parameters are set to <code>pending-reboot</code>
  /// to take effect on the next DB instance reboot.
  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  ///
  /// Parameter [dBClusterParameterGroupName] :
  /// The name of the cluster parameter group to reset.
  ///
  /// Parameter [parameters] :
  /// A list of parameter names in the cluster parameter group to reset to the
  /// default values. You can't use this parameter if the
  /// <code>ResetAllParameters</code> parameter is set to <code>true</code>.
  ///
  /// Parameter [resetAllParameters] :
  /// A value that is set to <code>true</code> to reset all parameters in the
  /// cluster parameter group to their default values, and <code>false</code>
  /// otherwise. You can't use this parameter if there is a list of parameter
  /// names specified for the <code>Parameters</code> parameter.
  Future<DBClusterParameterGroupNameMessage> resetDBClusterParameterGroup({
    @_s.required String dBClusterParameterGroupName,
    List<Parameter> parameters,
    bool resetAllParameters,
  }) async {
    ArgumentError.checkNotNull(
        dBClusterParameterGroupName, 'dBClusterParameterGroupName');
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

  /// Creates a new cluster from a snapshot or cluster snapshot.
  ///
  /// If a snapshot is specified, the target cluster is created from the source
  /// DB snapshot with a default configuration and default security group.
  ///
  /// If a cluster snapshot is specified, the target cluster is created from the
  /// source cluster restore point with the same configuration as the original
  /// source DB cluster, except that the new cluster is created with the default
  /// security group.
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
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the cluster to create from the snapshot or cluster snapshot.
  /// This parameter isn't case sensitive.
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
  /// Example: <code>my-snapshot-id</code>
  ///
  /// Parameter [engine] :
  /// The database engine to use for the new cluster.
  ///
  /// Default: The same as source.
  ///
  /// Constraint: Must be compatible with the engine of the source.
  ///
  /// Parameter [snapshotIdentifier] :
  /// The identifier for the snapshot or cluster snapshot to restore from.
  ///
  /// You can use either the name or the Amazon Resource Name (ARN) to specify a
  /// cluster snapshot. However, you can use only the ARN to specify a snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing snapshot.
  /// </li>
  /// </ul>
  ///
  /// Parameter [availabilityZones] :
  /// Provides the list of Amazon EC2 Availability Zones that instances in the
  /// restored DB cluster can be created in.
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The name of the subnet group to use for the new cluster.
  ///
  /// Constraints: If provided, must match the name of an existing
  /// <code>DBSubnetGroup</code>.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// Specifies whether this cluster can be deleted. If
  /// <code>DeletionProtection</code> is enabled, the cluster cannot be deleted
  /// unless it is modified and <code>DeletionProtection</code> is disabled.
  /// <code>DeletionProtection</code> protects clusters from being accidentally
  /// deleted.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// A list of log types that must be enabled for exporting to Amazon
  /// CloudWatch Logs.
  ///
  /// Parameter [engineVersion] :
  /// The version of the database engine to use for the new cluster.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier to use when restoring an encrypted cluster from
  /// a DB snapshot or cluster snapshot.
  ///
  /// The AWS KMS key identifier is the Amazon Resource Name (ARN) for the AWS
  /// KMS encryption key. If you are restoring a cluster with the same AWS
  /// account that owns the AWS KMS encryption key used to encrypt the new
  /// cluster, then you can use the AWS KMS key alias instead of the ARN for the
  /// AWS KMS encryption key.
  ///
  /// If you do not specify a value for the <code>KmsKeyId</code> parameter,
  /// then the following occurs:
  ///
  /// <ul>
  /// <li>
  /// If the snapshot or cluster snapshot in <code>SnapshotIdentifier</code> is
  /// encrypted, then the restored cluster is encrypted using the AWS KMS key
  /// that was used to encrypt the snapshot or the cluster snapshot.
  /// </li>
  /// <li>
  /// If the snapshot or the cluster snapshot in <code>SnapshotIdentifier</code>
  /// is not encrypted, then the restored DB cluster is not encrypted.
  /// </li>
  /// </ul>
  ///
  /// Parameter [port] :
  /// The port number on which the new cluster accepts connections.
  ///
  /// Constraints: Must be a value from <code>1150</code> to <code>65535</code>.
  ///
  /// Default: The same port as the original cluster.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the restored cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of virtual private cloud (VPC) security groups that the new cluster
  /// will belong to.
  Future<RestoreDBClusterFromSnapshotResult> restoreDBClusterFromSnapshot({
    @_s.required String dBClusterIdentifier,
    @_s.required String engine,
    @_s.required String snapshotIdentifier,
    List<String> availabilityZones,
    String dBSubnetGroupName,
    bool deletionProtection,
    List<String> enableCloudwatchLogsExports,
    String engineVersion,
    String kmsKeyId,
    int port,
    List<Tag> tags,
    List<String> vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    ArgumentError.checkNotNull(snapshotIdentifier, 'snapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['Engine'] = engine;
    $request['SnapshotIdentifier'] = snapshotIdentifier;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    port?.also((arg) => $request['Port'] = arg);
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

  /// Restores a cluster to an arbitrary point in time. Users can restore to any
  /// point in time before <code>LatestRestorableTime</code> for up to
  /// <code>BackupRetentionPeriod</code> days. The target cluster is created
  /// from the source cluster with the same configuration as the original
  /// cluster, except that the new cluster is created with the default security
  /// group.
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
  /// May throw [StorageQuotaExceededFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The name of the new cluster to be created.
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
  ///
  /// Parameter [sourceDBClusterIdentifier] :
  /// The identifier of the source cluster from which to restore.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must match the identifier of an existing <code>DBCluster</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dBSubnetGroupName] :
  /// The subnet group name to use for the new cluster.
  ///
  /// Constraints: If provided, must match the name of an existing
  /// <code>DBSubnetGroup</code>.
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [deletionProtection] :
  /// Specifies whether this cluster can be deleted. If
  /// <code>DeletionProtection</code> is enabled, the cluster cannot be deleted
  /// unless it is modified and <code>DeletionProtection</code> is disabled.
  /// <code>DeletionProtection</code> protects clusters from being accidentally
  /// deleted.
  ///
  /// Parameter [enableCloudwatchLogsExports] :
  /// A list of log types that must be enabled for exporting to Amazon
  /// CloudWatch Logs.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS KMS key identifier to use when restoring an encrypted cluster from
  /// an encrypted cluster.
  ///
  /// The AWS KMS key identifier is the Amazon Resource Name (ARN) for the AWS
  /// KMS encryption key. If you are restoring a cluster with the same AWS
  /// account that owns the AWS KMS encryption key used to encrypt the new
  /// cluster, then you can use the AWS KMS key alias instead of the ARN for the
  /// AWS KMS encryption key.
  ///
  /// You can restore to a new cluster and encrypt the new cluster with an AWS
  /// KMS key that is different from the AWS KMS key used to encrypt the source
  /// cluster. The new DB cluster is encrypted with the AWS KMS key identified
  /// by the <code>KmsKeyId</code> parameter.
  ///
  /// If you do not specify a value for the <code>KmsKeyId</code> parameter,
  /// then the following occurs:
  ///
  /// <ul>
  /// <li>
  /// If the cluster is encrypted, then the restored cluster is encrypted using
  /// the AWS KMS key that was used to encrypt the source cluster.
  /// </li>
  /// <li>
  /// If the cluster is not encrypted, then the restored cluster is not
  /// encrypted.
  /// </li>
  /// </ul>
  /// If <code>DBClusterIdentifier</code> refers to a cluster that is not
  /// encrypted, then the restore request is rejected.
  ///
  /// Parameter [port] :
  /// The port number on which the new cluster accepts connections.
  ///
  /// Constraints: Must be a value from <code>1150</code> to <code>65535</code>.
  ///
  /// Default: The default port for the engine.
  ///
  /// Parameter [restoreToTime] :
  /// The date and time to restore the cluster to.
  ///
  /// Valid values: A time in Universal Coordinated Time (UTC) format.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be before the latest restorable time for the instance.
  /// </li>
  /// <li>
  /// Must be specified if the <code>UseLatestRestorableTime</code> parameter is
  /// not provided.
  /// </li>
  /// <li>
  /// Cannot be specified if the <code>UseLatestRestorableTime</code> parameter
  /// is <code>true</code>.
  /// </li>
  /// <li>
  /// Cannot be specified if the <code>RestoreType</code> parameter is
  /// <code>copy-on-write</code>.
  /// </li>
  /// </ul>
  /// Example: <code>2015-03-07T23:45:00Z</code>
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the restored cluster.
  ///
  /// Parameter [useLatestRestorableTime] :
  /// A value that is set to <code>true</code> to restore the cluster to the
  /// latest restorable backup time, and <code>false</code> otherwise.
  ///
  /// Default: <code>false</code>
  ///
  /// Constraints: Cannot be specified if the <code>RestoreToTime</code>
  /// parameter is provided.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security groups that the new cluster belongs to.
  Future<RestoreDBClusterToPointInTimeResult> restoreDBClusterToPointInTime({
    @_s.required String dBClusterIdentifier,
    @_s.required String sourceDBClusterIdentifier,
    String dBSubnetGroupName,
    bool deletionProtection,
    List<String> enableCloudwatchLogsExports,
    String kmsKeyId,
    int port,
    DateTime restoreToTime,
    List<Tag> tags,
    bool useLatestRestorableTime,
    List<String> vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
    ArgumentError.checkNotNull(
        sourceDBClusterIdentifier, 'sourceDBClusterIdentifier');
    final $request = <String, dynamic>{};
    $request['DBClusterIdentifier'] = dBClusterIdentifier;
    $request['SourceDBClusterIdentifier'] = sourceDBClusterIdentifier;
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    deletionProtection?.also((arg) => $request['DeletionProtection'] = arg);
    enableCloudwatchLogsExports
        ?.also((arg) => $request['EnableCloudwatchLogsExports'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    restoreToTime
        ?.also((arg) => $request['RestoreToTime'] = _s.iso8601ToJson(arg));
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

  /// Restarts the stopped cluster that is specified by
  /// <code>DBClusterIdentifier</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html">Stopping
  /// and Starting an Amazon DocumentDB Cluster</a>.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The identifier of the cluster to restart. Example:
  /// <code>docdb-2019-05-28-15-24-52</code>
  Future<StartDBClusterResult> startDBCluster({
    @_s.required String dBClusterIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
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

  /// Stops the running cluster that is specified by
  /// <code>DBClusterIdentifier</code>. The cluster must be in the
  /// <i>available</i> state. For more information, see <a
  /// href="https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html">Stopping
  /// and Starting an Amazon DocumentDB Cluster</a>.
  ///
  /// May throw [DBClusterNotFoundFault].
  /// May throw [InvalidDBClusterStateFault].
  /// May throw [InvalidDBInstanceStateFault].
  ///
  /// Parameter [dBClusterIdentifier] :
  /// The identifier of the cluster to stop. Example:
  /// <code>docdb-2019-05-28-15-24-52</code>
  Future<StopDBClusterResult> stopDBCluster({
    @_s.required String dBClusterIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBClusterIdentifier, 'dBClusterIdentifier');
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

enum ApplyMethod {
  @_s.JsonValue('immediate')
  immediate,
  @_s.JsonValue('pending-reboot')
  pendingReboot,
}

extension on String {
  ApplyMethod toApplyMethod() {
    switch (this) {
      case 'immediate':
        return ApplyMethod.immediate;
      case 'pending-reboot':
        return ApplyMethod.pendingReboot;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class ApplyPendingMaintenanceActionResult {
  final ResourcePendingMaintenanceActions resourcePendingMaintenanceActions;

  ApplyPendingMaintenanceActionResult({
    this.resourcePendingMaintenanceActions,
  });
  factory ApplyPendingMaintenanceActionResult.fromXml(_s.XmlElement elem) {
    return ApplyPendingMaintenanceActionResult(
      resourcePendingMaintenanceActions: _s
          .extractXmlChild(elem, 'ResourcePendingMaintenanceActions')
          ?.let((e) => ResourcePendingMaintenanceActions.fromXml(e)),
    );
  }
}

/// Information about an Availability Zone.
class AvailabilityZone {
  /// The name of the Availability Zone.
  final String name;

  AvailabilityZone({
    this.name,
  });
  factory AvailabilityZone.fromXml(_s.XmlElement elem) {
    return AvailabilityZone(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }
}

/// A certificate authority (CA) certificate for an AWS account.
class Certificate {
  /// The Amazon Resource Name (ARN) for the certificate.
  ///
  /// Example: <code>arn:aws:rds:us-east-1::cert:rds-ca-2019</code>
  final String certificateArn;

  /// The unique key that identifies a certificate.
  ///
  /// Example: <code>rds-ca-2019</code>
  final String certificateIdentifier;

  /// The type of the certificate.
  ///
  /// Example: <code>CA</code>
  final String certificateType;

  /// The thumbprint of the certificate.
  final String thumbprint;

  /// The starting date-time from which the certificate is valid.
  ///
  /// Example: <code>2019-07-31T17:57:09Z</code>
  final DateTime validFrom;

  /// The date-time after which the certificate is no longer valid.
  ///
  /// Example: <code>2024-07-31T17:57:09Z</code>
  final DateTime validTill;

  Certificate({
    this.certificateArn,
    this.certificateIdentifier,
    this.certificateType,
    this.thumbprint,
    this.validFrom,
    this.validTill,
  });
  factory Certificate.fromXml(_s.XmlElement elem) {
    return Certificate(
      certificateArn: _s.extractXmlStringValue(elem, 'CertificateArn'),
      certificateIdentifier:
          _s.extractXmlStringValue(elem, 'CertificateIdentifier'),
      certificateType: _s.extractXmlStringValue(elem, 'CertificateType'),
      thumbprint: _s.extractXmlStringValue(elem, 'Thumbprint'),
      validFrom: _s.extractXmlDateTimeValue(elem, 'ValidFrom'),
      validTill: _s.extractXmlDateTimeValue(elem, 'ValidTill'),
    );
  }
}

class CertificateMessage {
  /// A list of certificates for this AWS account.
  final List<Certificate> certificates;

  /// An optional pagination token provided if the number of records retrieved is
  /// greater than <code>MaxRecords</code>. If this parameter is specified, the
  /// marker specifies the next record in the list. Including the value of
  /// <code>Marker</code> in the next call to <code>DescribeCertificates</code>
  /// results in the next page of certificates.
  final String marker;

  CertificateMessage({
    this.certificates,
    this.marker,
  });
  factory CertificateMessage.fromXml(_s.XmlElement elem) {
    return CertificateMessage(
      certificates: _s.extractXmlChild(elem, 'Certificates')?.let((elem) => elem
          .findElements('Certificate')
          .map((c) => Certificate.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// The configuration setting for the log types to be enabled for export to
/// Amazon CloudWatch Logs for a specific instance or cluster.
///
/// The <code>EnableLogTypes</code> and <code>DisableLogTypes</code> arrays
/// determine which logs are exported (or not exported) to CloudWatch Logs. The
/// values within these arrays depend on the engine that is being used.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CloudwatchLogsExportConfiguration {
  /// The list of log types to disable.
  @_s.JsonKey(name: 'DisableLogTypes')
  final List<String> disableLogTypes;

  /// The list of log types to enable.
  @_s.JsonKey(name: 'EnableLogTypes')
  final List<String> enableLogTypes;

  CloudwatchLogsExportConfiguration({
    this.disableLogTypes,
    this.enableLogTypes,
  });
  Map<String, dynamic> toJson() =>
      _$CloudwatchLogsExportConfigurationToJson(this);
}

class CopyDBClusterParameterGroupResult {
  final DBClusterParameterGroup dBClusterParameterGroup;

  CopyDBClusterParameterGroupResult({
    this.dBClusterParameterGroup,
  });
  factory CopyDBClusterParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CopyDBClusterParameterGroupResult(
      dBClusterParameterGroup: _s
          .extractXmlChild(elem, 'DBClusterParameterGroup')
          ?.let((e) => DBClusterParameterGroup.fromXml(e)),
    );
  }
}

class CopyDBClusterSnapshotResult {
  final DBClusterSnapshot dBClusterSnapshot;

  CopyDBClusterSnapshotResult({
    this.dBClusterSnapshot,
  });
  factory CopyDBClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return CopyDBClusterSnapshotResult(
      dBClusterSnapshot: _s
          .extractXmlChild(elem, 'DBClusterSnapshot')
          ?.let((e) => DBClusterSnapshot.fromXml(e)),
    );
  }
}

class CreateDBClusterParameterGroupResult {
  final DBClusterParameterGroup dBClusterParameterGroup;

  CreateDBClusterParameterGroupResult({
    this.dBClusterParameterGroup,
  });
  factory CreateDBClusterParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBClusterParameterGroupResult(
      dBClusterParameterGroup: _s
          .extractXmlChild(elem, 'DBClusterParameterGroup')
          ?.let((e) => DBClusterParameterGroup.fromXml(e)),
    );
  }
}

class CreateDBClusterResult {
  final DBCluster dBCluster;

  CreateDBClusterResult({
    this.dBCluster,
  });
  factory CreateDBClusterResult.fromXml(_s.XmlElement elem) {
    return CreateDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class CreateDBClusterSnapshotResult {
  final DBClusterSnapshot dBClusterSnapshot;

  CreateDBClusterSnapshotResult({
    this.dBClusterSnapshot,
  });
  factory CreateDBClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateDBClusterSnapshotResult(
      dBClusterSnapshot: _s
          .extractXmlChild(elem, 'DBClusterSnapshot')
          ?.let((e) => DBClusterSnapshot.fromXml(e)),
    );
  }
}

class CreateDBInstanceResult {
  final DBInstance dBInstance;

  CreateDBInstanceResult({
    this.dBInstance,
  });
  factory CreateDBInstanceResult.fromXml(_s.XmlElement elem) {
    return CreateDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class CreateDBSubnetGroupResult {
  final DBSubnetGroup dBSubnetGroup;

  CreateDBSubnetGroupResult({
    this.dBSubnetGroup,
  });
  factory CreateDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBSubnetGroupResult(
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
    );
  }
}

/// Detailed information about a cluster.
class DBCluster {
  /// Provides a list of the AWS Identity and Access Management (IAM) roles that
  /// are associated with the cluster. IAM roles that are associated with a
  /// cluster grant permission for the cluster to access other AWS services on
  /// your behalf.
  final List<DBClusterRole> associatedRoles;

  /// Provides the list of Amazon EC2 Availability Zones that instances in the
  /// cluster can be created in.
  final List<String> availabilityZones;

  /// Specifies the number of days for which automatic snapshots are retained.
  final int backupRetentionPeriod;

  /// Specifies the time when the cluster was created, in Universal Coordinated
  /// Time (UTC).
  final DateTime clusterCreateTime;

  /// The Amazon Resource Name (ARN) for the cluster.
  final String dBClusterArn;

  /// Contains a user-supplied cluster identifier. This identifier is the unique
  /// key that identifies a cluster.
  final String dBClusterIdentifier;

  /// Provides the list of instances that make up the cluster.
  final List<DBClusterMember> dBClusterMembers;

  /// Specifies the name of the cluster parameter group for the cluster.
  final String dBClusterParameterGroup;

  /// Specifies information on the subnet group that is associated with the
  /// cluster, including the name, description, and subnets in the subnet group.
  final String dBSubnetGroup;

  /// The AWS Region-unique, immutable identifier for the cluster. This identifier
  /// is found in AWS CloudTrail log entries whenever the AWS KMS key for the
  /// cluster is accessed.
  final String dbClusterResourceId;

  /// Specifies whether this cluster can be deleted. If
  /// <code>DeletionProtection</code> is enabled, the cluster cannot be deleted
  /// unless it is modified and <code>DeletionProtection</code> is disabled.
  /// <code>DeletionProtection</code> protects clusters from being accidentally
  /// deleted.
  final bool deletionProtection;

  /// The earliest time to which a database can be restored with point-in-time
  /// restore.
  final DateTime earliestRestorableTime;

  /// A list of log types that this cluster is configured to export to Amazon
  /// CloudWatch Logs.
  final List<String> enabledCloudwatchLogsExports;

  /// Specifies the connection endpoint for the primary instance of the cluster.
  final String endpoint;

  /// Provides the name of the database engine to be used for this cluster.
  final String engine;

  /// Indicates the database engine version.
  final String engineVersion;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.
  final String hostedZoneId;

  /// If <code>StorageEncrypted</code> is <code>true</code>, the AWS KMS key
  /// identifier for the encrypted cluster.
  final String kmsKeyId;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime latestRestorableTime;

  /// Contains the master user name for the cluster.
  final String masterUsername;

  /// Specifies whether the cluster has instances in multiple Availability Zones.
  final bool multiAZ;

  /// Specifies the progress of the operation as a percentage.
  final String percentProgress;

  /// Specifies the port that the database engine is listening on.
  final int port;

  /// Specifies the daily time range during which automated backups are created if
  /// automated backups are enabled, as determined by the
  /// <code>BackupRetentionPeriod</code>.
  final String preferredBackupWindow;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String preferredMaintenanceWindow;

  /// The reader endpoint for the cluster. The reader endpoint for a cluster load
  /// balances connections across the Amazon DocumentDB replicas that are
  /// available in a cluster. As clients request new connections to the reader
  /// endpoint, Amazon DocumentDB distributes the connection requests among the
  /// Amazon DocumentDB replicas in the cluster. This functionality can help
  /// balance your read workload across multiple Amazon DocumentDB replicas in
  /// your cluster.
  ///
  /// If a failover occurs, and the Amazon DocumentDB replica that you are
  /// connected to is promoted to be the primary instance, your connection is
  /// dropped. To continue sending your read workload to other Amazon DocumentDB
  /// replicas in the cluster, you can then reconnect to the reader endpoint.
  final String readerEndpoint;

  /// Specifies the current state of this cluster.
  final String status;

  /// Specifies whether the cluster is encrypted.
  final bool storageEncrypted;

  /// Provides a list of virtual private cloud (VPC) security groups that the
  /// cluster belongs to.
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  DBCluster({
    this.associatedRoles,
    this.availabilityZones,
    this.backupRetentionPeriod,
    this.clusterCreateTime,
    this.dBClusterArn,
    this.dBClusterIdentifier,
    this.dBClusterMembers,
    this.dBClusterParameterGroup,
    this.dBSubnetGroup,
    this.dbClusterResourceId,
    this.deletionProtection,
    this.earliestRestorableTime,
    this.enabledCloudwatchLogsExports,
    this.endpoint,
    this.engine,
    this.engineVersion,
    this.hostedZoneId,
    this.kmsKeyId,
    this.latestRestorableTime,
    this.masterUsername,
    this.multiAZ,
    this.percentProgress,
    this.port,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.readerEndpoint,
    this.status,
    this.storageEncrypted,
    this.vpcSecurityGroups,
  });
  factory DBCluster.fromXml(_s.XmlElement elem) {
    return DBCluster(
      associatedRoles: _s.extractXmlChild(elem, 'AssociatedRoles')?.let(
          (elem) => elem
              .findElements('DBClusterRole')
              .map((c) => DBClusterRole.fromXml(c))
              .toList()),
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AvailabilityZone')),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      clusterCreateTime: _s.extractXmlDateTimeValue(elem, 'ClusterCreateTime'),
      dBClusterArn: _s.extractXmlStringValue(elem, 'DBClusterArn'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      dBClusterMembers: _s.extractXmlChild(elem, 'DBClusterMembers')?.let(
          (elem) => elem
              .findElements('DBClusterMember')
              .map((c) => DBClusterMember.fromXml(c))
              .toList()),
      dBClusterParameterGroup:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroup'),
      dBSubnetGroup: _s.extractXmlStringValue(elem, 'DBSubnetGroup'),
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
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      latestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'LatestRestorableTime'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      percentProgress: _s.extractXmlStringValue(elem, 'PercentProgress'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      preferredBackupWindow:
          _s.extractXmlStringValue(elem, 'PreferredBackupWindow'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      readerEndpoint: _s.extractXmlStringValue(elem, 'ReaderEndpoint'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map((c) => VpcSecurityGroupMembership.fromXml(c))
              .toList()),
    );
  }
}

/// Contains information about an instance that is part of a cluster.
class DBClusterMember {
  /// Specifies the status of the cluster parameter group for this member of the
  /// DB cluster.
  final String dBClusterParameterGroupStatus;

  /// Specifies the instance identifier for this member of the cluster.
  final String dBInstanceIdentifier;

  /// A value that is <code>true</code> if the cluster member is the primary
  /// instance for the cluster and <code>false</code> otherwise.
  final bool isClusterWriter;

  /// A value that specifies the order in which an Amazon DocumentDB replica is
  /// promoted to the primary instance after a failure of the existing primary
  /// instance.
  final int promotionTier;

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
}

/// Represents the output of <a>DescribeDBClusters</a>.
class DBClusterMessage {
  /// A list of clusters.
  final List<DBCluster> dBClusters;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  DBClusterMessage({
    this.dBClusters,
    this.marker,
  });
  factory DBClusterMessage.fromXml(_s.XmlElement elem) {
    return DBClusterMessage(
      dBClusters: _s.extractXmlChild(elem, 'DBClusters')?.let((elem) => elem
          .findElements('DBCluster')
          .map((c) => DBCluster.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Detailed information about a cluster parameter group.
class DBClusterParameterGroup {
  /// The Amazon Resource Name (ARN) for the cluster parameter group.
  final String dBClusterParameterGroupArn;

  /// Provides the name of the cluster parameter group.
  final String dBClusterParameterGroupName;

  /// Provides the name of the parameter group family that this cluster parameter
  /// group is compatible with.
  final String dBParameterGroupFamily;

  /// Provides the customer-specified description for this cluster parameter
  /// group.
  final String description;

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
}

/// Represents the output of <a>DBClusterParameterGroup</a>.
class DBClusterParameterGroupDetails {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  /// Provides a list of parameters for the cluster parameter group.
  final List<Parameter> parameters;

  DBClusterParameterGroupDetails({
    this.marker,
    this.parameters,
  });
  factory DBClusterParameterGroupDetails.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroupDetails(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }
}

/// Contains the name of a cluster parameter group.
class DBClusterParameterGroupNameMessage {
  /// The name of a cluster parameter group.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be from 1 to 255 letters or numbers.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul> <note>
  /// This value is stored as a lowercase string.
  /// </note>
  final String dBClusterParameterGroupName;

  DBClusterParameterGroupNameMessage({
    this.dBClusterParameterGroupName,
  });
  factory DBClusterParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return DBClusterParameterGroupNameMessage(
      dBClusterParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBClusterParameterGroupName'),
    );
  }
}

/// Represents the output of <a>DBClusterParameterGroups</a>.
class DBClusterParameterGroupsMessage {
  /// A list of cluster parameter groups.
  final List<DBClusterParameterGroup> dBClusterParameterGroups;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

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
              .map((c) => DBClusterParameterGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Describes an AWS Identity and Access Management (IAM) role that is
/// associated with a cluster.
class DBClusterRole {
  /// The Amazon Resource Name (ARN) of the IAM role that is associated with the
  /// DB cluster.
  final String roleArn;

  /// Describes the state of association between the IAM role and the cluster. The
  /// <code>Status</code> property returns one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The IAM role ARN is associated with the cluster and
  /// can be used to access other AWS services on your behalf.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - The IAM role ARN is being associated with the DB
  /// cluster.
  /// </li>
  /// <li>
  /// <code>INVALID</code> - The IAM role ARN is associated with the cluster, but
  /// the cluster cannot assume the IAM role to access other AWS services on your
  /// behalf.
  /// </li>
  /// </ul>
  final String status;

  DBClusterRole({
    this.roleArn,
    this.status,
  });
  factory DBClusterRole.fromXml(_s.XmlElement elem) {
    return DBClusterRole(
      roleArn: _s.extractXmlStringValue(elem, 'RoleArn'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Detailed information about a cluster snapshot.
class DBClusterSnapshot {
  /// Provides the list of Amazon EC2 Availability Zones that instances in the
  /// cluster snapshot can be restored in.
  final List<String> availabilityZones;

  /// Specifies the time when the cluster was created, in Universal Coordinated
  /// Time (UTC).
  final DateTime clusterCreateTime;

  /// Specifies the cluster identifier of the cluster that this cluster snapshot
  /// was created from.
  final String dBClusterIdentifier;

  /// The Amazon Resource Name (ARN) for the cluster snapshot.
  final String dBClusterSnapshotArn;

  /// Specifies the identifier for the cluster snapshot.
  final String dBClusterSnapshotIdentifier;

  /// Specifies the name of the database engine.
  final String engine;

  /// Provides the version of the database engine for this cluster snapshot.
  final String engineVersion;

  /// If <code>StorageEncrypted</code> is <code>true</code>, the AWS KMS key
  /// identifier for the encrypted cluster snapshot.
  final String kmsKeyId;

  /// Provides the master user name for the cluster snapshot.
  final String masterUsername;

  /// Specifies the percentage of the estimated data that has been transferred.
  final int percentProgress;

  /// Specifies the port that the cluster was listening on at the time of the
  /// snapshot.
  final int port;

  /// Provides the time when the snapshot was taken, in UTC.
  final DateTime snapshotCreateTime;

  /// Provides the type of the cluster snapshot.
  final String snapshotType;

  /// If the cluster snapshot was copied from a source cluster snapshot, the ARN
  /// for the source cluster snapshot; otherwise, a null value.
  final String sourceDBClusterSnapshotArn;

  /// Specifies the status of this cluster snapshot.
  final String status;

  /// Specifies whether the cluster snapshot is encrypted.
  final bool storageEncrypted;

  /// Provides the virtual private cloud (VPC) ID that is associated with the
  /// cluster snapshot.
  final String vpcId;

  DBClusterSnapshot({
    this.availabilityZones,
    this.clusterCreateTime,
    this.dBClusterIdentifier,
    this.dBClusterSnapshotArn,
    this.dBClusterSnapshotIdentifier,
    this.engine,
    this.engineVersion,
    this.kmsKeyId,
    this.masterUsername,
    this.percentProgress,
    this.port,
    this.snapshotCreateTime,
    this.snapshotType,
    this.sourceDBClusterSnapshotArn,
    this.status,
    this.storageEncrypted,
    this.vpcId,
  });
  factory DBClusterSnapshot.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshot(
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
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
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
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Contains the name and values of a manual cluster snapshot attribute.
///
/// Manual cluster snapshot attributes are used to authorize other AWS accounts
/// to restore a manual cluster snapshot.
class DBClusterSnapshotAttribute {
  /// The name of the manual cluster snapshot attribute.
  ///
  /// The attribute named <code>restore</code> refers to the list of AWS accounts
  /// that have permission to copy or restore the manual cluster snapshot.
  final String attributeName;

  /// The values for the manual cluster snapshot attribute.
  ///
  /// If the <code>AttributeName</code> field is set to <code>restore</code>, then
  /// this element returns a list of IDs of the AWS accounts that are authorized
  /// to copy or restore the manual cluster snapshot. If a value of
  /// <code>all</code> is in the list, then the manual cluster snapshot is public
  /// and available for any AWS account to copy or restore.
  final List<String> attributeValues;

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
}

/// Detailed information about the attributes that are associated with a cluster
/// snapshot.
class DBClusterSnapshotAttributesResult {
  /// The list of attributes and values for the cluster snapshot.
  final List<DBClusterSnapshotAttribute> dBClusterSnapshotAttributes;

  /// The identifier of the cluster snapshot that the attributes apply to.
  final String dBClusterSnapshotIdentifier;

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
              .map((c) => DBClusterSnapshotAttribute.fromXml(c))
              .toList()),
      dBClusterSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterSnapshotIdentifier'),
    );
  }
}

/// Represents the output of <a>DescribeDBClusterSnapshots</a>.
class DBClusterSnapshotMessage {
  /// Provides a list of cluster snapshots.
  final List<DBClusterSnapshot> dBClusterSnapshots;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  DBClusterSnapshotMessage({
    this.dBClusterSnapshots,
    this.marker,
  });
  factory DBClusterSnapshotMessage.fromXml(_s.XmlElement elem) {
    return DBClusterSnapshotMessage(
      dBClusterSnapshots: _s.extractXmlChild(elem, 'DBClusterSnapshots')?.let(
          (elem) => elem
              .findElements('DBClusterSnapshot')
              .map((c) => DBClusterSnapshot.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Detailed information about an engine version.
class DBEngineVersion {
  /// The description of the database engine.
  final String dBEngineDescription;

  /// The description of the database engine version.
  final String dBEngineVersionDescription;

  /// The name of the parameter group family for the database engine.
  final String dBParameterGroupFamily;

  /// The name of the database engine.
  final String engine;

  /// The version number of the database engine.
  final String engineVersion;

  /// The types of logs that the database engine has available for export to
  /// Amazon CloudWatch Logs.
  final List<String> exportableLogTypes;

  /// A value that indicates whether the engine version supports exporting the log
  /// types specified by <code>ExportableLogTypes</code> to CloudWatch Logs.
  final bool supportsLogExportsToCloudwatchLogs;

  /// A list of engine versions that this database engine version can be upgraded
  /// to.
  final List<UpgradeTarget> validUpgradeTarget;

  DBEngineVersion({
    this.dBEngineDescription,
    this.dBEngineVersionDescription,
    this.dBParameterGroupFamily,
    this.engine,
    this.engineVersion,
    this.exportableLogTypes,
    this.supportsLogExportsToCloudwatchLogs,
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
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      exportableLogTypes: _s
          .extractXmlChild(elem, 'ExportableLogTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      supportsLogExportsToCloudwatchLogs:
          _s.extractXmlBoolValue(elem, 'SupportsLogExportsToCloudwatchLogs'),
      validUpgradeTarget: _s.extractXmlChild(elem, 'ValidUpgradeTarget')?.let(
          (elem) => elem
              .findElements('UpgradeTarget')
              .map((c) => UpgradeTarget.fromXml(c))
              .toList()),
    );
  }
}

/// Represents the output of <a>DescribeDBEngineVersions</a>.
class DBEngineVersionMessage {
  /// Detailed information about one or more engine versions.
  final List<DBEngineVersion> dBEngineVersions;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  DBEngineVersionMessage({
    this.dBEngineVersions,
    this.marker,
  });
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
}

/// Detailed information about an instance.
class DBInstance {
  /// Indicates that minor version patches are applied automatically.
  final bool autoMinorVersionUpgrade;

  /// Specifies the name of the Availability Zone that the instance is located in.
  final String availabilityZone;

  /// Specifies the number of days for which automatic snapshots are retained.
  final int backupRetentionPeriod;

  /// The identifier of the CA certificate for this DB instance.
  final String cACertificateIdentifier;

  /// Contains the name of the cluster that the instance is a member of if the
  /// instance is a member of a cluster.
  final String dBClusterIdentifier;

  /// The Amazon Resource Name (ARN) for the instance.
  final String dBInstanceArn;

  /// Contains the name of the compute and memory capacity class of the instance.
  final String dBInstanceClass;

  /// Contains a user-provided database identifier. This identifier is the unique
  /// key that identifies an instance.
  final String dBInstanceIdentifier;

  /// Specifies the current state of this database.
  final String dBInstanceStatus;

  /// Specifies information on the subnet group that is associated with the
  /// instance, including the name, description, and subnets in the subnet group.
  final DBSubnetGroup dBSubnetGroup;

  /// The AWS Region-unique, immutable identifier for the instance. This
  /// identifier is found in AWS CloudTrail log entries whenever the AWS KMS key
  /// for the instance is accessed.
  final String dbiResourceId;

  /// A list of log types that this instance is configured to export to Amazon
  /// CloudWatch Logs.
  final List<String> enabledCloudwatchLogsExports;

  /// Specifies the connection endpoint.
  final Endpoint endpoint;

  /// Provides the name of the database engine to be used for this instance.
  final String engine;

  /// Indicates the database engine version.
  final String engineVersion;

  /// Provides the date and time that the instance was created.
  final DateTime instanceCreateTime;

  /// If <code>StorageEncrypted</code> is <code>true</code>, the AWS KMS key
  /// identifier for the encrypted instance.
  final String kmsKeyId;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime latestRestorableTime;

  /// Specifies that changes to the instance are pending. This element is included
  /// only when changes are pending. Specific changes are identified by
  /// subelements.
  final PendingModifiedValues pendingModifiedValues;

  /// Specifies the daily time range during which automated backups are created if
  /// automated backups are enabled, as determined by the
  /// <code>BackupRetentionPeriod</code>.
  final String preferredBackupWindow;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String preferredMaintenanceWindow;

  /// A value that specifies the order in which an Amazon DocumentDB replica is
  /// promoted to the primary instance after a failure of the existing primary
  /// instance.
  final int promotionTier;

  /// Not supported. Amazon DocumentDB does not currently support public
  /// endpoints. The value of <code>PubliclyAccessible</code> is always
  /// <code>false</code>.
  final bool publiclyAccessible;

  /// The status of a read replica. If the instance is not a read replica, this is
  /// blank.
  final List<DBInstanceStatusInfo> statusInfos;

  /// Specifies whether or not the instance is encrypted.
  final bool storageEncrypted;

  /// Provides a list of VPC security group elements that the instance belongs to.
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  DBInstance({
    this.autoMinorVersionUpgrade,
    this.availabilityZone,
    this.backupRetentionPeriod,
    this.cACertificateIdentifier,
    this.dBClusterIdentifier,
    this.dBInstanceArn,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.dBInstanceStatus,
    this.dBSubnetGroup,
    this.dbiResourceId,
    this.enabledCloudwatchLogsExports,
    this.endpoint,
    this.engine,
    this.engineVersion,
    this.instanceCreateTime,
    this.kmsKeyId,
    this.latestRestorableTime,
    this.pendingModifiedValues,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.promotionTier,
    this.publiclyAccessible,
    this.statusInfos,
    this.storageEncrypted,
    this.vpcSecurityGroups,
  });
  factory DBInstance.fromXml(_s.XmlElement elem) {
    return DBInstance(
      autoMinorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'AutoMinorVersionUpgrade'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      cACertificateIdentifier:
          _s.extractXmlStringValue(elem, 'CACertificateIdentifier'),
      dBClusterIdentifier:
          _s.extractXmlStringValue(elem, 'DBClusterIdentifier'),
      dBInstanceArn: _s.extractXmlStringValue(elem, 'DBInstanceArn'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dBInstanceStatus: _s.extractXmlStringValue(elem, 'DBInstanceStatus'),
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
      dbiResourceId: _s.extractXmlStringValue(elem, 'DbiResourceId'),
      enabledCloudwatchLogsExports: _s
          .extractXmlChild(elem, 'EnabledCloudwatchLogsExports')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      endpoint:
          _s.extractXmlChild(elem, 'Endpoint')?.let((e) => Endpoint.fromXml(e)),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      instanceCreateTime:
          _s.extractXmlDateTimeValue(elem, 'InstanceCreateTime'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      latestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'LatestRestorableTime'),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let((e) => PendingModifiedValues.fromXml(e)),
      preferredBackupWindow:
          _s.extractXmlStringValue(elem, 'PreferredBackupWindow'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      promotionTier: _s.extractXmlIntValue(elem, 'PromotionTier'),
      publiclyAccessible: _s.extractXmlBoolValue(elem, 'PubliclyAccessible'),
      statusInfos: _s.extractXmlChild(elem, 'StatusInfos')?.let((elem) => elem
          .findElements('DBInstanceStatusInfo')
          .map((c) => DBInstanceStatusInfo.fromXml(c))
          .toList()),
      storageEncrypted: _s.extractXmlBoolValue(elem, 'StorageEncrypted'),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map((c) => VpcSecurityGroupMembership.fromXml(c))
              .toList()),
    );
  }
}

/// Represents the output of <a>DescribeDBInstances</a>.
class DBInstanceMessage {
  /// Detailed information about one or more instances.
  final List<DBInstance> dBInstances;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  DBInstanceMessage({
    this.dBInstances,
    this.marker,
  });
  factory DBInstanceMessage.fromXml(_s.XmlElement elem) {
    return DBInstanceMessage(
      dBInstances: _s.extractXmlChild(elem, 'DBInstances')?.let((elem) => elem
          .findElements('DBInstance')
          .map((c) => DBInstance.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Provides a list of status information for an instance.
class DBInstanceStatusInfo {
  /// Details of the error if there is an error for the instance. If the instance
  /// is not in an error state, this value is blank.
  final String message;

  /// A Boolean value that is <code>true</code> if the instance is operating
  /// normally, or <code>false</code> if the instance is in an error state.
  final bool normal;

  /// Status of the instance. For a <code>StatusType</code> of read replica, the
  /// values can be <code>replicating</code>, error, <code>stopped</code>, or
  /// <code>terminated</code>.
  final String status;

  /// This value is currently "<code>read replication</code>."
  final String statusType;

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
}

/// Detailed information about a subnet group.
class DBSubnetGroup {
  /// The Amazon Resource Name (ARN) for the DB subnet group.
  final String dBSubnetGroupArn;

  /// Provides the description of the subnet group.
  final String dBSubnetGroupDescription;

  /// The name of the subnet group.
  final String dBSubnetGroupName;

  /// Provides the status of the subnet group.
  final String subnetGroupStatus;

  /// Detailed information about one or more subnets within a subnet group.
  final List<Subnet> subnets;

  /// Provides the virtual private cloud (VPC) ID of the subnet group.
  final String vpcId;

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
      subnets: _s.extractXmlChild(elem, 'Subnets')?.let((elem) =>
          elem.findElements('Subnet').map((c) => Subnet.fromXml(c)).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Represents the output of <a>DescribeDBSubnetGroups</a>.
class DBSubnetGroupMessage {
  /// Detailed information about one or more subnet groups.
  final List<DBSubnetGroup> dBSubnetGroups;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  DBSubnetGroupMessage({
    this.dBSubnetGroups,
    this.marker,
  });
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
}

class DeleteDBClusterResult {
  final DBCluster dBCluster;

  DeleteDBClusterResult({
    this.dBCluster,
  });
  factory DeleteDBClusterResult.fromXml(_s.XmlElement elem) {
    return DeleteDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class DeleteDBClusterSnapshotResult {
  final DBClusterSnapshot dBClusterSnapshot;

  DeleteDBClusterSnapshotResult({
    this.dBClusterSnapshot,
  });
  factory DeleteDBClusterSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteDBClusterSnapshotResult(
      dBClusterSnapshot: _s
          .extractXmlChild(elem, 'DBClusterSnapshot')
          ?.let((e) => DBClusterSnapshot.fromXml(e)),
    );
  }
}

class DeleteDBInstanceResult {
  final DBInstance dBInstance;

  DeleteDBInstanceResult({
    this.dBInstance,
  });
  factory DeleteDBInstanceResult.fromXml(_s.XmlElement elem) {
    return DeleteDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class DescribeDBClusterSnapshotAttributesResult {
  final DBClusterSnapshotAttributesResult dBClusterSnapshotAttributesResult;

  DescribeDBClusterSnapshotAttributesResult({
    this.dBClusterSnapshotAttributesResult,
  });
  factory DescribeDBClusterSnapshotAttributesResult.fromXml(
      _s.XmlElement elem) {
    return DescribeDBClusterSnapshotAttributesResult(
      dBClusterSnapshotAttributesResult: _s
          .extractXmlChild(elem, 'DBClusterSnapshotAttributesResult')
          ?.let((e) => DBClusterSnapshotAttributesResult.fromXml(e)),
    );
  }
}

class DescribeEngineDefaultClusterParametersResult {
  final EngineDefaults engineDefaults;

  DescribeEngineDefaultClusterParametersResult({
    this.engineDefaults,
  });
  factory DescribeEngineDefaultClusterParametersResult.fromXml(
      _s.XmlElement elem) {
    return DescribeEngineDefaultClusterParametersResult(
      engineDefaults: _s
          .extractXmlChild(elem, 'EngineDefaults')
          ?.let((e) => EngineDefaults.fromXml(e)),
    );
  }
}

/// Network information for accessing a cluster or instance. Client programs
/// must specify a valid endpoint to access these Amazon DocumentDB resources.
class Endpoint {
  /// Specifies the DNS address of the instance.
  final String address;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.
  final String hostedZoneId;

  /// Specifies the port that the database engine is listening on.
  final int port;

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
}

/// Contains the result of a successful invocation of the
/// <code>DescribeEngineDefaultClusterParameters</code> operation.
class EngineDefaults {
  /// The name of the cluster parameter group family to return the engine
  /// parameter information for.
  final String dBParameterGroupFamily;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  /// The parameters of a particular cluster parameter group family.
  final List<Parameter> parameters;

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
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }
}

/// Detailed information about an event.
class Event {
  /// Specifies the date and time of the event.
  final DateTime date;

  /// Specifies the category for the event.
  final List<String> eventCategories;

  /// Provides the text of this event.
  final String message;

  /// The Amazon Resource Name (ARN) for the event.
  final String sourceArn;

  /// Provides the identifier for the source of the event.
  final String sourceIdentifier;

  /// Specifies the source type for this event.
  final SourceType sourceType;

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
}

/// An event source type, accompanied by one or more event category names.
class EventCategoriesMap {
  /// The event categories for the specified source type.
  final List<String> eventCategories;

  /// The source type that the returned categories belong to.
  final String sourceType;

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

/// Represents the output of <a>DescribeEventCategories</a>.
class EventCategoriesMessage {
  /// A list of event category maps.
  final List<EventCategoriesMap> eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
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
}

/// Represents the output of <a>DescribeEvents</a>.
class EventsMessage {
  /// Detailed information about one or more events.
  final List<Event> events;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  EventsMessage({
    this.events,
    this.marker,
  });
  factory EventsMessage.fromXml(_s.XmlElement elem) {
    return EventsMessage(
      events: _s.extractXmlChild(elem, 'Events')?.let((elem) =>
          elem.findElements('Event').map((c) => Event.fromXml(c)).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class FailoverDBClusterResult {
  final DBCluster dBCluster;

  FailoverDBClusterResult({
    this.dBCluster,
  });
  factory FailoverDBClusterResult.fromXml(_s.XmlElement elem) {
    return FailoverDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

/// A named set of filter values, used to return a more specific list of
/// results. You can use a filter to match a set of resources by specific
/// criteria, such as IDs.
///
/// Wildcards are not supported in filters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The name of the filter. Filter names are case sensitive.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// One or more filter values. Filter values are case sensitive.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

class ModifyDBClusterResult {
  final DBCluster dBCluster;

  ModifyDBClusterResult({
    this.dBCluster,
  });
  factory ModifyDBClusterResult.fromXml(_s.XmlElement elem) {
    return ModifyDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class ModifyDBClusterSnapshotAttributeResult {
  final DBClusterSnapshotAttributesResult dBClusterSnapshotAttributesResult;

  ModifyDBClusterSnapshotAttributeResult({
    this.dBClusterSnapshotAttributesResult,
  });
  factory ModifyDBClusterSnapshotAttributeResult.fromXml(_s.XmlElement elem) {
    return ModifyDBClusterSnapshotAttributeResult(
      dBClusterSnapshotAttributesResult: _s
          .extractXmlChild(elem, 'DBClusterSnapshotAttributesResult')
          ?.let((e) => DBClusterSnapshotAttributesResult.fromXml(e)),
    );
  }
}

class ModifyDBInstanceResult {
  final DBInstance dBInstance;

  ModifyDBInstanceResult({
    this.dBInstance,
  });
  factory ModifyDBInstanceResult.fromXml(_s.XmlElement elem) {
    return ModifyDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

class ModifyDBSubnetGroupResult {
  final DBSubnetGroup dBSubnetGroup;

  ModifyDBSubnetGroupResult({
    this.dBSubnetGroup,
  });
  factory ModifyDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyDBSubnetGroupResult(
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
    );
  }
}

/// The options that are available for an instance.
class OrderableDBInstanceOption {
  /// A list of Availability Zones for an instance.
  final List<AvailabilityZone> availabilityZones;

  /// The instance class for an instance.
  final String dBInstanceClass;

  /// The engine type of an instance.
  final String engine;

  /// The engine version of an instance.
  final String engineVersion;

  /// The license model for an instance.
  final String licenseModel;

  /// Indicates whether an instance is in a virtual private cloud (VPC).
  final bool vpc;

  OrderableDBInstanceOption({
    this.availabilityZones,
    this.dBInstanceClass,
    this.engine,
    this.engineVersion,
    this.licenseModel,
    this.vpc,
  });
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
      vpc: _s.extractXmlBoolValue(elem, 'Vpc'),
    );
  }
}

/// Represents the output of <a>DescribeOrderableDBInstanceOptions</a>.
class OrderableDBInstanceOptionsMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  /// The options that are available for a particular orderable instance.
  final List<OrderableDBInstanceOption> orderableDBInstanceOptions;

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
              .map((c) => OrderableDBInstanceOption.fromXml(c))
              .toList()),
    );
  }
}

/// Detailed information about an individual parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Parameter {
  /// Specifies the valid range of values for the parameter.
  @_s.JsonKey(name: 'AllowedValues')
  final String allowedValues;

  /// Indicates when to apply parameter updates.
  @_s.JsonKey(name: 'ApplyMethod')
  final ApplyMethod applyMethod;

  /// Specifies the engine-specific parameters type.
  @_s.JsonKey(name: 'ApplyType')
  final String applyType;

  /// Specifies the valid data type for the parameter.
  @_s.JsonKey(name: 'DataType')
  final String dataType;

  /// Provides a description of the parameter.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Indicates whether (<code>true</code>) or not (<code>false</code>) the
  /// parameter can be modified. Some parameters have security or operational
  /// implications that prevent them from being changed.
  @_s.JsonKey(name: 'IsModifiable')
  final bool isModifiable;

  /// The earliest engine version to which the parameter can apply.
  @_s.JsonKey(name: 'MinimumEngineVersion')
  final String minimumEngineVersion;

  /// Specifies the name of the parameter.
  @_s.JsonKey(name: 'ParameterName')
  final String parameterName;

  /// Specifies the value of the parameter.
  @_s.JsonKey(name: 'ParameterValue')
  final String parameterValue;

  /// Indicates the source of the parameter value.
  @_s.JsonKey(name: 'Source')
  final String source;

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

  Map<String, dynamic> toJson() => _$ParameterToJson(this);
}

/// A list of the log types whose configuration is still pending. These log
/// types are in the process of being activated or deactivated.
class PendingCloudwatchLogsExports {
  /// Log types that are in the process of being enabled. After they are enabled,
  /// these log types are exported to Amazon CloudWatch Logs.
  final List<String> logTypesToDisable;

  /// Log types that are in the process of being deactivated. After they are
  /// deactivated, these log types aren't exported to CloudWatch Logs.
  final List<String> logTypesToEnable;

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
}

/// Provides information about a pending maintenance action for a resource.
class PendingMaintenanceAction {
  /// The type of pending maintenance action that is available for the resource.
  final String action;

  /// The date of the maintenance window when the action is applied. The
  /// maintenance action is applied to the resource during its first maintenance
  /// window after this date. If this date is specified, any
  /// <code>next-maintenance</code> opt-in requests are ignored.
  final DateTime autoAppliedAfterDate;

  /// The effective date when the pending maintenance action is applied to the
  /// resource.
  final DateTime currentApplyDate;

  /// A description providing more detail about the maintenance action.
  final String description;

  /// The date when the maintenance action is automatically applied. The
  /// maintenance action is applied to the resource on this date regardless of the
  /// maintenance window for the resource. If this date is specified, any
  /// <code>immediate</code> opt-in requests are ignored.
  final DateTime forcedApplyDate;

  /// Indicates the type of opt-in request that has been received for the
  /// resource.
  final String optInStatus;

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
}

/// Represents the output of <a>DescribePendingMaintenanceActions</a>.
class PendingMaintenanceActionsMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String marker;

  /// The maintenance actions to be applied.
  final List<ResourcePendingMaintenanceActions> pendingMaintenanceActions;

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
              .map((c) => ResourcePendingMaintenanceActions.fromXml(c))
              .toList()),
    );
  }
}

/// One or more modified settings for an instance. These modified settings have
/// been requested, but haven't been applied yet.
class PendingModifiedValues {
  /// Contains the new <code>AllocatedStorage</code> size for then instance that
  /// will be applied or is currently being applied.
  final int allocatedStorage;

  /// Specifies the pending number of days for which automated backups are
  /// retained.
  final int backupRetentionPeriod;

  /// Specifies the identifier of the certificate authority (CA) certificate for
  /// the DB instance.
  final String cACertificateIdentifier;

  /// Contains the new <code>DBInstanceClass</code> for the instance that will be
  /// applied or is currently being applied.
  final String dBInstanceClass;

  /// Contains the new <code>DBInstanceIdentifier</code> for the instance that
  /// will be applied or is currently being applied.
  final String dBInstanceIdentifier;

  /// The new subnet group for the instance.
  final String dBSubnetGroupName;

  /// Indicates the database engine version.
  final String engineVersion;

  /// Specifies the new Provisioned IOPS value for the instance that will be
  /// applied or is currently being applied.
  final int iops;

  /// The license model for the instance.
  ///
  /// Valid values: <code>license-included</code>,
  /// <code>bring-your-own-license</code>, <code>general-public-license</code>
  final String licenseModel;

  /// Contains the pending or currently in-progress change of the master
  /// credentials for the instance.
  final String masterUserPassword;

  /// Indicates that the Single-AZ instance is to change to a Multi-AZ deployment.
  final bool multiAZ;

  /// A list of the log types whose configuration is still pending. These log
  /// types are in the process of being activated or deactivated.
  final PendingCloudwatchLogsExports pendingCloudwatchLogsExports;

  /// Specifies the pending port for the instance.
  final int port;

  /// Specifies the storage type to be associated with the instance.
  final String storageType;

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
          ?.let((e) => PendingCloudwatchLogsExports.fromXml(e)),
      port: _s.extractXmlIntValue(elem, 'Port'),
      storageType: _s.extractXmlStringValue(elem, 'StorageType'),
    );
  }
}

class RebootDBInstanceResult {
  final DBInstance dBInstance;

  RebootDBInstanceResult({
    this.dBInstance,
  });
  factory RebootDBInstanceResult.fromXml(_s.XmlElement elem) {
    return RebootDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

/// Represents the output of <a>ApplyPendingMaintenanceAction</a>.
class ResourcePendingMaintenanceActions {
  /// A list that provides details about the pending maintenance actions for the
  /// resource.
  final List<PendingMaintenanceAction> pendingMaintenanceActionDetails;

  /// The Amazon Resource Name (ARN) of the resource that has pending maintenance
  /// actions.
  final String resourceIdentifier;

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
              .map((c) => PendingMaintenanceAction.fromXml(c))
              .toList()),
      resourceIdentifier: _s.extractXmlStringValue(elem, 'ResourceIdentifier'),
    );
  }
}

class RestoreDBClusterFromSnapshotResult {
  final DBCluster dBCluster;

  RestoreDBClusterFromSnapshotResult({
    this.dBCluster,
  });
  factory RestoreDBClusterFromSnapshotResult.fromXml(_s.XmlElement elem) {
    return RestoreDBClusterFromSnapshotResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class RestoreDBClusterToPointInTimeResult {
  final DBCluster dBCluster;

  RestoreDBClusterToPointInTimeResult({
    this.dBCluster,
  });
  factory RestoreDBClusterToPointInTimeResult.fromXml(_s.XmlElement elem) {
    return RestoreDBClusterToPointInTimeResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

enum SourceType {
  @_s.JsonValue('db-instance')
  dbInstance,
  @_s.JsonValue('db-parameter-group')
  dbParameterGroup,
  @_s.JsonValue('db-security-group')
  dbSecurityGroup,
  @_s.JsonValue('db-snapshot')
  dbSnapshot,
  @_s.JsonValue('db-cluster')
  dbCluster,
  @_s.JsonValue('db-cluster-snapshot')
  dbClusterSnapshot,
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
      case SourceType.dbCluster:
        return 'db-cluster';
      case SourceType.dbClusterSnapshot:
        return 'db-cluster-snapshot';
    }
    throw Exception('Unknown enum value: $this');
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
      case 'db-cluster':
        return SourceType.dbCluster;
      case 'db-cluster-snapshot':
        return SourceType.dbClusterSnapshot;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class StartDBClusterResult {
  final DBCluster dBCluster;

  StartDBClusterResult({
    this.dBCluster,
  });
  factory StartDBClusterResult.fromXml(_s.XmlElement elem) {
    return StartDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

class StopDBClusterResult {
  final DBCluster dBCluster;

  StopDBClusterResult({
    this.dBCluster,
  });
  factory StopDBClusterResult.fromXml(_s.XmlElement elem) {
    return StopDBClusterResult(
      dBCluster: _s
          .extractXmlChild(elem, 'DBCluster')
          ?.let((e) => DBCluster.fromXml(e)),
    );
  }
}

/// Detailed information about a subnet.
class Subnet {
  /// Specifies the Availability Zone for the subnet.
  final AvailabilityZone subnetAvailabilityZone;

  /// Specifies the identifier of the subnet.
  final String subnetIdentifier;

  /// Specifies the status of the subnet.
  final String subnetStatus;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetStatus,
  });
  factory Subnet.fromXml(_s.XmlElement elem) {
    return Subnet(
      subnetAvailabilityZone: _s
          .extractXmlChild(elem, 'SubnetAvailabilityZone')
          ?.let((e) => AvailabilityZone.fromXml(e)),
      subnetIdentifier: _s.extractXmlStringValue(elem, 'SubnetIdentifier'),
      subnetStatus: _s.extractXmlStringValue(elem, 'SubnetStatus'),
    );
  }
}

/// Metadata assigned to an Amazon DocumentDB resource consisting of a key-value
/// pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  /// The required name of the tag. The string value can be from 1 to 128 Unicode
  /// characters in length and can't be prefixed with "aws:" or "rds:". The string
  /// can contain only the set of Unicode letters, digits, white space, '_', '.',
  /// '/', '=', '+', '-' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The optional value of the tag. The string value can be from 1 to 256 Unicode
  /// characters in length and can't be prefixed with "aws:" or "rds:". The string
  /// can contain only the set of Unicode letters, digits, white space, '_', '.',
  /// '/', '=', '+', '-' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  @_s.JsonKey(name: 'Value')
  final String value;

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

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Represents the output of <a>ListTagsForResource</a>.
class TagListMessage {
  /// A list of one or more tags.
  final List<Tag> tagList;

  TagListMessage({
    this.tagList,
  });
  factory TagListMessage.fromXml(_s.XmlElement elem) {
    return TagListMessage(
      tagList: _s.extractXmlChild(elem, 'TagList')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
    );
  }
}

/// The version of the database engine that an instance can be upgraded to.
class UpgradeTarget {
  /// A value that indicates whether the target version is applied to any source
  /// DB instances that have <code>AutoMinorVersionUpgrade</code> set to
  /// <code>true</code>.
  final bool autoUpgrade;

  /// The version of the database engine that an instance can be upgraded to.
  final String description;

  /// The name of the upgrade target database engine.
  final String engine;

  /// The version number of the upgrade target database engine.
  final String engineVersion;

  /// A value that indicates whether a database engine is upgraded to a major
  /// version.
  final bool isMajorVersionUpgrade;

  UpgradeTarget({
    this.autoUpgrade,
    this.description,
    this.engine,
    this.engineVersion,
    this.isMajorVersionUpgrade,
  });
  factory UpgradeTarget.fromXml(_s.XmlElement elem) {
    return UpgradeTarget(
      autoUpgrade: _s.extractXmlBoolValue(elem, 'AutoUpgrade'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      isMajorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'IsMajorVersionUpgrade'),
    );
  }
}

/// Used as a response element for queries on virtual private cloud (VPC)
/// security group membership.
class VpcSecurityGroupMembership {
  /// The status of the VPC security group.
  final String status;

  /// The name of the VPC security group.
  final String vpcSecurityGroupId;

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

class AuthorizationNotFoundFault extends _s.GenericAwsException {
  AuthorizationNotFoundFault({String type, String message})
      : super(type: type, code: 'AuthorizationNotFoundFault', message: message);
}

class CertificateNotFoundFault extends _s.GenericAwsException {
  CertificateNotFoundFault({String type, String message})
      : super(type: type, code: 'CertificateNotFoundFault', message: message);
}

class DBClusterAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterAlreadyExistsFault({String type, String message})
      : super(
            type: type, code: 'DBClusterAlreadyExistsFault', message: message);
}

class DBClusterNotFoundFault extends _s.GenericAwsException {
  DBClusterNotFoundFault({String type, String message})
      : super(type: type, code: 'DBClusterNotFoundFault', message: message);
}

class DBClusterParameterGroupNotFoundFault extends _s.GenericAwsException {
  DBClusterParameterGroupNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'DBClusterParameterGroupNotFoundFault',
            message: message);
}

class DBClusterQuotaExceededFault extends _s.GenericAwsException {
  DBClusterQuotaExceededFault({String type, String message})
      : super(
            type: type, code: 'DBClusterQuotaExceededFault', message: message);
}

class DBClusterSnapshotAlreadyExistsFault extends _s.GenericAwsException {
  DBClusterSnapshotAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'DBClusterSnapshotAlreadyExistsFault',
            message: message);
}

class DBClusterSnapshotNotFoundFault extends _s.GenericAwsException {
  DBClusterSnapshotNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'DBClusterSnapshotNotFoundFault',
            message: message);
}

class DBInstanceAlreadyExistsFault extends _s.GenericAwsException {
  DBInstanceAlreadyExistsFault({String type, String message})
      : super(
            type: type, code: 'DBInstanceAlreadyExistsFault', message: message);
}

class DBInstanceNotFoundFault extends _s.GenericAwsException {
  DBInstanceNotFoundFault({String type, String message})
      : super(type: type, code: 'DBInstanceNotFoundFault', message: message);
}

class DBParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBParameterGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'DBParameterGroupAlreadyExistsFault',
            message: message);
}

class DBParameterGroupNotFoundFault extends _s.GenericAwsException {
  DBParameterGroupNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'DBParameterGroupNotFoundFault',
            message: message);
}

class DBParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  DBParameterGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'DBParameterGroupQuotaExceededFault',
            message: message);
}

class DBSecurityGroupNotFoundFault extends _s.GenericAwsException {
  DBSecurityGroupNotFoundFault({String type, String message})
      : super(
            type: type, code: 'DBSecurityGroupNotFoundFault', message: message);
}

class DBSnapshotAlreadyExistsFault extends _s.GenericAwsException {
  DBSnapshotAlreadyExistsFault({String type, String message})
      : super(
            type: type, code: 'DBSnapshotAlreadyExistsFault', message: message);
}

class DBSnapshotNotFoundFault extends _s.GenericAwsException {
  DBSnapshotNotFoundFault({String type, String message})
      : super(type: type, code: 'DBSnapshotNotFoundFault', message: message);
}

class DBSubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBSubnetGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'DBSubnetGroupAlreadyExistsFault',
            message: message);
}

class DBSubnetGroupDoesNotCoverEnoughAZs extends _s.GenericAwsException {
  DBSubnetGroupDoesNotCoverEnoughAZs({String type, String message})
      : super(
            type: type,
            code: 'DBSubnetGroupDoesNotCoverEnoughAZs',
            message: message);
}

class DBSubnetGroupNotFoundFault extends _s.GenericAwsException {
  DBSubnetGroupNotFoundFault({String type, String message})
      : super(type: type, code: 'DBSubnetGroupNotFoundFault', message: message);
}

class DBSubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  DBSubnetGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'DBSubnetGroupQuotaExceededFault',
            message: message);
}

class DBSubnetQuotaExceededFault extends _s.GenericAwsException {
  DBSubnetQuotaExceededFault({String type, String message})
      : super(type: type, code: 'DBSubnetQuotaExceededFault', message: message);
}

class DBUpgradeDependencyFailureFault extends _s.GenericAwsException {
  DBUpgradeDependencyFailureFault({String type, String message})
      : super(
            type: type,
            code: 'DBUpgradeDependencyFailureFault',
            message: message);
}

class InstanceQuotaExceededFault extends _s.GenericAwsException {
  InstanceQuotaExceededFault({String type, String message})
      : super(type: type, code: 'InstanceQuotaExceededFault', message: message);
}

class InsufficientDBClusterCapacityFault extends _s.GenericAwsException {
  InsufficientDBClusterCapacityFault({String type, String message})
      : super(
            type: type,
            code: 'InsufficientDBClusterCapacityFault',
            message: message);
}

class InsufficientDBInstanceCapacityFault extends _s.GenericAwsException {
  InsufficientDBInstanceCapacityFault({String type, String message})
      : super(
            type: type,
            code: 'InsufficientDBInstanceCapacityFault',
            message: message);
}

class InsufficientStorageClusterCapacityFault extends _s.GenericAwsException {
  InsufficientStorageClusterCapacityFault({String type, String message})
      : super(
            type: type,
            code: 'InsufficientStorageClusterCapacityFault',
            message: message);
}

class InvalidDBClusterSnapshotStateFault extends _s.GenericAwsException {
  InvalidDBClusterSnapshotStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidDBClusterSnapshotStateFault',
            message: message);
}

class InvalidDBClusterStateFault extends _s.GenericAwsException {
  InvalidDBClusterStateFault({String type, String message})
      : super(type: type, code: 'InvalidDBClusterStateFault', message: message);
}

class InvalidDBInstanceStateFault extends _s.GenericAwsException {
  InvalidDBInstanceStateFault({String type, String message})
      : super(
            type: type, code: 'InvalidDBInstanceStateFault', message: message);
}

class InvalidDBParameterGroupStateFault extends _s.GenericAwsException {
  InvalidDBParameterGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidDBParameterGroupStateFault',
            message: message);
}

class InvalidDBSecurityGroupStateFault extends _s.GenericAwsException {
  InvalidDBSecurityGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidDBSecurityGroupStateFault',
            message: message);
}

class InvalidDBSnapshotStateFault extends _s.GenericAwsException {
  InvalidDBSnapshotStateFault({String type, String message})
      : super(
            type: type, code: 'InvalidDBSnapshotStateFault', message: message);
}

class InvalidDBSubnetGroupStateFault extends _s.GenericAwsException {
  InvalidDBSubnetGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidDBSubnetGroupStateFault',
            message: message);
}

class InvalidDBSubnetStateFault extends _s.GenericAwsException {
  InvalidDBSubnetStateFault({String type, String message})
      : super(type: type, code: 'InvalidDBSubnetStateFault', message: message);
}

class InvalidRestoreFault extends _s.GenericAwsException {
  InvalidRestoreFault({String type, String message})
      : super(type: type, code: 'InvalidRestoreFault', message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String type, String message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class InvalidVPCNetworkStateFault extends _s.GenericAwsException {
  InvalidVPCNetworkStateFault({String type, String message})
      : super(
            type: type, code: 'InvalidVPCNetworkStateFault', message: message);
}

class KMSKeyNotAccessibleFault extends _s.GenericAwsException {
  KMSKeyNotAccessibleFault({String type, String message})
      : super(type: type, code: 'KMSKeyNotAccessibleFault', message: message);
}

class ResourceNotFoundFault extends _s.GenericAwsException {
  ResourceNotFoundFault({String type, String message})
      : super(type: type, code: 'ResourceNotFoundFault', message: message);
}

class SharedSnapshotQuotaExceededFault extends _s.GenericAwsException {
  SharedSnapshotQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'SharedSnapshotQuotaExceededFault',
            message: message);
}

class SnapshotQuotaExceededFault extends _s.GenericAwsException {
  SnapshotQuotaExceededFault({String type, String message})
      : super(type: type, code: 'SnapshotQuotaExceededFault', message: message);
}

class StorageQuotaExceededFault extends _s.GenericAwsException {
  StorageQuotaExceededFault({String type, String message})
      : super(type: type, code: 'StorageQuotaExceededFault', message: message);
}

class StorageTypeNotSupportedFault extends _s.GenericAwsException {
  StorageTypeNotSupportedFault({String type, String message})
      : super(
            type: type, code: 'StorageTypeNotSupportedFault', message: message);
}

class SubnetAlreadyInUse extends _s.GenericAwsException {
  SubnetAlreadyInUse({String type, String message})
      : super(type: type, code: 'SubnetAlreadyInUse', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AuthorizationNotFoundFault': (type, message) =>
      AuthorizationNotFoundFault(type: type, message: message),
  'CertificateNotFoundFault': (type, message) =>
      CertificateNotFoundFault(type: type, message: message),
  'DBClusterAlreadyExistsFault': (type, message) =>
      DBClusterAlreadyExistsFault(type: type, message: message),
  'DBClusterNotFoundFault': (type, message) =>
      DBClusterNotFoundFault(type: type, message: message),
  'DBClusterParameterGroupNotFoundFault': (type, message) =>
      DBClusterParameterGroupNotFoundFault(type: type, message: message),
  'DBClusterQuotaExceededFault': (type, message) =>
      DBClusterQuotaExceededFault(type: type, message: message),
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
  'InstanceQuotaExceededFault': (type, message) =>
      InstanceQuotaExceededFault(type: type, message: message),
  'InsufficientDBClusterCapacityFault': (type, message) =>
      InsufficientDBClusterCapacityFault(type: type, message: message),
  'InsufficientDBInstanceCapacityFault': (type, message) =>
      InsufficientDBInstanceCapacityFault(type: type, message: message),
  'InsufficientStorageClusterCapacityFault': (type, message) =>
      InsufficientStorageClusterCapacityFault(type: type, message: message),
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
  'InvalidRestoreFault': (type, message) =>
      InvalidRestoreFault(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'InvalidVPCNetworkStateFault': (type, message) =>
      InvalidVPCNetworkStateFault(type: type, message: message),
  'KMSKeyNotAccessibleFault': (type, message) =>
      KMSKeyNotAccessibleFault(type: type, message: message),
  'ResourceNotFoundFault': (type, message) =>
      ResourceNotFoundFault(type: type, message: message),
  'SharedSnapshotQuotaExceededFault': (type, message) =>
      SharedSnapshotQuotaExceededFault(type: type, message: message),
  'SnapshotQuotaExceededFault': (type, message) =>
      SnapshotQuotaExceededFault(type: type, message: message),
  'StorageQuotaExceededFault': (type, message) =>
      StorageQuotaExceededFault(type: type, message: message),
  'StorageTypeNotSupportedFault': (type, message) =>
      StorageTypeNotSupportedFault(type: type, message: message),
  'SubnetAlreadyInUse': (type, message) =>
      SubnetAlreadyInUse(type: type, message: message),
};
