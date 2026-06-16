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

/// S3 Files makes S3 buckets accessible as high-performance file systems
/// powered by EFS. This service enables file system interface access to S3 data
/// with sub-millisecond latencies through mount targets, supporting AI/ML
/// workloads, media processing, and hybrid storage workflows that require both
/// file system and object storage access to the same data.
class S3Files {
  final _s.RestJsonProtocol _protocol;
  S3Files({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 's3files',
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

  /// Creates an S3 File System Access Point for application-specific access
  /// with POSIX user identity and root directory enforcement. Access points
  /// provide a way to manage access to shared datasets in multi-tenant
  /// scenarios.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Web Services ignores the request, but does not return an error.
  ///
  /// Parameter [posixUser] :
  /// The POSIX identity with uid, gid, and secondary group IDs for user
  /// enforcement when accessing the file system through this access point.
  ///
  /// Parameter [rootDirectory] :
  /// The root directory path for the access point, with optional creation
  /// permissions for newly created directories.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs to apply to the access point for resource
  /// tagging.
  Future<CreateAccessPointResponse> createAccessPoint({
    required String fileSystemId,
    String? clientToken,
    PosixUser? posixUser,
    RootDirectory? rootDirectory,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'fileSystemId': fileSystemId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (posixUser != null) 'posixUser': posixUser,
      if (rootDirectory != null) 'rootDirectory': rootDirectory,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/access-points',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessPointResponse.fromJson(response);
  }

  /// Creates an S3 File System resource scoped to a bucket or prefix within a
  /// bucket, enabling file system access to S3 data. To create a file system,
  /// you need an S3 bucket and an IAM role that grants the service permission
  /// to access the bucket.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [bucket] :
  /// The Amazon Resource Name (ARN) of the S3 bucket that will be accessible
  /// through the file system. The bucket must exist and be in the same Amazon
  /// Web Services Region as the file system.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that grants the S3 Files service permission to
  /// read and write data between the file system and the S3 bucket. This role
  /// must have the necessary permissions to access the specified bucket and
  /// prefix.
  ///
  /// Parameter [acceptBucketWarning] :
  /// Set to true to acknowledge and accept any warnings about the bucket
  /// configuration. If not specified, the operation may fail if there are
  /// bucket configuration warnings.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure idempotent
  /// creation. Up to 64 ASCII characters are allowed. If you don't specify a
  /// client token, the Amazon Web Services SDK automatically generates one.
  ///
  /// Parameter [kmsKeyId] :
  /// The ARN, key ID, or alias of the KMS key to use for encryption. If not
  /// specified, the service uses a service-owned key for encryption. You can
  /// specify a KMS key using the following formats: key ID, ARN, key alias, or
  /// key alias ARN. If you use <code>KmsKeyId</code>, the file system will be
  /// encrypted.
  ///
  /// Parameter [prefix] :
  /// An optional prefix within the S3 bucket to scope the file system access.
  /// If specified, the file system provides access only to objects with keys
  /// that begin with this prefix. If not specified, the file system provides
  /// access to the entire bucket.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs to apply as tags to the file system resource.
  /// Each tag is a user-defined key-value pair. You can use tags to categorize
  /// and manage your file systems. Each key must be unique for the resource.
  Future<CreateFileSystemResponse> createFileSystem({
    required String bucket,
    required String roleArn,
    bool? acceptBucketWarning,
    String? clientToken,
    String? kmsKeyId,
    String? prefix,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'bucket': bucket,
      'roleArn': roleArn,
      if (acceptBucketWarning != null)
        'acceptBucketWarning': acceptBucketWarning,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (prefix != null) 'prefix': prefix,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/file-systems',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFileSystemResponse.fromJson(response);
  }

  /// Creates a mount target resource as an endpoint for mounting the S3 File
  /// System from compute resources in a specific Availability Zone and VPC.
  /// Mount targets provide network access to the file system.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System to create the
  /// mount target for.
  ///
  /// Parameter [subnetId] :
  /// The ID of the subnet where the mount target will be created. The subnet
  /// must be in the same Amazon Web Services Region as the file system. For
  /// file systems with regional availability, you can create mount targets in
  /// any subnet within the Region. The subnet determines the Availability Zone
  /// where the mount target will be located.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for the mount target. If not specified,
  /// <code>IPV4_ONLY</code> is used. The IP address type must match the IP
  /// configuration of the specified subnet.
  ///
  /// Parameter [ipv4Address] :
  /// A specific IPv4 address to assign to the mount target. If not specified
  /// and the IP address type supports IPv4, an address is automatically
  /// assigned from the subnet's available IPv4 address range. The address must
  /// be within the subnet's CIDR block and not already in use.
  ///
  /// Parameter [ipv6Address] :
  /// A specific IPv6 address to assign to the mount target. If not specified
  /// and the IP address type supports IPv6, an address is automatically
  /// assigned from the subnet's available IPv6 address range. The address must
  /// be within the subnet's IPv6 CIDR block and not already in use.
  ///
  /// Parameter [securityGroups] :
  /// An array of VPC security group IDs to associate with the mount target's
  /// network interface. These security groups control network access to the
  /// mount target. If not specified, the default security group for the
  /// subnet's VPC is used. All security groups must belong to the same VPC as
  /// the subnet.
  Future<CreateMountTargetResponse> createMountTarget({
    required String fileSystemId,
    required String subnetId,
    IpAddressType? ipAddressType,
    String? ipv4Address,
    String? ipv6Address,
    List<String>? securityGroups,
  }) async {
    final $payload = <String, dynamic>{
      'fileSystemId': fileSystemId,
      'subnetId': subnetId,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv4Address != null) 'ipv4Address': ipv4Address,
      if (ipv6Address != null) 'ipv6Address': ipv6Address,
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/mount-targets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMountTargetResponse.fromJson(response);
  }

  /// Deletes an S3 File System Access Point. This operation is irreversible.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessPointId] :
  /// The ID or Amazon Resource Name (ARN) of the access point to delete.
  Future<void> deleteAccessPoint({
    required String accessPointId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/access-points/${Uri.encodeComponent(accessPointId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an S3 File System. You can optionally force deletion of a file
  /// system that has pending export data.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System to delete.
  ///
  /// Parameter [forceDelete] :
  /// If true, allows deletion of a file system that contains data pending
  /// export to S3. If false (the default), the deletion will fail if there is
  /// data that has not yet been exported to the S3 bucket. Use this parameter
  /// with caution as it may result in data loss.
  Future<void> deleteFileSystem({
    required String fileSystemId,
    bool? forceDelete,
  }) async {
    final $query = <String, List<String>>{
      if (forceDelete != null) 'forceDelete': [forceDelete.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/file-systems/${Uri.encodeComponent(fileSystemId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the IAM resource policy of an S3 File System.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System whose resource
  /// policy to delete.
  Future<void> deleteFileSystemPolicy({
    required String fileSystemId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/file-systems/${Uri.encodeComponent(fileSystemId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified mount target. This operation is irreversible.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mountTargetId] :
  /// The ID of the mount target to delete.
  Future<void> deleteMountTarget({
    required String mountTargetId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/mount-targets/${Uri.encodeComponent(mountTargetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns resource information for an S3 File System Access Point.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessPointId] :
  /// The ID or Amazon Resource Name (ARN) of the access point to retrieve
  /// information for.
  Future<GetAccessPointResponse> getAccessPoint({
    required String accessPointId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-points/${Uri.encodeComponent(accessPointId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointResponse.fromJson(response);
  }

  /// Returns resource information for the specified S3 File System including
  /// status, configuration, and metadata.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System to retrieve
  /// information for.
  Future<GetFileSystemResponse> getFileSystem({
    required String fileSystemId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/file-systems/${Uri.encodeComponent(fileSystemId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFileSystemResponse.fromJson(response);
  }

  /// Returns the IAM resource policy of an S3 File System.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System whose resource
  /// policy to retrieve.
  Future<GetFileSystemPolicyResponse> getFileSystemPolicy({
    required String fileSystemId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/file-systems/${Uri.encodeComponent(fileSystemId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetFileSystemPolicyResponse.fromJson(response);
  }

  /// Returns detailed resource information for the specified mount target
  /// including network configuration.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mountTargetId] :
  /// The ID of the mount target to retrieve information for.
  Future<GetMountTargetResponse> getMountTarget({
    required String mountTargetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/mount-targets/${Uri.encodeComponent(mountTargetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMountTargetResponse.fromJson(response);
  }

  /// Returns the synchronization configuration for the specified S3 File
  /// System, including import data rules and expiration data rules.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System to retrieve the
  /// synchronization configuration for.
  Future<GetSynchronizationConfigurationResponse>
      getSynchronizationConfiguration({
    required String fileSystemId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/file-systems/${Uri.encodeComponent(fileSystemId)}/synchronization-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetSynchronizationConfigurationResponse.fromJson(response);
  }

  /// Returns resource information for all S3 File System Access Points
  /// associated with the specified S3 File System.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System to list access
  /// points for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of access points to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to continue listing
  /// access points.
  Future<ListAccessPointsResponse> listAccessPoints({
    required String fileSystemId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'fileSystemId': [fileSystemId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-points',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessPointsResponse.fromJson(response);
  }

  /// Returns a list of all S3 File Systems owned by the account with optional
  /// filtering by bucket.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [bucket] :
  /// Optional filter to list only file systems associated with the specified S3
  /// bucket Amazon Resource Name (ARN). If provided, only file systems that
  /// provide access to this bucket will be returned in the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of file systems to return in a single response. If not
  /// specified, up to 100 file systems are returned.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to continue listing file
  /// systems.
  Future<ListFileSystemsResponse> listFileSystems({
    String? bucket,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (bucket != null) 'bucket': [bucket],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/file-systems',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFileSystemsResponse.fromJson(response);
  }

  /// Returns resource information for all mount targets with optional filtering
  /// by file system, access point, and VPC.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessPointId] :
  /// Optional filter to list only mount targets associated with the specified
  /// access point ID or Amazon Resource Name (ARN).
  ///
  /// Parameter [fileSystemId] :
  /// Optional filter to list only mount targets associated with the specified
  /// S3 File System ID or Amazon Resource Name (ARN). If provided, only mount
  /// targets for this file system will be returned in the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of mount targets to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to continue listing mount
  /// targets.
  Future<ListMountTargetsResponse> listMountTargets({
    String? accessPointId,
    String? fileSystemId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (accessPointId != null) 'accessPointId': [accessPointId],
      if (fileSystemId != null) 'fileSystemId': [fileSystemId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/mount-targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMountTargetsResponse.fromJson(response);
  }

  /// Lists all tags for S3 Files resources.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceId] :
  /// The ID or Amazon Resource Name (ARN) of the resource to list tags for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tags to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to continue listing tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resource-tags/${Uri.encodeComponent(resourceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Creates or replaces the IAM resource policy for an S3 File System to
  /// control access permissions.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System to apply the
  /// resource policy to.
  ///
  /// Parameter [policy] :
  /// The JSON-formatted resource policy to apply to the file system. The policy
  /// defines the permissions for accessing the file system. The policy must be
  /// a valid JSON document that follows IAM policy syntax.
  Future<void> putFileSystemPolicy({
    required String fileSystemId,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/file-systems/${Uri.encodeComponent(fileSystemId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or updates the synchronization configuration for the specified S3
  /// File System, including import data rules and expiration data rules.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [expirationDataRules] :
  /// An array of expiration data rules that control when cached data expires
  /// from the file system.
  ///
  /// Parameter [fileSystemId] :
  /// The ID or Amazon Resource Name (ARN) of the S3 File System to configure
  /// synchronization for.
  ///
  /// Parameter [importDataRules] :
  /// An array of import data rules that control how data is imported from S3
  /// into the file system.
  ///
  /// Parameter [latestVersionNumber] :
  /// The version number of the current synchronization configuration. Omit this
  /// value when creating a synchronization configuration for the first time.
  /// For subsequent updates, provide this value for optimistic concurrency
  /// control. If the version number does not match the current configuration,
  /// the request fails with a <code>ConflictException</code>.
  Future<void> putSynchronizationConfiguration({
    required List<ExpirationDataRule> expirationDataRules,
    required String fileSystemId,
    required List<ImportDataRule> importDataRules,
    int? latestVersionNumber,
  }) async {
    final $payload = <String, dynamic>{
      'expirationDataRules': expirationDataRules,
      'importDataRules': importDataRules,
      if (latestVersionNumber != null)
        'latestVersionNumber': latestVersionNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/file-systems/${Uri.encodeComponent(fileSystemId)}/synchronization-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates tags for S3 Files resources using standard Amazon Web Services
  /// tagging APIs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceId] :
  /// The ID or Amazon Resource Name (ARN) of the resource to add tags to.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs to add as tags to the resource.
  Future<void> tagResource({
    required String resourceId,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resource-tags/${Uri.encodeComponent(resourceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from S3 Files resources.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceId] :
  /// The ID or Amazon Resource Name (ARN) of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// An array of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceId,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/resource-tags/${Uri.encodeComponent(resourceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the mount target resource, specifically security group
  /// configurations.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mountTargetId] :
  /// The ID of the mount target to update.
  ///
  /// Parameter [securityGroups] :
  /// An array of VPC security group IDs to associate with the mount target's
  /// network interface. This replaces the existing security groups. All
  /// security groups must belong to the same VPC as the mount target's subnet.
  Future<UpdateMountTargetResponse> updateMountTarget({
    required String mountTargetId,
    required List<String> securityGroups,
  }) async {
    final $payload = <String, dynamic>{
      'securityGroups': securityGroups,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/mount-targets/${Uri.encodeComponent(mountTargetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMountTargetResponse.fromJson(response);
  }
}

class CreateAccessPointResponse {
  /// The Amazon Resource Name (ARN) of the access point.
  final String accessPointArn;

  /// The ID of the access point.
  final String accessPointId;

  /// The client token that was provided in the request.
  final String clientToken;

  /// The ID of the S3 File System.
  final String fileSystemId;

  /// The Amazon Web Services account ID of the access point owner.
  final String ownerId;

  /// The current status of the access point.
  final LifeCycleState status;

  /// The name of the access point.
  final String? name;

  /// The POSIX identity configured for this access point.
  final PosixUser? posixUser;

  /// The root directory configuration for this access point.
  final RootDirectory? rootDirectory;

  /// The tags associated with the access point.
  final List<Tag>? tags;

  CreateAccessPointResponse({
    required this.accessPointArn,
    required this.accessPointId,
    required this.clientToken,
    required this.fileSystemId,
    required this.ownerId,
    required this.status,
    this.name,
    this.posixUser,
    this.rootDirectory,
    this.tags,
  });

  factory CreateAccessPointResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccessPointResponse(
      accessPointArn: (json['accessPointArn'] as String?) ?? '',
      accessPointId: (json['accessPointId'] as String?) ?? '',
      clientToken: (json['clientToken'] as String?) ?? '',
      fileSystemId: (json['fileSystemId'] as String?) ?? '',
      ownerId: (json['ownerId'] as String?) ?? '',
      status: LifeCycleState.fromString((json['status'] as String?) ?? ''),
      name: json['name'] as String?,
      posixUser: json['posixUser'] != null
          ? PosixUser.fromJson(json['posixUser'] as Map<String, dynamic>)
          : null,
      rootDirectory: json['rootDirectory'] != null
          ? RootDirectory.fromJson(
              json['rootDirectory'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointArn = this.accessPointArn;
    final accessPointId = this.accessPointId;
    final clientToken = this.clientToken;
    final fileSystemId = this.fileSystemId;
    final ownerId = this.ownerId;
    final status = this.status;
    final name = this.name;
    final posixUser = this.posixUser;
    final rootDirectory = this.rootDirectory;
    final tags = this.tags;
    return {
      'accessPointArn': accessPointArn,
      'accessPointId': accessPointId,
      'clientToken': clientToken,
      'fileSystemId': fileSystemId,
      'ownerId': ownerId,
      'status': status.value,
      if (name != null) 'name': name,
      if (posixUser != null) 'posixUser': posixUser,
      if (rootDirectory != null) 'rootDirectory': rootDirectory,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateFileSystemResponse {
  /// The Amazon Resource Name (ARN) of the S3 bucket associated with the file
  /// system.
  final String? bucket;

  /// The client token used for idempotency.
  final String? clientToken;

  /// The time when the file system was created, in seconds since
  /// 1970-01-01T00:00:00Z (Unix epoch time).
  final DateTime? creationTime;

  /// The ARN for the S3 file system, in the format
  /// <code>arn:aws:s3files:region:account-id:file-system/file-system-id</code>.
  final String? fileSystemArn;

  /// The ID of the file system, assigned by S3 Files. This ID is used to
  /// reference the file system in subsequent API calls.
  final String? fileSystemId;

  /// The ARN or alias of the KMS key used for encryption.
  final String? kmsKeyId;

  /// The name of the file system, derived from the <code>Name</code> tag if
  /// present.
  final String? name;

  /// The Amazon Web Services account ID of the file system owner.
  final String? ownerId;

  /// The prefix within the S3 bucket that scopes the file system access.
  final String? prefix;

  /// The ARN of the IAM role used for S3 access.
  final String? roleArn;

  /// The lifecycle state of the file system. Valid values are:
  /// <code>AVAILABLE</code> (the file system is available for use),
  /// <code>CREATING</code> (the file system is being created),
  /// <code>DELETING</code> (the file system is being deleted),
  /// <code>DELETED</code> (the file system has been deleted), <code>ERROR</code>
  /// (the file system is in an error state), or <code>UPDATING</code> (the file
  /// system is being updated).
  final LifeCycleState? status;

  /// Additional information about the file system status. This field provides
  /// more details when the status is <code>ERROR</code>, or during state
  /// transitions.
  final String? statusMessage;

  /// The tags associated with the file system.
  final List<Tag>? tags;

  CreateFileSystemResponse({
    this.bucket,
    this.clientToken,
    this.creationTime,
    this.fileSystemArn,
    this.fileSystemId,
    this.kmsKeyId,
    this.name,
    this.ownerId,
    this.prefix,
    this.roleArn,
    this.status,
    this.statusMessage,
    this.tags,
  });

  factory CreateFileSystemResponse.fromJson(Map<String, dynamic> json) {
    return CreateFileSystemResponse(
      bucket: json['bucket'] as String?,
      clientToken: json['clientToken'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      fileSystemArn: json['fileSystemArn'] as String?,
      fileSystemId: json['fileSystemId'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      ownerId: json['ownerId'] as String?,
      prefix: json['prefix'] as String?,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.let(LifeCycleState.fromString),
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final clientToken = this.clientToken;
    final creationTime = this.creationTime;
    final fileSystemArn = this.fileSystemArn;
    final fileSystemId = this.fileSystemId;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final ownerId = this.ownerId;
    final prefix = this.prefix;
    final roleArn = this.roleArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      if (bucket != null) 'bucket': bucket,
      if (clientToken != null) 'clientToken': clientToken,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (fileSystemArn != null) 'fileSystemArn': fileSystemArn,
      if (fileSystemId != null) 'fileSystemId': fileSystemId,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (ownerId != null) 'ownerId': ownerId,
      if (prefix != null) 'prefix': prefix,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateMountTargetResponse {
  /// The ID of the mount target, assigned by S3 Files. This ID is used to
  /// reference the mount target in subsequent API calls.
  final String mountTargetId;

  /// The Amazon Web Services account ID of the mount target owner.
  final String ownerId;

  /// The ID of the subnet where the mount target is located.
  final String subnetId;

  /// The unique and consistent identifier of the Availability Zone where the
  /// mount target is located. For example, <code>use1-az1</code> is an
  /// Availability Zone ID for the <code>us-east-1</code> Amazon Web Services
  /// Region, and it has the same location in every Amazon Web Services account.
  final String? availabilityZoneId;

  /// The ID of the S3 File System associated with the mount target.
  final String? fileSystemId;

  /// The IPv4 address assigned to the mount target.
  final String? ipv4Address;

  /// The IPv6 address assigned to the mount target.
  final String? ipv6Address;

  /// The ID of the network interface that S3 Files created when it created the
  /// mount target. This network interface is managed by the service.
  final String? networkInterfaceId;

  /// The security groups associated with the mount target's network interface.
  final List<String>? securityGroups;

  /// The lifecycle state of the mount target. Valid values are:
  /// <code>AVAILABLE</code> (the mount target is available for use),
  /// <code>CREATING</code> (the mount target is being created),
  /// <code>DELETING</code> (the mount target is being deleted),
  /// <code>DELETED</code> (the mount target has been deleted), or
  /// <code>ERROR</code> (the mount target is in an error state), or
  /// <code>UPDATING</code> (the mount target is being updated).
  final LifeCycleState? status;

  /// Additional information about the mount target status. This field provides
  /// more details when the status is <code>ERROR</code>, or during state
  /// transitions.
  final String? statusMessage;

  /// The ID of the VPC where the mount target is located.
  final String? vpcId;

  CreateMountTargetResponse({
    required this.mountTargetId,
    required this.ownerId,
    required this.subnetId,
    this.availabilityZoneId,
    this.fileSystemId,
    this.ipv4Address,
    this.ipv6Address,
    this.networkInterfaceId,
    this.securityGroups,
    this.status,
    this.statusMessage,
    this.vpcId,
  });

  factory CreateMountTargetResponse.fromJson(Map<String, dynamic> json) {
    return CreateMountTargetResponse(
      mountTargetId: (json['mountTargetId'] as String?) ?? '',
      ownerId: (json['ownerId'] as String?) ?? '',
      subnetId: (json['subnetId'] as String?) ?? '',
      availabilityZoneId: json['availabilityZoneId'] as String?,
      fileSystemId: json['fileSystemId'] as String?,
      ipv4Address: json['ipv4Address'] as String?,
      ipv6Address: json['ipv6Address'] as String?,
      networkInterfaceId: json['networkInterfaceId'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(LifeCycleState.fromString),
      statusMessage: json['statusMessage'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mountTargetId = this.mountTargetId;
    final ownerId = this.ownerId;
    final subnetId = this.subnetId;
    final availabilityZoneId = this.availabilityZoneId;
    final fileSystemId = this.fileSystemId;
    final ipv4Address = this.ipv4Address;
    final ipv6Address = this.ipv6Address;
    final networkInterfaceId = this.networkInterfaceId;
    final securityGroups = this.securityGroups;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vpcId = this.vpcId;
    return {
      'mountTargetId': mountTargetId,
      'ownerId': ownerId,
      'subnetId': subnetId,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (fileSystemId != null) 'fileSystemId': fileSystemId,
      if (ipv4Address != null) 'ipv4Address': ipv4Address,
      if (ipv6Address != null) 'ipv6Address': ipv6Address,
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class GetAccessPointResponse {
  /// The ARN of the access point.
  final String accessPointArn;

  /// The ID of the access point.
  final String accessPointId;

  /// The client token used for idempotency when the access point was created.
  final String clientToken;

  /// The ID of the S3 File System.
  final String fileSystemId;

  /// The Amazon Web Services account ID of the access point owner.
  final String ownerId;

  /// The current status of the access point.
  final LifeCycleState status;

  /// The name of the access point.
  final String? name;

  /// The POSIX identity configured for this access point.
  final PosixUser? posixUser;

  /// The root directory configuration for this access point.
  final RootDirectory? rootDirectory;

  /// The tags associated with the access point.
  final List<Tag>? tags;

  GetAccessPointResponse({
    required this.accessPointArn,
    required this.accessPointId,
    required this.clientToken,
    required this.fileSystemId,
    required this.ownerId,
    required this.status,
    this.name,
    this.posixUser,
    this.rootDirectory,
    this.tags,
  });

  factory GetAccessPointResponse.fromJson(Map<String, dynamic> json) {
    return GetAccessPointResponse(
      accessPointArn: (json['accessPointArn'] as String?) ?? '',
      accessPointId: (json['accessPointId'] as String?) ?? '',
      clientToken: (json['clientToken'] as String?) ?? '',
      fileSystemId: (json['fileSystemId'] as String?) ?? '',
      ownerId: (json['ownerId'] as String?) ?? '',
      status: LifeCycleState.fromString((json['status'] as String?) ?? ''),
      name: json['name'] as String?,
      posixUser: json['posixUser'] != null
          ? PosixUser.fromJson(json['posixUser'] as Map<String, dynamic>)
          : null,
      rootDirectory: json['rootDirectory'] != null
          ? RootDirectory.fromJson(
              json['rootDirectory'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointArn = this.accessPointArn;
    final accessPointId = this.accessPointId;
    final clientToken = this.clientToken;
    final fileSystemId = this.fileSystemId;
    final ownerId = this.ownerId;
    final status = this.status;
    final name = this.name;
    final posixUser = this.posixUser;
    final rootDirectory = this.rootDirectory;
    final tags = this.tags;
    return {
      'accessPointArn': accessPointArn,
      'accessPointId': accessPointId,
      'clientToken': clientToken,
      'fileSystemId': fileSystemId,
      'ownerId': ownerId,
      'status': status.value,
      if (name != null) 'name': name,
      if (posixUser != null) 'posixUser': posixUser,
      if (rootDirectory != null) 'rootDirectory': rootDirectory,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetFileSystemResponse {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String? bucket;

  /// The client token used for idempotency when the file system was created.
  final String? clientToken;

  /// The time when the file system was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the file system.
  final String? fileSystemArn;

  /// The ID of the file system.
  final String? fileSystemId;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services KMS key used for
  /// encryption.
  final String? kmsKeyId;

  /// The name of the file system.
  final String? name;

  /// The Amazon Web Services account ID of the file system owner.
  final String? ownerId;

  /// The prefix in the S3 bucket that the file system provides access to.
  final String? prefix;

  /// The Amazon Resource Name (ARN) of the IAM role used for S3 access.
  final String? roleArn;

  /// The current status of the file system.
  final LifeCycleState? status;

  /// Additional information about the file system status.
  final String? statusMessage;

  /// The tags associated with the file system.
  final List<Tag>? tags;

  GetFileSystemResponse({
    this.bucket,
    this.clientToken,
    this.creationTime,
    this.fileSystemArn,
    this.fileSystemId,
    this.kmsKeyId,
    this.name,
    this.ownerId,
    this.prefix,
    this.roleArn,
    this.status,
    this.statusMessage,
    this.tags,
  });

  factory GetFileSystemResponse.fromJson(Map<String, dynamic> json) {
    return GetFileSystemResponse(
      bucket: json['bucket'] as String?,
      clientToken: json['clientToken'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      fileSystemArn: json['fileSystemArn'] as String?,
      fileSystemId: json['fileSystemId'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      ownerId: json['ownerId'] as String?,
      prefix: json['prefix'] as String?,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.let(LifeCycleState.fromString),
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final clientToken = this.clientToken;
    final creationTime = this.creationTime;
    final fileSystemArn = this.fileSystemArn;
    final fileSystemId = this.fileSystemId;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final ownerId = this.ownerId;
    final prefix = this.prefix;
    final roleArn = this.roleArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      if (bucket != null) 'bucket': bucket,
      if (clientToken != null) 'clientToken': clientToken,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (fileSystemArn != null) 'fileSystemArn': fileSystemArn,
      if (fileSystemId != null) 'fileSystemId': fileSystemId,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (ownerId != null) 'ownerId': ownerId,
      if (prefix != null) 'prefix': prefix,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetFileSystemPolicyResponse {
  /// The ID of the file system.
  final String fileSystemId;

  /// The JSON-formatted resource policy for the file system.
  final String policy;

  GetFileSystemPolicyResponse({
    required this.fileSystemId,
    required this.policy,
  });

  factory GetFileSystemPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetFileSystemPolicyResponse(
      fileSystemId: (json['fileSystemId'] as String?) ?? '',
      policy: (json['policy'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemId = this.fileSystemId;
    final policy = this.policy;
    return {
      'fileSystemId': fileSystemId,
      'policy': policy,
    };
  }
}

class GetMountTargetResponse {
  /// The ID of the mount target.
  final String mountTargetId;

  /// The Amazon Web Services account ID of the mount target owner.
  final String ownerId;

  /// The ID of the subnet where the mount target is located.
  final String subnetId;

  /// The Availability Zone ID where the mount target is located.
  final String? availabilityZoneId;

  /// The ID of the file system.
  final String? fileSystemId;

  /// The IPv4 address of the mount target.
  final String? ipv4Address;

  /// The IPv6 address of the mount target.
  final String? ipv6Address;

  /// The ID of the network interface associated with the mount target.
  final String? networkInterfaceId;

  /// The security groups associated with the mount target.
  final List<String>? securityGroups;

  /// The current status of the mount target.
  final LifeCycleState? status;

  /// Additional information about the mount target status.
  final String? statusMessage;

  /// The ID of the VPC where the mount target is located.
  final String? vpcId;

  GetMountTargetResponse({
    required this.mountTargetId,
    required this.ownerId,
    required this.subnetId,
    this.availabilityZoneId,
    this.fileSystemId,
    this.ipv4Address,
    this.ipv6Address,
    this.networkInterfaceId,
    this.securityGroups,
    this.status,
    this.statusMessage,
    this.vpcId,
  });

  factory GetMountTargetResponse.fromJson(Map<String, dynamic> json) {
    return GetMountTargetResponse(
      mountTargetId: (json['mountTargetId'] as String?) ?? '',
      ownerId: (json['ownerId'] as String?) ?? '',
      subnetId: (json['subnetId'] as String?) ?? '',
      availabilityZoneId: json['availabilityZoneId'] as String?,
      fileSystemId: json['fileSystemId'] as String?,
      ipv4Address: json['ipv4Address'] as String?,
      ipv6Address: json['ipv6Address'] as String?,
      networkInterfaceId: json['networkInterfaceId'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(LifeCycleState.fromString),
      statusMessage: json['statusMessage'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mountTargetId = this.mountTargetId;
    final ownerId = this.ownerId;
    final subnetId = this.subnetId;
    final availabilityZoneId = this.availabilityZoneId;
    final fileSystemId = this.fileSystemId;
    final ipv4Address = this.ipv4Address;
    final ipv6Address = this.ipv6Address;
    final networkInterfaceId = this.networkInterfaceId;
    final securityGroups = this.securityGroups;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vpcId = this.vpcId;
    return {
      'mountTargetId': mountTargetId,
      'ownerId': ownerId,
      'subnetId': subnetId,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (fileSystemId != null) 'fileSystemId': fileSystemId,
      if (ipv4Address != null) 'ipv4Address': ipv4Address,
      if (ipv6Address != null) 'ipv6Address': ipv6Address,
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class GetSynchronizationConfigurationResponse {
  /// An array of expiration data rules that control when cached data expires from
  /// the file system.
  final List<ExpirationDataRule> expirationDataRules;

  /// An array of import data rules that control how data is imported from S3 into
  /// the file system.
  final List<ImportDataRule> importDataRules;

  /// The version number of the synchronization configuration. Use this value with
  /// <code>PutSynchronizationConfiguration</code> to ensure optimistic
  /// concurrency control.
  final int? latestVersionNumber;

  GetSynchronizationConfigurationResponse({
    required this.expirationDataRules,
    required this.importDataRules,
    this.latestVersionNumber,
  });

  factory GetSynchronizationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSynchronizationConfigurationResponse(
      expirationDataRules: ((json['expirationDataRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => ExpirationDataRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      importDataRules: ((json['importDataRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => ImportDataRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestVersionNumber: json['latestVersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final expirationDataRules = this.expirationDataRules;
    final importDataRules = this.importDataRules;
    final latestVersionNumber = this.latestVersionNumber;
    return {
      'expirationDataRules': expirationDataRules,
      'importDataRules': importDataRules,
      if (latestVersionNumber != null)
        'latestVersionNumber': latestVersionNumber,
    };
  }
}

class ListAccessPointsResponse {
  /// An array of access point descriptions.
  final List<ListAccessPointsDescription> accessPoints;

  /// A pagination token to use in a subsequent request if more results are
  /// available.
  final String? nextToken;

  ListAccessPointsResponse({
    required this.accessPoints,
    this.nextToken,
  });

  factory ListAccessPointsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessPointsResponse(
      accessPoints: ((json['accessPoints'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ListAccessPointsDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPoints = this.accessPoints;
    final nextToken = this.nextToken;
    return {
      'accessPoints': accessPoints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFileSystemsResponse {
  /// An array of file system descriptions.
  final List<ListFileSystemsDescription> fileSystems;

  /// A pagination token to use in a subsequent request if more results are
  /// available.
  final String? nextToken;

  ListFileSystemsResponse({
    required this.fileSystems,
    this.nextToken,
  });

  factory ListFileSystemsResponse.fromJson(Map<String, dynamic> json) {
    return ListFileSystemsResponse(
      fileSystems: ((json['fileSystems'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ListFileSystemsDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystems = this.fileSystems;
    final nextToken = this.nextToken;
    return {
      'fileSystems': fileSystems,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListMountTargetsResponse {
  /// An array of mount target descriptions.
  final List<ListMountTargetsDescription> mountTargets;

  /// A pagination token to use in a subsequent request if more results are
  /// available.
  final String? nextToken;

  ListMountTargetsResponse({
    required this.mountTargets,
    this.nextToken,
  });

  factory ListMountTargetsResponse.fromJson(Map<String, dynamic> json) {
    return ListMountTargetsResponse(
      mountTargets: ((json['mountTargets'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ListMountTargetsDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mountTargets = this.mountTargets;
    final nextToken = this.nextToken;
    return {
      'mountTargets': mountTargets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A pagination token to use in a subsequent request if more results are
  /// available.
  final String? nextToken;

  /// An array of tags associated with the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
    };
  }
}

class PutFileSystemPolicyResponse {
  PutFileSystemPolicyResponse();

  factory PutFileSystemPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutFileSystemPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutSynchronizationConfigurationResponse {
  PutSynchronizationConfigurationResponse();

  factory PutSynchronizationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return PutSynchronizationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateMountTargetResponse {
  /// The ID of the mount target.
  final String mountTargetId;

  /// The Amazon Web Services account ID of the mount target owner.
  final String ownerId;

  /// The ID of the subnet where the mount target is located.
  final String subnetId;

  /// The Availability Zone ID where the mount target is located.
  final String? availabilityZoneId;

  /// The ID of the S3 File System.
  final String? fileSystemId;

  /// The IPv4 address of the mount target.
  final String? ipv4Address;

  /// The IPv6 address of the mount target.
  final String? ipv6Address;

  /// The ID of the network interface associated with the mount target.
  final String? networkInterfaceId;

  /// The security groups associated with the mount target.
  final List<String>? securityGroups;

  /// The current status of the mount target.
  final LifeCycleState? status;

  /// Additional information about the mount target status.
  final String? statusMessage;

  /// The ID of the VPC where the mount target is located.
  final String? vpcId;

  UpdateMountTargetResponse({
    required this.mountTargetId,
    required this.ownerId,
    required this.subnetId,
    this.availabilityZoneId,
    this.fileSystemId,
    this.ipv4Address,
    this.ipv6Address,
    this.networkInterfaceId,
    this.securityGroups,
    this.status,
    this.statusMessage,
    this.vpcId,
  });

  factory UpdateMountTargetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMountTargetResponse(
      mountTargetId: (json['mountTargetId'] as String?) ?? '',
      ownerId: (json['ownerId'] as String?) ?? '',
      subnetId: (json['subnetId'] as String?) ?? '',
      availabilityZoneId: json['availabilityZoneId'] as String?,
      fileSystemId: json['fileSystemId'] as String?,
      ipv4Address: json['ipv4Address'] as String?,
      ipv6Address: json['ipv6Address'] as String?,
      networkInterfaceId: json['networkInterfaceId'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(LifeCycleState.fromString),
      statusMessage: json['statusMessage'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mountTargetId = this.mountTargetId;
    final ownerId = this.ownerId;
    final subnetId = this.subnetId;
    final availabilityZoneId = this.availabilityZoneId;
    final fileSystemId = this.fileSystemId;
    final ipv4Address = this.ipv4Address;
    final ipv6Address = this.ipv6Address;
    final networkInterfaceId = this.networkInterfaceId;
    final securityGroups = this.securityGroups;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vpcId = this.vpcId;
    return {
      'mountTargetId': mountTargetId,
      'ownerId': ownerId,
      'subnetId': subnetId,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (fileSystemId != null) 'fileSystemId': fileSystemId,
      if (ipv4Address != null) 'ipv4Address': ipv4Address,
      if (ipv6Address != null) 'ipv6Address': ipv6Address,
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class LifeCycleState {
  static const available = LifeCycleState._('available');
  static const creating = LifeCycleState._('creating');
  static const deleting = LifeCycleState._('deleting');
  static const deleted = LifeCycleState._('deleted');
  static const error = LifeCycleState._('error');
  static const updating = LifeCycleState._('updating');

  final String value;

  const LifeCycleState._(this.value);

  static const values = [
    available,
    creating,
    deleting,
    deleted,
    error,
    updating
  ];

  static LifeCycleState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LifeCycleState._(value));

  @override
  bool operator ==(other) => other is LifeCycleState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A key-value pair for resource tagging.
class Tag {
  /// The tag key. The key can't start with <code>aws:</code>.
  final String key;

  /// The tag value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Specifies a rule that controls when cached data expires from the file system
/// based on last access time.
class ExpirationDataRule {
  /// The number of days after last access before cached data expires from the
  /// file system.
  final int daysAfterLastAccess;

  ExpirationDataRule({
    required this.daysAfterLastAccess,
  });

  factory ExpirationDataRule.fromJson(Map<String, dynamic> json) {
    return ExpirationDataRule(
      daysAfterLastAccess: (json['daysAfterLastAccess'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final daysAfterLastAccess = this.daysAfterLastAccess;
    return {
      'daysAfterLastAccess': daysAfterLastAccess,
    };
  }
}

/// Specifies a rule that controls how data is imported from S3 into the file
/// system.
class ImportDataRule {
  /// The S3 key prefix that scopes this import rule. Only objects with keys
  /// beginning with this prefix are subject to the rule.
  final String prefix;

  /// The upper size limit in bytes for this import rule. Only objects with a size
  /// strictly less than this value will have data imported into the file system.
  final int sizeLessThan;

  /// The event that triggers data import. Valid values are
  /// <code>ON_DIRECTORY_FIRST_ACCESS</code> (import when a directory is first
  /// accessed) and <code>ON_FILE_ACCESS</code> (import when a file is accessed).
  final ImportTrigger trigger;

  ImportDataRule({
    required this.prefix,
    required this.sizeLessThan,
    required this.trigger,
  });

  factory ImportDataRule.fromJson(Map<String, dynamic> json) {
    return ImportDataRule(
      prefix: (json['prefix'] as String?) ?? '',
      sizeLessThan: (json['sizeLessThan'] as int?) ?? 0,
      trigger: ImportTrigger.fromString((json['trigger'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final prefix = this.prefix;
    final sizeLessThan = this.sizeLessThan;
    final trigger = this.trigger;
    return {
      'prefix': prefix,
      'sizeLessThan': sizeLessThan,
      'trigger': trigger.value,
    };
  }
}

class ImportTrigger {
  static const onDirectoryFirstAccess =
      ImportTrigger._('ON_DIRECTORY_FIRST_ACCESS');
  static const onFileAccess = ImportTrigger._('ON_FILE_ACCESS');

  final String value;

  const ImportTrigger._(this.value);

  static const values = [onDirectoryFirstAccess, onFileAccess];

  static ImportTrigger fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImportTrigger._(value));

  @override
  bool operator ==(other) => other is ImportTrigger && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a mount target returned in list operations.
class ListMountTargetsDescription {
  /// The ID of the mount target.
  final String mountTargetId;

  /// The Amazon Web Services account ID of the mount target owner.
  final String ownerId;

  /// The ID of the subnet where the mount target is located.
  final String subnetId;

  /// The Availability Zone ID where the mount target is located.
  final String? availabilityZoneId;

  /// The ID of the S3 File System.
  final String? fileSystemId;

  /// The IPv4 address of the mount target.
  final String? ipv4Address;

  /// The IPv6 address of the mount target.
  final String? ipv6Address;

  /// The ID of the network interface associated with the mount target.
  final String? networkInterfaceId;

  /// The current status of the mount target.
  final LifeCycleState? status;

  /// Additional information about the mount target status.
  final String? statusMessage;

  /// The ID of the VPC where the mount target is located.
  final String? vpcId;

  ListMountTargetsDescription({
    required this.mountTargetId,
    required this.ownerId,
    required this.subnetId,
    this.availabilityZoneId,
    this.fileSystemId,
    this.ipv4Address,
    this.ipv6Address,
    this.networkInterfaceId,
    this.status,
    this.statusMessage,
    this.vpcId,
  });

  factory ListMountTargetsDescription.fromJson(Map<String, dynamic> json) {
    return ListMountTargetsDescription(
      mountTargetId: (json['mountTargetId'] as String?) ?? '',
      ownerId: (json['ownerId'] as String?) ?? '',
      subnetId: (json['subnetId'] as String?) ?? '',
      availabilityZoneId: json['availabilityZoneId'] as String?,
      fileSystemId: json['fileSystemId'] as String?,
      ipv4Address: json['ipv4Address'] as String?,
      ipv6Address: json['ipv6Address'] as String?,
      networkInterfaceId: json['networkInterfaceId'] as String?,
      status: (json['status'] as String?)?.let(LifeCycleState.fromString),
      statusMessage: json['statusMessage'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mountTargetId = this.mountTargetId;
    final ownerId = this.ownerId;
    final subnetId = this.subnetId;
    final availabilityZoneId = this.availabilityZoneId;
    final fileSystemId = this.fileSystemId;
    final ipv4Address = this.ipv4Address;
    final ipv6Address = this.ipv6Address;
    final networkInterfaceId = this.networkInterfaceId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vpcId = this.vpcId;
    return {
      'mountTargetId': mountTargetId,
      'ownerId': ownerId,
      'subnetId': subnetId,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (fileSystemId != null) 'fileSystemId': fileSystemId,
      if (ipv4Address != null) 'ipv4Address': ipv4Address,
      if (ipv6Address != null) 'ipv6Address': ipv6Address,
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Contains information about an S3 File System returned in list operations.
class ListFileSystemsDescription {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String bucket;

  /// The time when the file system was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the file system.
  final String fileSystemArn;

  /// The ID of the file system.
  final String fileSystemId;

  /// The Amazon Web Services account ID of the file system owner.
  final String ownerId;

  /// The Amazon Resource Name (ARN) of the IAM role used for S3 access.
  final String roleArn;

  /// The current status of the file system.
  final LifeCycleState status;

  /// The name of the file system.
  final String? name;

  /// Additional information about the file system status.
  final String? statusMessage;

  ListFileSystemsDescription({
    required this.bucket,
    required this.creationTime,
    required this.fileSystemArn,
    required this.fileSystemId,
    required this.ownerId,
    required this.roleArn,
    required this.status,
    this.name,
    this.statusMessage,
  });

  factory ListFileSystemsDescription.fromJson(Map<String, dynamic> json) {
    return ListFileSystemsDescription(
      bucket: (json['bucket'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      fileSystemArn: (json['fileSystemArn'] as String?) ?? '',
      fileSystemId: (json['fileSystemId'] as String?) ?? '',
      ownerId: (json['ownerId'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: LifeCycleState.fromString((json['status'] as String?) ?? ''),
      name: json['name'] as String?,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final creationTime = this.creationTime;
    final fileSystemArn = this.fileSystemArn;
    final fileSystemId = this.fileSystemId;
    final ownerId = this.ownerId;
    final roleArn = this.roleArn;
    final status = this.status;
    final name = this.name;
    final statusMessage = this.statusMessage;
    return {
      'bucket': bucket,
      'creationTime': unixTimestampToJson(creationTime),
      'fileSystemArn': fileSystemArn,
      'fileSystemId': fileSystemId,
      'ownerId': ownerId,
      'roleArn': roleArn,
      'status': status.value,
      if (name != null) 'name': name,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// Contains information about an S3 File System Access Point returned in list
/// operations.
class ListAccessPointsDescription {
  /// The Amazon Resource Name (ARN) of the access point.
  final String accessPointArn;

  /// The ID of the access point.
  final String accessPointId;

  /// The ID of the S3 File System.
  final String fileSystemId;

  /// The Amazon Web Services account ID of the access point owner.
  final String ownerId;

  /// The current status of the access point.
  final LifeCycleState status;

  /// The name of the access point.
  final String? name;

  /// The POSIX identity configured for this access point.
  final PosixUser? posixUser;

  /// The root directory configuration for this access point.
  final RootDirectory? rootDirectory;

  ListAccessPointsDescription({
    required this.accessPointArn,
    required this.accessPointId,
    required this.fileSystemId,
    required this.ownerId,
    required this.status,
    this.name,
    this.posixUser,
    this.rootDirectory,
  });

  factory ListAccessPointsDescription.fromJson(Map<String, dynamic> json) {
    return ListAccessPointsDescription(
      accessPointArn: (json['accessPointArn'] as String?) ?? '',
      accessPointId: (json['accessPointId'] as String?) ?? '',
      fileSystemId: (json['fileSystemId'] as String?) ?? '',
      ownerId: (json['ownerId'] as String?) ?? '',
      status: LifeCycleState.fromString((json['status'] as String?) ?? ''),
      name: json['name'] as String?,
      posixUser: json['posixUser'] != null
          ? PosixUser.fromJson(json['posixUser'] as Map<String, dynamic>)
          : null,
      rootDirectory: json['rootDirectory'] != null
          ? RootDirectory.fromJson(
              json['rootDirectory'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointArn = this.accessPointArn;
    final accessPointId = this.accessPointId;
    final fileSystemId = this.fileSystemId;
    final ownerId = this.ownerId;
    final status = this.status;
    final name = this.name;
    final posixUser = this.posixUser;
    final rootDirectory = this.rootDirectory;
    return {
      'accessPointArn': accessPointArn,
      'accessPointId': accessPointId,
      'fileSystemId': fileSystemId,
      'ownerId': ownerId,
      'status': status.value,
      if (name != null) 'name': name,
      if (posixUser != null) 'posixUser': posixUser,
      if (rootDirectory != null) 'rootDirectory': rootDirectory,
    };
  }
}

/// Specifies the POSIX identity with uid, gid, and secondary group IDs for user
/// enforcement.
class PosixUser {
  /// The POSIX group ID.
  final int gid;

  /// The POSIX user ID.
  final int uid;

  /// An array of secondary POSIX group IDs.
  final List<int>? secondaryGids;

  PosixUser({
    required this.gid,
    required this.uid,
    this.secondaryGids,
  });

  factory PosixUser.fromJson(Map<String, dynamic> json) {
    return PosixUser(
      gid: (json['gid'] as int?) ?? 0,
      uid: (json['uid'] as int?) ?? 0,
      secondaryGids: (json['secondaryGids'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final gid = this.gid;
    final uid = this.uid;
    final secondaryGids = this.secondaryGids;
    return {
      'gid': gid,
      'uid': uid,
      if (secondaryGids != null) 'secondaryGids': secondaryGids,
    };
  }
}

/// Specifies the root directory path and optional creation permissions for
/// newly created directories.
class RootDirectory {
  /// The permissions to set on newly created directories.
  final CreationPermissions? creationPermissions;

  /// The path to use as the root directory for the access point.
  final String? path;

  RootDirectory({
    this.creationPermissions,
    this.path,
  });

  factory RootDirectory.fromJson(Map<String, dynamic> json) {
    return RootDirectory(
      creationPermissions: json['creationPermissions'] != null
          ? CreationPermissions.fromJson(
              json['creationPermissions'] as Map<String, dynamic>)
          : null,
      path: json['path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationPermissions = this.creationPermissions;
    final path = this.path;
    return {
      if (creationPermissions != null)
        'creationPermissions': creationPermissions,
      if (path != null) 'path': path,
    };
  }
}

/// Specifies the permissions to set on newly created directories within the
/// file system.
class CreationPermissions {
  /// The POSIX group ID to assign to newly created directories.
  final int ownerGid;

  /// The POSIX user ID to assign to newly created directories.
  final int ownerUid;

  /// The octal permissions to assign to newly created directories.
  final String permissions;

  CreationPermissions({
    required this.ownerGid,
    required this.ownerUid,
    required this.permissions,
  });

  factory CreationPermissions.fromJson(Map<String, dynamic> json) {
    return CreationPermissions(
      ownerGid: (json['ownerGid'] as int?) ?? 0,
      ownerUid: (json['ownerUid'] as int?) ?? 0,
      permissions: (json['permissions'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final ownerGid = this.ownerGid;
    final ownerUid = this.ownerUid;
    final permissions = this.permissions;
    return {
      'ownerGid': ownerGid,
      'ownerUid': ownerUid,
      'permissions': permissions,
    };
  }
}

class IpAddressType {
  static const ipv4Only = IpAddressType._('IPV4_ONLY');
  static const ipv6Only = IpAddressType._('IPV6_ONLY');
  static const dualStack = IpAddressType._('DUAL_STACK');

  final String value;

  const IpAddressType._(this.value);

  static const values = [ipv4Only, ipv6Only, dualStack];

  static IpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IpAddressType._(value));

  @override
  bool operator ==(other) => other is IpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
