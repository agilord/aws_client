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

import 'v2015_02_02.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon ElastiCache is a web service that makes it easier to set up, operate,
/// and scale a distributed cache in the cloud.
class ElastiCache {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ElastiCache({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'elasticache',
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

  /// A tag is a key-value pair where the key and value are case-sensitive. You
  /// can use tags to categorize and track all your ElastiCache resources, with
  /// the exception of global replication group. When you add or remove tags on
  /// replication groups, those actions will be replicated to all nodes in the
  /// replication group. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.ResourceLevelPermissions.html">Resource-level
  /// permissions</a>.
  ///
  /// For example, you can use cost-allocation tags to your ElastiCache
  /// resources, Amazon generates a cost allocation report as a comma-separated
  /// value (CSV) file with your usage and costs aggregated by your tags. You
  /// can apply tags that represent business categories (such as cost centers,
  /// application names, or owners) to organize your costs across multiple
  /// services.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html">Using
  /// Cost Allocation Tags in Amazon ElastiCache</a> in the <i>ElastiCache User
  /// Guide</i>.
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [CacheSubnetGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [ReservedCacheNodeNotFoundFault].
  /// May throw [SnapshotNotFoundFault].
  /// May throw [UserNotFoundFault].
  /// May throw [UserGroupNotFoundFault].
  /// May throw [ServerlessCacheNotFoundFault].
  /// May throw [InvalidServerlessCacheStateFault].
  /// May throw [ServerlessCacheSnapshotNotFoundFault].
  /// May throw [InvalidServerlessCacheSnapshotStateFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidARNFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon Resource Name (ARN) of the resource to which the tags are to be
  /// added, for example
  /// <code>arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster</code> or
  /// <code>arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot</code>.
  /// ElastiCache resources are <i>cluster</i> and <i>snapshot</i>.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Service Namespaces</a>.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<TagListMessage> addTagsToResource({
    required String resourceName,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['Tags'] = tags;
    final $result = await _protocol.send(
      $request,
      action: 'AddTagsToResource',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddTagsToResourceMessage'],
      shapes: shapes,
      resultWrapper: 'AddTagsToResourceResult',
    );
    return TagListMessage.fromXml($result);
  }

  /// Allows network ingress to a cache security group. Applications using
  /// ElastiCache must be running on Amazon EC2, and Amazon EC2 security groups
  /// are used as the authorization mechanism.
  /// <note>
  /// You cannot authorize ingress from an Amazon EC2 security group in one
  /// region to an ElastiCache cluster in another region.
  /// </note>
  ///
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [InvalidCacheSecurityGroupStateFault].
  /// May throw [AuthorizationAlreadyExistsFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheSecurityGroupName] :
  /// The cache security group that allows network ingress.
  ///
  /// Parameter [eC2SecurityGroupName] :
  /// The Amazon EC2 security group to be authorized for ingress to the cache
  /// security group.
  ///
  /// Parameter [eC2SecurityGroupOwnerId] :
  /// The Amazon account number of the Amazon EC2 security group owner. Note
  /// that this is not the same thing as an Amazon access key ID - you must
  /// provide a valid Amazon account number for this parameter.
  Future<AuthorizeCacheSecurityGroupIngressResult>
      authorizeCacheSecurityGroupIngress({
    required String cacheSecurityGroupName,
    required String eC2SecurityGroupName,
    required String eC2SecurityGroupOwnerId,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheSecurityGroupName'] = cacheSecurityGroupName;
    $request['EC2SecurityGroupName'] = eC2SecurityGroupName;
    $request['EC2SecurityGroupOwnerId'] = eC2SecurityGroupOwnerId;
    final $result = await _protocol.send(
      $request,
      action: 'AuthorizeCacheSecurityGroupIngress',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AuthorizeCacheSecurityGroupIngressMessage'],
      shapes: shapes,
      resultWrapper: 'AuthorizeCacheSecurityGroupIngressResult',
    );
    return AuthorizeCacheSecurityGroupIngressResult.fromXml($result);
  }

  /// Apply the service update. For more information on service updates and
  /// applying them, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/applying-updates.html">Applying
  /// Service Updates</a>.
  ///
  /// May throw [ServiceUpdateNotFoundFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [serviceUpdateName] :
  /// The unique ID of the service update
  ///
  /// Parameter [cacheClusterIds] :
  /// The cache cluster IDs
  ///
  /// Parameter [replicationGroupIds] :
  /// The replication group IDs
  Future<UpdateActionResultsMessage> batchApplyUpdateAction({
    required String serviceUpdateName,
    List<String>? cacheClusterIds,
    List<String>? replicationGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['ServiceUpdateName'] = serviceUpdateName;
    cacheClusterIds?.also((arg) => $request['CacheClusterIds'] = arg);
    replicationGroupIds?.also((arg) => $request['ReplicationGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'BatchApplyUpdateAction',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BatchApplyUpdateActionMessage'],
      shapes: shapes,
      resultWrapper: 'BatchApplyUpdateActionResult',
    );
    return UpdateActionResultsMessage.fromXml($result);
  }

  /// Stop the service update. For more information on service updates and
  /// stopping them, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/stopping-self-service-updates.html">Stopping
  /// Service Updates</a>.
  ///
  /// May throw [ServiceUpdateNotFoundFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [serviceUpdateName] :
  /// The unique ID of the service update
  ///
  /// Parameter [cacheClusterIds] :
  /// The cache cluster IDs
  ///
  /// Parameter [replicationGroupIds] :
  /// The replication group IDs
  Future<UpdateActionResultsMessage> batchStopUpdateAction({
    required String serviceUpdateName,
    List<String>? cacheClusterIds,
    List<String>? replicationGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['ServiceUpdateName'] = serviceUpdateName;
    cacheClusterIds?.also((arg) => $request['CacheClusterIds'] = arg);
    replicationGroupIds?.also((arg) => $request['ReplicationGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'BatchStopUpdateAction',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BatchStopUpdateActionMessage'],
      shapes: shapes,
      resultWrapper: 'BatchStopUpdateActionResult',
    );
    return UpdateActionResultsMessage.fromXml($result);
  }

  /// Complete the migration of data.
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [ReplicationGroupNotUnderMigrationFault].
  ///
  /// Parameter [replicationGroupId] :
  /// The ID of the replication group to which data is being migrated.
  ///
  /// Parameter [force] :
  /// Forces the migration to stop without ensuring that data is in sync. It is
  /// recommended to use this option only to abort the migration and not
  /// recommended when application wants to continue migration to ElastiCache.
  Future<CompleteMigrationResponse> completeMigration({
    required String replicationGroupId,
    bool? force,
  }) async {
    final $request = <String, dynamic>{};
    $request['ReplicationGroupId'] = replicationGroupId;
    force?.also((arg) => $request['Force'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CompleteMigration',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CompleteMigrationMessage'],
      shapes: shapes,
      resultWrapper: 'CompleteMigrationResult',
    );
    return CompleteMigrationResponse.fromXml($result);
  }

  /// Creates a copy of an existing serverless cache’s snapshot. Available for
  /// Redis only.
  ///
  /// May throw [ServerlessCacheSnapshotAlreadyExistsFault].
  /// May throw [ServerlessCacheSnapshotNotFoundFault].
  /// May throw [ServerlessCacheSnapshotQuotaExceededFault].
  /// May throw [InvalidServerlessCacheSnapshotStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [sourceServerlessCacheSnapshotName] :
  /// The identifier of the existing serverless cache’s snapshot to be copied.
  /// Available for Redis only.
  ///
  /// Parameter [targetServerlessCacheSnapshotName] :
  /// The identifier for the snapshot to be created. Available for Redis only.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier of the KMS key used to encrypt the target snapshot.
  /// Available for Redis only.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to the target snapshot resource. A tag is a
  /// key-value pair. Available for Redis only. Default: NULL
  Future<CopyServerlessCacheSnapshotResponse> copyServerlessCacheSnapshot({
    required String sourceServerlessCacheSnapshotName,
    required String targetServerlessCacheSnapshotName,
    String? kmsKeyId,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SourceServerlessCacheSnapshotName'] =
        sourceServerlessCacheSnapshotName;
    $request['TargetServerlessCacheSnapshotName'] =
        targetServerlessCacheSnapshotName;
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopyServerlessCacheSnapshot',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyServerlessCacheSnapshotRequest'],
      shapes: shapes,
      resultWrapper: 'CopyServerlessCacheSnapshotResult',
    );
    return CopyServerlessCacheSnapshotResponse.fromXml($result);
  }

  /// Makes a copy of an existing snapshot.
  /// <note>
  /// This operation is valid for Redis only.
  /// </note> <important>
  /// Users or groups that have permissions to use the <code>CopySnapshot</code>
  /// operation can create their own Amazon S3 buckets and copy snapshots to it.
  /// To control access to your snapshots, use an IAM policy to control who has
  /// the ability to use the <code>CopySnapshot</code> operation. For more
  /// information about using IAM to control the use of ElastiCache operations,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html">Exporting
  /// Snapshots</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.html">Authentication
  /// &amp; Access Control</a>.
  /// </important>
  /// You could receive the following error messages.
  /// <p class="title"> <b>Error Messages</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Error Message:</b> The S3 bucket %s is outside of the region.
  ///
  /// <b>Solution:</b> Create an Amazon S3 bucket in the same region as your
  /// snapshot. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step
  /// 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.
  /// </li>
  /// <li>
  /// <b>Error Message:</b> The S3 bucket %s does not exist.
  ///
  /// <b>Solution:</b> Create an Amazon S3 bucket in the same region as your
  /// snapshot. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step
  /// 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.
  /// </li>
  /// <li>
  /// <b>Error Message:</b> The S3 bucket %s is not owned by the authenticated
  /// user.
  ///
  /// <b>Solution:</b> Create an Amazon S3 bucket in the same region as your
  /// snapshot. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step
  /// 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.
  /// </li>
  /// <li>
  /// <b>Error Message:</b> The authenticated user does not have sufficient
  /// permissions to perform the desired activity.
  ///
  /// <b>Solution:</b> Contact your system administrator to get the needed
  /// permissions.
  /// </li>
  /// <li>
  /// <b>Error Message:</b> The S3 bucket %s already contains an object with key
  /// %s.
  ///
  /// <b>Solution:</b> Give the <code>TargetSnapshotName</code> a new and unique
  /// value. If exporting a snapshot, you could alternatively create a new
  /// Amazon S3 bucket and use this same value for
  /// <code>TargetSnapshotName</code>.
  /// </li>
  /// <li>
  /// <b>Error Message: </b> ElastiCache has not been granted READ permissions
  /// %s on the S3 Bucket.
  ///
  /// <b>Solution:</b> Add List and Read permissions on the bucket. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step
  /// 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the
  /// ElastiCache User Guide.
  /// </li>
  /// <li>
  /// <b>Error Message: </b> ElastiCache has not been granted WRITE permissions
  /// %s on the S3 Bucket.
  ///
  /// <b>Solution:</b> Add Upload/Delete permissions on the bucket. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step
  /// 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the
  /// ElastiCache User Guide.
  /// </li>
  /// <li>
  /// <b>Error Message: </b> ElastiCache has not been granted READ_ACP
  /// permissions %s on the S3 Bucket.
  ///
  /// <b>Solution:</b> Add View Permissions on the bucket. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step
  /// 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the
  /// ElastiCache User Guide.
  /// </li>
  /// </ul>
  ///
  /// May throw [SnapshotAlreadyExistsFault].
  /// May throw [SnapshotNotFoundFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidSnapshotStateFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [sourceSnapshotName] :
  /// The name of an existing snapshot from which to make a copy.
  ///
  /// Parameter [targetSnapshotName] :
  /// A name for the snapshot copy. ElastiCache does not permit overwriting a
  /// snapshot, therefore this name must be unique within its context -
  /// ElastiCache or an Amazon S3 bucket if exporting.
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
  /// used only when exporting a snapshot for external access.
  ///
  /// When using this parameter to export a snapshot, be sure Amazon ElastiCache
  /// has the needed permissions to this S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step
  /// 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the <i>Amazon
  /// ElastiCache User Guide</i>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html">Exporting
  /// a Snapshot</a> in the <i>Amazon ElastiCache User Guide</i>.
  Future<CopySnapshotResult> copySnapshot({
    required String sourceSnapshotName,
    required String targetSnapshotName,
    String? kmsKeyId,
    List<Tag>? tags,
    String? targetBucket,
  }) async {
    final $request = <String, dynamic>{};
    $request['SourceSnapshotName'] = sourceSnapshotName;
    $request['TargetSnapshotName'] = targetSnapshotName;
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    targetBucket?.also((arg) => $request['TargetBucket'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CopySnapshot',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopySnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CopySnapshotResult',
    );
    return CopySnapshotResult.fromXml($result);
  }

  /// Creates a cluster. All nodes in the cluster run the same
  /// protocol-compliant cache engine software, either Memcached or Redis.
  ///
  /// This operation is not supported for Redis (cluster mode enabled) clusters.
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [CacheClusterAlreadyExistsFault].
  /// May throw [InsufficientCacheClusterCapacityFault].
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [CacheSubnetGroupNotFoundFault].
  /// May throw [ClusterQuotaForCustomerExceededFault].
  /// May throw [NodeQuotaForClusterExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheClusterId] :
  /// The node group (shard) identifier. This parameter is stored as a lowercase
  /// string.
  ///
  /// <b>Constraints:</b>
  ///
  /// <ul>
  /// <li>
  /// A name must contain from 1 to 50 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// A name cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [aZMode] :
  /// Specifies whether the nodes in this Memcached cluster are created in a
  /// single Availability Zone or created across multiple Availability Zones in
  /// the cluster's region.
  ///
  /// This parameter is only supported for Memcached clusters.
  ///
  /// If the <code>AZMode</code> and <code>PreferredAvailabilityZones</code> are
  /// not specified, ElastiCache assumes <code>single-az</code> mode.
  ///
  /// Parameter [authToken] :
  /// <b>Reserved parameter.</b> The password used to access a password
  /// protected server.
  ///
  /// Password constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be only printable ASCII characters.
  /// </li>
  /// <li>
  /// Must be at least 16 characters and no more than 128 characters in length.
  /// </li>
  /// <li>
  /// The only permitted printable special characters are !, &amp;, #, $, ^,
  /// &lt;, &gt;, and -. Other printable special characters cannot be used in
  /// the AUTH token.
  /// </li>
  /// </ul>
  /// For more information, see <a href="http://redis.io/commands/AUTH">AUTH
  /// password</a> at http://redis.io/commands/AUTH.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// If you are running Redis engine version 6.0 or later, set this parameter
  /// to yes if you want to opt-in to the next auto minor version upgrade
  /// campaign. This parameter is disabled for previous versions.
  ///
  /// Parameter [cacheNodeType] :
  /// The compute and memory capacity of the nodes in the node group (shard).
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// <ul>
  /// <li>
  /// General purpose:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>M7g node types</b>: <code>cache.m7g.large</code>,
  /// <code>cache.m7g.xlarge</code>, <code>cache.m7g.2xlarge</code>,
  /// <code>cache.m7g.4xlarge</code>, <code>cache.m7g.8xlarge</code>,
  /// <code>cache.m7g.12xlarge</code>, <code>cache.m7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward):
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  ///
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T4g node types</b> (available only for Redis engine version 5.0.6
  /// onward and Memcached engine version 1.5.16 onward):
  /// <code>cache.t4g.micro</code>, <code>cache.t4g.small</code>,
  /// <code>cache.t4g.medium</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>T1 node types:</b> <code>cache.t1.micro</code>
  ///
  /// <b>M1 node types:</b> <code>cache.m1.small</code>,
  /// <code>cache.m1.medium</code>, <code>cache.m1.large</code>,
  /// <code>cache.m1.xlarge</code>
  ///
  /// <b>M3 node types:</b> <code>cache.m3.medium</code>,
  /// <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>,
  /// <code>cache.m3.2xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Compute optimized:
  ///
  /// <ul>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>C1 node types:</b> <code>cache.c1.xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Memory optimized:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>R7g node types</b>: <code>cache.r7g.large</code>,
  /// <code>cache.r7g.xlarge</code>, <code>cache.r7g.2xlarge</code>,
  /// <code>cache.r7g.4xlarge</code>, <code>cache.r7g.8xlarge</code>,
  /// <code>cache.r7g.12xlarge</code>, <code>cache.r7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward):
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  ///
  /// <b>R5 node types:</b> <code>cache.r5.large</code>,
  /// <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>,
  /// <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>,
  /// <code>cache.r5.24xlarge</code>
  ///
  /// <b>R4 node types:</b> <code>cache.r4.large</code>,
  /// <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>,
  /// <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>,
  /// <code>cache.r4.16xlarge</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>M2 node types:</b> <code>cache.m2.xlarge</code>,
  /// <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code>
  ///
  /// <b>R3 node types:</b> <code>cache.r3.large</code>,
  /// <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>,
  /// <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// <b>Additional node type info</b>
  ///
  /// <ul>
  /// <li>
  /// All current generation instance types are created in Amazon VPC by
  /// default.
  /// </li>
  /// <li>
  /// Redis append-only files (AOF) are not supported for T1 or T2 instances.
  /// </li>
  /// <li>
  /// Redis Multi-AZ with automatic failover is not supported on T1 instances.
  /// </li>
  /// <li>
  /// Redis configuration variables <code>appendonly</code> and
  /// <code>appendfsync</code> are not supported on Redis version 2.8.22 and
  /// later.
  /// </li>
  /// </ul>
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of the parameter group to associate with this cluster. If this
  /// argument is omitted, the default parameter group for the specified engine
  /// is used. You cannot use any parameter group which has
  /// <code>cluster-enabled='yes'</code> when creating a cluster.
  ///
  /// Parameter [cacheSecurityGroupNames] :
  /// A list of security group names to associate with this cluster.
  ///
  /// Use this parameter only when you are creating a cluster outside of an
  /// Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// Parameter [cacheSubnetGroupName] :
  /// The name of the subnet group to be used for the cluster.
  ///
  /// Use this parameter only when you are creating a cluster in an Amazon
  /// Virtual Private Cloud (Amazon VPC).
  /// <important>
  /// If you're going to launch your cluster in an Amazon VPC, you need to
  /// create a subnet group before you start creating a cluster. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.html">Subnets
  /// and Subnet Groups</a>.
  /// </important>
  ///
  /// Parameter [engine] :
  /// The name of the cache engine to be used for this cluster.
  ///
  /// Valid values for this parameter are: <code>memcached</code> |
  /// <code>redis</code>
  ///
  /// Parameter [engineVersion] :
  /// The version number of the cache engine to be used for this cluster. To
  /// view the supported cache engine versions, use the
  /// DescribeCacheEngineVersions operation.
  ///
  /// <b>Important:</b> You can upgrade to a newer engine version (see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement">Selecting
  /// a Cache Engine and Version</a>), but you cannot downgrade to an earlier
  /// engine version. If you want to use an earlier engine version, you must
  /// delete the existing cluster or replication group and create it anew with
  /// the earlier engine version.
  ///
  /// Parameter [ipDiscovery] :
  /// The network type you choose when modifying a cluster, either
  /// <code>ipv4</code> | <code>ipv6</code>. IPv6 is supported for workloads
  /// using Redis engine version 6.2 onward or Memcached engine version 1.6.6 on
  /// all instances built on the <a
  /// href="http://aws.amazon.com/ec2/nitro/">Nitro system</a>.
  ///
  /// Parameter [logDeliveryConfigurations] :
  /// Specifies the destination, format and type of the logs.
  ///
  /// Parameter [networkType] :
  /// Must be either <code>ipv4</code> | <code>ipv6</code> |
  /// <code>dual_stack</code>. IPv6 is supported for workloads using Redis
  /// engine version 6.2 onward or Memcached engine version 1.6.6 on all
  /// instances built on the <a href="http://aws.amazon.com/ec2/nitro/">Nitro
  /// system</a>.
  ///
  /// Parameter [notificationTopicArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// (SNS) topic to which notifications are sent.
  /// <note>
  /// The Amazon SNS topic owner must be the same as the cluster owner.
  /// </note>
  ///
  /// Parameter [numCacheNodes] :
  /// The initial number of cache nodes that the cluster has.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 40.
  ///
  /// If you need more than 40 nodes for your Memcached cluster, please fill out
  /// the ElastiCache Limit Increase Request form at <a
  /// href="http://aws.amazon.com/contact-us/elasticache-node-limit-request/">http://aws.amazon.com/contact-us/elasticache-node-limit-request/</a>.
  ///
  /// Parameter [outpostMode] :
  /// Specifies whether the nodes in the cluster are created in a single outpost
  /// or across multiple outposts.
  ///
  /// Parameter [port] :
  /// The port number on which each of the cache nodes accepts connections.
  ///
  /// Parameter [preferredAvailabilityZone] :
  /// The EC2 Availability Zone in which the cluster is created.
  ///
  /// All nodes belonging to this cluster are placed in the preferred
  /// Availability Zone. If you want to create your nodes across multiple
  /// Availability Zones, use <code>PreferredAvailabilityZones</code>.
  ///
  /// Default: System chosen Availability Zone.
  ///
  /// Parameter [preferredAvailabilityZones] :
  /// A list of the Availability Zones in which cache nodes are created. The
  /// order of the zones in the list is not important.
  ///
  /// This option is only supported on Memcached.
  /// <note>
  /// If you are creating your cluster in an Amazon VPC (recommended) you can
  /// only locate nodes in Availability Zones that are associated with the
  /// subnets in the selected subnet group.
  ///
  /// The number of Availability Zones listed must equal the value of
  /// <code>NumCacheNodes</code>.
  /// </note>
  /// If you want all the nodes in the same Availability Zone, use
  /// <code>PreferredAvailabilityZone</code> instead, or repeat the Availability
  /// Zone multiple times in the list.
  ///
  /// Default: System chosen Availability Zones.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format
  /// ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is
  /// a 60 minute period.
  ///
  /// Parameter [preferredOutpostArn] :
  /// The outpost ARN in which the cache cluster is created.
  ///
  /// Parameter [preferredOutpostArns] :
  /// The outpost ARNs in which the cache cluster is created.
  ///
  /// Parameter [replicationGroupId] :
  /// The ID of the replication group to which this cluster should belong. If
  /// this parameter is specified, the cluster is added to the specified
  /// replication group as a read replica; otherwise, the cluster is a
  /// standalone primary that is not part of any replication group.
  ///
  /// If the specified replication group is Multi-AZ enabled and the
  /// Availability Zone is not specified, the cluster is created in Availability
  /// Zones that provide the best spread of read replicas across Availability
  /// Zones.
  /// <note>
  /// This parameter is only valid if the <code>Engine</code> parameter is
  /// <code>redis</code>.
  /// </note>
  ///
  /// Parameter [securityGroupIds] :
  /// One or more VPC security groups associated with the cluster.
  ///
  /// Use this parameter only when you are creating a cluster in an Amazon
  /// Virtual Private Cloud (Amazon VPC).
  ///
  /// Parameter [snapshotArns] :
  /// A single-element string list containing an Amazon Resource Name (ARN) that
  /// uniquely identifies a Redis RDB snapshot file stored in Amazon S3. The
  /// snapshot file is used to populate the node group (shard). The Amazon S3
  /// object name in the ARN cannot contain any commas.
  /// <note>
  /// This parameter is only valid if the <code>Engine</code> parameter is
  /// <code>redis</code>.
  /// </note>
  /// Example of an Amazon S3 ARN:
  /// <code>arn:aws:s3:::my_bucket/snapshot1.rdb</code>
  ///
  /// Parameter [snapshotName] :
  /// The name of a Redis snapshot from which to restore data into the new node
  /// group (shard). The snapshot status changes to <code>restoring</code> while
  /// the new node group (shard) is being created.
  /// <note>
  /// This parameter is only valid if the <code>Engine</code> parameter is
  /// <code>redis</code>.
  /// </note>
  ///
  /// Parameter [snapshotRetentionLimit] :
  /// The number of days for which ElastiCache retains automatic snapshots
  /// before deleting them. For example, if you set
  /// <code>SnapshotRetentionLimit</code> to 5, a snapshot taken today is
  /// retained for 5 days before being deleted.
  /// <note>
  /// This parameter is only valid if the <code>Engine</code> parameter is
  /// <code>redis</code>.
  /// </note>
  /// Default: 0 (i.e., automatic backups are disabled for this cache cluster).
  ///
  /// Parameter [snapshotWindow] :
  /// The daily time range (in UTC) during which ElastiCache begins taking a
  /// daily snapshot of your node group (shard).
  ///
  /// Example: <code>05:00-09:00</code>
  ///
  /// If you do not specify this parameter, ElastiCache automatically chooses an
  /// appropriate time range.
  /// <note>
  /// This parameter is only valid if the <code>Engine</code> parameter is
  /// <code>redis</code>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource.
  ///
  /// Parameter [transitEncryptionEnabled] :
  /// A flag that enables in-transit encryption when set to true.
  Future<CreateCacheClusterResult> createCacheCluster({
    required String cacheClusterId,
    AZMode? aZMode,
    String? authToken,
    bool? autoMinorVersionUpgrade,
    String? cacheNodeType,
    String? cacheParameterGroupName,
    List<String>? cacheSecurityGroupNames,
    String? cacheSubnetGroupName,
    String? engine,
    String? engineVersion,
    IpDiscovery? ipDiscovery,
    List<LogDeliveryConfigurationRequest>? logDeliveryConfigurations,
    NetworkType? networkType,
    String? notificationTopicArn,
    int? numCacheNodes,
    OutpostMode? outpostMode,
    int? port,
    String? preferredAvailabilityZone,
    List<String>? preferredAvailabilityZones,
    String? preferredMaintenanceWindow,
    String? preferredOutpostArn,
    List<String>? preferredOutpostArns,
    String? replicationGroupId,
    List<String>? securityGroupIds,
    List<String>? snapshotArns,
    String? snapshotName,
    int? snapshotRetentionLimit,
    String? snapshotWindow,
    List<Tag>? tags,
    bool? transitEncryptionEnabled,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheClusterId'] = cacheClusterId;
    aZMode?.also((arg) => $request['AZMode'] = arg.toValue());
    authToken?.also((arg) => $request['AuthToken'] = arg);
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    cacheNodeType?.also((arg) => $request['CacheNodeType'] = arg);
    cacheParameterGroupName
        ?.also((arg) => $request['CacheParameterGroupName'] = arg);
    cacheSecurityGroupNames
        ?.also((arg) => $request['CacheSecurityGroupNames'] = arg);
    cacheSubnetGroupName?.also((arg) => $request['CacheSubnetGroupName'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    ipDiscovery?.also((arg) => $request['IpDiscovery'] = arg.toValue());
    logDeliveryConfigurations
        ?.also((arg) => $request['LogDeliveryConfigurations'] = arg);
    networkType?.also((arg) => $request['NetworkType'] = arg.toValue());
    notificationTopicArn?.also((arg) => $request['NotificationTopicArn'] = arg);
    numCacheNodes?.also((arg) => $request['NumCacheNodes'] = arg);
    outpostMode?.also((arg) => $request['OutpostMode'] = arg.toValue());
    port?.also((arg) => $request['Port'] = arg);
    preferredAvailabilityZone
        ?.also((arg) => $request['PreferredAvailabilityZone'] = arg);
    preferredAvailabilityZones
        ?.also((arg) => $request['PreferredAvailabilityZones'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    preferredOutpostArn?.also((arg) => $request['PreferredOutpostArn'] = arg);
    preferredOutpostArns?.also((arg) => $request['PreferredOutpostArns'] = arg);
    replicationGroupId?.also((arg) => $request['ReplicationGroupId'] = arg);
    securityGroupIds?.also((arg) => $request['SecurityGroupIds'] = arg);
    snapshotArns?.also((arg) => $request['SnapshotArns'] = arg);
    snapshotName?.also((arg) => $request['SnapshotName'] = arg);
    snapshotRetentionLimit
        ?.also((arg) => $request['SnapshotRetentionLimit'] = arg);
    snapshotWindow?.also((arg) => $request['SnapshotWindow'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    transitEncryptionEnabled
        ?.also((arg) => $request['TransitEncryptionEnabled'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateCacheCluster',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateCacheClusterMessage'],
      shapes: shapes,
      resultWrapper: 'CreateCacheClusterResult',
    );
    return CreateCacheClusterResult.fromXml($result);
  }

  /// Creates a new Amazon ElastiCache cache parameter group. An ElastiCache
  /// cache parameter group is a collection of parameters and their values that
  /// are applied to all of the nodes in any cluster or replication group using
  /// the CacheParameterGroup.
  ///
  /// A newly created CacheParameterGroup is an exact duplicate of the default
  /// parameter group for the CacheParameterGroupFamily. To customize the newly
  /// created CacheParameterGroup you can change the values of specific
  /// parameters. For more information, see:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyCacheParameterGroup.html">ModifyCacheParameterGroup</a>
  /// in the ElastiCache API Reference.
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html">Parameters
  /// and Parameter Groups</a> in the ElastiCache User Guide.
  /// </li>
  /// </ul>
  ///
  /// May throw [CacheParameterGroupQuotaExceededFault].
  /// May throw [CacheParameterGroupAlreadyExistsFault].
  /// May throw [InvalidCacheParameterGroupStateFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheParameterGroupFamily] :
  /// The name of the cache parameter group family that the cache parameter
  /// group can be used with.
  ///
  /// Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> |
  /// <code>memcached1.6</code> | <code>redis2.6</code> | <code>redis2.8</code>
  /// | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> |
  /// <code>redis6.x</code> | <code>redis7</code>
  ///
  /// Parameter [cacheParameterGroupName] :
  /// A user-specified name for the cache parameter group.
  ///
  /// Parameter [description] :
  /// A user-specified description for the cache parameter group.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<CreateCacheParameterGroupResult> createCacheParameterGroup({
    required String cacheParameterGroupFamily,
    required String cacheParameterGroupName,
    required String description,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheParameterGroupFamily'] = cacheParameterGroupFamily;
    $request['CacheParameterGroupName'] = cacheParameterGroupName;
    $request['Description'] = description;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateCacheParameterGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateCacheParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateCacheParameterGroupResult',
    );
    return CreateCacheParameterGroupResult.fromXml($result);
  }

  /// Creates a new cache security group. Use a cache security group to control
  /// access to one or more clusters.
  ///
  /// Cache security groups are only used when you are creating a cluster
  /// outside of an Amazon Virtual Private Cloud (Amazon VPC). If you are
  /// creating a cluster inside of a VPC, use a cache subnet group instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html">CreateCacheSubnetGroup</a>.
  ///
  /// May throw [CacheSecurityGroupAlreadyExistsFault].
  /// May throw [CacheSecurityGroupQuotaExceededFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheSecurityGroupName] :
  /// A name for the cache security group. This value is stored as a lowercase
  /// string.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters. Cannot
  /// be the word "Default".
  ///
  /// Example: <code>mysecuritygroup</code>
  ///
  /// Parameter [description] :
  /// A description for the cache security group.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<CreateCacheSecurityGroupResult> createCacheSecurityGroup({
    required String cacheSecurityGroupName,
    required String description,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheSecurityGroupName'] = cacheSecurityGroupName;
    $request['Description'] = description;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateCacheSecurityGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateCacheSecurityGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateCacheSecurityGroupResult',
    );
    return CreateCacheSecurityGroupResult.fromXml($result);
  }

  /// Creates a new cache subnet group.
  ///
  /// Use this parameter only when you are creating a cluster in an Amazon
  /// Virtual Private Cloud (Amazon VPC).
  ///
  /// May throw [CacheSubnetGroupAlreadyExistsFault].
  /// May throw [CacheSubnetGroupQuotaExceededFault].
  /// May throw [CacheSubnetQuotaExceededFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidSubnet].
  /// May throw [SubnetNotAllowedFault].
  ///
  /// Parameter [cacheSubnetGroupDescription] :
  /// A description for the cache subnet group.
  ///
  /// Parameter [cacheSubnetGroupName] :
  /// A name for the cache subnet group. This value is stored as a lowercase
  /// string.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters or
  /// hyphens.
  ///
  /// Example: <code>mysubnetgroup</code>
  ///
  /// Parameter [subnetIds] :
  /// A list of VPC subnet IDs for the cache subnet group.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<CreateCacheSubnetGroupResult> createCacheSubnetGroup({
    required String cacheSubnetGroupDescription,
    required String cacheSubnetGroupName,
    required List<String> subnetIds,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheSubnetGroupDescription'] = cacheSubnetGroupDescription;
    $request['CacheSubnetGroupName'] = cacheSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateCacheSubnetGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateCacheSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateCacheSubnetGroupResult',
    );
    return CreateCacheSubnetGroupResult.fromXml($result);
  }

  /// Global Datastore for Redis offers fully managed, fast, reliable and secure
  /// cross-region replication. Using Global Datastore for Redis, you can create
  /// cross-region read replica clusters for ElastiCache for Redis to enable
  /// low-latency reads and disaster recovery across regions. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Redis-Global-Datastore.html">Replication
  /// Across Regions Using Global Datastore</a>.
  ///
  /// <ul>
  /// <li>
  /// The <b>GlobalReplicationGroupIdSuffix</b> is the name of the Global
  /// datastore.
  /// </li>
  /// <li>
  /// The <b>PrimaryReplicationGroupId</b> represents the name of the primary
  /// cluster that accepts writes and will replicate updates to the secondary
  /// cluster.
  /// </li>
  /// </ul>
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [GlobalReplicationGroupAlreadyExistsFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [globalReplicationGroupIdSuffix] :
  /// The suffix name of a Global datastore. Amazon ElastiCache automatically
  /// applies a prefix to the Global datastore ID when it is created. Each
  /// Amazon Region has its own prefix. For instance, a Global datastore ID
  /// created in the US-West-1 region will begin with "dsdfu" along with the
  /// suffix name you provide. The suffix, combined with the auto-generated
  /// prefix, guarantees uniqueness of the Global datastore name across multiple
  /// regions.
  ///
  /// For a full list of Amazon Regions and their respective Global datastore iD
  /// prefixes, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Redis-Global-Datastores-CLI.html">Using
  /// the Amazon CLI with Global datastores </a>.
  ///
  /// Parameter [primaryReplicationGroupId] :
  /// The name of the primary cluster that accepts writes and will replicate
  /// updates to the secondary cluster.
  ///
  /// Parameter [globalReplicationGroupDescription] :
  /// Provides details of the Global datastore
  Future<CreateGlobalReplicationGroupResult> createGlobalReplicationGroup({
    required String globalReplicationGroupIdSuffix,
    required String primaryReplicationGroupId,
    String? globalReplicationGroupDescription,
  }) async {
    final $request = <String, dynamic>{};
    $request['GlobalReplicationGroupIdSuffix'] = globalReplicationGroupIdSuffix;
    $request['PrimaryReplicationGroupId'] = primaryReplicationGroupId;
    globalReplicationGroupDescription
        ?.also((arg) => $request['GlobalReplicationGroupDescription'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateGlobalReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateGlobalReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateGlobalReplicationGroupResult',
    );
    return CreateGlobalReplicationGroupResult.fromXml($result);
  }

  /// Creates a Redis (cluster mode disabled) or a Redis (cluster mode enabled)
  /// replication group.
  ///
  /// This API can be used to create a standalone regional replication group or
  /// a secondary replication group associated with a Global datastore.
  ///
  /// A Redis (cluster mode disabled) replication group is a collection of
  /// nodes, where one of the nodes is a read/write primary and the others are
  /// read-only replicas. Writes to the primary are asynchronously propagated to
  /// the replicas.
  ///
  /// A Redis cluster-mode enabled cluster is comprised of from 1 to 90 shards
  /// (API/CLI: node groups). Each shard has a primary node and up to 5
  /// read-only replica nodes. The configuration can range from 90 shards and 0
  /// replicas to 15 shards and 5 replicas, which is the maximum number or
  /// replicas allowed.
  ///
  /// The node or shard limit can be increased to a maximum of 500 per cluster
  /// if the Redis engine version is 5.0.6 or higher. For example, you can
  /// choose to configure a 500 node cluster that ranges between 83 shards (one
  /// primary and 5 replicas per shard) and 500 shards (single primary and no
  /// replicas). Make sure there are enough available IP addresses to
  /// accommodate the increase. Common pitfalls include the subnets in the
  /// subnet group have too small a CIDR range or the subnets are shared and
  /// heavily used by other clusters. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.Creating.html">Creating
  /// a Subnet Group</a>. For versions below 5.0.6, the limit is 250 per
  /// cluster.
  ///
  /// To request a limit increase, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">Amazon
  /// Service Limits</a> and choose the limit type <b>Nodes per cluster per
  /// instance type</b>.
  ///
  /// When a Redis (cluster mode disabled) replication group has been
  /// successfully created, you can add one or more read replicas to it, up to a
  /// total of 5 read replicas. If you need to increase or decrease the number
  /// of node groups (console: shards), you can avail yourself of ElastiCache
  /// for Redis' scaling. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Scaling.html">Scaling
  /// ElastiCache for Redis Clusters</a> in the <i>ElastiCache User Guide</i>.
  /// <note>
  /// This operation is valid for Redis only.
  /// </note>
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [ReplicationGroupAlreadyExistsFault].
  /// May throw [InvalidUserGroupStateFault].
  /// May throw [UserGroupNotFoundFault].
  /// May throw [InsufficientCacheClusterCapacityFault].
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [CacheSubnetGroupNotFoundFault].
  /// May throw [ClusterQuotaForCustomerExceededFault].
  /// May throw [NodeQuotaForClusterExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [NodeGroupsPerReplicationGroupQuotaExceededFault].
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [replicationGroupDescription] :
  /// A user-created description for the replication group.
  ///
  /// Parameter [replicationGroupId] :
  /// The replication group identifier. This parameter is stored as a lowercase
  /// string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// A name must contain from 1 to 40 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// A name cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [atRestEncryptionEnabled] :
  /// A flag that enables encryption at rest when set to <code>true</code>.
  ///
  /// You cannot modify the value of <code>AtRestEncryptionEnabled</code> after
  /// the replication group is created. To enable encryption at rest on a
  /// replication group you must set <code>AtRestEncryptionEnabled</code> to
  /// <code>true</code> when you create the replication group.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [authToken] :
  /// <b>Reserved parameter.</b> The password used to access a password
  /// protected server.
  ///
  /// <code>AuthToken</code> can be specified only on replication groups where
  /// <code>TransitEncryptionEnabled</code> is <code>true</code>.
  /// <important>
  /// For HIPAA compliance, you must specify
  /// <code>TransitEncryptionEnabled</code> as <code>true</code>, an
  /// <code>AuthToken</code>, and a <code>CacheSubnetGroup</code>.
  /// </important>
  /// Password constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be only printable ASCII characters.
  /// </li>
  /// <li>
  /// Must be at least 16 characters and no more than 128 characters in length.
  /// </li>
  /// <li>
  /// The only permitted printable special characters are !, &amp;, #, $, ^,
  /// &lt;, &gt;, and -. Other printable special characters cannot be used in
  /// the AUTH token.
  /// </li>
  /// </ul>
  /// For more information, see <a href="http://redis.io/commands/AUTH">AUTH
  /// password</a> at http://redis.io/commands/AUTH.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// If you are running Redis engine version 6.0 or later, set this parameter
  /// to yes if you want to opt-in to the next auto minor version upgrade
  /// campaign. This parameter is disabled for previous versions.
  ///
  /// Parameter [automaticFailoverEnabled] :
  /// Specifies whether a read-only replica is automatically promoted to
  /// read/write primary if the existing primary fails.
  ///
  /// <code>AutomaticFailoverEnabled</code> must be enabled for Redis (cluster
  /// mode enabled) replication groups.
  ///
  /// Default: false
  ///
  /// Parameter [cacheNodeType] :
  /// The compute and memory capacity of the nodes in the node group (shard).
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// <ul>
  /// <li>
  /// General purpose:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>M7g node types</b>: <code>cache.m7g.large</code>,
  /// <code>cache.m7g.xlarge</code>, <code>cache.m7g.2xlarge</code>,
  /// <code>cache.m7g.4xlarge</code>, <code>cache.m7g.8xlarge</code>,
  /// <code>cache.m7g.12xlarge</code>, <code>cache.m7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward):
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  ///
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T4g node types</b> (available only for Redis engine version 5.0.6
  /// onward and Memcached engine version 1.5.16 onward):
  /// <code>cache.t4g.micro</code>, <code>cache.t4g.small</code>,
  /// <code>cache.t4g.medium</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>T1 node types:</b> <code>cache.t1.micro</code>
  ///
  /// <b>M1 node types:</b> <code>cache.m1.small</code>,
  /// <code>cache.m1.medium</code>, <code>cache.m1.large</code>,
  /// <code>cache.m1.xlarge</code>
  ///
  /// <b>M3 node types:</b> <code>cache.m3.medium</code>,
  /// <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>,
  /// <code>cache.m3.2xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Compute optimized:
  ///
  /// <ul>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>C1 node types:</b> <code>cache.c1.xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Memory optimized:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>R7g node types</b>: <code>cache.r7g.large</code>,
  /// <code>cache.r7g.xlarge</code>, <code>cache.r7g.2xlarge</code>,
  /// <code>cache.r7g.4xlarge</code>, <code>cache.r7g.8xlarge</code>,
  /// <code>cache.r7g.12xlarge</code>, <code>cache.r7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward):
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  ///
  /// <b>R5 node types:</b> <code>cache.r5.large</code>,
  /// <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>,
  /// <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>,
  /// <code>cache.r5.24xlarge</code>
  ///
  /// <b>R4 node types:</b> <code>cache.r4.large</code>,
  /// <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>,
  /// <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>,
  /// <code>cache.r4.16xlarge</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>M2 node types:</b> <code>cache.m2.xlarge</code>,
  /// <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code>
  ///
  /// <b>R3 node types:</b> <code>cache.r3.large</code>,
  /// <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>,
  /// <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// <b>Additional node type info</b>
  ///
  /// <ul>
  /// <li>
  /// All current generation instance types are created in Amazon VPC by
  /// default.
  /// </li>
  /// <li>
  /// Redis append-only files (AOF) are not supported for T1 or T2 instances.
  /// </li>
  /// <li>
  /// Redis Multi-AZ with automatic failover is not supported on T1 instances.
  /// </li>
  /// <li>
  /// Redis configuration variables <code>appendonly</code> and
  /// <code>appendfsync</code> are not supported on Redis version 2.8.22 and
  /// later.
  /// </li>
  /// </ul>
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of the parameter group to associate with this replication group.
  /// If this argument is omitted, the default cache parameter group for the
  /// specified engine is used.
  ///
  /// If you are running Redis version 3.2.4 or later, only one node group
  /// (shard), and want to use a default parameter group, we recommend that you
  /// specify the parameter group by name.
  ///
  /// <ul>
  /// <li>
  /// To create a Redis (cluster mode disabled) replication group, use
  /// <code>CacheParameterGroupName=default.redis3.2</code>.
  /// </li>
  /// <li>
  /// To create a Redis (cluster mode enabled) replication group, use
  /// <code>CacheParameterGroupName=default.redis3.2.cluster.on</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [cacheSecurityGroupNames] :
  /// A list of cache security group names to associate with this replication
  /// group.
  ///
  /// Parameter [cacheSubnetGroupName] :
  /// The name of the cache subnet group to be used for the replication group.
  /// <important>
  /// If you're going to launch your cluster in an Amazon VPC, you need to
  /// create a subnet group before you start creating a cluster. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.html">Subnets
  /// and Subnet Groups</a>.
  /// </important>
  ///
  /// Parameter [clusterMode] :
  /// Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you
  /// must first set the cluster mode to Compatible. Compatible mode allows your
  /// Redis clients to connect using both cluster mode enabled and cluster mode
  /// disabled. After you migrate all Redis clients to use cluster mode enabled,
  /// you can then complete cluster mode configuration and set the cluster mode
  /// to Enabled.
  ///
  /// Parameter [dataTieringEnabled] :
  /// Enables data tiering. Data tiering is only supported for replication
  /// groups using the r6gd node type. This parameter must be set to true when
  /// using r6gd nodes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/data-tiering.html">Data
  /// tiering</a>.
  ///
  /// Parameter [engine] :
  /// The name of the cache engine to be used for the clusters in this
  /// replication group. The value must be set to <code>Redis</code>.
  ///
  /// Parameter [engineVersion] :
  /// The version number of the cache engine to be used for the clusters in this
  /// replication group. To view the supported cache engine versions, use the
  /// <code>DescribeCacheEngineVersions</code> operation.
  ///
  /// <b>Important:</b> You can upgrade to a newer engine version (see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement">Selecting
  /// a Cache Engine and Version</a>) in the <i>ElastiCache User Guide</i>, but
  /// you cannot downgrade to an earlier engine version. If you want to use an
  /// earlier engine version, you must delete the existing cluster or
  /// replication group and create it anew with the earlier engine version.
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global datastore
  ///
  /// Parameter [ipDiscovery] :
  /// The network type you choose when creating a replication group, either
  /// <code>ipv4</code> | <code>ipv6</code>. IPv6 is supported for workloads
  /// using Redis engine version 6.2 onward or Memcached engine version 1.6.6 on
  /// all instances built on the <a
  /// href="http://aws.amazon.com/ec2/nitro/">Nitro system</a>.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key used to encrypt the disk in the cluster.
  ///
  /// Parameter [logDeliveryConfigurations] :
  /// Specifies the destination, format and type of the logs.
  ///
  /// Parameter [multiAZEnabled] :
  /// A flag indicating if you have Multi-AZ enabled to enhance fault tolerance.
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html">Minimizing
  /// Downtime: Multi-AZ</a>.
  ///
  /// Parameter [networkType] :
  /// Must be either <code>ipv4</code> | <code>ipv6</code> |
  /// <code>dual_stack</code>. IPv6 is supported for workloads using Redis
  /// engine version 6.2 onward or Memcached engine version 1.6.6 on all
  /// instances built on the <a href="http://aws.amazon.com/ec2/nitro/">Nitro
  /// system</a>.
  ///
  /// Parameter [nodeGroupConfiguration] :
  /// A list of node group (shard) configuration options. Each node group
  /// (shard) configuration has the following members:
  /// <code>PrimaryAvailabilityZone</code>,
  /// <code>ReplicaAvailabilityZones</code>, <code>ReplicaCount</code>, and
  /// <code>Slots</code>.
  ///
  /// If you're creating a Redis (cluster mode disabled) or a Redis (cluster
  /// mode enabled) replication group, you can use this parameter to
  /// individually configure each node group (shard), or you can omit this
  /// parameter. However, it is required when seeding a Redis (cluster mode
  /// enabled) cluster from a S3 rdb file. You must configure each node group
  /// (shard) using this parameter because you must specify the slots for each
  /// node group.
  ///
  /// Parameter [notificationTopicArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// (SNS) topic to which notifications are sent.
  /// <note>
  /// The Amazon SNS topic owner must be the same as the cluster owner.
  /// </note>
  ///
  /// Parameter [numCacheClusters] :
  /// The number of clusters this replication group initially has.
  ///
  /// This parameter is not used if there is more than one node group (shard).
  /// You should use <code>ReplicasPerNodeGroup</code> instead.
  ///
  /// If <code>AutomaticFailoverEnabled</code> is <code>true</code>, the value
  /// of this parameter must be at least 2. If
  /// <code>AutomaticFailoverEnabled</code> is <code>false</code> you can omit
  /// this parameter (it will default to 1), or you can explicitly set it to a
  /// value between 2 and 6.
  ///
  /// The maximum permitted value for <code>NumCacheClusters</code> is 6 (1
  /// primary plus 5 replicas).
  ///
  /// Parameter [numNodeGroups] :
  /// An optional parameter that specifies the number of node groups (shards)
  /// for this Redis (cluster mode enabled) replication group. For Redis
  /// (cluster mode disabled) either omit this parameter or set it to 1.
  ///
  /// Default: 1
  ///
  /// Parameter [port] :
  /// The port number on which each member of the replication group accepts
  /// connections.
  ///
  /// Parameter [preferredCacheClusterAZs] :
  /// A list of EC2 Availability Zones in which the replication group's clusters
  /// are created. The order of the Availability Zones in the list is the order
  /// in which clusters are allocated. The primary cluster is created in the
  /// first AZ in the list.
  ///
  /// This parameter is not used if there is more than one node group (shard).
  /// You should use <code>NodeGroupConfiguration</code> instead.
  /// <note>
  /// If you are creating your replication group in an Amazon VPC (recommended),
  /// you can only locate clusters in Availability Zones associated with the
  /// subnets in the selected subnet group.
  ///
  /// The number of Availability Zones listed must equal the value of
  /// <code>NumCacheClusters</code>.
  /// </note>
  /// Default: system chosen Availability Zones.
  ///
  /// Parameter [preferredMaintenanceWindow] :
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
  /// Parameter [primaryClusterId] :
  /// The identifier of the cluster that serves as the primary for this
  /// replication group. This cluster must already exist and have a status of
  /// <code>available</code>.
  ///
  /// This parameter is not required if <code>NumCacheClusters</code>,
  /// <code>NumNodeGroups</code>, or <code>ReplicasPerNodeGroup</code> is
  /// specified.
  ///
  /// Parameter [replicasPerNodeGroup] :
  /// An optional parameter that specifies the number of replica nodes in each
  /// node group (shard). Valid values are 0 to 5.
  ///
  /// Parameter [securityGroupIds] :
  /// One or more Amazon VPC security groups associated with this replication
  /// group.
  ///
  /// Use this parameter only when you are creating a replication group in an
  /// Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// Parameter [serverlessCacheSnapshotName] :
  /// The name of the snapshot used to create a replication group. Available for
  /// Redis only.
  ///
  /// Parameter [snapshotArns] :
  /// A list of Amazon Resource Names (ARN) that uniquely identify the Redis RDB
  /// snapshot files stored in Amazon S3. The snapshot files are used to
  /// populate the new replication group. The Amazon S3 object name in the ARN
  /// cannot contain any commas. The new replication group will have the number
  /// of node groups (console: shards) specified by the parameter
  /// <i>NumNodeGroups</i> or the number of node groups configured by
  /// <i>NodeGroupConfiguration</i> regardless of the number of ARNs specified
  /// here.
  ///
  /// Example of an Amazon S3 ARN:
  /// <code>arn:aws:s3:::my_bucket/snapshot1.rdb</code>
  ///
  /// Parameter [snapshotName] :
  /// The name of a snapshot from which to restore data into the new replication
  /// group. The snapshot status changes to <code>restoring</code> while the new
  /// replication group is being created.
  ///
  /// Parameter [snapshotRetentionLimit] :
  /// The number of days for which ElastiCache retains automatic snapshots
  /// before deleting them. For example, if you set
  /// <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today
  /// is retained for 5 days before being deleted.
  ///
  /// Default: 0 (i.e., automatic backups are disabled for this cluster).
  ///
  /// Parameter [snapshotWindow] :
  /// The daily time range (in UTC) during which ElastiCache begins taking a
  /// daily snapshot of your node group (shard).
  ///
  /// Example: <code>05:00-09:00</code>
  ///
  /// If you do not specify this parameter, ElastiCache automatically chooses an
  /// appropriate time range.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. Tags are comma-separated
  /// key,value pairs (e.g. Key=<code>myKey</code>,
  /// Value=<code>myKeyValue</code>. You can include multiple tags as shown
  /// following: Key=<code>myKey</code>, Value=<code>myKeyValue</code>
  /// Key=<code>mySecondKey</code>, Value=<code>mySecondKeyValue</code>. Tags on
  /// replication groups will be replicated to all nodes.
  ///
  /// Parameter [transitEncryptionEnabled] :
  /// A flag that enables in-transit encryption when set to <code>true</code>.
  ///
  /// This parameter is valid only if the <code>Engine</code> parameter is
  /// <code>redis</code>, the <code>EngineVersion</code> parameter is
  /// <code>3.2.6</code>, <code>4.x</code> or later, and the cluster is being
  /// created in an Amazon VPC.
  ///
  /// If you enable in-transit encryption, you must also specify a value for
  /// <code>CacheSubnetGroup</code>.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  ///
  /// Default: <code>false</code>
  /// <important>
  /// For HIPAA compliance, you must specify
  /// <code>TransitEncryptionEnabled</code> as <code>true</code>, an
  /// <code>AuthToken</code>, and a <code>CacheSubnetGroup</code>.
  /// </important>
  ///
  /// Parameter [transitEncryptionMode] :
  /// A setting that allows you to migrate your clients to use in-transit
  /// encryption, with no downtime.
  ///
  /// When setting <code>TransitEncryptionEnabled</code> to <code>true</code>,
  /// you can set your <code>TransitEncryptionMode</code> to
  /// <code>preferred</code> in the same request, to allow both encrypted and
  /// unencrypted connections at the same time. Once you migrate all your Redis
  /// clients to use encrypted connections you can modify the value to
  /// <code>required</code> to allow encrypted connections only.
  ///
  /// Setting <code>TransitEncryptionMode</code> to <code>required</code> is a
  /// two-step process that requires you to first set the
  /// <code>TransitEncryptionMode</code> to <code>preferred</code>, after that
  /// you can set <code>TransitEncryptionMode</code> to <code>required</code>.
  ///
  /// This process will not trigger the replacement of the replication group.
  ///
  /// Parameter [userGroupIds] :
  /// The user group to associate with the replication group.
  Future<CreateReplicationGroupResult> createReplicationGroup({
    required String replicationGroupDescription,
    required String replicationGroupId,
    bool? atRestEncryptionEnabled,
    String? authToken,
    bool? autoMinorVersionUpgrade,
    bool? automaticFailoverEnabled,
    String? cacheNodeType,
    String? cacheParameterGroupName,
    List<String>? cacheSecurityGroupNames,
    String? cacheSubnetGroupName,
    ClusterMode? clusterMode,
    bool? dataTieringEnabled,
    String? engine,
    String? engineVersion,
    String? globalReplicationGroupId,
    IpDiscovery? ipDiscovery,
    String? kmsKeyId,
    List<LogDeliveryConfigurationRequest>? logDeliveryConfigurations,
    bool? multiAZEnabled,
    NetworkType? networkType,
    List<NodeGroupConfiguration>? nodeGroupConfiguration,
    String? notificationTopicArn,
    int? numCacheClusters,
    int? numNodeGroups,
    int? port,
    List<String>? preferredCacheClusterAZs,
    String? preferredMaintenanceWindow,
    String? primaryClusterId,
    int? replicasPerNodeGroup,
    List<String>? securityGroupIds,
    String? serverlessCacheSnapshotName,
    List<String>? snapshotArns,
    String? snapshotName,
    int? snapshotRetentionLimit,
    String? snapshotWindow,
    List<Tag>? tags,
    bool? transitEncryptionEnabled,
    TransitEncryptionMode? transitEncryptionMode,
    List<String>? userGroupIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['ReplicationGroupDescription'] = replicationGroupDescription;
    $request['ReplicationGroupId'] = replicationGroupId;
    atRestEncryptionEnabled
        ?.also((arg) => $request['AtRestEncryptionEnabled'] = arg);
    authToken?.also((arg) => $request['AuthToken'] = arg);
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    automaticFailoverEnabled
        ?.also((arg) => $request['AutomaticFailoverEnabled'] = arg);
    cacheNodeType?.also((arg) => $request['CacheNodeType'] = arg);
    cacheParameterGroupName
        ?.also((arg) => $request['CacheParameterGroupName'] = arg);
    cacheSecurityGroupNames
        ?.also((arg) => $request['CacheSecurityGroupNames'] = arg);
    cacheSubnetGroupName?.also((arg) => $request['CacheSubnetGroupName'] = arg);
    clusterMode?.also((arg) => $request['ClusterMode'] = arg.toValue());
    dataTieringEnabled?.also((arg) => $request['DataTieringEnabled'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    globalReplicationGroupId
        ?.also((arg) => $request['GlobalReplicationGroupId'] = arg);
    ipDiscovery?.also((arg) => $request['IpDiscovery'] = arg.toValue());
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    logDeliveryConfigurations
        ?.also((arg) => $request['LogDeliveryConfigurations'] = arg);
    multiAZEnabled?.also((arg) => $request['MultiAZEnabled'] = arg);
    networkType?.also((arg) => $request['NetworkType'] = arg.toValue());
    nodeGroupConfiguration
        ?.also((arg) => $request['NodeGroupConfiguration'] = arg);
    notificationTopicArn?.also((arg) => $request['NotificationTopicArn'] = arg);
    numCacheClusters?.also((arg) => $request['NumCacheClusters'] = arg);
    numNodeGroups?.also((arg) => $request['NumNodeGroups'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredCacheClusterAZs
        ?.also((arg) => $request['PreferredCacheClusterAZs'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    primaryClusterId?.also((arg) => $request['PrimaryClusterId'] = arg);
    replicasPerNodeGroup?.also((arg) => $request['ReplicasPerNodeGroup'] = arg);
    securityGroupIds?.also((arg) => $request['SecurityGroupIds'] = arg);
    serverlessCacheSnapshotName
        ?.also((arg) => $request['ServerlessCacheSnapshotName'] = arg);
    snapshotArns?.also((arg) => $request['SnapshotArns'] = arg);
    snapshotName?.also((arg) => $request['SnapshotName'] = arg);
    snapshotRetentionLimit
        ?.also((arg) => $request['SnapshotRetentionLimit'] = arg);
    snapshotWindow?.also((arg) => $request['SnapshotWindow'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    transitEncryptionEnabled
        ?.also((arg) => $request['TransitEncryptionEnabled'] = arg);
    transitEncryptionMode
        ?.also((arg) => $request['TransitEncryptionMode'] = arg.toValue());
    userGroupIds?.also((arg) => $request['UserGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateReplicationGroupResult',
    );
    return CreateReplicationGroupResult.fromXml($result);
  }

  /// Creates a serverless cache.
  ///
  /// May throw [ServerlessCacheNotFoundFault].
  /// May throw [InvalidServerlessCacheStateFault].
  /// May throw [ServerlessCacheAlreadyExistsFault].
  /// May throw [ServerlessCacheQuotaForCustomerExceededFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidCredentialsException].
  /// May throw [InvalidUserGroupStateFault].
  /// May throw [UserGroupNotFoundFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [engine] :
  /// The name of the cache engine to be used for creating the serverless cache.
  ///
  /// Parameter [serverlessCacheName] :
  /// User-provided identifier for the serverless cache. This parameter is
  /// stored as a lowercase string.
  ///
  /// Parameter [cacheUsageLimits] :
  /// Sets the cache usage limits for storage and ElastiCache Processing Units
  /// for the cache.
  ///
  /// Parameter [dailySnapshotTime] :
  /// The daily time that snapshots will be created from the new serverless
  /// cache. By default this number is populated with 0, i.e. no snapshots will
  /// be created on an automatic daily basis. Available for Redis only.
  ///
  /// Parameter [description] :
  /// User-provided description for the serverless cache. The default is NULL,
  /// i.e. if no description is provided then an empty string will be returned.
  /// The maximum length is 255 characters.
  ///
  /// Parameter [kmsKeyId] :
  /// ARN of the customer managed key for encrypting the data at rest. If no KMS
  /// key is provided, a default service key is used.
  ///
  /// Parameter [majorEngineVersion] :
  /// The version of the cache engine that will be used to create the serverless
  /// cache.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of the one or more VPC security groups to be associated with the
  /// serverless cache. The security group will authorize traffic access for the
  /// VPC end-point (private-link). If no other information is given this will
  /// be the VPC’s Default Security Group that is associated with the cluster
  /// VPC end-point.
  ///
  /// Parameter [snapshotArnsToRestore] :
  /// The ARN(s) of the snapshot that the new serverless cache will be created
  /// from. Available for Redis only.
  ///
  /// Parameter [snapshotRetentionLimit] :
  /// The number of snapshots that will be retained for the serverless cache
  /// that is being created. As new snapshots beyond this limit are added, the
  /// oldest snapshots will be deleted on a rolling basis. Available for Redis
  /// only.
  ///
  /// Parameter [subnetIds] :
  /// A list of the identifiers of the subnets where the VPC endpoint for the
  /// serverless cache will be deployed. All the subnetIds must belong to the
  /// same VPC.
  ///
  /// Parameter [tags] :
  /// The list of tags (key, value) pairs to be added to the serverless cache
  /// resource. Default is NULL.
  ///
  /// Parameter [userGroupId] :
  /// The identifier of the UserGroup to be associated with the serverless
  /// cache. Available for Redis only. Default is NULL.
  Future<CreateServerlessCacheResponse> createServerlessCache({
    required String engine,
    required String serverlessCacheName,
    CacheUsageLimits? cacheUsageLimits,
    String? dailySnapshotTime,
    String? description,
    String? kmsKeyId,
    String? majorEngineVersion,
    List<String>? securityGroupIds,
    List<String>? snapshotArnsToRestore,
    int? snapshotRetentionLimit,
    List<String>? subnetIds,
    List<Tag>? tags,
    String? userGroupId,
  }) async {
    final $request = <String, dynamic>{};
    $request['Engine'] = engine;
    $request['ServerlessCacheName'] = serverlessCacheName;
    cacheUsageLimits?.also((arg) => $request['CacheUsageLimits'] = arg);
    dailySnapshotTime?.also((arg) => $request['DailySnapshotTime'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    majorEngineVersion?.also((arg) => $request['MajorEngineVersion'] = arg);
    securityGroupIds?.also((arg) => $request['SecurityGroupIds'] = arg);
    snapshotArnsToRestore
        ?.also((arg) => $request['SnapshotArnsToRestore'] = arg);
    snapshotRetentionLimit
        ?.also((arg) => $request['SnapshotRetentionLimit'] = arg);
    subnetIds?.also((arg) => $request['SubnetIds'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    userGroupId?.also((arg) => $request['UserGroupId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateServerlessCache',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateServerlessCacheRequest'],
      shapes: shapes,
      resultWrapper: 'CreateServerlessCacheResult',
    );
    return CreateServerlessCacheResponse.fromXml($result);
  }

  /// This API creates a copy of an entire ServerlessCache at a specific moment
  /// in time. Available for Redis only.
  ///
  /// May throw [ServerlessCacheSnapshotAlreadyExistsFault].
  /// May throw [ServerlessCacheNotFoundFault].
  /// May throw [InvalidServerlessCacheStateFault].
  /// May throw [ServerlessCacheSnapshotQuotaExceededFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [serverlessCacheName] :
  /// The name of an existing serverless cache. The snapshot is created from
  /// this cache. Available for Redis only.
  ///
  /// Parameter [serverlessCacheSnapshotName] :
  /// The name for the snapshot being created. Must be unique for the customer
  /// account. Available for Redis only. Must be between 1 and 255 characters.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key used to encrypt the snapshot. Available for Redis
  /// only. Default: NULL
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to the snapshot resource. A tag is a key-value
  /// pair. Available for Redis only.
  Future<CreateServerlessCacheSnapshotResponse> createServerlessCacheSnapshot({
    required String serverlessCacheName,
    required String serverlessCacheSnapshotName,
    String? kmsKeyId,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ServerlessCacheName'] = serverlessCacheName;
    $request['ServerlessCacheSnapshotName'] = serverlessCacheSnapshotName;
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateServerlessCacheSnapshot',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateServerlessCacheSnapshotRequest'],
      shapes: shapes,
      resultWrapper: 'CreateServerlessCacheSnapshotResult',
    );
    return CreateServerlessCacheSnapshotResponse.fromXml($result);
  }

  /// Creates a copy of an entire cluster or replication group at a specific
  /// moment in time.
  /// <note>
  /// This operation is valid for Redis only.
  /// </note>
  ///
  /// May throw [SnapshotAlreadyExistsFault].
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [SnapshotFeatureNotSupportedFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [snapshotName] :
  /// A name for the snapshot being created.
  ///
  /// Parameter [cacheClusterId] :
  /// The identifier of an existing cluster. The snapshot is created from this
  /// cluster.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key used to encrypt the snapshot.
  ///
  /// Parameter [replicationGroupId] :
  /// The identifier of an existing replication group. The snapshot is created
  /// from this replication group.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<CreateSnapshotResult> createSnapshot({
    required String snapshotName,
    String? cacheClusterId,
    String? kmsKeyId,
    String? replicationGroupId,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SnapshotName'] = snapshotName;
    cacheClusterId?.also((arg) => $request['CacheClusterId'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    replicationGroupId?.also((arg) => $request['ReplicationGroupId'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateSnapshot',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CreateSnapshotResult',
    );
    return CreateSnapshotResult.fromXml($result);
  }

  /// For Redis engine version 6.0 onwards: Creates a Redis user. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using
  /// Role Based Access Control (RBAC)</a>.
  ///
  /// May throw [UserAlreadyExistsFault].
  /// May throw [UserQuotaExceededFault].
  /// May throw [DuplicateUserNameFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [TagQuotaPerResourceExceeded].
  ///
  /// Parameter [accessString] :
  /// Access permissions string used for this user.
  ///
  /// Parameter [engine] :
  /// The current supported value is Redis.
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [userName] :
  /// The username of the user.
  ///
  /// Parameter [authenticationMode] :
  /// Specifies how to authenticate the user.
  ///
  /// Parameter [noPasswordRequired] :
  /// Indicates a password is not required for this user.
  ///
  /// Parameter [passwords] :
  /// Passwords used for this user. You can create up to two passwords for each
  /// user.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<User> createUser({
    required String accessString,
    required String engine,
    required String userId,
    required String userName,
    AuthenticationMode? authenticationMode,
    bool? noPasswordRequired,
    List<String>? passwords,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['AccessString'] = accessString;
    $request['Engine'] = engine;
    $request['UserId'] = userId;
    $request['UserName'] = userName;
    authenticationMode?.also((arg) => $request['AuthenticationMode'] = arg);
    noPasswordRequired?.also((arg) => $request['NoPasswordRequired'] = arg);
    passwords?.also((arg) => $request['Passwords'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateUser',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateUserMessage'],
      shapes: shapes,
      resultWrapper: 'CreateUserResult',
    );
    return User.fromXml($result);
  }

  /// For Redis engine version 6.0 onwards: Creates a Redis user group. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using
  /// Role Based Access Control (RBAC)</a>
  ///
  /// May throw [UserNotFoundFault].
  /// May throw [DuplicateUserNameFault].
  /// May throw [UserGroupAlreadyExistsFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [DefaultUserRequired].
  /// May throw [UserGroupQuotaExceededFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [TagQuotaPerResourceExceeded].
  ///
  /// Parameter [engine] :
  /// The current supported value is Redis.
  ///
  /// Parameter [userGroupId] :
  /// The ID of the user group.
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  /// Available for Redis only.
  ///
  /// Parameter [userIds] :
  /// The list of user IDs that belong to the user group.
  Future<UserGroup> createUserGroup({
    required String engine,
    required String userGroupId,
    List<Tag>? tags,
    List<String>? userIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['Engine'] = engine;
    $request['UserGroupId'] = userGroupId;
    tags?.also((arg) => $request['Tags'] = arg);
    userIds?.also((arg) => $request['UserIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateUserGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateUserGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateUserGroupResult',
    );
    return UserGroup.fromXml($result);
  }

  /// Decreases the number of node groups in a Global datastore
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [applyImmediately] :
  /// Indicates that the shard reconfiguration process begins immediately. At
  /// present, the only permitted value for this parameter is true.
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global datastore
  ///
  /// Parameter [nodeGroupCount] :
  /// The number of node groups (shards) that results from the modification of
  /// the shard configuration
  ///
  /// Parameter [globalNodeGroupsToRemove] :
  /// If the value of NodeGroupCount is less than the current number of node
  /// groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is
  /// required. GlobalNodeGroupsToRemove is a list of NodeGroupIds to remove
  /// from the cluster. ElastiCache for Redis will attempt to remove all node
  /// groups listed by GlobalNodeGroupsToRemove from the cluster.
  ///
  /// Parameter [globalNodeGroupsToRetain] :
  /// If the value of NodeGroupCount is less than the current number of node
  /// groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is
  /// required. GlobalNodeGroupsToRetain is a list of NodeGroupIds to retain
  /// from the cluster. ElastiCache for Redis will attempt to retain all node
  /// groups listed by GlobalNodeGroupsToRetain from the cluster.
  Future<DecreaseNodeGroupsInGlobalReplicationGroupResult>
      decreaseNodeGroupsInGlobalReplicationGroup({
    required bool applyImmediately,
    required String globalReplicationGroupId,
    required int nodeGroupCount,
    List<String>? globalNodeGroupsToRemove,
    List<String>? globalNodeGroupsToRetain,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplyImmediately'] = applyImmediately;
    $request['GlobalReplicationGroupId'] = globalReplicationGroupId;
    $request['NodeGroupCount'] = nodeGroupCount;
    globalNodeGroupsToRemove
        ?.also((arg) => $request['GlobalNodeGroupsToRemove'] = arg);
    globalNodeGroupsToRetain
        ?.also((arg) => $request['GlobalNodeGroupsToRetain'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DecreaseNodeGroupsInGlobalReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DecreaseNodeGroupsInGlobalReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'DecreaseNodeGroupsInGlobalReplicationGroupResult',
    );
    return DecreaseNodeGroupsInGlobalReplicationGroupResult.fromXml($result);
  }

  /// Dynamically decreases the number of replicas in a Redis (cluster mode
  /// disabled) replication group or the number of replica nodes in one or more
  /// node groups (shards) of a Redis (cluster mode enabled) replication group.
  /// This operation is performed with no cluster down time.
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InsufficientCacheClusterCapacityFault].
  /// May throw [ClusterQuotaForCustomerExceededFault].
  /// May throw [NodeGroupsPerReplicationGroupQuotaExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [NoOperationFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [applyImmediately] :
  /// If <code>True</code>, the number of replica nodes is decreased
  /// immediately. <code>ApplyImmediately=False</code> is not currently
  /// supported.
  ///
  /// Parameter [replicationGroupId] :
  /// The id of the replication group from which you want to remove replica
  /// nodes.
  ///
  /// Parameter [newReplicaCount] :
  /// The number of read replica nodes you want at the completion of this
  /// operation. For Redis (cluster mode disabled) replication groups, this is
  /// the number of replica nodes in the replication group. For Redis (cluster
  /// mode enabled) replication groups, this is the number of replica nodes in
  /// each of the replication group's node groups.
  ///
  /// The minimum number of replicas in a shard or replication group is:
  ///
  /// <ul>
  /// <li>
  /// Redis (cluster mode disabled)
  ///
  /// <ul>
  /// <li>
  /// If Multi-AZ is enabled: 1
  /// </li>
  /// <li>
  /// If Multi-AZ is not enabled: 0
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Redis (cluster mode enabled): 0 (though you will not be able to failover
  /// to a replica if your primary node fails)
  /// </li>
  /// </ul>
  ///
  /// Parameter [replicaConfiguration] :
  /// A list of <code>ConfigureShard</code> objects that can be used to
  /// configure each shard in a Redis (cluster mode enabled) replication group.
  /// The <code>ConfigureShard</code> has three members:
  /// <code>NewReplicaCount</code>, <code>NodeGroupId</code>, and
  /// <code>PreferredAvailabilityZones</code>.
  ///
  /// Parameter [replicasToRemove] :
  /// A list of the node ids to remove from the replication group or node group
  /// (shard).
  Future<DecreaseReplicaCountResult> decreaseReplicaCount({
    required bool applyImmediately,
    required String replicationGroupId,
    int? newReplicaCount,
    List<ConfigureShard>? replicaConfiguration,
    List<String>? replicasToRemove,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplyImmediately'] = applyImmediately;
    $request['ReplicationGroupId'] = replicationGroupId;
    newReplicaCount?.also((arg) => $request['NewReplicaCount'] = arg);
    replicaConfiguration?.also((arg) => $request['ReplicaConfiguration'] = arg);
    replicasToRemove?.also((arg) => $request['ReplicasToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DecreaseReplicaCount',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DecreaseReplicaCountMessage'],
      shapes: shapes,
      resultWrapper: 'DecreaseReplicaCountResult',
    );
    return DecreaseReplicaCountResult.fromXml($result);
  }

  /// Deletes a previously provisioned cluster. <code>DeleteCacheCluster</code>
  /// deletes all associated cache nodes, node endpoints and the cluster itself.
  /// When you receive a successful response from this operation, Amazon
  /// ElastiCache immediately begins deleting the cluster; you cannot cancel or
  /// revert this operation.
  ///
  /// This operation is not valid for:
  ///
  /// <ul>
  /// <li>
  /// Redis (cluster mode enabled) clusters
  /// </li>
  /// <li>
  /// Redis (cluster mode disabled) clusters
  /// </li>
  /// <li>
  /// A cluster that is the last read replica of a replication group
  /// </li>
  /// <li>
  /// A cluster that is the primary node of a replication group
  /// </li>
  /// <li>
  /// A node group (shard) that has Multi-AZ mode enabled
  /// </li>
  /// <li>
  /// A cluster from a Redis (cluster mode enabled) replication group
  /// </li>
  /// <li>
  /// A cluster that is not in the <code>available</code> state
  /// </li>
  /// </ul>
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [SnapshotAlreadyExistsFault].
  /// May throw [SnapshotFeatureNotSupportedFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheClusterId] :
  /// The cluster identifier for the cluster to be deleted. This parameter is
  /// not case sensitive.
  ///
  /// Parameter [finalSnapshotIdentifier] :
  /// The user-supplied name of a final cluster snapshot. This is the unique
  /// name that identifies the snapshot. ElastiCache creates the snapshot, and
  /// then deletes the cluster immediately afterward.
  Future<DeleteCacheClusterResult> deleteCacheCluster({
    required String cacheClusterId,
    String? finalSnapshotIdentifier,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheClusterId'] = cacheClusterId;
    finalSnapshotIdentifier
        ?.also((arg) => $request['FinalSnapshotIdentifier'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteCacheCluster',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteCacheClusterMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteCacheClusterResult',
    );
    return DeleteCacheClusterResult.fromXml($result);
  }

  /// Deletes the specified cache parameter group. You cannot delete a cache
  /// parameter group if it is associated with any cache clusters. You cannot
  /// delete the default cache parameter groups in your account.
  ///
  /// May throw [InvalidCacheParameterGroupStateFault].
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of the cache parameter group to delete.
  /// <note>
  /// The specified cache security group must not be associated with any
  /// clusters.
  /// </note>
  Future<void> deleteCacheParameterGroup({
    required String cacheParameterGroupName,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheParameterGroupName'] = cacheParameterGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteCacheParameterGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteCacheParameterGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a cache security group.
  /// <note>
  /// You cannot delete a cache security group if it is associated with any
  /// clusters.
  /// </note>
  ///
  /// May throw [InvalidCacheSecurityGroupStateFault].
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheSecurityGroupName] :
  /// The name of the cache security group to delete.
  /// <note>
  /// You cannot delete the default security group.
  /// </note>
  Future<void> deleteCacheSecurityGroup({
    required String cacheSecurityGroupName,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheSecurityGroupName'] = cacheSecurityGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteCacheSecurityGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteCacheSecurityGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deletes a cache subnet group.
  /// <note>
  /// You cannot delete a default cache subnet group or one that is associated
  /// with any clusters.
  /// </note>
  ///
  /// May throw [CacheSubnetGroupInUse].
  /// May throw [CacheSubnetGroupNotFoundFault].
  ///
  /// Parameter [cacheSubnetGroupName] :
  /// The name of the cache subnet group to delete.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters or
  /// hyphens.
  Future<void> deleteCacheSubnetGroup({
    required String cacheSubnetGroupName,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheSubnetGroupName'] = cacheSubnetGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteCacheSubnetGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteCacheSubnetGroupMessage'],
      shapes: shapes,
    );
  }

  /// Deleting a Global datastore is a two-step process:
  ///
  /// <ul>
  /// <li>
  /// First, you must <a>DisassociateGlobalReplicationGroup</a> to remove the
  /// secondary clusters in the Global datastore.
  /// </li>
  /// <li>
  /// Once the Global datastore contains only the primary cluster, you can use
  /// the <code>DeleteGlobalReplicationGroup</code> API to delete the Global
  /// datastore while retainining the primary cluster using
  /// <code>RetainPrimaryReplicationGroup=true</code>.
  /// </li>
  /// </ul>
  /// Since the Global Datastore has only a primary cluster, you can delete the
  /// Global Datastore while retaining the primary by setting
  /// <code>RetainPrimaryReplicationGroup=true</code>. The primary cluster is
  /// never deleted when deleting a Global Datastore. It can only be deleted
  /// when it no longer is associated with any Global Datastore.
  ///
  /// When you receive a successful response from this operation, Amazon
  /// ElastiCache immediately begins deleting the selected resources; you cannot
  /// cancel or revert this operation.
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global datastore
  ///
  /// Parameter [retainPrimaryReplicationGroup] :
  /// The primary replication group is retained as a standalone replication
  /// group.
  Future<DeleteGlobalReplicationGroupResult> deleteGlobalReplicationGroup({
    required String globalReplicationGroupId,
    required bool retainPrimaryReplicationGroup,
  }) async {
    final $request = <String, dynamic>{};
    $request['GlobalReplicationGroupId'] = globalReplicationGroupId;
    $request['RetainPrimaryReplicationGroup'] = retainPrimaryReplicationGroup;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteGlobalReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteGlobalReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteGlobalReplicationGroupResult',
    );
    return DeleteGlobalReplicationGroupResult.fromXml($result);
  }

  /// Deletes an existing replication group. By default, this operation deletes
  /// the entire replication group, including the primary/primaries and all of
  /// the read replicas. If the replication group has only one primary, you can
  /// optionally delete only the read replicas, while retaining the primary by
  /// setting <code>RetainPrimaryCluster=true</code>.
  ///
  /// When you receive a successful response from this operation, Amazon
  /// ElastiCache immediately begins deleting the selected resources; you cannot
  /// cancel or revert this operation.
  /// <note>
  /// This operation is valid for Redis only.
  /// </note>
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [SnapshotAlreadyExistsFault].
  /// May throw [SnapshotFeatureNotSupportedFault].
  /// May throw [SnapshotQuotaExceededFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [replicationGroupId] :
  /// The identifier for the cluster to be deleted. This parameter is not case
  /// sensitive.
  ///
  /// Parameter [finalSnapshotIdentifier] :
  /// The name of a final node group (shard) snapshot. ElastiCache creates the
  /// snapshot from the primary node in the cluster, rather than one of the
  /// replicas; this is to ensure that it captures the freshest data. After the
  /// final snapshot is taken, the replication group is immediately deleted.
  ///
  /// Parameter [retainPrimaryCluster] :
  /// If set to <code>true</code>, all of the read replicas are deleted, but the
  /// primary node is retained.
  Future<DeleteReplicationGroupResult> deleteReplicationGroup({
    required String replicationGroupId,
    String? finalSnapshotIdentifier,
    bool? retainPrimaryCluster,
  }) async {
    final $request = <String, dynamic>{};
    $request['ReplicationGroupId'] = replicationGroupId;
    finalSnapshotIdentifier
        ?.also((arg) => $request['FinalSnapshotIdentifier'] = arg);
    retainPrimaryCluster?.also((arg) => $request['RetainPrimaryCluster'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteReplicationGroupResult',
    );
    return DeleteReplicationGroupResult.fromXml($result);
  }

  /// Deletes a specified existing serverless cache.
  ///
  /// May throw [ServerlessCacheNotFoundFault].
  /// May throw [InvalidServerlessCacheStateFault].
  /// May throw [ServerlessCacheSnapshotAlreadyExistsFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidCredentialsException].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [serverlessCacheName] :
  /// The identifier of the serverless cache to be deleted.
  ///
  /// Parameter [finalSnapshotName] :
  /// Name of the final snapshot to be taken before the serverless cache is
  /// deleted. Available for Redis only. Default: NULL, i.e. a final snapshot is
  /// not taken.
  Future<DeleteServerlessCacheResponse> deleteServerlessCache({
    required String serverlessCacheName,
    String? finalSnapshotName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ServerlessCacheName'] = serverlessCacheName;
    finalSnapshotName?.also((arg) => $request['FinalSnapshotName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteServerlessCache',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteServerlessCacheRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteServerlessCacheResult',
    );
    return DeleteServerlessCacheResponse.fromXml($result);
  }

  /// Deletes an existing serverless cache snapshot. Available for Redis only.
  ///
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [ServerlessCacheSnapshotNotFoundFault].
  /// May throw [InvalidServerlessCacheSnapshotStateFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [serverlessCacheSnapshotName] :
  /// Idenfitier of the snapshot to be deleted. Available for Redis only.
  Future<DeleteServerlessCacheSnapshotResponse> deleteServerlessCacheSnapshot({
    required String serverlessCacheSnapshotName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ServerlessCacheSnapshotName'] = serverlessCacheSnapshotName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteServerlessCacheSnapshot',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteServerlessCacheSnapshotRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteServerlessCacheSnapshotResult',
    );
    return DeleteServerlessCacheSnapshotResponse.fromXml($result);
  }

  /// Deletes an existing snapshot. When you receive a successful response from
  /// this operation, ElastiCache immediately begins deleting the snapshot; you
  /// cannot cancel or revert this operation.
  /// <note>
  /// This operation is valid for Redis only.
  /// </note>
  ///
  /// May throw [SnapshotNotFoundFault].
  /// May throw [InvalidSnapshotStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [snapshotName] :
  /// The name of the snapshot to be deleted.
  Future<DeleteSnapshotResult> deleteSnapshot({
    required String snapshotName,
  }) async {
    final $request = <String, dynamic>{};
    $request['SnapshotName'] = snapshotName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteSnapshot',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteSnapshotResult',
    );
    return DeleteSnapshotResult.fromXml($result);
  }

  /// For Redis engine version 6.0 onwards: Deletes a user. The user will be
  /// removed from all user groups and in turn removed from all replication
  /// groups. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using
  /// Role Based Access Control (RBAC)</a>.
  ///
  /// May throw [InvalidUserStateFault].
  /// May throw [UserNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [DefaultUserAssociatedToUserGroupFault].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  Future<User> deleteUser({
    required String userId,
  }) async {
    final $request = <String, dynamic>{};
    $request['UserId'] = userId;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteUser',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteUserMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteUserResult',
    );
    return User.fromXml($result);
  }

  /// For Redis engine version 6.0 onwards: Deletes a user group. The user group
  /// must first be disassociated from the replication group before it can be
  /// deleted. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using
  /// Role Based Access Control (RBAC)</a>.
  ///
  /// May throw [UserGroupNotFoundFault].
  /// May throw [InvalidUserGroupStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [userGroupId] :
  /// The ID of the user group.
  Future<UserGroup> deleteUserGroup({
    required String userGroupId,
  }) async {
    final $request = <String, dynamic>{};
    $request['UserGroupId'] = userGroupId;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteUserGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteUserGroupMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteUserGroupResult',
    );
    return UserGroup.fromXml($result);
  }

  /// Returns information about all provisioned clusters if no cluster
  /// identifier is specified, or about a specific cache cluster if a cluster
  /// identifier is supplied.
  ///
  /// By default, abbreviated information about the clusters is returned. You
  /// can use the optional <i>ShowCacheNodeInfo</i> flag to retrieve detailed
  /// information about the cache nodes associated with the clusters. These
  /// details include the DNS address and port for the cache node endpoint.
  ///
  /// If the cluster is in the <i>creating</i> state, only cluster-level
  /// information is displayed until all of the nodes are successfully
  /// provisioned.
  ///
  /// If the cluster is in the <i>deleting</i> state, only cluster-level
  /// information is displayed.
  ///
  /// If cache nodes are currently being added to the cluster, node endpoint
  /// information and creation time for the additional nodes are not displayed
  /// until they are completely provisioned. When the cluster state is
  /// <i>available</i>, the cluster is ready for use.
  ///
  /// If cache nodes are currently being removed from the cluster, no endpoint
  /// information for the removed nodes is displayed.
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheClusterId] :
  /// The user-supplied cluster identifier. If this parameter is specified, only
  /// information about that specific cluster is returned. This parameter isn't
  /// case sensitive.
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// Parameter [showCacheClustersNotInReplicationGroups] :
  /// An optional flag that can be included in the
  /// <code>DescribeCacheCluster</code> request to show only nodes (API/CLI:
  /// clusters) that are not members of a replication group. In practice, this
  /// mean Memcached and single node Redis clusters.
  ///
  /// Parameter [showCacheNodeInfo] :
  /// An optional flag that can be included in the
  /// <code>DescribeCacheCluster</code> request to retrieve information about
  /// the individual cache nodes.
  Future<CacheClusterMessage> describeCacheClusters({
    String? cacheClusterId,
    String? marker,
    int? maxRecords,
    bool? showCacheClustersNotInReplicationGroups,
    bool? showCacheNodeInfo,
  }) async {
    final $request = <String, dynamic>{};
    cacheClusterId?.also((arg) => $request['CacheClusterId'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    showCacheClustersNotInReplicationGroups?.also(
        (arg) => $request['ShowCacheClustersNotInReplicationGroups'] = arg);
    showCacheNodeInfo?.also((arg) => $request['ShowCacheNodeInfo'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCacheClusters',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCacheClustersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCacheClustersResult',
    );
    return CacheClusterMessage.fromXml($result);
  }

  /// Returns a list of the available cache engines and their versions.
  ///
  /// Parameter [cacheParameterGroupFamily] :
  /// The name of a specific cache parameter group family to return details for.
  ///
  /// Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> |
  /// <code>memcached1.6</code> | <code>redis2.6</code> | <code>redis2.8</code>
  /// | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> |
  /// <code>redis6.x</code> | <code>redis6.2</code> | <code>redis7</code>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 255 alphanumeric characters
  /// </li>
  /// <li>
  /// First character must be a letter
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens
  /// </li>
  /// </ul>
  ///
  /// Parameter [defaultOnly] :
  /// If <code>true</code>, specifies that only the default version of the
  /// specified engine or engine and major version combination is to be
  /// returned.
  ///
  /// Parameter [engine] :
  /// The cache engine to return. Valid values: <code>memcached</code> |
  /// <code>redis</code>
  ///
  /// Parameter [engineVersion] :
  /// The cache engine version to return.
  ///
  /// Example: <code>1.4.14</code>
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  Future<CacheEngineVersionMessage> describeCacheEngineVersions({
    String? cacheParameterGroupFamily,
    bool? defaultOnly,
    String? engine,
    String? engineVersion,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    cacheParameterGroupFamily
        ?.also((arg) => $request['CacheParameterGroupFamily'] = arg);
    defaultOnly?.also((arg) => $request['DefaultOnly'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCacheEngineVersions',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCacheEngineVersionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCacheEngineVersionsResult',
    );
    return CacheEngineVersionMessage.fromXml($result);
  }

  /// Returns a list of cache parameter group descriptions. If a cache parameter
  /// group name is specified, the list contains only the descriptions for that
  /// group.
  ///
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of a specific cache parameter group to return details for.
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  Future<CacheParameterGroupsMessage> describeCacheParameterGroups({
    String? cacheParameterGroupName,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    cacheParameterGroupName
        ?.also((arg) => $request['CacheParameterGroupName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCacheParameterGroups',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCacheParameterGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCacheParameterGroupsResult',
    );
    return CacheParameterGroupsMessage.fromXml($result);
  }

  /// Returns the detailed parameter list for a particular cache parameter
  /// group.
  ///
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of a specific cache parameter group to return details for.
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// Parameter [source] :
  /// The parameter types to return.
  ///
  /// Valid values: <code>user</code> | <code>system</code> |
  /// <code>engine-default</code>
  Future<CacheParameterGroupDetails> describeCacheParameters({
    required String cacheParameterGroupName,
    String? marker,
    int? maxRecords,
    String? source,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheParameterGroupName'] = cacheParameterGroupName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    source?.also((arg) => $request['Source'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCacheParameters',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCacheParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCacheParametersResult',
    );
    return CacheParameterGroupDetails.fromXml($result);
  }

  /// Returns a list of cache security group descriptions. If a cache security
  /// group name is specified, the list contains only the description of that
  /// group. This applicable only when you have ElastiCache in Classic setup
  ///
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheSecurityGroupName] :
  /// The name of the cache security group to return details for.
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  Future<CacheSecurityGroupMessage> describeCacheSecurityGroups({
    String? cacheSecurityGroupName,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    cacheSecurityGroupName
        ?.also((arg) => $request['CacheSecurityGroupName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCacheSecurityGroups',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCacheSecurityGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCacheSecurityGroupsResult',
    );
    return CacheSecurityGroupMessage.fromXml($result);
  }

  /// Returns a list of cache subnet group descriptions. If a subnet group name
  /// is specified, the list contains only the description of that group. This
  /// is applicable only when you have ElastiCache in VPC setup. All ElastiCache
  /// clusters now launch in VPC by default.
  ///
  /// May throw [CacheSubnetGroupNotFoundFault].
  ///
  /// Parameter [cacheSubnetGroupName] :
  /// The name of the cache subnet group to return details for.
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  Future<CacheSubnetGroupMessage> describeCacheSubnetGroups({
    String? cacheSubnetGroupName,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    cacheSubnetGroupName?.also((arg) => $request['CacheSubnetGroupName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeCacheSubnetGroups',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeCacheSubnetGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeCacheSubnetGroupsResult',
    );
    return CacheSubnetGroupMessage.fromXml($result);
  }

  /// Returns the default engine and system parameter information for the
  /// specified cache engine.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheParameterGroupFamily] :
  /// The name of the cache parameter group family.
  ///
  /// Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> |
  /// <code>memcached1.6</code> | <code>redis2.6</code> | <code>redis2.8</code>
  /// | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> |
  /// <code>redis6.x</code> | <code>redis6.2</code> | <code>redis7</code>
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  Future<DescribeEngineDefaultParametersResult>
      describeEngineDefaultParameters({
    required String cacheParameterGroupFamily,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheParameterGroupFamily'] = cacheParameterGroupFamily;
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEngineDefaultParameters',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEngineDefaultParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEngineDefaultParametersResult',
    );
    return DescribeEngineDefaultParametersResult.fromXml($result);
  }

  /// Returns events related to clusters, cache security groups, and cache
  /// parameter groups. You can obtain events specific to a particular cluster,
  /// cache security group, or cache parameter group by providing the name as a
  /// parameter.
  ///
  /// By default, only the events occurring within the last hour are returned;
  /// however, you can retrieve up to 14 days' worth of events if necessary.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [duration] :
  /// The number of minutes worth of events to retrieve.
  ///
  /// Parameter [endTime] :
  /// The end of the time interval for which to retrieve events, specified in
  /// ISO 8601 format.
  ///
  /// <b>Example:</b> 2017-03-30T07:03:49.555Z
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// Parameter [sourceIdentifier] :
  /// The identifier of the event source for which events are returned. If not
  /// specified, all sources are included in the response.
  ///
  /// Parameter [sourceType] :
  /// The event source to retrieve events for. If no value is specified, all
  /// events are returned.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time interval to retrieve events for, specified in
  /// ISO 8601 format.
  ///
  /// <b>Example:</b> 2017-03-30T07:03:49.555Z
  Future<EventsMessage> describeEvents({
    int? duration,
    DateTime? endTime,
    String? marker,
    int? maxRecords,
    String? sourceIdentifier,
    SourceType? sourceType,
    DateTime? startTime,
  }) async {
    final $request = <String, dynamic>{};
    duration?.also((arg) => $request['Duration'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    sourceIdentifier?.also((arg) => $request['SourceIdentifier'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg.toValue());
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEvents',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventsResult',
    );
    return EventsMessage.fromXml($result);
  }

  /// Returns information about a particular global replication group. If no
  /// identifier is specified, returns information about all Global datastores.
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global datastore
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxRecords value, a marker is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [showMemberInfo] :
  /// Returns the list of members that comprise the Global datastore.
  Future<DescribeGlobalReplicationGroupsResult>
      describeGlobalReplicationGroups({
    String? globalReplicationGroupId,
    String? marker,
    int? maxRecords,
    bool? showMemberInfo,
  }) async {
    final $request = <String, dynamic>{};
    globalReplicationGroupId
        ?.also((arg) => $request['GlobalReplicationGroupId'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    showMemberInfo?.also((arg) => $request['ShowMemberInfo'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeGlobalReplicationGroups',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeGlobalReplicationGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeGlobalReplicationGroupsResult',
    );
    return DescribeGlobalReplicationGroupsResult.fromXml($result);
  }

  /// Returns information about a particular replication group. If no identifier
  /// is specified, <code>DescribeReplicationGroups</code> returns information
  /// about all replication groups.
  /// <note>
  /// This operation is valid for Redis only.
  /// </note>
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// Parameter [replicationGroupId] :
  /// The identifier for the replication group to be described. This parameter
  /// is not case sensitive.
  ///
  /// If you do not specify this parameter, information about all replication
  /// groups is returned.
  Future<ReplicationGroupMessage> describeReplicationGroups({
    String? marker,
    int? maxRecords,
    String? replicationGroupId,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    replicationGroupId?.also((arg) => $request['ReplicationGroupId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReplicationGroups',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReplicationGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReplicationGroupsResult',
    );
    return ReplicationGroupMessage.fromXml($result);
  }

  /// Returns information about reserved cache nodes for this account, or about
  /// a specified reserved cache node.
  ///
  /// May throw [ReservedCacheNodeNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheNodeType] :
  /// The cache node type filter value. Use this parameter to show only those
  /// reservations matching the specified cache node type.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// <ul>
  /// <li>
  /// General purpose:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>M7g node types</b>: <code>cache.m7g.large</code>,
  /// <code>cache.m7g.xlarge</code>, <code>cache.m7g.2xlarge</code>,
  /// <code>cache.m7g.4xlarge</code>, <code>cache.m7g.8xlarge</code>,
  /// <code>cache.m7g.12xlarge</code>, <code>cache.m7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward):
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  ///
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T4g node types</b> (available only for Redis engine version 5.0.6
  /// onward and Memcached engine version 1.5.16 onward):
  /// <code>cache.t4g.micro</code>, <code>cache.t4g.small</code>,
  /// <code>cache.t4g.medium</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>T1 node types:</b> <code>cache.t1.micro</code>
  ///
  /// <b>M1 node types:</b> <code>cache.m1.small</code>,
  /// <code>cache.m1.medium</code>, <code>cache.m1.large</code>,
  /// <code>cache.m1.xlarge</code>
  ///
  /// <b>M3 node types:</b> <code>cache.m3.medium</code>,
  /// <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>,
  /// <code>cache.m3.2xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Compute optimized:
  ///
  /// <ul>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>C1 node types:</b> <code>cache.c1.xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Memory optimized:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>R7g node types</b>: <code>cache.r7g.large</code>,
  /// <code>cache.r7g.xlarge</code>, <code>cache.r7g.2xlarge</code>,
  /// <code>cache.r7g.4xlarge</code>, <code>cache.r7g.8xlarge</code>,
  /// <code>cache.r7g.12xlarge</code>, <code>cache.r7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward):
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  ///
  /// <b>R5 node types:</b> <code>cache.r5.large</code>,
  /// <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>,
  /// <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>,
  /// <code>cache.r5.24xlarge</code>
  ///
  /// <b>R4 node types:</b> <code>cache.r4.large</code>,
  /// <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>,
  /// <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>,
  /// <code>cache.r4.16xlarge</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>M2 node types:</b> <code>cache.m2.xlarge</code>,
  /// <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code>
  ///
  /// <b>R3 node types:</b> <code>cache.r3.large</code>,
  /// <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>,
  /// <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// <b>Additional node type info</b>
  ///
  /// <ul>
  /// <li>
  /// All current generation instance types are created in Amazon VPC by
  /// default.
  /// </li>
  /// <li>
  /// Redis append-only files (AOF) are not supported for T1 or T2 instances.
  /// </li>
  /// <li>
  /// Redis Multi-AZ with automatic failover is not supported on T1 instances.
  /// </li>
  /// <li>
  /// Redis configuration variables <code>appendonly</code> and
  /// <code>appendfsync</code> are not supported on Redis version 2.8.22 and
  /// later.
  /// </li>
  /// </ul>
  ///
  /// Parameter [duration] :
  /// The duration filter value, specified in years or seconds. Use this
  /// parameter to show only reservations for this duration.
  ///
  /// Valid Values: <code>1 | 3 | 31536000 | 94608000</code>
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// Parameter [offeringType] :
  /// The offering type filter value. Use this parameter to show only the
  /// available offerings matching the specified offering type.
  ///
  /// Valid values: <code>"Light Utilization"|"Medium Utilization"|"Heavy
  /// Utilization"|"All Upfront"|"Partial Upfront"| "No Upfront"</code>
  ///
  /// Parameter [productDescription] :
  /// The product description filter value. Use this parameter to show only
  /// those reservations matching the specified product description.
  ///
  /// Parameter [reservedCacheNodeId] :
  /// The reserved cache node identifier filter value. Use this parameter to
  /// show only the reservation that matches the specified reservation ID.
  ///
  /// Parameter [reservedCacheNodesOfferingId] :
  /// The offering identifier filter value. Use this parameter to show only
  /// purchased reservations matching the specified offering identifier.
  Future<ReservedCacheNodeMessage> describeReservedCacheNodes({
    String? cacheNodeType,
    String? duration,
    String? marker,
    int? maxRecords,
    String? offeringType,
    String? productDescription,
    String? reservedCacheNodeId,
    String? reservedCacheNodesOfferingId,
  }) async {
    final $request = <String, dynamic>{};
    cacheNodeType?.also((arg) => $request['CacheNodeType'] = arg);
    duration?.also((arg) => $request['Duration'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    offeringType?.also((arg) => $request['OfferingType'] = arg);
    productDescription?.also((arg) => $request['ProductDescription'] = arg);
    reservedCacheNodeId?.also((arg) => $request['ReservedCacheNodeId'] = arg);
    reservedCacheNodesOfferingId
        ?.also((arg) => $request['ReservedCacheNodesOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedCacheNodes',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReservedCacheNodesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReservedCacheNodesResult',
    );
    return ReservedCacheNodeMessage.fromXml($result);
  }

  /// Lists available reserved cache node offerings.
  ///
  /// May throw [ReservedCacheNodesOfferingNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheNodeType] :
  /// The cache node type filter value. Use this parameter to show only the
  /// available offerings matching the specified cache node type.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// <ul>
  /// <li>
  /// General purpose:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>M7g node types</b>: <code>cache.m7g.large</code>,
  /// <code>cache.m7g.xlarge</code>, <code>cache.m7g.2xlarge</code>,
  /// <code>cache.m7g.4xlarge</code>, <code>cache.m7g.8xlarge</code>,
  /// <code>cache.m7g.12xlarge</code>, <code>cache.m7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward):
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  ///
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T4g node types</b> (available only for Redis engine version 5.0.6
  /// onward and Memcached engine version 1.5.16 onward):
  /// <code>cache.t4g.micro</code>, <code>cache.t4g.small</code>,
  /// <code>cache.t4g.medium</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>T1 node types:</b> <code>cache.t1.micro</code>
  ///
  /// <b>M1 node types:</b> <code>cache.m1.small</code>,
  /// <code>cache.m1.medium</code>, <code>cache.m1.large</code>,
  /// <code>cache.m1.xlarge</code>
  ///
  /// <b>M3 node types:</b> <code>cache.m3.medium</code>,
  /// <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>,
  /// <code>cache.m3.2xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Compute optimized:
  ///
  /// <ul>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>C1 node types:</b> <code>cache.c1.xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Memory optimized:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>R7g node types</b>: <code>cache.r7g.large</code>,
  /// <code>cache.r7g.xlarge</code>, <code>cache.r7g.2xlarge</code>,
  /// <code>cache.r7g.4xlarge</code>, <code>cache.r7g.8xlarge</code>,
  /// <code>cache.r7g.12xlarge</code>, <code>cache.r7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward):
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  ///
  /// <b>R5 node types:</b> <code>cache.r5.large</code>,
  /// <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>,
  /// <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>,
  /// <code>cache.r5.24xlarge</code>
  ///
  /// <b>R4 node types:</b> <code>cache.r4.large</code>,
  /// <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>,
  /// <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>,
  /// <code>cache.r4.16xlarge</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still
  /// supported but creation of new clusters is not supported for these types.)
  ///
  /// <b>M2 node types:</b> <code>cache.m2.xlarge</code>,
  /// <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code>
  ///
  /// <b>R3 node types:</b> <code>cache.r3.large</code>,
  /// <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>,
  /// <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// <b>Additional node type info</b>
  ///
  /// <ul>
  /// <li>
  /// All current generation instance types are created in Amazon VPC by
  /// default.
  /// </li>
  /// <li>
  /// Redis append-only files (AOF) are not supported for T1 or T2 instances.
  /// </li>
  /// <li>
  /// Redis Multi-AZ with automatic failover is not supported on T1 instances.
  /// </li>
  /// <li>
  /// Redis configuration variables <code>appendonly</code> and
  /// <code>appendfsync</code> are not supported on Redis version 2.8.22 and
  /// later.
  /// </li>
  /// </ul>
  ///
  /// Parameter [duration] :
  /// Duration filter value, specified in years or seconds. Use this parameter
  /// to show only reservations for a given duration.
  ///
  /// Valid Values: <code>1 | 3 | 31536000 | 94608000</code>
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// Parameter [offeringType] :
  /// The offering type filter value. Use this parameter to show only the
  /// available offerings matching the specified offering type.
  ///
  /// Valid Values: <code>"Light Utilization"|"Medium Utilization"|"Heavy
  /// Utilization" |"All Upfront"|"Partial Upfront"| "No Upfront"</code>
  ///
  /// Parameter [productDescription] :
  /// The product description filter value. Use this parameter to show only the
  /// available offerings matching the specified product description.
  ///
  /// Parameter [reservedCacheNodesOfferingId] :
  /// The offering identifier filter value. Use this parameter to show only the
  /// available offering that matches the specified reservation identifier.
  ///
  /// Example: <code>438012d3-4052-4cc7-b2e3-8d3372e0e706</code>
  Future<ReservedCacheNodesOfferingMessage>
      describeReservedCacheNodesOfferings({
    String? cacheNodeType,
    String? duration,
    String? marker,
    int? maxRecords,
    String? offeringType,
    String? productDescription,
    String? reservedCacheNodesOfferingId,
  }) async {
    final $request = <String, dynamic>{};
    cacheNodeType?.also((arg) => $request['CacheNodeType'] = arg);
    duration?.also((arg) => $request['Duration'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    offeringType?.also((arg) => $request['OfferingType'] = arg);
    productDescription?.also((arg) => $request['ProductDescription'] = arg);
    reservedCacheNodesOfferingId
        ?.also((arg) => $request['ReservedCacheNodesOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedCacheNodesOfferings',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReservedCacheNodesOfferingsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReservedCacheNodesOfferingsResult',
    );
    return ReservedCacheNodesOfferingMessage.fromXml($result);
  }

  /// Returns information about serverless cache snapshots. By default, this API
  /// lists all of the customer’s serverless cache snapshots. It can also
  /// describe a single serverless cache snapshot, or the snapshots associated
  /// with a particular serverless cache. Available for Redis only.
  ///
  /// May throw [ServerlessCacheNotFoundFault].
  /// May throw [ServerlessCacheSnapshotNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified max-results value, a market is included in the
  /// response so that remaining results can be retrieved. Available for Redis
  /// only.The default is 50. The Validation Constraints are a maximum of 50.
  ///
  /// Parameter [nextToken] :
  /// An optional marker returned from a prior request to support pagination of
  /// results from this operation. If this parameter is specified, the response
  /// includes only records beyond the marker, up to the value specified by
  /// max-results. Available for Redis only.
  ///
  /// Parameter [serverlessCacheName] :
  /// The identifier of serverless cache. If this parameter is specified, only
  /// snapshots associated with that specific serverless cache are described.
  /// Available for Redis only.
  ///
  /// Parameter [serverlessCacheSnapshotName] :
  /// The identifier of the serverless cache’s snapshot. If this parameter is
  /// specified, only this snapshot is described. Available for Redis only.
  ///
  /// Parameter [snapshotType] :
  /// The type of snapshot that is being described. Available for Redis only.
  Future<DescribeServerlessCacheSnapshotsResponse>
      describeServerlessCacheSnapshots({
    int? maxResults,
    String? nextToken,
    String? serverlessCacheName,
    String? serverlessCacheSnapshotName,
    String? snapshotType,
  }) async {
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    serverlessCacheName?.also((arg) => $request['ServerlessCacheName'] = arg);
    serverlessCacheSnapshotName
        ?.also((arg) => $request['ServerlessCacheSnapshotName'] = arg);
    snapshotType?.also((arg) => $request['SnapshotType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeServerlessCacheSnapshots',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeServerlessCacheSnapshotsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeServerlessCacheSnapshotsResult',
    );
    return DescribeServerlessCacheSnapshotsResponse.fromXml($result);
  }

  /// Returns information about a specific serverless cache. If no identifier is
  /// specified, then the API returns information on all the serverless caches
  /// belonging to this Amazon Web Services account.
  ///
  /// May throw [ServerlessCacheNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records in the response. If more records exist than
  /// the specified max-records value, the next token is included in the
  /// response so that remaining results can be retrieved. The default is 50.
  ///
  /// Parameter [nextToken] :
  /// An optional marker returned from a prior request to support pagination of
  /// results from this operation. If this parameter is specified, the response
  /// includes only records beyond the marker, up to the value specified by
  /// MaxResults.
  ///
  /// Parameter [serverlessCacheName] :
  /// The identifier for the serverless cache. If this parameter is specified,
  /// only information about that specific serverless cache is returned.
  /// Default: NULL
  Future<DescribeServerlessCachesResponse> describeServerlessCaches({
    int? maxResults,
    String? nextToken,
    String? serverlessCacheName,
  }) async {
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    serverlessCacheName?.also((arg) => $request['ServerlessCacheName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeServerlessCaches',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeServerlessCachesRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeServerlessCachesResult',
    );
    return DescribeServerlessCachesResponse.fromXml($result);
  }

  /// Returns details of the service updates
  ///
  /// May throw [ServiceUpdateNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response
  ///
  /// Parameter [serviceUpdateName] :
  /// The unique ID of the service update
  ///
  /// Parameter [serviceUpdateStatus] :
  /// The status of the service update
  Future<ServiceUpdatesMessage> describeServiceUpdates({
    String? marker,
    int? maxRecords,
    String? serviceUpdateName,
    List<ServiceUpdateStatus>? serviceUpdateStatus,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    serviceUpdateName?.also((arg) => $request['ServiceUpdateName'] = arg);
    serviceUpdateStatus?.also((arg) =>
        $request['ServiceUpdateStatus'] = arg.map((e) => e.toValue()).toList());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeServiceUpdates',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeServiceUpdatesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeServiceUpdatesResult',
    );
    return ServiceUpdatesMessage.fromXml($result);
  }

  /// Returns information about cluster or replication group snapshots. By
  /// default, <code>DescribeSnapshots</code> lists all of your snapshots; it
  /// can optionally describe a single snapshot, or just the snapshots
  /// associated with a particular cache cluster.
  /// <note>
  /// This operation is valid for Redis only.
  /// </note>
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [SnapshotNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheClusterId] :
  /// A user-supplied cluster identifier. If this parameter is specified, only
  /// snapshots associated with that specific cluster are described.
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 50
  ///
  /// Constraints: minimum 20; maximum 50.
  ///
  /// Parameter [replicationGroupId] :
  /// A user-supplied replication group identifier. If this parameter is
  /// specified, only snapshots associated with that specific replication group
  /// are described.
  ///
  /// Parameter [showNodeGroupConfig] :
  /// A Boolean value which if true, the node group (shard) configuration is
  /// included in the snapshot description.
  ///
  /// Parameter [snapshotName] :
  /// A user-supplied name of the snapshot. If this parameter is specified, only
  /// this snapshot are described.
  ///
  /// Parameter [snapshotSource] :
  /// If set to <code>system</code>, the output shows snapshots that were
  /// automatically created by ElastiCache. If set to <code>user</code> the
  /// output shows snapshots that were manually created. If omitted, the output
  /// shows both automatically and manually created snapshots.
  Future<DescribeSnapshotsListMessage> describeSnapshots({
    String? cacheClusterId,
    String? marker,
    int? maxRecords,
    String? replicationGroupId,
    bool? showNodeGroupConfig,
    String? snapshotName,
    String? snapshotSource,
  }) async {
    final $request = <String, dynamic>{};
    cacheClusterId?.also((arg) => $request['CacheClusterId'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    replicationGroupId?.also((arg) => $request['ReplicationGroupId'] = arg);
    showNodeGroupConfig?.also((arg) => $request['ShowNodeGroupConfig'] = arg);
    snapshotName?.also((arg) => $request['SnapshotName'] = arg);
    snapshotSource?.also((arg) => $request['SnapshotSource'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeSnapshots',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeSnapshotsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeSnapshotsResult',
    );
    return DescribeSnapshotsListMessage.fromXml($result);
  }

  /// Returns details of the update actions
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheClusterIds] :
  /// The cache cluster IDs
  ///
  /// Parameter [engine] :
  /// The Elasticache engine to which the update applies. Either Redis or
  /// Memcached
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response
  ///
  /// Parameter [replicationGroupIds] :
  /// The replication group IDs
  ///
  /// Parameter [serviceUpdateName] :
  /// The unique ID of the service update
  ///
  /// Parameter [serviceUpdateStatus] :
  /// The status of the service update
  ///
  /// Parameter [serviceUpdateTimeRange] :
  /// The range of time specified to search for service updates that are in
  /// available status
  ///
  /// Parameter [showNodeLevelUpdateStatus] :
  /// Dictates whether to include node level update status in the response
  ///
  /// Parameter [updateActionStatus] :
  /// The status of the update action.
  Future<UpdateActionsMessage> describeUpdateActions({
    List<String>? cacheClusterIds,
    String? engine,
    String? marker,
    int? maxRecords,
    List<String>? replicationGroupIds,
    String? serviceUpdateName,
    List<ServiceUpdateStatus>? serviceUpdateStatus,
    TimeRangeFilter? serviceUpdateTimeRange,
    bool? showNodeLevelUpdateStatus,
    List<UpdateActionStatus>? updateActionStatus,
  }) async {
    final $request = <String, dynamic>{};
    cacheClusterIds?.also((arg) => $request['CacheClusterIds'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    replicationGroupIds?.also((arg) => $request['ReplicationGroupIds'] = arg);
    serviceUpdateName?.also((arg) => $request['ServiceUpdateName'] = arg);
    serviceUpdateStatus?.also((arg) =>
        $request['ServiceUpdateStatus'] = arg.map((e) => e.toValue()).toList());
    serviceUpdateTimeRange
        ?.also((arg) => $request['ServiceUpdateTimeRange'] = arg);
    showNodeLevelUpdateStatus
        ?.also((arg) => $request['ShowNodeLevelUpdateStatus'] = arg);
    updateActionStatus?.also((arg) =>
        $request['UpdateActionStatus'] = arg.map((e) => e.toValue()).toList());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeUpdateActions',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeUpdateActionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeUpdateActionsResult',
    );
    return UpdateActionsMessage.fromXml($result);
  }

  /// Returns a list of user groups.
  ///
  /// May throw [UserGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords. &gt;
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxRecords value, a marker is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [userGroupId] :
  /// The ID of the user group.
  Future<DescribeUserGroupsResult> describeUserGroups({
    String? marker,
    int? maxRecords,
    String? userGroupId,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    userGroupId?.also((arg) => $request['UserGroupId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeUserGroups',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeUserGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeUserGroupsResult',
    );
    return DescribeUserGroupsResult.fromXml($result);
  }

  /// Returns a list of users.
  ///
  /// May throw [UserNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [engine] :
  /// The Redis engine.
  ///
  /// Parameter [filters] :
  /// Filter to determine the list of User IDs to return.
  ///
  /// Parameter [marker] :
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords. &gt;
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified MaxRecords value, a marker is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  Future<DescribeUsersResult> describeUsers({
    String? engine,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? userId,
  }) async {
    final $request = <String, dynamic>{};
    engine?.also((arg) => $request['Engine'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    userId?.also((arg) => $request['UserId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeUsers',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeUsersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeUsersResult',
    );
    return DescribeUsersResult.fromXml($result);
  }

  /// Remove a secondary cluster from the Global datastore using the Global
  /// datastore name. The secondary cluster will no longer receive updates from
  /// the primary cluster, but will remain as a standalone cluster in that
  /// Amazon region.
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global datastore
  ///
  /// Parameter [replicationGroupId] :
  /// The name of the secondary cluster you wish to remove from the Global
  /// datastore
  ///
  /// Parameter [replicationGroupRegion] :
  /// The Amazon region of secondary cluster you wish to remove from the Global
  /// datastore
  Future<DisassociateGlobalReplicationGroupResult>
      disassociateGlobalReplicationGroup({
    required String globalReplicationGroupId,
    required String replicationGroupId,
    required String replicationGroupRegion,
  }) async {
    final $request = <String, dynamic>{};
    $request['GlobalReplicationGroupId'] = globalReplicationGroupId;
    $request['ReplicationGroupId'] = replicationGroupId;
    $request['ReplicationGroupRegion'] = replicationGroupRegion;
    final $result = await _protocol.send(
      $request,
      action: 'DisassociateGlobalReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DisassociateGlobalReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'DisassociateGlobalReplicationGroupResult',
    );
    return DisassociateGlobalReplicationGroupResult.fromXml($result);
  }

  /// Provides the functionality to export the serverless cache snapshot data to
  /// Amazon S3. Available for Redis only.
  ///
  /// May throw [ServerlessCacheSnapshotNotFoundFault].
  /// May throw [InvalidServerlessCacheSnapshotStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [s3BucketName] :
  /// Name of the Amazon S3 bucket to export the snapshot to. The Amazon S3
  /// bucket must also be in same region as the snapshot. Available for Redis
  /// only.
  ///
  /// Parameter [serverlessCacheSnapshotName] :
  /// The identifier of the serverless cache snapshot to be exported to S3.
  /// Available for Redis only.
  Future<ExportServerlessCacheSnapshotResponse> exportServerlessCacheSnapshot({
    required String s3BucketName,
    required String serverlessCacheSnapshotName,
  }) async {
    final $request = <String, dynamic>{};
    $request['S3BucketName'] = s3BucketName;
    $request['ServerlessCacheSnapshotName'] = serverlessCacheSnapshotName;
    final $result = await _protocol.send(
      $request,
      action: 'ExportServerlessCacheSnapshot',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ExportServerlessCacheSnapshotRequest'],
      shapes: shapes,
      resultWrapper: 'ExportServerlessCacheSnapshotResult',
    );
    return ExportServerlessCacheSnapshotResponse.fromXml($result);
  }

  /// Used to failover the primary region to a secondary region. The secondary
  /// region will become primary, and all other clusters will become secondary.
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global datastore
  ///
  /// Parameter [primaryRegion] :
  /// The Amazon region of the primary cluster of the Global datastore
  ///
  /// Parameter [primaryReplicationGroupId] :
  /// The name of the primary replication group
  Future<FailoverGlobalReplicationGroupResult> failoverGlobalReplicationGroup({
    required String globalReplicationGroupId,
    required String primaryRegion,
    required String primaryReplicationGroupId,
  }) async {
    final $request = <String, dynamic>{};
    $request['GlobalReplicationGroupId'] = globalReplicationGroupId;
    $request['PrimaryRegion'] = primaryRegion;
    $request['PrimaryReplicationGroupId'] = primaryReplicationGroupId;
    final $result = await _protocol.send(
      $request,
      action: 'FailoverGlobalReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['FailoverGlobalReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'FailoverGlobalReplicationGroupResult',
    );
    return FailoverGlobalReplicationGroupResult.fromXml($result);
  }

  /// Increase the number of node groups in the Global datastore
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [applyImmediately] :
  /// Indicates that the process begins immediately. At present, the only
  /// permitted value for this parameter is true.
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global datastore
  ///
  /// Parameter [nodeGroupCount] :
  /// Total number of node groups you want
  ///
  /// Parameter [regionalConfigurations] :
  /// Describes the replication group IDs, the Amazon regions where they are
  /// stored and the shard configuration for each that comprise the Global
  /// datastore
  Future<IncreaseNodeGroupsInGlobalReplicationGroupResult>
      increaseNodeGroupsInGlobalReplicationGroup({
    required bool applyImmediately,
    required String globalReplicationGroupId,
    required int nodeGroupCount,
    List<RegionalConfiguration>? regionalConfigurations,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplyImmediately'] = applyImmediately;
    $request['GlobalReplicationGroupId'] = globalReplicationGroupId;
    $request['NodeGroupCount'] = nodeGroupCount;
    regionalConfigurations
        ?.also((arg) => $request['RegionalConfigurations'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'IncreaseNodeGroupsInGlobalReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['IncreaseNodeGroupsInGlobalReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'IncreaseNodeGroupsInGlobalReplicationGroupResult',
    );
    return IncreaseNodeGroupsInGlobalReplicationGroupResult.fromXml($result);
  }

  /// Dynamically increases the number of replicas in a Redis (cluster mode
  /// disabled) replication group or the number of replica nodes in one or more
  /// node groups (shards) of a Redis (cluster mode enabled) replication group.
  /// This operation is performed with no cluster down time.
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InsufficientCacheClusterCapacityFault].
  /// May throw [ClusterQuotaForCustomerExceededFault].
  /// May throw [NodeGroupsPerReplicationGroupQuotaExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [NoOperationFault].
  /// May throw [InvalidKMSKeyFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [applyImmediately] :
  /// If <code>True</code>, the number of replica nodes is increased
  /// immediately. <code>ApplyImmediately=False</code> is not currently
  /// supported.
  ///
  /// Parameter [replicationGroupId] :
  /// The id of the replication group to which you want to add replica nodes.
  ///
  /// Parameter [newReplicaCount] :
  /// The number of read replica nodes you want at the completion of this
  /// operation. For Redis (cluster mode disabled) replication groups, this is
  /// the number of replica nodes in the replication group. For Redis (cluster
  /// mode enabled) replication groups, this is the number of replica nodes in
  /// each of the replication group's node groups.
  ///
  /// Parameter [replicaConfiguration] :
  /// A list of <code>ConfigureShard</code> objects that can be used to
  /// configure each shard in a Redis (cluster mode enabled) replication group.
  /// The <code>ConfigureShard</code> has three members:
  /// <code>NewReplicaCount</code>, <code>NodeGroupId</code>, and
  /// <code>PreferredAvailabilityZones</code>.
  Future<IncreaseReplicaCountResult> increaseReplicaCount({
    required bool applyImmediately,
    required String replicationGroupId,
    int? newReplicaCount,
    List<ConfigureShard>? replicaConfiguration,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplyImmediately'] = applyImmediately;
    $request['ReplicationGroupId'] = replicationGroupId;
    newReplicaCount?.also((arg) => $request['NewReplicaCount'] = arg);
    replicaConfiguration?.also((arg) => $request['ReplicaConfiguration'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'IncreaseReplicaCount',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['IncreaseReplicaCountMessage'],
      shapes: shapes,
      resultWrapper: 'IncreaseReplicaCountResult',
    );
    return IncreaseReplicaCountResult.fromXml($result);
  }

  /// Lists all available node types that you can scale your Redis cluster's or
  /// replication group's current node type.
  ///
  /// When you use the <code>ModifyCacheCluster</code> or
  /// <code>ModifyReplicationGroup</code> operations to scale your cluster or
  /// replication group, the value of the <code>CacheNodeType</code> parameter
  /// must be one of the node types returned by this operation.
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [cacheClusterId] :
  /// The name of the cluster you want to scale up to a larger node instanced
  /// type. ElastiCache uses the cluster id to identify the current node type of
  /// this cluster and from that to create a list of node types you can scale up
  /// to.
  /// <important>
  /// You must provide a value for either the <code>CacheClusterId</code> or the
  /// <code>ReplicationGroupId</code>.
  /// </important>
  ///
  /// Parameter [replicationGroupId] :
  /// The name of the replication group want to scale up to a larger node type.
  /// ElastiCache uses the replication group id to identify the current node
  /// type being used by this replication group, and from that to create a list
  /// of node types you can scale up to.
  /// <important>
  /// You must provide a value for either the <code>CacheClusterId</code> or the
  /// <code>ReplicationGroupId</code>.
  /// </important>
  Future<AllowedNodeTypeModificationsMessage> listAllowedNodeTypeModifications({
    String? cacheClusterId,
    String? replicationGroupId,
  }) async {
    final $request = <String, dynamic>{};
    cacheClusterId?.also((arg) => $request['CacheClusterId'] = arg);
    replicationGroupId?.also((arg) => $request['ReplicationGroupId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListAllowedNodeTypeModifications',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListAllowedNodeTypeModificationsMessage'],
      shapes: shapes,
      resultWrapper: 'ListAllowedNodeTypeModificationsResult',
    );
    return AllowedNodeTypeModificationsMessage.fromXml($result);
  }

  /// Lists all tags currently on a named resource.
  ///
  /// A tag is a key-value pair where the key and value are case-sensitive. You
  /// can use tags to categorize and track all your ElastiCache resources, with
  /// the exception of global replication group. When you add or remove tags on
  /// replication groups, those actions will be replicated to all nodes in the
  /// replication group. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.ResourceLevelPermissions.html">Resource-level
  /// permissions</a>.
  ///
  /// If the cluster is not in the <i>available</i> state,
  /// <code>ListTagsForResource</code> returns an error.
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [CacheSubnetGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [ReservedCacheNodeNotFoundFault].
  /// May throw [SnapshotNotFoundFault].
  /// May throw [UserNotFoundFault].
  /// May throw [UserGroupNotFoundFault].
  /// May throw [ServerlessCacheNotFoundFault].
  /// May throw [InvalidServerlessCacheStateFault].
  /// May throw [ServerlessCacheSnapshotNotFoundFault].
  /// May throw [InvalidServerlessCacheSnapshotStateFault].
  /// May throw [InvalidARNFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon Resource Name (ARN) of the resource for which you want the list
  /// of tags, for example
  /// <code>arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster</code> or
  /// <code>arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot</code>.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  Future<TagListMessage> listTagsForResource({
    required String resourceName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    final $result = await _protocol.send(
      $request,
      action: 'ListTagsForResource',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTagsForResourceMessage'],
      shapes: shapes,
      resultWrapper: 'ListTagsForResourceResult',
    );
    return TagListMessage.fromXml($result);
  }

  /// Modifies the settings for a cluster. You can use this operation to change
  /// one or more cluster configuration parameters by specifying the parameters
  /// and the new values.
  ///
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [InvalidCacheSecurityGroupStateFault].
  /// May throw [InsufficientCacheClusterCapacityFault].
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [NodeQuotaForClusterExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheClusterId] :
  /// The cluster identifier. This value is stored as a lowercase string.
  ///
  /// Parameter [aZMode] :
  /// Specifies whether the new nodes in this Memcached cluster are all created
  /// in a single Availability Zone or created across multiple Availability
  /// Zones.
  ///
  /// Valid values: <code>single-az</code> | <code>cross-az</code>.
  ///
  /// This option is only supported for Memcached clusters.
  /// <note>
  /// You cannot specify <code>single-az</code> if the Memcached cluster already
  /// has cache nodes in different Availability Zones. If <code>cross-az</code>
  /// is specified, existing Memcached nodes remain in their current
  /// Availability Zone.
  ///
  /// Only newly created nodes are located in different Availability Zones.
  /// </note>
  ///
  /// Parameter [applyImmediately] :
  /// If <code>true</code>, this parameter causes the modifications in this
  /// request and any pending modifications to be applied, asynchronously and as
  /// soon as possible, regardless of the
  /// <code>PreferredMaintenanceWindow</code> setting for the cluster.
  ///
  /// If <code>false</code>, changes to the cluster are applied on the next
  /// maintenance reboot, or the next failure reboot, whichever occurs first.
  /// <important>
  /// If you perform a <code>ModifyCacheCluster</code> before a pending
  /// modification is applied, the pending modification is replaced by the newer
  /// modification.
  /// </important>
  /// Valid values: <code>true</code> | <code>false</code>
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [authToken] :
  /// Reserved parameter. The password used to access a password protected
  /// server. This parameter must be specified with the
  /// <code>auth-token-update</code> parameter. Password constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be only printable ASCII characters
  /// </li>
  /// <li>
  /// Must be at least 16 characters and no more than 128 characters in length
  /// </li>
  /// <li>
  /// Cannot contain any of the following characters: '/', '"', or '@', '%'
  /// </li>
  /// </ul>
  /// For more information, see AUTH password at <a
  /// href="http://redis.io/commands/AUTH">AUTH</a>.
  ///
  /// Parameter [authTokenUpdateStrategy] :
  /// Specifies the strategy to use to update the AUTH token. This parameter
  /// must be specified with the <code>auth-token</code> parameter. Possible
  /// values:
  ///
  /// <ul>
  /// <li>
  /// ROTATE - default, if no update strategy is provided
  /// </li>
  /// <li>
  /// SET - allowed only after ROTATE
  /// </li>
  /// <li>
  /// DELETE - allowed only when transitioning to RBAC
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html">Authenticating
  /// Users with Redis AUTH</a>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// If you are running Redis engine version 6.0 or later, set this parameter
  /// to yes if you want to opt-in to the next auto minor version upgrade
  /// campaign. This parameter is disabled for previous versions.
  ///
  /// Parameter [cacheNodeIdsToRemove] :
  /// A list of cache node IDs to be removed. A node ID is a numeric identifier
  /// (0001, 0002, etc.). This parameter is only valid when
  /// <code>NumCacheNodes</code> is less than the existing number of cache
  /// nodes. The number of cache node IDs supplied in this parameter must match
  /// the difference between the existing number of cache nodes in the cluster
  /// or pending cache nodes, whichever is greater, and the value of
  /// <code>NumCacheNodes</code> in the request.
  ///
  /// For example: If you have 3 active cache nodes, 7 pending cache nodes, and
  /// the number of cache nodes in this <code>ModifyCacheCluster</code> call is
  /// 5, you must list 2 (7 - 5) cache node IDs to remove.
  ///
  /// Parameter [cacheNodeType] :
  /// A valid cache node type that you want to scale this cluster up to.
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of the cache parameter group to apply to this cluster. This
  /// change is asynchronously applied as soon as possible for parameters when
  /// the <code>ApplyImmediately</code> parameter is specified as
  /// <code>true</code> for this request.
  ///
  /// Parameter [cacheSecurityGroupNames] :
  /// A list of cache security group names to authorize on this cluster. This
  /// change is asynchronously applied as soon as possible.
  ///
  /// You can use this parameter only with clusters that are created outside of
  /// an Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters. Must
  /// not be "Default".
  ///
  /// Parameter [engineVersion] :
  /// The upgraded version of the cache engine to be run on the cache nodes.
  ///
  /// <b>Important:</b> You can upgrade to a newer engine version (see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement">Selecting
  /// a Cache Engine and Version</a>), but you cannot downgrade to an earlier
  /// engine version. If you want to use an earlier engine version, you must
  /// delete the existing cluster and create it anew with the earlier engine
  /// version.
  ///
  /// Parameter [ipDiscovery] :
  /// The network type you choose when modifying a cluster, either
  /// <code>ipv4</code> | <code>ipv6</code>. IPv6 is supported for workloads
  /// using Redis engine version 6.2 onward or Memcached engine version 1.6.6 on
  /// all instances built on the <a
  /// href="http://aws.amazon.com/ec2/nitro/">Nitro system</a>.
  ///
  /// Parameter [logDeliveryConfigurations] :
  /// Specifies the destination, format and type of the logs.
  ///
  /// Parameter [newAvailabilityZones] :
  /// <note>
  /// This option is only supported on Memcached clusters.
  /// </note>
  /// The list of Availability Zones where the new Memcached cache nodes are
  /// created.
  ///
  /// This parameter is only valid when <code>NumCacheNodes</code> in the
  /// request is greater than the sum of the number of active cache nodes and
  /// the number of cache nodes pending creation (which may be zero). The number
  /// of Availability Zones supplied in this list must match the cache nodes
  /// being added in this request.
  ///
  /// Scenarios:
  ///
  /// <ul>
  /// <li>
  /// <b>Scenario 1:</b> You have 3 active nodes and wish to add 2 nodes.
  /// Specify <code>NumCacheNodes=5</code> (3 + 2) and optionally specify two
  /// Availability Zones for the two new nodes.
  /// </li>
  /// <li>
  /// <b>Scenario 2:</b> You have 3 active nodes and 2 nodes pending creation
  /// (from the scenario 1 call) and want to add 1 more node. Specify
  /// <code>NumCacheNodes=6</code> ((3 + 2) + 1) and optionally specify an
  /// Availability Zone for the new node.
  /// </li>
  /// <li>
  /// <b>Scenario 3:</b> You want to cancel all pending operations. Specify
  /// <code>NumCacheNodes=3</code> to cancel all pending operations.
  /// </li>
  /// </ul>
  /// The Availability Zone placement of nodes pending creation cannot be
  /// modified. If you wish to cancel any nodes pending creation, add 0 nodes by
  /// setting <code>NumCacheNodes</code> to the number of current nodes.
  ///
  /// If <code>cross-az</code> is specified, existing Memcached nodes remain in
  /// their current Availability Zone. Only newly created nodes can be located
  /// in different Availability Zones. For guidance on how to move existing
  /// Memcached nodes to different Availability Zones, see the <b>Availability
  /// Zone Considerations</b> section of <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/CacheNodes.SupportedTypes.html">Cache
  /// Node Considerations for Memcached</a>.
  ///
  /// <b>Impact of new add/remove requests upon pending requests</b>
  ///
  /// <ul>
  /// <li>
  /// Scenario-1
  ///
  /// <ul>
  /// <li>
  /// Pending Action: Delete
  /// </li>
  /// <li>
  /// New Request: Delete
  /// </li>
  /// <li>
  /// Result: The new delete, pending or immediate, replaces the pending delete.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Scenario-2
  ///
  /// <ul>
  /// <li>
  /// Pending Action: Delete
  /// </li>
  /// <li>
  /// New Request: Create
  /// </li>
  /// <li>
  /// Result: The new create, pending or immediate, replaces the pending delete.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Scenario-3
  ///
  /// <ul>
  /// <li>
  /// Pending Action: Create
  /// </li>
  /// <li>
  /// New Request: Delete
  /// </li>
  /// <li>
  /// Result: The new delete, pending or immediate, replaces the pending create.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Scenario-4
  ///
  /// <ul>
  /// <li>
  /// Pending Action: Create
  /// </li>
  /// <li>
  /// New Request: Create
  /// </li>
  /// <li>
  /// Result: The new create is added to the pending create.
  /// <important>
  /// <b>Important:</b> If the new create request is <b>Apply Immediately -
  /// Yes</b>, all creates are performed immediately. If the new create request
  /// is <b>Apply Immediately - No</b>, all creates are pending.
  /// </important> </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [notificationTopicArn] :
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which
  /// notifications are sent.
  /// <note>
  /// The Amazon SNS topic owner must be same as the cluster owner.
  /// </note>
  ///
  /// Parameter [notificationTopicStatus] :
  /// The status of the Amazon SNS notification topic. Notifications are sent
  /// only if the status is <code>active</code>.
  ///
  /// Valid values: <code>active</code> | <code>inactive</code>
  ///
  /// Parameter [numCacheNodes] :
  /// The number of cache nodes that the cluster should have. If the value for
  /// <code>NumCacheNodes</code> is greater than the sum of the number of
  /// current cache nodes and the number of cache nodes pending creation (which
  /// may be zero), more nodes are added. If the value is less than the number
  /// of existing cache nodes, nodes are removed. If the value is equal to the
  /// number of current cache nodes, any pending add or remove requests are
  /// canceled.
  ///
  /// If you are removing cache nodes, you must use the
  /// <code>CacheNodeIdsToRemove</code> parameter to provide the IDs of the
  /// specific cache nodes to remove.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 40.
  /// <note>
  /// Adding or removing Memcached cache nodes can be applied immediately or as
  /// a pending operation (see <code>ApplyImmediately</code>).
  ///
  /// A pending operation to modify the number of cache nodes in a cluster
  /// during its maintenance window, whether by adding or removing nodes in
  /// accordance with the scale out architecture, is not queued. The customer's
  /// latest request to add or remove nodes to the cluster overrides any
  /// previous pending operations to modify the number of cache nodes in the
  /// cluster. For example, a request to remove 2 nodes would override a
  /// previous pending operation to remove 3 nodes. Similarly, a request to add
  /// 2 nodes would override a previous pending operation to remove 3 nodes and
  /// vice versa. As Memcached cache nodes may now be provisioned in different
  /// Availability Zones with flexible cache node placement, a request to add
  /// nodes does not automatically override a previous pending operation to add
  /// nodes. The customer can modify the previous pending operation to add more
  /// nodes or explicitly cancel the pending request and retry the new request.
  /// To cancel pending operations to modify the number of cache nodes in a
  /// cluster, use the <code>ModifyCacheCluster</code> request and set
  /// <code>NumCacheNodes</code> equal to the number of cache nodes currently in
  /// the cluster.
  /// </note>
  ///
  /// Parameter [preferredMaintenanceWindow] :
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
  /// Parameter [securityGroupIds] :
  /// Specifies the VPC Security Groups associated with the cluster.
  ///
  /// This parameter can be used only with clusters that are created in an
  /// Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// Parameter [snapshotRetentionLimit] :
  /// The number of days for which ElastiCache retains automatic cluster
  /// snapshots before deleting them. For example, if you set
  /// <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today
  /// is retained for 5 days before being deleted.
  /// <note>
  /// If the value of <code>SnapshotRetentionLimit</code> is set to zero (0),
  /// backups are turned off.
  /// </note>
  ///
  /// Parameter [snapshotWindow] :
  /// The daily time range (in UTC) during which ElastiCache begins taking a
  /// daily snapshot of your cluster.
  Future<ModifyCacheClusterResult> modifyCacheCluster({
    required String cacheClusterId,
    AZMode? aZMode,
    bool? applyImmediately,
    String? authToken,
    AuthTokenUpdateStrategyType? authTokenUpdateStrategy,
    bool? autoMinorVersionUpgrade,
    List<String>? cacheNodeIdsToRemove,
    String? cacheNodeType,
    String? cacheParameterGroupName,
    List<String>? cacheSecurityGroupNames,
    String? engineVersion,
    IpDiscovery? ipDiscovery,
    List<LogDeliveryConfigurationRequest>? logDeliveryConfigurations,
    List<String>? newAvailabilityZones,
    String? notificationTopicArn,
    String? notificationTopicStatus,
    int? numCacheNodes,
    String? preferredMaintenanceWindow,
    List<String>? securityGroupIds,
    int? snapshotRetentionLimit,
    String? snapshotWindow,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheClusterId'] = cacheClusterId;
    aZMode?.also((arg) => $request['AZMode'] = arg.toValue());
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    authToken?.also((arg) => $request['AuthToken'] = arg);
    authTokenUpdateStrategy
        ?.also((arg) => $request['AuthTokenUpdateStrategy'] = arg.toValue());
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    cacheNodeIdsToRemove?.also((arg) => $request['CacheNodeIdsToRemove'] = arg);
    cacheNodeType?.also((arg) => $request['CacheNodeType'] = arg);
    cacheParameterGroupName
        ?.also((arg) => $request['CacheParameterGroupName'] = arg);
    cacheSecurityGroupNames
        ?.also((arg) => $request['CacheSecurityGroupNames'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    ipDiscovery?.also((arg) => $request['IpDiscovery'] = arg.toValue());
    logDeliveryConfigurations
        ?.also((arg) => $request['LogDeliveryConfigurations'] = arg);
    newAvailabilityZones?.also((arg) => $request['NewAvailabilityZones'] = arg);
    notificationTopicArn?.also((arg) => $request['NotificationTopicArn'] = arg);
    notificationTopicStatus
        ?.also((arg) => $request['NotificationTopicStatus'] = arg);
    numCacheNodes?.also((arg) => $request['NumCacheNodes'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    securityGroupIds?.also((arg) => $request['SecurityGroupIds'] = arg);
    snapshotRetentionLimit
        ?.also((arg) => $request['SnapshotRetentionLimit'] = arg);
    snapshotWindow?.also((arg) => $request['SnapshotWindow'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyCacheCluster',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyCacheClusterMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyCacheClusterResult',
    );
    return ModifyCacheClusterResult.fromXml($result);
  }

  /// Modifies the parameters of a cache parameter group. You can modify up to
  /// 20 parameters in a single request by submitting a list parameter name and
  /// value pairs.
  ///
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [InvalidCacheParameterGroupStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of the cache parameter group to modify.
  ///
  /// Parameter [parameterNameValues] :
  /// An array of parameter names and values for the parameter update. You must
  /// supply at least one parameter name and value; subsequent arguments are
  /// optional. A maximum of 20 parameters may be modified per request.
  Future<CacheParameterGroupNameMessage> modifyCacheParameterGroup({
    required String cacheParameterGroupName,
    required List<ParameterNameValue> parameterNameValues,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheParameterGroupName'] = cacheParameterGroupName;
    $request['ParameterNameValues'] = parameterNameValues;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyCacheParameterGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyCacheParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyCacheParameterGroupResult',
    );
    return CacheParameterGroupNameMessage.fromXml($result);
  }

  /// Modifies an existing cache subnet group.
  ///
  /// May throw [CacheSubnetGroupNotFoundFault].
  /// May throw [CacheSubnetQuotaExceededFault].
  /// May throw [SubnetInUse].
  /// May throw [InvalidSubnet].
  /// May throw [SubnetNotAllowedFault].
  ///
  /// Parameter [cacheSubnetGroupName] :
  /// The name for the cache subnet group. This value is stored as a lowercase
  /// string.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters or
  /// hyphens.
  ///
  /// Example: <code>mysubnetgroup</code>
  ///
  /// Parameter [cacheSubnetGroupDescription] :
  /// A description of the cache subnet group.
  ///
  /// Parameter [subnetIds] :
  /// The EC2 subnet IDs for the cache subnet group.
  Future<ModifyCacheSubnetGroupResult> modifyCacheSubnetGroup({
    required String cacheSubnetGroupName,
    String? cacheSubnetGroupDescription,
    List<String>? subnetIds,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheSubnetGroupName'] = cacheSubnetGroupName;
    cacheSubnetGroupDescription
        ?.also((arg) => $request['CacheSubnetGroupDescription'] = arg);
    subnetIds?.also((arg) => $request['SubnetIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyCacheSubnetGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyCacheSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyCacheSubnetGroupResult',
    );
    return ModifyCacheSubnetGroupResult.fromXml($result);
  }

  /// Modifies the settings for a Global datastore.
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [applyImmediately] :
  /// This parameter causes the modifications in this request and any pending
  /// modifications to be applied, asynchronously and as soon as possible.
  /// Modifications to Global Replication Groups cannot be requested to be
  /// applied in PreferredMaintenceWindow.
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global datastore
  ///
  /// Parameter [automaticFailoverEnabled] :
  /// Determines whether a read replica is automatically promoted to read/write
  /// primary if the existing primary encounters a failure.
  ///
  /// Parameter [cacheNodeType] :
  /// A valid cache node type that you want to scale this Global datastore to.
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of the cache parameter group to use with the Global datastore. It
  /// must be compatible with the major engine version used by the Global
  /// datastore.
  ///
  /// Parameter [engineVersion] :
  /// The upgraded version of the cache engine to be run on the clusters in the
  /// Global datastore.
  ///
  /// Parameter [globalReplicationGroupDescription] :
  /// A description of the Global datastore
  Future<ModifyGlobalReplicationGroupResult> modifyGlobalReplicationGroup({
    required bool applyImmediately,
    required String globalReplicationGroupId,
    bool? automaticFailoverEnabled,
    String? cacheNodeType,
    String? cacheParameterGroupName,
    String? engineVersion,
    String? globalReplicationGroupDescription,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplyImmediately'] = applyImmediately;
    $request['GlobalReplicationGroupId'] = globalReplicationGroupId;
    automaticFailoverEnabled
        ?.also((arg) => $request['AutomaticFailoverEnabled'] = arg);
    cacheNodeType?.also((arg) => $request['CacheNodeType'] = arg);
    cacheParameterGroupName
        ?.also((arg) => $request['CacheParameterGroupName'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    globalReplicationGroupDescription
        ?.also((arg) => $request['GlobalReplicationGroupDescription'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyGlobalReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyGlobalReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyGlobalReplicationGroupResult',
    );
    return ModifyGlobalReplicationGroupResult.fromXml($result);
  }

  /// Modifies the settings for a replication group. This is limited to Redis 7
  /// and newer.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/scaling-redis-cluster-mode-enabled.html">Scaling
  /// for Amazon ElastiCache for Redis (cluster mode enabled)</a> in the
  /// ElastiCache User Guide
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyReplicationGroupShardConfiguration.html">ModifyReplicationGroupShardConfiguration</a>
  /// in the ElastiCache API Reference
  /// </li>
  /// </ul> <note>
  /// This operation is valid for Redis only.
  /// </note>
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [InvalidUserGroupStateFault].
  /// May throw [UserGroupNotFoundFault].
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [InvalidCacheSecurityGroupStateFault].
  /// May throw [InsufficientCacheClusterCapacityFault].
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [NodeQuotaForClusterExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidKMSKeyFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [replicationGroupId] :
  /// The identifier of the replication group to modify.
  ///
  /// Parameter [applyImmediately] :
  /// If <code>true</code>, this parameter causes the modifications in this
  /// request and any pending modifications to be applied, asynchronously and as
  /// soon as possible, regardless of the
  /// <code>PreferredMaintenanceWindow</code> setting for the replication group.
  ///
  /// If <code>false</code>, changes to the nodes in the replication group are
  /// applied on the next maintenance reboot, or the next failure reboot,
  /// whichever occurs first.
  ///
  /// Valid values: <code>true</code> | <code>false</code>
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [authToken] :
  /// Reserved parameter. The password used to access a password protected
  /// server. This parameter must be specified with the
  /// <code>auth-token-update-strategy </code> parameter. Password constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be only printable ASCII characters
  /// </li>
  /// <li>
  /// Must be at least 16 characters and no more than 128 characters in length
  /// </li>
  /// <li>
  /// Cannot contain any of the following characters: '/', '"', or '@', '%'
  /// </li>
  /// </ul>
  /// For more information, see AUTH password at <a
  /// href="http://redis.io/commands/AUTH">AUTH</a>.
  ///
  /// Parameter [authTokenUpdateStrategy] :
  /// Specifies the strategy to use to update the AUTH token. This parameter
  /// must be specified with the <code>auth-token</code> parameter. Possible
  /// values:
  ///
  /// <ul>
  /// <li>
  /// ROTATE - default, if no update strategy is provided
  /// </li>
  /// <li>
  /// SET - allowed only after ROTATE
  /// </li>
  /// <li>
  /// DELETE - allowed only when transitioning to RBAC
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html">Authenticating
  /// Users with Redis AUTH</a>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// If you are running Redis engine version 6.0 or later, set this parameter
  /// to yes if you want to opt-in to the next auto minor version upgrade
  /// campaign. This parameter is disabled for previous versions.
  ///
  /// Parameter [automaticFailoverEnabled] :
  /// Determines whether a read replica is automatically promoted to read/write
  /// primary if the existing primary encounters a failure.
  ///
  /// Valid values: <code>true</code> | <code>false</code>
  ///
  /// Parameter [cacheNodeType] :
  /// A valid cache node type that you want to scale this replication group to.
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of the cache parameter group to apply to all of the clusters in
  /// this replication group. This change is asynchronously applied as soon as
  /// possible for parameters when the <code>ApplyImmediately</code> parameter
  /// is specified as <code>true</code> for this request.
  ///
  /// Parameter [cacheSecurityGroupNames] :
  /// A list of cache security group names to authorize for the clusters in this
  /// replication group. This change is asynchronously applied as soon as
  /// possible.
  ///
  /// This parameter can be used only with replication group containing clusters
  /// running outside of an Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters. Must
  /// not be <code>Default</code>.
  ///
  /// Parameter [clusterMode] :
  /// Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you
  /// must first set the cluster mode to Compatible. Compatible mode allows your
  /// Redis clients to connect using both cluster mode enabled and cluster mode
  /// disabled. After you migrate all Redis clients to use cluster mode enabled,
  /// you can then complete cluster mode configuration and set the cluster mode
  /// to Enabled.
  ///
  /// Parameter [engineVersion] :
  /// The upgraded version of the cache engine to be run on the clusters in the
  /// replication group.
  ///
  /// <b>Important:</b> You can upgrade to a newer engine version (see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement">Selecting
  /// a Cache Engine and Version</a>), but you cannot downgrade to an earlier
  /// engine version. If you want to use an earlier engine version, you must
  /// delete the existing replication group and create it anew with the earlier
  /// engine version.
  ///
  /// Parameter [ipDiscovery] :
  /// The network type you choose when modifying a cluster, either
  /// <code>ipv4</code> | <code>ipv6</code>. IPv6 is supported for workloads
  /// using Redis engine version 6.2 onward or Memcached engine version 1.6.6 on
  /// all instances built on the <a
  /// href="http://aws.amazon.com/ec2/nitro/">Nitro system</a>.
  ///
  /// Parameter [logDeliveryConfigurations] :
  /// Specifies the destination, format and type of the logs.
  ///
  /// Parameter [multiAZEnabled] :
  /// A flag to indicate MultiAZ is enabled.
  ///
  /// Parameter [nodeGroupId] :
  /// Deprecated. This parameter is not used.
  ///
  /// Parameter [notificationTopicArn] :
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which
  /// notifications are sent.
  /// <note>
  /// The Amazon SNS topic owner must be same as the replication group owner.
  /// </note>
  ///
  /// Parameter [notificationTopicStatus] :
  /// The status of the Amazon SNS notification topic for the replication group.
  /// Notifications are sent only if the status is <code>active</code>.
  ///
  /// Valid values: <code>active</code> | <code>inactive</code>
  ///
  /// Parameter [preferredMaintenanceWindow] :
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
  /// Parameter [primaryClusterId] :
  /// For replication groups with a single primary, if this parameter is
  /// specified, ElastiCache promotes the specified cluster in the specified
  /// replication group to the primary role. The nodes of all other clusters in
  /// the replication group are read replicas.
  ///
  /// Parameter [removeUserGroups] :
  /// Removes the user group associated with this replication group.
  ///
  /// Parameter [replicationGroupDescription] :
  /// A description for the replication group. Maximum length is 255 characters.
  ///
  /// Parameter [securityGroupIds] :
  /// Specifies the VPC Security Groups associated with the clusters in the
  /// replication group.
  ///
  /// This parameter can be used only with replication group containing clusters
  /// running in an Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// Parameter [snapshotRetentionLimit] :
  /// The number of days for which ElastiCache retains automatic node group
  /// (shard) snapshots before deleting them. For example, if you set
  /// <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today
  /// is retained for 5 days before being deleted.
  ///
  /// <b>Important</b> If the value of SnapshotRetentionLimit is set to zero
  /// (0), backups are turned off.
  ///
  /// Parameter [snapshotWindow] :
  /// The daily time range (in UTC) during which ElastiCache begins taking a
  /// daily snapshot of the node group (shard) specified by
  /// <code>SnapshottingClusterId</code>.
  ///
  /// Example: <code>05:00-09:00</code>
  ///
  /// If you do not specify this parameter, ElastiCache automatically chooses an
  /// appropriate time range.
  ///
  /// Parameter [snapshottingClusterId] :
  /// The cluster ID that is used as the daily snapshot source for the
  /// replication group. This parameter cannot be set for Redis (cluster mode
  /// enabled) replication groups.
  ///
  /// Parameter [transitEncryptionEnabled] :
  /// A flag that enables in-transit encryption when set to true. If you are
  /// enabling in-transit encryption for an existing cluster, you must also set
  /// <code>TransitEncryptionMode</code> to <code>preferred</code>.
  ///
  /// Parameter [transitEncryptionMode] :
  /// A setting that allows you to migrate your clients to use in-transit
  /// encryption, with no downtime.
  ///
  /// You must set <code>TransitEncryptionEnabled</code> to <code>true</code>,
  /// for your existing cluster, and set <code>TransitEncryptionMode</code> to
  /// <code>preferred</code> in the same request to allow both encrypted and
  /// unencrypted connections at the same time. Once you migrate all your Redis
  /// clients to use encrypted connections you can set the value to
  /// <code>required</code> to allow encrypted connections only.
  ///
  /// Setting <code>TransitEncryptionMode</code> to <code>required</code> is a
  /// two-step process that requires you to first set the
  /// <code>TransitEncryptionMode</code> to <code>preferred</code>, after that
  /// you can set <code>TransitEncryptionMode</code> to <code>required</code>.
  ///
  /// Parameter [userGroupIdsToAdd] :
  /// The ID of the user group you are associating with the replication group.
  ///
  /// Parameter [userGroupIdsToRemove] :
  /// The ID of the user group to disassociate from the replication group,
  /// meaning the users in the group no longer can access the replication group.
  Future<ModifyReplicationGroupResult> modifyReplicationGroup({
    required String replicationGroupId,
    bool? applyImmediately,
    String? authToken,
    AuthTokenUpdateStrategyType? authTokenUpdateStrategy,
    bool? autoMinorVersionUpgrade,
    bool? automaticFailoverEnabled,
    String? cacheNodeType,
    String? cacheParameterGroupName,
    List<String>? cacheSecurityGroupNames,
    ClusterMode? clusterMode,
    String? engineVersion,
    IpDiscovery? ipDiscovery,
    List<LogDeliveryConfigurationRequest>? logDeliveryConfigurations,
    bool? multiAZEnabled,
    String? nodeGroupId,
    String? notificationTopicArn,
    String? notificationTopicStatus,
    String? preferredMaintenanceWindow,
    String? primaryClusterId,
    bool? removeUserGroups,
    String? replicationGroupDescription,
    List<String>? securityGroupIds,
    int? snapshotRetentionLimit,
    String? snapshotWindow,
    String? snapshottingClusterId,
    bool? transitEncryptionEnabled,
    TransitEncryptionMode? transitEncryptionMode,
    List<String>? userGroupIdsToAdd,
    List<String>? userGroupIdsToRemove,
  }) async {
    final $request = <String, dynamic>{};
    $request['ReplicationGroupId'] = replicationGroupId;
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    authToken?.also((arg) => $request['AuthToken'] = arg);
    authTokenUpdateStrategy
        ?.also((arg) => $request['AuthTokenUpdateStrategy'] = arg.toValue());
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    automaticFailoverEnabled
        ?.also((arg) => $request['AutomaticFailoverEnabled'] = arg);
    cacheNodeType?.also((arg) => $request['CacheNodeType'] = arg);
    cacheParameterGroupName
        ?.also((arg) => $request['CacheParameterGroupName'] = arg);
    cacheSecurityGroupNames
        ?.also((arg) => $request['CacheSecurityGroupNames'] = arg);
    clusterMode?.also((arg) => $request['ClusterMode'] = arg.toValue());
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    ipDiscovery?.also((arg) => $request['IpDiscovery'] = arg.toValue());
    logDeliveryConfigurations
        ?.also((arg) => $request['LogDeliveryConfigurations'] = arg);
    multiAZEnabled?.also((arg) => $request['MultiAZEnabled'] = arg);
    nodeGroupId?.also((arg) => $request['NodeGroupId'] = arg);
    notificationTopicArn?.also((arg) => $request['NotificationTopicArn'] = arg);
    notificationTopicStatus
        ?.also((arg) => $request['NotificationTopicStatus'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    primaryClusterId?.also((arg) => $request['PrimaryClusterId'] = arg);
    removeUserGroups?.also((arg) => $request['RemoveUserGroups'] = arg);
    replicationGroupDescription
        ?.also((arg) => $request['ReplicationGroupDescription'] = arg);
    securityGroupIds?.also((arg) => $request['SecurityGroupIds'] = arg);
    snapshotRetentionLimit
        ?.also((arg) => $request['SnapshotRetentionLimit'] = arg);
    snapshotWindow?.also((arg) => $request['SnapshotWindow'] = arg);
    snapshottingClusterId
        ?.also((arg) => $request['SnapshottingClusterId'] = arg);
    transitEncryptionEnabled
        ?.also((arg) => $request['TransitEncryptionEnabled'] = arg);
    transitEncryptionMode
        ?.also((arg) => $request['TransitEncryptionMode'] = arg.toValue());
    userGroupIdsToAdd?.also((arg) => $request['UserGroupIdsToAdd'] = arg);
    userGroupIdsToRemove?.also((arg) => $request['UserGroupIdsToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyReplicationGroupResult',
    );
    return ModifyReplicationGroupResult.fromXml($result);
  }

  /// Modifies a replication group's shards (node groups) by allowing you to add
  /// shards, remove shards, or rebalance the keyspaces among existing shards.
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InsufficientCacheClusterCapacityFault].
  /// May throw [NodeGroupsPerReplicationGroupQuotaExceededFault].
  /// May throw [NodeQuotaForCustomerExceededFault].
  /// May throw [InvalidKMSKeyFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [applyImmediately] :
  /// Indicates that the shard reconfiguration process begins immediately. At
  /// present, the only permitted value for this parameter is <code>true</code>.
  ///
  /// Value: true
  ///
  /// Parameter [nodeGroupCount] :
  /// The number of node groups (shards) that results from the modification of
  /// the shard configuration.
  ///
  /// Parameter [replicationGroupId] :
  /// The name of the Redis (cluster mode enabled) cluster (replication group)
  /// on which the shards are to be configured.
  ///
  /// Parameter [nodeGroupsToRemove] :
  /// If the value of <code>NodeGroupCount</code> is less than the current
  /// number of node groups (shards), then either
  /// <code>NodeGroupsToRemove</code> or <code>NodeGroupsToRetain</code> is
  /// required. <code>NodeGroupsToRemove</code> is a list of
  /// <code>NodeGroupId</code>s to remove from the cluster.
  ///
  /// ElastiCache for Redis will attempt to remove all node groups listed by
  /// <code>NodeGroupsToRemove</code> from the cluster.
  ///
  /// Parameter [nodeGroupsToRetain] :
  /// If the value of <code>NodeGroupCount</code> is less than the current
  /// number of node groups (shards), then either
  /// <code>NodeGroupsToRemove</code> or <code>NodeGroupsToRetain</code> is
  /// required. <code>NodeGroupsToRetain</code> is a list of
  /// <code>NodeGroupId</code>s to retain in the cluster.
  ///
  /// ElastiCache for Redis will attempt to remove all node groups except those
  /// listed by <code>NodeGroupsToRetain</code> from the cluster.
  ///
  /// Parameter [reshardingConfiguration] :
  /// Specifies the preferred availability zones for each node group in the
  /// cluster. If the value of <code>NodeGroupCount</code> is greater than the
  /// current number of node groups (shards), you can use this parameter to
  /// specify the preferred availability zones of the cluster's shards. If you
  /// omit this parameter ElastiCache selects availability zones for you.
  ///
  /// You can specify this parameter only if the value of
  /// <code>NodeGroupCount</code> is greater than the current number of node
  /// groups (shards).
  Future<ModifyReplicationGroupShardConfigurationResult>
      modifyReplicationGroupShardConfiguration({
    required bool applyImmediately,
    required int nodeGroupCount,
    required String replicationGroupId,
    List<String>? nodeGroupsToRemove,
    List<String>? nodeGroupsToRetain,
    List<ReshardingConfiguration>? reshardingConfiguration,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplyImmediately'] = applyImmediately;
    $request['NodeGroupCount'] = nodeGroupCount;
    $request['ReplicationGroupId'] = replicationGroupId;
    nodeGroupsToRemove?.also((arg) => $request['NodeGroupsToRemove'] = arg);
    nodeGroupsToRetain?.also((arg) => $request['NodeGroupsToRetain'] = arg);
    reshardingConfiguration
        ?.also((arg) => $request['ReshardingConfiguration'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyReplicationGroupShardConfiguration',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyReplicationGroupShardConfigurationMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyReplicationGroupShardConfigurationResult',
    );
    return ModifyReplicationGroupShardConfigurationResult.fromXml($result);
  }

  /// This API modifies the attributes of a serverless cache.
  ///
  /// May throw [ServerlessCacheNotFoundFault].
  /// May throw [InvalidServerlessCacheStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidCredentialsException].
  /// May throw [InvalidUserGroupStateFault].
  /// May throw [UserGroupNotFoundFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  ///
  /// Parameter [serverlessCacheName] :
  /// User-provided identifier for the serverless cache to be modified.
  ///
  /// Parameter [cacheUsageLimits] :
  /// Modify the cache usage limit for the serverless cache.
  ///
  /// Parameter [dailySnapshotTime] :
  /// The daily time during which Elasticache begins taking a daily snapshot of
  /// the serverless cache. Available for Redis only. The default is NULL, i.e.
  /// the existing snapshot time configured for the cluster is not removed.
  ///
  /// Parameter [description] :
  /// User provided description for the serverless cache. Default = NULL, i.e.
  /// the existing description is not removed/modified. The description has a
  /// maximum length of 255 characters.
  ///
  /// Parameter [removeUserGroup] :
  /// The identifier of the UserGroup to be removed from association with the
  /// Redis serverless cache. Available for Redis only. Default is NULL.
  ///
  /// Parameter [securityGroupIds] :
  /// The new list of VPC security groups to be associated with the serverless
  /// cache. Populating this list means the current VPC security groups will be
  /// removed. This security group is used to authorize traffic access for the
  /// VPC end-point (private-link). Default = NULL - the existing list of VPC
  /// security groups is not removed.
  ///
  /// Parameter [snapshotRetentionLimit] :
  /// The number of days for which Elasticache retains automatic snapshots
  /// before deleting them. Available for Redis only. Default = NULL, i.e. the
  /// existing snapshot-retention-limit will not be removed or modified. The
  /// maximum value allowed is 35 days.
  ///
  /// Parameter [userGroupId] :
  /// The identifier of the UserGroup to be associated with the serverless
  /// cache. Available for Redis only. Default is NULL - the existing UserGroup
  /// is not removed.
  Future<ModifyServerlessCacheResponse> modifyServerlessCache({
    required String serverlessCacheName,
    CacheUsageLimits? cacheUsageLimits,
    String? dailySnapshotTime,
    String? description,
    bool? removeUserGroup,
    List<String>? securityGroupIds,
    int? snapshotRetentionLimit,
    String? userGroupId,
  }) async {
    final $request = <String, dynamic>{};
    $request['ServerlessCacheName'] = serverlessCacheName;
    cacheUsageLimits?.also((arg) => $request['CacheUsageLimits'] = arg);
    dailySnapshotTime?.also((arg) => $request['DailySnapshotTime'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    removeUserGroup?.also((arg) => $request['RemoveUserGroup'] = arg);
    securityGroupIds?.also((arg) => $request['SecurityGroupIds'] = arg);
    snapshotRetentionLimit
        ?.also((arg) => $request['SnapshotRetentionLimit'] = arg);
    userGroupId?.also((arg) => $request['UserGroupId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyServerlessCache',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyServerlessCacheRequest'],
      shapes: shapes,
      resultWrapper: 'ModifyServerlessCacheResult',
    );
    return ModifyServerlessCacheResponse.fromXml($result);
  }

  /// Changes user password(s) and/or access string.
  ///
  /// May throw [UserNotFoundFault].
  /// May throw [InvalidUserStateFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  ///
  /// Parameter [accessString] :
  /// Access permissions string used for this user.
  ///
  /// Parameter [appendAccessString] :
  /// Adds additional user permissions to the access string.
  ///
  /// Parameter [authenticationMode] :
  /// Specifies how to authenticate the user.
  ///
  /// Parameter [noPasswordRequired] :
  /// Indicates no password is required for the user.
  ///
  /// Parameter [passwords] :
  /// The passwords belonging to the user. You are allowed up to two.
  Future<User> modifyUser({
    required String userId,
    String? accessString,
    String? appendAccessString,
    AuthenticationMode? authenticationMode,
    bool? noPasswordRequired,
    List<String>? passwords,
  }) async {
    final $request = <String, dynamic>{};
    $request['UserId'] = userId;
    accessString?.also((arg) => $request['AccessString'] = arg);
    appendAccessString?.also((arg) => $request['AppendAccessString'] = arg);
    authenticationMode?.also((arg) => $request['AuthenticationMode'] = arg);
    noPasswordRequired?.also((arg) => $request['NoPasswordRequired'] = arg);
    passwords?.also((arg) => $request['Passwords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyUser',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyUserMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyUserResult',
    );
    return User.fromXml($result);
  }

  /// Changes the list of users that belong to the user group.
  ///
  /// May throw [UserGroupNotFoundFault].
  /// May throw [UserNotFoundFault].
  /// May throw [DuplicateUserNameFault].
  /// May throw [ServiceLinkedRoleNotFoundFault].
  /// May throw [DefaultUserRequired].
  /// May throw [InvalidUserGroupStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [userGroupId] :
  /// The ID of the user group.
  ///
  /// Parameter [userIdsToAdd] :
  /// The list of user IDs to add to the user group.
  ///
  /// Parameter [userIdsToRemove] :
  /// The list of user IDs to remove from the user group.
  Future<UserGroup> modifyUserGroup({
    required String userGroupId,
    List<String>? userIdsToAdd,
    List<String>? userIdsToRemove,
  }) async {
    final $request = <String, dynamic>{};
    $request['UserGroupId'] = userGroupId;
    userIdsToAdd?.also((arg) => $request['UserIdsToAdd'] = arg);
    userIdsToRemove?.also((arg) => $request['UserIdsToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyUserGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyUserGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyUserGroupResult',
    );
    return UserGroup.fromXml($result);
  }

  /// Allows you to purchase a reserved cache node offering. Reserved nodes are
  /// not eligible for cancellation and are non-refundable. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/reserved-nodes.html">Managing
  /// Costs with Reserved Nodes</a> for Redis or <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/reserved-nodes.html">Managing
  /// Costs with Reserved Nodes</a> for Memcached.
  ///
  /// May throw [ReservedCacheNodesOfferingNotFoundFault].
  /// May throw [ReservedCacheNodeAlreadyExistsFault].
  /// May throw [ReservedCacheNodeQuotaExceededFault].
  /// May throw [TagQuotaPerResourceExceeded].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [reservedCacheNodesOfferingId] :
  /// The ID of the reserved cache node offering to purchase.
  ///
  /// Example: <code>438012d3-4052-4cc7-b2e3-8d3372e0e706</code>
  ///
  /// Parameter [cacheNodeCount] :
  /// The number of cache node instances to reserve.
  ///
  /// Default: <code>1</code>
  ///
  /// Parameter [reservedCacheNodeId] :
  /// A customer-specified identifier to track this reservation.
  /// <note>
  /// The Reserved Cache Node ID is an unique customer-specified identifier to
  /// track this reservation. If this parameter is not specified, ElastiCache
  /// automatically generates an identifier for the reservation.
  /// </note>
  /// Example: myreservationID
  ///
  /// Parameter [tags] :
  /// A list of tags to be added to this resource. A tag is a key-value pair. A
  /// tag key must be accompanied by a tag value, although null is accepted.
  Future<PurchaseReservedCacheNodesOfferingResult>
      purchaseReservedCacheNodesOffering({
    required String reservedCacheNodesOfferingId,
    int? cacheNodeCount,
    String? reservedCacheNodeId,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ReservedCacheNodesOfferingId'] = reservedCacheNodesOfferingId;
    cacheNodeCount?.also((arg) => $request['CacheNodeCount'] = arg);
    reservedCacheNodeId?.also((arg) => $request['ReservedCacheNodeId'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'PurchaseReservedCacheNodesOffering',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PurchaseReservedCacheNodesOfferingMessage'],
      shapes: shapes,
      resultWrapper: 'PurchaseReservedCacheNodesOfferingResult',
    );
    return PurchaseReservedCacheNodesOfferingResult.fromXml($result);
  }

  /// Redistribute slots to ensure uniform distribution across existing shards
  /// in the cluster.
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [applyImmediately] :
  /// If <code>True</code>, redistribution is applied immediately.
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global datastore
  Future<RebalanceSlotsInGlobalReplicationGroupResult>
      rebalanceSlotsInGlobalReplicationGroup({
    required bool applyImmediately,
    required String globalReplicationGroupId,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplyImmediately'] = applyImmediately;
    $request['GlobalReplicationGroupId'] = globalReplicationGroupId;
    final $result = await _protocol.send(
      $request,
      action: 'RebalanceSlotsInGlobalReplicationGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RebalanceSlotsInGlobalReplicationGroupMessage'],
      shapes: shapes,
      resultWrapper: 'RebalanceSlotsInGlobalReplicationGroupResult',
    );
    return RebalanceSlotsInGlobalReplicationGroupResult.fromXml($result);
  }

  /// Reboots some, or all, of the cache nodes within a provisioned cluster.
  /// This operation applies any modified cache parameter groups to the cluster.
  /// The reboot operation takes place as soon as possible, and results in a
  /// momentary outage to the cluster. During the reboot, the cluster status is
  /// set to REBOOTING.
  ///
  /// The reboot causes the contents of the cache (for each cache node being
  /// rebooted) to be lost.
  ///
  /// When the reboot is complete, a cluster event is created.
  ///
  /// Rebooting a cluster is currently supported on Memcached and Redis (cluster
  /// mode disabled) clusters. Rebooting is not supported on Redis (cluster mode
  /// enabled) clusters.
  ///
  /// If you make changes to parameters that require a Redis (cluster mode
  /// enabled) cluster reboot for the changes to be applied, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/nodes.rebooting.html">Rebooting
  /// a Cluster</a> for an alternate process.
  ///
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [CacheClusterNotFoundFault].
  ///
  /// Parameter [cacheClusterId] :
  /// The cluster identifier. This parameter is stored as a lowercase string.
  ///
  /// Parameter [cacheNodeIdsToReboot] :
  /// A list of cache node IDs to reboot. A node ID is a numeric identifier
  /// (0001, 0002, etc.). To reboot an entire cluster, specify all of the cache
  /// node IDs.
  Future<RebootCacheClusterResult> rebootCacheCluster({
    required String cacheClusterId,
    required List<String> cacheNodeIdsToReboot,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheClusterId'] = cacheClusterId;
    $request['CacheNodeIdsToReboot'] = cacheNodeIdsToReboot;
    final $result = await _protocol.send(
      $request,
      action: 'RebootCacheCluster',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RebootCacheClusterMessage'],
      shapes: shapes,
      resultWrapper: 'RebootCacheClusterResult',
    );
    return RebootCacheClusterResult.fromXml($result);
  }

  /// Removes the tags identified by the <code>TagKeys</code> list from the
  /// named resource. A tag is a key-value pair where the key and value are
  /// case-sensitive. You can use tags to categorize and track all your
  /// ElastiCache resources, with the exception of global replication group.
  /// When you add or remove tags on replication groups, those actions will be
  /// replicated to all nodes in the replication group. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.ResourceLevelPermissions.html">Resource-level
  /// permissions</a>.
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [CacheSubnetGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [ReservedCacheNodeNotFoundFault].
  /// May throw [SnapshotNotFoundFault].
  /// May throw [UserNotFoundFault].
  /// May throw [UserGroupNotFoundFault].
  /// May throw [ServerlessCacheNotFoundFault].
  /// May throw [InvalidServerlessCacheStateFault].
  /// May throw [ServerlessCacheSnapshotNotFoundFault].
  /// May throw [InvalidServerlessCacheSnapshotStateFault].
  /// May throw [InvalidARNFault].
  /// May throw [TagNotFoundFault].
  ///
  /// Parameter [resourceName] :
  /// The Amazon Resource Name (ARN) of the resource from which you want the
  /// tags removed, for example
  /// <code>arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster</code> or
  /// <code>arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot</code>.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Service Namespaces</a>.
  ///
  /// Parameter [tagKeys] :
  /// A list of <code>TagKeys</code> identifying the tags you want removed from
  /// the named resource.
  Future<TagListMessage> removeTagsFromResource({
    required String resourceName,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['TagKeys'] = tagKeys;
    final $result = await _protocol.send(
      $request,
      action: 'RemoveTagsFromResource',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveTagsFromResourceMessage'],
      shapes: shapes,
      resultWrapper: 'RemoveTagsFromResourceResult',
    );
    return TagListMessage.fromXml($result);
  }

  /// Modifies the parameters of a cache parameter group to the engine or system
  /// default value. You can reset specific parameters by submitting a list of
  /// parameter names. To reset the entire cache parameter group, specify the
  /// <code>ResetAllParameters</code> and <code>CacheParameterGroupName</code>
  /// parameters.
  ///
  /// May throw [InvalidCacheParameterGroupStateFault].
  /// May throw [CacheParameterGroupNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  ///
  /// Parameter [cacheParameterGroupName] :
  /// The name of the cache parameter group to reset.
  ///
  /// Parameter [parameterNameValues] :
  /// An array of parameter names to reset to their default values. If
  /// <code>ResetAllParameters</code> is <code>true</code>, do not use
  /// <code>ParameterNameValues</code>. If <code>ResetAllParameters</code> is
  /// <code>false</code>, you must specify the name of at least one parameter to
  /// reset.
  ///
  /// Parameter [resetAllParameters] :
  /// If <code>true</code>, all parameters in the cache parameter group are
  /// reset to their default values. If <code>false</code>, only the parameters
  /// listed by <code>ParameterNameValues</code> are reset to their default
  /// values.
  ///
  /// Valid values: <code>true</code> | <code>false</code>
  Future<CacheParameterGroupNameMessage> resetCacheParameterGroup({
    required String cacheParameterGroupName,
    List<ParameterNameValue>? parameterNameValues,
    bool? resetAllParameters,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheParameterGroupName'] = cacheParameterGroupName;
    parameterNameValues?.also((arg) => $request['ParameterNameValues'] = arg);
    resetAllParameters?.also((arg) => $request['ResetAllParameters'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ResetCacheParameterGroup',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResetCacheParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ResetCacheParameterGroupResult',
    );
    return CacheParameterGroupNameMessage.fromXml($result);
  }

  /// Revokes ingress from a cache security group. Use this operation to
  /// disallow access from an Amazon EC2 security group that had been previously
  /// authorized.
  ///
  /// May throw [CacheSecurityGroupNotFoundFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [InvalidCacheSecurityGroupStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [cacheSecurityGroupName] :
  /// The name of the cache security group to revoke ingress from.
  ///
  /// Parameter [eC2SecurityGroupName] :
  /// The name of the Amazon EC2 security group to revoke access from.
  ///
  /// Parameter [eC2SecurityGroupOwnerId] :
  /// The Amazon account number of the Amazon EC2 security group owner. Note
  /// that this is not the same thing as an Amazon access key ID - you must
  /// provide a valid Amazon account number for this parameter.
  Future<RevokeCacheSecurityGroupIngressResult>
      revokeCacheSecurityGroupIngress({
    required String cacheSecurityGroupName,
    required String eC2SecurityGroupName,
    required String eC2SecurityGroupOwnerId,
  }) async {
    final $request = <String, dynamic>{};
    $request['CacheSecurityGroupName'] = cacheSecurityGroupName;
    $request['EC2SecurityGroupName'] = eC2SecurityGroupName;
    $request['EC2SecurityGroupOwnerId'] = eC2SecurityGroupOwnerId;
    final $result = await _protocol.send(
      $request,
      action: 'RevokeCacheSecurityGroupIngress',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RevokeCacheSecurityGroupIngressMessage'],
      shapes: shapes,
      resultWrapper: 'RevokeCacheSecurityGroupIngressResult',
    );
    return RevokeCacheSecurityGroupIngressResult.fromXml($result);
  }

  /// Start the migration of data.
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [ReplicationGroupAlreadyUnderMigrationFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [customerNodeEndpointList] :
  /// List of endpoints from which data should be migrated. For Redis (cluster
  /// mode disabled), list should have only one element.
  ///
  /// Parameter [replicationGroupId] :
  /// The ID of the replication group to which data should be migrated.
  Future<StartMigrationResponse> startMigration({
    required List<CustomerNodeEndpoint> customerNodeEndpointList,
    required String replicationGroupId,
  }) async {
    final $request = <String, dynamic>{};
    $request['CustomerNodeEndpointList'] = customerNodeEndpointList;
    $request['ReplicationGroupId'] = replicationGroupId;
    final $result = await _protocol.send(
      $request,
      action: 'StartMigration',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartMigrationMessage'],
      shapes: shapes,
      resultWrapper: 'StartMigrationResult',
    );
    return StartMigrationResponse.fromXml($result);
  }

  /// Represents the input of a <code>TestFailover</code> operation which tests
  /// automatic failover on a specified node group (called shard in the console)
  /// in a replication group (called cluster in the console).
  ///
  /// This API is designed for testing the behavior of your application in case
  /// of ElastiCache failover. It is not designed to be an operational tool for
  /// initiating a failover to overcome a problem you may have with the cluster.
  /// Moreover, in certain conditions such as large-scale operational events,
  /// Amazon may block this API.
  /// <p class="title"> <b>Note the following</b>
  ///
  /// <ul>
  /// <li>
  /// A customer can use this operation to test automatic failover on up to 15
  /// shards (called node groups in the ElastiCache API and Amazon CLI) in any
  /// rolling 24-hour period.
  /// </li>
  /// <li>
  /// If calling this operation on shards in different clusters (called
  /// replication groups in the API and CLI), the calls can be made
  /// concurrently.
  ///
  ///
  /// </li>
  /// <li>
  /// If calling this operation multiple times on different shards in the same
  /// Redis (cluster mode enabled) replication group, the first node replacement
  /// must complete before a subsequent call can be made.
  /// </li>
  /// <li>
  /// To determine whether the node replacement is complete you can check Events
  /// using the Amazon ElastiCache console, the Amazon CLI, or the ElastiCache
  /// API. Look for the following automatic failover related events, listed here
  /// in order of occurrance:
  /// <ol>
  /// <li>
  /// Replication group message: <code>Test Failover API called for node group
  /// &lt;node-group-id&gt;</code>
  /// </li>
  /// <li>
  /// Cache cluster message: <code>Failover from primary node
  /// &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed</code>
  /// </li>
  /// <li>
  /// Replication group message: <code>Failover from primary node
  /// &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed</code>
  /// </li>
  /// <li>
  /// Cache cluster message: <code>Recovering cache nodes &lt;node-id&gt;</code>
  /// </li>
  /// <li>
  /// Cache cluster message: <code>Finished recovery for cache nodes
  /// &lt;node-id&gt;</code>
  /// </li> </ol>
  /// For more information see:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ECEvents.Viewing.html">Viewing
  /// ElastiCache Events</a> in the <i>ElastiCache User Guide</i>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_DescribeEvents.html">DescribeEvents</a>
  /// in the ElastiCache API Reference
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// Also see, <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html#auto-failover-test">Testing
  /// Multi-AZ </a> in the <i>ElastiCache User Guide</i>.
  ///
  /// May throw [APICallRateForCustomerExceededFault].
  /// May throw [InvalidCacheClusterStateFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [NodeGroupNotFoundFault].
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [TestFailoverNotAvailableFault].
  /// May throw [InvalidKMSKeyFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [nodeGroupId] :
  /// The name of the node group (called shard in the console) in this
  /// replication group on which automatic failover is to be tested. You may
  /// test automatic failover on up to 15 node groups in any rolling 24-hour
  /// period.
  ///
  /// Parameter [replicationGroupId] :
  /// The name of the replication group (console: cluster) whose automatic
  /// failover is being tested by this operation.
  Future<TestFailoverResult> testFailover({
    required String nodeGroupId,
    required String replicationGroupId,
  }) async {
    final $request = <String, dynamic>{};
    $request['NodeGroupId'] = nodeGroupId;
    $request['ReplicationGroupId'] = replicationGroupId;
    final $result = await _protocol.send(
      $request,
      action: 'TestFailover',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TestFailoverMessage'],
      shapes: shapes,
      resultWrapper: 'TestFailoverResult',
    );
    return TestFailoverResult.fromXml($result);
  }

  /// Async API to test connection between source and target replication group.
  ///
  /// May throw [ReplicationGroupNotFoundFault].
  /// May throw [InvalidReplicationGroupStateFault].
  /// May throw [ReplicationGroupAlreadyUnderMigrationFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [customerNodeEndpointList] :
  /// List of endpoints from which data should be migrated. List should have
  /// only one element.
  ///
  /// Parameter [replicationGroupId] :
  /// The ID of the replication group to which data is to be migrated.
  Future<TestMigrationResponse> testMigration({
    required List<CustomerNodeEndpoint> customerNodeEndpointList,
    required String replicationGroupId,
  }) async {
    final $request = <String, dynamic>{};
    $request['CustomerNodeEndpointList'] = customerNodeEndpointList;
    $request['ReplicationGroupId'] = replicationGroupId;
    final $result = await _protocol.send(
      $request,
      action: 'TestMigration',
      version: '2015-02-02',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TestMigrationMessage'],
      shapes: shapes,
      resultWrapper: 'TestMigrationResult',
    );
    return TestMigrationResponse.fromXml($result);
  }
}

enum AZMode {
  singleAz,
  crossAz,
}

extension AZModeValueExtension on AZMode {
  String toValue() {
    switch (this) {
      case AZMode.singleAz:
        return 'single-az';
      case AZMode.crossAz:
        return 'cross-az';
    }
  }
}

extension AZModeFromString on String {
  AZMode toAZMode() {
    switch (this) {
      case 'single-az':
        return AZMode.singleAz;
      case 'cross-az':
        return AZMode.crossAz;
    }
    throw Exception('$this is not known in enum AZMode');
  }
}

/// Represents the allowed node types you can use to modify your cluster or
/// replication group.
class AllowedNodeTypeModificationsMessage {
  /// A string list, each element of which specifies a cache node type which you
  /// can use to scale your cluster or replication group. When scaling down a
  /// Redis cluster or replication group using ModifyCacheCluster or
  /// ModifyReplicationGroup, use a value from this list for the CacheNodeType
  /// parameter.
  final List<String>? scaleDownModifications;

  /// A string list, each element of which specifies a cache node type which you
  /// can use to scale your cluster or replication group.
  ///
  /// When scaling up a Redis cluster or replication group using
  /// <code>ModifyCacheCluster</code> or <code>ModifyReplicationGroup</code>, use
  /// a value from this list for the <code>CacheNodeType</code> parameter.
  final List<String>? scaleUpModifications;

  AllowedNodeTypeModificationsMessage({
    this.scaleDownModifications,
    this.scaleUpModifications,
  });
  factory AllowedNodeTypeModificationsMessage.fromXml(_s.XmlElement elem) {
    return AllowedNodeTypeModificationsMessage(
      scaleDownModifications: _s
          .extractXmlChild(elem, 'ScaleDownModifications')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      scaleUpModifications: _s
          .extractXmlChild(elem, 'ScaleUpModifications')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final scaleDownModifications = this.scaleDownModifications;
    final scaleUpModifications = this.scaleUpModifications;
    return {
      if (scaleDownModifications != null)
        'ScaleDownModifications': scaleDownModifications,
      if (scaleUpModifications != null)
        'ScaleUpModifications': scaleUpModifications,
    };
  }
}

enum AuthTokenUpdateStatus {
  setting,
  rotating,
}

extension AuthTokenUpdateStatusValueExtension on AuthTokenUpdateStatus {
  String toValue() {
    switch (this) {
      case AuthTokenUpdateStatus.setting:
        return 'SETTING';
      case AuthTokenUpdateStatus.rotating:
        return 'ROTATING';
    }
  }
}

extension AuthTokenUpdateStatusFromString on String {
  AuthTokenUpdateStatus toAuthTokenUpdateStatus() {
    switch (this) {
      case 'SETTING':
        return AuthTokenUpdateStatus.setting;
      case 'ROTATING':
        return AuthTokenUpdateStatus.rotating;
    }
    throw Exception('$this is not known in enum AuthTokenUpdateStatus');
  }
}

enum AuthTokenUpdateStrategyType {
  set,
  rotate,
  delete,
}

extension AuthTokenUpdateStrategyTypeValueExtension
    on AuthTokenUpdateStrategyType {
  String toValue() {
    switch (this) {
      case AuthTokenUpdateStrategyType.set:
        return 'SET';
      case AuthTokenUpdateStrategyType.rotate:
        return 'ROTATE';
      case AuthTokenUpdateStrategyType.delete:
        return 'DELETE';
    }
  }
}

extension AuthTokenUpdateStrategyTypeFromString on String {
  AuthTokenUpdateStrategyType toAuthTokenUpdateStrategyType() {
    switch (this) {
      case 'SET':
        return AuthTokenUpdateStrategyType.set;
      case 'ROTATE':
        return AuthTokenUpdateStrategyType.rotate;
      case 'DELETE':
        return AuthTokenUpdateStrategyType.delete;
    }
    throw Exception('$this is not known in enum AuthTokenUpdateStrategyType');
  }
}

/// Indicates whether the user requires a password to authenticate.
class Authentication {
  /// The number of passwords belonging to the user. The maximum is two.
  final int? passwordCount;

  /// Indicates whether the user requires a password to authenticate.
  final AuthenticationType? type;

  Authentication({
    this.passwordCount,
    this.type,
  });
  factory Authentication.fromXml(_s.XmlElement elem) {
    return Authentication(
      passwordCount: _s.extractXmlIntValue(elem, 'PasswordCount'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toAuthenticationType(),
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

/// Specifies the authentication mode to use.
class AuthenticationMode {
  /// Specifies the passwords to use for authentication if <code>Type</code> is
  /// set to <code>password</code>.
  final List<String>? passwords;

  /// Specifies the authentication type. Possible options are IAM authentication,
  /// password and no password.
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

class AuthorizeCacheSecurityGroupIngressResult {
  final CacheSecurityGroup? cacheSecurityGroup;

  AuthorizeCacheSecurityGroupIngressResult({
    this.cacheSecurityGroup,
  });
  factory AuthorizeCacheSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return AuthorizeCacheSecurityGroupIngressResult(
      cacheSecurityGroup: _s
          .extractXmlChild(elem, 'CacheSecurityGroup')
          ?.let(CacheSecurityGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheSecurityGroup = this.cacheSecurityGroup;
    return {
      if (cacheSecurityGroup != null) 'CacheSecurityGroup': cacheSecurityGroup,
    };
  }
}

enum AutomaticFailoverStatus {
  enabled,
  disabled,
  enabling,
  disabling,
}

extension AutomaticFailoverStatusValueExtension on AutomaticFailoverStatus {
  String toValue() {
    switch (this) {
      case AutomaticFailoverStatus.enabled:
        return 'enabled';
      case AutomaticFailoverStatus.disabled:
        return 'disabled';
      case AutomaticFailoverStatus.enabling:
        return 'enabling';
      case AutomaticFailoverStatus.disabling:
        return 'disabling';
    }
  }
}

extension AutomaticFailoverStatusFromString on String {
  AutomaticFailoverStatus toAutomaticFailoverStatus() {
    switch (this) {
      case 'enabled':
        return AutomaticFailoverStatus.enabled;
      case 'disabled':
        return AutomaticFailoverStatus.disabled;
      case 'enabling':
        return AutomaticFailoverStatus.enabling;
      case 'disabling':
        return AutomaticFailoverStatus.disabling;
    }
    throw Exception('$this is not known in enum AutomaticFailoverStatus');
  }
}

/// Describes an Availability Zone in which the cluster is launched.
class AvailabilityZone {
  /// The name of the Availability Zone.
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

/// Contains all of the attributes of a specific cluster.
class CacheCluster {
  /// The ARN (Amazon Resource Name) of the cache cluster.
  final String? arn;

  /// A flag that enables encryption at-rest when set to <code>true</code>.
  ///
  /// You cannot modify the value of <code>AtRestEncryptionEnabled</code> after
  /// the cluster is created. To enable at-rest encryption on a cluster you must
  /// set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you
  /// create a cluster.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  ///
  /// Default: <code>false</code>
  final bool? atRestEncryptionEnabled;

  /// A flag that enables using an <code>AuthToken</code> (password) when issuing
  /// Redis commands.
  ///
  /// Default: <code>false</code>
  final bool? authTokenEnabled;

  /// The date the auth token was last modified
  final DateTime? authTokenLastModifiedDate;

  /// If you are running Redis engine version 6.0 or later, set this parameter to
  /// yes if you want to opt-in to the next auto minor version upgrade campaign.
  /// This parameter is disabled for previous versions.
  final bool? autoMinorVersionUpgrade;

  /// The date and time when the cluster was created.
  final DateTime? cacheClusterCreateTime;

  /// The user-supplied identifier of the cluster. This identifier is a unique key
  /// that identifies a cluster.
  final String? cacheClusterId;

  /// The current state of this cluster, one of the following values:
  /// <code>available</code>, <code>creating</code>, <code>deleted</code>,
  /// <code>deleting</code>, <code>incompatible-network</code>,
  /// <code>modifying</code>, <code>rebooting cluster nodes</code>,
  /// <code>restore-failed</code>, or <code>snapshotting</code>.
  final String? cacheClusterStatus;

  /// The name of the compute and memory capacity node type for the cluster.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power at
  /// lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// <ul>
  /// <li>
  /// General purpose:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>M7g node types</b>: <code>cache.m7g.large</code>,
  /// <code>cache.m7g.xlarge</code>, <code>cache.m7g.2xlarge</code>,
  /// <code>cache.m7g.4xlarge</code>, <code>cache.m7g.8xlarge</code>,
  /// <code>cache.m7g.12xlarge</code>, <code>cache.m7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward):
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  ///
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T4g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and Memcached engine version 1.5.16 onward): <code>cache.t4g.micro</code>,
  /// <code>cache.t4g.small</code>, <code>cache.t4g.medium</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>T1 node types:</b> <code>cache.t1.micro</code>
  ///
  /// <b>M1 node types:</b> <code>cache.m1.small</code>,
  /// <code>cache.m1.medium</code>, <code>cache.m1.large</code>,
  /// <code>cache.m1.xlarge</code>
  ///
  /// <b>M3 node types:</b> <code>cache.m3.medium</code>,
  /// <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>,
  /// <code>cache.m3.2xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Compute optimized:
  ///
  /// <ul>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>C1 node types:</b> <code>cache.c1.xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Memory optimized:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>R7g node types</b>: <code>cache.r7g.large</code>,
  /// <code>cache.r7g.xlarge</code>, <code>cache.r7g.2xlarge</code>,
  /// <code>cache.r7g.4xlarge</code>, <code>cache.r7g.8xlarge</code>,
  /// <code>cache.r7g.12xlarge</code>, <code>cache.r7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward):
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  ///
  /// <b>R5 node types:</b> <code>cache.r5.large</code>,
  /// <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>,
  /// <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>,
  /// <code>cache.r5.24xlarge</code>
  ///
  /// <b>R4 node types:</b> <code>cache.r4.large</code>,
  /// <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>,
  /// <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>,
  /// <code>cache.r4.16xlarge</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>M2 node types:</b> <code>cache.m2.xlarge</code>,
  /// <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code>
  ///
  /// <b>R3 node types:</b> <code>cache.r3.large</code>,
  /// <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>,
  /// <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// <b>Additional node type info</b>
  ///
  /// <ul>
  /// <li>
  /// All current generation instance types are created in Amazon VPC by default.
  /// </li>
  /// <li>
  /// Redis append-only files (AOF) are not supported for T1 or T2 instances.
  /// </li>
  /// <li>
  /// Redis Multi-AZ with automatic failover is not supported on T1 instances.
  /// </li>
  /// <li>
  /// Redis configuration variables <code>appendonly</code> and
  /// <code>appendfsync</code> are not supported on Redis version 2.8.22 and
  /// later.
  /// </li>
  /// </ul>
  final String? cacheNodeType;

  /// A list of cache nodes that are members of the cluster.
  final List<CacheNode>? cacheNodes;

  /// Status of the cache parameter group.
  final CacheParameterGroupStatus? cacheParameterGroup;

  /// A list of cache security group elements, composed of name and status
  /// sub-elements.
  final List<CacheSecurityGroupMembership>? cacheSecurityGroups;

  /// The name of the cache subnet group associated with the cluster.
  final String? cacheSubnetGroupName;

  /// The URL of the web page where you can download the latest ElastiCache client
  /// library.
  final String? clientDownloadLandingPage;

  /// Represents a Memcached cluster endpoint which can be used by an application
  /// to connect to any node in the cluster. The configuration endpoint will
  /// always have <code>.cfg</code> in it.
  ///
  /// Example: <code>mem-3.9dvc4r<u>.cfg</u>.usw2.cache.amazonaws.com:11211</code>
  final Endpoint? configurationEndpoint;

  /// The name of the cache engine (<code>memcached</code> or <code>redis</code>)
  /// to be used for this cluster.
  final String? engine;

  /// The version of the cache engine that is used in this cluster.
  final String? engineVersion;

  /// The network type associated with the cluster, either <code>ipv4</code> |
  /// <code>ipv6</code>. IPv6 is supported for workloads using Redis engine
  /// version 6.2 onward or Memcached engine version 1.6.6 on all instances built
  /// on the <a href="http://aws.amazon.com/ec2/nitro/">Nitro system</a>.
  final IpDiscovery? ipDiscovery;

  /// Returns the destination, format and type of the logs.
  final List<LogDeliveryConfiguration>? logDeliveryConfigurations;

  /// Must be either <code>ipv4</code> | <code>ipv6</code> |
  /// <code>dual_stack</code>. IPv6 is supported for workloads using Redis engine
  /// version 6.2 onward or Memcached engine version 1.6.6 on all instances built
  /// on the <a href="http://aws.amazon.com/ec2/nitro/">Nitro system</a>.
  final NetworkType? networkType;

  /// Describes a notification topic and its status. Notification topics are used
  /// for publishing ElastiCache events to subscribers using Amazon Simple
  /// Notification Service (SNS).
  final NotificationConfiguration? notificationConfiguration;

  /// The number of cache nodes in the cluster.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 40.
  final int? numCacheNodes;
  final PendingModifiedValues? pendingModifiedValues;

  /// The name of the Availability Zone in which the cluster is located or
  /// "Multiple" if the cache nodes are located in different Availability Zones.
  final String? preferredAvailabilityZone;

  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi
  /// (24H Clock UTC). The minimum maintenance window is a 60 minute period.
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
  final String? preferredMaintenanceWindow;

  /// The outpost ARN in which the cache cluster is created.
  final String? preferredOutpostArn;

  /// The replication group to which this cluster belongs. If this field is empty,
  /// the cluster is not associated with any replication group.
  final String? replicationGroupId;

  /// A boolean value indicating whether log delivery is enabled for the
  /// replication group.
  final bool? replicationGroupLogDeliveryEnabled;

  /// A list of VPC Security Groups associated with the cluster.
  final List<SecurityGroupMembership>? securityGroups;

  /// The number of days for which ElastiCache retains automatic cluster snapshots
  /// before deleting them. For example, if you set
  /// <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is
  /// retained for 5 days before being deleted.
  /// <important>
  /// If the value of SnapshotRetentionLimit is set to zero (0), backups are
  /// turned off.
  /// </important>
  final int? snapshotRetentionLimit;

  /// The daily time range (in UTC) during which ElastiCache begins taking a daily
  /// snapshot of your cluster.
  ///
  /// Example: <code>05:00-09:00</code>
  final String? snapshotWindow;

  /// A flag that enables in-transit encryption when set to <code>true</code>.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  ///
  /// Default: <code>false</code>
  final bool? transitEncryptionEnabled;

  /// A setting that allows you to migrate your clients to use in-transit
  /// encryption, with no downtime.
  final TransitEncryptionMode? transitEncryptionMode;

  CacheCluster({
    this.arn,
    this.atRestEncryptionEnabled,
    this.authTokenEnabled,
    this.authTokenLastModifiedDate,
    this.autoMinorVersionUpgrade,
    this.cacheClusterCreateTime,
    this.cacheClusterId,
    this.cacheClusterStatus,
    this.cacheNodeType,
    this.cacheNodes,
    this.cacheParameterGroup,
    this.cacheSecurityGroups,
    this.cacheSubnetGroupName,
    this.clientDownloadLandingPage,
    this.configurationEndpoint,
    this.engine,
    this.engineVersion,
    this.ipDiscovery,
    this.logDeliveryConfigurations,
    this.networkType,
    this.notificationConfiguration,
    this.numCacheNodes,
    this.pendingModifiedValues,
    this.preferredAvailabilityZone,
    this.preferredMaintenanceWindow,
    this.preferredOutpostArn,
    this.replicationGroupId,
    this.replicationGroupLogDeliveryEnabled,
    this.securityGroups,
    this.snapshotRetentionLimit,
    this.snapshotWindow,
    this.transitEncryptionEnabled,
    this.transitEncryptionMode,
  });
  factory CacheCluster.fromXml(_s.XmlElement elem) {
    return CacheCluster(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      atRestEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'AtRestEncryptionEnabled'),
      authTokenEnabled: _s.extractXmlBoolValue(elem, 'AuthTokenEnabled'),
      authTokenLastModifiedDate:
          _s.extractXmlDateTimeValue(elem, 'AuthTokenLastModifiedDate'),
      autoMinorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'AutoMinorVersionUpgrade'),
      cacheClusterCreateTime:
          _s.extractXmlDateTimeValue(elem, 'CacheClusterCreateTime'),
      cacheClusterId: _s.extractXmlStringValue(elem, 'CacheClusterId'),
      cacheClusterStatus: _s.extractXmlStringValue(elem, 'CacheClusterStatus'),
      cacheNodeType: _s.extractXmlStringValue(elem, 'CacheNodeType'),
      cacheNodes: _s.extractXmlChild(elem, 'CacheNodes')?.let((elem) =>
          elem.findElements('CacheNode').map(CacheNode.fromXml).toList()),
      cacheParameterGroup: _s
          .extractXmlChild(elem, 'CacheParameterGroup')
          ?.let(CacheParameterGroupStatus.fromXml),
      cacheSecurityGroups: _s.extractXmlChild(elem, 'CacheSecurityGroups')?.let(
          (elem) => elem
              .findElements('CacheSecurityGroup')
              .map(CacheSecurityGroupMembership.fromXml)
              .toList()),
      cacheSubnetGroupName:
          _s.extractXmlStringValue(elem, 'CacheSubnetGroupName'),
      clientDownloadLandingPage:
          _s.extractXmlStringValue(elem, 'ClientDownloadLandingPage'),
      configurationEndpoint: _s
          .extractXmlChild(elem, 'ConfigurationEndpoint')
          ?.let(Endpoint.fromXml),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      ipDiscovery:
          _s.extractXmlStringValue(elem, 'IpDiscovery')?.toIpDiscovery(),
      logDeliveryConfigurations: _s
          .extractXmlChild(elem, 'LogDeliveryConfigurations')
          ?.let((elem) => elem
              .findElements('LogDeliveryConfiguration')
              .map(LogDeliveryConfiguration.fromXml)
              .toList()),
      networkType:
          _s.extractXmlStringValue(elem, 'NetworkType')?.toNetworkType(),
      notificationConfiguration: _s
          .extractXmlChild(elem, 'NotificationConfiguration')
          ?.let(NotificationConfiguration.fromXml),
      numCacheNodes: _s.extractXmlIntValue(elem, 'NumCacheNodes'),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let(PendingModifiedValues.fromXml),
      preferredAvailabilityZone:
          _s.extractXmlStringValue(elem, 'PreferredAvailabilityZone'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      preferredOutpostArn:
          _s.extractXmlStringValue(elem, 'PreferredOutpostArn'),
      replicationGroupId: _s.extractXmlStringValue(elem, 'ReplicationGroupId'),
      replicationGroupLogDeliveryEnabled:
          _s.extractXmlBoolValue(elem, 'ReplicationGroupLogDeliveryEnabled'),
      securityGroups: _s.extractXmlChild(elem, 'SecurityGroups')?.let((elem) =>
          elem
              .findElements('member')
              .map(SecurityGroupMembership.fromXml)
              .toList()),
      snapshotRetentionLimit:
          _s.extractXmlIntValue(elem, 'SnapshotRetentionLimit'),
      snapshotWindow: _s.extractXmlStringValue(elem, 'SnapshotWindow'),
      transitEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'TransitEncryptionEnabled'),
      transitEncryptionMode: _s
          .extractXmlStringValue(elem, 'TransitEncryptionMode')
          ?.toTransitEncryptionMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final atRestEncryptionEnabled = this.atRestEncryptionEnabled;
    final authTokenEnabled = this.authTokenEnabled;
    final authTokenLastModifiedDate = this.authTokenLastModifiedDate;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final cacheClusterCreateTime = this.cacheClusterCreateTime;
    final cacheClusterId = this.cacheClusterId;
    final cacheClusterStatus = this.cacheClusterStatus;
    final cacheNodeType = this.cacheNodeType;
    final cacheNodes = this.cacheNodes;
    final cacheParameterGroup = this.cacheParameterGroup;
    final cacheSecurityGroups = this.cacheSecurityGroups;
    final cacheSubnetGroupName = this.cacheSubnetGroupName;
    final clientDownloadLandingPage = this.clientDownloadLandingPage;
    final configurationEndpoint = this.configurationEndpoint;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final ipDiscovery = this.ipDiscovery;
    final logDeliveryConfigurations = this.logDeliveryConfigurations;
    final networkType = this.networkType;
    final notificationConfiguration = this.notificationConfiguration;
    final numCacheNodes = this.numCacheNodes;
    final pendingModifiedValues = this.pendingModifiedValues;
    final preferredAvailabilityZone = this.preferredAvailabilityZone;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final preferredOutpostArn = this.preferredOutpostArn;
    final replicationGroupId = this.replicationGroupId;
    final replicationGroupLogDeliveryEnabled =
        this.replicationGroupLogDeliveryEnabled;
    final securityGroups = this.securityGroups;
    final snapshotRetentionLimit = this.snapshotRetentionLimit;
    final snapshotWindow = this.snapshotWindow;
    final transitEncryptionEnabled = this.transitEncryptionEnabled;
    final transitEncryptionMode = this.transitEncryptionMode;
    return {
      if (arn != null) 'ARN': arn,
      if (atRestEncryptionEnabled != null)
        'AtRestEncryptionEnabled': atRestEncryptionEnabled,
      if (authTokenEnabled != null) 'AuthTokenEnabled': authTokenEnabled,
      if (authTokenLastModifiedDate != null)
        'AuthTokenLastModifiedDate': iso8601ToJson(authTokenLastModifiedDate),
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (cacheClusterCreateTime != null)
        'CacheClusterCreateTime': iso8601ToJson(cacheClusterCreateTime),
      if (cacheClusterId != null) 'CacheClusterId': cacheClusterId,
      if (cacheClusterStatus != null) 'CacheClusterStatus': cacheClusterStatus,
      if (cacheNodeType != null) 'CacheNodeType': cacheNodeType,
      if (cacheNodes != null) 'CacheNodes': cacheNodes,
      if (cacheParameterGroup != null)
        'CacheParameterGroup': cacheParameterGroup,
      if (cacheSecurityGroups != null)
        'CacheSecurityGroups': cacheSecurityGroups,
      if (cacheSubnetGroupName != null)
        'CacheSubnetGroupName': cacheSubnetGroupName,
      if (clientDownloadLandingPage != null)
        'ClientDownloadLandingPage': clientDownloadLandingPage,
      if (configurationEndpoint != null)
        'ConfigurationEndpoint': configurationEndpoint,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (ipDiscovery != null) 'IpDiscovery': ipDiscovery.toValue(),
      if (logDeliveryConfigurations != null)
        'LogDeliveryConfigurations': logDeliveryConfigurations,
      if (networkType != null) 'NetworkType': networkType.toValue(),
      if (notificationConfiguration != null)
        'NotificationConfiguration': notificationConfiguration,
      if (numCacheNodes != null) 'NumCacheNodes': numCacheNodes,
      if (pendingModifiedValues != null)
        'PendingModifiedValues': pendingModifiedValues,
      if (preferredAvailabilityZone != null)
        'PreferredAvailabilityZone': preferredAvailabilityZone,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (preferredOutpostArn != null)
        'PreferredOutpostArn': preferredOutpostArn,
      if (replicationGroupId != null) 'ReplicationGroupId': replicationGroupId,
      if (replicationGroupLogDeliveryEnabled != null)
        'ReplicationGroupLogDeliveryEnabled':
            replicationGroupLogDeliveryEnabled,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (snapshotRetentionLimit != null)
        'SnapshotRetentionLimit': snapshotRetentionLimit,
      if (snapshotWindow != null) 'SnapshotWindow': snapshotWindow,
      if (transitEncryptionEnabled != null)
        'TransitEncryptionEnabled': transitEncryptionEnabled,
      if (transitEncryptionMode != null)
        'TransitEncryptionMode': transitEncryptionMode.toValue(),
    };
  }
}

/// Represents the output of a <code>DescribeCacheClusters</code> operation.
class CacheClusterMessage {
  /// A list of clusters. Each item in the list contains detailed information
  /// about one cluster.
  final List<CacheCluster>? cacheClusters;

  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  CacheClusterMessage({
    this.cacheClusters,
    this.marker,
  });
  factory CacheClusterMessage.fromXml(_s.XmlElement elem) {
    return CacheClusterMessage(
      cacheClusters: _s.extractXmlChild(elem, 'CacheClusters')?.let((elem) =>
          elem.findElements('CacheCluster').map(CacheCluster.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheClusters = this.cacheClusters;
    final marker = this.marker;
    return {
      if (cacheClusters != null) 'CacheClusters': cacheClusters,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Provides all of the details about a particular cache engine version.
class CacheEngineVersion {
  /// The description of the cache engine.
  final String? cacheEngineDescription;

  /// The description of the cache engine version.
  final String? cacheEngineVersionDescription;

  /// The name of the cache parameter group family associated with this cache
  /// engine.
  ///
  /// Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> |
  /// <code>memcached1.6</code> | <code>redis2.6</code> | <code>redis2.8</code> |
  /// <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> |
  /// <code>redis6.x</code> | <code>redis7</code>
  final String? cacheParameterGroupFamily;

  /// The name of the cache engine.
  final String? engine;

  /// The version number of the cache engine.
  final String? engineVersion;

  CacheEngineVersion({
    this.cacheEngineDescription,
    this.cacheEngineVersionDescription,
    this.cacheParameterGroupFamily,
    this.engine,
    this.engineVersion,
  });
  factory CacheEngineVersion.fromXml(_s.XmlElement elem) {
    return CacheEngineVersion(
      cacheEngineDescription:
          _s.extractXmlStringValue(elem, 'CacheEngineDescription'),
      cacheEngineVersionDescription:
          _s.extractXmlStringValue(elem, 'CacheEngineVersionDescription'),
      cacheParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'CacheParameterGroupFamily'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheEngineDescription = this.cacheEngineDescription;
    final cacheEngineVersionDescription = this.cacheEngineVersionDescription;
    final cacheParameterGroupFamily = this.cacheParameterGroupFamily;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    return {
      if (cacheEngineDescription != null)
        'CacheEngineDescription': cacheEngineDescription,
      if (cacheEngineVersionDescription != null)
        'CacheEngineVersionDescription': cacheEngineVersionDescription,
      if (cacheParameterGroupFamily != null)
        'CacheParameterGroupFamily': cacheParameterGroupFamily,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
    };
  }
}

/// Represents the output of a <a>DescribeCacheEngineVersions</a> operation.
class CacheEngineVersionMessage {
  /// A list of cache engine version details. Each element in the list contains
  /// detailed information about one cache engine version.
  final List<CacheEngineVersion>? cacheEngineVersions;

  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  CacheEngineVersionMessage({
    this.cacheEngineVersions,
    this.marker,
  });
  factory CacheEngineVersionMessage.fromXml(_s.XmlElement elem) {
    return CacheEngineVersionMessage(
      cacheEngineVersions: _s.extractXmlChild(elem, 'CacheEngineVersions')?.let(
          (elem) => elem
              .findElements('CacheEngineVersion')
              .map(CacheEngineVersion.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheEngineVersions = this.cacheEngineVersions;
    final marker = this.marker;
    return {
      if (cacheEngineVersions != null)
        'CacheEngineVersions': cacheEngineVersions,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Represents an individual cache node within a cluster. Each cache node runs
/// its own instance of the cluster's protocol-compliant caching software -
/// either Memcached or Redis.
///
/// The following node types are supported by ElastiCache. Generally speaking,
/// the current generation types provide more memory and computational power at
/// lower cost when compared to their equivalent previous generation
/// counterparts.
///
/// <ul>
/// <li>
/// General purpose:
///
/// <ul>
/// <li>
/// Current generation:
///
/// <b>M7g node types</b>: <code>cache.m7g.large</code>,
/// <code>cache.m7g.xlarge</code>, <code>cache.m7g.2xlarge</code>,
/// <code>cache.m7g.4xlarge</code>, <code>cache.m7g.8xlarge</code>,
/// <code>cache.m7g.12xlarge</code>, <code>cache.m7g.16xlarge</code>
/// <note>
/// For region availability, see <a
/// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
/// Node Types</a>
/// </note>
/// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
/// and for Memcached engine version 1.5.16 onward):
/// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
/// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
/// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
/// <code>cache.m6g.16xlarge</code>
///
/// <b>M5 node types:</b> <code>cache.m5.large</code>,
/// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
/// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
/// <code>cache.m5.24xlarge</code>
///
/// <b>M4 node types:</b> <code>cache.m4.large</code>,
/// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
/// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
///
/// <b>T4g node types</b> (available only for Redis engine version 5.0.6 onward
/// and Memcached engine version 1.5.16 onward): <code>cache.t4g.micro</code>,
/// <code>cache.t4g.small</code>, <code>cache.t4g.medium</code>
///
/// <b>T3 node types:</b> <code>cache.t3.micro</code>,
/// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
///
/// <b>T2 node types:</b> <code>cache.t2.micro</code>,
/// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
/// </li>
/// <li>
/// Previous generation: (not recommended. Existing clusters are still supported
/// but creation of new clusters is not supported for these types.)
///
/// <b>T1 node types:</b> <code>cache.t1.micro</code>
///
/// <b>M1 node types:</b> <code>cache.m1.small</code>,
/// <code>cache.m1.medium</code>, <code>cache.m1.large</code>,
/// <code>cache.m1.xlarge</code>
///
/// <b>M3 node types:</b> <code>cache.m3.medium</code>,
/// <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>,
/// <code>cache.m3.2xlarge</code>
/// </li>
/// </ul> </li>
/// <li>
/// Compute optimized:
///
/// <ul>
/// <li>
/// Previous generation: (not recommended. Existing clusters are still supported
/// but creation of new clusters is not supported for these types.)
///
/// <b>C1 node types:</b> <code>cache.c1.xlarge</code>
/// </li>
/// </ul> </li>
/// <li>
/// Memory optimized:
///
/// <ul>
/// <li>
/// Current generation:
///
/// <b>R7g node types</b>: <code>cache.r7g.large</code>,
/// <code>cache.r7g.xlarge</code>, <code>cache.r7g.2xlarge</code>,
/// <code>cache.r7g.4xlarge</code>, <code>cache.r7g.8xlarge</code>,
/// <code>cache.r7g.12xlarge</code>, <code>cache.r7g.16xlarge</code>
/// <note>
/// For region availability, see <a
/// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
/// Node Types</a>
/// </note>
/// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
/// and for Memcached engine version 1.5.16 onward):
/// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
/// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
/// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
/// <code>cache.r6g.16xlarge</code>
///
/// <b>R5 node types:</b> <code>cache.r5.large</code>,
/// <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>,
/// <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>,
/// <code>cache.r5.24xlarge</code>
///
/// <b>R4 node types:</b> <code>cache.r4.large</code>,
/// <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>,
/// <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>,
/// <code>cache.r4.16xlarge</code>
/// </li>
/// <li>
/// Previous generation: (not recommended. Existing clusters are still supported
/// but creation of new clusters is not supported for these types.)
///
/// <b>M2 node types:</b> <code>cache.m2.xlarge</code>,
/// <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code>
///
/// <b>R3 node types:</b> <code>cache.r3.large</code>,
/// <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>,
/// <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code>
/// </li>
/// </ul> </li>
/// </ul>
/// <b>Additional node type info</b>
///
/// <ul>
/// <li>
/// All current generation instance types are created in Amazon VPC by default.
/// </li>
/// <li>
/// Redis append-only files (AOF) are not supported for T1 or T2 instances.
/// </li>
/// <li>
/// Redis Multi-AZ with automatic failover is not supported on T1 instances.
/// </li>
/// <li>
/// Redis configuration variables <code>appendonly</code> and
/// <code>appendfsync</code> are not supported on Redis version 2.8.22 and
/// later.
/// </li>
/// </ul>
class CacheNode {
  /// The date and time when the cache node was created.
  final DateTime? cacheNodeCreateTime;

  /// The cache node identifier. A node ID is a numeric identifier (0001, 0002,
  /// etc.). The combination of cluster ID and node ID uniquely identifies every
  /// cache node used in a customer's Amazon account.
  final String? cacheNodeId;

  /// The current state of this cache node, one of the following values:
  /// <code>available</code>, <code>creating</code>, <code>rebooting</code>, or
  /// <code>deleting</code>.
  final String? cacheNodeStatus;

  /// The Availability Zone where this node was created and now resides.
  final String? customerAvailabilityZone;

  /// The customer outpost ARN of the cache node.
  final String? customerOutpostArn;

  /// The hostname for connecting to this cache node.
  final Endpoint? endpoint;

  /// The status of the parameter group applied to this cache node.
  final String? parameterGroupStatus;

  /// The ID of the primary node to which this read replica node is synchronized.
  /// If this field is empty, this node is not associated with a primary cluster.
  final String? sourceCacheNodeId;

  CacheNode({
    this.cacheNodeCreateTime,
    this.cacheNodeId,
    this.cacheNodeStatus,
    this.customerAvailabilityZone,
    this.customerOutpostArn,
    this.endpoint,
    this.parameterGroupStatus,
    this.sourceCacheNodeId,
  });
  factory CacheNode.fromXml(_s.XmlElement elem) {
    return CacheNode(
      cacheNodeCreateTime:
          _s.extractXmlDateTimeValue(elem, 'CacheNodeCreateTime'),
      cacheNodeId: _s.extractXmlStringValue(elem, 'CacheNodeId'),
      cacheNodeStatus: _s.extractXmlStringValue(elem, 'CacheNodeStatus'),
      customerAvailabilityZone:
          _s.extractXmlStringValue(elem, 'CustomerAvailabilityZone'),
      customerOutpostArn: _s.extractXmlStringValue(elem, 'CustomerOutpostArn'),
      endpoint: _s.extractXmlChild(elem, 'Endpoint')?.let(Endpoint.fromXml),
      parameterGroupStatus:
          _s.extractXmlStringValue(elem, 'ParameterGroupStatus'),
      sourceCacheNodeId: _s.extractXmlStringValue(elem, 'SourceCacheNodeId'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheNodeCreateTime = this.cacheNodeCreateTime;
    final cacheNodeId = this.cacheNodeId;
    final cacheNodeStatus = this.cacheNodeStatus;
    final customerAvailabilityZone = this.customerAvailabilityZone;
    final customerOutpostArn = this.customerOutpostArn;
    final endpoint = this.endpoint;
    final parameterGroupStatus = this.parameterGroupStatus;
    final sourceCacheNodeId = this.sourceCacheNodeId;
    return {
      if (cacheNodeCreateTime != null)
        'CacheNodeCreateTime': iso8601ToJson(cacheNodeCreateTime),
      if (cacheNodeId != null) 'CacheNodeId': cacheNodeId,
      if (cacheNodeStatus != null) 'CacheNodeStatus': cacheNodeStatus,
      if (customerAvailabilityZone != null)
        'CustomerAvailabilityZone': customerAvailabilityZone,
      if (customerOutpostArn != null) 'CustomerOutpostArn': customerOutpostArn,
      if (endpoint != null) 'Endpoint': endpoint,
      if (parameterGroupStatus != null)
        'ParameterGroupStatus': parameterGroupStatus,
      if (sourceCacheNodeId != null) 'SourceCacheNodeId': sourceCacheNodeId,
    };
  }
}

/// A parameter that has a different value for each cache node type it is
/// applied to. For example, in a Redis cluster, a <code>cache.m1.large</code>
/// cache node type would have a larger <code>maxmemory</code> value than a
/// <code>cache.m1.small</code> type.
class CacheNodeTypeSpecificParameter {
  /// The valid range of values for the parameter.
  final String? allowedValues;

  /// A list of cache node types and their corresponding values for this
  /// parameter.
  final List<CacheNodeTypeSpecificValue>? cacheNodeTypeSpecificValues;

  /// Indicates whether a change to the parameter is applied immediately or
  /// requires a reboot for the change to be applied. You can force a reboot or
  /// wait until the next maintenance window's reboot. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting
  /// a Cluster</a>.
  final ChangeType? changeType;

  /// The valid data type for the parameter.
  final String? dataType;

  /// A description of the parameter.
  final String? description;

  /// Indicates whether (<code>true</code>) or not (<code>false</code>) the
  /// parameter can be modified. Some parameters have security or operational
  /// implications that prevent them from being changed.
  final bool? isModifiable;

  /// The earliest cache engine version to which the parameter can apply.
  final String? minimumEngineVersion;

  /// The name of the parameter.
  final String? parameterName;

  /// The source of the parameter value.
  final String? source;

  CacheNodeTypeSpecificParameter({
    this.allowedValues,
    this.cacheNodeTypeSpecificValues,
    this.changeType,
    this.dataType,
    this.description,
    this.isModifiable,
    this.minimumEngineVersion,
    this.parameterName,
    this.source,
  });
  factory CacheNodeTypeSpecificParameter.fromXml(_s.XmlElement elem) {
    return CacheNodeTypeSpecificParameter(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      cacheNodeTypeSpecificValues: _s
          .extractXmlChild(elem, 'CacheNodeTypeSpecificValues')
          ?.let((elem) => elem
              .findElements('CacheNodeTypeSpecificValue')
              .map(CacheNodeTypeSpecificValue.fromXml)
              .toList()),
      changeType: _s.extractXmlStringValue(elem, 'ChangeType')?.toChangeType(),
      dataType: _s.extractXmlStringValue(elem, 'DataType'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      minimumEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumEngineVersion'),
      parameterName: _s.extractXmlStringValue(elem, 'ParameterName'),
      source: _s.extractXmlStringValue(elem, 'Source'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final cacheNodeTypeSpecificValues = this.cacheNodeTypeSpecificValues;
    final changeType = this.changeType;
    final dataType = this.dataType;
    final description = this.description;
    final isModifiable = this.isModifiable;
    final minimumEngineVersion = this.minimumEngineVersion;
    final parameterName = this.parameterName;
    final source = this.source;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (cacheNodeTypeSpecificValues != null)
        'CacheNodeTypeSpecificValues': cacheNodeTypeSpecificValues,
      if (changeType != null) 'ChangeType': changeType.toValue(),
      if (dataType != null) 'DataType': dataType,
      if (description != null) 'Description': description,
      if (isModifiable != null) 'IsModifiable': isModifiable,
      if (minimumEngineVersion != null)
        'MinimumEngineVersion': minimumEngineVersion,
      if (parameterName != null) 'ParameterName': parameterName,
      if (source != null) 'Source': source,
    };
  }
}

/// A value that applies only to a certain cache node type.
class CacheNodeTypeSpecificValue {
  /// The cache node type for which this value applies.
  final String? cacheNodeType;

  /// The value for the cache node type.
  final String? value;

  CacheNodeTypeSpecificValue({
    this.cacheNodeType,
    this.value,
  });
  factory CacheNodeTypeSpecificValue.fromXml(_s.XmlElement elem) {
    return CacheNodeTypeSpecificValue(
      cacheNodeType: _s.extractXmlStringValue(elem, 'CacheNodeType'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheNodeType = this.cacheNodeType;
    final value = this.value;
    return {
      if (cacheNodeType != null) 'CacheNodeType': cacheNodeType,
      if (value != null) 'Value': value,
    };
  }
}

/// The status of the service update on the cache node
class CacheNodeUpdateStatus {
  /// The node ID of the cache cluster
  final String? cacheNodeId;

  /// The deletion date of the node
  final DateTime? nodeDeletionDate;

  /// The end date of the update for a node
  final DateTime? nodeUpdateEndDate;

  /// Reflects whether the update was initiated by the customer or automatically
  /// applied
  final NodeUpdateInitiatedBy? nodeUpdateInitiatedBy;

  /// The date when the update is triggered
  final DateTime? nodeUpdateInitiatedDate;

  /// The start date of the update for a node
  final DateTime? nodeUpdateStartDate;

  /// The update status of the node
  final NodeUpdateStatus? nodeUpdateStatus;

  /// The date when the NodeUpdateStatus was last modified&gt;
  final DateTime? nodeUpdateStatusModifiedDate;

  CacheNodeUpdateStatus({
    this.cacheNodeId,
    this.nodeDeletionDate,
    this.nodeUpdateEndDate,
    this.nodeUpdateInitiatedBy,
    this.nodeUpdateInitiatedDate,
    this.nodeUpdateStartDate,
    this.nodeUpdateStatus,
    this.nodeUpdateStatusModifiedDate,
  });
  factory CacheNodeUpdateStatus.fromXml(_s.XmlElement elem) {
    return CacheNodeUpdateStatus(
      cacheNodeId: _s.extractXmlStringValue(elem, 'CacheNodeId'),
      nodeDeletionDate: _s.extractXmlDateTimeValue(elem, 'NodeDeletionDate'),
      nodeUpdateEndDate: _s.extractXmlDateTimeValue(elem, 'NodeUpdateEndDate'),
      nodeUpdateInitiatedBy: _s
          .extractXmlStringValue(elem, 'NodeUpdateInitiatedBy')
          ?.toNodeUpdateInitiatedBy(),
      nodeUpdateInitiatedDate:
          _s.extractXmlDateTimeValue(elem, 'NodeUpdateInitiatedDate'),
      nodeUpdateStartDate:
          _s.extractXmlDateTimeValue(elem, 'NodeUpdateStartDate'),
      nodeUpdateStatus: _s
          .extractXmlStringValue(elem, 'NodeUpdateStatus')
          ?.toNodeUpdateStatus(),
      nodeUpdateStatusModifiedDate:
          _s.extractXmlDateTimeValue(elem, 'NodeUpdateStatusModifiedDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheNodeId = this.cacheNodeId;
    final nodeDeletionDate = this.nodeDeletionDate;
    final nodeUpdateEndDate = this.nodeUpdateEndDate;
    final nodeUpdateInitiatedBy = this.nodeUpdateInitiatedBy;
    final nodeUpdateInitiatedDate = this.nodeUpdateInitiatedDate;
    final nodeUpdateStartDate = this.nodeUpdateStartDate;
    final nodeUpdateStatus = this.nodeUpdateStatus;
    final nodeUpdateStatusModifiedDate = this.nodeUpdateStatusModifiedDate;
    return {
      if (cacheNodeId != null) 'CacheNodeId': cacheNodeId,
      if (nodeDeletionDate != null)
        'NodeDeletionDate': iso8601ToJson(nodeDeletionDate),
      if (nodeUpdateEndDate != null)
        'NodeUpdateEndDate': iso8601ToJson(nodeUpdateEndDate),
      if (nodeUpdateInitiatedBy != null)
        'NodeUpdateInitiatedBy': nodeUpdateInitiatedBy.toValue(),
      if (nodeUpdateInitiatedDate != null)
        'NodeUpdateInitiatedDate': iso8601ToJson(nodeUpdateInitiatedDate),
      if (nodeUpdateStartDate != null)
        'NodeUpdateStartDate': iso8601ToJson(nodeUpdateStartDate),
      if (nodeUpdateStatus != null)
        'NodeUpdateStatus': nodeUpdateStatus.toValue(),
      if (nodeUpdateStatusModifiedDate != null)
        'NodeUpdateStatusModifiedDate':
            iso8601ToJson(nodeUpdateStatusModifiedDate),
    };
  }
}

/// Represents the output of a <code>CreateCacheParameterGroup</code> operation.
class CacheParameterGroup {
  /// The ARN (Amazon Resource Name) of the cache parameter group.
  final String? arn;

  /// The name of the cache parameter group family that this cache parameter group
  /// is compatible with.
  ///
  /// Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> |
  /// <code>memcached1.6</code> | <code>redis2.6</code> | <code>redis2.8</code> |
  /// <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> |
  /// <code>redis6.x</code> | <code>redis7</code>
  final String? cacheParameterGroupFamily;

  /// The name of the cache parameter group.
  final String? cacheParameterGroupName;

  /// The description for this cache parameter group.
  final String? description;

  /// Indicates whether the parameter group is associated with a Global datastore
  final bool? isGlobal;

  CacheParameterGroup({
    this.arn,
    this.cacheParameterGroupFamily,
    this.cacheParameterGroupName,
    this.description,
    this.isGlobal,
  });
  factory CacheParameterGroup.fromXml(_s.XmlElement elem) {
    return CacheParameterGroup(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      cacheParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'CacheParameterGroupFamily'),
      cacheParameterGroupName:
          _s.extractXmlStringValue(elem, 'CacheParameterGroupName'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isGlobal: _s.extractXmlBoolValue(elem, 'IsGlobal'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cacheParameterGroupFamily = this.cacheParameterGroupFamily;
    final cacheParameterGroupName = this.cacheParameterGroupName;
    final description = this.description;
    final isGlobal = this.isGlobal;
    return {
      if (arn != null) 'ARN': arn,
      if (cacheParameterGroupFamily != null)
        'CacheParameterGroupFamily': cacheParameterGroupFamily,
      if (cacheParameterGroupName != null)
        'CacheParameterGroupName': cacheParameterGroupName,
      if (description != null) 'Description': description,
      if (isGlobal != null) 'IsGlobal': isGlobal,
    };
  }
}

/// Represents the output of a <code>DescribeCacheParameters</code> operation.
class CacheParameterGroupDetails {
  /// A list of parameters specific to a particular cache node type. Each element
  /// in the list contains detailed information about one parameter.
  final List<CacheNodeTypeSpecificParameter>? cacheNodeTypeSpecificParameters;

  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  /// A list of <a>Parameter</a> instances.
  final List<Parameter>? parameters;

  CacheParameterGroupDetails({
    this.cacheNodeTypeSpecificParameters,
    this.marker,
    this.parameters,
  });
  factory CacheParameterGroupDetails.fromXml(_s.XmlElement elem) {
    return CacheParameterGroupDetails(
      cacheNodeTypeSpecificParameters: _s
          .extractXmlChild(elem, 'CacheNodeTypeSpecificParameters')
          ?.let((elem) => elem
              .findElements('CacheNodeTypeSpecificParameter')
              .map(CacheNodeTypeSpecificParameter.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('Parameter').map(Parameter.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheNodeTypeSpecificParameters =
        this.cacheNodeTypeSpecificParameters;
    final marker = this.marker;
    final parameters = this.parameters;
    return {
      if (cacheNodeTypeSpecificParameters != null)
        'CacheNodeTypeSpecificParameters': cacheNodeTypeSpecificParameters,
      if (marker != null) 'Marker': marker,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// Represents the output of one of the following operations:
///
/// <ul>
/// <li>
/// <code>ModifyCacheParameterGroup</code>
/// </li>
/// <li>
/// <code>ResetCacheParameterGroup</code>
/// </li>
/// </ul>
class CacheParameterGroupNameMessage {
  /// The name of the cache parameter group.
  final String? cacheParameterGroupName;

  CacheParameterGroupNameMessage({
    this.cacheParameterGroupName,
  });
  factory CacheParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return CacheParameterGroupNameMessage(
      cacheParameterGroupName:
          _s.extractXmlStringValue(elem, 'CacheParameterGroupName'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheParameterGroupName = this.cacheParameterGroupName;
    return {
      if (cacheParameterGroupName != null)
        'CacheParameterGroupName': cacheParameterGroupName,
    };
  }
}

/// Status of the cache parameter group.
class CacheParameterGroupStatus {
  /// A list of the cache node IDs which need to be rebooted for parameter changes
  /// to be applied. A node ID is a numeric identifier (0001, 0002, etc.).
  final List<String>? cacheNodeIdsToReboot;

  /// The name of the cache parameter group.
  final String? cacheParameterGroupName;

  /// The status of parameter updates.
  final String? parameterApplyStatus;

  CacheParameterGroupStatus({
    this.cacheNodeIdsToReboot,
    this.cacheParameterGroupName,
    this.parameterApplyStatus,
  });
  factory CacheParameterGroupStatus.fromXml(_s.XmlElement elem) {
    return CacheParameterGroupStatus(
      cacheNodeIdsToReboot: _s
          .extractXmlChild(elem, 'CacheNodeIdsToReboot')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'CacheNodeId')),
      cacheParameterGroupName:
          _s.extractXmlStringValue(elem, 'CacheParameterGroupName'),
      parameterApplyStatus:
          _s.extractXmlStringValue(elem, 'ParameterApplyStatus'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheNodeIdsToReboot = this.cacheNodeIdsToReboot;
    final cacheParameterGroupName = this.cacheParameterGroupName;
    final parameterApplyStatus = this.parameterApplyStatus;
    return {
      if (cacheNodeIdsToReboot != null)
        'CacheNodeIdsToReboot': cacheNodeIdsToReboot,
      if (cacheParameterGroupName != null)
        'CacheParameterGroupName': cacheParameterGroupName,
      if (parameterApplyStatus != null)
        'ParameterApplyStatus': parameterApplyStatus,
    };
  }
}

/// Represents the output of a <code>DescribeCacheParameterGroups</code>
/// operation.
class CacheParameterGroupsMessage {
  /// A list of cache parameter groups. Each element in the list contains detailed
  /// information about one cache parameter group.
  final List<CacheParameterGroup>? cacheParameterGroups;

  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  CacheParameterGroupsMessage({
    this.cacheParameterGroups,
    this.marker,
  });
  factory CacheParameterGroupsMessage.fromXml(_s.XmlElement elem) {
    return CacheParameterGroupsMessage(
      cacheParameterGroups: _s
          .extractXmlChild(elem, 'CacheParameterGroups')
          ?.let((elem) => elem
              .findElements('CacheParameterGroup')
              .map(CacheParameterGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheParameterGroups = this.cacheParameterGroups;
    final marker = this.marker;
    return {
      if (cacheParameterGroups != null)
        'CacheParameterGroups': cacheParameterGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Represents the output of one of the following operations:
///
/// <ul>
/// <li>
/// <code>AuthorizeCacheSecurityGroupIngress</code>
/// </li>
/// <li>
/// <code>CreateCacheSecurityGroup</code>
/// </li>
/// <li>
/// <code>RevokeCacheSecurityGroupIngress</code>
/// </li>
/// </ul>
class CacheSecurityGroup {
  /// The ARN of the cache security group,
  final String? arn;

  /// The name of the cache security group.
  final String? cacheSecurityGroupName;

  /// The description of the cache security group.
  final String? description;

  /// A list of Amazon EC2 security groups that are associated with this cache
  /// security group.
  final List<EC2SecurityGroup>? eC2SecurityGroups;

  /// The Amazon account ID of the cache security group owner.
  final String? ownerId;

  CacheSecurityGroup({
    this.arn,
    this.cacheSecurityGroupName,
    this.description,
    this.eC2SecurityGroups,
    this.ownerId,
  });
  factory CacheSecurityGroup.fromXml(_s.XmlElement elem) {
    return CacheSecurityGroup(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      cacheSecurityGroupName:
          _s.extractXmlStringValue(elem, 'CacheSecurityGroupName'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      eC2SecurityGroups: _s.extractXmlChild(elem, 'EC2SecurityGroups')?.let(
          (elem) => elem
              .findElements('EC2SecurityGroup')
              .map(EC2SecurityGroup.fromXml)
              .toList()),
      ownerId: _s.extractXmlStringValue(elem, 'OwnerId'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cacheSecurityGroupName = this.cacheSecurityGroupName;
    final description = this.description;
    final eC2SecurityGroups = this.eC2SecurityGroups;
    final ownerId = this.ownerId;
    return {
      if (arn != null) 'ARN': arn,
      if (cacheSecurityGroupName != null)
        'CacheSecurityGroupName': cacheSecurityGroupName,
      if (description != null) 'Description': description,
      if (eC2SecurityGroups != null) 'EC2SecurityGroups': eC2SecurityGroups,
      if (ownerId != null) 'OwnerId': ownerId,
    };
  }
}

/// Represents a cluster's status within a particular cache security group.
class CacheSecurityGroupMembership {
  /// The name of the cache security group.
  final String? cacheSecurityGroupName;

  /// The membership status in the cache security group. The status changes when a
  /// cache security group is modified, or when the cache security groups assigned
  /// to a cluster are modified.
  final String? status;

  CacheSecurityGroupMembership({
    this.cacheSecurityGroupName,
    this.status,
  });
  factory CacheSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return CacheSecurityGroupMembership(
      cacheSecurityGroupName:
          _s.extractXmlStringValue(elem, 'CacheSecurityGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheSecurityGroupName = this.cacheSecurityGroupName;
    final status = this.status;
    return {
      if (cacheSecurityGroupName != null)
        'CacheSecurityGroupName': cacheSecurityGroupName,
      if (status != null) 'Status': status,
    };
  }
}

/// Represents the output of a <code>DescribeCacheSecurityGroups</code>
/// operation.
class CacheSecurityGroupMessage {
  /// A list of cache security groups. Each element in the list contains detailed
  /// information about one group.
  final List<CacheSecurityGroup>? cacheSecurityGroups;

  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  CacheSecurityGroupMessage({
    this.cacheSecurityGroups,
    this.marker,
  });
  factory CacheSecurityGroupMessage.fromXml(_s.XmlElement elem) {
    return CacheSecurityGroupMessage(
      cacheSecurityGroups: _s.extractXmlChild(elem, 'CacheSecurityGroups')?.let(
          (elem) => elem
              .findElements('CacheSecurityGroup')
              .map(CacheSecurityGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheSecurityGroups = this.cacheSecurityGroups;
    final marker = this.marker;
    return {
      if (cacheSecurityGroups != null)
        'CacheSecurityGroups': cacheSecurityGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Represents the output of one of the following operations:
///
/// <ul>
/// <li>
/// <code>CreateCacheSubnetGroup</code>
/// </li>
/// <li>
/// <code>ModifyCacheSubnetGroup</code>
/// </li>
/// </ul>
class CacheSubnetGroup {
  /// The ARN (Amazon Resource Name) of the cache subnet group.
  final String? arn;

  /// The description of the cache subnet group.
  final String? cacheSubnetGroupDescription;

  /// The name of the cache subnet group.
  final String? cacheSubnetGroupName;

  /// A list of subnets associated with the cache subnet group.
  final List<Subnet>? subnets;

  /// Either <code>ipv4</code> | <code>ipv6</code> | <code>dual_stack</code>. IPv6
  /// is supported for workloads using Redis engine version 6.2 onward or
  /// Memcached engine version 1.6.6 on all instances built on the <a
  /// href="http://aws.amazon.com/ec2/nitro/">Nitro system</a>.
  final List<NetworkType>? supportedNetworkTypes;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet
  /// group.
  final String? vpcId;

  CacheSubnetGroup({
    this.arn,
    this.cacheSubnetGroupDescription,
    this.cacheSubnetGroupName,
    this.subnets,
    this.supportedNetworkTypes,
    this.vpcId,
  });
  factory CacheSubnetGroup.fromXml(_s.XmlElement elem) {
    return CacheSubnetGroup(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      cacheSubnetGroupDescription:
          _s.extractXmlStringValue(elem, 'CacheSubnetGroupDescription'),
      cacheSubnetGroupName:
          _s.extractXmlStringValue(elem, 'CacheSubnetGroupName'),
      subnets: _s.extractXmlChild(elem, 'Subnets')?.let(
          (elem) => elem.findElements('Subnet').map(Subnet.fromXml).toList()),
      supportedNetworkTypes: _s
          .extractXmlChild(elem, 'SupportedNetworkTypes')
          ?.let((elem) => _s
              .extractXmlStringListValues(elem, 'member')
              .map((s) => s.toNetworkType())
              .toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cacheSubnetGroupDescription = this.cacheSubnetGroupDescription;
    final cacheSubnetGroupName = this.cacheSubnetGroupName;
    final subnets = this.subnets;
    final supportedNetworkTypes = this.supportedNetworkTypes;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'ARN': arn,
      if (cacheSubnetGroupDescription != null)
        'CacheSubnetGroupDescription': cacheSubnetGroupDescription,
      if (cacheSubnetGroupName != null)
        'CacheSubnetGroupName': cacheSubnetGroupName,
      if (subnets != null) 'Subnets': subnets,
      if (supportedNetworkTypes != null)
        'SupportedNetworkTypes':
            supportedNetworkTypes.map((e) => e.toValue()).toList(),
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Represents the output of a <code>DescribeCacheSubnetGroups</code> operation.
class CacheSubnetGroupMessage {
  /// A list of cache subnet groups. Each element in the list contains detailed
  /// information about one group.
  final List<CacheSubnetGroup>? cacheSubnetGroups;

  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  CacheSubnetGroupMessage({
    this.cacheSubnetGroups,
    this.marker,
  });
  factory CacheSubnetGroupMessage.fromXml(_s.XmlElement elem) {
    return CacheSubnetGroupMessage(
      cacheSubnetGroups: _s.extractXmlChild(elem, 'CacheSubnetGroups')?.let(
          (elem) => elem
              .findElements('CacheSubnetGroup')
              .map(CacheSubnetGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheSubnetGroups = this.cacheSubnetGroups;
    final marker = this.marker;
    return {
      if (cacheSubnetGroups != null) 'CacheSubnetGroups': cacheSubnetGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// The usage limits for storage and ElastiCache Processing Units for the cache.
class CacheUsageLimits {
  /// The maximum data storage limit in the cache, expressed in Gigabytes.
  final DataStorage? dataStorage;
  final ECPUPerSecond? eCPUPerSecond;

  CacheUsageLimits({
    this.dataStorage,
    this.eCPUPerSecond,
  });
  factory CacheUsageLimits.fromXml(_s.XmlElement elem) {
    return CacheUsageLimits(
      dataStorage:
          _s.extractXmlChild(elem, 'DataStorage')?.let(DataStorage.fromXml),
      eCPUPerSecond:
          _s.extractXmlChild(elem, 'ECPUPerSecond')?.let(ECPUPerSecond.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final dataStorage = this.dataStorage;
    final eCPUPerSecond = this.eCPUPerSecond;
    return {
      if (dataStorage != null) 'DataStorage': dataStorage,
      if (eCPUPerSecond != null) 'ECPUPerSecond': eCPUPerSecond,
    };
  }
}

enum ChangeType {
  immediate,
  requiresReboot,
}

extension ChangeTypeValueExtension on ChangeType {
  String toValue() {
    switch (this) {
      case ChangeType.immediate:
        return 'immediate';
      case ChangeType.requiresReboot:
        return 'requires-reboot';
    }
  }
}

extension ChangeTypeFromString on String {
  ChangeType toChangeType() {
    switch (this) {
      case 'immediate':
        return ChangeType.immediate;
      case 'requires-reboot':
        return ChangeType.requiresReboot;
    }
    throw Exception('$this is not known in enum ChangeType');
  }
}

/// The configuration details of the CloudWatch Logs destination.
class CloudWatchLogsDestinationDetails {
  /// The name of the CloudWatch Logs log group.
  final String? logGroup;

  CloudWatchLogsDestinationDetails({
    this.logGroup,
  });
  factory CloudWatchLogsDestinationDetails.fromXml(_s.XmlElement elem) {
    return CloudWatchLogsDestinationDetails(
      logGroup: _s.extractXmlStringValue(elem, 'LogGroup'),
    );
  }

  Map<String, dynamic> toJson() {
    final logGroup = this.logGroup;
    return {
      if (logGroup != null) 'LogGroup': logGroup,
    };
  }
}

enum ClusterMode {
  enabled,
  disabled,
  compatible,
}

extension ClusterModeValueExtension on ClusterMode {
  String toValue() {
    switch (this) {
      case ClusterMode.enabled:
        return 'enabled';
      case ClusterMode.disabled:
        return 'disabled';
      case ClusterMode.compatible:
        return 'compatible';
    }
  }
}

extension ClusterModeFromString on String {
  ClusterMode toClusterMode() {
    switch (this) {
      case 'enabled':
        return ClusterMode.enabled;
      case 'disabled':
        return ClusterMode.disabled;
      case 'compatible':
        return ClusterMode.compatible;
    }
    throw Exception('$this is not known in enum ClusterMode');
  }
}

class CompleteMigrationResponse {
  final ReplicationGroup? replicationGroup;

  CompleteMigrationResponse({
    this.replicationGroup,
  });
  factory CompleteMigrationResponse.fromXml(_s.XmlElement elem) {
    return CompleteMigrationResponse(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

/// Node group (shard) configuration options when adding or removing replicas.
/// Each node group (shard) configuration has the following members:
/// NodeGroupId, NewReplicaCount, and PreferredAvailabilityZones.
class ConfigureShard {
  /// The number of replicas you want in this node group at the end of this
  /// operation. The maximum value for <code>NewReplicaCount</code> is 5. The
  /// minimum value depends upon the type of Redis replication group you are
  /// working with.
  ///
  /// The minimum number of replicas in a shard or replication group is:
  ///
  /// <ul>
  /// <li>
  /// Redis (cluster mode disabled)
  ///
  /// <ul>
  /// <li>
  /// If Multi-AZ: 1
  /// </li>
  /// <li>
  /// If Multi-AZ: 0
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Redis (cluster mode enabled): 0 (though you will not be able to failover to
  /// a replica if your primary node fails)
  /// </li>
  /// </ul>
  final int newReplicaCount;

  /// The 4-digit id for the node group you are configuring. For Redis (cluster
  /// mode disabled) replication groups, the node group id is always 0001. To find
  /// a Redis (cluster mode enabled)'s node group's (shard's) id, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/shard-find-id.html">Finding
  /// a Shard's Id</a>.
  final String nodeGroupId;

  /// A list of <code>PreferredAvailabilityZone</code> strings that specify which
  /// availability zones the replication group's nodes are to be in. The nummber
  /// of <code>PreferredAvailabilityZone</code> values must equal the value of
  /// <code>NewReplicaCount</code> plus 1 to account for the primary node. If this
  /// member of <code>ReplicaConfiguration</code> is omitted, ElastiCache for
  /// Redis selects the availability zone for each of the replicas.
  final List<String>? preferredAvailabilityZones;

  /// The outpost ARNs in which the cache cluster is created.
  final List<String>? preferredOutpostArns;

  ConfigureShard({
    required this.newReplicaCount,
    required this.nodeGroupId,
    this.preferredAvailabilityZones,
    this.preferredOutpostArns,
  });

  Map<String, dynamic> toJson() {
    final newReplicaCount = this.newReplicaCount;
    final nodeGroupId = this.nodeGroupId;
    final preferredAvailabilityZones = this.preferredAvailabilityZones;
    final preferredOutpostArns = this.preferredOutpostArns;
    return {
      'NewReplicaCount': newReplicaCount,
      'NodeGroupId': nodeGroupId,
      if (preferredAvailabilityZones != null)
        'PreferredAvailabilityZones': preferredAvailabilityZones,
      if (preferredOutpostArns != null)
        'PreferredOutpostArns': preferredOutpostArns,
    };
  }
}

class CopyServerlessCacheSnapshotResponse {
  /// The response for the attempt to copy the serverless cache snapshot.
  /// Available for Redis only.
  final ServerlessCacheSnapshot? serverlessCacheSnapshot;

  CopyServerlessCacheSnapshotResponse({
    this.serverlessCacheSnapshot,
  });
  factory CopyServerlessCacheSnapshotResponse.fromXml(_s.XmlElement elem) {
    return CopyServerlessCacheSnapshotResponse(
      serverlessCacheSnapshot: _s
          .extractXmlChild(elem, 'ServerlessCacheSnapshot')
          ?.let(ServerlessCacheSnapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serverlessCacheSnapshot = this.serverlessCacheSnapshot;
    return {
      if (serverlessCacheSnapshot != null)
        'ServerlessCacheSnapshot': serverlessCacheSnapshot,
    };
  }
}

class CopySnapshotResult {
  final Snapshot? snapshot;

  CopySnapshotResult({
    this.snapshot,
  });
  factory CopySnapshotResult.fromXml(_s.XmlElement elem) {
    return CopySnapshotResult(
      snapshot: _s.extractXmlChild(elem, 'Snapshot')?.let(Snapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class CreateCacheClusterResult {
  final CacheCluster? cacheCluster;

  CreateCacheClusterResult({
    this.cacheCluster,
  });
  factory CreateCacheClusterResult.fromXml(_s.XmlElement elem) {
    return CreateCacheClusterResult(
      cacheCluster:
          _s.extractXmlChild(elem, 'CacheCluster')?.let(CacheCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheCluster = this.cacheCluster;
    return {
      if (cacheCluster != null) 'CacheCluster': cacheCluster,
    };
  }
}

class CreateCacheParameterGroupResult {
  final CacheParameterGroup? cacheParameterGroup;

  CreateCacheParameterGroupResult({
    this.cacheParameterGroup,
  });
  factory CreateCacheParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateCacheParameterGroupResult(
      cacheParameterGroup: _s
          .extractXmlChild(elem, 'CacheParameterGroup')
          ?.let(CacheParameterGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheParameterGroup = this.cacheParameterGroup;
    return {
      if (cacheParameterGroup != null)
        'CacheParameterGroup': cacheParameterGroup,
    };
  }
}

class CreateCacheSecurityGroupResult {
  final CacheSecurityGroup? cacheSecurityGroup;

  CreateCacheSecurityGroupResult({
    this.cacheSecurityGroup,
  });
  factory CreateCacheSecurityGroupResult.fromXml(_s.XmlElement elem) {
    return CreateCacheSecurityGroupResult(
      cacheSecurityGroup: _s
          .extractXmlChild(elem, 'CacheSecurityGroup')
          ?.let(CacheSecurityGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheSecurityGroup = this.cacheSecurityGroup;
    return {
      if (cacheSecurityGroup != null) 'CacheSecurityGroup': cacheSecurityGroup,
    };
  }
}

class CreateCacheSubnetGroupResult {
  final CacheSubnetGroup? cacheSubnetGroup;

  CreateCacheSubnetGroupResult({
    this.cacheSubnetGroup,
  });
  factory CreateCacheSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return CreateCacheSubnetGroupResult(
      cacheSubnetGroup: _s
          .extractXmlChild(elem, 'CacheSubnetGroup')
          ?.let(CacheSubnetGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheSubnetGroup = this.cacheSubnetGroup;
    return {
      if (cacheSubnetGroup != null) 'CacheSubnetGroup': cacheSubnetGroup,
    };
  }
}

class CreateGlobalReplicationGroupResult {
  final GlobalReplicationGroup? globalReplicationGroup;

  CreateGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory CreateGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return CreateGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let(GlobalReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroup = this.globalReplicationGroup;
    return {
      if (globalReplicationGroup != null)
        'GlobalReplicationGroup': globalReplicationGroup,
    };
  }
}

class CreateReplicationGroupResult {
  final ReplicationGroup? replicationGroup;

  CreateReplicationGroupResult({
    this.replicationGroup,
  });
  factory CreateReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return CreateReplicationGroupResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

class CreateServerlessCacheResponse {
  /// The response for the attempt to create the serverless cache.
  final ServerlessCache? serverlessCache;

  CreateServerlessCacheResponse({
    this.serverlessCache,
  });
  factory CreateServerlessCacheResponse.fromXml(_s.XmlElement elem) {
    return CreateServerlessCacheResponse(
      serverlessCache: _s
          .extractXmlChild(elem, 'ServerlessCache')
          ?.let(ServerlessCache.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serverlessCache = this.serverlessCache;
    return {
      if (serverlessCache != null) 'ServerlessCache': serverlessCache,
    };
  }
}

class CreateServerlessCacheSnapshotResponse {
  /// The state of a serverless cache snapshot at a specific point in time, to the
  /// millisecond. Available for Redis only.
  final ServerlessCacheSnapshot? serverlessCacheSnapshot;

  CreateServerlessCacheSnapshotResponse({
    this.serverlessCacheSnapshot,
  });
  factory CreateServerlessCacheSnapshotResponse.fromXml(_s.XmlElement elem) {
    return CreateServerlessCacheSnapshotResponse(
      serverlessCacheSnapshot: _s
          .extractXmlChild(elem, 'ServerlessCacheSnapshot')
          ?.let(ServerlessCacheSnapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serverlessCacheSnapshot = this.serverlessCacheSnapshot;
    return {
      if (serverlessCacheSnapshot != null)
        'ServerlessCacheSnapshot': serverlessCacheSnapshot,
    };
  }
}

class CreateSnapshotResult {
  final Snapshot? snapshot;

  CreateSnapshotResult({
    this.snapshot,
  });
  factory CreateSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateSnapshotResult(
      snapshot: _s.extractXmlChild(elem, 'Snapshot')?.let(Snapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

/// The endpoint from which data should be migrated.
class CustomerNodeEndpoint {
  /// The address of the node endpoint
  final String? address;

  /// The port of the node endpoint
  final int? port;

  CustomerNodeEndpoint({
    this.address,
    this.port,
  });

  Map<String, dynamic> toJson() {
    final address = this.address;
    final port = this.port;
    return {
      if (address != null) 'Address': address,
      if (port != null) 'Port': port,
    };
  }
}

/// The data storage limit.
class DataStorage {
  /// The unit that the storage is measured in, in GB.
  final DataStorageUnit unit;

  /// The upper limit for data storage the cache is set to use.
  final int? maximum;

  /// The lower limit for data storage the cache is set to use.
  final int? minimum;

  DataStorage({
    required this.unit,
    this.maximum,
    this.minimum,
  });
  factory DataStorage.fromXml(_s.XmlElement elem) {
    return DataStorage(
      unit: _s.extractXmlStringValue(elem, 'Unit')!.toDataStorageUnit(),
      maximum: _s.extractXmlIntValue(elem, 'Maximum'),
      minimum: _s.extractXmlIntValue(elem, 'Minimum'),
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final maximum = this.maximum;
    final minimum = this.minimum;
    return {
      'Unit': unit.toValue(),
      if (maximum != null) 'Maximum': maximum,
      if (minimum != null) 'Minimum': minimum,
    };
  }
}

enum DataStorageUnit {
  gb,
}

extension DataStorageUnitValueExtension on DataStorageUnit {
  String toValue() {
    switch (this) {
      case DataStorageUnit.gb:
        return 'GB';
    }
  }
}

extension DataStorageUnitFromString on String {
  DataStorageUnit toDataStorageUnit() {
    switch (this) {
      case 'GB':
        return DataStorageUnit.gb;
    }
    throw Exception('$this is not known in enum DataStorageUnit');
  }
}

enum DataTieringStatus {
  enabled,
  disabled,
}

extension DataTieringStatusValueExtension on DataTieringStatus {
  String toValue() {
    switch (this) {
      case DataTieringStatus.enabled:
        return 'enabled';
      case DataTieringStatus.disabled:
        return 'disabled';
    }
  }
}

extension DataTieringStatusFromString on String {
  DataTieringStatus toDataTieringStatus() {
    switch (this) {
      case 'enabled':
        return DataTieringStatus.enabled;
      case 'disabled':
        return DataTieringStatus.disabled;
    }
    throw Exception('$this is not known in enum DataTieringStatus');
  }
}

class DecreaseNodeGroupsInGlobalReplicationGroupResult {
  final GlobalReplicationGroup? globalReplicationGroup;

  DecreaseNodeGroupsInGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory DecreaseNodeGroupsInGlobalReplicationGroupResult.fromXml(
      _s.XmlElement elem) {
    return DecreaseNodeGroupsInGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let(GlobalReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroup = this.globalReplicationGroup;
    return {
      if (globalReplicationGroup != null)
        'GlobalReplicationGroup': globalReplicationGroup,
    };
  }
}

class DecreaseReplicaCountResult {
  final ReplicationGroup? replicationGroup;

  DecreaseReplicaCountResult({
    this.replicationGroup,
  });
  factory DecreaseReplicaCountResult.fromXml(_s.XmlElement elem) {
    return DecreaseReplicaCountResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

class DeleteCacheClusterResult {
  final CacheCluster? cacheCluster;

  DeleteCacheClusterResult({
    this.cacheCluster,
  });
  factory DeleteCacheClusterResult.fromXml(_s.XmlElement elem) {
    return DeleteCacheClusterResult(
      cacheCluster:
          _s.extractXmlChild(elem, 'CacheCluster')?.let(CacheCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheCluster = this.cacheCluster;
    return {
      if (cacheCluster != null) 'CacheCluster': cacheCluster,
    };
  }
}

class DeleteGlobalReplicationGroupResult {
  final GlobalReplicationGroup? globalReplicationGroup;

  DeleteGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory DeleteGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return DeleteGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let(GlobalReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroup = this.globalReplicationGroup;
    return {
      if (globalReplicationGroup != null)
        'GlobalReplicationGroup': globalReplicationGroup,
    };
  }
}

class DeleteReplicationGroupResult {
  final ReplicationGroup? replicationGroup;

  DeleteReplicationGroupResult({
    this.replicationGroup,
  });
  factory DeleteReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return DeleteReplicationGroupResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

class DeleteServerlessCacheResponse {
  /// Provides the details of the specified serverless cache that is about to be
  /// deleted.
  final ServerlessCache? serverlessCache;

  DeleteServerlessCacheResponse({
    this.serverlessCache,
  });
  factory DeleteServerlessCacheResponse.fromXml(_s.XmlElement elem) {
    return DeleteServerlessCacheResponse(
      serverlessCache: _s
          .extractXmlChild(elem, 'ServerlessCache')
          ?.let(ServerlessCache.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serverlessCache = this.serverlessCache;
    return {
      if (serverlessCache != null) 'ServerlessCache': serverlessCache,
    };
  }
}

class DeleteServerlessCacheSnapshotResponse {
  /// The snapshot to be deleted. Available for Redis only.
  final ServerlessCacheSnapshot? serverlessCacheSnapshot;

  DeleteServerlessCacheSnapshotResponse({
    this.serverlessCacheSnapshot,
  });
  factory DeleteServerlessCacheSnapshotResponse.fromXml(_s.XmlElement elem) {
    return DeleteServerlessCacheSnapshotResponse(
      serverlessCacheSnapshot: _s
          .extractXmlChild(elem, 'ServerlessCacheSnapshot')
          ?.let(ServerlessCacheSnapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serverlessCacheSnapshot = this.serverlessCacheSnapshot;
    return {
      if (serverlessCacheSnapshot != null)
        'ServerlessCacheSnapshot': serverlessCacheSnapshot,
    };
  }
}

class DeleteSnapshotResult {
  final Snapshot? snapshot;

  DeleteSnapshotResult({
    this.snapshot,
  });
  factory DeleteSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteSnapshotResult(
      snapshot: _s.extractXmlChild(elem, 'Snapshot')?.let(Snapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
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

class DescribeGlobalReplicationGroupsResult {
  /// Indicates the slot configuration and global identifier for each slice group.
  final List<GlobalReplicationGroup>? globalReplicationGroups;

  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords. &gt;
  final String? marker;

  DescribeGlobalReplicationGroupsResult({
    this.globalReplicationGroups,
    this.marker,
  });
  factory DescribeGlobalReplicationGroupsResult.fromXml(_s.XmlElement elem) {
    return DescribeGlobalReplicationGroupsResult(
      globalReplicationGroups: _s
          .extractXmlChild(elem, 'GlobalReplicationGroups')
          ?.let((elem) => elem
              .findElements('GlobalReplicationGroup')
              .map(GlobalReplicationGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroups = this.globalReplicationGroups;
    final marker = this.marker;
    return {
      if (globalReplicationGroups != null)
        'GlobalReplicationGroups': globalReplicationGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DescribeServerlessCacheSnapshotsResponse {
  /// An optional marker returned from a prior request to support pagination of
  /// results from this operation. If this parameter is specified, the response
  /// includes only records beyond the marker, up to the value specified by
  /// max-results. Available for Redis only.
  final String? nextToken;

  /// The serverless caches snapshots associated with a given description request.
  /// Available for Redis only.
  final List<ServerlessCacheSnapshot>? serverlessCacheSnapshots;

  DescribeServerlessCacheSnapshotsResponse({
    this.nextToken,
    this.serverlessCacheSnapshots,
  });
  factory DescribeServerlessCacheSnapshotsResponse.fromXml(_s.XmlElement elem) {
    return DescribeServerlessCacheSnapshotsResponse(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      serverlessCacheSnapshots: _s
          .extractXmlChild(elem, 'ServerlessCacheSnapshots')
          ?.let((elem) => elem
              .findElements('ServerlessCacheSnapshot')
              .map(ServerlessCacheSnapshot.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serverlessCacheSnapshots = this.serverlessCacheSnapshots;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (serverlessCacheSnapshots != null)
        'ServerlessCacheSnapshots': serverlessCacheSnapshots,
    };
  }
}

class DescribeServerlessCachesResponse {
  /// An optional marker returned from a prior request to support pagination of
  /// results from this operation. If this parameter is specified, the response
  /// includes only records beyond the marker, up to the value specified by
  /// MaxResults.
  final String? nextToken;

  /// The serverless caches associated with a given description request.
  final List<ServerlessCache>? serverlessCaches;

  DescribeServerlessCachesResponse({
    this.nextToken,
    this.serverlessCaches,
  });
  factory DescribeServerlessCachesResponse.fromXml(_s.XmlElement elem) {
    return DescribeServerlessCachesResponse(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      serverlessCaches: _s.extractXmlChild(elem, 'ServerlessCaches')?.let(
          (elem) => elem
              .findElements('member')
              .map(ServerlessCache.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serverlessCaches = this.serverlessCaches;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (serverlessCaches != null) 'ServerlessCaches': serverlessCaches,
    };
  }
}

/// Represents the output of a <code>DescribeSnapshots</code> operation.
class DescribeSnapshotsListMessage {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String? marker;

  /// A list of snapshots. Each item in the list contains detailed information
  /// about one snapshot.
  final List<Snapshot>? snapshots;

  DescribeSnapshotsListMessage({
    this.marker,
    this.snapshots,
  });
  factory DescribeSnapshotsListMessage.fromXml(_s.XmlElement elem) {
    return DescribeSnapshotsListMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      snapshots: _s.extractXmlChild(elem, 'Snapshots')?.let((elem) =>
          elem.findElements('Snapshot').map(Snapshot.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final snapshots = this.snapshots;
    return {
      if (marker != null) 'Marker': marker,
      if (snapshots != null) 'Snapshots': snapshots,
    };
  }
}

class DescribeUserGroupsResult {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords.&gt;
  final String? marker;

  /// Returns a list of user groups.
  final List<UserGroup>? userGroups;

  DescribeUserGroupsResult({
    this.marker,
    this.userGroups,
  });
  factory DescribeUserGroupsResult.fromXml(_s.XmlElement elem) {
    return DescribeUserGroupsResult(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      userGroups: _s.extractXmlChild(elem, 'UserGroups')?.let((elem) =>
          elem.findElements('member').map(UserGroup.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final userGroups = this.userGroups;
    return {
      if (marker != null) 'Marker': marker,
      if (userGroups != null) 'UserGroups': userGroups,
    };
  }
}

class DescribeUsersResult {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords. &gt;
  final String? marker;

  /// A list of users.
  final List<User>? users;

  DescribeUsersResult({
    this.marker,
    this.users,
  });
  factory DescribeUsersResult.fromXml(_s.XmlElement elem) {
    return DescribeUsersResult(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      users: _s.extractXmlChild(elem, 'Users')?.let(
          (elem) => elem.findElements('member').map(User.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final users = this.users;
    return {
      if (marker != null) 'Marker': marker,
      if (users != null) 'Users': users,
    };
  }
}

/// Configuration details of either a CloudWatch Logs destination or Kinesis
/// Data Firehose destination.
class DestinationDetails {
  /// The configuration details of the CloudWatch Logs destination.
  final CloudWatchLogsDestinationDetails? cloudWatchLogsDetails;

  /// The configuration details of the Kinesis Data Firehose destination.
  final KinesisFirehoseDestinationDetails? kinesisFirehoseDetails;

  DestinationDetails({
    this.cloudWatchLogsDetails,
    this.kinesisFirehoseDetails,
  });
  factory DestinationDetails.fromXml(_s.XmlElement elem) {
    return DestinationDetails(
      cloudWatchLogsDetails: _s
          .extractXmlChild(elem, 'CloudWatchLogsDetails')
          ?.let(CloudWatchLogsDestinationDetails.fromXml),
      kinesisFirehoseDetails: _s
          .extractXmlChild(elem, 'KinesisFirehoseDetails')
          ?.let(KinesisFirehoseDestinationDetails.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsDetails = this.cloudWatchLogsDetails;
    final kinesisFirehoseDetails = this.kinesisFirehoseDetails;
    return {
      if (cloudWatchLogsDetails != null)
        'CloudWatchLogsDetails': cloudWatchLogsDetails,
      if (kinesisFirehoseDetails != null)
        'KinesisFirehoseDetails': kinesisFirehoseDetails,
    };
  }
}

enum DestinationType {
  cloudwatchLogs,
  kinesisFirehose,
}

extension DestinationTypeValueExtension on DestinationType {
  String toValue() {
    switch (this) {
      case DestinationType.cloudwatchLogs:
        return 'cloudwatch-logs';
      case DestinationType.kinesisFirehose:
        return 'kinesis-firehose';
    }
  }
}

extension DestinationTypeFromString on String {
  DestinationType toDestinationType() {
    switch (this) {
      case 'cloudwatch-logs':
        return DestinationType.cloudwatchLogs;
      case 'kinesis-firehose':
        return DestinationType.kinesisFirehose;
    }
    throw Exception('$this is not known in enum DestinationType');
  }
}

class DisassociateGlobalReplicationGroupResult {
  final GlobalReplicationGroup? globalReplicationGroup;

  DisassociateGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory DisassociateGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return DisassociateGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let(GlobalReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroup = this.globalReplicationGroup;
    return {
      if (globalReplicationGroup != null)
        'GlobalReplicationGroup': globalReplicationGroup,
    };
  }
}

/// Provides ownership and status information for an Amazon EC2 security group.
class EC2SecurityGroup {
  /// The name of the Amazon EC2 security group.
  final String? eC2SecurityGroupName;

  /// The Amazon account ID of the Amazon EC2 security group owner.
  final String? eC2SecurityGroupOwnerId;

  /// The status of the Amazon EC2 security group.
  final String? status;

  EC2SecurityGroup({
    this.eC2SecurityGroupName,
    this.eC2SecurityGroupOwnerId,
    this.status,
  });
  factory EC2SecurityGroup.fromXml(_s.XmlElement elem) {
    return EC2SecurityGroup(
      eC2SecurityGroupName:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupName'),
      eC2SecurityGroupOwnerId:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupOwnerId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final eC2SecurityGroupName = this.eC2SecurityGroupName;
    final eC2SecurityGroupOwnerId = this.eC2SecurityGroupOwnerId;
    final status = this.status;
    return {
      if (eC2SecurityGroupName != null)
        'EC2SecurityGroupName': eC2SecurityGroupName,
      if (eC2SecurityGroupOwnerId != null)
        'EC2SecurityGroupOwnerId': eC2SecurityGroupOwnerId,
      if (status != null) 'Status': status,
    };
  }
}

/// The configuration for the number of ElastiCache Processing Units (ECPU) the
/// cache can consume per second.
class ECPUPerSecond {
  /// The configuration for the maximum number of ECPUs the cache can consume per
  /// second.
  final int? maximum;

  /// The configuration for the minimum number of ECPUs the cache should be able
  /// consume per second.
  final int? minimum;

  ECPUPerSecond({
    this.maximum,
    this.minimum,
  });
  factory ECPUPerSecond.fromXml(_s.XmlElement elem) {
    return ECPUPerSecond(
      maximum: _s.extractXmlIntValue(elem, 'Maximum'),
      minimum: _s.extractXmlIntValue(elem, 'Minimum'),
    );
  }

  Map<String, dynamic> toJson() {
    final maximum = this.maximum;
    final minimum = this.minimum;
    return {
      if (maximum != null) 'Maximum': maximum,
      if (minimum != null) 'Minimum': minimum,
    };
  }
}

/// Represents the information required for client programs to connect to a
/// cache node. This value is read-only.
class Endpoint {
  /// The DNS hostname of the cache node.
  final String? address;

  /// The port number that the cache engine is listening on.
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

  Map<String, dynamic> toJson() {
    final address = this.address;
    final port = this.port;
    return {
      if (address != null) 'Address': address,
      if (port != null) 'Port': port,
    };
  }
}

/// Represents the output of a <code>DescribeEngineDefaultParameters</code>
/// operation.
class EngineDefaults {
  /// A list of parameters specific to a particular cache node type. Each element
  /// in the list contains detailed information about one parameter.
  final List<CacheNodeTypeSpecificParameter>? cacheNodeTypeSpecificParameters;

  /// Specifies the name of the cache parameter group family to which the engine
  /// default parameters apply.
  ///
  /// Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> |
  /// <code>memcached1.6</code> | <code>redis2.6</code> | <code>redis2.8</code> |
  /// <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> |
  /// <code>redis6.0</code> | <code>redis6.x</code> | <code>redis7</code>
  final String? cacheParameterGroupFamily;

  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  /// Contains a list of engine default parameters.
  final List<Parameter>? parameters;

  EngineDefaults({
    this.cacheNodeTypeSpecificParameters,
    this.cacheParameterGroupFamily,
    this.marker,
    this.parameters,
  });
  factory EngineDefaults.fromXml(_s.XmlElement elem) {
    return EngineDefaults(
      cacheNodeTypeSpecificParameters: _s
          .extractXmlChild(elem, 'CacheNodeTypeSpecificParameters')
          ?.let((elem) => elem
              .findElements('CacheNodeTypeSpecificParameter')
              .map(CacheNodeTypeSpecificParameter.fromXml)
              .toList()),
      cacheParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'CacheParameterGroupFamily'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('Parameter').map(Parameter.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheNodeTypeSpecificParameters =
        this.cacheNodeTypeSpecificParameters;
    final cacheParameterGroupFamily = this.cacheParameterGroupFamily;
    final marker = this.marker;
    final parameters = this.parameters;
    return {
      if (cacheNodeTypeSpecificParameters != null)
        'CacheNodeTypeSpecificParameters': cacheNodeTypeSpecificParameters,
      if (cacheParameterGroupFamily != null)
        'CacheParameterGroupFamily': cacheParameterGroupFamily,
      if (marker != null) 'Marker': marker,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// Represents a single occurrence of something interesting within the system.
/// Some examples of events are creating a cluster, adding or removing a cache
/// node, or rebooting a node.
class Event {
  /// The date and time when the event occurred.
  final DateTime? date;

  /// The text of the event.
  final String? message;

  /// The identifier for the source of the event. For example, if the event
  /// occurred at the cluster level, the identifier would be the name of the
  /// cluster.
  final String? sourceIdentifier;

  /// Specifies the origin of this event - a cluster, a parameter group, a
  /// security group, etc.
  final SourceType? sourceType;

  Event({
    this.date,
    this.message,
    this.sourceIdentifier,
    this.sourceType,
  });
  factory Event.fromXml(_s.XmlElement elem) {
    return Event(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      message: _s.extractXmlStringValue(elem, 'Message'),
      sourceIdentifier: _s.extractXmlStringValue(elem, 'SourceIdentifier'),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType')?.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final message = this.message;
    final sourceIdentifier = this.sourceIdentifier;
    final sourceType = this.sourceType;
    return {
      if (date != null) 'Date': iso8601ToJson(date),
      if (message != null) 'Message': message,
      if (sourceIdentifier != null) 'SourceIdentifier': sourceIdentifier,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
    };
  }
}

/// Represents the output of a <code>DescribeEvents</code> operation.
class EventsMessage {
  /// A list of events. Each element in the list contains detailed information
  /// about one event.
  final List<Event>? events;

  /// Provides an identifier to allow retrieval of paginated results.
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

class ExportServerlessCacheSnapshotResponse {
  /// The state of a serverless cache at a specific point in time, to the
  /// millisecond. Available for Redis only.
  final ServerlessCacheSnapshot? serverlessCacheSnapshot;

  ExportServerlessCacheSnapshotResponse({
    this.serverlessCacheSnapshot,
  });
  factory ExportServerlessCacheSnapshotResponse.fromXml(_s.XmlElement elem) {
    return ExportServerlessCacheSnapshotResponse(
      serverlessCacheSnapshot: _s
          .extractXmlChild(elem, 'ServerlessCacheSnapshot')
          ?.let(ServerlessCacheSnapshot.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serverlessCacheSnapshot = this.serverlessCacheSnapshot;
    return {
      if (serverlessCacheSnapshot != null)
        'ServerlessCacheSnapshot': serverlessCacheSnapshot,
    };
  }
}

class FailoverGlobalReplicationGroupResult {
  final GlobalReplicationGroup? globalReplicationGroup;

  FailoverGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory FailoverGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return FailoverGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let(GlobalReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroup = this.globalReplicationGroup;
    return {
      if (globalReplicationGroup != null)
        'GlobalReplicationGroup': globalReplicationGroup,
    };
  }
}

/// Used to streamline results of a search based on the property being filtered.
class Filter {
  /// The property being filtered. For example, UserId.
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

/// Indicates the slot configuration and global identifier for a slice group.
class GlobalNodeGroup {
  /// The name of the global node group
  final String? globalNodeGroupId;

  /// The keyspace for this node group
  final String? slots;

  GlobalNodeGroup({
    this.globalNodeGroupId,
    this.slots,
  });
  factory GlobalNodeGroup.fromXml(_s.XmlElement elem) {
    return GlobalNodeGroup(
      globalNodeGroupId: _s.extractXmlStringValue(elem, 'GlobalNodeGroupId'),
      slots: _s.extractXmlStringValue(elem, 'Slots'),
    );
  }

  Map<String, dynamic> toJson() {
    final globalNodeGroupId = this.globalNodeGroupId;
    final slots = this.slots;
    return {
      if (globalNodeGroupId != null) 'GlobalNodeGroupId': globalNodeGroupId,
      if (slots != null) 'Slots': slots,
    };
  }
}

/// Consists of a primary cluster that accepts writes and an associated
/// secondary cluster that resides in a different Amazon region. The secondary
/// cluster accepts only reads. The primary cluster automatically replicates
/// updates to the secondary cluster.
///
/// <ul>
/// <li>
/// The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global
/// datastore, which is what you use to associate a secondary cluster.
/// </li>
/// </ul>
class GlobalReplicationGroup {
  /// The ARN (Amazon Resource Name) of the global replication group.
  final String? arn;

  /// A flag that enables encryption at rest when set to <code>true</code>.
  ///
  /// You cannot modify the value of <code>AtRestEncryptionEnabled</code> after
  /// the replication group is created. To enable encryption at rest on a
  /// replication group you must set <code>AtRestEncryptionEnabled</code> to
  /// <code>true</code> when you create the replication group.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  final bool? atRestEncryptionEnabled;

  /// A flag that enables using an <code>AuthToken</code> (password) when issuing
  /// Redis commands.
  ///
  /// Default: <code>false</code>
  final bool? authTokenEnabled;

  /// The cache node type of the Global datastore
  final String? cacheNodeType;

  /// A flag that indicates whether the Global datastore is cluster enabled.
  final bool? clusterEnabled;

  /// The Elasticache engine. For Redis only.
  final String? engine;

  /// The Elasticache Redis engine version.
  final String? engineVersion;

  /// Indicates the slot configuration and global identifier for each slice group.
  final List<GlobalNodeGroup>? globalNodeGroups;

  /// The optional description of the Global datastore
  final String? globalReplicationGroupDescription;

  /// The name of the Global datastore
  final String? globalReplicationGroupId;

  /// The replication groups that comprise the Global datastore.
  final List<GlobalReplicationGroupMember>? members;

  /// The status of the Global datastore
  final String? status;

  /// A flag that enables in-transit encryption when set to true.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  final bool? transitEncryptionEnabled;

  GlobalReplicationGroup({
    this.arn,
    this.atRestEncryptionEnabled,
    this.authTokenEnabled,
    this.cacheNodeType,
    this.clusterEnabled,
    this.engine,
    this.engineVersion,
    this.globalNodeGroups,
    this.globalReplicationGroupDescription,
    this.globalReplicationGroupId,
    this.members,
    this.status,
    this.transitEncryptionEnabled,
  });
  factory GlobalReplicationGroup.fromXml(_s.XmlElement elem) {
    return GlobalReplicationGroup(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      atRestEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'AtRestEncryptionEnabled'),
      authTokenEnabled: _s.extractXmlBoolValue(elem, 'AuthTokenEnabled'),
      cacheNodeType: _s.extractXmlStringValue(elem, 'CacheNodeType'),
      clusterEnabled: _s.extractXmlBoolValue(elem, 'ClusterEnabled'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      globalNodeGroups: _s.extractXmlChild(elem, 'GlobalNodeGroups')?.let(
          (elem) => elem
              .findElements('GlobalNodeGroup')
              .map(GlobalNodeGroup.fromXml)
              .toList()),
      globalReplicationGroupDescription:
          _s.extractXmlStringValue(elem, 'GlobalReplicationGroupDescription'),
      globalReplicationGroupId:
          _s.extractXmlStringValue(elem, 'GlobalReplicationGroupId'),
      members: _s.extractXmlChild(elem, 'Members')?.let((elem) => elem
          .findElements('GlobalReplicationGroupMember')
          .map(GlobalReplicationGroupMember.fromXml)
          .toList()),
      status: _s.extractXmlStringValue(elem, 'Status'),
      transitEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'TransitEncryptionEnabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final atRestEncryptionEnabled = this.atRestEncryptionEnabled;
    final authTokenEnabled = this.authTokenEnabled;
    final cacheNodeType = this.cacheNodeType;
    final clusterEnabled = this.clusterEnabled;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final globalNodeGroups = this.globalNodeGroups;
    final globalReplicationGroupDescription =
        this.globalReplicationGroupDescription;
    final globalReplicationGroupId = this.globalReplicationGroupId;
    final members = this.members;
    final status = this.status;
    final transitEncryptionEnabled = this.transitEncryptionEnabled;
    return {
      if (arn != null) 'ARN': arn,
      if (atRestEncryptionEnabled != null)
        'AtRestEncryptionEnabled': atRestEncryptionEnabled,
      if (authTokenEnabled != null) 'AuthTokenEnabled': authTokenEnabled,
      if (cacheNodeType != null) 'CacheNodeType': cacheNodeType,
      if (clusterEnabled != null) 'ClusterEnabled': clusterEnabled,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (globalNodeGroups != null) 'GlobalNodeGroups': globalNodeGroups,
      if (globalReplicationGroupDescription != null)
        'GlobalReplicationGroupDescription': globalReplicationGroupDescription,
      if (globalReplicationGroupId != null)
        'GlobalReplicationGroupId': globalReplicationGroupId,
      if (members != null) 'Members': members,
      if (status != null) 'Status': status,
      if (transitEncryptionEnabled != null)
        'TransitEncryptionEnabled': transitEncryptionEnabled,
    };
  }
}

/// The name of the Global datastore and role of this replication group in the
/// Global datastore.
class GlobalReplicationGroupInfo {
  /// The name of the Global datastore
  final String? globalReplicationGroupId;

  /// The role of the replication group in a Global datastore. Can be primary or
  /// secondary.
  final String? globalReplicationGroupMemberRole;

  GlobalReplicationGroupInfo({
    this.globalReplicationGroupId,
    this.globalReplicationGroupMemberRole,
  });
  factory GlobalReplicationGroupInfo.fromXml(_s.XmlElement elem) {
    return GlobalReplicationGroupInfo(
      globalReplicationGroupId:
          _s.extractXmlStringValue(elem, 'GlobalReplicationGroupId'),
      globalReplicationGroupMemberRole:
          _s.extractXmlStringValue(elem, 'GlobalReplicationGroupMemberRole'),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroupId = this.globalReplicationGroupId;
    final globalReplicationGroupMemberRole =
        this.globalReplicationGroupMemberRole;
    return {
      if (globalReplicationGroupId != null)
        'GlobalReplicationGroupId': globalReplicationGroupId,
      if (globalReplicationGroupMemberRole != null)
        'GlobalReplicationGroupMemberRole': globalReplicationGroupMemberRole,
    };
  }
}

/// A member of a Global datastore. It contains the Replication Group Id, the
/// Amazon region and the role of the replication group.
class GlobalReplicationGroupMember {
  /// Indicates whether automatic failover is enabled for the replication group.
  final AutomaticFailoverStatus? automaticFailover;

  /// The replication group id of the Global datastore member.
  final String? replicationGroupId;

  /// The Amazon region of the Global datastore member.
  final String? replicationGroupRegion;

  /// Indicates the role of the replication group, primary or secondary.
  final String? role;

  /// The status of the membership of the replication group.
  final String? status;

  GlobalReplicationGroupMember({
    this.automaticFailover,
    this.replicationGroupId,
    this.replicationGroupRegion,
    this.role,
    this.status,
  });
  factory GlobalReplicationGroupMember.fromXml(_s.XmlElement elem) {
    return GlobalReplicationGroupMember(
      automaticFailover: _s
          .extractXmlStringValue(elem, 'AutomaticFailover')
          ?.toAutomaticFailoverStatus(),
      replicationGroupId: _s.extractXmlStringValue(elem, 'ReplicationGroupId'),
      replicationGroupRegion:
          _s.extractXmlStringValue(elem, 'ReplicationGroupRegion'),
      role: _s.extractXmlStringValue(elem, 'Role'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final automaticFailover = this.automaticFailover;
    final replicationGroupId = this.replicationGroupId;
    final replicationGroupRegion = this.replicationGroupRegion;
    final role = this.role;
    final status = this.status;
    return {
      if (automaticFailover != null)
        'AutomaticFailover': automaticFailover.toValue(),
      if (replicationGroupId != null) 'ReplicationGroupId': replicationGroupId,
      if (replicationGroupRegion != null)
        'ReplicationGroupRegion': replicationGroupRegion,
      if (role != null) 'Role': role,
      if (status != null) 'Status': status,
    };
  }
}

class IncreaseNodeGroupsInGlobalReplicationGroupResult {
  final GlobalReplicationGroup? globalReplicationGroup;

  IncreaseNodeGroupsInGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory IncreaseNodeGroupsInGlobalReplicationGroupResult.fromXml(
      _s.XmlElement elem) {
    return IncreaseNodeGroupsInGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let(GlobalReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroup = this.globalReplicationGroup;
    return {
      if (globalReplicationGroup != null)
        'GlobalReplicationGroup': globalReplicationGroup,
    };
  }
}

class IncreaseReplicaCountResult {
  final ReplicationGroup? replicationGroup;

  IncreaseReplicaCountResult({
    this.replicationGroup,
  });
  factory IncreaseReplicaCountResult.fromXml(_s.XmlElement elem) {
    return IncreaseReplicaCountResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

enum InputAuthenticationType {
  password,
  noPasswordRequired,
  iam,
}

extension InputAuthenticationTypeValueExtension on InputAuthenticationType {
  String toValue() {
    switch (this) {
      case InputAuthenticationType.password:
        return 'password';
      case InputAuthenticationType.noPasswordRequired:
        return 'no-password-required';
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
      case 'no-password-required':
        return InputAuthenticationType.noPasswordRequired;
      case 'iam':
        return InputAuthenticationType.iam;
    }
    throw Exception('$this is not known in enum InputAuthenticationType');
  }
}

enum IpDiscovery {
  ipv4,
  ipv6,
}

extension IpDiscoveryValueExtension on IpDiscovery {
  String toValue() {
    switch (this) {
      case IpDiscovery.ipv4:
        return 'ipv4';
      case IpDiscovery.ipv6:
        return 'ipv6';
    }
  }
}

extension IpDiscoveryFromString on String {
  IpDiscovery toIpDiscovery() {
    switch (this) {
      case 'ipv4':
        return IpDiscovery.ipv4;
      case 'ipv6':
        return IpDiscovery.ipv6;
    }
    throw Exception('$this is not known in enum IpDiscovery');
  }
}

/// The configuration details of the Kinesis Data Firehose destination.
class KinesisFirehoseDestinationDetails {
  /// The name of the Kinesis Data Firehose delivery stream.
  final String? deliveryStream;

  KinesisFirehoseDestinationDetails({
    this.deliveryStream,
  });
  factory KinesisFirehoseDestinationDetails.fromXml(_s.XmlElement elem) {
    return KinesisFirehoseDestinationDetails(
      deliveryStream: _s.extractXmlStringValue(elem, 'DeliveryStream'),
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStream = this.deliveryStream;
    return {
      if (deliveryStream != null) 'DeliveryStream': deliveryStream,
    };
  }
}

/// Returns the destination, format and type of the logs.
class LogDeliveryConfiguration {
  /// Configuration details of either a CloudWatch Logs destination or Kinesis
  /// Data Firehose destination.
  final DestinationDetails? destinationDetails;

  /// Returns the destination type, either <code>cloudwatch-logs</code> or
  /// <code>kinesis-firehose</code>.
  final DestinationType? destinationType;

  /// Returns the log format, either JSON or TEXT.
  final LogFormat? logFormat;

  /// Refers to <a href="https://redis.io/commands/slowlog">slow-log</a> or
  /// engine-log.
  final LogType? logType;

  /// Returns an error message for the log delivery configuration.
  final String? message;

  /// Returns the log delivery configuration status. Values are one of
  /// <code>enabling</code> | <code>disabling</code> | <code>modifying</code> |
  /// <code>active</code> | <code>error</code>
  final LogDeliveryConfigurationStatus? status;

  LogDeliveryConfiguration({
    this.destinationDetails,
    this.destinationType,
    this.logFormat,
    this.logType,
    this.message,
    this.status,
  });
  factory LogDeliveryConfiguration.fromXml(_s.XmlElement elem) {
    return LogDeliveryConfiguration(
      destinationDetails: _s
          .extractXmlChild(elem, 'DestinationDetails')
          ?.let(DestinationDetails.fromXml),
      destinationType: _s
          .extractXmlStringValue(elem, 'DestinationType')
          ?.toDestinationType(),
      logFormat: _s.extractXmlStringValue(elem, 'LogFormat')?.toLogFormat(),
      logType: _s.extractXmlStringValue(elem, 'LogType')?.toLogType(),
      message: _s.extractXmlStringValue(elem, 'Message'),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toLogDeliveryConfigurationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationDetails = this.destinationDetails;
    final destinationType = this.destinationType;
    final logFormat = this.logFormat;
    final logType = this.logType;
    final message = this.message;
    final status = this.status;
    return {
      if (destinationDetails != null) 'DestinationDetails': destinationDetails,
      if (destinationType != null) 'DestinationType': destinationType.toValue(),
      if (logFormat != null) 'LogFormat': logFormat.toValue(),
      if (logType != null) 'LogType': logType.toValue(),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Specifies the destination, format and type of the logs.
class LogDeliveryConfigurationRequest {
  /// Configuration details of either a CloudWatch Logs destination or Kinesis
  /// Data Firehose destination.
  final DestinationDetails? destinationDetails;

  /// Specify either <code>cloudwatch-logs</code> or <code>kinesis-firehose</code>
  /// as the destination type.
  final DestinationType? destinationType;

  /// Specify if log delivery is enabled. Default <code>true</code>.
  final bool? enabled;

  /// Specifies either JSON or TEXT
  final LogFormat? logFormat;

  /// Refers to <a href="https://redis.io/commands/slowlog">slow-log</a> or
  /// engine-log..
  final LogType? logType;

  LogDeliveryConfigurationRequest({
    this.destinationDetails,
    this.destinationType,
    this.enabled,
    this.logFormat,
    this.logType,
  });

  Map<String, dynamic> toJson() {
    final destinationDetails = this.destinationDetails;
    final destinationType = this.destinationType;
    final enabled = this.enabled;
    final logFormat = this.logFormat;
    final logType = this.logType;
    return {
      if (destinationDetails != null) 'DestinationDetails': destinationDetails,
      if (destinationType != null) 'DestinationType': destinationType.toValue(),
      if (enabled != null) 'Enabled': enabled,
      if (logFormat != null) 'LogFormat': logFormat.toValue(),
      if (logType != null) 'LogType': logType.toValue(),
    };
  }
}

enum LogDeliveryConfigurationStatus {
  active,
  enabling,
  modifying,
  disabling,
  error,
}

extension LogDeliveryConfigurationStatusValueExtension
    on LogDeliveryConfigurationStatus {
  String toValue() {
    switch (this) {
      case LogDeliveryConfigurationStatus.active:
        return 'active';
      case LogDeliveryConfigurationStatus.enabling:
        return 'enabling';
      case LogDeliveryConfigurationStatus.modifying:
        return 'modifying';
      case LogDeliveryConfigurationStatus.disabling:
        return 'disabling';
      case LogDeliveryConfigurationStatus.error:
        return 'error';
    }
  }
}

extension LogDeliveryConfigurationStatusFromString on String {
  LogDeliveryConfigurationStatus toLogDeliveryConfigurationStatus() {
    switch (this) {
      case 'active':
        return LogDeliveryConfigurationStatus.active;
      case 'enabling':
        return LogDeliveryConfigurationStatus.enabling;
      case 'modifying':
        return LogDeliveryConfigurationStatus.modifying;
      case 'disabling':
        return LogDeliveryConfigurationStatus.disabling;
      case 'error':
        return LogDeliveryConfigurationStatus.error;
    }
    throw Exception(
        '$this is not known in enum LogDeliveryConfigurationStatus');
  }
}

enum LogFormat {
  text,
  json,
}

extension LogFormatValueExtension on LogFormat {
  String toValue() {
    switch (this) {
      case LogFormat.text:
        return 'text';
      case LogFormat.json:
        return 'json';
    }
  }
}

extension LogFormatFromString on String {
  LogFormat toLogFormat() {
    switch (this) {
      case 'text':
        return LogFormat.text;
      case 'json':
        return LogFormat.json;
    }
    throw Exception('$this is not known in enum LogFormat');
  }
}

enum LogType {
  slowLog,
  engineLog,
}

extension LogTypeValueExtension on LogType {
  String toValue() {
    switch (this) {
      case LogType.slowLog:
        return 'slow-log';
      case LogType.engineLog:
        return 'engine-log';
    }
  }
}

extension LogTypeFromString on String {
  LogType toLogType() {
    switch (this) {
      case 'slow-log':
        return LogType.slowLog;
      case 'engine-log':
        return LogType.engineLog;
    }
    throw Exception('$this is not known in enum LogType');
  }
}

class ModifyCacheClusterResult {
  final CacheCluster? cacheCluster;

  ModifyCacheClusterResult({
    this.cacheCluster,
  });
  factory ModifyCacheClusterResult.fromXml(_s.XmlElement elem) {
    return ModifyCacheClusterResult(
      cacheCluster:
          _s.extractXmlChild(elem, 'CacheCluster')?.let(CacheCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheCluster = this.cacheCluster;
    return {
      if (cacheCluster != null) 'CacheCluster': cacheCluster,
    };
  }
}

class ModifyCacheSubnetGroupResult {
  final CacheSubnetGroup? cacheSubnetGroup;

  ModifyCacheSubnetGroupResult({
    this.cacheSubnetGroup,
  });
  factory ModifyCacheSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyCacheSubnetGroupResult(
      cacheSubnetGroup: _s
          .extractXmlChild(elem, 'CacheSubnetGroup')
          ?.let(CacheSubnetGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheSubnetGroup = this.cacheSubnetGroup;
    return {
      if (cacheSubnetGroup != null) 'CacheSubnetGroup': cacheSubnetGroup,
    };
  }
}

class ModifyGlobalReplicationGroupResult {
  final GlobalReplicationGroup? globalReplicationGroup;

  ModifyGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory ModifyGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let(GlobalReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroup = this.globalReplicationGroup;
    return {
      if (globalReplicationGroup != null)
        'GlobalReplicationGroup': globalReplicationGroup,
    };
  }
}

class ModifyReplicationGroupResult {
  final ReplicationGroup? replicationGroup;

  ModifyReplicationGroupResult({
    this.replicationGroup,
  });
  factory ModifyReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyReplicationGroupResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

class ModifyReplicationGroupShardConfigurationResult {
  final ReplicationGroup? replicationGroup;

  ModifyReplicationGroupShardConfigurationResult({
    this.replicationGroup,
  });
  factory ModifyReplicationGroupShardConfigurationResult.fromXml(
      _s.XmlElement elem) {
    return ModifyReplicationGroupShardConfigurationResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

class ModifyServerlessCacheResponse {
  /// The response for the attempt to modify the serverless cache.
  final ServerlessCache? serverlessCache;

  ModifyServerlessCacheResponse({
    this.serverlessCache,
  });
  factory ModifyServerlessCacheResponse.fromXml(_s.XmlElement elem) {
    return ModifyServerlessCacheResponse(
      serverlessCache: _s
          .extractXmlChild(elem, 'ServerlessCache')
          ?.let(ServerlessCache.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serverlessCache = this.serverlessCache;
    return {
      if (serverlessCache != null) 'ServerlessCache': serverlessCache,
    };
  }
}

enum MultiAZStatus {
  enabled,
  disabled,
}

extension MultiAZStatusValueExtension on MultiAZStatus {
  String toValue() {
    switch (this) {
      case MultiAZStatus.enabled:
        return 'enabled';
      case MultiAZStatus.disabled:
        return 'disabled';
    }
  }
}

extension MultiAZStatusFromString on String {
  MultiAZStatus toMultiAZStatus() {
    switch (this) {
      case 'enabled':
        return MultiAZStatus.enabled;
      case 'disabled':
        return MultiAZStatus.disabled;
    }
    throw Exception('$this is not known in enum MultiAZStatus');
  }
}

enum NetworkType {
  ipv4,
  ipv6,
  dualStack,
}

extension NetworkTypeValueExtension on NetworkType {
  String toValue() {
    switch (this) {
      case NetworkType.ipv4:
        return 'ipv4';
      case NetworkType.ipv6:
        return 'ipv6';
      case NetworkType.dualStack:
        return 'dual_stack';
    }
  }
}

extension NetworkTypeFromString on String {
  NetworkType toNetworkType() {
    switch (this) {
      case 'ipv4':
        return NetworkType.ipv4;
      case 'ipv6':
        return NetworkType.ipv6;
      case 'dual_stack':
        return NetworkType.dualStack;
    }
    throw Exception('$this is not known in enum NetworkType');
  }
}

/// Represents a collection of cache nodes in a replication group. One node in
/// the node group is the read/write primary node. All the other nodes are
/// read-only Replica nodes.
class NodeGroup {
  /// The identifier for the node group (shard). A Redis (cluster mode disabled)
  /// replication group contains only 1 node group; therefore, the node group ID
  /// is 0001. A Redis (cluster mode enabled) replication group contains 1 to 90
  /// node groups numbered 0001 to 0090. Optionally, the user can provide the id
  /// for a node group.
  final String? nodeGroupId;

  /// A list containing information about individual nodes within the node group
  /// (shard).
  final List<NodeGroupMember>? nodeGroupMembers;

  /// The endpoint of the primary node in this node group (shard).
  final Endpoint? primaryEndpoint;

  /// The endpoint of the replica nodes in this node group (shard). This value is
  /// read-only.
  final Endpoint? readerEndpoint;

  /// The keyspace for this node group (shard).
  final String? slots;

  /// The current state of this replication group - <code>creating</code>,
  /// <code>available</code>, <code>modifying</code>, <code>deleting</code>.
  final String? status;

  NodeGroup({
    this.nodeGroupId,
    this.nodeGroupMembers,
    this.primaryEndpoint,
    this.readerEndpoint,
    this.slots,
    this.status,
  });
  factory NodeGroup.fromXml(_s.XmlElement elem) {
    return NodeGroup(
      nodeGroupId: _s.extractXmlStringValue(elem, 'NodeGroupId'),
      nodeGroupMembers: _s.extractXmlChild(elem, 'NodeGroupMembers')?.let(
          (elem) => elem
              .findElements('NodeGroupMember')
              .map(NodeGroupMember.fromXml)
              .toList()),
      primaryEndpoint:
          _s.extractXmlChild(elem, 'PrimaryEndpoint')?.let(Endpoint.fromXml),
      readerEndpoint:
          _s.extractXmlChild(elem, 'ReaderEndpoint')?.let(Endpoint.fromXml),
      slots: _s.extractXmlStringValue(elem, 'Slots'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final nodeGroupId = this.nodeGroupId;
    final nodeGroupMembers = this.nodeGroupMembers;
    final primaryEndpoint = this.primaryEndpoint;
    final readerEndpoint = this.readerEndpoint;
    final slots = this.slots;
    final status = this.status;
    return {
      if (nodeGroupId != null) 'NodeGroupId': nodeGroupId,
      if (nodeGroupMembers != null) 'NodeGroupMembers': nodeGroupMembers,
      if (primaryEndpoint != null) 'PrimaryEndpoint': primaryEndpoint,
      if (readerEndpoint != null) 'ReaderEndpoint': readerEndpoint,
      if (slots != null) 'Slots': slots,
      if (status != null) 'Status': status,
    };
  }
}

/// Node group (shard) configuration options. Each node group (shard)
/// configuration has the following: <code>Slots</code>,
/// <code>PrimaryAvailabilityZone</code>, <code>ReplicaAvailabilityZones</code>,
/// <code>ReplicaCount</code>.
class NodeGroupConfiguration {
  /// Either the ElastiCache for Redis supplied 4-digit id or a user supplied id
  /// for the node group these configuration values apply to.
  final String? nodeGroupId;

  /// The Availability Zone where the primary node of this node group (shard) is
  /// launched.
  final String? primaryAvailabilityZone;

  /// The outpost ARN of the primary node.
  final String? primaryOutpostArn;

  /// A list of Availability Zones to be used for the read replicas. The number of
  /// Availability Zones in this list must match the value of
  /// <code>ReplicaCount</code> or <code>ReplicasPerNodeGroup</code> if not
  /// specified.
  final List<String>? replicaAvailabilityZones;

  /// The number of read replica nodes in this node group (shard).
  final int? replicaCount;

  /// The outpost ARN of the node replicas.
  final List<String>? replicaOutpostArns;

  /// A string that specifies the keyspace for a particular node group. Keyspaces
  /// range from 0 to 16,383. The string is in the format
  /// <code>startkey-endkey</code>.
  ///
  /// Example: <code>"0-3999"</code>
  final String? slots;

  NodeGroupConfiguration({
    this.nodeGroupId,
    this.primaryAvailabilityZone,
    this.primaryOutpostArn,
    this.replicaAvailabilityZones,
    this.replicaCount,
    this.replicaOutpostArns,
    this.slots,
  });
  factory NodeGroupConfiguration.fromXml(_s.XmlElement elem) {
    return NodeGroupConfiguration(
      nodeGroupId: _s.extractXmlStringValue(elem, 'NodeGroupId'),
      primaryAvailabilityZone:
          _s.extractXmlStringValue(elem, 'PrimaryAvailabilityZone'),
      primaryOutpostArn: _s.extractXmlStringValue(elem, 'PrimaryOutpostArn'),
      replicaAvailabilityZones: _s
          .extractXmlChild(elem, 'ReplicaAvailabilityZones')
          ?.let((elem) =>
              _s.extractXmlStringListValues(elem, 'AvailabilityZone')),
      replicaCount: _s.extractXmlIntValue(elem, 'ReplicaCount'),
      replicaOutpostArns: _s
          .extractXmlChild(elem, 'ReplicaOutpostArns')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'OutpostArn')),
      slots: _s.extractXmlStringValue(elem, 'Slots'),
    );
  }

  Map<String, dynamic> toJson() {
    final nodeGroupId = this.nodeGroupId;
    final primaryAvailabilityZone = this.primaryAvailabilityZone;
    final primaryOutpostArn = this.primaryOutpostArn;
    final replicaAvailabilityZones = this.replicaAvailabilityZones;
    final replicaCount = this.replicaCount;
    final replicaOutpostArns = this.replicaOutpostArns;
    final slots = this.slots;
    return {
      if (nodeGroupId != null) 'NodeGroupId': nodeGroupId,
      if (primaryAvailabilityZone != null)
        'PrimaryAvailabilityZone': primaryAvailabilityZone,
      if (primaryOutpostArn != null) 'PrimaryOutpostArn': primaryOutpostArn,
      if (replicaAvailabilityZones != null)
        'ReplicaAvailabilityZones': replicaAvailabilityZones,
      if (replicaCount != null) 'ReplicaCount': replicaCount,
      if (replicaOutpostArns != null) 'ReplicaOutpostArns': replicaOutpostArns,
      if (slots != null) 'Slots': slots,
    };
  }
}

/// Represents a single node within a node group (shard).
class NodeGroupMember {
  /// The ID of the cluster to which the node belongs.
  final String? cacheClusterId;

  /// The ID of the node within its cluster. A node ID is a numeric identifier
  /// (0001, 0002, etc.).
  final String? cacheNodeId;

  /// The role that is currently assigned to the node - <code>primary</code> or
  /// <code>replica</code>. This member is only applicable for Redis (cluster mode
  /// disabled) replication groups.
  final String? currentRole;

  /// The name of the Availability Zone in which the node is located.
  final String? preferredAvailabilityZone;

  /// The outpost ARN of the node group member.
  final String? preferredOutpostArn;

  /// The information required for client programs to connect to a node for read
  /// operations. The read endpoint is only applicable on Redis (cluster mode
  /// disabled) clusters.
  final Endpoint? readEndpoint;

  NodeGroupMember({
    this.cacheClusterId,
    this.cacheNodeId,
    this.currentRole,
    this.preferredAvailabilityZone,
    this.preferredOutpostArn,
    this.readEndpoint,
  });
  factory NodeGroupMember.fromXml(_s.XmlElement elem) {
    return NodeGroupMember(
      cacheClusterId: _s.extractXmlStringValue(elem, 'CacheClusterId'),
      cacheNodeId: _s.extractXmlStringValue(elem, 'CacheNodeId'),
      currentRole: _s.extractXmlStringValue(elem, 'CurrentRole'),
      preferredAvailabilityZone:
          _s.extractXmlStringValue(elem, 'PreferredAvailabilityZone'),
      preferredOutpostArn:
          _s.extractXmlStringValue(elem, 'PreferredOutpostArn'),
      readEndpoint:
          _s.extractXmlChild(elem, 'ReadEndpoint')?.let(Endpoint.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheClusterId = this.cacheClusterId;
    final cacheNodeId = this.cacheNodeId;
    final currentRole = this.currentRole;
    final preferredAvailabilityZone = this.preferredAvailabilityZone;
    final preferredOutpostArn = this.preferredOutpostArn;
    final readEndpoint = this.readEndpoint;
    return {
      if (cacheClusterId != null) 'CacheClusterId': cacheClusterId,
      if (cacheNodeId != null) 'CacheNodeId': cacheNodeId,
      if (currentRole != null) 'CurrentRole': currentRole,
      if (preferredAvailabilityZone != null)
        'PreferredAvailabilityZone': preferredAvailabilityZone,
      if (preferredOutpostArn != null)
        'PreferredOutpostArn': preferredOutpostArn,
      if (readEndpoint != null) 'ReadEndpoint': readEndpoint,
    };
  }
}

/// The status of the service update on the node group member
class NodeGroupMemberUpdateStatus {
  /// The cache cluster ID
  final String? cacheClusterId;

  /// The node ID of the cache cluster
  final String? cacheNodeId;

  /// The deletion date of the node
  final DateTime? nodeDeletionDate;

  /// The end date of the update for a node
  final DateTime? nodeUpdateEndDate;

  /// Reflects whether the update was initiated by the customer or automatically
  /// applied
  final NodeUpdateInitiatedBy? nodeUpdateInitiatedBy;

  /// The date when the update is triggered
  final DateTime? nodeUpdateInitiatedDate;

  /// The start date of the update for a node
  final DateTime? nodeUpdateStartDate;

  /// The update status of the node
  final NodeUpdateStatus? nodeUpdateStatus;

  /// The date when the NodeUpdateStatus was last modified
  final DateTime? nodeUpdateStatusModifiedDate;

  NodeGroupMemberUpdateStatus({
    this.cacheClusterId,
    this.cacheNodeId,
    this.nodeDeletionDate,
    this.nodeUpdateEndDate,
    this.nodeUpdateInitiatedBy,
    this.nodeUpdateInitiatedDate,
    this.nodeUpdateStartDate,
    this.nodeUpdateStatus,
    this.nodeUpdateStatusModifiedDate,
  });
  factory NodeGroupMemberUpdateStatus.fromXml(_s.XmlElement elem) {
    return NodeGroupMemberUpdateStatus(
      cacheClusterId: _s.extractXmlStringValue(elem, 'CacheClusterId'),
      cacheNodeId: _s.extractXmlStringValue(elem, 'CacheNodeId'),
      nodeDeletionDate: _s.extractXmlDateTimeValue(elem, 'NodeDeletionDate'),
      nodeUpdateEndDate: _s.extractXmlDateTimeValue(elem, 'NodeUpdateEndDate'),
      nodeUpdateInitiatedBy: _s
          .extractXmlStringValue(elem, 'NodeUpdateInitiatedBy')
          ?.toNodeUpdateInitiatedBy(),
      nodeUpdateInitiatedDate:
          _s.extractXmlDateTimeValue(elem, 'NodeUpdateInitiatedDate'),
      nodeUpdateStartDate:
          _s.extractXmlDateTimeValue(elem, 'NodeUpdateStartDate'),
      nodeUpdateStatus: _s
          .extractXmlStringValue(elem, 'NodeUpdateStatus')
          ?.toNodeUpdateStatus(),
      nodeUpdateStatusModifiedDate:
          _s.extractXmlDateTimeValue(elem, 'NodeUpdateStatusModifiedDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheClusterId = this.cacheClusterId;
    final cacheNodeId = this.cacheNodeId;
    final nodeDeletionDate = this.nodeDeletionDate;
    final nodeUpdateEndDate = this.nodeUpdateEndDate;
    final nodeUpdateInitiatedBy = this.nodeUpdateInitiatedBy;
    final nodeUpdateInitiatedDate = this.nodeUpdateInitiatedDate;
    final nodeUpdateStartDate = this.nodeUpdateStartDate;
    final nodeUpdateStatus = this.nodeUpdateStatus;
    final nodeUpdateStatusModifiedDate = this.nodeUpdateStatusModifiedDate;
    return {
      if (cacheClusterId != null) 'CacheClusterId': cacheClusterId,
      if (cacheNodeId != null) 'CacheNodeId': cacheNodeId,
      if (nodeDeletionDate != null)
        'NodeDeletionDate': iso8601ToJson(nodeDeletionDate),
      if (nodeUpdateEndDate != null)
        'NodeUpdateEndDate': iso8601ToJson(nodeUpdateEndDate),
      if (nodeUpdateInitiatedBy != null)
        'NodeUpdateInitiatedBy': nodeUpdateInitiatedBy.toValue(),
      if (nodeUpdateInitiatedDate != null)
        'NodeUpdateInitiatedDate': iso8601ToJson(nodeUpdateInitiatedDate),
      if (nodeUpdateStartDate != null)
        'NodeUpdateStartDate': iso8601ToJson(nodeUpdateStartDate),
      if (nodeUpdateStatus != null)
        'NodeUpdateStatus': nodeUpdateStatus.toValue(),
      if (nodeUpdateStatusModifiedDate != null)
        'NodeUpdateStatusModifiedDate':
            iso8601ToJson(nodeUpdateStatusModifiedDate),
    };
  }
}

/// The status of the service update on the node group
class NodeGroupUpdateStatus {
  /// The ID of the node group
  final String? nodeGroupId;

  /// The status of the service update on the node group member
  final List<NodeGroupMemberUpdateStatus>? nodeGroupMemberUpdateStatus;

  NodeGroupUpdateStatus({
    this.nodeGroupId,
    this.nodeGroupMemberUpdateStatus,
  });
  factory NodeGroupUpdateStatus.fromXml(_s.XmlElement elem) {
    return NodeGroupUpdateStatus(
      nodeGroupId: _s.extractXmlStringValue(elem, 'NodeGroupId'),
      nodeGroupMemberUpdateStatus: _s
          .extractXmlChild(elem, 'NodeGroupMemberUpdateStatus')
          ?.let((elem) => elem
              .findElements('NodeGroupMemberUpdateStatus')
              .map(NodeGroupMemberUpdateStatus.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nodeGroupId = this.nodeGroupId;
    final nodeGroupMemberUpdateStatus = this.nodeGroupMemberUpdateStatus;
    return {
      if (nodeGroupId != null) 'NodeGroupId': nodeGroupId,
      if (nodeGroupMemberUpdateStatus != null)
        'NodeGroupMemberUpdateStatus': nodeGroupMemberUpdateStatus,
    };
  }
}

/// Represents an individual cache node in a snapshot of a cluster.
class NodeSnapshot {
  /// A unique identifier for the source cluster.
  final String? cacheClusterId;

  /// The date and time when the cache node was created in the source cluster.
  final DateTime? cacheNodeCreateTime;

  /// The cache node identifier for the node in the source cluster.
  final String? cacheNodeId;

  /// The size of the cache on the source cache node.
  final String? cacheSize;

  /// The configuration for the source node group (shard).
  final NodeGroupConfiguration? nodeGroupConfiguration;

  /// A unique identifier for the source node group (shard).
  final String? nodeGroupId;

  /// The date and time when the source node's metadata and cache data set was
  /// obtained for the snapshot.
  final DateTime? snapshotCreateTime;

  NodeSnapshot({
    this.cacheClusterId,
    this.cacheNodeCreateTime,
    this.cacheNodeId,
    this.cacheSize,
    this.nodeGroupConfiguration,
    this.nodeGroupId,
    this.snapshotCreateTime,
  });
  factory NodeSnapshot.fromXml(_s.XmlElement elem) {
    return NodeSnapshot(
      cacheClusterId: _s.extractXmlStringValue(elem, 'CacheClusterId'),
      cacheNodeCreateTime:
          _s.extractXmlDateTimeValue(elem, 'CacheNodeCreateTime'),
      cacheNodeId: _s.extractXmlStringValue(elem, 'CacheNodeId'),
      cacheSize: _s.extractXmlStringValue(elem, 'CacheSize'),
      nodeGroupConfiguration: _s
          .extractXmlChild(elem, 'NodeGroupConfiguration')
          ?.let(NodeGroupConfiguration.fromXml),
      nodeGroupId: _s.extractXmlStringValue(elem, 'NodeGroupId'),
      snapshotCreateTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotCreateTime'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheClusterId = this.cacheClusterId;
    final cacheNodeCreateTime = this.cacheNodeCreateTime;
    final cacheNodeId = this.cacheNodeId;
    final cacheSize = this.cacheSize;
    final nodeGroupConfiguration = this.nodeGroupConfiguration;
    final nodeGroupId = this.nodeGroupId;
    final snapshotCreateTime = this.snapshotCreateTime;
    return {
      if (cacheClusterId != null) 'CacheClusterId': cacheClusterId,
      if (cacheNodeCreateTime != null)
        'CacheNodeCreateTime': iso8601ToJson(cacheNodeCreateTime),
      if (cacheNodeId != null) 'CacheNodeId': cacheNodeId,
      if (cacheSize != null) 'CacheSize': cacheSize,
      if (nodeGroupConfiguration != null)
        'NodeGroupConfiguration': nodeGroupConfiguration,
      if (nodeGroupId != null) 'NodeGroupId': nodeGroupId,
      if (snapshotCreateTime != null)
        'SnapshotCreateTime': iso8601ToJson(snapshotCreateTime),
    };
  }
}

enum NodeUpdateInitiatedBy {
  system,
  customer,
}

extension NodeUpdateInitiatedByValueExtension on NodeUpdateInitiatedBy {
  String toValue() {
    switch (this) {
      case NodeUpdateInitiatedBy.system:
        return 'system';
      case NodeUpdateInitiatedBy.customer:
        return 'customer';
    }
  }
}

extension NodeUpdateInitiatedByFromString on String {
  NodeUpdateInitiatedBy toNodeUpdateInitiatedBy() {
    switch (this) {
      case 'system':
        return NodeUpdateInitiatedBy.system;
      case 'customer':
        return NodeUpdateInitiatedBy.customer;
    }
    throw Exception('$this is not known in enum NodeUpdateInitiatedBy');
  }
}

enum NodeUpdateStatus {
  notApplied,
  waitingToStart,
  inProgress,
  stopping,
  stopped,
  complete,
}

extension NodeUpdateStatusValueExtension on NodeUpdateStatus {
  String toValue() {
    switch (this) {
      case NodeUpdateStatus.notApplied:
        return 'not-applied';
      case NodeUpdateStatus.waitingToStart:
        return 'waiting-to-start';
      case NodeUpdateStatus.inProgress:
        return 'in-progress';
      case NodeUpdateStatus.stopping:
        return 'stopping';
      case NodeUpdateStatus.stopped:
        return 'stopped';
      case NodeUpdateStatus.complete:
        return 'complete';
    }
  }
}

extension NodeUpdateStatusFromString on String {
  NodeUpdateStatus toNodeUpdateStatus() {
    switch (this) {
      case 'not-applied':
        return NodeUpdateStatus.notApplied;
      case 'waiting-to-start':
        return NodeUpdateStatus.waitingToStart;
      case 'in-progress':
        return NodeUpdateStatus.inProgress;
      case 'stopping':
        return NodeUpdateStatus.stopping;
      case 'stopped':
        return NodeUpdateStatus.stopped;
      case 'complete':
        return NodeUpdateStatus.complete;
    }
    throw Exception('$this is not known in enum NodeUpdateStatus');
  }
}

/// Describes a notification topic and its status. Notification topics are used
/// for publishing ElastiCache events to subscribers using Amazon Simple
/// Notification Service (SNS).
class NotificationConfiguration {
  /// The Amazon Resource Name (ARN) that identifies the topic.
  final String? topicArn;

  /// The current state of the topic.
  final String? topicStatus;

  NotificationConfiguration({
    this.topicArn,
    this.topicStatus,
  });
  factory NotificationConfiguration.fromXml(_s.XmlElement elem) {
    return NotificationConfiguration(
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
      topicStatus: _s.extractXmlStringValue(elem, 'TopicStatus'),
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    final topicStatus = this.topicStatus;
    return {
      if (topicArn != null) 'TopicArn': topicArn,
      if (topicStatus != null) 'TopicStatus': topicStatus,
    };
  }
}

enum OutpostMode {
  singleOutpost,
  crossOutpost,
}

extension OutpostModeValueExtension on OutpostMode {
  String toValue() {
    switch (this) {
      case OutpostMode.singleOutpost:
        return 'single-outpost';
      case OutpostMode.crossOutpost:
        return 'cross-outpost';
    }
  }
}

extension OutpostModeFromString on String {
  OutpostMode toOutpostMode() {
    switch (this) {
      case 'single-outpost':
        return OutpostMode.singleOutpost;
      case 'cross-outpost':
        return OutpostMode.crossOutpost;
    }
    throw Exception('$this is not known in enum OutpostMode');
  }
}

/// Describes an individual setting that controls some aspect of ElastiCache
/// behavior.
class Parameter {
  /// The valid range of values for the parameter.
  final String? allowedValues;

  /// Indicates whether a change to the parameter is applied immediately or
  /// requires a reboot for the change to be applied. You can force a reboot or
  /// wait until the next maintenance window's reboot. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting
  /// a Cluster</a>.
  final ChangeType? changeType;

  /// The valid data type for the parameter.
  final String? dataType;

  /// A description of the parameter.
  final String? description;

  /// Indicates whether (<code>true</code>) or not (<code>false</code>) the
  /// parameter can be modified. Some parameters have security or operational
  /// implications that prevent them from being changed.
  final bool? isModifiable;

  /// The earliest cache engine version to which the parameter can apply.
  final String? minimumEngineVersion;

  /// The name of the parameter.
  final String? parameterName;

  /// The value of the parameter.
  final String? parameterValue;

  /// The source of the parameter.
  final String? source;

  Parameter({
    this.allowedValues,
    this.changeType,
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
      changeType: _s.extractXmlStringValue(elem, 'ChangeType')?.toChangeType(),
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
    final changeType = this.changeType;
    final dataType = this.dataType;
    final description = this.description;
    final isModifiable = this.isModifiable;
    final minimumEngineVersion = this.minimumEngineVersion;
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    final source = this.source;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (changeType != null) 'ChangeType': changeType.toValue(),
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

/// Describes a name-value pair that is used to update the value of a parameter.
class ParameterNameValue {
  /// The name of the parameter.
  final String? parameterName;

  /// The value of the parameter.
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

enum PendingAutomaticFailoverStatus {
  enabled,
  disabled,
}

extension PendingAutomaticFailoverStatusValueExtension
    on PendingAutomaticFailoverStatus {
  String toValue() {
    switch (this) {
      case PendingAutomaticFailoverStatus.enabled:
        return 'enabled';
      case PendingAutomaticFailoverStatus.disabled:
        return 'disabled';
    }
  }
}

extension PendingAutomaticFailoverStatusFromString on String {
  PendingAutomaticFailoverStatus toPendingAutomaticFailoverStatus() {
    switch (this) {
      case 'enabled':
        return PendingAutomaticFailoverStatus.enabled;
      case 'disabled':
        return PendingAutomaticFailoverStatus.disabled;
    }
    throw Exception(
        '$this is not known in enum PendingAutomaticFailoverStatus');
  }
}

/// The log delivery configurations being modified
class PendingLogDeliveryConfiguration {
  /// Configuration details of either a CloudWatch Logs destination or Kinesis
  /// Data Firehose destination.
  final DestinationDetails? destinationDetails;

  /// Returns the destination type, either CloudWatch Logs or Kinesis Data
  /// Firehose.
  final DestinationType? destinationType;

  /// Returns the log format, either JSON or TEXT
  final LogFormat? logFormat;

  /// Refers to <a href="https://redis.io/commands/slowlog">slow-log</a> or
  /// engine-log..
  final LogType? logType;

  PendingLogDeliveryConfiguration({
    this.destinationDetails,
    this.destinationType,
    this.logFormat,
    this.logType,
  });
  factory PendingLogDeliveryConfiguration.fromXml(_s.XmlElement elem) {
    return PendingLogDeliveryConfiguration(
      destinationDetails: _s
          .extractXmlChild(elem, 'DestinationDetails')
          ?.let(DestinationDetails.fromXml),
      destinationType: _s
          .extractXmlStringValue(elem, 'DestinationType')
          ?.toDestinationType(),
      logFormat: _s.extractXmlStringValue(elem, 'LogFormat')?.toLogFormat(),
      logType: _s.extractXmlStringValue(elem, 'LogType')?.toLogType(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationDetails = this.destinationDetails;
    final destinationType = this.destinationType;
    final logFormat = this.logFormat;
    final logType = this.logType;
    return {
      if (destinationDetails != null) 'DestinationDetails': destinationDetails,
      if (destinationType != null) 'DestinationType': destinationType.toValue(),
      if (logFormat != null) 'LogFormat': logFormat.toValue(),
      if (logType != null) 'LogType': logType.toValue(),
    };
  }
}

/// A group of settings that are applied to the cluster in the future, or that
/// are currently being applied.
class PendingModifiedValues {
  /// The auth token status
  final AuthTokenUpdateStatus? authTokenStatus;

  /// A list of cache node IDs that are being removed (or will be removed) from
  /// the cluster. A node ID is a 4-digit numeric identifier (0001, 0002, etc.).
  final List<String>? cacheNodeIdsToRemove;

  /// The cache node type that this cluster or replication group is scaled to.
  final String? cacheNodeType;

  /// The new cache engine version that the cluster runs.
  final String? engineVersion;

  /// The log delivery configurations being modified
  final List<PendingLogDeliveryConfiguration>? logDeliveryConfigurations;

  /// The new number of cache nodes for the cluster.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 40.
  final int? numCacheNodes;

  /// A flag that enables in-transit encryption when set to true.
  final bool? transitEncryptionEnabled;

  /// A setting that allows you to migrate your clients to use in-transit
  /// encryption, with no downtime.
  final TransitEncryptionMode? transitEncryptionMode;

  PendingModifiedValues({
    this.authTokenStatus,
    this.cacheNodeIdsToRemove,
    this.cacheNodeType,
    this.engineVersion,
    this.logDeliveryConfigurations,
    this.numCacheNodes,
    this.transitEncryptionEnabled,
    this.transitEncryptionMode,
  });
  factory PendingModifiedValues.fromXml(_s.XmlElement elem) {
    return PendingModifiedValues(
      authTokenStatus: _s
          .extractXmlStringValue(elem, 'AuthTokenStatus')
          ?.toAuthTokenUpdateStatus(),
      cacheNodeIdsToRemove: _s
          .extractXmlChild(elem, 'CacheNodeIdsToRemove')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'CacheNodeId')),
      cacheNodeType: _s.extractXmlStringValue(elem, 'CacheNodeType'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      logDeliveryConfigurations: _s
          .extractXmlChild(elem, 'PendingLogDeliveryConfiguration')
          ?.let((elem) => elem
              .findElements('member')
              .map(PendingLogDeliveryConfiguration.fromXml)
              .toList()),
      numCacheNodes: _s.extractXmlIntValue(elem, 'NumCacheNodes'),
      transitEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'TransitEncryptionEnabled'),
      transitEncryptionMode: _s
          .extractXmlStringValue(elem, 'TransitEncryptionMode')
          ?.toTransitEncryptionMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final authTokenStatus = this.authTokenStatus;
    final cacheNodeIdsToRemove = this.cacheNodeIdsToRemove;
    final cacheNodeType = this.cacheNodeType;
    final engineVersion = this.engineVersion;
    final logDeliveryConfigurations = this.logDeliveryConfigurations;
    final numCacheNodes = this.numCacheNodes;
    final transitEncryptionEnabled = this.transitEncryptionEnabled;
    final transitEncryptionMode = this.transitEncryptionMode;
    return {
      if (authTokenStatus != null) 'AuthTokenStatus': authTokenStatus.toValue(),
      if (cacheNodeIdsToRemove != null)
        'CacheNodeIdsToRemove': cacheNodeIdsToRemove,
      if (cacheNodeType != null) 'CacheNodeType': cacheNodeType,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (logDeliveryConfigurations != null)
        'PendingLogDeliveryConfiguration': logDeliveryConfigurations,
      if (numCacheNodes != null) 'NumCacheNodes': numCacheNodes,
      if (transitEncryptionEnabled != null)
        'TransitEncryptionEnabled': transitEncryptionEnabled,
      if (transitEncryptionMode != null)
        'TransitEncryptionMode': transitEncryptionMode.toValue(),
    };
  }
}

/// Update action that has been processed for the corresponding apply/stop
/// request
class ProcessedUpdateAction {
  /// The ID of the cache cluster
  final String? cacheClusterId;

  /// The ID of the replication group
  final String? replicationGroupId;

  /// The unique ID of the service update
  final String? serviceUpdateName;

  /// The status of the update action on the Redis cluster
  final UpdateActionStatus? updateActionStatus;

  ProcessedUpdateAction({
    this.cacheClusterId,
    this.replicationGroupId,
    this.serviceUpdateName,
    this.updateActionStatus,
  });
  factory ProcessedUpdateAction.fromXml(_s.XmlElement elem) {
    return ProcessedUpdateAction(
      cacheClusterId: _s.extractXmlStringValue(elem, 'CacheClusterId'),
      replicationGroupId: _s.extractXmlStringValue(elem, 'ReplicationGroupId'),
      serviceUpdateName: _s.extractXmlStringValue(elem, 'ServiceUpdateName'),
      updateActionStatus: _s
          .extractXmlStringValue(elem, 'UpdateActionStatus')
          ?.toUpdateActionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheClusterId = this.cacheClusterId;
    final replicationGroupId = this.replicationGroupId;
    final serviceUpdateName = this.serviceUpdateName;
    final updateActionStatus = this.updateActionStatus;
    return {
      if (cacheClusterId != null) 'CacheClusterId': cacheClusterId,
      if (replicationGroupId != null) 'ReplicationGroupId': replicationGroupId,
      if (serviceUpdateName != null) 'ServiceUpdateName': serviceUpdateName,
      if (updateActionStatus != null)
        'UpdateActionStatus': updateActionStatus.toValue(),
    };
  }
}

class PurchaseReservedCacheNodesOfferingResult {
  final ReservedCacheNode? reservedCacheNode;

  PurchaseReservedCacheNodesOfferingResult({
    this.reservedCacheNode,
  });
  factory PurchaseReservedCacheNodesOfferingResult.fromXml(_s.XmlElement elem) {
    return PurchaseReservedCacheNodesOfferingResult(
      reservedCacheNode: _s
          .extractXmlChild(elem, 'ReservedCacheNode')
          ?.let(ReservedCacheNode.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final reservedCacheNode = this.reservedCacheNode;
    return {
      if (reservedCacheNode != null) 'ReservedCacheNode': reservedCacheNode,
    };
  }
}

class RebalanceSlotsInGlobalReplicationGroupResult {
  final GlobalReplicationGroup? globalReplicationGroup;

  RebalanceSlotsInGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory RebalanceSlotsInGlobalReplicationGroupResult.fromXml(
      _s.XmlElement elem) {
    return RebalanceSlotsInGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let(GlobalReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final globalReplicationGroup = this.globalReplicationGroup;
    return {
      if (globalReplicationGroup != null)
        'GlobalReplicationGroup': globalReplicationGroup,
    };
  }
}

class RebootCacheClusterResult {
  final CacheCluster? cacheCluster;

  RebootCacheClusterResult({
    this.cacheCluster,
  });
  factory RebootCacheClusterResult.fromXml(_s.XmlElement elem) {
    return RebootCacheClusterResult(
      cacheCluster:
          _s.extractXmlChild(elem, 'CacheCluster')?.let(CacheCluster.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheCluster = this.cacheCluster;
    return {
      if (cacheCluster != null) 'CacheCluster': cacheCluster,
    };
  }
}

/// Contains the specific price and frequency of a recurring charges for a
/// reserved cache node, or for a reserved cache node offering.
class RecurringCharge {
  /// The monetary amount of the recurring charge.
  final double? recurringChargeAmount;

  /// The frequency of the recurring charge.
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

/// A list of the replication groups
class RegionalConfiguration {
  /// The name of the secondary cluster
  final String replicationGroupId;

  /// The Amazon region where the cluster is stored
  final String replicationGroupRegion;

  /// A list of <code>PreferredAvailabilityZones</code> objects that specifies the
  /// configuration of a node group in the resharded cluster.
  final List<ReshardingConfiguration> reshardingConfiguration;

  RegionalConfiguration({
    required this.replicationGroupId,
    required this.replicationGroupRegion,
    required this.reshardingConfiguration,
  });

  Map<String, dynamic> toJson() {
    final replicationGroupId = this.replicationGroupId;
    final replicationGroupRegion = this.replicationGroupRegion;
    final reshardingConfiguration = this.reshardingConfiguration;
    return {
      'ReplicationGroupId': replicationGroupId,
      'ReplicationGroupRegion': replicationGroupRegion,
      'ReshardingConfiguration': reshardingConfiguration,
    };
  }
}

/// Contains all of the attributes of a specific Redis replication group.
class ReplicationGroup {
  /// The ARN (Amazon Resource Name) of the replication group.
  final String? arn;

  /// A flag that enables encryption at-rest when set to <code>true</code>.
  ///
  /// You cannot modify the value of <code>AtRestEncryptionEnabled</code> after
  /// the cluster is created. To enable encryption at-rest on a cluster you must
  /// set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you
  /// create a cluster.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  ///
  /// Default: <code>false</code>
  final bool? atRestEncryptionEnabled;

  /// A flag that enables using an <code>AuthToken</code> (password) when issuing
  /// Redis commands.
  ///
  /// Default: <code>false</code>
  final bool? authTokenEnabled;

  /// The date the auth token was last modified
  final DateTime? authTokenLastModifiedDate;

  /// If you are running Redis engine version 6.0 or later, set this parameter to
  /// yes if you want to opt-in to the next auto minor version upgrade campaign.
  /// This parameter is disabled for previous versions.
  final bool? autoMinorVersionUpgrade;

  /// Indicates the status of automatic failover for this Redis replication group.
  final AutomaticFailoverStatus? automaticFailover;

  /// The name of the compute and memory capacity node type for each node in the
  /// replication group.
  final String? cacheNodeType;

  /// A flag indicating whether or not this replication group is cluster enabled;
  /// i.e., whether its data can be partitioned across multiple shards (API/CLI:
  /// node groups).
  ///
  /// Valid values: <code>true</code> | <code>false</code>
  final bool? clusterEnabled;

  /// Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you
  /// must first set the cluster mode to Compatible. Compatible mode allows your
  /// Redis clients to connect using both cluster mode enabled and cluster mode
  /// disabled. After you migrate all Redis clients to use cluster mode enabled,
  /// you can then complete cluster mode configuration and set the cluster mode to
  /// Enabled.
  final ClusterMode? clusterMode;

  /// The configuration endpoint for this replication group. Use the configuration
  /// endpoint to connect to this replication group.
  final Endpoint? configurationEndpoint;

  /// Enables data tiering. Data tiering is only supported for replication groups
  /// using the r6gd node type. This parameter must be set to true when using r6gd
  /// nodes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/data-tiering.html">Data
  /// tiering</a>.
  final DataTieringStatus? dataTiering;

  /// The user supplied description of the replication group.
  final String? description;

  /// The name of the Global datastore and role of this replication group in the
  /// Global datastore.
  final GlobalReplicationGroupInfo? globalReplicationGroupInfo;

  /// The network type you choose when modifying a cluster, either
  /// <code>ipv4</code> | <code>ipv6</code>. IPv6 is supported for workloads using
  /// Redis engine version 6.2 onward or Memcached engine version 1.6.6 on all
  /// instances built on the <a href="http://aws.amazon.com/ec2/nitro/">Nitro
  /// system</a>.
  final IpDiscovery? ipDiscovery;

  /// The ID of the KMS key used to encrypt the disk in the cluster.
  final String? kmsKeyId;

  /// Returns the destination, format and type of the logs.
  final List<LogDeliveryConfiguration>? logDeliveryConfigurations;

  /// The names of all the cache clusters that are part of this replication group.
  final List<String>? memberClusters;

  /// The outpost ARNs of the replication group's member clusters.
  final List<String>? memberClustersOutpostArns;

  /// A flag indicating if you have Multi-AZ enabled to enhance fault tolerance.
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html">Minimizing
  /// Downtime: Multi-AZ</a>
  final MultiAZStatus? multiAZ;

  /// Must be either <code>ipv4</code> | <code>ipv6</code> |
  /// <code>dual_stack</code>. IPv6 is supported for workloads using Redis engine
  /// version 6.2 onward or Memcached engine version 1.6.6 on all instances built
  /// on the <a href="http://aws.amazon.com/ec2/nitro/">Nitro system</a>.
  final NetworkType? networkType;

  /// A list of node groups in this replication group. For Redis (cluster mode
  /// disabled) replication groups, this is a single-element list. For Redis
  /// (cluster mode enabled) replication groups, the list contains an entry for
  /// each node group (shard).
  final List<NodeGroup>? nodeGroups;

  /// A group of settings to be applied to the replication group, either
  /// immediately or during the next maintenance window.
  final ReplicationGroupPendingModifiedValues? pendingModifiedValues;

  /// The date and time when the cluster was created.
  final DateTime? replicationGroupCreateTime;

  /// The identifier for the replication group.
  final String? replicationGroupId;

  /// The number of days for which ElastiCache retains automatic cluster snapshots
  /// before deleting them. For example, if you set
  /// <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is
  /// retained for 5 days before being deleted.
  /// <important>
  /// If the value of <code>SnapshotRetentionLimit</code> is set to zero (0),
  /// backups are turned off.
  /// </important>
  final int? snapshotRetentionLimit;

  /// The daily time range (in UTC) during which ElastiCache begins taking a daily
  /// snapshot of your node group (shard).
  ///
  /// Example: <code>05:00-09:00</code>
  ///
  /// If you do not specify this parameter, ElastiCache automatically chooses an
  /// appropriate time range.
  /// <note>
  /// This parameter is only valid if the <code>Engine</code> parameter is
  /// <code>redis</code>.
  /// </note>
  final String? snapshotWindow;

  /// The cluster ID that is used as the daily snapshot source for the replication
  /// group.
  final String? snapshottingClusterId;

  /// The current state of this replication group - <code>creating</code>,
  /// <code>available</code>, <code>modifying</code>, <code>deleting</code>,
  /// <code>create-failed</code>, <code>snapshotting</code>.
  final String? status;

  /// A flag that enables in-transit encryption when set to <code>true</code>.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  ///
  /// Default: <code>false</code>
  final bool? transitEncryptionEnabled;

  /// A setting that allows you to migrate your clients to use in-transit
  /// encryption, with no downtime.
  final TransitEncryptionMode? transitEncryptionMode;

  /// The ID of the user group associated to the replication group.
  final List<String>? userGroupIds;

  ReplicationGroup({
    this.arn,
    this.atRestEncryptionEnabled,
    this.authTokenEnabled,
    this.authTokenLastModifiedDate,
    this.autoMinorVersionUpgrade,
    this.automaticFailover,
    this.cacheNodeType,
    this.clusterEnabled,
    this.clusterMode,
    this.configurationEndpoint,
    this.dataTiering,
    this.description,
    this.globalReplicationGroupInfo,
    this.ipDiscovery,
    this.kmsKeyId,
    this.logDeliveryConfigurations,
    this.memberClusters,
    this.memberClustersOutpostArns,
    this.multiAZ,
    this.networkType,
    this.nodeGroups,
    this.pendingModifiedValues,
    this.replicationGroupCreateTime,
    this.replicationGroupId,
    this.snapshotRetentionLimit,
    this.snapshotWindow,
    this.snapshottingClusterId,
    this.status,
    this.transitEncryptionEnabled,
    this.transitEncryptionMode,
    this.userGroupIds,
  });
  factory ReplicationGroup.fromXml(_s.XmlElement elem) {
    return ReplicationGroup(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      atRestEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'AtRestEncryptionEnabled'),
      authTokenEnabled: _s.extractXmlBoolValue(elem, 'AuthTokenEnabled'),
      authTokenLastModifiedDate:
          _s.extractXmlDateTimeValue(elem, 'AuthTokenLastModifiedDate'),
      autoMinorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'AutoMinorVersionUpgrade'),
      automaticFailover: _s
          .extractXmlStringValue(elem, 'AutomaticFailover')
          ?.toAutomaticFailoverStatus(),
      cacheNodeType: _s.extractXmlStringValue(elem, 'CacheNodeType'),
      clusterEnabled: _s.extractXmlBoolValue(elem, 'ClusterEnabled'),
      clusterMode:
          _s.extractXmlStringValue(elem, 'ClusterMode')?.toClusterMode(),
      configurationEndpoint: _s
          .extractXmlChild(elem, 'ConfigurationEndpoint')
          ?.let(Endpoint.fromXml),
      dataTiering:
          _s.extractXmlStringValue(elem, 'DataTiering')?.toDataTieringStatus(),
      description: _s.extractXmlStringValue(elem, 'Description'),
      globalReplicationGroupInfo: _s
          .extractXmlChild(elem, 'GlobalReplicationGroupInfo')
          ?.let(GlobalReplicationGroupInfo.fromXml),
      ipDiscovery:
          _s.extractXmlStringValue(elem, 'IpDiscovery')?.toIpDiscovery(),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      logDeliveryConfigurations: _s
          .extractXmlChild(elem, 'LogDeliveryConfigurations')
          ?.let((elem) => elem
              .findElements('LogDeliveryConfiguration')
              .map(LogDeliveryConfiguration.fromXml)
              .toList()),
      memberClusters: _s
          .extractXmlChild(elem, 'MemberClusters')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'ClusterId')),
      memberClustersOutpostArns: _s
          .extractXmlChild(elem, 'MemberClustersOutpostArns')
          ?.let((elem) => _s.extractXmlStringListValues(
              elem, 'ReplicationGroupOutpostArn')),
      multiAZ: _s.extractXmlStringValue(elem, 'MultiAZ')?.toMultiAZStatus(),
      networkType:
          _s.extractXmlStringValue(elem, 'NetworkType')?.toNetworkType(),
      nodeGroups: _s.extractXmlChild(elem, 'NodeGroups')?.let((elem) =>
          elem.findElements('NodeGroup').map(NodeGroup.fromXml).toList()),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let(ReplicationGroupPendingModifiedValues.fromXml),
      replicationGroupCreateTime:
          _s.extractXmlDateTimeValue(elem, 'ReplicationGroupCreateTime'),
      replicationGroupId: _s.extractXmlStringValue(elem, 'ReplicationGroupId'),
      snapshotRetentionLimit:
          _s.extractXmlIntValue(elem, 'SnapshotRetentionLimit'),
      snapshotWindow: _s.extractXmlStringValue(elem, 'SnapshotWindow'),
      snapshottingClusterId:
          _s.extractXmlStringValue(elem, 'SnapshottingClusterId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      transitEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'TransitEncryptionEnabled'),
      transitEncryptionMode: _s
          .extractXmlStringValue(elem, 'TransitEncryptionMode')
          ?.toTransitEncryptionMode(),
      userGroupIds: _s
          .extractXmlChild(elem, 'UserGroupIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final atRestEncryptionEnabled = this.atRestEncryptionEnabled;
    final authTokenEnabled = this.authTokenEnabled;
    final authTokenLastModifiedDate = this.authTokenLastModifiedDate;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final automaticFailover = this.automaticFailover;
    final cacheNodeType = this.cacheNodeType;
    final clusterEnabled = this.clusterEnabled;
    final clusterMode = this.clusterMode;
    final configurationEndpoint = this.configurationEndpoint;
    final dataTiering = this.dataTiering;
    final description = this.description;
    final globalReplicationGroupInfo = this.globalReplicationGroupInfo;
    final ipDiscovery = this.ipDiscovery;
    final kmsKeyId = this.kmsKeyId;
    final logDeliveryConfigurations = this.logDeliveryConfigurations;
    final memberClusters = this.memberClusters;
    final memberClustersOutpostArns = this.memberClustersOutpostArns;
    final multiAZ = this.multiAZ;
    final networkType = this.networkType;
    final nodeGroups = this.nodeGroups;
    final pendingModifiedValues = this.pendingModifiedValues;
    final replicationGroupCreateTime = this.replicationGroupCreateTime;
    final replicationGroupId = this.replicationGroupId;
    final snapshotRetentionLimit = this.snapshotRetentionLimit;
    final snapshotWindow = this.snapshotWindow;
    final snapshottingClusterId = this.snapshottingClusterId;
    final status = this.status;
    final transitEncryptionEnabled = this.transitEncryptionEnabled;
    final transitEncryptionMode = this.transitEncryptionMode;
    final userGroupIds = this.userGroupIds;
    return {
      if (arn != null) 'ARN': arn,
      if (atRestEncryptionEnabled != null)
        'AtRestEncryptionEnabled': atRestEncryptionEnabled,
      if (authTokenEnabled != null) 'AuthTokenEnabled': authTokenEnabled,
      if (authTokenLastModifiedDate != null)
        'AuthTokenLastModifiedDate': iso8601ToJson(authTokenLastModifiedDate),
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (automaticFailover != null)
        'AutomaticFailover': automaticFailover.toValue(),
      if (cacheNodeType != null) 'CacheNodeType': cacheNodeType,
      if (clusterEnabled != null) 'ClusterEnabled': clusterEnabled,
      if (clusterMode != null) 'ClusterMode': clusterMode.toValue(),
      if (configurationEndpoint != null)
        'ConfigurationEndpoint': configurationEndpoint,
      if (dataTiering != null) 'DataTiering': dataTiering.toValue(),
      if (description != null) 'Description': description,
      if (globalReplicationGroupInfo != null)
        'GlobalReplicationGroupInfo': globalReplicationGroupInfo,
      if (ipDiscovery != null) 'IpDiscovery': ipDiscovery.toValue(),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (logDeliveryConfigurations != null)
        'LogDeliveryConfigurations': logDeliveryConfigurations,
      if (memberClusters != null) 'MemberClusters': memberClusters,
      if (memberClustersOutpostArns != null)
        'MemberClustersOutpostArns': memberClustersOutpostArns,
      if (multiAZ != null) 'MultiAZ': multiAZ.toValue(),
      if (networkType != null) 'NetworkType': networkType.toValue(),
      if (nodeGroups != null) 'NodeGroups': nodeGroups,
      if (pendingModifiedValues != null)
        'PendingModifiedValues': pendingModifiedValues,
      if (replicationGroupCreateTime != null)
        'ReplicationGroupCreateTime': iso8601ToJson(replicationGroupCreateTime),
      if (replicationGroupId != null) 'ReplicationGroupId': replicationGroupId,
      if (snapshotRetentionLimit != null)
        'SnapshotRetentionLimit': snapshotRetentionLimit,
      if (snapshotWindow != null) 'SnapshotWindow': snapshotWindow,
      if (snapshottingClusterId != null)
        'SnapshottingClusterId': snapshottingClusterId,
      if (status != null) 'Status': status,
      if (transitEncryptionEnabled != null)
        'TransitEncryptionEnabled': transitEncryptionEnabled,
      if (transitEncryptionMode != null)
        'TransitEncryptionMode': transitEncryptionMode.toValue(),
      if (userGroupIds != null) 'UserGroupIds': userGroupIds,
    };
  }
}

/// Represents the output of a <code>DescribeReplicationGroups</code> operation.
class ReplicationGroupMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  /// A list of replication groups. Each item in the list contains detailed
  /// information about one replication group.
  final List<ReplicationGroup>? replicationGroups;

  ReplicationGroupMessage({
    this.marker,
    this.replicationGroups,
  });
  factory ReplicationGroupMessage.fromXml(_s.XmlElement elem) {
    return ReplicationGroupMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      replicationGroups: _s.extractXmlChild(elem, 'ReplicationGroups')?.let(
          (elem) => elem
              .findElements('ReplicationGroup')
              .map(ReplicationGroup.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final replicationGroups = this.replicationGroups;
    return {
      if (marker != null) 'Marker': marker,
      if (replicationGroups != null) 'ReplicationGroups': replicationGroups,
    };
  }
}

/// The settings to be applied to the Redis replication group, either
/// immediately or during the next maintenance window.
class ReplicationGroupPendingModifiedValues {
  /// The auth token status
  final AuthTokenUpdateStatus? authTokenStatus;

  /// Indicates the status of automatic failover for this Redis replication group.
  final PendingAutomaticFailoverStatus? automaticFailoverStatus;

  /// Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you
  /// must first set the cluster mode to Compatible. Compatible mode allows your
  /// Redis clients to connect using both cluster mode enabled and cluster mode
  /// disabled. After you migrate all Redis clients to use cluster mode enabled,
  /// you can then complete cluster mode configuration and set the cluster mode to
  /// Enabled.
  final ClusterMode? clusterMode;

  /// The log delivery configurations being modified
  final List<PendingLogDeliveryConfiguration>? logDeliveryConfigurations;

  /// The primary cluster ID that is applied immediately (if
  /// <code>--apply-immediately</code> was specified), or during the next
  /// maintenance window.
  final String? primaryClusterId;

  /// The status of an online resharding operation.
  final ReshardingStatus? resharding;

  /// A flag that enables in-transit encryption when set to true.
  final bool? transitEncryptionEnabled;

  /// A setting that allows you to migrate your clients to use in-transit
  /// encryption, with no downtime.
  final TransitEncryptionMode? transitEncryptionMode;

  /// The user group being modified.
  final UserGroupsUpdateStatus? userGroups;

  ReplicationGroupPendingModifiedValues({
    this.authTokenStatus,
    this.automaticFailoverStatus,
    this.clusterMode,
    this.logDeliveryConfigurations,
    this.primaryClusterId,
    this.resharding,
    this.transitEncryptionEnabled,
    this.transitEncryptionMode,
    this.userGroups,
  });
  factory ReplicationGroupPendingModifiedValues.fromXml(_s.XmlElement elem) {
    return ReplicationGroupPendingModifiedValues(
      authTokenStatus: _s
          .extractXmlStringValue(elem, 'AuthTokenStatus')
          ?.toAuthTokenUpdateStatus(),
      automaticFailoverStatus: _s
          .extractXmlStringValue(elem, 'AutomaticFailoverStatus')
          ?.toPendingAutomaticFailoverStatus(),
      clusterMode:
          _s.extractXmlStringValue(elem, 'ClusterMode')?.toClusterMode(),
      logDeliveryConfigurations: _s
          .extractXmlChild(elem, 'PendingLogDeliveryConfiguration')
          ?.let((elem) => elem
              .findElements('member')
              .map(PendingLogDeliveryConfiguration.fromXml)
              .toList()),
      primaryClusterId: _s.extractXmlStringValue(elem, 'PrimaryClusterId'),
      resharding:
          _s.extractXmlChild(elem, 'Resharding')?.let(ReshardingStatus.fromXml),
      transitEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'TransitEncryptionEnabled'),
      transitEncryptionMode: _s
          .extractXmlStringValue(elem, 'TransitEncryptionMode')
          ?.toTransitEncryptionMode(),
      userGroups: _s
          .extractXmlChild(elem, 'UserGroups')
          ?.let(UserGroupsUpdateStatus.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final authTokenStatus = this.authTokenStatus;
    final automaticFailoverStatus = this.automaticFailoverStatus;
    final clusterMode = this.clusterMode;
    final logDeliveryConfigurations = this.logDeliveryConfigurations;
    final primaryClusterId = this.primaryClusterId;
    final resharding = this.resharding;
    final transitEncryptionEnabled = this.transitEncryptionEnabled;
    final transitEncryptionMode = this.transitEncryptionMode;
    final userGroups = this.userGroups;
    return {
      if (authTokenStatus != null) 'AuthTokenStatus': authTokenStatus.toValue(),
      if (automaticFailoverStatus != null)
        'AutomaticFailoverStatus': automaticFailoverStatus.toValue(),
      if (clusterMode != null) 'ClusterMode': clusterMode.toValue(),
      if (logDeliveryConfigurations != null)
        'PendingLogDeliveryConfiguration': logDeliveryConfigurations,
      if (primaryClusterId != null) 'PrimaryClusterId': primaryClusterId,
      if (resharding != null) 'Resharding': resharding,
      if (transitEncryptionEnabled != null)
        'TransitEncryptionEnabled': transitEncryptionEnabled,
      if (transitEncryptionMode != null)
        'TransitEncryptionMode': transitEncryptionMode.toValue(),
      if (userGroups != null) 'UserGroups': userGroups,
    };
  }
}

/// Represents the output of a <code>PurchaseReservedCacheNodesOffering</code>
/// operation.
class ReservedCacheNode {
  /// The number of cache nodes that have been reserved.
  final int? cacheNodeCount;

  /// The cache node type for the reserved cache nodes.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power at
  /// lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// <ul>
  /// <li>
  /// General purpose:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>M7g node types</b>: <code>cache.m7g.large</code>,
  /// <code>cache.m7g.xlarge</code>, <code>cache.m7g.2xlarge</code>,
  /// <code>cache.m7g.4xlarge</code>, <code>cache.m7g.8xlarge</code>,
  /// <code>cache.m7g.12xlarge</code>, <code>cache.m7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward):
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  ///
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T4g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and Memcached engine version 1.5.16 onward): <code>cache.t4g.micro</code>,
  /// <code>cache.t4g.small</code>, <code>cache.t4g.medium</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>T1 node types:</b> <code>cache.t1.micro</code>
  ///
  /// <b>M1 node types:</b> <code>cache.m1.small</code>,
  /// <code>cache.m1.medium</code>, <code>cache.m1.large</code>,
  /// <code>cache.m1.xlarge</code>
  ///
  /// <b>M3 node types:</b> <code>cache.m3.medium</code>,
  /// <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>,
  /// <code>cache.m3.2xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Compute optimized:
  ///
  /// <ul>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>C1 node types:</b> <code>cache.c1.xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Memory optimized:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>R7g node types</b>: <code>cache.r7g.large</code>,
  /// <code>cache.r7g.xlarge</code>, <code>cache.r7g.2xlarge</code>,
  /// <code>cache.r7g.4xlarge</code>, <code>cache.r7g.8xlarge</code>,
  /// <code>cache.r7g.12xlarge</code>, <code>cache.r7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward):
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  ///
  /// <b>R5 node types:</b> <code>cache.r5.large</code>,
  /// <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>,
  /// <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>,
  /// <code>cache.r5.24xlarge</code>
  ///
  /// <b>R4 node types:</b> <code>cache.r4.large</code>,
  /// <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>,
  /// <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>,
  /// <code>cache.r4.16xlarge</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>M2 node types:</b> <code>cache.m2.xlarge</code>,
  /// <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code>
  ///
  /// <b>R3 node types:</b> <code>cache.r3.large</code>,
  /// <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>,
  /// <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// <b>Additional node type info</b>
  ///
  /// <ul>
  /// <li>
  /// All current generation instance types are created in Amazon VPC by default.
  /// </li>
  /// <li>
  /// Redis append-only files (AOF) are not supported for T1 or T2 instances.
  /// </li>
  /// <li>
  /// Redis Multi-AZ with automatic failover is not supported on T1 instances.
  /// </li>
  /// <li>
  /// Redis configuration variables <code>appendonly</code> and
  /// <code>appendfsync</code> are not supported on Redis version 2.8.22 and
  /// later.
  /// </li>
  /// </ul>
  final String? cacheNodeType;

  /// The duration of the reservation in seconds.
  final int? duration;

  /// The fixed price charged for this reserved cache node.
  final double? fixedPrice;

  /// The offering type of this reserved cache node.
  final String? offeringType;

  /// The description of the reserved cache node.
  final String? productDescription;

  /// The recurring price charged to run this reserved cache node.
  final List<RecurringCharge>? recurringCharges;

  /// The Amazon Resource Name (ARN) of the reserved cache node.
  ///
  /// Example:
  /// <code>arn:aws:elasticache:us-east-1:123456789012:reserved-instance:ri-2017-03-27-08-33-25-582</code>
  final String? reservationARN;

  /// The unique identifier for the reservation.
  final String? reservedCacheNodeId;

  /// The offering identifier.
  final String? reservedCacheNodesOfferingId;

  /// The time the reservation started.
  final DateTime? startTime;

  /// The state of the reserved cache node.
  final String? state;

  /// The hourly price charged for this reserved cache node.
  final double? usagePrice;

  ReservedCacheNode({
    this.cacheNodeCount,
    this.cacheNodeType,
    this.duration,
    this.fixedPrice,
    this.offeringType,
    this.productDescription,
    this.recurringCharges,
    this.reservationARN,
    this.reservedCacheNodeId,
    this.reservedCacheNodesOfferingId,
    this.startTime,
    this.state,
    this.usagePrice,
  });
  factory ReservedCacheNode.fromXml(_s.XmlElement elem) {
    return ReservedCacheNode(
      cacheNodeCount: _s.extractXmlIntValue(elem, 'CacheNodeCount'),
      cacheNodeType: _s.extractXmlStringValue(elem, 'CacheNodeType'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      productDescription: _s.extractXmlStringValue(elem, 'ProductDescription'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map(RecurringCharge.fromXml)
              .toList()),
      reservationARN: _s.extractXmlStringValue(elem, 'ReservationARN'),
      reservedCacheNodeId:
          _s.extractXmlStringValue(elem, 'ReservedCacheNodeId'),
      reservedCacheNodesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedCacheNodesOfferingId'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      state: _s.extractXmlStringValue(elem, 'State'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheNodeCount = this.cacheNodeCount;
    final cacheNodeType = this.cacheNodeType;
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final offeringType = this.offeringType;
    final productDescription = this.productDescription;
    final recurringCharges = this.recurringCharges;
    final reservationARN = this.reservationARN;
    final reservedCacheNodeId = this.reservedCacheNodeId;
    final reservedCacheNodesOfferingId = this.reservedCacheNodesOfferingId;
    final startTime = this.startTime;
    final state = this.state;
    final usagePrice = this.usagePrice;
    return {
      if (cacheNodeCount != null) 'CacheNodeCount': cacheNodeCount,
      if (cacheNodeType != null) 'CacheNodeType': cacheNodeType,
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (offeringType != null) 'OfferingType': offeringType,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservationARN != null) 'ReservationARN': reservationARN,
      if (reservedCacheNodeId != null)
        'ReservedCacheNodeId': reservedCacheNodeId,
      if (reservedCacheNodesOfferingId != null)
        'ReservedCacheNodesOfferingId': reservedCacheNodesOfferingId,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (state != null) 'State': state,
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

/// Represents the output of a <code>DescribeReservedCacheNodes</code>
/// operation.
class ReservedCacheNodeMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  /// A list of reserved cache nodes. Each element in the list contains detailed
  /// information about one node.
  final List<ReservedCacheNode>? reservedCacheNodes;

  ReservedCacheNodeMessage({
    this.marker,
    this.reservedCacheNodes,
  });
  factory ReservedCacheNodeMessage.fromXml(_s.XmlElement elem) {
    return ReservedCacheNodeMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedCacheNodes: _s.extractXmlChild(elem, 'ReservedCacheNodes')?.let(
          (elem) => elem
              .findElements('ReservedCacheNode')
              .map(ReservedCacheNode.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final reservedCacheNodes = this.reservedCacheNodes;
    return {
      if (marker != null) 'Marker': marker,
      if (reservedCacheNodes != null) 'ReservedCacheNodes': reservedCacheNodes,
    };
  }
}

/// Describes all of the attributes of a reserved cache node offering.
class ReservedCacheNodesOffering {
  /// The cache node type for the reserved cache node.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power at
  /// lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// <ul>
  /// <li>
  /// General purpose:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>M7g node types</b>: <code>cache.m7g.large</code>,
  /// <code>cache.m7g.xlarge</code>, <code>cache.m7g.2xlarge</code>,
  /// <code>cache.m7g.4xlarge</code>, <code>cache.m7g.8xlarge</code>,
  /// <code>cache.m7g.12xlarge</code>, <code>cache.m7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward):
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  ///
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T4g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and Memcached engine version 1.5.16 onward): <code>cache.t4g.micro</code>,
  /// <code>cache.t4g.small</code>, <code>cache.t4g.medium</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>T1 node types:</b> <code>cache.t1.micro</code>
  ///
  /// <b>M1 node types:</b> <code>cache.m1.small</code>,
  /// <code>cache.m1.medium</code>, <code>cache.m1.large</code>,
  /// <code>cache.m1.xlarge</code>
  ///
  /// <b>M3 node types:</b> <code>cache.m3.medium</code>,
  /// <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>,
  /// <code>cache.m3.2xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Compute optimized:
  ///
  /// <ul>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>C1 node types:</b> <code>cache.c1.xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Memory optimized:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>R7g node types</b>: <code>cache.r7g.large</code>,
  /// <code>cache.r7g.xlarge</code>, <code>cache.r7g.2xlarge</code>,
  /// <code>cache.r7g.4xlarge</code>, <code>cache.r7g.8xlarge</code>,
  /// <code>cache.r7g.12xlarge</code>, <code>cache.r7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward):
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  ///
  /// <b>R5 node types:</b> <code>cache.r5.large</code>,
  /// <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>,
  /// <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>,
  /// <code>cache.r5.24xlarge</code>
  ///
  /// <b>R4 node types:</b> <code>cache.r4.large</code>,
  /// <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>,
  /// <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>,
  /// <code>cache.r4.16xlarge</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>M2 node types:</b> <code>cache.m2.xlarge</code>,
  /// <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code>
  ///
  /// <b>R3 node types:</b> <code>cache.r3.large</code>,
  /// <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>,
  /// <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// <b>Additional node type info</b>
  ///
  /// <ul>
  /// <li>
  /// All current generation instance types are created in Amazon VPC by default.
  /// </li>
  /// <li>
  /// Redis append-only files (AOF) are not supported for T1 or T2 instances.
  /// </li>
  /// <li>
  /// Redis Multi-AZ with automatic failover is not supported on T1 instances.
  /// </li>
  /// <li>
  /// Redis configuration variables <code>appendonly</code> and
  /// <code>appendfsync</code> are not supported on Redis version 2.8.22 and
  /// later.
  /// </li>
  /// </ul>
  final String? cacheNodeType;

  /// The duration of the offering. in seconds.
  final int? duration;

  /// The fixed price charged for this offering.
  final double? fixedPrice;

  /// The offering type.
  final String? offeringType;

  /// The cache engine used by the offering.
  final String? productDescription;

  /// The recurring price charged to run this reserved cache node.
  final List<RecurringCharge>? recurringCharges;

  /// A unique identifier for the reserved cache node offering.
  final String? reservedCacheNodesOfferingId;

  /// The hourly price charged for this offering.
  final double? usagePrice;

  ReservedCacheNodesOffering({
    this.cacheNodeType,
    this.duration,
    this.fixedPrice,
    this.offeringType,
    this.productDescription,
    this.recurringCharges,
    this.reservedCacheNodesOfferingId,
    this.usagePrice,
  });
  factory ReservedCacheNodesOffering.fromXml(_s.XmlElement elem) {
    return ReservedCacheNodesOffering(
      cacheNodeType: _s.extractXmlStringValue(elem, 'CacheNodeType'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      productDescription: _s.extractXmlStringValue(elem, 'ProductDescription'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map(RecurringCharge.fromXml)
              .toList()),
      reservedCacheNodesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedCacheNodesOfferingId'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheNodeType = this.cacheNodeType;
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final offeringType = this.offeringType;
    final productDescription = this.productDescription;
    final recurringCharges = this.recurringCharges;
    final reservedCacheNodesOfferingId = this.reservedCacheNodesOfferingId;
    final usagePrice = this.usagePrice;
    return {
      if (cacheNodeType != null) 'CacheNodeType': cacheNodeType,
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (offeringType != null) 'OfferingType': offeringType,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservedCacheNodesOfferingId != null)
        'ReservedCacheNodesOfferingId': reservedCacheNodesOfferingId,
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

/// Represents the output of a <code>DescribeReservedCacheNodesOfferings</code>
/// operation.
class ReservedCacheNodesOfferingMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String? marker;

  /// A list of reserved cache node offerings. Each element in the list contains
  /// detailed information about one offering.
  final List<ReservedCacheNodesOffering>? reservedCacheNodesOfferings;

  ReservedCacheNodesOfferingMessage({
    this.marker,
    this.reservedCacheNodesOfferings,
  });
  factory ReservedCacheNodesOfferingMessage.fromXml(_s.XmlElement elem) {
    return ReservedCacheNodesOfferingMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedCacheNodesOfferings: _s
          .extractXmlChild(elem, 'ReservedCacheNodesOfferings')
          ?.let((elem) => elem
              .findElements('ReservedCacheNodesOffering')
              .map(ReservedCacheNodesOffering.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final reservedCacheNodesOfferings = this.reservedCacheNodesOfferings;
    return {
      if (marker != null) 'Marker': marker,
      if (reservedCacheNodesOfferings != null)
        'ReservedCacheNodesOfferings': reservedCacheNodesOfferings,
    };
  }
}

/// A list of <code>PreferredAvailabilityZones</code> objects that specifies the
/// configuration of a node group in the resharded cluster.
class ReshardingConfiguration {
  /// Either the ElastiCache for Redis supplied 4-digit id or a user supplied id
  /// for the node group these configuration values apply to.
  final String? nodeGroupId;

  /// A list of preferred availability zones for the nodes in this cluster.
  final List<String>? preferredAvailabilityZones;

  ReshardingConfiguration({
    this.nodeGroupId,
    this.preferredAvailabilityZones,
  });

  Map<String, dynamic> toJson() {
    final nodeGroupId = this.nodeGroupId;
    final preferredAvailabilityZones = this.preferredAvailabilityZones;
    return {
      if (nodeGroupId != null) 'NodeGroupId': nodeGroupId,
      if (preferredAvailabilityZones != null)
        'PreferredAvailabilityZones': preferredAvailabilityZones,
    };
  }
}

/// The status of an online resharding operation.
class ReshardingStatus {
  /// Represents the progress of an online resharding operation.
  final SlotMigration? slotMigration;

  ReshardingStatus({
    this.slotMigration,
  });
  factory ReshardingStatus.fromXml(_s.XmlElement elem) {
    return ReshardingStatus(
      slotMigration:
          _s.extractXmlChild(elem, 'SlotMigration')?.let(SlotMigration.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final slotMigration = this.slotMigration;
    return {
      if (slotMigration != null) 'SlotMigration': slotMigration,
    };
  }
}

class RevokeCacheSecurityGroupIngressResult {
  final CacheSecurityGroup? cacheSecurityGroup;

  RevokeCacheSecurityGroupIngressResult({
    this.cacheSecurityGroup,
  });
  factory RevokeCacheSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return RevokeCacheSecurityGroupIngressResult(
      cacheSecurityGroup: _s
          .extractXmlChild(elem, 'CacheSecurityGroup')
          ?.let(CacheSecurityGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheSecurityGroup = this.cacheSecurityGroup;
    return {
      if (cacheSecurityGroup != null) 'CacheSecurityGroup': cacheSecurityGroup,
    };
  }
}

/// Represents a single cache security group and its status.
class SecurityGroupMembership {
  /// The identifier of the cache security group.
  final String? securityGroupId;

  /// The status of the cache security group membership. The status changes
  /// whenever a cache security group is modified, or when the cache security
  /// groups assigned to a cluster are modified.
  final String? status;

  SecurityGroupMembership({
    this.securityGroupId,
    this.status,
  });
  factory SecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return SecurityGroupMembership(
      securityGroupId: _s.extractXmlStringValue(elem, 'SecurityGroupId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
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

/// The resource representing a serverless cache.
class ServerlessCache {
  /// The Amazon Resource Name (ARN) of the serverless cache.
  final String? arn;

  /// The cache usage limit for the serverless cache.
  final CacheUsageLimits? cacheUsageLimits;

  /// When the serverless cache was created.
  final DateTime? createTime;

  /// The daily time that a cache snapshot will be created. Default is NULL, i.e.
  /// snapshots will not be created at a specific time on a daily basis. Available
  /// for Redis only.
  final String? dailySnapshotTime;

  /// A description of the serverless cache.
  final String? description;
  final Endpoint? endpoint;

  /// The engine the serverless cache is compatible with.
  final String? engine;

  /// The name and version number of the engine the serverless cache is compatible
  /// with.
  final String? fullEngineVersion;

  /// The ID of the Amazon Web Services Key Management Service (KMS) key that is
  /// used to encrypt data at rest in the serverless cache.
  final String? kmsKeyId;

  /// The version number of the engine the serverless cache is compatible with.
  final String? majorEngineVersion;
  final Endpoint? readerEndpoint;

  /// The IDs of the EC2 security groups associated with the serverless cache.
  final List<String>? securityGroupIds;

  /// The unique identifier of the serverless cache.
  final String? serverlessCacheName;

  /// The current setting for the number of serverless cache snapshots the system
  /// will retain. Available for Redis only.
  final int? snapshotRetentionLimit;

  /// The current status of the serverless cache. The allowed values are CREATING,
  /// AVAILABLE, DELETING, CREATE-FAILED and MODIFYING.
  final String? status;

  /// If no subnet IDs are given and your VPC is in us-west-1, then ElastiCache
  /// will select 2 default subnets across AZs in your VPC. For all other Regions,
  /// if no subnet IDs are given then ElastiCache will select 3 default subnets
  /// across AZs in your default VPC.
  final List<String>? subnetIds;

  /// The identifier of the user group associated with the serverless cache.
  /// Available for Redis only. Default is NULL.
  final String? userGroupId;

  ServerlessCache({
    this.arn,
    this.cacheUsageLimits,
    this.createTime,
    this.dailySnapshotTime,
    this.description,
    this.endpoint,
    this.engine,
    this.fullEngineVersion,
    this.kmsKeyId,
    this.majorEngineVersion,
    this.readerEndpoint,
    this.securityGroupIds,
    this.serverlessCacheName,
    this.snapshotRetentionLimit,
    this.status,
    this.subnetIds,
    this.userGroupId,
  });
  factory ServerlessCache.fromXml(_s.XmlElement elem) {
    return ServerlessCache(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      cacheUsageLimits: _s
          .extractXmlChild(elem, 'CacheUsageLimits')
          ?.let(CacheUsageLimits.fromXml),
      createTime: _s.extractXmlDateTimeValue(elem, 'CreateTime'),
      dailySnapshotTime: _s.extractXmlStringValue(elem, 'DailySnapshotTime'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      endpoint: _s.extractXmlChild(elem, 'Endpoint')?.let(Endpoint.fromXml),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      fullEngineVersion: _s.extractXmlStringValue(elem, 'FullEngineVersion'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      readerEndpoint:
          _s.extractXmlChild(elem, 'ReaderEndpoint')?.let(Endpoint.fromXml),
      securityGroupIds: _s.extractXmlChild(elem, 'SecurityGroupIds')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'SecurityGroupId')),
      serverlessCacheName:
          _s.extractXmlStringValue(elem, 'ServerlessCacheName'),
      snapshotRetentionLimit:
          _s.extractXmlIntValue(elem, 'SnapshotRetentionLimit'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      subnetIds: _s
          .extractXmlChild(elem, 'SubnetIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'SubnetId')),
      userGroupId: _s.extractXmlStringValue(elem, 'UserGroupId'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cacheUsageLimits = this.cacheUsageLimits;
    final createTime = this.createTime;
    final dailySnapshotTime = this.dailySnapshotTime;
    final description = this.description;
    final endpoint = this.endpoint;
    final engine = this.engine;
    final fullEngineVersion = this.fullEngineVersion;
    final kmsKeyId = this.kmsKeyId;
    final majorEngineVersion = this.majorEngineVersion;
    final readerEndpoint = this.readerEndpoint;
    final securityGroupIds = this.securityGroupIds;
    final serverlessCacheName = this.serverlessCacheName;
    final snapshotRetentionLimit = this.snapshotRetentionLimit;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final userGroupId = this.userGroupId;
    return {
      if (arn != null) 'ARN': arn,
      if (cacheUsageLimits != null) 'CacheUsageLimits': cacheUsageLimits,
      if (createTime != null) 'CreateTime': iso8601ToJson(createTime),
      if (dailySnapshotTime != null) 'DailySnapshotTime': dailySnapshotTime,
      if (description != null) 'Description': description,
      if (endpoint != null) 'Endpoint': endpoint,
      if (engine != null) 'Engine': engine,
      if (fullEngineVersion != null) 'FullEngineVersion': fullEngineVersion,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (majorEngineVersion != null) 'MajorEngineVersion': majorEngineVersion,
      if (readerEndpoint != null) 'ReaderEndpoint': readerEndpoint,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (serverlessCacheName != null)
        'ServerlessCacheName': serverlessCacheName,
      if (snapshotRetentionLimit != null)
        'SnapshotRetentionLimit': snapshotRetentionLimit,
      if (status != null) 'Status': status,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (userGroupId != null) 'UserGroupId': userGroupId,
    };
  }
}

/// The configuration settings for a specific serverless cache.
class ServerlessCacheConfiguration {
  /// The engine that the serverless cache is configured with.
  final String? engine;

  /// The engine version number that the serverless cache is configured with.
  final String? majorEngineVersion;

  /// The identifier of a serverless cache.
  final String? serverlessCacheName;

  ServerlessCacheConfiguration({
    this.engine,
    this.majorEngineVersion,
    this.serverlessCacheName,
  });
  factory ServerlessCacheConfiguration.fromXml(_s.XmlElement elem) {
    return ServerlessCacheConfiguration(
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      serverlessCacheName:
          _s.extractXmlStringValue(elem, 'ServerlessCacheName'),
    );
  }

  Map<String, dynamic> toJson() {
    final engine = this.engine;
    final majorEngineVersion = this.majorEngineVersion;
    final serverlessCacheName = this.serverlessCacheName;
    return {
      if (engine != null) 'Engine': engine,
      if (majorEngineVersion != null) 'MajorEngineVersion': majorEngineVersion,
      if (serverlessCacheName != null)
        'ServerlessCacheName': serverlessCacheName,
    };
  }
}

/// The resource representing a serverless cache snapshot. Available for Redis
/// only.
class ServerlessCacheSnapshot {
  /// The Amazon Resource Name (ARN) of a serverless cache snapshot. Available for
  /// Redis only.
  final String? arn;

  /// The total size of a serverless cache snapshot, in bytes. Available for Redis
  /// only.
  final String? bytesUsedForCache;

  /// The date and time that the source serverless cache's metadata and cache data
  /// set was obtained for the snapshot. Available for Redis only.
  final DateTime? createTime;

  /// The time that the serverless cache snapshot will expire. Available for Redis
  /// only.
  final DateTime? expiryTime;

  /// The ID of the Amazon Web Services Key Management Service (KMS) key of a
  /// serverless cache snapshot. Available for Redis only.
  final String? kmsKeyId;

  /// The configuration of the serverless cache, at the time the snapshot was
  /// taken. Available for Redis only.
  final ServerlessCacheConfiguration? serverlessCacheConfiguration;

  /// The identifier of a serverless cache snapshot. Available for Redis only.
  final String? serverlessCacheSnapshotName;

  /// The type of snapshot of serverless cache. Available for Redis only.
  final String? snapshotType;

  /// The current status of the serverless cache. Available for Redis only.
  final String? status;

  ServerlessCacheSnapshot({
    this.arn,
    this.bytesUsedForCache,
    this.createTime,
    this.expiryTime,
    this.kmsKeyId,
    this.serverlessCacheConfiguration,
    this.serverlessCacheSnapshotName,
    this.snapshotType,
    this.status,
  });
  factory ServerlessCacheSnapshot.fromXml(_s.XmlElement elem) {
    return ServerlessCacheSnapshot(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      bytesUsedForCache: _s.extractXmlStringValue(elem, 'BytesUsedForCache'),
      createTime: _s.extractXmlDateTimeValue(elem, 'CreateTime'),
      expiryTime: _s.extractXmlDateTimeValue(elem, 'ExpiryTime'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      serverlessCacheConfiguration: _s
          .extractXmlChild(elem, 'ServerlessCacheConfiguration')
          ?.let(ServerlessCacheConfiguration.fromXml),
      serverlessCacheSnapshotName:
          _s.extractXmlStringValue(elem, 'ServerlessCacheSnapshotName'),
      snapshotType: _s.extractXmlStringValue(elem, 'SnapshotType'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final bytesUsedForCache = this.bytesUsedForCache;
    final createTime = this.createTime;
    final expiryTime = this.expiryTime;
    final kmsKeyId = this.kmsKeyId;
    final serverlessCacheConfiguration = this.serverlessCacheConfiguration;
    final serverlessCacheSnapshotName = this.serverlessCacheSnapshotName;
    final snapshotType = this.snapshotType;
    final status = this.status;
    return {
      if (arn != null) 'ARN': arn,
      if (bytesUsedForCache != null) 'BytesUsedForCache': bytesUsedForCache,
      if (createTime != null) 'CreateTime': iso8601ToJson(createTime),
      if (expiryTime != null) 'ExpiryTime': iso8601ToJson(expiryTime),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (serverlessCacheConfiguration != null)
        'ServerlessCacheConfiguration': serverlessCacheConfiguration,
      if (serverlessCacheSnapshotName != null)
        'ServerlessCacheSnapshotName': serverlessCacheSnapshotName,
      if (snapshotType != null) 'SnapshotType': snapshotType,
      if (status != null) 'Status': status,
    };
  }
}

/// An update that you can apply to your Redis clusters.
class ServiceUpdate {
  /// Indicates whether the service update will be automatically applied once the
  /// recommended apply-by date has expired.
  final bool? autoUpdateAfterRecommendedApplyByDate;

  /// The Elasticache engine to which the update applies. Either Redis or
  /// Memcached
  final String? engine;

  /// The Elasticache engine version to which the update applies. Either Redis or
  /// Memcached engine version
  final String? engineVersion;

  /// The estimated length of time the service update will take
  final String? estimatedUpdateTime;

  /// Provides details of the service update
  final String? serviceUpdateDescription;

  /// The date after which the service update is no longer available
  final DateTime? serviceUpdateEndDate;

  /// The unique ID of the service update
  final String? serviceUpdateName;

  /// The recommendend date to apply the service update in order to ensure
  /// compliance. For information on compliance, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service">Self-Service
  /// Security Updates for Compliance</a>.
  final DateTime? serviceUpdateRecommendedApplyByDate;

  /// The date when the service update is initially available
  final DateTime? serviceUpdateReleaseDate;

  /// The severity of the service update
  final ServiceUpdateSeverity? serviceUpdateSeverity;

  /// The status of the service update
  final ServiceUpdateStatus? serviceUpdateStatus;

  /// Reflects the nature of the service update
  final ServiceUpdateType? serviceUpdateType;

  ServiceUpdate({
    this.autoUpdateAfterRecommendedApplyByDate,
    this.engine,
    this.engineVersion,
    this.estimatedUpdateTime,
    this.serviceUpdateDescription,
    this.serviceUpdateEndDate,
    this.serviceUpdateName,
    this.serviceUpdateRecommendedApplyByDate,
    this.serviceUpdateReleaseDate,
    this.serviceUpdateSeverity,
    this.serviceUpdateStatus,
    this.serviceUpdateType,
  });
  factory ServiceUpdate.fromXml(_s.XmlElement elem) {
    return ServiceUpdate(
      autoUpdateAfterRecommendedApplyByDate:
          _s.extractXmlBoolValue(elem, 'AutoUpdateAfterRecommendedApplyByDate'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      estimatedUpdateTime:
          _s.extractXmlStringValue(elem, 'EstimatedUpdateTime'),
      serviceUpdateDescription:
          _s.extractXmlStringValue(elem, 'ServiceUpdateDescription'),
      serviceUpdateEndDate:
          _s.extractXmlDateTimeValue(elem, 'ServiceUpdateEndDate'),
      serviceUpdateName: _s.extractXmlStringValue(elem, 'ServiceUpdateName'),
      serviceUpdateRecommendedApplyByDate: _s.extractXmlDateTimeValue(
          elem, 'ServiceUpdateRecommendedApplyByDate'),
      serviceUpdateReleaseDate:
          _s.extractXmlDateTimeValue(elem, 'ServiceUpdateReleaseDate'),
      serviceUpdateSeverity: _s
          .extractXmlStringValue(elem, 'ServiceUpdateSeverity')
          ?.toServiceUpdateSeverity(),
      serviceUpdateStatus: _s
          .extractXmlStringValue(elem, 'ServiceUpdateStatus')
          ?.toServiceUpdateStatus(),
      serviceUpdateType: _s
          .extractXmlStringValue(elem, 'ServiceUpdateType')
          ?.toServiceUpdateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoUpdateAfterRecommendedApplyByDate =
        this.autoUpdateAfterRecommendedApplyByDate;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final estimatedUpdateTime = this.estimatedUpdateTime;
    final serviceUpdateDescription = this.serviceUpdateDescription;
    final serviceUpdateEndDate = this.serviceUpdateEndDate;
    final serviceUpdateName = this.serviceUpdateName;
    final serviceUpdateRecommendedApplyByDate =
        this.serviceUpdateRecommendedApplyByDate;
    final serviceUpdateReleaseDate = this.serviceUpdateReleaseDate;
    final serviceUpdateSeverity = this.serviceUpdateSeverity;
    final serviceUpdateStatus = this.serviceUpdateStatus;
    final serviceUpdateType = this.serviceUpdateType;
    return {
      if (autoUpdateAfterRecommendedApplyByDate != null)
        'AutoUpdateAfterRecommendedApplyByDate':
            autoUpdateAfterRecommendedApplyByDate,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (estimatedUpdateTime != null)
        'EstimatedUpdateTime': estimatedUpdateTime,
      if (serviceUpdateDescription != null)
        'ServiceUpdateDescription': serviceUpdateDescription,
      if (serviceUpdateEndDate != null)
        'ServiceUpdateEndDate': iso8601ToJson(serviceUpdateEndDate),
      if (serviceUpdateName != null) 'ServiceUpdateName': serviceUpdateName,
      if (serviceUpdateRecommendedApplyByDate != null)
        'ServiceUpdateRecommendedApplyByDate':
            iso8601ToJson(serviceUpdateRecommendedApplyByDate),
      if (serviceUpdateReleaseDate != null)
        'ServiceUpdateReleaseDate': iso8601ToJson(serviceUpdateReleaseDate),
      if (serviceUpdateSeverity != null)
        'ServiceUpdateSeverity': serviceUpdateSeverity.toValue(),
      if (serviceUpdateStatus != null)
        'ServiceUpdateStatus': serviceUpdateStatus.toValue(),
      if (serviceUpdateType != null)
        'ServiceUpdateType': serviceUpdateType.toValue(),
    };
  }
}

enum ServiceUpdateSeverity {
  critical,
  important,
  medium,
  low,
}

extension ServiceUpdateSeverityValueExtension on ServiceUpdateSeverity {
  String toValue() {
    switch (this) {
      case ServiceUpdateSeverity.critical:
        return 'critical';
      case ServiceUpdateSeverity.important:
        return 'important';
      case ServiceUpdateSeverity.medium:
        return 'medium';
      case ServiceUpdateSeverity.low:
        return 'low';
    }
  }
}

extension ServiceUpdateSeverityFromString on String {
  ServiceUpdateSeverity toServiceUpdateSeverity() {
    switch (this) {
      case 'critical':
        return ServiceUpdateSeverity.critical;
      case 'important':
        return ServiceUpdateSeverity.important;
      case 'medium':
        return ServiceUpdateSeverity.medium;
      case 'low':
        return ServiceUpdateSeverity.low;
    }
    throw Exception('$this is not known in enum ServiceUpdateSeverity');
  }
}

enum ServiceUpdateStatus {
  available,
  cancelled,
  expired,
}

extension ServiceUpdateStatusValueExtension on ServiceUpdateStatus {
  String toValue() {
    switch (this) {
      case ServiceUpdateStatus.available:
        return 'available';
      case ServiceUpdateStatus.cancelled:
        return 'cancelled';
      case ServiceUpdateStatus.expired:
        return 'expired';
    }
  }
}

extension ServiceUpdateStatusFromString on String {
  ServiceUpdateStatus toServiceUpdateStatus() {
    switch (this) {
      case 'available':
        return ServiceUpdateStatus.available;
      case 'cancelled':
        return ServiceUpdateStatus.cancelled;
      case 'expired':
        return ServiceUpdateStatus.expired;
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

class ServiceUpdatesMessage {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String? marker;

  /// A list of service updates
  final List<ServiceUpdate>? serviceUpdates;

  ServiceUpdatesMessage({
    this.marker,
    this.serviceUpdates,
  });
  factory ServiceUpdatesMessage.fromXml(_s.XmlElement elem) {
    return ServiceUpdatesMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      serviceUpdates: _s.extractXmlChild(elem, 'ServiceUpdates')?.let((elem) =>
          elem
              .findElements('ServiceUpdate')
              .map(ServiceUpdate.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final serviceUpdates = this.serviceUpdates;
    return {
      if (marker != null) 'Marker': marker,
      if (serviceUpdates != null) 'ServiceUpdates': serviceUpdates,
    };
  }
}

enum SlaMet {
  yes,
  no,
  na,
}

extension SlaMetValueExtension on SlaMet {
  String toValue() {
    switch (this) {
      case SlaMet.yes:
        return 'yes';
      case SlaMet.no:
        return 'no';
      case SlaMet.na:
        return 'n/a';
    }
  }
}

extension SlaMetFromString on String {
  SlaMet toSlaMet() {
    switch (this) {
      case 'yes':
        return SlaMet.yes;
      case 'no':
        return SlaMet.no;
      case 'n/a':
        return SlaMet.na;
    }
    throw Exception('$this is not known in enum SlaMet');
  }
}

/// Represents the progress of an online resharding operation.
class SlotMigration {
  /// The percentage of the slot migration that is complete.
  final double? progressPercentage;

  SlotMigration({
    this.progressPercentage,
  });
  factory SlotMigration.fromXml(_s.XmlElement elem) {
    return SlotMigration(
      progressPercentage: _s.extractXmlDoubleValue(elem, 'ProgressPercentage'),
    );
  }

  Map<String, dynamic> toJson() {
    final progressPercentage = this.progressPercentage;
    return {
      if (progressPercentage != null) 'ProgressPercentage': progressPercentage,
    };
  }
}

/// Represents a copy of an entire Redis cluster as of the time when the
/// snapshot was taken.
class Snapshot {
  /// The ARN (Amazon Resource Name) of the snapshot.
  final String? arn;

  /// If you are running Redis engine version 6.0 or later, set this parameter to
  /// yes if you want to opt-in to the next auto minor version upgrade campaign.
  /// This parameter is disabled for previous versions.
  final bool? autoMinorVersionUpgrade;

  /// Indicates the status of automatic failover for the source Redis replication
  /// group.
  final AutomaticFailoverStatus? automaticFailover;

  /// The date and time when the source cluster was created.
  final DateTime? cacheClusterCreateTime;

  /// The user-supplied identifier of the source cluster.
  final String? cacheClusterId;

  /// The name of the compute and memory capacity node type for the source
  /// cluster.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power at
  /// lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// <ul>
  /// <li>
  /// General purpose:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>M7g node types</b>: <code>cache.m7g.large</code>,
  /// <code>cache.m7g.xlarge</code>, <code>cache.m7g.2xlarge</code>,
  /// <code>cache.m7g.4xlarge</code>, <code>cache.m7g.8xlarge</code>,
  /// <code>cache.m7g.12xlarge</code>, <code>cache.m7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward):
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  ///
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T4g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and Memcached engine version 1.5.16 onward): <code>cache.t4g.micro</code>,
  /// <code>cache.t4g.small</code>, <code>cache.t4g.medium</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>T1 node types:</b> <code>cache.t1.micro</code>
  ///
  /// <b>M1 node types:</b> <code>cache.m1.small</code>,
  /// <code>cache.m1.medium</code>, <code>cache.m1.large</code>,
  /// <code>cache.m1.xlarge</code>
  ///
  /// <b>M3 node types:</b> <code>cache.m3.medium</code>,
  /// <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>,
  /// <code>cache.m3.2xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Compute optimized:
  ///
  /// <ul>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>C1 node types:</b> <code>cache.c1.xlarge</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Memory optimized:
  ///
  /// <ul>
  /// <li>
  /// Current generation:
  ///
  /// <b>R7g node types</b>: <code>cache.r7g.large</code>,
  /// <code>cache.r7g.xlarge</code>, <code>cache.r7g.2xlarge</code>,
  /// <code>cache.r7g.4xlarge</code>, <code>cache.r7g.8xlarge</code>,
  /// <code>cache.r7g.12xlarge</code>, <code>cache.r7g.16xlarge</code>
  /// <note>
  /// For region availability, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion">Supported
  /// Node Types</a>
  /// </note>
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward):
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  ///
  /// <b>R5 node types:</b> <code>cache.r5.large</code>,
  /// <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>,
  /// <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>,
  /// <code>cache.r5.24xlarge</code>
  ///
  /// <b>R4 node types:</b> <code>cache.r4.large</code>,
  /// <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>,
  /// <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>,
  /// <code>cache.r4.16xlarge</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended. Existing clusters are still supported
  /// but creation of new clusters is not supported for these types.)
  ///
  /// <b>M2 node types:</b> <code>cache.m2.xlarge</code>,
  /// <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code>
  ///
  /// <b>R3 node types:</b> <code>cache.r3.large</code>,
  /// <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>,
  /// <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// <b>Additional node type info</b>
  ///
  /// <ul>
  /// <li>
  /// All current generation instance types are created in Amazon VPC by default.
  /// </li>
  /// <li>
  /// Redis append-only files (AOF) are not supported for T1 or T2 instances.
  /// </li>
  /// <li>
  /// Redis Multi-AZ with automatic failover is not supported on T1 instances.
  /// </li>
  /// <li>
  /// Redis configuration variables <code>appendonly</code> and
  /// <code>appendfsync</code> are not supported on Redis version 2.8.22 and
  /// later.
  /// </li>
  /// </ul>
  final String? cacheNodeType;

  /// The cache parameter group that is associated with the source cluster.
  final String? cacheParameterGroupName;

  /// The name of the cache subnet group associated with the source cluster.
  final String? cacheSubnetGroupName;

  /// Enables data tiering. Data tiering is only supported for replication groups
  /// using the r6gd node type. This parameter must be set to true when using r6gd
  /// nodes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/data-tiering.html">Data
  /// tiering</a>.
  final DataTieringStatus? dataTiering;

  /// The name of the cache engine (<code>memcached</code> or <code>redis</code>)
  /// used by the source cluster.
  final String? engine;

  /// The version of the cache engine version that is used by the source cluster.
  final String? engineVersion;

  /// The ID of the KMS key used to encrypt the snapshot.
  final String? kmsKeyId;

  /// A list of the cache nodes in the source cluster.
  final List<NodeSnapshot>? nodeSnapshots;

  /// The number of cache nodes in the source cluster.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 40.
  final int? numCacheNodes;

  /// The number of node groups (shards) in this snapshot. When restoring from a
  /// snapshot, the number of node groups (shards) in the snapshot and in the
  /// restored replication group must be the same.
  final int? numNodeGroups;

  /// The port number used by each cache nodes in the source cluster.
  final int? port;

  /// The name of the Availability Zone in which the source cluster is located.
  final String? preferredAvailabilityZone;

  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi
  /// (24H Clock UTC). The minimum maintenance window is a 60 minute period.
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
  final String? preferredMaintenanceWindow;

  /// The ARN (Amazon Resource Name) of the preferred outpost.
  final String? preferredOutpostArn;

  /// A description of the source replication group.
  final String? replicationGroupDescription;

  /// The unique identifier of the source replication group.
  final String? replicationGroupId;

  /// The name of a snapshot. For an automatic snapshot, the name is
  /// system-generated. For a manual snapshot, this is the user-provided name.
  final String? snapshotName;

  /// For an automatic snapshot, the number of days for which ElastiCache retains
  /// the snapshot before deleting it.
  ///
  /// For manual snapshots, this field reflects the
  /// <code>SnapshotRetentionLimit</code> for the source cluster when the snapshot
  /// was created. This field is otherwise ignored: Manual snapshots do not
  /// expire, and can only be deleted using the <code>DeleteSnapshot</code>
  /// operation.
  ///
  /// <b>Important</b> If the value of SnapshotRetentionLimit is set to zero (0),
  /// backups are turned off.
  final int? snapshotRetentionLimit;

  /// Indicates whether the snapshot is from an automatic backup
  /// (<code>automated</code>) or was created manually (<code>manual</code>).
  final String? snapshotSource;

  /// The status of the snapshot. Valid values: <code>creating</code> |
  /// <code>available</code> | <code>restoring</code> | <code>copying</code> |
  /// <code>deleting</code>.
  final String? snapshotStatus;

  /// The daily time range during which ElastiCache takes daily snapshots of the
  /// source cluster.
  final String? snapshotWindow;

  /// The Amazon Resource Name (ARN) for the topic used by the source cluster for
  /// publishing notifications.
  final String? topicArn;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet
  /// group for the source cluster.
  final String? vpcId;

  Snapshot({
    this.arn,
    this.autoMinorVersionUpgrade,
    this.automaticFailover,
    this.cacheClusterCreateTime,
    this.cacheClusterId,
    this.cacheNodeType,
    this.cacheParameterGroupName,
    this.cacheSubnetGroupName,
    this.dataTiering,
    this.engine,
    this.engineVersion,
    this.kmsKeyId,
    this.nodeSnapshots,
    this.numCacheNodes,
    this.numNodeGroups,
    this.port,
    this.preferredAvailabilityZone,
    this.preferredMaintenanceWindow,
    this.preferredOutpostArn,
    this.replicationGroupDescription,
    this.replicationGroupId,
    this.snapshotName,
    this.snapshotRetentionLimit,
    this.snapshotSource,
    this.snapshotStatus,
    this.snapshotWindow,
    this.topicArn,
    this.vpcId,
  });
  factory Snapshot.fromXml(_s.XmlElement elem) {
    return Snapshot(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      autoMinorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'AutoMinorVersionUpgrade'),
      automaticFailover: _s
          .extractXmlStringValue(elem, 'AutomaticFailover')
          ?.toAutomaticFailoverStatus(),
      cacheClusterCreateTime:
          _s.extractXmlDateTimeValue(elem, 'CacheClusterCreateTime'),
      cacheClusterId: _s.extractXmlStringValue(elem, 'CacheClusterId'),
      cacheNodeType: _s.extractXmlStringValue(elem, 'CacheNodeType'),
      cacheParameterGroupName:
          _s.extractXmlStringValue(elem, 'CacheParameterGroupName'),
      cacheSubnetGroupName:
          _s.extractXmlStringValue(elem, 'CacheSubnetGroupName'),
      dataTiering:
          _s.extractXmlStringValue(elem, 'DataTiering')?.toDataTieringStatus(),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      nodeSnapshots: _s.extractXmlChild(elem, 'NodeSnapshots')?.let((elem) =>
          elem.findElements('NodeSnapshot').map(NodeSnapshot.fromXml).toList()),
      numCacheNodes: _s.extractXmlIntValue(elem, 'NumCacheNodes'),
      numNodeGroups: _s.extractXmlIntValue(elem, 'NumNodeGroups'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      preferredAvailabilityZone:
          _s.extractXmlStringValue(elem, 'PreferredAvailabilityZone'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      preferredOutpostArn:
          _s.extractXmlStringValue(elem, 'PreferredOutpostArn'),
      replicationGroupDescription:
          _s.extractXmlStringValue(elem, 'ReplicationGroupDescription'),
      replicationGroupId: _s.extractXmlStringValue(elem, 'ReplicationGroupId'),
      snapshotName: _s.extractXmlStringValue(elem, 'SnapshotName'),
      snapshotRetentionLimit:
          _s.extractXmlIntValue(elem, 'SnapshotRetentionLimit'),
      snapshotSource: _s.extractXmlStringValue(elem, 'SnapshotSource'),
      snapshotStatus: _s.extractXmlStringValue(elem, 'SnapshotStatus'),
      snapshotWindow: _s.extractXmlStringValue(elem, 'SnapshotWindow'),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final automaticFailover = this.automaticFailover;
    final cacheClusterCreateTime = this.cacheClusterCreateTime;
    final cacheClusterId = this.cacheClusterId;
    final cacheNodeType = this.cacheNodeType;
    final cacheParameterGroupName = this.cacheParameterGroupName;
    final cacheSubnetGroupName = this.cacheSubnetGroupName;
    final dataTiering = this.dataTiering;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final kmsKeyId = this.kmsKeyId;
    final nodeSnapshots = this.nodeSnapshots;
    final numCacheNodes = this.numCacheNodes;
    final numNodeGroups = this.numNodeGroups;
    final port = this.port;
    final preferredAvailabilityZone = this.preferredAvailabilityZone;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final preferredOutpostArn = this.preferredOutpostArn;
    final replicationGroupDescription = this.replicationGroupDescription;
    final replicationGroupId = this.replicationGroupId;
    final snapshotName = this.snapshotName;
    final snapshotRetentionLimit = this.snapshotRetentionLimit;
    final snapshotSource = this.snapshotSource;
    final snapshotStatus = this.snapshotStatus;
    final snapshotWindow = this.snapshotWindow;
    final topicArn = this.topicArn;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'ARN': arn,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (automaticFailover != null)
        'AutomaticFailover': automaticFailover.toValue(),
      if (cacheClusterCreateTime != null)
        'CacheClusterCreateTime': iso8601ToJson(cacheClusterCreateTime),
      if (cacheClusterId != null) 'CacheClusterId': cacheClusterId,
      if (cacheNodeType != null) 'CacheNodeType': cacheNodeType,
      if (cacheParameterGroupName != null)
        'CacheParameterGroupName': cacheParameterGroupName,
      if (cacheSubnetGroupName != null)
        'CacheSubnetGroupName': cacheSubnetGroupName,
      if (dataTiering != null) 'DataTiering': dataTiering.toValue(),
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (nodeSnapshots != null) 'NodeSnapshots': nodeSnapshots,
      if (numCacheNodes != null) 'NumCacheNodes': numCacheNodes,
      if (numNodeGroups != null) 'NumNodeGroups': numNodeGroups,
      if (port != null) 'Port': port,
      if (preferredAvailabilityZone != null)
        'PreferredAvailabilityZone': preferredAvailabilityZone,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (preferredOutpostArn != null)
        'PreferredOutpostArn': preferredOutpostArn,
      if (replicationGroupDescription != null)
        'ReplicationGroupDescription': replicationGroupDescription,
      if (replicationGroupId != null) 'ReplicationGroupId': replicationGroupId,
      if (snapshotName != null) 'SnapshotName': snapshotName,
      if (snapshotRetentionLimit != null)
        'SnapshotRetentionLimit': snapshotRetentionLimit,
      if (snapshotSource != null) 'SnapshotSource': snapshotSource,
      if (snapshotStatus != null) 'SnapshotStatus': snapshotStatus,
      if (snapshotWindow != null) 'SnapshotWindow': snapshotWindow,
      if (topicArn != null) 'TopicArn': topicArn,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

enum SourceType {
  cacheCluster,
  cacheParameterGroup,
  cacheSecurityGroup,
  cacheSubnetGroup,
  replicationGroup,
  serverlessCache,
  serverlessCacheSnapshot,
  user,
  userGroup,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.cacheCluster:
        return 'cache-cluster';
      case SourceType.cacheParameterGroup:
        return 'cache-parameter-group';
      case SourceType.cacheSecurityGroup:
        return 'cache-security-group';
      case SourceType.cacheSubnetGroup:
        return 'cache-subnet-group';
      case SourceType.replicationGroup:
        return 'replication-group';
      case SourceType.serverlessCache:
        return 'serverless-cache';
      case SourceType.serverlessCacheSnapshot:
        return 'serverless-cache-snapshot';
      case SourceType.user:
        return 'user';
      case SourceType.userGroup:
        return 'user-group';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'cache-cluster':
        return SourceType.cacheCluster;
      case 'cache-parameter-group':
        return SourceType.cacheParameterGroup;
      case 'cache-security-group':
        return SourceType.cacheSecurityGroup;
      case 'cache-subnet-group':
        return SourceType.cacheSubnetGroup;
      case 'replication-group':
        return SourceType.replicationGroup;
      case 'serverless-cache':
        return SourceType.serverlessCache;
      case 'serverless-cache-snapshot':
        return SourceType.serverlessCacheSnapshot;
      case 'user':
        return SourceType.user;
      case 'user-group':
        return SourceType.userGroup;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

class StartMigrationResponse {
  final ReplicationGroup? replicationGroup;

  StartMigrationResponse({
    this.replicationGroup,
  });
  factory StartMigrationResponse.fromXml(_s.XmlElement elem) {
    return StartMigrationResponse(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

/// Represents the subnet associated with a cluster. This parameter refers to
/// subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used with
/// ElastiCache.
class Subnet {
  /// The Availability Zone associated with the subnet.
  final AvailabilityZone? subnetAvailabilityZone;

  /// The unique identifier for the subnet.
  final String? subnetIdentifier;

  /// The outpost ARN of the subnet.
  final SubnetOutpost? subnetOutpost;

  /// Either <code>ipv4</code> | <code>ipv6</code> | <code>dual_stack</code>. IPv6
  /// is supported for workloads using Redis engine version 6.2 onward or
  /// Memcached engine version 1.6.6 on all instances built on the <a
  /// href="http://aws.amazon.com/ec2/nitro/">Nitro system</a>.
  final List<NetworkType>? supportedNetworkTypes;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetOutpost,
    this.supportedNetworkTypes,
  });
  factory Subnet.fromXml(_s.XmlElement elem) {
    return Subnet(
      subnetAvailabilityZone: _s
          .extractXmlChild(elem, 'SubnetAvailabilityZone')
          ?.let(AvailabilityZone.fromXml),
      subnetIdentifier: _s.extractXmlStringValue(elem, 'SubnetIdentifier'),
      subnetOutpost:
          _s.extractXmlChild(elem, 'SubnetOutpost')?.let(SubnetOutpost.fromXml),
      supportedNetworkTypes: _s
          .extractXmlChild(elem, 'SupportedNetworkTypes')
          ?.let((elem) => _s
              .extractXmlStringListValues(elem, 'member')
              .map((s) => s.toNetworkType())
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetIdentifier = this.subnetIdentifier;
    final subnetOutpost = this.subnetOutpost;
    final supportedNetworkTypes = this.supportedNetworkTypes;
    return {
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetIdentifier != null) 'SubnetIdentifier': subnetIdentifier,
      if (subnetOutpost != null) 'SubnetOutpost': subnetOutpost,
      if (supportedNetworkTypes != null)
        'SupportedNetworkTypes':
            supportedNetworkTypes.map((e) => e.toValue()).toList(),
    };
  }
}

/// The ID of the outpost subnet.
class SubnetOutpost {
  /// The outpost ARN of the subnet.
  final String? subnetOutpostArn;

  SubnetOutpost({
    this.subnetOutpostArn,
  });
  factory SubnetOutpost.fromXml(_s.XmlElement elem) {
    return SubnetOutpost(
      subnetOutpostArn: _s.extractXmlStringValue(elem, 'SubnetOutpostArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetOutpostArn = this.subnetOutpostArn;
    return {
      if (subnetOutpostArn != null) 'SubnetOutpostArn': subnetOutpostArn,
    };
  }
}

/// A tag that can be added to an ElastiCache cluster or replication group. Tags
/// are composed of a Key/Value pair. You can use tags to categorize and track
/// all your ElastiCache resources, with the exception of global replication
/// group. When you add or remove tags on replication groups, those actions will
/// be replicated to all nodes in the replication group. A tag with a null Value
/// is permitted.
class Tag {
  /// The key for the tag. May not be null.
  final String? key;

  /// The tag's value. May be null.
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

/// Represents the output from the <code>AddTagsToResource</code>,
/// <code>ListTagsForResource</code>, and <code>RemoveTagsFromResource</code>
/// operations.
class TagListMessage {
  /// A list of tags as key-value pairs.
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

class TestFailoverResult {
  final ReplicationGroup? replicationGroup;

  TestFailoverResult({
    this.replicationGroup,
  });
  factory TestFailoverResult.fromXml(_s.XmlElement elem) {
    return TestFailoverResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

class TestMigrationResponse {
  final ReplicationGroup? replicationGroup;

  TestMigrationResponse({
    this.replicationGroup,
  });
  factory TestMigrationResponse.fromXml(_s.XmlElement elem) {
    return TestMigrationResponse(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let(ReplicationGroup.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationGroup = this.replicationGroup;
    return {
      if (replicationGroup != null) 'ReplicationGroup': replicationGroup,
    };
  }
}

/// Filters update actions from the service updates that are in available status
/// during the time range.
class TimeRangeFilter {
  /// The end time of the time range filter
  final DateTime? endTime;

  /// The start time of the time range filter
  final DateTime? startTime;

  TimeRangeFilter({
    this.endTime,
    this.startTime,
  });

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': iso8601ToJson(endTime),
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
    };
  }
}

enum TransitEncryptionMode {
  preferred,
  required,
}

extension TransitEncryptionModeValueExtension on TransitEncryptionMode {
  String toValue() {
    switch (this) {
      case TransitEncryptionMode.preferred:
        return 'preferred';
      case TransitEncryptionMode.required:
        return 'required';
    }
  }
}

extension TransitEncryptionModeFromString on String {
  TransitEncryptionMode toTransitEncryptionMode() {
    switch (this) {
      case 'preferred':
        return TransitEncryptionMode.preferred;
      case 'required':
        return TransitEncryptionMode.required;
    }
    throw Exception('$this is not known in enum TransitEncryptionMode');
  }
}

/// Update action that has failed to be processed for the corresponding
/// apply/stop request
class UnprocessedUpdateAction {
  /// The ID of the cache cluster
  final String? cacheClusterId;

  /// The error message that describes the reason the request was not processed
  final String? errorMessage;

  /// The error type for requests that are not processed
  final String? errorType;

  /// The replication group ID
  final String? replicationGroupId;

  /// The unique ID of the service update
  final String? serviceUpdateName;

  UnprocessedUpdateAction({
    this.cacheClusterId,
    this.errorMessage,
    this.errorType,
    this.replicationGroupId,
    this.serviceUpdateName,
  });
  factory UnprocessedUpdateAction.fromXml(_s.XmlElement elem) {
    return UnprocessedUpdateAction(
      cacheClusterId: _s.extractXmlStringValue(elem, 'CacheClusterId'),
      errorMessage: _s.extractXmlStringValue(elem, 'ErrorMessage'),
      errorType: _s.extractXmlStringValue(elem, 'ErrorType'),
      replicationGroupId: _s.extractXmlStringValue(elem, 'ReplicationGroupId'),
      serviceUpdateName: _s.extractXmlStringValue(elem, 'ServiceUpdateName'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheClusterId = this.cacheClusterId;
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    final replicationGroupId = this.replicationGroupId;
    final serviceUpdateName = this.serviceUpdateName;
    return {
      if (cacheClusterId != null) 'CacheClusterId': cacheClusterId,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (errorType != null) 'ErrorType': errorType,
      if (replicationGroupId != null) 'ReplicationGroupId': replicationGroupId,
      if (serviceUpdateName != null) 'ServiceUpdateName': serviceUpdateName,
    };
  }
}

/// The status of the service update for a specific replication group
class UpdateAction {
  /// The ID of the cache cluster
  final String? cacheClusterId;

  /// The status of the service update on the cache node
  final List<CacheNodeUpdateStatus>? cacheNodeUpdateStatus;

  /// The Elasticache engine to which the update applies. Either Redis or
  /// Memcached
  final String? engine;

  /// The estimated length of time for the update to complete
  final String? estimatedUpdateTime;

  /// The status of the service update on the node group
  final List<NodeGroupUpdateStatus>? nodeGroupUpdateStatus;

  /// The progress of the service update on the replication group
  final String? nodesUpdated;

  /// The ID of the replication group
  final String? replicationGroupId;

  /// The unique ID of the service update
  final String? serviceUpdateName;

  /// The recommended date to apply the service update to ensure compliance. For
  /// information on compliance, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service">Self-Service
  /// Security Updates for Compliance</a>.
  final DateTime? serviceUpdateRecommendedApplyByDate;

  /// The date the update is first available
  final DateTime? serviceUpdateReleaseDate;

  /// The severity of the service update
  final ServiceUpdateSeverity? serviceUpdateSeverity;

  /// The status of the service update
  final ServiceUpdateStatus? serviceUpdateStatus;

  /// Reflects the nature of the service update
  final ServiceUpdateType? serviceUpdateType;

  /// If yes, all nodes in the replication group have been updated by the
  /// recommended apply-by date. If no, at least one node in the replication group
  /// have not been updated by the recommended apply-by date. If N/A, the
  /// replication group was created after the recommended apply-by date.
  final SlaMet? slaMet;

  /// The date that the service update is available to a replication group
  final DateTime? updateActionAvailableDate;

  /// The status of the update action
  final UpdateActionStatus? updateActionStatus;

  /// The date when the UpdateActionStatus was last modified
  final DateTime? updateActionStatusModifiedDate;

  UpdateAction({
    this.cacheClusterId,
    this.cacheNodeUpdateStatus,
    this.engine,
    this.estimatedUpdateTime,
    this.nodeGroupUpdateStatus,
    this.nodesUpdated,
    this.replicationGroupId,
    this.serviceUpdateName,
    this.serviceUpdateRecommendedApplyByDate,
    this.serviceUpdateReleaseDate,
    this.serviceUpdateSeverity,
    this.serviceUpdateStatus,
    this.serviceUpdateType,
    this.slaMet,
    this.updateActionAvailableDate,
    this.updateActionStatus,
    this.updateActionStatusModifiedDate,
  });
  factory UpdateAction.fromXml(_s.XmlElement elem) {
    return UpdateAction(
      cacheClusterId: _s.extractXmlStringValue(elem, 'CacheClusterId'),
      cacheNodeUpdateStatus: _s
          .extractXmlChild(elem, 'CacheNodeUpdateStatus')
          ?.let((elem) => elem
              .findElements('CacheNodeUpdateStatus')
              .map(CacheNodeUpdateStatus.fromXml)
              .toList()),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      estimatedUpdateTime:
          _s.extractXmlStringValue(elem, 'EstimatedUpdateTime'),
      nodeGroupUpdateStatus: _s
          .extractXmlChild(elem, 'NodeGroupUpdateStatus')
          ?.let((elem) => elem
              .findElements('NodeGroupUpdateStatus')
              .map(NodeGroupUpdateStatus.fromXml)
              .toList()),
      nodesUpdated: _s.extractXmlStringValue(elem, 'NodesUpdated'),
      replicationGroupId: _s.extractXmlStringValue(elem, 'ReplicationGroupId'),
      serviceUpdateName: _s.extractXmlStringValue(elem, 'ServiceUpdateName'),
      serviceUpdateRecommendedApplyByDate: _s.extractXmlDateTimeValue(
          elem, 'ServiceUpdateRecommendedApplyByDate'),
      serviceUpdateReleaseDate:
          _s.extractXmlDateTimeValue(elem, 'ServiceUpdateReleaseDate'),
      serviceUpdateSeverity: _s
          .extractXmlStringValue(elem, 'ServiceUpdateSeverity')
          ?.toServiceUpdateSeverity(),
      serviceUpdateStatus: _s
          .extractXmlStringValue(elem, 'ServiceUpdateStatus')
          ?.toServiceUpdateStatus(),
      serviceUpdateType: _s
          .extractXmlStringValue(elem, 'ServiceUpdateType')
          ?.toServiceUpdateType(),
      slaMet: _s.extractXmlStringValue(elem, 'SlaMet')?.toSlaMet(),
      updateActionAvailableDate:
          _s.extractXmlDateTimeValue(elem, 'UpdateActionAvailableDate'),
      updateActionStatus: _s
          .extractXmlStringValue(elem, 'UpdateActionStatus')
          ?.toUpdateActionStatus(),
      updateActionStatusModifiedDate:
          _s.extractXmlDateTimeValue(elem, 'UpdateActionStatusModifiedDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheClusterId = this.cacheClusterId;
    final cacheNodeUpdateStatus = this.cacheNodeUpdateStatus;
    final engine = this.engine;
    final estimatedUpdateTime = this.estimatedUpdateTime;
    final nodeGroupUpdateStatus = this.nodeGroupUpdateStatus;
    final nodesUpdated = this.nodesUpdated;
    final replicationGroupId = this.replicationGroupId;
    final serviceUpdateName = this.serviceUpdateName;
    final serviceUpdateRecommendedApplyByDate =
        this.serviceUpdateRecommendedApplyByDate;
    final serviceUpdateReleaseDate = this.serviceUpdateReleaseDate;
    final serviceUpdateSeverity = this.serviceUpdateSeverity;
    final serviceUpdateStatus = this.serviceUpdateStatus;
    final serviceUpdateType = this.serviceUpdateType;
    final slaMet = this.slaMet;
    final updateActionAvailableDate = this.updateActionAvailableDate;
    final updateActionStatus = this.updateActionStatus;
    final updateActionStatusModifiedDate = this.updateActionStatusModifiedDate;
    return {
      if (cacheClusterId != null) 'CacheClusterId': cacheClusterId,
      if (cacheNodeUpdateStatus != null)
        'CacheNodeUpdateStatus': cacheNodeUpdateStatus,
      if (engine != null) 'Engine': engine,
      if (estimatedUpdateTime != null)
        'EstimatedUpdateTime': estimatedUpdateTime,
      if (nodeGroupUpdateStatus != null)
        'NodeGroupUpdateStatus': nodeGroupUpdateStatus,
      if (nodesUpdated != null) 'NodesUpdated': nodesUpdated,
      if (replicationGroupId != null) 'ReplicationGroupId': replicationGroupId,
      if (serviceUpdateName != null) 'ServiceUpdateName': serviceUpdateName,
      if (serviceUpdateRecommendedApplyByDate != null)
        'ServiceUpdateRecommendedApplyByDate':
            iso8601ToJson(serviceUpdateRecommendedApplyByDate),
      if (serviceUpdateReleaseDate != null)
        'ServiceUpdateReleaseDate': iso8601ToJson(serviceUpdateReleaseDate),
      if (serviceUpdateSeverity != null)
        'ServiceUpdateSeverity': serviceUpdateSeverity.toValue(),
      if (serviceUpdateStatus != null)
        'ServiceUpdateStatus': serviceUpdateStatus.toValue(),
      if (serviceUpdateType != null)
        'ServiceUpdateType': serviceUpdateType.toValue(),
      if (slaMet != null) 'SlaMet': slaMet.toValue(),
      if (updateActionAvailableDate != null)
        'UpdateActionAvailableDate': iso8601ToJson(updateActionAvailableDate),
      if (updateActionStatus != null)
        'UpdateActionStatus': updateActionStatus.toValue(),
      if (updateActionStatusModifiedDate != null)
        'UpdateActionStatusModifiedDate':
            iso8601ToJson(updateActionStatusModifiedDate),
    };
  }
}

class UpdateActionResultsMessage {
  /// Update actions that have been processed successfully
  final List<ProcessedUpdateAction>? processedUpdateActions;

  /// Update actions that haven't been processed successfully
  final List<UnprocessedUpdateAction>? unprocessedUpdateActions;

  UpdateActionResultsMessage({
    this.processedUpdateActions,
    this.unprocessedUpdateActions,
  });
  factory UpdateActionResultsMessage.fromXml(_s.XmlElement elem) {
    return UpdateActionResultsMessage(
      processedUpdateActions: _s
          .extractXmlChild(elem, 'ProcessedUpdateActions')
          ?.let((elem) => elem
              .findElements('ProcessedUpdateAction')
              .map(ProcessedUpdateAction.fromXml)
              .toList()),
      unprocessedUpdateActions: _s
          .extractXmlChild(elem, 'UnprocessedUpdateActions')
          ?.let((elem) => elem
              .findElements('UnprocessedUpdateAction')
              .map(UnprocessedUpdateAction.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final processedUpdateActions = this.processedUpdateActions;
    final unprocessedUpdateActions = this.unprocessedUpdateActions;
    return {
      if (processedUpdateActions != null)
        'ProcessedUpdateActions': processedUpdateActions,
      if (unprocessedUpdateActions != null)
        'UnprocessedUpdateActions': unprocessedUpdateActions,
    };
  }
}

enum UpdateActionStatus {
  notApplied,
  waitingToStart,
  inProgress,
  stopping,
  stopped,
  complete,
  scheduling,
  scheduled,
  notApplicable,
}

extension UpdateActionStatusValueExtension on UpdateActionStatus {
  String toValue() {
    switch (this) {
      case UpdateActionStatus.notApplied:
        return 'not-applied';
      case UpdateActionStatus.waitingToStart:
        return 'waiting-to-start';
      case UpdateActionStatus.inProgress:
        return 'in-progress';
      case UpdateActionStatus.stopping:
        return 'stopping';
      case UpdateActionStatus.stopped:
        return 'stopped';
      case UpdateActionStatus.complete:
        return 'complete';
      case UpdateActionStatus.scheduling:
        return 'scheduling';
      case UpdateActionStatus.scheduled:
        return 'scheduled';
      case UpdateActionStatus.notApplicable:
        return 'not-applicable';
    }
  }
}

extension UpdateActionStatusFromString on String {
  UpdateActionStatus toUpdateActionStatus() {
    switch (this) {
      case 'not-applied':
        return UpdateActionStatus.notApplied;
      case 'waiting-to-start':
        return UpdateActionStatus.waitingToStart;
      case 'in-progress':
        return UpdateActionStatus.inProgress;
      case 'stopping':
        return UpdateActionStatus.stopping;
      case 'stopped':
        return UpdateActionStatus.stopped;
      case 'complete':
        return UpdateActionStatus.complete;
      case 'scheduling':
        return UpdateActionStatus.scheduling;
      case 'scheduled':
        return UpdateActionStatus.scheduled;
      case 'not-applicable':
        return UpdateActionStatus.notApplicable;
    }
    throw Exception('$this is not known in enum UpdateActionStatus');
  }
}

class UpdateActionsMessage {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String? marker;

  /// Returns a list of update actions
  final List<UpdateAction>? updateActions;

  UpdateActionsMessage({
    this.marker,
    this.updateActions,
  });
  factory UpdateActionsMessage.fromXml(_s.XmlElement elem) {
    return UpdateActionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      updateActions: _s.extractXmlChild(elem, 'UpdateActions')?.let((elem) =>
          elem.findElements('UpdateAction').map(UpdateAction.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final updateActions = this.updateActions;
    return {
      if (marker != null) 'Marker': marker,
      if (updateActions != null) 'UpdateActions': updateActions,
    };
  }
}

class User {
  /// The Amazon Resource Name (ARN) of the user.
  final String? arn;

  /// Access permissions string used for this user.
  final String? accessString;

  /// Denotes whether the user requires a password to authenticate.
  final Authentication? authentication;

  /// The current supported value is Redis.
  final String? engine;

  /// The minimum engine version required, which is Redis 6.0
  final String? minimumEngineVersion;

  /// Indicates the user status. Can be "active", "modifying" or "deleting".
  final String? status;

  /// Returns a list of the user group IDs the user belongs to.
  final List<String>? userGroupIds;

  /// The ID of the user.
  final String? userId;

  /// The username of the user.
  final String? userName;

  User({
    this.arn,
    this.accessString,
    this.authentication,
    this.engine,
    this.minimumEngineVersion,
    this.status,
    this.userGroupIds,
    this.userId,
    this.userName,
  });
  factory User.fromXml(_s.XmlElement elem) {
    return User(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      accessString: _s.extractXmlStringValue(elem, 'AccessString'),
      authentication: _s
          .extractXmlChild(elem, 'Authentication')
          ?.let(Authentication.fromXml),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      minimumEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumEngineVersion'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      userGroupIds: _s
          .extractXmlChild(elem, 'UserGroupIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      userId: _s.extractXmlStringValue(elem, 'UserId'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final accessString = this.accessString;
    final authentication = this.authentication;
    final engine = this.engine;
    final minimumEngineVersion = this.minimumEngineVersion;
    final status = this.status;
    final userGroupIds = this.userGroupIds;
    final userId = this.userId;
    final userName = this.userName;
    return {
      if (arn != null) 'ARN': arn,
      if (accessString != null) 'AccessString': accessString,
      if (authentication != null) 'Authentication': authentication,
      if (engine != null) 'Engine': engine,
      if (minimumEngineVersion != null)
        'MinimumEngineVersion': minimumEngineVersion,
      if (status != null) 'Status': status,
      if (userGroupIds != null) 'UserGroupIds': userGroupIds,
      if (userId != null) 'UserId': userId,
      if (userName != null) 'UserName': userName,
    };
  }
}

class UserGroup {
  /// The Amazon Resource Name (ARN) of the user group.
  final String? arn;

  /// The current supported value is Redis.
  final String? engine;

  /// The minimum engine version required, which is Redis 6.0
  final String? minimumEngineVersion;

  /// A list of updates being applied to the user group.
  final UserGroupPendingChanges? pendingChanges;

  /// A list of replication groups that the user group can access.
  final List<String>? replicationGroups;

  /// Indicates which serverless caches the specified user group is associated
  /// with. Available for Redis only.
  final List<String>? serverlessCaches;

  /// Indicates user group status. Can be "creating", "active", "modifying",
  /// "deleting".
  final String? status;

  /// The ID of the user group.
  final String? userGroupId;

  /// The list of user IDs that belong to the user group.
  final List<String>? userIds;

  UserGroup({
    this.arn,
    this.engine,
    this.minimumEngineVersion,
    this.pendingChanges,
    this.replicationGroups,
    this.serverlessCaches,
    this.status,
    this.userGroupId,
    this.userIds,
  });
  factory UserGroup.fromXml(_s.XmlElement elem) {
    return UserGroup(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      minimumEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumEngineVersion'),
      pendingChanges: _s
          .extractXmlChild(elem, 'PendingChanges')
          ?.let(UserGroupPendingChanges.fromXml),
      replicationGroups: _s
          .extractXmlChild(elem, 'ReplicationGroups')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      serverlessCaches: _s
          .extractXmlChild(elem, 'ServerlessCaches')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      status: _s.extractXmlStringValue(elem, 'Status'),
      userGroupId: _s.extractXmlStringValue(elem, 'UserGroupId'),
      userIds: _s
          .extractXmlChild(elem, 'UserIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final engine = this.engine;
    final minimumEngineVersion = this.minimumEngineVersion;
    final pendingChanges = this.pendingChanges;
    final replicationGroups = this.replicationGroups;
    final serverlessCaches = this.serverlessCaches;
    final status = this.status;
    final userGroupId = this.userGroupId;
    final userIds = this.userIds;
    return {
      if (arn != null) 'ARN': arn,
      if (engine != null) 'Engine': engine,
      if (minimumEngineVersion != null)
        'MinimumEngineVersion': minimumEngineVersion,
      if (pendingChanges != null) 'PendingChanges': pendingChanges,
      if (replicationGroups != null) 'ReplicationGroups': replicationGroups,
      if (serverlessCaches != null) 'ServerlessCaches': serverlessCaches,
      if (status != null) 'Status': status,
      if (userGroupId != null) 'UserGroupId': userGroupId,
      if (userIds != null) 'UserIds': userIds,
    };
  }
}

/// Returns the updates being applied to the user group.
class UserGroupPendingChanges {
  /// The list of user IDs to add.
  final List<String>? userIdsToAdd;

  /// The list of user IDs to remove.
  final List<String>? userIdsToRemove;

  UserGroupPendingChanges({
    this.userIdsToAdd,
    this.userIdsToRemove,
  });
  factory UserGroupPendingChanges.fromXml(_s.XmlElement elem) {
    return UserGroupPendingChanges(
      userIdsToAdd: _s
          .extractXmlChild(elem, 'UserIdsToAdd')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      userIdsToRemove: _s
          .extractXmlChild(elem, 'UserIdsToRemove')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final userIdsToAdd = this.userIdsToAdd;
    final userIdsToRemove = this.userIdsToRemove;
    return {
      if (userIdsToAdd != null) 'UserIdsToAdd': userIdsToAdd,
      if (userIdsToRemove != null) 'UserIdsToRemove': userIdsToRemove,
    };
  }
}

/// The status of the user group update.
class UserGroupsUpdateStatus {
  /// The ID of the user group to add.
  final List<String>? userGroupIdsToAdd;

  /// The ID of the user group to remove.
  final List<String>? userGroupIdsToRemove;

  UserGroupsUpdateStatus({
    this.userGroupIdsToAdd,
    this.userGroupIdsToRemove,
  });
  factory UserGroupsUpdateStatus.fromXml(_s.XmlElement elem) {
    return UserGroupsUpdateStatus(
      userGroupIdsToAdd: _s
          .extractXmlChild(elem, 'UserGroupIdsToAdd')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      userGroupIdsToRemove: _s
          .extractXmlChild(elem, 'UserGroupIdsToRemove')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final userGroupIdsToAdd = this.userGroupIdsToAdd;
    final userGroupIdsToRemove = this.userGroupIdsToRemove;
    return {
      if (userGroupIdsToAdd != null) 'UserGroupIdsToAdd': userGroupIdsToAdd,
      if (userGroupIdsToRemove != null)
        'UserGroupIdsToRemove': userGroupIdsToRemove,
    };
  }
}

class APICallRateForCustomerExceededFault extends _s.GenericAwsException {
  APICallRateForCustomerExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'APICallRateForCustomerExceededFault',
            message: message);
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

class CacheClusterAlreadyExistsFault extends _s.GenericAwsException {
  CacheClusterAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheClusterAlreadyExistsFault',
            message: message);
}

class CacheClusterNotFoundFault extends _s.GenericAwsException {
  CacheClusterNotFoundFault({String? type, String? message})
      : super(type: type, code: 'CacheClusterNotFoundFault', message: message);
}

class CacheParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  CacheParameterGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheParameterGroupAlreadyExistsFault',
            message: message);
}

class CacheParameterGroupNotFoundFault extends _s.GenericAwsException {
  CacheParameterGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheParameterGroupNotFoundFault',
            message: message);
}

class CacheParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  CacheParameterGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheParameterGroupQuotaExceededFault',
            message: message);
}

class CacheSecurityGroupAlreadyExistsFault extends _s.GenericAwsException {
  CacheSecurityGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheSecurityGroupAlreadyExistsFault',
            message: message);
}

class CacheSecurityGroupNotFoundFault extends _s.GenericAwsException {
  CacheSecurityGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheSecurityGroupNotFoundFault',
            message: message);
}

class CacheSecurityGroupQuotaExceededFault extends _s.GenericAwsException {
  CacheSecurityGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheSecurityGroupQuotaExceededFault',
            message: message);
}

class CacheSubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  CacheSubnetGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheSubnetGroupAlreadyExistsFault',
            message: message);
}

class CacheSubnetGroupInUse extends _s.GenericAwsException {
  CacheSubnetGroupInUse({String? type, String? message})
      : super(type: type, code: 'CacheSubnetGroupInUse', message: message);
}

class CacheSubnetGroupNotFoundFault extends _s.GenericAwsException {
  CacheSubnetGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheSubnetGroupNotFoundFault',
            message: message);
}

class CacheSubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  CacheSubnetGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheSubnetGroupQuotaExceededFault',
            message: message);
}

class CacheSubnetQuotaExceededFault extends _s.GenericAwsException {
  CacheSubnetQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'CacheSubnetQuotaExceededFault',
            message: message);
}

class ClusterQuotaForCustomerExceededFault extends _s.GenericAwsException {
  ClusterQuotaForCustomerExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterQuotaForCustomerExceededFault',
            message: message);
}

class DefaultUserAssociatedToUserGroupFault extends _s.GenericAwsException {
  DefaultUserAssociatedToUserGroupFault({String? type, String? message})
      : super(
            type: type,
            code: 'DefaultUserAssociatedToUserGroupFault',
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

class GlobalReplicationGroupAlreadyExistsFault extends _s.GenericAwsException {
  GlobalReplicationGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'GlobalReplicationGroupAlreadyExistsFault',
            message: message);
}

class GlobalReplicationGroupNotFoundFault extends _s.GenericAwsException {
  GlobalReplicationGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'GlobalReplicationGroupNotFoundFault',
            message: message);
}

class InsufficientCacheClusterCapacityFault extends _s.GenericAwsException {
  InsufficientCacheClusterCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientCacheClusterCapacityFault',
            message: message);
}

class InvalidARNFault extends _s.GenericAwsException {
  InvalidARNFault({String? type, String? message})
      : super(type: type, code: 'InvalidARNFault', message: message);
}

class InvalidCacheClusterStateFault extends _s.GenericAwsException {
  InvalidCacheClusterStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCacheClusterStateFault',
            message: message);
}

class InvalidCacheParameterGroupStateFault extends _s.GenericAwsException {
  InvalidCacheParameterGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCacheParameterGroupStateFault',
            message: message);
}

class InvalidCacheSecurityGroupStateFault extends _s.GenericAwsException {
  InvalidCacheSecurityGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCacheSecurityGroupStateFault',
            message: message);
}

class InvalidCredentialsException extends _s.GenericAwsException {
  InvalidCredentialsException({String? type, String? message})
      : super(
            type: type, code: 'InvalidCredentialsException', message: message);
}

class InvalidGlobalReplicationGroupStateFault extends _s.GenericAwsException {
  InvalidGlobalReplicationGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidGlobalReplicationGroupStateFault',
            message: message);
}

class InvalidKMSKeyFault extends _s.GenericAwsException {
  InvalidKMSKeyFault({String? type, String? message})
      : super(type: type, code: 'InvalidKMSKeyFault', message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidReplicationGroupStateFault extends _s.GenericAwsException {
  InvalidReplicationGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidReplicationGroupStateFault',
            message: message);
}

class InvalidServerlessCacheSnapshotStateFault extends _s.GenericAwsException {
  InvalidServerlessCacheSnapshotStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidServerlessCacheSnapshotStateFault',
            message: message);
}

class InvalidServerlessCacheStateFault extends _s.GenericAwsException {
  InvalidServerlessCacheStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidServerlessCacheStateFault',
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

class InvalidUserGroupStateFault extends _s.GenericAwsException {
  InvalidUserGroupStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidUserGroupStateFault', message: message);
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

class NodeGroupNotFoundFault extends _s.GenericAwsException {
  NodeGroupNotFoundFault({String? type, String? message})
      : super(type: type, code: 'NodeGroupNotFoundFault', message: message);
}

class NodeGroupsPerReplicationGroupQuotaExceededFault
    extends _s.GenericAwsException {
  NodeGroupsPerReplicationGroupQuotaExceededFault(
      {String? type, String? message})
      : super(
            type: type,
            code: 'NodeGroupsPerReplicationGroupQuotaExceededFault',
            message: message);
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

class ReplicationGroupAlreadyExistsFault extends _s.GenericAwsException {
  ReplicationGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReplicationGroupAlreadyExistsFault',
            message: message);
}

class ReplicationGroupAlreadyUnderMigrationFault
    extends _s.GenericAwsException {
  ReplicationGroupAlreadyUnderMigrationFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReplicationGroupAlreadyUnderMigrationFault',
            message: message);
}

class ReplicationGroupNotFoundFault extends _s.GenericAwsException {
  ReplicationGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReplicationGroupNotFoundFault',
            message: message);
}

class ReplicationGroupNotUnderMigrationFault extends _s.GenericAwsException {
  ReplicationGroupNotUnderMigrationFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReplicationGroupNotUnderMigrationFault',
            message: message);
}

class ReservedCacheNodeAlreadyExistsFault extends _s.GenericAwsException {
  ReservedCacheNodeAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedCacheNodeAlreadyExistsFault',
            message: message);
}

class ReservedCacheNodeNotFoundFault extends _s.GenericAwsException {
  ReservedCacheNodeNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedCacheNodeNotFoundFault',
            message: message);
}

class ReservedCacheNodeQuotaExceededFault extends _s.GenericAwsException {
  ReservedCacheNodeQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedCacheNodeQuotaExceededFault',
            message: message);
}

class ReservedCacheNodesOfferingNotFoundFault extends _s.GenericAwsException {
  ReservedCacheNodesOfferingNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedCacheNodesOfferingNotFoundFault',
            message: message);
}

class ServerlessCacheAlreadyExistsFault extends _s.GenericAwsException {
  ServerlessCacheAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ServerlessCacheAlreadyExistsFault',
            message: message);
}

class ServerlessCacheNotFoundFault extends _s.GenericAwsException {
  ServerlessCacheNotFoundFault({String? type, String? message})
      : super(
            type: type, code: 'ServerlessCacheNotFoundFault', message: message);
}

class ServerlessCacheQuotaForCustomerExceededFault
    extends _s.GenericAwsException {
  ServerlessCacheQuotaForCustomerExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ServerlessCacheQuotaForCustomerExceededFault',
            message: message);
}

class ServerlessCacheSnapshotAlreadyExistsFault extends _s.GenericAwsException {
  ServerlessCacheSnapshotAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ServerlessCacheSnapshotAlreadyExistsFault',
            message: message);
}

class ServerlessCacheSnapshotNotFoundFault extends _s.GenericAwsException {
  ServerlessCacheSnapshotNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ServerlessCacheSnapshotNotFoundFault',
            message: message);
}

class ServerlessCacheSnapshotQuotaExceededFault extends _s.GenericAwsException {
  ServerlessCacheSnapshotQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ServerlessCacheSnapshotQuotaExceededFault',
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

class SnapshotAlreadyExistsFault extends _s.GenericAwsException {
  SnapshotAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'SnapshotAlreadyExistsFault', message: message);
}

class SnapshotFeatureNotSupportedFault extends _s.GenericAwsException {
  SnapshotFeatureNotSupportedFault({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotFeatureNotSupportedFault',
            message: message);
}

class SnapshotNotFoundFault extends _s.GenericAwsException {
  SnapshotNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SnapshotNotFoundFault', message: message);
}

class SnapshotQuotaExceededFault extends _s.GenericAwsException {
  SnapshotQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'SnapshotQuotaExceededFault', message: message);
}

class SubnetInUse extends _s.GenericAwsException {
  SubnetInUse({String? type, String? message})
      : super(type: type, code: 'SubnetInUse', message: message);
}

class SubnetNotAllowedFault extends _s.GenericAwsException {
  SubnetNotAllowedFault({String? type, String? message})
      : super(type: type, code: 'SubnetNotAllowedFault', message: message);
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

class UserGroupAlreadyExistsFault extends _s.GenericAwsException {
  UserGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type, code: 'UserGroupAlreadyExistsFault', message: message);
}

class UserGroupNotFoundFault extends _s.GenericAwsException {
  UserGroupNotFoundFault({String? type, String? message})
      : super(type: type, code: 'UserGroupNotFoundFault', message: message);
}

class UserGroupQuotaExceededFault extends _s.GenericAwsException {
  UserGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type, code: 'UserGroupQuotaExceededFault', message: message);
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
  'APICallRateForCustomerExceededFault': (type, message) =>
      APICallRateForCustomerExceededFault(type: type, message: message),
  'AuthorizationAlreadyExistsFault': (type, message) =>
      AuthorizationAlreadyExistsFault(type: type, message: message),
  'AuthorizationNotFoundFault': (type, message) =>
      AuthorizationNotFoundFault(type: type, message: message),
  'CacheClusterAlreadyExistsFault': (type, message) =>
      CacheClusterAlreadyExistsFault(type: type, message: message),
  'CacheClusterNotFoundFault': (type, message) =>
      CacheClusterNotFoundFault(type: type, message: message),
  'CacheParameterGroupAlreadyExistsFault': (type, message) =>
      CacheParameterGroupAlreadyExistsFault(type: type, message: message),
  'CacheParameterGroupNotFoundFault': (type, message) =>
      CacheParameterGroupNotFoundFault(type: type, message: message),
  'CacheParameterGroupQuotaExceededFault': (type, message) =>
      CacheParameterGroupQuotaExceededFault(type: type, message: message),
  'CacheSecurityGroupAlreadyExistsFault': (type, message) =>
      CacheSecurityGroupAlreadyExistsFault(type: type, message: message),
  'CacheSecurityGroupNotFoundFault': (type, message) =>
      CacheSecurityGroupNotFoundFault(type: type, message: message),
  'CacheSecurityGroupQuotaExceededFault': (type, message) =>
      CacheSecurityGroupQuotaExceededFault(type: type, message: message),
  'CacheSubnetGroupAlreadyExistsFault': (type, message) =>
      CacheSubnetGroupAlreadyExistsFault(type: type, message: message),
  'CacheSubnetGroupInUse': (type, message) =>
      CacheSubnetGroupInUse(type: type, message: message),
  'CacheSubnetGroupNotFoundFault': (type, message) =>
      CacheSubnetGroupNotFoundFault(type: type, message: message),
  'CacheSubnetGroupQuotaExceededFault': (type, message) =>
      CacheSubnetGroupQuotaExceededFault(type: type, message: message),
  'CacheSubnetQuotaExceededFault': (type, message) =>
      CacheSubnetQuotaExceededFault(type: type, message: message),
  'ClusterQuotaForCustomerExceededFault': (type, message) =>
      ClusterQuotaForCustomerExceededFault(type: type, message: message),
  'DefaultUserAssociatedToUserGroupFault': (type, message) =>
      DefaultUserAssociatedToUserGroupFault(type: type, message: message),
  'DefaultUserRequired': (type, message) =>
      DefaultUserRequired(type: type, message: message),
  'DuplicateUserNameFault': (type, message) =>
      DuplicateUserNameFault(type: type, message: message),
  'GlobalReplicationGroupAlreadyExistsFault': (type, message) =>
      GlobalReplicationGroupAlreadyExistsFault(type: type, message: message),
  'GlobalReplicationGroupNotFoundFault': (type, message) =>
      GlobalReplicationGroupNotFoundFault(type: type, message: message),
  'InsufficientCacheClusterCapacityFault': (type, message) =>
      InsufficientCacheClusterCapacityFault(type: type, message: message),
  'InvalidARNFault': (type, message) =>
      InvalidARNFault(type: type, message: message),
  'InvalidCacheClusterStateFault': (type, message) =>
      InvalidCacheClusterStateFault(type: type, message: message),
  'InvalidCacheParameterGroupStateFault': (type, message) =>
      InvalidCacheParameterGroupStateFault(type: type, message: message),
  'InvalidCacheSecurityGroupStateFault': (type, message) =>
      InvalidCacheSecurityGroupStateFault(type: type, message: message),
  'InvalidCredentialsException': (type, message) =>
      InvalidCredentialsException(type: type, message: message),
  'InvalidGlobalReplicationGroupStateFault': (type, message) =>
      InvalidGlobalReplicationGroupStateFault(type: type, message: message),
  'InvalidKMSKeyFault': (type, message) =>
      InvalidKMSKeyFault(type: type, message: message),
  'InvalidParameterCombinationException': (type, message) =>
      InvalidParameterCombinationException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidReplicationGroupStateFault': (type, message) =>
      InvalidReplicationGroupStateFault(type: type, message: message),
  'InvalidServerlessCacheSnapshotStateFault': (type, message) =>
      InvalidServerlessCacheSnapshotStateFault(type: type, message: message),
  'InvalidServerlessCacheStateFault': (type, message) =>
      InvalidServerlessCacheStateFault(type: type, message: message),
  'InvalidSnapshotStateFault': (type, message) =>
      InvalidSnapshotStateFault(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'InvalidUserGroupStateFault': (type, message) =>
      InvalidUserGroupStateFault(type: type, message: message),
  'InvalidUserStateFault': (type, message) =>
      InvalidUserStateFault(type: type, message: message),
  'InvalidVPCNetworkStateFault': (type, message) =>
      InvalidVPCNetworkStateFault(type: type, message: message),
  'NoOperationFault': (type, message) =>
      NoOperationFault(type: type, message: message),
  'NodeGroupNotFoundFault': (type, message) =>
      NodeGroupNotFoundFault(type: type, message: message),
  'NodeGroupsPerReplicationGroupQuotaExceededFault': (type, message) =>
      NodeGroupsPerReplicationGroupQuotaExceededFault(
          type: type, message: message),
  'NodeQuotaForClusterExceededFault': (type, message) =>
      NodeQuotaForClusterExceededFault(type: type, message: message),
  'NodeQuotaForCustomerExceededFault': (type, message) =>
      NodeQuotaForCustomerExceededFault(type: type, message: message),
  'ReplicationGroupAlreadyExistsFault': (type, message) =>
      ReplicationGroupAlreadyExistsFault(type: type, message: message),
  'ReplicationGroupAlreadyUnderMigrationFault': (type, message) =>
      ReplicationGroupAlreadyUnderMigrationFault(type: type, message: message),
  'ReplicationGroupNotFoundFault': (type, message) =>
      ReplicationGroupNotFoundFault(type: type, message: message),
  'ReplicationGroupNotUnderMigrationFault': (type, message) =>
      ReplicationGroupNotUnderMigrationFault(type: type, message: message),
  'ReservedCacheNodeAlreadyExistsFault': (type, message) =>
      ReservedCacheNodeAlreadyExistsFault(type: type, message: message),
  'ReservedCacheNodeNotFoundFault': (type, message) =>
      ReservedCacheNodeNotFoundFault(type: type, message: message),
  'ReservedCacheNodeQuotaExceededFault': (type, message) =>
      ReservedCacheNodeQuotaExceededFault(type: type, message: message),
  'ReservedCacheNodesOfferingNotFoundFault': (type, message) =>
      ReservedCacheNodesOfferingNotFoundFault(type: type, message: message),
  'ServerlessCacheAlreadyExistsFault': (type, message) =>
      ServerlessCacheAlreadyExistsFault(type: type, message: message),
  'ServerlessCacheNotFoundFault': (type, message) =>
      ServerlessCacheNotFoundFault(type: type, message: message),
  'ServerlessCacheQuotaForCustomerExceededFault': (type, message) =>
      ServerlessCacheQuotaForCustomerExceededFault(
          type: type, message: message),
  'ServerlessCacheSnapshotAlreadyExistsFault': (type, message) =>
      ServerlessCacheSnapshotAlreadyExistsFault(type: type, message: message),
  'ServerlessCacheSnapshotNotFoundFault': (type, message) =>
      ServerlessCacheSnapshotNotFoundFault(type: type, message: message),
  'ServerlessCacheSnapshotQuotaExceededFault': (type, message) =>
      ServerlessCacheSnapshotQuotaExceededFault(type: type, message: message),
  'ServiceLinkedRoleNotFoundFault': (type, message) =>
      ServiceLinkedRoleNotFoundFault(type: type, message: message),
  'ServiceUpdateNotFoundFault': (type, message) =>
      ServiceUpdateNotFoundFault(type: type, message: message),
  'SnapshotAlreadyExistsFault': (type, message) =>
      SnapshotAlreadyExistsFault(type: type, message: message),
  'SnapshotFeatureNotSupportedFault': (type, message) =>
      SnapshotFeatureNotSupportedFault(type: type, message: message),
  'SnapshotNotFoundFault': (type, message) =>
      SnapshotNotFoundFault(type: type, message: message),
  'SnapshotQuotaExceededFault': (type, message) =>
      SnapshotQuotaExceededFault(type: type, message: message),
  'SubnetInUse': (type, message) => SubnetInUse(type: type, message: message),
  'SubnetNotAllowedFault': (type, message) =>
      SubnetNotAllowedFault(type: type, message: message),
  'TagNotFoundFault': (type, message) =>
      TagNotFoundFault(type: type, message: message),
  'TagQuotaPerResourceExceeded': (type, message) =>
      TagQuotaPerResourceExceeded(type: type, message: message),
  'TestFailoverNotAvailableFault': (type, message) =>
      TestFailoverNotAvailableFault(type: type, message: message),
  'UserAlreadyExistsFault': (type, message) =>
      UserAlreadyExistsFault(type: type, message: message),
  'UserGroupAlreadyExistsFault': (type, message) =>
      UserGroupAlreadyExistsFault(type: type, message: message),
  'UserGroupNotFoundFault': (type, message) =>
      UserGroupNotFoundFault(type: type, message: message),
  'UserGroupQuotaExceededFault': (type, message) =>
      UserGroupQuotaExceededFault(type: type, message: message),
  'UserNotFoundFault': (type, message) =>
      UserNotFoundFault(type: type, message: message),
  'UserQuotaExceededFault': (type, message) =>
      UserQuotaExceededFault(type: type, message: message),
};
