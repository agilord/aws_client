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

/// AWS DataSync is a managed data transfer service that makes it simpler for
/// you to automate moving data between on-premises storage and Amazon Simple
/// Storage Service (Amazon S3) or Amazon Elastic File System (Amazon EFS).
class DataSync {
  final _s.JsonProtocol _protocol;
  DataSync({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'datasync',
            signingName: 'datasync',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels execution of a task.
  ///
  /// When you cancel a task execution, the transfer of some files is abruptly
  /// interrupted. The contents of files that are transferred to the destination
  /// might be incomplete or inconsistent with the source files. However, if you
  /// start a new task execution on the same task and you allow the task
  /// execution to complete, file content on the destination is complete and
  /// consistent. This applies to other unexpected failures that interrupt a
  /// task execution. In all of these cases, AWS DataSync successfully complete
  /// the transfer when you start the next task execution.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskExecutionArn] :
  /// The Amazon Resource Name (ARN) of the task execution to cancel.
  Future<void> cancelTaskExecution({
    required String taskExecutionArn,
  }) async {
    ArgumentError.checkNotNull(taskExecutionArn, 'taskExecutionArn');
    _s.validateStringLength(
      'taskExecutionArn',
      taskExecutionArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CancelTaskExecution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskExecutionArn': taskExecutionArn,
      },
    );
  }

  /// Activates an AWS DataSync agent that you have deployed on your host. The
  /// activation process associates your agent with your account. In the
  /// activation process, you specify information such as the AWS Region that
  /// you want to activate the agent in. You activate the agent in the AWS
  /// Region where your target locations (in Amazon S3 or Amazon EFS) reside.
  /// Your tasks are created in this AWS Region.
  ///
  /// You can activate the agent in a VPC (virtual private cloud) or provide the
  /// agent access to a VPC endpoint so you can run tasks without going over the
  /// public internet.
  ///
  /// You can use an agent for more than one location. If a task uses multiple
  /// agents, all of them need to have status AVAILABLE for the task to run. If
  /// you use multiple agents for a source location, the status of all the
  /// agents must be AVAILABLE for the task to run.
  ///
  /// Agents are automatically updated by AWS on a regular basis, using a
  /// mechanism that ensures minimal interruption to your tasks.
  /// <p/>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [activationKey] :
  /// Your agent activation key. You can get the activation key either by
  /// sending an HTTP GET request with redirects that enable you to get the
  /// agent IP address (port 80). Alternatively, you can get it from the AWS
  /// DataSync console.
  ///
  /// The redirect URL returned in the response provides you the activation key
  /// for your agent in the query string parameter <code>activationKey</code>.
  /// It might also include other activation-related parameters; however, these
  /// are merely defaults. The arguments you pass to this API call determine the
  /// actual configuration of your agent.
  ///
  /// For more information, see Activating an Agent in the <i>AWS DataSync User
  /// Guide.</i>
  ///
  /// Parameter [agentName] :
  /// The name you configured for your agent. This value is a text reference
  /// that is used to identify the agent in the console.
  ///
  /// Parameter [securityGroupArns] :
  /// The ARNs of the security groups used to protect your data transfer task
  /// subnets. See <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_Ec2Config.html#DataSync-Type-Ec2Config-SecurityGroupArns">SecurityGroupArns</a>.
  ///
  /// Parameter [subnetArns] :
  /// The Amazon Resource Names (ARNs) of the subnets in which DataSync will
  /// create elastic network interfaces for each data transfer task. The agent
  /// that runs a task must be private. When you start a task that is associated
  /// with an agent created in a VPC, or one that has access to an IP address in
  /// a VPC, then the task is also private. In this case, DataSync creates four
  /// network interfaces for each task in your subnet. For a data transfer to
  /// work, the agent must be able to route to all these four network
  /// interfaces.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents the tag that you want to associate with
  /// the agent. The value can be an empty string. This value helps you manage,
  /// filter, and search for your agents.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @.
  /// </note>
  ///
  /// Parameter [vpcEndpointId] :
  /// The ID of the VPC (virtual private cloud) endpoint that the agent has
  /// access to. This is the client-side VPC endpoint, also called a
  /// PrivateLink. If you don't have a PrivateLink VPC endpoint, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html#create-endpoint-service">Creating
  /// a VPC Endpoint Service Configuration</a> in the Amazon VPC User Guide.
  ///
  /// VPC endpoint ID looks like this: <code>vpce-01234d5aff67890e1</code>.
  Future<CreateAgentResponse> createAgent({
    required String activationKey,
    String? agentName,
    List<String>? securityGroupArns,
    List<String>? subnetArns,
    List<TagListEntry>? tags,
    String? vpcEndpointId,
  }) async {
    ArgumentError.checkNotNull(activationKey, 'activationKey');
    _s.validateStringLength(
      'activationKey',
      activationKey,
      0,
      29,
      isRequired: true,
    );
    _s.validateStringLength(
      'agentName',
      agentName,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateAgent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ActivationKey': activationKey,
        if (agentName != null) 'AgentName': agentName,
        if (securityGroupArns != null) 'SecurityGroupArns': securityGroupArns,
        if (subnetArns != null) 'SubnetArns': subnetArns,
        if (tags != null) 'Tags': tags,
        if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      },
    );

    return CreateAgentResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for an Amazon EFS file system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [ec2Config] :
  /// The subnet and security group that the Amazon EFS file system uses. The
  /// security group that you provide needs to be able to communicate with the
  /// security group on the mount target in the subnet specified.
  ///
  /// The exact relationship between security group M (of the mount target) and
  /// security group S (which you provide for DataSync to use at this stage) is
  /// as follows:
  ///
  /// <ul>
  /// <li>
  /// Security group M (which you associate with the mount target) must allow
  /// inbound access for the Transmission Control Protocol (TCP) on the NFS port
  /// (2049) from security group S. You can enable inbound connections either by
  /// IP address (CIDR range) or security group.
  /// </li>
  /// <li>
  /// Security group S (provided to DataSync to access EFS) should have a rule
  /// that enables outbound connections to the NFS port on one of the file
  /// system’s mount targets. You can enable outbound connections either by IP
  /// address (CIDR range) or security group.
  ///
  /// For information about security groups and mount targets, see Security
  /// Groups for Amazon EC2 Instances and Mount Targets in the <i>Amazon EFS
  /// User Guide.</i>
  /// </li>
  /// </ul>
  ///
  /// Parameter [efsFilesystemArn] :
  /// The Amazon Resource Name (ARN) for the Amazon EFS file system.
  ///
  /// Parameter [subdirectory] :
  /// A subdirectory in the location’s path. This subdirectory in the EFS file
  /// system is used to read data from the EFS source location or write data to
  /// the EFS destination. By default, AWS DataSync uses the root directory.
  /// <note>
  /// <code>Subdirectory</code> must be specified with forward slashes. For
  /// example, <code>/path/to/folder</code>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents a tag that you want to add to the
  /// resource. The value can be an empty string. This value helps you manage,
  /// filter, and search for your resources. We recommend that you create a name
  /// tag for your location.
  Future<CreateLocationEfsResponse> createLocationEfs({
    required Ec2Config ec2Config,
    required String efsFilesystemArn,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    ArgumentError.checkNotNull(ec2Config, 'ec2Config');
    ArgumentError.checkNotNull(efsFilesystemArn, 'efsFilesystemArn');
    _s.validateStringLength(
      'efsFilesystemArn',
      efsFilesystemArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationEfs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Ec2Config': ec2Config,
        'EfsFilesystemArn': efsFilesystemArn,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationEfsResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for an Amazon FSx for Windows File Server file system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [fsxFilesystemArn] :
  /// The Amazon Resource Name (ARN) for the FSx for Windows File Server file
  /// system.
  ///
  /// Parameter [password] :
  /// The password of the user who has the permissions to access files and
  /// folders in the FSx for Windows File Server file system.
  ///
  /// Parameter [securityGroupArns] :
  /// The Amazon Resource Names (ARNs) of the security groups that are to use to
  /// configure the FSx for Windows File Server file system.
  ///
  /// Parameter [user] :
  /// The user who has the permissions to access files and folders in the FSx
  /// for Windows File Server file system.
  ///
  /// For information about choosing a user name that ensures sufficient
  /// permissions to files, folders, and metadata, see <a
  /// href="create-fsx-location.html#FSxWuser">user</a>.
  ///
  /// Parameter [domain] :
  /// The name of the Windows domain that the FSx for Windows File Server
  /// belongs to.
  ///
  /// Parameter [subdirectory] :
  /// A subdirectory in the location’s path. This subdirectory in the Amazon FSx
  /// for Windows File Server file system is used to read data from the Amazon
  /// FSx for Windows File Server source location or write data to the FSx for
  /// Windows File Server destination.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents a tag that you want to add to the
  /// resource. The value can be an empty string. This value helps you manage,
  /// filter, and search for your resources. We recommend that you create a name
  /// tag for your location.
  Future<CreateLocationFsxWindowsResponse> createLocationFsxWindows({
    required String fsxFilesystemArn,
    required String password,
    required List<String> securityGroupArns,
    required String user,
    String? domain,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    ArgumentError.checkNotNull(fsxFilesystemArn, 'fsxFilesystemArn');
    _s.validateStringLength(
      'fsxFilesystemArn',
      fsxFilesystemArn,
      0,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      0,
      104,
      isRequired: true,
    );
    ArgumentError.checkNotNull(securityGroupArns, 'securityGroupArns');
    ArgumentError.checkNotNull(user, 'user');
    _s.validateStringLength(
      'user',
      user,
      0,
      104,
      isRequired: true,
    );
    _s.validateStringLength(
      'domain',
      domain,
      0,
      253,
    );
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationFsxWindows'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FsxFilesystemArn': fsxFilesystemArn,
        'Password': password,
        'SecurityGroupArns': securityGroupArns,
        'User': user,
        if (domain != null) 'Domain': domain,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationFsxWindowsResponse.fromJson(jsonResponse.body);
  }

  /// Defines a file system on a Network File System (NFS) server that can be
  /// read from or written to.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [onPremConfig] :
  /// Contains a list of Amazon Resource Names (ARNs) of agents that are used to
  /// connect to an NFS server.
  ///
  /// If you are copying data to or from your AWS Snowcone device, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#nfs-on-snowcone">NFS
  /// Server on AWS Snowcone</a> for more information.
  ///
  /// Parameter [serverHostname] :
  /// The name of the NFS server. This value is the IP address or Domain Name
  /// Service (DNS) name of the NFS server. An agent that is installed
  /// on-premises uses this host name to mount the NFS server in a network.
  ///
  /// If you are copying data to or from your AWS Snowcone device, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#nfs-on-snowcone">NFS
  /// Server on AWS Snowcone</a> for more information.
  /// <note>
  /// This name must either be DNS-compliant or must be an IP version 4 (IPv4)
  /// address.
  /// </note>
  ///
  /// Parameter [subdirectory] :
  /// The subdirectory in the NFS file system that is used to read data from the
  /// NFS source location or write data to the NFS destination. The NFS path
  /// should be a path that's exported by the NFS server, or a subdirectory of
  /// that path. The path should be such that it can be mounted by other NFS
  /// clients in your network.
  ///
  /// To see all the paths exported by your NFS server, run "<code>showmount -e
  /// nfs-server-name</code>" from an NFS client that has access to your server.
  /// You can specify any directory that appears in the results, and any
  /// subdirectory of that directory. Ensure that the NFS export is accessible
  /// without Kerberos authentication.
  ///
  /// To transfer all the data in the folder you specified, DataSync needs to
  /// have permissions to read all the data. To ensure this, either configure
  /// the NFS export with <code>no_root_squash,</code> or ensure that the
  /// permissions for all of the files that you want DataSync allow read access
  /// for all users. Doing either enables the agent to read the files. For the
  /// agent to access directories, you must additionally enable all execute
  /// access.
  ///
  /// If you are copying data to or from your AWS Snowcone device, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#nfs-on-snowcone">NFS
  /// Server on AWS Snowcone</a> for more information.
  ///
  /// For information about NFS export configuration, see 18.7. The /etc/exports
  /// Configuration File in the Red Hat Enterprise Linux documentation.
  ///
  /// Parameter [mountOptions] :
  /// The NFS mount options that DataSync can use to mount your NFS share.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents the tag that you want to add to the
  /// location. The value can be an empty string. We recommend using tags to
  /// name your resources.
  Future<CreateLocationNfsResponse> createLocationNfs({
    required OnPremConfig onPremConfig,
    required String serverHostname,
    required String subdirectory,
    NfsMountOptions? mountOptions,
    List<TagListEntry>? tags,
  }) async {
    ArgumentError.checkNotNull(onPremConfig, 'onPremConfig');
    ArgumentError.checkNotNull(serverHostname, 'serverHostname');
    _s.validateStringLength(
      'serverHostname',
      serverHostname,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(subdirectory, 'subdirectory');
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationNfs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OnPremConfig': onPremConfig,
        'ServerHostname': serverHostname,
        'Subdirectory': subdirectory,
        if (mountOptions != null) 'MountOptions': mountOptions,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationNfsResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for a self-managed object storage bucket. For more
  /// information about self-managed object storage locations, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html">Creating
  /// a location for object storage</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArns] :
  /// The Amazon Resource Name (ARN) of the agents associated with the
  /// self-managed object storage server location.
  ///
  /// Parameter [bucketName] :
  /// The bucket on the self-managed object storage server that is used to read
  /// data from.
  ///
  /// Parameter [serverHostname] :
  /// The name of the self-managed object storage server. This value is the IP
  /// address or Domain Name Service (DNS) name of the object storage server. An
  /// agent uses this host name to mount the object storage server in a network.
  ///
  /// Parameter [accessKey] :
  /// Optional. The access key is used if credentials are required to access the
  /// self-managed object storage server. If your object storage requires a user
  /// name and password to authenticate, use <code>AccessKey</code> and
  /// <code>SecretKey</code> to provide the user name and password,
  /// respectively.
  ///
  /// Parameter [secretKey] :
  /// Optional. The secret key is used if credentials are required to access the
  /// self-managed object storage server. If your object storage requires a user
  /// name and password to authenticate, use <code>AccessKey</code> and
  /// <code>SecretKey</code> to provide the user name and password,
  /// respectively.
  ///
  /// Parameter [serverPort] :
  /// The port that your self-managed object storage server accepts inbound
  /// network traffic on. The server port is set by default to TCP 80 (HTTP) or
  /// TCP 443 (HTTPS). You can specify a custom port if your self-managed object
  /// storage server requires one.
  ///
  /// Parameter [serverProtocol] :
  /// The protocol that the object storage server uses to communicate. Valid
  /// values are HTTP or HTTPS.
  ///
  /// Parameter [subdirectory] :
  /// The subdirectory in the self-managed object storage server that is used to
  /// read data from.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents the tag that you want to add to the
  /// location. The value can be an empty string. We recommend using tags to
  /// name your resources.
  Future<CreateLocationObjectStorageResponse> createLocationObjectStorage({
    required List<String> agentArns,
    required String bucketName,
    required String serverHostname,
    String? accessKey,
    String? secretKey,
    int? serverPort,
    ObjectStorageServerProtocol? serverProtocol,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    ArgumentError.checkNotNull(agentArns, 'agentArns');
    ArgumentError.checkNotNull(bucketName, 'bucketName');
    _s.validateStringLength(
      'bucketName',
      bucketName,
      3,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serverHostname, 'serverHostname');
    _s.validateStringLength(
      'serverHostname',
      serverHostname,
      0,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'accessKey',
      accessKey,
      8,
      200,
    );
    _s.validateStringLength(
      'secretKey',
      secretKey,
      8,
      200,
    );
    _s.validateNumRange(
      'serverPort',
      serverPort,
      1,
      65536,
    );
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationObjectStorage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgentArns': agentArns,
        'BucketName': bucketName,
        'ServerHostname': serverHostname,
        if (accessKey != null) 'AccessKey': accessKey,
        if (secretKey != null) 'SecretKey': secretKey,
        if (serverPort != null) 'ServerPort': serverPort,
        if (serverProtocol != null) 'ServerProtocol': serverProtocol.toValue(),
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationObjectStorageResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for an Amazon S3 bucket.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/datasync/latest/userguide/create-locations-cli.html#create-location-s3-cli
  /// in the <i>AWS DataSync User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3BucketArn] :
  /// The ARN of the Amazon S3 bucket. If the bucket is on an AWS Outpost, this
  /// must be an access point ARN.
  ///
  /// Parameter [agentArns] :
  /// If you are using DataSync on an AWS Outpost, specify the Amazon Resource
  /// Names (ARNs) of the DataSync agents deployed on your Outpost. For more
  /// information about launching a DataSync agent on an AWS Outpost, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/deploy-agents.html#outposts-agent">Deploy
  /// your DataSync agent on AWS Outposts</a>.
  ///
  /// Parameter [s3StorageClass] :
  /// The Amazon S3 storage class that you want to store your files in when this
  /// location is used as a task destination. For buckets in AWS Regions, the
  /// storage class defaults to Standard. For buckets on AWS Outposts, the
  /// storage class defaults to AWS S3 Outposts.
  ///
  /// For more information about S3 storage classes, see <a
  /// href="http://aws.amazon.com/s3/storage-classes/">Amazon S3 Storage
  /// Classes</a>. Some storage classes have behaviors that can affect your S3
  /// storage cost. For detailed information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Considerations
  /// when working with S3 storage classes in DataSync</a>.
  ///
  /// Parameter [subdirectory] :
  /// A subdirectory in the Amazon S3 bucket. This subdirectory in Amazon S3 is
  /// used to read data from the S3 source location or write data to the S3
  /// destination.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents the tag that you want to add to the
  /// location. The value can be an empty string. We recommend using tags to
  /// name your resources.
  Future<CreateLocationS3Response> createLocationS3({
    required String s3BucketArn,
    required S3Config s3Config,
    List<String>? agentArns,
    S3StorageClass? s3StorageClass,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    ArgumentError.checkNotNull(s3BucketArn, 's3BucketArn');
    _s.validateStringLength(
      's3BucketArn',
      s3BucketArn,
      0,
      156,
      isRequired: true,
    );
    ArgumentError.checkNotNull(s3Config, 's3Config');
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationS3'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'S3BucketArn': s3BucketArn,
        'S3Config': s3Config,
        if (agentArns != null) 'AgentArns': agentArns,
        if (s3StorageClass != null) 'S3StorageClass': s3StorageClass.toValue(),
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationS3Response.fromJson(jsonResponse.body);
  }

  /// Defines a file system on a Server Message Block (SMB) server that can be
  /// read from or written to.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArns] :
  /// The Amazon Resource Names (ARNs) of agents to use for a Simple Message
  /// Block (SMB) location.
  ///
  /// Parameter [password] :
  /// The password of the user who can mount the share, has the permissions to
  /// access files and folders in the SMB share.
  ///
  /// Parameter [serverHostname] :
  /// The name of the SMB server. This value is the IP address or Domain Name
  /// Service (DNS) name of the SMB server. An agent that is installed
  /// on-premises uses this hostname to mount the SMB server in a network.
  /// <note>
  /// This name must either be DNS-compliant or must be an IP version 4 (IPv4)
  /// address.
  /// </note>
  ///
  /// Parameter [subdirectory] :
  /// The subdirectory in the SMB file system that is used to read data from the
  /// SMB source location or write data to the SMB destination. The SMB path
  /// should be a path that's exported by the SMB server, or a subdirectory of
  /// that path. The path should be such that it can be mounted by other SMB
  /// clients in your network.
  /// <note>
  /// <code>Subdirectory</code> must be specified with forward slashes. For
  /// example, <code>/path/to/folder</code>.
  /// </note>
  /// To transfer all the data in the folder you specified, DataSync needs to
  /// have permissions to mount the SMB share, as well as to access all the data
  /// in that share. To ensure this, either ensure that the user/password
  /// specified belongs to the user who can mount the share, and who has the
  /// appropriate permissions for all of the files and directories that you want
  /// DataSync to access, or use credentials of a member of the Backup Operators
  /// group to mount the share. Doing either enables the agent to access the
  /// data. For the agent to access directories, you must additionally enable
  /// all execute access.
  ///
  /// Parameter [user] :
  /// The user who can mount the share, has the permissions to access files and
  /// folders in the SMB share.
  ///
  /// For information about choosing a user name that ensures sufficient
  /// permissions to files, folders, and metadata, see <a
  /// href="create-smb-location.html#SMBuser">user</a>.
  ///
  /// Parameter [domain] :
  /// The name of the Windows domain that the SMB server belongs to.
  ///
  /// Parameter [mountOptions] :
  /// The mount options used by DataSync to access the SMB server.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents the tag that you want to add to the
  /// location. The value can be an empty string. We recommend using tags to
  /// name your resources.
  Future<CreateLocationSmbResponse> createLocationSmb({
    required List<String> agentArns,
    required String password,
    required String serverHostname,
    required String subdirectory,
    required String user,
    String? domain,
    SmbMountOptions? mountOptions,
    List<TagListEntry>? tags,
  }) async {
    ArgumentError.checkNotNull(agentArns, 'agentArns');
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      0,
      104,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serverHostname, 'serverHostname');
    _s.validateStringLength(
      'serverHostname',
      serverHostname,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(subdirectory, 'subdirectory');
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
      isRequired: true,
    );
    ArgumentError.checkNotNull(user, 'user');
    _s.validateStringLength(
      'user',
      user,
      0,
      104,
      isRequired: true,
    );
    _s.validateStringLength(
      'domain',
      domain,
      0,
      253,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationSmb'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgentArns': agentArns,
        'Password': password,
        'ServerHostname': serverHostname,
        'Subdirectory': subdirectory,
        'User': user,
        if (domain != null) 'Domain': domain,
        if (mountOptions != null) 'MountOptions': mountOptions,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationSmbResponse.fromJson(jsonResponse.body);
  }

  /// Creates a task.
  ///
  /// A task includes a source location and a destination location, and a
  /// configuration that specifies how data is transferred. A task always
  /// transfers data from the source location to the destination location. The
  /// configuration specifies options such as task scheduling, bandwidth limits,
  /// etc. A task is the complete definition of a data transfer.
  ///
  /// When you create a task that transfers data between AWS services in
  /// different AWS Regions, one of the two locations that you specify must
  /// reside in the Region where DataSync is being used. The other location must
  /// be specified in a different Region.
  ///
  /// You can transfer data between commercial AWS Regions except for China, or
  /// between AWS GovCloud (US-East and US-West) Regions.
  /// <important>
  /// When you use DataSync to copy files or objects between AWS Regions, you
  /// pay for data transfer between Regions. This is billed as data transfer OUT
  /// from your source Region to your destination Region. For more information,
  /// see <a
  /// href="http://aws.amazon.com/ec2/pricing/on-demand/#Data_Transfer">Data
  /// Transfer pricing</a>.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [destinationLocationArn] :
  /// The Amazon Resource Name (ARN) of an AWS storage resource's location.
  ///
  /// Parameter [sourceLocationArn] :
  /// The Amazon Resource Name (ARN) of the source location for the task.
  ///
  /// Parameter [cloudWatchLogGroupArn] :
  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that is
  /// used to monitor and log events in the task.
  ///
  /// Parameter [excludes] :
  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the
  /// patterns to exclude. The patterns are delimited by "|" (that is, a pipe),
  /// for example, <code>"/folder1|/folder2"</code>.
  ///
  ///
  ///
  /// Parameter [name] :
  /// The name of a task. This value is a text reference that is used to
  /// identify the task in the console.
  ///
  /// Parameter [options] :
  /// The set of configuration options that control the behavior of a single
  /// execution of the task that occurs when you call
  /// <code>StartTaskExecution</code>. You can configure these options to
  /// preserve metadata such as user ID (UID) and group ID (GID), file
  /// permissions, data integrity verification, and so on.
  ///
  /// For each individual task execution, you can override these options by
  /// specifying the <code>OverrideOptions</code> before starting the task
  /// execution. For more information, see the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_StartTaskExecution.html">StartTaskExecution</a>
  /// operation.
  ///
  /// Parameter [schedule] :
  /// Specifies a schedule used to periodically transfer files from a source to
  /// a destination location. The schedule should be specified in UTC time. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">Scheduling
  /// your task</a>.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents the tag that you want to add to the
  /// resource. The value can be an empty string.
  Future<CreateTaskResponse> createTask({
    required String destinationLocationArn,
    required String sourceLocationArn,
    String? cloudWatchLogGroupArn,
    List<FilterRule>? excludes,
    String? name,
    Options? options,
    TaskSchedule? schedule,
    List<TagListEntry>? tags,
  }) async {
    ArgumentError.checkNotNull(
        destinationLocationArn, 'destinationLocationArn');
    _s.validateStringLength(
      'destinationLocationArn',
      destinationLocationArn,
      0,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceLocationArn, 'sourceLocationArn');
    _s.validateStringLength(
      'sourceLocationArn',
      sourceLocationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'cloudWatchLogGroupArn',
      cloudWatchLogGroupArn,
      0,
      562,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationLocationArn': destinationLocationArn,
        'SourceLocationArn': sourceLocationArn,
        if (cloudWatchLogGroupArn != null)
          'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
        if (excludes != null) 'Excludes': excludes,
        if (name != null) 'Name': name,
        if (options != null) 'Options': options,
        if (schedule != null) 'Schedule': schedule,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateTaskResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an agent. To specify which agent to delete, use the Amazon
  /// Resource Name (ARN) of the agent in your request. The operation
  /// disassociates the agent from your AWS account. However, it doesn't delete
  /// the agent virtual machine (VM) from your on-premises environment.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArn] :
  /// The Amazon Resource Name (ARN) of the agent to delete. Use the
  /// <code>ListAgents</code> operation to return a list of agents for your
  /// account and AWS Region.
  Future<void> deleteAgent({
    required String agentArn,
  }) async {
    ArgumentError.checkNotNull(agentArn, 'agentArn');
    _s.validateStringLength(
      'agentArn',
      agentArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DeleteAgent'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgentArn': agentArn,
      },
    );
  }

  /// Deletes the configuration of a location used by AWS DataSync.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the location to delete.
  Future<void> deleteLocation({
    required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DeleteLocation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
      },
    );
  }

  /// Deletes a task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskArn] :
  /// The Amazon Resource Name (ARN) of the task to delete.
  Future<void> deleteTask({
    required String taskArn,
  }) async {
    ArgumentError.checkNotNull(taskArn, 'taskArn');
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DeleteTask'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskArn': taskArn,
      },
    );
  }

  /// Returns metadata such as the name, the network interfaces, and the status
  /// (that is, whether the agent is running or not) for an agent. To specify
  /// which agent to describe, use the Amazon Resource Name (ARN) of the agent
  /// in your request.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArn] :
  /// The Amazon Resource Name (ARN) of the agent to describe.
  Future<DescribeAgentResponse> describeAgent({
    required String agentArn,
  }) async {
    ArgumentError.checkNotNull(agentArn, 'agentArn');
    _s.validateStringLength(
      'agentArn',
      agentArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeAgent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgentArn': agentArn,
      },
    );

    return DescribeAgentResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata, such as the path information about an Amazon EFS
  /// location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the EFS location to describe.
  Future<DescribeLocationEfsResponse> describeLocationEfs({
    required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationEfs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
      },
    );

    return DescribeLocationEfsResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata, such as the path information about an Amazon FSx for
  /// Windows File Server location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the FSx for Windows File Server location
  /// to describe.
  Future<DescribeLocationFsxWindowsResponse> describeLocationFsxWindows({
    required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationFsxWindows'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
      },
    );

    return DescribeLocationFsxWindowsResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata, such as the path information, about an NFS location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the NFS location to describe.
  Future<DescribeLocationNfsResponse> describeLocationNfs({
    required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationNfs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
      },
    );

    return DescribeLocationNfsResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata about a self-managed object storage server location. For
  /// more information about self-managed object storage locations, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html">Creating
  /// a location for object storage</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the self-managed object storage server
  /// location that was described.
  Future<DescribeLocationObjectStorageResponse> describeLocationObjectStorage({
    required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationObjectStorage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
      },
    );

    return DescribeLocationObjectStorageResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata, such as bucket name, about an Amazon S3 bucket location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket location to
  /// describe.
  Future<DescribeLocationS3Response> describeLocationS3({
    required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationS3'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
      },
    );

    return DescribeLocationS3Response.fromJson(jsonResponse.body);
  }

  /// Returns metadata, such as the path and user information about an SMB
  /// location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the SMB location to describe.
  Future<DescribeLocationSmbResponse> describeLocationSmb({
    required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationSmb'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
      },
    );

    return DescribeLocationSmbResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata about a task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskArn] :
  /// The Amazon Resource Name (ARN) of the task to describe.
  Future<DescribeTaskResponse> describeTask({
    required String taskArn,
  }) async {
    ArgumentError.checkNotNull(taskArn, 'taskArn');
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskArn': taskArn,
      },
    );

    return DescribeTaskResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed metadata about a task that is being executed.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskExecutionArn] :
  /// The Amazon Resource Name (ARN) of the task that is being executed.
  Future<DescribeTaskExecutionResponse> describeTaskExecution({
    required String taskExecutionArn,
  }) async {
    ArgumentError.checkNotNull(taskExecutionArn, 'taskExecutionArn');
    _s.validateStringLength(
      'taskExecutionArn',
      taskExecutionArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeTaskExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskExecutionArn': taskExecutionArn,
      },
    );

    return DescribeTaskExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of agents owned by an AWS account in the AWS Region
  /// specified in the request. The returned list is ordered by agent Amazon
  /// Resource Name (ARN).
  ///
  /// By default, this operation returns a maximum of 100 agents. This operation
  /// supports pagination that enables you to optionally reduce the number of
  /// agents returned in a response.
  ///
  /// If you have more agents than are returned in a response (that is, the
  /// response returns only a truncated list of your agents), the response
  /// contains a marker that you can specify in your next request to fetch the
  /// next page of agents.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of agents to list.
  ///
  /// Parameter [nextToken] :
  /// An opaque string that indicates the position at which to begin the next
  /// list of agents.
  Future<ListAgentsResponse> listAgents({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.ListAgents'
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
      },
    );

    return ListAgentsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of source and destination locations.
  ///
  /// If you have more locations than are returned in a response (that is, the
  /// response returns only a truncated list of your agents), the response
  /// contains a token that you can specify in your next request to fetch the
  /// next page of locations.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [filters] :
  /// You can use API filters to narrow down the list of resources returned by
  /// <code>ListLocations</code>. For example, to retrieve all tasks on a
  /// specific source location, you can use <code>ListLocations</code> with
  /// filter name <code>LocationType S3</code> and <code>Operator Equals</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of locations to return.
  ///
  /// Parameter [nextToken] :
  /// An opaque string that indicates the position at which to begin the next
  /// list of locations.
  Future<ListLocationsResponse> listLocations({
    List<LocationFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.ListLocations'
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
      },
    );

    return ListLocationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns all the tags associated with a specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of locations to return.
  ///
  /// Parameter [nextToken] :
  /// An opaque string that indicates the position at which to begin the next
  /// list of locations.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of executed tasks.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of executed tasks to list.
  ///
  /// Parameter [nextToken] :
  /// An opaque string that indicates the position at which to begin the next
  /// list of the executed tasks.
  ///
  /// Parameter [taskArn] :
  /// The Amazon Resource Name (ARN) of the task whose tasks you want to list.
  Future<ListTaskExecutionsResponse> listTaskExecutions({
    int? maxResults,
    String? nextToken,
    String? taskArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      65535,
    );
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.ListTaskExecutions'
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
        if (taskArn != null) 'TaskArn': taskArn,
      },
    );

    return ListTaskExecutionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all the tasks.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [filters] :
  /// You can use API filters to narrow down the list of resources returned by
  /// <code>ListTasks</code>. For example, to retrieve all tasks on a specific
  /// source location, you can use <code>ListTasks</code> with filter name
  /// <code>LocationId</code> and <code>Operator Equals</code> with the ARN for
  /// the location.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tasks to return.
  ///
  /// Parameter [nextToken] :
  /// An opaque string that indicates the position at which to begin the next
  /// list of tasks.
  Future<ListTasksResponse> listTasks({
    List<TaskFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.ListTasks'
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
      },
    );

    return ListTasksResponse.fromJson(jsonResponse.body);
  }

  /// Starts a specific invocation of a task. A <code>TaskExecution</code> value
  /// represents an individual run of a task. Each task can have at most one
  /// <code>TaskExecution</code> at a time.
  ///
  /// <code>TaskExecution</code> has the following transition phases:
  /// INITIALIZING | PREPARING | TRANSFERRING | VERIFYING | SUCCESS/FAILURE.
  ///
  /// For detailed information, see the Task Execution section in the Components
  /// and Terminology topic in the <i>AWS DataSync User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskArn] :
  /// The Amazon Resource Name (ARN) of the task to start.
  ///
  /// Parameter [includes] :
  /// A list of filter rules that determines which files to include when running
  /// a task. The pattern should contain a single filter string that consists of
  /// the patterns to include. The patterns are delimited by "|" (that is, a
  /// pipe). For example: <code>"/folder1|/folder2"</code>
  ///
  ///
  Future<StartTaskExecutionResponse> startTaskExecution({
    required String taskArn,
    List<FilterRule>? includes,
    Options? overrideOptions,
  }) async {
    ArgumentError.checkNotNull(taskArn, 'taskArn');
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.StartTaskExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskArn': taskArn,
        if (includes != null) 'Includes': includes,
        if (overrideOptions != null) 'OverrideOptions': overrideOptions,
      },
    );

    return StartTaskExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Applies a key-value pair to an AWS resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to apply the tag to.
  ///
  /// Parameter [tags] :
  /// The tags to apply.
  Future<void> tagResource({
    required String resourceArn,
    required List<TagListEntry> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.TagResource'
    };
    await _protocol.send(
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
  }

  /// Removes a tag from an AWS resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [keys] :
  /// The keys in the key-value pair in the tag to remove.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove the tag from.
  Future<void> untagResource({
    required List<String> keys,
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(keys, 'keys');
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Keys': keys,
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Updates the name of an agent.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArn] :
  /// The Amazon Resource Name (ARN) of the agent to update.
  ///
  /// Parameter [name] :
  /// The name that you want to use to configure the agent.
  Future<void> updateAgent({
    required String agentArn,
    String? name,
  }) async {
    ArgumentError.checkNotNull(agentArn, 'agentArn');
    _s.validateStringLength(
      'agentArn',
      agentArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateAgent'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgentArn': agentArn,
        if (name != null) 'Name': name,
      },
    );
  }

  /// Updates some of the parameters of a previously created location for
  /// Network File System (NFS) access. For information about creating an NFS
  /// location, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html">Creating
  /// a location for NFS</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the NFS location to update.
  ///
  /// Parameter [subdirectory] :
  /// The subdirectory in the NFS file system that is used to read data from the
  /// NFS source location or write data to the NFS destination. The NFS path
  /// should be a path that's exported by the NFS server, or a subdirectory of
  /// that path. The path should be such that it can be mounted by other NFS
  /// clients in your network.
  ///
  /// To see all the paths exported by your NFS server, run "<code>showmount -e
  /// nfs-server-name</code>" from an NFS client that has access to your server.
  /// You can specify any directory that appears in the results, and any
  /// subdirectory of that directory. Ensure that the NFS export is accessible
  /// without Kerberos authentication.
  ///
  /// To transfer all the data in the folder that you specified, DataSync must
  /// have permissions to read all the data. To ensure this, either configure
  /// the NFS export with <code>no_root_squash</code>, or ensure that the files
  /// you want DataSync to access have permissions that allow read access for
  /// all users. Doing either option enables the agent to read the files. For
  /// the agent to access directories, you must additionally enable all execute
  /// access.
  ///
  /// If you are copying data to or from your AWS Snowcone device, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#nfs-on-snowcone">NFS
  /// Server on AWS Snowcone</a> for more information.
  ///
  /// For information about NFS export configuration, see 18.7. The /etc/exports
  /// Configuration File in the Red Hat Enterprise Linux documentation.
  Future<void> updateLocationNfs({
    required String locationArn,
    NfsMountOptions? mountOptions,
    OnPremConfig? onPremConfig,
    String? subdirectory,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationNfs'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (mountOptions != null) 'MountOptions': mountOptions,
        if (onPremConfig != null) 'OnPremConfig': onPremConfig,
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Updates some of the parameters of a previously created location for
  /// self-managed object storage server access. For information about creating
  /// a self-managed object storage location, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html">Creating
  /// a location for object storage</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the self-managed object storage server
  /// location to be updated.
  ///
  /// Parameter [accessKey] :
  /// Optional. The access key is used if credentials are required to access the
  /// self-managed object storage server. If your object storage requires a user
  /// name and password to authenticate, use <code>AccessKey</code> and
  /// <code>SecretKey</code> to provide the user name and password,
  /// respectively.
  ///
  /// Parameter [agentArns] :
  /// The Amazon Resource Name (ARN) of the agents associated with the
  /// self-managed object storage server location.
  ///
  /// Parameter [secretKey] :
  /// Optional. The secret key is used if credentials are required to access the
  /// self-managed object storage server. If your object storage requires a user
  /// name and password to authenticate, use <code>AccessKey</code> and
  /// <code>SecretKey</code> to provide the user name and password,
  /// respectively.
  ///
  /// Parameter [serverPort] :
  /// The port that your self-managed object storage server accepts inbound
  /// network traffic on. The server port is set by default to TCP 80 (HTTP) or
  /// TCP 443 (HTTPS). You can specify a custom port if your self-managed object
  /// storage server requires one.
  ///
  /// Parameter [serverProtocol] :
  /// The protocol that the object storage server uses to communicate. Valid
  /// values are <code>HTTP</code> or <code>HTTPS</code>.
  ///
  /// Parameter [subdirectory] :
  /// The subdirectory in the self-managed object storage server that is used to
  /// read data from.
  Future<void> updateLocationObjectStorage({
    required String locationArn,
    String? accessKey,
    List<String>? agentArns,
    String? secretKey,
    int? serverPort,
    ObjectStorageServerProtocol? serverProtocol,
    String? subdirectory,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'accessKey',
      accessKey,
      8,
      200,
    );
    _s.validateStringLength(
      'secretKey',
      secretKey,
      8,
      200,
    );
    _s.validateNumRange(
      'serverPort',
      serverPort,
      1,
      65536,
    );
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationObjectStorage'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (accessKey != null) 'AccessKey': accessKey,
        if (agentArns != null) 'AgentArns': agentArns,
        if (secretKey != null) 'SecretKey': secretKey,
        if (serverPort != null) 'ServerPort': serverPort,
        if (serverProtocol != null) 'ServerProtocol': serverProtocol.toValue(),
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Updates some of the parameters of a previously created location for Server
  /// Message Block (SMB) file system access. For information about creating an
  /// SMB location, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html">Creating
  /// a location for SMB</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the SMB location to update.
  ///
  /// Parameter [agentArns] :
  /// The Amazon Resource Names (ARNs) of agents to use for a Simple Message
  /// Block (SMB) location.
  ///
  /// Parameter [domain] :
  /// The name of the Windows domain that the SMB server belongs to.
  ///
  /// Parameter [password] :
  /// The password of the user who can mount the share has the permissions to
  /// access files and folders in the SMB share.
  ///
  /// Parameter [subdirectory] :
  /// The subdirectory in the SMB file system that is used to read data from the
  /// SMB source location or write data to the SMB destination. The SMB path
  /// should be a path that's exported by the SMB server, or a subdirectory of
  /// that path. The path should be such that it can be mounted by other SMB
  /// clients in your network.
  /// <note>
  /// <code>Subdirectory</code> must be specified with forward slashes. For
  /// example, <code>/path/to/folder</code>.
  /// </note>
  /// To transfer all the data in the folder that you specified, DataSync must
  /// have permissions to mount the SMB share and to access all the data in that
  /// share. To ensure this, do either of the following:
  ///
  /// <ul>
  /// <li>
  /// Ensure that the user/password specified belongs to the user who can mount
  /// the share and who has the appropriate permissions for all of the files and
  /// directories that you want DataSync to access.
  /// </li>
  /// <li>
  /// Use credentials of a member of the Backup Operators group to mount the
  /// share.
  /// </li>
  /// </ul>
  /// Doing either of these options enables the agent to access the data. For
  /// the agent to access directories, you must also enable all execute access.
  ///
  /// Parameter [user] :
  /// The user who can mount the share has the permissions to access files and
  /// folders in the SMB share.
  Future<void> updateLocationSmb({
    required String locationArn,
    List<String>? agentArns,
    String? domain,
    SmbMountOptions? mountOptions,
    String? password,
    String? subdirectory,
    String? user,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'domain',
      domain,
      0,
      253,
    );
    _s.validateStringLength(
      'password',
      password,
      0,
      104,
    );
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    _s.validateStringLength(
      'user',
      user,
      0,
      104,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationSmb'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (agentArns != null) 'AgentArns': agentArns,
        if (domain != null) 'Domain': domain,
        if (mountOptions != null) 'MountOptions': mountOptions,
        if (password != null) 'Password': password,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (user != null) 'User': user,
      },
    );
  }

  /// Updates the metadata associated with a task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskArn] :
  /// The Amazon Resource Name (ARN) of the resource name of the task to update.
  ///
  /// Parameter [cloudWatchLogGroupArn] :
  /// The Amazon Resource Name (ARN) of the resource name of the CloudWatch
  /// LogGroup.
  ///
  /// Parameter [excludes] :
  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the
  /// patterns to exclude. The patterns are delimited by "|" (that is, a pipe),
  /// for example: <code>"/folder1|/folder2"</code>
  ///
  ///
  ///
  /// Parameter [name] :
  /// The name of the task to update.
  ///
  /// Parameter [schedule] :
  /// Specifies a schedule used to periodically transfer files from a source to
  /// a destination location. You can configure your task to execute hourly,
  /// daily, weekly or on specific days of the week. You control when in the day
  /// or hour you want the task to execute. The time you specify is UTC time.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">Scheduling
  /// your task</a>.
  Future<void> updateTask({
    required String taskArn,
    String? cloudWatchLogGroupArn,
    List<FilterRule>? excludes,
    String? name,
    Options? options,
    TaskSchedule? schedule,
  }) async {
    ArgumentError.checkNotNull(taskArn, 'taskArn');
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'cloudWatchLogGroupArn',
      cloudWatchLogGroupArn,
      0,
      562,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateTask'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskArn': taskArn,
        if (cloudWatchLogGroupArn != null)
          'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
        if (excludes != null) 'Excludes': excludes,
        if (name != null) 'Name': name,
        if (options != null) 'Options': options,
        if (schedule != null) 'Schedule': schedule,
      },
    );
  }

  /// Updates execution of a task.
  ///
  /// You can modify bandwidth throttling for a task execution that is running
  /// or queued. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/working-with-task-executions.html#adjust-bandwidth-throttling">Adjusting
  /// Bandwidth Throttling for a Task Execution</a>.
  /// <note>
  /// The only <code>Option</code> that can be modified by
  /// <code>UpdateTaskExecution</code> is <code> <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-BytesPerSecond">BytesPerSecond</a>
  /// </code>.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskExecutionArn] :
  /// The Amazon Resource Name (ARN) of the specific task execution that is
  /// being updated.
  Future<void> updateTaskExecution({
    required Options options,
    required String taskExecutionArn,
  }) async {
    ArgumentError.checkNotNull(options, 'options');
    ArgumentError.checkNotNull(taskExecutionArn, 'taskExecutionArn');
    _s.validateStringLength(
      'taskExecutionArn',
      taskExecutionArn,
      0,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateTaskExecution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Options': options,
        'TaskExecutionArn': taskExecutionArn,
      },
    );
  }
}

/// Represents a single entry in a list of agents. <code>AgentListEntry</code>
/// returns an array that contains a list of agents when the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListAgents.html">ListAgents</a>
/// operation is called.
class AgentListEntry {
  /// The Amazon Resource Name (ARN) of the agent.
  final String? agentArn;

