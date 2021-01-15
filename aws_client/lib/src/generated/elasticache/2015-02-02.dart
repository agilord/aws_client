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

import '2015-02-02.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

part '2015-02-02.g.dart';

/// Amazon ElastiCache is a web service that makes it easier to set up, operate,
/// and scale a distributed cache in the cloud.
class ElastiCache {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ElastiCache({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'elasticache',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Adds up to 50 cost allocation tags to the named resource. A cost
  /// allocation tag is a key-value pair where the key and value are
  /// case-sensitive. You can use cost allocation tags to categorize and track
  /// your AWS costs.
  ///
  /// When you apply tags to your ElastiCache resources, AWS generates a cost
  /// allocation report as a comma-separated value (CSV) file with your usage
  /// and costs aggregated by your tags. You can apply tags that represent
  /// business categories (such as cost centers, application names, or owners)
  /// to organize your costs across multiple services. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html">Using
  /// Cost Allocation Tags in Amazon ElastiCache</a> in the <i>ElastiCache User
  /// Guide</i>.
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [SnapshotNotFoundFault].
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
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  ///
  /// Parameter [tags] :
  /// A list of cost allocation tags to be added to this resource. A tag is a
  /// key-value pair. A tag key must be accompanied by a tag value.
  Future<TagListMessage> addTagsToResource({
    @_s.required String resourceName,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tags, 'tags');
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
  /// The AWS account number of the Amazon EC2 security group owner. Note that
  /// this is not the same thing as an AWS access key ID - you must provide a
  /// valid AWS account number for this parameter.
  Future<AuthorizeCacheSecurityGroupIngressResult>
      authorizeCacheSecurityGroupIngress({
    @_s.required String cacheSecurityGroupName,
    @_s.required String eC2SecurityGroupName,
    @_s.required String eC2SecurityGroupOwnerId,
  }) async {
    ArgumentError.checkNotNull(
        cacheSecurityGroupName, 'cacheSecurityGroupName');
    ArgumentError.checkNotNull(eC2SecurityGroupName, 'eC2SecurityGroupName');
    ArgumentError.checkNotNull(
        eC2SecurityGroupOwnerId, 'eC2SecurityGroupOwnerId');
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
    @_s.required String serviceUpdateName,
    List<String> cacheClusterIds,
    List<String> replicationGroupIds,
  }) async {
    ArgumentError.checkNotNull(serviceUpdateName, 'serviceUpdateName');
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
    @_s.required String serviceUpdateName,
    List<String> cacheClusterIds,
    List<String> replicationGroupIds,
  }) async {
    ArgumentError.checkNotNull(serviceUpdateName, 'serviceUpdateName');
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
    @_s.required String replicationGroupId,
    bool force,
  }) async {
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
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
  /// Parameter [targetBucket] :
  /// The Amazon S3 bucket to which the snapshot is exported. This parameter is
  /// used only when exporting a snapshot for external access.
  ///
  /// When using this parameter to export a snapshot, be sure Amazon ElastiCache
  /// has the needed permissions to this S3 bucket. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step
  /// 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the <i>Amazon
  /// ElastiCache User Guide</i>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Snapshots.Exporting.html">Exporting
  /// a Snapshot</a> in the <i>Amazon ElastiCache User Guide</i>.
  Future<CopySnapshotResult> copySnapshot({
    @_s.required String sourceSnapshotName,
    @_s.required String targetSnapshotName,
    String kmsKeyId,
    String targetBucket,
  }) async {
    ArgumentError.checkNotNull(sourceSnapshotName, 'sourceSnapshotName');
    ArgumentError.checkNotNull(targetSnapshotName, 'targetSnapshotName');
    final $request = <String, dynamic>{};
    $request['SourceSnapshotName'] = sourceSnapshotName;
    $request['TargetSnapshotName'] = targetSnapshotName;
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
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
  /// This parameter is currently disabled.
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
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  /// <note>
  /// At this time, M6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and
  /// ap-northeast-1.
  /// </note>
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended)
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
  /// Previous generation: (not recommended)
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
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  /// <note>
  /// At this time, R6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and
  /// ap-northeast-1.
  /// </note>
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
  /// Previous generation: (not recommended)
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
  /// Memcached, this value must be between 1 and 20.
  ///
  /// If you need more than 20 nodes for your Memcached cluster, please fill out
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
  /// a 60 minute period. Valid values for <code>ddd</code> are:
  ///
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
  /// A list of cost allocation tags to be added to this resource.
  Future<CreateCacheClusterResult> createCacheCluster({
    @_s.required String cacheClusterId,
    AZMode aZMode,
    String authToken,
    bool autoMinorVersionUpgrade,
    String cacheNodeType,
    String cacheParameterGroupName,
    List<String> cacheSecurityGroupNames,
    String cacheSubnetGroupName,
    String engine,
    String engineVersion,
    String notificationTopicArn,
    int numCacheNodes,
    OutpostMode outpostMode,
    int port,
    String preferredAvailabilityZone,
    List<String> preferredAvailabilityZones,
    String preferredMaintenanceWindow,
    String preferredOutpostArn,
    List<String> preferredOutpostArns,
    String replicationGroupId,
    List<String> securityGroupIds,
    List<String> snapshotArns,
    String snapshotName,
    int snapshotRetentionLimit,
    String snapshotWindow,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(cacheClusterId, 'cacheClusterId');
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
  /// <code>redis6.x</code> |
  ///
  /// Parameter [cacheParameterGroupName] :
  /// A user-specified name for the cache parameter group.
  ///
  /// Parameter [description] :
  /// A user-specified description for the cache parameter group.
  Future<CreateCacheParameterGroupResult> createCacheParameterGroup({
    @_s.required String cacheParameterGroupFamily,
    @_s.required String cacheParameterGroupName,
    @_s.required String description,
  }) async {
    ArgumentError.checkNotNull(
        cacheParameterGroupFamily, 'cacheParameterGroupFamily');
    ArgumentError.checkNotNull(
        cacheParameterGroupName, 'cacheParameterGroupName');
    ArgumentError.checkNotNull(description, 'description');
    final $request = <String, dynamic>{};
    $request['CacheParameterGroupFamily'] = cacheParameterGroupFamily;
    $request['CacheParameterGroupName'] = cacheParameterGroupName;
    $request['Description'] = description;
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
  Future<CreateCacheSecurityGroupResult> createCacheSecurityGroup({
    @_s.required String cacheSecurityGroupName,
    @_s.required String description,
  }) async {
    ArgumentError.checkNotNull(
        cacheSecurityGroupName, 'cacheSecurityGroupName');
    ArgumentError.checkNotNull(description, 'description');
    final $request = <String, dynamic>{};
    $request['CacheSecurityGroupName'] = cacheSecurityGroupName;
    $request['Description'] = description;
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
  Future<CreateCacheSubnetGroupResult> createCacheSubnetGroup({
    @_s.required String cacheSubnetGroupDescription,
    @_s.required String cacheSubnetGroupName,
    @_s.required List<String> subnetIds,
  }) async {
    ArgumentError.checkNotNull(
        cacheSubnetGroupDescription, 'cacheSubnetGroupDescription');
    ArgumentError.checkNotNull(cacheSubnetGroupName, 'cacheSubnetGroupName');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final $request = <String, dynamic>{};
    $request['CacheSubnetGroupDescription'] = cacheSubnetGroupDescription;
    $request['CacheSubnetGroupName'] = cacheSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
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
  /// Datastore.
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
  /// The suffix name of a Global Datastore. Amazon ElastiCache automatically
  /// applies a prefix to the Global Datastore ID when it is created. Each AWS
  /// Region has its own prefix. For instance, a Global Datastore ID created in
  /// the US-West-1 region will begin with "dsdfu" along with the suffix name
  /// you provide. The suffix, combined with the auto-generated prefix,
  /// guarantees uniqueness of the Global Datastore name across multiple
  /// regions.
  ///
  /// For a full list of AWS Regions and their respective Global Datastore iD
  /// prefixes, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Redis-Global-Datastores-CLI.html">Using
  /// the AWS CLI with Global Datastores </a>.
  ///
  /// Parameter [primaryReplicationGroupId] :
  /// The name of the primary cluster that accepts writes and will replicate
  /// updates to the secondary cluster.
  ///
  /// Parameter [globalReplicationGroupDescription] :
  /// Provides details of the Global Datastore
  Future<CreateGlobalReplicationGroupResult> createGlobalReplicationGroup({
    @_s.required String globalReplicationGroupIdSuffix,
    @_s.required String primaryReplicationGroupId,
    String globalReplicationGroupDescription,
  }) async {
    ArgumentError.checkNotNull(
        globalReplicationGroupIdSuffix, 'globalReplicationGroupIdSuffix');
    ArgumentError.checkNotNull(
        primaryReplicationGroupId, 'primaryReplicationGroupId');
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
  /// a secondary replication group associated with a Global Datastore.
  ///
  /// A Redis (cluster mode disabled) replication group is a collection of
  /// clusters, where one of the clusters is a read/write primary and the others
  /// are read-only replicas. Writes to the primary are asynchronously
  /// propagated to the replicas.
  ///
  /// A Redis (cluster mode enabled) replication group is a collection of 1 to
  /// 90 node groups (shards). Each node group (shard) has one read/write
  /// primary node and up to 5 read-only replica nodes. Writes to the primary
  /// are asynchronously propagated to the replicas. Redis (cluster mode
  /// enabled) replication groups partition the data across node groups
  /// (shards).
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
  /// This parameter is currently disabled.
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
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  /// <note>
  /// At this time, M6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and
  /// ap-northeast-1.
  /// </note>
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended)
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
  /// Previous generation: (not recommended)
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
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  /// <note>
  /// At this time, R6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and
  /// ap-northeast-1.
  /// </note>
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
  /// Previous generation: (not recommended)
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
  /// <note>
  /// If you are restoring to an engine version that is different than the
  /// original, you must specify the default version of that version. For
  /// example, <code>CacheParameterGroupName=default.redis4.0</code>.
  /// </note>
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
  /// Parameter [engine] :
  /// The name of the cache engine to be used for the clusters in this
  /// replication group.
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
  /// The name of the Global Datastore
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key used to encrypt the disk in the cluster.
  ///
  /// Parameter [multiAZEnabled] :
  /// A flag indicating if you have Multi-AZ enabled to enhance fault tolerance.
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html">Minimizing
  /// Downtime: Multi-AZ</a>.
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
  /// a 60 minute period. Valid values for <code>ddd</code> are:
  ///
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
  /// A list of cost allocation tags to be added to this resource. Tags are
  /// comma-separated key,value pairs (e.g. Key=<code>myKey</code>,
  /// Value=<code>myKeyValue</code>. You can include multiple tags as shown
  /// following: Key=<code>myKey</code>, Value=<code>myKeyValue</code>
  /// Key=<code>mySecondKey</code>, Value=<code>mySecondKeyValue</code>.
  ///
  /// Parameter [transitEncryptionEnabled] :
  /// A flag that enables in-transit encryption when set to <code>true</code>.
  ///
  /// You cannot modify the value of <code>TransitEncryptionEnabled</code> after
  /// the cluster is created. To enable in-transit encryption on a cluster you
  /// must set <code>TransitEncryptionEnabled</code> to <code>true</code> when
  /// you create a cluster.
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
  /// Parameter [userGroupIds] :
  /// The list of user groups to associate with the replication group.
  Future<CreateReplicationGroupResult> createReplicationGroup({
    @_s.required String replicationGroupDescription,
    @_s.required String replicationGroupId,
    bool atRestEncryptionEnabled,
    String authToken,
    bool autoMinorVersionUpgrade,
    bool automaticFailoverEnabled,
    String cacheNodeType,
    String cacheParameterGroupName,
    List<String> cacheSecurityGroupNames,
    String cacheSubnetGroupName,
    String engine,
    String engineVersion,
    String globalReplicationGroupId,
    String kmsKeyId,
    bool multiAZEnabled,
    List<NodeGroupConfiguration> nodeGroupConfiguration,
    String notificationTopicArn,
    int numCacheClusters,
    int numNodeGroups,
    int port,
    List<String> preferredCacheClusterAZs,
    String preferredMaintenanceWindow,
    String primaryClusterId,
    int replicasPerNodeGroup,
    List<String> securityGroupIds,
    List<String> snapshotArns,
    String snapshotName,
    int snapshotRetentionLimit,
    String snapshotWindow,
    List<Tag> tags,
    bool transitEncryptionEnabled,
    List<String> userGroupIds,
  }) async {
    ArgumentError.checkNotNull(
        replicationGroupDescription, 'replicationGroupDescription');
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
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
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    globalReplicationGroupId
        ?.also((arg) => $request['GlobalReplicationGroupId'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    multiAZEnabled?.also((arg) => $request['MultiAZEnabled'] = arg);
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
    snapshotArns?.also((arg) => $request['SnapshotArns'] = arg);
    snapshotName?.also((arg) => $request['SnapshotName'] = arg);
    snapshotRetentionLimit
        ?.also((arg) => $request['SnapshotRetentionLimit'] = arg);
    snapshotWindow?.also((arg) => $request['SnapshotWindow'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    transitEncryptionEnabled
        ?.also((arg) => $request['TransitEncryptionEnabled'] = arg);
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
  Future<CreateSnapshotResult> createSnapshot({
    @_s.required String snapshotName,
    String cacheClusterId,
    String kmsKeyId,
    String replicationGroupId,
  }) async {
    ArgumentError.checkNotNull(snapshotName, 'snapshotName');
    final $request = <String, dynamic>{};
    $request['SnapshotName'] = snapshotName;
    cacheClusterId?.also((arg) => $request['CacheClusterId'] = arg);
    kmsKeyId?.also((arg) => $request['KmsKeyId'] = arg);
    replicationGroupId?.also((arg) => $request['ReplicationGroupId'] = arg);
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

  /// For Redis engine version 6.x onwards: Creates a Redis user. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using
  /// Role Based Access Control (RBAC)</a>.
  ///
  /// May throw [UserAlreadyExistsFault].
  /// May throw [UserQuotaExceededFault].
  /// May throw [DuplicateUserNameFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
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
  /// Parameter [noPasswordRequired] :
  /// Indicates a password is not required for this user.
  ///
  /// Parameter [passwords] :
  /// Passwords used for this user. You can create up to two passwords for each
  /// user.
  Future<User> createUser({
    @_s.required String accessString,
    @_s.required String engine,
    @_s.required String userId,
    @_s.required String userName,
    bool noPasswordRequired,
    List<String> passwords,
  }) async {
    ArgumentError.checkNotNull(accessString, 'accessString');
    _s.validateStringPattern(
      'accessString',
      accessString,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(engine, 'engine');
    _s.validateStringPattern(
      'engine',
      engine,
      r'''[a-zA-Z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[a-zA-Z][a-zA-Z0-9\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AccessString'] = accessString;
    $request['Engine'] = engine;
    $request['UserId'] = userId;
    $request['UserName'] = userName;
    noPasswordRequired?.also((arg) => $request['NoPasswordRequired'] = arg);
    passwords?.also((arg) => $request['Passwords'] = arg);
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

  /// For Redis engine version 6.x onwards: Creates a Redis user group. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using
  /// Role Based Access Control (RBAC)</a>
  ///
  /// May throw [UserNotFoundFault].
  /// May throw [DuplicateUserNameFault].
  /// May throw [UserGroupAlreadyExistsFault].
  /// May throw [DefaultUserRequired].
  /// May throw [UserGroupQuotaExceededFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [engine] :
  /// The current supported value is Redis.
  ///
  /// Parameter [userGroupId] :
  /// The ID of the user group.
  ///
  /// Parameter [userIds] :
  /// The list of user IDs that belong to the user group.
  Future<UserGroup> createUserGroup({
    @_s.required String engine,
    @_s.required String userGroupId,
    List<String> userIds,
  }) async {
    ArgumentError.checkNotNull(engine, 'engine');
    _s.validateStringPattern(
      'engine',
      engine,
      r'''[a-zA-Z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userGroupId, 'userGroupId');
    final $request = <String, dynamic>{};
    $request['Engine'] = engine;
    $request['UserGroupId'] = userGroupId;
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

  /// Decreases the number of node groups in a Global Datastore
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
  /// The name of the Global Datastore
  ///
  /// Parameter [nodeGroupCount] :
  /// The number of node groups (shards) that results from the modification of
  /// the shard configuration
  ///
  /// Parameter [globalNodeGroupsToRemove] :
  /// If the value of NodeGroupCount is less than the current number of node
  /// groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is
  /// required. NodeGroupsToRemove is a list of NodeGroupIds to remove from the
  /// cluster. ElastiCache for Redis will attempt to remove all node groups
  /// listed by NodeGroupsToRemove from the cluster.
  ///
  /// Parameter [globalNodeGroupsToRetain] :
  /// If the value of NodeGroupCount is less than the current number of node
  /// groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is
  /// required. NodeGroupsToRemove is a list of NodeGroupIds to remove from the
  /// cluster. ElastiCache for Redis will attempt to remove all node groups
  /// listed by NodeGroupsToRemove from the cluster.
  Future<DecreaseNodeGroupsInGlobalReplicationGroupResult>
      decreaseNodeGroupsInGlobalReplicationGroup({
    @_s.required bool applyImmediately,
    @_s.required String globalReplicationGroupId,
    @_s.required int nodeGroupCount,
    List<String> globalNodeGroupsToRemove,
    List<String> globalNodeGroupsToRetain,
  }) async {
    ArgumentError.checkNotNull(applyImmediately, 'applyImmediately');
    ArgumentError.checkNotNull(
        globalReplicationGroupId, 'globalReplicationGroupId');
    ArgumentError.checkNotNull(nodeGroupCount, 'nodeGroupCount');
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
    @_s.required bool applyImmediately,
    @_s.required String replicationGroupId,
    int newReplicaCount,
    List<ConfigureShard> replicaConfiguration,
    List<String> replicasToRemove,
  }) async {
    ArgumentError.checkNotNull(applyImmediately, 'applyImmediately');
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
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
  /// A cluster that is the last read replica of a replication group
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
    @_s.required String cacheClusterId,
    String finalSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(cacheClusterId, 'cacheClusterId');
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
  /// parameter group if it is associated with any cache clusters.
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
    @_s.required String cacheParameterGroupName,
  }) async {
    ArgumentError.checkNotNull(
        cacheParameterGroupName, 'cacheParameterGroupName');
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
    @_s.required String cacheSecurityGroupName,
  }) async {
    ArgumentError.checkNotNull(
        cacheSecurityGroupName, 'cacheSecurityGroupName');
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
  /// You cannot delete a cache subnet group if it is associated with any
  /// clusters.
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
    @_s.required String cacheSubnetGroupName,
  }) async {
    ArgumentError.checkNotNull(cacheSubnetGroupName, 'cacheSubnetGroupName');
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

  /// Deleting a Global Datastore is a two-step process:
  ///
  /// <ul>
  /// <li>
  /// First, you must <a>DisassociateGlobalReplicationGroup</a> to remove the
  /// secondary clusters in the Global Datastore.
  /// </li>
  /// <li>
  /// Once the Global Datastore contains only the primary cluster, you can use
  /// DeleteGlobalReplicationGroup API to delete the Global Datastore while
  /// retainining the primary cluster using Retain…= true.
  /// </li>
  /// </ul>
  /// Since the Global Datastore has only a primary cluster, you can delete the
  /// Global Datastore while retaining the primary by setting
  /// <code>RetainPrimaryCluster=true</code>.
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
  /// The name of the Global Datastore
  ///
  /// Parameter [retainPrimaryReplicationGroup] :
  /// The primary replication group is retained as a standalone replication
  /// group.
  Future<DeleteGlobalReplicationGroupResult> deleteGlobalReplicationGroup({
    @_s.required String globalReplicationGroupId,
    @_s.required bool retainPrimaryReplicationGroup,
  }) async {
    ArgumentError.checkNotNull(
        globalReplicationGroupId, 'globalReplicationGroupId');
    ArgumentError.checkNotNull(
        retainPrimaryReplicationGroup, 'retainPrimaryReplicationGroup');
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
    @_s.required String replicationGroupId,
    String finalSnapshotIdentifier,
    bool retainPrimaryCluster,
  }) async {
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
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
    @_s.required String snapshotName,
  }) async {
    ArgumentError.checkNotNull(snapshotName, 'snapshotName');
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

  /// For Redis engine version 6.x onwards: Deletes a user. The user will be
  /// removed from all user groups and in turn removed from all replication
  /// groups. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using
  /// Role Based Access Control (RBAC)</a>.
  ///
  /// May throw [InvalidUserStateFault].
  /// May throw [UserNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [DefaultUserAssociatedToUserGroupFault].
  ///
  /// Parameter [userId] :
  /// The ID of the user.
  Future<User> deleteUser({
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[a-zA-Z][a-zA-Z0-9\-]*''',
      isRequired: true,
    );
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

  /// For Redis engine version 6.x onwards: Deletes a ser group. The user group
  /// must first be disassociated from the replcation group before it can be
  /// deleted. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using
  /// Role Based Access Control (RBAC)</a>.
  ///
  /// May throw [UserGroupNotFoundFault].
  /// May throw [InvalidUserGroupStateFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [userGroupId] :
  /// The ID of the user group.
  Future<UserGroup> deleteUserGroup({
    @_s.required String userGroupId,
  }) async {
    ArgumentError.checkNotNull(userGroupId, 'userGroupId');
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
    String cacheClusterId,
    String marker,
    int maxRecords,
    bool showCacheClustersNotInReplicationGroups,
    bool showCacheNodeInfo,
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
  /// <code>redis6.x</code> |
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
    String cacheParameterGroupFamily,
    bool defaultOnly,
    String engine,
    String engineVersion,
    String marker,
    int maxRecords,
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
    String cacheParameterGroupName,
    String marker,
    int maxRecords,
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
    @_s.required String cacheParameterGroupName,
    String marker,
    int maxRecords,
    String source,
  }) async {
    ArgumentError.checkNotNull(
        cacheParameterGroupName, 'cacheParameterGroupName');
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
    String cacheSecurityGroupName,
    String marker,
    int maxRecords,
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
    String cacheSubnetGroupName,
    String marker,
    int maxRecords,
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
  /// <code>redis6.x</code> |
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
    @_s.required String cacheParameterGroupFamily,
    String marker,
    int maxRecords,
  }) async {
    ArgumentError.checkNotNull(
        cacheParameterGroupFamily, 'cacheParameterGroupFamily');
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
    int duration,
    DateTime endTime,
    String marker,
    int maxRecords,
    String sourceIdentifier,
    SourceType sourceType,
    DateTime startTime,
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
  /// identifier is specified, returns information about all Global Datastores.
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global Datastore
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
  /// Returns the list of members that comprise the Global Datastore.
  Future<DescribeGlobalReplicationGroupsResult>
      describeGlobalReplicationGroups({
    String globalReplicationGroupId,
    String marker,
    int maxRecords,
    bool showMemberInfo,
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
    String marker,
    int maxRecords,
    String replicationGroupId,
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
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  /// <note>
  /// At this time, M6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and
  /// ap-northeast-1.
  /// </note>
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended)
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
  /// Previous generation: (not recommended)
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
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  /// <note>
  /// At this time, R6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and
  /// ap-northeast-1.
  /// </note>
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
  /// Previous generation: (not recommended)
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
    String cacheNodeType,
    String duration,
    String marker,
    int maxRecords,
    String offeringType,
    String productDescription,
    String reservedCacheNodeId,
    String reservedCacheNodesOfferingId,
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
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  /// <note>
  /// At this time, M6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and
  /// ap-northeast-1.
  /// </note>
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended)
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
  /// Previous generation: (not recommended)
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
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6
  /// onward and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  /// <note>
  /// At this time, R6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and
  /// ap-northeast-1.
  /// </note>
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
  /// Previous generation: (not recommended)
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
    String cacheNodeType,
    String duration,
    String marker,
    int maxRecords,
    String offeringType,
    String productDescription,
    String reservedCacheNodesOfferingId,
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
    String marker,
    int maxRecords,
    String serviceUpdateName,
    List<ServiceUpdateStatus> serviceUpdateStatus,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    serviceUpdateName?.also((arg) => $request['ServiceUpdateName'] = arg);
    serviceUpdateStatus?.also((arg) => $request['ServiceUpdateStatus'] =
        arg.map((e) => e?.toValue() ?? '').toList());
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
    String cacheClusterId,
    String marker,
    int maxRecords,
    String replicationGroupId,
    bool showNodeGroupConfig,
    String snapshotName,
    String snapshotSource,
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
    List<String> cacheClusterIds,
    String engine,
    String marker,
    int maxRecords,
    List<String> replicationGroupIds,
    String serviceUpdateName,
    List<ServiceUpdateStatus> serviceUpdateStatus,
    TimeRangeFilter serviceUpdateTimeRange,
    bool showNodeLevelUpdateStatus,
    List<UpdateActionStatus> updateActionStatus,
  }) async {
    final $request = <String, dynamic>{};
    cacheClusterIds?.also((arg) => $request['CacheClusterIds'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    replicationGroupIds?.also((arg) => $request['ReplicationGroupIds'] = arg);
    serviceUpdateName?.also((arg) => $request['ServiceUpdateName'] = arg);
    serviceUpdateStatus?.also((arg) => $request['ServiceUpdateStatus'] =
        arg.map((e) => e?.toValue() ?? '').toList());
    serviceUpdateTimeRange
        ?.also((arg) => $request['ServiceUpdateTimeRange'] = arg);
    showNodeLevelUpdateStatus
        ?.also((arg) => $request['ShowNodeLevelUpdateStatus'] = arg);
    updateActionStatus?.also((arg) => $request['UpdateActionStatus'] =
        arg.map((e) => e?.toValue() ?? '').toList());
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
    String marker,
    int maxRecords,
    String userGroupId,
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
    String engine,
    List<Filter> filters,
    String marker,
    int maxRecords,
    String userId,
  }) async {
    _s.validateStringPattern(
      'engine',
      engine,
      r'''[a-zA-Z]*''',
    );
    _s.validateStringLength(
      'userId',
      userId,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[a-zA-Z][a-zA-Z0-9\-]*''',
    );
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

  /// Remove a secondary cluster from the Global Datastore using the Global
  /// Datastore name. The secondary cluster will no longer receive updates from
  /// the primary cluster, but will remain as a standalone cluster in that AWS
  /// region.
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global Datastore
  ///
  /// Parameter [replicationGroupId] :
  /// The name of the secondary cluster you wish to remove from the Global
  /// Datastore
  ///
  /// Parameter [replicationGroupRegion] :
  /// The AWS region of secondary cluster you wish to remove from the Global
  /// Datastore
  Future<DisassociateGlobalReplicationGroupResult>
      disassociateGlobalReplicationGroup({
    @_s.required String globalReplicationGroupId,
    @_s.required String replicationGroupId,
    @_s.required String replicationGroupRegion,
  }) async {
    ArgumentError.checkNotNull(
        globalReplicationGroupId, 'globalReplicationGroupId');
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
    ArgumentError.checkNotNull(
        replicationGroupRegion, 'replicationGroupRegion');
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

  /// Used to failover the primary region to a selected secondary region. The
  /// selected secondary region will become primary, and all other clusters will
  /// become secondary.
  ///
  /// May throw [GlobalReplicationGroupNotFoundFault].
  /// May throw [InvalidGlobalReplicationGroupStateFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [globalReplicationGroupId] :
  /// The name of the Global Datastore
  ///
  /// Parameter [primaryRegion] :
  /// The AWS region of the primary cluster of the Global Datastore
  ///
  /// Parameter [primaryReplicationGroupId] :
  /// The name of the primary replication group
  Future<FailoverGlobalReplicationGroupResult> failoverGlobalReplicationGroup({
    @_s.required String globalReplicationGroupId,
    @_s.required String primaryRegion,
    @_s.required String primaryReplicationGroupId,
  }) async {
    ArgumentError.checkNotNull(
        globalReplicationGroupId, 'globalReplicationGroupId');
    ArgumentError.checkNotNull(primaryRegion, 'primaryRegion');
    ArgumentError.checkNotNull(
        primaryReplicationGroupId, 'primaryReplicationGroupId');
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

  /// Increase the number of node groups in the Global Datastore
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
  /// The name of the Global Datastore
  ///
  /// Parameter [nodeGroupCount] :
  /// The number of node groups you wish to add
  ///
  /// Parameter [regionalConfigurations] :
  /// Describes the replication group IDs, the AWS regions where they are stored
  /// and the shard configuration for each that comprise the Global Datastore
  Future<IncreaseNodeGroupsInGlobalReplicationGroupResult>
      increaseNodeGroupsInGlobalReplicationGroup({
    @_s.required bool applyImmediately,
    @_s.required String globalReplicationGroupId,
    @_s.required int nodeGroupCount,
    List<RegionalConfiguration> regionalConfigurations,
  }) async {
    ArgumentError.checkNotNull(applyImmediately, 'applyImmediately');
    ArgumentError.checkNotNull(
        globalReplicationGroupId, 'globalReplicationGroupId');
    ArgumentError.checkNotNull(nodeGroupCount, 'nodeGroupCount');
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

  /// Dynamically increases the number of replics in a Redis (cluster mode
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
    @_s.required bool applyImmediately,
    @_s.required String replicationGroupId,
    int newReplicaCount,
    List<ConfigureShard> replicaConfiguration,
  }) async {
    ArgumentError.checkNotNull(applyImmediately, 'applyImmediately');
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
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
    String cacheClusterId,
    String replicationGroupId,
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

  /// Lists all cost allocation tags currently on the named resource. A
  /// <code>cost allocation tag</code> is a key-value pair where the key is
  /// case-sensitive and the value is optional. You can use cost allocation tags
  /// to categorize and track your AWS costs.
  ///
  /// If the cluster is not in the <i>available</i> state,
  /// <code>ListTagsForResource</code> returns an error.
  ///
  /// You can have a maximum of 50 cost allocation tags on an ElastiCache
  /// resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html">Monitoring
  /// Costs with Tags</a>.
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [SnapshotNotFoundFault].
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
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  Future<TagListMessage> listTagsForResource({
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
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
  /// Rotate
  /// </li>
  /// <li>
  /// Set
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html">Authenticating
  /// Users with Redis AUTH</a>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// This parameter is currently disabled.
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
  /// Parameter [newAvailabilityZones] :
  /// The list of Availability Zones where the new Memcached cache nodes are
  /// created.
  ///
  /// This parameter is only valid when <code>NumCacheNodes</code> in the
  /// request is greater than the sum of the number of active cache nodes and
  /// the number of cache nodes pending creation (which may be zero). The number
  /// of Availability Zones supplied in this list must match the cache nodes
  /// being added in this request.
  ///
  /// This option is only supported on Memcached clusters.
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
  /// Memcached, this value must be between 1 and 20.
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
    @_s.required String cacheClusterId,
    AZMode aZMode,
    bool applyImmediately,
    String authToken,
    AuthTokenUpdateStrategyType authTokenUpdateStrategy,
    bool autoMinorVersionUpgrade,
    List<String> cacheNodeIdsToRemove,
    String cacheNodeType,
    String cacheParameterGroupName,
    List<String> cacheSecurityGroupNames,
    String engineVersion,
    List<String> newAvailabilityZones,
    String notificationTopicArn,
    String notificationTopicStatus,
    int numCacheNodes,
    String preferredMaintenanceWindow,
    List<String> securityGroupIds,
    int snapshotRetentionLimit,
    String snapshotWindow,
  }) async {
    ArgumentError.checkNotNull(cacheClusterId, 'cacheClusterId');
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
    @_s.required String cacheParameterGroupName,
    @_s.required List<ParameterNameValue> parameterNameValues,
  }) async {
    ArgumentError.checkNotNull(
        cacheParameterGroupName, 'cacheParameterGroupName');
    ArgumentError.checkNotNull(parameterNameValues, 'parameterNameValues');
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
    @_s.required String cacheSubnetGroupName,
    String cacheSubnetGroupDescription,
    List<String> subnetIds,
  }) async {
    ArgumentError.checkNotNull(cacheSubnetGroupName, 'cacheSubnetGroupName');
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

  /// Modifies the settings for a Global Datastore.
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
  /// The name of the Global Datastore
  ///
  /// Parameter [automaticFailoverEnabled] :
  /// Determines whether a read replica is automatically promoted to read/write
  /// primary if the existing primary encounters a failure.
  ///
  /// Parameter [cacheNodeType] :
  /// A valid cache node type that you want to scale this Global Datastore to.
  ///
  /// Parameter [engineVersion] :
  /// The upgraded version of the cache engine to be run on the clusters in the
  /// Global Datastore.
  ///
  /// Parameter [globalReplicationGroupDescription] :
  /// A description of the Global Datastore
  Future<ModifyGlobalReplicationGroupResult> modifyGlobalReplicationGroup({
    @_s.required bool applyImmediately,
    @_s.required String globalReplicationGroupId,
    bool automaticFailoverEnabled,
    String cacheNodeType,
    String engineVersion,
    String globalReplicationGroupDescription,
  }) async {
    ArgumentError.checkNotNull(applyImmediately, 'applyImmediately');
    ArgumentError.checkNotNull(
        globalReplicationGroupId, 'globalReplicationGroupId');
    final $request = <String, dynamic>{};
    $request['ApplyImmediately'] = applyImmediately;
    $request['GlobalReplicationGroupId'] = globalReplicationGroupId;
    automaticFailoverEnabled
        ?.also((arg) => $request['AutomaticFailoverEnabled'] = arg);
    cacheNodeType?.also((arg) => $request['CacheNodeType'] = arg);
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

  /// Modifies the settings for a replication group.
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
  /// Rotate
  /// </li>
  /// <li>
  /// Set
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html">Authenticating
  /// Users with Redis AUTH</a>
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// This parameter is currently disabled.
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
  /// Parameter [multiAZEnabled] :
  /// A flag indicating if you have Multi-AZ enabled to enhance fault tolerance.
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html">Minimizing
  /// Downtime: Multi-AZ</a>.
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
  /// Removes the user groups that can access this replication group.
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
  /// Parameter [userGroupIdsToAdd] :
  /// A list of user group IDs.
  ///
  /// Parameter [userGroupIdsToRemove] :
  /// A list of users groups to remove, meaning the users in the group no longer
  /// can access thereplication group.
  Future<ModifyReplicationGroupResult> modifyReplicationGroup({
    @_s.required String replicationGroupId,
    bool applyImmediately,
    String authToken,
    AuthTokenUpdateStrategyType authTokenUpdateStrategy,
    bool autoMinorVersionUpgrade,
    bool automaticFailoverEnabled,
    String cacheNodeType,
    String cacheParameterGroupName,
    List<String> cacheSecurityGroupNames,
    String engineVersion,
    bool multiAZEnabled,
    String nodeGroupId,
    String notificationTopicArn,
    String notificationTopicStatus,
    String preferredMaintenanceWindow,
    String primaryClusterId,
    bool removeUserGroups,
    String replicationGroupDescription,
    List<String> securityGroupIds,
    int snapshotRetentionLimit,
    String snapshotWindow,
    String snapshottingClusterId,
    List<String> userGroupIdsToAdd,
    List<String> userGroupIdsToRemove,
  }) async {
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
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
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
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
  /// shards, remove shards, or rebalance the keyspaces among exisiting shards.
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
    @_s.required bool applyImmediately,
    @_s.required int nodeGroupCount,
    @_s.required String replicationGroupId,
    List<String> nodeGroupsToRemove,
    List<String> nodeGroupsToRetain,
    List<ReshardingConfiguration> reshardingConfiguration,
  }) async {
    ArgumentError.checkNotNull(applyImmediately, 'applyImmediately');
    ArgumentError.checkNotNull(nodeGroupCount, 'nodeGroupCount');
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
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

  /// Changes user password(s) and/or access string.
  ///
  /// May throw [UserNotFoundFault].
  /// May throw [InvalidUserStateFault].
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
  /// Parameter [noPasswordRequired] :
  /// Indicates no password is required for the user.
  ///
  /// Parameter [passwords] :
  /// The passwords belonging to the user. You are allowed up to two.
  Future<User> modifyUser({
    @_s.required String userId,
    String accessString,
    String appendAccessString,
    bool noPasswordRequired,
    List<String> passwords,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[a-zA-Z][a-zA-Z0-9\-]*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessString',
      accessString,
      r'''.*\S.*''',
    );
    _s.validateStringPattern(
      'appendAccessString',
      appendAccessString,
      r'''.*\S.*''',
    );
    final $request = <String, dynamic>{};
    $request['UserId'] = userId;
    accessString?.also((arg) => $request['AccessString'] = arg);
    appendAccessString?.also((arg) => $request['AppendAccessString'] = arg);
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
    @_s.required String userGroupId,
    List<String> userIdsToAdd,
    List<String> userIdsToRemove,
  }) async {
    ArgumentError.checkNotNull(userGroupId, 'userGroupId');
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

  /// Allows you to purchase a reserved cache node offering.
  ///
  /// May throw [ReservedCacheNodesOfferingNotFoundFault].
  /// May throw [ReservedCacheNodeAlreadyExistsFault].
  /// May throw [ReservedCacheNodeQuotaExceededFault].
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
  Future<PurchaseReservedCacheNodesOfferingResult>
      purchaseReservedCacheNodesOffering({
    @_s.required String reservedCacheNodesOfferingId,
    int cacheNodeCount,
    String reservedCacheNodeId,
  }) async {
    ArgumentError.checkNotNull(
        reservedCacheNodesOfferingId, 'reservedCacheNodesOfferingId');
    final $request = <String, dynamic>{};
    $request['ReservedCacheNodesOfferingId'] = reservedCacheNodesOfferingId;
    cacheNodeCount?.also((arg) => $request['CacheNodeCount'] = arg);
    reservedCacheNodeId?.also((arg) => $request['ReservedCacheNodeId'] = arg);
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
  /// The name of the Global Datastore
  Future<RebalanceSlotsInGlobalReplicationGroupResult>
      rebalanceSlotsInGlobalReplicationGroup({
    @_s.required bool applyImmediately,
    @_s.required String globalReplicationGroupId,
  }) async {
    ArgumentError.checkNotNull(applyImmediately, 'applyImmediately');
    ArgumentError.checkNotNull(
        globalReplicationGroupId, 'globalReplicationGroupId');
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
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting
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
    @_s.required String cacheClusterId,
    @_s.required List<String> cacheNodeIdsToReboot,
  }) async {
    ArgumentError.checkNotNull(cacheClusterId, 'cacheClusterId');
    ArgumentError.checkNotNull(cacheNodeIdsToReboot, 'cacheNodeIdsToReboot');
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
  /// named resource.
  ///
  /// May throw [CacheClusterNotFoundFault].
  /// May throw [SnapshotNotFoundFault].
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
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  ///
  /// Parameter [tagKeys] :
  /// A list of <code>TagKeys</code> identifying the tags you want removed from
  /// the named resource.
  Future<TagListMessage> removeTagsFromResource({
    @_s.required String resourceName,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    @_s.required String cacheParameterGroupName,
    List<ParameterNameValue> parameterNameValues,
    bool resetAllParameters,
  }) async {
    ArgumentError.checkNotNull(
        cacheParameterGroupName, 'cacheParameterGroupName');
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
  /// The AWS account number of the Amazon EC2 security group owner. Note that
  /// this is not the same thing as an AWS access key ID - you must provide a
  /// valid AWS account number for this parameter.
  Future<RevokeCacheSecurityGroupIngressResult>
      revokeCacheSecurityGroupIngress({
    @_s.required String cacheSecurityGroupName,
    @_s.required String eC2SecurityGroupName,
    @_s.required String eC2SecurityGroupOwnerId,
  }) async {
    ArgumentError.checkNotNull(
        cacheSecurityGroupName, 'cacheSecurityGroupName');
    ArgumentError.checkNotNull(eC2SecurityGroupName, 'eC2SecurityGroupName');
    ArgumentError.checkNotNull(
        eC2SecurityGroupOwnerId, 'eC2SecurityGroupOwnerId');
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
    @_s.required List<CustomerNodeEndpoint> customerNodeEndpointList,
    @_s.required String replicationGroupId,
  }) async {
    ArgumentError.checkNotNull(
        customerNodeEndpointList, 'customerNodeEndpointList');
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
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

  /// Represents the input of a <code>TestFailover</code> operation which test
  /// automatic failover on a specified node group (called shard in the console)
  /// in a replication group (called cluster in the console).
  /// <p class="title"> <b>Note the following</b>
  ///
  /// <ul>
  /// <li>
  /// A customer can use this operation to test automatic failover on up to 5
  /// shards (called node groups in the ElastiCache API and AWS CLI) in any
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
  /// using the Amazon ElastiCache console, the AWS CLI, or the ElastiCache API.
  /// Look for the following automatic failover related events, listed here in
  /// order of occurrance:
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
  /// test automatic failover on up to 5 node groups in any rolling 24-hour
  /// period.
  ///
  /// Parameter [replicationGroupId] :
  /// The name of the replication group (console: cluster) whose automatic
  /// failover is being tested by this operation.
  Future<TestFailoverResult> testFailover({
    @_s.required String nodeGroupId,
    @_s.required String replicationGroupId,
  }) async {
    ArgumentError.checkNotNull(nodeGroupId, 'nodeGroupId');
    _s.validateStringLength(
      'nodeGroupId',
      nodeGroupId,
      1,
      4,
      isRequired: true,
    );
    _s.validateStringPattern(
      'nodeGroupId',
      nodeGroupId,
      r'''\d+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(replicationGroupId, 'replicationGroupId');
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
}

enum AZMode {
  @_s.JsonValue('single-az')
  singleAz,
  @_s.JsonValue('cross-az')
  crossAz,
}

extension on AZMode {
  String toValue() {
    switch (this) {
      case AZMode.singleAz:
        return 'single-az';
      case AZMode.crossAz:
        return 'cross-az';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  AZMode toAZMode() {
    switch (this) {
      case 'single-az':
        return AZMode.singleAz;
      case 'cross-az':
        return AZMode.crossAz;
    }
    throw Exception('Unknown enum value: $this');
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
  final List<String> scaleDownModifications;

  /// A string list, each element of which specifies a cache node type which you
  /// can use to scale your cluster or replication group.
  ///
  /// When scaling up a Redis cluster or replication group using
  /// <code>ModifyCacheCluster</code> or <code>ModifyReplicationGroup</code>, use
  /// a value from this list for the <code>CacheNodeType</code> parameter.
  final List<String> scaleUpModifications;

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
}

enum AuthTokenUpdateStatus {
  @_s.JsonValue('SETTING')
  setting,
  @_s.JsonValue('ROTATING')
  rotating,
}

extension on String {
  AuthTokenUpdateStatus toAuthTokenUpdateStatus() {
    switch (this) {
      case 'SETTING':
        return AuthTokenUpdateStatus.setting;
      case 'ROTATING':
        return AuthTokenUpdateStatus.rotating;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum AuthTokenUpdateStrategyType {
  @_s.JsonValue('SET')
  set,
  @_s.JsonValue('ROTATE')
  rotate,
  @_s.JsonValue('DELETE')
  delete,
}

extension on AuthTokenUpdateStrategyType {
  String toValue() {
    switch (this) {
      case AuthTokenUpdateStrategyType.set:
        return 'SET';
      case AuthTokenUpdateStrategyType.rotate:
        return 'ROTATE';
      case AuthTokenUpdateStrategyType.delete:
        return 'DELETE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  AuthTokenUpdateStrategyType toAuthTokenUpdateStrategyType() {
    switch (this) {
      case 'SET':
        return AuthTokenUpdateStrategyType.set;
      case 'ROTATE':
        return AuthTokenUpdateStrategyType.rotate;
      case 'DELETE':
        return AuthTokenUpdateStrategyType.delete;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Indicates whether the user requires a password to authenticate.
class Authentication {
  /// The number of passwords belonging to the user. The maximum is two.
  final int passwordCount;

  /// Indicates whether the user requires a password to authenticate.
  final AuthenticationType type;

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
}

enum AuthenticationType {
  @_s.JsonValue('password')
  password,
  @_s.JsonValue('no-password')
  noPassword,
}

extension on String {
  AuthenticationType toAuthenticationType() {
    switch (this) {
      case 'password':
        return AuthenticationType.password;
      case 'no-password':
        return AuthenticationType.noPassword;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class AuthorizeCacheSecurityGroupIngressResult {
  final CacheSecurityGroup cacheSecurityGroup;

  AuthorizeCacheSecurityGroupIngressResult({
    this.cacheSecurityGroup,
  });
  factory AuthorizeCacheSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return AuthorizeCacheSecurityGroupIngressResult(
      cacheSecurityGroup: _s
          .extractXmlChild(elem, 'CacheSecurityGroup')
          ?.let((e) => CacheSecurityGroup.fromXml(e)),
    );
  }
}

enum AutomaticFailoverStatus {
  @_s.JsonValue('enabled')
  enabled,
  @_s.JsonValue('disabled')
  disabled,
  @_s.JsonValue('enabling')
  enabling,
  @_s.JsonValue('disabling')
  disabling,
}

extension on String {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes an Availability Zone in which the cluster is launched.
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

/// Contains all of the attributes of a specific cluster.
class CacheCluster {
  /// The ARN (Amazon Resource Name) of the cache cluster.
  final String arn;

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
  final bool atRestEncryptionEnabled;

  /// A flag that enables using an <code>AuthToken</code> (password) when issuing
  /// Redis commands.
  ///
  /// Default: <code>false</code>
  final bool authTokenEnabled;

  /// The date the auth token was last modified
  final DateTime authTokenLastModifiedDate;

  /// This parameter is currently disabled.
  final bool autoMinorVersionUpgrade;

  /// The date and time when the cluster was created.
  final DateTime cacheClusterCreateTime;

  /// The user-supplied identifier of the cluster. This identifier is a unique key
  /// that identifies a cluster.
  final String cacheClusterId;

  /// The current state of this cluster, one of the following values:
  /// <code>available</code>, <code>creating</code>, <code>deleted</code>,
  /// <code>deleting</code>, <code>incompatible-network</code>,
  /// <code>modifying</code>, <code>rebooting cluster nodes</code>,
  /// <code>restore-failed</code>, or <code>snapshotting</code>.
  final String cacheClusterStatus;

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
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  /// <note>
  /// At this time, M6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
  /// </note>
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended)
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
  /// Previous generation: (not recommended)
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
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  /// <note>
  /// At this time, R6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
  /// </note>
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
  /// Previous generation: (not recommended)
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
  final String cacheNodeType;

  /// A list of cache nodes that are members of the cluster.
  final List<CacheNode> cacheNodes;

  /// Status of the cache parameter group.
  final CacheParameterGroupStatus cacheParameterGroup;

  /// A list of cache security group elements, composed of name and status
  /// sub-elements.
  final List<CacheSecurityGroupMembership> cacheSecurityGroups;

  /// The name of the cache subnet group associated with the cluster.
  final String cacheSubnetGroupName;

  /// The URL of the web page where you can download the latest ElastiCache client
  /// library.
  final String clientDownloadLandingPage;

  /// Represents a Memcached cluster endpoint which, if Automatic Discovery is
  /// enabled on the cluster, can be used by an application to connect to any node
  /// in the cluster. The configuration endpoint will always have
  /// <code>.cfg</code> in it.
  ///
  /// Example: <code>mem-3.9dvc4r<u>.cfg</u>.usw2.cache.amazonaws.com:11211</code>
  final Endpoint configurationEndpoint;

  /// The name of the cache engine (<code>memcached</code> or <code>redis</code>)
  /// to be used for this cluster.
  final String engine;

  /// The version of the cache engine that is used in this cluster.
  final String engineVersion;

  /// Describes a notification topic and its status. Notification topics are used
  /// for publishing ElastiCache events to subscribers using Amazon Simple
  /// Notification Service (SNS).
  final NotificationConfiguration notificationConfiguration;

  /// The number of cache nodes in the cluster.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 20.
  final int numCacheNodes;
  final PendingModifiedValues pendingModifiedValues;

  /// The name of the Availability Zone in which the cluster is located or
  /// "Multiple" if the cache nodes are located in different Availability Zones.
  final String preferredAvailabilityZone;

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
  final String preferredMaintenanceWindow;

  /// The outpost ARN in which the cache cluster is created.
  final String preferredOutpostArn;

  /// The replication group to which this cluster belongs. If this field is empty,
  /// the cluster is not associated with any replication group.
  final String replicationGroupId;

  /// A list of VPC Security Groups associated with the cluster.
  final List<SecurityGroupMembership> securityGroups;

  /// The number of days for which ElastiCache retains automatic cluster snapshots
  /// before deleting them. For example, if you set
  /// <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is
  /// retained for 5 days before being deleted.
  /// <important>
  /// If the value of SnapshotRetentionLimit is set to zero (0), backups are
  /// turned off.
  /// </important>
  final int snapshotRetentionLimit;

  /// The daily time range (in UTC) during which ElastiCache begins taking a daily
  /// snapshot of your cluster.
  ///
  /// Example: <code>05:00-09:00</code>
  final String snapshotWindow;

  /// A flag that enables in-transit encryption when set to <code>true</code>.
  ///
  /// You cannot modify the value of <code>TransitEncryptionEnabled</code> after
  /// the cluster is created. To enable in-transit encryption on a cluster you
  /// must set <code>TransitEncryptionEnabled</code> to <code>true</code> when you
  /// create a cluster.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  ///
  /// Default: <code>false</code>
  final bool transitEncryptionEnabled;

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
    this.notificationConfiguration,
    this.numCacheNodes,
    this.pendingModifiedValues,
    this.preferredAvailabilityZone,
    this.preferredMaintenanceWindow,
    this.preferredOutpostArn,
    this.replicationGroupId,
    this.securityGroups,
    this.snapshotRetentionLimit,
    this.snapshotWindow,
    this.transitEncryptionEnabled,
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
      cacheNodes: _s.extractXmlChild(elem, 'CacheNodes')?.let((elem) => elem
          .findElements('CacheNode')
          .map((c) => CacheNode.fromXml(c))
          .toList()),
      cacheParameterGroup: _s
          .extractXmlChild(elem, 'CacheParameterGroup')
          ?.let((e) => CacheParameterGroupStatus.fromXml(e)),
      cacheSecurityGroups: _s.extractXmlChild(elem, 'CacheSecurityGroups')?.let(
          (elem) => elem
              .findElements('CacheSecurityGroup')
              .map((c) => CacheSecurityGroupMembership.fromXml(c))
              .toList()),
      cacheSubnetGroupName:
          _s.extractXmlStringValue(elem, 'CacheSubnetGroupName'),
      clientDownloadLandingPage:
          _s.extractXmlStringValue(elem, 'ClientDownloadLandingPage'),
      configurationEndpoint: _s
          .extractXmlChild(elem, 'ConfigurationEndpoint')
          ?.let((e) => Endpoint.fromXml(e)),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      notificationConfiguration: _s
          .extractXmlChild(elem, 'NotificationConfiguration')
          ?.let((e) => NotificationConfiguration.fromXml(e)),
      numCacheNodes: _s.extractXmlIntValue(elem, 'NumCacheNodes'),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let((e) => PendingModifiedValues.fromXml(e)),
      preferredAvailabilityZone:
          _s.extractXmlStringValue(elem, 'PreferredAvailabilityZone'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      preferredOutpostArn:
          _s.extractXmlStringValue(elem, 'PreferredOutpostArn'),
      replicationGroupId: _s.extractXmlStringValue(elem, 'ReplicationGroupId'),
      securityGroups: _s.extractXmlChild(elem, 'SecurityGroups')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => SecurityGroupMembership.fromXml(c))
              .toList()),
      snapshotRetentionLimit:
          _s.extractXmlIntValue(elem, 'SnapshotRetentionLimit'),
      snapshotWindow: _s.extractXmlStringValue(elem, 'SnapshotWindow'),
      transitEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'TransitEncryptionEnabled'),
    );
  }
}

/// Represents the output of a <code>DescribeCacheClusters</code> operation.
class CacheClusterMessage {
  /// A list of clusters. Each item in the list contains detailed information
  /// about one cluster.
  final List<CacheCluster> cacheClusters;

  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  CacheClusterMessage({
    this.cacheClusters,
    this.marker,
  });
  factory CacheClusterMessage.fromXml(_s.XmlElement elem) {
    return CacheClusterMessage(
      cacheClusters: _s.extractXmlChild(elem, 'CacheClusters')?.let((elem) =>
          elem
              .findElements('CacheCluster')
              .map((c) => CacheCluster.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Provides all of the details about a particular cache engine version.
class CacheEngineVersion {
  /// The description of the cache engine.
  final String cacheEngineDescription;

  /// The description of the cache engine version.
  final String cacheEngineVersionDescription;

  /// The name of the cache parameter group family associated with this cache
  /// engine.
  ///
  /// Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> |
  /// <code>memcached1.6</code> | <code>redis2.6</code> | <code>redis2.8</code> |
  /// <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> |
  /// <code>redis6.x</code> |
  final String cacheParameterGroupFamily;

  /// The name of the cache engine.
  final String engine;

  /// The version number of the cache engine.
  final String engineVersion;

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
}

/// Represents the output of a <a>DescribeCacheEngineVersions</a> operation.
class CacheEngineVersionMessage {
  /// A list of cache engine version details. Each element in the list contains
  /// detailed information about one cache engine version.
  final List<CacheEngineVersion> cacheEngineVersions;

  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  CacheEngineVersionMessage({
    this.cacheEngineVersions,
    this.marker,
  });
  factory CacheEngineVersionMessage.fromXml(_s.XmlElement elem) {
    return CacheEngineVersionMessage(
      cacheEngineVersions: _s.extractXmlChild(elem, 'CacheEngineVersions')?.let(
          (elem) => elem
              .findElements('CacheEngineVersion')
              .map((c) => CacheEngineVersion.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
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
/// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
/// and for Memcached engine version 1.5.16 onward).
///
/// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
/// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
/// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
/// <code>cache.m6g.16xlarge</code>
/// <note>
/// At this time, M6g node types are available in the following regions:
/// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
/// </note>
/// <b>M5 node types:</b> <code>cache.m5.large</code>,
/// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
/// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
/// <code>cache.m5.24xlarge</code>
///
/// <b>M4 node types:</b> <code>cache.m4.large</code>,
/// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
/// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
///
/// <b>T3 node types:</b> <code>cache.t3.micro</code>,
/// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
///
/// <b>T2 node types:</b> <code>cache.t2.micro</code>,
/// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
/// </li>
/// <li>
/// Previous generation: (not recommended)
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
/// Previous generation: (not recommended)
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
/// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
/// and for Memcached engine version 1.5.16 onward).
///
/// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
/// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
/// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
/// <code>cache.r6g.16xlarge</code>
/// <note>
/// At this time, R6g node types are available in the following regions:
/// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
/// </note>
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
/// Previous generation: (not recommended)
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
  final DateTime cacheNodeCreateTime;

  /// The cache node identifier. A node ID is a numeric identifier (0001, 0002,
  /// etc.). The combination of cluster ID and node ID uniquely identifies every
  /// cache node used in a customer's AWS account.
  final String cacheNodeId;

  /// The current state of this cache node, one of the following values:
  /// <code>available</code>, <code>creating</code>, <code>rebooting</code>, or
  /// <code>deleting</code>.
  final String cacheNodeStatus;

  /// The Availability Zone where this node was created and now resides.
  final String customerAvailabilityZone;

  /// The customer outpost ARN of the cache node.
  final String customerOutpostArn;

  /// The hostname for connecting to this cache node.
  final Endpoint endpoint;

  /// The status of the parameter group applied to this cache node.
  final String parameterGroupStatus;

  /// The ID of the primary node to which this read replica node is synchronized.
  /// If this field is empty, this node is not associated with a primary cluster.
  final String sourceCacheNodeId;

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
      endpoint:
          _s.extractXmlChild(elem, 'Endpoint')?.let((e) => Endpoint.fromXml(e)),
      parameterGroupStatus:
          _s.extractXmlStringValue(elem, 'ParameterGroupStatus'),
      sourceCacheNodeId: _s.extractXmlStringValue(elem, 'SourceCacheNodeId'),
    );
  }
}

/// A parameter that has a different value for each cache node type it is
/// applied to. For example, in a Redis cluster, a <code>cache.m1.large</code>
/// cache node type would have a larger <code>maxmemory</code> value than a
/// <code>cache.m1.small</code> type.
class CacheNodeTypeSpecificParameter {
  /// The valid range of values for the parameter.
  final String allowedValues;

  /// A list of cache node types and their corresponding values for this
  /// parameter.
  final List<CacheNodeTypeSpecificValue> cacheNodeTypeSpecificValues;

  /// Indicates whether a change to the parameter is applied immediately or
  /// requires a reboot for the change to be applied. You can force a reboot or
  /// wait until the next maintenance window's reboot. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting
  /// a Cluster</a>.
  final ChangeType changeType;

  /// The valid data type for the parameter.
  final String dataType;

  /// A description of the parameter.
  final String description;

  /// Indicates whether (<code>true</code>) or not (<code>false</code>) the
  /// parameter can be modified. Some parameters have security or operational
  /// implications that prevent them from being changed.
  final bool isModifiable;

  /// The earliest cache engine version to which the parameter can apply.
  final String minimumEngineVersion;

  /// The name of the parameter.
  final String parameterName;

  /// The source of the parameter value.
  final String source;

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
              .map((c) => CacheNodeTypeSpecificValue.fromXml(c))
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
}

/// A value that applies only to a certain cache node type.
class CacheNodeTypeSpecificValue {
  /// The cache node type for which this value applies.
  final String cacheNodeType;

  /// The value for the cache node type.
  final String value;

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
}

/// The status of the service update on the cache node
class CacheNodeUpdateStatus {
  /// The node ID of the cache cluster
  final String cacheNodeId;

  /// The deletion date of the node
  final DateTime nodeDeletionDate;

  /// The end date of the update for a node
  final DateTime nodeUpdateEndDate;

  /// Reflects whether the update was initiated by the customer or automatically
  /// applied
  final NodeUpdateInitiatedBy nodeUpdateInitiatedBy;

  /// The date when the update is triggered
  final DateTime nodeUpdateInitiatedDate;

  /// The start date of the update for a node
  final DateTime nodeUpdateStartDate;

  /// The update status of the node
  final NodeUpdateStatus nodeUpdateStatus;

  /// The date when the NodeUpdateStatus was last modified&gt;
  final DateTime nodeUpdateStatusModifiedDate;

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
}

/// Represents the output of a <code>CreateCacheParameterGroup</code> operation.
class CacheParameterGroup {
  /// The ARN (Amazon Resource Name) of the cache parameter group.
  final String arn;

  /// The name of the cache parameter group family that this cache parameter group
  /// is compatible with.
  ///
  /// Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> |
  /// <code>memcached1.6</code> | <code>redis2.6</code> | <code>redis2.8</code> |
  /// <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> |
  /// <code>redis6.x</code> |
  final String cacheParameterGroupFamily;

  /// The name of the cache parameter group.
  final String cacheParameterGroupName;

  /// The description for this cache parameter group.
  final String description;

  /// Indicates whether the parameter group is associated with a Global Datastore
  final bool isGlobal;

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
}

/// Represents the output of a <code>DescribeCacheParameters</code> operation.
class CacheParameterGroupDetails {
  /// A list of parameters specific to a particular cache node type. Each element
  /// in the list contains detailed information about one parameter.
  final List<CacheNodeTypeSpecificParameter> cacheNodeTypeSpecificParameters;

  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of <a>Parameter</a> instances.
  final List<Parameter> parameters;

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
              .map((c) => CacheNodeTypeSpecificParameter.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
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
  final String cacheParameterGroupName;

  CacheParameterGroupNameMessage({
    this.cacheParameterGroupName,
  });
  factory CacheParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return CacheParameterGroupNameMessage(
      cacheParameterGroupName:
          _s.extractXmlStringValue(elem, 'CacheParameterGroupName'),
    );
  }
}

/// Status of the cache parameter group.
class CacheParameterGroupStatus {
  /// A list of the cache node IDs which need to be rebooted for parameter changes
  /// to be applied. A node ID is a numeric identifier (0001, 0002, etc.).
  final List<String> cacheNodeIdsToReboot;

  /// The name of the cache parameter group.
  final String cacheParameterGroupName;

  /// The status of parameter updates.
  final String parameterApplyStatus;

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
}

/// Represents the output of a <code>DescribeCacheParameterGroups</code>
/// operation.
class CacheParameterGroupsMessage {
  /// A list of cache parameter groups. Each element in the list contains detailed
  /// information about one cache parameter group.
  final List<CacheParameterGroup> cacheParameterGroups;

  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

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
              .map((c) => CacheParameterGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
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
  final String arn;

  /// The name of the cache security group.
  final String cacheSecurityGroupName;

  /// The description of the cache security group.
  final String description;

  /// A list of Amazon EC2 security groups that are associated with this cache
  /// security group.
  final List<EC2SecurityGroup> eC2SecurityGroups;

  /// The AWS account ID of the cache security group owner.
  final String ownerId;

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
              .map((c) => EC2SecurityGroup.fromXml(c))
              .toList()),
      ownerId: _s.extractXmlStringValue(elem, 'OwnerId'),
    );
  }
}

/// Represents a cluster's status within a particular cache security group.
class CacheSecurityGroupMembership {
  /// The name of the cache security group.
  final String cacheSecurityGroupName;

  /// The membership status in the cache security group. The status changes when a
  /// cache security group is modified, or when the cache security groups assigned
  /// to a cluster are modified.
  final String status;

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
}

/// Represents the output of a <code>DescribeCacheSecurityGroups</code>
/// operation.
class CacheSecurityGroupMessage {
  /// A list of cache security groups. Each element in the list contains detailed
  /// information about one group.
  final List<CacheSecurityGroup> cacheSecurityGroups;

  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  CacheSecurityGroupMessage({
    this.cacheSecurityGroups,
    this.marker,
  });
  factory CacheSecurityGroupMessage.fromXml(_s.XmlElement elem) {
    return CacheSecurityGroupMessage(
      cacheSecurityGroups: _s.extractXmlChild(elem, 'CacheSecurityGroups')?.let(
          (elem) => elem
              .findElements('CacheSecurityGroup')
              .map((c) => CacheSecurityGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
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
  final String arn;

  /// The description of the cache subnet group.
  final String cacheSubnetGroupDescription;

  /// The name of the cache subnet group.
  final String cacheSubnetGroupName;

  /// A list of subnets associated with the cache subnet group.
  final List<Subnet> subnets;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet
  /// group.
  final String vpcId;

  CacheSubnetGroup({
    this.arn,
    this.cacheSubnetGroupDescription,
    this.cacheSubnetGroupName,
    this.subnets,
    this.vpcId,
  });
  factory CacheSubnetGroup.fromXml(_s.XmlElement elem) {
    return CacheSubnetGroup(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      cacheSubnetGroupDescription:
          _s.extractXmlStringValue(elem, 'CacheSubnetGroupDescription'),
      cacheSubnetGroupName:
          _s.extractXmlStringValue(elem, 'CacheSubnetGroupName'),
      subnets: _s.extractXmlChild(elem, 'Subnets')?.let((elem) =>
          elem.findElements('Subnet').map((c) => Subnet.fromXml(c)).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Represents the output of a <code>DescribeCacheSubnetGroups</code> operation.
class CacheSubnetGroupMessage {
  /// A list of cache subnet groups. Each element in the list contains detailed
  /// information about one group.
  final List<CacheSubnetGroup> cacheSubnetGroups;

  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  CacheSubnetGroupMessage({
    this.cacheSubnetGroups,
    this.marker,
  });
  factory CacheSubnetGroupMessage.fromXml(_s.XmlElement elem) {
    return CacheSubnetGroupMessage(
      cacheSubnetGroups: _s.extractXmlChild(elem, 'CacheSubnetGroups')?.let(
          (elem) => elem
              .findElements('CacheSubnetGroup')
              .map((c) => CacheSubnetGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

enum ChangeType {
  @_s.JsonValue('immediate')
  immediate,
  @_s.JsonValue('requires-reboot')
  requiresReboot,
}

extension on String {
  ChangeType toChangeType() {
    switch (this) {
      case 'immediate':
        return ChangeType.immediate;
      case 'requires-reboot':
        return ChangeType.requiresReboot;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class CompleteMigrationResponse {
  final ReplicationGroup replicationGroup;

  CompleteMigrationResponse({
    this.replicationGroup,
  });
  factory CompleteMigrationResponse.fromXml(_s.XmlElement elem) {
    return CompleteMigrationResponse(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let((e) => ReplicationGroup.fromXml(e)),
    );
  }
}

/// Node group (shard) configuration options when adding or removing replicas.
/// Each node group (shard) configuration has the following members:
/// NodeGroupId, NewReplicaCount, and PreferredAvailabilityZones.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'NewReplicaCount')
  final int newReplicaCount;

  /// The 4-digit id for the node group you are configuring. For Redis (cluster
  /// mode disabled) replication groups, the node group id is always 0001. To find
  /// a Redis (cluster mode enabled)'s node group's (shard's) id, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/shard-find-id.html">Finding
  /// a Shard's Id</a>.
  @_s.JsonKey(name: 'NodeGroupId')
  final String nodeGroupId;

  /// A list of <code>PreferredAvailabilityZone</code> strings that specify which
  /// availability zones the replication group's nodes are to be in. The nummber
  /// of <code>PreferredAvailabilityZone</code> values must equal the value of
  /// <code>NewReplicaCount</code> plus 1 to account for the primary node. If this
  /// member of <code>ReplicaConfiguration</code> is omitted, ElastiCache for
  /// Redis selects the availability zone for each of the replicas.
  @_s.JsonKey(name: 'PreferredAvailabilityZones')
  final List<String> preferredAvailabilityZones;

  /// The outpost ARNs in which the cache cluster is created.
  @_s.JsonKey(name: 'PreferredOutpostArns')
  final List<String> preferredOutpostArns;

  ConfigureShard({
    @_s.required this.newReplicaCount,
    @_s.required this.nodeGroupId,
    this.preferredAvailabilityZones,
    this.preferredOutpostArns,
  });
  Map<String, dynamic> toJson() => _$ConfigureShardToJson(this);
}

class CopySnapshotResult {
  final Snapshot snapshot;

  CopySnapshotResult({
    this.snapshot,
  });
  factory CopySnapshotResult.fromXml(_s.XmlElement elem) {
    return CopySnapshotResult(
      snapshot:
          _s.extractXmlChild(elem, 'Snapshot')?.let((e) => Snapshot.fromXml(e)),
    );
  }
}

class CreateCacheClusterResult {
  final CacheCluster cacheCluster;

  CreateCacheClusterResult({
    this.cacheCluster,
  });
  factory CreateCacheClusterResult.fromXml(_s.XmlElement elem) {
    return CreateCacheClusterResult(
      cacheCluster: _s
          .extractXmlChild(elem, 'CacheCluster')
          ?.let((e) => CacheCluster.fromXml(e)),
    );
  }
}

class CreateCacheParameterGroupResult {
  final CacheParameterGroup cacheParameterGroup;

  CreateCacheParameterGroupResult({
    this.cacheParameterGroup,
  });
  factory CreateCacheParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateCacheParameterGroupResult(
      cacheParameterGroup: _s
          .extractXmlChild(elem, 'CacheParameterGroup')
          ?.let((e) => CacheParameterGroup.fromXml(e)),
    );
  }
}

class CreateCacheSecurityGroupResult {
  final CacheSecurityGroup cacheSecurityGroup;

  CreateCacheSecurityGroupResult({
    this.cacheSecurityGroup,
  });
  factory CreateCacheSecurityGroupResult.fromXml(_s.XmlElement elem) {
    return CreateCacheSecurityGroupResult(
      cacheSecurityGroup: _s
          .extractXmlChild(elem, 'CacheSecurityGroup')
          ?.let((e) => CacheSecurityGroup.fromXml(e)),
    );
  }
}

class CreateCacheSubnetGroupResult {
  final CacheSubnetGroup cacheSubnetGroup;

  CreateCacheSubnetGroupResult({
    this.cacheSubnetGroup,
  });
  factory CreateCacheSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return CreateCacheSubnetGroupResult(
      cacheSubnetGroup: _s
          .extractXmlChild(elem, 'CacheSubnetGroup')
          ?.let((e) => CacheSubnetGroup.fromXml(e)),
    );
  }
}

class CreateGlobalReplicationGroupResult {
  final GlobalReplicationGroup globalReplicationGroup;

  CreateGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory CreateGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return CreateGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let((e) => GlobalReplicationGroup.fromXml(e)),
    );
  }
}

class CreateReplicationGroupResult {
  final ReplicationGroup replicationGroup;

  CreateReplicationGroupResult({
    this.replicationGroup,
  });
  factory CreateReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return CreateReplicationGroupResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let((e) => ReplicationGroup.fromXml(e)),
    );
  }
}

class CreateSnapshotResult {
  final Snapshot snapshot;

  CreateSnapshotResult({
    this.snapshot,
  });
  factory CreateSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateSnapshotResult(
      snapshot:
          _s.extractXmlChild(elem, 'Snapshot')?.let((e) => Snapshot.fromXml(e)),
    );
  }
}

/// The endpoint from which data should be migrated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CustomerNodeEndpoint {
  /// The address of the node endpoint
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The port of the node endpoint
  @_s.JsonKey(name: 'Port')
  final int port;

  CustomerNodeEndpoint({
    this.address,
    this.port,
  });
  Map<String, dynamic> toJson() => _$CustomerNodeEndpointToJson(this);
}

class DecreaseNodeGroupsInGlobalReplicationGroupResult {
  final GlobalReplicationGroup globalReplicationGroup;

  DecreaseNodeGroupsInGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory DecreaseNodeGroupsInGlobalReplicationGroupResult.fromXml(
      _s.XmlElement elem) {
    return DecreaseNodeGroupsInGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let((e) => GlobalReplicationGroup.fromXml(e)),
    );
  }
}

class DecreaseReplicaCountResult {
  final ReplicationGroup replicationGroup;

  DecreaseReplicaCountResult({
    this.replicationGroup,
  });
  factory DecreaseReplicaCountResult.fromXml(_s.XmlElement elem) {
    return DecreaseReplicaCountResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let((e) => ReplicationGroup.fromXml(e)),
    );
  }
}

class DeleteCacheClusterResult {
  final CacheCluster cacheCluster;

  DeleteCacheClusterResult({
    this.cacheCluster,
  });
  factory DeleteCacheClusterResult.fromXml(_s.XmlElement elem) {
    return DeleteCacheClusterResult(
      cacheCluster: _s
          .extractXmlChild(elem, 'CacheCluster')
          ?.let((e) => CacheCluster.fromXml(e)),
    );
  }
}

class DeleteGlobalReplicationGroupResult {
  final GlobalReplicationGroup globalReplicationGroup;

  DeleteGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory DeleteGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return DeleteGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let((e) => GlobalReplicationGroup.fromXml(e)),
    );
  }
}

class DeleteReplicationGroupResult {
  final ReplicationGroup replicationGroup;

  DeleteReplicationGroupResult({
    this.replicationGroup,
  });
  factory DeleteReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return DeleteReplicationGroupResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let((e) => ReplicationGroup.fromXml(e)),
    );
  }
}

class DeleteSnapshotResult {
  final Snapshot snapshot;

  DeleteSnapshotResult({
    this.snapshot,
  });
  factory DeleteSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteSnapshotResult(
      snapshot:
          _s.extractXmlChild(elem, 'Snapshot')?.let((e) => Snapshot.fromXml(e)),
    );
  }
}

class DescribeEngineDefaultParametersResult {
  final EngineDefaults engineDefaults;

  DescribeEngineDefaultParametersResult({
    this.engineDefaults,
  });
  factory DescribeEngineDefaultParametersResult.fromXml(_s.XmlElement elem) {
    return DescribeEngineDefaultParametersResult(
      engineDefaults: _s
          .extractXmlChild(elem, 'EngineDefaults')
          ?.let((e) => EngineDefaults.fromXml(e)),
    );
  }
}

class DescribeGlobalReplicationGroupsResult {
  /// Indicates the slot configuration and global identifier for each slice group.
  final List<GlobalReplicationGroup> globalReplicationGroups;

  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords. &gt;
  final String marker;

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
              .map((c) => GlobalReplicationGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Represents the output of a <code>DescribeSnapshots</code> operation.
class DescribeSnapshotsListMessage {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String marker;

  /// A list of snapshots. Each item in the list contains detailed information
  /// about one snapshot.
  final List<Snapshot> snapshots;

  DescribeSnapshotsListMessage({
    this.marker,
    this.snapshots,
  });
  factory DescribeSnapshotsListMessage.fromXml(_s.XmlElement elem) {
    return DescribeSnapshotsListMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      snapshots: _s.extractXmlChild(elem, 'Snapshots')?.let((elem) => elem
          .findElements('Snapshot')
          .map((c) => Snapshot.fromXml(c))
          .toList()),
    );
  }
}

class DescribeUserGroupsResult {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords. &gt;
  final String marker;

  /// Returns a list of user groups.
  final List<UserGroup> userGroups;

  DescribeUserGroupsResult({
    this.marker,
    this.userGroups,
  });
  factory DescribeUserGroupsResult.fromXml(_s.XmlElement elem) {
    return DescribeUserGroupsResult(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      userGroups: _s.extractXmlChild(elem, 'UserGroups')?.let((elem) => elem
          .findElements('member')
          .map((c) => UserGroup.fromXml(c))
          .toList()),
    );
  }
}

class DescribeUsersResult {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by MaxRecords. &gt;
  final String marker;

  /// A list of users.
  final List<User> users;

  DescribeUsersResult({
    this.marker,
    this.users,
  });
  factory DescribeUsersResult.fromXml(_s.XmlElement elem) {
    return DescribeUsersResult(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      users: _s.extractXmlChild(elem, 'Users')?.let((elem) =>
          elem.findElements('member').map((c) => User.fromXml(c)).toList()),
    );
  }
}

class DisassociateGlobalReplicationGroupResult {
  final GlobalReplicationGroup globalReplicationGroup;

  DisassociateGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory DisassociateGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return DisassociateGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let((e) => GlobalReplicationGroup.fromXml(e)),
    );
  }
}

/// Provides ownership and status information for an Amazon EC2 security group.
class EC2SecurityGroup {
  /// The name of the Amazon EC2 security group.
  final String eC2SecurityGroupName;

  /// The AWS account ID of the Amazon EC2 security group owner.
  final String eC2SecurityGroupOwnerId;

  /// The status of the Amazon EC2 security group.
  final String status;

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
}

/// Represents the information required for client programs to connect to a
/// cache node.
class Endpoint {
  /// The DNS hostname of the cache node.
  final String address;

  /// The port number that the cache engine is listening on.
  final int port;

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

/// Represents the output of a <code>DescribeEngineDefaultParameters</code>
/// operation.
class EngineDefaults {
  /// A list of parameters specific to a particular cache node type. Each element
  /// in the list contains detailed information about one parameter.
  final List<CacheNodeTypeSpecificParameter> cacheNodeTypeSpecificParameters;

  /// Specifies the name of the cache parameter group family to which the engine
  /// default parameters apply.
  ///
  /// Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> |
  /// <code>memcached1.6</code> | <code>redis2.6</code> | <code>redis2.8</code> |
  /// <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> |
  /// <code>redis6.x</code> |
  final String cacheParameterGroupFamily;

  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// Contains a list of engine default parameters.
  final List<Parameter> parameters;

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
              .map((c) => CacheNodeTypeSpecificParameter.fromXml(c))
              .toList()),
      cacheParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'CacheParameterGroupFamily'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }
}

/// Represents a single occurrence of something interesting within the system.
/// Some examples of events are creating a cluster, adding or removing a cache
/// node, or rebooting a node.
class Event {
  /// The date and time when the event occurred.
  final DateTime date;

  /// The text of the event.
  final String message;

  /// The identifier for the source of the event. For example, if the event
  /// occurred at the cluster level, the identifier would be the name of the
  /// cluster.
  final String sourceIdentifier;

  /// Specifies the origin of this event - a cluster, a parameter group, a
  /// security group, etc.
  final SourceType sourceType;

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
}

/// Represents the output of a <code>DescribeEvents</code> operation.
class EventsMessage {
  /// A list of events. Each element in the list contains detailed information
  /// about one event.
  final List<Event> events;

  /// Provides an identifier to allow retrieval of paginated results.
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

class FailoverGlobalReplicationGroupResult {
  final GlobalReplicationGroup globalReplicationGroup;

  FailoverGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory FailoverGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return FailoverGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let((e) => GlobalReplicationGroup.fromXml(e)),
    );
  }
}

/// Used to streamline results of a search based on the property being filtered.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The property being filtered. For example, UserId.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The property values to filter on. For example, "user-123".
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

/// Indicates the slot configuration and global identifier for a slice group.
class GlobalNodeGroup {
  /// The name of the global node group
  final String globalNodeGroupId;

  /// The keyspace for this node group
  final String slots;

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
}

/// Consists of a primary cluster that accepts writes and an associated
/// secondary cluster that resides in a different AWS region. The secondary
/// cluster accepts only reads. The primary cluster automatically replicates
/// updates to the secondary cluster.
///
/// <ul>
/// <li>
/// The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global
/// Datastore, which is what you use to associate a secondary cluster.
/// </li>
/// </ul>
class GlobalReplicationGroup {
  /// The ARN (Amazon Resource Name) of the global replication group.
  final String arn;

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
  final bool atRestEncryptionEnabled;

  /// A flag that enables using an <code>AuthToken</code> (password) when issuing
  /// Redis commands.
  ///
  /// Default: <code>false</code>
  final bool authTokenEnabled;

  /// The cache node type of the Global Datastore
  final String cacheNodeType;

  /// A flag that indicates whether the Global Datastore is cluster enabled.
  final bool clusterEnabled;

  /// The Elasticache engine. For Redis only.
  final String engine;

  /// The Elasticache Redis engine version.
  final String engineVersion;

  /// Indicates the slot configuration and global identifier for each slice group.
  final List<GlobalNodeGroup> globalNodeGroups;

  /// The optional description of the Global Datastore
  final String globalReplicationGroupDescription;

  /// The name of the Global Datastore
  final String globalReplicationGroupId;

  /// The replication groups that comprise the Global Datastore.
  final List<GlobalReplicationGroupMember> members;

  /// The status of the Global Datastore
  final String status;

  /// A flag that enables in-transit encryption when set to true. You cannot
  /// modify the value of <code>TransitEncryptionEnabled</code> after the cluster
  /// is created. To enable in-transit encryption on a cluster you must set
  /// <code>TransitEncryptionEnabled</code> to true when you create a cluster.
  final bool transitEncryptionEnabled;

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
              .map((c) => GlobalNodeGroup.fromXml(c))
              .toList()),
      globalReplicationGroupDescription:
          _s.extractXmlStringValue(elem, 'GlobalReplicationGroupDescription'),
      globalReplicationGroupId:
          _s.extractXmlStringValue(elem, 'GlobalReplicationGroupId'),
      members: _s.extractXmlChild(elem, 'Members')?.let((elem) => elem
          .findElements('GlobalReplicationGroupMember')
          .map((c) => GlobalReplicationGroupMember.fromXml(c))
          .toList()),
      status: _s.extractXmlStringValue(elem, 'Status'),
      transitEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'TransitEncryptionEnabled'),
    );
  }
}

/// The name of the Global Datastore and role of this replication group in the
/// Global Datastore.
class GlobalReplicationGroupInfo {
  /// The name of the Global Datastore
  final String globalReplicationGroupId;

  /// The role of the replication group in a Global Datastore. Can be primary or
  /// secondary.
  final String globalReplicationGroupMemberRole;

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
}

/// A member of a Global Datastore. It contains the Replication Group Id, the
/// AWS region and the role of the replication group.
class GlobalReplicationGroupMember {
  /// Indicates whether automatic failover is enabled for the replication group.
  final AutomaticFailoverStatus automaticFailover;

  /// The replication group id of the Global Datastore member.
  final String replicationGroupId;

  /// The AWS region of the Global Datastore member.
  final String replicationGroupRegion;

  /// Indicates the role of the replication group, primary or secondary.
  final String role;

  /// The status of the membership of the replication group.
  final String status;

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
}

class IncreaseNodeGroupsInGlobalReplicationGroupResult {
  final GlobalReplicationGroup globalReplicationGroup;

  IncreaseNodeGroupsInGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory IncreaseNodeGroupsInGlobalReplicationGroupResult.fromXml(
      _s.XmlElement elem) {
    return IncreaseNodeGroupsInGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let((e) => GlobalReplicationGroup.fromXml(e)),
    );
  }
}

class IncreaseReplicaCountResult {
  final ReplicationGroup replicationGroup;

  IncreaseReplicaCountResult({
    this.replicationGroup,
  });
  factory IncreaseReplicaCountResult.fromXml(_s.XmlElement elem) {
    return IncreaseReplicaCountResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let((e) => ReplicationGroup.fromXml(e)),
    );
  }
}

class ModifyCacheClusterResult {
  final CacheCluster cacheCluster;

  ModifyCacheClusterResult({
    this.cacheCluster,
  });
  factory ModifyCacheClusterResult.fromXml(_s.XmlElement elem) {
    return ModifyCacheClusterResult(
      cacheCluster: _s
          .extractXmlChild(elem, 'CacheCluster')
          ?.let((e) => CacheCluster.fromXml(e)),
    );
  }
}

class ModifyCacheSubnetGroupResult {
  final CacheSubnetGroup cacheSubnetGroup;

  ModifyCacheSubnetGroupResult({
    this.cacheSubnetGroup,
  });
  factory ModifyCacheSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyCacheSubnetGroupResult(
      cacheSubnetGroup: _s
          .extractXmlChild(elem, 'CacheSubnetGroup')
          ?.let((e) => CacheSubnetGroup.fromXml(e)),
    );
  }
}

class ModifyGlobalReplicationGroupResult {
  final GlobalReplicationGroup globalReplicationGroup;

  ModifyGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory ModifyGlobalReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let((e) => GlobalReplicationGroup.fromXml(e)),
    );
  }
}

class ModifyReplicationGroupResult {
  final ReplicationGroup replicationGroup;

  ModifyReplicationGroupResult({
    this.replicationGroup,
  });
  factory ModifyReplicationGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyReplicationGroupResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let((e) => ReplicationGroup.fromXml(e)),
    );
  }
}

class ModifyReplicationGroupShardConfigurationResult {
  final ReplicationGroup replicationGroup;

  ModifyReplicationGroupShardConfigurationResult({
    this.replicationGroup,
  });
  factory ModifyReplicationGroupShardConfigurationResult.fromXml(
      _s.XmlElement elem) {
    return ModifyReplicationGroupShardConfigurationResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let((e) => ReplicationGroup.fromXml(e)),
    );
  }
}

enum MultiAZStatus {
  @_s.JsonValue('enabled')
  enabled,
  @_s.JsonValue('disabled')
  disabled,
}

extension on String {
  MultiAZStatus toMultiAZStatus() {
    switch (this) {
      case 'enabled':
        return MultiAZStatus.enabled;
      case 'disabled':
        return MultiAZStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
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
  final String nodeGroupId;

  /// A list containing information about individual nodes within the node group
  /// (shard).
  final List<NodeGroupMember> nodeGroupMembers;

  /// The endpoint of the primary node in this node group (shard).
  final Endpoint primaryEndpoint;

  /// The endpoint of the replica nodes in this node group (shard).
  final Endpoint readerEndpoint;

  /// The keyspace for this node group (shard).
  final String slots;

  /// The current state of this replication group - <code>creating</code>,
  /// <code>available</code>, <code>modifying</code>, <code>deleting</code>.
  final String status;

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
              .map((c) => NodeGroupMember.fromXml(c))
              .toList()),
      primaryEndpoint: _s
          .extractXmlChild(elem, 'PrimaryEndpoint')
          ?.let((e) => Endpoint.fromXml(e)),
      readerEndpoint: _s
          .extractXmlChild(elem, 'ReaderEndpoint')
          ?.let((e) => Endpoint.fromXml(e)),
      slots: _s.extractXmlStringValue(elem, 'Slots'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Node group (shard) configuration options. Each node group (shard)
/// configuration has the following: <code>Slots</code>,
/// <code>PrimaryAvailabilityZone</code>, <code>ReplicaAvailabilityZones</code>,
/// <code>ReplicaCount</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NodeGroupConfiguration {
  /// Either the ElastiCache for Redis supplied 4-digit id or a user supplied id
  /// for the node group these configuration values apply to.
  @_s.JsonKey(name: 'NodeGroupId')
  final String nodeGroupId;

  /// The Availability Zone where the primary node of this node group (shard) is
  /// launched.
  @_s.JsonKey(name: 'PrimaryAvailabilityZone')
  final String primaryAvailabilityZone;

  /// The outpost ARN of the primary node.
  @_s.JsonKey(name: 'PrimaryOutpostArn')
  final String primaryOutpostArn;

  /// A list of Availability Zones to be used for the read replicas. The number of
  /// Availability Zones in this list must match the value of
  /// <code>ReplicaCount</code> or <code>ReplicasPerNodeGroup</code> if not
  /// specified.
  @_s.JsonKey(name: 'ReplicaAvailabilityZones')
  final List<String> replicaAvailabilityZones;

  /// The number of read replica nodes in this node group (shard).
  @_s.JsonKey(name: 'ReplicaCount')
  final int replicaCount;

  /// The outpost ARN of the node replicas.
  @_s.JsonKey(name: 'ReplicaOutpostArns')
  final List<String> replicaOutpostArns;

  /// A string that specifies the keyspace for a particular node group. Keyspaces
  /// range from 0 to 16,383. The string is in the format
  /// <code>startkey-endkey</code>.
  ///
  /// Example: <code>"0-3999"</code>
  @_s.JsonKey(name: 'Slots')
  final String slots;

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

  Map<String, dynamic> toJson() => _$NodeGroupConfigurationToJson(this);
}

/// Represents a single node within a node group (shard).
class NodeGroupMember {
  /// The ID of the cluster to which the node belongs.
  final String cacheClusterId;

  /// The ID of the node within its cluster. A node ID is a numeric identifier
  /// (0001, 0002, etc.).
  final String cacheNodeId;

  /// The role that is currently assigned to the node - <code>primary</code> or
  /// <code>replica</code>. This member is only applicable for Redis (cluster mode
  /// disabled) replication groups.
  final String currentRole;

  /// The name of the Availability Zone in which the node is located.
  final String preferredAvailabilityZone;

  /// The outpost ARN of the node group member.
  final String preferredOutpostArn;

  /// The information required for client programs to connect to a node for read
  /// operations. The read endpoint is only applicable on Redis (cluster mode
  /// disabled) clusters.
  final Endpoint readEndpoint;

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
      readEndpoint: _s
          .extractXmlChild(elem, 'ReadEndpoint')
          ?.let((e) => Endpoint.fromXml(e)),
    );
  }
}

/// The status of the service update on the node group member
class NodeGroupMemberUpdateStatus {
  /// The cache cluster ID
  final String cacheClusterId;

  /// The node ID of the cache cluster
  final String cacheNodeId;

  /// The deletion date of the node
  final DateTime nodeDeletionDate;

  /// The end date of the update for a node
  final DateTime nodeUpdateEndDate;

  /// Reflects whether the update was initiated by the customer or automatically
  /// applied
  final NodeUpdateInitiatedBy nodeUpdateInitiatedBy;

  /// The date when the update is triggered
  final DateTime nodeUpdateInitiatedDate;

  /// The start date of the update for a node
  final DateTime nodeUpdateStartDate;

  /// The update status of the node
  final NodeUpdateStatus nodeUpdateStatus;

  /// The date when the NodeUpdateStatus was last modified
  final DateTime nodeUpdateStatusModifiedDate;

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
}

/// The status of the service update on the node group
class NodeGroupUpdateStatus {
  /// The ID of the node group
  final String nodeGroupId;

  /// The status of the service update on the node group member
  final List<NodeGroupMemberUpdateStatus> nodeGroupMemberUpdateStatus;

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
              .map((c) => NodeGroupMemberUpdateStatus.fromXml(c))
              .toList()),
    );
  }
}

/// Represents an individual cache node in a snapshot of a cluster.
class NodeSnapshot {
  /// A unique identifier for the source cluster.
  final String cacheClusterId;

  /// The date and time when the cache node was created in the source cluster.
  final DateTime cacheNodeCreateTime;

  /// The cache node identifier for the node in the source cluster.
  final String cacheNodeId;

  /// The size of the cache on the source cache node.
  final String cacheSize;

  /// The configuration for the source node group (shard).
  final NodeGroupConfiguration nodeGroupConfiguration;

  /// A unique identifier for the source node group (shard).
  final String nodeGroupId;

  /// The date and time when the source node's metadata and cache data set was
  /// obtained for the snapshot.
  final DateTime snapshotCreateTime;

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
          ?.let((e) => NodeGroupConfiguration.fromXml(e)),
      nodeGroupId: _s.extractXmlStringValue(elem, 'NodeGroupId'),
      snapshotCreateTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotCreateTime'),
    );
  }
}

enum NodeUpdateInitiatedBy {
  @_s.JsonValue('system')
  system,
  @_s.JsonValue('customer')
  customer,
}

extension on String {
  NodeUpdateInitiatedBy toNodeUpdateInitiatedBy() {
    switch (this) {
      case 'system':
        return NodeUpdateInitiatedBy.system;
      case 'customer':
        return NodeUpdateInitiatedBy.customer;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum NodeUpdateStatus {
  @_s.JsonValue('not-applied')
  notApplied,
  @_s.JsonValue('waiting-to-start')
  waitingToStart,
  @_s.JsonValue('in-progress')
  inProgress,
  @_s.JsonValue('stopping')
  stopping,
  @_s.JsonValue('stopped')
  stopped,
  @_s.JsonValue('complete')
  complete,
}

extension on String {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a notification topic and its status. Notification topics are used
/// for publishing ElastiCache events to subscribers using Amazon Simple
/// Notification Service (SNS).
class NotificationConfiguration {
  /// The Amazon Resource Name (ARN) that identifies the topic.
  final String topicArn;

  /// The current state of the topic.
  final String topicStatus;

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
}

enum OutpostMode {
  @_s.JsonValue('single-outpost')
  singleOutpost,
  @_s.JsonValue('cross-outpost')
  crossOutpost,
}

extension on OutpostMode {
  String toValue() {
    switch (this) {
      case OutpostMode.singleOutpost:
        return 'single-outpost';
      case OutpostMode.crossOutpost:
        return 'cross-outpost';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OutpostMode toOutpostMode() {
    switch (this) {
      case 'single-outpost':
        return OutpostMode.singleOutpost;
      case 'cross-outpost':
        return OutpostMode.crossOutpost;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes an individual setting that controls some aspect of ElastiCache
/// behavior.
class Parameter {
  /// The valid range of values for the parameter.
  final String allowedValues;

  /// Indicates whether a change to the parameter is applied immediately or
  /// requires a reboot for the change to be applied. You can force a reboot or
  /// wait until the next maintenance window's reboot. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting
  /// a Cluster</a>.
  final ChangeType changeType;

  /// The valid data type for the parameter.
  final String dataType;

  /// A description of the parameter.
  final String description;

  /// Indicates whether (<code>true</code>) or not (<code>false</code>) the
  /// parameter can be modified. Some parameters have security or operational
  /// implications that prevent them from being changed.
  final bool isModifiable;

  /// The earliest cache engine version to which the parameter can apply.
  final String minimumEngineVersion;

  /// The name of the parameter.
  final String parameterName;

  /// The value of the parameter.
  final String parameterValue;

  /// The source of the parameter.
  final String source;

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
}

/// Describes a name-value pair that is used to update the value of a parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ParameterNameValue {
  /// The name of the parameter.
  @_s.JsonKey(name: 'ParameterName')
  final String parameterName;

  /// The value of the parameter.
  @_s.JsonKey(name: 'ParameterValue')
  final String parameterValue;

  ParameterNameValue({
    this.parameterName,
    this.parameterValue,
  });
  Map<String, dynamic> toJson() => _$ParameterNameValueToJson(this);
}

enum PendingAutomaticFailoverStatus {
  @_s.JsonValue('enabled')
  enabled,
  @_s.JsonValue('disabled')
  disabled,
}

extension on String {
  PendingAutomaticFailoverStatus toPendingAutomaticFailoverStatus() {
    switch (this) {
      case 'enabled':
        return PendingAutomaticFailoverStatus.enabled;
      case 'disabled':
        return PendingAutomaticFailoverStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A group of settings that are applied to the cluster in the future, or that
/// are currently being applied.
class PendingModifiedValues {
  /// The auth token status
  final AuthTokenUpdateStatus authTokenStatus;

  /// A list of cache node IDs that are being removed (or will be removed) from
  /// the cluster. A node ID is a 4-digit numeric identifier (0001, 0002, etc.).
  final List<String> cacheNodeIdsToRemove;

  /// The cache node type that this cluster or replication group is scaled to.
  final String cacheNodeType;

  /// The new cache engine version that the cluster runs.
  final String engineVersion;

  /// The new number of cache nodes for the cluster.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 20.
  final int numCacheNodes;

  PendingModifiedValues({
    this.authTokenStatus,
    this.cacheNodeIdsToRemove,
    this.cacheNodeType,
    this.engineVersion,
    this.numCacheNodes,
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
      numCacheNodes: _s.extractXmlIntValue(elem, 'NumCacheNodes'),
    );
  }
}

/// Update action that has been processed for the corresponding apply/stop
/// request
class ProcessedUpdateAction {
  /// The ID of the cache cluster
  final String cacheClusterId;

  /// The ID of the replication group
  final String replicationGroupId;

  /// The unique ID of the service update
  final String serviceUpdateName;

  /// The status of the update action on the Redis cluster
  final UpdateActionStatus updateActionStatus;

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
}

class PurchaseReservedCacheNodesOfferingResult {
  final ReservedCacheNode reservedCacheNode;

  PurchaseReservedCacheNodesOfferingResult({
    this.reservedCacheNode,
  });
  factory PurchaseReservedCacheNodesOfferingResult.fromXml(_s.XmlElement elem) {
    return PurchaseReservedCacheNodesOfferingResult(
      reservedCacheNode: _s
          .extractXmlChild(elem, 'ReservedCacheNode')
          ?.let((e) => ReservedCacheNode.fromXml(e)),
    );
  }
}

class RebalanceSlotsInGlobalReplicationGroupResult {
  final GlobalReplicationGroup globalReplicationGroup;

  RebalanceSlotsInGlobalReplicationGroupResult({
    this.globalReplicationGroup,
  });
  factory RebalanceSlotsInGlobalReplicationGroupResult.fromXml(
      _s.XmlElement elem) {
    return RebalanceSlotsInGlobalReplicationGroupResult(
      globalReplicationGroup: _s
          .extractXmlChild(elem, 'GlobalReplicationGroup')
          ?.let((e) => GlobalReplicationGroup.fromXml(e)),
    );
  }
}

class RebootCacheClusterResult {
  final CacheCluster cacheCluster;

  RebootCacheClusterResult({
    this.cacheCluster,
  });
  factory RebootCacheClusterResult.fromXml(_s.XmlElement elem) {
    return RebootCacheClusterResult(
      cacheCluster: _s
          .extractXmlChild(elem, 'CacheCluster')
          ?.let((e) => CacheCluster.fromXml(e)),
    );
  }
}

/// Contains the specific price and frequency of a recurring charges for a
/// reserved cache node, or for a reserved cache node offering.
class RecurringCharge {
  /// The monetary amount of the recurring charge.
  final double recurringChargeAmount;

  /// The frequency of the recurring charge.
  final String recurringChargeFrequency;

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

/// A list of the replication groups
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RegionalConfiguration {
  /// The name of the secondary cluster
  @_s.JsonKey(name: 'ReplicationGroupId')
  final String replicationGroupId;

  /// The AWS region where the cluster is stored
  @_s.JsonKey(name: 'ReplicationGroupRegion')
  final String replicationGroupRegion;

  /// A list of <code>PreferredAvailabilityZones</code> objects that specifies the
  /// configuration of a node group in the resharded cluster.
  @_s.JsonKey(name: 'ReshardingConfiguration')
  final List<ReshardingConfiguration> reshardingConfiguration;

  RegionalConfiguration({
    @_s.required this.replicationGroupId,
    @_s.required this.replicationGroupRegion,
    @_s.required this.reshardingConfiguration,
  });
  Map<String, dynamic> toJson() => _$RegionalConfigurationToJson(this);
}

/// Contains all of the attributes of a specific Redis replication group.
class ReplicationGroup {
  /// The ARN (Amazon Resource Name) of the replication group.
  final String arn;

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
  final bool atRestEncryptionEnabled;

  /// A flag that enables using an <code>AuthToken</code> (password) when issuing
  /// Redis commands.
  ///
  /// Default: <code>false</code>
  final bool authTokenEnabled;

  /// The date the auth token was last modified
  final DateTime authTokenLastModifiedDate;

  /// Indicates the status of automatic failover for this Redis replication group.
  final AutomaticFailoverStatus automaticFailover;

  /// The name of the compute and memory capacity node type for each node in the
  /// replication group.
  final String cacheNodeType;

  /// A flag indicating whether or not this replication group is cluster enabled;
  /// i.e., whether its data can be partitioned across multiple shards (API/CLI:
  /// node groups).
  ///
  /// Valid values: <code>true</code> | <code>false</code>
  final bool clusterEnabled;

  /// The configuration endpoint for this replication group. Use the configuration
  /// endpoint to connect to this replication group.
  final Endpoint configurationEndpoint;

  /// The user supplied description of the replication group.
  final String description;

  /// The name of the Global Datastore and role of this replication group in the
  /// Global Datastore.
  final GlobalReplicationGroupInfo globalReplicationGroupInfo;

  /// The ID of the KMS key used to encrypt the disk in the cluster.
  final String kmsKeyId;

  /// The names of all the cache clusters that are part of this replication group.
  final List<String> memberClusters;

  /// The outpost ARNs of the replication group's member clusters.
  final List<String> memberClustersOutpostArns;

  /// A flag indicating if you have Multi-AZ enabled to enhance fault tolerance.
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html">Minimizing
  /// Downtime: Multi-AZ</a>
  final MultiAZStatus multiAZ;

  /// A list of node groups in this replication group. For Redis (cluster mode
  /// disabled) replication groups, this is a single-element list. For Redis
  /// (cluster mode enabled) replication groups, the list contains an entry for
  /// each node group (shard).
  final List<NodeGroup> nodeGroups;

  /// A group of settings to be applied to the replication group, either
  /// immediately or during the next maintenance window.
  final ReplicationGroupPendingModifiedValues pendingModifiedValues;

  /// The identifier for the replication group.
  final String replicationGroupId;

  /// The number of days for which ElastiCache retains automatic cluster snapshots
  /// before deleting them. For example, if you set
  /// <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is
  /// retained for 5 days before being deleted.
  /// <important>
  /// If the value of <code>SnapshotRetentionLimit</code> is set to zero (0),
  /// backups are turned off.
  /// </important>
  final int snapshotRetentionLimit;

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
  final String snapshotWindow;

  /// The cluster ID that is used as the daily snapshot source for the replication
  /// group.
  final String snapshottingClusterId;

  /// The current state of this replication group - <code>creating</code>,
  /// <code>available</code>, <code>modifying</code>, <code>deleting</code>,
  /// <code>create-failed</code>, <code>snapshotting</code>.
  final String status;

  /// A flag that enables in-transit encryption when set to <code>true</code>.
  ///
  /// You cannot modify the value of <code>TransitEncryptionEnabled</code> after
  /// the cluster is created. To enable in-transit encryption on a cluster you
  /// must set <code>TransitEncryptionEnabled</code> to <code>true</code> when you
  /// create a cluster.
  ///
  /// <b>Required:</b> Only available when creating a replication group in an
  /// Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or
  /// later.
  ///
  /// Default: <code>false</code>
  final bool transitEncryptionEnabled;

  /// The list of user group IDs that have access to the replication group.
  final List<String> userGroupIds;

  ReplicationGroup({
    this.arn,
    this.atRestEncryptionEnabled,
    this.authTokenEnabled,
    this.authTokenLastModifiedDate,
    this.automaticFailover,
    this.cacheNodeType,
    this.clusterEnabled,
    this.configurationEndpoint,
    this.description,
    this.globalReplicationGroupInfo,
    this.kmsKeyId,
    this.memberClusters,
    this.memberClustersOutpostArns,
    this.multiAZ,
    this.nodeGroups,
    this.pendingModifiedValues,
    this.replicationGroupId,
    this.snapshotRetentionLimit,
    this.snapshotWindow,
    this.snapshottingClusterId,
    this.status,
    this.transitEncryptionEnabled,
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
      automaticFailover: _s
          .extractXmlStringValue(elem, 'AutomaticFailover')
          ?.toAutomaticFailoverStatus(),
      cacheNodeType: _s.extractXmlStringValue(elem, 'CacheNodeType'),
      clusterEnabled: _s.extractXmlBoolValue(elem, 'ClusterEnabled'),
      configurationEndpoint: _s
          .extractXmlChild(elem, 'ConfigurationEndpoint')
          ?.let((e) => Endpoint.fromXml(e)),
      description: _s.extractXmlStringValue(elem, 'Description'),
      globalReplicationGroupInfo: _s
          .extractXmlChild(elem, 'GlobalReplicationGroupInfo')
          ?.let((e) => GlobalReplicationGroupInfo.fromXml(e)),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      memberClusters: _s
          .extractXmlChild(elem, 'MemberClusters')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'ClusterId')),
      memberClustersOutpostArns: _s
          .extractXmlChild(elem, 'MemberClustersOutpostArns')
          ?.let((elem) => _s.extractXmlStringListValues(
              elem, 'ReplicationGroupOutpostArn')),
      multiAZ: _s.extractXmlStringValue(elem, 'MultiAZ')?.toMultiAZStatus(),
      nodeGroups: _s.extractXmlChild(elem, 'NodeGroups')?.let((elem) => elem
          .findElements('NodeGroup')
          .map((c) => NodeGroup.fromXml(c))
          .toList()),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let((e) => ReplicationGroupPendingModifiedValues.fromXml(e)),
      replicationGroupId: _s.extractXmlStringValue(elem, 'ReplicationGroupId'),
      snapshotRetentionLimit:
          _s.extractXmlIntValue(elem, 'SnapshotRetentionLimit'),
      snapshotWindow: _s.extractXmlStringValue(elem, 'SnapshotWindow'),
      snapshottingClusterId:
          _s.extractXmlStringValue(elem, 'SnapshottingClusterId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      transitEncryptionEnabled:
          _s.extractXmlBoolValue(elem, 'TransitEncryptionEnabled'),
      userGroupIds: _s
          .extractXmlChild(elem, 'UserGroupIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

/// Represents the output of a <code>DescribeReplicationGroups</code> operation.
class ReplicationGroupMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of replication groups. Each item in the list contains detailed
  /// information about one replication group.
  final List<ReplicationGroup> replicationGroups;

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
              .map((c) => ReplicationGroup.fromXml(c))
              .toList()),
    );
  }
}

/// The settings to be applied to the Redis replication group, either
/// immediately or during the next maintenance window.
class ReplicationGroupPendingModifiedValues {
  /// The auth token status
  final AuthTokenUpdateStatus authTokenStatus;

  /// Indicates the status of automatic failover for this Redis replication group.
  final PendingAutomaticFailoverStatus automaticFailoverStatus;

  /// The primary cluster ID that is applied immediately (if
  /// <code>--apply-immediately</code> was specified), or during the next
  /// maintenance window.
  final String primaryClusterId;

  /// The status of an online resharding operation.
  final ReshardingStatus resharding;

  /// The user groups being modified.
  final UserGroupsUpdateStatus userGroups;

  ReplicationGroupPendingModifiedValues({
    this.authTokenStatus,
    this.automaticFailoverStatus,
    this.primaryClusterId,
    this.resharding,
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
      primaryClusterId: _s.extractXmlStringValue(elem, 'PrimaryClusterId'),
      resharding: _s
          .extractXmlChild(elem, 'Resharding')
          ?.let((e) => ReshardingStatus.fromXml(e)),
      userGroups: _s
          .extractXmlChild(elem, 'UserGroups')
          ?.let((e) => UserGroupsUpdateStatus.fromXml(e)),
    );
  }
}

/// Represents the output of a <code>PurchaseReservedCacheNodesOffering</code>
/// operation.
class ReservedCacheNode {
  /// The number of cache nodes that have been reserved.
  final int cacheNodeCount;

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
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  /// <note>
  /// At this time, M6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
  /// </note>
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended)
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
  /// Previous generation: (not recommended)
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
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  /// <note>
  /// At this time, R6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
  /// </note>
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
  /// Previous generation: (not recommended)
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
  final String cacheNodeType;

  /// The duration of the reservation in seconds.
  final int duration;

  /// The fixed price charged for this reserved cache node.
  final double fixedPrice;

  /// The offering type of this reserved cache node.
  final String offeringType;

  /// The description of the reserved cache node.
  final String productDescription;

  /// The recurring price charged to run this reserved cache node.
  final List<RecurringCharge> recurringCharges;

  /// The Amazon Resource Name (ARN) of the reserved cache node.
  ///
  /// Example:
  /// <code>arn:aws:elasticache:us-east-1:123456789012:reserved-instance:ri-2017-03-27-08-33-25-582</code>
  final String reservationARN;

  /// The unique identifier for the reservation.
  final String reservedCacheNodeId;

  /// The offering identifier.
  final String reservedCacheNodesOfferingId;

  /// The time the reservation started.
  final DateTime startTime;

  /// The state of the reserved cache node.
  final String state;

  /// The hourly price charged for this reserved cache node.
  final double usagePrice;

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
              .map((c) => RecurringCharge.fromXml(c))
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
}

/// Represents the output of a <code>DescribeReservedCacheNodes</code>
/// operation.
class ReservedCacheNodeMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of reserved cache nodes. Each element in the list contains detailed
  /// information about one node.
  final List<ReservedCacheNode> reservedCacheNodes;

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
              .map((c) => ReservedCacheNode.fromXml(c))
              .toList()),
    );
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
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  /// <note>
  /// At this time, M6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
  /// </note>
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended)
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
  /// Previous generation: (not recommended)
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
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  /// <note>
  /// At this time, R6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
  /// </note>
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
  /// Previous generation: (not recommended)
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
  final String cacheNodeType;

  /// The duration of the offering. in seconds.
  final int duration;

  /// The fixed price charged for this offering.
  final double fixedPrice;

  /// The offering type.
  final String offeringType;

  /// The cache engine used by the offering.
  final String productDescription;

  /// The recurring price charged to run this reserved cache node.
  final List<RecurringCharge> recurringCharges;

  /// A unique identifier for the reserved cache node offering.
  final String reservedCacheNodesOfferingId;

  /// The hourly price charged for this offering.
  final double usagePrice;

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
              .map((c) => RecurringCharge.fromXml(c))
              .toList()),
      reservedCacheNodesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedCacheNodesOfferingId'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }
}

/// Represents the output of a <code>DescribeReservedCacheNodesOfferings</code>
/// operation.
class ReservedCacheNodesOfferingMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of reserved cache node offerings. Each element in the list contains
  /// detailed information about one offering.
  final List<ReservedCacheNodesOffering> reservedCacheNodesOfferings;

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
              .map((c) => ReservedCacheNodesOffering.fromXml(c))
              .toList()),
    );
  }
}

/// A list of <code>PreferredAvailabilityZones</code> objects that specifies the
/// configuration of a node group in the resharded cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReshardingConfiguration {
  /// Either the ElastiCache for Redis supplied 4-digit id or a user supplied id
  /// for the node group these configuration values apply to.
  @_s.JsonKey(name: 'NodeGroupId')
  final String nodeGroupId;

  /// A list of preferred availability zones for the nodes in this cluster.
  @_s.JsonKey(name: 'PreferredAvailabilityZones')
  final List<String> preferredAvailabilityZones;

  ReshardingConfiguration({
    this.nodeGroupId,
    this.preferredAvailabilityZones,
  });
  Map<String, dynamic> toJson() => _$ReshardingConfigurationToJson(this);
}

/// The status of an online resharding operation.
class ReshardingStatus {
  /// Represents the progress of an online resharding operation.
  final SlotMigration slotMigration;

  ReshardingStatus({
    this.slotMigration,
  });
  factory ReshardingStatus.fromXml(_s.XmlElement elem) {
    return ReshardingStatus(
      slotMigration: _s
          .extractXmlChild(elem, 'SlotMigration')
          ?.let((e) => SlotMigration.fromXml(e)),
    );
  }
}

class RevokeCacheSecurityGroupIngressResult {
  final CacheSecurityGroup cacheSecurityGroup;

  RevokeCacheSecurityGroupIngressResult({
    this.cacheSecurityGroup,
  });
  factory RevokeCacheSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return RevokeCacheSecurityGroupIngressResult(
      cacheSecurityGroup: _s
          .extractXmlChild(elem, 'CacheSecurityGroup')
          ?.let((e) => CacheSecurityGroup.fromXml(e)),
    );
  }
}

/// Represents a single cache security group and its status.
class SecurityGroupMembership {
  /// The identifier of the cache security group.
  final String securityGroupId;

  /// The status of the cache security group membership. The status changes
  /// whenever a cache security group is modified, or when the cache security
  /// groups assigned to a cluster are modified.
  final String status;

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
}

/// An update that you can apply to your Redis clusters.
class ServiceUpdate {
  /// Indicates whether the service update will be automatically applied once the
  /// recommended apply-by date has expired.
  final bool autoUpdateAfterRecommendedApplyByDate;

  /// The Elasticache engine to which the update applies. Either Redis or
  /// Memcached
  final String engine;

  /// The Elasticache engine version to which the update applies. Either Redis or
  /// Memcached engine version
  final String engineVersion;

  /// The estimated length of time the service update will take
  final String estimatedUpdateTime;

  /// Provides details of the service update
  final String serviceUpdateDescription;

  /// The date after which the service update is no longer available
  final DateTime serviceUpdateEndDate;

  /// The unique ID of the service update
  final String serviceUpdateName;

  /// The recommendend date to apply the service update in order to ensure
  /// compliance. For information on compliance, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service">Self-Service
  /// Security Updates for Compliance</a>.
  final DateTime serviceUpdateRecommendedApplyByDate;

  /// The date when the service update is initially available
  final DateTime serviceUpdateReleaseDate;

  /// The severity of the service update
  final ServiceUpdateSeverity serviceUpdateSeverity;

  /// The status of the service update
  final ServiceUpdateStatus serviceUpdateStatus;

  /// Reflects the nature of the service update
  final ServiceUpdateType serviceUpdateType;

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
}

enum ServiceUpdateSeverity {
  @_s.JsonValue('critical')
  critical,
  @_s.JsonValue('important')
  important,
  @_s.JsonValue('medium')
  medium,
  @_s.JsonValue('low')
  low,
}

extension on String {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ServiceUpdateStatus {
  @_s.JsonValue('available')
  available,
  @_s.JsonValue('cancelled')
  cancelled,
  @_s.JsonValue('expired')
  expired,
}

extension on ServiceUpdateStatus {
  String toValue() {
    switch (this) {
      case ServiceUpdateStatus.available:
        return 'available';
      case ServiceUpdateStatus.cancelled:
        return 'cancelled';
      case ServiceUpdateStatus.expired:
        return 'expired';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ServiceUpdateStatus toServiceUpdateStatus() {
    switch (this) {
      case 'available':
        return ServiceUpdateStatus.available;
      case 'cancelled':
        return ServiceUpdateStatus.cancelled;
      case 'expired':
        return ServiceUpdateStatus.expired;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ServiceUpdateType {
  @_s.JsonValue('security-update')
  securityUpdate,
}

extension on String {
  ServiceUpdateType toServiceUpdateType() {
    switch (this) {
      case 'security-update':
        return ServiceUpdateType.securityUpdate;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class ServiceUpdatesMessage {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String marker;

  /// A list of service updates
  final List<ServiceUpdate> serviceUpdates;

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
              .map((c) => ServiceUpdate.fromXml(c))
              .toList()),
    );
  }
}

enum SlaMet {
  @_s.JsonValue('yes')
  yes,
  @_s.JsonValue('no')
  no,
  @_s.JsonValue('n/a')
  na,
}

extension on String {
  SlaMet toSlaMet() {
    switch (this) {
      case 'yes':
        return SlaMet.yes;
      case 'no':
        return SlaMet.no;
      case 'n/a':
        return SlaMet.na;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the progress of an online resharding operation.
class SlotMigration {
  /// The percentage of the slot migration that is complete.
  final double progressPercentage;

  SlotMigration({
    this.progressPercentage,
  });
  factory SlotMigration.fromXml(_s.XmlElement elem) {
    return SlotMigration(
      progressPercentage: _s.extractXmlDoubleValue(elem, 'ProgressPercentage'),
    );
  }
}

/// Represents a copy of an entire Redis cluster as of the time when the
/// snapshot was taken.
class Snapshot {
  /// The ARN (Amazon Resource Name) of the snapshot.
  final String arn;

  /// This parameter is currently disabled.
  final bool autoMinorVersionUpgrade;

  /// Indicates the status of automatic failover for the source Redis replication
  /// group.
  final AutomaticFailoverStatus automaticFailover;

  /// The date and time when the source cluster was created.
  final DateTime cacheClusterCreateTime;

  /// The user-supplied identifier of the source cluster.
  final String cacheClusterId;

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
  /// <b>M6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.m6g.large</code>, <code>cache.m6g.xlarge</code>,
  /// <code>cache.m6g.2xlarge</code>, <code>cache.m6g.4xlarge</code>,
  /// <code>cache.m6g.8xlarge</code>, <code>cache.m6g.12xlarge</code>,
  /// <code>cache.m6g.16xlarge</code>
  /// <note>
  /// At this time, M6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
  /// </note>
  /// <b>M5 node types:</b> <code>cache.m5.large</code>,
  /// <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>,
  /// <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>,
  /// <code>cache.m5.24xlarge</code>
  ///
  /// <b>M4 node types:</b> <code>cache.m4.large</code>,
  /// <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>,
  /// <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code>
  ///
  /// <b>T3 node types:</b> <code>cache.t3.micro</code>,
  /// <code>cache.t3.small</code>, <code>cache.t3.medium</code>
  ///
  /// <b>T2 node types:</b> <code>cache.t2.micro</code>,
  /// <code>cache.t2.small</code>, <code>cache.t2.medium</code>
  /// </li>
  /// <li>
  /// Previous generation: (not recommended)
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
  /// Previous generation: (not recommended)
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
  /// <b>R6g node types</b> (available only for Redis engine version 5.0.6 onward
  /// and for Memcached engine version 1.5.16 onward).
  ///
  /// <code>cache.r6g.large</code>, <code>cache.r6g.xlarge</code>,
  /// <code>cache.r6g.2xlarge</code>, <code>cache.r6g.4xlarge</code>,
  /// <code>cache.r6g.8xlarge</code>, <code>cache.r6g.12xlarge</code>,
  /// <code>cache.r6g.16xlarge</code>
  /// <note>
  /// At this time, R6g node types are available in the following regions:
  /// us-east-1, us-west-2, us-east-2, eu-central-1, eu-west-1 and ap-northeast-1.
  /// </note>
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
  /// Previous generation: (not recommended)
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
  final String cacheNodeType;

  /// The cache parameter group that is associated with the source cluster.
  final String cacheParameterGroupName;

  /// The name of the cache subnet group associated with the source cluster.
  final String cacheSubnetGroupName;

  /// The name of the cache engine (<code>memcached</code> or <code>redis</code>)
  /// used by the source cluster.
  final String engine;

  /// The version of the cache engine version that is used by the source cluster.
  final String engineVersion;

  /// The ID of the KMS key used to encrypt the snapshot.
  final String kmsKeyId;

  /// A list of the cache nodes in the source cluster.
  final List<NodeSnapshot> nodeSnapshots;

  /// The number of cache nodes in the source cluster.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 20.
  final int numCacheNodes;

  /// The number of node groups (shards) in this snapshot. When restoring from a
  /// snapshot, the number of node groups (shards) in the snapshot and in the
  /// restored replication group must be the same.
  final int numNodeGroups;

  /// The port number used by each cache nodes in the source cluster.
  final int port;

  /// The name of the Availability Zone in which the source cluster is located.
  final String preferredAvailabilityZone;

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
  final String preferredMaintenanceWindow;

  /// The ARN (Amazon Resource Name) of the preferred outpost.
  final String preferredOutpostArn;

  /// A description of the source replication group.
  final String replicationGroupDescription;

  /// The unique identifier of the source replication group.
  final String replicationGroupId;

  /// The name of a snapshot. For an automatic snapshot, the name is
  /// system-generated. For a manual snapshot, this is the user-provided name.
  final String snapshotName;

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
  final int snapshotRetentionLimit;

  /// Indicates whether the snapshot is from an automatic backup
  /// (<code>automated</code>) or was created manually (<code>manual</code>).
  final String snapshotSource;

  /// The status of the snapshot. Valid values: <code>creating</code> |
  /// <code>available</code> | <code>restoring</code> | <code>copying</code> |
  /// <code>deleting</code>.
  final String snapshotStatus;

  /// The daily time range during which ElastiCache takes daily snapshots of the
  /// source cluster.
  final String snapshotWindow;

  /// The Amazon Resource Name (ARN) for the topic used by the source cluster for
  /// publishing notifications.
  final String topicArn;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet
  /// group for the source cluster.
  final String vpcId;

  Snapshot({
    this.arn,
    this.autoMinorVersionUpgrade,
    this.automaticFailover,
    this.cacheClusterCreateTime,
    this.cacheClusterId,
    this.cacheNodeType,
    this.cacheParameterGroupName,
    this.cacheSubnetGroupName,
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
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      kmsKeyId: _s.extractXmlStringValue(elem, 'KmsKeyId'),
      nodeSnapshots: _s.extractXmlChild(elem, 'NodeSnapshots')?.let((elem) =>
          elem
              .findElements('NodeSnapshot')
              .map((c) => NodeSnapshot.fromXml(c))
              .toList()),
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
}

enum SourceType {
  @_s.JsonValue('cache-cluster')
  cacheCluster,
  @_s.JsonValue('cache-parameter-group')
  cacheParameterGroup,
  @_s.JsonValue('cache-security-group')
  cacheSecurityGroup,
  @_s.JsonValue('cache-subnet-group')
  cacheSubnetGroup,
  @_s.JsonValue('replication-group')
  replicationGroup,
  @_s.JsonValue('user')
  user,
  @_s.JsonValue('user-group')
  userGroup,
}

extension on SourceType {
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
      case SourceType.user:
        return 'user';
      case SourceType.userGroup:
        return 'user-group';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
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
      case 'user':
        return SourceType.user;
      case 'user-group':
        return SourceType.userGroup;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class StartMigrationResponse {
  final ReplicationGroup replicationGroup;

  StartMigrationResponse({
    this.replicationGroup,
  });
  factory StartMigrationResponse.fromXml(_s.XmlElement elem) {
    return StartMigrationResponse(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let((e) => ReplicationGroup.fromXml(e)),
    );
  }
}

/// Represents the subnet associated with a cluster. This parameter refers to
/// subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used with
/// ElastiCache.
class Subnet {
  /// The Availability Zone associated with the subnet.
  final AvailabilityZone subnetAvailabilityZone;

  /// The unique identifier for the subnet.
  final String subnetIdentifier;

  /// The outpost ARN of the subnet.
  final SubnetOutpost subnetOutpost;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetOutpost,
  });
  factory Subnet.fromXml(_s.XmlElement elem) {
    return Subnet(
      subnetAvailabilityZone: _s
          .extractXmlChild(elem, 'SubnetAvailabilityZone')
          ?.let((e) => AvailabilityZone.fromXml(e)),
      subnetIdentifier: _s.extractXmlStringValue(elem, 'SubnetIdentifier'),
      subnetOutpost: _s
          .extractXmlChild(elem, 'SubnetOutpost')
          ?.let((e) => SubnetOutpost.fromXml(e)),
    );
  }
}

/// The ID of the outpost subnet.
class SubnetOutpost {
  /// The outpost ARN of the subnet.
  final String subnetOutpostArn;

  SubnetOutpost({
    this.subnetOutpostArn,
  });
  factory SubnetOutpost.fromXml(_s.XmlElement elem) {
    return SubnetOutpost(
      subnetOutpostArn: _s.extractXmlStringValue(elem, 'SubnetOutpostArn'),
    );
  }
}

/// A cost allocation Tag that can be added to an ElastiCache cluster or
/// replication group. Tags are composed of a Key/Value pair. A tag with a null
/// Value is permitted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  /// The key for the tag. May not be null.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The tag's value. May be null.
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

/// Represents the output from the <code>AddTagsToResource</code>,
/// <code>ListTagsForResource</code>, and <code>RemoveTagsFromResource</code>
/// operations.
class TagListMessage {
  /// A list of cost allocation tags as key-value pairs.
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

class TestFailoverResult {
  final ReplicationGroup replicationGroup;

  TestFailoverResult({
    this.replicationGroup,
  });
  factory TestFailoverResult.fromXml(_s.XmlElement elem) {
    return TestFailoverResult(
      replicationGroup: _s
          .extractXmlChild(elem, 'ReplicationGroup')
          ?.let((e) => ReplicationGroup.fromXml(e)),
    );
  }
}

/// Filters update actions from the service updates that are in available status
/// during the time range.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TimeRangeFilter {
  /// The end time of the time range filter
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The start time of the time range filter
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  TimeRangeFilter({
    this.endTime,
    this.startTime,
  });
  Map<String, dynamic> toJson() => _$TimeRangeFilterToJson(this);
}

/// Update action that has failed to be processed for the corresponding
/// apply/stop request
class UnprocessedUpdateAction {
  /// The ID of the cache cluster
  final String cacheClusterId;

  /// The error message that describes the reason the request was not processed
  final String errorMessage;

  /// The error type for requests that are not processed
  final String errorType;

  /// The replication group ID
  final String replicationGroupId;

  /// The unique ID of the service update
  final String serviceUpdateName;

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
}

/// The status of the service update for a specific replication group
class UpdateAction {
  /// The ID of the cache cluster
  final String cacheClusterId;

  /// The status of the service update on the cache node
  final List<CacheNodeUpdateStatus> cacheNodeUpdateStatus;

  /// The Elasticache engine to which the update applies. Either Redis or
  /// Memcached
  final String engine;

  /// The estimated length of time for the update to complete
  final String estimatedUpdateTime;

  /// The status of the service update on the node group
  final List<NodeGroupUpdateStatus> nodeGroupUpdateStatus;

  /// The progress of the service update on the replication group
  final String nodesUpdated;

  /// The ID of the replication group
  final String replicationGroupId;

  /// The unique ID of the service update
  final String serviceUpdateName;

  /// The recommended date to apply the service update to ensure compliance. For
  /// information on compliance, see <a
  /// href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service">Self-Service
  /// Security Updates for Compliance</a>.
  final DateTime serviceUpdateRecommendedApplyByDate;

  /// The date the update is first available
  final DateTime serviceUpdateReleaseDate;

  /// The severity of the service update
  final ServiceUpdateSeverity serviceUpdateSeverity;

  /// The status of the service update
  final ServiceUpdateStatus serviceUpdateStatus;

  /// Reflects the nature of the service update
  final ServiceUpdateType serviceUpdateType;

  /// If yes, all nodes in the replication group have been updated by the
  /// recommended apply-by date. If no, at least one node in the replication group
  /// have not been updated by the recommended apply-by date. If N/A, the
  /// replication group was created after the recommended apply-by date.
  final SlaMet slaMet;

  /// The date that the service update is available to a replication group
  final DateTime updateActionAvailableDate;

  /// The status of the update action
  final UpdateActionStatus updateActionStatus;

  /// The date when the UpdateActionStatus was last modified
  final DateTime updateActionStatusModifiedDate;

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
              .map((c) => CacheNodeUpdateStatus.fromXml(c))
              .toList()),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      estimatedUpdateTime:
          _s.extractXmlStringValue(elem, 'EstimatedUpdateTime'),
      nodeGroupUpdateStatus: _s
          .extractXmlChild(elem, 'NodeGroupUpdateStatus')
          ?.let((elem) => elem
              .findElements('NodeGroupUpdateStatus')
              .map((c) => NodeGroupUpdateStatus.fromXml(c))
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
}

class UpdateActionResultsMessage {
  /// Update actions that have been processed successfully
  final List<ProcessedUpdateAction> processedUpdateActions;

  /// Update actions that haven't been processed successfully
  final List<UnprocessedUpdateAction> unprocessedUpdateActions;

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
              .map((c) => ProcessedUpdateAction.fromXml(c))
              .toList()),
      unprocessedUpdateActions: _s
          .extractXmlChild(elem, 'UnprocessedUpdateActions')
          ?.let((elem) => elem
              .findElements('UnprocessedUpdateAction')
              .map((c) => UnprocessedUpdateAction.fromXml(c))
              .toList()),
    );
  }
}

enum UpdateActionStatus {
  @_s.JsonValue('not-applied')
  notApplied,
  @_s.JsonValue('waiting-to-start')
  waitingToStart,
  @_s.JsonValue('in-progress')
  inProgress,
  @_s.JsonValue('stopping')
  stopping,
  @_s.JsonValue('stopped')
  stopped,
  @_s.JsonValue('complete')
  complete,
  @_s.JsonValue('scheduling')
  scheduling,
  @_s.JsonValue('scheduled')
  scheduled,
  @_s.JsonValue('not-applicable')
  notApplicable,
}

extension on UpdateActionStatus {
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
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
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
    throw Exception('Unknown enum value: $this');
  }
}

class UpdateActionsMessage {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by <code>MaxRecords</code>.
  final String marker;

  /// Returns a list of update actions
  final List<UpdateAction> updateActions;

  UpdateActionsMessage({
    this.marker,
    this.updateActions,
  });
  factory UpdateActionsMessage.fromXml(_s.XmlElement elem) {
    return UpdateActionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      updateActions: _s.extractXmlChild(elem, 'UpdateActions')?.let((elem) =>
          elem
              .findElements('UpdateAction')
              .map((c) => UpdateAction.fromXml(c))
              .toList()),
    );
  }
}

class User {
  /// The Amazon Resource Name (ARN) of the user.
  final String arn;

  /// Access permissions string used for this user.
  final String accessString;

  /// Denotes whether the user requires a password to authenticate.
  final Authentication authentication;

  /// The current supported value is Redis.
  final String engine;

  /// Indicates the user status. Can be "active", "modifying" or "deleting".
  final String status;

  /// Returns a list of the user group IDs the user belongs to.
  final List<String> userGroupIds;

  /// The ID of the user.
  final String userId;

  /// The username of the user.
  final String userName;

  User({
    this.arn,
    this.accessString,
    this.authentication,
    this.engine,
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
          ?.let((e) => Authentication.fromXml(e)),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      userGroupIds: _s
          .extractXmlChild(elem, 'UserGroupIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      userId: _s.extractXmlStringValue(elem, 'UserId'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

class UserGroup {
  /// The Amazon Resource Name (ARN) of the user group.
  final String arn;

  /// The current supported value is Redis.
  final String engine;

  /// A list of updates being applied to the user groups.
  final UserGroupPendingChanges pendingChanges;

  /// A list of replication groups that the user group can access.
  final List<String> replicationGroups;

  /// Indicates user group status. Can be "creating", "active", "modifying",
  /// "deleting".
  final String status;

  /// The ID of the user group.
  final String userGroupId;

  /// The list of user IDs that belong to the user group.
  final List<String> userIds;

  UserGroup({
    this.arn,
    this.engine,
    this.pendingChanges,
    this.replicationGroups,
    this.status,
    this.userGroupId,
    this.userIds,
  });
  factory UserGroup.fromXml(_s.XmlElement elem) {
    return UserGroup(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      pendingChanges: _s
          .extractXmlChild(elem, 'PendingChanges')
          ?.let((e) => UserGroupPendingChanges.fromXml(e)),
      replicationGroups: _s
          .extractXmlChild(elem, 'ReplicationGroups')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      status: _s.extractXmlStringValue(elem, 'Status'),
      userGroupId: _s.extractXmlStringValue(elem, 'UserGroupId'),
      userIds: _s
          .extractXmlChild(elem, 'UserIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

/// Returns the updates being applied to the user group.
class UserGroupPendingChanges {
  /// The list of user IDs to add.
  final List<String> userIdsToAdd;

  /// The list of user IDs to remove.
  final List<String> userIdsToRemove;

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
}

/// The status of the user group update.
class UserGroupsUpdateStatus {
  /// The list of user group IDs to add.
  final List<String> userGroupIdsToAdd;

  /// The list of user group IDs to remove.
  final List<String> userGroupIdsToRemove;

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
}

class APICallRateForCustomerExceededFault extends _s.GenericAwsException {
  APICallRateForCustomerExceededFault({String type, String message})
      : super(
            type: type,
            code: 'APICallRateForCustomerExceededFault',
            message: message);
}

class AuthorizationAlreadyExistsFault extends _s.GenericAwsException {
  AuthorizationAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'AuthorizationAlreadyExistsFault',
            message: message);
}

class AuthorizationNotFoundFault extends _s.GenericAwsException {
  AuthorizationNotFoundFault({String type, String message})
      : super(type: type, code: 'AuthorizationNotFoundFault', message: message);
}

class CacheClusterAlreadyExistsFault extends _s.GenericAwsException {
  CacheClusterAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'CacheClusterAlreadyExistsFault',
            message: message);
}

class CacheClusterNotFoundFault extends _s.GenericAwsException {
  CacheClusterNotFoundFault({String type, String message})
      : super(type: type, code: 'CacheClusterNotFoundFault', message: message);
}

class CacheParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  CacheParameterGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'CacheParameterGroupAlreadyExistsFault',
            message: message);
}

class CacheParameterGroupNotFoundFault extends _s.GenericAwsException {
  CacheParameterGroupNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'CacheParameterGroupNotFoundFault',
            message: message);
}

class CacheParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  CacheParameterGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'CacheParameterGroupQuotaExceededFault',
            message: message);
}

class CacheSecurityGroupAlreadyExistsFault extends _s.GenericAwsException {
  CacheSecurityGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'CacheSecurityGroupAlreadyExistsFault',
            message: message);
}

class CacheSecurityGroupNotFoundFault extends _s.GenericAwsException {
  CacheSecurityGroupNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'CacheSecurityGroupNotFoundFault',
            message: message);
}

class CacheSecurityGroupQuotaExceededFault extends _s.GenericAwsException {
  CacheSecurityGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'CacheSecurityGroupQuotaExceededFault',
            message: message);
}

class CacheSubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  CacheSubnetGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'CacheSubnetGroupAlreadyExistsFault',
            message: message);
}

class CacheSubnetGroupInUse extends _s.GenericAwsException {
  CacheSubnetGroupInUse({String type, String message})
      : super(type: type, code: 'CacheSubnetGroupInUse', message: message);
}

class CacheSubnetGroupNotFoundFault extends _s.GenericAwsException {
  CacheSubnetGroupNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'CacheSubnetGroupNotFoundFault',
            message: message);
}

class CacheSubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  CacheSubnetGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'CacheSubnetGroupQuotaExceededFault',
            message: message);
}

class CacheSubnetQuotaExceededFault extends _s.GenericAwsException {
  CacheSubnetQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'CacheSubnetQuotaExceededFault',
            message: message);
}

class ClusterQuotaForCustomerExceededFault extends _s.GenericAwsException {
  ClusterQuotaForCustomerExceededFault({String type, String message})
      : super(
            type: type,
            code: 'ClusterQuotaForCustomerExceededFault',
            message: message);
}

class DefaultUserAssociatedToUserGroupFault extends _s.GenericAwsException {
  DefaultUserAssociatedToUserGroupFault({String type, String message})
      : super(
            type: type,
            code: 'DefaultUserAssociatedToUserGroupFault',
            message: message);
}

class DefaultUserRequired extends _s.GenericAwsException {
  DefaultUserRequired({String type, String message})
      : super(type: type, code: 'DefaultUserRequired', message: message);
}

class DuplicateUserNameFault extends _s.GenericAwsException {
  DuplicateUserNameFault({String type, String message})
      : super(type: type, code: 'DuplicateUserNameFault', message: message);
}

class GlobalReplicationGroupAlreadyExistsFault extends _s.GenericAwsException {
  GlobalReplicationGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'GlobalReplicationGroupAlreadyExistsFault',
            message: message);
}

class GlobalReplicationGroupNotFoundFault extends _s.GenericAwsException {
  GlobalReplicationGroupNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'GlobalReplicationGroupNotFoundFault',
            message: message);
}

class InsufficientCacheClusterCapacityFault extends _s.GenericAwsException {
  InsufficientCacheClusterCapacityFault({String type, String message})
      : super(
            type: type,
            code: 'InsufficientCacheClusterCapacityFault',
            message: message);
}

class InvalidARNFault extends _s.GenericAwsException {
  InvalidARNFault({String type, String message})
      : super(type: type, code: 'InvalidARNFault', message: message);
}

class InvalidCacheClusterStateFault extends _s.GenericAwsException {
  InvalidCacheClusterStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidCacheClusterStateFault',
            message: message);
}

class InvalidCacheParameterGroupStateFault extends _s.GenericAwsException {
  InvalidCacheParameterGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidCacheParameterGroupStateFault',
            message: message);
}

class InvalidCacheSecurityGroupStateFault extends _s.GenericAwsException {
  InvalidCacheSecurityGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidCacheSecurityGroupStateFault',
            message: message);
}

class InvalidGlobalReplicationGroupStateFault extends _s.GenericAwsException {
  InvalidGlobalReplicationGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidGlobalReplicationGroupStateFault',
            message: message);
}

class InvalidKMSKeyFault extends _s.GenericAwsException {
  InvalidKMSKeyFault({String type, String message})
      : super(type: type, code: 'InvalidKMSKeyFault', message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidReplicationGroupStateFault extends _s.GenericAwsException {
  InvalidReplicationGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidReplicationGroupStateFault',
            message: message);
}

class InvalidSnapshotStateFault extends _s.GenericAwsException {
  InvalidSnapshotStateFault({String type, String message})
      : super(type: type, code: 'InvalidSnapshotStateFault', message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String type, String message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class InvalidUserGroupStateFault extends _s.GenericAwsException {
  InvalidUserGroupStateFault({String type, String message})
      : super(type: type, code: 'InvalidUserGroupStateFault', message: message);
}

class InvalidUserStateFault extends _s.GenericAwsException {
  InvalidUserStateFault({String type, String message})
      : super(type: type, code: 'InvalidUserStateFault', message: message);
}

class InvalidVPCNetworkStateFault extends _s.GenericAwsException {
  InvalidVPCNetworkStateFault({String type, String message})
      : super(
            type: type, code: 'InvalidVPCNetworkStateFault', message: message);
}

class NoOperationFault extends _s.GenericAwsException {
  NoOperationFault({String type, String message})
      : super(type: type, code: 'NoOperationFault', message: message);
}

class NodeGroupNotFoundFault extends _s.GenericAwsException {
  NodeGroupNotFoundFault({String type, String message})
      : super(type: type, code: 'NodeGroupNotFoundFault', message: message);
}

class NodeGroupsPerReplicationGroupQuotaExceededFault
    extends _s.GenericAwsException {
  NodeGroupsPerReplicationGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'NodeGroupsPerReplicationGroupQuotaExceededFault',
            message: message);
}

class NodeQuotaForClusterExceededFault extends _s.GenericAwsException {
  NodeQuotaForClusterExceededFault({String type, String message})
      : super(
            type: type,
            code: 'NodeQuotaForClusterExceededFault',
            message: message);
}

class NodeQuotaForCustomerExceededFault extends _s.GenericAwsException {
  NodeQuotaForCustomerExceededFault({String type, String message})
      : super(
            type: type,
            code: 'NodeQuotaForCustomerExceededFault',
            message: message);
}

class ReplicationGroupAlreadyExistsFault extends _s.GenericAwsException {
  ReplicationGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'ReplicationGroupAlreadyExistsFault',
            message: message);
}

class ReplicationGroupAlreadyUnderMigrationFault
    extends _s.GenericAwsException {
  ReplicationGroupAlreadyUnderMigrationFault({String type, String message})
      : super(
            type: type,
            code: 'ReplicationGroupAlreadyUnderMigrationFault',
            message: message);
}

class ReplicationGroupNotFoundFault extends _s.GenericAwsException {
  ReplicationGroupNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'ReplicationGroupNotFoundFault',
            message: message);
}

class ReplicationGroupNotUnderMigrationFault extends _s.GenericAwsException {
  ReplicationGroupNotUnderMigrationFault({String type, String message})
      : super(
            type: type,
            code: 'ReplicationGroupNotUnderMigrationFault',
            message: message);
}

class ReservedCacheNodeAlreadyExistsFault extends _s.GenericAwsException {
  ReservedCacheNodeAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'ReservedCacheNodeAlreadyExistsFault',
            message: message);
}

class ReservedCacheNodeNotFoundFault extends _s.GenericAwsException {
  ReservedCacheNodeNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'ReservedCacheNodeNotFoundFault',
            message: message);
}

class ReservedCacheNodeQuotaExceededFault extends _s.GenericAwsException {
  ReservedCacheNodeQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'ReservedCacheNodeQuotaExceededFault',
            message: message);
}

class ReservedCacheNodesOfferingNotFoundFault extends _s.GenericAwsException {
  ReservedCacheNodesOfferingNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'ReservedCacheNodesOfferingNotFoundFault',
            message: message);
}

class ServiceLinkedRoleNotFoundFault extends _s.GenericAwsException {
  ServiceLinkedRoleNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'ServiceLinkedRoleNotFoundFault',
            message: message);
}

class ServiceUpdateNotFoundFault extends _s.GenericAwsException {
  ServiceUpdateNotFoundFault({String type, String message})
      : super(type: type, code: 'ServiceUpdateNotFoundFault', message: message);
}

class SnapshotAlreadyExistsFault extends _s.GenericAwsException {
  SnapshotAlreadyExistsFault({String type, String message})
      : super(type: type, code: 'SnapshotAlreadyExistsFault', message: message);
}

class SnapshotFeatureNotSupportedFault extends _s.GenericAwsException {
  SnapshotFeatureNotSupportedFault({String type, String message})
      : super(
            type: type,
            code: 'SnapshotFeatureNotSupportedFault',
            message: message);
}

class SnapshotNotFoundFault extends _s.GenericAwsException {
  SnapshotNotFoundFault({String type, String message})
      : super(type: type, code: 'SnapshotNotFoundFault', message: message);
}

class SnapshotQuotaExceededFault extends _s.GenericAwsException {
  SnapshotQuotaExceededFault({String type, String message})
      : super(type: type, code: 'SnapshotQuotaExceededFault', message: message);
}

class SubnetInUse extends _s.GenericAwsException {
  SubnetInUse({String type, String message})
      : super(type: type, code: 'SubnetInUse', message: message);
}

class SubnetNotAllowedFault extends _s.GenericAwsException {
  SubnetNotAllowedFault({String type, String message})
      : super(type: type, code: 'SubnetNotAllowedFault', message: message);
}

class TagNotFoundFault extends _s.GenericAwsException {
  TagNotFoundFault({String type, String message})
      : super(type: type, code: 'TagNotFoundFault', message: message);
}

class TagQuotaPerResourceExceeded extends _s.GenericAwsException {
  TagQuotaPerResourceExceeded({String type, String message})
      : super(
            type: type, code: 'TagQuotaPerResourceExceeded', message: message);
}

class TestFailoverNotAvailableFault extends _s.GenericAwsException {
  TestFailoverNotAvailableFault({String type, String message})
      : super(
            type: type,
            code: 'TestFailoverNotAvailableFault',
            message: message);
}

class UserAlreadyExistsFault extends _s.GenericAwsException {
  UserAlreadyExistsFault({String type, String message})
      : super(type: type, code: 'UserAlreadyExistsFault', message: message);
}

class UserGroupAlreadyExistsFault extends _s.GenericAwsException {
  UserGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type, code: 'UserGroupAlreadyExistsFault', message: message);
}

class UserGroupNotFoundFault extends _s.GenericAwsException {
  UserGroupNotFoundFault({String type, String message})
      : super(type: type, code: 'UserGroupNotFoundFault', message: message);
}

class UserGroupQuotaExceededFault extends _s.GenericAwsException {
  UserGroupQuotaExceededFault({String type, String message})
      : super(
            type: type, code: 'UserGroupQuotaExceededFault', message: message);
}

class UserNotFoundFault extends _s.GenericAwsException {
  UserNotFoundFault({String type, String message})
      : super(type: type, code: 'UserNotFoundFault', message: message);
}

class UserQuotaExceededFault extends _s.GenericAwsException {
  UserQuotaExceededFault({String type, String message})
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
