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

/// MemoryDB for Redis is a fully managed, Redis-compatible, in-memory database
/// that delivers ultra-fast performance and Multi-AZ durability for modern
/// applications built using microservices architectures. MemoryDB stores the
/// entire database in-memory, enabling low latency and high throughput data
/// access. It is compatible with Redis, a popular open source data store,
/// enabling you to leverage Redis’ flexible and friendly data structures, APIs,
/// and commands.
class MemoryDB {
  final _s.JsonProtocol _protocol;
  MemoryDB({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'memory-db',
            signingName: 'memorydb',
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

  /// Apply the service update to a list of clusters supplied. For more
  /// information on service updates and applying them, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/managing-updates.html#applying-updates">Applying
  /// the service updates</a>.
  ///
  /// May throw [ServiceUpdateNotFoundFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [clusterNames] :
  /// The cluster names to apply the updates.
  ///
  /// Parameter [serviceUpdate] :
  /// The unique ID of the service update
  Future<BatchUpdateClusterResponse> batchUpdateCluster({
    required List<String> clusterNames,
    ServiceUpdateRequest? serviceUpdate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.BatchUpdateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterNames': clusterNames,
        if (serviceUpdate != null) 'ServiceUpdate': serviceUpdate,
      },
    );

    return BatchUpdateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Makes a copy of an existing snapshot.
  ///
  /// May throw [SnapshotAlreadyExistsFault].
  /// May throw [SnapshotNotFoundFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidSnapshotStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [TagQuotaPerResourceExceeded].
  ///
  /// Parameter [sourceSnapshotName] :
  /// The name of an existing snapshot from which to make a copy.
  ///
  /// Parameter [targetSnapshotName] :
  /// A name for the snapshot copy. MemoryDB does not permit overwriting a
  /// snapshot, therefore this name must be unique within its context - MemoryDB
  /// or an Amazon S3 bucket if exporting.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key used to encrypt the target snapshot.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  ///
  /// Parameter [targetBucket] :
  /// The Amazon S3 bucket to which the snapshot is exported. This parameter is
  /// used only when exporting a snapshot for external access. When using this
  /// parameter to export a snapshot, be sure MemoryDB has the needed
  /// permissions to this S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/snapshots-exporting.html">Step
  /// 2: Grant MemoryDB Access to Your Amazon S3 Bucket</a>.
  Future<CopySnapshotResponse> copySnapshot({
    required String sourceSnapshotName,
    required String targetSnapshotName,
    String? kmsKeyId,
    List<Tag>? tags,
    String? targetBucket,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.CopySnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SourceSnapshotName': sourceSnapshotName,
        'TargetSnapshotName': targetSnapshotName,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (tags != null) 'Tags': tags,
        if (targetBucket != null) 'TargetBucket': targetBucket,
      },
    );

    return CopySnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Access Control List. For more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/clusters.acls.html">Authenticating
  /// users with Access Contol Lists (ACLs)</a>.
  ///
  /// May throw [UserNotFoundFault].
  /// May throw [DuplicateUserNameFault].
  /// May throw [ACLAlreadyExistsFault].
  /// May throw [DefaultUserRequired].
  /// May throw [ACLQuotaExceededFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [TagQuotaPerResourceExceeded].
  ///
  /// Parameter [aCLName] :
  /// The name of the Access Control List.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  ///
  /// Parameter [userNames] :
  /// The list of users that belong to the Access Control List.
  Future<CreateACLResponse> createACL({
    required String aCLName,
    List<Tag>? tags,
    List<String>? userNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.CreateACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ACLName': aCLName,
        if (tags != null) 'Tags': tags,
        if (userNames != null) 'UserNames': userNames,
      },
    );

    return CreateACLResponse.fromJson(jsonResponse.body);
  }

  /// Creates a cluster. All nodes in the cluster run the same
  /// protocol-compliant engine software.
  ///
  /// May throw [ClusterAlreadyExistsFault].
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [ClusterQuotaForCustomerExceededFault].
  /// May throw [NodeQuotaForClusterExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [InsufficientClusterCapacityFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [ShardsPerClusterQuotaExceededFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidCredentialsException].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [ACLNotFoundFault].
  /// May throw [InvalidACLStateFault].
  ///
  /// Parameter [aCLName] :
  /// The name of the Access Control List to associate with the cluster.
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster. This value must be unique as it also serves as
  /// the cluster identifier.
  ///
  /// Parameter [nodeType] :
  /// The compute and memory capacity of the nodes in the cluster.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// When set to true, the cluster will automatically receive minor engine
  /// version upgrades after launch.
  ///
  /// Parameter [dataTiering] :
  /// Enables data tiering. Data tiering is only supported for clusters using
  /// the r6gd node type. This parameter must be set when using r6gd nodes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/memorydb/latest/devguide/data-tiering.html">Data
  /// tiering</a>.
  ///
  /// Parameter [description] :
  /// An optional description of the cluster.
  ///
  /// Parameter [engineVersion] :
  /// The version number of the Redis engine to be used for the cluster.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key used to encrypt the cluster.
  ///
  /// Parameter [maintenanceWindow] :
  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format
  /// ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is
  /// a 60 minute period.
  ///
  /// Valid values for <code>ddd</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>sun</code>
  /// </li>
  /// <li>
  /// <code>mon</code>
  /// </li>
  /// <li>
  /// <code>tue</code>
  /// </li>
  /// <li>
  /// <code>wed</code>
  /// </li>
  /// <li>
  /// <code>thu</code>
  /// </li>
  /// <li>
  /// <code>fri</code>
  /// </li>
  /// <li>
  /// <code>sat</code>
  /// </li>
  /// </ul>
  /// Example: <code>sun:23:00-mon:01:30</code>
  ///
  /// Parameter [numReplicasPerShard] :
  /// The number of replicas to apply to each shard. The default value is 1. The
  /// maximum is 5.
  ///
  /// Parameter [numShards] :
  /// The number of shards the cluster will contain. The default value is 1.
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group associated with the cluster.
  ///
  /// Parameter [port] :
  /// The port number on which each of the nodes accepts connections.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of security group names to associate with this cluster.
  ///
  /// Parameter [snapshotArns] :
  /// A list of Amazon Resource Names (ARN) that uniquely identify the RDB
  /// snapshot files stored in Amazon S3. The snapshot files are used to
  /// populate the new cluster. The Amazon S3 object name in the ARN cannot
  /// contain any commas.
  ///
  /// Parameter [snapshotName] :
  /// The name of a snapshot from which to restore data into the new cluster.
  /// The snapshot status changes to restoring while the new cluster is being
  /// created.
  ///
  /// Parameter [snapshotRetentionLimit] :
  /// The number of days for which MemoryDB retains automatic snapshots before
  /// deleting them. For example, if you set SnapshotRetentionLimit to 5, a
  /// snapshot that was taken today is retained for 5 days before being deleted.
  ///
  /// Parameter [snapshotWindow] :
  /// The daily time range (in UTC) during which MemoryDB begins taking a daily
  /// snapshot of your shard.
  ///
  /// Example: 05:00-09:00
  ///
  /// If you do not specify this parameter, MemoryDB automatically chooses an
  /// appropriate time range.
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// (SNS) topic to which notifications are sent.
  ///
  /// Parameter [subnetGroupName] :
  /// The name of the subnet group to be used for the cluster.
  ///
  /// Parameter [tLSEnabled] :
  /// A flag to enable in-transit encryption on the cluster.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. Tags are comma-separated
  /// key,value pairs (e.g. Key=myKey, Value=myKeyValue. You can include
  /// multiple tags as shown following: Key=myKey, Value=myKeyValue
  /// Key=mySecondKey, Value=mySecondKeyValue.
  Future<CreateClusterResponse> createCluster({
    required String aCLName,
    required String clusterName,
    required String nodeType,
    bool? autoMinorVersionUpgrade,
    bool? dataTiering,
    String? description,
    String? engineVersion,
    String? kmsKeyId,
    String? maintenanceWindow,
    int? numReplicasPerShard,
    int? numShards,
    String? parameterGroupName,
    int? port,
    List<String>? securityGroupIds,
    List<String>? snapshotArns,
    String? snapshotName,
    int? snapshotRetentionLimit,
    String? snapshotWindow,
    String? snsTopicArn,
    String? subnetGroupName,
    bool? tLSEnabled,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.CreateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ACLName': aCLName,
        'ClusterName': clusterName,
        'NodeType': nodeType,
        if (autoMinorVersionUpgrade != null)
          'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
        if (dataTiering != null) 'DataTiering': dataTiering,
        if (description != null) 'Description': description,
        if (engineVersion != null) 'EngineVersion': engineVersion,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (maintenanceWindow != null) 'MaintenanceWindow': maintenanceWindow,
        if (numReplicasPerShard != null)
          'NumReplicasPerShard': numReplicasPerShard,
        if (numShards != null) 'NumShards': numShards,
        if (parameterGroupName != null)
          'ParameterGroupName': parameterGroupName,
        if (port != null) 'Port': port,
        if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
        if (snapshotArns != null) 'SnapshotArns': snapshotArns,
        if (snapshotName != null) 'SnapshotName': snapshotName,
        if (snapshotRetentionLimit != null)
          'SnapshotRetentionLimit': snapshotRetentionLimit,
        if (snapshotWindow != null) 'SnapshotWindow': snapshotWindow,
        if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
        if (subnetGroupName != null) 'SubnetGroupName': subnetGroupName,
        if (tLSEnabled != null) 'TLSEnabled': tLSEnabled,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new MemoryDB parameter group. A parameter group is a collection
  /// of parameters and their values that are applied to all of the nodes in any
  /// cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/parametergroups.html">Configuring
  /// engine parameters using parameter groups</a>.
  ///
  /// May throw [ParameterGroupQuotaExceededFault].
  /// May throw [ParameterGroupAlreadyExistsFault].
  /// May throw [InvalidParameterGroupStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [family] :
  /// The name of the parameter group family that the parameter group can be
  /// used with.
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group.
  ///
  /// Parameter [description] :
  /// An optional description of the parameter group.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<CreateParameterGroupResponse> createParameterGroup({
    required String family,
    required String parameterGroupName,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.CreateParameterGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Family': family,
        'ParameterGroupName': parameterGroupName,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateParameterGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a copy of an entire cluster at a specific moment in time.
  ///
  /// May throw [SnapshotAlreadyExistsFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TagQuotaPerResourceExceeded].
  ///
  /// Parameter [clusterName] :
  /// The snapshot is created from this cluster.
  ///
  /// Parameter [snapshotName] :
  /// A name for the snapshot being created.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key used to encrypt the snapshot.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<CreateSnapshotResponse> createSnapshot({
    required String clusterName,
    required String snapshotName,
    String? kmsKeyId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.CreateSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
        'SnapshotName': snapshotName,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Creates a subnet group. A subnet group is a collection of subnets
  /// (typically private) that you can designate for your clusters running in an
  /// Amazon Virtual Private Cloud (VPC) environment. When you create a cluster
  /// in an Amazon VPC, you must specify a subnet group. MemoryDB uses that
  /// subnet group to choose a subnet and IP addresses within that subnet to
  /// associate with your nodes. For more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/subnetgroups.html">Subnets
  /// and subnet groups</a>.
  ///
  /// May throw [SubnetGroupAlreadyExistsFault].
  /// May throw [SubnetGroupQuotaExceededFault].
  /// May throw [SubnetQuotaExceededFault].
  /// May throw [InvalidSubnet].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [SubnetNotAllowedFault].
  /// May throw [TagQuotaPerResourceExceeded].
  ///
  /// Parameter [subnetGroupName] :
  /// The name of the subnet group.
  ///
  /// Parameter [subnetIds] :
  /// A list of VPC subnet IDs for the subnet group.
  ///
  /// Parameter [description] :
  /// A description for the subnet group.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<CreateSubnetGroupResponse> createSubnetGroup({
    required String subnetGroupName,
    required List<String> subnetIds,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.CreateSubnetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubnetGroupName': subnetGroupName,
        'SubnetIds': subnetIds,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateSubnetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a MemoryDB user. For more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/clusters.acls.html">Authenticating
  /// users with Access Contol Lists (ACLs)</a>.
  ///
  /// May throw [UserAlreadyExistsFault].
  /// May throw [UserQuotaExceededFault].
  /// May throw [DuplicateUserNameFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [TagQuotaPerResourceExceeded].
  ///
  /// Parameter [accessString] :
  /// Access permissions string used for this user.
  ///
  /// Parameter [authenticationMode] :
  /// Denotes the user's authentication properties, such as whether it requires
  /// a password to authenticate.
  ///
  /// Parameter [userName] :
  /// The name of the user. This value must be unique as it also serves as the
  /// user identifier.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<CreateUserResponse> createUser({
    required String accessString,
    required AuthenticationMode authenticationMode,
    required String userName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.CreateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessString': accessString,
        'AuthenticationMode': authenticationMode,
        'UserName': userName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Access Control List. The ACL must first be disassociated from
  /// the cluster before it can be deleted. For more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/clusters.acls.html">Authenticating
  /// users with Access Contol Lists (ACLs)</a>.
  ///
  /// May throw [ACLNotFoundFault].
  /// May throw [InvalidACLStateFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [aCLName] :
  /// The name of the Access Control List to delete
  Future<DeleteACLResponse> deleteACL({
    required String aCLName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DeleteACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ACLName': aCLName,
      },
    );

    return DeleteACLResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a cluster. It also deletes all associated nodes and node endpoints
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [SnapshotAlreadyExistsFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to be deleted
  ///
  /// Parameter [finalSnapshotName] :
  /// The user-supplied name of a final cluster snapshot. This is the unique
  /// name that identifies the snapshot. MemoryDB creates the snapshot, and then
  /// deletes the cluster immediately afterward.
  Future<DeleteClusterResponse> deleteCluster({
    required String clusterName,
    String? finalSnapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DeleteCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
        if (finalSnapshotName != null) 'FinalSnapshotName': finalSnapshotName,
      },
    );

    return DeleteClusterResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified parameter group. You cannot delete a parameter group
  /// if it is associated with any clusters. You cannot delete the default
  /// parameter groups in your account.
  ///
  /// May throw [InvalidParameterGroupStateFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group to delete.
  Future<DeleteParameterGroupResponse> deleteParameterGroup({
    required String parameterGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DeleteParameterGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterGroupName': parameterGroupName,
      },
    );

    return DeleteParameterGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an existing snapshot. When you receive a successful response from
  /// this operation, MemoryDB immediately begins deleting the snapshot; you
  /// cannot cancel or revert this operation.
  ///
  /// May throw [SnapshotNotFoundFault].
  /// May throw [InvalidSnapshotStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [snapshotName] :
  /// The name of the snapshot to delete
  Future<DeleteSnapshotResponse> deleteSnapshot({
    required String snapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DeleteSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SnapshotName': snapshotName,
      },
    );

    return DeleteSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a subnet group. You cannot delete a default subnet group or one
  /// that is associated with any clusters.
  ///
  /// May throw [SubnetGroupInUseFault].
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [subnetGroupName] :
  /// The name of the subnet group to delete
  Future<DeleteSubnetGroupResponse> deleteSubnetGroup({
    required String subnetGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DeleteSubnetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubnetGroupName': subnetGroupName,
      },
    );

    return DeleteSubnetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a user. The user will be removed from all ACLs and in turn removed
  /// from all clusters.
  ///
  /// May throw [InvalidUserStateFault].
  /// May throw [UserNotFoundFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [userName] :
  /// The name of the user to delete
  Future<DeleteUserResponse> deleteUser({
    required String userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DeleteUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserName': userName,
      },
    );

    return DeleteUserResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of ACLs
  ///
  /// May throw [ACLNotFoundFault].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [aCLName] :
  /// The name of the ACL
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  Future<DescribeACLsResponse> describeACLs({
    String? aCLName,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeACLs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (aCLName != null) 'ACLName': aCLName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeACLsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about all provisioned clusters if no cluster
  /// identifier is specified, or about a specific cluster if a cluster name is
  /// supplied.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  ///
  /// Parameter [showShardDetails] :
  /// An optional flag that can be included in the request to retrieve
  /// information about the individual shard(s).
  Future<DescribeClustersResponse> describeClusters({
    String? clusterName,
    int? maxResults,
    String? nextToken,
    bool? showShardDetails,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeClusters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clusterName != null) 'ClusterName': clusterName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (showShardDetails != null) 'ShowShardDetails': showShardDetails,
      },
    );

    return DescribeClustersResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the available Redis engine versions.
  ///
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [defaultOnly] :
  /// If true, specifies that only the default version of the specified engine
  /// or engine and major version combination is to be returned.
  ///
  /// Parameter [engineVersion] :
  /// The Redis engine version
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  ///
  /// Parameter [parameterGroupFamily] :
  /// The name of a specific parameter group family to return details for.
  Future<DescribeEngineVersionsResponse> describeEngineVersions({
    bool? defaultOnly,
    String? engineVersion,
    int? maxResults,
    String? nextToken,
    String? parameterGroupFamily,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeEngineVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (defaultOnly != null) 'DefaultOnly': defaultOnly,
        if (engineVersion != null) 'EngineVersion': engineVersion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (parameterGroupFamily != null)
          'ParameterGroupFamily': parameterGroupFamily,
      },
    );

    return DescribeEngineVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns events related to clusters, security groups, and parameter groups.
  /// You can obtain events specific to a particular cluster, security group, or
  /// parameter group by providing the name as a parameter. By default, only the
  /// events occurring within the last hour are returned; however, you can
  /// retrieve up to 14 days' worth of events if necessary.
  ///
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [duration] :
  /// The number of minutes worth of events to retrieve.
  ///
  /// Parameter [endTime] :
  /// The end of the time interval for which to retrieve events, specified in
  /// ISO 8601 format. Example: 2017-03-30T07:03:49.555Z
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  ///
  /// Parameter [sourceName] :
  /// The identifier of the event source for which events are returned. If not
  /// specified, all sources are included in the response.
  ///
  /// Parameter [sourceType] :
  /// The event source to retrieve events for. If no value is specified, all
  /// events are returned.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time interval to retrieve events for, specified in
  /// ISO 8601 format. Example: 2017-03-30T07:03:49.555Z
  Future<DescribeEventsResponse> describeEvents({
    int? duration,
    DateTime? endTime,
    int? maxResults,
    String? nextToken,
    String? sourceName,
    SourceType? sourceType,
    DateTime? startTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (duration != null) 'Duration': duration,
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sourceName != null) 'SourceName': sourceName,
        if (sourceType != null) 'SourceType': sourceType.toValue(),
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return DescribeEventsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of parameter group descriptions. If a parameter group name
  /// is specified, the list contains only the descriptions for that group.
  ///
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  ///
  /// Parameter [parameterGroupName] :
  /// The name of a specific parameter group to return details for.
  Future<DescribeParameterGroupsResponse> describeParameterGroups({
    int? maxResults,
    String? nextToken,
    String? parameterGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeParameterGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (parameterGroupName != null)
          'ParameterGroupName': parameterGroupName,
      },
    );

    return DescribeParameterGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the detailed parameter list for a particular parameter group.
  ///
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [parameterGroupName] :
  /// he name of a specific parameter group to return details for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  Future<DescribeParametersResponse> describeParameters({
    required String parameterGroupName,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterGroupName': parameterGroupName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeParametersResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about reserved nodes for this account, or about a
  /// specified reserved node.
  ///
  /// May throw [ReservedNodeNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [duration] :
  /// The duration filter value, specified in years or seconds. Use this
  /// parameter to show only reservations for this duration.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxRecords value, a marker is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords.
  ///
  /// Parameter [nodeType] :
  /// The node type filter value. Use this parameter to show only those
  /// reservations matching the specified node type. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/memorydb/latest/devguide/nodes.reserved.html#reserved-nodes-supported">Supported
  /// node types</a>.
  ///
  /// Parameter [offeringType] :
  /// The offering type filter value. Use this parameter to show only the
  /// available offerings matching the specified offering type. Valid values:
  /// "All Upfront"|"Partial Upfront"| "No Upfront"
  ///
  /// Parameter [reservationId] :
  /// The reserved node identifier filter value. Use this parameter to show only
  /// the reservation that matches the specified reservation ID.
  ///
  /// Parameter [reservedNodesOfferingId] :
  /// The offering identifier filter value. Use this parameter to show only
  /// purchased reservations matching the specified offering identifier.
  Future<DescribeReservedNodesResponse> describeReservedNodes({
    String? duration,
    int? maxResults,
    String? nextToken,
    String? nodeType,
    String? offeringType,
    String? reservationId,
    String? reservedNodesOfferingId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeReservedNodes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (duration != null) 'Duration': duration,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (nodeType != null) 'NodeType': nodeType,
        if (offeringType != null) 'OfferingType': offeringType,
        if (reservationId != null) 'ReservationId': reservationId,
        if (reservedNodesOfferingId != null)
          'ReservedNodesOfferingId': reservedNodesOfferingId,
      },
    );

    return DescribeReservedNodesResponse.fromJson(jsonResponse.body);
  }

  /// Lists available reserved node offerings.
  ///
  /// May throw [ReservedNodesOfferingNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [duration] :
  /// Duration filter value, specified in years or seconds. Use this parameter
  /// to show only reservations for a given duration.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxRecords value, a marker is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords.
  ///
  /// Parameter [nodeType] :
  /// The node type for the reserved nodes. For more information, see <a
  /// href="https://docs.aws.amazon.com/memorydb/latest/devguide/nodes.reserved.html#reserved-nodes-supported">Supported
  /// node types</a>.
  ///
  /// Parameter [offeringType] :
  /// The offering type filter value. Use this parameter to show only the
  /// available offerings matching the specified offering type. Valid values:
  /// "All Upfront"|"Partial Upfront"| "No Upfront"
  ///
  /// Parameter [reservedNodesOfferingId] :
  /// The offering identifier filter value. Use this parameter to show only the
  /// available offering that matches the specified reservation identifier.
  Future<DescribeReservedNodesOfferingsResponse>
      describeReservedNodesOfferings({
    String? duration,
    int? maxResults,
    String? nextToken,
    String? nodeType,
    String? offeringType,
    String? reservedNodesOfferingId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeReservedNodesOfferings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (duration != null) 'Duration': duration,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (nodeType != null) 'NodeType': nodeType,
        if (offeringType != null) 'OfferingType': offeringType,
        if (reservedNodesOfferingId != null)
          'ReservedNodesOfferingId': reservedNodesOfferingId,
      },
    );

    return DescribeReservedNodesOfferingsResponse.fromJson(jsonResponse.body);
  }

  /// Returns details of the service updates
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterNames] :
  /// The list of cluster names to identify service updates to apply
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  ///
  /// Parameter [serviceUpdateName] :
  /// The unique ID of the service update to describe.
  ///
  /// Parameter [status] :
  /// The status(es) of the service updates to filter on
  Future<DescribeServiceUpdatesResponse> describeServiceUpdates({
    List<String>? clusterNames,
    int? maxResults,
    String? nextToken,
    String? serviceUpdateName,
    List<ServiceUpdateStatus>? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeServiceUpdates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clusterNames != null) 'ClusterNames': clusterNames,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (serviceUpdateName != null) 'ServiceUpdateName': serviceUpdateName,
        if (status != null) 'Status': status.map((e) => e.toValue()).toList(),
      },
    );

    return DescribeServiceUpdatesResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about cluster snapshots. By default, DescribeSnapshots
  /// lists all of your snapshots; it can optionally describe a single snapshot,
  /// or just the snapshots associated with a particular cluster.
  ///
  /// May throw [SnapshotNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// A user-supplied cluster identifier. If this parameter is specified, only
  /// snapshots associated with that specific cluster are described.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  ///
  /// Parameter [showDetail] :
  /// A Boolean value which if true, the shard configuration is included in the
  /// snapshot description.
  ///
  /// Parameter [snapshotName] :
  /// A user-supplied name of the snapshot. If this parameter is specified, only
  /// this named snapshot is described.
  ///
  /// Parameter [source] :
  /// If set to system, the output shows snapshots that were automatically
  /// created by MemoryDB. If set to user the output shows snapshots that were
  /// manually created. If omitted, the output shows both automatically and
  /// manually created snapshots.
  Future<DescribeSnapshotsResponse> describeSnapshots({
    String? clusterName,
    int? maxResults,
    String? nextToken,
    bool? showDetail,
    String? snapshotName,
    String? source,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clusterName != null) 'ClusterName': clusterName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (showDetail != null) 'ShowDetail': showDetail,
        if (snapshotName != null) 'SnapshotName': snapshotName,
        if (source != null) 'Source': source,
      },
    );

    return DescribeSnapshotsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of subnet group descriptions. If a subnet group name is
  /// specified, the list contains only the description of that group.
  ///
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  ///
  /// Parameter [subnetGroupName] :
  /// The name of the subnet group to return details for.
  Future<DescribeSubnetGroupsResponse> describeSubnetGroups({
    int? maxResults,
    String? nextToken,
    String? subnetGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeSubnetGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (subnetGroupName != null) 'SubnetGroupName': subnetGroupName,
      },
    );

    return DescribeSubnetGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of users.
  ///
  /// May throw [UserNotFoundFault].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [filters] :
  /// Filter to determine the list of users to return.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional argument to pass in case the total number of records exceeds
  /// the value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  ///
  /// Parameter [userName] :
  /// The name of the user
  Future<DescribeUsersResponse> describeUsers({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    String? userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.DescribeUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (userName != null) 'UserName': userName,
      },
    );

    return DescribeUsersResponse.fromJson(jsonResponse.body);
  }