  /// The name of the agent.
  final String? name;

  /// The status of the agent.
  final AgentStatus? status;

  AgentListEntry({
    this.agentArn,
    this.name,
    this.status,
  });

  factory AgentListEntry.fromJson(Map<String, dynamic> json) {
    return AgentListEntry(
      agentArn: json['AgentArn'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toAgentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentArn = this.agentArn;
    final name = this.name;
    final status = this.status;
    return {
      if (agentArn != null) 'AgentArn': agentArn,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum AgentStatus {
  online,
  offline,
}

extension on AgentStatus {
  String toValue() {
    switch (this) {
      case AgentStatus.online:
        return 'ONLINE';
      case AgentStatus.offline:
        return 'OFFLINE';
    }
  }
}

extension on String {
  AgentStatus toAgentStatus() {
    switch (this) {
      case 'ONLINE':
        return AgentStatus.online;
      case 'OFFLINE':
        return AgentStatus.offline;
    }
    throw Exception('$this is not known in enum AgentStatus');
  }
}

enum Atime {
  none,
  bestEffort,
}

extension on Atime {
  String toValue() {
    switch (this) {
      case Atime.none:
        return 'NONE';
      case Atime.bestEffort:
        return 'BEST_EFFORT';
    }
  }
}

extension on String {
  Atime toAtime() {
    switch (this) {
      case 'NONE':
        return Atime.none;
      case 'BEST_EFFORT':
        return Atime.bestEffort;
    }
    throw Exception('$this is not known in enum Atime');
  }
}

class CancelTaskExecutionResponse {
  CancelTaskExecutionResponse();

  factory CancelTaskExecutionResponse.fromJson(Map<String, dynamic> _) {
    return CancelTaskExecutionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// CreateAgentResponse
class CreateAgentResponse {
  /// The Amazon Resource Name (ARN) of the agent. Use the <code>ListAgents</code>
  /// operation to return a list of agents for your account and AWS Region.
  final String? agentArn;

  CreateAgentResponse({
    this.agentArn,
  });

  factory CreateAgentResponse.fromJson(Map<String, dynamic> json) {
    return CreateAgentResponse(
      agentArn: json['AgentArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentArn = this.agentArn;
    return {
      if (agentArn != null) 'AgentArn': agentArn,
    };
  }
}

/// CreateLocationEfs
class CreateLocationEfsResponse {
  /// The Amazon Resource Name (ARN) of the Amazon EFS file system location that
  /// is created.
  final String? locationArn;

  CreateLocationEfsResponse({
    this.locationArn,
  });

  factory CreateLocationEfsResponse.fromJson(Map<String, dynamic> json) {
    return CreateLocationEfsResponse(
      locationArn: json['LocationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final locationArn = this.locationArn;
    return {
      if (locationArn != null) 'LocationArn': locationArn,
    };
  }
}

class CreateLocationFsxWindowsResponse {
  /// The Amazon Resource Name (ARN) of the FSx for Windows File Server file
  /// system location that is created.
  final String? locationArn;

  CreateLocationFsxWindowsResponse({
    this.locationArn,
  });

  factory CreateLocationFsxWindowsResponse.fromJson(Map<String, dynamic> json) {
    return CreateLocationFsxWindowsResponse(
      locationArn: json['LocationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final locationArn = this.locationArn;
    return {
      if (locationArn != null) 'LocationArn': locationArn,
    };
  }
}

/// CreateLocationNfsResponse
class CreateLocationNfsResponse {
  /// The Amazon Resource Name (ARN) of the source NFS file system location that
  /// is created.
  final String? locationArn;

  CreateLocationNfsResponse({
    this.locationArn,
  });

  factory CreateLocationNfsResponse.fromJson(Map<String, dynamic> json) {
    return CreateLocationNfsResponse(
      locationArn: json['LocationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final locationArn = this.locationArn;
    return {
      if (locationArn != null) 'LocationArn': locationArn,
    };
  }
}

/// CreateLocationObjectStorageResponse
class CreateLocationObjectStorageResponse {
  /// The Amazon Resource Name (ARN) of the agents associated with the
  /// self-managed object storage server location.
  final String? locationArn;

  CreateLocationObjectStorageResponse({
    this.locationArn,
  });

  factory CreateLocationObjectStorageResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLocationObjectStorageResponse(
      locationArn: json['LocationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final locationArn = this.locationArn;
    return {
      if (locationArn != null) 'LocationArn': locationArn,
    };
  }
}

/// CreateLocationS3Response
class CreateLocationS3Response {
  /// The Amazon Resource Name (ARN) of the source Amazon S3 bucket location that
  /// is created.
  final String? locationArn;

  CreateLocationS3Response({
    this.locationArn,
  });

  factory CreateLocationS3Response.fromJson(Map<String, dynamic> json) {
    return CreateLocationS3Response(
      locationArn: json['LocationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final locationArn = this.locationArn;
    return {
      if (locationArn != null) 'LocationArn': locationArn,
    };
  }
}

/// CreateLocationSmbResponse
class CreateLocationSmbResponse {
  /// The Amazon Resource Name (ARN) of the source SMB file system location that
  /// is created.
  final String? locationArn;

  CreateLocationSmbResponse({
    this.locationArn,
  });

  factory CreateLocationSmbResponse.fromJson(Map<String, dynamic> json) {
    return CreateLocationSmbResponse(
      locationArn: json['LocationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final locationArn = this.locationArn;
    return {
      if (locationArn != null) 'LocationArn': locationArn,
    };
  }
}

/// CreateTaskResponse
class CreateTaskResponse {
  /// The Amazon Resource Name (ARN) of the task.
  final String? taskArn;

  CreateTaskResponse({
    this.taskArn,
  });

  factory CreateTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateTaskResponse(
      taskArn: json['TaskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskArn = this.taskArn;
    return {
      if (taskArn != null) 'TaskArn': taskArn,
    };
  }
}

class DeleteAgentResponse {
  DeleteAgentResponse();

  factory DeleteAgentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAgentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLocationResponse {
  DeleteLocationResponse();

  factory DeleteLocationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLocationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTaskResponse {
  DeleteTaskResponse();

  factory DeleteTaskResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// DescribeAgentResponse
class DescribeAgentResponse {
  /// The Amazon Resource Name (ARN) of the agent.
  final String? agentArn;

  /// The time that the agent was activated (that is, created in your account).
  final DateTime? creationTime;

  /// The type of endpoint that your agent is connected to. If the endpoint is a
  /// VPC endpoint, the agent is not accessible over the public internet.
  final EndpointType? endpointType;

  /// The time that the agent last connected to DataSync.
  final DateTime? lastConnectionTime;

  /// The name of the agent.
  final String? name;

  /// The subnet and the security group that DataSync used to access a VPC
  /// endpoint.
  final PrivateLinkConfig? privateLinkConfig;

  /// The status of the agent. If the status is ONLINE, then the agent is
  /// configured properly and is available to use. The Running status is the
  /// normal running status for an agent. If the status is OFFLINE, the agent's VM
  /// is turned off or the agent is in an unhealthy state. When the issue that
  /// caused the unhealthy state is resolved, the agent returns to ONLINE status.
  final AgentStatus? status;

  DescribeAgentResponse({
    this.agentArn,
    this.creationTime,
    this.endpointType,
    this.lastConnectionTime,
    this.name,
    this.privateLinkConfig,
    this.status,
  });

  factory DescribeAgentResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAgentResponse(
      agentArn: json['AgentArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      endpointType: (json['EndpointType'] as String?)?.toEndpointType(),
      lastConnectionTime: timeStampFromJson(json['LastConnectionTime']),
      name: json['Name'] as String?,
      privateLinkConfig: json['PrivateLinkConfig'] != null
          ? PrivateLinkConfig.fromJson(
              json['PrivateLinkConfig'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toAgentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentArn = this.agentArn;
    final creationTime = this.creationTime;
    final endpointType = this.endpointType;
    final lastConnectionTime = this.lastConnectionTime;
    final name = this.name;
    final privateLinkConfig = this.privateLinkConfig;
    final status = this.status;
    return {
      if (agentArn != null) 'AgentArn': agentArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (lastConnectionTime != null)
        'LastConnectionTime': unixTimestampToJson(lastConnectionTime),
      if (name != null) 'Name': name,
      if (privateLinkConfig != null) 'PrivateLinkConfig': privateLinkConfig,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// DescribeLocationEfsResponse
class DescribeLocationEfsResponse {
  /// The time that the EFS location was created.
  final DateTime? creationTime;
  final Ec2Config? ec2Config;

  /// The Amazon Resource Name (ARN) of the EFS location that was described.
  final String? locationArn;

  /// The URL of the EFS location that was described.
  final String? locationUri;

  DescribeLocationEfsResponse({
    this.creationTime,
    this.ec2Config,
    this.locationArn,
    this.locationUri,
  });

  factory DescribeLocationEfsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLocationEfsResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      ec2Config: json['Ec2Config'] != null
          ? Ec2Config.fromJson(json['Ec2Config'] as Map<String, dynamic>)
          : null,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final ec2Config = this.ec2Config;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (ec2Config != null) 'Ec2Config': ec2Config,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
    };
  }
}

class DescribeLocationFsxWindowsResponse {
  /// The time that the FSx for Windows File Server location was created.
  final DateTime? creationTime;

  /// The name of the Windows domain that the FSx for Windows File Server belongs
  /// to.
  final String? domain;

  /// The Amazon Resource Name (ARN) of the FSx for Windows File Server location
  /// that was described.
  final String? locationArn;

  /// The URL of the FSx for Windows File Server location that was described.
  final String? locationUri;

  /// The Amazon Resource Names (ARNs) of the security groups that are configured
  /// for the FSx for Windows File Server file system.
  final List<String>? securityGroupArns;

  /// The user who has the permissions to access files and folders in the FSx for
  /// Windows File Server file system.
  final String? user;

  DescribeLocationFsxWindowsResponse({
    this.creationTime,
    this.domain,
    this.locationArn,
    this.locationUri,
    this.securityGroupArns,
    this.user,
  });

  factory DescribeLocationFsxWindowsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLocationFsxWindowsResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      domain: json['Domain'] as String?,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      securityGroupArns: (json['SecurityGroupArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      user: json['User'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final domain = this.domain;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final securityGroupArns = this.securityGroupArns;
    final user = this.user;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (domain != null) 'Domain': domain,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (securityGroupArns != null) 'SecurityGroupArns': securityGroupArns,
      if (user != null) 'User': user,
    };
  }
}

/// DescribeLocationNfsResponse
class DescribeLocationNfsResponse {
  /// The time that the NFS location was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the NFS location that was described.
  final String? locationArn;

  /// The URL of the source NFS location that was described.
  final String? locationUri;

  /// The NFS mount options that DataSync used to mount your NFS share.
  final NfsMountOptions? mountOptions;
  final OnPremConfig? onPremConfig;

  DescribeLocationNfsResponse({
    this.creationTime,
    this.locationArn,
    this.locationUri,
    this.mountOptions,
    this.onPremConfig,
  });

  factory DescribeLocationNfsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLocationNfsResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      mountOptions: json['MountOptions'] != null
          ? NfsMountOptions.fromJson(
              json['MountOptions'] as Map<String, dynamic>)
          : null,
      onPremConfig: json['OnPremConfig'] != null
          ? OnPremConfig.fromJson(json['OnPremConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final mountOptions = this.mountOptions;
    final onPremConfig = this.onPremConfig;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (mountOptions != null) 'MountOptions': mountOptions,
      if (onPremConfig != null) 'OnPremConfig': onPremConfig,
    };
  }
}

/// DescribeLocationObjectStorageResponse
class DescribeLocationObjectStorageResponse {
  /// Optional. The access key is used if credentials are required to access the
  /// self-managed object storage server. If your object storage requires a user
  /// name and password to authenticate, use <code>AccessKey</code> and
  /// <code>SecretKey</code> to provide the user name and password, respectively.
  final String? accessKey;

  /// The Amazon Resource Name (ARN) of the agents associated with the
  /// self-managed object storage server location.
  final List<String>? agentArns;

  /// The time that the self-managed object storage server agent was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the self-managed object storage server
  /// location to describe.
  final String? locationArn;

  /// The URL of the source self-managed object storage server location that was
  /// described.
  final String? locationUri;

  /// The port that your self-managed object storage server accepts inbound
  /// network traffic on. The server port is set by default to TCP 80 (HTTP) or
  /// TCP 443 (HTTPS).
  final int? serverPort;

  /// The protocol that the object storage server uses to communicate. Valid
  /// values are HTTP or HTTPS.
  final ObjectStorageServerProtocol? serverProtocol;

  DescribeLocationObjectStorageResponse({
    this.accessKey,
    this.agentArns,
    this.creationTime,
    this.locationArn,
    this.locationUri,
    this.serverPort,
    this.serverProtocol,
  });

  factory DescribeLocationObjectStorageResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLocationObjectStorageResponse(
      accessKey: json['AccessKey'] as String?,
      agentArns: (json['AgentArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      creationTime: timeStampFromJson(json['CreationTime']),
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      serverPort: json['ServerPort'] as int?,
      serverProtocol:
          (json['ServerProtocol'] as String?)?.toObjectStorageServerProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKey = this.accessKey;
    final agentArns = this.agentArns;
    final creationTime = this.creationTime;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final serverPort = this.serverPort;
    final serverProtocol = this.serverProtocol;
    return {
      if (accessKey != null) 'AccessKey': accessKey,
      if (agentArns != null) 'AgentArns': agentArns,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (serverPort != null) 'ServerPort': serverPort,
      if (serverProtocol != null) 'ServerProtocol': serverProtocol.toValue(),
    };
  }
}

/// DescribeLocationS3Response
class DescribeLocationS3Response {
  /// If you are using DataSync on an AWS Outpost, the Amazon Resource Name (ARNs)
  /// of the EC2 agents deployed on your Outpost. For more information about
  /// launching a DataSync agent on an AWS Outpost, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/deploy-agents.html#outposts-agent">Deploy
  /// your DataSync agent on AWS Outposts</a>.
  final List<String>? agentArns;

  /// The time that the Amazon S3 bucket location was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket or access point.
  final String? locationArn;

  /// The URL of the Amazon S3 location that was described.
  final String? locationUri;
  final S3Config? s3Config;

  /// The Amazon S3 storage class that you chose to store your files in when this
  /// location is used as a task destination. For more information about S3
  /// storage classes, see <a
  /// href="http://aws.amazon.com/s3/storage-classes/">Amazon S3 Storage
  /// Classes</a>. Some storage classes have behaviors that can affect your S3
  /// storage cost. For detailed information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Considerations
  /// when working with S3 storage classes in DataSync</a>.
  final S3StorageClass? s3StorageClass;

  DescribeLocationS3Response({
    this.agentArns,
    this.creationTime,
    this.locationArn,
    this.locationUri,
    this.s3Config,
    this.s3StorageClass,
  });

  factory DescribeLocationS3Response.fromJson(Map<String, dynamic> json) {
    return DescribeLocationS3Response(
      agentArns: (json['AgentArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      creationTime: timeStampFromJson(json['CreationTime']),
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      s3Config: json['S3Config'] != null
          ? S3Config.fromJson(json['S3Config'] as Map<String, dynamic>)
          : null,
      s3StorageClass: (json['S3StorageClass'] as String?)?.toS3StorageClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentArns = this.agentArns;
    final creationTime = this.creationTime;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final s3Config = this.s3Config;
    final s3StorageClass = this.s3StorageClass;
    return {
      if (agentArns != null) 'AgentArns': agentArns,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (s3Config != null) 'S3Config': s3Config,
      if (s3StorageClass != null) 'S3StorageClass': s3StorageClass.toValue(),
    };
  }
}

/// DescribeLocationSmbResponse
class DescribeLocationSmbResponse {
  /// The Amazon Resource Name (ARN) of the source SMB file system location that
  /// is created.
  final List<String>? agentArns;

  /// The time that the SMB location was created.
  final DateTime? creationTime;

  /// The name of the Windows domain that the SMB server belongs to.
  final String? domain;

  /// The Amazon Resource Name (ARN) of the SMB location that was described.
  final String? locationArn;

  /// The URL of the source SMB location that was described.
  final String? locationUri;

  /// The mount options that are available for DataSync to use to access an SMB
  /// location.
  final SmbMountOptions? mountOptions;

  /// The user who can mount the share, has the permissions to access files and
  /// folders in the SMB share.
  final String? user;

  DescribeLocationSmbResponse({
    this.agentArns,
    this.creationTime,
    this.domain,
    this.locationArn,
    this.locationUri,
    this.mountOptions,
    this.user,
  });

  factory DescribeLocationSmbResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLocationSmbResponse(
      agentArns: (json['AgentArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      creationTime: timeStampFromJson(json['CreationTime']),
      domain: json['Domain'] as String?,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      mountOptions: json['MountOptions'] != null
          ? SmbMountOptions.fromJson(
              json['MountOptions'] as Map<String, dynamic>)
          : null,
      user: json['User'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentArns = this.agentArns;
    final creationTime = this.creationTime;
    final domain = this.domain;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final mountOptions = this.mountOptions;
    final user = this.user;
    return {
      if (agentArns != null) 'AgentArns': agentArns,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (domain != null) 'Domain': domain,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (mountOptions != null) 'MountOptions': mountOptions,
      if (user != null) 'User': user,
    };
  }
}

/// DescribeTaskExecutionResponse
class DescribeTaskExecutionResponse {
  /// The physical number of bytes transferred over the network.
  final int? bytesTransferred;

  /// The number of logical bytes written to the destination AWS storage resource.
  final int? bytesWritten;

  /// The estimated physical number of bytes that is to be transferred over the
  /// network.
  final int? estimatedBytesToTransfer;

  /// The expected number of files that is to be transferred over the network.
  /// This value is calculated during the PREPARING phase, before the TRANSFERRING
  /// phase. This value is the expected number of files to be transferred. It's
  /// calculated based on comparing the content of the source and destination
  /// locations and finding the delta that needs to be transferred.
  final int? estimatedFilesToTransfer;

  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the patterns
  /// to exclude. The patterns are delimited by "|" (that is, a pipe), for
  /// example: <code>"/folder1|/folder2"</code>
  ///
  ///
  final List<FilterRule>? excludes;

  /// The actual number of files that was transferred over the network. This value
  /// is calculated and updated on an ongoing basis during the TRANSFERRING phase.
  /// It's updated periodically when each file is read from the source and sent
  /// over the network.
  ///
  /// If failures occur during a transfer, this value can be less than
  /// <code>EstimatedFilesToTransfer</code>. This value can also be greater than
  /// <code>EstimatedFilesTransferred</code> in some cases. This element is
  /// implementation-specific for some location types, so don't use it as an
  /// indicator for a correct file number or to monitor your task execution.
  final int? filesTransferred;

  /// A list of filter rules that determines which files to include when running a
  /// task. The list should contain a single filter string that consists of the
  /// patterns to include. The patterns are delimited by "|" (that is, a pipe),
  /// for example: <code>"/folder1|/folder2"</code>
  ///
  ///
  final List<FilterRule>? includes;
  final Options? options;

  /// The result of the task execution.
  final TaskExecutionResultDetail? result;

  /// The time that the task execution was started.
  final DateTime? startTime;

  /// The status of the task execution.
  ///
  /// For detailed information about task execution statuses, see Understanding
  /// Task Statuses in the <i>AWS DataSync User Guide.</i>
  final TaskExecutionStatus? status;

  /// The Amazon Resource Name (ARN) of the task execution that was described.
  /// <code>TaskExecutionArn</code> is hierarchical and includes
  /// <code>TaskArn</code> for the task that was executed.
  ///
  /// For example, a <code>TaskExecution</code> value with the ARN
  /// <code>arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2/execution/exec-08ef1e88ec491019b</code>
  /// executed the task with the ARN
  /// <code>arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2</code>.
  final String? taskExecutionArn;

  DescribeTaskExecutionResponse({
    this.bytesTransferred,
    this.bytesWritten,
    this.estimatedBytesToTransfer,
    this.estimatedFilesToTransfer,
    this.excludes,
    this.filesTransferred,
    this.includes,
    this.options,
    this.result,
    this.startTime,
    this.status,
    this.taskExecutionArn,
  });

  factory DescribeTaskExecutionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTaskExecutionResponse(
      bytesTransferred: json['BytesTransferred'] as int?,
      bytesWritten: json['BytesWritten'] as int?,
      estimatedBytesToTransfer: json['EstimatedBytesToTransfer'] as int?,
      estimatedFilesToTransfer: json['EstimatedFilesToTransfer'] as int?,
      excludes: (json['Excludes'] as List?)
          ?.whereNotNull()
          .map((e) => FilterRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      filesTransferred: json['FilesTransferred'] as int?,
      includes: (json['Includes'] as List?)
          ?.whereNotNull()
          .map((e) => FilterRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: json['Options'] != null
          ? Options.fromJson(json['Options'] as Map<String, dynamic>)
          : null,
      result: json['Result'] != null
          ? TaskExecutionResultDetail.fromJson(
              json['Result'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toTaskExecutionStatus(),
      taskExecutionArn: json['TaskExecutionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesTransferred = this.bytesTransferred;
    final bytesWritten = this.bytesWritten;
    final estimatedBytesToTransfer = this.estimatedBytesToTransfer;
    final estimatedFilesToTransfer = this.estimatedFilesToTransfer;
    final excludes = this.excludes;
    final filesTransferred = this.filesTransferred;
    final includes = this.includes;
    final options = this.options;
    final result = this.result;
    final startTime = this.startTime;
    final status = this.status;
    final taskExecutionArn = this.taskExecutionArn;
    return {
      if (bytesTransferred != null) 'BytesTransferred': bytesTransferred,
      if (bytesWritten != null) 'BytesWritten': bytesWritten,
      if (estimatedBytesToTransfer != null)
        'EstimatedBytesToTransfer': estimatedBytesToTransfer,
      if (estimatedFilesToTransfer != null)
        'EstimatedFilesToTransfer': estimatedFilesToTransfer,
      if (excludes != null) 'Excludes': excludes,
      if (filesTransferred != null) 'FilesTransferred': filesTransferred,
      if (includes != null) 'Includes': includes,
      if (options != null) 'Options': options,
      if (result != null) 'Result': result,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (taskExecutionArn != null) 'TaskExecutionArn': taskExecutionArn,
    };
  }
}

/// DescribeTaskResponse
class DescribeTaskResponse {
  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that was
  /// used to monitor and log events in the task.
  ///
  /// For more information on these groups, see Working with Log Groups and Log
  /// Streams in the <i>Amazon CloudWatch User Guide</i>.
  final String? cloudWatchLogGroupArn;

  /// The time that the task was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the task execution that is syncing files.
  final String? currentTaskExecutionArn;

  /// The Amazon Resource Name (ARN) of the AWS storage resource's location.
  final String? destinationLocationArn;

  /// The Amazon Resource Name (ARN) of the destination ENIs (Elastic Network
  /// Interface) that was created for your subnet.
  final List<String>? destinationNetworkInterfaceArns;

  /// Errors that AWS DataSync encountered during execution of the task. You can
  /// use this error code to help troubleshoot issues.
  final String? errorCode;

  /// Detailed description of an error that was encountered during the task
  /// execution. You can use this information to help troubleshoot issues.
  final String? errorDetail;

  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the patterns
  /// to exclude. The patterns are delimited by "|" (that is, a pipe), for
  /// example: <code>"/folder1|/folder2"</code>
  ///
  ///
  final List<FilterRule>? excludes;

  /// The name of the task that was described.
  final String? name;

  /// The set of configuration options that control the behavior of a single
  /// execution of the task that occurs when you call
  /// <code>StartTaskExecution</code>. You can configure these options to preserve
  /// metadata such as user ID (UID) and group (GID), file permissions, data
  /// integrity verification, and so on.
  ///
  /// For each individual task execution, you can override these options by
  /// specifying the overriding <code>OverrideOptions</code> value to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_StartTaskExecution.html">StartTaskExecution</a>
  /// operation.
  final Options? options;

  /// The schedule used to periodically transfer files from a source to a
  /// destination location.
  final TaskSchedule? schedule;

  /// The Amazon Resource Name (ARN) of the source file system's location.
  final String? sourceLocationArn;

  /// The Amazon Resource Name (ARN) of the source ENIs (Elastic Network
  /// Interface) that was created for your subnet.
  final List<String>? sourceNetworkInterfaceArns;

  /// The status of the task that was described.
  ///
  /// For detailed information about task execution statuses, see Understanding
  /// Task Statuses in the <i>AWS DataSync User Guide</i>.
  final TaskStatus? status;

  /// The Amazon Resource Name (ARN) of the task that was described.
  final String? taskArn;

  DescribeTaskResponse({
    this.cloudWatchLogGroupArn,
    this.creationTime,
    this.currentTaskExecutionArn,
    this.destinationLocationArn,
    this.destinationNetworkInterfaceArns,
    this.errorCode,
    this.errorDetail,
    this.excludes,
    this.name,
    this.options,
    this.schedule,
    this.sourceLocationArn,
    this.sourceNetworkInterfaceArns,
    this.status,
    this.taskArn,
  });

  factory DescribeTaskResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTaskResponse(
      cloudWatchLogGroupArn: json['CloudWatchLogGroupArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      currentTaskExecutionArn: json['CurrentTaskExecutionArn'] as String?,
      destinationLocationArn: json['DestinationLocationArn'] as String?,
      destinationNetworkInterfaceArns:
          (json['DestinationNetworkInterfaceArns'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      errorCode: json['ErrorCode'] as String?,
      errorDetail: json['ErrorDetail'] as String?,
      excludes: (json['Excludes'] as List?)
          ?.whereNotNull()
          .map((e) => FilterRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      options: json['Options'] != null
          ? Options.fromJson(json['Options'] as Map<String, dynamic>)
          : null,
      schedule: json['Schedule'] != null
          ? TaskSchedule.fromJson(json['Schedule'] as Map<String, dynamic>)
          : null,
      sourceLocationArn: json['SourceLocationArn'] as String?,
      sourceNetworkInterfaceArns: (json['SourceNetworkInterfaceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.toTaskStatus(),
      taskArn: json['TaskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogGroupArn = this.cloudWatchLogGroupArn;
    final creationTime = this.creationTime;
    final currentTaskExecutionArn = this.currentTaskExecutionArn;
    final destinationLocationArn = this.destinationLocationArn;
    final destinationNetworkInterfaceArns =
        this.destinationNetworkInterfaceArns;
    final errorCode = this.errorCode;
    final errorDetail = this.errorDetail;
    final excludes = this.excludes;
    final name = this.name;
    final options = this.options;
    final schedule = this.schedule;
    final sourceLocationArn = this.sourceLocationArn;
    final sourceNetworkInterfaceArns = this.sourceNetworkInterfaceArns;
    final status = this.status;
    final taskArn = this.taskArn;
    return {
      if (cloudWatchLogGroupArn != null)
        'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (currentTaskExecutionArn != null)
        'CurrentTaskExecutionArn': currentTaskExecutionArn,
      if (destinationLocationArn != null)
        'DestinationLocationArn': destinationLocationArn,
      if (destinationNetworkInterfaceArns != null)
        'DestinationNetworkInterfaceArns': destinationNetworkInterfaceArns,
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorDetail != null) 'ErrorDetail': errorDetail,
      if (excludes != null) 'Excludes': excludes,
      if (name != null) 'Name': name,
      if (options != null) 'Options': options,
      if (schedule != null) 'Schedule': schedule,
      if (sourceLocationArn != null) 'SourceLocationArn': sourceLocationArn,
      if (sourceNetworkInterfaceArns != null)
        'SourceNetworkInterfaceArns': sourceNetworkInterfaceArns,
      if (status != null) 'Status': status.toValue(),
      if (taskArn != null) 'TaskArn': taskArn,
    };
  }
}

/// The subnet and the security group that DataSync uses to access target EFS
/// file system. The subnet must have at least one mount target for that file
/// system. The security group that you provide needs to be able to communicate
/// with the security group on the mount target in the subnet specified.
class Ec2Config {
  /// The Amazon Resource Names (ARNs) of the security groups that are configured
  /// for the Amazon EC2 resource.
  final List<String> securityGroupArns;

  /// The ARN of the subnet and the security group that DataSync uses to access
  /// the target EFS file system.
  final String subnetArn;

  Ec2Config({
    required this.securityGroupArns,
    required this.subnetArn,
  });

  factory Ec2Config.fromJson(Map<String, dynamic> json) {
    return Ec2Config(
      securityGroupArns: (json['SecurityGroupArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetArn: json['SubnetArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupArns = this.securityGroupArns;
    final subnetArn = this.subnetArn;
    return {
      'SecurityGroupArns': securityGroupArns,
      'SubnetArn': subnetArn,
    };
  }
}

enum EndpointType {
  public,
  privateLink,
  fips,
}

extension on EndpointType {
  String toValue() {
    switch (this) {
      case EndpointType.public:
        return 'PUBLIC';
      case EndpointType.privateLink:
        return 'PRIVATE_LINK';
      case EndpointType.fips:
        return 'FIPS';
    }
  }
}

extension on String {
  EndpointType toEndpointType() {
    switch (this) {
      case 'PUBLIC':
        return EndpointType.public;
      case 'PRIVATE_LINK':
        return EndpointType.privateLink;
      case 'FIPS':
        return EndpointType.fips;
    }
    throw Exception('$this is not known in enum EndpointType');
  }
}

/// Specifies which files, folders, and objects to include or exclude when
/// transferring files from source to destination.
class FilterRule {
  /// The type of filter rule to apply. AWS DataSync only supports the
  /// SIMPLE_PATTERN rule type.
  final FilterType? filterType;

  /// A single filter string that consists of the patterns to include or exclude.
  /// The patterns are delimited by "|" (that is, a pipe), for example:
  /// <code>/folder1|/folder2</code>
  ///
  ///
  final String? value;

  FilterRule({
    this.filterType,
    this.value,
  });

  factory FilterRule.fromJson(Map<String, dynamic> json) {
    return FilterRule(
      filterType: (json['FilterType'] as String?)?.toFilterType(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filterType = this.filterType;
    final value = this.value;
    return {
      if (filterType != null) 'FilterType': filterType.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum FilterType {
  simplePattern,
}

extension on FilterType {
  String toValue() {
    switch (this) {
      case FilterType.simplePattern:
        return 'SIMPLE_PATTERN';
    }
  }
}

extension on String {
  FilterType toFilterType() {
    switch (this) {
      case 'SIMPLE_PATTERN':
        return FilterType.simplePattern;
    }
    throw Exception('$this is not known in enum FilterType');
  }
}

enum Gid {
  none,
  intValue,
  name,
  both,
}

extension on Gid {
  String toValue() {
    switch (this) {
      case Gid.none:
        return 'NONE';
      case Gid.intValue:
        return 'INT_VALUE';
      case Gid.name:
        return 'NAME';
      case Gid.both:
        return 'BOTH';
    }
  }
}

extension on String {
  Gid toGid() {
    switch (this) {
      case 'NONE':
        return Gid.none;
      case 'INT_VALUE':
        return Gid.intValue;
      case 'NAME':
        return Gid.name;
      case 'BOTH':
        return Gid.both;
    }
    throw Exception('$this is not known in enum Gid');
  }
}

/// ListAgentsResponse
class ListAgentsResponse {
  /// A list of agents in your account.
  final List<AgentListEntry>? agents;

  /// An opaque string that indicates the position at which to begin returning the
  /// next list of agents.
  final String? nextToken;

  ListAgentsResponse({
    this.agents,
    this.nextToken,
  });

  factory ListAgentsResponse.fromJson(Map<String, dynamic> json) {
    return ListAgentsResponse(
      agents: (json['Agents'] as List?)
          ?.whereNotNull()
          .map((e) => AgentListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agents = this.agents;
    final nextToken = this.nextToken;
    return {
      if (agents != null) 'Agents': agents,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// ListLocationsResponse
class ListLocationsResponse {
  /// An array that contains a list of locations.
  final List<LocationListEntry>? locations;

  /// An opaque string that indicates the position at which to begin returning the
  /// next list of locations.
  final String? nextToken;

  ListLocationsResponse({
    this.locations,
    this.nextToken,
  });

  factory ListLocationsResponse.fromJson(Map<String, dynamic> json) {
    return ListLocationsResponse(
      locations: (json['Locations'] as List?)
          ?.whereNotNull()
          .map((e) => LocationListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final locations = this.locations;
    final nextToken = this.nextToken;
    return {
      if (locations != null) 'Locations': locations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// ListTagsForResourceResponse
class ListTagsForResourceResponse {
  /// An opaque string that indicates the position at which to begin returning the
  /// next list of resource tags.
  final String? nextToken;

  /// Array of resource tags.
  final List<TagListEntry>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => TagListEntry.fromJson(e as Map<String, dynamic>))
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

/// ListTaskExecutionsResponse
class ListTaskExecutionsResponse {
  /// An opaque string that indicates the position at which to begin returning the
  /// next list of executed tasks.
  final String? nextToken;

  /// A list of executed tasks.
  final List<TaskExecutionListEntry>? taskExecutions;

  ListTaskExecutionsResponse({
    this.nextToken,
    this.taskExecutions,
  });

  factory ListTaskExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListTaskExecutionsResponse(
      nextToken: json['NextToken'] as String?,
      taskExecutions: (json['TaskExecutions'] as List?)
          ?.whereNotNull()
          .map(
              (e) => TaskExecutionListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskExecutions = this.taskExecutions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (taskExecutions != null) 'TaskExecutions': taskExecutions,
    };
  }
}

/// ListTasksResponse
class ListTasksResponse {
  /// An opaque string that indicates the position at which to begin returning the
  /// next list of tasks.
  final String? nextToken;

  /// A list of all the tasks that are returned.
  final List<TaskListEntry>? tasks;

  ListTasksResponse({
    this.nextToken,
    this.tasks,
  });

  factory ListTasksResponse.fromJson(Map<String, dynamic> json) {
    return ListTasksResponse(
      nextToken: json['NextToken'] as String?,
      tasks: (json['Tasks'] as List?)
          ?.whereNotNull()
          .map((e) => TaskListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tasks = this.tasks;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tasks != null) 'Tasks': tasks,
    };
  }
}

/// You can use API filters to narrow down the list of resources returned by
/// <code>ListLocations</code>. For example, to retrieve all your Amazon S3
/// locations, you can use <code>ListLocations</code> with filter name
/// <code>LocationType S3</code> and <code>Operator Equals</code>.
class LocationFilter {
  /// The name of the filter being used. Each API call supports a list of filters
  /// that are available for it (for example, <code>LocationType</code> for
  /// <code>ListLocations</code>).
  final LocationFilterName name;

  /// The operator that is used to compare filter values (for example,
  /// <code>Equals</code> or <code>Contains</code>). For more about API filtering
  /// operators, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/query-resources.html">API
  /// filters for ListTasks and ListLocations</a>.
  final Operator operator;

  /// The values that you want to filter for. For example, you might want to
  /// display only Amazon S3 locations.
  final List<String> values;

  LocationFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  factory LocationFilter.fromJson(Map<String, dynamic> json) {
    return LocationFilter(
      name: (json['Name'] as String).toLocationFilterName(),
      operator: (json['Operator'] as String).toOperator(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Operator': operator.toValue(),
      'Values': values,
    };
  }
}

enum LocationFilterName {
  locationUri,
  locationType,
  creationTime,
}

extension on LocationFilterName {
  String toValue() {
    switch (this) {
      case LocationFilterName.locationUri:
        return 'LocationUri';
      case LocationFilterName.locationType:
        return 'LocationType';
      case LocationFilterName.creationTime:
        return 'CreationTime';
    }
  }
}

extension on String {
  LocationFilterName toLocationFilterName() {
    switch (this) {
      case 'LocationUri':
        return LocationFilterName.locationUri;
      case 'LocationType':
        return LocationFilterName.locationType;
      case 'CreationTime':
        return LocationFilterName.creationTime;
    }
    throw Exception('$this is not known in enum LocationFilterName');
  }
}

/// Represents a single entry in a list of locations.
/// <code>LocationListEntry</code> returns an array that contains a list of
/// locations when the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListLocations.html">ListLocations</a>
/// operation is called.
class LocationListEntry {
  /// The Amazon Resource Name (ARN) of the location. For Network File System
  /// (NFS) or Amazon EFS, the location is the export path. For Amazon S3, the
  /// location is the prefix path that you want to mount and use as the root of
  /// the location.
  final String? locationArn;

  /// Represents a list of URLs of a location. <code>LocationUri</code> returns an
  /// array that contains a list of locations when the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListLocations.html">ListLocations</a>
  /// operation is called.
  ///
  /// Format: <code>TYPE://GLOBAL_ID/SUBDIR</code>.
  ///
  /// TYPE designates the type of location. Valid values: NFS | EFS | S3.
  ///
  /// GLOBAL_ID is the globally unique identifier of the resource that backs the
  /// location. An example for EFS is <code>us-east-2.fs-abcd1234</code>. An
  /// example for Amazon S3 is the bucket name, such as <code>myBucket</code>. An
  /// example for NFS is a valid IPv4 address or a host name compliant with Domain
  /// Name Service (DNS).
  ///
  /// SUBDIR is a valid file system path, delimited by forward slashes as is the
  /// *nix convention. For NFS and Amazon EFS, it's the export path to mount the
  /// location. For Amazon S3, it's the prefix path that you mount to and treat as
  /// the root of the location.
  /// <p/>
  final String? locationUri;

  LocationListEntry({
    this.locationArn,
    this.locationUri,
  });

  factory LocationListEntry.fromJson(Map<String, dynamic> json) {
    return LocationListEntry(
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    return {
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
    };
  }
}

enum LogLevel {
  off,
  basic,
  transfer,
}

extension on LogLevel {
  String toValue() {
    switch (this) {
      case LogLevel.off:
        return 'OFF';
      case LogLevel.basic:
        return 'BASIC';
      case LogLevel.transfer:
        return 'TRANSFER';
    }
  }
}

extension on String {
  LogLevel toLogLevel() {
    switch (this) {
      case 'OFF':
        return LogLevel.off;
      case 'BASIC':
        return LogLevel.basic;
      case 'TRANSFER':
        return LogLevel.transfer;
    }
    throw Exception('$this is not known in enum LogLevel');
  }
}

enum Mtime {
  none,
  preserve,
}

extension on Mtime {
  String toValue() {
    switch (this) {
      case Mtime.none:
        return 'NONE';
      case Mtime.preserve:
        return 'PRESERVE';
    }
  }
}

extension on String {
  Mtime toMtime() {
    switch (this) {
      case 'NONE':
        return Mtime.none;
      case 'PRESERVE':
        return Mtime.preserve;
    }
    throw Exception('$this is not known in enum Mtime');
  }
}

/// Represents the mount options that are available for DataSync to access an
/// NFS location.
class NfsMountOptions {
  /// The specific NFS version that you want DataSync to use to mount your NFS
  /// share. If the server refuses to use the version specified, the sync will
  /// fail. If you don't specify a version, DataSync defaults to
  /// <code>AUTOMATIC</code>. That is, DataSync automatically selects a version
  /// based on negotiation with the NFS server.
  ///
  /// You can specify the following NFS versions:
  ///
  /// <ul>
  /// <li>
  /// <b> <a href="https://tools.ietf.org/html/rfc1813">NFSv3</a> </b> - stateless
  /// protocol version that allows for asynchronous writes on the server.
  /// </li>
  /// <li>
  /// <b> <a href="https://tools.ietf.org/html/rfc3530">NFSv4.0</a> </b> -
  /// stateful, firewall-friendly protocol version that supports delegations and
  /// pseudo filesystems.
  /// </li>
  /// <li>
  /// <b> <a href="https://tools.ietf.org/html/rfc5661">NFSv4.1</a> </b> -
  /// stateful protocol version that supports sessions, directory delegations, and
  /// parallel data processing. Version 4.1 also includes all features available
  /// in version 4.0.
  /// </li>
  /// </ul>
  final NfsVersion? version;

  NfsMountOptions({
    this.version,
  });

  factory NfsMountOptions.fromJson(Map<String, dynamic> json) {
    return NfsMountOptions(
      version: (json['Version'] as String?)?.toNfsVersion(),
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      if (version != null) 'Version': version.toValue(),
    };
  }
}

enum NfsVersion {
  automatic,
  nfs3,
  nfs4_0,
  nfs4_1,
}

extension on NfsVersion {
  String toValue() {
    switch (this) {
      case NfsVersion.automatic:
        return 'AUTOMATIC';
      case NfsVersion.nfs3:
        return 'NFS3';
      case NfsVersion.nfs4_0:
        return 'NFS4_0';
      case NfsVersion.nfs4_1:
        return 'NFS4_1';
    }
  }
}

extension on String {
  NfsVersion toNfsVersion() {
    switch (this) {
      case 'AUTOMATIC':
        return NfsVersion.automatic;
      case 'NFS3':
        return NfsVersion.nfs3;
      case 'NFS4_0':
        return NfsVersion.nfs4_0;
      case 'NFS4_1':
        return NfsVersion.nfs4_1;
    }
    throw Exception('$this is not known in enum NfsVersion');
  }
}

enum ObjectStorageServerProtocol {
  https,
  http,
}

extension on ObjectStorageServerProtocol {
  String toValue() {
    switch (this) {
      case ObjectStorageServerProtocol.https:
        return 'HTTPS';
      case ObjectStorageServerProtocol.http:
        return 'HTTP';
    }
  }
}

extension on String {
  ObjectStorageServerProtocol toObjectStorageServerProtocol() {
    switch (this) {
      case 'HTTPS':
        return ObjectStorageServerProtocol.https;
      case 'HTTP':
        return ObjectStorageServerProtocol.http;
    }
    throw Exception('$this is not known in enum ObjectStorageServerProtocol');
  }
}

/// A list of Amazon Resource Names (ARNs) of agents to use for a Network File
/// System (NFS) location.
class OnPremConfig {
  /// ARNs of the agents to use for an NFS location.
  final List<String> agentArns;

  OnPremConfig({
    required this.agentArns,
  });

  factory OnPremConfig.fromJson(Map<String, dynamic> json) {
    return OnPremConfig(
      agentArns: (json['AgentArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentArns = this.agentArns;
    return {
      'AgentArns': agentArns,
    };
  }
}

enum Operator {
  equals,
  notEquals,
  $in,
  lessThanOrEqual,
  lessThan,
  greaterThanOrEqual,
  greaterThan,
  contains,
  notContains,
  beginsWith,
}

extension on Operator {
  String toValue() {
    switch (this) {
      case Operator.equals:
        return 'Equals';
      case Operator.notEquals:
        return 'NotEquals';
      case Operator.$in:
        return 'In';
      case Operator.lessThanOrEqual:
        return 'LessThanOrEqual';
      case Operator.lessThan:
        return 'LessThan';
      case Operator.greaterThanOrEqual:
        return 'GreaterThanOrEqual';
      case Operator.greaterThan:
        return 'GreaterThan';
      case Operator.contains:
        return 'Contains';
      case Operator.notContains:
        return 'NotContains';
      case Operator.beginsWith:
        return 'BeginsWith';
    }
  }
}

extension on String {
  Operator toOperator() {
    switch (this) {
      case 'Equals':
        return Operator.equals;
      case 'NotEquals':
        return Operator.notEquals;
      case 'In':
        return Operator.$in;
      case 'LessThanOrEqual':
        return Operator.lessThanOrEqual;
      case 'LessThan':
        return Operator.lessThan;
      case 'GreaterThanOrEqual':
        return Operator.greaterThanOrEqual;
      case 'GreaterThan':
        return Operator.greaterThan;
      case 'Contains':
        return Operator.contains;
      case 'NotContains':
        return Operator.notContains;
      case 'BeginsWith':
        return Operator.beginsWith;
    }
    throw Exception('$this is not known in enum Operator');
  }
}

/// Represents the options that are available to control the behavior of a <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_StartTaskExecution.html">StartTaskExecution</a>
/// operation. Behavior includes preserving metadata such as user ID (UID),
/// group ID (GID), and file permissions, and also overwriting files in the
/// destination, data integrity verification, and so on.
///
/// A task has a set of default options associated with it. If you don't specify
/// an option in <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_StartTaskExecution.html">StartTaskExecution</a>,
/// the default value is used. You can override the defaults options on each
/// task execution by specifying an overriding <code>Options</code> value to <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_StartTaskExecution.html">StartTaskExecution</a>.
class Options {
  /// A file metadata value that shows the last time a file was accessed (that is,
  /// when the file was read or written to). If you set <code>Atime</code> to
  /// BEST_EFFORT, DataSync attempts to preserve the original <code>Atime</code>
  /// attribute on all source files (that is, the version before the PREPARING
  /// phase). However, <code>Atime</code>'s behavior is not fully standard across
  /// platforms, so AWS DataSync can only do this on a best-effort basis.
  ///
  /// Default value: BEST_EFFORT.
  ///
  /// BEST_EFFORT: Attempt to preserve the per-file <code>Atime</code> value
  /// (recommended).
  ///
  /// NONE: Ignore <code>Atime</code>.
  /// <note>
  /// If <code>Atime</code> is set to BEST_EFFORT, <code>Mtime</code> must be set
  /// to PRESERVE.
  ///
  /// If <code>Atime</code> is set to NONE, <code>Mtime</code> must also be NONE.
  /// </note>
  final Atime? atime;

  /// A value that limits the bandwidth used by AWS DataSync. For example, if you
  /// want AWS DataSync to use a maximum of 1 MB, set this value to
  /// <code>1048576</code> (<code>=1024*1024</code>).
  final int? bytesPerSecond;

  /// The POSIX group ID (GID) of the file's owners. This option should only be
  /// set for NFS, EFS, and S3 locations. For more information about what metadata
  /// is copied by DataSync, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied">Metadata
  /// Copied by DataSync</a>.
  ///
  /// Default value: INT_VALUE. This preserves the integer value of the ID.
  ///
  /// INT_VALUE: Preserve the integer value of user ID (UID) and GID
  /// (recommended).
  ///
  /// NONE: Ignore UID and GID.
  final Gid? gid;

  /// A value that determines the type of logs that DataSync publishes to a log
  /// stream in the Amazon CloudWatch log group that you provide. For more
  /// information about providing a log group for DataSync, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateTask.html#DataSync-CreateTask-request-CloudWatchLogGroupArn">CloudWatchLogGroupArn</a>.
  /// If set to <code>OFF</code>, no logs are published. <code>BASIC</code>
  /// publishes logs on errors for individual files transferred, and
  /// <code>TRANSFER</code> publishes logs for every file or object that is
  /// transferred and integrity checked.
  final LogLevel? logLevel;

  /// A value that indicates the last time that a file was modified (that is, a
  /// file was written to) before the PREPARING phase. This option is required for
  /// cases when you need to run the same task more than one time.
  ///
  /// Default value: PRESERVE.
  ///
  /// PRESERVE: Preserve original <code>Mtime</code> (recommended)
  ///
  /// NONE: Ignore <code>Mtime</code>.
  /// <note>
  /// If <code>Mtime</code> is set to PRESERVE, <code>Atime</code> must be set to
  /// BEST_EFFORT.
  ///
  /// If <code>Mtime</code> is set to NONE, <code>Atime</code> must also be set to
  /// NONE.
  /// </note>
  final Mtime? mtime;

  /// A value that determines whether files at the destination should be
  /// overwritten or preserved when copying files. If set to <code>NEVER</code> a
  /// destination file will not be replaced by a source file, even if the
  /// destination file differs from the source file. If you modify files in the
  /// destination and you sync the files, you can use this value to protect
  /// against overwriting those changes.
  ///
  /// Some storage classes have specific behaviors that can affect your S3 storage
  /// cost. For detailed information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Considerations
  /// when working with Amazon S3 storage classes in DataSync </a> in the <i>AWS
  /// DataSync User Guide</i>.
  final OverwriteMode? overwriteMode;

  /// A value that determines which users or groups can access a file for a
  /// specific purpose such as reading, writing, or execution of the file. This
  /// option should only be set for NFS, EFS, and S3 locations. For more
  /// information about what metadata is copied by DataSync, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied">Metadata
  /// Copied by DataSync</a>.
  ///
  /// Default value: PRESERVE.
  ///
  /// PRESERVE: Preserve POSIX-style permissions (recommended).
  ///
  /// NONE: Ignore permissions.
  /// <note>
  /// AWS DataSync can preserve extant permissions of a source location.
  /// </note>
  final PosixPermissions? posixPermissions;

  /// A value that specifies whether files in the destination that don't exist in
  /// the source file system should be preserved. This option can affect your
  /// storage cost. If your task deletes objects, you might incur minimum storage
  /// duration charges for certain storage classes. For detailed information, see
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Considerations
  /// when working with Amazon S3 storage classes in DataSync </a> in the <i>AWS
  /// DataSync User Guide</i>.
  ///
  /// Default value: PRESERVE.
  ///
  /// PRESERVE: Ignore such destination files (recommended).
  ///
  /// REMOVE: Delete destination files that aren’t present in the source.
  final PreserveDeletedFiles? preserveDeletedFiles;

  /// A value that determines whether AWS DataSync should preserve the metadata of
  /// block and character devices in the source file system, and re-create the
  /// files with that device name and metadata on the destination. DataSync does
  /// not copy the contents of such devices, only the name and metadata.
  /// <note>
  /// AWS DataSync can't sync the actual contents of such devices, because they
  /// are nonterminal and don't return an end-of-file (EOF) marker.
  /// </note>
  /// Default value: NONE.
  ///
  /// NONE: Ignore special devices (recommended).
  ///
  /// PRESERVE: Preserve character and block device metadata. This option isn't
  /// currently supported for Amazon EFS.
  final PreserveDevices? preserveDevices;

  /// A value that determines which components of the SMB security descriptor are
  /// copied from source to destination objects.
  ///
  /// This value is only used for transfers between SMB and Amazon FSx for Windows
  /// File Server locations, or between two Amazon FSx for Windows File Server
  /// locations. For more information about how DataSync handles metadata, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html">How
  /// DataSync Handles Metadata and Special Files</a>.
  ///
  /// Default value: OWNER_DACL.
  ///
  /// <b>OWNER_DACL</b>: For each copied object, DataSync copies the following
  /// metadata:
  ///
  /// <ul>
  /// <li>
  /// Object owner.
  /// </li>
  /// <li>
  /// NTFS discretionary access control lists (DACLs), which determine whether to
  /// grant access to an object.
  /// </li>
  /// </ul>
  /// When choosing this option, DataSync does NOT copy the NTFS system access
  /// control lists (SACLs), which are used by administrators to log attempts to
  /// access a secured object.
  ///
  /// <b>OWNER_DACL_SACL</b>: For each copied object, DataSync copies the
  /// following metadata:
  ///
  /// <ul>
  /// <li>
  /// Object owner.
  /// </li>
  /// <li>
  /// NTFS discretionary access control lists (DACLs), which determine whether to
  /// grant access to an object.
  /// </li>
  /// <li>
  /// NTFS system access control lists (SACLs), which are used by administrators
  /// to log attempts to access a secured object.
  /// </li>
  /// </ul>
  /// Copying SACLs requires granting additional permissions to the Windows user
  /// that DataSync uses to access your SMB location. For information about
  /// choosing a user that ensures sufficient permissions to files, folders, and
  /// metadata, see <a href="create-smb-location.html#SMBuser">user</a>.
  ///
  /// <b>NONE</b>: None of the SMB security descriptor components are copied.
  /// Destination objects are owned by the user that was provided for accessing
  /// the destination location. DACLs and SACLs are set based on the destination
  /// server’s configuration.
  final SmbSecurityDescriptorCopyFlags? securityDescriptorCopyFlags;

  /// A value that determines whether tasks should be queued before executing the
  /// tasks. If set to <code>ENABLED</code>, the tasks will be queued. The default
  /// is <code>ENABLED</code>.
  ///
  /// If you use the same agent to run multiple tasks, you can enable the tasks to
  /// run in series. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#queue-task-execution">Queueing
  /// task executions</a>.
  final TaskQueueing? taskQueueing;

  /// A value that determines whether DataSync transfers only the data and
  /// metadata that differ between the source and the destination location, or
  /// whether DataSync transfers all the content from the source, without
  /// comparing to the destination location.
  ///
  /// CHANGED: DataSync copies only data or metadata that is new or different
  /// content from the source location to the destination location.
  ///
  /// ALL: DataSync copies all source location content to the destination, without
  /// comparing to existing content on the destination.
  final TransferMode? transferMode;

  /// The POSIX user ID (UID) of the file's owner. This option should only be set
  /// for NFS, EFS, and S3 locations. To learn more about what metadata is copied
  /// by DataSync, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied">Metadata
  /// Copied by DataSync</a>.
  ///
  /// Default value: INT_VALUE. This preserves the integer value of the ID.
  ///
  /// INT_VALUE: Preserve the integer value of UID and group ID (GID)
  /// (recommended).
  ///
  /// NONE: Ignore UID and GID.
  final Uid? uid;

  /// A value that determines whether a data integrity verification should be
  /// performed at the end of a task execution after all data and metadata have
  /// been transferred. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-task.html">Configure
  /// task settings</a>.
  ///
  /// Default value: POINT_IN_TIME_CONSISTENT.
  ///
  /// ONLY_FILES_TRANSFERRED (recommended): Perform verification only on files
  /// that were transferred.
  ///
  /// POINT_IN_TIME_CONSISTENT: Scan the entire source and entire destination at
  /// the end of the transfer to verify that source and destination are fully
  /// synchronized. This option isn't supported when transferring to S3 Glacier or
  /// S3 Glacier Deep Archive storage classes.
  ///
  /// NONE: No additional verification is done at the end of the transfer, but all
  /// data transmissions are integrity-checked with checksum verification during
  /// the transfer.
  final VerifyMode? verifyMode;

  Options({
    this.atime,
    this.bytesPerSecond,
    this.gid,
    this.logLevel,
    this.mtime,
    this.overwriteMode,
    this.posixPermissions,
    this.preserveDeletedFiles,
    this.preserveDevices,
    this.securityDescriptorCopyFlags,
    this.taskQueueing,
    this.transferMode,
    this.uid,
    this.verifyMode,
  });

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      atime: (json['Atime'] as String?)?.toAtime(),
      bytesPerSecond: json['BytesPerSecond'] as int?,
      gid: (json['Gid'] as String?)?.toGid(),
      logLevel: (json['LogLevel'] as String?)?.toLogLevel(),
      mtime: (json['Mtime'] as String?)?.toMtime(),
      overwriteMode: (json['OverwriteMode'] as String?)?.toOverwriteMode(),
      posixPermissions:
          (json['PosixPermissions'] as String?)?.toPosixPermissions(),
      preserveDeletedFiles:
          (json['PreserveDeletedFiles'] as String?)?.toPreserveDeletedFiles(),
      preserveDevices:
          (json['PreserveDevices'] as String?)?.toPreserveDevices(),
      securityDescriptorCopyFlags:
          (json['SecurityDescriptorCopyFlags'] as String?)
              ?.toSmbSecurityDescriptorCopyFlags(),
      taskQueueing: (json['TaskQueueing'] as String?)?.toTaskQueueing(),
      transferMode: (json['TransferMode'] as String?)?.toTransferMode(),
      uid: (json['Uid'] as String?)?.toUid(),
      verifyMode: (json['VerifyMode'] as String?)?.toVerifyMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final atime = this.atime;
    final bytesPerSecond = this.bytesPerSecond;
    final gid = this.gid;
    final logLevel = this.logLevel;
    final mtime = this.mtime;
    final overwriteMode = this.overwriteMode;
    final posixPermissions = this.posixPermissions;
    final preserveDeletedFiles = this.preserveDeletedFiles;
    final preserveDevices = this.preserveDevices;
    final securityDescriptorCopyFlags = this.securityDescriptorCopyFlags;
    final taskQueueing = this.taskQueueing;
    final transferMode = this.transferMode;
    final uid = this.uid;
    final verifyMode = this.verifyMode;
    return {
      if (atime != null) 'Atime': atime.toValue(),
      if (bytesPerSecond != null) 'BytesPerSecond': bytesPerSecond,
      if (gid != null) 'Gid': gid.toValue(),
      if (logLevel != null) 'LogLevel': logLevel.toValue(),
      if (mtime != null) 'Mtime': mtime.toValue(),
      if (overwriteMode != null) 'OverwriteMode': overwriteMode.toValue(),
      if (posixPermissions != null)
        'PosixPermissions': posixPermissions.toValue(),
      if (preserveDeletedFiles != null)
        'PreserveDeletedFiles': preserveDeletedFiles.toValue(),
      if (preserveDevices != null) 'PreserveDevices': preserveDevices.toValue(),
      if (securityDescriptorCopyFlags != null)
        'SecurityDescriptorCopyFlags': securityDescriptorCopyFlags.toValue(),
      if (taskQueueing != null) 'TaskQueueing': taskQueueing.toValue(),
      if (transferMode != null) 'TransferMode': transferMode.toValue(),
      if (uid != null) 'Uid': uid.toValue(),
      if (verifyMode != null) 'VerifyMode': verifyMode.toValue(),
    };
  }
}

enum OverwriteMode {
  always,
  never,
}

extension on OverwriteMode {
  String toValue() {
    switch (this) {
      case OverwriteMode.always:
        return 'ALWAYS';
      case OverwriteMode.never:
        return 'NEVER';
    }
  }
}

extension on String {
  OverwriteMode toOverwriteMode() {
    switch (this) {
      case 'ALWAYS':
        return OverwriteMode.always;
      case 'NEVER':
        return OverwriteMode.never;
    }
    throw Exception('$this is not known in enum OverwriteMode');
  }
}

enum PhaseStatus {
  pending,
  success,
  error,
}

extension on PhaseStatus {
  String toValue() {
    switch (this) {
      case PhaseStatus.pending:
        return 'PENDING';
      case PhaseStatus.success:
        return 'SUCCESS';
      case PhaseStatus.error:
        return 'ERROR';
    }
  }
}

extension on String {
  PhaseStatus toPhaseStatus() {
    switch (this) {
      case 'PENDING':
        return PhaseStatus.pending;
      case 'SUCCESS':
        return PhaseStatus.success;
      case 'ERROR':
        return PhaseStatus.error;
    }
    throw Exception('$this is not known in enum PhaseStatus');
  }
}

enum PosixPermissions {
  none,
  preserve,
}

extension on PosixPermissions {
  String toValue() {
    switch (this) {
      case PosixPermissions.none:
        return 'NONE';
      case PosixPermissions.preserve:
        return 'PRESERVE';
    }
  }
}

extension on String {
  PosixPermissions toPosixPermissions() {
    switch (this) {
      case 'NONE':
        return PosixPermissions.none;
      case 'PRESERVE':
        return PosixPermissions.preserve;
    }
    throw Exception('$this is not known in enum PosixPermissions');
  }
}

enum PreserveDeletedFiles {
  preserve,
  remove,
}

extension on PreserveDeletedFiles {
  String toValue() {
    switch (this) {
      case PreserveDeletedFiles.preserve:
        return 'PRESERVE';
      case PreserveDeletedFiles.remove:
        return 'REMOVE';
    }
  }
}

extension on String {
  PreserveDeletedFiles toPreserveDeletedFiles() {
    switch (this) {
      case 'PRESERVE':
        return PreserveDeletedFiles.preserve;
      case 'REMOVE':
        return PreserveDeletedFiles.remove;
    }
    throw Exception('$this is not known in enum PreserveDeletedFiles');
  }
}

enum PreserveDevices {
  none,
  preserve,
}

extension on PreserveDevices {
  String toValue() {
    switch (this) {
      case PreserveDevices.none:
        return 'NONE';
      case PreserveDevices.preserve:
        return 'PRESERVE';
    }
  }
}

extension on String {
  PreserveDevices toPreserveDevices() {
    switch (this) {
      case 'NONE':
        return PreserveDevices.none;
      case 'PRESERVE':
        return PreserveDevices.preserve;
    }
    throw Exception('$this is not known in enum PreserveDevices');
  }
}

/// The VPC endpoint, subnet, and security group that an agent uses to access IP
/// addresses in a VPC (Virtual Private Cloud).
class PrivateLinkConfig {
  /// The private endpoint that is configured for an agent that has access to IP
  /// addresses in a <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html">PrivateLink</a>.
  /// An agent that is configured with this endpoint will not be accessible over
  /// the public internet.
  final String? privateLinkEndpoint;

  /// The Amazon Resource Names (ARNs) of the security groups that are configured
  /// for the EC2 resource that hosts an agent activated in a VPC or an agent that
  /// has access to a VPC endpoint.
  final List<String>? securityGroupArns;

  /// The Amazon Resource Names (ARNs) of the subnets that are configured for an
  /// agent activated in a VPC or an agent that has access to a VPC endpoint.
  final List<String>? subnetArns;

  /// The ID of the VPC endpoint that is configured for an agent. An agent that is
  /// configured with a VPC endpoint will not be accessible over the public
  /// internet.
  final String? vpcEndpointId;

  PrivateLinkConfig({
    this.privateLinkEndpoint,
    this.securityGroupArns,
    this.subnetArns,
    this.vpcEndpointId,
  });

  factory PrivateLinkConfig.fromJson(Map<String, dynamic> json) {
    return PrivateLinkConfig(
      privateLinkEndpoint: json['PrivateLinkEndpoint'] as String?,
      securityGroupArns: (json['SecurityGroupArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetArns: (json['SubnetArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcEndpointId: json['VpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final privateLinkEndpoint = this.privateLinkEndpoint;
    final securityGroupArns = this.securityGroupArns;
    final subnetArns = this.subnetArns;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      if (privateLinkEndpoint != null)
        'PrivateLinkEndpoint': privateLinkEndpoint,
      if (securityGroupArns != null) 'SecurityGroupArns': securityGroupArns,
      if (subnetArns != null) 'SubnetArns': subnetArns,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
    };
  }
}

/// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
/// (IAM) role that is used to access an Amazon S3 bucket.
///
/// For detailed information about using such a role, see Creating a Location
/// for Amazon S3 in the <i>AWS DataSync User Guide</i>.
class S3Config {
  /// The Amazon S3 bucket to access. This bucket is used as a parameter in the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateLocationS3.html">CreateLocationS3</a>
  /// operation.
  final String bucketAccessRoleArn;

  S3Config({
    required this.bucketAccessRoleArn,
  });

  factory S3Config.fromJson(Map<String, dynamic> json) {
    return S3Config(
      bucketAccessRoleArn: json['BucketAccessRoleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketAccessRoleArn = this.bucketAccessRoleArn;
    return {
      'BucketAccessRoleArn': bucketAccessRoleArn,
    };
  }
}

enum S3StorageClass {
  standard,
  standardIa,
  onezoneIa,
  intelligentTiering,
  glacier,
  deepArchive,
  outposts,
}

extension on S3StorageClass {
  String toValue() {
    switch (this) {
      case S3StorageClass.standard:
        return 'STANDARD';
      case S3StorageClass.standardIa:
        return 'STANDARD_IA';
      case S3StorageClass.onezoneIa:
        return 'ONEZONE_IA';
      case S3StorageClass.intelligentTiering:
        return 'INTELLIGENT_TIERING';
      case S3StorageClass.glacier:
        return 'GLACIER';
      case S3StorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
      case S3StorageClass.outposts:
        return 'OUTPOSTS';
    }
  }
}

extension on String {
  S3StorageClass toS3StorageClass() {
    switch (this) {
      case 'STANDARD':
        return S3StorageClass.standard;
      case 'STANDARD_IA':
        return S3StorageClass.standardIa;
      case 'ONEZONE_IA':
        return S3StorageClass.onezoneIa;
      case 'INTELLIGENT_TIERING':
        return S3StorageClass.intelligentTiering;
      case 'GLACIER':
        return S3StorageClass.glacier;
      case 'DEEP_ARCHIVE':
        return S3StorageClass.deepArchive;
      case 'OUTPOSTS':
        return S3StorageClass.outposts;
    }
    throw Exception('$this is not known in enum S3StorageClass');
  }
}

/// Represents the mount options that are available for DataSync to access an
/// SMB location.
class SmbMountOptions {
  /// The specific SMB version that you want DataSync to use to mount your SMB
  /// share. If you don't specify a version, DataSync defaults to
  /// <code>AUTOMATIC</code>. That is, DataSync automatically selects a version
  /// based on negotiation with the SMB server.
  final SmbVersion? version;

  SmbMountOptions({
    this.version,
  });

  factory SmbMountOptions.fromJson(Map<String, dynamic> json) {
    return SmbMountOptions(
      version: (json['Version'] as String?)?.toSmbVersion(),
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      if (version != null) 'Version': version.toValue(),
    };
  }
}

enum SmbSecurityDescriptorCopyFlags {
  none,
  ownerDacl,
  ownerDaclSacl,
}

extension on SmbSecurityDescriptorCopyFlags {
  String toValue() {
    switch (this) {
      case SmbSecurityDescriptorCopyFlags.none:
        return 'NONE';
      case SmbSecurityDescriptorCopyFlags.ownerDacl:
        return 'OWNER_DACL';
      case SmbSecurityDescriptorCopyFlags.ownerDaclSacl:
        return 'OWNER_DACL_SACL';
    }
  }
}

extension on String {
  SmbSecurityDescriptorCopyFlags toSmbSecurityDescriptorCopyFlags() {
    switch (this) {
      case 'NONE':
        return SmbSecurityDescriptorCopyFlags.none;
      case 'OWNER_DACL':
        return SmbSecurityDescriptorCopyFlags.ownerDacl;
      case 'OWNER_DACL_SACL':
        return SmbSecurityDescriptorCopyFlags.ownerDaclSacl;
    }
    throw Exception(
        '$this is not known in enum SmbSecurityDescriptorCopyFlags');
  }
}

enum SmbVersion {
  automatic,
  smb2,
  smb3,
}

extension on SmbVersion {
  String toValue() {
    switch (this) {
      case SmbVersion.automatic:
        return 'AUTOMATIC';
      case SmbVersion.smb2:
        return 'SMB2';
      case SmbVersion.smb3:
        return 'SMB3';
    }
  }
}

extension on String {
  SmbVersion toSmbVersion() {
    switch (this) {
      case 'AUTOMATIC':
        return SmbVersion.automatic;
      case 'SMB2':
        return SmbVersion.smb2;
      case 'SMB3':
        return SmbVersion.smb3;
    }
    throw Exception('$this is not known in enum SmbVersion');
  }
}

/// StartTaskExecutionResponse
class StartTaskExecutionResponse {
  /// The Amazon Resource Name (ARN) of the specific task execution that was
  /// started.
  final String? taskExecutionArn;

  StartTaskExecutionResponse({
    this.taskExecutionArn,
  });

  factory StartTaskExecutionResponse.fromJson(Map<String, dynamic> json) {
    return StartTaskExecutionResponse(
      taskExecutionArn: json['TaskExecutionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskExecutionArn = this.taskExecutionArn;
    return {
      if (taskExecutionArn != null) 'TaskExecutionArn': taskExecutionArn,
    };
  }
}

/// Represents a single entry in a list of AWS resource tags.
/// <code>TagListEntry</code> returns an array that contains a list of tasks
/// when the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListTagsForResource.html">ListTagsForResource</a>
/// operation is called.
class TagListEntry {
  /// The key for an AWS resource tag.
  final String key;

  /// The value for an AWS resource tag.
  final String? value;

  TagListEntry({
    required this.key,
    this.value,
  });

  factory TagListEntry.fromJson(Map<String, dynamic> json) {
    return TagListEntry(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
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

/// Represents a single entry in a list of task executions.
/// <code>TaskExecutionListEntry</code> returns an array that contains a list of
/// specific invocations of a task when the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListTaskExecutions.html">ListTaskExecutions</a>
/// operation is called.
class TaskExecutionListEntry {
  /// The status of a task execution.
  final TaskExecutionStatus? status;

  /// The Amazon Resource Name (ARN) of the task that was executed.
  final String? taskExecutionArn;

  TaskExecutionListEntry({
    this.status,
    this.taskExecutionArn,
  });

  factory TaskExecutionListEntry.fromJson(Map<String, dynamic> json) {
    return TaskExecutionListEntry(
      status: (json['Status'] as String?)?.toTaskExecutionStatus(),
      taskExecutionArn: json['TaskExecutionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final taskExecutionArn = this.taskExecutionArn;
    return {
      if (status != null) 'Status': status.toValue(),
      if (taskExecutionArn != null) 'TaskExecutionArn': taskExecutionArn,
    };
  }
}

/// Describes the detailed result of a <code>TaskExecution</code> operation.
/// This result includes the time in milliseconds spent in each phase, the
/// status of the task execution, and the errors encountered.
class TaskExecutionResultDetail {
  /// Errors that AWS DataSync encountered during execution of the task. You can
  /// use this error code to help troubleshoot issues.
  final String? errorCode;

  /// Detailed description of an error that was encountered during the task
  /// execution. You can use this information to help troubleshoot issues.
  final String? errorDetail;

  /// The total time in milliseconds that AWS DataSync spent in the PREPARING
  /// phase.
  final int? prepareDuration;

  /// The status of the PREPARING phase.
  final PhaseStatus? prepareStatus;

  /// The total time in milliseconds that AWS DataSync took to transfer the file
  /// from the source to the destination location.
  final int? totalDuration;

  /// The total time in milliseconds that AWS DataSync spent in the TRANSFERRING
  /// phase.
  final int? transferDuration;

  /// The status of the TRANSFERRING phase.
  final PhaseStatus? transferStatus;

  /// The total time in milliseconds that AWS DataSync spent in the VERIFYING
  /// phase.
  final int? verifyDuration;

  /// The status of the VERIFYING phase.
  final PhaseStatus? verifyStatus;

  TaskExecutionResultDetail({
    this.errorCode,
    this.errorDetail,
    this.prepareDuration,
    this.prepareStatus,
    this.totalDuration,
    this.transferDuration,
    this.transferStatus,
    this.verifyDuration,
    this.verifyStatus,
  });

  factory TaskExecutionResultDetail.fromJson(Map<String, dynamic> json) {
    return TaskExecutionResultDetail(
      errorCode: json['ErrorCode'] as String?,
      errorDetail: json['ErrorDetail'] as String?,
      prepareDuration: json['PrepareDuration'] as int?,
      prepareStatus: (json['PrepareStatus'] as String?)?.toPhaseStatus(),
      totalDuration: json['TotalDuration'] as int?,
      transferDuration: json['TransferDuration'] as int?,
      transferStatus: (json['TransferStatus'] as String?)?.toPhaseStatus(),
      verifyDuration: json['VerifyDuration'] as int?,
      verifyStatus: (json['VerifyStatus'] as String?)?.toPhaseStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorDetail = this.errorDetail;
    final prepareDuration = this.prepareDuration;
    final prepareStatus = this.prepareStatus;
    final totalDuration = this.totalDuration;
    final transferDuration = this.transferDuration;
    final transferStatus = this.transferStatus;
    final verifyDuration = this.verifyDuration;
    final verifyStatus = this.verifyStatus;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorDetail != null) 'ErrorDetail': errorDetail,
      if (prepareDuration != null) 'PrepareDuration': prepareDuration,
      if (prepareStatus != null) 'PrepareStatus': prepareStatus.toValue(),
      if (totalDuration != null) 'TotalDuration': totalDuration,
      if (transferDuration != null) 'TransferDuration': transferDuration,
      if (transferStatus != null) 'TransferStatus': transferStatus.toValue(),
      if (verifyDuration != null) 'VerifyDuration': verifyDuration,
      if (verifyStatus != null) 'VerifyStatus': verifyStatus.toValue(),
    };
  }
}

enum TaskExecutionStatus {
  queued,
  launching,
  preparing,
  transferring,
  verifying,
  success,
  error,
}

extension on TaskExecutionStatus {
  String toValue() {
    switch (this) {
      case TaskExecutionStatus.queued:
        return 'QUEUED';
      case TaskExecutionStatus.launching:
        return 'LAUNCHING';
      case TaskExecutionStatus.preparing:
        return 'PREPARING';
      case TaskExecutionStatus.transferring:
        return 'TRANSFERRING';
      case TaskExecutionStatus.verifying:
        return 'VERIFYING';
      case TaskExecutionStatus.success:
        return 'SUCCESS';
      case TaskExecutionStatus.error:
        return 'ERROR';
    }
  }
}

extension on String {
  TaskExecutionStatus toTaskExecutionStatus() {
    switch (this) {
      case 'QUEUED':
        return TaskExecutionStatus.queued;
      case 'LAUNCHING':
        return TaskExecutionStatus.launching;
      case 'PREPARING':
        return TaskExecutionStatus.preparing;
      case 'TRANSFERRING':
        return TaskExecutionStatus.transferring;
      case 'VERIFYING':
        return TaskExecutionStatus.verifying;
      case 'SUCCESS':
        return TaskExecutionStatus.success;
      case 'ERROR':
        return TaskExecutionStatus.error;
    }
    throw Exception('$this is not known in enum TaskExecutionStatus');
  }
}

/// You can use API filters to narrow down the list of resources returned by
/// <code>ListTasks</code>. For example, to retrieve all tasks on a source
/// location, you can use <code>ListTasks</code> with filter name
/// <code>LocationId</code> and <code>Operator Equals</code> with the ARN for
/// the location.
class TaskFilter {
  /// The name of the filter being used. Each API call supports a list of filters
  /// that are available for it. For example, <code>LocationId</code> for
  /// <code>ListTasks</code>.
  final TaskFilterName name;

  /// The operator that is used to compare filter values (for example,
  /// <code>Equals</code> or <code>Contains</code>). For more about API filtering
  /// operators, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/query-resources.html">API
  /// filters for ListTasks and ListLocations</a>.
  final Operator operator;

  /// The values that you want to filter for. For example, you might want to
  /// display only tasks for a specific destination location.
  final List<String> values;

  TaskFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  factory TaskFilter.fromJson(Map<String, dynamic> json) {
    return TaskFilter(
      name: (json['Name'] as String).toTaskFilterName(),
      operator: (json['Operator'] as String).toOperator(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Operator': operator.toValue(),
      'Values': values,
    };
  }
}

enum TaskFilterName {
  locationId,
  creationTime,
}

extension on TaskFilterName {
  String toValue() {
    switch (this) {
      case TaskFilterName.locationId:
        return 'LocationId';
      case TaskFilterName.creationTime:
        return 'CreationTime';
    }
  }
}

extension on String {
  TaskFilterName toTaskFilterName() {
    switch (this) {
      case 'LocationId':
        return TaskFilterName.locationId;
      case 'CreationTime':
        return TaskFilterName.creationTime;
    }
    throw Exception('$this is not known in enum TaskFilterName');
  }
}

/// Represents a single entry in a list of tasks. <code>TaskListEntry</code>
/// returns an array that contains a list of tasks when the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListTasks.html">ListTasks</a>
/// operation is called. A task includes the source and destination file systems
/// to sync and the options to use for the tasks.
class TaskListEntry {
  /// The name of the task.
  final String? name;

  /// The status of the task.
  final TaskStatus? status;

  /// The Amazon Resource Name (ARN) of the task.
  final String? taskArn;

  TaskListEntry({
    this.name,
    this.status,
    this.taskArn,
  });

  factory TaskListEntry.fromJson(Map<String, dynamic> json) {
    return TaskListEntry(
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toTaskStatus(),
      taskArn: json['TaskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final taskArn = this.taskArn;
    return {
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (taskArn != null) 'TaskArn': taskArn,
    };
  }
}

enum TaskQueueing {
  enabled,
  disabled,
}

extension on TaskQueueing {
  String toValue() {
    switch (this) {
      case TaskQueueing.enabled:
        return 'ENABLED';
      case TaskQueueing.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  TaskQueueing toTaskQueueing() {
    switch (this) {
      case 'ENABLED':
        return TaskQueueing.enabled;
      case 'DISABLED':
        return TaskQueueing.disabled;
    }
    throw Exception('$this is not known in enum TaskQueueing');
  }
}

/// Specifies the schedule you want your task to use for repeated executions.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html">Schedule
/// Expressions for Rules</a>.
class TaskSchedule {
  /// A cron expression that specifies when AWS DataSync initiates a scheduled
  /// transfer from a source to a destination location.
  final String scheduleExpression;

  TaskSchedule({
    required this.scheduleExpression,
  });

  factory TaskSchedule.fromJson(Map<String, dynamic> json) {
    return TaskSchedule(
      scheduleExpression: json['ScheduleExpression'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    return {
      'ScheduleExpression': scheduleExpression,
    };
  }
}

enum TaskStatus {
  available,
  creating,
  queued,
  running,
  unavailable,
}

extension on TaskStatus {
  String toValue() {
    switch (this) {
      case TaskStatus.available:
        return 'AVAILABLE';
      case TaskStatus.creating:
        return 'CREATING';
      case TaskStatus.queued:
        return 'QUEUED';
      case TaskStatus.running:
        return 'RUNNING';
      case TaskStatus.unavailable:
        return 'UNAVAILABLE';
    }
  }
}

extension on String {
  TaskStatus toTaskStatus() {
    switch (this) {
      case 'AVAILABLE':
        return TaskStatus.available;
      case 'CREATING':
        return TaskStatus.creating;
      case 'QUEUED':
        return TaskStatus.queued;
      case 'RUNNING':
        return TaskStatus.running;
      case 'UNAVAILABLE':
        return TaskStatus.unavailable;
    }
    throw Exception('$this is not known in enum TaskStatus');
  }
}

enum TransferMode {
  changed,
  all,
}

extension on TransferMode {
  String toValue() {
    switch (this) {
      case TransferMode.changed:
        return 'CHANGED';
      case TransferMode.all:
        return 'ALL';
    }
  }
}

extension on String {
  TransferMode toTransferMode() {
    switch (this) {
      case 'CHANGED':
        return TransferMode.changed;
      case 'ALL':
        return TransferMode.all;
    }
    throw Exception('$this is not known in enum TransferMode');
  }
}

enum Uid {
  none,
  intValue,
  name,
  both,
}

extension on Uid {
  String toValue() {
    switch (this) {
      case Uid.none:
        return 'NONE';
      case Uid.intValue:
        return 'INT_VALUE';
      case Uid.name:
        return 'NAME';
      case Uid.both:
        return 'BOTH';
    }
  }
}

extension on String {
  Uid toUid() {
    switch (this) {
      case 'NONE':
        return Uid.none;
      case 'INT_VALUE':
        return Uid.intValue;
      case 'NAME':
        return Uid.name;
      case 'BOTH':
        return Uid.both;
    }
    throw Exception('$this is not known in enum Uid');
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

class UpdateAgentResponse {
  UpdateAgentResponse();

  factory UpdateAgentResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAgentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLocationNfsResponse {
  UpdateLocationNfsResponse();

  factory UpdateLocationNfsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationNfsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLocationObjectStorageResponse {
  UpdateLocationObjectStorageResponse();

  factory UpdateLocationObjectStorageResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationObjectStorageResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLocationSmbResponse {
  UpdateLocationSmbResponse();

  factory UpdateLocationSmbResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationSmbResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTaskExecutionResponse {
  UpdateTaskExecutionResponse();

  factory UpdateTaskExecutionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTaskExecutionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTaskResponse {
  UpdateTaskResponse();

  factory UpdateTaskResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum VerifyMode {
  pointInTimeConsistent,
  onlyFilesTransferred,
  none,
}

extension on VerifyMode {
  String toValue() {
    switch (this) {
      case VerifyMode.pointInTimeConsistent:
        return 'POINT_IN_TIME_CONSISTENT';
      case VerifyMode.onlyFilesTransferred:
        return 'ONLY_FILES_TRANSFERRED';
      case VerifyMode.none:
        return 'NONE';
    }
  }
}

extension on String {
  VerifyMode toVerifyMode() {
    switch (this) {
      case 'POINT_IN_TIME_CONSISTENT':
        return VerifyMode.pointInTimeConsistent;
      case 'ONLY_FILES_TRANSFERRED':
        return VerifyMode.onlyFilesTransferred;
      case 'NONE':
        return VerifyMode.none;
    }
    throw Exception('$this is not known in enum VerifyMode');
  }
}

class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
};
