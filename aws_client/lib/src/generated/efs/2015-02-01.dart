// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Amazon Elastic File System (Amazon EFS) provides simple, scalable file
/// storage for use with Amazon EC2 instances in the AWS Cloud. With Amazon EFS,
/// storage capacity is elastic, growing and shrinking automatically as you add
/// and remove files, so your applications have the storage they need, when they
/// need it. For more information, see the <a
/// href="https://docs.aws.amazon.com/efs/latest/ug/api-reference.html">Amazon
/// Elastic File System API Reference</a> and the <a
/// href="https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html">Amazon
/// Elastic File System User Guide</a>.
class Efs {
  final _s.RestJsonProtocol _protocol;
  Efs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  /// a file system using EFS access points</a>.
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
  /// Parameter [fileSystemId] :
  /// The ID of the EFS file system that the access point provides access to.
  ///
  /// Parameter [clientToken] :
  /// A string of up to 64 ASCII characters that Amazon EFS uses to ensure
  /// idempotent creation.
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
  /// the <code>Path</code>, and the <code>CreationInfo</code>.
  ///
  /// Amazon EFS creates a root directory only if you have provided the
  /// CreationInfo: OwnUid, OwnGID, and permissions for the directory. If you do
  /// not provide this information, Amazon EFS does not create the root
  /// directory. If the root directory does not exist, attempts to mount using
  /// the access point will fail.
  ///
  /// Parameter [tags] :
  /// Creates tags associated with the access point. Each tag is a key-value
  /// pair.
  Future<AccessPointDescription> createAccessPoint({
    required String fileSystemId,
    String? clientToken,
    PosixUser? posixUser,
    RootDirectory? rootDirectory,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'FileSystemId': fileSystemId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
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
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/creating-using-create-fs.html#creating-using-create-fs-part1">Creating
  /// a file system</a> in the <i>Amazon EFS User Guide</i>.
  /// <note>
  /// The <code>CreateFileSystem</code> call returns while the file system's
  /// lifecycle state is still <code>creating</code>. You can check the file
  /// system creation status by calling the <a>DescribeFileSystems</a>
  /// operation, which among other things returns the file system state.
  /// </note>
  /// This operation accepts an optional <code>PerformanceMode</code> parameter
  /// that you choose for your file system. We recommend
  /// <code>generalPurpose</code> performance mode for most file systems. File
  /// systems using the <code>maxIO</code> performance mode can scale to higher
  /// levels of aggregate throughput and operations per second with a tradeoff
  /// of slightly higher latencies for most file operations. The performance
  /// mode can't be changed after the file system has been created. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/performance.html#performancemodes.html">Amazon
  /// EFS performance modes</a>.
  ///
  /// You can set the throughput mode for the file system using the
  /// <code>ThroughputMode</code> parameter.
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
  /// May throw [UnsupportedAvailabilityZone].
  ///
  /// Parameter [availabilityZoneName] :
  /// Used to create a file system that uses One Zone storage classes. It
  /// specifies the AWS Availability Zone in which to create the file system.
  /// Use the format <code>us-east-1a</code> to specify the Availability Zone.
  /// For more information about One Zone storage classes, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/storage-classes.html">Using
  /// EFS storage classes</a> in the <i>Amazon EFS User Guide</i>.
  /// <note>
  /// One Zone storage classes are not available in all Availability Zones in
  /// AWS Regions where Amazon EFS is available.
  /// </note>
  ///
  /// Parameter [backup] :
  /// Specifies whether automatic backups are enabled on the file system that
  /// you are creating. Set the value to <code>true</code> to enable automatic
  /// backups. If you are creating a file system that uses One Zone storage
  /// classes, automatic backups are enabled by default. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/awsbackup.html#automatic-backups">Automatic
  /// backups</a> in the <i>Amazon EFS User Guide</i>.
  ///
  /// Default is <code>false</code>. However, if you specify an
  /// <code>AvailabilityZoneName</code>, the default is <code>true</code>.
  /// <note>
  /// AWS Backup is not available in all AWS Regions where Amazon EFS is
  /// available.
  /// </note>
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
  /// The ID of the AWS KMS CMK that you want to use to protect the encrypted
  /// file system. This parameter is only required if you want to use a
  /// non-default KMS key. If this parameter is not specified, the default CMK
  /// for Amazon EFS is used. This ID can be in one of the following formats:
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
  /// EFS accepts only symmetric KMS keys. You cannot use asymmetric KMS keys
  /// with EFS file systems.
  /// </important>
  ///
  /// Parameter [performanceMode] :
  /// The performance mode of the file system. We recommend
  /// <code>generalPurpose</code> performance mode for most file systems. File
  /// systems using the <code>maxIO</code> performance mode can scale to higher
  /// levels of aggregate throughput and operations per second with a tradeoff
  /// of slightly higher latencies for most file operations. The performance
  /// mode can't be changed after the file system has been created.
  /// <note>
  /// The <code>maxIO</code> mode is not supported on file systems using One
  /// Zone storage classes.
  /// </note>
  ///
  /// Parameter [provisionedThroughputInMibps] :
  /// The throughput, measured in MiB/s, that you want to provision for a file
  /// system that you're creating. Valid values are 1-1024. Required if
  /// <code>ThroughputMode</code> is set to <code>provisioned</code>. The upper
  /// limit for throughput is 1024 MiB/s. To increase this limit, contact AWS
  /// Support. For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/limits.html#soft-limits">Amazon
  /// EFS quotas that you can increase</a> in the <i>Amazon EFS User Guide</i>.
  ///
  /// Parameter [tags] :
  /// A value that specifies to create one or more tags associated with the file
  /// system. Each tag is a user-defined key-value pair. Name your file system
  /// on creation by including a <code>"Key":"Name","Value":"{value}"</code>
  /// key-value pair.
  ///
  /// Parameter [throughputMode] :
  /// Specifies the throughput mode for the file system, either
  /// <code>bursting</code> or <code>provisioned</code>. If you set
  /// <code>ThroughputMode</code> to <code>provisioned</code>, you must also set
  /// a value for <code>ProvisionedThroughputInMibps</code>. After you create
  /// the file system, you can decrease your file system's throughput in
  /// Provisioned Throughput mode or change between the throughput modes, as
  /// long as it’s been more than 24 hours since the last decrease or throughput
  /// mode change. For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/performance.html#provisioned-throughput">Specifying
  /// throughput with provisioned mode</a> in the <i>Amazon EFS User Guide</i>.
  ///
  /// Default is <code>bursting</code>.
  Future<FileSystemDescription> createFileSystem({
    String? availabilityZoneName,
    bool? backup,
    String? creationToken,
    bool? encrypted,
    String? kmsKeyId,
    PerformanceMode? performanceMode,
    double? provisionedThroughputInMibps,
    List<Tag>? tags,
    ThroughputMode? throughputMode,
  }) async {
    _s.validateStringLength(
      'availabilityZoneName',
      availabilityZoneName,
      1,
      64,
    );
    _s.validateStringLength(
      'creationToken',
      creationToken,
      1,
      64,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      0,
      2048,
    );
    _s.validateNumRange(
      'provisionedThroughputInMibps',
      provisionedThroughputInMibps,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (availabilityZoneName != null)
        'AvailabilityZoneName': availabilityZoneName,
      if (backup != null) 'Backup': backup,
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
  /// order to access their file system.
  ///
  /// You can create only one mount target for an EFS file system using One Zone
  /// storage classes. You must create that mount target in the same
  /// Availability Zone in which the file system is located. Use the
  /// <code>AvailabilityZoneName</code> and <code>AvailabiltyZoneId</code>
  /// properties in the <a>DescribeFileSystems</a> response object to get this
  /// information. Use the <code>subnetId</code> associated with the file
  /// system's Availability Zone when creating the mount target.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/how-it-works.html">Amazon
  /// EFS: How it Works</a>.
  ///
  /// To create a mount target for a file system, the file system's lifecycle
  /// state must be <code>available</code>. For more information, see
  /// <a>DescribeFileSystems</a>.
  ///
  /// In the request, provide the following:
  ///
  /// <ul>
  /// <li>
  /// The file system ID for which you are creating the mount target.
  /// </li>
  /// <li>
  /// A subnet ID, which determines the following:
  ///
  /// <ul>
  /// <li>
  /// The VPC in which Amazon EFS creates the mount target
  /// </li>
  /// <li>
  /// The Availability Zone in which Amazon EFS creates the mount target
  /// </li>
  /// <li>
  /// The IP address range from which Amazon EFS selects the IP address of the
  /// mount target (if you don't specify an IP address in the request)
  /// </li>
  /// </ul> </li>
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
  /// May throw [AvailabilityZonesMismatch].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system for which to create the mount target.
  ///
  /// Parameter [subnetId] :
  /// The ID of the subnet to add the mount target in. For file systems that use
  /// One Zone storage classes, use the subnet that is associated with the file
  /// system's Availability Zone.
  ///
  /// Parameter [ipAddress] :
  /// Valid IPv4 address within the address range of the specified subnet.
  ///
  /// Parameter [securityGroups] :
  /// Up to five VPC security group IDs, of the form <code>sg-xxxxxxxx</code>.
  /// These must be for the same VPC as subnet specified.
  Future<MountTargetDescription> createMountTarget({
    required String fileSystemId,
    required String subnetId,
    String? ipAddress,
    List<String>? securityGroups,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
    _s.validateStringLength(
      'ipAddress',
      ipAddress,
      7,
      15,
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

  /// <note>
  /// DEPRECATED - CreateTags is deprecated and not maintained. Please use the
  /// API action to create tags for EFS resources.
  /// </note>
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
    required String fileSystemId,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
    required String accessPointId,
  }) async {
    ArgumentError.checkNotNull(accessPointId, 'accessPointId');
    _s.validateStringLength(
      'accessPointId',
      accessPointId,
      0,
      128,
      isRequired: true,
    );
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
    required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
    required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
    required String mountTargetId,
  }) async {
    ArgumentError.checkNotNull(mountTargetId, 'mountTargetId');
    _s.validateStringLength(
      'mountTargetId',
      mountTargetId,
      13,
      45,
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

  /// <note>
  /// DEPRECATED - DeleteTags is deprecated and not maintained. Please use the
  /// API action to remove tags from EFS resources.
  /// </note>
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
    required String fileSystemId,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
    String? accessPointId,
    String? fileSystemId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'accessPointId',
      accessPointId,
      0,
      128,
    );
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      128,
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

  ///
  /// May throw [InternalServerError].
  Future<DescribeAccountPreferencesResponse> describeAccountPreferences({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      128,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-02-01/account-preferences',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccountPreferencesResponse.fromJson(response);
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
    required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
    required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
    String? creationToken,
    String? fileSystemId,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateStringLength(
      'creationToken',
      creationToken,
      1,
      64,
    );
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      128,
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
    required String fileSystemId,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
    required String mountTargetId,
  }) async {
    ArgumentError.checkNotNull(mountTargetId, 'mountTargetId');
    _s.validateStringLength(
      'mountTargetId',
      mountTargetId,
      13,
      45,
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
    String? accessPointId,
    String? fileSystemId,
    String? marker,
    int? maxItems,
    String? mountTargetId,
  }) async {
    _s.validateStringLength(
      'accessPointId',
      accessPointId,
      0,
      128,
    );
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      128,
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

  /// <note>
  /// DEPRECATED - The DeleteTags action is deprecated and not maintained.
  /// Please use the API action to remove tags from EFS resources.
  /// </note>
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
    required String fileSystemId,
    String? marker,
    int? maxItems,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      128,
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
  /// (Optional) You can use <code>NextToken</code> in a subsequent request to
  /// fetch the next page of access point descriptions if the response payload
  /// was paginated.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      0,
      128,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      128,
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
    required String mountTargetId,
    List<String>? securityGroups,
  }) async {
    ArgumentError.checkNotNull(mountTargetId, 'mountTargetId');
    _s.validateStringLength(
      'mountTargetId',
      mountTargetId,
      13,
      45,
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

  ///
  /// May throw [InternalServerError].
  Future<PutAccountPreferencesResponse> putAccountPreferences({
    required ResourceIdType resourceIdType,
  }) async {
    ArgumentError.checkNotNull(resourceIdType, 'resourceIdType');
    final $payload = <String, dynamic>{
      'ResourceIdType': resourceIdType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/2015-02-01/account-preferences',
      exceptionFnMap: _exceptionFns,
    );
    return PutAccountPreferencesResponse.fromJson(response);
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
    required BackupPolicy backupPolicy,
    required String fileSystemId,
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
  /// set or updated using this API operation. EFS file system policies have a
  /// 20,000 character limit. When an explicit policy is set, it overrides the
  /// default policy. For more information about the default file system policy,
  /// see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/iam-access-control-nfs-efs.html#default-filesystempolicy">Default
  /// EFS File System Policy</a>.
  ///
  /// EFS file system policies have a 20,000 character limit.
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
  /// formatted policy definition. EFS file system policies have a 20,000
  /// character limit. To find out more about the elements that make up a file
  /// system policy, see <a
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
    required String fileSystemId,
    required String policy,
    bool? bypassPolicyLockoutSafetyCheck,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      20000,
      isRequired: true,
    );
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
    required String fileSystemId,
    required List<LifecyclePolicy> lifecyclePolicies,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
  /// An array of <code>Tag</code> objects to add. Each <code>Tag</code> object
  /// is a key-value pair.
  Future<void> tagResource({
    required String resourceId,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      0,
      128,
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
  /// The keys of the key-value tag pairs that you want to remove from the
  /// specified EFS resource.
  Future<void> untagResource({
    required String resourceId,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      0,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
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
  /// (Optional) Sets the amount of provisioned throughput, in MiB/s, for the
  /// file system. Valid values are 1-1024. If you are changing the throughput
  /// mode to provisioned, you must also provide the amount of provisioned
  /// throughput. Required if <code>ThroughputMode</code> is changed to
  /// <code>provisioned</code> on update.
  ///
  /// Parameter [throughputMode] :
  /// (Optional) Updates the file system's throughput mode. If you're not
  /// updating your throughput mode, you don't need to provide this value in
  /// your request. If you are changing the <code>ThroughputMode</code> to
  /// <code>provisioned</code>, you must also set a value for
  /// <code>ProvisionedThroughputInMibps</code>.
  Future<FileSystemDescription> updateFileSystem({
    required String fileSystemId,
    double? provisionedThroughputInMibps,
    ThroughputMode? throughputMode,
  }) async {
    ArgumentError.checkNotNull(fileSystemId, 'fileSystemId');
    _s.validateStringLength(
      'fileSystemId',
      fileSystemId,
      0,
      128,
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
class AccessPointDescription {
  /// The unique Amazon Resource Name (ARN) associated with the access point.
  final String? accessPointArn;

  /// The ID of the access point, assigned by Amazon EFS.
  final String? accessPointId;

  /// The opaque string specified in the request to ensure idempotent creation.
  final String? clientToken;

  /// The ID of the EFS file system that the access point applies to.
  final String? fileSystemId;

  /// Identifies the lifecycle phase of the access point.
  final LifeCycleState? lifeCycleState;

  /// The name of the access point. This is the value of the <code>Name</code>
  /// tag.
  final String? name;

  /// Identified the AWS account that owns the access point resource.
  final String? ownerId;

  /// The full POSIX identity, including the user ID, group ID, and secondary
  /// group IDs on the access point that is used for all file operations by NFS
  /// clients using the access point.
  final PosixUser? posixUser;

  /// The directory on the Amazon EFS file system that the access point exposes as
  /// the root directory to NFS clients using the access point.
  final RootDirectory? rootDirectory;

  /// The tags associated with the access point, presented as an array of Tag
  /// objects.
  final List<Tag>? tags;

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

  factory AccessPointDescription.fromJson(Map<String, dynamic> json) {
    return AccessPointDescription(
      accessPointArn: json['AccessPointArn'] as String?,
      accessPointId: json['AccessPointId'] as String?,
      clientToken: json['ClientToken'] as String?,
      fileSystemId: json['FileSystemId'] as String?,
      lifeCycleState: (json['LifeCycleState'] as String?)?.toLifeCycleState(),
      name: json['Name'] as String?,
      ownerId: json['OwnerId'] as String?,
      posixUser: json['PosixUser'] != null
          ? PosixUser.fromJson(json['PosixUser'] as Map<String, dynamic>)
          : null,
      rootDirectory: json['RootDirectory'] != null
          ? RootDirectory.fromJson(
              json['RootDirectory'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointArn = this.accessPointArn;
    final accessPointId = this.accessPointId;
    final clientToken = this.clientToken;
    final fileSystemId = this.fileSystemId;
    final lifeCycleState = this.lifeCycleState;
    final name = this.name;
    final ownerId = this.ownerId;
    final posixUser = this.posixUser;
    final rootDirectory = this.rootDirectory;
    final tags = this.tags;
    return {
      if (accessPointArn != null) 'AccessPointArn': accessPointArn,
      if (accessPointId != null) 'AccessPointId': accessPointId,
      if (clientToken != null) 'ClientToken': clientToken,
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (lifeCycleState != null) 'LifeCycleState': lifeCycleState.toValue(),
      if (name != null) 'Name': name,
      if (ownerId != null) 'OwnerId': ownerId,
      if (posixUser != null) 'PosixUser': posixUser,
      if (rootDirectory != null) 'RootDirectory': rootDirectory,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The backup policy for the file system used to create automatic daily
/// backups. If status has a value of <code>ENABLED</code>, the file system is
/// being automatically backed up. For more information, see <a
/// href="https://docs.aws.amazon.com/efs/latest/ug/awsbackup.html#automatic-backups">Automatic
/// backups</a>.
class BackupPolicy {
  /// Describes the status of the file system's backup policy.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>ENABLED</code> </b> - EFS is automatically backing up the file
  /// system.
  /// </li>
  /// <li>
  /// <b> <code>ENABLING</code> </b> - EFS is turning on automatic backups for the
  /// file system.
  /// </li>
  /// <li>
  /// <b> <code>DISABLED</code> </b> - automatic back ups are turned off for the
  /// file system.
  /// </li>
  /// <li>
  /// <b> <code>DISABLING</code> </b> - EFS is turning off automatic backups for
  /// the file system.
  /// </li>
  /// </ul>
  final Status status;

  BackupPolicy({
    required this.status,
  });

  factory BackupPolicy.fromJson(Map<String, dynamic> json) {
    return BackupPolicy(
      status: (json['Status'] as String).toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'Status': status.toValue(),
    };
  }
}

class BackupPolicyDescription {
  /// Describes the file system's backup policy, indicating whether automatic
  /// backups are turned on or off..
  final BackupPolicy? backupPolicy;

  BackupPolicyDescription({
    this.backupPolicy,
  });

  factory BackupPolicyDescription.fromJson(Map<String, dynamic> json) {
    return BackupPolicyDescription(
      backupPolicy: json['BackupPolicy'] != null
          ? BackupPolicy.fromJson(json['BackupPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPolicy = this.backupPolicy;
    return {
      if (backupPolicy != null) 'BackupPolicy': backupPolicy,
    };
  }
}

/// Required if the <code>RootDirectory</code> &gt; <code>Path</code> specified
/// does not exist. Specifies the POSIX IDs and permissions to apply to the
/// access point's <code>RootDirectory</code> &gt; <code>Path</code>. If the
/// access point root directory does not exist, EFS creates it with these
/// settings when a client connects to the access point. When specifying
/// <code>CreationInfo</code>, you must include values for all properties.
///
/// Amazon EFS creates a root directory only if you have provided the
/// CreationInfo: OwnUid, OwnGID, and permissions for the directory. If you do
/// not provide this information, Amazon EFS does not create the root directory.
/// If the root directory does not exist, attempts to mount using the access
/// point will fail.
/// <important>
/// If you do not provide <code>CreationInfo</code> and the specified
/// <code>RootDirectory</code> does not exist, attempts to mount the file system
/// using the access point will fail.
/// </important>
class CreationInfo {
  /// Specifies the POSIX group ID to apply to the <code>RootDirectory</code>.
  /// Accepts values from 0 to 2^32 (4294967295).
  final int ownerGid;

  /// Specifies the POSIX user ID to apply to the <code>RootDirectory</code>.
  /// Accepts values from 0 to 2^32 (4294967295).
  final int ownerUid;

  /// Specifies the POSIX permissions to apply to the <code>RootDirectory</code>,
  /// in the format of an octal number representing the file's mode bits.
  final String permissions;

  CreationInfo({
    required this.ownerGid,
    required this.ownerUid,
    required this.permissions,
  });

  factory CreationInfo.fromJson(Map<String, dynamic> json) {
    return CreationInfo(
      ownerGid: json['OwnerGid'] as int,
      ownerUid: json['OwnerUid'] as int,
      permissions: json['Permissions'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final ownerGid = this.ownerGid;
    final ownerUid = this.ownerUid;
    final permissions = this.permissions;
    return {
      'OwnerGid': ownerGid,
      'OwnerUid': ownerUid,
      'Permissions': permissions,
    };
  }
}

class DescribeAccessPointsResponse {
  /// An array of access point descriptions.
  final List<AccessPointDescription>? accessPoints;

  /// Present if there are more access points than returned in the response. You
  /// can use the NextMarker in the subsequent request to fetch the additional
  /// descriptions.
  final String? nextToken;

  DescribeAccessPointsResponse({
    this.accessPoints,
    this.nextToken,
  });

  factory DescribeAccessPointsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccessPointsResponse(
      accessPoints: (json['AccessPoints'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AccessPointDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPoints = this.accessPoints;
    final nextToken = this.nextToken;
    return {
      if (accessPoints != null) 'AccessPoints': accessPoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeAccountPreferencesResponse {
  final String? nextToken;
  final ResourceIdPreference? resourceIdPreference;

  DescribeAccountPreferencesResponse({
    this.nextToken,
    this.resourceIdPreference,
  });

  factory DescribeAccountPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAccountPreferencesResponse(
      nextToken: json['NextToken'] as String?,
      resourceIdPreference: json['ResourceIdPreference'] != null
          ? ResourceIdPreference.fromJson(
              json['ResourceIdPreference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceIdPreference = this.resourceIdPreference;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceIdPreference != null)
        'ResourceIdPreference': resourceIdPreference,
    };
  }
}

class DescribeFileSystemsResponse {
  /// An array of file system descriptions.
  final List<FileSystemDescription>? fileSystems;

  /// Present if provided by caller in the request (String).
  final String? marker;

  /// Present if there are more file systems than returned in the response
  /// (String). You can use the <code>NextMarker</code> in the subsequent request
  /// to fetch the descriptions.
  final String? nextMarker;

  DescribeFileSystemsResponse({
    this.fileSystems,
    this.marker,
    this.nextMarker,
  });

  factory DescribeFileSystemsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFileSystemsResponse(
      fileSystems: (json['FileSystems'] as List?)
          ?.whereNotNull()
          .map((e) => FileSystemDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystems = this.fileSystems;
    final marker = this.marker;
    final nextMarker = this.nextMarker;
    return {
      if (fileSystems != null) 'FileSystems': fileSystems,
      if (marker != null) 'Marker': marker,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class DescribeMountTargetSecurityGroupsResponse {
  /// An array of security groups.
  final List<String> securityGroups;

  DescribeMountTargetSecurityGroupsResponse({
    required this.securityGroups,
  });

  factory DescribeMountTargetSecurityGroupsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeMountTargetSecurityGroupsResponse(
      securityGroups: (json['SecurityGroups'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroups = this.securityGroups;
    return {
      'SecurityGroups': securityGroups,
    };
  }
}

/// <p/>
class DescribeMountTargetsResponse {
  /// If the request included the <code>Marker</code>, the response returns that
  /// value in this field.
  final String? marker;

  /// Returns the file system's mount targets as an array of
  /// <code>MountTargetDescription</code> objects.
  final List<MountTargetDescription>? mountTargets;

  /// If a value is present, there are more mount targets to return. In a
  /// subsequent request, you can provide <code>Marker</code> in your request with
  /// this value to retrieve the next set of mount targets.
  final String? nextMarker;

  DescribeMountTargetsResponse({
    this.marker,
    this.mountTargets,
    this.nextMarker,
  });

  factory DescribeMountTargetsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMountTargetsResponse(
      marker: json['Marker'] as String?,
      mountTargets: (json['MountTargets'] as List?)
          ?.whereNotNull()
          .map(
              (e) => MountTargetDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final mountTargets = this.mountTargets;
    final nextMarker = this.nextMarker;
    return {
      if (marker != null) 'Marker': marker,
      if (mountTargets != null) 'MountTargets': mountTargets,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// <p/>
class DescribeTagsResponse {
  /// Returns tags associated with the file system as an array of <code>Tag</code>
  /// objects.
  final List<Tag> tags;

  /// If the request included a <code>Marker</code>, the response returns that
  /// value in this field.
  final String? marker;

  /// If a value is present, there are more tags to return. In a subsequent
  /// request, you can provide the value of <code>NextMarker</code> as the value
  /// of the <code>Marker</code> parameter in your next request to retrieve the
  /// next set of tags.
  final String? nextMarker;

  DescribeTagsResponse({
    required this.tags,
    this.marker,
    this.nextMarker,
  });

  factory DescribeTagsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTagsResponse(
      tags: (json['Tags'] as List)
          .whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final marker = this.marker;
    final nextMarker = this.nextMarker;
    return {
      'Tags': tags,
      if (marker != null) 'Marker': marker,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// A description of the file system.
class FileSystemDescription {
  /// The time that the file system was created, in seconds (since
  /// 1970-01-01T00:00:00Z).
  final DateTime creationTime;

  /// The opaque string specified in the request.
  final String creationToken;

  /// The ID of the file system, assigned by Amazon EFS.
  final String fileSystemId;

  /// The lifecycle phase of the file system.
  final LifeCycleState lifeCycleState;

  /// The current number of mount targets that the file system has. For more
  /// information, see <a>CreateMountTarget</a>.
  final int numberOfMountTargets;

  /// The AWS account that created the file system. If the file system was created
  /// by an IAM user, the parent account to which the user belongs is the owner.
  final String ownerId;

  /// The performance mode of the file system.
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
  final FileSystemSize sizeInBytes;

  /// The tags associated with the file system, presented as an array of
  /// <code>Tag</code> objects.
  final List<Tag> tags;

  /// The unique and consistent identifier of the Availability Zone in which the
  /// file system's One Zone storage classes exist. For example,
  /// <code>use1-az1</code> is an Availability Zone ID for the us-east-1 AWS
  /// Region, and it has the same location in every AWS account.
  final String? availabilityZoneId;

  /// Describes the AWS Availability Zone in which the file system is located, and
  /// is valid only for file systems using One Zone storage classes. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/storage-classes.html">Using
  /// EFS storage classes</a> in the <i>Amazon EFS User Guide</i>.
  final String? availabilityZoneName;

  /// A Boolean value that, if true, indicates that the file system is encrypted.
  final bool? encrypted;

  /// The Amazon Resource Name (ARN) for the EFS file system, in the format
  /// <code>arn:aws:elasticfilesystem:<i>region</i>:<i>account-id</i>:file-system/<i>file-system-id</i>
  /// </code>. Example with sample data:
  /// <code>arn:aws:elasticfilesystem:us-west-2:1111333322228888:file-system/fs-01234567</code>
  final String? fileSystemArn;

  /// The ID of an AWS Key Management Service (AWS KMS) customer master key (CMK)
  /// that was used to protect the encrypted file system.
  final String? kmsKeyId;

  /// You can add tags to a file system, including a <code>Name</code> tag. For
  /// more information, see <a>CreateFileSystem</a>. If the file system has a
  /// <code>Name</code> tag, Amazon EFS returns the value in this field.
  final String? name;

  /// The amount of provisioned throughput, measured in MiB/s, for the file
  /// system. Valid for file systems using <code>ThroughputMode</code> set to
  /// <code>provisioned</code>.
  final double? provisionedThroughputInMibps;

  /// Displays the file system's throughput mode. For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/performance.html#throughput-modes">Throughput
  /// modes</a> in the <i>Amazon EFS User Guide</i>.
  final ThroughputMode? throughputMode;

  FileSystemDescription({
    required this.creationTime,
    required this.creationToken,
    required this.fileSystemId,
    required this.lifeCycleState,
    required this.numberOfMountTargets,
    required this.ownerId,
    required this.performanceMode,
    required this.sizeInBytes,
    required this.tags,
    this.availabilityZoneId,
    this.availabilityZoneName,
    this.encrypted,
    this.fileSystemArn,
    this.kmsKeyId,
    this.name,
    this.provisionedThroughputInMibps,
    this.throughputMode,
  });

  factory FileSystemDescription.fromJson(Map<String, dynamic> json) {
    return FileSystemDescription(
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      creationToken: json['CreationToken'] as String,
      fileSystemId: json['FileSystemId'] as String,
      lifeCycleState: (json['LifeCycleState'] as String).toLifeCycleState(),
      numberOfMountTargets: json['NumberOfMountTargets'] as int,
      ownerId: json['OwnerId'] as String,
      performanceMode: (json['PerformanceMode'] as String).toPerformanceMode(),
      sizeInBytes:
          FileSystemSize.fromJson(json['SizeInBytes'] as Map<String, dynamic>),
      tags: (json['Tags'] as List)
          .whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilityZoneId: json['AvailabilityZoneId'] as String?,
      availabilityZoneName: json['AvailabilityZoneName'] as String?,
      encrypted: json['Encrypted'] as bool?,
      fileSystemArn: json['FileSystemArn'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      name: json['Name'] as String?,
      provisionedThroughputInMibps:
          json['ProvisionedThroughputInMibps'] as double?,
      throughputMode: (json['ThroughputMode'] as String?)?.toThroughputMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final creationToken = this.creationToken;
    final fileSystemId = this.fileSystemId;
    final lifeCycleState = this.lifeCycleState;
    final numberOfMountTargets = this.numberOfMountTargets;
    final ownerId = this.ownerId;
    final performanceMode = this.performanceMode;
    final sizeInBytes = this.sizeInBytes;
    final tags = this.tags;
    final availabilityZoneId = this.availabilityZoneId;
    final availabilityZoneName = this.availabilityZoneName;
    final encrypted = this.encrypted;
    final fileSystemArn = this.fileSystemArn;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final provisionedThroughputInMibps = this.provisionedThroughputInMibps;
    final throughputMode = this.throughputMode;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'CreationToken': creationToken,
      'FileSystemId': fileSystemId,
      'LifeCycleState': lifeCycleState.toValue(),
      'NumberOfMountTargets': numberOfMountTargets,
      'OwnerId': ownerId,
      'PerformanceMode': performanceMode.toValue(),
      'SizeInBytes': sizeInBytes,
      'Tags': tags,
      if (availabilityZoneId != null) 'AvailabilityZoneId': availabilityZoneId,
      if (availabilityZoneName != null)
        'AvailabilityZoneName': availabilityZoneName,
      if (encrypted != null) 'Encrypted': encrypted,
      if (fileSystemArn != null) 'FileSystemArn': fileSystemArn,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (name != null) 'Name': name,
      if (provisionedThroughputInMibps != null)
        'ProvisionedThroughputInMibps': provisionedThroughputInMibps,
      if (throughputMode != null) 'ThroughputMode': throughputMode.toValue(),
    };
  }
}

class FileSystemPolicyDescription {
  /// Specifies the EFS file system to which the <code>FileSystemPolicy</code>
  /// applies.
  final String? fileSystemId;

  /// The JSON formatted <code>FileSystemPolicy</code> for the EFS file system.
  final String? policy;

  FileSystemPolicyDescription({
    this.fileSystemId,
    this.policy,
  });

  factory FileSystemPolicyDescription.fromJson(Map<String, dynamic> json) {
    return FileSystemPolicyDescription(
      fileSystemId: json['FileSystemId'] as String?,
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemId = this.fileSystemId;
    final policy = this.policy;
    return {
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (policy != null) 'Policy': policy,
    };
  }
}

/// The latest known metered size (in bytes) of data stored in the file system,
/// in its <code>Value</code> field, and the time at which that size was
/// determined in its <code>Timestamp</code> field. The value doesn't represent
/// the size of a consistent snapshot of the file system, but it is eventually
/// consistent when there are no writes to the file system. That is, the value
/// represents the actual size only if the file system is not modified for a
/// period longer than a couple of hours. Otherwise, the value is not
/// necessarily the exact size the file system was at any instant in time.
class FileSystemSize {
  /// The latest known metered size (in bytes) of data stored in the file system.
  final int value;

  /// The time at which the size of data, returned in the <code>Value</code>
  /// field, was determined. The value is the integer number of seconds since
  /// 1970-01-01T00:00:00Z.
  final DateTime? timestamp;

  /// The latest known metered size (in bytes) of data stored in the Infrequent
  /// Access storage class.
  final int? valueInIA;

  /// The latest known metered size (in bytes) of data stored in the Standard
  /// storage class.
  final int? valueInStandard;

  FileSystemSize({
    required this.value,
    this.timestamp,
    this.valueInIA,
    this.valueInStandard,
  });

  factory FileSystemSize.fromJson(Map<String, dynamic> json) {
    return FileSystemSize(
      value: json['Value'] as int,
      timestamp: timeStampFromJson(json['Timestamp']),
      valueInIA: json['ValueInIA'] as int?,
      valueInStandard: json['ValueInStandard'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final timestamp = this.timestamp;
    final valueInIA = this.valueInIA;
    final valueInStandard = this.valueInStandard;
    return {
      'Value': value,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      if (valueInIA != null) 'ValueInIA': valueInIA,
      if (valueInStandard != null) 'ValueInStandard': valueInStandard,
    };
  }
}

enum LifeCycleState {
  creating,
  available,
  updating,
  deleting,
  deleted,
  error,
}

extension on LifeCycleState {
  String toValue() {
    switch (this) {
      case LifeCycleState.creating:
        return 'creating';
      case LifeCycleState.available:
        return 'available';
      case LifeCycleState.updating:
        return 'updating';
      case LifeCycleState.deleting:
        return 'deleting';
      case LifeCycleState.deleted:
        return 'deleted';
      case LifeCycleState.error:
        return 'error';
    }
  }
}

extension on String {
  LifeCycleState toLifeCycleState() {
    switch (this) {
      case 'creating':
        return LifeCycleState.creating;
      case 'available':
        return LifeCycleState.available;
      case 'updating':
        return LifeCycleState.updating;
      case 'deleting':
        return LifeCycleState.deleting;
      case 'deleted':
        return LifeCycleState.deleted;
      case 'error':
        return LifeCycleState.error;
    }
    throw Exception('$this is not known in enum LifeCycleState');
  }
}

class LifecycleConfigurationDescription {
  /// An array of lifecycle management policies. Currently, EFS supports a maximum
  /// of one policy per file system.
  final List<LifecyclePolicy>? lifecyclePolicies;

  LifecycleConfigurationDescription({
    this.lifecyclePolicies,
  });

  factory LifecycleConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return LifecycleConfigurationDescription(
      lifecyclePolicies: (json['LifecyclePolicies'] as List?)
          ?.whereNotNull()
          .map((e) => LifecyclePolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicies = this.lifecyclePolicies;
    return {
      if (lifecyclePolicies != null) 'LifecyclePolicies': lifecyclePolicies,
    };
  }
}

/// Describes a policy used by EFS lifecycle management to transition files to
/// the Infrequent Access (IA) storage class.
class LifecyclePolicy {
  /// A value that describes the period of time that a file is not accessed, after
  /// which it transitions to the IA storage class. Metadata operations such as
  /// listing the contents of a directory don't count as file access events.
  final TransitionToIARules? transitionToIA;

  LifecyclePolicy({
    this.transitionToIA,
  });

  factory LifecyclePolicy.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicy(
      transitionToIA:
          (json['TransitionToIA'] as String?)?.toTransitionToIARules(),
    );
  }

  Map<String, dynamic> toJson() {
    final transitionToIA = this.transitionToIA;
    return {
      if (transitionToIA != null) 'TransitionToIA': transitionToIA.toValue(),
    };
  }
}

class ListTagsForResourceResponse {
  /// <code>NextToken</code> is present if the response payload is paginated. You
  /// can use <code>NextToken</code> in a subsequent request to fetch the next
  /// page of access point descriptions.
  final String? nextToken;

  /// An array of the tags for the specified EFS resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Provides a description of a mount target.
class MountTargetDescription {
  /// The ID of the file system for which the mount target is intended.
  final String fileSystemId;

  /// Lifecycle state of the mount target.
  final LifeCycleState lifeCycleState;

  /// System-assigned mount target ID.
  final String mountTargetId;

  /// The ID of the mount target's subnet.
  final String subnetId;

  /// The unique and consistent identifier of the Availability Zone that the mount
  /// target resides in. For example, <code>use1-az1</code> is an AZ ID for the
  /// us-east-1 Region and it has the same location in every AWS account.
  final String? availabilityZoneId;

  /// The name of the Availability Zone in which the mount target is located.
  /// Availability Zones are independently mapped to names for each AWS account.
  /// For example, the Availability Zone <code>us-east-1a</code> for your AWS
  /// account might not be the same location as <code>us-east-1a</code> for
  /// another AWS account.
  final String? availabilityZoneName;

  /// Address at which the file system can be mounted by using the mount target.
  final String? ipAddress;

  /// The ID of the network interface that Amazon EFS created when it created the
  /// mount target.
  final String? networkInterfaceId;

  /// AWS account ID that owns the resource.
  final String? ownerId;

  /// The virtual private cloud (VPC) ID that the mount target is configured in.
  final String? vpcId;

  MountTargetDescription({
    required this.fileSystemId,
    required this.lifeCycleState,
    required this.mountTargetId,
    required this.subnetId,
    this.availabilityZoneId,
    this.availabilityZoneName,
    this.ipAddress,
    this.networkInterfaceId,
    this.ownerId,
    this.vpcId,
  });

  factory MountTargetDescription.fromJson(Map<String, dynamic> json) {
    return MountTargetDescription(
      fileSystemId: json['FileSystemId'] as String,
      lifeCycleState: (json['LifeCycleState'] as String).toLifeCycleState(),
      mountTargetId: json['MountTargetId'] as String,
      subnetId: json['SubnetId'] as String,
      availabilityZoneId: json['AvailabilityZoneId'] as String?,
      availabilityZoneName: json['AvailabilityZoneName'] as String?,
      ipAddress: json['IpAddress'] as String?,
      networkInterfaceId: json['NetworkInterfaceId'] as String?,
      ownerId: json['OwnerId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemId = this.fileSystemId;
    final lifeCycleState = this.lifeCycleState;
    final mountTargetId = this.mountTargetId;
    final subnetId = this.subnetId;
    final availabilityZoneId = this.availabilityZoneId;
    final availabilityZoneName = this.availabilityZoneName;
    final ipAddress = this.ipAddress;
    final networkInterfaceId = this.networkInterfaceId;
    final ownerId = this.ownerId;
    final vpcId = this.vpcId;
    return {
      'FileSystemId': fileSystemId,
      'LifeCycleState': lifeCycleState.toValue(),
      'MountTargetId': mountTargetId,
      'SubnetId': subnetId,
      if (availabilityZoneId != null) 'AvailabilityZoneId': availabilityZoneId,
      if (availabilityZoneName != null)
        'AvailabilityZoneName': availabilityZoneName,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (networkInterfaceId != null) 'NetworkInterfaceId': networkInterfaceId,
      if (ownerId != null) 'OwnerId': ownerId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

enum PerformanceMode {
  generalPurpose,
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
  }
}

extension on String {
  PerformanceMode toPerformanceMode() {
    switch (this) {
      case 'generalPurpose':
        return PerformanceMode.generalPurpose;
      case 'maxIO':
        return PerformanceMode.maxIO;
    }
    throw Exception('$this is not known in enum PerformanceMode');
  }
}

/// The full POSIX identity, including the user ID, group ID, and any secondary
/// group IDs, on the access point that is used for all file system operations
/// performed by NFS clients using the access point.
class PosixUser {
  /// The POSIX group ID used for all file system operations using this access
  /// point.
  final int gid;

  /// The POSIX user ID used for all file system operations using this access
  /// point.
  final int uid;

  /// Secondary POSIX group IDs used for all file system operations using this
  /// access point.
  final List<int>? secondaryGids;

  PosixUser({
    required this.gid,
    required this.uid,
    this.secondaryGids,
  });

  factory PosixUser.fromJson(Map<String, dynamic> json) {
    return PosixUser(
      gid: json['Gid'] as int,
      uid: json['Uid'] as int,
      secondaryGids: (json['SecondaryGids'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final gid = this.gid;
    final uid = this.uid;
    final secondaryGids = this.secondaryGids;
    return {
      'Gid': gid,
      'Uid': uid,
      if (secondaryGids != null) 'SecondaryGids': secondaryGids,
    };
  }
}

class PutAccountPreferencesResponse {
  final ResourceIdPreference? resourceIdPreference;

  PutAccountPreferencesResponse({
    this.resourceIdPreference,
  });

  factory PutAccountPreferencesResponse.fromJson(Map<String, dynamic> json) {
    return PutAccountPreferencesResponse(
      resourceIdPreference: json['ResourceIdPreference'] != null
          ? ResourceIdPreference.fromJson(
              json['ResourceIdPreference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceIdPreference = this.resourceIdPreference;
    return {
      if (resourceIdPreference != null)
        'ResourceIdPreference': resourceIdPreference,
    };
  }
}

/// An EFS resource, for example a file system or a mount target.
enum Resource {
  fileSystem,
  mountTarget,
}

extension on Resource {
  String toValue() {
    switch (this) {
      case Resource.fileSystem:
        return 'FILE_SYSTEM';
      case Resource.mountTarget:
        return 'MOUNT_TARGET';
    }
  }
}

extension on String {
  Resource toResource() {
    switch (this) {
      case 'FILE_SYSTEM':
        return Resource.fileSystem;
      case 'MOUNT_TARGET':
        return Resource.mountTarget;
    }
    throw Exception('$this is not known in enum Resource');
  }
}

class ResourceIdPreference {
  final ResourceIdType? resourceIdType;
  final List<Resource>? resources;

  ResourceIdPreference({
    this.resourceIdType,
    this.resources,
  });

  factory ResourceIdPreference.fromJson(Map<String, dynamic> json) {
    return ResourceIdPreference(
      resourceIdType: (json['ResourceIdType'] as String?)?.toResourceIdType(),
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toResource())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceIdType = this.resourceIdType;
    final resources = this.resources;
    return {
      if (resourceIdType != null) 'ResourceIdType': resourceIdType.toValue(),
      if (resources != null)
        'Resources': resources.map((e) => e.toValue()).toList(),
    };
  }
}

/// A preference indicating a choice to use 63bit/32bit IDs for all applicable
/// resources.
enum ResourceIdType {
  longId,
  shortId,
}

extension on ResourceIdType {
  String toValue() {
    switch (this) {
      case ResourceIdType.longId:
        return 'LONG_ID';
      case ResourceIdType.shortId:
        return 'SHORT_ID';
    }
  }
}

extension on String {
  ResourceIdType toResourceIdType() {
    switch (this) {
      case 'LONG_ID':
        return ResourceIdType.longId;
      case 'SHORT_ID':
        return ResourceIdType.shortId;
    }
    throw Exception('$this is not known in enum ResourceIdType');
  }
}

/// Specifies the directory on the Amazon EFS file system that the access point
/// provides access to. The access point exposes the specified file system path
/// as the root directory of your file system to applications using the access
/// point. NFS clients using the access point can only access data in the access
/// point's <code>RootDirectory</code> and it's subdirectories.
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
  final CreationInfo? creationInfo;

  /// Specifies the path on the EFS file system to expose as the root directory to
  /// NFS clients using the access point to access the EFS file system. A path can
  /// have up to four subdirectories. If the specified path does not exist, you
  /// are required to provide the <code>CreationInfo</code>.
  final String? path;

  RootDirectory({
    this.creationInfo,
    this.path,
  });

  factory RootDirectory.fromJson(Map<String, dynamic> json) {
    return RootDirectory(
      creationInfo: json['CreationInfo'] != null
          ? CreationInfo.fromJson(json['CreationInfo'] as Map<String, dynamic>)
          : null,
      path: json['Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationInfo = this.creationInfo;
    final path = this.path;
    return {
      if (creationInfo != null) 'CreationInfo': creationInfo,
      if (path != null) 'Path': path,
    };
  }
}

enum Status {
  enabled,
  enabling,
  disabled,
  disabling,
}

extension on Status {
  String toValue() {
    switch (this) {
      case Status.enabled:
        return 'ENABLED';
      case Status.enabling:
        return 'ENABLING';
      case Status.disabled:
        return 'DISABLED';
      case Status.disabling:
        return 'DISABLING';
    }
  }
}

extension on String {
  Status toStatus() {
    switch (this) {
      case 'ENABLED':
        return Status.enabled;
      case 'ENABLING':
        return Status.enabling;
      case 'DISABLED':
        return Status.disabled;
      case 'DISABLING':
        return Status.disabling;
    }
    throw Exception('$this is not known in enum Status');
  }
}

/// A tag is a key-value pair. Allowed characters are letters, white space, and
/// numbers that can be represented in UTF-8, and the following
/// characters:<code> + - = . _ : /</code>.
class Tag {
  /// The tag key (String). The key can't start with <code>aws:</code>.
  final String key;

  /// The value of the tag key.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

enum ThroughputMode {
  bursting,
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
  }
}

extension on String {
  ThroughputMode toThroughputMode() {
    switch (this) {
      case 'bursting':
        return ThroughputMode.bursting;
      case 'provisioned':
        return ThroughputMode.provisioned;
    }
    throw Exception('$this is not known in enum ThroughputMode');
  }
}

enum TransitionToIARules {
  after_7Days,
  after_14Days,
  after_30Days,
  after_60Days,
  after_90Days,
}

extension on TransitionToIARules {
  String toValue() {
    switch (this) {
      case TransitionToIARules.after_7Days:
        return 'AFTER_7_DAYS';
      case TransitionToIARules.after_14Days:
        return 'AFTER_14_DAYS';
      case TransitionToIARules.after_30Days:
        return 'AFTER_30_DAYS';
      case TransitionToIARules.after_60Days:
        return 'AFTER_60_DAYS';
      case TransitionToIARules.after_90Days:
        return 'AFTER_90_DAYS';
    }
  }
}

extension on String {
  TransitionToIARules toTransitionToIARules() {
    switch (this) {
      case 'AFTER_7_DAYS':
        return TransitionToIARules.after_7Days;
      case 'AFTER_14_DAYS':
        return TransitionToIARules.after_14Days;
      case 'AFTER_30_DAYS':
        return TransitionToIARules.after_30Days;
      case 'AFTER_60_DAYS':
        return TransitionToIARules.after_60Days;
      case 'AFTER_90_DAYS':
        return TransitionToIARules.after_90Days;
    }
    throw Exception('$this is not known in enum TransitionToIARules');
  }
}

class AccessPointAlreadyExists extends _s.GenericAwsException {
  AccessPointAlreadyExists({String? type, String? message})
      : super(type: type, code: 'AccessPointAlreadyExists', message: message);
}

class AccessPointLimitExceeded extends _s.GenericAwsException {
  AccessPointLimitExceeded({String? type, String? message})
      : super(type: type, code: 'AccessPointLimitExceeded', message: message);
}

class AccessPointNotFound extends _s.GenericAwsException {
  AccessPointNotFound({String? type, String? message})
      : super(type: type, code: 'AccessPointNotFound', message: message);
}

class AvailabilityZonesMismatch extends _s.GenericAwsException {
  AvailabilityZonesMismatch({String? type, String? message})
      : super(type: type, code: 'AvailabilityZonesMismatch', message: message);
}

class BadRequest extends _s.GenericAwsException {
  BadRequest({String? type, String? message})
      : super(type: type, code: 'BadRequest', message: message);
}

class DependencyTimeout extends _s.GenericAwsException {
  DependencyTimeout({String? type, String? message})
      : super(type: type, code: 'DependencyTimeout', message: message);
}

class FileSystemAlreadyExists extends _s.GenericAwsException {
  FileSystemAlreadyExists({String? type, String? message})
      : super(type: type, code: 'FileSystemAlreadyExists', message: message);
}

class FileSystemInUse extends _s.GenericAwsException {
  FileSystemInUse({String? type, String? message})
      : super(type: type, code: 'FileSystemInUse', message: message);
}

class FileSystemLimitExceeded extends _s.GenericAwsException {
  FileSystemLimitExceeded({String? type, String? message})
      : super(type: type, code: 'FileSystemLimitExceeded', message: message);
}

class FileSystemNotFound extends _s.GenericAwsException {
  FileSystemNotFound({String? type, String? message})
      : super(type: type, code: 'FileSystemNotFound', message: message);
}

class IncorrectFileSystemLifeCycleState extends _s.GenericAwsException {
  IncorrectFileSystemLifeCycleState({String? type, String? message})
      : super(
            type: type,
            code: 'IncorrectFileSystemLifeCycleState',
            message: message);
}

class IncorrectMountTargetState extends _s.GenericAwsException {
  IncorrectMountTargetState({String? type, String? message})
      : super(type: type, code: 'IncorrectMountTargetState', message: message);
}

class InsufficientThroughputCapacity extends _s.GenericAwsException {
  InsufficientThroughputCapacity({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientThroughputCapacity',
            message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidPolicyException extends _s.GenericAwsException {
  InvalidPolicyException({String? type, String? message})
      : super(type: type, code: 'InvalidPolicyException', message: message);
}

class IpAddressInUse extends _s.GenericAwsException {
  IpAddressInUse({String? type, String? message})
      : super(type: type, code: 'IpAddressInUse', message: message);
}

class MountTargetConflict extends _s.GenericAwsException {
  MountTargetConflict({String? type, String? message})
      : super(type: type, code: 'MountTargetConflict', message: message);
}

class MountTargetNotFound extends _s.GenericAwsException {
  MountTargetNotFound({String? type, String? message})
      : super(type: type, code: 'MountTargetNotFound', message: message);
}

class NetworkInterfaceLimitExceeded extends _s.GenericAwsException {
  NetworkInterfaceLimitExceeded({String? type, String? message})
      : super(
            type: type,
            code: 'NetworkInterfaceLimitExceeded',
            message: message);
}

class NoFreeAddressesInSubnet extends _s.GenericAwsException {
  NoFreeAddressesInSubnet({String? type, String? message})
      : super(type: type, code: 'NoFreeAddressesInSubnet', message: message);
}

class PolicyNotFound extends _s.GenericAwsException {
  PolicyNotFound({String? type, String? message})
      : super(type: type, code: 'PolicyNotFound', message: message);
}

class SecurityGroupLimitExceeded extends _s.GenericAwsException {
  SecurityGroupLimitExceeded({String? type, String? message})
      : super(type: type, code: 'SecurityGroupLimitExceeded', message: message);
}

class SecurityGroupNotFound extends _s.GenericAwsException {
  SecurityGroupNotFound({String? type, String? message})
      : super(type: type, code: 'SecurityGroupNotFound', message: message);
}

class SubnetNotFound extends _s.GenericAwsException {
  SubnetNotFound({String? type, String? message})
      : super(type: type, code: 'SubnetNotFound', message: message);
}

class ThroughputLimitExceeded extends _s.GenericAwsException {
  ThroughputLimitExceeded({String? type, String? message})
      : super(type: type, code: 'ThroughputLimitExceeded', message: message);
}

class TooManyRequests extends _s.GenericAwsException {
  TooManyRequests({String? type, String? message})
      : super(type: type, code: 'TooManyRequests', message: message);
}

class UnsupportedAvailabilityZone extends _s.GenericAwsException {
  UnsupportedAvailabilityZone({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedAvailabilityZone', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessPointAlreadyExists': (type, message) =>
      AccessPointAlreadyExists(type: type, message: message),
  'AccessPointLimitExceeded': (type, message) =>
      AccessPointLimitExceeded(type: type, message: message),
  'AccessPointNotFound': (type, message) =>
      AccessPointNotFound(type: type, message: message),
  'AvailabilityZonesMismatch': (type, message) =>
      AvailabilityZonesMismatch(type: type, message: message),
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