  /// Used to failover a shard. This API is designed for testing the behavior of
  /// your application in case of MemoryDB failover. It is not designed to be
  /// used as a production-level tool for initiating a failover to overcome a
  /// problem you may have with the cluster. Moreover, in certain conditions
  /// such as large scale operational events, Amazon may block this API.
  ///
  /// May throw [APICallRateForCustomerExceededFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ShardNotFoundFault].
  /// May throw [ClusterNotFoundFault].
  /// May throw [TestFailoverNotAvailableFault].
  /// May throw [InvalidKMSKeyFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// The cluster being failed over
  ///
  /// Parameter [shardName] :
  /// The name of the shard
  Future<FailoverShardResponse> failoverShard({
    required String clusterName,
    required String shardName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.FailoverShard'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
        'ShardName': shardName,
      },
    );

    return FailoverShardResponse.fromJson(jsonResponse.body);
  }

  /// Lists all available node types that you can scale to from your cluster's
  /// current node type. When you use the UpdateCluster operation to scale your
  /// cluster, the value of the NodeType parameter must be one of the node types
  /// returned by this operation.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster you want to scale. MemoryDB uses the cluster name
  /// to identify the current node type being used by this cluster, and from
  /// that to create a list of node types you can scale up to.
  Future<ListAllowedNodeTypeUpdatesResponse> listAllowedNodeTypeUpdates({
    required String clusterName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.ListAllowedNodeTypeUpdates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
      },
    );

    return ListAllowedNodeTypeUpdatesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags currently on a named resource. A tag is a key-value pair
  /// where the key and value are case-sensitive. You can use tags to categorize
  /// and track your MemoryDB resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/Tagging-Resources.html">Tagging
  /// your MemoryDB resources</a>
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [SnapshotNotFoundFault].
  /// May throw [InvalidARNFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [UserNotFoundFault].
  /// May throw [ACLNotFoundFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want the list
  /// of tags
  Future<ListTagsResponse> listTags({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.ListTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsResponse.fromJson(jsonResponse.body);
  }

  /// Allows you to purchase a reserved node offering. Reserved nodes are not
  /// eligible for cancellation and are non-refundable.
  ///
  /// May throw [ReservedNodesOfferingNotFoundFault].
  /// May throw [ReservedNodeAlreadyExistsFault].
  /// May throw [ReservedNodeQuotaExceededFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [reservedNodesOfferingId] :
  /// The ID of the reserved node offering to purchase.
  ///
  /// Parameter [nodeCount] :
  /// The number of node instances to reserve.
  ///
  /// Parameter [reservationId] :
  /// A customer-specified identifier to track this reservation.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<PurchaseReservedNodesOfferingResponse> purchaseReservedNodesOffering({
    required String reservedNodesOfferingId,
    int? nodeCount,
    String? reservationId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.PurchaseReservedNodesOffering'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReservedNodesOfferingId': reservedNodesOfferingId,
        if (nodeCount != null) 'NodeCount': nodeCount,
        if (reservationId != null) 'ReservationId': reservationId,
        if (tags != null) 'Tags': tags,
      },
    );

    return PurchaseReservedNodesOfferingResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the parameters of a parameter group to the engine or system
  /// default value. You can reset specific parameters by submitting a list of
  /// parameter names. To reset the entire parameter group, specify the
  /// AllParameters and ParameterGroupName parameters.
  ///
  /// May throw [InvalidParameterGroupStateFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group to reset.
  ///
  /// Parameter [allParameters] :
  /// If true, all parameters in the parameter group are reset to their default
  /// values. If false, only the parameters listed by ParameterNames are reset
  /// to their default values.
  ///
  /// Parameter [parameterNames] :
  /// An array of parameter names to reset to their default values. If
  /// AllParameters is true, do not use ParameterNames. If AllParameters is
  /// false, you must specify the name of at least one parameter to reset.
  Future<ResetParameterGroupResponse> resetParameterGroup({
    required String parameterGroupName,
    bool? allParameters,
    List<String>? parameterNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.ResetParameterGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterGroupName': parameterGroupName,
        if (allParameters != null) 'AllParameters': allParameters,
        if (parameterNames != null) 'ParameterNames': parameterNames,
      },
    );

    return ResetParameterGroupResponse.fromJson(jsonResponse.body);
  }

  /// A tag is a key-value pair where the key and value are case-sensitive. You
  /// can use tags to categorize and track all your MemoryDB resources. When you
  /// add or remove tags on clusters, those actions will be replicated to all
  /// nodes in the cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/iam.resourcelevelpermissions.html">Resource-level
  /// permissions</a>.
  ///
  /// For example, you can use cost-allocation tags to your MemoryDB resources,
  /// Amazon generates a cost allocation report as a comma-separated value (CSV)
  /// file with your usage and costs aggregated by your tags. You can apply tags
  /// that represent business categories (such as cost centers, application
  /// names, or owners) to organize your costs across multiple services. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/tagging.html">Using
  /// Cost Allocation Tags</a>.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [SnapshotNotFoundFault].
  /// May throw [UserNotFoundFault].
  /// May throw [ACLNotFoundFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidARNFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which the tags are to be
  /// added
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<TagResourceResponse> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Use this operation to remove tags on a resource
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [SnapshotNotFoundFault].
  /// May throw [InvalidARNFault].
  /// May throw [TagNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [UserNotFoundFault].
  /// May throw [ACLNotFoundFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which the tags are to be
  /// removed
  ///
  /// Parameter [tagKeys] :
  /// The list of keys of the tags that are to be removed
  Future<UntagResourceResponse> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Changes the list of users that belong to the Access Control List.
  ///
  /// May throw [ACLNotFoundFault].
  /// May throw [UserNotFoundFault].
  /// May throw [DuplicateUserNameFault].
  /// May throw [DefaultUserRequired].
  /// May throw [InvalidACLStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [aCLName] :
  /// The name of the Access Control List
  ///
  /// Parameter [userNamesToAdd] :
  /// The list of users to add to the Access Control List
  ///
  /// Parameter [userNamesToRemove] :
  /// The list of users to remove from the Access Control List
  Future<UpdateACLResponse> updateACL({
    required String aCLName,
    List<String>? userNamesToAdd,
    List<String>? userNamesToRemove,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.UpdateACL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ACLName': aCLName,
        if (userNamesToAdd != null) 'UserNamesToAdd': userNamesToAdd,
        if (userNamesToRemove != null) 'UserNamesToRemove': userNamesToRemove,
      },
    );

    return UpdateACLResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the settings for a cluster. You can use this operation to change
  /// one or more cluster configuration settings by specifying the settings and
  /// the new values.
  ///
  /// May throw [ClusterNotFoundFault].
  /// May throw [InvalidClusterStateFault].
  /// May throw [InvalidNodeStateFault].
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidKMSKeyFault].
  /// May throw [NodeQuotaForClusterExceededFault].
  /// May throw [ClusterQuotaForCustomerExceededFault].
  /// May throw [ShardsPerClusterQuotaExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [NoOperationFault].
  /// May throw [InvalidACLStateFault].
  /// May throw [ACLNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to update
  ///
  /// Parameter [aCLName] :
  /// The Access Control List that is associated with the cluster
  ///
  /// Parameter [description] :
  /// The description of the cluster to update
  ///
  /// Parameter [engineVersion] :
  /// The upgraded version of the engine to be run on the nodes. You can upgrade
  /// to a newer engine version, but you cannot downgrade to an earlier engine
  /// version. If you want to use an earlier engine version, you must delete the
  /// existing cluster and create it anew with the earlier engine version.
  ///
  /// Parameter [maintenanceWindow] :
  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format
  /// ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is
  /// a 60 minute period.
  ///
  /// Valid values for <code>ddd</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>sun</code>
  /// </li>
  /// <li>
  /// <code>mon</code>
  /// </li>
  /// <li>
  /// <code>tue</code>
  /// </li>
  /// <li>
  /// <code>wed</code>
  /// </li>
  /// <li>
  /// <code>thu</code>
  /// </li>
  /// <li>
  /// <code>fri</code>
  /// </li>
  /// <li>
  /// <code>sat</code>
  /// </li>
  /// </ul>
  /// Example: <code>sun:23:00-mon:01:30</code>
  ///
  /// Parameter [nodeType] :
  /// A valid node type that you want to scale this cluster up or down to.
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group to update
  ///
  /// Parameter [replicaConfiguration] :
  /// The number of replicas that will reside in each shard
  ///
  /// Parameter [securityGroupIds] :
  /// The SecurityGroupIds to update
  ///
  /// Parameter [shardConfiguration] :
  /// The number of shards in the cluster
  ///
  /// Parameter [snapshotRetentionLimit] :
  /// The number of days for which MemoryDB retains automatic cluster snapshots
  /// before deleting them. For example, if you set SnapshotRetentionLimit to 5,
  /// a snapshot that was taken today is retained for 5 days before being
  /// deleted.
  ///
  /// Parameter [snapshotWindow] :
  /// The daily time range (in UTC) during which MemoryDB begins taking a daily
  /// snapshot of your cluster.
  ///
  /// Parameter [snsTopicArn] :
  /// The SNS topic ARN to update
  ///
  /// Parameter [snsTopicStatus] :
  /// The status of the Amazon SNS notification topic. Notifications are sent
  /// only if the status is active.
  Future<UpdateClusterResponse> updateCluster({
    required String clusterName,
    String? aCLName,
    String? description,
    String? engineVersion,
    String? maintenanceWindow,
    String? nodeType,
    String? parameterGroupName,
    ReplicaConfigurationRequest? replicaConfiguration,
    List<String>? securityGroupIds,
    ShardConfigurationRequest? shardConfiguration,
    int? snapshotRetentionLimit,
    String? snapshotWindow,
    String? snsTopicArn,
    String? snsTopicStatus,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.UpdateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterName': clusterName,
        if (aCLName != null) 'ACLName': aCLName,
        if (description != null) 'Description': description,
        if (engineVersion != null) 'EngineVersion': engineVersion,
        if (maintenanceWindow != null) 'MaintenanceWindow': maintenanceWindow,
        if (nodeType != null) 'NodeType': nodeType,
        if (parameterGroupName != null)
          'ParameterGroupName': parameterGroupName,
        if (replicaConfiguration != null)
          'ReplicaConfiguration': replicaConfiguration,
        if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
        if (shardConfiguration != null)
          'ShardConfiguration': shardConfiguration,
        if (snapshotRetentionLimit != null)
          'SnapshotRetentionLimit': snapshotRetentionLimit,
        if (snapshotWindow != null) 'SnapshotWindow': snapshotWindow,
        if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
        if (snsTopicStatus != null) 'SnsTopicStatus': snsTopicStatus,
      },
    );

    return UpdateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Updates the parameters of a parameter group. You can modify up to 20
  /// parameters in a single request by submitting a list parameter name and
  /// value pairs.
  ///
  /// May throw [ParameterGroupNotFoundFault].
  /// May throw [InvalidParameterGroupStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [parameterGroupName] :
  /// The name of the parameter group to update.
  ///
  /// Parameter [parameterNameValues] :
  /// An array of parameter names and values for the parameter update. You must
  /// supply at least one parameter name and value; subsequent arguments are
  /// optional. A maximum of 20 parameters may be updated per request.
  Future<UpdateParameterGroupResponse> updateParameterGroup({
    required String parameterGroupName,
    required List<ParameterNameValue> parameterNameValues,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.UpdateParameterGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterGroupName': parameterGroupName,
        'ParameterNameValues': parameterNameValues,
      },
    );

    return UpdateParameterGroupResponse.fromJson(jsonResponse.body);
  }

  /// Updates a subnet group. For more information, see <a
  /// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/ubnetGroups.Modifying.html">Updating
  /// a subnet group</a>
  ///
  /// May throw [SubnetGroupNotFoundFault].
  /// May throw [SubnetQuotaExceededFault].
  /// May throw [SubnetInUse].
  /// May throw [InvalidSubnet].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [SubnetNotAllowedFault].
  ///
  /// Parameter [subnetGroupName] :
  /// The name of the subnet group
  ///
  /// Parameter [description] :
  /// A description of the subnet group
  ///
  /// Parameter [subnetIds] :
  /// The EC2 subnet IDs for the subnet group.
  Future<UpdateSubnetGroupResponse> updateSubnetGroup({
    required String subnetGroupName,
    String? description,
    List<String>? subnetIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.UpdateSubnetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubnetGroupName': subnetGroupName,
        if (description != null) 'Description': description,
        if (subnetIds != null) 'SubnetIds': subnetIds,
      },
    );

    return UpdateSubnetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Changes user password(s) and/or access string.
  ///
  /// May throw [UserNotFoundFault].
  /// May throw [InvalidUserStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [userName] :
  /// The name of the user
  ///
  /// Parameter [accessString] :
  /// Access permissions string used for this user.
  ///
  /// Parameter [authenticationMode] :
  /// Denotes the user's authentication properties, such as whether it requires
  /// a password to authenticate.
  Future<UpdateUserResponse> updateUser({
    required String userName,
    String? accessString,
    AuthenticationMode? authenticationMode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonMemoryDB.UpdateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserName': userName,
        if (accessString != null) 'AccessString': accessString,
        if (authenticationMode != null)
          'AuthenticationMode': authenticationMode,
      },
    );

    return UpdateUserResponse.fromJson(jsonResponse.body);
  }
}

