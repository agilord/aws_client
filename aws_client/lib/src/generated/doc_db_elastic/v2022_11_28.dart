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

/// The new Amazon Elastic DocumentDB service endpoint.
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

  /// Creates a new Elastic DocumentDB cluster and returns its Cluster
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
  /// The name of the Elastic DocumentDB cluster administrator.
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
  /// The password for the Elastic DocumentDB cluster administrator and can
  /// contain any printable ASCII characters.
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
  /// The authentication type for the Elastic DocumentDB cluster.
  ///
  /// Parameter [clusterName] :
  /// The name of the new Elastic DocumentDB cluster. This parameter is stored
  /// as a lowercase string.
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
  /// The capacity of each shard in the new Elastic DocumentDB cluster.
  ///
  /// Parameter [shardCount] :
  /// The number of shards to create in the new Elastic DocumentDB cluster.
  ///
  /// Parameter [clientToken] :
  /// The client token for the Elastic DocumentDB cluster.
  ///
  /// Parameter [kmsKeyId] :
  /// The KMS key identifier to use to encrypt the new Elastic DocumentDB
  /// cluster.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a cluster using the same Amazon
  /// account that owns this KMS encryption key, you can use the KMS key alias
  /// instead of the ARN as the KMS encryption key.
  ///
  /// If an encryption key is not specified, Elastic DocumentDB uses the default
  /// encryption key that KMS creates for your account. Your account has a
  /// different default encryption key for each Amazon Region.
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
  /// Parameter [subnetIds] :
  /// The Amazon EC2 subnet IDs for the new Elastic DocumentDB cluster.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the new Elastic DocumentDB cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with the new Elastic
  /// DocumentDB cluster.
  Future<CreateClusterOutput> createCluster({
    required String adminUserName,
    required String adminUserPassword,
    required Auth authType,
    required String clusterName,
    required int shardCapacity,
    required int shardCount,
    String? clientToken,
    String? kmsKeyId,
    String? preferredMaintenanceWindow,
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
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (preferredMaintenanceWindow != null)
        'preferredMaintenanceWindow': preferredMaintenanceWindow,
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

  /// Creates a snapshot of a cluster.
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
  /// The arn of the Elastic DocumentDB cluster that the snapshot will be taken
  /// from.
  ///
  /// Parameter [snapshotName] :
  /// The name of the Elastic DocumentDB snapshot.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the new Elastic DocumentDB snapshot.
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

  /// Delete a Elastic DocumentDB cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The arn of the Elastic DocumentDB cluster that is to be deleted.
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

  /// Delete a Elastic DocumentDB snapshot.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [snapshotArn] :
  /// The arn of the Elastic DocumentDB snapshot that is to be deleted.
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

  /// Returns information about a specific Elastic DocumentDB cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The arn of the Elastic DocumentDB cluster.
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

  /// Returns information about a specific Elastic DocumentDB snapshot
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [snapshotArn] :
  /// The arn of the Elastic DocumentDB snapshot.
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

  /// Returns information about Elastic DocumentDB snapshots for a specified
  /// cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The arn of the Elastic DocumentDB cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of entries to recieve in the response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken which is used the get the next page of data.
  Future<ListClusterSnapshotsOutput> listClusterSnapshots({
    String? clusterArn,
    int? maxResults,
    String? nextToken,
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

  /// Returns information about provisioned Elastic DocumentDB clusters.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of entries to recieve in the response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken which is used the get the next page of data.
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

  /// Lists all tags on a Elastic DocumentDB resource
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The arn of the Elastic DocumentDB resource.
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

  /// Restores a Elastic DocumentDB cluster from a snapshot.
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
  /// The name of the Elastic DocumentDB cluster.
  ///
  /// Parameter [snapshotArn] :
  /// The arn of the Elastic DocumentDB snapshot.
  ///
  /// Parameter [kmsKeyId] :
  /// The KMS key identifier to use to encrypt the new Elastic DocumentDB
  /// cluster.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a cluster using the same Amazon
  /// account that owns this KMS encryption key, you can use the KMS key alias
  /// instead of the ARN as the KMS encryption key.
  ///
  /// If an encryption key is not specified here, Elastic DocumentDB uses the
  /// default encryption key that KMS creates for your account. Your account has
  /// a different default encryption key for each Amazon Region.
  ///
  /// Parameter [subnetIds] :
  /// The Amazon EC2 subnet IDs for the Elastic DocumentDB cluster.
  ///
  /// Parameter [tags] :
  /// A list of the tag names to be assigned to the restored DB cluster, in the
  /// form of an array of key-value pairs in which the key is the tag name and
  /// the value is the key value.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with the Elastic DocumentDB
  /// cluster.
  Future<RestoreClusterFromSnapshotOutput> restoreClusterFromSnapshot({
    required String clusterName,
    required String snapshotArn,
    String? kmsKeyId,
    List<String>? subnetIds,
    Map<String, String>? tags,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $payload = <String, dynamic>{
      'clusterName': clusterName,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
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

  /// Adds metadata tags to a Elastic DocumentDB resource
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The arn of the Elastic DocumentDB resource.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Elastic DocumentDB resource.
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

  /// Removes metadata tags to a Elastic DocumentDB resource
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The arn of the Elastic DocumentDB resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to be removed from the Elastic DocumentDB resource.
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

  /// Modifies a Elastic DocumentDB cluster. This includes updating
  /// admin-username/password, upgrading API version setting up a backup window
  /// and maintenance window
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterArn] :
  /// The arn of the Elastic DocumentDB cluster.
  ///
  /// Parameter [adminUserPassword] :
  /// The password for the Elastic DocumentDB cluster administrator. This
  /// password can contain any printable ASCII character except forward slash
  /// (/), double quote ("), or the "at" symbol (@).
  ///
  /// <i>Constraints</i>: Must contain from 8 to 100 characters.
  ///
  /// Parameter [authType] :
  /// The authentication type for the Elastic DocumentDB cluster.
  ///
  /// Parameter [clientToken] :
  /// The client token for the Elastic DocumentDB cluster.
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
  /// The capacity of each shard in the Elastic DocumentDB cluster.
  ///
  /// Parameter [shardCount] :
  /// The number of shards to create in the Elastic DocumentDB cluster.
  ///
  /// Parameter [subnetIds] :
  /// The number of shards to create in the Elastic DocumentDB cluster.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of EC2 VPC security groups to associate with the new Elastic
  /// DocumentDB cluster.
  Future<UpdateClusterOutput> updateCluster({
    required String clusterArn,
    String? adminUserPassword,
    Auth? authType,
    String? clientToken,
    String? preferredMaintenanceWindow,
    int? shardCapacity,
    int? shardCount,
    List<String>? subnetIds,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $payload = <String, dynamic>{
      if (adminUserPassword != null) 'adminUserPassword': adminUserPassword,
      if (authType != null) 'authType': authType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (preferredMaintenanceWindow != null)
        'preferredMaintenanceWindow': preferredMaintenanceWindow,
      if (shardCapacity != null) 'shardCapacity': shardCapacity,
      if (shardCount != null) 'shardCount': shardCount,
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

/// Returns information about a specific Elastic DocumentDB cluster.
class Cluster {
  /// The name of the Elastic DocumentDB cluster administrator.
  final String adminUserName;

  /// The authentication type for the Elastic DocumentDB cluster.
  final Auth authType;

  /// The arn of the Elastic DocumentDB cluster.
  final String clusterArn;

  /// The URL used to connect to the Elastic DocumentDB cluster.
  final String clusterEndpoint;

  /// The name of the Elastic DocumentDB cluster.
  final String clusterName;

  /// The time when the Elastic DocumentDB cluster was created in Universal
  /// Coordinated Time (UTC).
  final String createTime;

  /// The KMS key identifier to use to encrypt the Elastic DocumentDB cluster.
  final String kmsKeyId;

  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// <i>Format</i>: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  final String preferredMaintenanceWindow;

  /// The capacity of each shard in the Elastic DocumentDB cluster.
  final int shardCapacity;

  /// The number of shards in the Elastic DocumentDB cluster.
  final int shardCount;

  /// The status of the Elastic DocumentDB cluster.
  final Status status;

  /// The Amazon EC2 subnet IDs for the Elastic DocumentDB cluster.
  final List<String> subnetIds;

  /// A list of EC2 VPC security groups associated with this cluster.
  final List<String> vpcSecurityGroupIds;

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
    };
  }
}

/// A list of Elastic DocumentDB cluster.
class ClusterInList {
  /// The arn of the Elastic DocumentDB cluster.
  final String clusterArn;

  /// The name of the Elastic DocumentDB cluster.
  final String clusterName;

  /// The status of the Elastic DocumentDB cluster.
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

/// Returns information about a specific Elastic DocumentDB snapshot.
class ClusterSnapshot {
  /// The name of the Elastic DocumentDB cluster administrator.
  final String adminUserName;

  /// The arn of the Elastic DocumentDB cluster.
  final String clusterArn;

  /// The time when the Elastic DocumentDB cluster was created in Universal
  /// Coordinated Time (UTC).
  final String clusterCreationTime;

  /// The KMS key identifier to use to encrypt the Elastic DocumentDB cluster.
  final String kmsKeyId;

  /// The arn of the Elastic DocumentDB snapshot
  final String snapshotArn;

  /// The time when the Elastic DocumentDB snapshot was created in Universal
  /// Coordinated Time (UTC).
  final String snapshotCreationTime;

  /// The name of the Elastic DocumentDB snapshot.
  final String snapshotName;

  /// The status of the Elastic DocumentDB snapshot.
  final Status status;

  /// A list of the IDs of subnets associated with the DB cluster snapshot.
  final List<String> subnetIds;

  /// A list of the IDs of the VPC security groups associated with the cluster
  /// snapshot.
  final List<String> vpcSecurityGroupIds;

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
    };
  }
}

/// A list of Elastic DocumentDB snapshots.
class ClusterSnapshotInList {
  /// The arn of the Elastic DocumentDB cluster.
  final String clusterArn;

  /// The arn of the Elastic DocumentDB snapshot
  final String snapshotArn;

  /// The time when the Elastic DocumentDB snapshot was created in Universal
  /// Coordinated Time (UTC).
  final String snapshotCreationTime;

  /// The name of the Elastic DocumentDB snapshot.
  final String snapshotName;

  /// The status of the Elastic DocumentDB snapshot.
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

class CreateClusterOutput {
  /// The new Elastic DocumentDB cluster that has been created.
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
  /// Returns information about the new Elastic DocumentDB snapshot.
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
  /// Returns information about the newly deleted Elastic DocumentDB cluster.
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
  /// Returns information about the newly deleted Elastic DocumentDB snapshot.
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
  /// Returns information about a specific Elastic DocumentDB cluster.
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
  /// Returns information about a specific Elastic DocumentDB snapshot.
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
  /// The response will provide a nextToken if there is more data beyond the
  /// maxResults.
  ///
  /// If there is no more data in the responce, the nextToken will not be
  /// returned.
  final String? nextToken;

  /// A list of Elastic DocumentDB snapshots for a specified cluster.
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
  /// A list of Elastic DocumentDB cluster.
  final List<ClusterInList>? clusters;

  /// The response will provide a nextToken if there is more data beyond the
  /// maxResults.
  ///
  /// If there is no more data in the responce, the nextToken will not be
  /// returned.
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
  /// The list of tags for the specified Elastic DocumentDB resource.
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
  /// Returns information about a the restored Elastic DocumentDB cluster.
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
    }
    throw Exception('$this is not known in enum Status');
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
  /// Returns information about the updated Elastic DocumentDB cluster.
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
