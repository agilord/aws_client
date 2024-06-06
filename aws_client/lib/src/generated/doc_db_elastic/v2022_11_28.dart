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

/// Amazon DocumentDB elastic-clusters support workloads with millions of
/// reads/writes per second and petabytes of storage capacity. Amazon DocumentDB
/// elastic clusters also simplify how developers interact with Amazon
/// DocumentDB elastic-clusters by eliminating the need to choose, manage or
/// upgrade instances.
class DocDBElastic {
  final _s.RestJsonProtocol _protocol;
  DocDBElastic({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'docdb-elastic',
            signingName: 'docdb-elastic',
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

  /// Copies a snapshot of an elastic cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [snapshotArn] :
  /// The Amazon Resource Name (ARN) identifier of the elastic cluster snapshot.
  ///
  /// Parameter [targetSnapshotName] :
  /// The identifier of the new elastic cluster snapshot to create from the
  /// source cluster snapshot. This parameter is not case sensitive.
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
  /// Example: <code>elastic-cluster-snapshot-5</code>
  ///
  /// Parameter [copyTags] :
  /// Set to <code>true</code> to copy all tags from the source cluster snapshot
  /// to the target elastic cluster snapshot. The default is <code>false</code>.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon Web Services KMS key ID for an encrypted elastic cluster
  /// snapshot. The Amazon Web Services KMS key ID is the Amazon Resource Name
  /// (ARN), Amazon Web Services KMS key identifier, or the Amazon Web Services
  /// KMS key alias for the Amazon Web Services KMS encryption key.
  ///
  /// If you copy an encrypted elastic cluster snapshot from your Amazon Web
  /// Services account, you can specify a value for <code>KmsKeyId</code> to
  /// encrypt the copy with a new Amazon Web ServicesS KMS encryption key. If
  /// you don't specify a value for <code>KmsKeyId</code>, then the copy of the
  /// elastic cluster snapshot is encrypted with the same <code>AWS</code> KMS
  /// key as the source elastic cluster snapshot.
  ///
  /// To copy an encrypted elastic cluster snapshot to another Amazon Web
  /// Services region, set <code>KmsKeyId</code> to the Amazon Web Services KMS
  /// key ID that you want to use to encrypt the copy of the elastic cluster
  /// snapshot in the destination region. Amazon Web Services KMS encryption
  /// keys are specific to the Amazon Web Services region that they are created
  /// in, and you can't use encryption keys from one Amazon Web Services region
  /// in another Amazon Web Services region.
  ///
  /// If you copy an unencrypted elastic cluster snapshot and specify a value
  /// for the <code>KmsKeyId</code> parameter, an error is returned.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the elastic cluster snapshot.
  Future<CopyClusterSnapshotOutput> copyClusterSnapshot({
    required String snapshotArn,
    required String targetSnapshotName,
    bool? copyTags,
    String? kmsKeyId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'targetSnapshotName': targetSnapshotName,
      if (copyTags != null) 'copyTags': copyTags,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cluster-snapshot/${Uri.encodeComponent(snapshotArn)}/copy',
      exceptionFnMap: _exceptionFns,
    );
    return CopyClusterSnapshotOutput.fromJson(response);
  }

  /// Creates a new Amazon DocumentDB elastic cluster and returns its cluster
  /// structure.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [adminUserName] :
  /// The name of the Amazon DocumentDB elastic clusters administrator.
  ///
  /// <i>Constraints</i>:
  ///
  /// <ul>
  /// <li>
  /// Must be from 1 to 63 letters or numbers.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Cannot be a reserved word.
  /// </li>
  /// </ul>
  ///
  /// Parameter [adminUserPassword] :
  /// The password for the Amazon DocumentDB elastic clusters administrator. The
  /// password can contain any printable ASCII characters.
  ///
  /// <i>Constraints</i>:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 8 to 100 characters.
  /// </li>
  /// <li>
  /// Cannot contain a forward slash (/), double quote ("), or the "at" symbol
  /// (@).
  /// </li>
  /// </ul>
  ///
  /// Parameter [authType] :
  /// The authentication type used to determine where to fetch the password used
  /// for accessing the elastic cluster. Valid types are <code>PLAIN_TEXT</code>
  /// or <code>SECRET_ARN</code>.
  ///
  /// Parameter [clusterName] :
  /// The name of the new elastic cluster. This parameter is stored as a
  /// lowercase string.
  ///
  /// <i>Constraints</i>:
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
  /// <i>Example</i>: <code>my-cluster</code>
  ///
  /// Parameter [shardCapacity] :
  /// The number of vCPUs assigned to each elastic cluster shard. Maximum is 64.
  /// Allowed values are 2, 4, 8, 16, 32, 64.
  ///
  /// Parameter [shardCount] :
  /// The number of shards assigned to the elastic cluster. Maximum is 32.
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automatic snapshots are retained.
  ///
  /// Parameter [clientToken] :
  /// The client token for the elastic cluster.
  ///
  /// Parameter [kmsKeyId] :
  /// The KMS key identifier to use to encrypt the new elastic cluster.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a cluster using the same Amazon
  /// account that owns this KMS encryption key, you can use the KMS key alias
  /// instead of the ARN as the KMS encryption key.
  ///
  /// If an encryption key is not specified, Amazon DocumentDB uses the default
  /// encryption key that KMS creates for your account. Your account has a
  /// different default encryption key for each Amazon Region.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled, as determined by the
  /// <code>backupRetentionPeriod</code>.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// <i>Format</i>: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// <i>Default</i>: a 30-minute window selected at random from an 8-hour block
  /// of time for each Amazon Web Services Region, occurring on a random day of
  /// the week.
  ///
  /// <i>Valid days</i>: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// <i>Constraints</i>: Minimum 30-minute window.
  ///
  /// Parameter [shardInstanceCount] :
  /// The number of replica instances applying to all shards in the elastic
  /// cluster. A <code>shardInstanceCount</code> value of 1 means there is one
  /// writer instance, and any additional instances are replicas that can be
  /// used for reads and to improve availability.
  ///
  /// Parameter [subnetIds] :
  /// The Amazon EC2 subnet IDs for the new elastic cluster.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the new elastic cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with the new elastic
  /// cluster.
  Future<CreateClusterOutput> createCluster({
    required String adminUserName,
    required String adminUserPassword,
    required Auth authType,
    required String clusterName,
    required int shardCapacity,
    required int shardCount,
    int? backupRetentionPeriod,
    String? clientToken,
    String? kmsKeyId,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    int? shardInstanceCount,
    List<String>? subnetIds,
    Map<String, String>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $payload = <String, dynamic>{
      'adminUserName': adminUserName,
      'adminUserPassword': adminUserPassword,
      'authType': authType.toValue(),
      'clusterName': clusterName,
      'shardCapacity': shardCapacity,
      'shardCount': shardCount,
      if (backupRetentionPeriod != null)
        'backupRetentionPeriod': backupRetentionPeriod,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (preferredBackupWindow != null)
        'preferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'preferredMaintenanceWindow': preferredMaintenanceWindow,
      if (shardInstanceCount != null) 'shardInstanceCount': shardInstanceCount,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cluster',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClusterOutput.fromJson(response);
  }

  /// Creates a snapshot of an elastic cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The ARN identifier of the elastic cluster of which you want to create a
  /// snapshot.
  ///
  /// Parameter [snapshotName] :
  /// The name of the new elastic cluster snapshot.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the new elastic cluster snapshot.
  Future<CreateClusterSnapshotOutput> createClusterSnapshot({
    required String clusterArn,
    required String snapshotName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clusterArn': clusterArn,
      'snapshotName': snapshotName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cluster-snapshot',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClusterSnapshotOutput.fromJson(response);
  }

  /// Delete an elastic cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The ARN identifier of the elastic cluster that is to be deleted.
  Future<DeleteClusterOutput> deleteCluster({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cluster/${Uri.encodeComponent(clusterArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteClusterOutput.fromJson(response);
  }

  /// Delete an elastic cluster snapshot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [snapshotArn] :
  /// The ARN identifier of the elastic cluster snapshot that is to be deleted.
  Future<DeleteClusterSnapshotOutput> deleteClusterSnapshot({
    required String snapshotArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cluster-snapshot/${Uri.encodeComponent(snapshotArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteClusterSnapshotOutput.fromJson(response);
  }

  /// Returns information about a specific elastic cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The ARN identifier of the elastic cluster.
  Future<GetClusterOutput> getCluster({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cluster/${Uri.encodeComponent(clusterArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetClusterOutput.fromJson(response);
  }

  /// Returns information about a specific elastic cluster snapshot
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [snapshotArn] :
  /// The ARN identifier of the elastic cluster snapshot.
  Future<GetClusterSnapshotOutput> getClusterSnapshot({
    required String snapshotArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cluster-snapshot/${Uri.encodeComponent(snapshotArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetClusterSnapshotOutput.fromJson(response);
  }

  /// Returns information about snapshots for a specified elastic cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The ARN identifier of the elastic cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elastic cluster snapshot results to receive in the
  /// response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token provided by a previous request. If this parameter is
  /// specified, the response includes only records beyond this token, up to the
  /// value specified by <code>max-results</code>.
  ///
  /// If there is no more data in the responce, the <code>nextToken</code> will
  /// not be returned.
  ///
  /// Parameter [snapshotType] :
  /// The type of cluster snapshots to be returned. You can specify one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>automated</code> - Return all cluster snapshots that Amazon
  /// DocumentDB has automatically created for your Amazon Web Services account.
  /// </li>
  /// <li>
  /// <code>manual</code> - Return all cluster snapshots that you have manually
  /// created for your Amazon Web Services account.
  /// </li>
  /// </ul>
  Future<ListClusterSnapshotsOutput> listClusterSnapshots({
    String? clusterArn,
    int? maxResults,
    String? nextToken,
    String? snapshotType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      20,
      100,
    );
    final $query = <String, List<String>>{
      if (clusterArn != null) 'clusterArn': [clusterArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (snapshotType != null) 'snapshotType': [snapshotType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cluster-snapshots',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClusterSnapshotsOutput.fromJson(response);
  }

  /// Returns information about provisioned Amazon DocumentDB elastic clusters.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elastic cluster snapshot results to receive in the
  /// response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token provided by a previous request. If this parameter is
  /// specified, the response includes only records beyond this token, up to the
  /// value specified by <code>max-results</code>.
  ///
  /// If there is no more data in the responce, the <code>nextToken</code> will
  /// not be returned.
  Future<ListClustersOutput> listClusters({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/clusters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClustersOutput.fromJson(response);
  }

  /// Lists all tags on a elastic cluster resource
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN identifier of the elastic cluster resource.
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

  /// Restores an elastic cluster from a snapshot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterName] :
  /// The name of the elastic cluster.
  ///
  /// Parameter [snapshotArn] :
  /// The ARN identifier of the elastic cluster snapshot.
  ///
  /// Parameter [kmsKeyId] :
  /// The KMS key identifier to use to encrypt the new Amazon DocumentDB elastic
  /// clusters cluster.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a cluster using the same Amazon
  /// account that owns this KMS encryption key, you can use the KMS key alias
  /// instead of the ARN as the KMS encryption key.
  ///
  /// If an encryption key is not specified here, Amazon DocumentDB uses the
  /// default encryption key that KMS creates for your account. Your account has
  /// a different default encryption key for each Amazon Region.
  ///
  /// Parameter [shardCapacity] :
  /// The capacity of each shard in the new restored elastic cluster.
  ///
  /// Parameter [shardInstanceCount] :
  /// The number of replica instances applying to all shards in the elastic
  /// cluster. A <code>shardInstanceCount</code> value of 1 means there is one
  /// writer instance, and any additional instances are replicas that can be
  /// used for reads and to improve availability.
  ///
  /// Parameter [subnetIds] :
  /// The Amazon EC2 subnet IDs for the elastic cluster.
  ///
  /// Parameter [tags] :
  /// A list of the tag names to be assigned to the restored elastic cluster, in
  /// the form of an array of key-value pairs in which the key is the tag name
  /// and the value is the key value.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with the elastic cluster.
  Future<RestoreClusterFromSnapshotOutput> restoreClusterFromSnapshot({
    required String clusterName,
    required String snapshotArn,
    String? kmsKeyId,
    int? shardCapacity,
    int? shardInstanceCount,
    List<String>? subnetIds,
    Map<String, String>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $payload = <String, dynamic>{
      'clusterName': clusterName,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (shardCapacity != null) 'shardCapacity': shardCapacity,
      if (shardInstanceCount != null) 'shardInstanceCount': shardInstanceCount,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/cluster-snapshot/${Uri.encodeComponent(snapshotArn)}/restore',
      exceptionFnMap: _exceptionFns,
    );
    return RestoreClusterFromSnapshotOutput.fromJson(response);
  }

  /// Restarts the stopped elastic cluster that is specified by
  /// <code>clusterARN</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The ARN identifier of the elastic cluster.
  Future<StartClusterOutput> startCluster({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/cluster/${Uri.encodeComponent(clusterArn)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartClusterOutput.fromJson(response);
  }

  /// Stops the running elastic cluster that is specified by
  /// <code>clusterArn</code>. The elastic cluster must be in the
  /// <i>available</i> state.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The ARN identifier of the elastic cluster.
  Future<StopClusterOutput> stopCluster({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/cluster/${Uri.encodeComponent(clusterArn)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopClusterOutput.fromJson(response);
  }

  /// Adds metadata tags to an elastic cluster resource
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN identifier of the elastic cluster resource.
  ///
  /// Parameter [tags] :
  /// The tags that are assigned to the elastic cluster resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes metadata tags from an elastic cluster resource
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN identifier of the elastic cluster resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to be removed from the elastic cluster resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Modifies an elastic cluster. This includes updating
  /// admin-username/password, upgrading the API version, and setting up a
  /// backup window and maintenance window
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The ARN identifier of the elastic cluster.
  ///
  /// Parameter [adminUserPassword] :
  /// The password associated with the elastic cluster administrator. This
  /// password can contain any printable ASCII character except forward slash
  /// (/), double quote ("), or the "at" symbol (@).
  ///
  /// <i>Constraints</i>: Must contain from 8 to 100 characters.
  ///
  /// Parameter [authType] :
  /// The authentication type used to determine where to fetch the password used
  /// for accessing the elastic cluster. Valid types are <code>PLAIN_TEXT</code>
  /// or <code>SECRET_ARN</code>.
  ///
  /// Parameter [backupRetentionPeriod] :
  /// The number of days for which automatic snapshots are retained.
  ///
  /// Parameter [clientToken] :
  /// The client token for the elastic cluster.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created if
  /// automated backups are enabled, as determined by the
  /// <code>backupRetentionPeriod</code>.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// <i>Format</i>: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// <i>Default</i>: a 30-minute window selected at random from an 8-hour block
  /// of time for each Amazon Web Services Region, occurring on a random day of
  /// the week.
  ///
  /// <i>Valid days</i>: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// <i>Constraints</i>: Minimum 30-minute window.
  ///
  /// Parameter [shardCapacity] :
  /// The number of vCPUs assigned to each elastic cluster shard. Maximum is 64.
  /// Allowed values are 2, 4, 8, 16, 32, 64.
  ///
  /// Parameter [shardCount] :
  /// The number of shards assigned to the elastic cluster. Maximum is 32.
  ///
  /// Parameter [shardInstanceCount] :
  /// The number of replica instances applying to all shards in the elastic
  /// cluster. A <code>shardInstanceCount</code> value of 1 means there is one
  /// writer instance, and any additional instances are replicas that can be
  /// used for reads and to improve availability.
  ///
  /// Parameter [subnetIds] :
  /// The Amazon EC2 subnet IDs for the elastic cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with the elastic cluster.
  Future<UpdateClusterOutput> updateCluster({
    required String clusterArn,
    String? adminUserPassword,
    Auth? authType,
    int? backupRetentionPeriod,
    String? clientToken,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    int? shardCapacity,
    int? shardCount,
    int? shardInstanceCount,
    List<String>? subnetIds,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $payload = <String, dynamic>{
      if (adminUserPassword != null) 'adminUserPassword': adminUserPassword,
      if (authType != null) 'authType': authType.toValue(),
      if (backupRetentionPeriod != null)
        'backupRetentionPeriod': backupRetentionPeriod,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (preferredBackupWindow != null)
        'preferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'preferredMaintenanceWindow': preferredMaintenanceWindow,
      if (shardCapacity != null) 'shardCapacity': shardCapacity,
      if (shardCount != null) 'shardCount': shardCount,
      if (shardInstanceCount != null) 'shardInstanceCount': shardInstanceCount,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cluster/${Uri.encodeComponent(clusterArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateClusterOutput.fromJson(response);
  }
}

enum Auth {
  plainText,
  secretArn,
}

extension AuthValueExtension on Auth {
  String toValue() {
    switch (this) {
      case Auth.plainText:
        return 'PLAIN_TEXT';
      case Auth.secretArn:
        return 'SECRET_ARN';
    }
  }
}

extension AuthFromString on String {
  Auth toAuth() {
    switch (this) {
      case 'PLAIN_TEXT':
        return Auth.plainText;
      case 'SECRET_ARN':
        return Auth.secretArn;
    }
    throw Exception('$this is not known in enum Auth');
  }
}

/// Returns information about a specific elastic cluster.
class Cluster {
  /// The name of the elastic cluster administrator.
  final String adminUserName;

  /// The authentication type for the elastic cluster.
  final Auth authType;

  /// The ARN identifier of the elastic cluster.
  final String clusterArn;

  /// The URL used to connect to the elastic cluster.
  final String clusterEndpoint;

  /// The name of the elastic cluster.
  final String clusterName;

  /// The time when the elastic cluster was created in Universal Coordinated Time
  /// (UTC).
  final String createTime;

  /// The KMS key identifier to use to encrypt the elastic cluster.
  final String kmsKeyId;

  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// <i>Format</i>: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  final String preferredMaintenanceWindow;

  /// The number of vCPUs assigned to each elastic cluster shard. Maximum is 64.
  /// Allowed values are 2, 4, 8, 16, 32, 64.
  final int shardCapacity;

  /// The number of shards assigned to the elastic cluster. Maximum is 32.
  final int shardCount;

  /// The status of the elastic cluster.
  final Status status;

  /// The Amazon EC2 subnet IDs for the elastic cluster.
  final List<String> subnetIds;

  /// A list of EC2 VPC security groups associated with thie elastic cluster.
  final List<String> vpcSecurityGroupIds;

  /// The number of days for which automatic snapshots are retained.
  final int? backupRetentionPeriod;

  /// The daily time range during which automated backups are created if automated
  /// backups are enabled, as determined by <code>backupRetentionPeriod</code>.
  final String? preferredBackupWindow;

  /// The number of replica instances applying to all shards in the cluster. A
  /// <code>shardInstanceCount</code> value of 1 means there is one writer
  /// instance, and any additional instances are replicas that can be used for
  /// reads and to improve availability.
  final int? shardInstanceCount;

  /// The total number of shards in the cluster.
  final List<Shard>? shards;

  Cluster({
    required this.adminUserName,
    required this.authType,
    required this.clusterArn,
    required this.clusterEndpoint,
    required this.clusterName,
    required this.createTime,
    required this.kmsKeyId,
    required this.preferredMaintenanceWindow,
    required this.shardCapacity,
    required this.shardCount,
    required this.status,
    required this.subnetIds,
    required this.vpcSecurityGroupIds,
    this.backupRetentionPeriod,
    this.preferredBackupWindow,
    this.shardInstanceCount,
    this.shards,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      adminUserName: json['adminUserName'] as String,
      authType: (json['authType'] as String).toAuth(),
      clusterArn: json['clusterArn'] as String,
      clusterEndpoint: json['clusterEndpoint'] as String,
      clusterName: json['clusterName'] as String,
      createTime: json['createTime'] as String,
      kmsKeyId: json['kmsKeyId'] as String,
      preferredMaintenanceWindow: json['preferredMaintenanceWindow'] as String,
      shardCapacity: json['shardCapacity'] as int,
      shardCount: json['shardCount'] as int,
      status: (json['status'] as String).toStatus(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      backupRetentionPeriod: json['backupRetentionPeriod'] as int?,
      preferredBackupWindow: json['preferredBackupWindow'] as String?,
      shardInstanceCount: json['shardInstanceCount'] as int?,
      shards: (json['shards'] as List?)
          ?.whereNotNull()
          .map((e) => Shard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final adminUserName = this.adminUserName;
    final authType = this.authType;
    final clusterArn = this.clusterArn;
    final clusterEndpoint = this.clusterEndpoint;
    final clusterName = this.clusterName;
    final createTime = this.createTime;
    final kmsKeyId = this.kmsKeyId;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final shardCapacity = this.shardCapacity;
    final shardCount = this.shardCount;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcSecurityGroupIds = this.vpcSecurityGroupIds;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final preferredBackupWindow = this.preferredBackupWindow;
    final shardInstanceCount = this.shardInstanceCount;
    final shards = this.shards;
    return {
      'adminUserName': adminUserName,
      'authType': authType.toValue(),
      'clusterArn': clusterArn,
      'clusterEndpoint': clusterEndpoint,
      'clusterName': clusterName,
      'createTime': createTime,
      'kmsKeyId': kmsKeyId,
      'preferredMaintenanceWindow': preferredMaintenanceWindow,
      'shardCapacity': shardCapacity,
      'shardCount': shardCount,
      'status': status.toValue(),
      'subnetIds': subnetIds,
      'vpcSecurityGroupIds': vpcSecurityGroupIds,
      if (backupRetentionPeriod != null)
        'backupRetentionPeriod': backupRetentionPeriod,
      if (preferredBackupWindow != null)
        'preferredBackupWindow': preferredBackupWindow,
      if (shardInstanceCount != null) 'shardInstanceCount': shardInstanceCount,
      if (shards != null) 'shards': shards,
    };
  }
}

/// A list of Amazon DocumentDB elastic clusters.
class ClusterInList {
  /// The ARN identifier of the elastic cluster.
  final String clusterArn;

  /// The name of the elastic cluster.
  final String clusterName;

  /// The status of the elastic cluster.
  final Status status;

  ClusterInList({
    required this.clusterArn,
    required this.clusterName,
    required this.status,
  });

  factory ClusterInList.fromJson(Map<String, dynamic> json) {
    return ClusterInList(
      clusterArn: json['clusterArn'] as String,
      clusterName: json['clusterName'] as String,
      status: (json['status'] as String).toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterName = this.clusterName;
    final status = this.status;
    return {
      'clusterArn': clusterArn,
      'clusterName': clusterName,
      'status': status.toValue(),
    };
  }
}

/// Returns information about a specific elastic cluster snapshot.
class ClusterSnapshot {
  /// The name of the elastic cluster administrator.
  final String adminUserName;

  /// The ARN identifier of the elastic cluster.
  final String clusterArn;

  /// The time when the elastic cluster was created in Universal Coordinated Time
  /// (UTC).
  final String clusterCreationTime;

  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a cluster using the same Amazon account
  /// that owns this KMS encryption key, you can use the KMS key alias instead of
  /// the ARN as the KMS encryption key. If an encryption key is not specified
  /// here, Amazon DocumentDB uses the default encryption key that KMS creates for
  /// your account. Your account has a different default encryption key for each
  /// Amazon Region.
  final String kmsKeyId;

  /// The ARN identifier of the elastic cluster snapshot.
  final String snapshotArn;

  /// The time when the elastic cluster snapshot was created in Universal
  /// Coordinated Time (UTC).
  final String snapshotCreationTime;

  /// The name of the elastic cluster snapshot.
  final String snapshotName;

  /// The status of the elastic cluster snapshot.
  final Status status;

  /// The Amazon EC2 subnet IDs for the elastic cluster.
  final List<String> subnetIds;

  /// A list of EC2 VPC security groups to associate with the elastic cluster.
  final List<String> vpcSecurityGroupIds;

  /// The type of cluster snapshots to be returned. You can specify one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>automated</code> - Return all cluster snapshots that Amazon DocumentDB
  /// has automatically created for your Amazon Web Services account.
  /// </li>
  /// <li>
  /// <code>manual</code> - Return all cluster snapshots that you have manually
  /// created for your Amazon Web Services account.
  /// </li>
  /// </ul>
  final SnapshotType? snapshotType;

  ClusterSnapshot({
    required this.adminUserName,
    required this.clusterArn,
    required this.clusterCreationTime,
    required this.kmsKeyId,
    required this.snapshotArn,
    required this.snapshotCreationTime,
    required this.snapshotName,
    required this.status,
    required this.subnetIds,
    required this.vpcSecurityGroupIds,
    this.snapshotType,
  });

  factory ClusterSnapshot.fromJson(Map<String, dynamic> json) {
    return ClusterSnapshot(
      adminUserName: json['adminUserName'] as String,
      clusterArn: json['clusterArn'] as String,
      clusterCreationTime: json['clusterCreationTime'] as String,
      kmsKeyId: json['kmsKeyId'] as String,
      snapshotArn: json['snapshotArn'] as String,
      snapshotCreationTime: json['snapshotCreationTime'] as String,
      snapshotName: json['snapshotName'] as String,
      status: (json['status'] as String).toStatus(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      snapshotType: (json['snapshotType'] as String?)?.toSnapshotType(),
    );
  }

  Map<String, dynamic> toJson() {
    final adminUserName = this.adminUserName;
    final clusterArn = this.clusterArn;
    final clusterCreationTime = this.clusterCreationTime;
    final kmsKeyId = this.kmsKeyId;
    final snapshotArn = this.snapshotArn;
    final snapshotCreationTime = this.snapshotCreationTime;
    final snapshotName = this.snapshotName;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcSecurityGroupIds = this.vpcSecurityGroupIds;
    final snapshotType = this.snapshotType;
    return {
      'adminUserName': adminUserName,
      'clusterArn': clusterArn,
      'clusterCreationTime': clusterCreationTime,
      'kmsKeyId': kmsKeyId,
      'snapshotArn': snapshotArn,
      'snapshotCreationTime': snapshotCreationTime,
      'snapshotName': snapshotName,
      'status': status.toValue(),
      'subnetIds': subnetIds,
      'vpcSecurityGroupIds': vpcSecurityGroupIds,
      if (snapshotType != null) 'snapshotType': snapshotType.toValue(),
    };
  }
}

/// A list of elastic cluster snapshots.
class ClusterSnapshotInList {
  /// The ARN identifier of the elastic cluster.
  final String clusterArn;

  /// The ARN identifier of the elastic cluster snapshot.
  final String snapshotArn;

  /// The time when the elastic cluster snapshot was created in Universal
  /// Coordinated Time (UTC).
  final String snapshotCreationTime;

  /// The name of the elastic cluster snapshot.
  final String snapshotName;

  /// The status of the elastic cluster snapshot.
  final Status status;

  ClusterSnapshotInList({
    required this.clusterArn,
    required this.snapshotArn,
    required this.snapshotCreationTime,
    required this.snapshotName,
    required this.status,
  });

  factory ClusterSnapshotInList.fromJson(Map<String, dynamic> json) {
    return ClusterSnapshotInList(
      clusterArn: json['clusterArn'] as String,
      snapshotArn: json['snapshotArn'] as String,
      snapshotCreationTime: json['snapshotCreationTime'] as String,
      snapshotName: json['snapshotName'] as String,
      status: (json['status'] as String).toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final snapshotArn = this.snapshotArn;
    final snapshotCreationTime = this.snapshotCreationTime;
    final snapshotName = this.snapshotName;
    final status = this.status;
    return {
      'clusterArn': clusterArn,
      'snapshotArn': snapshotArn,
      'snapshotCreationTime': snapshotCreationTime,
      'snapshotName': snapshotName,
      'status': status.toValue(),
    };
  }
}

class CopyClusterSnapshotOutput {
  final ClusterSnapshot snapshot;

  CopyClusterSnapshotOutput({
    required this.snapshot,
  });

  factory CopyClusterSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return CopyClusterSnapshotOutput(
      snapshot:
          ClusterSnapshot.fromJson(json['snapshot'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      'snapshot': snapshot,
    };
  }
}

class CreateClusterOutput {
  /// The new elastic cluster that has been created.
  final Cluster cluster;

  CreateClusterOutput({
    required this.cluster,
  });

  factory CreateClusterOutput.fromJson(Map<String, dynamic> json) {
    return CreateClusterOutput(
      cluster: Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

class CreateClusterSnapshotOutput {
  /// Returns information about the new elastic cluster snapshot.
  final ClusterSnapshot snapshot;

  CreateClusterSnapshotOutput({
    required this.snapshot,
  });

  factory CreateClusterSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return CreateClusterSnapshotOutput(
      snapshot:
          ClusterSnapshot.fromJson(json['snapshot'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      'snapshot': snapshot,
    };
  }
}

class DeleteClusterOutput {
  /// Returns information about the newly deleted elastic cluster.
  final Cluster cluster;

  DeleteClusterOutput({
    required this.cluster,
  });

  factory DeleteClusterOutput.fromJson(Map<String, dynamic> json) {
    return DeleteClusterOutput(
      cluster: Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

class DeleteClusterSnapshotOutput {
  /// Returns information about the newly deleted elastic cluster snapshot.
  final ClusterSnapshot snapshot;

  DeleteClusterSnapshotOutput({
    required this.snapshot,
  });

  factory DeleteClusterSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return DeleteClusterSnapshotOutput(
      snapshot:
          ClusterSnapshot.fromJson(json['snapshot'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      'snapshot': snapshot,
    };
  }
}

class GetClusterOutput {
  /// Returns information about a specific elastic cluster.
  final Cluster cluster;

  GetClusterOutput({
    required this.cluster,
  });

  factory GetClusterOutput.fromJson(Map<String, dynamic> json) {
    return GetClusterOutput(
      cluster: Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

class GetClusterSnapshotOutput {
  /// Returns information about a specific elastic cluster snapshot.
  final ClusterSnapshot snapshot;

  GetClusterSnapshotOutput({
    required this.snapshot,
  });

  factory GetClusterSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return GetClusterSnapshotOutput(
      snapshot:
          ClusterSnapshot.fromJson(json['snapshot'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      'snapshot': snapshot,
    };
  }
}

class ListClusterSnapshotsOutput {
  /// A pagination token provided by a previous request. If this parameter is
  /// specified, the response includes only records beyond this token, up to the
  /// value specified by <code>max-results</code>.
  ///
  /// If there is no more data in the responce, the <code>nextToken</code> will
  /// not be returned.
  final String? nextToken;

  /// A list of snapshots for a specified elastic cluster.
  final List<ClusterSnapshotInList>? snapshots;

  ListClusterSnapshotsOutput({
    this.nextToken,
    this.snapshots,
  });

  factory ListClusterSnapshotsOutput.fromJson(Map<String, dynamic> json) {
    return ListClusterSnapshotsOutput(
      nextToken: json['nextToken'] as String?,
      snapshots: (json['snapshots'] as List?)
          ?.whereNotNull()
          .map((e) => ClusterSnapshotInList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final snapshots = this.snapshots;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (snapshots != null) 'snapshots': snapshots,
    };
  }
}

class ListClustersOutput {
  /// A list of Amazon DocumentDB elastic clusters.
  final List<ClusterInList>? clusters;

  /// A pagination token provided by a previous request. If this parameter is
  /// specified, the response includes only records beyond this token, up to the
  /// value specified by <code>max-results</code>.
  ///
  /// If there is no more data in the responce, the <code>nextToken</code> will
  /// not be returned.
  final String? nextToken;

  ListClustersOutput({
    this.clusters,
    this.nextToken,
  });

  factory ListClustersOutput.fromJson(Map<String, dynamic> json) {
    return ListClustersOutput(
      clusters: (json['clusters'] as List?)
          ?.whereNotNull()
          .map((e) => ClusterInList.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final nextToken = this.nextToken;
    return {
      if (clusters != null) 'clusters': clusters,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags for the specified elastic cluster resource.
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

class RestoreClusterFromSnapshotOutput {
  /// Returns information about a the restored elastic cluster.
  final Cluster cluster;

  RestoreClusterFromSnapshotOutput({
    required this.cluster,
  });

  factory RestoreClusterFromSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return RestoreClusterFromSnapshotOutput(
      cluster: Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

/// The name of the shard.
class Shard {
  /// The time when the shard was created in Universal Coordinated Time (UTC).
  final String createTime;

  /// The ID of the shard.
  final String shardId;

  /// The current status of the shard.
  final Status status;

  Shard({
    required this.createTime,
    required this.shardId,
    required this.status,
  });

  factory Shard.fromJson(Map<String, dynamic> json) {
    return Shard(
      createTime: json['createTime'] as String,
      shardId: json['shardId'] as String,
      status: (json['status'] as String).toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final shardId = this.shardId;
    final status = this.status;
    return {
      'createTime': createTime,
      'shardId': shardId,
      'status': status.toValue(),
    };
  }
}

enum SnapshotType {
  manual,
  automated,
}

extension SnapshotTypeValueExtension on SnapshotType {
  String toValue() {
    switch (this) {
      case SnapshotType.manual:
        return 'MANUAL';
      case SnapshotType.automated:
        return 'AUTOMATED';
    }
  }
}

extension SnapshotTypeFromString on String {
  SnapshotType toSnapshotType() {
    switch (this) {
      case 'MANUAL':
        return SnapshotType.manual;
      case 'AUTOMATED':
        return SnapshotType.automated;
    }
    throw Exception('$this is not known in enum SnapshotType');
  }
}

class StartClusterOutput {
  final Cluster cluster;

  StartClusterOutput({
    required this.cluster,
  });

  factory StartClusterOutput.fromJson(Map<String, dynamic> json) {
    return StartClusterOutput(
      cluster: Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

enum Status {
  creating,
  active,
  deleting,
  updating,
  vpcEndpointLimitExceeded,
  ipAddressLimitExceeded,
  invalidSecurityGroupId,
  invalidSubnetId,
  inaccessibleEncryptionCreds,
  inaccessibleSecretArn,
  inaccessibleVpcEndpoint,
  incompatibleNetwork,
  merging,
  modifying,
  splitting,
  copying,
  starting,
  stopping,
  stopped,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.creating:
        return 'CREATING';
      case Status.active:
        return 'ACTIVE';
      case Status.deleting:
        return 'DELETING';
      case Status.updating:
        return 'UPDATING';
      case Status.vpcEndpointLimitExceeded:
        return 'VPC_ENDPOINT_LIMIT_EXCEEDED';
      case Status.ipAddressLimitExceeded:
        return 'IP_ADDRESS_LIMIT_EXCEEDED';
      case Status.invalidSecurityGroupId:
        return 'INVALID_SECURITY_GROUP_ID';
      case Status.invalidSubnetId:
        return 'INVALID_SUBNET_ID';
      case Status.inaccessibleEncryptionCreds:
        return 'INACCESSIBLE_ENCRYPTION_CREDS';
      case Status.inaccessibleSecretArn:
        return 'INACCESSIBLE_SECRET_ARN';
      case Status.inaccessibleVpcEndpoint:
        return 'INACCESSIBLE_VPC_ENDPOINT';
      case Status.incompatibleNetwork:
        return 'INCOMPATIBLE_NETWORK';
      case Status.merging:
        return 'MERGING';
      case Status.modifying:
        return 'MODIFYING';
      case Status.splitting:
        return 'SPLITTING';
      case Status.copying:
        return 'COPYING';
      case Status.starting:
        return 'STARTING';
      case Status.stopping:
        return 'STOPPING';
      case Status.stopped:
        return 'STOPPED';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'CREATING':
        return Status.creating;
      case 'ACTIVE':
        return Status.active;
      case 'DELETING':
        return Status.deleting;
      case 'UPDATING':
        return Status.updating;
      case 'VPC_ENDPOINT_LIMIT_EXCEEDED':
        return Status.vpcEndpointLimitExceeded;
      case 'IP_ADDRESS_LIMIT_EXCEEDED':
        return Status.ipAddressLimitExceeded;
      case 'INVALID_SECURITY_GROUP_ID':
        return Status.invalidSecurityGroupId;
      case 'INVALID_SUBNET_ID':
        return Status.invalidSubnetId;
      case 'INACCESSIBLE_ENCRYPTION_CREDS':
        return Status.inaccessibleEncryptionCreds;
      case 'INACCESSIBLE_SECRET_ARN':
        return Status.inaccessibleSecretArn;
      case 'INACCESSIBLE_VPC_ENDPOINT':
        return Status.inaccessibleVpcEndpoint;
      case 'INCOMPATIBLE_NETWORK':
        return Status.incompatibleNetwork;
      case 'MERGING':
        return Status.merging;
      case 'MODIFYING':
        return Status.modifying;
      case 'SPLITTING':
        return Status.splitting;
      case 'COPYING':
        return Status.copying;
      case 'STARTING':
        return Status.starting;
      case 'STOPPING':
        return Status.stopping;
      case 'STOPPED':
        return Status.stopped;
    }
    throw Exception('$this is not known in enum Status');
  }
}

class StopClusterOutput {
  final Cluster cluster;

  StopClusterOutput({
    required this.cluster,
  });

  factory StopClusterOutput.fromJson(Map<String, dynamic> json) {
    return StopClusterOutput(
      cluster: Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateClusterOutput {
  /// Returns information about the updated elastic cluster.
  final Cluster cluster;

  UpdateClusterOutput({
    required this.cluster,
  });

  factory UpdateClusterOutput.fromJson(Map<String, dynamic> json) {
    return UpdateClusterOutput(
      cluster: Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