/// An Access Control List. You can authenticate users with Access Contol Lists.
/// ACLs enable you to control cluster access by grouping users. These Access
/// control lists are designed as a way to organize access to clusters.
class ACL {
  /// The Amazon Resource Name (ARN) of the ACL
  final String? arn;

  /// A list of clusters associated with the ACL.
  final List<String>? clusters;

  /// The minimum engine version supported for the ACL
  final String? minimumEngineVersion;

  /// The name of the Access Control List
  final String? name;

  /// A list of updates being applied to the ACL.
  final ACLPendingChanges? pendingChanges;

  /// Indicates ACL status. Can be "creating", "active", "modifying", "deleting".
  final String? status;

  /// The list of user names that belong to the ACL.
  final List<String>? userNames;

  ACL({
    this.arn,
    this.clusters,
    this.minimumEngineVersion,
    this.name,
    this.pendingChanges,
    this.status,
    this.userNames,
  });

  factory ACL.fromJson(Map<String, dynamic> json) {
    return ACL(
      arn: json['ARN'] as String?,
      clusters: (json['Clusters'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      minimumEngineVersion: json['MinimumEngineVersion'] as String?,
      name: json['Name'] as String?,
      pendingChanges: json['PendingChanges'] != null
          ? ACLPendingChanges.fromJson(
              json['PendingChanges'] as Map<String, dynamic>)
          : null,
      status: json['Status'] as String?,
      userNames: (json['UserNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusters = this.clusters;
    final minimumEngineVersion = this.minimumEngineVersion;
    final name = this.name;
    final pendingChanges = this.pendingChanges;
    final status = this.status;
    final userNames = this.userNames;
    return {
      if (arn != null) 'ARN': arn,
      if (clusters != null) 'Clusters': clusters,
      if (minimumEngineVersion != null)
        'MinimumEngineVersion': minimumEngineVersion,
      if (name != null) 'Name': name,
      if (pendingChanges != null) 'PendingChanges': pendingChanges,
      if (status != null) 'Status': status,
      if (userNames != null) 'UserNames': userNames,
    };
  }
}

/// Returns the updates being applied to the ACL.
class ACLPendingChanges {
  /// A list of users being added to the ACL
  final List<String>? userNamesToAdd;

  /// A list of user names being removed from the ACL
  final List<String>? userNamesToRemove;

  ACLPendingChanges({
    this.userNamesToAdd,
    this.userNamesToRemove,
  });

  factory ACLPendingChanges.fromJson(Map<String, dynamic> json) {
    return ACLPendingChanges(
      userNamesToAdd: (json['UserNamesToAdd'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      userNamesToRemove: (json['UserNamesToRemove'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userNamesToAdd = this.userNamesToAdd;
    final userNamesToRemove = this.userNamesToRemove;
    return {
      if (userNamesToAdd != null) 'UserNamesToAdd': userNamesToAdd,
      if (userNamesToRemove != null) 'UserNamesToRemove': userNamesToRemove,
    };
  }
}

/// The status of the ACL update
class ACLsUpdateStatus {
  /// A list of ACLs pending to be applied.
  final String? aCLToApply;

  ACLsUpdateStatus({
    this.aCLToApply,
  });

  factory ACLsUpdateStatus.fromJson(Map<String, dynamic> json) {
    return ACLsUpdateStatus(
      aCLToApply: json['ACLToApply'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aCLToApply = this.aCLToApply;
    return {
      if (aCLToApply != null) 'ACLToApply': aCLToApply,
    };
  }
}

enum AZStatus {
  singleaz,
  multiaz,
}

extension AZStatusValueExtension on AZStatus {
  String toValue() {
    switch (this) {
      case AZStatus.singleaz:
        return 'singleaz';
      case AZStatus.multiaz:
        return 'multiaz';
    }
  }
}

extension AZStatusFromString on String {
  AZStatus toAZStatus() {
    switch (this) {
      case 'singleaz':
        return AZStatus.singleaz;
      case 'multiaz':
        return AZStatus.multiaz;
    }
    throw Exception('$this is not known in enum AZStatus');
  }
}

/// Denotes the user's authentication properties, such as whether it requires a
/// password to authenticate. Used in output responses.
class Authentication {
  /// The number of passwords belonging to the user. The maximum is two.
  final int? passwordCount;

  /// Indicates whether the user requires a password to authenticate.
  final AuthenticationType? type;

  Authentication({
    this.passwordCount,
    this.type,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) {
    return Authentication(
      passwordCount: json['PasswordCount'] as int?,
      type: (json['Type'] as String?)?.toAuthenticationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final passwordCount = this.passwordCount;
    final type = this.type;
    return {
      if (passwordCount != null) 'PasswordCount': passwordCount,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Denotes the user's authentication properties, such as whether it requires a
/// password to authenticate. Used in output responses.
class AuthenticationMode {
  /// The password(s) used for authentication
  final List<String>? passwords;

  /// Indicates whether the user requires a password to authenticate. All
  /// newly-created users require a password.
  final InputAuthenticationType? type;

  AuthenticationMode({
    this.passwords,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final passwords = this.passwords;
    final type = this.type;
    return {
      if (passwords != null) 'Passwords': passwords,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum AuthenticationType {
  password,
  noPassword,
  iam,
}

extension AuthenticationTypeValueExtension on AuthenticationType {
  String toValue() {
    switch (this) {
      case AuthenticationType.password:
        return 'password';
      case AuthenticationType.noPassword:
        return 'no-password';
      case AuthenticationType.iam:
        return 'iam';
    }
  }
}

extension AuthenticationTypeFromString on String {
  AuthenticationType toAuthenticationType() {
    switch (this) {
      case 'password':
        return AuthenticationType.password;
      case 'no-password':
        return AuthenticationType.noPassword;
      case 'iam':
        return AuthenticationType.iam;
    }
    throw Exception('$this is not known in enum AuthenticationType');
  }
}

/// Indicates if the cluster has a Multi-AZ configuration (multiaz) or not
/// (singleaz).
class AvailabilityZone {
  /// The name of the Availability Zone.
  final String? name;

  AvailabilityZone({
    this.name,
  });

  factory AvailabilityZone.fromJson(Map<String, dynamic> json) {
    return AvailabilityZone(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

class BatchUpdateClusterResponse {
  /// The list of clusters that have been updated.
  final List<Cluster>? processedClusters;

  /// The list of clusters where updates have not been applied.
  final List<UnprocessedCluster>? unprocessedClusters;

  BatchUpdateClusterResponse({
    this.processedClusters,
    this.unprocessedClusters,
  });

  factory BatchUpdateClusterResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateClusterResponse(
      processedClusters: (json['ProcessedClusters'] as List?)
          ?.whereNotNull()
          .map((e) => Cluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedClusters: (json['UnprocessedClusters'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final processedClusters = this.processedClusters;
    final unprocessedClusters = this.unprocessedClusters;
    return {
      if (processedClusters != null) 'ProcessedClusters': processedClusters,
      if (unprocessedClusters != null)
        'UnprocessedClusters': unprocessedClusters,
    };
  }
}

/// Contains all of the attributes of a specific cluster.
class Cluster {
  /// The name of the Access Control List associated with this cluster.
  final String? aCLName;

  /// The Amazon Resource Name (ARN) of the cluster.
  final String? arn;

  /// When set to true, the cluster will automatically receive minor engine
  /// version upgrades after launch.
  final bool? autoMinorVersionUpgrade;

  /// Indicates if the cluster has a Multi-AZ configuration (multiaz) or not
  /// (singleaz).
  final AZStatus? availabilityMode;

  /// The cluster's configuration endpoint
  final Endpoint? clusterEndpoint;

  /// Enables data tiering. Data tiering is only supported for clusters using the
  /// r6gd node type. This parameter must be set when using r6gd nodes. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/memorydb/latest/devguide/data-tiering.html">Data
  /// tiering</a>.
  final DataTieringStatus? dataTiering;

  /// A description of the cluster
  final String? description;

  /// The Redis engine patch version used by the cluster
  final String? enginePatchVersion;

  /// The Redis engine version used by the cluster
  final String? engineVersion;

  /// The ID of the KMS key used to encrypt the cluster
  final String? kmsKeyId;

  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi
  /// (24H Clock UTC). The minimum maintenance window is a 60 minute period.
  final String? maintenanceWindow;

  /// The user-supplied name of the cluster. This identifier is a unique key that
  /// identifies a cluster.
  final String? name;

  /// The cluster's node type
  final String? nodeType;

  /// The number of shards in the cluster
  final int? numberOfShards;

  /// The name of the parameter group used by the cluster
  final String? parameterGroupName;

  /// The status of the parameter group used by the cluster, for example 'active'
  /// or 'applying'.
  final String? parameterGroupStatus;

  /// A group of settings that are currently being applied.
  final ClusterPendingUpdates? pendingUpdates;

  /// A list of security groups used by the cluster
  final List<SecurityGroupMembership>? securityGroups;

  /// A list of shards that are members of the cluster.
  final List<Shard>? shards;

  /// The number of days for which MemoryDB retains automatic snapshots before
  /// deleting them. For example, if you set SnapshotRetentionLimit to 5, a
  /// snapshot that was taken today is retained for 5 days before being deleted.
  final int? snapshotRetentionLimit;

  /// The daily time range (in UTC) during which MemoryDB begins taking a daily
  /// snapshot of your shard. Example: 05:00-09:00 If you do not specify this
  /// parameter, MemoryDB automatically chooses an appropriate time range.
  final String? snapshotWindow;

  /// The Amazon Resource Name (ARN) of the SNS notification topic
  final String? snsTopicArn;

  /// The SNS topic must be in Active status to receive notifications
  final String? snsTopicStatus;

  /// The status of the cluster. For example, Available, Updating, Creating.
  final String? status;

  /// The name of the subnet group used by the cluster
  final String? subnetGroupName;

  /// A flag to indicate if In-transit encryption is enabled
  final bool? tLSEnabled;

  Cluster({
    this.aCLName,
    this.arn,
    this.autoMinorVersionUpgrade,
    this.availabilityMode,
    this.clusterEndpoint,
    this.dataTiering,
    this.description,
    this.enginePatchVersion,
    this.engineVersion,
    this.kmsKeyId,
    this.maintenanceWindow,
    this.name,
    this.nodeType,
    this.numberOfShards,
    this.parameterGroupName,
    this.parameterGroupStatus,
    this.pendingUpdates,
    this.securityGroups,
    this.shards,
    this.snapshotRetentionLimit,
    this.snapshotWindow,
    this.snsTopicArn,
    this.snsTopicStatus,
    this.status,
    this.subnetGroupName,
    this.tLSEnabled,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      aCLName: json['ACLName'] as String?,
      arn: json['ARN'] as String?,
      autoMinorVersionUpgrade: json['AutoMinorVersionUpgrade'] as bool?,
      availabilityMode: (json['AvailabilityMode'] as String?)?.toAZStatus(),
      clusterEndpoint: json['ClusterEndpoint'] != null
          ? Endpoint.fromJson(json['ClusterEndpoint'] as Map<String, dynamic>)
          : null,
      dataTiering: (json['DataTiering'] as String?)?.toDataTieringStatus(),
      description: json['Description'] as String?,
      enginePatchVersion: json['EnginePatchVersion'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      maintenanceWindow: json['MaintenanceWindow'] as String?,
      name: json['Name'] as String?,
      nodeType: json['NodeType'] as String?,
      numberOfShards: json['NumberOfShards'] as int?,
      parameterGroupName: json['ParameterGroupName'] as String?,
      parameterGroupStatus: json['ParameterGroupStatus'] as String?,
      pendingUpdates: json['PendingUpdates'] != null
          ? ClusterPendingUpdates.fromJson(
              json['PendingUpdates'] as Map<String, dynamic>)
          : null,
      securityGroups: (json['SecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SecurityGroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      shards: (json['Shards'] as List?)
          ?.whereNotNull()
          .map((e) => Shard.fromJson(e as Map<String, dynamic>))
          .toList(),
      snapshotRetentionLimit: json['SnapshotRetentionLimit'] as int?,
      snapshotWindow: json['SnapshotWindow'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
      snsTopicStatus: json['SnsTopicStatus'] as String?,
      status: json['Status'] as String?,
      subnetGroupName: json['SubnetGroupName'] as String?,
      tLSEnabled: json['TLSEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final aCLName = this.aCLName;
    final arn = this.arn;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final availabilityMode = this.availabilityMode;
    final clusterEndpoint = this.clusterEndpoint;
    final dataTiering = this.dataTiering;
    final description = this.description;
    final enginePatchVersion = this.enginePatchVersion;
    final engineVersion = this.engineVersion;
    final kmsKeyId = this.kmsKeyId;
    final maintenanceWindow = this.maintenanceWindow;
    final name = this.name;
    final nodeType = this.nodeType;
    final numberOfShards = this.numberOfShards;
    final parameterGroupName = this.parameterGroupName;
    final parameterGroupStatus = this.parameterGroupStatus;
    final pendingUpdates = this.pendingUpdates;
    final securityGroups = this.securityGroups;
    final shards = this.shards;
    final snapshotRetentionLimit = this.snapshotRetentionLimit;
    final snapshotWindow = this.snapshotWindow;
    final snsTopicArn = this.snsTopicArn;
    final snsTopicStatus = this.snsTopicStatus;
    final status = this.status;
    final subnetGroupName = this.subnetGroupName;
    final tLSEnabled = this.tLSEnabled;
    return {
      if (aCLName != null) 'ACLName': aCLName,
      if (arn != null) 'ARN': arn,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (availabilityMode != null)
        'AvailabilityMode': availabilityMode.toValue(),
      if (clusterEndpoint != null) 'ClusterEndpoint': clusterEndpoint,
      if (dataTiering != null) 'DataTiering': dataTiering.toValue(),
      if (description != null) 'Description': description,
      if (enginePatchVersion != null) 'EnginePatchVersion': enginePatchVersion,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (maintenanceWindow != null) 'MaintenanceWindow': maintenanceWindow,
      if (name != null) 'Name': name,
      if (nodeType != null) 'NodeType': nodeType,
      if (numberOfShards != null) 'NumberOfShards': numberOfShards,
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
      if (parameterGroupStatus != null)
        'ParameterGroupStatus': parameterGroupStatus,
      if (pendingUpdates != null) 'PendingUpdates': pendingUpdates,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (shards != null) 'Shards': shards,
      if (snapshotRetentionLimit != null)
        'SnapshotRetentionLimit': snapshotRetentionLimit,
      if (snapshotWindow != null) 'SnapshotWindow': snapshotWindow,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (snsTopicStatus != null) 'SnsTopicStatus': snsTopicStatus,
      if (status != null) 'Status': status,
      if (subnetGroupName != null) 'SubnetGroupName': subnetGroupName,
      if (tLSEnabled != null) 'TLSEnabled': tLSEnabled,
    };
  }
}

/// A list of cluster configuration options.
class ClusterConfiguration {
  /// The description of the cluster configuration
  final String? description;

  /// The Redis engine version used by the cluster
  final String? engineVersion;

  /// The specified maintenance window for the cluster
  final String? maintenanceWindow;

  /// The name of the cluster
  final String? name;

  /// The node type used for the cluster
  final String? nodeType;

  /// The number of shards in the cluster
  final int? numShards;

  /// The name of parameter group used by the cluster
  final String? parameterGroupName;

  /// The port used by the cluster
  final int? port;

  /// The list of shards in the cluster
  final List<ShardDetail>? shards;

  /// The snapshot retention limit set by the cluster
  final int? snapshotRetentionLimit;

  /// The snapshot window set by the cluster
  final String? snapshotWindow;

  /// The name of the subnet group used by the cluster
  final String? subnetGroupName;

  /// The Amazon Resource Name (ARN) of the SNS notification topic for the cluster
  final String? topicArn;

  /// The ID of the VPC the cluster belongs to
  final String? vpcId;

  ClusterConfiguration({
    this.description,
    this.engineVersion,
    this.maintenanceWindow,
    this.name,
    this.nodeType,
    this.numShards,
    this.parameterGroupName,
    this.port,
    this.shards,
    this.snapshotRetentionLimit,
    this.snapshotWindow,
    this.subnetGroupName,
    this.topicArn,
    this.vpcId,
  });

  factory ClusterConfiguration.fromJson(Map<String, dynamic> json) {
    return ClusterConfiguration(
      description: json['Description'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      maintenanceWindow: json['MaintenanceWindow'] as String?,
      name: json['Name'] as String?,
      nodeType: json['NodeType'] as String?,
      numShards: json['NumShards'] as int?,
      parameterGroupName: json['ParameterGroupName'] as String?,
      port: json['Port'] as int?,
      shards: (json['Shards'] as List?)
          ?.whereNotNull()
          .map((e) => ShardDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      snapshotRetentionLimit: json['SnapshotRetentionLimit'] as int?,
      snapshotWindow: json['SnapshotWindow'] as String?,
      subnetGroupName: json['SubnetGroupName'] as String?,
      topicArn: json['TopicArn'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final engineVersion = this.engineVersion;
    final maintenanceWindow = this.maintenanceWindow;
    final name = this.name;
    final nodeType = this.nodeType;
    final numShards = this.numShards;
    final parameterGroupName = this.parameterGroupName;
    final port = this.port;
    final shards = this.shards;
    final snapshotRetentionLimit = this.snapshotRetentionLimit;
    final snapshotWindow = this.snapshotWindow;
    final subnetGroupName = this.subnetGroupName;
    final topicArn = this.topicArn;
    final vpcId = this.vpcId;
    return {
      if (description != null) 'Description': description,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (maintenanceWindow != null) 'MaintenanceWindow': maintenanceWindow,
      if (name != null) 'Name': name,
      if (nodeType != null) 'NodeType': nodeType,
      if (numShards != null) 'NumShards': numShards,
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
      if (port != null) 'Port': port,
      if (shards != null) 'Shards': shards,
      if (snapshotRetentionLimit != null)
        'SnapshotRetentionLimit': snapshotRetentionLimit,
      if (snapshotWindow != null) 'SnapshotWindow': snapshotWindow,
      if (subnetGroupName != null) 'SubnetGroupName': subnetGroupName,
      if (topicArn != null) 'TopicArn': topicArn,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// A list of updates being applied to the cluster
class ClusterPendingUpdates {
  /// A list of ACLs associated with the cluster that are being updated
  final ACLsUpdateStatus? aCLs;

  /// The status of an online resharding operation.
  final ReshardingStatus? resharding;

  /// A list of service updates being applied to the cluster
  final List<PendingModifiedServiceUpdate>? serviceUpdates;

  ClusterPendingUpdates({
    this.aCLs,
    this.resharding,
    this.serviceUpdates,
  });

  factory ClusterPendingUpdates.fromJson(Map<String, dynamic> json) {
    return ClusterPendingUpdates(
      aCLs: json['ACLs'] != null
          ? ACLsUpdateStatus.fromJson(json['ACLs'] as Map<String, dynamic>)
          : null,
      resharding: json['Resharding'] != null
          ? ReshardingStatus.fromJson(
              json['Resharding'] as Map<String, dynamic>)
          : null,
      serviceUpdates: (json['ServiceUpdates'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PendingModifiedServiceUpdate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aCLs = this.aCLs;
    final resharding = this.resharding;
    final serviceUpdates = this.serviceUpdates;
    return {
      if (aCLs != null) 'ACLs': aCLs,
      if (resharding != null) 'Resharding': resharding,
      if (serviceUpdates != null) 'ServiceUpdates': serviceUpdates,
    };
  }
}

class CopySnapshotResponse {
  /// Represents a copy of an entire cluster as of the time when the snapshot was
  /// taken.
  final Snapshot? snapshot;

  CopySnapshotResponse({
    this.snapshot,
  });

  factory CopySnapshotResponse.fromJson(Map<String, dynamic> json) {
    return CopySnapshotResponse(
      snapshot: json['Snapshot'] != null
          ? Snapshot.fromJson(json['Snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class CreateACLResponse {
  /// The newly-created Access Control List.
  final ACL? acl;

  CreateACLResponse({
    this.acl,
  });

  factory CreateACLResponse.fromJson(Map<String, dynamic> json) {
    return CreateACLResponse(
      acl: json['ACL'] != null
          ? ACL.fromJson(json['ACL'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acl = this.acl;
    return {
      if (acl != null) 'ACL': acl,
    };
  }
}

class CreateClusterResponse {
  /// The newly-created cluster.
  final Cluster? cluster;

  CreateClusterResponse({
    this.cluster,
  });

  factory CreateClusterResponse.fromJson(Map<String, dynamic> json) {
    return CreateClusterResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class CreateParameterGroupResponse {
  /// The newly-created parameter group.
  final ParameterGroup? parameterGroup;

  CreateParameterGroupResponse({
    this.parameterGroup,
  });

  factory CreateParameterGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateParameterGroupResponse(
      parameterGroup: json['ParameterGroup'] != null
          ? ParameterGroup.fromJson(
              json['ParameterGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterGroup = this.parameterGroup;
    return {
      if (parameterGroup != null) 'ParameterGroup': parameterGroup,
    };
  }
}

class CreateSnapshotResponse {
  /// The newly-created snapshot.
  final Snapshot? snapshot;

  CreateSnapshotResponse({
    this.snapshot,
  });

  factory CreateSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return CreateSnapshotResponse(
      snapshot: json['Snapshot'] != null
          ? Snapshot.fromJson(json['Snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class CreateSubnetGroupResponse {
  /// The newly-created subnet group
  final SubnetGroup? subnetGroup;

  CreateSubnetGroupResponse({
    this.subnetGroup,
  });

  factory CreateSubnetGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateSubnetGroupResponse(
      subnetGroup: json['SubnetGroup'] != null
          ? SubnetGroup.fromJson(json['SubnetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetGroup = this.subnetGroup;
    return {
      if (subnetGroup != null) 'SubnetGroup': subnetGroup,
    };
  }
}

class CreateUserResponse {
  /// The newly-created user.
  final User? user;

  CreateUserResponse({
    this.user,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

enum DataTieringStatus {
  $true,
  $false,
}

extension DataTieringStatusValueExtension on DataTieringStatus {
  String toValue() {
    switch (this) {
      case DataTieringStatus.$true:
        return 'true';
      case DataTieringStatus.$false:
        return 'false';
    }
  }
}

extension DataTieringStatusFromString on String {
  DataTieringStatus toDataTieringStatus() {
    switch (this) {
      case 'true':
        return DataTieringStatus.$true;
      case 'false':
        return DataTieringStatus.$false;
    }
    throw Exception('$this is not known in enum DataTieringStatus');
  }
}

class DeleteACLResponse {
  /// The Access Control List object that has been deleted.
  final ACL? acl;

  DeleteACLResponse({
    this.acl,
  });

  factory DeleteACLResponse.fromJson(Map<String, dynamic> json) {
    return DeleteACLResponse(
      acl: json['ACL'] != null
          ? ACL.fromJson(json['ACL'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acl = this.acl;
    return {
      if (acl != null) 'ACL': acl,
    };
  }
}

class DeleteClusterResponse {
  /// The cluster object that has been deleted
  final Cluster? cluster;

  DeleteClusterResponse({
    this.cluster,
  });

  factory DeleteClusterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteClusterResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class DeleteParameterGroupResponse {
  /// The parameter group that has been deleted.
  final ParameterGroup? parameterGroup;

  DeleteParameterGroupResponse({
    this.parameterGroup,
  });

  factory DeleteParameterGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteParameterGroupResponse(
      parameterGroup: json['ParameterGroup'] != null
          ? ParameterGroup.fromJson(
              json['ParameterGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterGroup = this.parameterGroup;
    return {
      if (parameterGroup != null) 'ParameterGroup': parameterGroup,
    };
  }
}

class DeleteSnapshotResponse {
  /// The snapshot object that has been deleted.
  final Snapshot? snapshot;

  DeleteSnapshotResponse({
    this.snapshot,
  });

  factory DeleteSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSnapshotResponse(
      snapshot: json['Snapshot'] != null
          ? Snapshot.fromJson(json['Snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class DeleteSubnetGroupResponse {
  /// The subnet group object that has been deleted.
  final SubnetGroup? subnetGroup;

  DeleteSubnetGroupResponse({
    this.subnetGroup,
  });

  factory DeleteSubnetGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSubnetGroupResponse(
      subnetGroup: json['SubnetGroup'] != null
          ? SubnetGroup.fromJson(json['SubnetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetGroup = this.subnetGroup;
    return {
      if (subnetGroup != null) 'SubnetGroup': subnetGroup,
    };
  }
}

class DeleteUserResponse {
  /// The user object that has been deleted.
  final User? user;

  DeleteUserResponse({
    this.user,
  });

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) {
    return DeleteUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

class DescribeACLsResponse {
  /// The list of ACLs
  final List<ACL>? aCLs;

  /// If nextToken is returned, there are more results available. The value of
  /// nextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page. Keep all other arguments
  /// unchanged.
  final String? nextToken;

  DescribeACLsResponse({
    this.aCLs,
    this.nextToken,
  });

  factory DescribeACLsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeACLsResponse(
      aCLs: (json['ACLs'] as List?)
          ?.whereNotNull()
          .map((e) => ACL.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aCLs = this.aCLs;
    final nextToken = this.nextToken;
    return {
      if (aCLs != null) 'ACLs': aCLs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeClustersResponse {
  /// A list of clusters
  final List<Cluster>? clusters;

  /// An optional argument to pass in case the total number of records exceeds the
  /// value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextToken;

  DescribeClustersResponse({
    this.clusters,
    this.nextToken,
  });

  factory DescribeClustersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClustersResponse(
      clusters: (json['Clusters'] as List?)
          ?.whereNotNull()
          .map((e) => Cluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final nextToken = this.nextToken;
    return {
      if (clusters != null) 'Clusters': clusters,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeEngineVersionsResponse {
  /// A list of engine version details. Each element in the list contains detailed
  /// information about one engine version.
  final List<EngineVersionInfo>? engineVersions;

  /// An optional argument to pass in case the total number of records exceeds the
  /// value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextToken;

  DescribeEngineVersionsResponse({
    this.engineVersions,
    this.nextToken,
  });

  factory DescribeEngineVersionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEngineVersionsResponse(
      engineVersions: (json['EngineVersions'] as List?)
          ?.whereNotNull()
          .map((e) => EngineVersionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engineVersions = this.engineVersions;
    final nextToken = this.nextToken;
    return {
      if (engineVersions != null) 'EngineVersions': engineVersions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeEventsResponse {
  /// A list of events. Each element in the list contains detailed information
  /// about one event.
  final List<Event>? events;

  /// An optional argument to pass in case the total number of records exceeds the
  /// value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextToken;

  DescribeEventsResponse({
    this.events,
    this.nextToken,
  });

  factory DescribeEventsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventsResponse(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'Events': events,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeParameterGroupsResponse {
  /// An optional argument to pass in case the total number of records exceeds the
  /// value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextToken;

  /// A list of parameter groups. Each element in the list contains detailed
  /// information about one parameter group.
  final List<ParameterGroup>? parameterGroups;

  DescribeParameterGroupsResponse({
    this.nextToken,
    this.parameterGroups,
  });

  factory DescribeParameterGroupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeParameterGroupsResponse(
      nextToken: json['NextToken'] as String?,
      parameterGroups: (json['ParameterGroups'] as List?)
          ?.whereNotNull()
          .map((e) => ParameterGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final parameterGroups = this.parameterGroups;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (parameterGroups != null) 'ParameterGroups': parameterGroups,
    };
  }
}

class DescribeParametersResponse {
  /// An optional argument to pass in case the total number of records exceeds the
  /// value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextToken;

  /// A list of parameters specific to a particular parameter group. Each element
  /// in the list contains detailed information about one parameter.
  final List<Parameter>? parameters;

  DescribeParametersResponse({
    this.nextToken,
    this.parameters,
  });

  factory DescribeParametersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeParametersResponse(
      nextToken: json['NextToken'] as String?,
      parameters: (json['Parameters'] as List?)
          ?.whereNotNull()
          .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final parameters = this.parameters;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

class DescribeReservedNodesOfferingsResponse {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords.
  final String? nextToken;

  /// Lists available reserved node offerings.
  final List<ReservedNodesOffering>? reservedNodesOfferings;

  DescribeReservedNodesOfferingsResponse({
    this.nextToken,
    this.reservedNodesOfferings,
  });

  factory DescribeReservedNodesOfferingsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReservedNodesOfferingsResponse(
      nextToken: json['NextToken'] as String?,
      reservedNodesOfferings: (json['ReservedNodesOfferings'] as List?)
          ?.whereNotNull()
          .map((e) => ReservedNodesOffering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reservedNodesOfferings = this.reservedNodesOfferings;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reservedNodesOfferings != null)
        'ReservedNodesOfferings': reservedNodesOfferings,
    };
  }
}

class DescribeReservedNodesResponse {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords.
  final String? nextToken;

  /// Returns information about reserved nodes for this account, or about a
  /// specified reserved node.
  final List<ReservedNode>? reservedNodes;

  DescribeReservedNodesResponse({
    this.nextToken,
    this.reservedNodes,
  });

  factory DescribeReservedNodesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeReservedNodesResponse(
      nextToken: json['NextToken'] as String?,
      reservedNodes: (json['ReservedNodes'] as List?)
          ?.whereNotNull()
          .map((e) => ReservedNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reservedNodes = this.reservedNodes;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reservedNodes != null) 'ReservedNodes': reservedNodes,
    };
  }
}

class DescribeServiceUpdatesResponse {
  /// An optional argument to pass in case the total number of records exceeds the
  /// value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextToken;

  /// A list of service updates
  final List<ServiceUpdate>? serviceUpdates;

  DescribeServiceUpdatesResponse({
    this.nextToken,
    this.serviceUpdates,
  });

  factory DescribeServiceUpdatesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeServiceUpdatesResponse(
      nextToken: json['NextToken'] as String?,
      serviceUpdates: (json['ServiceUpdates'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceUpdate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serviceUpdates = this.serviceUpdates;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (serviceUpdates != null) 'ServiceUpdates': serviceUpdates,
    };
  }
}

class DescribeSnapshotsResponse {
  /// An optional argument to pass in case the total number of records exceeds the
  /// value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextToken;

  /// A list of snapshots. Each item in the list contains detailed information
  /// about one snapshot.
  final List<Snapshot>? snapshots;

  DescribeSnapshotsResponse({
    this.nextToken,
    this.snapshots,
  });

  factory DescribeSnapshotsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSnapshotsResponse(
      nextToken: json['NextToken'] as String?,
      snapshots: (json['Snapshots'] as List?)
          ?.whereNotNull()
          .map((e) => Snapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final snapshots = this.snapshots;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (snapshots != null) 'Snapshots': snapshots,
    };
  }
}

class DescribeSubnetGroupsResponse {
  /// An optional argument to pass in case the total number of records exceeds the
  /// value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextToken;

  /// A list of subnet groups. Each element in the list contains detailed
  /// information about one group.
  final List<SubnetGroup>? subnetGroups;

  DescribeSubnetGroupsResponse({
    this.nextToken,
    this.subnetGroups,
  });

  factory DescribeSubnetGroupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSubnetGroupsResponse(
      nextToken: json['NextToken'] as String?,
      subnetGroups: (json['SubnetGroups'] as List?)
          ?.whereNotNull()
          .map((e) => SubnetGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subnetGroups = this.subnetGroups;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (subnetGroups != null) 'SubnetGroups': subnetGroups,
    };
  }
}

class DescribeUsersResponse {
  /// An optional argument to pass in case the total number of records exceeds the
  /// value of MaxResults. If nextToken is returned, there are more results
  /// available. The value of nextToken is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextToken;

  /// A list of users.
  final List<User>? users;

  DescribeUsersResponse({
    this.nextToken,
    this.users,
  });

  factory DescribeUsersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUsersResponse(
      nextToken: json['NextToken'] as String?,
      users: (json['Users'] as List?)
          ?.whereNotNull()
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (users != null) 'Users': users,
    };
  }
}

/// Represents the information required for client programs to connect to the
/// cluster and its nodes.
class Endpoint {
  /// The DNS hostname of the node.
  final String? address;

  /// The port number that the engine is listening on.
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

  Map<String, dynamic> toJson() {
    final address = this.address;
    final port = this.port;
    return {
      if (address != null) 'Address': address,
      if (port != null) 'Port': port,
    };
  }
}

/// Provides details of the Redis engine version
class EngineVersionInfo {
  /// The patched engine version
  final String? enginePatchVersion;

  /// The engine version
  final String? engineVersion;

  /// Specifies the name of the parameter group family to which the engine default
  /// parameters apply.
  final String? parameterGroupFamily;

  EngineVersionInfo({
    this.enginePatchVersion,
    this.engineVersion,
    this.parameterGroupFamily,
  });

  factory EngineVersionInfo.fromJson(Map<String, dynamic> json) {
    return EngineVersionInfo(
      enginePatchVersion: json['EnginePatchVersion'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      parameterGroupFamily: json['ParameterGroupFamily'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enginePatchVersion = this.enginePatchVersion;
    final engineVersion = this.engineVersion;
    final parameterGroupFamily = this.parameterGroupFamily;
    return {
      if (enginePatchVersion != null) 'EnginePatchVersion': enginePatchVersion,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (parameterGroupFamily != null)
        'ParameterGroupFamily': parameterGroupFamily,
    };
  }
}

/// Represents a single occurrence of something interesting within the system.
/// Some examples of events are creating a cluster or adding or removing a node.
class Event {
  /// The date and time when the event occurred.
  final DateTime? date;

  /// The text of the event.
  final String? message;

  /// The name for the source of the event. For example, if the event occurred at
  /// the cluster level, the identifier would be the name of the cluster.
  final String? sourceName;

  /// Specifies the origin of this event - a cluster, a parameter group, a
  /// security group, etc.
  final SourceType? sourceType;

  Event({
    this.date,
    this.message,
    this.sourceName,
    this.sourceType,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: timeStampFromJson(json['Date']),
      message: json['Message'] as String?,
      sourceName: json['SourceName'] as String?,
      sourceType: (json['SourceType'] as String?)?.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final message = this.message;
    final sourceName = this.sourceName;
    final sourceType = this.sourceType;
    return {
      if (date != null) 'Date': unixTimestampToJson(date),
      if (message != null) 'Message': message,
      if (sourceName != null) 'SourceName': sourceName,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
    };
  }
}

class FailoverShardResponse {
  /// The cluster being failed over
  final Cluster? cluster;

  FailoverShardResponse({
    this.cluster,
  });

  factory FailoverShardResponse.fromJson(Map<String, dynamic> json) {
    return FailoverShardResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// Used to streamline results of a search based on the property being filtered.
class Filter {
  /// The property being filtered. For example, UserName.
  final String name;

  /// The property values to filter on. For example, "user-123".
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

enum InputAuthenticationType {
  password,
  iam,
}

extension InputAuthenticationTypeValueExtension on InputAuthenticationType {
  String toValue() {
    switch (this) {
      case InputAuthenticationType.password:
        return 'password';
      case InputAuthenticationType.iam:
        return 'iam';
    }
  }
}

extension InputAuthenticationTypeFromString on String {
  InputAuthenticationType toInputAuthenticationType() {
    switch (this) {
      case 'password':
        return InputAuthenticationType.password;
      case 'iam':
        return InputAuthenticationType.iam;
    }
    throw Exception('$this is not known in enum InputAuthenticationType');
  }
}

class ListAllowedNodeTypeUpdatesResponse {
  /// A list node types which you can use to scale down your cluster.
  final List<String>? scaleDownNodeTypes;

  /// A list node types which you can use to scale up your cluster.
  final List<String>? scaleUpNodeTypes;

  ListAllowedNodeTypeUpdatesResponse({
    this.scaleDownNodeTypes,
    this.scaleUpNodeTypes,
  });

  factory ListAllowedNodeTypeUpdatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAllowedNodeTypeUpdatesResponse(
      scaleDownNodeTypes: (json['ScaleDownNodeTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      scaleUpNodeTypes: (json['ScaleUpNodeTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scaleDownNodeTypes = this.scaleDownNodeTypes;
    final scaleUpNodeTypes = this.scaleUpNodeTypes;
    return {
      if (scaleDownNodeTypes != null) 'ScaleDownNodeTypes': scaleDownNodeTypes,
      if (scaleUpNodeTypes != null) 'ScaleUpNodeTypes': scaleUpNodeTypes,
    };
  }
}

class ListTagsResponse {
  /// A list of tags as key-value pairs.
  final List<Tag>? tagList;

  ListTagsResponse({
    this.tagList,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

/// Represents an individual node within a cluster. Each node runs its own
/// instance of the cluster's protocol-compliant caching software.
class Node {
  /// The Availability Zone in which the node resides
  final String? availabilityZone;

  /// The date and time when the node was created.
  final DateTime? createTime;

  /// The hostname for connecting to this node.
  final Endpoint? endpoint;

  /// The node identifier. A node name is a numeric identifier (0001, 0002, etc.).
  /// The combination of cluster name, shard name and node name uniquely
  /// identifies every node used in a customer's Amazon account.
  final String? name;

  /// The status of the service update on the node
  final String? status;

  Node({
    this.availabilityZone,
    this.createTime,
    this.endpoint,
    this.name,
    this.status,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      availabilityZone: json['AvailabilityZone'] as String?,
      createTime: timeStampFromJson(json['CreateTime']),
      endpoint: json['Endpoint'] != null
          ? Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final createTime = this.createTime;
    final endpoint = this.endpoint;
    final name = this.name;
    final status = this.status;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (endpoint != null) 'Endpoint': endpoint,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
    };
  }
}

/// Describes an individual setting that controls some aspect of MemoryDB
/// behavior.
class Parameter {
  /// The valid range of values for the parameter.
  final String? allowedValues;

  /// The parameter's data type
  final String? dataType;

  /// A description of the parameter
  final String? description;

  /// The earliest engine version to which the parameter can apply.
  final String? minimumEngineVersion;

  /// The name of the parameter
  final String? name;

  /// The value of the parameter
  final String? value;

  Parameter({
    this.allowedValues,
    this.dataType,
    this.description,
    this.minimumEngineVersion,
    this.name,
    this.value,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(
      allowedValues: json['AllowedValues'] as String?,
      dataType: json['DataType'] as String?,
      description: json['Description'] as String?,
      minimumEngineVersion: json['MinimumEngineVersion'] as String?,
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final dataType = this.dataType;
    final description = this.description;
    final minimumEngineVersion = this.minimumEngineVersion;
    final name = this.name;
    final value = this.value;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (dataType != null) 'DataType': dataType,
      if (description != null) 'Description': description,
      if (minimumEngineVersion != null)
        'MinimumEngineVersion': minimumEngineVersion,
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// Represents the output of a CreateParameterGroup operation. A parameter group
/// represents a combination of specific values for the parameters that are
/// passed to the engine software during startup.
class ParameterGroup {
  /// The Amazon Resource Name (ARN) of the parameter group
  final String? arn;

  /// A description of the parameter group
  final String? description;

  /// The name of the parameter group family that this parameter group is
  /// compatible with.
  final String? family;

  /// The name of the parameter group
  final String? name;

  ParameterGroup({
    this.arn,
    this.description,
    this.family,
    this.name,
  });

  factory ParameterGroup.fromJson(Map<String, dynamic> json) {
    return ParameterGroup(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      family: json['Family'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final family = this.family;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (description != null) 'Description': description,
      if (family != null) 'Family': family,
      if (name != null) 'Name': name,
    };
  }
}

/// Describes a name-value pair that is used to update the value of a parameter.
class ParameterNameValue {
  /// The name of the parameter
  final String? parameterName;

  /// The value of the parameter
  final String? parameterValue;

  ParameterNameValue({
    this.parameterName,
    this.parameterValue,
  });

  Map<String, dynamic> toJson() {
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    return {
      if (parameterName != null) 'ParameterName': parameterName,
      if (parameterValue != null) 'ParameterValue': parameterValue,
    };
  }
}

/// Update action that has yet to be processed for the corresponding apply/stop
/// request
class PendingModifiedServiceUpdate {
  /// The unique ID of the service update
  final String? serviceUpdateName;

  /// The status of the service update
  final ServiceUpdateStatus? status;

  PendingModifiedServiceUpdate({
    this.serviceUpdateName,
    this.status,
  });

  factory PendingModifiedServiceUpdate.fromJson(Map<String, dynamic> json) {
    return PendingModifiedServiceUpdate(
      serviceUpdateName: json['ServiceUpdateName'] as String?,
      status: (json['Status'] as String?)?.toServiceUpdateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceUpdateName = this.serviceUpdateName;
    final status = this.status;
    return {
      if (serviceUpdateName != null) 'ServiceUpdateName': serviceUpdateName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class PurchaseReservedNodesOfferingResponse {
  /// Represents the output of a <code>PurchaseReservedNodesOffering</code>
  /// operation.
  final ReservedNode? reservedNode;

  PurchaseReservedNodesOfferingResponse({
    this.reservedNode,
  });

  factory PurchaseReservedNodesOfferingResponse.fromJson(
      Map<String, dynamic> json) {
    return PurchaseReservedNodesOfferingResponse(
      reservedNode: json['ReservedNode'] != null
          ? ReservedNode.fromJson(json['ReservedNode'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reservedNode = this.reservedNode;
    return {
      if (reservedNode != null) 'ReservedNode': reservedNode,
    };
  }
}

/// The recurring charge to run this reserved node.
class RecurringCharge {
  /// The amount of the recurring charge to run this reserved node.
  final double? recurringChargeAmount;

  /// The frequency of the recurring price charged to run this reserved node.
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

/// A request to configure the number of replicas in a shard
class ReplicaConfigurationRequest {
  /// The number of replicas to scale up or down to
  final int? replicaCount;

  ReplicaConfigurationRequest({
    this.replicaCount,
  });

  Map<String, dynamic> toJson() {
    final replicaCount = this.replicaCount;
    return {
      if (replicaCount != null) 'ReplicaCount': replicaCount,
    };
  }
}

/// Represents the output of a <code>PurchaseReservedNodesOffering</code>
/// operation.
class ReservedNode {
  /// The Amazon Resource Name (ARN) of the reserved node.
  final String? arn;

  /// The duration of the reservation in seconds.
  final int? duration;

  /// The fixed price charged for this reserved node.
  final double? fixedPrice;

  /// The number of nodes that have been reserved.
  final int? nodeCount;

  /// The node type for the reserved nodes.
  final String? nodeType;

  /// The offering type of this reserved node.
  final String? offeringType;

  /// The recurring price charged to run this reserved node.
  final List<RecurringCharge>? recurringCharges;

  /// A customer-specified identifier to track this reservation.
  final String? reservationId;

  /// The ID of the reserved node offering to purchase.
  final String? reservedNodesOfferingId;

  /// The time the reservation started.
  final DateTime? startTime;

  /// The state of the reserved node.
  final String? state;

  ReservedNode({
    this.arn,
    this.duration,
    this.fixedPrice,
    this.nodeCount,
    this.nodeType,
    this.offeringType,
    this.recurringCharges,
    this.reservationId,
    this.reservedNodesOfferingId,
    this.startTime,
    this.state,
  });

  factory ReservedNode.fromJson(Map<String, dynamic> json) {
    return ReservedNode(
      arn: json['ARN'] as String?,
      duration: json['Duration'] as int?,
      fixedPrice: json['FixedPrice'] as double?,
      nodeCount: json['NodeCount'] as int?,
      nodeType: json['NodeType'] as String?,
      offeringType: json['OfferingType'] as String?,
      recurringCharges: (json['RecurringCharges'] as List?)
          ?.whereNotNull()
          .map((e) => RecurringCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      reservationId: json['ReservationId'] as String?,
      reservedNodesOfferingId: json['ReservedNodesOfferingId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: json['State'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final nodeCount = this.nodeCount;
    final nodeType = this.nodeType;
    final offeringType = this.offeringType;
    final recurringCharges = this.recurringCharges;
    final reservationId = this.reservationId;
    final reservedNodesOfferingId = this.reservedNodesOfferingId;
    final startTime = this.startTime;
    final state = this.state;
    return {
      if (arn != null) 'ARN': arn,
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (nodeCount != null) 'NodeCount': nodeCount,
      if (nodeType != null) 'NodeType': nodeType,
      if (offeringType != null) 'OfferingType': offeringType,
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservationId != null) 'ReservationId': reservationId,
      if (reservedNodesOfferingId != null)
        'ReservedNodesOfferingId': reservedNodesOfferingId,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state,
    };
  }
}

/// The offering type of this node.
class ReservedNodesOffering {
  /// The duration of the reservation in seconds.
  final int? duration;

  /// The fixed price charged for this reserved node.
  final double? fixedPrice;

  /// The node type for the reserved nodes. For more information, see <a
  /// href="https://docs.aws.amazon.com/memorydb/latest/devguide/nodes.reserved.html#reserved-nodes-supported">Supported
  /// node types</a>.
  final String? nodeType;

  /// The offering type of this reserved node.
  final String? offeringType;

  /// The recurring price charged to run this reserved node.
  final List<RecurringCharge>? recurringCharges;

  /// The offering identifier.
  final String? reservedNodesOfferingId;

  ReservedNodesOffering({
    this.duration,
    this.fixedPrice,
    this.nodeType,
    this.offeringType,
    this.recurringCharges,
    this.reservedNodesOfferingId,
  });

  factory ReservedNodesOffering.fromJson(Map<String, dynamic> json) {
    return ReservedNodesOffering(
      duration: json['Duration'] as int?,
      fixedPrice: json['FixedPrice'] as double?,
      nodeType: json['NodeType'] as String?,
      offeringType: json['OfferingType'] as String?,
      recurringCharges: (json['RecurringCharges'] as List?)
          ?.whereNotNull()
          .map((e) => RecurringCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      reservedNodesOfferingId: json['ReservedNodesOfferingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final nodeType = this.nodeType;
    final offeringType = this.offeringType;
    final recurringCharges = this.recurringCharges;
    final reservedNodesOfferingId = this.reservedNodesOfferingId;
    return {
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (nodeType != null) 'NodeType': nodeType,
      if (offeringType != null) 'OfferingType': offeringType,
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservedNodesOfferingId != null)
        'ReservedNodesOfferingId': reservedNodesOfferingId,
    };
  }
}

class ResetParameterGroupResponse {
  /// The parameter group being reset.
  final ParameterGroup? parameterGroup;

  ResetParameterGroupResponse({
    this.parameterGroup,
  });

  factory ResetParameterGroupResponse.fromJson(Map<String, dynamic> json) {
    return ResetParameterGroupResponse(
      parameterGroup: json['ParameterGroup'] != null
          ? ParameterGroup.fromJson(
              json['ParameterGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterGroup = this.parameterGroup;
    return {
      if (parameterGroup != null) 'ParameterGroup': parameterGroup,
    };
  }
}

/// The status of the online resharding
class ReshardingStatus {
  /// The status of the online resharding slot migration
  final SlotMigration? slotMigration;

  ReshardingStatus({
    this.slotMigration,
  });

  factory ReshardingStatus.fromJson(Map<String, dynamic> json) {
    return ReshardingStatus(
      slotMigration: json['SlotMigration'] != null
          ? SlotMigration.fromJson(
              json['SlotMigration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final slotMigration = this.slotMigration;
    return {
      if (slotMigration != null) 'SlotMigration': slotMigration,
    };
  }
}

/// Represents a single security group and its status.
class SecurityGroupMembership {
  /// The identifier of the security group.
  final String? securityGroupId;

  /// The status of the security group membership. The status changes whenever a
  /// security group is modified, or when the security groups assigned to a
  /// cluster are modified.
  final String? status;

  SecurityGroupMembership({
    this.securityGroupId,
    this.status,
  });

  factory SecurityGroupMembership.fromJson(Map<String, dynamic> json) {
    return SecurityGroupMembership(
      securityGroupId: json['SecurityGroupId'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupId = this.securityGroupId;
    final status = this.status;
    return {
      if (securityGroupId != null) 'SecurityGroupId': securityGroupId,
      if (status != null) 'Status': status,
    };
  }
}

/// An update that you can apply to your MemoryDB clusters.
class ServiceUpdate {
  /// The date at which the service update will be automatically applied
  final DateTime? autoUpdateStartDate;

  /// The name of the cluster to which the service update applies
  final String? clusterName;

  /// Provides details of the service update
  final String? description;

  /// A list of nodes updated by the service update
  final String? nodesUpdated;

  /// The date when the service update is initially available
  final DateTime? releaseDate;

  /// The unique ID of the service update
  final String? serviceUpdateName;

  /// The status of the service update
  final ServiceUpdateStatus? status;

  /// Reflects the nature of the service update
  final ServiceUpdateType? type;

  ServiceUpdate({
    this.autoUpdateStartDate,
    this.clusterName,
    this.description,
    this.nodesUpdated,
    this.releaseDate,
    this.serviceUpdateName,
    this.status,
    this.type,
  });

  factory ServiceUpdate.fromJson(Map<String, dynamic> json) {
    return ServiceUpdate(
      autoUpdateStartDate: timeStampFromJson(json['AutoUpdateStartDate']),
      clusterName: json['ClusterName'] as String?,
      description: json['Description'] as String?,
      nodesUpdated: json['NodesUpdated'] as String?,
      releaseDate: timeStampFromJson(json['ReleaseDate']),
      serviceUpdateName: json['ServiceUpdateName'] as String?,
      status: (json['Status'] as String?)?.toServiceUpdateStatus(),
      type: (json['Type'] as String?)?.toServiceUpdateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoUpdateStartDate = this.autoUpdateStartDate;
    final clusterName = this.clusterName;
    final description = this.description;
    final nodesUpdated = this.nodesUpdated;
    final releaseDate = this.releaseDate;
    final serviceUpdateName = this.serviceUpdateName;
    final status = this.status;
    final type = this.type;
    return {
      if (autoUpdateStartDate != null)
        'AutoUpdateStartDate': unixTimestampToJson(autoUpdateStartDate),
      if (clusterName != null) 'ClusterName': clusterName,
      if (description != null) 'Description': description,
      if (nodesUpdated != null) 'NodesUpdated': nodesUpdated,
      if (releaseDate != null) 'ReleaseDate': unixTimestampToJson(releaseDate),
      if (serviceUpdateName != null) 'ServiceUpdateName': serviceUpdateName,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// A request to apply a service update
class ServiceUpdateRequest {
  /// The unique ID of the service update
  final String? serviceUpdateNameToApply;

  ServiceUpdateRequest({
    this.serviceUpdateNameToApply,
  });

  Map<String, dynamic> toJson() {
    final serviceUpdateNameToApply = this.serviceUpdateNameToApply;
    return {
      if (serviceUpdateNameToApply != null)
        'ServiceUpdateNameToApply': serviceUpdateNameToApply,
    };
  }
}

enum ServiceUpdateStatus {
  available,
  inProgress,
  complete,
  scheduled,
}

extension ServiceUpdateStatusValueExtension on ServiceUpdateStatus {
  String toValue() {
    switch (this) {
      case ServiceUpdateStatus.available:
        return 'available';
      case ServiceUpdateStatus.inProgress:
        return 'in-progress';
      case ServiceUpdateStatus.complete:
        return 'complete';
      case ServiceUpdateStatus.scheduled:
        return 'scheduled';
    }
  }
}

extension ServiceUpdateStatusFromString on String {
  ServiceUpdateStatus toServiceUpdateStatus() {
    switch (this) {
      case 'available':
        return ServiceUpdateStatus.available;
      case 'in-progress':
        return ServiceUpdateStatus.inProgress;
      case 'complete':
        return ServiceUpdateStatus.complete;
      case 'scheduled':
        return ServiceUpdateStatus.scheduled;
    }
    throw Exception('$this is not known in enum ServiceUpdateStatus');
  }
}

enum ServiceUpdateType {
  securityUpdate,
}

extension ServiceUpdateTypeValueExtension on ServiceUpdateType {
  String toValue() {
    switch (this) {
      case ServiceUpdateType.securityUpdate:
        return 'security-update';
    }
  }
}

extension ServiceUpdateTypeFromString on String {
  ServiceUpdateType toServiceUpdateType() {
    switch (this) {
      case 'security-update':
        return ServiceUpdateType.securityUpdate;
    }
    throw Exception('$this is not known in enum ServiceUpdateType');
  }
}

/// Represents a collection of nodes in a cluster. One node in the node group is
/// the read/write primary node. All the other nodes are read-only Replica
/// nodes.
class Shard {
  /// The name of the shard
  final String? name;

  /// A list containing information about individual nodes within the shard
  final List<Node>? nodes;

  /// The number of nodes in the shard
  final int? numberOfNodes;

  /// The keyspace for this shard.
  final String? slots;

  /// The current state of this replication group - creating, available,
  /// modifying, deleting.
  final String? status;

  Shard({
    this.name,
    this.nodes,
    this.numberOfNodes,
    this.slots,
    this.status,
  });

  factory Shard.fromJson(Map<String, dynamic> json) {
    return Shard(
      name: json['Name'] as String?,
      nodes: (json['Nodes'] as List?)
          ?.whereNotNull()
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfNodes: json['NumberOfNodes'] as int?,
      slots: json['Slots'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final nodes = this.nodes;
    final numberOfNodes = this.numberOfNodes;
    final slots = this.slots;
    final status = this.status;
    return {
      if (name != null) 'Name': name,
      if (nodes != null) 'Nodes': nodes,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
      if (slots != null) 'Slots': slots,
      if (status != null) 'Status': status,
    };
  }
}

/// Shard configuration options. Each shard configuration has the following:
/// Slots and ReplicaCount.
class ShardConfiguration {
  /// The number of read replica nodes in this shard.
  final int? replicaCount;

  /// A string that specifies the keyspace for a particular node group. Keyspaces
  /// range from 0 to 16,383. The string is in the format startkey-endkey.
  final String? slots;

  ShardConfiguration({
    this.replicaCount,
    this.slots,
  });

  factory ShardConfiguration.fromJson(Map<String, dynamic> json) {
    return ShardConfiguration(
      replicaCount: json['ReplicaCount'] as int?,
      slots: json['Slots'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicaCount = this.replicaCount;
    final slots = this.slots;
    return {
      if (replicaCount != null) 'ReplicaCount': replicaCount,
      if (slots != null) 'Slots': slots,
    };
  }
}

/// A request to configure the sharding properties of a cluster
class ShardConfigurationRequest {
  /// The number of shards in the cluster
  final int? shardCount;

  ShardConfigurationRequest({
    this.shardCount,
  });

  Map<String, dynamic> toJson() {
    final shardCount = this.shardCount;
    return {
      if (shardCount != null) 'ShardCount': shardCount,
    };
  }
}

/// Provides details of a shard in a snapshot
class ShardDetail {
  /// The configuration details of the shard
  final ShardConfiguration? configuration;

  /// The name of the shard
  final String? name;

  /// The size of the shard's snapshot
  final String? size;

  /// The date and time that the shard's snapshot was created
  final DateTime? snapshotCreationTime;

  ShardDetail({
    this.configuration,
    this.name,
    this.size,
    this.snapshotCreationTime,
  });

  factory ShardDetail.fromJson(Map<String, dynamic> json) {
    return ShardDetail(
      configuration: json['Configuration'] != null
          ? ShardConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      size: json['Size'] as String?,
      snapshotCreationTime: timeStampFromJson(json['SnapshotCreationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final name = this.name;
    final size = this.size;
    final snapshotCreationTime = this.snapshotCreationTime;
    return {
      if (configuration != null) 'Configuration': configuration,
      if (name != null) 'Name': name,
      if (size != null) 'Size': size,
      if (snapshotCreationTime != null)
        'SnapshotCreationTime': unixTimestampToJson(snapshotCreationTime),
    };
  }
}

/// Represents the progress of an online resharding operation.
class SlotMigration {
  /// The percentage of the slot migration that is complete.
  final double? progressPercentage;

  SlotMigration({
    this.progressPercentage,
  });

  factory SlotMigration.fromJson(Map<String, dynamic> json) {
    return SlotMigration(
      progressPercentage: json['ProgressPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final progressPercentage = this.progressPercentage;
    return {
      if (progressPercentage != null) 'ProgressPercentage': progressPercentage,
    };
  }
}

/// Represents a copy of an entire cluster as of the time when the snapshot was
/// taken.
class Snapshot {
  /// The ARN (Amazon Resource Name) of the snapshot.
  final String? arn;

  /// The configuration of the cluster from which the snapshot was taken
  final ClusterConfiguration? clusterConfiguration;

  /// Enables data tiering. Data tiering is only supported for clusters using the
  /// r6gd node type. This parameter must be set when using r6gd nodes. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/memorydb/latest/devguide/data-tiering.html">Data
  /// tiering</a>.
  final DataTieringStatus? dataTiering;

  /// The ID of the KMS key used to encrypt the snapshot.
  final String? kmsKeyId;

  /// The name of the snapshot
  final String? name;

  /// Indicates whether the snapshot is from an automatic backup (automated) or
  /// was created manually (manual).
  final String? source;

  /// The status of the snapshot. Valid values: creating | available | restoring |
  /// copying | deleting.
  final String? status;

  Snapshot({
    this.arn,
    this.clusterConfiguration,
    this.dataTiering,
    this.kmsKeyId,
    this.name,
    this.source,
    this.status,
  });

  factory Snapshot.fromJson(Map<String, dynamic> json) {
    return Snapshot(
      arn: json['ARN'] as String?,
      clusterConfiguration: json['ClusterConfiguration'] != null
          ? ClusterConfiguration.fromJson(
              json['ClusterConfiguration'] as Map<String, dynamic>)
          : null,
      dataTiering: (json['DataTiering'] as String?)?.toDataTieringStatus(),
      kmsKeyId: json['KmsKeyId'] as String?,
      name: json['Name'] as String?,
      source: json['Source'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterConfiguration = this.clusterConfiguration;
    final dataTiering = this.dataTiering;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final source = this.source;
    final status = this.status;
    return {
      if (arn != null) 'ARN': arn,
      if (clusterConfiguration != null)
        'ClusterConfiguration': clusterConfiguration,
      if (dataTiering != null) 'DataTiering': dataTiering.toValue(),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (name != null) 'Name': name,
      if (source != null) 'Source': source,
      if (status != null) 'Status': status,
    };
  }
}

enum SourceType {
  node,
  parameterGroup,
  subnetGroup,
  cluster,
  user,
  acl,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.node:
        return 'node';
      case SourceType.parameterGroup:
        return 'parameter-group';
      case SourceType.subnetGroup:
        return 'subnet-group';
      case SourceType.cluster:
        return 'cluster';
      case SourceType.user:
        return 'user';
      case SourceType.acl:
        return 'acl';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'node':
        return SourceType.node;
      case 'parameter-group':
        return SourceType.parameterGroup;
      case 'subnet-group':
        return SourceType.subnetGroup;
      case 'cluster':
        return SourceType.cluster;
      case 'user':
        return SourceType.user;
      case 'acl':
        return SourceType.acl;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

/// Represents the subnet associated with a cluster. This parameter refers to
/// subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used with
/// MemoryDB.
class Subnet {
  /// The Availability Zone where the subnet resides
  final AvailabilityZone? availabilityZone;

  /// The unique identifier for the subnet.
  final String? identifier;

  Subnet({
    this.availabilityZone,
    this.identifier,
  });

  factory Subnet.fromJson(Map<String, dynamic> json) {
    return Subnet(
      availabilityZone: json['AvailabilityZone'] != null
          ? AvailabilityZone.fromJson(
              json['AvailabilityZone'] as Map<String, dynamic>)
          : null,
      identifier: json['Identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final identifier = this.identifier;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (identifier != null) 'Identifier': identifier,
    };
  }
}

/// Represents the output of one of the following operations:
///
/// <ul>
/// <li>
/// CreateSubnetGroup
/// </li>
/// <li>
/// UpdateSubnetGroup
/// </li>
/// </ul>
/// A subnet group is a collection of subnets (typically private) that you can
/// designate for your clusters running in an Amazon Virtual Private Cloud (VPC)
/// environment.
class SubnetGroup {
  /// The ARN (Amazon Resource Name) of the subnet group.
  final String? arn;

  /// A description of the subnet group
  final String? description;

  /// The name of the subnet group
  final String? name;

  /// A list of subnets associated with the subnet group.
  final List<Subnet>? subnets;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the subnet group.
  final String? vpcId;

  SubnetGroup({
    this.arn,
    this.description,
    this.name,
    this.subnets,
    this.vpcId,
  });

  factory SubnetGroup.fromJson(Map<String, dynamic> json) {
    return SubnetGroup(
      arn: json['ARN'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      subnets: (json['Subnets'] as List?)
          ?.whereNotNull()
          .map((e) => Subnet.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final name = this.name;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'ARN': arn,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (subnets != null) 'Subnets': subnets,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// A tag that can be added to an MemoryDB resource. Tags are composed of a
/// Key/Value pair. You can use tags to categorize and track all your MemoryDB
/// resources. When you add or remove tags on clusters, those actions will be
/// replicated to all nodes in the cluster. A tag with a null Value is
/// permitted. For more information, see <a
/// href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/tagging-resources.html">Tagging
/// your MemoryDB resources</a>
class Tag {
  /// The key for the tag. May not be null.
  final String? key;

  /// The tag's value. May be null.
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

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class TagResourceResponse {
  /// A list of tags as key-value pairs.
  final List<Tag>? tagList;

  TagResourceResponse({
    this.tagList,
  });

  factory TagResourceResponse.fromJson(Map<String, dynamic> json) {
    return TagResourceResponse(
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

/// A cluster whose updates have failed
class UnprocessedCluster {
  /// The name of the cluster
  final String? clusterName;

  /// The error message associated with the update failure
  final String? errorMessage;

  /// The error type associated with the update failure
  final String? errorType;

  UnprocessedCluster({
    this.clusterName,
    this.errorMessage,
    this.errorType,
  });

  factory UnprocessedCluster.fromJson(Map<String, dynamic> json) {
    return UnprocessedCluster(
      clusterName: json['ClusterName'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      errorType: json['ErrorType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterName = this.clusterName;
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    return {
      if (clusterName != null) 'ClusterName': clusterName,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (errorType != null) 'ErrorType': errorType,
    };
  }
}

class UntagResourceResponse {
  /// The list of tags removed
  final List<Tag>? tagList;

  UntagResourceResponse({
    this.tagList,
  });

  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) {
    return UntagResourceResponse(
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

class UpdateACLResponse {
  /// The updated Access Control List
  final ACL? acl;

  UpdateACLResponse({
    this.acl,
  });

  factory UpdateACLResponse.fromJson(Map<String, dynamic> json) {
    return UpdateACLResponse(
      acl: json['ACL'] != null
          ? ACL.fromJson(json['ACL'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acl = this.acl;
    return {
      if (acl != null) 'ACL': acl,
    };
  }
}

class UpdateClusterResponse {
  /// The updated cluster
  final Cluster? cluster;

  UpdateClusterResponse({
    this.cluster,
  });

  factory UpdateClusterResponse.fromJson(Map<String, dynamic> json) {
    return UpdateClusterResponse(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

class UpdateParameterGroupResponse {
  /// The updated parameter group
  final ParameterGroup? parameterGroup;

  UpdateParameterGroupResponse({
    this.parameterGroup,
  });

  factory UpdateParameterGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateParameterGroupResponse(
      parameterGroup: json['ParameterGroup'] != null
          ? ParameterGroup.fromJson(
              json['ParameterGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterGroup = this.parameterGroup;
    return {
      if (parameterGroup != null) 'ParameterGroup': parameterGroup,
    };
  }
}

class UpdateSubnetGroupResponse {
  /// The updated subnet group
  final SubnetGroup? subnetGroup;

  UpdateSubnetGroupResponse({
    this.subnetGroup,
  });

  factory UpdateSubnetGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSubnetGroupResponse(
      subnetGroup: json['SubnetGroup'] != null
          ? SubnetGroup.fromJson(json['SubnetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetGroup = this.subnetGroup;
    return {
      if (subnetGroup != null) 'SubnetGroup': subnetGroup,
    };
  }
}

class UpdateUserResponse {
  /// The updated user
  final User? user;

  UpdateUserResponse({
    this.user,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

/// You create users and assign them specific permissions by using an access
/// string. You assign the users to Access Control Lists aligned with a specific
/// role (administrators, human resources) that are then deployed to one or more
/// MemoryDB clusters.
class User {
  /// The names of the Access Control Lists to which the user belongs
  final List<String>? aCLNames;

  /// The Amazon Resource Name (ARN) of the user.
  final String? arn;

  /// Access permissions string used for this user.
  final String? accessString;

  /// Denotes whether the user requires a password to authenticate.
  final Authentication? authentication;

  /// The minimum engine version supported for the user
  final String? minimumEngineVersion;

  /// The name of the user
  final String? name;

  /// Indicates the user status. Can be "active", "modifying" or "deleting".
  final String? status;

  User({
    this.aCLNames,
    this.arn,
    this.accessString,
    this.authentication,
    this.minimumEngineVersion,
    this.name,
    this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      aCLNames: (json['ACLNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      arn: json['ARN'] as String?,
      accessString: json['AccessString'] as String?,
      authentication: json['Authentication'] != null
          ? Authentication.fromJson(
              json['Authentication'] as Map<String, dynamic>)
          : null,
      minimumEngineVersion: json['MinimumEngineVersion'] as String?,
      name: json['Name'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aCLNames = this.aCLNames;
    final arn = this.arn;
    final accessString = this.accessString;
    final authentication = this.authentication;
    final minimumEngineVersion = this.minimumEngineVersion;
    final name = this.name;
    final status = this.status;
    return {
      if (aCLNames != null) 'ACLNames': aCLNames,
      if (arn != null) 'ARN': arn,
      if (accessString != null) 'AccessString': accessString,
      if (authentication != null) 'Authentication': authentication,
      if (minimumEngineVersion != null)
        'MinimumEngineVersion': minimumEngineVersion,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
    };
  }
}

class ACLAlreadyExistsFault extends _s.GenericAwsException {
  ACLAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'ACLAlreadyExistsFault', message: message);
}

class ACLNotFoundFault extends _s.GenericAwsException {
  ACLNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ACLNotFoundFault', message: message);
}

class ACLQuotaExceededFault extends _s.GenericAwsException {
  ACLQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'ACLQuotaExceededFault', message: message);
}

class APICallRateForCustomerExceededFault extends _s.GenericAwsException {
  APICallRateForCustomerExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'APICallRateForCustomerExceededFault',
            message: message);
}

class ClusterAlreadyExistsFault extends _s.GenericAwsException {
  ClusterAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'ClusterAlreadyExistsFault', message: message);
}

class ClusterNotFoundFault extends _s.GenericAwsException {
  ClusterNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ClusterNotFoundFault', message: message);
}

class ClusterQuotaForCustomerExceededFault extends _s.GenericAwsException {
  ClusterQuotaForCustomerExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterQuotaForCustomerExceededFault',
            message: message);
}

class DefaultUserRequired extends _s.GenericAwsException {
  DefaultUserRequired({String? type, String? message})
      : super(type: type, code: 'DefaultUserRequired', message: message);
}

class DuplicateUserNameFault extends _s.GenericAwsException {
  DuplicateUserNameFault({String? type, String? message})
      : super(type: type, code: 'DuplicateUserNameFault', message: message);
}

class InsufficientClusterCapacityFault extends _s.GenericAwsException {
  InsufficientClusterCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientClusterCapacityFault',
            message: message);
}

class InvalidACLStateFault extends _s.GenericAwsException {
  InvalidACLStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidACLStateFault', message: message);
}

class InvalidARNFault extends _s.GenericAwsException {
  InvalidARNFault({String? type, String? message})
      : super(type: type, code: 'InvalidARNFault', message: message);
}

class InvalidClusterStateFault extends _s.GenericAwsException {
  InvalidClusterStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidClusterStateFault', message: message);
}

class InvalidCredentialsException extends _s.GenericAwsException {
  InvalidCredentialsException({String? type, String? message})
      : super(
            type: type, code: 'InvalidCredentialsException', message: message);
}

class InvalidKMSKeyFault extends _s.GenericAwsException {
  InvalidKMSKeyFault({String? type, String? message})
      : super(type: type, code: 'InvalidKMSKeyFault', message: message);
}

class InvalidNodeStateFault extends _s.GenericAwsException {
  InvalidNodeStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidNodeStateFault', message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterGroupStateFault extends _s.GenericAwsException {
  InvalidParameterGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterGroupStateFault',
            message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidSnapshotStateFault extends _s.GenericAwsException {
  InvalidSnapshotStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidSnapshotStateFault', message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String? type, String? message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class InvalidUserStateFault extends _s.GenericAwsException {
  InvalidUserStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidUserStateFault', message: message);
}

class InvalidVPCNetworkStateFault extends _s.GenericAwsException {
  InvalidVPCNetworkStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidVPCNetworkStateFault', message: message);
}

class NoOperationFault extends _s.GenericAwsException {
  NoOperationFault({String? type, String? message})
      : super(type: type, code: 'NoOperationFault', message: message);
}

class NodeQuotaForClusterExceededFault extends _s.GenericAwsException {
  NodeQuotaForClusterExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'NodeQuotaForClusterExceededFault',
            message: message);
}

class NodeQuotaForCustomerExceededFault extends _s.GenericAwsException {
  NodeQuotaForCustomerExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'NodeQuotaForCustomerExceededFault',
            message: message);
}

class ParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  ParameterGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ParameterGroupAlreadyExistsFault',
            message: message);
}

class ParameterGroupNotFoundFault extends _s.GenericAwsException {
  ParameterGroupNotFoundFault({String? type, String? message})
      : super(
            type: type, code: 'ParameterGroupNotFoundFault', message: message);
}

class ParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  ParameterGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ParameterGroupQuotaExceededFault',
            message: message);
}

class ReservedNodeAlreadyExistsFault extends _s.GenericAwsException {
  ReservedNodeAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedNodeAlreadyExistsFault',
            message: message);
}

class ReservedNodeNotFoundFault extends _s.GenericAwsException {
  ReservedNodeNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ReservedNodeNotFoundFault', message: message);
}

class ReservedNodeQuotaExceededFault extends _s.GenericAwsException {
  ReservedNodeQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedNodeQuotaExceededFault',
            message: message);
}

class ReservedNodesOfferingNotFoundFault extends _s.GenericAwsException {
  ReservedNodesOfferingNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedNodesOfferingNotFoundFault',
            message: message);
}

class ServiceLinkedRoleNotFoundFault extends _s.GenericAwsException {
  ServiceLinkedRoleNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceLinkedRoleNotFoundFault',
            message: message);
}

class ServiceUpdateNotFoundFault extends _s.GenericAwsException {
  ServiceUpdateNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ServiceUpdateNotFoundFault', message: message);
}

class ShardNotFoundFault extends _s.GenericAwsException {
  ShardNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ShardNotFoundFault', message: message);
}

class ShardsPerClusterQuotaExceededFault extends _s.GenericAwsException {
  ShardsPerClusterQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ShardsPerClusterQuotaExceededFault',
            message: message);
}

class SnapshotAlreadyExistsFault extends _s.GenericAwsException {
  SnapshotAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'SnapshotAlreadyExistsFault', message: message);
}

class SnapshotNotFoundFault extends _s.GenericAwsException {
  SnapshotNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SnapshotNotFoundFault', message: message);
}

class SnapshotQuotaExceededFault extends _s.GenericAwsException {
  SnapshotQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'SnapshotQuotaExceededFault', message: message);
}

class SubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  SubnetGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubnetGroupAlreadyExistsFault',
            message: message);
}

class SubnetGroupInUseFault extends _s.GenericAwsException {
  SubnetGroupInUseFault({String? type, String? message})
      : super(type: type, code: 'SubnetGroupInUseFault', message: message);
}

class SubnetGroupNotFoundFault extends _s.GenericAwsException {
  SubnetGroupNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SubnetGroupNotFoundFault', message: message);
}

class SubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  SubnetGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubnetGroupQuotaExceededFault',
            message: message);
}

class SubnetInUse extends _s.GenericAwsException {
  SubnetInUse({String? type, String? message})
      : super(type: type, code: 'SubnetInUse', message: message);
}

class SubnetNotAllowedFault extends _s.GenericAwsException {
  SubnetNotAllowedFault({String? type, String? message})
      : super(type: type, code: 'SubnetNotAllowedFault', message: message);
}

class SubnetQuotaExceededFault extends _s.GenericAwsException {
  SubnetQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'SubnetQuotaExceededFault', message: message);
}

class TagNotFoundFault extends _s.GenericAwsException {
  TagNotFoundFault({String? type, String? message})
      : super(type: type, code: 'TagNotFoundFault', message: message);
}

class TagQuotaPerResourceExceeded extends _s.GenericAwsException {
  TagQuotaPerResourceExceeded({String? type, String? message})
      : super(
            type: type, code: 'TagQuotaPerResourceExceeded', message: message);
}

class TestFailoverNotAvailableFault extends _s.GenericAwsException {
  TestFailoverNotAvailableFault({String? type, String? message})
      : super(
            type: type,
            code: 'TestFailoverNotAvailableFault',
            message: message);
}

class UserAlreadyExistsFault extends _s.GenericAwsException {
  UserAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'UserAlreadyExistsFault', message: message);
}

class UserNotFoundFault extends _s.GenericAwsException {
  UserNotFoundFault({String? type, String? message})
      : super(type: type, code: 'UserNotFoundFault', message: message);
}

class UserQuotaExceededFault extends _s.GenericAwsException {
  UserQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'UserQuotaExceededFault', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ACLAlreadyExistsFault': (type, message) =>
      ACLAlreadyExistsFault(type: type, message: message),
  'ACLNotFoundFault': (type, message) =>
      ACLNotFoundFault(type: type, message: message),
  'ACLQuotaExceededFault': (type, message) =>
      ACLQuotaExceededFault(type: type, message: message),
  'APICallRateForCustomerExceededFault': (type, message) =>
      APICallRateForCustomerExceededFault(type: type, message: message),
  'ClusterAlreadyExistsFault': (type, message) =>
      ClusterAlreadyExistsFault(type: type, message: message),
  'ClusterNotFoundFault': (type, message) =>
      ClusterNotFoundFault(type: type, message: message),
  'ClusterQuotaForCustomerExceededFault': (type, message) =>
      ClusterQuotaForCustomerExceededFault(type: type, message: message),
  'DefaultUserRequired': (type, message) =>
      DefaultUserRequired(type: type, message: message),
  'DuplicateUserNameFault': (type, message) =>
      DuplicateUserNameFault(type: type, message: message),
  'InsufficientClusterCapacityFault': (type, message) =>
      InsufficientClusterCapacityFault(type: type, message: message),
  'InvalidACLStateFault': (type, message) =>
      InvalidACLStateFault(type: type, message: message),
  'InvalidARNFault': (type, message) =>
      InvalidARNFault(type: type, message: message),
  'InvalidClusterStateFault': (type, message) =>
      InvalidClusterStateFault(type: type, message: message),
  'InvalidCredentialsException': (type, message) =>
      InvalidCredentialsException(type: type, message: message),
  'InvalidKMSKeyFault': (type, message) =>
      InvalidKMSKeyFault(type: type, message: message),
  'InvalidNodeStateFault': (type, message) =>
      InvalidNodeStateFault(type: type, message: message),
  'InvalidParameterCombinationException': (type, message) =>
      InvalidParameterCombinationException(type: type, message: message),
  'InvalidParameterGroupStateFault': (type, message) =>
      InvalidParameterGroupStateFault(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidSnapshotStateFault': (type, message) =>
      InvalidSnapshotStateFault(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'InvalidUserStateFault': (type, message) =>
      InvalidUserStateFault(type: type, message: message),
  'InvalidVPCNetworkStateFault': (type, message) =>
      InvalidVPCNetworkStateFault(type: type, message: message),
  'NoOperationFault': (type, message) =>
      NoOperationFault(type: type, message: message),
  'NodeQuotaForClusterExceededFault': (type, message) =>
      NodeQuotaForClusterExceededFault(type: type, message: message),
  'NodeQuotaForCustomerExceededFault': (type, message) =>
      NodeQuotaForCustomerExceededFault(type: type, message: message),
  'ParameterGroupAlreadyExistsFault': (type, message) =>
      ParameterGroupAlreadyExistsFault(type: type, message: message),
  'ParameterGroupNotFoundFault': (type, message) =>
      ParameterGroupNotFoundFault(type: type, message: message),
  'ParameterGroupQuotaExceededFault': (type, message) =>
      ParameterGroupQuotaExceededFault(type: type, message: message),
  'ReservedNodeAlreadyExistsFault': (type, message) =>
      ReservedNodeAlreadyExistsFault(type: type, message: message),
  'ReservedNodeNotFoundFault': (type, message) =>
      ReservedNodeNotFoundFault(type: type, message: message),
  'ReservedNodeQuotaExceededFault': (type, message) =>
      ReservedNodeQuotaExceededFault(type: type, message: message),
  'ReservedNodesOfferingNotFoundFault': (type, message) =>
      ReservedNodesOfferingNotFoundFault(type: type, message: message),
  'ServiceLinkedRoleNotFoundFault': (type, message) =>
      ServiceLinkedRoleNotFoundFault(type: type, message: message),
  'ServiceUpdateNotFoundFault': (type, message) =>
      ServiceUpdateNotFoundFault(type: type, message: message),
  'ShardNotFoundFault': (type, message) =>
      ShardNotFoundFault(type: type, message: message),
  'ShardsPerClusterQuotaExceededFault': (type, message) =>
      ShardsPerClusterQuotaExceededFault(type: type, message: message),
  'SnapshotAlreadyExistsFault': (type, message) =>
      SnapshotAlreadyExistsFault(type: type, message: message),
  'SnapshotNotFoundFault': (type, message) =>
      SnapshotNotFoundFault(type: type, message: message),
  'SnapshotQuotaExceededFault': (type, message) =>
      SnapshotQuotaExceededFault(type: type, message: message),
  'SubnetGroupAlreadyExistsFault': (type, message) =>
      SubnetGroupAlreadyExistsFault(type: type, message: message),
  'SubnetGroupInUseFault': (type, message) =>
      SubnetGroupInUseFault(type: type, message: message),
  'SubnetGroupNotFoundFault': (type, message) =>
      SubnetGroupNotFoundFault(type: type, message: message),
  'SubnetGroupQuotaExceededFault': (type, message) =>
      SubnetGroupQuotaExceededFault(type: type, message: message),
  'SubnetInUse': (type, message) => SubnetInUse(type: type, message: message),
  'SubnetNotAllowedFault': (type, message) =>
      SubnetNotAllowedFault(type: type, message: message),
  'SubnetQuotaExceededFault': (type, message) =>
      SubnetQuotaExceededFault(type: type, message: message),
  'TagNotFoundFault': (type, message) =>
      TagNotFoundFault(type: type, message: message),
  'TagQuotaPerResourceExceeded': (type, message) =>
      TagQuotaPerResourceExceeded(type: type, message: message),
  'TestFailoverNotAvailableFault': (type, message) =>
      TestFailoverNotAvailableFault(type: type, message: message),
  'UserAlreadyExistsFault': (type, message) =>
      UserAlreadyExistsFault(type: type, message: message),
  'UserNotFoundFault': (type, message) =>
      UserNotFoundFault(type: type, message: message),
  'UserQuotaExceededFault': (type, message) =>
      UserQuotaExceededFault(type: type, message: message),
};
