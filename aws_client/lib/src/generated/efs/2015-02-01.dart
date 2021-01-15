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

export '../../shared/shared.dart' show AwsClientCredentials;

part '2015-02-01.g.dart';

/// Amazon Elastic File System (Amazon EFS) provides simple, scalable file
/// storage for use with Amazon EC2 instances in the AWS Cloud. With Amazon EFS,
/// storage capacity is elastic, growing and shrinking automatically as you add
/// and remove files, so your applications have the storage they need, when they
/// need it. For more information, see the <a
/// href="https://docs.aws.amazon.com/efs/latest/ug/api-reference.html">User
/// Guide</a>.
class Efs {
  final _s.RestJsonProtocol _protocol;
  Efs({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'elasticfilesystem',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an EFS access point. An access point is an application-specific
  /// view into an EFS file system that applies an operating system user and
  /// group, and a file system path, to any file system request made through the
  /// access point. The operating system user and group override any identity
  /// information provided by the NFS client. The file system path is exposed as
  /// the access point's root directory. Applications using the access point can
  /// only access data in its own directory and below. To learn more, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html">Mounting
  /// a File System Using EFS Access Points</a>.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:CreateAccessPoint</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [AccessPointAlreadyExists].
  /// May throw [IncorrectFileSystemLifeCycleState].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [AccessPointLimitExceeded].
  ///
  /// Parameter [clientToken] :
  /// A string of up to 64 ASCII characters that Amazon EFS uses to ensure
  /// idempotent creation.
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the EFS file system that the access point provides access to.
  ///
  /// Parameter [posixUser] :
  /// The operating system user and group applied to all file system requests
  /// made using the access point.
  ///
  /// Parameter [rootDirectory] :
  /// Specifies the directory on the Amazon EFS file system that the access
  /// point exposes as the root directory of your file system to NFS clients
  /// using the access point. The clients using the access point can only access
  /// the root directory and below. If the <code>RootDirectory</code> &gt;
  /// <code>Path</code> specified does not exist, EFS creates it and applies the
  /// <code>CreationInfo</code> settings when a client connects to an access
  /// point. When specifying a <code>RootDirectory</code>, you need to provide
  /// the <code>Path</code>, and the <code>CreationInfo</code> is optional.
  ///
  /// Parameter [tags] :
  /// Creates tags associated with the access point. Each tag is a key-value
  /// pair.
  Future<AccessPointDescription> createAccessPoint({
    @_s.required String clientToken,
    @_s.required String fileSystemId,
    PosixUser posixUser,
    RootDirectory rootDirectory,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      'FileSystemId': fileSystemId,
      if (posixUser != null) 'PosixUser': posixUser,
      if (rootDirectory != null) 'RootDirectory': rootDirectory,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-02-01/access-points',
      exceptionFnMap: _exceptionFns,
    );
    return AccessPointDescription.fromJson(response);
  }

  /// Creates a new, empty file system. The operation requires a creation token
  /// in the request that Amazon EFS uses to ensure idempotent creation (calling
  /// the operation with same creation token has no effect). If a file system
  /// does not currently exist that is owned by the caller's AWS account with
  /// the specified creation token, this operation does the following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new, empty file system. The file system will have an Amazon EFS
  /// assigned ID, and an initial lifecycle state <code>creating</code>.
  /// </li>
  /// <li>
  /// Returns with the description of the created file system.
  /// </li>
  /// </ul>
  /// Otherwise, this operation returns a <code>FileSystemAlreadyExists</code>
  /// error with the ID of the existing file system.
  /// <note>
  /// For basic use cases, you can use a randomly generated UUID for the
  /// creation token.
  /// </note>
  /// The idempotent operation allows you to retry a
  /// <code>CreateFileSystem</code> call without risk of creating an extra file
  /// system. This can happen when an initial call fails in a way that leaves it
  /// uncertain whether or not a file system was actually created. An example
  /// might be that a transport level timeout occurred or your connection was
  /// reset. As long as you use the same creation token, if the initial call had
  /// succeeded in creating a file system, the client can learn of its existence
  /// from the <code>FileSystemAlreadyExists</code> error.
  /// <note>
  /// The <code>CreateFileSystem</code> call returns while the file system's
  /// lifecycle state is still <code>creating</code>. You can check the file
  /// system creation status by calling the <a>DescribeFileSystems</a>
  /// operation, which among other things returns the file system state.
  /// </note>
  /// This operation also takes an optional <code>PerformanceMode</code>
  /// parameter that you choose for your file system. We recommend
  /// <code>generalPurpose</code> performance mode for most file systems. File
  /// systems using the <code>maxIO</code> performance mode can scale to higher
  /// levels of aggregate throughput and operations per second with a tradeoff
  /// of slightly higher latencies for most file operations. The performance
  /// mode can't be changed after the file system has been created. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/performance.html#performancemodes.html">Amazon
  /// EFS: Performance Modes</a>.
  ///
  /// After the file system is fully created, Amazon EFS sets its lifecycle
  /// state to <code>available</code>, at which point you can create one or more
  /// mount targets for the file system in your VPC. For more information, see
  /// <a>CreateMountTarget</a>. You mount your Amazon EFS file system on an EC2
  /// instances in your VPC by using the mount target. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/how-it-works.html">Amazon
  /// EFS: How it Works</a>.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:CreateFileSystem</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemAlreadyExists].
  /// May throw [FileSystemLimitExceeded].
  /// May throw [InsufficientThroughputCapacity].
  /// May throw [ThroughputLimitExceeded].
  ///
  /// Parameter [creationToken] :
  /// A string of up to 64 ASCII characters. Amazon EFS uses this to ensure
  /// idempotent creation.
  ///
  /// Parameter [encrypted] :
  /// A Boolean value that, if true, creates an encrypted file system. When
  /// creating an encrypted file system, you have the option of specifying
  /// <a>CreateFileSystemRequest$KmsKeyId</a> for an existing AWS Key Management
  /// Service (AWS KMS) customer master key (CMK). If you don't specify a CMK,
  /// then the default CMK for Amazon EFS, <code>/aws/elasticfilesystem</code>,
  /// is used to protect the encrypted file system.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the AWS KMS CMK to be used to protect the encrypted file system.
  /// This parameter is only required if you want to use a nondefault CMK. If
  /// this parameter is not specified, the default CMK for Amazon EFS is used.
  /// This ID can be in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// Key ID - A unique identifier of the key, for example
  /// <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// ARN - An Amazon Resource Name (ARN) for the key, for example
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Key alias - A previously created display name for a key, for example
  /// <code>alias/projectKey1</code>.
  /// </li>
  /// <li>
  /// Key alias ARN - An ARN for a key alias, for example
  /// <code>arn:aws:kms:us-west-2:444455556666:alias/projectKey1</code>.
  /// </li>
  /// </ul>
  /// If <code>KmsKeyId</code> is specified, the
  /// <a>CreateFileSystemRequest$Encrypted</a> parameter must be set to true.
  /// <important>
  /// EFS accepts only symmetric CMKs. You cannot use asymmetric CMKs with EFS
  /// file systems.
  /// </important>
  ///
  /// Parameter [performanceMode] :
  /// The performance mode of the file system. We recommend
  /// <code>generalPurpose</code> performance mode for most file systems. File
  /// systems using the <code>maxIO</code> performance mode can scale to higher
  /// levels of aggregate throughput and operations per second with a tradeoff
  /// of slightly higher latencies for most file operations. The performance
  /// mode can't be changed after the file system has been created.
  ///
  /// Parameter [provisionedThroughputInMibps] :
  /// The throughput, measured in MiB/s, that you want to provision for a file
  /// system that you're creating. Valid values are 1-1024. Required if
  /// <code>ThroughputMode</code> is set to <code>provisioned</code>. The upper
  /// limit for throughput is 1024 MiB/s. You can get this limit increased by
  /// contacting AWS Support. For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/limits.html#soft-limits">Amazon
  /// EFS Limits That You Can Increase</a> in the <i>Amazon EFS User Guide.</i>
  ///
  /// Parameter [tags] :
  /// A value that specifies to create one or more tags associated with the file
  /// system. Each tag is a user-defined key-value pair. Name your file system
  /// on creation by including a <code>"Key":"Name","Value":"{value}"</code>
  /// key-value pair.
  ///
  /// Parameter [throughputMode] :
  /// The throughput mode for the file system to be created. There are two
  /// throughput modes to choose from for your file system:
  /// <code>bursting</code> and <code>provisioned</code>. If you set
  /// <code>ThroughputMode</code> to <code>provisioned</code>, you must also set
  /// a value for <code>ProvisionedThroughPutInMibps</code>. You can decrease
  /// your file system's throughput in Provisioned Throughput mode or change
  /// between the throughput modes as long as it’s been more than 24 hours since
  /// the last decrease or throughput mode change. For more, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/performance.html#provisioned-throughput">Specifying
  /// Throughput with Provisioned Mode</a> in the <i>Amazon EFS User Guide.</i>
  Future<FileSystemDescription> createFileSystem({
    @_s.required String creationToken,
    bool encrypted,
    String kmsKeyId,
    PerformanceMode performanceMode,
    double provisionedThroughputInMibps,
    List<Tag> tags,
    ThroughputMode throughputMode,
  }) async {
    ArgumentError.checkNotNull(creationToken, 'creationToken');
    _s.validateStringLength(
      'creationToken',
      creationToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'creationToken',
      creationToken,
      r'''.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      0,
      2048,
    );
    _s.validateStringPattern(
      'kmsKeyId',
      kmsKeyId,
      r'''^([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}|alias/[a-zA-Z0-9/_-]+|(arn:aws[-a-z]*:kms:[a-z0-9-]+:\d{12}:((key/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})|(alias/[a-zA-Z0-9/_-]+))))$''',
    );
    _s.validateNumRange(
      'provisionedThroughputInMibps',
      provisionedThroughputInMibps,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'CreationToken': creationToken ?? _s.generateIdempotencyToken(),
      if (encrypted != null) 'Encrypted': encrypted,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (performanceMode != null) 'PerformanceMode': performanceMode.toValue(),
      if (provisionedThroughputInMibps != null)
        'ProvisionedThroughputInMibps': provisionedThroughputInMibps,
      if (tags != null) 'Tags': tags,
      if (throughputMode != null) 'ThroughputMode': throughputMode.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-02-01/file-systems',
      exceptionFnMap: _exceptionFns,
    );
    return FileSystemDescription.fromJson(response);
  }

  /// Creates a mount target for a file system. You can then mount the file
  /// system on EC2 instances by using the mount target.
  ///
  /// You can create one mount target in each Availability Zone in your VPC. All
  /// EC2 instances in a VPC within a given Availability Zone share a single
  /// mount target for a given file system. If you have multiple subnets in an
  /// Availability Zone, you create a mount target in one of the subnets. EC2
  /// instances do not need to be in the same subnet as the mount target in
  /// order to access their file system. For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/how-it-works.html">Amazon
  /// EFS: How it Works</a>.
  ///
  /// In the request, you also specify a file system ID for which you are
  /// creating the mount target and the file system's lifecycle state must be
  /// <code>available</code>. For more information, see
  /// <a>DescribeFileSystems</a>.
  ///
  /// In the request, you also provide a subnet ID, which determines the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// VPC in which Amazon EFS creates the mount target
  /// </li>
  /// <li>
  /// Availability Zone in which Amazon EFS creates the mount target
  /// </li>
  /// <li>
  /// IP address range from which Amazon EFS selects the IP address of the mount
  /// target (if you don't specify an IP address in the request)
  /// </li>
  /// </ul>
  /// After creating the mount target, Amazon EFS returns a response that
  /// includes, a <code>MountTargetId</code> and an <code>IpAddress</code>. You
  /// use this IP address when mounting the file system in an EC2 instance. You
  /// can also use the mount target's DNS name when mounting the file system.
  /// The EC2 instance on which you mount the file system by using the mount
  /// target can resolve the mount target's DNS name to its IP address. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/how-it-works.html#how-it-works-implementation">How
  /// it Works: Implementation Overview</a>.
  ///
  /// Note that you can create mount targets for a file system in only one VPC,
  /// and there can be only one mount target per Availability Zone. That is, if
  /// the file system already has one or more mount targets created for it, the
  /// subnet specified in the request to add another mount target must meet the
  /// following requirements:
  ///
  /// <ul>
  /// <li>
  /// Must belong to the same VPC as the subnets of the existing mount targets
  /// </li>
  /// <li>
  /// Must not be in the same Availability Zone as any of the subnets of the
  /// existing mount targets
  /// </li>
  /// </ul>
  /// If the request satisfies the requirements, Amazon EFS does the following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new mount target in the specified subnet.
  /// </li>
  /// <li>
  /// Also creates a new network interface in the subnet as follows:
  ///
  /// <ul>
  /// <li>
  /// If the request provides an <code>IpAddress</code>, Amazon EFS assigns that
  /// IP address to the network interface. Otherwise, Amazon EFS assigns a free
  /// address in the subnet (in the same way that the Amazon EC2
  /// <code>CreateNetworkInterface</code> call does when a request does not
  /// specify a primary private IP address).
  /// </li>
  /// <li>
  /// If the request provides <code>SecurityGroups</code>, this network
  /// interface is associated with those security groups. Otherwise, it belongs
  /// to the default security group for the subnet's VPC.
  /// </li>
  /// <li>
  /// Assigns the description <code>Mount target <i>fsmt-id</i> for file system
  /// <i>fs-id</i> </code> where <code> <i>fsmt-id</i> </code> is the mount
  /// target ID, and <code> <i>fs-id</i> </code> is the
  /// <code>FileSystemId</code>.
  /// </li>
  /// <li>
  /// Sets the <code>requesterManaged</code> property of the network interface
  /// to <code>true</code>, and the <code>requesterId</code> value to
  /// <code>EFS</code>.
  /// </li>
  /// </ul>
  /// Each Amazon EFS mount target has one corresponding requester-managed EC2
  /// network interface. After the network interface is created, Amazon EFS sets
  /// the <code>NetworkInterfaceId</code> field in the mount target's
  /// description to the network interface ID, and the <code>IpAddress</code>
  /// field to its address. If network interface creation fails, the entire
  /// <code>CreateMountTarget</code> operation fails.
  /// </li>
  /// </ul> <note>
  /// The <code>CreateMountTarget</code> call returns only after creating the
  /// network interface, but while the mount target state is still
  /// <code>creating</code>, you can check the mount target creation status by
  /// calling the <a>DescribeMountTargets</a> operation, which among other
  /// things returns the mount target state.
  /// </note>
  /// We recommend that you create a mount target in each of the Availability
  /// Zones. There are cost considerations for using a file system in an
  /// Availability Zone through a mount target created in another Availability
  /// Zone. For more information, see <a
  /// href="http://aws.amazon.com/efs/">Amazon EFS</a>. In addition, by always
  /// using a mount target local to the instance's Availability Zone, you
  /// eliminate a partial failure scenario. If the Availability Zone in which
  /// your mount target is created goes down, then you can't access your file
  /// system through that mount target.
  ///
  /// This operation requires permissions for the following action on the file
  /// system:
  ///
  /// <ul>
  /// <li>
  /// <code>elasticfilesystem:CreateMountTarget</code>
  /// </li>
  /// </ul>
  /// This operation also requires permissions for the following Amazon EC2
  /// actions:
  ///
  /// <ul>
  /// <li>
  /// <code>ec2:DescribeSubnets</code>
  /// </li>
  /// <li>
  /// <code>ec2:DescribeNetworkInterfaces</code>
  /// </li>
  /// <li>
  /// <code>ec2:CreateNetworkInterface</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [IncorrectFileSystemLifeCycleState].
  /// May throw [MountTargetConflict].
  /// May throw [SubnetNotFound].
  /// May throw [NoFreeAddressesInSubnet].
  /// May throw [IpAddressInUse].
  /// May throw [NetworkInterfaceLimitExceeded].
  /// May throw [SecurityGroupLimitExceeded].
  /// May throw [SecurityGroupNotFound].
  /// May throw [UnsupportedAvailabilityZone].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system for which to create the mount target.
  ///
  /// Parameter [subnetId] :
  /// The ID of the subnet to add the mount target in.
  ///
  /// Parameter [ipAddress] :
  /// Valid IPv4 address within the address range of the specified subnet.
  ///
  /// Parameter [securityGroups] :
  /// Up to five VPC security group IDs, of the form <code>sg-xxxxxxxx</code>.
  /// These must be for the same VPC as subnet specified.
  Future<MountTargetDescription> createMountTarget({
    @_s.required String fileSystemId,
    @_s.required String subnetId,
    String ipAddress,
    List<String> securityGroups,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(subnetId, 'subnetId');
    _s.validateStringLength(
      'subnetId',
      subnetId,
      15,
      47,
      isRequired: true,
    );
    _s.validateStringPattern(
      'subnetId',
      subnetId,
      r'''^subnet-[0-9a-f]{8,40}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'ipAddress',
      ipAddress,
      7,
      15,
    );
    _s.validateStringPattern(
      'ipAddress',
      ipAddress,
      r'''^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$''',
    );
    final $payload = <String, dynamic>{
      'FileSystemId': fileSystemId,
      'SubnetId': subnetId,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-02-01/mount-targets',
      exceptionFnMap: _exceptionFns,
    );
    return MountTargetDescription.fromJson(response);
  }

  /// Creates or overwrites tags associated with a file system. Each tag is a
  /// key-value pair. If a tag key specified in the request already exists on
  /// the file system, this operation overwrites its value with the value
  /// provided in the request. If you add the <code>Name</code> tag to your file
  /// system, Amazon EFS returns it in the response to the
  /// <a>DescribeFileSystems</a> operation.
  ///
  /// This operation requires permission for the
  /// <code>elasticfilesystem:CreateTags</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system whose tags you want to modify (String). This
  /// operation modifies the tags only, not the file system.
  ///
  /// Parameter [tags] :
  /// An array of <code>Tag</code> objects to add. Each <code>Tag</code> object
  /// is a key-value pair.
  @Deprecated('Deprecated')
  Future<void> createTags({
    @_s.required String fileSystemId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-02-01/create-tags/${Uri.encodeComponent(fileSystemId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified access point. After deletion is complete, new
  /// clients can no longer connect to the access points. Clients connected to
  /// the access point at the time of deletion will continue to function until
  /// they terminate their connection.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DeleteAccessPoint</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [AccessPointNotFound].
  ///
  /// Parameter [accessPointId] :
  /// The ID of the access point that you want to delete.
  Future<void> deleteAccessPoint({
    @_s.required String accessPointId,
  }) async {
    ArgumentError.checkNotNull(accessPointId, 'accessPointId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-02-01/access-points/${Uri.encodeComponent(accessPointId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a file system, permanently severing access to its contents. Upon
  /// return, the file system no longer exists and you can't access any contents
  /// of the deleted file system.
  ///
  /// You can't delete a file system that is in use. That is, if the file system
  /// has any mount targets, you must first delete them. For more information,
  /// see <a>DescribeMountTargets</a> and <a>DeleteMountTarget</a>.
  /// <note>
  /// The <code>DeleteFileSystem</code> call returns while the file system state
  /// is still <code>deleting</code>. You can check the file system deletion
  /// status by calling the <a>DescribeFileSystems</a> operation, which returns
  /// a list of file systems in your account. If you pass file system ID or
  /// creation token for the deleted file system, the <a>DescribeFileSystems</a>
  /// returns a <code>404 FileSystemNotFound</code> error.
  /// </note>
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DeleteFileSystem</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [FileSystemInUse].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system you want to delete.
  Future<void> deleteFileSystem({
    @_s.required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-02-01/file-systems/${Uri.encodeComponent(fileSystemId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the <code>FileSystemPolicy</code> for the specified file system.
  /// The default <code>FileSystemPolicy</code> goes into effect once the
  /// existing policy is deleted. For more information about the default file
  /// system policy, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/res-based-policies-efs.html">Using
  /// Resource-based Policies with EFS</a>.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DeleteFileSystemPolicy</code> action.
  ///
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [IncorrectFileSystemLifeCycleState].
  ///
  /// Parameter [fileSystemId] :
  /// Specifies the EFS file system for which to delete the
  /// <code>FileSystemPolicy</code>.
  Future<void> deleteFileSystemPolicy({
    @_s.required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-02-01/file-systems/${Uri.encodeComponent(fileSystemId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified mount target.
  ///
  /// This operation forcibly breaks any mounts of the file system by using the
  /// mount target that is being deleted, which might disrupt instances or
  /// applications using those mounts. To avoid applications getting cut off
  /// abruptly, you might consider unmounting any mounts of the mount target, if
  /// feasible. The operation also deletes the associated network interface.
  /// Uncommitted writes might be lost, but breaking a mount target using this
  /// operation does not corrupt the file system itself. The file system you
  /// created remains. You can mount an EC2 instance in your VPC by using
  /// another mount target.
  ///
  /// This operation requires permissions for the following action on the file
  /// system:
  ///
  /// <ul>
  /// <li>
  /// <code>elasticfilesystem:DeleteMountTarget</code>
  /// </li>
  /// </ul> <note>
  /// The <code>DeleteMountTarget</code> call returns while the mount target
  /// state is still <code>deleting</code>. You can check the mount target
  /// deletion by calling the <a>DescribeMountTargets</a> operation, which
  /// returns a list of mount target descriptions for the given file system.
  /// </note>
  /// The operation also requires permissions for the following Amazon EC2
  /// action on the mount target's network interface:
  ///
  /// <ul>
  /// <li>
  /// <code>ec2:DeleteNetworkInterface</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [DependencyTimeout].
  /// May throw [MountTargetNotFound].
  ///
  /// Parameter [mountTargetId] :
  /// The ID of the mount target to delete (String).
  Future<void> deleteMountTarget({
    @_s.required String mountTargetId,
  }) async {
    ArgumentError.checkNotNull(mountTargetId, 'mountTargetId');
    _s.validateStringLength(
      'mountTargetId',
      mountTargetId,
      13,
      45,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mountTargetId',
      mountTargetId,
      r'''^fsmt-[0-9a-f]{8,40}$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-02-01/mount-targets/${Uri.encodeComponent(mountTargetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified tags from a file system. If the
  /// <code>DeleteTags</code> request includes a tag key that doesn't exist,
  /// Amazon EFS ignores it and doesn't cause an error. For more information
  /// about tags and related restrictions, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Tag
  /// Restrictions</a> in the <i>AWS Billing and Cost Management User Guide</i>.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DeleteTags</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system whose tags you want to delete (String).
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to delete.
  @Deprecated('Deprecated')
  Future<void> deleteTags({
    @_s.required String fileSystemId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $payload = <String, dynamic>{
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-02-01/delete-tags/${Uri.encodeComponent(fileSystemId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the description of a specific Amazon EFS access point if the
  /// <code>AccessPointId</code> is provided. If you provide an EFS
  /// <code>FileSystemId</code>, it returns descriptions of all access points
  /// for that file system. You can provide either an <code>AccessPointId</code>
  /// or a <code>FileSystemId</code> in the request, but not both.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DescribeAccessPoints</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [AccessPointNotFound].
  ///
  /// Parameter [accessPointId] :
  /// (Optional) Specifies an EFS access point to describe in the response;
  /// mutually exclusive with <code>FileSystemId</code>.
  ///
  /// Parameter [fileSystemId] :
  /// (Optional) If you provide a <code>FileSystemId</code>, EFS returns all
  /// access points for that file system; mutually exclusive with
  /// <code>AccessPointId</code>.
  ///
  /// Parameter [maxResults] :
  /// (Optional) When retrieving all access points for a file system, you can
  /// optionally specify the <code>MaxItems</code> parameter to limit the number
  /// of objects returned in a response. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// <code>NextToken</code> is present if the response is paginated. You can
  /// use <code>NextMarker</code> in the subsequent request to fetch the next
  /// page of access point descriptions.
  Future<DescribeAccessPointsResponse> describeAccessPoints({
    String accessPointId,
    String fileSystemId,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (accessPointId != null) 'AccessPointId': [accessPointId],
      if (fileSystemId != null) 'FileSystemId': [fileSystemId],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-02-01/access-points',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccessPointsResponse.fromJson(response);
  }

  /// Returns the backup policy for the specified EFS file system.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [InternalServerError].
  /// May throw [PolicyNotFound].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileSystemId] :
  /// Specifies which EFS file system to retrieve the <code>BackupPolicy</code>
  /// for.
  Future<BackupPolicyDescription> describeBackupPolicy({
    @_s.required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-02-01/file-systems/${Uri.encodeComponent(fileSystemId)}/backup-policy',
      exceptionFnMap: _exceptionFns,
    );
    return BackupPolicyDescription.fromJson(response);
  }

  /// Returns the <code>FileSystemPolicy</code> for the specified EFS file
  /// system.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DescribeFileSystemPolicy</code> action.
  ///
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [PolicyNotFound].
  ///
  /// Parameter [fileSystemId] :
  /// Specifies which EFS file system to retrieve the
  /// <code>FileSystemPolicy</code> for.
  Future<FileSystemPolicyDescription> describeFileSystemPolicy({
    @_s.required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-02-01/file-systems/${Uri.encodeComponent(fileSystemId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return FileSystemPolicyDescription.fromJson(response);
  }

  /// Returns the description of a specific Amazon EFS file system if either the
  /// file system <code>CreationToken</code> or the <code>FileSystemId</code> is
  /// provided. Otherwise, it returns descriptions of all file systems owned by
  /// the caller's AWS account in the AWS Region of the endpoint that you're
  /// calling.
  ///
  /// When retrieving all file system descriptions, you can optionally specify
  /// the <code>MaxItems</code> parameter to limit the number of descriptions in
  /// a response. Currently, this number is automatically set to 10. If more
  /// file system descriptions remain, Amazon EFS returns a
  /// <code>NextMarker</code>, an opaque token, in the response. In this case,
  /// you should send a subsequent request with the <code>Marker</code> request
  /// parameter set to the value of <code>NextMarker</code>.
  ///
  /// To retrieve a list of your file system descriptions, this operation is
  /// used in an iterative process, where <code>DescribeFileSystems</code> is
  /// called first without the <code>Marker</code> and then the operation
  /// continues to call it with the <code>Marker</code> parameter set to the
  /// value of the <code>NextMarker</code> from the previous response until the
  /// response has no <code>NextMarker</code>.
  ///
  /// The order of file systems returned in the response of one
  /// <code>DescribeFileSystems</code> call and the order of file systems
  /// returned across the responses of a multi-call iteration is unspecified.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DescribeFileSystems</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  ///
  /// Parameter [creationToken] :
  /// (Optional) Restricts the list to the file system with this creation token
  /// (String). You specify a creation token when you create an Amazon EFS file
  /// system.
  ///
  /// Parameter [fileSystemId] :
  /// (Optional) ID of the file system whose description you want to retrieve
  /// (String).
  ///
  /// Parameter [marker] :
  /// (Optional) Opaque pagination token returned from a previous
  /// <code>DescribeFileSystems</code> operation (String). If present, specifies
  /// to continue the list from where the returning call had left off.
  ///
  /// Parameter [maxItems] :
  /// (Optional) Specifies the maximum number of file systems to return in the
  /// response (integer). This number is automatically set to 100. The response
  /// is paginated at 100 per page if you have more than 100 file systems.
  Future<DescribeFileSystemsResponse> describeFileSystems({
    String creationToken,
    String fileSystemId,
    String marker,
    int maxItems,
  }) async {
    _s.validateStringLength(
      'creationToken',
      creationToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'creationToken',
      creationToken,
      r'''.+''',
    );
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      128,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''.+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (creationToken != null) 'CreationToken': [creationToken],
      if (fileSystemId != null) 'FileSystemId': [fileSystemId],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-02-01/file-systems',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFileSystemsResponse.fromJson(response);
  }

  /// Returns the current <code>LifecycleConfiguration</code> object for the
  /// specified Amazon EFS file system. EFS lifecycle management uses the
  /// <code>LifecycleConfiguration</code> object to identify which files to move
  /// to the EFS Infrequent Access (IA) storage class. For a file system without
  /// a <code>LifecycleConfiguration</code> object, the call returns an empty
  /// array in the response.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DescribeLifecycleConfiguration</code> operation.
  ///
  /// May throw [InternalServerError].
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system whose <code>LifecycleConfiguration</code> object
  /// you want to retrieve (String).
  Future<LifecycleConfigurationDescription> describeLifecycleConfiguration({
    @_s.required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-02-01/file-systems/${Uri.encodeComponent(fileSystemId)}/lifecycle-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return LifecycleConfigurationDescription.fromJson(response);
  }

  /// Returns the security groups currently in effect for a mount target. This
  /// operation requires that the network interface of the mount target has been
  /// created and the lifecycle state of the mount target is not
  /// <code>deleted</code>.
  ///
  /// This operation requires permissions for the following actions:
  ///
  /// <ul>
  /// <li>
  /// <code>elasticfilesystem:DescribeMountTargetSecurityGroups</code> action on
  /// the mount target's file system.
  /// </li>
  /// <li>
  /// <code>ec2:DescribeNetworkInterfaceAttribute</code> action on the mount
  /// target's network interface.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [MountTargetNotFound].
  /// May throw [IncorrectMountTargetState].
  ///
  /// Parameter [mountTargetId] :
  /// The ID of the mount target whose security groups you want to retrieve.
  Future<DescribeMountTargetSecurityGroupsResponse>
      describeMountTargetSecurityGroups({
    @_s.required String mountTargetId,
  }) async {
    ArgumentError.checkNotNull(mountTargetId, 'mountTargetId');
    _s.validateStringLength(
      'mountTargetId',
      mountTargetId,
      13,
      45,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mountTargetId',
      mountTargetId,
      r'''^fsmt-[0-9a-f]{8,40}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-02-01/mount-targets/${Uri.encodeComponent(mountTargetId)}/security-groups',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMountTargetSecurityGroupsResponse.fromJson(response);
  }

  /// Returns the descriptions of all the current mount targets, or a specific
  /// mount target, for a file system. When requesting all of the current mount
  /// targets, the order of mount targets returned in the response is
  /// unspecified.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DescribeMountTargets</code> action, on either the
  /// file system ID that you specify in <code>FileSystemId</code>, or on the
  /// file system of the mount target that you specify in
  /// <code>MountTargetId</code>.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [MountTargetNotFound].
  /// May throw [AccessPointNotFound].
  ///
  /// Parameter [accessPointId] :
  /// (Optional) The ID of the access point whose mount targets that you want to
  /// list. It must be included in your request if a <code>FileSystemId</code>
  /// or <code>MountTargetId</code> is not included in your request. Accepts
  /// either an access point ID or ARN as input.
  ///
  /// Parameter [fileSystemId] :
  /// (Optional) ID of the file system whose mount targets you want to list
  /// (String). It must be included in your request if an
  /// <code>AccessPointId</code> or <code>MountTargetId</code> is not included.
  /// Accepts either a file system ID or ARN as input.
  ///
  /// Parameter [marker] :
  /// (Optional) Opaque pagination token returned from a previous
  /// <code>DescribeMountTargets</code> operation (String). If present, it
  /// specifies to continue the list from where the previous returning call left
  /// off.
  ///
  /// Parameter [maxItems] :
  /// (Optional) Maximum number of mount targets to return in the response.
  /// Currently, this number is automatically set to 10, and other values are
  /// ignored. The response is paginated at 100 per page if you have more than
  /// 100 mount targets.
  ///
  /// Parameter [mountTargetId] :
  /// (Optional) ID of the mount target that you want to have described
  /// (String). It must be included in your request if <code>FileSystemId</code>
  /// is not included. Accepts either a mount target ID or ARN as input.
  Future<DescribeMountTargetsResponse> describeMountTargets({
    String accessPointId,
    String fileSystemId,
    String marker,
    int maxItems,
    String mountTargetId,
  }) async {
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      128,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''.+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'mountTargetId',
      mountTargetId,
      13,
      45,
    );
    _s.validateStringPattern(
      'mountTargetId',
      mountTargetId,
      r'''^fsmt-[0-9a-f]{8,40}$''',
    );
    final $query = <String, List<String>>{
      if (accessPointId != null) 'AccessPointId': [accessPointId],
      if (fileSystemId != null) 'FileSystemId': [fileSystemId],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
      if (mountTargetId != null) 'MountTargetId': [mountTargetId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-02-01/mount-targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMountTargetsResponse.fromJson(response);
  }

  /// Returns the tags associated with a file system. The order of tags returned
  /// in the response of one <code>DescribeTags</code> call and the order of
  /// tags returned across the responses of a multiple-call iteration (when
  /// using pagination) is unspecified.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DescribeTags</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system whose tag set you want to retrieve.
  ///
  /// Parameter [marker] :
  /// (Optional) An opaque pagination token returned from a previous
  /// <code>DescribeTags</code> operation (String). If present, it specifies to
  /// continue the list from where the previous call left off.
  ///
  /// Parameter [maxItems] :
  /// (Optional) The maximum number of file system tags to return in the
  /// response. Currently, this number is automatically set to 100, and other
  /// values are ignored. The response is paginated at 100 per page if you have
  /// more than 100 tags.
  @Deprecated('Deprecated')
  Future<DescribeTagsResponse> describeTags({
    @_s.required String fileSystemId,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      128,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''.+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-02-01/tags/${Uri.encodeComponent(fileSystemId)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTagsResponse.fromJson(response);
  }

  /// Lists all tags for a top-level EFS resource. You must provide the ID of
  /// the resource that you want to retrieve the tags for.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:DescribeAccessPoints</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [AccessPointNotFound].
  ///
  /// Parameter [resourceId] :
  /// Specifies the EFS resource you want to retrieve tags for. You can retrieve
  /// tags for EFS file systems and access points using this API endpoint.
  ///
  /// Parameter [maxResults] :
  /// (Optional) Specifies the maximum number of tag objects to return in the
  /// response. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// You can use <code>NextToken</code> in a subsequent request to fetch the
  /// next page of access point descriptions if the response payload was
  /// paginated.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-02-01/resource-tags/${Uri.encodeComponent(resourceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Modifies the set of security groups in effect for a mount target.
  ///
  /// When you create a mount target, Amazon EFS also creates a new network
  /// interface. For more information, see <a>CreateMountTarget</a>. This
  /// operation replaces the security groups in effect for the network interface
  /// associated with a mount target, with the <code>SecurityGroups</code>
  /// provided in the request. This operation requires that the network
  /// interface of the mount target has been created and the lifecycle state of
  /// the mount target is not <code>deleted</code>.
  ///
  /// The operation requires permissions for the following actions:
  ///
  /// <ul>
  /// <li>
  /// <code>elasticfilesystem:ModifyMountTargetSecurityGroups</code> action on
  /// the mount target's file system.
  /// </li>
  /// <li>
  /// <code>ec2:ModifyNetworkInterfaceAttribute</code> action on the mount
  /// target's network interface.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [MountTargetNotFound].
  /// May throw [IncorrectMountTargetState].
  /// May throw [SecurityGroupLimitExceeded].
  /// May throw [SecurityGroupNotFound].
  ///
  /// Parameter [mountTargetId] :
  /// The ID of the mount target whose security groups you want to modify.
  ///
  /// Parameter [securityGroups] :
  /// An array of up to five VPC security group IDs.
  Future<void> modifyMountTargetSecurityGroups({
    @_s.required String mountTargetId,
    List<String> securityGroups,
  }) async {
    ArgumentError.checkNotNull(mountTargetId, 'mountTargetId');
    _s.validateStringLength(
      'mountTargetId',
      mountTargetId,
      13,
      45,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mountTargetId',
      mountTargetId,
      r'''^fsmt-[0-9a-f]{8,40}$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (securityGroups != null) 'SecurityGroups': securityGroups,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-02-01/mount-targets/${Uri.encodeComponent(mountTargetId)}/security-groups',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the file system's backup policy. Use this action to start or stop
  /// automatic backups of the file system.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [IncorrectFileSystemLifeCycleState].
  /// May throw [InternalServerError].
  /// May throw [ValidationException].
  ///
  /// Parameter [backupPolicy] :
  /// The backup policy included in the <code>PutBackupPolicy</code> request.
  ///
  /// Parameter [fileSystemId] :
  /// Specifies which EFS file system to update the backup policy for.
  Future<BackupPolicyDescription> putBackupPolicy({
    @_s.required BackupPolicy backupPolicy,
    @_s.required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(backupPolicy, 'backupPolicy');
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'BackupPolicy': backupPolicy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-02-01/file-systems/${Uri.encodeComponent(fileSystemId)}/backup-policy',
      exceptionFnMap: _exceptionFns,
    );
    return BackupPolicyDescription.fromJson(response);
  }

  /// Applies an Amazon EFS <code>FileSystemPolicy</code> to an Amazon EFS file
  /// system. A file system policy is an IAM resource-based policy and can
  /// contain multiple policy statements. A file system always has exactly one
  /// file system policy, which can be the default policy or an explicit policy
  /// set or updated using this API operation. When an explicit policy is set,
  /// it overrides the default policy. For more information about the default
  /// file system policy, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/iam-access-control-nfs-efs.html#default-filesystempolicy">Default
  /// EFS File System Policy</a>.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:PutFileSystemPolicy</code> action.
  ///
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [InvalidPolicyException].
  /// May throw [IncorrectFileSystemLifeCycleState].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the EFS file system that you want to create or update the
  /// <code>FileSystemPolicy</code> for.
  ///
  /// Parameter [policy] :
  /// The <code>FileSystemPolicy</code> that you're creating. Accepts a JSON
  /// formatted policy definition. To find out more about the elements that make
  /// up a file system policy, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/access-control-overview.html#access-control-manage-access-intro-resource-policies">EFS
  /// Resource-based Policies</a>.
  ///
  /// Parameter [bypassPolicyLockoutSafetyCheck] :
  /// (Optional) A flag to indicate whether to bypass the
  /// <code>FileSystemPolicy</code> lockout safety check. The policy lockout
  /// safety check determines whether the policy in the request will prevent the
  /// principal making the request will be locked out from making future
  /// <code>PutFileSystemPolicy</code> requests on the file system. Set
  /// <code>BypassPolicyLockoutSafetyCheck</code> to <code>True</code> only when
  /// you intend to prevent the principal that is making the request from making
  /// a subsequent <code>PutFileSystemPolicy</code> request on the file system.
  /// The default value is False.
  Future<FileSystemPolicyDescription> putFileSystemPolicy({
    @_s.required String fileSystemId,
    @_s.required String policy,
    bool bypassPolicyLockoutSafetyCheck,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    final $payload = <String, dynamic>{
      'Policy': policy,
      if (bypassPolicyLockoutSafetyCheck != null)
        'BypassPolicyLockoutSafetyCheck': bypassPolicyLockoutSafetyCheck,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-02-01/file-systems/${Uri.encodeComponent(fileSystemId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return FileSystemPolicyDescription.fromJson(response);
  }

  /// Enables lifecycle management by creating a new
  /// <code>LifecycleConfiguration</code> object. A
  /// <code>LifecycleConfiguration</code> object defines when files in an Amazon
  /// EFS file system are automatically transitioned to the lower-cost EFS
  /// Infrequent Access (IA) storage class. A
  /// <code>LifecycleConfiguration</code> applies to all files in a file system.
  ///
  /// Each Amazon EFS file system supports one lifecycle configuration, which
  /// applies to all files in the file system. If a
  /// <code>LifecycleConfiguration</code> object already exists for the
  /// specified file system, a <code>PutLifecycleConfiguration</code> call
  /// modifies the existing configuration. A
  /// <code>PutLifecycleConfiguration</code> call with an empty
  /// <code>LifecyclePolicies</code> array in the request body deletes any
  /// existing <code>LifecycleConfiguration</code> and disables lifecycle
  /// management.
  ///
  /// In the request, specify the following:
  ///
  /// <ul>
  /// <li>
  /// The ID for the file system for which you are enabling, disabling, or
  /// modifying lifecycle management.
  /// </li>
  /// <li>
  /// A <code>LifecyclePolicies</code> array of <code>LifecyclePolicy</code>
  /// objects that define when files are moved to the IA storage class. The
  /// array can contain only one <code>LifecyclePolicy</code> item.
  /// </li>
  /// </ul>
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:PutLifecycleConfiguration</code> operation.
  ///
  /// To apply a <code>LifecycleConfiguration</code> object to an encrypted file
  /// system, you need the same AWS Key Management Service (AWS KMS) permissions
  /// as when you created the encrypted file system.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [IncorrectFileSystemLifeCycleState].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system for which you are creating the
  /// <code>LifecycleConfiguration</code> object (String).
  ///
  /// Parameter [lifecyclePolicies] :
  /// An array of <code>LifecyclePolicy</code> objects that define the file
  /// system's <code>LifecycleConfiguration</code> object. A
  /// <code>LifecycleConfiguration</code> object tells lifecycle management when
  /// to transition files from the Standard storage class to the Infrequent
  /// Access storage class.
  Future<LifecycleConfigurationDescription> putLifecycleConfiguration({
    @_s.required String fileSystemId,
    @_s.required List<LifecyclePolicy> lifecyclePolicies,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lifecyclePolicies, 'lifecyclePolicies');
    final $payload = <String, dynamic>{
      'LifecyclePolicies': lifecyclePolicies,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-02-01/file-systems/${Uri.encodeComponent(fileSystemId)}/lifecycle-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return LifecycleConfigurationDescription.fromJson(response);
  }

  /// Creates a tag for an EFS resource. You can create tags for EFS file
  /// systems and access points using this API operation.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:TagResource</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [AccessPointNotFound].
  ///
  /// Parameter [resourceId] :
  /// The ID specifying the EFS resource that you want to create a tag for.
  ///
  /// Parameter [tags] :
  /// <p/>
  Future<void> tagResource({
    @_s.required String resourceId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-02-01/resource-tags/${Uri.encodeComponent(resourceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from an EFS resource. You can remove tags from EFS file
  /// systems and access points using this API operation.
  ///
  /// This operation requires permissions for the
  /// <code>elasticfilesystem:UntagResource</code> action.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [AccessPointNotFound].
  ///
  /// Parameter [resourceId] :
  /// Specifies the EFS resource that you want to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the key:value tag pairs that you want to remove from the
  /// specified EFS resource.
  Future<void> untagResource({
    @_s.required String resourceId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-02-01/resource-tags/${Uri.encodeComponent(resourceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the throughput mode or the amount of provisioned throughput of an
  /// existing file system.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [IncorrectFileSystemLifeCycleState].
  /// May throw [InsufficientThroughputCapacity].
  /// May throw [InternalServerError].
  /// May throw [ThroughputLimitExceeded].
  /// May throw [TooManyRequests].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system that you want to update.
  ///
  /// Parameter [provisionedThroughputInMibps] :
  /// (Optional) The amount of throughput, in MiB/s, that you want to provision
  /// for your file system. Valid values are 1-1024. Required if
  /// <code>ThroughputMode</code> is changed to <code>provisioned</code> on
  /// update. If you're not updating the amount of provisioned throughput for
  /// your file system, you don't need to provide this value in your request.
  ///
  /// Parameter [throughputMode] :
  /// (Optional) The throughput mode that you want your file system to use. If
  /// you're not updating your throughput mode, you don't need to provide this
  /// value in your request. If you are changing the <code>ThroughputMode</code>
  /// to <code>provisioned</code>, you must also set a value for
  /// <code>ProvisionedThroughputInMibps</code>.
  Future<FileSystemDescription> updateFileSystem({
    @_s.required String fileSystemId,
    double provisionedThroughputInMibps,
    ThroughputMode throughputMode,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fileSystemId',
      fileSystemId,
      r'''^(arn:aws[-a-z]*:elasticfilesystem:[0-9a-z-:]+:file-system/fs-[0-9a-f]{8,40}|fs-[0-9a-f]{8,40})$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'provisionedThroughputInMibps',
      provisionedThroughputInMibps,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (provisionedThroughputInMibps != null)
        'ProvisionedThroughputInMibps': provisionedThroughputInMibps,
      if (throughputMode != null) 'ThroughputMode': throughputMode.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-02-01/file-systems/${Uri.encodeComponent(fileSystemId)}',
      exceptionFnMap: _exceptionFns,
    );
    return FileSystemDescription.fromJson(response);
  }
}

/// Provides a description of an EFS file system access point.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessPointDescription {
  /// The unique Amazon Resource Name (ARN) associated with the access point.
  @_s.JsonKey(name: 'AccessPointArn')
  final String accessPointArn;

  /// The ID of the access point, assigned by Amazon EFS.
  @_s.JsonKey(name: 'AccessPointId')
  final String accessPointId;

  /// The opaque string specified in the request to ensure idempotent creation.
  @_s.JsonKey(name: 'ClientToken')
  final String clientToken;

  /// The ID of the EFS file system that the access point applies to.
  @_s.JsonKey(name: 'FileSystemId')
  final String fileSystemId;

  /// Identifies the lifecycle phase of the access point.
  @_s.JsonKey(name: 'LifeCycleState')
  final LifeCycleState lifeCycleState;

  /// The name of the access point. This is the value of the <code>Name</code>
  /// tag.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Identified the AWS account that owns the access point resource.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// The full POSIX identity, including the user ID, group ID, and secondary
  /// group IDs on the access point that is used for all file operations by NFS
  /// clients using the access point.
  @_s.JsonKey(name: 'PosixUser')
  final PosixUser posixUser;

  /// The directory on the Amazon EFS file system that the access point exposes as
  /// the root directory to NFS clients using the access point.
  @_s.JsonKey(name: 'RootDirectory')
  final RootDirectory rootDirectory;

  /// The tags associated with the access point, presented as an array of Tag
  /// objects.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  AccessPointDescription({
    this.accessPointArn,
    this.accessPointId,
    this.clientToken,
    this.fileSystemId,
    this.lifeCycleState,
    this.name,
    this.ownerId,
    this.posixUser,
    this.rootDirectory,
    this.tags,
  });
  factory AccessPointDescription.fromJson(Map<String, dynamic> json) =>
      _$AccessPointDescriptionFromJson(json);
}

/// The backup policy for the file system, showing the curent status. If
/// <code>ENABLED</code>, the file system is being backed up.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BackupPolicy {
  /// Describes the status of the file system's backup policy.
  ///
  /// <ul>
  /// <li>
  /// <i> <code>ENABLED</code> - EFS is automatically backing up the file
  /// system.</i>
  /// </li>
  /// <li>
  /// <i> <code>ENABLING</code> - EFS is turning on automatic backups for the file
  /// system.</i>
  /// </li>
  /// <li>
  /// <i> <code>DISABLED</code> - automatic back ups are turned off for the file
  /// system.</i>
  /// </li>
  /// <li>
  /// <i> <code>DISABLED</code> - EFS is turning off automatic backups for the
  /// file system.</i>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final Status status;

  BackupPolicy({
    @_s.required this.status,
  });
  factory BackupPolicy.fromJson(Map<String, dynamic> json) =>
      _$BackupPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$BackupPolicyToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupPolicyDescription {
  /// Describes the file system's backup policy, indicating whether automatic
  /// backups are turned on or off..
  @_s.JsonKey(name: 'BackupPolicy')
  final BackupPolicy backupPolicy;

  BackupPolicyDescription({
    this.backupPolicy,
  });
  factory BackupPolicyDescription.fromJson(Map<String, dynamic> json) =>
      _$BackupPolicyDescriptionFromJson(json);
}

/// Required if the <code>RootDirectory</code> &gt; <code>Path</code> specified
/// does not exist. Specifies the POSIX IDs and permissions to apply to the
/// access point's <code>RootDirectory</code> &gt; <code>Path</code>. If the
/// access point root directory does not exist, EFS creates it with these
/// settings when a client connects to the access point. When specifying
/// <code>CreationInfo</code>, you must include values for all properties.
/// <important>
/// If you do not provide <code>CreationInfo</code> and the specified
/// <code>RootDirectory</code> does not exist, attempts to mount the file system
/// using the access point will fail.
/// </important>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreationInfo {
  /// Specifies the POSIX group ID to apply to the <code>RootDirectory</code>.
  /// Accepts values from 0 to 2^32 (4294967295).
  @_s.JsonKey(name: 'OwnerGid')
  final int ownerGid;

  /// Specifies the POSIX user ID to apply to the <code>RootDirectory</code>.
  /// Accepts values from 0 to 2^32 (4294967295).
  @_s.JsonKey(name: 'OwnerUid')
  final int ownerUid;

  /// Specifies the POSIX permissions to apply to the <code>RootDirectory</code>,
  /// in the format of an octal number representing the file's mode bits.
  @_s.JsonKey(name: 'Permissions')
  final String permissions;

  CreationInfo({
    @_s.required this.ownerGid,
    @_s.required this.ownerUid,
    @_s.required this.permissions,
  });
  factory CreationInfo.fromJson(Map<String, dynamic> json) =>
      _$CreationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CreationInfoToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccessPointsResponse {
  /// An array of access point descriptions.
  @_s.JsonKey(name: 'AccessPoints')
  final List<AccessPointDescription> accessPoints;

  /// Present if there are more access points than returned in the response. You
  /// can use the NextMarker in the subsequent request to fetch the additional
  /// descriptions.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeAccessPointsResponse({
    this.accessPoints,
    this.nextToken,
  });
  factory DescribeAccessPointsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAccessPointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFileSystemsResponse {
  /// An array of file system descriptions.
  @_s.JsonKey(name: 'FileSystems')
  final List<FileSystemDescription> fileSystems;

  /// Present if provided by caller in the request (String).
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// Present if there are more file systems than returned in the response
  /// (String). You can use the <code>NextMarker</code> in the subsequent request
  /// to fetch the descriptions.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  DescribeFileSystemsResponse({
    this.fileSystems,
    this.marker,
    this.nextMarker,
  });
  factory DescribeFileSystemsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFileSystemsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMountTargetSecurityGroupsResponse {
  /// An array of security groups.
  @_s.JsonKey(name: 'SecurityGroups')
  final List<String> securityGroups;

  DescribeMountTargetSecurityGroupsResponse({
    @_s.required this.securityGroups,
  });
  factory DescribeMountTargetSecurityGroupsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMountTargetSecurityGroupsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMountTargetsResponse {
  /// If the request included the <code>Marker</code>, the response returns that
  /// value in this field.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// Returns the file system's mount targets as an array of
  /// <code>MountTargetDescription</code> objects.
  @_s.JsonKey(name: 'MountTargets')
  final List<MountTargetDescription> mountTargets;

  /// If a value is present, there are more mount targets to return. In a
  /// subsequent request, you can provide <code>Marker</code> in your request with
  /// this value to retrieve the next set of mount targets.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  DescribeMountTargetsResponse({
    this.marker,
    this.mountTargets,
    this.nextMarker,
  });
  factory DescribeMountTargetsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeMountTargetsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTagsResponse {
  /// Returns tags associated with the file system as an array of <code>Tag</code>
  /// objects.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// If the request included a <code>Marker</code>, the response returns that
  /// value in this field.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// If a value is present, there are more tags to return. In a subsequent
  /// request, you can provide the value of <code>NextMarker</code> as the value
  /// of the <code>Marker</code> parameter in your next request to retrieve the
  /// next set of tags.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  DescribeTagsResponse({
    @_s.required this.tags,
    this.marker,
    this.nextMarker,
  });
  factory DescribeTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTagsResponseFromJson(json);
}

/// A description of the file system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileSystemDescription {
  /// The time that the file system was created, in seconds (since
  /// 1970-01-01T00:00:00Z).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The opaque string specified in the request.
  @_s.JsonKey(name: 'CreationToken')
  final String creationToken;

  /// The ID of the file system, assigned by Amazon EFS.
  @_s.JsonKey(name: 'FileSystemId')
  final String fileSystemId;

  /// The lifecycle phase of the file system.
  @_s.JsonKey(name: 'LifeCycleState')
  final LifeCycleState lifeCycleState;

  /// The current number of mount targets that the file system has. For more
  /// information, see <a>CreateMountTarget</a>.
  @_s.JsonKey(name: 'NumberOfMountTargets')
  final int numberOfMountTargets;

  /// The AWS account that created the file system. If the file system was created
  /// by an IAM user, the parent account to which the user belongs is the owner.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// The performance mode of the file system.
  @_s.JsonKey(name: 'PerformanceMode')
  final PerformanceMode performanceMode;

  /// The latest known metered size (in bytes) of data stored in the file system,
  /// in its <code>Value</code> field, and the time at which that size was
  /// determined in its <code>Timestamp</code> field. The <code>Timestamp</code>
  /// value is the integer number of seconds since 1970-01-01T00:00:00Z. The
  /// <code>SizeInBytes</code> value doesn't represent the size of a consistent
  /// snapshot of the file system, but it is eventually consistent when there are
  /// no writes to the file system. That is, <code>SizeInBytes</code> represents
  /// actual size only if the file system is not modified for a period longer than
  /// a couple of hours. Otherwise, the value is not the exact size that the file
  /// system was at any point in time.
  @_s.JsonKey(name: 'SizeInBytes')
  final FileSystemSize sizeInBytes;

  /// The tags associated with the file system, presented as an array of
  /// <code>Tag</code> objects.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// A Boolean value that, if true, indicates that the file system is encrypted.
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  /// The Amazon Resource Name (ARN) for the EFS file system, in the format
  /// <code>arn:aws:elasticfilesystem:<i>region</i>:<i>account-id</i>:file-system/<i>file-system-id</i>
  /// </code>. Example with sample data:
  /// <code>arn:aws:elasticfilesystem:us-west-2:1111333322228888:file-system/fs-01234567</code>
  @_s.JsonKey(name: 'FileSystemArn')
  final String fileSystemArn;

  /// The ID of an AWS Key Management Service (AWS KMS) customer master key (CMK)
  /// that was used to protect the encrypted file system.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// You can add tags to a file system, including a <code>Name</code> tag. For
  /// more information, see <a>CreateFileSystem</a>. If the file system has a
  /// <code>Name</code> tag, Amazon EFS returns the value in this field.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The throughput, measured in MiB/s, that you want to provision for a file
  /// system. Valid values are 1-1024. Required if <code>ThroughputMode</code> is
  /// set to <code>provisioned</code>. The limit on throughput is 1024 MiB/s. You
  /// can get these limits increased by contacting AWS Support. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/limits.html#soft-limits">Amazon
  /// EFS Limits That You Can Increase</a> in the <i>Amazon EFS User Guide.</i>
  @_s.JsonKey(name: 'ProvisionedThroughputInMibps')
  final double provisionedThroughputInMibps;

  /// The throughput mode for a file system. There are two throughput modes to
  /// choose from for your file system: <code>bursting</code> and
  /// <code>provisioned</code>. If you set <code>ThroughputMode</code> to
  /// <code>provisioned</code>, you must also set a value for
  /// <code>ProvisionedThroughPutInMibps</code>. You can decrease your file
  /// system's throughput in Provisioned Throughput mode or change between the
  /// throughput modes as long as it’s been more than 24 hours since the last
  /// decrease or throughput mode change.
  @_s.JsonKey(name: 'ThroughputMode')
  final ThroughputMode throughputMode;

  FileSystemDescription({
    @_s.required this.creationTime,
    @_s.required this.creationToken,
    @_s.required this.fileSystemId,
    @_s.required this.lifeCycleState,
    @_s.required this.numberOfMountTargets,
    @_s.required this.ownerId,
    @_s.required this.performanceMode,
    @_s.required this.sizeInBytes,
    @_s.required this.tags,
    this.encrypted,
    this.fileSystemArn,
    this.kmsKeyId,
    this.name,
    this.provisionedThroughputInMibps,
    this.throughputMode,
  });
  factory FileSystemDescription.fromJson(Map<String, dynamic> json) =>
      _$FileSystemDescriptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileSystemPolicyDescription {
  /// Specifies the EFS file system to which the <code>FileSystemPolicy</code>
  /// applies.
  @_s.JsonKey(name: 'FileSystemId')
  final String fileSystemId;

  /// The JSON formatted <code>FileSystemPolicy</code> for the EFS file system.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  FileSystemPolicyDescription({
    this.fileSystemId,
    this.policy,
  });
  factory FileSystemPolicyDescription.fromJson(Map<String, dynamic> json) =>
      _$FileSystemPolicyDescriptionFromJson(json);
}

/// The latest known metered size (in bytes) of data stored in the file system,
/// in its <code>Value</code> field, and the time at which that size was
/// determined in its <code>Timestamp</code> field. The value doesn't represent
/// the size of a consistent snapshot of the file system, but it is eventually
/// consistent when there are no writes to the file system. That is, the value
/// represents the actual size only if the file system is not modified for a
/// period longer than a couple of hours. Otherwise, the value is not
/// necessarily the exact size the file system was at any instant in time.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileSystemSize {
  /// The latest known metered size (in bytes) of data stored in the file system.
  @_s.JsonKey(name: 'Value')
  final int value;

  /// The time at which the size of data, returned in the <code>Value</code>
  /// field, was determined. The value is the integer number of seconds since
  /// 1970-01-01T00:00:00Z.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  /// The latest known metered size (in bytes) of data stored in the Infrequent
  /// Access storage class.
  @_s.JsonKey(name: 'ValueInIA')
  final int valueInIA;

  /// The latest known metered size (in bytes) of data stored in the Standard
  /// storage class.
  @_s.JsonKey(name: 'ValueInStandard')
  final int valueInStandard;

  FileSystemSize({
    @_s.required this.value,
    this.timestamp,
    this.valueInIA,
    this.valueInStandard,
  });
  factory FileSystemSize.fromJson(Map<String, dynamic> json) =>
      _$FileSystemSizeFromJson(json);
}

enum LifeCycleState {
  @_s.JsonValue('creating')
  creating,
  @_s.JsonValue('available')
  available,
  @_s.JsonValue('updating')
  updating,
  @_s.JsonValue('deleting')
  deleting,
  @_s.JsonValue('deleted')
  deleted,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LifecycleConfigurationDescription {
  /// An array of lifecycle management policies. Currently, EFS supports a maximum
  /// of one policy per file system.
  @_s.JsonKey(name: 'LifecyclePolicies')
  final List<LifecyclePolicy> lifecyclePolicies;

  LifecycleConfigurationDescription({
    this.lifecyclePolicies,
  });
  factory LifecycleConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$LifecycleConfigurationDescriptionFromJson(json);
}

/// Describes a policy used by EFS lifecycle management to transition files to
/// the Infrequent Access (IA) storage class.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LifecyclePolicy {
  /// A value that describes the period of time that a file is not accessed, after
  /// which it transitions to the IA storage class. Metadata operations such as
  /// listing the contents of a directory don't count as file access events.
  @_s.JsonKey(name: 'TransitionToIA')
  final TransitionToIARules transitionToIA;

  LifecyclePolicy({
    this.transitionToIA,
  });
  factory LifecyclePolicy.fromJson(Map<String, dynamic> json) =>
      _$LifecyclePolicyFromJson(json);

  Map<String, dynamic> toJson() => _$LifecyclePolicyToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// <code>NextToken</code> is present if the response payload is paginated. You
  /// can use <code>NextToken</code> in a subsequent request to fetch the next
  /// page of access point descriptions.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of the tags for the specified EFS resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Provides a description of a mount target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MountTargetDescription {
  /// The ID of the file system for which the mount target is intended.
  @_s.JsonKey(name: 'FileSystemId')
  final String fileSystemId;

  /// Lifecycle state of the mount target.
  @_s.JsonKey(name: 'LifeCycleState')
  final LifeCycleState lifeCycleState;

  /// System-assigned mount target ID.
  @_s.JsonKey(name: 'MountTargetId')
  final String mountTargetId;

  /// The ID of the mount target's subnet.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The unique and consistent identifier of the Availability Zone (AZ) that the
  /// mount target resides in. For example, <code>use1-az1</code> is an AZ ID for
  /// the us-east-1 Region and it has the same location in every AWS account.
  @_s.JsonKey(name: 'AvailabilityZoneId')
  final String availabilityZoneId;

  /// The name of the Availability Zone (AZ) that the mount target resides in. AZs
  /// are independently mapped to names for each AWS account. For example, the
  /// Availability Zone <code>us-east-1a</code> for your AWS account might not be
  /// the same location as <code>us-east-1a</code> for another AWS account.
  @_s.JsonKey(name: 'AvailabilityZoneName')
  final String availabilityZoneName;

  /// Address at which the file system can be mounted by using the mount target.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// The ID of the network interface that Amazon EFS created when it created the
  /// mount target.
  @_s.JsonKey(name: 'NetworkInterfaceId')
  final String networkInterfaceId;

  /// AWS account ID that owns the resource.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// The Virtual Private Cloud (VPC) ID that the mount target is configured in.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  MountTargetDescription({
    @_s.required this.fileSystemId,
    @_s.required this.lifeCycleState,
    @_s.required this.mountTargetId,
    @_s.required this.subnetId,
    this.availabilityZoneId,
    this.availabilityZoneName,
    this.ipAddress,
    this.networkInterfaceId,
    this.ownerId,
    this.vpcId,
  });
  factory MountTargetDescription.fromJson(Map<String, dynamic> json) =>
      _$MountTargetDescriptionFromJson(json);
}

enum PerformanceMode {
  @_s.JsonValue('generalPurpose')
  generalPurpose,
  @_s.JsonValue('maxIO')
  maxIO,
}

extension on PerformanceMode {
  String toValue() {
    switch (this) {
      case PerformanceMode.generalPurpose:
        return 'generalPurpose';
      case PerformanceMode.maxIO:
        return 'maxIO';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The full POSIX identity, including the user ID, group ID, and any secondary
/// group IDs, on the access point that is used for all file system operations
/// performed by NFS clients using the access point.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PosixUser {
  /// The POSIX group ID used for all file system operations using this access
  /// point.
  @_s.JsonKey(name: 'Gid')
  final int gid;

  /// The POSIX user ID used for all file system operations using this access
  /// point.
  @_s.JsonKey(name: 'Uid')
  final int uid;

  /// Secondary POSIX group IDs used for all file system operations using this
  /// access point.
  @_s.JsonKey(name: 'SecondaryGids')
  final List<int> secondaryGids;

  PosixUser({
    @_s.required this.gid,
    @_s.required this.uid,
    this.secondaryGids,
  });
  factory PosixUser.fromJson(Map<String, dynamic> json) =>
      _$PosixUserFromJson(json);

  Map<String, dynamic> toJson() => _$PosixUserToJson(this);
}

/// Specifies the directory on the Amazon EFS file system that the access point
/// provides access to. The access point exposes the specified file system path
/// as the root directory of your file system to applications using the access
/// point. NFS clients using the access point can only access data in the access
/// point's <code>RootDirectory</code> and it's subdirectories.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RootDirectory {
  /// (Optional) Specifies the POSIX IDs and permissions to apply to the access
  /// point's <code>RootDirectory</code>. If the <code>RootDirectory</code> &gt;
  /// <code>Path</code> specified does not exist, EFS creates the root directory
  /// using the <code>CreationInfo</code> settings when a client connects to an
  /// access point. When specifying the <code>CreationInfo</code>, you must
  /// provide values for all properties.
  /// <important>
  /// If you do not provide <code>CreationInfo</code> and the specified
  /// <code>RootDirectory</code> &gt; <code>Path</code> does not exist, attempts
  /// to mount the file system using the access point will fail.
  /// </important>
  @_s.JsonKey(name: 'CreationInfo')
  final CreationInfo creationInfo;

  /// Specifies the path on the EFS file system to expose as the root directory to
  /// NFS clients using the access point to access the EFS file system. A path can
  /// have up to four subdirectories. If the specified path does not exist, you
  /// are required to provide the <code>CreationInfo</code>.
  @_s.JsonKey(name: 'Path')
  final String path;

  RootDirectory({
    this.creationInfo,
    this.path,
  });
  factory RootDirectory.fromJson(Map<String, dynamic> json) =>
      _$RootDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$RootDirectoryToJson(this);
}

enum Status {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('ENABLING')
  enabling,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('DISABLING')
  disabling,
}

/// A tag is a key-value pair. Allowed characters are letters, white space, and
/// numbers that can be represented in UTF-8, and the following
/// characters:<code> + - = . _ : /</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag key (String). The key can't start with <code>aws:</code>.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag key.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

enum ThroughputMode {
  @_s.JsonValue('bursting')
  bursting,
  @_s.JsonValue('provisioned')
  provisioned,
}

extension on ThroughputMode {
  String toValue() {
    switch (this) {
      case ThroughputMode.bursting:
        return 'bursting';
      case ThroughputMode.provisioned:
        return 'provisioned';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum TransitionToIARules {
  @_s.JsonValue('AFTER_7_DAYS')
  after_7Days,
  @_s.JsonValue('AFTER_14_DAYS')
  after_14Days,
  @_s.JsonValue('AFTER_30_DAYS')
  after_30Days,
  @_s.JsonValue('AFTER_60_DAYS')
  after_60Days,
  @_s.JsonValue('AFTER_90_DAYS')
  after_90Days,
}

class AccessPointAlreadyExists extends _s.GenericAwsException {
  AccessPointAlreadyExists({String type, String message})
      : super(type: type, code: 'AccessPointAlreadyExists', message: message);
}

class AccessPointLimitExceeded extends _s.GenericAwsException {
  AccessPointLimitExceeded({String type, String message})
      : super(type: type, code: 'AccessPointLimitExceeded', message: message);
}

class AccessPointNotFound extends _s.GenericAwsException {
  AccessPointNotFound({String type, String message})
      : super(type: type, code: 'AccessPointNotFound', message: message);
}

class BadRequest extends _s.GenericAwsException {
  BadRequest({String type, String message})
      : super(type: type, code: 'BadRequest', message: message);
}

class DependencyTimeout extends _s.GenericAwsException {
  DependencyTimeout({String type, String message})
      : super(type: type, code: 'DependencyTimeout', message: message);
}

class FileSystemAlreadyExists extends _s.GenericAwsException {
  FileSystemAlreadyExists({String type, String message})
      : super(type: type, code: 'FileSystemAlreadyExists', message: message);
}

class FileSystemInUse extends _s.GenericAwsException {
  FileSystemInUse({String type, String message})
      : super(type: type, code: 'FileSystemInUse', message: message);
}

class FileSystemLimitExceeded extends _s.GenericAwsException {
  FileSystemLimitExceeded({String type, String message})
      : super(type: type, code: 'FileSystemLimitExceeded', message: message);
}

class FileSystemNotFound extends _s.GenericAwsException {
  FileSystemNotFound({String type, String message})
      : super(type: type, code: 'FileSystemNotFound', message: message);
}

class IncorrectFileSystemLifeCycleState extends _s.GenericAwsException {
  IncorrectFileSystemLifeCycleState({String type, String message})
      : super(
            type: type,
            code: 'IncorrectFileSystemLifeCycleState',
            message: message);
}

class IncorrectMountTargetState extends _s.GenericAwsException {
  IncorrectMountTargetState({String type, String message})
      : super(type: type, code: 'IncorrectMountTargetState', message: message);
}

class InsufficientThroughputCapacity extends _s.GenericAwsException {
  InsufficientThroughputCapacity({String type, String message})
      : super(
            type: type,
            code: 'InsufficientThroughputCapacity',
            message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidPolicyException extends _s.GenericAwsException {
  InvalidPolicyException({String type, String message})
      : super(type: type, code: 'InvalidPolicyException', message: message);
}

class IpAddressInUse extends _s.GenericAwsException {
  IpAddressInUse({String type, String message})
      : super(type: type, code: 'IpAddressInUse', message: message);
}

class MountTargetConflict extends _s.GenericAwsException {
  MountTargetConflict({String type, String message})
      : super(type: type, code: 'MountTargetConflict', message: message);
}

class MountTargetNotFound extends _s.GenericAwsException {
  MountTargetNotFound({String type, String message})
      : super(type: type, code: 'MountTargetNotFound', message: message);
}

class NetworkInterfaceLimitExceeded extends _s.GenericAwsException {
  NetworkInterfaceLimitExceeded({String type, String message})
      : super(
            type: type,
            code: 'NetworkInterfaceLimitExceeded',
            message: message);
}

class NoFreeAddressesInSubnet extends _s.GenericAwsException {
  NoFreeAddressesInSubnet({String type, String message})
      : super(type: type, code: 'NoFreeAddressesInSubnet', message: message);
}

class PolicyNotFound extends _s.GenericAwsException {
  PolicyNotFound({String type, String message})
      : super(type: type, code: 'PolicyNotFound', message: message);
}

class SecurityGroupLimitExceeded extends _s.GenericAwsException {
  SecurityGroupLimitExceeded({String type, String message})
      : super(type: type, code: 'SecurityGroupLimitExceeded', message: message);
}

class SecurityGroupNotFound extends _s.GenericAwsException {
  SecurityGroupNotFound({String type, String message})
      : super(type: type, code: 'SecurityGroupNotFound', message: message);
}

class SubnetNotFound extends _s.GenericAwsException {
  SubnetNotFound({String type, String message})
      : super(type: type, code: 'SubnetNotFound', message: message);
}

class ThroughputLimitExceeded extends _s.GenericAwsException {
  ThroughputLimitExceeded({String type, String message})
      : super(type: type, code: 'ThroughputLimitExceeded', message: message);
}

class TooManyRequests extends _s.GenericAwsException {
  TooManyRequests({String type, String message})
      : super(type: type, code: 'TooManyRequests', message: message);
}

class UnsupportedAvailabilityZone extends _s.GenericAwsException {
  UnsupportedAvailabilityZone({String type, String message})
      : super(
            type: type, code: 'UnsupportedAvailabilityZone', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessPointAlreadyExists': (type, message) =>
      AccessPointAlreadyExists(type: type, message: message),
  'AccessPointLimitExceeded': (type, message) =>
      AccessPointLimitExceeded(type: type, message: message),
  'AccessPointNotFound': (type, message) =>
      AccessPointNotFound(type: type, message: message),
  'BadRequest': (type, message) => BadRequest(type: type, message: message),
  'DependencyTimeout': (type, message) =>
      DependencyTimeout(type: type, message: message),
  'FileSystemAlreadyExists': (type, message) =>
      FileSystemAlreadyExists(type: type, message: message),
  'FileSystemInUse': (type, message) =>
      FileSystemInUse(type: type, message: message),
  'FileSystemLimitExceeded': (type, message) =>
      FileSystemLimitExceeded(type: type, message: message),
  'FileSystemNotFound': (type, message) =>
      FileSystemNotFound(type: type, message: message),
  'IncorrectFileSystemLifeCycleState': (type, message) =>
      IncorrectFileSystemLifeCycleState(type: type, message: message),
  'IncorrectMountTargetState': (type, message) =>
      IncorrectMountTargetState(type: type, message: message),
  'InsufficientThroughputCapacity': (type, message) =>
      InsufficientThroughputCapacity(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidPolicyException': (type, message) =>
      InvalidPolicyException(type: type, message: message),
  'IpAddressInUse': (type, message) =>
      IpAddressInUse(type: type, message: message),
  'MountTargetConflict': (type, message) =>
      MountTargetConflict(type: type, message: message),
  'MountTargetNotFound': (type, message) =>
      MountTargetNotFound(type: type, message: message),
  'NetworkInterfaceLimitExceeded': (type, message) =>
      NetworkInterfaceLimitExceeded(type: type, message: message),
  'NoFreeAddressesInSubnet': (type, message) =>
      NoFreeAddressesInSubnet(type: type, message: message),
  'PolicyNotFound': (type, message) =>
      PolicyNotFound(type: type, message: message),
  'SecurityGroupLimitExceeded': (type, message) =>
      SecurityGroupLimitExceeded(type: type, message: message),
  'SecurityGroupNotFound': (type, message) =>
      SecurityGroupNotFound(type: type, message: message),
  'SubnetNotFound': (type, message) =>
      SubnetNotFound(type: type, message: message),
  'ThroughputLimitExceeded': (type, message) =>
      ThroughputLimitExceeded(type: type, message: message),
  'TooManyRequests': (type, message) =>
      TooManyRequests(type: type, message: message),
  'UnsupportedAvailabilityZone': (type, message) =>
      UnsupportedAvailabilityZone(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
