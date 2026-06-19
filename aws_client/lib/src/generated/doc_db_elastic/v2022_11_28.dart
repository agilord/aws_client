// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

  /// The type of pending maintenance action to be applied to the resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applyAction] :
  /// The pending maintenance action to apply to the resource.
  ///
  /// Valid actions are:
  ///
  /// <ul>
  /// <li>
  /// <code>ENGINE_UPDATE<i/> </code>
  /// </li>
  /// <li>
  /// <code>ENGINE_UPGRADE</code>
  /// </li>
  /// <li>
  /// <code>SECURITY_UPDATE</code>
  /// </li>
  /// <li>
  /// <code>OS_UPDATE</code>
  /// </li>
  /// <li>
  /// <code>MASTER_USER_PASSWORD_UPDATE</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [optInType] :
  /// A value that specifies the type of opt-in request, or undoes an opt-in
  /// request. An opt-in request of type <code>IMMEDIATE</code> can't be undone.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon DocumentDB Amazon Resource Name (ARN) of the resource to which
  /// the pending maintenance action applies.
  ///
  /// Parameter [applyOn] :
  /// A specific date to apply the pending maintenance action. Required if
  /// opt-in-type is <code>APPLY_ON</code>. Format: <code>yyyy/MM/dd
  /// HH:mm-yyyy/MM/dd HH:mm</code>
  Future<ApplyPendingMaintenanceActionOutput> applyPendingMaintenanceAction({
    required String applyAction,
    required OptInType optInType,
    required String resourceArn,
    String? applyOn,
  }) async {
    final $payload = <String, dynamic>{
      'applyAction': applyAction,
      'optInType': optInType.value,
      'resourceArn': resourceArn,
      if (applyOn != null) 'applyOn': applyOn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/pending-action',
      exceptionFnMap: _exceptionFns,
    );
    return ApplyPendingMaintenanceActionOutput.fromJson(response);
  }

  /// Copies a snapshot of an elastic cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      'authType': authType.value,
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves all maintenance actions that are pending.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Retrieves pending maintenance actions for a specific Amazon Resource Name
  /// (ARN).
  Future<GetPendingMaintenanceActionOutput> getPendingMaintenanceAction({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/pending-action/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPendingMaintenanceActionOutput.fromJson(response);
  }

  /// Returns information about provisioned Amazon DocumentDB elastic clusters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns information about snapshots for a specified elastic cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of all maintenance actions that are pending.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more records
  /// exist than the specified <code>maxResults</code> value, a pagination token
  /// (marker) is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>maxResults</code>.
  Future<ListPendingMaintenanceActionsOutput> listPendingMaintenanceActions({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/pending-actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPendingMaintenanceActionsOutput.fromJson(response);
  }

  /// Lists all tags on a elastic cluster resource
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      if (authType != null) 'authType': authType.value,
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

/// @nodoc
class ApplyPendingMaintenanceActionOutput {
  /// The output of the pending maintenance action being applied.
  final ResourcePendingMaintenanceAction resourcePendingMaintenanceAction;

  ApplyPendingMaintenanceActionOutput({
    required this.resourcePendingMaintenanceAction,
  });

  factory ApplyPendingMaintenanceActionOutput.fromJson(
      Map<String, dynamic> json) {
    return ApplyPendingMaintenanceActionOutput(
      resourcePendingMaintenanceAction:
          ResourcePendingMaintenanceAction.fromJson(
              (json['resourcePendingMaintenanceAction']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePendingMaintenanceAction =
        this.resourcePendingMaintenanceAction;
    return {
      'resourcePendingMaintenanceAction': resourcePendingMaintenanceAction,
    };
  }
}

/// @nodoc
class CopyClusterSnapshotOutput {
  final ClusterSnapshot snapshot;

  CopyClusterSnapshotOutput({
    required this.snapshot,
  });

  factory CopyClusterSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return CopyClusterSnapshotOutput(
      snapshot: ClusterSnapshot.fromJson(
          (json['snapshot'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      'snapshot': snapshot,
    };
  }
}

/// @nodoc
class CreateClusterOutput {
  /// The new elastic cluster that has been created.
  final Cluster cluster;

  CreateClusterOutput({
    required this.cluster,
  });

  factory CreateClusterOutput.fromJson(Map<String, dynamic> json) {
    return CreateClusterOutput(
      cluster: Cluster.fromJson((json['cluster'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

/// @nodoc
class CreateClusterSnapshotOutput {
  /// Returns information about the new elastic cluster snapshot.
  final ClusterSnapshot snapshot;

  CreateClusterSnapshotOutput({
    required this.snapshot,
  });

  factory CreateClusterSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return CreateClusterSnapshotOutput(
      snapshot: ClusterSnapshot.fromJson(
          (json['snapshot'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      'snapshot': snapshot,
    };
  }
}

/// @nodoc
class DeleteClusterOutput {
  /// Returns information about the newly deleted elastic cluster.
  final Cluster cluster;

  DeleteClusterOutput({
    required this.cluster,
  });

  factory DeleteClusterOutput.fromJson(Map<String, dynamic> json) {
    return DeleteClusterOutput(
      cluster: Cluster.fromJson((json['cluster'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

/// @nodoc
class DeleteClusterSnapshotOutput {
  /// Returns information about the newly deleted elastic cluster snapshot.
  final ClusterSnapshot snapshot;

  DeleteClusterSnapshotOutput({
    required this.snapshot,
  });

  factory DeleteClusterSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return DeleteClusterSnapshotOutput(
      snapshot: ClusterSnapshot.fromJson(
          (json['snapshot'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      'snapshot': snapshot,
    };
  }
}

/// @nodoc
class GetClusterOutput {
  /// Returns information about a specific elastic cluster.
  final Cluster cluster;

  GetClusterOutput({
    required this.cluster,
  });

  factory GetClusterOutput.fromJson(Map<String, dynamic> json) {
    return GetClusterOutput(
      cluster: Cluster.fromJson((json['cluster'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

/// @nodoc
class GetClusterSnapshotOutput {
  /// Returns information about a specific elastic cluster snapshot.
  final ClusterSnapshot snapshot;

  GetClusterSnapshotOutput({
    required this.snapshot,
  });

  factory GetClusterSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return GetClusterSnapshotOutput(
      snapshot: ClusterSnapshot.fromJson(
          (json['snapshot'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      'snapshot': snapshot,
    };
  }
}

/// @nodoc
class GetPendingMaintenanceActionOutput {
  /// Provides information about a pending maintenance action for a resource.
  final ResourcePendingMaintenanceAction resourcePendingMaintenanceAction;

  GetPendingMaintenanceActionOutput({
    required this.resourcePendingMaintenanceAction,
  });

  factory GetPendingMaintenanceActionOutput.fromJson(
      Map<String, dynamic> json) {
    return GetPendingMaintenanceActionOutput(
      resourcePendingMaintenanceAction:
          ResourcePendingMaintenanceAction.fromJson(
              (json['resourcePendingMaintenanceAction']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePendingMaintenanceAction =
        this.resourcePendingMaintenanceAction;
    return {
      'resourcePendingMaintenanceAction': resourcePendingMaintenanceAction,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class ListPendingMaintenanceActionsOutput {
  /// Provides information about a pending maintenance action for a resource.
  final List<ResourcePendingMaintenanceAction>
      resourcePendingMaintenanceActions;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is displayed, the responses will include only records beyond the
  /// marker, up to the value specified by <code>maxResults</code>.
  final String? nextToken;

  ListPendingMaintenanceActionsOutput({
    required this.resourcePendingMaintenanceActions,
    this.nextToken,
  });

  factory ListPendingMaintenanceActionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListPendingMaintenanceActionsOutput(
      resourcePendingMaintenanceActions:
          ((json['resourcePendingMaintenanceActions'] as List?) ?? const [])
              .nonNulls
              .map((e) => ResourcePendingMaintenanceAction.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePendingMaintenanceActions =
        this.resourcePendingMaintenanceActions;
    final nextToken = this.nextToken;
    return {
      'resourcePendingMaintenanceActions': resourcePendingMaintenanceActions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
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

/// @nodoc
class RestoreClusterFromSnapshotOutput {
  /// Returns information about a the restored elastic cluster.
  final Cluster cluster;

  RestoreClusterFromSnapshotOutput({
    required this.cluster,
  });

  factory RestoreClusterFromSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return RestoreClusterFromSnapshotOutput(
      cluster: Cluster.fromJson((json['cluster'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

/// @nodoc
class StartClusterOutput {
  final Cluster cluster;

  StartClusterOutput({
    required this.cluster,
  });

  factory StartClusterOutput.fromJson(Map<String, dynamic> json) {
    return StartClusterOutput(
      cluster: Cluster.fromJson((json['cluster'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

/// @nodoc
class StopClusterOutput {
  final Cluster cluster;

  StopClusterOutput({
    required this.cluster,
  });

  factory StopClusterOutput.fromJson(Map<String, dynamic> json) {
    return StopClusterOutput(
      cluster: Cluster.fromJson((json['cluster'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateClusterOutput {
  /// Returns information about the updated elastic cluster.
  final Cluster cluster;

  UpdateClusterOutput({
    required this.cluster,
  });

  factory UpdateClusterOutput.fromJson(Map<String, dynamic> json) {
    return UpdateClusterOutput(
      cluster: Cluster.fromJson((json['cluster'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      'cluster': cluster,
    };
  }
}

/// Returns information about a specific elastic cluster.
///
/// @nodoc
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
      adminUserName: (json['adminUserName'] as String?) ?? '',
      authType: Auth.fromString((json['authType'] as String?) ?? ''),
      clusterArn: (json['clusterArn'] as String?) ?? '',
      clusterEndpoint: (json['clusterEndpoint'] as String?) ?? '',
      clusterName: (json['clusterName'] as String?) ?? '',
      createTime: (json['createTime'] as String?) ?? '',
      kmsKeyId: (json['kmsKeyId'] as String?) ?? '',
      preferredMaintenanceWindow:
          (json['preferredMaintenanceWindow'] as String?) ?? '',
      shardCapacity: (json['shardCapacity'] as int?) ?? 0,
      shardCount: (json['shardCount'] as int?) ?? 0,
      status: Status.fromString((json['status'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcSecurityGroupIds: ((json['vpcSecurityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      backupRetentionPeriod: json['backupRetentionPeriod'] as int?,
      preferredBackupWindow: json['preferredBackupWindow'] as String?,
      shardInstanceCount: json['shardInstanceCount'] as int?,
      shards: (json['shards'] as List?)
          ?.nonNulls
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
      'authType': authType.value,
      'clusterArn': clusterArn,
      'clusterEndpoint': clusterEndpoint,
      'clusterName': clusterName,
      'createTime': createTime,
      'kmsKeyId': kmsKeyId,
      'preferredMaintenanceWindow': preferredMaintenanceWindow,
      'shardCapacity': shardCapacity,
      'shardCount': shardCount,
      'status': status.value,
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

/// @nodoc
class Status {
  static const creating = Status._('CREATING');
  static const active = Status._('ACTIVE');
  static const deleting = Status._('DELETING');
  static const updating = Status._('UPDATING');
  static const vpcEndpointLimitExceeded =
      Status._('VPC_ENDPOINT_LIMIT_EXCEEDED');
  static const ipAddressLimitExceeded = Status._('IP_ADDRESS_LIMIT_EXCEEDED');
  static const invalidSecurityGroupId = Status._('INVALID_SECURITY_GROUP_ID');
  static const invalidSubnetId = Status._('INVALID_SUBNET_ID');
  static const inaccessibleEncryptionCreds =
      Status._('INACCESSIBLE_ENCRYPTION_CREDS');
  static const inaccessibleSecretArn = Status._('INACCESSIBLE_SECRET_ARN');
  static const inaccessibleVpcEndpoint = Status._('INACCESSIBLE_VPC_ENDPOINT');
  static const incompatibleNetwork = Status._('INCOMPATIBLE_NETWORK');
  static const merging = Status._('MERGING');
  static const modifying = Status._('MODIFYING');
  static const splitting = Status._('SPLITTING');
  static const copying = Status._('COPYING');
  static const starting = Status._('STARTING');
  static const stopping = Status._('STOPPING');
  static const stopped = Status._('STOPPED');
  static const maintenance = Status._('MAINTENANCE');
  static const inaccessibleEncryptionCredentialsRecoverable =
      Status._('INACCESSIBLE_ENCRYPTION_CREDENTIALS_RECOVERABLE');

  final String value;

  const Status._(this.value);

  static const values = [
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
    maintenance,
    inaccessibleEncryptionCredentialsRecoverable
  ];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Auth {
  static const plainText = Auth._('PLAIN_TEXT');
  static const secretArn = Auth._('SECRET_ARN');

  final String value;

  const Auth._(this.value);

  static const values = [plainText, secretArn];

  static Auth fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Auth._(value));

  @override
  bool operator ==(other) => other is Auth && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The name of the shard.
///
/// @nodoc
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
      createTime: (json['createTime'] as String?) ?? '',
      shardId: (json['shardId'] as String?) ?? '',
      status: Status.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final shardId = this.shardId;
    final status = this.status;
    return {
      'createTime': createTime,
      'shardId': shardId,
      'status': status.value,
    };
  }
}

/// Provides information about a pending maintenance action for a resource.
///
/// @nodoc
class ResourcePendingMaintenanceAction {
  /// Provides information about a pending maintenance action for a resource.
  final List<PendingMaintenanceActionDetails>? pendingMaintenanceActionDetails;

  /// The Amazon DocumentDB Amazon Resource Name (ARN) of the resource to which
  /// the pending maintenance action applies.
  final String? resourceArn;

  ResourcePendingMaintenanceAction({
    this.pendingMaintenanceActionDetails,
    this.resourceArn,
  });

  factory ResourcePendingMaintenanceAction.fromJson(Map<String, dynamic> json) {
    return ResourcePendingMaintenanceAction(
      pendingMaintenanceActionDetails:
          (json['pendingMaintenanceActionDetails'] as List?)
              ?.nonNulls
              .map((e) => PendingMaintenanceActionDetails.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pendingMaintenanceActionDetails =
        this.pendingMaintenanceActionDetails;
    final resourceArn = this.resourceArn;
    return {
      if (pendingMaintenanceActionDetails != null)
        'pendingMaintenanceActionDetails': pendingMaintenanceActionDetails,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

/// Retrieves the details of maintenance actions that are pending.
///
/// @nodoc
class PendingMaintenanceActionDetails {
  /// Displays the specific action of a pending maintenance action.
  final String action;

  /// Displays the date of the maintenance window when the action is applied. The
  /// maintenance action is applied to the resource during its first maintenance
  /// window after this date. If this date is specified, any
  /// <code>NEXT_MAINTENANCE</code> <code>optInType</code> requests are ignored.
  final String? autoAppliedAfterDate;

  /// Displays the effective date when the pending maintenance action is applied
  /// to the resource.
  final String? currentApplyDate;

  /// Displays a description providing more detail about the maintenance action.
  final String? description;

  /// Displays the date when the maintenance action is automatically applied. The
  /// maintenance action is applied to the resource on this date regardless of the
  /// maintenance window for the resource. If this date is specified, any
  /// <code>IMMEDIATE</code> <code>optInType</code> requests are ignored.
  final String? forcedApplyDate;

  /// Displays the type of <code>optInType</code> request that has been received
  /// for the resource.
  final String? optInStatus;

  PendingMaintenanceActionDetails({
    required this.action,
    this.autoAppliedAfterDate,
    this.currentApplyDate,
    this.description,
    this.forcedApplyDate,
    this.optInStatus,
  });

  factory PendingMaintenanceActionDetails.fromJson(Map<String, dynamic> json) {
    return PendingMaintenanceActionDetails(
      action: (json['action'] as String?) ?? '',
      autoAppliedAfterDate: json['autoAppliedAfterDate'] as String?,
      currentApplyDate: json['currentApplyDate'] as String?,
      description: json['description'] as String?,
      forcedApplyDate: json['forcedApplyDate'] as String?,
      optInStatus: json['optInStatus'] as String?,
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
      'action': action,
      if (autoAppliedAfterDate != null)
        'autoAppliedAfterDate': autoAppliedAfterDate,
      if (currentApplyDate != null) 'currentApplyDate': currentApplyDate,
      if (description != null) 'description': description,
      if (forcedApplyDate != null) 'forcedApplyDate': forcedApplyDate,
      if (optInStatus != null) 'optInStatus': optInStatus,
    };
  }
}

/// A list of elastic cluster snapshots.
///
/// @nodoc
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
      clusterArn: (json['clusterArn'] as String?) ?? '',
      snapshotArn: (json['snapshotArn'] as String?) ?? '',
      snapshotCreationTime: (json['snapshotCreationTime'] as String?) ?? '',
      snapshotName: (json['snapshotName'] as String?) ?? '',
      status: Status.fromString((json['status'] as String?) ?? ''),
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
      'status': status.value,
    };
  }
}

/// A list of Amazon DocumentDB elastic clusters.
///
/// @nodoc
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
      clusterArn: (json['clusterArn'] as String?) ?? '',
      clusterName: (json['clusterName'] as String?) ?? '',
      status: Status.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterName = this.clusterName;
    final status = this.status;
    return {
      'clusterArn': clusterArn,
      'clusterName': clusterName,
      'status': status.value,
    };
  }
}

/// Returns information about a specific elastic cluster snapshot.
///
/// @nodoc
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
      adminUserName: (json['adminUserName'] as String?) ?? '',
      clusterArn: (json['clusterArn'] as String?) ?? '',
      clusterCreationTime: (json['clusterCreationTime'] as String?) ?? '',
      kmsKeyId: (json['kmsKeyId'] as String?) ?? '',
      snapshotArn: (json['snapshotArn'] as String?) ?? '',
      snapshotCreationTime: (json['snapshotCreationTime'] as String?) ?? '',
      snapshotName: (json['snapshotName'] as String?) ?? '',
      status: Status.fromString((json['status'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcSecurityGroupIds: ((json['vpcSecurityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      snapshotType:
          (json['snapshotType'] as String?)?.let(SnapshotType.fromString),
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
      'status': status.value,
      'subnetIds': subnetIds,
      'vpcSecurityGroupIds': vpcSecurityGroupIds,
      if (snapshotType != null) 'snapshotType': snapshotType.value,
    };
  }
}

/// @nodoc
class SnapshotType {
  static const manual = SnapshotType._('MANUAL');
  static const automated = SnapshotType._('AUTOMATED');

  final String value;

  const SnapshotType._(this.value);

  static const values = [manual, automated];

  static SnapshotType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SnapshotType._(value));

  @override
  bool operator ==(other) => other is SnapshotType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OptInType {
  static const immediate = OptInType._('IMMEDIATE');
  static const nextMaintenance = OptInType._('NEXT_MAINTENANCE');
  static const applyOn = OptInType._('APPLY_ON');
  static const undoOptIn = OptInType._('UNDO_OPT_IN');

  final String value;

  const OptInType._(this.value);

  static const values = [immediate, nextMaintenance, applyOn, undoOptIn];

  static OptInType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OptInType._(value));

  @override
  bool operator ==(other) => other is OptInType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
