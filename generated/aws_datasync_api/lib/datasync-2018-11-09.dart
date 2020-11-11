// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'datasync-2018-11-09.g.dart';

/// AWS DataSync is a managed data transfer service that makes it simpler for
/// you to automate moving data between on-premises storage and Amazon Simple
/// Storage Service (Amazon S3) or Amazon Elastic File System (Amazon EFS).
class DataSync {
  final _s.JsonProtocol _protocol;
  DataSync({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'datasync',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels execution of a task.
  ///
  /// When you cancel a task execution, the transfer of some files are abruptly
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
    @_s.required String taskExecutionArn,
  }) async {
    ArgumentError.checkNotNull(taskExecutionArn, 'taskExecutionArn');
    _s.validateStringLength(
      'taskExecutionArn',
      taskExecutionArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskExecutionArn',
      taskExecutionArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]*:[0-9]{12}:task/task-[0-9a-f]{17}/execution/exec-[0-9a-f]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CancelTaskExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CancelTaskExecutionRequest(
        taskExecutionArn: taskExecutionArn,
      ),
    );

    return CancelTaskExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Activates an AWS DataSync agent that you have deployed on your host. The
  /// activation process associates your agent with your account. In the
  /// activation process, you specify information such as the AWS Region that
  /// you want to activate the agent in. You activate the agent in the AWS
  /// Region where your target locations (in Amazon S3 or Amazon EFS) reside.
  /// Your tasks are created in this AWS Region.
  ///
  /// You can activate the agent in a VPC (Virtual private Cloud) or provide the
  /// agent access to a VPC endpoint so you can run tasks without going over the
  /// public Internet.
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
  /// subnets. See <a>CreateAgentRequest$SubnetArns</a>.
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
  /// The ID of the VPC (Virtual Private Cloud) endpoint that the agent has
  /// access to. This is the client-side VPC endpoint, also called a
  /// PrivateLink. If you don't have a PrivateLink VPC endpoint, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html#create-endpoint-service">Creating
  /// a VPC Endpoint Service Configuration</a> in the AWS VPC User Guide.
  ///
  /// VPC endpoint ID looks like this: <code>vpce-01234d5aff67890e1</code>.
  Future<CreateAgentResponse> createAgent({
    @_s.required String activationKey,
    String agentName,
    List<String> securityGroupArns,
    List<String> subnetArns,
    List<TagListEntry> tags,
    String vpcEndpointId,
  }) async {
    ArgumentError.checkNotNull(activationKey, 'activationKey');
    _s.validateStringLength(
      'activationKey',
      activationKey,
      0,
      29,
      isRequired: true,
    );
    _s.validateStringPattern(
      'activationKey',
      activationKey,
      r'''[A-Z0-9]{5}(-[A-Z0-9]{5}){4}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'agentName',
      agentName,
      1,
      256,
    );
    _s.validateStringPattern(
      'agentName',
      agentName,
      r'''^[a-zA-Z0-9\s+=._:@/-]+$''',
    );
    _s.validateStringPattern(
      'vpcEndpointId',
      vpcEndpointId,
      r'''^vpce-[0-9a-f]{17}$''',
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
      payload: CreateAgentRequest(
        activationKey: activationKey,
        agentName: agentName,
        securityGroupArns: securityGroupArns,
        subnetArns: subnetArns,
        tags: tags,
        vpcEndpointId: vpcEndpointId,
      ),
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
  /// example <code>/path/to/folder</code>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents a tag that you want to add to the
  /// resource. The value can be an empty string. This value helps you manage,
  /// filter, and search for your resources. We recommend that you create a name
  /// tag for your location.
  Future<CreateLocationEfsResponse> createLocationEfs({
    @_s.required Ec2Config ec2Config,
    @_s.required String efsFilesystemArn,
    String subdirectory,
    List<TagListEntry> tags,
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
    _s.validateStringPattern(
      'efsFilesystemArn',
      efsFilesystemArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):elasticfilesystem:[a-z\-0-9]*:[0-9]{12}:file-system/fs-.*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    _s.validateStringPattern(
      'subdirectory',
      subdirectory,
      r'''^[a-zA-Z0-9_\-\+\./\(\)\p{Zs}]*$''',
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
      payload: CreateLocationEfsRequest(
        ec2Config: ec2Config,
        efsFilesystemArn: efsFilesystemArn,
        subdirectory: subdirectory,
        tags: tags,
      ),
    );

    return CreateLocationEfsResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for an Amazon FSx for Windows file system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [fsxFilesystemArn] :
  /// The Amazon Resource Name (ARN) for the FSx for Windows file system.
  ///
  /// Parameter [password] :
  /// The password of the user who has the permissions to access files and
  /// folders in the FSx for Windows file system.
  ///
  /// Parameter [securityGroupArns] :
  /// The Amazon Resource Names (ARNs) of the security groups that are to use to
  /// configure the FSx for Windows file system.
  ///
  /// Parameter [user] :
  /// The user who has the permissions to access files and folders in the FSx
  /// for Windows file system.
  ///
  /// Parameter [domain] :
  /// The name of the Windows domain that the FSx for Windows server belongs to.
  ///
  /// Parameter [subdirectory] :
  /// A subdirectory in the location’s path. This subdirectory in the Amazon FSx
  /// for Windows file system is used to read data from the Amazon FSx for
  /// Windows source location or write data to the FSx for Windows destination.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents a tag that you want to add to the
  /// resource. The value can be an empty string. This value helps you manage,
  /// filter, and search for your resources. We recommend that you create a name
  /// tag for your location.
  Future<CreateLocationFsxWindowsResponse> createLocationFsxWindows({
    @_s.required String fsxFilesystemArn,
    @_s.required String password,
    @_s.required List<String> securityGroupArns,
    @_s.required String user,
    String domain,
    String subdirectory,
    List<TagListEntry> tags,
  }) async {
    ArgumentError.checkNotNull(fsxFilesystemArn, 'fsxFilesystemArn');
    _s.validateStringLength(
      'fsxFilesystemArn',
      fsxFilesystemArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fsxFilesystemArn',
      fsxFilesystemArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):fsx:[a-z\-0-9]*:[0-9]{12}:file-system/fs-.*$''',
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
    _s.validateStringPattern(
      'password',
      password,
      r'''^.{0,104}$''',
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
    _s.validateStringPattern(
      'user',
      user,
      r'''^[^\x5B\x5D\\/:;|=,+*?]{1,104}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'domain',
      domain,
      0,
      253,
    );
    _s.validateStringPattern(
      'domain',
      domain,
      r'''^([A-Za-z0-9]+[A-Za-z0-9-.]*)*[A-Za-z0-9-]*[A-Za-z0-9]$''',
    );
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    _s.validateStringPattern(
      'subdirectory',
      subdirectory,
      r'''^[a-zA-Z0-9_\-\+\./\(\)\$\p{Zs}]+$''',
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
      payload: CreateLocationFsxWindowsRequest(
        fsxFilesystemArn: fsxFilesystemArn,
        password: password,
        securityGroupArns: securityGroupArns,
        user: user,
        domain: domain,
        subdirectory: subdirectory,
        tags: tags,
      ),
    );

    return CreateLocationFsxWindowsResponse.fromJson(jsonResponse.body);
  }

  /// Defines a file system on a Network File System (NFS) server that can be
  /// read from or written to
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [onPremConfig] :
  /// Contains a list of Amazon Resource Names (ARNs) of agents that are used to
  /// connect to an NFS server.
  ///
  /// Parameter [serverHostname] :
  /// The name of the NFS server. This value is the IP address or Domain Name
  /// Service (DNS) name of the NFS server. An agent that is installed
  /// on-premises uses this host name to mount the NFS server in a network.
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
  /// To see all the paths exported by your NFS server. run "<code>showmount -e
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
    @_s.required OnPremConfig onPremConfig,
    @_s.required String serverHostname,
    @_s.required String subdirectory,
    NfsMountOptions mountOptions,
    List<TagListEntry> tags,
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
    _s.validateStringPattern(
      'serverHostname',
      serverHostname,
      r'''^(([a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9\-]*[A-Za-z0-9])$''',
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
    _s.validateStringPattern(
      'subdirectory',
      subdirectory,
      r'''^[a-zA-Z0-9_\-\+\./\(\)\p{Zs}]+$''',
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
      payload: CreateLocationNfsRequest(
        onPremConfig: onPremConfig,
        serverHostname: serverHostname,
        subdirectory: subdirectory,
        mountOptions: mountOptions,
        tags: tags,
      ),
    );

    return CreateLocationNfsResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for an Amazon S3 bucket.
  ///
  /// For AWS DataSync to access a destination S3 bucket, it needs an AWS
  /// Identity and Access Management (IAM) role that has the required
  /// permissions. You can set up the required permissions by creating an IAM
  /// policy that grants the required permissions and attaching the policy to
  /// the role. An example of such a policy is shown in the examples section.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/datasync/latest/userguide/working-with-locations.html#create-s3-location
  /// in the <i>AWS DataSync User Guide.</i>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3BucketArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket.
  ///
  /// Parameter [s3StorageClass] :
  /// The Amazon S3 storage class that you want to store your files in when this
  /// location is used as a task destination. For more information about S3
  /// storage classes, see <a
  /// href="https://aws.amazon.com/s3/storage-classes/">Amazon S3 Storage
  /// Classes</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.
  /// Some storage classes have behaviors that can affect your S3 storage cost.
  /// For detailed information, see <a>using-storage-classes</a>.
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
    @_s.required String s3BucketArn,
    @_s.required S3Config s3Config,
    S3StorageClass s3StorageClass,
    String subdirectory,
    List<TagListEntry> tags,
  }) async {
    ArgumentError.checkNotNull(s3BucketArn, 's3BucketArn');
    _s.validateStringLength(
      's3BucketArn',
      s3BucketArn,
      0,
      76,
      isRequired: true,
    );
    _s.validateStringPattern(
      's3BucketArn',
      s3BucketArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):s3:::([^/]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(s3Config, 's3Config');
    _s.validateStringLength(
      'subdirectory',
      subdirectory,
      0,
      4096,
    );
    _s.validateStringPattern(
      'subdirectory',
      subdirectory,
      r'''^[a-zA-Z0-9_\-\+\./\(\)\p{Zs}]*$''',
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
      payload: CreateLocationS3Request(
        s3BucketArn: s3BucketArn,
        s3Config: s3Config,
        s3StorageClass: s3StorageClass,
        subdirectory: subdirectory,
        tags: tags,
      ),
    );

    return CreateLocationS3Response.fromJson(jsonResponse.body);
  }

  /// Defines a file system on an Server Message Block (SMB) server that can be
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
  /// example <code>/path/to/folder</code>.
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
    @_s.required List<String> agentArns,
    @_s.required String password,
    @_s.required String serverHostname,
    @_s.required String subdirectory,
    @_s.required String user,
    String domain,
    SmbMountOptions mountOptions,
    List<TagListEntry> tags,
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
    _s.validateStringPattern(
      'password',
      password,
      r'''^.{0,104}$''',
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
    _s.validateStringPattern(
      'serverHostname',
      serverHostname,
      r'''^(([a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9\-]*[A-Za-z0-9])$''',
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
    _s.validateStringPattern(
      'subdirectory',
      subdirectory,
      r'''^[a-zA-Z0-9_\-\+\./\(\)\$\p{Zs}]+$''',
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
    _s.validateStringPattern(
      'user',
      user,
      r'''^[^\x5B\x5D\\/:;|=,+*?]{1,104}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'domain',
      domain,
      0,
      253,
    );
    _s.validateStringPattern(
      'domain',
      domain,
      r'''^([A-Za-z0-9]+[A-Za-z0-9-.]*)*[A-Za-z0-9-]*[A-Za-z0-9]$''',
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
      payload: CreateLocationSmbRequest(
        agentArns: agentArns,
        password: password,
        serverHostname: serverHostname,
        subdirectory: subdirectory,
        user: user,
        domain: domain,
        mountOptions: mountOptions,
        tags: tags,
      ),
    );

    return CreateLocationSmbResponse.fromJson(jsonResponse.body);
  }

  /// Creates a task. A task is a set of two locations (source and destination)
  /// and a set of Options that you use to control the behavior of a task. If
  /// you don't specify Options when you create a task, AWS DataSync populates
  /// them with service defaults.
  ///
  /// When you create a task, it first enters the CREATING state. During
  /// CREATING AWS DataSync attempts to mount the on-premises Network File
  /// System (NFS) location. The task transitions to the AVAILABLE state without
  /// waiting for the AWS location to become mounted. If required, AWS DataSync
  /// mounts the AWS location before each task execution.
  ///
  /// If an agent that is associated with a source (NFS) location goes offline,
  /// the task transitions to the UNAVAILABLE status. If the status of the task
  /// remains in the CREATING status for more than a few minutes, it means that
  /// your agent might be having trouble mounting the source NFS file system.
  /// Check the task's ErrorCode and ErrorDetail. Mount issues are often caused
  /// by either a misconfigured firewall or a mistyped NFS server host name.
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
  /// For more information on these groups, see Working with Log Groups and Log
  /// Streams in the <i>Amazon CloudWatch User Guide.</i>
  ///
  /// For more information about how to use CloudWatch Logs with DataSync, see
  /// Monitoring Your Task in the <i>AWS DataSync User Guide.</i>
  ///
  /// Parameter [excludes] :
  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the
  /// patterns to exclude. The patterns are delimited by "|" (that is, a pipe),
  /// for example, <code>"/folder1|/folder2"</code>
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
  /// specifying the <code>OverrideOptions</code> before starting a the task
  /// execution. For more information, see the operation.
  ///
  /// Parameter [schedule] :
  /// Specifies a schedule used to periodically transfer files from a source to
  /// a destination location. The schedule should be specified in UTC time. For
  /// more information, see <a>task-scheduling</a>.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents the tag that you want to add to the
  /// resource. The value can be an empty string.
  Future<CreateTaskResponse> createTask({
    @_s.required String destinationLocationArn,
    @_s.required String sourceLocationArn,
    String cloudWatchLogGroupArn,
    List<FilterRule> excludes,
    String name,
    Options options,
    TaskSchedule schedule,
    List<TagListEntry> tags,
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
    _s.validateStringPattern(
      'destinationLocationArn',
      destinationLocationArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$''',
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
    _s.validateStringPattern(
      'sourceLocationArn',
      sourceLocationArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'cloudWatchLogGroupArn',
      cloudWatchLogGroupArn,
      0,
      562,
    );
    _s.validateStringPattern(
      'cloudWatchLogGroupArn',
      cloudWatchLogGroupArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):logs:[a-z\-0-9]*:[0-9]{12}:log-group:([^:\*]*)$''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9\s+=._:@/-]+$''',
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
      payload: CreateTaskRequest(
        destinationLocationArn: destinationLocationArn,
        sourceLocationArn: sourceLocationArn,
        cloudWatchLogGroupArn: cloudWatchLogGroupArn,
        excludes: excludes,
        name: name,
        options: options,
        schedule: schedule,
        tags: tags,
      ),
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
    @_s.required String agentArn,
  }) async {
    ArgumentError.checkNotNull(agentArn, 'agentArn');
    _s.validateStringLength(
      'agentArn',
      agentArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'agentArn',
      agentArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:agent/agent-[0-9a-z]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DeleteAgent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteAgentRequest(
        agentArn: agentArn,
      ),
    );

    return DeleteAgentResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the configuration of a location used by AWS DataSync.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the location to delete.
  Future<void> deleteLocation({
    @_s.required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'locationArn',
      locationArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DeleteLocation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteLocationRequest(
        locationArn: locationArn,
      ),
    );

    return DeleteLocationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskArn] :
  /// The Amazon Resource Name (ARN) of the task to delete.
  Future<void> deleteTask({
    @_s.required String taskArn,
  }) async {
    ArgumentError.checkNotNull(taskArn, 'taskArn');
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskArn',
      taskArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]*:[0-9]{12}:task/task-[0-9a-f]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DeleteTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteTaskRequest(
        taskArn: taskArn,
      ),
    );

    return DeleteTaskResponse.fromJson(jsonResponse.body);
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
    @_s.required String agentArn,
  }) async {
    ArgumentError.checkNotNull(agentArn, 'agentArn');
    _s.validateStringLength(
      'agentArn',
      agentArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'agentArn',
      agentArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:agent/agent-[0-9a-z]{17}$''',
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
      payload: DescribeAgentRequest(
        agentArn: agentArn,
      ),
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
    @_s.required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'locationArn',
      locationArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$''',
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
      payload: DescribeLocationEfsRequest(
        locationArn: locationArn,
      ),
    );

    return DescribeLocationEfsResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata, such as the path information about an Amazon FSx for
  /// Windows location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the FSx for Windows location to
  /// describe.
  Future<DescribeLocationFsxWindowsResponse> describeLocationFsxWindows({
    @_s.required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'locationArn',
      locationArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$''',
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
      payload: DescribeLocationFsxWindowsRequest(
        locationArn: locationArn,
      ),
    );

    return DescribeLocationFsxWindowsResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata, such as the path information, about a NFS location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon resource Name (ARN) of the NFS location to describe.
  Future<DescribeLocationNfsResponse> describeLocationNfs({
    @_s.required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'locationArn',
      locationArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$''',
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
      payload: DescribeLocationNfsRequest(
        locationArn: locationArn,
      ),
    );

    return DescribeLocationNfsResponse.fromJson(jsonResponse.body);
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
    @_s.required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'locationArn',
      locationArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$''',
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
      payload: DescribeLocationS3Request(
        locationArn: locationArn,
      ),
    );

    return DescribeLocationS3Response.fromJson(jsonResponse.body);
  }

  /// Returns metadata, such as the path and user information about a SMB
  /// location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon resource Name (ARN) of the SMB location to describe.
  Future<DescribeLocationSmbResponse> describeLocationSmb({
    @_s.required String locationArn,
  }) async {
    ArgumentError.checkNotNull(locationArn, 'locationArn');
    _s.validateStringLength(
      'locationArn',
      locationArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'locationArn',
      locationArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$''',
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
      payload: DescribeLocationSmbRequest(
        locationArn: locationArn,
      ),
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
    @_s.required String taskArn,
  }) async {
    ArgumentError.checkNotNull(taskArn, 'taskArn');
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskArn',
      taskArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]*:[0-9]{12}:task/task-[0-9a-f]{17}$''',
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
      payload: DescribeTaskRequest(
        taskArn: taskArn,
      ),
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
    @_s.required String taskExecutionArn,
  }) async {
    ArgumentError.checkNotNull(taskExecutionArn, 'taskExecutionArn');
    _s.validateStringLength(
      'taskExecutionArn',
      taskExecutionArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskExecutionArn',
      taskExecutionArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]*:[0-9]{12}:task/task-[0-9a-f]{17}/execution/exec-[0-9a-f]{17}$''',
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
      payload: DescribeTaskExecutionRequest(
        taskExecutionArn: taskExecutionArn,
      ),
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=_-]+''',
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
      payload: ListAgentsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return ListAgentsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a lists of source and destination locations.
  ///
  /// If you have more locations than are returned in a response (that is, the
  /// response returns only a truncated list of your agents), the response
  /// contains a token that you can specify in your next request to fetch the
  /// next page of locations.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of locations to return.
  ///
  /// Parameter [nextToken] :
  /// An opaque string that indicates the position at which to begin the next
  /// list of locations.
  Future<ListLocationsResponse> listLocations({
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=_-]+''',
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
      payload: ListLocationsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return ListLocationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns all the tags associated with a specified resources.
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
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:(agent|task|location)/(agent|task|loc)-[0-9a-z]{17}$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=_-]+''',
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
      payload: ListTagsForResourceRequest(
        resourceArn: resourceArn,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
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
    int maxResults,
    String nextToken,
    String taskArn,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=_-]+''',
    );
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
    );
    _s.validateStringPattern(
      'taskArn',
      taskArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]*:[0-9]{12}:task/task-[0-9a-f]{17}$''',
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
      payload: ListTaskExecutionsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
        taskArn: taskArn,
      ),
    );

    return ListTaskExecutionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all the tasks.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tasks to return.
  ///
  /// Parameter [nextToken] :
  /// An opaque string that indicates the position at which to begin the next
  /// list of tasks.
  Future<ListTasksResponse> listTasks({
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=_-]+''',
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
      payload: ListTasksRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
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
    @_s.required String taskArn,
    List<FilterRule> includes,
    Options overrideOptions,
  }) async {
    ArgumentError.checkNotNull(taskArn, 'taskArn');
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskArn',
      taskArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]*:[0-9]{12}:task/task-[0-9a-f]{17}$''',
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
      payload: StartTaskExecutionRequest(
        taskArn: taskArn,
        includes: includes,
        overrideOptions: overrideOptions,
      ),
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
    @_s.required String resourceArn,
    @_s.required List<TagListEntry> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:(agent|task|location)/(agent|task|loc)-[0-9a-z]{17}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: TagResourceRequest(
        resourceArn: resourceArn,
        tags: tags,
      ),
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required List<String> keys,
    @_s.required String resourceArn,
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
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:(agent|task|location)/(agent|task|loc)-[0-9a-z]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UntagResourceRequest(
        keys: keys,
        resourceArn: resourceArn,
      ),
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String agentArn,
    String name,
  }) async {
    ArgumentError.checkNotNull(agentArn, 'agentArn');
    _s.validateStringLength(
      'agentArn',
      agentArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'agentArn',
      agentArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:agent/agent-[0-9a-z]{17}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9\s+=._:@/-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateAgent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateAgentRequest(
        agentArn: agentArn,
        name: name,
      ),
    );

    return UpdateAgentResponse.fromJson(jsonResponse.body);
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
  /// For more information, see <a>task-scheduling</a>.
  Future<void> updateTask({
    @_s.required String taskArn,
    String cloudWatchLogGroupArn,
    List<FilterRule> excludes,
    String name,
    Options options,
    TaskSchedule schedule,
  }) async {
    ArgumentError.checkNotNull(taskArn, 'taskArn');
    _s.validateStringLength(
      'taskArn',
      taskArn,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskArn',
      taskArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]*:[0-9]{12}:task/task-[0-9a-f]{17}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'cloudWatchLogGroupArn',
      cloudWatchLogGroupArn,
      0,
      562,
    );
    _s.validateStringPattern(
      'cloudWatchLogGroupArn',
      cloudWatchLogGroupArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):logs:[a-z\-0-9]*:[0-9]{12}:log-group:([^:\*]*)$''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9\s+=._:@/-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateTaskRequest(
        taskArn: taskArn,
        cloudWatchLogGroupArn: cloudWatchLogGroupArn,
        excludes: excludes,
        name: name,
        options: options,
        schedule: schedule,
      ),
    );

    return UpdateTaskResponse.fromJson(jsonResponse.body);
  }
}

/// Represents a single entry in a list of agents. <code>AgentListEntry</code>
/// returns an array that contains a list of agents when the <a>ListAgents</a>
/// operation is called.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AgentListEntry {
  /// The Amazon Resource Name (ARN) of the agent.
  @_s.JsonKey(name: 'AgentArn')
  final String agentArn;

  /// The name of the agent.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The status of the agent.
  @_s.JsonKey(name: 'Status')
  final AgentStatus status;

  AgentListEntry({
    this.agentArn,
    this.name,
    this.status,
  });
  factory AgentListEntry.fromJson(Map<String, dynamic> json) =>
      _$AgentListEntryFromJson(json);
}

enum AgentStatus {
  @_s.JsonValue('ONLINE')
  online,
  @_s.JsonValue('OFFLINE')
  offline,
}

enum Atime {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('BEST_EFFORT')
  bestEffort,
}

/// CancelTaskExecutionRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CancelTaskExecutionRequest {
  /// The Amazon Resource Name (ARN) of the task execution to cancel.
  @_s.JsonKey(name: 'TaskExecutionArn')
  final String taskExecutionArn;

  CancelTaskExecutionRequest({
    @_s.required this.taskExecutionArn,
  });
  Map<String, dynamic> toJson() => _$CancelTaskExecutionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelTaskExecutionResponse {
  CancelTaskExecutionResponse();
  factory CancelTaskExecutionResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelTaskExecutionResponseFromJson(json);
}

/// CreateAgentRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateAgentRequest {
  /// Your agent activation key. You can get the activation key either by sending
  /// an HTTP GET request with redirects that enable you to get the agent IP
  /// address (port 80). Alternatively, you can get it from the AWS DataSync
  /// console.
  ///
  /// The redirect URL returned in the response provides you the activation key
  /// for your agent in the query string parameter <code>activationKey</code>. It
  /// might also include other activation-related parameters; however, these are
  /// merely defaults. The arguments you pass to this API call determine the
  /// actual configuration of your agent.
  ///
  /// For more information, see Activating an Agent in the <i>AWS DataSync User
  /// Guide.</i>
  @_s.JsonKey(name: 'ActivationKey')
  final String activationKey;

  /// The name you configured for your agent. This value is a text reference that
  /// is used to identify the agent in the console.
  @_s.JsonKey(name: 'AgentName')
  final String agentName;

  /// The ARNs of the security groups used to protect your data transfer task
  /// subnets. See <a>CreateAgentRequest$SubnetArns</a>.
  @_s.JsonKey(name: 'SecurityGroupArns')
  final List<String> securityGroupArns;

  /// The Amazon Resource Names (ARNs) of the subnets in which DataSync will
  /// create elastic network interfaces for each data transfer task. The agent
  /// that runs a task must be private. When you start a task that is associated
  /// with an agent created in a VPC, or one that has access to an IP address in a
  /// VPC, then the task is also private. In this case, DataSync creates four
  /// network interfaces for each task in your subnet. For a data transfer to
  /// work, the agent must be able to route to all these four network interfaces.
  @_s.JsonKey(name: 'SubnetArns')
  final List<String> subnetArns;

  /// The key-value pair that represents the tag that you want to associate with
  /// the agent. The value can be an empty string. This value helps you manage,
  /// filter, and search for your agents.
  /// <note>
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - = .
  /// _ : / @.
  /// </note>
  @_s.JsonKey(name: 'Tags')
  final List<TagListEntry> tags;

  /// The ID of the VPC (Virtual Private Cloud) endpoint that the agent has access
  /// to. This is the client-side VPC endpoint, also called a PrivateLink. If you
  /// don't have a PrivateLink VPC endpoint, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html#create-endpoint-service">Creating
  /// a VPC Endpoint Service Configuration</a> in the AWS VPC User Guide.
  ///
  /// VPC endpoint ID looks like this: <code>vpce-01234d5aff67890e1</code>.
  @_s.JsonKey(name: 'VpcEndpointId')
  final String vpcEndpointId;

  CreateAgentRequest({
    @_s.required this.activationKey,
    this.agentName,
    this.securityGroupArns,
    this.subnetArns,
    this.tags,
    this.vpcEndpointId,
  });
  Map<String, dynamic> toJson() => _$CreateAgentRequestToJson(this);
}

/// CreateAgentResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAgentResponse {
  /// The Amazon Resource Name (ARN) of the agent. Use the <code>ListAgents</code>
  /// operation to return a list of agents for your account and AWS Region.
  @_s.JsonKey(name: 'AgentArn')
  final String agentArn;

  CreateAgentResponse({
    this.agentArn,
  });
  factory CreateAgentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAgentResponseFromJson(json);
}

/// CreateLocationEfsRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateLocationEfsRequest {
  /// The subnet and security group that the Amazon EFS file system uses. The
  /// security group that you provide needs to be able to communicate with the
  /// security group on the mount target in the subnet specified.
  ///
  /// The exact relationship between security group M (of the mount target) and
  /// security group S (which you provide for DataSync to use at this stage) is as
  /// follows:
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
  /// For information about security groups and mount targets, see Security Groups
  /// for Amazon EC2 Instances and Mount Targets in the <i>Amazon EFS User
  /// Guide.</i>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Ec2Config')
  final Ec2Config ec2Config;

  /// The Amazon Resource Name (ARN) for the Amazon EFS file system.
  @_s.JsonKey(name: 'EfsFilesystemArn')
  final String efsFilesystemArn;

  /// A subdirectory in the location’s path. This subdirectory in the EFS file
  /// system is used to read data from the EFS source location or write data to
  /// the EFS destination. By default, AWS DataSync uses the root directory.
  /// <note>
  /// <code>Subdirectory</code> must be specified with forward slashes. For
  /// example <code>/path/to/folder</code>.
  /// </note>
  @_s.JsonKey(name: 'Subdirectory')
  final String subdirectory;

  /// The key-value pair that represents a tag that you want to add to the
  /// resource. The value can be an empty string. This value helps you manage,
  /// filter, and search for your resources. We recommend that you create a name
  /// tag for your location.
  @_s.JsonKey(name: 'Tags')
  final List<TagListEntry> tags;

  CreateLocationEfsRequest({
    @_s.required this.ec2Config,
    @_s.required this.efsFilesystemArn,
    this.subdirectory,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateLocationEfsRequestToJson(this);
}

/// CreateLocationEfs
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLocationEfsResponse {
  /// The Amazon Resource Name (ARN) of the Amazon EFS file system location that
  /// is created.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  CreateLocationEfsResponse({
    this.locationArn,
  });
  factory CreateLocationEfsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLocationEfsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateLocationFsxWindowsRequest {
  /// The Amazon Resource Name (ARN) for the FSx for Windows file system.
  @_s.JsonKey(name: 'FsxFilesystemArn')
  final String fsxFilesystemArn;

  /// The password of the user who has the permissions to access files and folders
  /// in the FSx for Windows file system.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The Amazon Resource Names (ARNs) of the security groups that are to use to
  /// configure the FSx for Windows file system.
  @_s.JsonKey(name: 'SecurityGroupArns')
  final List<String> securityGroupArns;

  /// The user who has the permissions to access files and folders in the FSx for
  /// Windows file system.
  @_s.JsonKey(name: 'User')
  final String user;

  /// The name of the Windows domain that the FSx for Windows server belongs to.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// A subdirectory in the location’s path. This subdirectory in the Amazon FSx
  /// for Windows file system is used to read data from the Amazon FSx for Windows
  /// source location or write data to the FSx for Windows destination.
  @_s.JsonKey(name: 'Subdirectory')
  final String subdirectory;

  /// The key-value pair that represents a tag that you want to add to the
  /// resource. The value can be an empty string. This value helps you manage,
  /// filter, and search for your resources. We recommend that you create a name
  /// tag for your location.
  @_s.JsonKey(name: 'Tags')
  final List<TagListEntry> tags;

  CreateLocationFsxWindowsRequest({
    @_s.required this.fsxFilesystemArn,
    @_s.required this.password,
    @_s.required this.securityGroupArns,
    @_s.required this.user,
    this.domain,
    this.subdirectory,
    this.tags,
  });
  Map<String, dynamic> toJson() =>
      _$CreateLocationFsxWindowsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLocationFsxWindowsResponse {
  /// The Amazon Resource Name (ARN) of the FSx for Windows file system location
  /// that is created.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  CreateLocationFsxWindowsResponse({
    this.locationArn,
  });
  factory CreateLocationFsxWindowsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateLocationFsxWindowsResponseFromJson(json);
}

/// CreateLocationNfsRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateLocationNfsRequest {
  /// Contains a list of Amazon Resource Names (ARNs) of agents that are used to
  /// connect to an NFS server.
  @_s.JsonKey(name: 'OnPremConfig')
  final OnPremConfig onPremConfig;

  /// The name of the NFS server. This value is the IP address or Domain Name
  /// Service (DNS) name of the NFS server. An agent that is installed on-premises
  /// uses this host name to mount the NFS server in a network.
  /// <note>
  /// This name must either be DNS-compliant or must be an IP version 4 (IPv4)
  /// address.
  /// </note>
  @_s.JsonKey(name: 'ServerHostname')
  final String serverHostname;

  /// The subdirectory in the NFS file system that is used to read data from the
  /// NFS source location or write data to the NFS destination. The NFS path
  /// should be a path that's exported by the NFS server, or a subdirectory of
  /// that path. The path should be such that it can be mounted by other NFS
  /// clients in your network.
  ///
  /// To see all the paths exported by your NFS server. run "<code>showmount -e
  /// nfs-server-name</code>" from an NFS client that has access to your server.
  /// You can specify any directory that appears in the results, and any
  /// subdirectory of that directory. Ensure that the NFS export is accessible
  /// without Kerberos authentication.
  ///
  /// To transfer all the data in the folder you specified, DataSync needs to have
  /// permissions to read all the data. To ensure this, either configure the NFS
  /// export with <code>no_root_squash,</code> or ensure that the permissions for
  /// all of the files that you want DataSync allow read access for all users.
  /// Doing either enables the agent to read the files. For the agent to access
  /// directories, you must additionally enable all execute access.
  ///
  /// For information about NFS export configuration, see 18.7. The /etc/exports
  /// Configuration File in the Red Hat Enterprise Linux documentation.
  @_s.JsonKey(name: 'Subdirectory')
  final String subdirectory;

  /// The NFS mount options that DataSync can use to mount your NFS share.
  @_s.JsonKey(name: 'MountOptions')
  final NfsMountOptions mountOptions;

  /// The key-value pair that represents the tag that you want to add to the
  /// location. The value can be an empty string. We recommend using tags to name
  /// your resources.
  @_s.JsonKey(name: 'Tags')
  final List<TagListEntry> tags;

  CreateLocationNfsRequest({
    @_s.required this.onPremConfig,
    @_s.required this.serverHostname,
    @_s.required this.subdirectory,
    this.mountOptions,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateLocationNfsRequestToJson(this);
}

/// CreateLocationNfsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLocationNfsResponse {
  /// The Amazon Resource Name (ARN) of the source NFS file system location that
  /// is created.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  CreateLocationNfsResponse({
    this.locationArn,
  });
  factory CreateLocationNfsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLocationNfsResponseFromJson(json);
}

/// CreateLocationS3Request
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateLocationS3Request {
  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket.
  @_s.JsonKey(name: 'S3BucketArn')
  final String s3BucketArn;
  @_s.JsonKey(name: 'S3Config')
  final S3Config s3Config;

  /// The Amazon S3 storage class that you want to store your files in when this
  /// location is used as a task destination. For more information about S3
  /// storage classes, see <a
  /// href="https://aws.amazon.com/s3/storage-classes/">Amazon S3 Storage
  /// Classes</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.
  /// Some storage classes have behaviors that can affect your S3 storage cost.
  /// For detailed information, see <a>using-storage-classes</a>.
  @_s.JsonKey(name: 'S3StorageClass')
  final S3StorageClass s3StorageClass;

  /// A subdirectory in the Amazon S3 bucket. This subdirectory in Amazon S3 is
  /// used to read data from the S3 source location or write data to the S3
  /// destination.
  @_s.JsonKey(name: 'Subdirectory')
  final String subdirectory;

  /// The key-value pair that represents the tag that you want to add to the
  /// location. The value can be an empty string. We recommend using tags to name
  /// your resources.
  @_s.JsonKey(name: 'Tags')
  final List<TagListEntry> tags;

  CreateLocationS3Request({
    @_s.required this.s3BucketArn,
    @_s.required this.s3Config,
    this.s3StorageClass,
    this.subdirectory,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateLocationS3RequestToJson(this);
}

/// CreateLocationS3Response
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLocationS3Response {
  /// The Amazon Resource Name (ARN) of the source Amazon S3 bucket location that
  /// is created.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  CreateLocationS3Response({
    this.locationArn,
  });
  factory CreateLocationS3Response.fromJson(Map<String, dynamic> json) =>
      _$CreateLocationS3ResponseFromJson(json);
}

/// CreateLocationSmbRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateLocationSmbRequest {
  /// The Amazon Resource Names (ARNs) of agents to use for a Simple Message Block
  /// (SMB) location.
  @_s.JsonKey(name: 'AgentArns')
  final List<String> agentArns;

  /// The password of the user who can mount the share, has the permissions to
  /// access files and folders in the SMB share.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The name of the SMB server. This value is the IP address or Domain Name
  /// Service (DNS) name of the SMB server. An agent that is installed on-premises
  /// uses this hostname to mount the SMB server in a network.
  /// <note>
  /// This name must either be DNS-compliant or must be an IP version 4 (IPv4)
  /// address.
  /// </note>
  @_s.JsonKey(name: 'ServerHostname')
  final String serverHostname;

  /// The subdirectory in the SMB file system that is used to read data from the
  /// SMB source location or write data to the SMB destination. The SMB path
  /// should be a path that's exported by the SMB server, or a subdirectory of
  /// that path. The path should be such that it can be mounted by other SMB
  /// clients in your network.
  /// <note>
  /// <code>Subdirectory</code> must be specified with forward slashes. For
  /// example <code>/path/to/folder</code>.
  /// </note>
  /// To transfer all the data in the folder you specified, DataSync needs to have
  /// permissions to mount the SMB share, as well as to access all the data in
  /// that share. To ensure this, either ensure that the user/password specified
  /// belongs to the user who can mount the share, and who has the appropriate
  /// permissions for all of the files and directories that you want DataSync to
  /// access, or use credentials of a member of the Backup Operators group to
  /// mount the share. Doing either enables the agent to access the data. For the
  /// agent to access directories, you must additionally enable all execute
  /// access.
  @_s.JsonKey(name: 'Subdirectory')
  final String subdirectory;

  /// The user who can mount the share, has the permissions to access files and
  /// folders in the SMB share.
  @_s.JsonKey(name: 'User')
  final String user;

  /// The name of the Windows domain that the SMB server belongs to.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// The mount options used by DataSync to access the SMB server.
  @_s.JsonKey(name: 'MountOptions')
  final SmbMountOptions mountOptions;

  /// The key-value pair that represents the tag that you want to add to the
  /// location. The value can be an empty string. We recommend using tags to name
  /// your resources.
  @_s.JsonKey(name: 'Tags')
  final List<TagListEntry> tags;

  CreateLocationSmbRequest({
    @_s.required this.agentArns,
    @_s.required this.password,
    @_s.required this.serverHostname,
    @_s.required this.subdirectory,
    @_s.required this.user,
    this.domain,
    this.mountOptions,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateLocationSmbRequestToJson(this);
}

/// CreateLocationSmbResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLocationSmbResponse {
  /// The Amazon Resource Name (ARN) of the source SMB file system location that
  /// is created.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  CreateLocationSmbResponse({
    this.locationArn,
  });
  factory CreateLocationSmbResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLocationSmbResponseFromJson(json);
}

/// CreateTaskRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateTaskRequest {
  /// The Amazon Resource Name (ARN) of an AWS storage resource's location.
  @_s.JsonKey(name: 'DestinationLocationArn')
  final String destinationLocationArn;

  /// The Amazon Resource Name (ARN) of the source location for the task.
  @_s.JsonKey(name: 'SourceLocationArn')
  final String sourceLocationArn;

  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that is
  /// used to monitor and log events in the task.
  ///
  /// For more information on these groups, see Working with Log Groups and Log
  /// Streams in the <i>Amazon CloudWatch User Guide.</i>
  ///
  /// For more information about how to use CloudWatch Logs with DataSync, see
  /// Monitoring Your Task in the <i>AWS DataSync User Guide.</i>
  @_s.JsonKey(name: 'CloudWatchLogGroupArn')
  final String cloudWatchLogGroupArn;

  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the patterns
  /// to exclude. The patterns are delimited by "|" (that is, a pipe), for
  /// example, <code>"/folder1|/folder2"</code>
  ///
  ///
  @_s.JsonKey(name: 'Excludes')
  final List<FilterRule> excludes;

  /// The name of a task. This value is a text reference that is used to identify
  /// the task in the console.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The set of configuration options that control the behavior of a single
  /// execution of the task that occurs when you call
  /// <code>StartTaskExecution</code>. You can configure these options to preserve
  /// metadata such as user ID (UID) and group ID (GID), file permissions, data
  /// integrity verification, and so on.
  ///
  /// For each individual task execution, you can override these options by
  /// specifying the <code>OverrideOptions</code> before starting a the task
  /// execution. For more information, see the operation.
  @_s.JsonKey(name: 'Options')
  final Options options;

  /// Specifies a schedule used to periodically transfer files from a source to a
  /// destination location. The schedule should be specified in UTC time. For more
  /// information, see <a>task-scheduling</a>.
  @_s.JsonKey(name: 'Schedule')
  final TaskSchedule schedule;

  /// The key-value pair that represents the tag that you want to add to the
  /// resource. The value can be an empty string.
  @_s.JsonKey(name: 'Tags')
  final List<TagListEntry> tags;

  CreateTaskRequest({
    @_s.required this.destinationLocationArn,
    @_s.required this.sourceLocationArn,
    this.cloudWatchLogGroupArn,
    this.excludes,
    this.name,
    this.options,
    this.schedule,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateTaskRequestToJson(this);
}

/// CreateTaskResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTaskResponse {
  /// The Amazon Resource Name (ARN) of the task.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  CreateTaskResponse({
    this.taskArn,
  });
  factory CreateTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskResponseFromJson(json);
}

/// DeleteAgentRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteAgentRequest {
  /// The Amazon Resource Name (ARN) of the agent to delete. Use the
  /// <code>ListAgents</code> operation to return a list of agents for your
  /// account and AWS Region.
  @_s.JsonKey(name: 'AgentArn')
  final String agentArn;

  DeleteAgentRequest({
    @_s.required this.agentArn,
  });
  Map<String, dynamic> toJson() => _$DeleteAgentRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAgentResponse {
  DeleteAgentResponse();
  factory DeleteAgentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAgentResponseFromJson(json);
}

/// DeleteLocation
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteLocationRequest {
  /// The Amazon Resource Name (ARN) of the location to delete.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  DeleteLocationRequest({
    @_s.required this.locationArn,
  });
  Map<String, dynamic> toJson() => _$DeleteLocationRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLocationResponse {
  DeleteLocationResponse();
  factory DeleteLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteLocationResponseFromJson(json);
}

/// DeleteTask
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteTaskRequest {
  /// The Amazon Resource Name (ARN) of the task to delete.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  DeleteTaskRequest({
    @_s.required this.taskArn,
  });
  Map<String, dynamic> toJson() => _$DeleteTaskRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTaskResponse {
  DeleteTaskResponse();
  factory DeleteTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTaskResponseFromJson(json);
}

/// DescribeAgent
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeAgentRequest {
  /// The Amazon Resource Name (ARN) of the agent to describe.
  @_s.JsonKey(name: 'AgentArn')
  final String agentArn;

  DescribeAgentRequest({
    @_s.required this.agentArn,
  });
  Map<String, dynamic> toJson() => _$DescribeAgentRequestToJson(this);
}

/// DescribeAgentResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAgentResponse {
  /// The Amazon Resource Name (ARN) of the agent.
  @_s.JsonKey(name: 'AgentArn')
  final String agentArn;

  /// The time that the agent was activated (that is, created in your account).
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The type of endpoint that your agent is connected to. If the endpoint is a
  /// VPC endpoint, the agent is not accessible over the public Internet.
  @_s.JsonKey(name: 'EndpointType')
  final EndpointType endpointType;

  /// The time that the agent last connected to DataSyc.
  @_s.JsonKey(
      name: 'LastConnectionTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastConnectionTime;

  /// The name of the agent.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The subnet and the security group that DataSync used to access a VPC
  /// endpoint.
  @_s.JsonKey(name: 'PrivateLinkConfig')
  final PrivateLinkConfig privateLinkConfig;

  /// The status of the agent. If the status is ONLINE, then the agent is
  /// configured properly and is available to use. The Running status is the
  /// normal running status for an agent. If the status is OFFLINE, the agent's VM
  /// is turned off or the agent is in an unhealthy state. When the issue that
  /// caused the unhealthy state is resolved, the agent returns to ONLINE status.
  @_s.JsonKey(name: 'Status')
  final AgentStatus status;

  DescribeAgentResponse({
    this.agentArn,
    this.creationTime,
    this.endpointType,
    this.lastConnectionTime,
    this.name,
    this.privateLinkConfig,
    this.status,
  });
  factory DescribeAgentResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAgentResponseFromJson(json);
}

/// DescribeLocationEfsRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeLocationEfsRequest {
  /// The Amazon Resource Name (ARN) of the EFS location to describe.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  DescribeLocationEfsRequest({
    @_s.required this.locationArn,
  });
  Map<String, dynamic> toJson() => _$DescribeLocationEfsRequestToJson(this);
}

/// DescribeLocationEfsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLocationEfsResponse {
  /// The time that the EFS location was created.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;
  @_s.JsonKey(name: 'Ec2Config')
  final Ec2Config ec2Config;

  /// The Amazon resource Name (ARN) of the EFS location that was described.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  /// The URL of the EFS location that was described.
  @_s.JsonKey(name: 'LocationUri')
  final String locationUri;

  DescribeLocationEfsResponse({
    this.creationTime,
    this.ec2Config,
    this.locationArn,
    this.locationUri,
  });
  factory DescribeLocationEfsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLocationEfsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeLocationFsxWindowsRequest {
  /// The Amazon Resource Name (ARN) of the FSx for Windows location to describe.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  DescribeLocationFsxWindowsRequest({
    @_s.required this.locationArn,
  });
  Map<String, dynamic> toJson() =>
      _$DescribeLocationFsxWindowsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLocationFsxWindowsResponse {
  /// The time that the FSx for Windows location was created.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The name of the Windows domain that the FSx for Windows server belongs to.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// The Amazon resource Name (ARN) of the FSx for Windows location that was
  /// described.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  /// The URL of the FSx for Windows location that was described.
  @_s.JsonKey(name: 'LocationUri')
  final String locationUri;

  /// The Amazon Resource Names (ARNs) of the security groups that are configured
  /// for the for the FSx for Windows file system.
  @_s.JsonKey(name: 'SecurityGroupArns')
  final List<String> securityGroupArns;

  /// The user who has the permissions to access files and folders in the FSx for
  /// Windows file system.
  @_s.JsonKey(name: 'User')
  final String user;

  DescribeLocationFsxWindowsResponse({
    this.creationTime,
    this.domain,
    this.locationArn,
    this.locationUri,
    this.securityGroupArns,
    this.user,
  });
  factory DescribeLocationFsxWindowsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeLocationFsxWindowsResponseFromJson(json);
}

/// DescribeLocationNfsRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeLocationNfsRequest {
  /// The Amazon resource Name (ARN) of the NFS location to describe.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  DescribeLocationNfsRequest({
    @_s.required this.locationArn,
  });
  Map<String, dynamic> toJson() => _$DescribeLocationNfsRequestToJson(this);
}

/// DescribeLocationNfsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLocationNfsResponse {
  /// The time that the NFS location was created.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The Amazon resource Name (ARN) of the NFS location that was described.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  /// The URL of the source NFS location that was described.
  @_s.JsonKey(name: 'LocationUri')
  final String locationUri;

  /// The NFS mount options that DataSync used to mount your NFS share.
  @_s.JsonKey(name: 'MountOptions')
  final NfsMountOptions mountOptions;
  @_s.JsonKey(name: 'OnPremConfig')
  final OnPremConfig onPremConfig;

  DescribeLocationNfsResponse({
    this.creationTime,
    this.locationArn,
    this.locationUri,
    this.mountOptions,
    this.onPremConfig,
  });
  factory DescribeLocationNfsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLocationNfsResponseFromJson(json);
}

/// DescribeLocationS3Request
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeLocationS3Request {
  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket location to describe.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  DescribeLocationS3Request({
    @_s.required this.locationArn,
  });
  Map<String, dynamic> toJson() => _$DescribeLocationS3RequestToJson(this);
}

/// DescribeLocationS3Response
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLocationS3Response {
  /// The time that the Amazon S3 bucket location was created.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket location.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  /// The URL of the Amazon S3 location that was described.
  @_s.JsonKey(name: 'LocationUri')
  final String locationUri;
  @_s.JsonKey(name: 'S3Config')
  final S3Config s3Config;

  /// The Amazon S3 storage class that you chose to store your files in when this
  /// location is used as a task destination. For more information about S3
  /// storage classes, see <a
  /// href="https://aws.amazon.com/s3/storage-classes/">Amazon S3 Storage
  /// Classes</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.
  /// Some storage classes have behaviors that can affect your S3 storage cost.
  /// For detailed information, see <a>using-storage-classes</a>.
  @_s.JsonKey(name: 'S3StorageClass')
  final S3StorageClass s3StorageClass;

  DescribeLocationS3Response({
    this.creationTime,
    this.locationArn,
    this.locationUri,
    this.s3Config,
    this.s3StorageClass,
  });
  factory DescribeLocationS3Response.fromJson(Map<String, dynamic> json) =>
      _$DescribeLocationS3ResponseFromJson(json);
}

/// DescribeLocationSmbRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeLocationSmbRequest {
  /// The Amazon resource Name (ARN) of the SMB location to describe.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  DescribeLocationSmbRequest({
    @_s.required this.locationArn,
  });
  Map<String, dynamic> toJson() => _$DescribeLocationSmbRequestToJson(this);
}

/// DescribeLocationSmbResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLocationSmbResponse {
  /// The Amazon Resource Name (ARN) of the source SMB file system location that
  /// is created.
  @_s.JsonKey(name: 'AgentArns')
  final List<String> agentArns;

  /// The time that the SMB location was created.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The name of the Windows domain that the SMB server belongs to.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// The Amazon resource Name (ARN) of the SMB location that was described.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  /// The URL of the source SBM location that was described.
  @_s.JsonKey(name: 'LocationUri')
  final String locationUri;

  /// The mount options that are available for DataSync to use to access an SMB
  /// location.
  @_s.JsonKey(name: 'MountOptions')
  final SmbMountOptions mountOptions;

  /// The user who can mount the share, has the permissions to access files and
  /// folders in the SMB share.
  @_s.JsonKey(name: 'User')
  final String user;

  DescribeLocationSmbResponse({
    this.agentArns,
    this.creationTime,
    this.domain,
    this.locationArn,
    this.locationUri,
    this.mountOptions,
    this.user,
  });
  factory DescribeLocationSmbResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLocationSmbResponseFromJson(json);
}

/// DescribeTaskExecutionRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeTaskExecutionRequest {
  /// The Amazon Resource Name (ARN) of the task that is being executed.
  @_s.JsonKey(name: 'TaskExecutionArn')
  final String taskExecutionArn;

  DescribeTaskExecutionRequest({
    @_s.required this.taskExecutionArn,
  });
  Map<String, dynamic> toJson() => _$DescribeTaskExecutionRequestToJson(this);
}

/// DescribeTaskExecutionResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTaskExecutionResponse {
  /// The physical number of bytes transferred over the network.
  @_s.JsonKey(name: 'BytesTransferred')
  final int bytesTransferred;

  /// The number of logical bytes written to the destination AWS storage resource.
  @_s.JsonKey(name: 'BytesWritten')
  final int bytesWritten;

  /// The estimated physical number of bytes that is to be transferred over the
  /// network.
  @_s.JsonKey(name: 'EstimatedBytesToTransfer')
  final int estimatedBytesToTransfer;

  /// The expected number of files that is to be transferred over the network.
  /// This value is calculated during the PREPARING phase, before the TRANSFERRING
  /// phase. This value is the expected number of files to be transferred. It's
  /// calculated based on comparing the content of the source and destination
  /// locations and finding the delta that needs to be transferred.
  @_s.JsonKey(name: 'EstimatedFilesToTransfer')
  final int estimatedFilesToTransfer;

  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the patterns
  /// to exclude. The patterns are delimited by "|" (that is, a pipe), for
  /// example: <code>"/folder1|/folder2"</code>
  ///
  ///
  @_s.JsonKey(name: 'Excludes')
  final List<FilterRule> excludes;

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
  @_s.JsonKey(name: 'FilesTransferred')
  final int filesTransferred;

  /// A list of filter rules that determines which files to include when running a
  /// task. The list should contain a single filter string that consists of the
  /// patterns to include. The patterns are delimited by "|" (that is, a pipe),
  /// for example: <code>"/folder1|/folder2"</code>
  ///
  ///
  @_s.JsonKey(name: 'Includes')
  final List<FilterRule> includes;
  @_s.JsonKey(name: 'Options')
  final Options options;

  /// The result of the task execution.
  @_s.JsonKey(name: 'Result')
  final TaskExecutionResultDetail result;

  /// The time that the task execution was started.
  @_s.JsonKey(
      name: 'StartTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startTime;

  /// The status of the task execution.
  ///
  /// For detailed information about task execution statuses, see Understanding
  /// Task Statuses in the <i>AWS DataSync User Guide.</i>
  @_s.JsonKey(name: 'Status')
  final TaskExecutionStatus status;

  /// The Amazon Resource Name (ARN) of the task execution that was described.
  /// <code>TaskExecutionArn</code> is hierarchical and includes
  /// <code>TaskArn</code> for the task that was executed.
  ///
  /// For example, a <code>TaskExecution</code> value with the ARN
  /// <code>arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2/execution/exec-08ef1e88ec491019b</code>
  /// executed the task with the ARN
  /// <code>arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2</code>.
  @_s.JsonKey(name: 'TaskExecutionArn')
  final String taskExecutionArn;

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
  factory DescribeTaskExecutionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTaskExecutionResponseFromJson(json);
}

/// DescribeTaskRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeTaskRequest {
  /// The Amazon Resource Name (ARN) of the task to describe.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  DescribeTaskRequest({
    @_s.required this.taskArn,
  });
  Map<String, dynamic> toJson() => _$DescribeTaskRequestToJson(this);
}

/// DescribeTaskResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTaskResponse {
  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that was
  /// used to monitor and log events in the task.
  ///
  /// For more information on these groups, see Working with Log Groups and Log
  /// Streams in the <i>Amazon CloudWatch User Guide</i>.
  @_s.JsonKey(name: 'CloudWatchLogGroupArn')
  final String cloudWatchLogGroupArn;

  /// The time that the task was created.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the task execution that is syncing files.
  @_s.JsonKey(name: 'CurrentTaskExecutionArn')
  final String currentTaskExecutionArn;

  /// The Amazon Resource Name (ARN) of the AWS storage resource's location.
  @_s.JsonKey(name: 'DestinationLocationArn')
  final String destinationLocationArn;

  /// The Amazon Resource Name (ARN) of the destination ENIs (Elastic Network
  /// Interface) that was created for your subnet.
  @_s.JsonKey(name: 'DestinationNetworkInterfaceArns')
  final List<String> destinationNetworkInterfaceArns;

  /// Errors that AWS DataSync encountered during execution of the task. You can
  /// use this error code to help troubleshoot issues.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// Detailed description of an error that was encountered during the task
  /// execution. You can use this information to help troubleshoot issues.
  @_s.JsonKey(name: 'ErrorDetail')
  final String errorDetail;

  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the patterns
  /// to exclude. The patterns are delimited by "|" (that is, a pipe), for
  /// example: <code>"/folder1|/folder2"</code>
  ///
  ///
  @_s.JsonKey(name: 'Excludes')
  final List<FilterRule> excludes;

  /// The name of the task that was described.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The set of configuration options that control the behavior of a single
  /// execution of the task that occurs when you call
  /// <code>StartTaskExecution</code>. You can configure these options to preserve
  /// metadata such as user ID (UID) and group (GID), file permissions, data
  /// integrity verification, and so on.
  ///
  /// For each individual task execution, you can override these options by
  /// specifying the overriding <code>OverrideOptions</code> value to operation.
  @_s.JsonKey(name: 'Options')
  final Options options;

  /// The schedule used to periodically transfer files from a source to a
  /// destination location.
  @_s.JsonKey(name: 'Schedule')
  final TaskSchedule schedule;

  /// The Amazon Resource Name (ARN) of the source file system's location.
  @_s.JsonKey(name: 'SourceLocationArn')
  final String sourceLocationArn;

  /// The Amazon Resource Name (ARN) of the source ENIs (Elastic Network
  /// Interface) that was created for your subnet.
  @_s.JsonKey(name: 'SourceNetworkInterfaceArns')
  final List<String> sourceNetworkInterfaceArns;

  /// The status of the task that was described.
  ///
  /// For detailed information about task execution statuses, see Understanding
  /// Task Statuses in the <i>AWS DataSync User Guide.</i>
  @_s.JsonKey(name: 'Status')
  final TaskStatus status;

  /// The Amazon Resource Name (ARN) of the task that was described.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

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
  factory DescribeTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTaskResponseFromJson(json);
}

/// The subnet and the security group that DataSync uses to access target EFS
/// file system. The subnet must have at least one mount target for that file
/// system. The security group that you provide needs to be able to communicate
/// with the security group on the mount target in the subnet specified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Ec2Config {
  /// The Amazon Resource Names (ARNs) of the security groups that are configured
  /// for the Amazon EC2 resource.
  @_s.JsonKey(name: 'SecurityGroupArns')
  final List<String> securityGroupArns;

  /// The ARN of the subnet and the security group that DataSync uses to access
  /// the target EFS file system.
  @_s.JsonKey(name: 'SubnetArn')
  final String subnetArn;

  Ec2Config({
    @_s.required this.securityGroupArns,
    @_s.required this.subnetArn,
  });
  factory Ec2Config.fromJson(Map<String, dynamic> json) =>
      _$Ec2ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$Ec2ConfigToJson(this);
}

enum EndpointType {
  @_s.JsonValue('PUBLIC')
  public,
  @_s.JsonValue('PRIVATE_LINK')
  privateLink,
  @_s.JsonValue('FIPS')
  fips,
}

/// Specifies which files, folders and objects to include or exclude when
/// transferring files from source to destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FilterRule {
  /// The type of filter rule to apply. AWS DataSync only supports the
  /// SIMPLE_PATTERN rule type.
  @_s.JsonKey(name: 'FilterType')
  final FilterType filterType;

  /// A single filter string that consists of the patterns to include or exclude.
  /// The patterns are delimited by "|" (that is, a pipe), for example:
  /// <code>/folder1|/folder2</code>
  ///
  ///
  @_s.JsonKey(name: 'Value')
  final String value;

  FilterRule({
    this.filterType,
    this.value,
  });
  factory FilterRule.fromJson(Map<String, dynamic> json) =>
      _$FilterRuleFromJson(json);

  Map<String, dynamic> toJson() => _$FilterRuleToJson(this);
}

enum FilterType {
  @_s.JsonValue('SIMPLE_PATTERN')
  simplePattern,
}

enum Gid {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('INT_VALUE')
  intValue,
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('BOTH')
  both,
}

/// ListAgentsRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListAgentsRequest {
  /// The maximum number of agents to list.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// An opaque string that indicates the position at which to begin the next list
  /// of agents.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAgentsRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListAgentsRequestToJson(this);
}

/// ListAgentsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAgentsResponse {
  /// A list of agents in your account.
  @_s.JsonKey(name: 'Agents')
  final List<AgentListEntry> agents;

  /// An opaque string that indicates the position at which to begin returning the
  /// next list of agents.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAgentsResponse({
    this.agents,
    this.nextToken,
  });
  factory ListAgentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAgentsResponseFromJson(json);
}

/// ListLocationsRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListLocationsRequest {
  /// The maximum number of locations to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// An opaque string that indicates the position at which to begin the next list
  /// of locations.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLocationsRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListLocationsRequestToJson(this);
}

/// ListLocationsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLocationsResponse {
  /// An array that contains a list of locations.
  @_s.JsonKey(name: 'Locations')
  final List<LocationListEntry> locations;

  /// An opaque string that indicates the position at which to begin returning the
  /// next list of locations.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLocationsResponse({
    this.locations,
    this.nextToken,
  });
  factory ListLocationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLocationsResponseFromJson(json);
}

/// ListTagsForResourceRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListTagsForResourceRequest {
  /// The Amazon Resource Name (ARN) of the resource whose tags to list.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The maximum number of locations to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// An opaque string that indicates the position at which to begin the next list
  /// of locations.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTagsForResourceRequest({
    @_s.required this.resourceArn,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListTagsForResourceRequestToJson(this);
}

/// ListTagsForResourceResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// An opaque string that indicates the position at which to begin returning the
  /// next list of resource tags.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Array of resource tags.
  @_s.JsonKey(name: 'Tags')
  final List<TagListEntry> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// ListTaskExecutions
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListTaskExecutionsRequest {
  /// The maximum number of executed tasks to list.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// An opaque string that indicates the position at which to begin the next list
  /// of the executed tasks.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The Amazon Resource Name (ARN) of the task whose tasks you want to list.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  ListTaskExecutionsRequest({
    this.maxResults,
    this.nextToken,
    this.taskArn,
  });
  Map<String, dynamic> toJson() => _$ListTaskExecutionsRequestToJson(this);
}

/// ListTaskExecutionsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTaskExecutionsResponse {
  /// An opaque string that indicates the position at which to begin returning the
  /// next list of executed tasks.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of executed tasks.
  @_s.JsonKey(name: 'TaskExecutions')
  final List<TaskExecutionListEntry> taskExecutions;

  ListTaskExecutionsResponse({
    this.nextToken,
    this.taskExecutions,
  });
  factory ListTaskExecutionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTaskExecutionsResponseFromJson(json);
}

/// ListTasksRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListTasksRequest {
  /// The maximum number of tasks to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// An opaque string that indicates the position at which to begin the next list
  /// of tasks.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTasksRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListTasksRequestToJson(this);
}

/// ListTasksResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTasksResponse {
  /// An opaque string that indicates the position at which to begin returning the
  /// next list of tasks.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of all the tasks that are returned.
  @_s.JsonKey(name: 'Tasks')
  final List<TaskListEntry> tasks;

  ListTasksResponse({
    this.nextToken,
    this.tasks,
  });
  factory ListTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTasksResponseFromJson(json);
}

/// Represents a single entry in a list of locations.
/// <code>LocationListEntry</code> returns an array that contains a list of
/// locations when the <a>ListLocations</a> operation is called.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LocationListEntry {
  /// The Amazon Resource Name (ARN) of the location. For Network File System
  /// (NFS) or Amazon EFS, the location is the export path. For Amazon S3, the
  /// location is the prefix path that you want to mount and use as the root of
  /// the location.
  @_s.JsonKey(name: 'LocationArn')
  final String locationArn;

  /// Represents a list of URLs of a location. <code>LocationUri</code> returns an
  /// array that contains a list of locations when the <a>ListLocations</a>
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
  @_s.JsonKey(name: 'LocationUri')
  final String locationUri;

  LocationListEntry({
    this.locationArn,
    this.locationUri,
  });
  factory LocationListEntry.fromJson(Map<String, dynamic> json) =>
      _$LocationListEntryFromJson(json);
}

enum LogLevel {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('BASIC')
  basic,
  @_s.JsonValue('TRANSFER')
  transfer,
}

enum Mtime {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PRESERVE')
  preserve,
}

/// Represents the mount options that are available for DataSync to access an
/// NFS location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'Version')
  final NfsVersion version;

  NfsMountOptions({
    this.version,
  });
  factory NfsMountOptions.fromJson(Map<String, dynamic> json) =>
      _$NfsMountOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$NfsMountOptionsToJson(this);
}

enum NfsVersion {
  @_s.JsonValue('AUTOMATIC')
  automatic,
  @_s.JsonValue('NFS3')
  nfs3,
  @_s.JsonValue('NFS4_0')
  nfs4_0,
  @_s.JsonValue('NFS4_1')
  nfs4_1,
}

/// A list of Amazon Resource Names (ARNs) of agents to use for a Network File
/// System (NFS) location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OnPremConfig {
  /// ARNs)of the agents to use for an NFS location.
  @_s.JsonKey(name: 'AgentArns')
  final List<String> agentArns;

  OnPremConfig({
    @_s.required this.agentArns,
  });
  factory OnPremConfig.fromJson(Map<String, dynamic> json) =>
      _$OnPremConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OnPremConfigToJson(this);
}

/// Represents the options that are available to control the behavior of a
/// <a>StartTaskExecution</a> operation. Behavior includes preserving metadata
/// such as user ID (UID), group ID (GID), and file permissions, and also
/// overwriting files in the destination, data integrity verification, and so
/// on.
///
/// A task has a set of default options associated with it. If you don't specify
/// an option in <a>StartTaskExecution</a>, the default value is used. You can
/// override the defaults options on each task execution by specifying an
/// overriding <code>Options</code> value to <a>StartTaskExecution</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'Atime')
  final Atime atime;

  /// A value that limits the bandwidth used by AWS DataSync. For example, if you
  /// want AWS DataSync to use a maximum of 1 MB, set this value to
  /// <code>1048576</code> (<code>=1024*1024</code>).
  @_s.JsonKey(name: 'BytesPerSecond')
  final int bytesPerSecond;

  /// The group ID (GID) of the file's owners.
  ///
  /// Default value: INT_VALUE. This preserves the integer value of the ID.
  ///
  /// INT_VALUE: Preserve the integer value of user ID (UID) and GID
  /// (recommended).
  ///
  /// NONE: Ignore UID and GID.
  @_s.JsonKey(name: 'Gid')
  final Gid gid;

  /// A value that determines the type of logs DataSync will deliver to your AWS
  /// CloudWatch Logs file. If set to <code>OFF</code>, no logs will be delivered.
  /// <code>BASIC</code> will deliver a few logs per transfer operation and
  /// <code>TRANSFER</code> will deliver a verbose log that contains logs for
  /// every file that is transferred.
  @_s.JsonKey(name: 'LogLevel')
  final LogLevel logLevel;

  /// A value that indicates the last time that a file was modified (that is, a
  /// file was written to) before the PREPARING phase.
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
  @_s.JsonKey(name: 'Mtime')
  final Mtime mtime;

  /// A value that determines whether files at the destination should be
  /// overwritten or preserved when copying files. If set to <code>NEVER</code> a
  /// destination file will not be replaced by a source file, even if the
  /// destination file differs from the source file. If you modify files in the
  /// destination and you sync the files, you can use this value to protect
  /// against overwriting those changes.
  ///
  /// Some storage classes have specific behaviors that can affect your S3 storage
  /// cost. For detailed information, see <a>using-storage-classes</a> in the
  /// <i>AWS DataSync User Guide</i>.
  @_s.JsonKey(name: 'OverwriteMode')
  final OverwriteMode overwriteMode;

  /// A value that determines which users or groups can access a file for a
  /// specific purpose such as reading, writing, or execution of the file.
  ///
  /// Default value: PRESERVE.
  ///
  /// PRESERVE: Preserve POSIX-style permissions (recommended).
  ///
  /// NONE: Ignore permissions.
  /// <note>
  /// AWS DataSync can preserve extant permissions of a source location.
  /// </note>
  @_s.JsonKey(name: 'PosixPermissions')
  final PosixPermissions posixPermissions;

  /// A value that specifies whether files in the destination that don't exist in
  /// the source file system should be preserved. This option can affect your
  /// storage cost. If your task deletes objects, you might incur minimum storage
  /// duration charges for certain storage classes. For detailed information, see
  /// <a>using-storage-classes</a> in the <i>AWS DataSync User Guide</i>.
  ///
  /// Default value: PRESERVE.
  ///
  /// PRESERVE: Ignore such destination files (recommended).
  ///
  /// REMOVE: Delete destination files that aren’t present in the source.
  @_s.JsonKey(name: 'PreserveDeletedFiles')
  final PreserveDeletedFiles preserveDeletedFiles;

  /// A value that determines whether AWS DataSync should preserve the metadata of
  /// block and character devices in the source file system, and recreate the
  /// files with that device name and metadata on the destination.
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
  @_s.JsonKey(name: 'PreserveDevices')
  final PreserveDevices preserveDevices;

  /// A value that determines whether tasks should be queued before executing the
  /// tasks. If set to <code>ENABLED</code>, the tasks will be queued. The default
  /// is <code>ENABLED</code>.
  ///
  /// If you use the same agent to run multiple tasks you can enable the tasks to
  /// run in series. For more information see <a>queue-task-execution</a>.
  @_s.JsonKey(name: 'TaskQueueing')
  final TaskQueueing taskQueueing;

  /// The user ID (UID) of the file's owner.
  ///
  /// Default value: INT_VALUE. This preserves the integer value of the ID.
  ///
  /// INT_VALUE: Preserve the integer value of UID and group ID (GID)
  /// (recommended).
  ///
  /// NONE: Ignore UID and GID.
  @_s.JsonKey(name: 'Uid')
  final Uid uid;

  /// A value that determines whether a data integrity verification should be
  /// performed at the end of a task execution after all data and metadata have
  /// been transferred.
  ///
  /// Default value: POINT_IN_TIME_CONSISTENT.
  ///
  /// POINT_IN_TIME_CONSISTENT: Perform verification (recommended).
  ///
  /// ONLY_FILES_TRANSFERRED: Perform verification on only files that were
  /// transferred.
  ///
  /// NONE: Skip verification.
  @_s.JsonKey(name: 'VerifyMode')
  final VerifyMode verifyMode;

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
    this.taskQueueing,
    this.uid,
    this.verifyMode,
  });
  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsToJson(this);
}

enum OverwriteMode {
  @_s.JsonValue('ALWAYS')
  always,
  @_s.JsonValue('NEVER')
  never,
}

enum PhaseStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('ERROR')
  error,
}

enum PosixPermissions {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PRESERVE')
  preserve,
}

enum PreserveDeletedFiles {
  @_s.JsonValue('PRESERVE')
  preserve,
  @_s.JsonValue('REMOVE')
  remove,
}

enum PreserveDevices {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PRESERVE')
  preserve,
}

/// The VPC endpoint, subnet and security group that an agent uses to access IP
/// addresses in a VPC (Virtual Private Cloud).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PrivateLinkConfig {
  /// The private endpoint that is configured for an agent that has access to IP
  /// addresses in a <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html">PrivateLink</a>.
  /// An agent that is configured with this endpoint will not be accessible over
  /// the public Internet.
  @_s.JsonKey(name: 'PrivateLinkEndpoint')
  final String privateLinkEndpoint;

  /// The Amazon Resource Names (ARNs) of the security groups that are configured
  /// for the EC2 resource that hosts an agent activated in a VPC or an agent that
  /// has access to a VPC endpoint.
  @_s.JsonKey(name: 'SecurityGroupArns')
  final List<String> securityGroupArns;

  /// The Amazon Resource Names (ARNs) of the subnets that are configured for an
  /// agent activated in a VPC or an agent that has access to a VPC endpoint.
  @_s.JsonKey(name: 'SubnetArns')
  final List<String> subnetArns;

  /// The ID of the VPC endpoint that is configured for an agent. An agent that is
  /// configured with a VPC endpoint will not be accessible over the public
  /// Internet.
  @_s.JsonKey(name: 'VpcEndpointId')
  final String vpcEndpointId;

  PrivateLinkConfig({
    this.privateLinkEndpoint,
    this.securityGroupArns,
    this.subnetArns,
    this.vpcEndpointId,
  });
  factory PrivateLinkConfig.fromJson(Map<String, dynamic> json) =>
      _$PrivateLinkConfigFromJson(json);
}

/// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
/// (IAM) role that is used to access an Amazon S3 bucket.
///
/// For detailed information about using such a role, see Creating a Location
/// for Amazon S3 in the <i>AWS DataSync User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Config {
  /// The Amazon S3 bucket to access. This bucket is used as a parameter in the
  /// <a>CreateLocationS3</a> operation.
  @_s.JsonKey(name: 'BucketAccessRoleArn')
  final String bucketAccessRoleArn;

  S3Config({
    @_s.required this.bucketAccessRoleArn,
  });
  factory S3Config.fromJson(Map<String, dynamic> json) =>
      _$S3ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$S3ConfigToJson(this);
}

enum S3StorageClass {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('STANDARD_IA')
  standardIa,
  @_s.JsonValue('ONEZONE_IA')
  onezoneIa,
  @_s.JsonValue('INTELLIGENT_TIERING')
  intelligentTiering,
  @_s.JsonValue('GLACIER')
  glacier,
  @_s.JsonValue('DEEP_ARCHIVE')
  deepArchive,
}

/// Represents the mount options that are available for DataSync to access an
/// SMB location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SmbMountOptions {
  /// The specific SMB version that you want DataSync to use to mount your SMB
  /// share. If you don't specify a version, DataSync defaults to
  /// <code>AUTOMATIC</code>. That is, DataSync automatically selects a version
  /// based on negotiation with the SMB server.
  @_s.JsonKey(name: 'Version')
  final SmbVersion version;

  SmbMountOptions({
    this.version,
  });
  factory SmbMountOptions.fromJson(Map<String, dynamic> json) =>
      _$SmbMountOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SmbMountOptionsToJson(this);
}

enum SmbVersion {
  @_s.JsonValue('AUTOMATIC')
  automatic,
  @_s.JsonValue('SMB2')
  smb2,
  @_s.JsonValue('SMB3')
  smb3,
}

/// StartTaskExecutionRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartTaskExecutionRequest {
  /// The Amazon Resource Name (ARN) of the task to start.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  /// A list of filter rules that determines which files to include when running a
  /// task. The pattern should contain a single filter string that consists of the
  /// patterns to include. The patterns are delimited by "|" (that is, a pipe).
  /// For example: <code>"/folder1|/folder2"</code>
  ///
  ///
  @_s.JsonKey(name: 'Includes')
  final List<FilterRule> includes;
  @_s.JsonKey(name: 'OverrideOptions')
  final Options overrideOptions;

  StartTaskExecutionRequest({
    @_s.required this.taskArn,
    this.includes,
    this.overrideOptions,
  });
  Map<String, dynamic> toJson() => _$StartTaskExecutionRequestToJson(this);
}

/// StartTaskExecutionResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartTaskExecutionResponse {
  /// The Amazon Resource Name (ARN) of the specific task execution that was
  /// started.
  @_s.JsonKey(name: 'TaskExecutionArn')
  final String taskExecutionArn;

  StartTaskExecutionResponse({
    this.taskExecutionArn,
  });
  factory StartTaskExecutionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartTaskExecutionResponseFromJson(json);
}

/// Represents a single entry in a list of AWS resource tags.
/// <code>TagListEntry</code> returns an array that contains a list of tasks
/// when the <a>ListTagsForResource</a> operation is called.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TagListEntry {
  /// The key for an AWS resource tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for an AWS resource tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  TagListEntry({
    @_s.required this.key,
    this.value,
  });
  factory TagListEntry.fromJson(Map<String, dynamic> json) =>
      _$TagListEntryFromJson(json);

  Map<String, dynamic> toJson() => _$TagListEntryToJson(this);
}

/// TagResourceRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TagResourceRequest {
  /// The Amazon Resource Name (ARN) of the resource to apply the tag to.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The tags to apply.
  @_s.JsonKey(name: 'Tags')
  final List<TagListEntry> tags;

  TagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tags,
  });
  Map<String, dynamic> toJson() => _$TagResourceRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Represents a single entry in a list of task executions.
/// <code>TaskExecutionListEntry</code> returns an array that contains a list of
/// specific invocations of a task when <a>ListTaskExecutions</a> operation is
/// called.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TaskExecutionListEntry {
  /// The status of a task execution.
  @_s.JsonKey(name: 'Status')
  final TaskExecutionStatus status;

  /// The Amazon Resource Name (ARN) of the task that was executed.
  @_s.JsonKey(name: 'TaskExecutionArn')
  final String taskExecutionArn;

  TaskExecutionListEntry({
    this.status,
    this.taskExecutionArn,
  });
  factory TaskExecutionListEntry.fromJson(Map<String, dynamic> json) =>
      _$TaskExecutionListEntryFromJson(json);
}

/// Describes the detailed result of a <code>TaskExecution</code> operation.
/// This result includes the time in milliseconds spent in each phase, the
/// status of the task execution, and the errors encountered.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TaskExecutionResultDetail {
  /// Errors that AWS DataSync encountered during execution of the task. You can
  /// use this error code to help troubleshoot issues.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// Detailed description of an error that was encountered during the task
  /// execution. You can use this information to help troubleshoot issues.
  @_s.JsonKey(name: 'ErrorDetail')
  final String errorDetail;

  /// The total time in milliseconds that AWS DataSync spent in the PREPARING
  /// phase.
  @_s.JsonKey(name: 'PrepareDuration')
  final int prepareDuration;

  /// The status of the PREPARING phase.
  @_s.JsonKey(name: 'PrepareStatus')
  final PhaseStatus prepareStatus;

  /// The total time in milliseconds that AWS DataSync took to transfer the file
  /// from the source to the destination location.
  @_s.JsonKey(name: 'TotalDuration')
  final int totalDuration;

  /// The total time in milliseconds that AWS DataSync spent in the TRANSFERRING
  /// phase.
  @_s.JsonKey(name: 'TransferDuration')
  final int transferDuration;

  /// The status of the TRANSFERRING Phase.
  @_s.JsonKey(name: 'TransferStatus')
  final PhaseStatus transferStatus;

  /// The total time in milliseconds that AWS DataSync spent in the VERIFYING
  /// phase.
  @_s.JsonKey(name: 'VerifyDuration')
  final int verifyDuration;

  /// The status of the VERIFYING Phase.
  @_s.JsonKey(name: 'VerifyStatus')
  final PhaseStatus verifyStatus;

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
  factory TaskExecutionResultDetail.fromJson(Map<String, dynamic> json) =>
      _$TaskExecutionResultDetailFromJson(json);
}

enum TaskExecutionStatus {
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('LAUNCHING')
  launching,
  @_s.JsonValue('PREPARING')
  preparing,
  @_s.JsonValue('TRANSFERRING')
  transferring,
  @_s.JsonValue('VERIFYING')
  verifying,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('ERROR')
  error,
}

/// Represents a single entry in a list of tasks. <code>TaskListEntry</code>
/// returns an array that contains a list of tasks when the <a>ListTasks</a>
/// operation is called. A task includes the source and destination file systems
/// to sync and the options to use for the tasks.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TaskListEntry {
  /// The name of the task.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The status of the task.
  @_s.JsonKey(name: 'Status')
  final TaskStatus status;

  /// The Amazon Resource Name (ARN) of the task.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  TaskListEntry({
    this.name,
    this.status,
    this.taskArn,
  });
  factory TaskListEntry.fromJson(Map<String, dynamic> json) =>
      _$TaskListEntryFromJson(json);
}

enum TaskQueueing {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Specifies the schedule you want your task to use for repeated executions.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html">Schedule
/// Expressions for Rules</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TaskSchedule {
  /// A cron expression that specifies when AWS DataSync initiates a scheduled
  /// transfer from a source to a destination location.
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  TaskSchedule({
    @_s.required this.scheduleExpression,
  });
  factory TaskSchedule.fromJson(Map<String, dynamic> json) =>
      _$TaskScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$TaskScheduleToJson(this);
}

enum TaskStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('UNAVAILABLE')
  unavailable,
}

enum Uid {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('INT_VALUE')
  intValue,
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('BOTH')
  both,
}

/// UntagResourceRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UntagResourceRequest {
  /// The keys in the key-value pair in the tag to remove.
  @_s.JsonKey(name: 'Keys')
  final List<String> keys;

  /// The Amazon Resource Name (ARN) of the resource to remove the tag from.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  UntagResourceRequest({
    @_s.required this.keys,
    @_s.required this.resourceArn,
  });
  Map<String, dynamic> toJson() => _$UntagResourceRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// UpdateAgentRequest
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateAgentRequest {
  /// The Amazon Resource Name (ARN) of the agent to update.
  @_s.JsonKey(name: 'AgentArn')
  final String agentArn;

  /// The name that you want to use to configure the agent.
  @_s.JsonKey(name: 'Name')
  final String name;

  UpdateAgentRequest({
    @_s.required this.agentArn,
    this.name,
  });
  Map<String, dynamic> toJson() => _$UpdateAgentRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAgentResponse {
  UpdateAgentResponse();
  factory UpdateAgentResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAgentResponseFromJson(json);
}

/// UpdateTaskResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateTaskRequest {
  /// The Amazon Resource Name (ARN) of the resource name of the task to update.
  @_s.JsonKey(name: 'TaskArn')
  final String taskArn;

  /// The Amazon Resource Name (ARN) of the resource name of the CloudWatch
  /// LogGroup.
  @_s.JsonKey(name: 'CloudWatchLogGroupArn')
  final String cloudWatchLogGroupArn;

  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the patterns
  /// to exclude. The patterns are delimited by "|" (that is, a pipe), for
  /// example: <code>"/folder1|/folder2"</code>
  ///
  ///
  @_s.JsonKey(name: 'Excludes')
  final List<FilterRule> excludes;

  /// The name of the task to update.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'Options')
  final Options options;

  /// Specifies a schedule used to periodically transfer files from a source to a
  /// destination location. You can configure your task to execute hourly, daily,
  /// weekly or on specific days of the week. You control when in the day or hour
  /// you want the task to execute. The time you specify is UTC time. For more
  /// information, see <a>task-scheduling</a>.
  @_s.JsonKey(name: 'Schedule')
  final TaskSchedule schedule;

  UpdateTaskRequest({
    @_s.required this.taskArn,
    this.cloudWatchLogGroupArn,
    this.excludes,
    this.name,
    this.options,
    this.schedule,
  });
  Map<String, dynamic> toJson() => _$UpdateTaskRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTaskResponse {
  UpdateTaskResponse();
  factory UpdateTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskResponseFromJson(json);
}

enum VerifyMode {
  @_s.JsonValue('POINT_IN_TIME_CONSISTENT')
  pointInTimeConsistent,
  @_s.JsonValue('ONLY_FILES_TRANSFERRED')
  onlyFilesTransferred,
  @_s.JsonValue('NONE')
  none,
}

class InternalException extends _s.GenericAwsException {
  InternalException({String type, String message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
};
