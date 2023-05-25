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

/// DataSync is a managed data transfer service that makes it simpler for you to
/// automate moving data between on-premises storage and Amazon Web Services
/// storage services. You also can use DataSync to transfer data between other
/// cloud providers and Amazon Web Services storage services.
class DataSync {
  final _s.JsonProtocol _protocol;
  DataSync({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Creates an Amazon Web Services resource for an on-premises storage system
  /// that you want DataSync Discovery to collect information about.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArns] :
  /// Specifies the Amazon Resource Name (ARN) of the DataSync agent that
  /// connects to and reads from your on-premises storage system's management
  /// interface.
  ///
  /// Parameter [credentials] :
  /// Specifies the user name and password for accessing your on-premises
  /// storage system's management interface.
  ///
  /// Parameter [serverConfiguration] :
  /// Specifies the server name and network port required to connect with the
  /// management interface of your on-premises storage system.
  ///
  /// Parameter [systemType] :
  /// Specifies the type of on-premises storage system that you want DataSync
  /// Discovery to collect information about.
  /// <note>
  /// DataSync Discovery currently supports NetApp Fabric-Attached Storage (FAS)
  /// and All Flash FAS (AFF) systems running ONTAP 9.7 or later.
  /// </note>
  ///
  /// Parameter [clientToken] :
  /// Specifies a client token to make sure requests with this API operation are
  /// idempotent. If you don't specify a client token, DataSync generates one
  /// for you automatically.
  ///
  /// Parameter [cloudWatchLogGroupArn] :
  /// Specifies the ARN of the Amazon CloudWatch log group for monitoring and
  /// logging discovery job events.
  ///
  /// Parameter [name] :
  /// Specifies a familiar name for your on-premises storage system.
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least a name tag
  /// for your on-premises storage system.
  Future<AddStorageSystemResponse> addStorageSystem({
    required List<String> agentArns,
    required Credentials credentials,
    required DiscoveryServerConfiguration serverConfiguration,
    required DiscoverySystemType systemType,
    String? clientToken,
    String? cloudWatchLogGroupArn,
    String? name,
    List<TagListEntry>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.AddStorageSystem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgentArns': agentArns,
        'Credentials': credentials,
        'ServerConfiguration': serverConfiguration,
        'SystemType': systemType.toValue(),
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (cloudWatchLogGroupArn != null)
          'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
        if (name != null) 'Name': name,
        if (tags != null) 'Tags': tags,
      },
    );

    return AddStorageSystemResponse.fromJson(jsonResponse.body);
  }

  /// Stops an DataSync task execution that's in progress. The transfer of some
  /// files are abruptly interrupted. File contents that're transferred to the
  /// destination might be incomplete or inconsistent with the source files.
  ///
  /// However, if you start a new task execution using the same task and allow
  /// it to finish, file content on the destination will be complete and
  /// consistent. This applies to other unexpected failures that interrupt a
  /// task execution. In all of these cases, DataSync successfully completes the
  /// transfer when you start the next task execution.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskExecutionArn] :
  /// The Amazon Resource Name (ARN) of the task execution to stop.
  Future<void> cancelTaskExecution({
    required String taskExecutionArn,
  }) async {
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

  /// Activates an DataSync agent that you have deployed in your storage
  /// environment. The activation process associates your agent with your
  /// account. In the activation process, you specify information such as the
  /// Amazon Web Services Region that you want to activate the agent in. You
  /// activate the agent in the Amazon Web Services Region where your target
  /// locations (in Amazon S3 or Amazon EFS) reside. Your tasks are created in
  /// this Amazon Web Services Region.
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
  /// Agents are automatically updated by Amazon Web Services on a regular
  /// basis, using a mechanism that ensures minimal interruption to your tasks.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [activationKey] :
  /// Your agent activation key. You can get the activation key either by
  /// sending an HTTP GET request with redirects that enable you to get the
  /// agent IP address (port 80). Alternatively, you can get it from the
  /// DataSync console.
  ///
  /// The redirect URL returned in the response provides you the activation key
  /// for your agent in the query string parameter <code>activationKey</code>.
  /// It might also include other activation-related parameters; however, these
  /// are merely defaults. The arguments you pass to this API call determine the
  /// actual configuration of your agent.
  ///
  /// For more information, see Activating an Agent in the <i>DataSync User
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

  /// Creates an endpoint for an Amazon EFS file system that DataSync can access
  /// for a transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html">Creating
  /// a location for Amazon EFS</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [ec2Config] :
  /// Specifies the subnet and security groups DataSync uses to access your
  /// Amazon EFS file system.
  ///
  /// Parameter [efsFilesystemArn] :
  /// Specifies the ARN for the Amazon EFS file system.
  ///
  /// Parameter [accessPointArn] :
  /// Specifies the Amazon Resource Name (ARN) of the access point that DataSync
  /// uses to access the Amazon EFS file system.
  ///
  /// Parameter [fileSystemAccessRoleArn] :
  /// Specifies an Identity and Access Management (IAM) role that DataSync
  /// assumes when mounting the Amazon EFS file system.
  ///
  /// Parameter [inTransitEncryption] :
  /// Specifies whether you want DataSync to use Transport Layer Security (TLS)
  /// 1.2 encryption when it copies data to or from the Amazon EFS file system.
  ///
  /// If you specify an access point using <code>AccessPointArn</code> or an IAM
  /// role using <code>FileSystemAccessRoleArn</code>, you must set this
  /// parameter to <code>TLS1_2</code>.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a mount path for your Amazon EFS file system. This is where
  /// DataSync reads or writes data (depending on if this is a source or
  /// destination location). By default, DataSync uses the root directory, but
  /// you can also include subdirectories.
  /// <note>
  /// You must specify a value with forward slashes (for example,
  /// <code>/path/to/folder</code>).
  /// </note>
  ///
  /// Parameter [tags] :
  /// Specifies the key-value pair that represents a tag that you want to add to
  /// the resource. The value can be an empty string. This value helps you
  /// manage, filter, and search for your resources. We recommend that you
  /// create a name tag for your location.
  Future<CreateLocationEfsResponse> createLocationEfs({
    required Ec2Config ec2Config,
    required String efsFilesystemArn,
    String? accessPointArn,
    String? fileSystemAccessRoleArn,
    EfsInTransitEncryption? inTransitEncryption,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
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
        if (accessPointArn != null) 'AccessPointArn': accessPointArn,
        if (fileSystemAccessRoleArn != null)
          'FileSystemAccessRoleArn': fileSystemAccessRoleArn,
        if (inTransitEncryption != null)
          'InTransitEncryption': inTransitEncryption.toValue(),
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationEfsResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for an Amazon FSx for Lustre file system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [fsxFilesystemArn] :
  /// The Amazon Resource Name (ARN) for the FSx for Lustre file system.
  ///
  /// Parameter [securityGroupArns] :
  /// The Amazon Resource Names (ARNs) of the security groups that are used to
  /// configure the FSx for Lustre file system.
  ///
  /// Parameter [subdirectory] :
  /// A subdirectory in the location's path. This subdirectory in the FSx for
  /// Lustre file system is used to read data from the FSx for Lustre source
  /// location or write data to the FSx for Lustre destination.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents a tag that you want to add to the
  /// resource. The value can be an empty string. This value helps you manage,
  /// filter, and search for your resources. We recommend that you create a name
  /// tag for your location.
  Future<CreateLocationFsxLustreResponse> createLocationFsxLustre({
    required String fsxFilesystemArn,
    required List<String> securityGroupArns,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationFsxLustre'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FsxFilesystemArn': fsxFilesystemArn,
        'SecurityGroupArns': securityGroupArns,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationFsxLustreResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for an Amazon FSx for NetApp ONTAP file system that
  /// DataSync can access for a transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html">Creating
  /// a location for FSx for ONTAP</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [securityGroupArns] :
  /// Specifies the Amazon EC2 security groups that provide access to your file
  /// system's preferred subnet.
  ///
  /// The security groups must allow outbound traffic on the following ports
  /// (depending on the protocol you use):
  ///
  /// <ul>
  /// <li>
  /// <b>Network File System (NFS)</b>: TCP ports 111, 635, and 2049
  /// </li>
  /// <li>
  /// <b>Server Message Block (SMB)</b>: TCP port 445
  /// </li>
  /// </ul>
  /// Your file system's security groups must also allow inbound traffic on the
  /// same ports.
  ///
  /// Parameter [storageVirtualMachineArn] :
  /// Specifies the ARN of the storage virtual machine (SVM) in your file system
  /// where you want to copy data to or from.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a path to the file share in the SVM where you'll copy your data.
  ///
  /// You can specify a junction path (also known as a mount point), qtree path
  /// (for NFS file shares), or share name (for SMB file shares). For example,
  /// your mount path might be <code>/vol1</code>, <code>/vol1/tree1</code>, or
  /// <code>/share1</code>.
  /// <note>
  /// Don't specify a junction path in the SVM's root volume. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-svms.html">Managing
  /// FSx for ONTAP storage virtual machines</a> in the <i>Amazon FSx for NetApp
  /// ONTAP User Guide</i>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least a name tag
  /// for your location.
  Future<CreateLocationFsxOntapResponse> createLocationFsxOntap({
    required FsxProtocol protocol,
    required List<String> securityGroupArns,
    required String storageVirtualMachineArn,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationFsxOntap'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Protocol': protocol,
        'SecurityGroupArns': securityGroupArns,
        'StorageVirtualMachineArn': storageVirtualMachineArn,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationFsxOntapResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for an Amazon FSx for OpenZFS file system that
  /// DataSync can access for a transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-openzfs-location.html">Creating
  /// a location for FSx for OpenZFS</a>.
  /// <note>
  /// Request parameters related to <code>SMB</code> aren't supported with the
  /// <code>CreateLocationFsxOpenZfs</code> operation.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [fsxFilesystemArn] :
  /// The Amazon Resource Name (ARN) of the FSx for OpenZFS file system.
  ///
  /// Parameter [protocol] :
  /// The type of protocol that DataSync uses to access your file system.
  ///
  /// Parameter [securityGroupArns] :
  /// The ARNs of the security groups that are used to configure the FSx for
  /// OpenZFS file system.
  ///
  /// Parameter [subdirectory] :
  /// A subdirectory in the location's path that must begin with
  /// <code>/fsx</code>. DataSync uses this subdirectory to read or write data
  /// (depending on whether the file system is a source or destination
  /// location).
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents a tag that you want to add to the
  /// resource. The value can be an empty string. This value helps you manage,
  /// filter, and search for your resources. We recommend that you create a name
  /// tag for your location.
  Future<CreateLocationFsxOpenZfsResponse> createLocationFsxOpenZfs({
    required String fsxFilesystemArn,
    required FsxProtocol protocol,
    required List<String> securityGroupArns,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationFsxOpenZfs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FsxFilesystemArn': fsxFilesystemArn,
        'Protocol': protocol,
        'SecurityGroupArns': securityGroupArns,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationFsxOpenZfsResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint for an Amazon FSx for Windows File Server file system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [fsxFilesystemArn] :
  /// Specifies the Amazon Resource Name (ARN) for the FSx for Windows File
  /// Server file system.
  ///
  /// Parameter [password] :
  /// Specifies the password of the user who has the permissions to access files
  /// and folders in the file system.
  ///
  /// Parameter [securityGroupArns] :
  /// Specifies the ARNs of the security groups that provide access to your file
  /// system's preferred subnet.
  /// <note>
  /// If you choose a security group that doesn't allow connections from within
  /// itself, do one of the following:
  ///
  /// <ul>
  /// <li>
  /// Configure the security group to allow it to communicate within itself.
  /// </li>
  /// <li>
  /// Choose a different security group that can communicate with the mount
  /// target's security group.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [user] :
  /// Specifies the user who has the permissions to access files and folders in
  /// the file system.
  ///
  /// For information about choosing a user name that ensures sufficient
  /// permissions to files, folders, and metadata, see <a
  /// href="create-fsx-location.html#FSxWuser">user</a>.
  ///
  /// Parameter [domain] :
  /// Specifies the name of the Windows domain that the FSx for Windows File
  /// Server belongs to.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a mount path for your file system using forward slashes. This is
  /// where DataSync reads or writes data (depending on if this is a source or
  /// destination location).
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least a name tag
  /// for your location.
  Future<CreateLocationFsxWindowsResponse> createLocationFsxWindows({
    required String fsxFilesystemArn,
    required String password,
    required List<String> securityGroupArns,
    required String user,
    String? domain,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
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

  /// Creates an endpoint for a Hadoop Distributed File System (HDFS).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArns] :
  /// The Amazon Resource Names (ARNs) of the agents that are used to connect to
  /// the HDFS cluster.
  ///
  /// Parameter [authenticationType] :
  /// The type of authentication used to determine the identity of the user.
  ///
  /// Parameter [nameNodes] :
  /// The NameNode that manages the HDFS namespace. The NameNode performs
  /// operations such as opening, closing, and renaming files and directories.
  /// The NameNode contains the information to map blocks of data to the
  /// DataNodes. You can use only one NameNode.
  ///
  /// Parameter [blockSize] :
  /// The size of data blocks to write into the HDFS cluster. The block size
  /// must be a multiple of 512 bytes. The default block size is 128 mebibytes
  /// (MiB).
  ///
  /// Parameter [kerberosKeytab] :
  /// The Kerberos key table (keytab) that contains mappings between the defined
  /// Kerberos principal and the encrypted keys. You can load the keytab from a
  /// file by providing the file's address. If you're using the CLI, it performs
  /// base64 encoding for you. Otherwise, provide the base64-encoded text.
  /// <note>
  /// If <code>KERBEROS</code> is specified for <code>AuthenticationType</code>,
  /// this parameter is required.
  /// </note>
  ///
  /// Parameter [kerberosKrb5Conf] :
  /// The <code>krb5.conf</code> file that contains the Kerberos configuration
  /// information. You can load the <code>krb5.conf</code> file by providing the
  /// file's address. If you're using the CLI, it performs the base64 encoding
  /// for you. Otherwise, provide the base64-encoded text.
  /// <note>
  /// If <code>KERBEROS</code> is specified for <code>AuthenticationType</code>,
  /// this parameter is required.
  /// </note>
  ///
  /// Parameter [kerberosPrincipal] :
  /// The Kerberos principal with access to the files and folders on the HDFS
  /// cluster.
  /// <note>
  /// If <code>KERBEROS</code> is specified for <code>AuthenticationType</code>,
  /// this parameter is required.
  /// </note>
  ///
  /// Parameter [kmsKeyProviderUri] :
  /// The URI of the HDFS cluster's Key Management Server (KMS).
  ///
  /// Parameter [qopConfiguration] :
  /// The Quality of Protection (QOP) configuration specifies the Remote
  /// Procedure Call (RPC) and data transfer protection settings configured on
  /// the Hadoop Distributed File System (HDFS) cluster. If
  /// <code>QopConfiguration</code> isn't specified, <code>RpcProtection</code>
  /// and <code>DataTransferProtection</code> default to <code>PRIVACY</code>.
  /// If you set <code>RpcProtection</code> or
  /// <code>DataTransferProtection</code>, the other parameter assumes the same
  /// value.
  ///
  /// Parameter [replicationFactor] :
  /// The number of DataNodes to replicate the data to when writing to the HDFS
  /// cluster. By default, data is replicated to three DataNodes.
  ///
  /// Parameter [simpleUser] :
  /// The user name used to identify the client on the host operating system.
  /// <note>
  /// If <code>SIMPLE</code> is specified for <code>AuthenticationType</code>,
  /// this parameter is required.
  /// </note>
  ///
  /// Parameter [subdirectory] :
  /// A subdirectory in the HDFS cluster. This subdirectory is used to read data
  /// from or write data to the HDFS cluster. If the subdirectory isn't
  /// specified, it will default to <code>/</code>.
  ///
  /// Parameter [tags] :
  /// The key-value pair that represents the tag that you want to add to the
  /// location. The value can be an empty string. We recommend using tags to
  /// name your resources.
  Future<CreateLocationHdfsResponse> createLocationHdfs({
    required List<String> agentArns,
    required HdfsAuthenticationType authenticationType,
    required List<HdfsNameNode> nameNodes,
    int? blockSize,
    Uint8List? kerberosKeytab,
    Uint8List? kerberosKrb5Conf,
    String? kerberosPrincipal,
    String? kmsKeyProviderUri,
    QopConfiguration? qopConfiguration,
    int? replicationFactor,
    String? simpleUser,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    _s.validateNumRange(
      'blockSize',
      blockSize,
      1048576,
      1073741824,
    );
    _s.validateNumRange(
      'replicationFactor',
      replicationFactor,
      1,
      512,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationHdfs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgentArns': agentArns,
        'AuthenticationType': authenticationType.toValue(),
        'NameNodes': nameNodes,
        if (blockSize != null) 'BlockSize': blockSize,
        if (kerberosKeytab != null)
          'KerberosKeytab': base64Encode(kerberosKeytab),
        if (kerberosKrb5Conf != null)
          'KerberosKrb5Conf': base64Encode(kerberosKrb5Conf),
        if (kerberosPrincipal != null) 'KerberosPrincipal': kerberosPrincipal,
        if (kmsKeyProviderUri != null) 'KmsKeyProviderUri': kmsKeyProviderUri,
        if (qopConfiguration != null) 'QopConfiguration': qopConfiguration,
        if (replicationFactor != null) 'ReplicationFactor': replicationFactor,
        if (simpleUser != null) 'SimpleUser': simpleUser,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationHdfsResponse.fromJson(jsonResponse.body);
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
  /// If you are copying data to or from your Snowcone device, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#nfs-on-snowcone">NFS
  /// Server on Snowcone</a> for more information.
  ///
  /// Parameter [serverHostname] :
  /// The name of the NFS server. This value is the IP address or Domain Name
  /// Service (DNS) name of the NFS server. An agent that is installed
  /// on-premises uses this hostname to mount the NFS server in a network.
  ///
  /// If you are copying data to or from your Snowcone device, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#nfs-on-snowcone">NFS
  /// Server on Snowcone</a> for more information.
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
  /// If you are copying data to or from your Snowcone device, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#nfs-on-snowcone">NFS
  /// Server on Snowcone</a> for more information.
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

  /// Creates an endpoint for an object storage system that DataSync can access
  /// for a transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html">Creating
  /// a location for object storage</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArns] :
  /// Specifies the Amazon Resource Names (ARNs) of the DataSync agents that can
  /// securely connect with your location.
  ///
  /// Parameter [bucketName] :
  /// Specifies the name of the object storage bucket involved in the transfer.
  ///
  /// Parameter [serverHostname] :
  /// Specifies the domain name or IP address of the object storage server. A
  /// DataSync agent uses this hostname to mount the object storage server in a
  /// network.
  ///
  /// Parameter [accessKey] :
  /// Specifies the access key (for example, a user name) if credentials are
  /// required to authenticate with the object storage server.
  ///
  /// Parameter [secretKey] :
  /// Specifies the secret key (for example, a password) if credentials are
  /// required to authenticate with the object storage server.
  ///
  /// Parameter [serverCertificate] :
  /// Specifies a certificate to authenticate with an object storage system that
  /// uses a private or self-signed certificate authority (CA). You must specify
  /// a Base64-encoded <code>.pem</code> file (for example,
  /// <code>file:///home/user/.ssh/storage_sys_certificate.pem</code>). The
  /// certificate can be up to 32768 bytes (before Base64 encoding).
  ///
  /// To use this parameter, configure <code>ServerProtocol</code> to
  /// <code>HTTPS</code>.
  ///
  /// Parameter [serverPort] :
  /// Specifies the port that your object storage server accepts inbound network
  /// traffic on (for example, port 443).
  ///
  /// Parameter [serverProtocol] :
  /// Specifies the protocol that your object storage server uses to
  /// communicate.
  ///
  /// Parameter [subdirectory] :
  /// Specifies the object prefix for your object storage server. If this is a
  /// source location, DataSync only copies objects with this prefix. If this is
  /// a destination location, DataSync writes all objects with this prefix.
  ///
  /// Parameter [tags] :
  /// Specifies the key-value pair that represents a tag that you want to add to
  /// the resource. Tags can help you manage, filter, and search for your
  /// resources. We recommend creating a name tag for your location.
  Future<CreateLocationObjectStorageResponse> createLocationObjectStorage({
    required List<String> agentArns,
    required String bucketName,
    required String serverHostname,
    String? accessKey,
    String? secretKey,
    Uint8List? serverCertificate,
    int? serverPort,
    ObjectStorageServerProtocol? serverProtocol,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    _s.validateNumRange(
      'serverPort',
      serverPort,
      1,
      65536,
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
        if (serverCertificate != null)
          'ServerCertificate': base64Encode(serverCertificate),
        if (serverPort != null) 'ServerPort': serverPort,
        if (serverProtocol != null) 'ServerProtocol': serverProtocol.toValue(),
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationObjectStorageResponse.fromJson(jsonResponse.body);
  }

  /// A <i>location</i> is an endpoint for an Amazon S3 bucket. DataSync can use
  /// the location as a source or destination for copying data.
  /// <important>
  /// Before you create your location, make sure that you read the following
  /// sections:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Storage
  /// class considerations with Amazon S3 locations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests">Evaluating
  /// S3 request costs when using DataSync</a>
  /// </li>
  /// </ul> </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-locations-cli.html#create-location-s3-cli">Creating
  /// an Amazon S3 location</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3BucketArn] :
  /// The ARN of the Amazon S3 bucket. If the bucket is on an Amazon Web
  /// Services Outpost, this must be an access point ARN.
  ///
  /// Parameter [agentArns] :
  /// If you're using DataSync on an Amazon Web Services Outpost, specify the
  /// Amazon Resource Names (ARNs) of the DataSync agents deployed on your
  /// Outpost. For more information about launching a DataSync agent on an
  /// Amazon Web Services Outpost, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/deploy-agents.html#outposts-agent">Deploy
  /// your DataSync agent on Outposts</a>.
  ///
  /// Parameter [s3StorageClass] :
  /// The Amazon S3 storage class that you want to store your files in when this
  /// location is used as a task destination. For buckets in Amazon Web Services
  /// Regions, the storage class defaults to Standard. For buckets on Outposts,
  /// the storage class defaults to Amazon Web Services S3 Outposts.
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

  /// Creates an endpoint for a Server Message Block (SMB) file server that
  /// DataSync can access for a transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html">Creating
  /// an SMB location</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArns] :
  /// Specifies the DataSync agent (or agents) which you want to connect to your
  /// SMB file server. You specify an agent by using its Amazon Resource Name
  /// (ARN).
  ///
  /// Parameter [password] :
  /// Specifies the password of the user who can mount your SMB file server and
  /// has permission to access the files and folders involved in your transfer.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">required
  /// permissions</a> for SMB locations.
  ///
  /// Parameter [serverHostname] :
  /// Specifies the Domain Name Service (DNS) name or IP address of the SMB file
  /// server that your DataSync agent will mount.
  /// <note>
  /// You can't specify an IP version 6 (IPv6) address.
  /// </note>
  ///
  /// Parameter [subdirectory] :
  /// Specifies the name of the share exported by your SMB file server where
  /// DataSync will read or write data. You can include a subdirectory in the
  /// share path (for example, <code>/path/to/subdirectory</code>). Make sure
  /// that other SMB clients in your network can also mount this path.
  ///
  /// To copy all data in the specified subdirectory, DataSync must be able to
  /// mount the SMB share and access all of its data. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">required
  /// permissions</a> for SMB locations.
  ///
  /// Parameter [user] :
  /// Specifies the user name that can mount your SMB file server and has
  /// permission to access the files and folders involved in your transfer.
  ///
  /// For information about choosing a user with the right level of access for
  /// your transfer, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">required
  /// permissions</a> for SMB locations.
  ///
  /// Parameter [domain] :
  /// Specifies the Windows domain name that your SMB file server belongs to.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">required
  /// permissions</a> for SMB locations.
  ///
  /// Parameter [mountOptions] :
  /// Specifies the version of the SMB protocol that DataSync uses to access
  /// your SMB file server.
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least a name tag
  /// for your location.
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

  /// Configures a task, which defines where and how DataSync transfers your
  /// data.
  ///
  /// A task includes a source location, a destination location, and the
  /// preferences for how and when you want to transfer your data (such as
  /// bandwidth limits, scheduling, among other options).
  /// <important>
  /// If you're planning to transfer data to or from an Amazon S3 location,
  /// review <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests">how
  /// DataSync can affect your S3 request charges</a> and the <a
  /// href="http://aws.amazon.com/datasync/pricing/">DataSync pricing page</a>
  /// before you begin.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [destinationLocationArn] :
  /// The Amazon Resource Name (ARN) of an Amazon Web Services storage
  /// resource's location.
  ///
  /// Parameter [sourceLocationArn] :
  /// The Amazon Resource Name (ARN) of the source location for the task.
  ///
  /// Parameter [cloudWatchLogGroupArn] :
  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that is
  /// used to monitor and log events in the task.
  ///
  /// Parameter [excludes] :
  /// Specifies a list of filter rules that exclude specific data during your
  /// transfer. For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  ///
  /// Parameter [includes] :
  /// Specifies a list of filter rules that include specific data during your
  /// transfer. For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  ///
  /// Parameter [name] :
  /// The name of a task. This value is a text reference that is used to
  /// identify the task in the console.
  ///
  /// Parameter [options] :
  /// Specifies the configuration options for a task. Some options include
  /// preserving file or object metadata and verifying data integrity.
  ///
  /// You can also override these options before starting an individual run of a
  /// task (also known as a <i>task execution</i>). For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_StartTaskExecution.html">StartTaskExecution</a>.
  ///
  /// Parameter [schedule] :
  /// Specifies a schedule used to periodically transfer files from a source to
  /// a destination location. The schedule should be specified in UTC time. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">Scheduling
  /// your task</a>.
  ///
  /// Parameter [tags] :
  /// Specifies the tags that you want to apply to the Amazon Resource Name
  /// (ARN) representing the task.
  ///
  /// <i>Tags</i> are key-value pairs that help you manage, filter, and search
  /// for your DataSync resources.
  Future<CreateTaskResponse> createTask({
    required String destinationLocationArn,
    required String sourceLocationArn,
    String? cloudWatchLogGroupArn,
    List<FilterRule>? excludes,
    List<FilterRule>? includes,
    String? name,
    Options? options,
    TaskSchedule? schedule,
    List<TagListEntry>? tags,
  }) async {
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
        if (includes != null) 'Includes': includes,
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
  /// disassociates the agent from your Amazon Web Services account. However, it
  /// doesn't delete the agent virtual machine (VM) from your on-premises
  /// environment.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArn] :
  /// The Amazon Resource Name (ARN) of the agent to delete. Use the
  /// <code>ListAgents</code> operation to return a list of agents for your
  /// account and Amazon Web Services Region.
  Future<void> deleteAgent({
    required String agentArn,
  }) async {
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

  /// Deletes the configuration of a location used by DataSync.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the location to delete.
  Future<void> deleteLocation({
    required String locationArn,
  }) async {
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

  /// Deletes an DataSync task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskArn] :
  /// Specifies the Amazon Resource Name (ARN) of the task that you want to
  /// delete.
  Future<void> deleteTask({
    required String taskArn,
  }) async {
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

  /// Returns metadata about an DataSync agent, such as its name, endpoint type,
  /// and status.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArn] :
  /// Specifies the Amazon Resource Name (ARN) of the DataSync agent to
  /// describe.
  Future<DescribeAgentResponse> describeAgent({
    required String agentArn,
  }) async {
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

  /// Returns information about a DataSync discovery job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [discoveryJobArn] :
  /// Specifies the Amazon Resource Name (ARN) of the discovery job that you
  /// want information about.
  Future<DescribeDiscoveryJobResponse> describeDiscoveryJob({
    required String discoveryJobArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeDiscoveryJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiscoveryJobArn': discoveryJobArn,
      },
    );

    return DescribeDiscoveryJobResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata about your DataSync location for an Amazon EFS file
  /// system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the Amazon EFS file system location that
  /// you want information about.
  Future<DescribeLocationEfsResponse> describeLocationEfs({
    required String locationArn,
  }) async {
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

  /// Provides details about how an DataSync location for an Amazon FSx for
  /// Lustre file system is configured.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the FSx for Lustre location to describe.
  Future<DescribeLocationFsxLustreResponse> describeLocationFsxLustre({
    required String locationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationFsxLustre'
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

    return DescribeLocationFsxLustreResponse.fromJson(jsonResponse.body);
  }

  /// Provides details about how an DataSync location for an Amazon FSx for
  /// NetApp ONTAP file system is configured.
  /// <note>
  /// If your location uses SMB, the <code>DescribeLocationFsxOntap</code>
  /// operation doesn't actually return a <code>Password</code>.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the FSx for ONTAP file system
  /// location that you want information about.
  Future<DescribeLocationFsxOntapResponse> describeLocationFsxOntap({
    required String locationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationFsxOntap'
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

    return DescribeLocationFsxOntapResponse.fromJson(jsonResponse.body);
  }

  /// Provides details about how an DataSync location for an Amazon FSx for
  /// OpenZFS file system is configured.
  /// <note>
  /// Response elements related to <code>SMB</code> aren't supported with the
  /// <code>DescribeLocationFsxOpenZfs</code> operation.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the FSx for OpenZFS location to
  /// describe.
  Future<DescribeLocationFsxOpenZfsResponse> describeLocationFsxOpenZfs({
    required String locationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationFsxOpenZfs'
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

    return DescribeLocationFsxOpenZfsResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata about an Amazon FSx for Windows File Server location,
  /// such as information about its path.
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

  /// Returns metadata, such as the authentication information about the Hadoop
  /// Distributed File System (HDFS) location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the HDFS cluster location to describe.
  Future<DescribeLocationHdfsResponse> describeLocationHdfs({
    required String locationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationHdfs'
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

    return DescribeLocationHdfsResponse.fromJson(jsonResponse.body);
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

  /// Returns metadata about your DataSync location for an object storage
  /// system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the object storage system location that
  /// you want information about.
  Future<DescribeLocationObjectStorageResponse> describeLocationObjectStorage({
    required String locationArn,
  }) async {
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

  /// Returns information about an on-premises storage system that you're using
  /// with DataSync Discovery.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [storageSystemArn] :
  /// Specifies the Amazon Resource Name (ARN) of an on-premises storage system
  /// that you're using with DataSync Discovery.
  Future<DescribeStorageSystemResponse> describeStorageSystem({
    required String storageSystemArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeStorageSystem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StorageSystemArn': storageSystemArn,
      },
    );

    return DescribeStorageSystemResponse.fromJson(jsonResponse.body);
  }

  /// Returns information, including performance data and capacity usage, which
  /// DataSync Discovery collects about a specific resource in your-premises
  /// storage system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [discoveryJobArn] :
  /// Specifies the Amazon Resource Name (ARN) of the discovery job that
  /// collects information about your on-premises storage system.
  ///
  /// Parameter [resourceId] :
  /// Specifies the universally unique identifier (UUID) of the storage system
  /// resource that you want information about.
  ///
  /// Parameter [resourceType] :
  /// Specifies the kind of storage system resource that you want information
  /// about.
  ///
  /// Parameter [endTime] :
  /// Specifies a time within the total duration that the discovery job ran. To
  /// see information gathered during a certain time frame, use this parameter
  /// with <code>StartTime</code>.
  ///
  /// Parameter [maxResults] :
  /// Specifies how many results that you want in the response.
  ///
  /// Parameter [nextToken] :
  /// Specifies an opaque string that indicates the position to begin the next
  /// list of results in the response.
  ///
  /// Parameter [startTime] :
  /// Specifies a time within the total duration that the discovery job ran. To
  /// see information gathered during a certain time frame, use this parameter
  /// with <code>EndTime</code>.
  Future<DescribeStorageSystemResourceMetricsResponse>
      describeStorageSystemResourceMetrics({
    required String discoveryJobArn,
    required String resourceId,
    required DiscoveryResourceType resourceType,
    DateTime? endTime,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeStorageSystemResourceMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiscoveryJobArn': discoveryJobArn,
        'ResourceId': resourceId,
        'ResourceType': resourceType.toValue(),
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return DescribeStorageSystemResourceMetricsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns information that DataSync Discovery collects about resources in
  /// your on-premises storage system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [discoveryJobArn] :
  /// Specifies the Amazon Resource Name (ARN) of the discovery job that's
  /// collecting data from your on-premises storage system.
  ///
  /// Parameter [resourceType] :
  /// Specifies what kind of storage system resources that you want information
  /// about.
  ///
  /// Parameter [filter] :
  /// Filters the storage system resources that you want returned. For example,
  /// this might be volumes associated with a specific storage virtual machine
  /// (SVM).
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of storage system resources that you want to
  /// list in a response.
  ///
  /// Parameter [nextToken] :
  /// Specifies an opaque string that indicates the position to begin the next
  /// list of results in the response.
  ///
  /// Parameter [resourceIds] :
  /// Specifies the universally unique identifiers (UUIDs) of the storage system
  /// resources that you want information about. You can't use this parameter in
  /// combination with the <code>Filter</code> parameter.
  Future<DescribeStorageSystemResourcesResponse>
      describeStorageSystemResources({
    required String discoveryJobArn,
    required DiscoveryResourceType resourceType,
    Map<DiscoveryResourceFilter, List<String>>? filter,
    int? maxResults,
    String? nextToken,
    List<String>? resourceIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeStorageSystemResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiscoveryJobArn': discoveryJobArn,
        'ResourceType': resourceType.toValue(),
        if (filter != null)
          'Filter': filter.map((k, e) => MapEntry(k.toValue(), e)),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceIds != null) 'ResourceIds': resourceIds,
      },
    );

    return DescribeStorageSystemResourcesResponse.fromJson(jsonResponse.body);
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

  /// Creates recommendations about where to migrate your data to in Amazon Web
  /// Services. Recommendations are generated based on information that DataSync
  /// Discovery collects about your on-premises storage system's resources. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-understand-recommendations.html">Recommendations
  /// provided by DataSync Discovery</a>.
  ///
  /// Once generated, you can view your recommendations by using the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeStorageSystemResources.html">DescribeStorageSystemResources</a>
  /// operation.
  /// <note>
  /// If your <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-job-statuses.html#discovery-job-statuses-table">discovery
  /// job completes successfully</a>, you don't need to use this operation.
  /// DataSync Discovery generates the recommendations for you automatically.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [discoveryJobArn] :
  /// Specifies the Amazon Resource Name (ARN) of the discovery job that
  /// collects information about your on-premises storage system.
  ///
  /// Parameter [resourceIds] :
  /// Specifies the universally unique identifiers (UUIDs) of the resources in
  /// your storage system that you want recommendations on.
  ///
  /// Parameter [resourceType] :
  /// Specifies the type of resource in your storage system that you want
  /// recommendations on.
  Future<void> generateRecommendations({
    required String discoveryJobArn,
    required List<String> resourceIds,
    required DiscoveryResourceType resourceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.GenerateRecommendations'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiscoveryJobArn': discoveryJobArn,
        'ResourceIds': resourceIds,
        'ResourceType': resourceType.toValue(),
      },
    );
  }

  /// Returns a list of DataSync agents that belong to an Amazon Web Services
  /// account in the Amazon Web Services Region specified in the request.
  ///
  /// With pagination, you can reduce the number of agents returned in a
  /// response. If you get a truncated list of agents in a response, the
  /// response contains a marker that you can specify in your next request to
  /// fetch the next page of agents.
  ///
  /// <code>ListAgents</code> is eventually consistent. This means the result of
  /// running the operation might not reflect that you just created or deleted
  /// an agent. For example, if you create an agent with <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateAgent.html">CreateAgent</a>
  /// and then immediately run <code>ListAgents</code>, that agent might not
  /// show up in the list right away. In situations like this, you can always
  /// confirm whether an agent has been created (or deleted) by using <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeAgent.html">DescribeAgent</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of DataSync agents to list in a response. By
  /// default, a response shows a maximum of 100 agents.
  ///
  /// Parameter [nextToken] :
  /// Specifies an opaque string that indicates the position to begin the next
  /// list of results in the response.
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

  /// Provides a list of the existing discovery jobs in the Amazon Web Services
  /// Region and Amazon Web Services account where you're using DataSync
  /// Discovery.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// Specifies how many results you want in the response.
  ///
  /// Parameter [nextToken] :
  /// Specifies an opaque string that indicates the position to begin the next
  /// list of results in the response.
  ///
  /// Parameter [storageSystemArn] :
  /// Specifies the Amazon Resource Name (ARN) of an on-premises storage system.
  /// Use this parameter if you only want to list the discovery jobs that are
  /// associated with a specific storage system.
  Future<ListDiscoveryJobsResponse> listDiscoveryJobs({
    int? maxResults,
    String? nextToken,
    String? storageSystemArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.ListDiscoveryJobs'
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
        if (storageSystemArn != null) 'StorageSystemArn': storageSystemArn,
      },
    );

    return ListDiscoveryJobsResponse.fromJson(jsonResponse.body);
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

  /// Lists the on-premises storage systems that you're using with DataSync
  /// Discovery.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// Specifies how many results you want in the response.
  ///
  /// Parameter [nextToken] :
  /// Specifies an opaque string that indicates the position to begin the next
  /// list of results in the response.
  Future<ListStorageSystemsResponse> listStorageSystems({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.ListStorageSystems'
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

    return ListStorageSystemsResponse.fromJson(jsonResponse.body);
  }

  /// Returns all the tags associated with an Amazon Web Services resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [resourceArn] :
  /// Specifies the Amazon Resource Name (ARN) of the resource that you want tag
  /// information on.
  ///
  /// Parameter [maxResults] :
  /// Specifies how many results that you want in the response.
  ///
  /// Parameter [nextToken] :
  /// Specifies an opaque string that indicates the position to begin the next
  /// list of results in the response.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
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

  /// Returns a list of the DataSync tasks you created.
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

  /// Permanently removes a storage system resource from DataSync Discovery,
  /// including the associated discovery jobs, collected data, and
  /// recommendations.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [storageSystemArn] :
  /// Specifies the Amazon Resource Name (ARN) of the storage system that you
  /// want to permanently remove from DataSync Discovery.
  Future<void> removeStorageSystem({
    required String storageSystemArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.RemoveStorageSystem'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StorageSystemArn': storageSystemArn,
      },
    );
  }

  /// Runs a DataSync discovery job on your on-premises storage system. If you
  /// haven't added the storage system to DataSync Discovery yet, do this first
  /// by using the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_AddStorageSystem.html">AddStorageSystem</a>
  /// operation.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [collectionDurationMinutes] :
  /// Specifies in minutes how long you want the discovery job to run.
  /// <note>
  /// For more accurate recommendations, we recommend a duration of at least 14
  /// days. Longer durations allow time to collect a sufficient number of data
  /// points and provide a realistic representation of storage performance and
  /// utilization.
  /// </note>
  ///
  /// Parameter [storageSystemArn] :
  /// Specifies the Amazon Resource Name (ARN) of the on-premises storage system
  /// that you want to run the discovery job on.
  ///
  /// Parameter [clientToken] :
  /// Specifies a client token to make sure requests with this API operation are
  /// idempotent. If you don't specify a client token, DataSync generates one
  /// for you automatically.
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources.
  Future<StartDiscoveryJobResponse> startDiscoveryJob({
    required int collectionDurationMinutes,
    required String storageSystemArn,
    String? clientToken,
    List<TagListEntry>? tags,
  }) async {
    _s.validateNumRange(
      'collectionDurationMinutes',
      collectionDurationMinutes,
      60,
      44640,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.StartDiscoveryJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionDurationMinutes': collectionDurationMinutes,
        'StorageSystemArn': storageSystemArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return StartDiscoveryJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an DataSync task. For each task, you can only run one task
  /// execution at a time.
  ///
  /// There are several phases to a task execution. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/working-with-task-executions.html#understand-task-execution-statuses">Task
  /// execution statuses</a>.
  /// <important>
  /// If you're planning to transfer data to or from an Amazon S3 location,
  /// review <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests">how
  /// DataSync can affect your S3 request charges</a> and the <a
  /// href="http://aws.amazon.com/datasync/pricing/">DataSync pricing page</a>
  /// before you begin.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskArn] :
  /// Specifies the Amazon Resource Name (ARN) of the task that you want to
  /// start.
  ///
  /// Parameter [excludes] :
  /// Specifies a list of filter rules that determines which files to exclude
  /// from a task. The list contains a single filter string that consists of the
  /// patterns to exclude. The patterns are delimited by "|" (that is, a pipe),
  /// for example, <code>"/folder1|/folder2"</code>.
  ///
  /// Parameter [includes] :
  /// Specifies a list of filter rules that determines which files to include
  /// when running a task. The pattern should contain a single filter string
  /// that consists of the patterns to include. The patterns are delimited by
  /// "|" (that is, a pipe), for example, <code>"/folder1|/folder2"</code>.
  ///
  /// Parameter [tags] :
  /// Specifies the tags that you want to apply to the Amazon Resource Name
  /// (ARN) representing the task execution.
  ///
  /// <i>Tags</i> are key-value pairs that help you manage, filter, and search
  /// for your DataSync resources.
  Future<StartTaskExecutionResponse> startTaskExecution({
    required String taskArn,
    List<FilterRule>? excludes,
    List<FilterRule>? includes,
    Options? overrideOptions,
    List<TagListEntry>? tags,
  }) async {
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
        if (excludes != null) 'Excludes': excludes,
        if (includes != null) 'Includes': includes,
        if (overrideOptions != null) 'OverrideOptions': overrideOptions,
        if (tags != null) 'Tags': tags,
      },
    );

    return StartTaskExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Stops a running DataSync discovery job.
  ///
  /// You can stop a discovery job anytime. A job that's stopped before it's
  /// scheduled to end likely will provide you some information about your
  /// on-premises storage system resources. To get recommendations for a stopped
  /// job, you must use the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_GenerateRecommendations.html">GenerateRecommendations</a>
  /// operation.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [discoveryJobArn] :
  /// Specifies the Amazon Resource Name (ARN) of the discovery job that you
  /// want to stop.
  Future<void> stopDiscoveryJob({
    required String discoveryJobArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.StopDiscoveryJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiscoveryJobArn': discoveryJobArn,
      },
    );
  }

  /// Applies a <i>tag</i> to an Amazon Web Services resource. Tags are
  /// key-value pairs that can help you manage, filter, and search for your
  /// resources.
  ///
  /// These include DataSync resources, such as locations, tasks, and task
  /// executions.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [resourceArn] :
  /// Specifies the Amazon Resource Name (ARN) of the resource to apply the tag
  /// to.
  ///
  /// Parameter [tags] :
  /// Specifies the tags that you want to apply to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<TagListEntry> tags,
  }) async {
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

  /// Removes tags from an Amazon Web Services resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [keys] :
  /// Specifies the keys in the tags that you want to remove.
  ///
  /// Parameter [resourceArn] :
  /// Specifies the Amazon Resource Name (ARN) of the resource to remove the
  /// tags from.
  Future<void> untagResource({
    required List<String> keys,
    required String resourceArn,
  }) async {
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

  /// Edits a DataSync discovery job configuration.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [collectionDurationMinutes] :
  /// Specifies in minutes how long that you want the discovery job to run. (You
  /// can't set this parameter to less than the number of minutes that the job
  /// has already run for.)
  ///
  /// Parameter [discoveryJobArn] :
  /// Specifies the Amazon Resource Name (ARN) of the discovery job that you
  /// want to update.
  Future<void> updateDiscoveryJob({
    required int collectionDurationMinutes,
    required String discoveryJobArn,
  }) async {
    _s.validateNumRange(
      'collectionDurationMinutes',
      collectionDurationMinutes,
      60,
      44640,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateDiscoveryJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionDurationMinutes': collectionDurationMinutes,
        'DiscoveryJobArn': discoveryJobArn,
      },
    );
  }

  /// Updates some parameters of a previously created location for a Hadoop
  /// Distributed File System cluster.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the source HDFS cluster location.
  ///
  /// Parameter [agentArns] :
  /// The ARNs of the agents that are used to connect to the HDFS cluster.
  ///
  /// Parameter [authenticationType] :
  /// The type of authentication used to determine the identity of the user.
  ///
  /// Parameter [blockSize] :
  /// The size of the data blocks to write into the HDFS cluster.
  ///
  /// Parameter [kerberosKeytab] :
  /// The Kerberos key table (keytab) that contains mappings between the defined
  /// Kerberos principal and the encrypted keys. You can load the keytab from a
  /// file by providing the file's address. If you use the CLI, it performs
  /// base64 encoding for you. Otherwise, provide the base64-encoded text.
  ///
  /// Parameter [kerberosKrb5Conf] :
  /// The <code>krb5.conf</code> file that contains the Kerberos configuration
  /// information. You can load the <code>krb5.conf</code> file by providing the
  /// file's address. If you're using the CLI, it performs the base64 encoding
  /// for you. Otherwise, provide the base64-encoded text.
  ///
  /// Parameter [kerberosPrincipal] :
  /// The Kerberos principal with access to the files and folders on the HDFS
  /// cluster.
  ///
  /// Parameter [kmsKeyProviderUri] :
  /// The URI of the HDFS cluster's Key Management Server (KMS).
  ///
  /// Parameter [nameNodes] :
  /// The NameNode that manages the HDFS namespace. The NameNode performs
  /// operations such as opening, closing, and renaming files and directories.
  /// The NameNode contains the information to map blocks of data to the
  /// DataNodes. You can use only one NameNode.
  ///
  /// Parameter [qopConfiguration] :
  /// The Quality of Protection (QOP) configuration specifies the Remote
  /// Procedure Call (RPC) and data transfer privacy settings configured on the
  /// Hadoop Distributed File System (HDFS) cluster.
  ///
  /// Parameter [replicationFactor] :
  /// The number of DataNodes to replicate the data to when writing to the HDFS
  /// cluster.
  ///
  /// Parameter [simpleUser] :
  /// The user name used to identify the client on the host operating system.
  ///
  /// Parameter [subdirectory] :
  /// A subdirectory in the HDFS cluster. This subdirectory is used to read data
  /// from or write data to the HDFS cluster.
  Future<void> updateLocationHdfs({
    required String locationArn,
    List<String>? agentArns,
    HdfsAuthenticationType? authenticationType,
    int? blockSize,
    Uint8List? kerberosKeytab,
    Uint8List? kerberosKrb5Conf,
    String? kerberosPrincipal,
    String? kmsKeyProviderUri,
    List<HdfsNameNode>? nameNodes,
    QopConfiguration? qopConfiguration,
    int? replicationFactor,
    String? simpleUser,
    String? subdirectory,
  }) async {
    _s.validateNumRange(
      'blockSize',
      blockSize,
      1048576,
      1073741824,
    );
    _s.validateNumRange(
      'replicationFactor',
      replicationFactor,
      1,
      512,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationHdfs'
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
        if (authenticationType != null)
          'AuthenticationType': authenticationType.toValue(),
        if (blockSize != null) 'BlockSize': blockSize,
        if (kerberosKeytab != null)
          'KerberosKeytab': base64Encode(kerberosKeytab),
        if (kerberosKrb5Conf != null)
          'KerberosKrb5Conf': base64Encode(kerberosKrb5Conf),
        if (kerberosPrincipal != null) 'KerberosPrincipal': kerberosPrincipal,
        if (kmsKeyProviderUri != null) 'KmsKeyProviderUri': kmsKeyProviderUri,
        if (nameNodes != null) 'NameNodes': nameNodes,
        if (qopConfiguration != null) 'QopConfiguration': qopConfiguration,
        if (replicationFactor != null) 'ReplicationFactor': replicationFactor,
        if (simpleUser != null) 'SimpleUser': simpleUser,
        if (subdirectory != null) 'Subdirectory': subdirectory,
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
  /// If you are copying data to or from your Snowcone device, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#nfs-on-snowcone">NFS
  /// Server on Snowcone</a> for more information.
  ///
  /// For information about NFS export configuration, see 18.7. The /etc/exports
  /// Configuration File in the Red Hat Enterprise Linux documentation.
  Future<void> updateLocationNfs({
    required String locationArn,
    NfsMountOptions? mountOptions,
    OnPremConfig? onPremConfig,
    String? subdirectory,
  }) async {
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

  /// Updates some parameters of an existing object storage location that
  /// DataSync accesses for a transfer. For information about creating a
  /// self-managed object storage location, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html">Creating
  /// a location for object storage</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the ARN of the object storage system location that you're
  /// updating.
  ///
  /// Parameter [accessKey] :
  /// Specifies the access key (for example, a user name) if credentials are
  /// required to authenticate with the object storage server.
  ///
  /// Parameter [agentArns] :
  /// Specifies the Amazon Resource Names (ARNs) of the DataSync agents that can
  /// securely connect with your location.
  ///
  /// Parameter [secretKey] :
  /// Specifies the secret key (for example, a password) if credentials are
  /// required to authenticate with the object storage server.
  ///
  /// Parameter [serverCertificate] :
  /// Specifies a certificate to authenticate with an object storage system that
  /// uses a private or self-signed certificate authority (CA). You must specify
  /// a Base64-encoded <code>.pem</code> file (for example,
  /// <code>file:///home/user/.ssh/storage_sys_certificate.pem</code>). The
  /// certificate can be up to 32768 bytes (before Base64 encoding).
  ///
  /// To use this parameter, configure <code>ServerProtocol</code> to
  /// <code>HTTPS</code>.
  ///
  /// Updating the certificate doesn't interfere with tasks that you have in
  /// progress.
  ///
  /// Parameter [serverPort] :
  /// Specifies the port that your object storage server accepts inbound network
  /// traffic on (for example, port 443).
  ///
  /// Parameter [serverProtocol] :
  /// Specifies the protocol that your object storage server uses to
  /// communicate.
  ///
  /// Parameter [subdirectory] :
  /// Specifies the object prefix for your object storage server. If this is a
  /// source location, DataSync only copies objects with this prefix. If this is
  /// a destination location, DataSync writes all objects with this prefix.
  Future<void> updateLocationObjectStorage({
    required String locationArn,
    String? accessKey,
    List<String>? agentArns,
    String? secretKey,
    Uint8List? serverCertificate,
    int? serverPort,
    ObjectStorageServerProtocol? serverProtocol,
    String? subdirectory,
  }) async {
    _s.validateNumRange(
      'serverPort',
      serverPort,
      1,
      65536,
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
        if (serverCertificate != null)
          'ServerCertificate': base64Encode(serverCertificate),
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

  /// Modifies some configurations of an on-premises storage system resource
  /// that you're using with DataSync Discovery.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [storageSystemArn] :
  /// Specifies the ARN of the on-premises storage system that you want
  /// reconfigure.
  ///
  /// Parameter [agentArns] :
  /// Specifies the Amazon Resource Name (ARN) of the DataSync agent that
  /// connects to and reads your on-premises storage system.
  ///
  /// Parameter [cloudWatchLogGroupArn] :
  /// Specifies the ARN of the Amazon CloudWatch log group for monitoring and
  /// logging discovery job events.
  ///
  /// Parameter [credentials] :
  /// Specifies the user name and password for accessing your on-premises
  /// storage system's management interface.
  ///
  /// Parameter [name] :
  /// Specifies a familiar name for your on-premises storage system.
  ///
  /// Parameter [serverConfiguration] :
  /// Specifies the server name and network port required to connect with your
  /// on-premises storage system's management interface.
  Future<void> updateStorageSystem({
    required String storageSystemArn,
    List<String>? agentArns,
    String? cloudWatchLogGroupArn,
    Credentials? credentials,
    String? name,
    DiscoveryServerConfiguration? serverConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateStorageSystem'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StorageSystemArn': storageSystemArn,
        if (agentArns != null) 'AgentArns': agentArns,
        if (cloudWatchLogGroupArn != null)
          'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
        if (credentials != null) 'Credentials': credentials,
        if (name != null) 'Name': name,
        if (serverConfiguration != null)
          'ServerConfiguration': serverConfiguration,
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
  /// The Amazon Resource Name (ARN) of the resource name of the Amazon
  /// CloudWatch log group.
  ///
  /// Parameter [excludes] :
  /// Specifies a list of filter rules that exclude specific data during your
  /// transfer. For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  ///
  /// Parameter [includes] :
  /// Specifies a list of filter rules that include specific data during your
  /// transfer. For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
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
    List<FilterRule>? includes,
    String? name,
    Options? options,
    TaskSchedule? schedule,
  }) async {
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
        if (includes != null) 'Includes': includes,
        if (name != null) 'Name': name,
        if (options != null) 'Options': options,
        if (schedule != null) 'Schedule': schedule,
      },
    );
  }

  /// Modifies a running DataSync task.
  /// <note>
  /// Currently, the only <code>Option</code> that you can modify with
  /// <code>UpdateTaskExecution</code> is <code> <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-BytesPerSecond">BytesPerSecond</a>
  /// </code>, which throttles bandwidth for a running or queued task.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskExecutionArn] :
  /// Specifies the Amazon Resource Name (ARN) of the task execution that you're
  /// updating.
  Future<void> updateTaskExecution({
    required Options options,
    required String taskExecutionArn,
  }) async {
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

class AddStorageSystemResponse {
  /// The ARN of the on-premises storage system that you can use with DataSync
  /// Discovery.
  final String storageSystemArn;

  AddStorageSystemResponse({
    required this.storageSystemArn,
  });

  factory AddStorageSystemResponse.fromJson(Map<String, dynamic> json) {
    return AddStorageSystemResponse(
      storageSystemArn: json['StorageSystemArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final storageSystemArn = this.storageSystemArn;
    return {
      'StorageSystemArn': storageSystemArn,
    };
  }
}

/// Represents a single entry in a list (or array) of DataSync agents when you
/// call the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListAgents.html">ListAgents</a>
/// operation.
class AgentListEntry {
  /// The Amazon Resource Name (ARN) of a DataSync agent.
  final String? agentArn;

  /// The name of an agent.
  final String? name;

  /// The status of an agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/understand-agent-statuses.html">DataSync
  /// agent statuses</a>.
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

extension AgentStatusValueExtension on AgentStatus {
  String toValue() {
    switch (this) {
      case AgentStatus.online:
        return 'ONLINE';
      case AgentStatus.offline:
        return 'OFFLINE';
    }
  }
}

extension AgentStatusFromString on String {
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

extension AtimeValueExtension on Atime {
  String toValue() {
    switch (this) {
      case Atime.none:
        return 'NONE';
      case Atime.bestEffort:
        return 'BEST_EFFORT';
    }
  }
}

extension AtimeFromString on String {
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

/// The storage capacity of an on-premises storage system resource (for example,
/// a volume).
class Capacity {
  /// The amount of space that's being used in a storage system resource without
  /// accounting for compression or deduplication.
  final int? logicalUsed;

  /// The total amount of space available in a storage system resource.
  final int? provisioned;

  /// The amount of space that's being used in a storage system resource.
  final int? used;

  Capacity({
    this.logicalUsed,
    this.provisioned,
    this.used,
  });

  factory Capacity.fromJson(Map<String, dynamic> json) {
    return Capacity(
      logicalUsed: json['LogicalUsed'] as int?,
      provisioned: json['Provisioned'] as int?,
      used: json['Used'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final logicalUsed = this.logicalUsed;
    final provisioned = this.provisioned;
    final used = this.used;
    return {
      if (logicalUsed != null) 'LogicalUsed': logicalUsed,
      if (provisioned != null) 'Provisioned': provisioned,
      if (used != null) 'Used': used,
    };
  }
}

/// CreateAgentResponse
class CreateAgentResponse {
  /// The Amazon Resource Name (ARN) of the agent. Use the <code>ListAgents</code>
  /// operation to return a list of agents for your account and Amazon Web
  /// Services Region.
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
  /// you create.
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

class CreateLocationFsxLustreResponse {
  /// The Amazon Resource Name (ARN) of the FSx for Lustre file system location
  /// that's created.
  final String? locationArn;

  CreateLocationFsxLustreResponse({
    this.locationArn,
  });

  factory CreateLocationFsxLustreResponse.fromJson(Map<String, dynamic> json) {
    return CreateLocationFsxLustreResponse(
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

class CreateLocationFsxOntapResponse {
  /// Specifies the ARN of the FSx for ONTAP file system location that you create.
  final String? locationArn;

  CreateLocationFsxOntapResponse({
    this.locationArn,
  });

  factory CreateLocationFsxOntapResponse.fromJson(Map<String, dynamic> json) {
    return CreateLocationFsxOntapResponse(
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

class CreateLocationFsxOpenZfsResponse {
  /// The ARN of the FSx for OpenZFS file system location that you created.
  final String? locationArn;

  CreateLocationFsxOpenZfsResponse({
    this.locationArn,
  });

  factory CreateLocationFsxOpenZfsResponse.fromJson(Map<String, dynamic> json) {
    return CreateLocationFsxOpenZfsResponse(
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
  /// The ARN of the FSx for Windows File Server file system location you created.
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

class CreateLocationHdfsResponse {
  /// The ARN of the source HDFS cluster location that's created.
  final String? locationArn;

  CreateLocationHdfsResponse({
    this.locationArn,
  });

  factory CreateLocationHdfsResponse.fromJson(Map<String, dynamic> json) {
    return CreateLocationHdfsResponse(
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
  /// Specifies the ARN of the object storage system location that you create.
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
  /// The ARN of the SMB location that you created.
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

/// The credentials that provide DataSync Discovery read access to your
/// on-premises storage system's management interface.
///
/// DataSync Discovery stores these credentials in <a
/// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">Secrets
/// Manager</a>. For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-configure-storage.html">Accessing
/// your on-premises storage system</a>.
class Credentials {
  /// Specifies the password for your storage system's management interface.
  final String password;

  /// Specifies the user name for your storage system's management interface.
  final String username;

  Credentials({
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      'Password': password,
      'Username': username,
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
  /// The ARN of the agent.
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

class DescribeDiscoveryJobResponse {
  /// The number of minutes that the discovery job runs.
  final int? collectionDurationMinutes;

  /// The ARN of the discovery job.
  final String? discoveryJobArn;

  /// The time when the discovery job ended.
  final DateTime? jobEndTime;

  /// The time when the discovery job started.
  final DateTime? jobStartTime;

  /// Indicates the status of a discovery job. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-job-statuses.html#discovery-job-statuses-table">Discovery
  /// job statuses</a>.
  final DiscoveryJobStatus? status;

  /// The ARN of the on-premises storage system you're running the discovery job
  /// on.
  final String? storageSystemArn;

  DescribeDiscoveryJobResponse({
    this.collectionDurationMinutes,
    this.discoveryJobArn,
    this.jobEndTime,
    this.jobStartTime,
    this.status,
    this.storageSystemArn,
  });

  factory DescribeDiscoveryJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDiscoveryJobResponse(
      collectionDurationMinutes: json['CollectionDurationMinutes'] as int?,
      discoveryJobArn: json['DiscoveryJobArn'] as String?,
      jobEndTime: timeStampFromJson(json['JobEndTime']),
      jobStartTime: timeStampFromJson(json['JobStartTime']),
      status: (json['Status'] as String?)?.toDiscoveryJobStatus(),
      storageSystemArn: json['StorageSystemArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionDurationMinutes = this.collectionDurationMinutes;
    final discoveryJobArn = this.discoveryJobArn;
    final jobEndTime = this.jobEndTime;
    final jobStartTime = this.jobStartTime;
    final status = this.status;
    final storageSystemArn = this.storageSystemArn;
    return {
      if (collectionDurationMinutes != null)
        'CollectionDurationMinutes': collectionDurationMinutes,
      if (discoveryJobArn != null) 'DiscoveryJobArn': discoveryJobArn,
      if (jobEndTime != null) 'JobEndTime': unixTimestampToJson(jobEndTime),
      if (jobStartTime != null)
        'JobStartTime': unixTimestampToJson(jobStartTime),
      if (status != null) 'Status': status.toValue(),
      if (storageSystemArn != null) 'StorageSystemArn': storageSystemArn,
    };
  }
}

/// DescribeLocationEfsResponse
class DescribeLocationEfsResponse {
  /// The ARN of the access point that DataSync uses to access the Amazon EFS file
  /// system.
  final String? accessPointArn;

  /// The time that the location was created.
  final DateTime? creationTime;
  final Ec2Config? ec2Config;

  /// The Identity and Access Management (IAM) role that DataSync assumes when
  /// mounting the Amazon EFS file system.
  final String? fileSystemAccessRoleArn;

  /// Describes whether DataSync uses Transport Layer Security (TLS) encryption
  /// when copying data to or from the Amazon EFS file system.
  final EfsInTransitEncryption? inTransitEncryption;

  /// The ARN of the Amazon EFS file system location.
  final String? locationArn;

  /// The URL of the Amazon EFS file system location.
  final String? locationUri;

  DescribeLocationEfsResponse({
    this.accessPointArn,
    this.creationTime,
    this.ec2Config,
    this.fileSystemAccessRoleArn,
    this.inTransitEncryption,
    this.locationArn,
    this.locationUri,
  });

  factory DescribeLocationEfsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLocationEfsResponse(
      accessPointArn: json['AccessPointArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      ec2Config: json['Ec2Config'] != null
          ? Ec2Config.fromJson(json['Ec2Config'] as Map<String, dynamic>)
          : null,
      fileSystemAccessRoleArn: json['FileSystemAccessRoleArn'] as String?,
      inTransitEncryption:
          (json['InTransitEncryption'] as String?)?.toEfsInTransitEncryption(),
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointArn = this.accessPointArn;
    final creationTime = this.creationTime;
    final ec2Config = this.ec2Config;
    final fileSystemAccessRoleArn = this.fileSystemAccessRoleArn;
    final inTransitEncryption = this.inTransitEncryption;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    return {
      if (accessPointArn != null) 'AccessPointArn': accessPointArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (ec2Config != null) 'Ec2Config': ec2Config,
      if (fileSystemAccessRoleArn != null)
        'FileSystemAccessRoleArn': fileSystemAccessRoleArn,
      if (inTransitEncryption != null)
        'InTransitEncryption': inTransitEncryption.toValue(),
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
    };
  }
}

class DescribeLocationFsxLustreResponse {
  /// The time that the FSx for Lustre location was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the FSx for Lustre location that was
  /// described.
  final String? locationArn;

  /// The URI of the FSx for Lustre location that was described.
  final String? locationUri;

  /// The Amazon Resource Names (ARNs) of the security groups that are configured
  /// for the FSx for Lustre file system.
  final List<String>? securityGroupArns;

  DescribeLocationFsxLustreResponse({
    this.creationTime,
    this.locationArn,
    this.locationUri,
    this.securityGroupArns,
  });

  factory DescribeLocationFsxLustreResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLocationFsxLustreResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      securityGroupArns: (json['SecurityGroupArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final securityGroupArns = this.securityGroupArns;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (securityGroupArns != null) 'SecurityGroupArns': securityGroupArns,
    };
  }
}

class DescribeLocationFsxOntapResponse {
  /// The time that the location was created.
  final DateTime? creationTime;

  /// The ARN of the FSx for ONTAP file system.
  final String? fsxFilesystemArn;

  /// The ARN of the FSx for ONTAP file system location.
  final String? locationArn;

  /// The uniform resource identifier (URI) of the FSx for ONTAP file system
  /// location.
  final String? locationUri;
  final FsxProtocol? protocol;

  /// The security groups that DataSync uses to access your FSx for ONTAP file
  /// system.
  final List<String>? securityGroupArns;

  /// The ARN of the storage virtual machine (SVM) on your FSx for ONTAP file
  /// system where you're copying data to or from.
  final String? storageVirtualMachineArn;

  DescribeLocationFsxOntapResponse({
    this.creationTime,
    this.fsxFilesystemArn,
    this.locationArn,
    this.locationUri,
    this.protocol,
    this.securityGroupArns,
    this.storageVirtualMachineArn,
  });

  factory DescribeLocationFsxOntapResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLocationFsxOntapResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      fsxFilesystemArn: json['FsxFilesystemArn'] as String?,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      protocol: json['Protocol'] != null
          ? FsxProtocol.fromJson(json['Protocol'] as Map<String, dynamic>)
          : null,
      securityGroupArns: (json['SecurityGroupArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      storageVirtualMachineArn: json['StorageVirtualMachineArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final fsxFilesystemArn = this.fsxFilesystemArn;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final protocol = this.protocol;
    final securityGroupArns = this.securityGroupArns;
    final storageVirtualMachineArn = this.storageVirtualMachineArn;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (fsxFilesystemArn != null) 'FsxFilesystemArn': fsxFilesystemArn,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (protocol != null) 'Protocol': protocol,
      if (securityGroupArns != null) 'SecurityGroupArns': securityGroupArns,
      if (storageVirtualMachineArn != null)
        'StorageVirtualMachineArn': storageVirtualMachineArn,
    };
  }
}

class DescribeLocationFsxOpenZfsResponse {
  /// The time that the FSx for OpenZFS location was created.
  final DateTime? creationTime;

  /// The ARN of the FSx for OpenZFS location that was described.
  final String? locationArn;

  /// The uniform resource identifier (URI) of the FSx for OpenZFS location that
  /// was described.
  ///
  /// Example:
  /// <code>fsxz://us-west-2.fs-1234567890abcdef02/fsx/folderA/folder</code>
  final String? locationUri;

  /// The type of protocol that DataSync uses to access your file system.
  final FsxProtocol? protocol;

  /// The ARNs of the security groups that are configured for the FSx for OpenZFS
  /// file system.
  final List<String>? securityGroupArns;

  DescribeLocationFsxOpenZfsResponse({
    this.creationTime,
    this.locationArn,
    this.locationUri,
    this.protocol,
    this.securityGroupArns,
  });

  factory DescribeLocationFsxOpenZfsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLocationFsxOpenZfsResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      protocol: json['Protocol'] != null
          ? FsxProtocol.fromJson(json['Protocol'] as Map<String, dynamic>)
          : null,
      securityGroupArns: (json['SecurityGroupArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final protocol = this.protocol;
    final securityGroupArns = this.securityGroupArns;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (protocol != null) 'Protocol': protocol,
      if (securityGroupArns != null) 'SecurityGroupArns': securityGroupArns,
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

class DescribeLocationHdfsResponse {
  /// The ARNs of the agents that are used to connect to the HDFS cluster.
  final List<String>? agentArns;

  /// The type of authentication used to determine the identity of the user.
  final HdfsAuthenticationType? authenticationType;

  /// The size of the data blocks to write into the HDFS cluster.
  final int? blockSize;

  /// The time that the HDFS location was created.
  final DateTime? creationTime;

  /// The Kerberos principal with access to the files and folders on the HDFS
  /// cluster. This parameter is used if the <code>AuthenticationType</code> is
  /// defined as <code>KERBEROS</code>.
  final String? kerberosPrincipal;

  /// The URI of the HDFS cluster's Key Management Server (KMS).
  final String? kmsKeyProviderUri;

  /// The ARN of the HDFS cluster location.
  final String? locationArn;

  /// The URI of the HDFS cluster location.
  final String? locationUri;

  /// The NameNode that manage the HDFS namespace.
  final List<HdfsNameNode>? nameNodes;

  /// The Quality of Protection (QOP) configuration specifies the Remote Procedure
  /// Call (RPC) and data transfer protection settings configured on the Hadoop
  /// Distributed File System (HDFS) cluster.
  final QopConfiguration? qopConfiguration;

  /// The number of DataNodes to replicate the data to when writing to the HDFS
  /// cluster.
  final int? replicationFactor;

  /// The user name used to identify the client on the host operating system. This
  /// parameter is used if the <code>AuthenticationType</code> is defined as
  /// <code>SIMPLE</code>.
  final String? simpleUser;

  DescribeLocationHdfsResponse({
    this.agentArns,
    this.authenticationType,
    this.blockSize,
    this.creationTime,
    this.kerberosPrincipal,
    this.kmsKeyProviderUri,
    this.locationArn,
    this.locationUri,
    this.nameNodes,
    this.qopConfiguration,
    this.replicationFactor,
    this.simpleUser,
  });

  factory DescribeLocationHdfsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLocationHdfsResponse(
      agentArns: (json['AgentArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      authenticationType:
          (json['AuthenticationType'] as String?)?.toHdfsAuthenticationType(),
      blockSize: json['BlockSize'] as int?,
      creationTime: timeStampFromJson(json['CreationTime']),
      kerberosPrincipal: json['KerberosPrincipal'] as String?,
      kmsKeyProviderUri: json['KmsKeyProviderUri'] as String?,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      nameNodes: (json['NameNodes'] as List?)
          ?.whereNotNull()
          .map((e) => HdfsNameNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      qopConfiguration: json['QopConfiguration'] != null
          ? QopConfiguration.fromJson(
              json['QopConfiguration'] as Map<String, dynamic>)
          : null,
      replicationFactor: json['ReplicationFactor'] as int?,
      simpleUser: json['SimpleUser'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentArns = this.agentArns;
    final authenticationType = this.authenticationType;
    final blockSize = this.blockSize;
    final creationTime = this.creationTime;
    final kerberosPrincipal = this.kerberosPrincipal;
    final kmsKeyProviderUri = this.kmsKeyProviderUri;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final nameNodes = this.nameNodes;
    final qopConfiguration = this.qopConfiguration;
    final replicationFactor = this.replicationFactor;
    final simpleUser = this.simpleUser;
    return {
      if (agentArns != null) 'AgentArns': agentArns,
      if (authenticationType != null)
        'AuthenticationType': authenticationType.toValue(),
      if (blockSize != null) 'BlockSize': blockSize,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (kerberosPrincipal != null) 'KerberosPrincipal': kerberosPrincipal,
      if (kmsKeyProviderUri != null) 'KmsKeyProviderUri': kmsKeyProviderUri,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (nameNodes != null) 'NameNodes': nameNodes,
      if (qopConfiguration != null) 'QopConfiguration': qopConfiguration,
      if (replicationFactor != null) 'ReplicationFactor': replicationFactor,
      if (simpleUser != null) 'SimpleUser': simpleUser,
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
  /// The access key (for example, a user name) required to authenticate with the
  /// object storage system.
  final String? accessKey;

  /// The ARNs of the DataSync agents that can securely connect with your
  /// location.
  final List<String>? agentArns;

  /// The time that the location was created.
  final DateTime? creationTime;

  /// The ARN of the object storage system location.
  final String? locationArn;

  /// The URL of the object storage system location.
  final String? locationUri;

  /// The self-signed certificate that DataSync uses to securely authenticate with
  /// your object storage system.
  final Uint8List? serverCertificate;

  /// The port that your object storage server accepts inbound network traffic on
  /// (for example, port 443).
  final int? serverPort;

  /// The protocol that your object storage system uses to communicate.
  final ObjectStorageServerProtocol? serverProtocol;

  DescribeLocationObjectStorageResponse({
    this.accessKey,
    this.agentArns,
    this.creationTime,
    this.locationArn,
    this.locationUri,
    this.serverCertificate,
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
      serverCertificate:
          _s.decodeNullableUint8List(json['ServerCertificate'] as String?),
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
    final serverCertificate = this.serverCertificate;
    final serverPort = this.serverPort;
    final serverProtocol = this.serverProtocol;
    return {
      if (accessKey != null) 'AccessKey': accessKey,
      if (agentArns != null) 'AgentArns': agentArns,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (serverCertificate != null)
        'ServerCertificate': base64Encode(serverCertificate),
      if (serverPort != null) 'ServerPort': serverPort,
      if (serverProtocol != null) 'ServerProtocol': serverProtocol.toValue(),
    };
  }
}

/// DescribeLocationS3Response
class DescribeLocationS3Response {
  /// If you are using DataSync on an Amazon Web Services Outpost, the Amazon
  /// Resource Name (ARNs) of the EC2 agents deployed on your Outpost. For more
  /// information about launching a DataSync agent on an Amazon Web Services
  /// Outpost, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/deploy-agents.html#outposts-agent">Deploy
  /// your DataSync agent on Outposts</a>.
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

class DescribeStorageSystemResourceMetricsResponse {
  /// The details that your discovery job collected about your storage system
  /// resource.
  final List<ResourceMetrics>? metrics;

  /// The opaque string that indicates the position to begin the next list of
  /// results in the response.
  final String? nextToken;

  DescribeStorageSystemResourceMetricsResponse({
    this.metrics,
    this.nextToken,
  });

  factory DescribeStorageSystemResourceMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeStorageSystemResourceMetricsResponse(
      metrics: (json['Metrics'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceMetrics.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final nextToken = this.nextToken;
    return {
      if (metrics != null) 'Metrics': metrics,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeStorageSystemResourcesResponse {
  /// The opaque string that indicates the position to begin the next list of
  /// results in the response.
  final String? nextToken;

  /// The information collected about your storage system's resources. A response
  /// can also include Amazon Web Services storage service recommendations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-understand-findings.html">storage
  /// resource information</a> collected by and <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-understand-recommendations.html">recommendations</a>
  /// provided by DataSync Discovery.
  final ResourceDetails? resourceDetails;

  DescribeStorageSystemResourcesResponse({
    this.nextToken,
    this.resourceDetails,
  });

  factory DescribeStorageSystemResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeStorageSystemResourcesResponse(
      nextToken: json['NextToken'] as String?,
      resourceDetails: json['ResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['ResourceDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceDetails = this.resourceDetails;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceDetails != null) 'ResourceDetails': resourceDetails,
    };
  }
}

class DescribeStorageSystemResponse {
  /// The ARN of the DataSync agent that connects to and reads from your
  /// on-premises storage system.
  final List<String>? agentArns;

  /// The ARN of the Amazon CloudWatch log group that's used to monitor and log
  /// discovery job events.
  final String? cloudWatchLogGroupArn;

  /// Indicates whether your DataSync agent can connect to your on-premises
  /// storage system.
  final StorageSystemConnectivityStatus? connectivityStatus;

  /// The time when you added the on-premises storage system to DataSync
  /// Discovery.
  final DateTime? creationTime;

  /// Describes the connectivity error that the DataSync agent is encountering
  /// with your on-premises storage system.
  final String? errorMessage;

  /// The name that you gave your on-premises storage system when adding it to
  /// DataSync Discovery.
  final String? name;

  /// The ARN of the secret that stores your on-premises storage system's
  /// credentials. DataSync Discovery stores these credentials in <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-configure-storage.html#discovery-add-storage">Secrets
  /// Manager</a>.
  final String? secretsManagerArn;

  /// The server name and network port required to connect with your on-premises
  /// storage system's management interface.
  final DiscoveryServerConfiguration? serverConfiguration;

  /// The ARN of the on-premises storage system that the discovery job looked at.
  final String? storageSystemArn;

  /// The type of on-premises storage system.
  /// <note>
  /// DataSync Discovery currently only supports NetApp Fabric-Attached Storage
  /// (FAS) and All Flash FAS (AFF) systems running ONTAP 9.7 or later.
  /// </note>
  final DiscoverySystemType? systemType;

  DescribeStorageSystemResponse({
    this.agentArns,
    this.cloudWatchLogGroupArn,
    this.connectivityStatus,
    this.creationTime,
    this.errorMessage,
    this.name,
    this.secretsManagerArn,
    this.serverConfiguration,
    this.storageSystemArn,
    this.systemType,
  });

  factory DescribeStorageSystemResponse.fromJson(Map<String, dynamic> json) {
    return DescribeStorageSystemResponse(
      agentArns: (json['AgentArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cloudWatchLogGroupArn: json['CloudWatchLogGroupArn'] as String?,
      connectivityStatus: (json['ConnectivityStatus'] as String?)
          ?.toStorageSystemConnectivityStatus(),
      creationTime: timeStampFromJson(json['CreationTime']),
      errorMessage: json['ErrorMessage'] as String?,
      name: json['Name'] as String?,
      secretsManagerArn: json['SecretsManagerArn'] as String?,
      serverConfiguration: json['ServerConfiguration'] != null
          ? DiscoveryServerConfiguration.fromJson(
              json['ServerConfiguration'] as Map<String, dynamic>)
          : null,
      storageSystemArn: json['StorageSystemArn'] as String?,
      systemType: (json['SystemType'] as String?)?.toDiscoverySystemType(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentArns = this.agentArns;
    final cloudWatchLogGroupArn = this.cloudWatchLogGroupArn;
    final connectivityStatus = this.connectivityStatus;
    final creationTime = this.creationTime;
    final errorMessage = this.errorMessage;
    final name = this.name;
    final secretsManagerArn = this.secretsManagerArn;
    final serverConfiguration = this.serverConfiguration;
    final storageSystemArn = this.storageSystemArn;
    final systemType = this.systemType;
    return {
      if (agentArns != null) 'AgentArns': agentArns,
      if (cloudWatchLogGroupArn != null)
        'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
      if (connectivityStatus != null)
        'ConnectivityStatus': connectivityStatus.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (name != null) 'Name': name,
      if (secretsManagerArn != null) 'SecretsManagerArn': secretsManagerArn,
      if (serverConfiguration != null)
        'ServerConfiguration': serverConfiguration,
      if (storageSystemArn != null) 'StorageSystemArn': storageSystemArn,
      if (systemType != null) 'SystemType': systemType.toValue(),
    };
  }
}

/// DescribeTaskExecutionResponse
class DescribeTaskExecutionResponse {
  /// The physical number of bytes transferred over the network after compression
  /// was applied. In most cases, this number is less than
  /// <code>BytesTransferred</code> unless the data isn't compressible.
  final int? bytesCompressed;

  /// The total number of bytes that are involved in the transfer. For the number
  /// of bytes sent over the network, see <code>BytesCompressed</code>.
  final int? bytesTransferred;

  /// The number of logical bytes written to the destination Amazon Web Services
  /// storage resource.
  final int? bytesWritten;

  /// The estimated physical number of bytes that is to be transferred over the
  /// network.
  final int? estimatedBytesToTransfer;

  /// The expected number of files that is to be transferred over the network.
  /// This value is calculated during the <code>PREPARING</code> phase before the
  /// <code>TRANSFERRING</code> phase of the task execution. This value is the
  /// expected number of files to be transferred. It's calculated based on
  /// comparing the content of the source and destination locations and finding
  /// the delta that needs to be transferred.
  final int? estimatedFilesToTransfer;

  /// A list of filter rules that exclude specific data during your transfer. For
  /// more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  final List<FilterRule>? excludes;

  /// The actual number of files that was transferred over the network. This value
  /// is calculated and updated on an ongoing basis during the
  /// <code>TRANSFERRING</code> phase of the task execution. It's updated
  /// periodically when each file is read from the source and sent over the
  /// network.
  ///
  /// If failures occur during a transfer, this value can be less than
  /// <code>EstimatedFilesToTransfer</code>. In some cases, this value can also be
  /// greater than <code>EstimatedFilesToTransfer</code>. This element is
  /// implementation-specific for some location types, so don't use it as an
  /// indicator for a correct file number or to monitor your task execution.
  final int? filesTransferred;

  /// A list of filter rules that include specific data during your transfer. For
  /// more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  final List<FilterRule>? includes;
  final Options? options;

  /// The result of the task execution.
  final TaskExecutionResultDetail? result;

  /// The time that the task execution was started.
  final DateTime? startTime;

  /// The status of the task execution.
  ///
  /// For detailed information about task execution statuses, see Understanding
  /// Task Statuses in the <i>DataSync User Guide.</i>
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
    this.bytesCompressed,
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
      bytesCompressed: json['BytesCompressed'] as int?,
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
    final bytesCompressed = this.bytesCompressed;
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
      if (bytesCompressed != null) 'BytesCompressed': bytesCompressed,
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

  /// The Amazon Resource Name (ARN) of the task execution that is transferring
  /// files.
  final String? currentTaskExecutionArn;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services storage resource's
  /// location.
  final String? destinationLocationArn;

  /// The Amazon Resource Names (ARNs) of the network interfaces created for your
  /// destination location. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces">Network
  /// interface requirements</a>.
  final List<String>? destinationNetworkInterfaceArns;

  /// Errors that DataSync encountered during execution of the task. You can use
  /// this error code to help troubleshoot issues.
  final String? errorCode;

  /// Detailed description of an error that was encountered during the task
  /// execution. You can use this information to help troubleshoot issues.
  final String? errorDetail;

  /// A list of filter rules that exclude specific data during your transfer. For
  /// more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  final List<FilterRule>? excludes;

  /// A list of filter rules that include specific data during your transfer. For
  /// more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  final List<FilterRule>? includes;

  /// The name of the task that was described.
  final String? name;

  /// The configuration options that control the behavior of the
  /// <code>StartTaskExecution</code> operation. Some options include preserving
  /// file or object metadata and verifying data integrity.
  ///
  /// You can override these options for each task execution. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_StartTaskExecution.html">StartTaskExecution</a>.
  final Options? options;

  /// The schedule used to periodically transfer files from a source to a
  /// destination location.
  final TaskSchedule? schedule;

  /// The Amazon Resource Name (ARN) of the source file system's location.
  final String? sourceLocationArn;

  /// The Amazon Resource Names (ARNs) of the network interfaces created for your
  /// source location. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces">Network
  /// interface requirements</a>.
  final List<String>? sourceNetworkInterfaceArns;

  /// The status of the task that was described.
  ///
  /// For detailed information about task execution statuses, see Understanding
  /// Task Statuses in the <i>DataSync User Guide</i>.
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
    this.includes,
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
      includes: (json['Includes'] as List?)
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
    final includes = this.includes;
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
      if (includes != null) 'Includes': includes,
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

/// The details about a specific DataSync discovery job.
class DiscoveryJobListEntry {
  /// The Amazon Resource Name (ARN) of a discovery job.
  final String? discoveryJobArn;

  /// The status of a discovery job. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-job-statuses.html#discovery-job-statuses-table">Discovery
  /// job statuses</a>.
  final DiscoveryJobStatus? status;

  DiscoveryJobListEntry({
    this.discoveryJobArn,
    this.status,
  });

  factory DiscoveryJobListEntry.fromJson(Map<String, dynamic> json) {
    return DiscoveryJobListEntry(
      discoveryJobArn: json['DiscoveryJobArn'] as String?,
      status: (json['Status'] as String?)?.toDiscoveryJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final discoveryJobArn = this.discoveryJobArn;
    final status = this.status;
    return {
      if (discoveryJobArn != null) 'DiscoveryJobArn': discoveryJobArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum DiscoveryJobStatus {
  running,
  warning,
  terminated,
  failed,
  stopped,
  completed,
  completedWithIssues,
}

extension DiscoveryJobStatusValueExtension on DiscoveryJobStatus {
  String toValue() {
    switch (this) {
      case DiscoveryJobStatus.running:
        return 'RUNNING';
      case DiscoveryJobStatus.warning:
        return 'WARNING';
      case DiscoveryJobStatus.terminated:
        return 'TERMINATED';
      case DiscoveryJobStatus.failed:
        return 'FAILED';
      case DiscoveryJobStatus.stopped:
        return 'STOPPED';
      case DiscoveryJobStatus.completed:
        return 'COMPLETED';
      case DiscoveryJobStatus.completedWithIssues:
        return 'COMPLETED_WITH_ISSUES';
    }
  }
}

extension DiscoveryJobStatusFromString on String {
  DiscoveryJobStatus toDiscoveryJobStatus() {
    switch (this) {
      case 'RUNNING':
        return DiscoveryJobStatus.running;
      case 'WARNING':
        return DiscoveryJobStatus.warning;
      case 'TERMINATED':
        return DiscoveryJobStatus.terminated;
      case 'FAILED':
        return DiscoveryJobStatus.failed;
      case 'STOPPED':
        return DiscoveryJobStatus.stopped;
      case 'COMPLETED':
        return DiscoveryJobStatus.completed;
      case 'COMPLETED_WITH_ISSUES':
        return DiscoveryJobStatus.completedWithIssues;
    }
    throw Exception('$this is not known in enum DiscoveryJobStatus');
  }
}

enum DiscoveryResourceFilter {
  svm,
}

extension DiscoveryResourceFilterValueExtension on DiscoveryResourceFilter {
  String toValue() {
    switch (this) {
      case DiscoveryResourceFilter.svm:
        return 'SVM';
    }
  }
}

extension DiscoveryResourceFilterFromString on String {
  DiscoveryResourceFilter toDiscoveryResourceFilter() {
    switch (this) {
      case 'SVM':
        return DiscoveryResourceFilter.svm;
    }
    throw Exception('$this is not known in enum DiscoveryResourceFilter');
  }
}

enum DiscoveryResourceType {
  svm,
  volume,
  cluster,
}

extension DiscoveryResourceTypeValueExtension on DiscoveryResourceType {
  String toValue() {
    switch (this) {
      case DiscoveryResourceType.svm:
        return 'SVM';
      case DiscoveryResourceType.volume:
        return 'VOLUME';
      case DiscoveryResourceType.cluster:
        return 'CLUSTER';
    }
  }
}

extension DiscoveryResourceTypeFromString on String {
  DiscoveryResourceType toDiscoveryResourceType() {
    switch (this) {
      case 'SVM':
        return DiscoveryResourceType.svm;
      case 'VOLUME':
        return DiscoveryResourceType.volume;
      case 'CLUSTER':
        return DiscoveryResourceType.cluster;
    }
    throw Exception('$this is not known in enum DiscoveryResourceType');
  }
}

/// The network settings that DataSync Discovery uses to connect with your
/// on-premises storage system's management interface.
class DiscoveryServerConfiguration {
  /// The domain name or IP address of your storage system's management interface.
  final String serverHostname;

  /// The network port for accessing the storage system's management interface.
  final int? serverPort;

  DiscoveryServerConfiguration({
    required this.serverHostname,
    this.serverPort,
  });

  factory DiscoveryServerConfiguration.fromJson(Map<String, dynamic> json) {
    return DiscoveryServerConfiguration(
      serverHostname: json['ServerHostname'] as String,
      serverPort: json['ServerPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final serverHostname = this.serverHostname;
    final serverPort = this.serverPort;
    return {
      'ServerHostname': serverHostname,
      if (serverPort != null) 'ServerPort': serverPort,
    };
  }
}

enum DiscoverySystemType {
  netAppONTAP,
}

extension DiscoverySystemTypeValueExtension on DiscoverySystemType {
  String toValue() {
    switch (this) {
      case DiscoverySystemType.netAppONTAP:
        return 'NetAppONTAP';
    }
  }
}

extension DiscoverySystemTypeFromString on String {
  DiscoverySystemType toDiscoverySystemType() {
    switch (this) {
      case 'NetAppONTAP':
        return DiscoverySystemType.netAppONTAP;
    }
    throw Exception('$this is not known in enum DiscoverySystemType');
  }
}

/// The subnet and security groups that DataSync uses to access your Amazon EFS
/// file system.
class Ec2Config {
  /// Specifies the Amazon Resource Names (ARNs) of the security groups associated
  /// with an Amazon EFS file system's mount target.
  final List<String> securityGroupArns;

  /// Specifies the ARN of a subnet where DataSync creates the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces">network
  /// interfaces</a> for managing traffic during your transfer.
  ///
  /// The subnet must be located:
  ///
  /// <ul>
  /// <li>
  /// In the same virtual private cloud (VPC) as the Amazon EFS file system.
  /// </li>
  /// <li>
  /// In the same Availability Zone as at least one mount target for the Amazon
  /// EFS file system.
  /// </li>
  /// </ul> <note>
  /// You don't need to specify a subnet that includes a file system mount target.
  /// </note>
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

enum EfsInTransitEncryption {
  none,
  tls1_2,
}

extension EfsInTransitEncryptionValueExtension on EfsInTransitEncryption {
  String toValue() {
    switch (this) {
      case EfsInTransitEncryption.none:
        return 'NONE';
      case EfsInTransitEncryption.tls1_2:
        return 'TLS1_2';
    }
  }
}

extension EfsInTransitEncryptionFromString on String {
  EfsInTransitEncryption toEfsInTransitEncryption() {
    switch (this) {
      case 'NONE':
        return EfsInTransitEncryption.none;
      case 'TLS1_2':
        return EfsInTransitEncryption.tls1_2;
    }
    throw Exception('$this is not known in enum EfsInTransitEncryption');
  }
}

enum EndpointType {
  public,
  privateLink,
  fips,
}

extension EndpointTypeValueExtension on EndpointType {
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

extension EndpointTypeFromString on String {
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
  /// The type of filter rule to apply. DataSync only supports the SIMPLE_PATTERN
  /// rule type.
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

extension FilterTypeValueExtension on FilterType {
  String toValue() {
    switch (this) {
      case FilterType.simplePattern:
        return 'SIMPLE_PATTERN';
    }
  }
}

extension FilterTypeFromString on String {
  FilterType toFilterType() {
    switch (this) {
      case 'SIMPLE_PATTERN':
        return FilterType.simplePattern;
    }
    throw Exception('$this is not known in enum FilterType');
  }
}

/// Specifies the data transfer protocol that DataSync uses to access your
/// Amazon FSx file system.
class FsxProtocol {
  /// Specifies the Network File System (NFS) protocol configuration that DataSync
  /// uses to access your FSx for OpenZFS file system or FSx for ONTAP file
  /// system's storage virtual machine (SVM).
  final FsxProtocolNfs? nfs;

  /// Specifies the Server Message Block (SMB) protocol configuration that
  /// DataSync uses to access your FSx for ONTAP file system's SVM.
  final FsxProtocolSmb? smb;

  FsxProtocol({
    this.nfs,
    this.smb,
  });

  factory FsxProtocol.fromJson(Map<String, dynamic> json) {
    return FsxProtocol(
      nfs: json['NFS'] != null
          ? FsxProtocolNfs.fromJson(json['NFS'] as Map<String, dynamic>)
          : null,
      smb: json['SMB'] != null
          ? FsxProtocolSmb.fromJson(json['SMB'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nfs = this.nfs;
    final smb = this.smb;
    return {
      if (nfs != null) 'NFS': nfs,
      if (smb != null) 'SMB': smb,
    };
  }
}

/// Specifies the Network File System (NFS) protocol configuration that DataSync
/// uses to access your Amazon FSx for OpenZFS or Amazon FSx for NetApp ONTAP
/// file system.
class FsxProtocolNfs {
  final NfsMountOptions? mountOptions;

  FsxProtocolNfs({
    this.mountOptions,
  });

  factory FsxProtocolNfs.fromJson(Map<String, dynamic> json) {
    return FsxProtocolNfs(
      mountOptions: json['MountOptions'] != null
          ? NfsMountOptions.fromJson(
              json['MountOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mountOptions = this.mountOptions;
    return {
      if (mountOptions != null) 'MountOptions': mountOptions,
    };
  }
}

/// Specifies the Server Message Block (SMB) protocol configuration that
/// DataSync uses to access your Amazon FSx for NetApp ONTAP file system. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-access">Accessing
/// FSx for ONTAP file systems</a>.
class FsxProtocolSmb {
  /// Specifies the password of a user who has permission to access your SVM.
  final String password;

  /// Specifies a user name that can mount the location and access the files,
  /// folders, and metadata that you need in the SVM.
  ///
  /// If you provide a user in your Active Directory, note the following:
  ///
  /// <ul>
  /// <li>
  /// If you're using Directory Service for Microsoft Active Directory, the user
  /// must be a member of the Amazon Web Services Delegated FSx Administrators
  /// group.
  /// </li>
  /// <li>
  /// If you're using a self-managed Active Directory, the user must be a member
  /// of either the Domain Admins group or a custom group that you specified for
  /// file system administration when you created your file system.
  /// </li>
  /// </ul>
  /// Make sure that the user has the permissions it needs to copy the data you
  /// want:
  ///
  /// <ul>
  /// <li>
  /// <code>SE_TCB_NAME</code>: Required to set object ownership and file
  /// metadata. With this privilege, you also can copy NTFS discretionary access
  /// lists (DACLs).
  /// </li>
  /// <li>
  /// <code>SE_SECURITY_NAME</code>: May be needed to copy NTFS system access
  /// control lists (SACLs). This operation specifically requires the Windows
  /// privilege, which is granted to members of the Domain Admins group. If you
  /// configure your task to copy SACLs, make sure that the user has the required
  /// privileges. For information about copying SACLs, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-task.html#configure-ownership-and-permissions">Ownership
  /// and permissions-related options</a>.
  /// </li>
  /// </ul>
  final String user;

  /// Specifies the fully qualified domain name (FQDN) of the Microsoft Active
  /// Directory that your storage virtual machine (SVM) belongs to.
  final String? domain;
  final SmbMountOptions? mountOptions;

  FsxProtocolSmb({
    required this.password,
    required this.user,
    this.domain,
    this.mountOptions,
  });

  factory FsxProtocolSmb.fromJson(Map<String, dynamic> json) {
    return FsxProtocolSmb(
      password: json['Password'] as String,
      user: json['User'] as String,
      domain: json['Domain'] as String?,
      mountOptions: json['MountOptions'] != null
          ? SmbMountOptions.fromJson(
              json['MountOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final password = this.password;
    final user = this.user;
    final domain = this.domain;
    final mountOptions = this.mountOptions;
    return {
      'Password': password,
      'User': user,
      if (domain != null) 'Domain': domain,
      if (mountOptions != null) 'MountOptions': mountOptions,
    };
  }
}

class GenerateRecommendationsResponse {
  GenerateRecommendationsResponse();

  factory GenerateRecommendationsResponse.fromJson(Map<String, dynamic> _) {
    return GenerateRecommendationsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum Gid {
  none,
  intValue,
  name,
  both,
}

extension GidValueExtension on Gid {
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

extension GidFromString on String {
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

enum HdfsAuthenticationType {
  simple,
  kerberos,
}

extension HdfsAuthenticationTypeValueExtension on HdfsAuthenticationType {
  String toValue() {
    switch (this) {
      case HdfsAuthenticationType.simple:
        return 'SIMPLE';
      case HdfsAuthenticationType.kerberos:
        return 'KERBEROS';
    }
  }
}

extension HdfsAuthenticationTypeFromString on String {
  HdfsAuthenticationType toHdfsAuthenticationType() {
    switch (this) {
      case 'SIMPLE':
        return HdfsAuthenticationType.simple;
      case 'KERBEROS':
        return HdfsAuthenticationType.kerberos;
    }
    throw Exception('$this is not known in enum HdfsAuthenticationType');
  }
}

enum HdfsDataTransferProtection {
  disabled,
  authentication,
  integrity,
  privacy,
}

extension HdfsDataTransferProtectionValueExtension
    on HdfsDataTransferProtection {
  String toValue() {
    switch (this) {
      case HdfsDataTransferProtection.disabled:
        return 'DISABLED';
      case HdfsDataTransferProtection.authentication:
        return 'AUTHENTICATION';
      case HdfsDataTransferProtection.integrity:
        return 'INTEGRITY';
      case HdfsDataTransferProtection.privacy:
        return 'PRIVACY';
    }
  }
}

extension HdfsDataTransferProtectionFromString on String {
  HdfsDataTransferProtection toHdfsDataTransferProtection() {
    switch (this) {
      case 'DISABLED':
        return HdfsDataTransferProtection.disabled;
      case 'AUTHENTICATION':
        return HdfsDataTransferProtection.authentication;
      case 'INTEGRITY':
        return HdfsDataTransferProtection.integrity;
      case 'PRIVACY':
        return HdfsDataTransferProtection.privacy;
    }
    throw Exception('$this is not known in enum HdfsDataTransferProtection');
  }
}

/// The NameNode of the Hadoop Distributed File System (HDFS). The NameNode
/// manages the file system's namespace. The NameNode performs operations such
/// as opening, closing, and renaming files and directories. The NameNode
/// contains the information to map blocks of data to the DataNodes.
class HdfsNameNode {
  /// The hostname of the NameNode in the HDFS cluster. This value is the IP
  /// address or Domain Name Service (DNS) name of the NameNode. An agent that's
  /// installed on-premises uses this hostname to communicate with the NameNode in
  /// the network.
  final String hostname;

  /// The port that the NameNode uses to listen to client requests.
  final int port;

  HdfsNameNode({
    required this.hostname,
    required this.port,
  });

  factory HdfsNameNode.fromJson(Map<String, dynamic> json) {
    return HdfsNameNode(
      hostname: json['Hostname'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final port = this.port;
    return {
      'Hostname': hostname,
      'Port': port,
    };
  }
}

enum HdfsRpcProtection {
  disabled,
  authentication,
  integrity,
  privacy,
}

extension HdfsRpcProtectionValueExtension on HdfsRpcProtection {
  String toValue() {
    switch (this) {
      case HdfsRpcProtection.disabled:
        return 'DISABLED';
      case HdfsRpcProtection.authentication:
        return 'AUTHENTICATION';
      case HdfsRpcProtection.integrity:
        return 'INTEGRITY';
      case HdfsRpcProtection.privacy:
        return 'PRIVACY';
    }
  }
}

extension HdfsRpcProtectionFromString on String {
  HdfsRpcProtection toHdfsRpcProtection() {
    switch (this) {
      case 'DISABLED':
        return HdfsRpcProtection.disabled;
      case 'AUTHENTICATION':
        return HdfsRpcProtection.authentication;
      case 'INTEGRITY':
        return HdfsRpcProtection.integrity;
      case 'PRIVACY':
        return HdfsRpcProtection.privacy;
    }
    throw Exception('$this is not known in enum HdfsRpcProtection');
  }
}

/// The IOPS peaks for an on-premises storage system resource. Each data point
/// represents the 95th percentile peak value during a 1-hour interval.
class IOPS {
  /// Peak IOPS unrelated to read and write operations.
  final double? other;

  /// Peak IOPS related to read operations.
  final double? read;

  /// Peak total IOPS on your on-premises storage system resource.
  final double? total;

  /// Peak IOPS related to write operations.
  final double? write;

  IOPS({
    this.other,
    this.read,
    this.total,
    this.write,
  });

  factory IOPS.fromJson(Map<String, dynamic> json) {
    return IOPS(
      other: json['Other'] as double?,
      read: json['Read'] as double?,
      total: json['Total'] as double?,
      write: json['Write'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final other = this.other;
    final read = this.read;
    final total = this.total;
    final write = this.write;
    return {
      if (other != null) 'Other': other,
      if (read != null) 'Read': read,
      if (total != null) 'Total': total,
      if (write != null) 'Write': write,
    };
  }
}

/// The latency peaks for an on-premises storage system resource. Each data
/// point represents the 95th percentile peak value during a 1-hour interval.
class Latency {
  /// Peak latency for operations unrelated to read and write operations.
  final double? other;

  /// Peak latency for read operations.
  final double? read;

  /// Peak latency for write operations.
  final double? write;

  Latency({
    this.other,
    this.read,
    this.write,
  });

  factory Latency.fromJson(Map<String, dynamic> json) {
    return Latency(
      other: json['Other'] as double?,
      read: json['Read'] as double?,
      write: json['Write'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final other = this.other;
    final read = this.read;
    final write = this.write;
    return {
      if (other != null) 'Other': other,
      if (read != null) 'Read': read,
      if (write != null) 'Write': write,
    };
  }
}

/// ListAgentsResponse
class ListAgentsResponse {
  /// A list of DataSync agents in your Amazon Web Services account in the Amazon
  /// Web Services Region specified in the request. The list is ordered by the
  /// agents' Amazon Resource Names (ARNs).
  final List<AgentListEntry>? agents;

  /// The opaque string that indicates the position to begin the next list of
  /// results in the response.
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

class ListDiscoveryJobsResponse {
  /// The discovery jobs that you've run.
  final List<DiscoveryJobListEntry>? discoveryJobs;

  /// The opaque string that indicates the position to begin the next list of
  /// results in the response.
  final String? nextToken;

  ListDiscoveryJobsResponse({
    this.discoveryJobs,
    this.nextToken,
  });

  factory ListDiscoveryJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDiscoveryJobsResponse(
      discoveryJobs: (json['DiscoveryJobs'] as List?)
          ?.whereNotNull()
          .map((e) => DiscoveryJobListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final discoveryJobs = this.discoveryJobs;
    final nextToken = this.nextToken;
    return {
      if (discoveryJobs != null) 'DiscoveryJobs': discoveryJobs,
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

class ListStorageSystemsResponse {
  /// The opaque string that indicates the position to begin the next list of
  /// results in the response.
  final String? nextToken;

  /// The Amazon Resource Names ARNs) of the on-premises storage systems that
  /// you're using with DataSync Discovery.
  final List<StorageSystemListEntry>? storageSystems;

  ListStorageSystemsResponse({
    this.nextToken,
    this.storageSystems,
  });

  factory ListStorageSystemsResponse.fromJson(Map<String, dynamic> json) {
    return ListStorageSystemsResponse(
      nextToken: json['NextToken'] as String?,
      storageSystems: (json['StorageSystems'] as List?)
          ?.whereNotNull()
          .map(
              (e) => StorageSystemListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final storageSystems = this.storageSystems;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (storageSystems != null) 'StorageSystems': storageSystems,
    };
  }
}

/// ListTagsForResourceResponse
class ListTagsForResourceResponse {
  /// The opaque string that indicates the position to begin the next list of
  /// results in the response.
  final String? nextToken;

  /// An array of tags applied to the specified resource.
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

/// Narrow down the list of resources returned by <code>ListLocations</code>.
/// For example, to see all your Amazon S3 locations, create a filter using
/// <code>"Name": "LocationType"</code>, <code>"Operator": "Equals"</code>, and
/// <code>"Values": "S3"</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/query-resources.html">filtering
/// resources</a>.
class LocationFilter {
  /// The name of the filter being used. Each API call supports a list of filters
  /// that are available for it (for example, <code>LocationType</code> for
  /// <code>ListLocations</code>).
  final LocationFilterName name;

  /// The operator that is used to compare filter values (for example,
  /// <code>Equals</code> or <code>Contains</code>).
  final Operator operator;

  /// The values that you want to filter for. For example, you might want to
  /// display only Amazon S3 locations.
  final List<String> values;

  LocationFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

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

extension LocationFilterNameValueExtension on LocationFilterName {
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

extension LocationFilterNameFromString on String {
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

  /// Represents a list of URIs of a location. <code>LocationUri</code> returns an
  /// array that contains a list of locations when the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListLocations.html">ListLocations</a>
  /// operation is called.
  ///
  /// Format: <code>TYPE://GLOBAL_ID/SUBDIR</code>.
  ///
  /// TYPE designates the type of location (for example, <code>nfs</code> or
  /// <code>s3</code>).
  ///
  /// GLOBAL_ID is the globally unique identifier of the resource that backs the
  /// location. An example for EFS is <code>us-east-2.fs-abcd1234</code>. An
  /// example for Amazon S3 is the bucket name, such as <code>myBucket</code>. An
  /// example for NFS is a valid IPv4 address or a hostname that is compliant with
  /// Domain Name Service (DNS).
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

extension LogLevelValueExtension on LogLevel {
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

extension LogLevelFromString on String {
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

/// The performance data that DataSync Discovery collects about an on-premises
/// storage system resource.
class MaxP95Performance {
  /// Peak IOPS unrelated to read and write operations.
  final double? iopsOther;

  /// Peak IOPS related to read operations.
  final double? iopsRead;

  /// Peak total IOPS on your on-premises storage system resource.
  final double? iopsTotal;

  /// Peak IOPS related to write operations.
  final double? iopsWrite;

  /// Peak latency for operations unrelated to read and write operations.
  final double? latencyOther;

  /// Peak latency for read operations.
  final double? latencyRead;

  /// Peak latency for write operations.
  final double? latencyWrite;

  /// Peak throughput unrelated to read and write operations.
  final double? throughputOther;

  /// Peak throughput related to read operations.
  final double? throughputRead;

  /// Peak total throughput on your on-premises storage system resource.
  final double? throughputTotal;

  /// Peak throughput related to write operations.
  final double? throughputWrite;

  MaxP95Performance({
    this.iopsOther,
    this.iopsRead,
    this.iopsTotal,
    this.iopsWrite,
    this.latencyOther,
    this.latencyRead,
    this.latencyWrite,
    this.throughputOther,
    this.throughputRead,
    this.throughputTotal,
    this.throughputWrite,
  });

  factory MaxP95Performance.fromJson(Map<String, dynamic> json) {
    return MaxP95Performance(
      iopsOther: json['IopsOther'] as double?,
      iopsRead: json['IopsRead'] as double?,
      iopsTotal: json['IopsTotal'] as double?,
      iopsWrite: json['IopsWrite'] as double?,
      latencyOther: json['LatencyOther'] as double?,
      latencyRead: json['LatencyRead'] as double?,
      latencyWrite: json['LatencyWrite'] as double?,
      throughputOther: json['ThroughputOther'] as double?,
      throughputRead: json['ThroughputRead'] as double?,
      throughputTotal: json['ThroughputTotal'] as double?,
      throughputWrite: json['ThroughputWrite'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final iopsOther = this.iopsOther;
    final iopsRead = this.iopsRead;
    final iopsTotal = this.iopsTotal;
    final iopsWrite = this.iopsWrite;
    final latencyOther = this.latencyOther;
    final latencyRead = this.latencyRead;
    final latencyWrite = this.latencyWrite;
    final throughputOther = this.throughputOther;
    final throughputRead = this.throughputRead;
    final throughputTotal = this.throughputTotal;
    final throughputWrite = this.throughputWrite;
    return {
      if (iopsOther != null) 'IopsOther': iopsOther,
      if (iopsRead != null) 'IopsRead': iopsRead,
      if (iopsTotal != null) 'IopsTotal': iopsTotal,
      if (iopsWrite != null) 'IopsWrite': iopsWrite,
      if (latencyOther != null) 'LatencyOther': latencyOther,
      if (latencyRead != null) 'LatencyRead': latencyRead,
      if (latencyWrite != null) 'LatencyWrite': latencyWrite,
      if (throughputOther != null) 'ThroughputOther': throughputOther,
      if (throughputRead != null) 'ThroughputRead': throughputRead,
      if (throughputTotal != null) 'ThroughputTotal': throughputTotal,
      if (throughputWrite != null) 'ThroughputWrite': throughputWrite,
    };
  }
}

enum Mtime {
  none,
  preserve,
}

extension MtimeValueExtension on Mtime {
  String toValue() {
    switch (this) {
      case Mtime.none:
        return 'NONE';
      case Mtime.preserve:
        return 'PRESERVE';
    }
  }
}

extension MtimeFromString on String {
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

/// The information that DataSync Discovery collects about an on-premises
/// storage system cluster.
class NetAppONTAPCluster {
  /// The number of CIFS shares in the cluster.
  final int? cifsShareCount;

  /// The storage space that's being used in the cluster without accounting for
  /// compression or deduplication.
  final int? clusterBlockStorageLogicalUsed;

  /// The total storage space that's available in the cluster.
  final int? clusterBlockStorageSize;

  /// The storage space that's being used in a cluster.
  final int? clusterBlockStorageUsed;

  /// The name of the cluster.
  final String? clusterName;

  /// The performance data that DataSync Discovery collects about the cluster.
  final MaxP95Performance? maxP95Performance;

  /// The number of NFS volumes in the cluster.
  final int? nfsExportedVolumes;

  /// Indicates whether DataSync Discovery recommendations for the cluster are
  /// ready to view, incomplete, or can't be determined.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-job-statuses.html#recommendation-statuses-table">Recommendation
  /// statuses</a>.
  final RecommendationStatus? recommendationStatus;

  /// The Amazon Web Services storage services that DataSync Discovery recommends
  /// for the cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-understand-recommendations.html">Recommendations
  /// provided by DataSync Discovery</a>.
  final List<Recommendation>? recommendations;

  /// The universally unique identifier (UUID) of the cluster.
  final String? resourceId;

  NetAppONTAPCluster({
    this.cifsShareCount,
    this.clusterBlockStorageLogicalUsed,
    this.clusterBlockStorageSize,
    this.clusterBlockStorageUsed,
    this.clusterName,
    this.maxP95Performance,
    this.nfsExportedVolumes,
    this.recommendationStatus,
    this.recommendations,
    this.resourceId,
  });

  factory NetAppONTAPCluster.fromJson(Map<String, dynamic> json) {
    return NetAppONTAPCluster(
      cifsShareCount: json['CifsShareCount'] as int?,
      clusterBlockStorageLogicalUsed:
          json['ClusterBlockStorageLogicalUsed'] as int?,
      clusterBlockStorageSize: json['ClusterBlockStorageSize'] as int?,
      clusterBlockStorageUsed: json['ClusterBlockStorageUsed'] as int?,
      clusterName: json['ClusterName'] as String?,
      maxP95Performance: json['MaxP95Performance'] != null
          ? MaxP95Performance.fromJson(
              json['MaxP95Performance'] as Map<String, dynamic>)
          : null,
      nfsExportedVolumes: json['NfsExportedVolumes'] as int?,
      recommendationStatus:
          (json['RecommendationStatus'] as String?)?.toRecommendationStatus(),
      recommendations: (json['Recommendations'] as List?)
          ?.whereNotNull()
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: json['ResourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cifsShareCount = this.cifsShareCount;
    final clusterBlockStorageLogicalUsed = this.clusterBlockStorageLogicalUsed;
    final clusterBlockStorageSize = this.clusterBlockStorageSize;
    final clusterBlockStorageUsed = this.clusterBlockStorageUsed;
    final clusterName = this.clusterName;
    final maxP95Performance = this.maxP95Performance;
    final nfsExportedVolumes = this.nfsExportedVolumes;
    final recommendationStatus = this.recommendationStatus;
    final recommendations = this.recommendations;
    final resourceId = this.resourceId;
    return {
      if (cifsShareCount != null) 'CifsShareCount': cifsShareCount,
      if (clusterBlockStorageLogicalUsed != null)
        'ClusterBlockStorageLogicalUsed': clusterBlockStorageLogicalUsed,
      if (clusterBlockStorageSize != null)
        'ClusterBlockStorageSize': clusterBlockStorageSize,
      if (clusterBlockStorageUsed != null)
        'ClusterBlockStorageUsed': clusterBlockStorageUsed,
      if (clusterName != null) 'ClusterName': clusterName,
      if (maxP95Performance != null) 'MaxP95Performance': maxP95Performance,
      if (nfsExportedVolumes != null) 'NfsExportedVolumes': nfsExportedVolumes,
      if (recommendationStatus != null)
        'RecommendationStatus': recommendationStatus.toValue(),
      if (recommendations != null) 'Recommendations': recommendations,
      if (resourceId != null) 'ResourceId': resourceId,
    };
  }
}

/// The information that DataSync Discovery collects about a storage virtual
/// machine (SVM) in your on-premises storage system.
class NetAppONTAPSVM {
  /// The number of CIFS shares in the SVM.
  final int? cifsShareCount;

  /// The universally unique identifier (UUID) of the cluster associated with the
  /// SVM.
  final String? clusterUuid;

  /// The data transfer protocols (such as NFS) configured for the SVM.
  final List<String>? enabledProtocols;

  /// The performance data that DataSync Discovery collects about the SVM.
  final MaxP95Performance? maxP95Performance;

  /// The number of NFS volumes in the SVM.
  final int? nfsExportedVolumes;

  /// Indicates whether DataSync Discovery recommendations for the SVM are ready
  /// to view, incomplete, or can't be determined.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-job-statuses.html#recommendation-statuses-table">Recommendation
  /// statuses</a>.
  final RecommendationStatus? recommendationStatus;

  /// The Amazon Web Services storage services that DataSync Discovery recommends
  /// for the SVM. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-understand-recommendations.html">Recommendations
  /// provided by DataSync Discovery</a>.
  final List<Recommendation>? recommendations;

  /// The UUID of the SVM.
  final String? resourceId;

  /// The name of the SVM
  final String? svmName;

  /// The total storage space that's available in the SVM.
  final int? totalCapacityProvisioned;

  /// The storage space that's being used in the SVM.
  final int? totalCapacityUsed;

  /// The storage space that's being used in the SVM without accounting for
  /// compression or deduplication.
  final int? totalLogicalCapacityUsed;

  /// The amount of storage in the SVM that's being used for snapshots.
  final int? totalSnapshotCapacityUsed;

  NetAppONTAPSVM({
    this.cifsShareCount,
    this.clusterUuid,
    this.enabledProtocols,
    this.maxP95Performance,
    this.nfsExportedVolumes,
    this.recommendationStatus,
    this.recommendations,
    this.resourceId,
    this.svmName,
    this.totalCapacityProvisioned,
    this.totalCapacityUsed,
    this.totalLogicalCapacityUsed,
    this.totalSnapshotCapacityUsed,
  });

  factory NetAppONTAPSVM.fromJson(Map<String, dynamic> json) {
    return NetAppONTAPSVM(
      cifsShareCount: json['CifsShareCount'] as int?,
      clusterUuid: json['ClusterUuid'] as String?,
      enabledProtocols: (json['EnabledProtocols'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      maxP95Performance: json['MaxP95Performance'] != null
          ? MaxP95Performance.fromJson(
              json['MaxP95Performance'] as Map<String, dynamic>)
          : null,
      nfsExportedVolumes: json['NfsExportedVolumes'] as int?,
      recommendationStatus:
          (json['RecommendationStatus'] as String?)?.toRecommendationStatus(),
      recommendations: (json['Recommendations'] as List?)
          ?.whereNotNull()
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: json['ResourceId'] as String?,
      svmName: json['SvmName'] as String?,
      totalCapacityProvisioned: json['TotalCapacityProvisioned'] as int?,
      totalCapacityUsed: json['TotalCapacityUsed'] as int?,
      totalLogicalCapacityUsed: json['TotalLogicalCapacityUsed'] as int?,
      totalSnapshotCapacityUsed: json['TotalSnapshotCapacityUsed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cifsShareCount = this.cifsShareCount;
    final clusterUuid = this.clusterUuid;
    final enabledProtocols = this.enabledProtocols;
    final maxP95Performance = this.maxP95Performance;
    final nfsExportedVolumes = this.nfsExportedVolumes;
    final recommendationStatus = this.recommendationStatus;
    final recommendations = this.recommendations;
    final resourceId = this.resourceId;
    final svmName = this.svmName;
    final totalCapacityProvisioned = this.totalCapacityProvisioned;
    final totalCapacityUsed = this.totalCapacityUsed;
    final totalLogicalCapacityUsed = this.totalLogicalCapacityUsed;
    final totalSnapshotCapacityUsed = this.totalSnapshotCapacityUsed;
    return {
      if (cifsShareCount != null) 'CifsShareCount': cifsShareCount,
      if (clusterUuid != null) 'ClusterUuid': clusterUuid,
      if (enabledProtocols != null) 'EnabledProtocols': enabledProtocols,
      if (maxP95Performance != null) 'MaxP95Performance': maxP95Performance,
      if (nfsExportedVolumes != null) 'NfsExportedVolumes': nfsExportedVolumes,
      if (recommendationStatus != null)
        'RecommendationStatus': recommendationStatus.toValue(),
      if (recommendations != null) 'Recommendations': recommendations,
      if (resourceId != null) 'ResourceId': resourceId,
      if (svmName != null) 'SvmName': svmName,
      if (totalCapacityProvisioned != null)
        'TotalCapacityProvisioned': totalCapacityProvisioned,
      if (totalCapacityUsed != null) 'TotalCapacityUsed': totalCapacityUsed,
      if (totalLogicalCapacityUsed != null)
        'TotalLogicalCapacityUsed': totalLogicalCapacityUsed,
      if (totalSnapshotCapacityUsed != null)
        'TotalSnapshotCapacityUsed': totalSnapshotCapacityUsed,
    };
  }
}

/// The information that DataSync Discovery collects about a volume in your
/// on-premises storage system.
class NetAppONTAPVolume {
  /// The total storage space that's available in the volume.
  final int? capacityProvisioned;

  /// The storage space that's being used in the volume.
  final int? capacityUsed;

  /// The number of CIFS shares in the volume.
  final int? cifsShareCount;

  /// The storage space that's being used in the volume without accounting for
  /// compression or deduplication.
  final int? logicalCapacityUsed;

  /// The performance data that DataSync Discovery collects about the volume.
  final MaxP95Performance? maxP95Performance;

  /// The number of NFS volumes in the volume.
  final bool? nfsExported;

  /// Indicates whether DataSync Discovery recommendations for the volume are
  /// ready to view, incomplete, or can't be determined.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-job-statuses.html#recommendation-statuses-table">Recommendation
  /// statuses</a>.
  final RecommendationStatus? recommendationStatus;

  /// The Amazon Web Services storage services that DataSync Discovery recommends
  /// for the volume. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-understand-recommendations.html">Recommendations
  /// provided by DataSync Discovery</a>.
  final List<Recommendation>? recommendations;

  /// The universally unique identifier (UUID) of the volume.
  final String? resourceId;

  /// The volume's security style (such as Unix or NTFS).
  final String? securityStyle;

  /// The amount of storage in the volume that's being used for snapshots.
  final int? snapshotCapacityUsed;

  /// The name of the SVM associated with the volume.
  final String? svmName;

  /// The UUID of the storage virtual machine (SVM) associated with the volume.
  final String? svmUuid;

  /// The name of the volume.
  final String? volumeName;

  NetAppONTAPVolume({
    this.capacityProvisioned,
    this.capacityUsed,
    this.cifsShareCount,
    this.logicalCapacityUsed,
    this.maxP95Performance,
    this.nfsExported,
    this.recommendationStatus,
    this.recommendations,
    this.resourceId,
    this.securityStyle,
    this.snapshotCapacityUsed,
    this.svmName,
    this.svmUuid,
    this.volumeName,
  });

  factory NetAppONTAPVolume.fromJson(Map<String, dynamic> json) {
    return NetAppONTAPVolume(
      capacityProvisioned: json['CapacityProvisioned'] as int?,
      capacityUsed: json['CapacityUsed'] as int?,
      cifsShareCount: json['CifsShareCount'] as int?,
      logicalCapacityUsed: json['LogicalCapacityUsed'] as int?,
      maxP95Performance: json['MaxP95Performance'] != null
          ? MaxP95Performance.fromJson(
              json['MaxP95Performance'] as Map<String, dynamic>)
          : null,
      nfsExported: json['NfsExported'] as bool?,
      recommendationStatus:
          (json['RecommendationStatus'] as String?)?.toRecommendationStatus(),
      recommendations: (json['Recommendations'] as List?)
          ?.whereNotNull()
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: json['ResourceId'] as String?,
      securityStyle: json['SecurityStyle'] as String?,
      snapshotCapacityUsed: json['SnapshotCapacityUsed'] as int?,
      svmName: json['SvmName'] as String?,
      svmUuid: json['SvmUuid'] as String?,
      volumeName: json['VolumeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvisioned = this.capacityProvisioned;
    final capacityUsed = this.capacityUsed;
    final cifsShareCount = this.cifsShareCount;
    final logicalCapacityUsed = this.logicalCapacityUsed;
    final maxP95Performance = this.maxP95Performance;
    final nfsExported = this.nfsExported;
    final recommendationStatus = this.recommendationStatus;
    final recommendations = this.recommendations;
    final resourceId = this.resourceId;
    final securityStyle = this.securityStyle;
    final snapshotCapacityUsed = this.snapshotCapacityUsed;
    final svmName = this.svmName;
    final svmUuid = this.svmUuid;
    final volumeName = this.volumeName;
    return {
      if (capacityProvisioned != null)
        'CapacityProvisioned': capacityProvisioned,
      if (capacityUsed != null) 'CapacityUsed': capacityUsed,
      if (cifsShareCount != null) 'CifsShareCount': cifsShareCount,
      if (logicalCapacityUsed != null)
        'LogicalCapacityUsed': logicalCapacityUsed,
      if (maxP95Performance != null) 'MaxP95Performance': maxP95Performance,
      if (nfsExported != null) 'NfsExported': nfsExported,
      if (recommendationStatus != null)
        'RecommendationStatus': recommendationStatus.toValue(),
      if (recommendations != null) 'Recommendations': recommendations,
      if (resourceId != null) 'ResourceId': resourceId,
      if (securityStyle != null) 'SecurityStyle': securityStyle,
      if (snapshotCapacityUsed != null)
        'SnapshotCapacityUsed': snapshotCapacityUsed,
      if (svmName != null) 'SvmName': svmName,
      if (svmUuid != null) 'SvmUuid': svmUuid,
      if (volumeName != null) 'VolumeName': volumeName,
    };
  }
}

/// Specifies how DataSync can access a location using the NFS protocol.
class NfsMountOptions {
  /// Specifies the NFS version that you want DataSync to use when mounting your
  /// NFS share. If the server refuses to use the version specified, the task
  /// fails.
  ///
  /// You can specify the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>AUTOMATIC</code> (default): DataSync chooses NFS version 4.1.
  /// </li>
  /// <li>
  /// <code>NFS3</code>: Stateless protocol version that allows for asynchronous
  /// writes on the server.
  /// </li>
  /// <li>
  /// <code>NFSv4_0</code>: Stateful, firewall-friendly protocol version that
  /// supports delegations and pseudo file systems.
  /// </li>
  /// <li>
  /// <code>NFSv4_1</code>: Stateful protocol version that supports sessions,
  /// directory delegations, and parallel data processing. NFS version 4.1 also
  /// includes all features available in version 4.0.
  /// </li>
  /// </ul> <note>
  /// DataSync currently only supports NFS version 3 with Amazon FSx for NetApp
  /// ONTAP locations.
  /// </note>
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

extension NfsVersionValueExtension on NfsVersion {
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

extension NfsVersionFromString on String {
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

extension ObjectStorageServerProtocolValueExtension
    on ObjectStorageServerProtocol {
  String toValue() {
    switch (this) {
      case ObjectStorageServerProtocol.https:
        return 'HTTPS';
      case ObjectStorageServerProtocol.http:
        return 'HTTP';
    }
  }
}

extension ObjectStorageServerProtocolFromString on String {
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

enum ObjectTags {
  preserve,
  none,
}

extension ObjectTagsValueExtension on ObjectTags {
  String toValue() {
    switch (this) {
      case ObjectTags.preserve:
        return 'PRESERVE';
      case ObjectTags.none:
        return 'NONE';
    }
  }
}

extension ObjectTagsFromString on String {
  ObjectTags toObjectTags() {
    switch (this) {
      case 'PRESERVE':
        return ObjectTags.preserve;
      case 'NONE':
        return ObjectTags.none;
    }
    throw Exception('$this is not known in enum ObjectTags');
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

extension OperatorValueExtension on Operator {
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

extension OperatorFromString on String {
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

/// Configures your DataSync task settings. These options include how DataSync
/// handles files, objects, and their associated metadata. You also can specify
/// how DataSync verifies data integrity, set bandwidth limits for your task,
/// among other options.
///
/// Each task setting has a default value. Unless you need to, you don't have to
/// configure any of these <code>Options</code> before starting your task.
class Options {
  /// Specifies whether to preserve metadata indicating the last time a file was
  /// read or written to. If you set <code>Atime</code> to
  /// <code>BEST_EFFORT</code>, DataSync attempts to preserve the original
  /// <code>Atime</code> attribute on all source files (that is, the version
  /// before the <code>PREPARING</code> phase of the task execution).
  /// <note>
  /// The behavior of <code>Atime</code> isn't fully standard across platforms, so
  /// DataSync can only do this on a best-effort basis.
  /// </note>
  /// Default value: <code>BEST_EFFORT</code>
  ///
  /// <code>BEST_EFFORT</code>: Attempt to preserve the per-file
  /// <code>Atime</code> value (recommended).
  ///
  /// <code>NONE</code>: Ignore <code>Atime</code>.
  /// <note>
  /// If <code>Atime</code> is set to <code>BEST_EFFORT</code>, <code>Mtime</code>
  /// must be set to <code>PRESERVE</code>.
  ///
  /// If <code>Atime</code> is set to <code>NONE</code>, <code>Mtime</code> must
  /// also be <code>NONE</code>.
  /// </note>
  final Atime? atime;

  /// Limits the bandwidth used by a DataSync task. For example, if you want
  /// DataSync to use a maximum of 1 MB, set this value to <code>1048576</code>
  /// (<code>=1024*1024</code>).
  final int? bytesPerSecond;

  /// Specifies the POSIX group ID (GID) of the file's owners.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied">Metadata
  /// copied by DataSync</a>.
  ///
  /// Default value: <code>INT_VALUE</code>. This preserves the integer value of
  /// the ID.
  ///
  /// <code>INT_VALUE</code>: Preserve the integer value of user ID (UID) and GID
  /// (recommended).
  ///
  /// <code>NONE</code>: Ignore UID and GID.
  final Gid? gid;

  /// Specifies the type of logs that DataSync publishes to a Amazon CloudWatch
  /// Logs log group. To specify the log group, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateTask.html#DataSync-CreateTask-request-CloudWatchLogGroupArn">CloudWatchLogGroupArn</a>.
  ///
  /// If you set <code>LogLevel</code> to <code>OFF</code>, no logs are published.
  /// <code>BASIC</code> publishes logs on errors for individual files
  /// transferred. <code>TRANSFER</code> publishes logs for every file or object
  /// that is transferred and integrity checked.
  final LogLevel? logLevel;

  /// Specifies whether to preserve metadata indicating the last time that a file
  /// was written to before the <code>PREPARING</code> phase of your task
  /// execution. This option is required when you need to run the a task more than
  /// once.
  ///
  /// Default Value: <code>PRESERVE</code>
  ///
  /// <code>PRESERVE</code>: Preserve original <code>Mtime</code> (recommended)
  ///
  /// <code>NONE</code>: Ignore <code>Mtime</code>.
  /// <note>
  /// If <code>Mtime</code> is set to <code>PRESERVE</code>, <code>Atime</code>
  /// must be set to <code>BEST_EFFORT</code>.
  ///
  /// If <code>Mtime</code> is set to <code>NONE</code>, <code>Atime</code> must
  /// also be set to <code>NONE</code>.
  /// </note>
  final Mtime? mtime;

  /// Specifies whether object tags are preserved when transferring between object
  /// storage systems. If you want your DataSync task to ignore object tags,
  /// specify the <code>NONE</code> value.
  ///
  /// Default Value: <code>PRESERVE</code>
  final ObjectTags? objectTags;

  /// Specifies whether data at the destination location should be overwritten or
  /// preserved. If set to <code>NEVER</code>, a destination file for example will
  /// not be replaced by a source file (even if the destination file differs from
  /// the source file). If you modify files in the destination and you sync the
  /// files, you can use this value to protect against overwriting those changes.
  ///
  /// Some storage classes have specific behaviors that can affect your Amazon S3
  /// storage cost. For detailed information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Considerations
  /// when working with Amazon S3 storage classes in DataSync</a>.
  final OverwriteMode? overwriteMode;

  /// Specifies which users or groups can access a file for a specific purpose
  /// such as reading, writing, or execution of the file.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied">Metadata
  /// copied by DataSync</a>.
  ///
  /// Default value: <code>PRESERVE</code>
  ///
  /// <code>PRESERVE</code>: Preserve POSIX-style permissions (recommended).
  ///
  /// <code>NONE</code>: Ignore permissions.
  /// <note>
  /// DataSync can preserve extant permissions of a source location.
  /// </note>
  final PosixPermissions? posixPermissions;

  /// Specifies whether files in the destination location that don't exist in the
  /// source should be preserved. This option can affect your Amazon S3 storage
  /// cost. If your task deletes objects, you might incur minimum storage duration
  /// charges for certain storage classes. For detailed information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Considerations
  /// when working with Amazon S3 storage classes in DataSync</a>.
  ///
  /// Default value: <code>PRESERVE</code>
  ///
  /// <code>PRESERVE</code>: Ignore such destination files (recommended).
  ///
  /// <code>REMOVE</code>: Delete destination files that aren’t present in the
  /// source.
  /// <note>
  /// If you set this parameter to <code>REMOVE</code>, you can't set
  /// <code>TransferMode</code> to <code>ALL</code>. When you transfer all data,
  /// DataSync doesn't scan your destination location and doesn't know what to
  /// delete.
  /// </note>
  final PreserveDeletedFiles? preserveDeletedFiles;

  /// Specifies whether DataSync should preserve the metadata of block and
  /// character devices in the source location and recreate the files with that
  /// device name and metadata on the destination. DataSync copies only the name
  /// and metadata of such devices.
  /// <note>
  /// DataSync can't copy the actual contents of these devices because they're
  /// nonterminal and don't return an end-of-file (EOF) marker.
  /// </note>
  /// Default value: <code>NONE</code>
  ///
  /// <code>NONE</code>: Ignore special devices (recommended).
  ///
  /// <code>PRESERVE</code>: Preserve character and block device metadata. This
  /// option currently isn't supported for Amazon EFS.
  final PreserveDevices? preserveDevices;

  /// Specifies which components of the SMB security descriptor are copied from
  /// source to destination objects.
  ///
  /// This value is only used for transfers between SMB and Amazon FSx for Windows
  /// File Server locations or between two FSx for Windows File Server locations.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html">how
  /// DataSync handles metadata</a>.
  ///
  /// Default value: <code>OWNER_DACL</code>
  ///
  /// <code>OWNER_DACL</code>: For each copied object, DataSync copies the
  /// following metadata:
  ///
  /// <ul>
  /// <li>
  /// The object owner.
  /// </li>
  /// <li>
  /// NTFS discretionary access control lists (DACLs), which determine whether to
  /// grant access to an object.
  ///
  /// DataSync won't copy NTFS system access control lists (SACLs) with this
  /// option.
  /// </li>
  /// </ul>
  /// <code>OWNER_DACL_SACL</code>: For each copied object, DataSync copies the
  /// following metadata:
  ///
  /// <ul>
  /// <li>
  /// The object owner.
  /// </li>
  /// <li>
  /// NTFS discretionary access control lists (DACLs), which determine whether to
  /// grant access to an object.
  /// </li>
  /// <li>
  /// SACLs, which are used by administrators to log attempts to access a secured
  /// object.
  ///
  /// Copying SACLs requires granting additional permissions to the Windows user
  /// that DataSync uses to access your SMB location. For information about
  /// choosing a user that ensures sufficient permissions to files, folders, and
  /// metadata, see <a href="create-smb-location.html#SMBuser">user</a>.
  /// </li>
  /// </ul>
  /// <code>NONE</code>: None of the SMB security descriptor components are
  /// copied. Destination objects are owned by the user that was provided for
  /// accessing the destination location. DACLs and SACLs are set based on the
  /// destination server’s configuration.
  final SmbSecurityDescriptorCopyFlags? securityDescriptorCopyFlags;

  /// Specifies whether tasks should be queued before executing the tasks. The
  /// default is <code>ENABLED</code>, which means the tasks will be queued.
  ///
  /// If you use the same agent to run multiple tasks, you can enable the tasks to
  /// run in series. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#queue-task-execution">Queueing
  /// task executions</a>.
  final TaskQueueing? taskQueueing;

  /// Determines whether DataSync transfers only the data and metadata that differ
  /// between the source and the destination location or transfers all the content
  /// from the source (without comparing what's in the destination).
  ///
  /// <code>CHANGED</code>: DataSync copies only data or metadata that is new or
  /// different content from the source location to the destination location.
  ///
  /// <code>ALL</code>: DataSync copies all source location content to the
  /// destination (without comparing what's in the destination).
  final TransferMode? transferMode;

  /// Specifies the POSIX user ID (UID) of the file's owner.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied">Metadata
  /// copied by DataSync</a>.
  ///
  /// Default value: <code>INT_VALUE</code>. This preserves the integer value of
  /// the ID.
  ///
  /// <code>INT_VALUE</code>: Preserve the integer value of UID and group ID (GID)
  /// (recommended).
  ///
  /// <code>NONE</code>: Ignore UID and GID.
  final Uid? uid;

  /// Specifies how and when DataSync checks the integrity of your data during a
  /// transfer.
  ///
  /// Default value: <code>POINT_IN_TIME_CONSISTENT</code>
  ///
  /// <code>ONLY_FILES_TRANSFERRED</code> (recommended): DataSync calculates the
  /// checksum of transferred files and metadata at the source location. At the
  /// end of the transfer, DataSync then compares this checksum to the checksum
  /// calculated on those files at the destination.
  ///
  /// We recommend this option when transferring to S3 Glacier Flexible Retrieval
  /// or S3 Glacier Deep Archive storage classes. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Storage
  /// class considerations with Amazon S3 locations</a>.
  ///
  /// <code>POINT_IN_TIME_CONSISTENT</code>: At the end of the transfer, DataSync
  /// scans the entire source and destination to verify that both locations are
  /// fully synchronized.
  ///
  /// You can't use this option when transferring to S3 Glacier Flexible Retrieval
  /// or S3 Glacier Deep Archive storage classes. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Storage
  /// class considerations with Amazon S3 locations</a>.
  ///
  /// <code>NONE</code>: DataSync doesn't run additional verification at the end
  /// of the transfer. All data transmissions are still integrity-checked with
  /// checksum verification during the transfer.
  final VerifyMode? verifyMode;

  Options({
    this.atime,
    this.bytesPerSecond,
    this.gid,
    this.logLevel,
    this.mtime,
    this.objectTags,
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
      objectTags: (json['ObjectTags'] as String?)?.toObjectTags(),
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
    final objectTags = this.objectTags;
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
      if (objectTags != null) 'ObjectTags': objectTags.toValue(),
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

extension OverwriteModeValueExtension on OverwriteMode {
  String toValue() {
    switch (this) {
      case OverwriteMode.always:
        return 'ALWAYS';
      case OverwriteMode.never:
        return 'NEVER';
    }
  }
}

extension OverwriteModeFromString on String {
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

/// The types of performance data that DataSync Discovery collects about an
/// on-premises storage system resource.
class P95Metrics {
  /// The IOPS peaks for an on-premises storage system resource. Each data point
  /// represents the 95th percentile peak value during a 1-hour interval.
  final IOPS? iops;

  /// The latency peaks for an on-premises storage system resource. Each data
  /// point represents the 95th percentile peak value during a 1-hour interval.
  final Latency? latency;

  /// The throughput peaks for an on-premises storage system resource. Each data
  /// point represents the 95th percentile peak value during a 1-hour interval.
  final Throughput? throughput;

  P95Metrics({
    this.iops,
    this.latency,
    this.throughput,
  });

  factory P95Metrics.fromJson(Map<String, dynamic> json) {
    return P95Metrics(
      iops: json['IOPS'] != null
          ? IOPS.fromJson(json['IOPS'] as Map<String, dynamic>)
          : null,
      latency: json['Latency'] != null
          ? Latency.fromJson(json['Latency'] as Map<String, dynamic>)
          : null,
      throughput: json['Throughput'] != null
          ? Throughput.fromJson(json['Throughput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final latency = this.latency;
    final throughput = this.throughput;
    return {
      if (iops != null) 'IOPS': iops,
      if (latency != null) 'Latency': latency,
      if (throughput != null) 'Throughput': throughput,
    };
  }
}

enum PhaseStatus {
  pending,
  success,
  error,
}

extension PhaseStatusValueExtension on PhaseStatus {
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

extension PhaseStatusFromString on String {
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

extension PosixPermissionsValueExtension on PosixPermissions {
  String toValue() {
    switch (this) {
      case PosixPermissions.none:
        return 'NONE';
      case PosixPermissions.preserve:
        return 'PRESERVE';
    }
  }
}

extension PosixPermissionsFromString on String {
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

extension PreserveDeletedFilesValueExtension on PreserveDeletedFiles {
  String toValue() {
    switch (this) {
      case PreserveDeletedFiles.preserve:
        return 'PRESERVE';
      case PreserveDeletedFiles.remove:
        return 'REMOVE';
    }
  }
}

extension PreserveDeletedFilesFromString on String {
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

extension PreserveDevicesValueExtension on PreserveDevices {
  String toValue() {
    switch (this) {
      case PreserveDevices.none:
        return 'NONE';
      case PreserveDevices.preserve:
        return 'PRESERVE';
    }
  }
}

extension PreserveDevicesFromString on String {
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

/// The Quality of Protection (QOP) configuration specifies the Remote Procedure
/// Call (RPC) and data transfer privacy settings configured on the Hadoop
/// Distributed File System (HDFS) cluster.
class QopConfiguration {
  /// The data transfer protection setting configured on the HDFS cluster. This
  /// setting corresponds to your <code>dfs.data.transfer.protection</code>
  /// setting in the <code>hdfs-site.xml</code> file on your Hadoop cluster.
  final HdfsDataTransferProtection? dataTransferProtection;

  /// The RPC protection setting configured on the HDFS cluster. This setting
  /// corresponds to your <code>hadoop.rpc.protection</code> setting in your
  /// <code>core-site.xml</code> file on your Hadoop cluster.
  final HdfsRpcProtection? rpcProtection;

  QopConfiguration({
    this.dataTransferProtection,
    this.rpcProtection,
  });

  factory QopConfiguration.fromJson(Map<String, dynamic> json) {
    return QopConfiguration(
      dataTransferProtection: (json['DataTransferProtection'] as String?)
          ?.toHdfsDataTransferProtection(),
      rpcProtection: (json['RpcProtection'] as String?)?.toHdfsRpcProtection(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataTransferProtection = this.dataTransferProtection;
    final rpcProtection = this.rpcProtection;
    return {
      if (dataTransferProtection != null)
        'DataTransferProtection': dataTransferProtection.toValue(),
      if (rpcProtection != null) 'RpcProtection': rpcProtection.toValue(),
    };
  }
}

/// The details about an Amazon Web Services storage service that DataSync
/// Discovery recommends for a resource in your on-premises storage system.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/discovery-understand-recommendations.html">Recommendations
/// provided by DataSync Discovery</a>.
class Recommendation {
  /// The estimated monthly cost of the recommended Amazon Web Services storage
  /// service.
  final String? estimatedMonthlyStorageCost;

  /// Information about how you can set up a recommended Amazon Web Services
  /// storage service.
  final Map<String, String>? storageConfiguration;

  /// A recommended Amazon Web Services storage service that you can migrate data
  /// to based on information that DataSync Discovery collects about your
  /// on-premises storage system.
  final String? storageType;

  Recommendation({
    this.estimatedMonthlyStorageCost,
    this.storageConfiguration,
    this.storageType,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      estimatedMonthlyStorageCost:
          json['EstimatedMonthlyStorageCost'] as String?,
      storageConfiguration:
          (json['StorageConfiguration'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      storageType: json['StorageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlyStorageCost = this.estimatedMonthlyStorageCost;
    final storageConfiguration = this.storageConfiguration;
    final storageType = this.storageType;
    return {
      if (estimatedMonthlyStorageCost != null)
        'EstimatedMonthlyStorageCost': estimatedMonthlyStorageCost,
      if (storageConfiguration != null)
        'StorageConfiguration': storageConfiguration,
      if (storageType != null) 'StorageType': storageType,
    };
  }
}

enum RecommendationStatus {
  none,
  inProgress,
  completed,
  failed,
}

extension RecommendationStatusValueExtension on RecommendationStatus {
  String toValue() {
    switch (this) {
      case RecommendationStatus.none:
        return 'NONE';
      case RecommendationStatus.inProgress:
        return 'IN_PROGRESS';
      case RecommendationStatus.completed:
        return 'COMPLETED';
      case RecommendationStatus.failed:
        return 'FAILED';
    }
  }
}

extension RecommendationStatusFromString on String {
  RecommendationStatus toRecommendationStatus() {
    switch (this) {
      case 'NONE':
        return RecommendationStatus.none;
      case 'IN_PROGRESS':
        return RecommendationStatus.inProgress;
      case 'COMPLETED':
        return RecommendationStatus.completed;
      case 'FAILED':
        return RecommendationStatus.failed;
    }
    throw Exception('$this is not known in enum RecommendationStatus');
  }
}

class RemoveStorageSystemResponse {
  RemoveStorageSystemResponse();

  factory RemoveStorageSystemResponse.fromJson(Map<String, dynamic> _) {
    return RemoveStorageSystemResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information provided by DataSync Discovery about the resources in your
/// on-premises storage system.
class ResourceDetails {
  /// The information that DataSync Discovery collects about the cluster in your
  /// on-premises storage system.
  final List<NetAppONTAPCluster>? netAppONTAPClusters;

  /// The information that DataSync Discovery collects about storage virtual
  /// machines (SVMs) in your on-premises storage system.
  final List<NetAppONTAPSVM>? netAppONTAPSVMs;

  /// The information that DataSync Discovery collects about volumes in your
  /// on-premises storage system.
  final List<NetAppONTAPVolume>? netAppONTAPVolumes;

  ResourceDetails({
    this.netAppONTAPClusters,
    this.netAppONTAPSVMs,
    this.netAppONTAPVolumes,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      netAppONTAPClusters: (json['NetAppONTAPClusters'] as List?)
          ?.whereNotNull()
          .map((e) => NetAppONTAPCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      netAppONTAPSVMs: (json['NetAppONTAPSVMs'] as List?)
          ?.whereNotNull()
          .map((e) => NetAppONTAPSVM.fromJson(e as Map<String, dynamic>))
          .toList(),
      netAppONTAPVolumes: (json['NetAppONTAPVolumes'] as List?)
          ?.whereNotNull()
          .map((e) => NetAppONTAPVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final netAppONTAPClusters = this.netAppONTAPClusters;
    final netAppONTAPSVMs = this.netAppONTAPSVMs;
    final netAppONTAPVolumes = this.netAppONTAPVolumes;
    return {
      if (netAppONTAPClusters != null)
        'NetAppONTAPClusters': netAppONTAPClusters,
      if (netAppONTAPSVMs != null) 'NetAppONTAPSVMs': netAppONTAPSVMs,
      if (netAppONTAPVolumes != null) 'NetAppONTAPVolumes': netAppONTAPVolumes,
    };
  }
}

/// Information, including performance data and capacity usage, provided by
/// DataSync Discovery about a resource in your on-premises storage system.
class ResourceMetrics {
  /// The storage capacity of the on-premises storage system resource.
  final Capacity? capacity;

  /// The types of performance data that DataSync Discovery collects about the
  /// on-premises storage system resource.
  final P95Metrics? p95Metrics;

  /// The universally unique identifier (UUID) of the on-premises storage system
  /// resource.
  final String? resourceId;

  /// The type of on-premises storage system resource.
  final DiscoveryResourceType? resourceType;

  /// The time when DataSync Discovery collected this information from the
  /// resource.
  final DateTime? timestamp;

  ResourceMetrics({
    this.capacity,
    this.p95Metrics,
    this.resourceId,
    this.resourceType,
    this.timestamp,
  });

  factory ResourceMetrics.fromJson(Map<String, dynamic> json) {
    return ResourceMetrics(
      capacity: json['Capacity'] != null
          ? Capacity.fromJson(json['Capacity'] as Map<String, dynamic>)
          : null,
      p95Metrics: json['P95Metrics'] != null
          ? P95Metrics.fromJson(json['P95Metrics'] as Map<String, dynamic>)
          : null,
      resourceId: json['ResourceId'] as String?,
      resourceType:
          (json['ResourceType'] as String?)?.toDiscoveryResourceType(),
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final capacity = this.capacity;
    final p95Metrics = this.p95Metrics;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final timestamp = this.timestamp;
    return {
      if (capacity != null) 'Capacity': capacity,
      if (p95Metrics != null) 'P95Metrics': p95Metrics,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
/// role used to access an Amazon S3 bucket.
///
/// For detailed information about using such a role, see Creating a Location
/// for Amazon S3 in the <i>DataSync User Guide</i>.
class S3Config {
  /// The ARN of the IAM role for accessing the S3 bucket.
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
  glacierInstantRetrieval,
}

extension S3StorageClassValueExtension on S3StorageClass {
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
      case S3StorageClass.glacierInstantRetrieval:
        return 'GLACIER_INSTANT_RETRIEVAL';
    }
  }
}

extension S3StorageClassFromString on String {
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
      case 'GLACIER_INSTANT_RETRIEVAL':
        return S3StorageClass.glacierInstantRetrieval;
    }
    throw Exception('$this is not known in enum S3StorageClass');
  }
}

/// Specifies the version of the Server Message Block (SMB) protocol that
/// DataSync uses to access an SMB file server.
class SmbMountOptions {
  /// By default, DataSync automatically chooses an SMB protocol version based on
  /// negotiation with your SMB file server. You also can configure DataSync to
  /// use a specific SMB version, but we recommend doing this only if DataSync has
  /// trouble negotiating with the SMB file server automatically.
  ///
  /// These are the following options for configuring the SMB version:
  ///
  /// <ul>
  /// <li>
  /// <code>AUTOMATIC</code> (default): DataSync and the SMB file server negotiate
  /// the highest version of SMB that they mutually support between 2.1 and 3.1.1.
  ///
  /// This is the recommended option. If you instead choose a specific version
  /// that your file server doesn't support, you may get an <code>Operation Not
  /// Supported</code> error.
  /// </li>
  /// <li>
  /// <code>SMB3</code>: Restricts the protocol negotiation to only SMB version
  /// 3.0.2.
  /// </li>
  /// <li>
  /// <code>SMB2</code>: Restricts the protocol negotiation to only SMB version
  /// 2.1.
  /// </li>
  /// <li>
  /// <code>SMB2_0</code>: Restricts the protocol negotiation to only SMB version
  /// 2.0.
  /// </li>
  /// <li>
  /// <code>SMB1</code>: Restricts the protocol negotiation to only SMB version
  /// 1.0.
  /// <note>
  /// The <code>SMB1</code> option isn't available when <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateLocationFsxOntap.html">creating
  /// an Amazon FSx for NetApp ONTAP location</a>.
  /// </note> </li>
  /// </ul>
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

extension SmbSecurityDescriptorCopyFlagsValueExtension
    on SmbSecurityDescriptorCopyFlags {
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

extension SmbSecurityDescriptorCopyFlagsFromString on String {
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
  smb1,
  smb2_0,
}

extension SmbVersionValueExtension on SmbVersion {
  String toValue() {
    switch (this) {
      case SmbVersion.automatic:
        return 'AUTOMATIC';
      case SmbVersion.smb2:
        return 'SMB2';
      case SmbVersion.smb3:
        return 'SMB3';
      case SmbVersion.smb1:
        return 'SMB1';
      case SmbVersion.smb2_0:
        return 'SMB2_0';
    }
  }
}

extension SmbVersionFromString on String {
  SmbVersion toSmbVersion() {
    switch (this) {
      case 'AUTOMATIC':
        return SmbVersion.automatic;
      case 'SMB2':
        return SmbVersion.smb2;
      case 'SMB3':
        return SmbVersion.smb3;
      case 'SMB1':
        return SmbVersion.smb1;
      case 'SMB2_0':
        return SmbVersion.smb2_0;
    }
    throw Exception('$this is not known in enum SmbVersion');
  }
}

class StartDiscoveryJobResponse {
  /// The ARN of the discovery job that you started.
  final String? discoveryJobArn;

  StartDiscoveryJobResponse({
    this.discoveryJobArn,
  });

  factory StartDiscoveryJobResponse.fromJson(Map<String, dynamic> json) {
    return StartDiscoveryJobResponse(
      discoveryJobArn: json['DiscoveryJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final discoveryJobArn = this.discoveryJobArn;
    return {
      if (discoveryJobArn != null) 'DiscoveryJobArn': discoveryJobArn,
    };
  }
}

/// StartTaskExecutionResponse
class StartTaskExecutionResponse {
  /// The ARN of the running task execution.
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

class StopDiscoveryJobResponse {
  StopDiscoveryJobResponse();

  factory StopDiscoveryJobResponse.fromJson(Map<String, dynamic> _) {
    return StopDiscoveryJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum StorageSystemConnectivityStatus {
  pass,
  fail,
  unknown,
}

extension StorageSystemConnectivityStatusValueExtension
    on StorageSystemConnectivityStatus {
  String toValue() {
    switch (this) {
      case StorageSystemConnectivityStatus.pass:
        return 'PASS';
      case StorageSystemConnectivityStatus.fail:
        return 'FAIL';
      case StorageSystemConnectivityStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension StorageSystemConnectivityStatusFromString on String {
  StorageSystemConnectivityStatus toStorageSystemConnectivityStatus() {
    switch (this) {
      case 'PASS':
        return StorageSystemConnectivityStatus.pass;
      case 'FAIL':
        return StorageSystemConnectivityStatus.fail;
      case 'UNKNOWN':
        return StorageSystemConnectivityStatus.unknown;
    }
    throw Exception(
        '$this is not known in enum StorageSystemConnectivityStatus');
  }
}

/// Information that identifies an on-premises storage system that you're using
/// with DataSync Discovery.
class StorageSystemListEntry {
  /// The name of an on-premises storage system that you added to DataSync
  /// Discovery.
  final String? name;

  /// The Amazon Resource Names (ARN) of an on-premises storage system that you
  /// added to DataSync Discovery.
  final String? storageSystemArn;

  StorageSystemListEntry({
    this.name,
    this.storageSystemArn,
  });

  factory StorageSystemListEntry.fromJson(Map<String, dynamic> json) {
    return StorageSystemListEntry(
      name: json['Name'] as String?,
      storageSystemArn: json['StorageSystemArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final storageSystemArn = this.storageSystemArn;
    return {
      if (name != null) 'Name': name,
      if (storageSystemArn != null) 'StorageSystemArn': storageSystemArn,
    };
  }
}

/// A key-value pair representing a single tag that's been applied to an Amazon
/// Web Services resource.
class TagListEntry {
  /// The key for an Amazon Web Services resource tag.
  final String key;

  /// The value for an Amazon Web Services resource tag.
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
  /// Errors that DataSync encountered during execution of the task. You can use
  /// this error code to help troubleshoot issues.
  final String? errorCode;

  /// Detailed description of an error that was encountered during the task
  /// execution. You can use this information to help troubleshoot issues.
  final String? errorDetail;

  /// The total time in milliseconds that DataSync spent in the PREPARING phase.
  final int? prepareDuration;

  /// The status of the PREPARING phase.
  final PhaseStatus? prepareStatus;

  /// The total time in milliseconds that DataSync took to transfer the file from
  /// the source to the destination location.
  final int? totalDuration;

  /// The total time in milliseconds that DataSync spent in the TRANSFERRING
  /// phase.
  final int? transferDuration;

  /// The status of the TRANSFERRING phase.
  final PhaseStatus? transferStatus;

  /// The total time in milliseconds that DataSync spent in the VERIFYING phase.
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

extension TaskExecutionStatusValueExtension on TaskExecutionStatus {
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

extension TaskExecutionStatusFromString on String {
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
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/query-resources.html">filtering
/// DataSync resources</a>.
class TaskFilter {
  /// The name of the filter being used. Each API call supports a list of filters
  /// that are available for it. For example, <code>LocationId</code> for
  /// <code>ListTasks</code>.
  final TaskFilterName name;

  /// The operator that is used to compare filter values (for example,
  /// <code>Equals</code> or <code>Contains</code>).
  final Operator operator;

  /// The values that you want to filter for. For example, you might want to
  /// display only tasks for a specific destination location.
  final List<String> values;

  TaskFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

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

extension TaskFilterNameValueExtension on TaskFilterName {
  String toValue() {
    switch (this) {
      case TaskFilterName.locationId:
        return 'LocationId';
      case TaskFilterName.creationTime:
        return 'CreationTime';
    }
  }
}

extension TaskFilterNameFromString on String {
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

extension TaskQueueingValueExtension on TaskQueueing {
  String toValue() {
    switch (this) {
      case TaskQueueing.enabled:
        return 'ENABLED';
      case TaskQueueing.disabled:
        return 'DISABLED';
    }
  }
}

extension TaskQueueingFromString on String {
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
  /// A cron expression that specifies when DataSync initiates a scheduled
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

extension TaskStatusValueExtension on TaskStatus {
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

extension TaskStatusFromString on String {
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

/// The throughput peaks for an on-premises storage system volume. Each data
/// point represents the 95th percentile peak value during a 1-hour interval.
class Throughput {
  /// Peak throughput unrelated to read and write operations.
  final double? other;

  /// Peak throughput related to read operations.
  final double? read;

  /// Peak total throughput on your on-premises storage system resource.
  final double? total;

  /// Peak throughput related to write operations.
  final double? write;

  Throughput({
    this.other,
    this.read,
    this.total,
    this.write,
  });

  factory Throughput.fromJson(Map<String, dynamic> json) {
    return Throughput(
      other: json['Other'] as double?,
      read: json['Read'] as double?,
      total: json['Total'] as double?,
      write: json['Write'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final other = this.other;
    final read = this.read;
    final total = this.total;
    final write = this.write;
    return {
      if (other != null) 'Other': other,
      if (read != null) 'Read': read,
      if (total != null) 'Total': total,
      if (write != null) 'Write': write,
    };
  }
}

enum TransferMode {
  changed,
  all,
}

extension TransferModeValueExtension on TransferMode {
  String toValue() {
    switch (this) {
      case TransferMode.changed:
        return 'CHANGED';
      case TransferMode.all:
        return 'ALL';
    }
  }
}

extension TransferModeFromString on String {
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

extension UidValueExtension on Uid {
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

extension UidFromString on String {
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

class UpdateDiscoveryJobResponse {
  UpdateDiscoveryJobResponse();

  factory UpdateDiscoveryJobResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDiscoveryJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLocationHdfsResponse {
  UpdateLocationHdfsResponse();

  factory UpdateLocationHdfsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationHdfsResponse();
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

class UpdateStorageSystemResponse {
  UpdateStorageSystemResponse();

  factory UpdateStorageSystemResponse.fromJson(Map<String, dynamic> _) {
    return UpdateStorageSystemResponse();
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

extension VerifyModeValueExtension on VerifyMode {
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

extension VerifyModeFromString on String {
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
