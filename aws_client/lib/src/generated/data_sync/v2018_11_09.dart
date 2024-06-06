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

/// DataSync is an online data movement and discovery service that simplifies
/// data migration and helps you quickly, easily, and securely transfer your
/// file or object data to, from, and between Amazon Web Services storage
/// services.
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
  /// interface. You can only specify one ARN.
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

  /// Activates an DataSync agent that you've deployed in your storage
  /// environment. The activation process associates the agent with your Amazon
  /// Web Services account.
  ///
  /// If you haven't deployed an agent yet, see the following topics to learn
  /// more:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/agent-requirements.html">Agent
  /// requirements</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-agent.html">Create
  /// an agent</a>
  /// </li>
  /// </ul> <note>
  /// If you're transferring between Amazon Web Services storage services, you
  /// don't need a DataSync agent.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [activationKey] :
  /// Specifies your DataSync agent's activation key. If you don't have an
  /// activation key, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/activate-agent.html">Activate
  /// your agent</a>.
  ///
  /// Parameter [agentName] :
  /// Specifies a name for your agent. You can see this name in the DataSync
  /// console.
  ///
  /// Parameter [securityGroupArns] :
  /// Specifies the Amazon Resource Name (ARN) of the security group that
  /// protects your task's <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces">network
  /// interfaces</a> when <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html#choose-service-endpoint-vpc">using
  /// a virtual private cloud (VPC) endpoint</a>. You can only specify one ARN.
  ///
  /// Parameter [subnetArns] :
  /// Specifies the ARN of the subnet where you want to run your DataSync task
  /// when using a VPC endpoint. This is the subnet where DataSync creates and
  /// manages the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces">network
  /// interfaces</a> for your transfer. You can only specify one ARN.
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least one tag for
  /// your agent.
  ///
  /// Parameter [vpcEndpointId] :
  /// Specifies the ID of the VPC endpoint that you want your agent to connect
  /// to. For example, a VPC endpoint ID looks like
  /// <code>vpce-01234d5aff67890e1</code>.
  /// <important>
  /// The VPC endpoint you use must include the DataSync service name (for
  /// example, <code>com.amazonaws.us-east-2.datasync</code>).
  /// </important>
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

  /// Creates a transfer <i>location</i> for a Microsoft Azure Blob Storage
  /// container. DataSync can use this location as a transfer source or
  /// destination.
  ///
  /// Before you begin, make sure you know <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access">how
  /// DataSync accesses Azure Blob Storage</a> and works with <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers">access
  /// tiers</a> and <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#blob-types">blob
  /// types</a>. You also need a <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-creating-agent">DataSync
  /// agent</a> that can connect to your container.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArns] :
  /// Specifies the Amazon Resource Name (ARN) of the DataSync agent that can
  /// connect with your Azure Blob Storage container.
  ///
  /// You can specify more than one agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/multiple-agents.html">Using
  /// multiple agents for your transfer</a>.
  ///
  /// Parameter [authenticationType] :
  /// Specifies the authentication method DataSync uses to access your Azure
  /// Blob Storage. DataSync can access blob storage using a shared access
  /// signature (SAS).
  ///
  /// Parameter [containerUrl] :
  /// Specifies the URL of the Azure Blob Storage container involved in your
  /// transfer.
  ///
  /// Parameter [accessTier] :
  /// Specifies the access tier that you want your objects or files transferred
  /// into. This only applies when using the location as a transfer destination.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers">Access
  /// tiers</a>.
  ///
  /// Parameter [blobType] :
  /// Specifies the type of blob that you want your objects or files to be when
  /// transferring them into Azure Blob Storage. Currently, DataSync only
  /// supports moving data into Azure Blob Storage as block blobs. For more
  /// information on blob types, see the <a
  /// href="https://learn.microsoft.com/en-us/rest/api/storageservices/understanding-block-blobs--append-blobs--and-page-blobs">Azure
  /// Blob Storage documentation</a>.
  ///
  /// Parameter [sasConfiguration] :
  /// Specifies the SAS configuration that allows DataSync to access your Azure
  /// Blob Storage.
  ///
  /// Parameter [subdirectory] :
  /// Specifies path segments if you want to limit your transfer to a virtual
  /// directory in your container (for example, <code>/my/images</code>).
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least a name tag
  /// for your transfer location.
  Future<CreateLocationAzureBlobResponse> createLocationAzureBlob({
    required List<String> agentArns,
    required AzureBlobAuthenticationType authenticationType,
    required String containerUrl,
    AzureAccessTier? accessTier,
    AzureBlobType? blobType,
    AzureBlobSasConfiguration? sasConfiguration,
    String? subdirectory,
    List<TagListEntry>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.CreateLocationAzureBlob'
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
        'ContainerUrl': containerUrl,
        if (accessTier != null) 'AccessTier': accessTier.toValue(),
        if (blobType != null) 'BlobType': blobType.toValue(),
        if (sasConfiguration != null) 'SasConfiguration': sasConfiguration,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLocationAzureBlobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a transfer <i>location</i> for an Amazon EFS file system. DataSync
  /// can use this location as a source or destination for transferring data.
  ///
  /// Before you begin, make sure that you understand how DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-access">accesses
  /// Amazon EFS file systems</a>.
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

  /// Creates a transfer <i>location</i> for an Amazon FSx for Lustre file
  /// system. DataSync can use this location as a source or destination for
  /// transferring data.
  ///
  /// Before you begin, make sure that you understand how DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-lustre-location.html#create-lustre-location-access">accesses
  /// FSx for Lustre file systems</a>.
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

  /// Creates a transfer <i>location</i> for an Amazon FSx for NetApp ONTAP file
  /// system. DataSync can use this location as a source or destination for
  /// transferring data.
  ///
  /// Before you begin, make sure that you understand how DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-access">accesses
  /// FSx for ONTAP file systems</a>.
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

  /// Creates a transfer <i>location</i> for an Amazon FSx for OpenZFS file
  /// system. DataSync can use this location as a source or destination for
  /// transferring data.
  ///
  /// Before you begin, make sure that you understand how DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-openzfs-location.html#create-openzfs-access">accesses
  /// FSx for OpenZFS file systems</a>.
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

  /// Creates a transfer <i>location</i> for an Amazon FSx for Windows File
  /// Server file system. DataSync can use this location as a source or
  /// destination for transferring data.
  ///
  /// Before you begin, make sure that you understand how DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html#create-fsx-location-access">accesses
  /// FSx for Windows File Server file systems</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [fsxFilesystemArn] :
  /// Specifies the Amazon Resource Name (ARN) for the FSx for Windows File
  /// Server file system.
  ///
  /// Parameter [password] :
  /// Specifies the password of the user with the permissions to mount and
  /// access the files, folders, and file metadata in your FSx for Windows File
  /// Server file system.
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
  /// Specifies the user with the permissions to mount and access the files,
  /// folders, and file metadata in your FSx for Windows File Server file
  /// system.
  ///
  /// For information about choosing a user with the right level of access for
  /// your transfer, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html#create-fsx-windows-location-permissions">required
  /// permissions</a> for FSx for Windows File Server locations.
  ///
  /// Parameter [domain] :
  /// Specifies the name of the Microsoft Active Directory domain that the FSx
  /// for Windows File Server file system belongs to.
  ///
  /// If you have multiple Active Directory domains in your environment,
  /// configuring this parameter makes sure that DataSync connects to the right
  /// file system.
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

  /// Creates a transfer <i>location</i> for a Hadoop Distributed File System
  /// (HDFS). DataSync can use this location as a source or destination for
  /// transferring data.
  ///
  /// Before you begin, make sure that you understand how DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-hdfs-location.html#accessing-hdfs">accesses
  /// HDFS clusters</a>.
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

  /// Creates a transfer <i>location</i> for a Network File System (NFS) file
  /// server. DataSync can use this location as a source or destination for
  /// transferring data.
  ///
  /// Before you begin, make sure that you understand how DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#accessing-nfs">accesses
  /// NFS file servers</a>.
  /// <note>
  /// If you're copying data to or from an Snowcone device, you can also use
  /// <code>CreateLocationNfs</code> to create your transfer location. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/nfs-on-snowcone.html">Configuring
  /// transfers with Snowcone</a>.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [onPremConfig] :
  /// Specifies the Amazon Resource Name (ARN) of the DataSync agent that want
  /// to connect to your NFS file server.
  ///
  /// You can specify more than one agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/multiple-agents.html">Using
  /// multiple agents for transfers</a>.
  ///
  /// Parameter [serverHostname] :
  /// Specifies the Domain Name System (DNS) name or IP version 4 address of the
  /// NFS file server that your DataSync agent connects to.
  ///
  /// Parameter [subdirectory] :
  /// Specifies the export path in your NFS file server that you want DataSync
  /// to mount.
  ///
  /// This path (or a subdirectory of the path) is where DataSync transfers data
  /// to or from. For information on configuring an export for DataSync, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#accessing-nfs">Accessing
  /// NFS file servers</a>.
  ///
  /// Parameter [mountOptions] :
  /// Specifies the options that DataSync can use to mount your NFS file server.
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least a name tag
  /// for your location.
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

  /// Creates a transfer <i>location</i> for an object storage system. DataSync
  /// can use this location as a source or destination for transferring data.
  ///
  /// Before you begin, make sure that you understand the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html#create-object-location-prerequisites">prerequisites</a>
  /// for DataSync to work with object storage systems.
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
  /// Specifies a certificate chain for DataSync to authenticate with your
  /// object storage system if the system uses a private or self-signed
  /// certificate authority (CA). You must specify a single <code>.pem</code>
  /// file with a full certificate chain (for example,
  /// <code>file:///home/user/.ssh/object_storage_certificates.pem</code>).
  ///
  /// The certificate chain might include:
  ///
  /// <ul>
  /// <li>
  /// The object storage system's certificate
  /// </li>
  /// <li>
  /// All intermediate certificates (if there are any)
  /// </li>
  /// <li>
  /// The root certificate of the signing CA
  /// </li>
  /// </ul>
  /// You can concatenate your certificates into a <code>.pem</code> file (which
  /// can be up to 32768 bytes before base64 encoding). The following example
  /// <code>cat</code> command creates an
  /// <code>object_storage_certificates.pem</code> file that includes three
  /// certificates:
  ///
  /// <code>cat object_server_certificate.pem intermediate_certificate.pem
  /// ca_root_certificate.pem &gt; object_storage_certificates.pem</code>
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

  /// Creates a transfer <i>location</i> for an Amazon S3 bucket. DataSync can
  /// use this location as a source or destination for transferring data.
  /// <important>
  /// Before you begin, make sure that you read the following topics:
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
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html">Configuring
  /// transfers with Amazon S3</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3BucketArn] :
  /// Specifies the ARN of the S3 bucket that you want to use as a location.
  /// (When creating your DataSync task later, you specify whether this location
  /// is a transfer source or destination.)
  ///
  /// If your S3 bucket is located on an Outposts resource, you must specify an
  /// Amazon S3 access point. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html">Managing
  /// data access with Amazon S3 access points</a> in the <i>Amazon S3 User
  /// Guide</i>.
  ///
  /// Parameter [agentArns] :
  /// (Amazon S3 on Outposts only) Specifies the Amazon Resource Name (ARN) of
  /// the DataSync agent on your Outpost.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/deploy-agents.html#outposts-agent">Deploy
  /// your DataSync agent on Outposts</a>.
  ///
  /// Parameter [s3StorageClass] :
  /// Specifies the storage class that you want your objects to use when Amazon
  /// S3 is a transfer destination.
  ///
  /// For buckets in Amazon Web Services Regions, the storage class defaults to
  /// <code>STANDARD</code>. For buckets on Outposts, the storage class defaults
  /// to <code>OUTPOSTS</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Storage
  /// class considerations with Amazon S3 transfers</a>.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a prefix in the S3 bucket that DataSync reads from or writes to
  /// (depending on whether the bucket is a source or destination location).
  /// <note>
  /// DataSync can't transfer objects with a prefix that begins with a slash
  /// (<code>/</code>) or includes <code>//</code>, <code>/./</code>, or
  /// <code>/../</code> patterns. For example:
  ///
  /// <ul>
  /// <li>
  /// <code>/photos</code>
  /// </li>
  /// <li>
  /// <code>photos//2006/January</code>
  /// </li>
  /// <li>
  /// <code>photos/./2006/February</code>
  /// </li>
  /// <li>
  /// <code>photos/../2006/March</code>
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least a name tag
  /// for your transfer location.
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

  /// Creates a transfer <i>location</i> for a Server Message Block (SMB) file
  /// server. DataSync can use this location as a source or destination for
  /// transferring data.
  ///
  /// Before you begin, make sure that you understand how DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb">accesses
  /// SMB file servers</a>.
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
  /// To copy all data in the subdirectory, DataSync must be able to mount the
  /// SMB share and access all of its data. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">required
  /// permissions</a> for SMB locations.
  ///
  /// Parameter [user] :
  /// Specifies the user that can mount and access the files, folders, and file
  /// metadata in your SMB file server.
  ///
  /// For information about choosing a user with the right level of access for
  /// your transfer, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">required
  /// permissions</a> for SMB locations.
  ///
  /// Parameter [domain] :
  /// Specifies the name of the Active Directory domain that your SMB file
  /// server belongs to.
  ///
  /// If you have multiple Active Directory domains in your environment,
  /// configuring this parameter makes sure that DataSync connects to the right
  /// file server.
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

  /// Configures a <i>task</i>, which defines where and how DataSync transfers
  /// your data.
  ///
  /// A task includes a source location, destination location, and transfer
  /// options (such as bandwidth limits, scheduling, and more).
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
  /// Specifies the ARN of your transfer's destination location.
  ///
  /// Parameter [sourceLocationArn] :
  /// Specifies the ARN of your transfer's source location.
  ///
  /// Parameter [cloudWatchLogGroupArn] :
  /// Specifies the Amazon Resource Name (ARN) of an Amazon CloudWatch log group
  /// for monitoring your task.
  ///
  /// Parameter [excludes] :
  /// Specifies exclude filters that define the files, objects, and folders in
  /// your source location that you don't want DataSync to transfer. For more
  /// information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Specifying
  /// what DataSync transfers by using filters</a>.
  ///
  /// Parameter [includes] :
  /// Specifies include filters define the files, objects, and folders in your
  /// source location that you want DataSync to transfer. For more information
  /// and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Specifying
  /// what DataSync transfers by using filters</a>.
  ///
  /// Parameter [manifestConfig] :
  /// Configures a manifest, which is a list of files or objects that you want
  /// DataSync to transfer. For more information and configuration examples, see
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
  /// what DataSync transfers by using a manifest</a>.
  ///
  /// When using this parameter, your caller identity (the role that you're
  /// using DataSync with) must have the <code>iam:PassRole</code> permission.
  /// The <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess">AWSDataSyncFullAccess</a>
  /// policy includes this permission.
  ///
  /// Parameter [name] :
  /// Specifies the name of your task.
  ///
  /// Parameter [options] :
  /// Specifies your task's settings, such as preserving file metadata,
  /// verifying data integrity, among other options.
  ///
  /// Parameter [schedule] :
  /// Specifies a schedule for when you want your task to run. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">Scheduling
  /// your task</a>.
  ///
  /// Parameter [tags] :
  /// Specifies the tags that you want to apply to your task.
  ///
  /// <i>Tags</i> are key-value pairs that help you manage, filter, and search
  /// for your DataSync resources.
  ///
  /// Parameter [taskReportConfig] :
  /// Specifies how you want to configure a task report, which provides detailed
  /// information about your DataSync transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">Monitoring
  /// your DataSync transfers with task reports</a>.
  ///
  /// When using this parameter, your caller identity (the role that you're
  /// using DataSync with) must have the <code>iam:PassRole</code> permission.
  /// The <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess">AWSDataSyncFullAccess</a>
  /// policy includes this permission.
  Future<CreateTaskResponse> createTask({
    required String destinationLocationArn,
    required String sourceLocationArn,
    String? cloudWatchLogGroupArn,
    List<FilterRule>? excludes,
    List<FilterRule>? includes,
    ManifestConfig? manifestConfig,
    String? name,
    Options? options,
    TaskSchedule? schedule,
    List<TagListEntry>? tags,
    TaskReportConfig? taskReportConfig,
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
        if (manifestConfig != null) 'ManifestConfig': manifestConfig,
        if (name != null) 'Name': name,
        if (options != null) 'Options': options,
        if (schedule != null) 'Schedule': schedule,
        if (tags != null) 'Tags': tags,
        if (taskReportConfig != null) 'TaskReportConfig': taskReportConfig,
      },
    );

    return CreateTaskResponse.fromJson(jsonResponse.body);
  }

  /// Removes an DataSync agent resource from your Amazon Web Services account.
  ///
  /// Keep in mind that this operation (which can't be undone) doesn't remove
  /// the agent's virtual machine (VM) or Amazon EC2 instance from your storage
  /// environment. For next steps, you can delete the VM or instance from your
  /// storage environment or reuse it to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/activate-agent.html">activate
  /// a new agent</a>.
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

  /// Deletes a transfer location resource from DataSync.
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

  /// Deletes a transfer task resource from DataSync.
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

  /// Returns information about an DataSync agent, such as its name, service
  /// endpoint type, and status.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [agentArn] :
  /// Specifies the Amazon Resource Name (ARN) of the DataSync agent that you
  /// want information about.
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

  /// Provides details about how an DataSync transfer location for Microsoft
  /// Azure Blob Storage is configured.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of your Azure Blob Storage
  /// transfer location.
  Future<DescribeLocationAzureBlobResponse> describeLocationAzureBlob({
    required String locationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.DescribeLocationAzureBlob'
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

    return DescribeLocationAzureBlobResponse.fromJson(jsonResponse.body);
  }

  /// Provides details about how an DataSync transfer location for an Amazon EFS
  /// file system is configured.
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

  /// Provides details about how an DataSync transfer location for an Amazon FSx
  /// for Lustre file system is configured.
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

  /// Provides details about how an DataSync transfer location for an Amazon FSx
  /// for NetApp ONTAP file system is configured.
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

  /// Provides details about how an DataSync transfer location for an Amazon FSx
  /// for OpenZFS file system is configured.
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

  /// Provides details about how an DataSync transfer location for an Amazon FSx
  /// for Windows File Server file system is configured.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the FSx for Windows File
  /// Server location.
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

  /// Provides details about how an DataSync transfer location for a Hadoop
  /// Distributed File System (HDFS) is configured.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the HDFS location.
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

  /// Provides details about how an DataSync transfer location for a Network
  /// File System (NFS) file server is configured.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the NFS location that you want
  /// information about.
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

  /// Provides details about how an DataSync transfer location for an object
  /// storage system is configured.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the object storage system
  /// location.
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

  /// Provides details about how an DataSync transfer location for an S3 bucket
  /// is configured.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the Amazon S3 location.
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

  /// Provides details about how an DataSync transfer location for a Server
  /// Message Block (SMB) file server is configured.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the SMB location that you want
  /// information about.
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

  /// Provides information about a <i>task</i>, which defines where and how
  /// DataSync transfers your data.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskArn] :
  /// Specifies the Amazon Resource Name (ARN) of the transfer task that you
  /// want information about.
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

  /// Provides information about an execution of your DataSync task. You can use
  /// this operation to help monitor the progress of an ongoing transfer or
  /// check the results of the transfer.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskExecutionArn] :
  /// Specifies the Amazon Resource Name (ARN) of the task execution that you
  /// want information about.
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

  /// Returns a list of executions for an DataSync transfer task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// Specifies how many results you want in the response.
  ///
  /// Parameter [nextToken] :
  /// Specifies an opaque string that indicates the position at which to begin
  /// the next list of results in the response.
  ///
  /// Parameter [taskArn] :
  /// Specifies the Amazon Resource Name (ARN) of the task that you want
  /// execution information about.
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

  /// Starts an DataSync transfer task. For each task, you can only run one task
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
  /// Parameter [manifestConfig] :
  /// Configures a manifest, which is a list of files or objects that you want
  /// DataSync to transfer. For more information and configuration examples, see
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
  /// what DataSync transfers by using a manifest</a>.
  ///
  /// When using this parameter, your caller identity (the role that you're
  /// using DataSync with) must have the <code>iam:PassRole</code> permission.
  /// The <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess">AWSDataSyncFullAccess</a>
  /// policy includes this permission.
  ///
  /// To remove a manifest configuration, specify this parameter with an empty
  /// value.
  ///
  /// Parameter [tags] :
  /// Specifies the tags that you want to apply to the Amazon Resource Name
  /// (ARN) representing the task execution.
  ///
  /// <i>Tags</i> are key-value pairs that help you manage, filter, and search
  /// for your DataSync resources.
  ///
  /// Parameter [taskReportConfig] :
  /// Specifies how you want to configure a task report, which provides detailed
  /// information about your DataSync transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">Monitoring
  /// your DataSync transfers with task reports</a>.
  ///
  /// When using this parameter, your caller identity (the role that you're
  /// using DataSync with) must have the <code>iam:PassRole</code> permission.
  /// The <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess">AWSDataSyncFullAccess</a>
  /// policy includes this permission.
  ///
  /// To remove a task report configuration, specify this parameter as empty.
  Future<StartTaskExecutionResponse> startTaskExecution({
    required String taskArn,
    List<FilterRule>? excludes,
    List<FilterRule>? includes,
    ManifestConfig? manifestConfig,
    Options? overrideOptions,
    List<TagListEntry>? tags,
    TaskReportConfig? taskReportConfig,
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
        if (manifestConfig != null) 'ManifestConfig': manifestConfig,
        if (overrideOptions != null) 'OverrideOptions': overrideOptions,
        if (tags != null) 'Tags': tags,
        if (taskReportConfig != null) 'TaskReportConfig': taskReportConfig,
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

  /// Updates the name of an DataSync agent.
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

  /// Modifies some configurations of the Microsoft Azure Blob Storage transfer
  /// location that you're using with DataSync.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the ARN of the Azure Blob Storage transfer location that you're
  /// updating.
  ///
  /// Parameter [accessTier] :
  /// Specifies the access tier that you want your objects or files transferred
  /// into. This only applies when using the location as a transfer destination.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers">Access
  /// tiers</a>.
  ///
  /// Parameter [agentArns] :
  /// Specifies the Amazon Resource Name (ARN) of the DataSync agent that can
  /// connect with your Azure Blob Storage container.
  ///
  /// You can specify more than one agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/multiple-agents.html">Using
  /// multiple agents for your transfer</a>.
  ///
  /// Parameter [authenticationType] :
  /// Specifies the authentication method DataSync uses to access your Azure
  /// Blob Storage. DataSync can access blob storage using a shared access
  /// signature (SAS).
  ///
  /// Parameter [blobType] :
  /// Specifies the type of blob that you want your objects or files to be when
  /// transferring them into Azure Blob Storage. Currently, DataSync only
  /// supports moving data into Azure Blob Storage as block blobs. For more
  /// information on blob types, see the <a
  /// href="https://learn.microsoft.com/en-us/rest/api/storageservices/understanding-block-blobs--append-blobs--and-page-blobs">Azure
  /// Blob Storage documentation</a>.
  ///
  /// Parameter [sasConfiguration] :
  /// Specifies the SAS configuration that allows DataSync to access your Azure
  /// Blob Storage.
  ///
  /// Parameter [subdirectory] :
  /// Specifies path segments if you want to limit your transfer to a virtual
  /// directory in your container (for example, <code>/my/images</code>).
  Future<void> updateLocationAzureBlob({
    required String locationArn,
    AzureAccessTier? accessTier,
    List<String>? agentArns,
    AzureBlobAuthenticationType? authenticationType,
    AzureBlobType? blobType,
    AzureBlobSasConfiguration? sasConfiguration,
    String? subdirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationAzureBlob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (accessTier != null) 'AccessTier': accessTier.toValue(),
        if (agentArns != null) 'AgentArns': agentArns,
        if (authenticationType != null)
          'AuthenticationType': authenticationType.toValue(),
        if (blobType != null) 'BlobType': blobType.toValue(),
        if (sasConfiguration != null) 'SasConfiguration': sasConfiguration,
        if (subdirectory != null) 'Subdirectory': subdirectory,
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

  /// Modifies some configurations of the Network File System (NFS) transfer
  /// location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html">Configuring
  /// transfers to or from an NFS file server</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the NFS transfer location that
  /// you want to update.
  ///
  /// Parameter [subdirectory] :
  /// Specifies the export path in your NFS file server that you want DataSync
  /// to mount.
  ///
  /// This path (or a subdirectory of the path) is where DataSync transfers data
  /// to or from. For information on configuring an export for DataSync, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#accessing-nfs">Accessing
  /// NFS file servers</a>.
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

  /// Updates some parameters of an existing DataSync location for an object
  /// storage system.
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
  /// Specifies a certificate chain for DataSync to authenticate with your
  /// object storage system if the system uses a private or self-signed
  /// certificate authority (CA). You must specify a single <code>.pem</code>
  /// file with a full certificate chain (for example,
  /// <code>file:///home/user/.ssh/object_storage_certificates.pem</code>).
  ///
  /// The certificate chain might include:
  ///
  /// <ul>
  /// <li>
  /// The object storage system's certificate
  /// </li>
  /// <li>
  /// All intermediate certificates (if there are any)
  /// </li>
  /// <li>
  /// The root certificate of the signing CA
  /// </li>
  /// </ul>
  /// You can concatenate your certificates into a <code>.pem</code> file (which
  /// can be up to 32768 bytes before base64 encoding). The following example
  /// <code>cat</code> command creates an
  /// <code>object_storage_certificates.pem</code> file that includes three
  /// certificates:
  ///
  /// <code>cat object_server_certificate.pem intermediate_certificate.pem
  /// ca_root_certificate.pem &gt; object_storage_certificates.pem</code>
  ///
  /// To use this parameter, configure <code>ServerProtocol</code> to
  /// <code>HTTPS</code>.
  ///
  /// Updating this parameter doesn't interfere with tasks that you have in
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

  /// Updates some of the parameters of a Server Message Block (SMB) file server
  /// location that you can use for DataSync transfers.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the ARN of the SMB location that you want to update.
  ///
  /// Parameter [agentArns] :
  /// Specifies the DataSync agent (or agents) which you want to connect to your
  /// SMB file server. You specify an agent by using its Amazon Resource Name
  /// (ARN).
  ///
  /// Parameter [domain] :
  /// Specifies the Windows domain name that your SMB file server belongs to.
  ///
  /// If you have multiple domains in your environment, configuring this
  /// parameter makes sure that DataSync connects to the right file server.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">required
  /// permissions</a> for SMB locations.
  ///
  /// Parameter [password] :
  /// Specifies the password of the user who can mount your SMB file server and
  /// has permission to access the files and folders involved in your transfer.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">required
  /// permissions</a> for SMB locations.
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
  /// connects to and reads your on-premises storage system. You can only
  /// specify one ARN.
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

  /// Updates the configuration of a <i>task</i>, which defines where and how
  /// DataSync transfers your data.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalException].
  ///
  /// Parameter [taskArn] :
  /// Specifies the ARN of the task that you want to update.
  ///
  /// Parameter [cloudWatchLogGroupArn] :
  /// Specifies the Amazon Resource Name (ARN) of an Amazon CloudWatch log group
  /// for monitoring your task.
  ///
  /// Parameter [excludes] :
  /// Specifies exclude filters that define the files, objects, and folders in
  /// your source location that you don't want DataSync to transfer. For more
  /// information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Specifying
  /// what DataSync transfers by using filters</a>.
  ///
  /// Parameter [includes] :
  /// Specifies include filters define the files, objects, and folders in your
  /// source location that you want DataSync to transfer. For more information
  /// and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Specifying
  /// what DataSync transfers by using filters</a>.
  ///
  /// Parameter [manifestConfig] :
  /// Configures a manifest, which is a list of files or objects that you want
  /// DataSync to transfer. For more information and configuration examples, see
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
  /// what DataSync transfers by using a manifest</a>.
  ///
  /// When using this parameter, your caller identity (the IAM role that you're
  /// using DataSync with) must have the <code>iam:PassRole</code> permission.
  /// The <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess">AWSDataSyncFullAccess</a>
  /// policy includes this permission.
  ///
  /// To remove a manifest configuration, specify this parameter as empty.
  ///
  /// Parameter [name] :
  /// Specifies the name of your task.
  ///
  /// Parameter [schedule] :
  /// Specifies a schedule for when you want your task to run. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">Scheduling
  /// your task</a>.
  ///
  /// Parameter [taskReportConfig] :
  /// Specifies how you want to configure a task report, which provides detailed
  /// information about your DataSync transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">Monitoring
  /// your DataSync transfers with task reports</a>.
  ///
  /// When using this parameter, your caller identity (the IAM role that you're
  /// using DataSync with) must have the <code>iam:PassRole</code> permission.
  /// The <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-awsdatasyncfullaccess">AWSDataSyncFullAccess</a>
  /// policy includes this permission.
  ///
  /// To remove a task report configuration, specify this parameter as empty.
  Future<void> updateTask({
    required String taskArn,
    String? cloudWatchLogGroupArn,
    List<FilterRule>? excludes,
    List<FilterRule>? includes,
    ManifestConfig? manifestConfig,
    String? name,
    Options? options,
    TaskSchedule? schedule,
    TaskReportConfig? taskReportConfig,
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
        if (manifestConfig != null) 'ManifestConfig': manifestConfig,
        if (name != null) 'Name': name,
        if (options != null) 'Options': options,
        if (schedule != null) 'Schedule': schedule,
        if (taskReportConfig != null) 'TaskReportConfig': taskReportConfig,
      },
    );
  }

  /// Updates the configuration of a running DataSync task execution.
  /// <note>
  /// Currently, the only <code>Option</code> that you can modify with
  /// <code>UpdateTaskExecution</code> is <code> <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-BytesPerSecond">BytesPerSecond</a>
  /// </code>, which throttles bandwidth for a running or queued task execution.
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

  /// The platform-related details about the agent, such as the version number.
  final Platform? platform;

  /// The status of an agent.
  ///
  /// <ul>
  /// <li>
  /// If the status is <code>ONLINE</code>, the agent is configured properly and
  /// ready to use.
  /// </li>
  /// <li>
  /// If the status is <code>OFFLINE</code>, the agent has been out of contact
  /// with DataSync for five minutes or longer. This can happen for a few reasons.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-agents.html#troubleshoot-agent-offline">What
  /// do I do if my agent is offline?</a>
  /// </li>
  /// </ul>
  final AgentStatus? status;

  AgentListEntry({
    this.agentArn,
    this.name,
    this.platform,
    this.status,
  });

  factory AgentListEntry.fromJson(Map<String, dynamic> json) {
    return AgentListEntry(
      agentArn: json['AgentArn'] as String?,
      name: json['Name'] as String?,
      platform: json['Platform'] != null
          ? Platform.fromJson(json['Platform'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toAgentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentArn = this.agentArn;
    final name = this.name;
    final platform = this.platform;
    final status = this.status;
    return {
      if (agentArn != null) 'AgentArn': agentArn,
      if (name != null) 'Name': name,
      if (platform != null) 'Platform': platform,
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

enum AzureAccessTier {
  hot,
  cool,
  archive,
}

extension AzureAccessTierValueExtension on AzureAccessTier {
  String toValue() {
    switch (this) {
      case AzureAccessTier.hot:
        return 'HOT';
      case AzureAccessTier.cool:
        return 'COOL';
      case AzureAccessTier.archive:
        return 'ARCHIVE';
    }
  }
}

extension AzureAccessTierFromString on String {
  AzureAccessTier toAzureAccessTier() {
    switch (this) {
      case 'HOT':
        return AzureAccessTier.hot;
      case 'COOL':
        return AzureAccessTier.cool;
      case 'ARCHIVE':
        return AzureAccessTier.archive;
    }
    throw Exception('$this is not known in enum AzureAccessTier');
  }
}

enum AzureBlobAuthenticationType {
  sas,
}

extension AzureBlobAuthenticationTypeValueExtension
    on AzureBlobAuthenticationType {
  String toValue() {
    switch (this) {
      case AzureBlobAuthenticationType.sas:
        return 'SAS';
    }
  }
}

extension AzureBlobAuthenticationTypeFromString on String {
  AzureBlobAuthenticationType toAzureBlobAuthenticationType() {
    switch (this) {
      case 'SAS':
        return AzureBlobAuthenticationType.sas;
    }
    throw Exception('$this is not known in enum AzureBlobAuthenticationType');
  }
}

/// The shared access signature (SAS) configuration that allows DataSync to
/// access your Microsoft Azure Blob Storage.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-sas-tokens">SAS
/// tokens</a> for accessing your Azure Blob Storage.
class AzureBlobSasConfiguration {
  /// Specifies a SAS token that provides permissions to access your Azure Blob
  /// Storage.
  ///
  /// The token is part of the SAS URI string that comes after the storage
  /// resource URI and a question mark. A token looks something like this:
  ///
  /// <code>sp=r&amp;st=2023-12-20T14:54:52Z&amp;se=2023-12-20T22:54:52Z&amp;spr=https&amp;sv=2021-06-08&amp;sr=c&amp;sig=aBBKDWQvyuVcTPH9EBp%2FXTI9E%2F%2Fmq171%2BZU178wcwqU%3D</code>
  final String token;

  AzureBlobSasConfiguration({
    required this.token,
  });

  Map<String, dynamic> toJson() {
    final token = this.token;
    return {
      'Token': token,
    };
  }
}

enum AzureBlobType {
  block,
}

extension AzureBlobTypeValueExtension on AzureBlobType {
  String toValue() {
    switch (this) {
      case AzureBlobType.block:
        return 'BLOCK';
    }
  }
}

extension AzureBlobTypeFromString on String {
  AzureBlobType toAzureBlobType() {
    switch (this) {
      case 'BLOCK':
        return AzureBlobType.block;
    }
    throw Exception('$this is not known in enum AzureBlobType');
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
  /// The amount of space in the cluster that's in cloud storage (for example, if
  /// you're using data tiering).
  final int? clusterCloudStorageUsed;

  /// The amount of space that's being used in a storage system resource without
  /// accounting for compression or deduplication.
  final int? logicalUsed;

  /// The total amount of space available in a storage system resource.
  final int? provisioned;

  /// The amount of space that's being used in a storage system resource.
  final int? used;

  Capacity({
    this.clusterCloudStorageUsed,
    this.logicalUsed,
    this.provisioned,
    this.used,
  });

  factory Capacity.fromJson(Map<String, dynamic> json) {
    return Capacity(
      clusterCloudStorageUsed: json['ClusterCloudStorageUsed'] as int?,
      logicalUsed: json['LogicalUsed'] as int?,
      provisioned: json['Provisioned'] as int?,
      used: json['Used'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterCloudStorageUsed = this.clusterCloudStorageUsed;
    final logicalUsed = this.logicalUsed;
    final provisioned = this.provisioned;
    final used = this.used;
    return {
      if (clusterCloudStorageUsed != null)
        'ClusterCloudStorageUsed': clusterCloudStorageUsed,
      if (logicalUsed != null) 'LogicalUsed': logicalUsed,
      if (provisioned != null) 'Provisioned': provisioned,
      if (used != null) 'Used': used,
    };
  }
}

/// CreateAgentResponse
class CreateAgentResponse {
  /// The ARN of the agent that you just activated. Use the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListAgents.html">ListAgents</a>
  /// operation to return a list of agents in your Amazon Web Services account and
  /// Amazon Web Services Region.
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

class CreateLocationAzureBlobResponse {
  /// The ARN of the Azure Blob Storage transfer location that you created.
  final String? locationArn;

  CreateLocationAzureBlobResponse({
    this.locationArn,
  });

  factory CreateLocationAzureBlobResponse.fromJson(Map<String, dynamic> json) {
    return CreateLocationAzureBlobResponse(
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
  /// The ARN of the transfer location that you created for your NFS file server.
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
  /// The ARN of the S3 location that you created.
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

  /// The time that the agent was <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/activate-agent.html">activated</a>.
  final DateTime? creationTime;

  /// The type of <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html">service
  /// endpoint</a> that your agent is connected to.
  final EndpointType? endpointType;

  /// The last time that the agent was communicating with the DataSync service.
  final DateTime? lastConnectionTime;

  /// The name of the agent.
  final String? name;

  /// The platform-related details about the agent, such as the version number.
  final Platform? platform;

  /// The network configuration that the agent uses when connecting to a <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html#choose-service-endpoint-vpc">VPC
  /// service endpoint</a>.
  final PrivateLinkConfig? privateLinkConfig;

  /// The status of the agent.
  ///
  /// <ul>
  /// <li>
  /// If the status is <code>ONLINE</code>, the agent is configured properly and
  /// ready to use.
  /// </li>
  /// <li>
  /// If the status is <code>OFFLINE</code>, the agent has been out of contact
  /// with DataSync for five minutes or longer. This can happen for a few reasons.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-agents.html#troubleshoot-agent-offline">What
  /// do I do if my agent is offline?</a>
  /// </li>
  /// </ul>
  final AgentStatus? status;

  DescribeAgentResponse({
    this.agentArn,
    this.creationTime,
    this.endpointType,
    this.lastConnectionTime,
    this.name,
    this.platform,
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
      platform: json['Platform'] != null
          ? Platform.fromJson(json['Platform'] as Map<String, dynamic>)
          : null,
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
    final platform = this.platform;
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
      if (platform != null) 'Platform': platform,
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

class DescribeLocationAzureBlobResponse {
  /// The access tier that you want your objects or files transferred into. This
  /// only applies when using the location as a transfer destination. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers">Access
  /// tiers</a>.
  final AzureAccessTier? accessTier;

  /// The ARNs of the DataSync agents that can connect with your Azure Blob
  /// Storage container.
  final List<String>? agentArns;

  /// The authentication method DataSync uses to access your Azure Blob Storage.
  /// DataSync can access blob storage using a shared access signature (SAS).
  final AzureBlobAuthenticationType? authenticationType;

  /// The type of blob that you want your objects or files to be when transferring
  /// them into Azure Blob Storage. Currently, DataSync only supports moving data
  /// into Azure Blob Storage as block blobs. For more information on blob types,
  /// see the <a
  /// href="https://learn.microsoft.com/en-us/rest/api/storageservices/understanding-block-blobs--append-blobs--and-page-blobs">Azure
  /// Blob Storage documentation</a>.
  final AzureBlobType? blobType;

  /// The time that your Azure Blob Storage transfer location was created.
  final DateTime? creationTime;

  /// The ARN of your Azure Blob Storage transfer location.
  final String? locationArn;

  /// The URL of the Azure Blob Storage container involved in your transfer.
  final String? locationUri;

  DescribeLocationAzureBlobResponse({
    this.accessTier,
    this.agentArns,
    this.authenticationType,
    this.blobType,
    this.creationTime,
    this.locationArn,
    this.locationUri,
  });

  factory DescribeLocationAzureBlobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLocationAzureBlobResponse(
      accessTier: (json['AccessTier'] as String?)?.toAzureAccessTier(),
      agentArns: (json['AgentArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      authenticationType: (json['AuthenticationType'] as String?)
          ?.toAzureBlobAuthenticationType(),
      blobType: (json['BlobType'] as String?)?.toAzureBlobType(),
      creationTime: timeStampFromJson(json['CreationTime']),
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessTier = this.accessTier;
    final agentArns = this.agentArns;
    final authenticationType = this.authenticationType;
    final blobType = this.blobType;
    final creationTime = this.creationTime;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    return {
      if (accessTier != null) 'AccessTier': accessTier.toValue(),
      if (agentArns != null) 'AgentArns': agentArns,
      if (authenticationType != null)
        'AuthenticationType': authenticationType.toValue(),
      if (blobType != null) 'BlobType': blobType.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
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

  /// The name of the Microsoft Active Directory domain that the FSx for Windows
  /// File Server file system belongs to.
  final String? domain;

  /// The ARN of the FSx for Windows File Server location.
  final String? locationArn;

  /// The uniform resource identifier (URI) of the FSx for Windows File Server
  /// location.
  final String? locationUri;

  /// The ARNs of the security groups that are configured for the FSx for Windows
  /// File Server file system.
  final List<String>? securityGroupArns;

  /// The user with the permissions to mount and access the FSx for Windows File
  /// Server file system.
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
  /// The ARNs of the DataSync agents that can connect with your HDFS cluster.
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

  /// The ARN of the HDFS location.
  final String? locationArn;

  /// The URI of the HDFS location.
  final String? locationUri;

  /// The NameNode that manages the HDFS namespace.
  final List<HdfsNameNode>? nameNodes;

  /// The Quality of Protection (QOP) configuration, which specifies the Remote
  /// Procedure Call (RPC) and data transfer protection settings configured on the
  /// HDFS cluster.
  final QopConfiguration? qopConfiguration;

  /// The number of DataNodes to replicate the data to when writing to the HDFS
  /// cluster.
  final int? replicationFactor;

  /// The user name to identify the client on the host operating system. This
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
  /// The time when the NFS location was created.
  final DateTime? creationTime;

  /// The ARN of the NFS location.
  final String? locationArn;

  /// The URI of the NFS location.
  final String? locationUri;

  /// The mount options that DataSync uses to mount your NFS file server.
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

  /// The ARNs of the DataSync agents that can connect with your object storage
  /// system.
  final List<String>? agentArns;

  /// The time that the location was created.
  final DateTime? creationTime;

  /// The ARN of the object storage system location.
  final String? locationArn;

  /// The URI of the object storage system location.
  final String? locationUri;

  /// The certificate chain for DataSync to authenticate with your object storage
  /// system if the system uses a private or self-signed certificate authority
  /// (CA).
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
  /// The ARNs of the DataSync agents deployed on your Outpost when using working
  /// with Amazon S3 on Outposts.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/deploy-agents.html#outposts-agent">Deploy
  /// your DataSync agent on Outposts</a>.
  final List<String>? agentArns;

  /// The time that the Amazon S3 location was created.
  final DateTime? creationTime;

  /// The ARN of the Amazon S3 location.
  final String? locationArn;

  /// The URL of the Amazon S3 location that was described.
  final String? locationUri;
  final S3Config? s3Config;

  /// When Amazon S3 is a destination location, this is the storage class that you
  /// chose for your objects.
  ///
  /// Some storage classes have behaviors that can affect your Amazon S3 storage
  /// costs. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Storage
  /// class considerations with Amazon S3 transfers</a>.
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
  /// The ARNs of the DataSync agents that can connect with your SMB file server.
  final List<String>? agentArns;

  /// The time that the SMB location was created.
  final DateTime? creationTime;

  /// The name of the Microsoft Active Directory domain that the SMB file server
  /// belongs to.
  final String? domain;

  /// The ARN of the SMB location.
  final String? locationArn;

  /// The URI of the SMB location.
  final String? locationUri;

  /// The protocol that DataSync use to access your SMB file.
  final SmbMountOptions? mountOptions;

  /// The user that can mount and access the files, folders, and file metadata in
  /// your SMB file server.
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

  /// The number of logical bytes written to the destination location.
  final int? bytesWritten;

  /// The estimated physical number of bytes that will transfer over the network.
  final int? estimatedBytesToTransfer;

  /// The expected number of files, objects, and directories that DataSync will
  /// delete in your destination location. If you don't <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html">configure
  /// your task</a> to delete data in the destination that isn't in the source,
  /// the value is always <code>0</code>.
  final int? estimatedFilesToDelete;

  /// The expected number of files, objects, and directories that DataSync will
  /// transfer over the network. This value is calculated during the task
  /// execution's <code>PREPARING</code> phase before the
  /// <code>TRANSFERRING</code> phase. The calculation is based on comparing the
  /// content of the source and destination locations and finding the difference
  /// that needs to be transferred.
  final int? estimatedFilesToTransfer;

  /// A list of filter rules that exclude specific data during your transfer. For
  /// more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  final List<FilterRule>? excludes;

  /// The number of files, objects, and directories that DataSync deleted in your
  /// destination location. If you don't <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html">configure
  /// your task</a> to delete data in the destination that isn't in the source,
  /// the value is always <code>0</code>.
  final int? filesDeleted;

  /// The number of files, objects, and directories that DataSync skipped during
  /// your transfer.
  final int? filesSkipped;

  /// The actual number of files, objects, and directories that DataSync
  /// transferred over the network. This value is updated periodically during the
  /// task execution's <code>TRANSFERRING</code> phase when something is read from
  /// the source and sent over the network.
  ///
  /// If DataSync fails to transfer something, this value can be less than
  /// <code>EstimatedFilesToTransfer</code>. In some cases, this value can also be
  /// greater than <code>EstimatedFilesToTransfer</code>. This element is
  /// implementation-specific for some location types, so don't use it as an exact
  /// indication of what transferred or to monitor your task execution.
  final int? filesTransferred;

  /// The number of files, objects, and directories that DataSync verified during
  /// your transfer.
  /// <note>
  /// When you configure your task to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-data-verification-options.html">verify
  /// only the data that's transferred</a>, DataSync doesn't verify directories in
  /// some situations or files that fail to transfer.
  /// </note>
  final int? filesVerified;

  /// A list of filter rules that include specific data during your transfer. For
  /// more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  final List<FilterRule>? includes;

  /// The configuration of the manifest that lists the files or objects to
  /// transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
  /// what DataSync transfers by using a manifest</a>.
  final ManifestConfig? manifestConfig;
  final Options? options;

  /// Indicates whether DataSync generated a complete <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
  /// report</a> for your transfer.
  final ReportResult? reportResult;

  /// The result of the task execution.
  final TaskExecutionResultDetail? result;

  /// The time when the task execution started.
  final DateTime? startTime;

  /// The status of the task execution.
  final TaskExecutionStatus? status;

  /// The ARN of the task execution that you wanted information about.
  /// <code>TaskExecutionArn</code> is hierarchical and includes
  /// <code>TaskArn</code> for the task that was executed.
  ///
  /// For example, a <code>TaskExecution</code> value with the ARN
  /// <code>arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2/execution/exec-08ef1e88ec491019b</code>
  /// executed the task with the ARN
  /// <code>arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2</code>.
  final String? taskExecutionArn;

  /// The configuration of your task report, which provides detailed information
  /// about for your DataSync transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">Creating
  /// a task report</a>.
  final TaskReportConfig? taskReportConfig;

  DescribeTaskExecutionResponse({
    this.bytesCompressed,
    this.bytesTransferred,
    this.bytesWritten,
    this.estimatedBytesToTransfer,
    this.estimatedFilesToDelete,
    this.estimatedFilesToTransfer,
    this.excludes,
    this.filesDeleted,
    this.filesSkipped,
    this.filesTransferred,
    this.filesVerified,
    this.includes,
    this.manifestConfig,
    this.options,
    this.reportResult,
    this.result,
    this.startTime,
    this.status,
    this.taskExecutionArn,
    this.taskReportConfig,
  });

  factory DescribeTaskExecutionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTaskExecutionResponse(
      bytesCompressed: json['BytesCompressed'] as int?,
      bytesTransferred: json['BytesTransferred'] as int?,
      bytesWritten: json['BytesWritten'] as int?,
      estimatedBytesToTransfer: json['EstimatedBytesToTransfer'] as int?,
      estimatedFilesToDelete: json['EstimatedFilesToDelete'] as int?,
      estimatedFilesToTransfer: json['EstimatedFilesToTransfer'] as int?,
      excludes: (json['Excludes'] as List?)
          ?.whereNotNull()
          .map((e) => FilterRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      filesDeleted: json['FilesDeleted'] as int?,
      filesSkipped: json['FilesSkipped'] as int?,
      filesTransferred: json['FilesTransferred'] as int?,
      filesVerified: json['FilesVerified'] as int?,
      includes: (json['Includes'] as List?)
          ?.whereNotNull()
          .map((e) => FilterRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      manifestConfig: json['ManifestConfig'] != null
          ? ManifestConfig.fromJson(
              json['ManifestConfig'] as Map<String, dynamic>)
          : null,
      options: json['Options'] != null
          ? Options.fromJson(json['Options'] as Map<String, dynamic>)
          : null,
      reportResult: json['ReportResult'] != null
          ? ReportResult.fromJson(json['ReportResult'] as Map<String, dynamic>)
          : null,
      result: json['Result'] != null
          ? TaskExecutionResultDetail.fromJson(
              json['Result'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toTaskExecutionStatus(),
      taskExecutionArn: json['TaskExecutionArn'] as String?,
      taskReportConfig: json['TaskReportConfig'] != null
          ? TaskReportConfig.fromJson(
              json['TaskReportConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesCompressed = this.bytesCompressed;
    final bytesTransferred = this.bytesTransferred;
    final bytesWritten = this.bytesWritten;
    final estimatedBytesToTransfer = this.estimatedBytesToTransfer;
    final estimatedFilesToDelete = this.estimatedFilesToDelete;
    final estimatedFilesToTransfer = this.estimatedFilesToTransfer;
    final excludes = this.excludes;
    final filesDeleted = this.filesDeleted;
    final filesSkipped = this.filesSkipped;
    final filesTransferred = this.filesTransferred;
    final filesVerified = this.filesVerified;
    final includes = this.includes;
    final manifestConfig = this.manifestConfig;
    final options = this.options;
    final reportResult = this.reportResult;
    final result = this.result;
    final startTime = this.startTime;
    final status = this.status;
    final taskExecutionArn = this.taskExecutionArn;
    final taskReportConfig = this.taskReportConfig;
    return {
      if (bytesCompressed != null) 'BytesCompressed': bytesCompressed,
      if (bytesTransferred != null) 'BytesTransferred': bytesTransferred,
      if (bytesWritten != null) 'BytesWritten': bytesWritten,
      if (estimatedBytesToTransfer != null)
        'EstimatedBytesToTransfer': estimatedBytesToTransfer,
      if (estimatedFilesToDelete != null)
        'EstimatedFilesToDelete': estimatedFilesToDelete,
      if (estimatedFilesToTransfer != null)
        'EstimatedFilesToTransfer': estimatedFilesToTransfer,
      if (excludes != null) 'Excludes': excludes,
      if (filesDeleted != null) 'FilesDeleted': filesDeleted,
      if (filesSkipped != null) 'FilesSkipped': filesSkipped,
      if (filesTransferred != null) 'FilesTransferred': filesTransferred,
      if (filesVerified != null) 'FilesVerified': filesVerified,
      if (includes != null) 'Includes': includes,
      if (manifestConfig != null) 'ManifestConfig': manifestConfig,
      if (options != null) 'Options': options,
      if (reportResult != null) 'ReportResult': reportResult,
      if (result != null) 'Result': result,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (taskExecutionArn != null) 'TaskExecutionArn': taskExecutionArn,
      if (taskReportConfig != null) 'TaskReportConfig': taskReportConfig,
    };
  }
}

/// DescribeTaskResponse
class DescribeTaskResponse {
  /// The Amazon Resource Name (ARN) of an Amazon CloudWatch log group for
  /// monitoring your task.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/monitor-datasync.html">Monitoring
  /// DataSync with Amazon CloudWatch</a>.
  final String? cloudWatchLogGroupArn;

  /// The time that the task was created.
  final DateTime? creationTime;

  /// The ARN of the most recent task execution.
  final String? currentTaskExecutionArn;

  /// The ARN of your transfer's destination location.
  final String? destinationLocationArn;

  /// The ARNs of the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces">network
  /// interfaces</a> that DataSync created for your destination location.
  final List<String>? destinationNetworkInterfaceArns;

  /// If there's an issue with your task, you can use the error code to help you
  /// troubleshoot the problem. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html">Troubleshooting
  /// issues with DataSync transfers</a>.
  final String? errorCode;

  /// If there's an issue with your task, you can use the error details to help
  /// you troubleshoot the problem. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html">Troubleshooting
  /// issues with DataSync transfers</a>.
  final String? errorDetail;

  /// The exclude filters that define the files, objects, and folders in your
  /// source location that you don't want DataSync to transfer. For more
  /// information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Specifying
  /// what DataSync transfers by using filters</a>.
  final List<FilterRule>? excludes;

  /// The include filters that define the files, objects, and folders in your
  /// source location that you want DataSync to transfer. For more information and
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Specifying
  /// what DataSync transfers by using filters</a>.
  final List<FilterRule>? includes;

  /// The configuration of the manifest that lists the files or objects that you
  /// want DataSync to transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
  /// what DataSync transfers by using a manifest</a>.
  final ManifestConfig? manifestConfig;

  /// The name of your task.
  final String? name;

  /// The task's settings. For example, what file metadata gets preserved, how
  /// data integrity gets verified at the end of your transfer, bandwidth limits,
  /// among other options.
  final Options? options;

  /// The schedule for when you want your task to run. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">Scheduling
  /// your task</a>.
  final TaskSchedule? schedule;

  /// The details about your <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">task
  /// schedule</a>.
  final TaskScheduleDetails? scheduleDetails;

  /// The ARN of your transfer's source location.
  final String? sourceLocationArn;

  /// The ARNs of the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/datasync-network.html#required-network-interfaces">network
  /// interfaces</a> that DataSync created for your source location.
  final List<String>? sourceNetworkInterfaceArns;

  /// The status of your task. For information about what each status means, see
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/understand-task-statuses.html#understand-task-creation-statuses">Task
  /// statuses</a>.
  final TaskStatus? status;

  /// The ARN of your task.
  final String? taskArn;

  /// The configuration of your task report, which provides detailed information
  /// about your DataSync transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">Monitoring
  /// your DataSync transfers with task reports</a>.
  final TaskReportConfig? taskReportConfig;

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
    this.manifestConfig,
    this.name,
    this.options,
    this.schedule,
    this.scheduleDetails,
    this.sourceLocationArn,
    this.sourceNetworkInterfaceArns,
    this.status,
    this.taskArn,
    this.taskReportConfig,
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
      manifestConfig: json['ManifestConfig'] != null
          ? ManifestConfig.fromJson(
              json['ManifestConfig'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      options: json['Options'] != null
          ? Options.fromJson(json['Options'] as Map<String, dynamic>)
          : null,
      schedule: json['Schedule'] != null
          ? TaskSchedule.fromJson(json['Schedule'] as Map<String, dynamic>)
          : null,
      scheduleDetails: json['ScheduleDetails'] != null
          ? TaskScheduleDetails.fromJson(
              json['ScheduleDetails'] as Map<String, dynamic>)
          : null,
      sourceLocationArn: json['SourceLocationArn'] as String?,
      sourceNetworkInterfaceArns: (json['SourceNetworkInterfaceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.toTaskStatus(),
      taskArn: json['TaskArn'] as String?,
      taskReportConfig: json['TaskReportConfig'] != null
          ? TaskReportConfig.fromJson(
              json['TaskReportConfig'] as Map<String, dynamic>)
          : null,
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
    final manifestConfig = this.manifestConfig;
    final name = this.name;
    final options = this.options;
    final schedule = this.schedule;
    final scheduleDetails = this.scheduleDetails;
    final sourceLocationArn = this.sourceLocationArn;
    final sourceNetworkInterfaceArns = this.sourceNetworkInterfaceArns;
    final status = this.status;
    final taskArn = this.taskArn;
    final taskReportConfig = this.taskReportConfig;
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
      if (manifestConfig != null) 'ManifestConfig': manifestConfig,
      if (name != null) 'Name': name,
      if (options != null) 'Options': options,
      if (schedule != null) 'Schedule': schedule,
      if (scheduleDetails != null) 'ScheduleDetails': scheduleDetails,
      if (sourceLocationArn != null) 'SourceLocationArn': sourceLocationArn,
      if (sourceNetworkInterfaceArns != null)
        'SourceNetworkInterfaceArns': sourceNetworkInterfaceArns,
      if (status != null) 'Status': status.toValue(),
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskReportConfig != null) 'TaskReportConfig': taskReportConfig,
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

  /// Specifies a user that can mount and access the files, folders, and metadata
  /// in your SVM.
  ///
  /// For information about choosing a user with the right level of access for
  /// your transfer, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-smb">Using
  /// the SMB protocol</a>.
  final String user;

  /// Specifies the fully qualified domain name (FQDN) of the Microsoft Active
  /// Directory that your storage virtual machine (SVM) belongs to.
  ///
  /// If you have multiple domains in your environment, configuring this setting
  /// makes sure that DataSync connects to the right SVM.
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
  /// The opaque string that indicates the position to begin the next list of
  /// results in the response.
  final String? nextToken;

  /// A list of the task's executions.
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

enum ManifestAction {
  transfer,
}

extension ManifestActionValueExtension on ManifestAction {
  String toValue() {
    switch (this) {
      case ManifestAction.transfer:
        return 'TRANSFER';
    }
  }
}

extension ManifestActionFromString on String {
  ManifestAction toManifestAction() {
    switch (this) {
      case 'TRANSFER':
        return ManifestAction.transfer;
    }
    throw Exception('$this is not known in enum ManifestAction');
  }
}

/// Configures a manifest, which is a list of files or objects that you want
/// DataSync to transfer. For more information and configuration examples, see
/// <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
/// what DataSync transfers by using a manifest</a>.
class ManifestConfig {
  /// Specifies what DataSync uses the manifest for.
  final ManifestAction? action;

  /// Specifies the file format of your manifest. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html#transferring-with-manifest-create">Creating
  /// a manifest</a>.
  final ManifestFormat? format;

  /// Specifies the manifest that you want DataSync to use and where it's hosted.
  /// <note>
  /// You must specify this parameter if you're configuring a new manifest on or
  /// after February 7, 2024.
  ///
  /// If you don't, you'll get a 400 status code and
  /// <code>ValidationException</code> error stating that you're missing the IAM
  /// role for DataSync to access the S3 bucket where you're hosting your
  /// manifest. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html#transferring-with-manifest-access">Providing
  /// DataSync access to your manifest</a>.
  /// </note>
  final SourceManifestConfig? source;

  ManifestConfig({
    this.action,
    this.format,
    this.source,
  });

  factory ManifestConfig.fromJson(Map<String, dynamic> json) {
    return ManifestConfig(
      action: (json['Action'] as String?)?.toManifestAction(),
      format: (json['Format'] as String?)?.toManifestFormat(),
      source: json['Source'] != null
          ? SourceManifestConfig.fromJson(
              json['Source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final format = this.format;
    final source = this.source;
    return {
      if (action != null) 'Action': action.toValue(),
      if (format != null) 'Format': format.toValue(),
      if (source != null) 'Source': source,
    };
  }
}

enum ManifestFormat {
  csv,
}

extension ManifestFormatValueExtension on ManifestFormat {
  String toValue() {
    switch (this) {
      case ManifestFormat.csv:
        return 'CSV';
    }
  }
}

extension ManifestFormatFromString on String {
  ManifestFormat toManifestFormat() {
    switch (this) {
      case 'CSV':
        return ManifestFormat.csv;
    }
    throw Exception('$this is not known in enum ManifestFormat');
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

  /// The amount of space in the cluster that's in cloud storage (for example, if
  /// you're using data tiering).
  final int? clusterCloudStorageUsed;

  /// The name of the cluster.
  final String? clusterName;

  /// The number of LUNs (logical unit numbers) in the cluster.
  final int? lunCount;

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
    this.clusterCloudStorageUsed,
    this.clusterName,
    this.lunCount,
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
      clusterCloudStorageUsed: json['ClusterCloudStorageUsed'] as int?,
      clusterName: json['ClusterName'] as String?,
      lunCount: json['LunCount'] as int?,
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
    final clusterCloudStorageUsed = this.clusterCloudStorageUsed;
    final clusterName = this.clusterName;
    final lunCount = this.lunCount;
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
      if (clusterCloudStorageUsed != null)
        'ClusterCloudStorageUsed': clusterCloudStorageUsed,
      if (clusterName != null) 'ClusterName': clusterName,
      if (lunCount != null) 'LunCount': lunCount,
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

  /// The number of LUNs (logical unit numbers) in the SVM.
  final int? lunCount;

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
    this.lunCount,
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
      lunCount: json['LunCount'] as int?,
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
    final lunCount = this.lunCount;
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
      if (lunCount != null) 'LunCount': lunCount,
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

  /// The number of LUNs (logical unit numbers) in the volume.
  final int? lunCount;

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
    this.lunCount,
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
      lunCount: json['LunCount'] as int?,
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
    final lunCount = this.lunCount;
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
      if (lunCount != null) 'LunCount': lunCount,
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

enum ObjectVersionIds {
  include,
  none,
}

extension ObjectVersionIdsValueExtension on ObjectVersionIds {
  String toValue() {
    switch (this) {
      case ObjectVersionIds.include:
        return 'INCLUDE';
      case ObjectVersionIds.none:
        return 'NONE';
    }
  }
}

extension ObjectVersionIdsFromString on String {
  ObjectVersionIds toObjectVersionIds() {
    switch (this) {
      case 'INCLUDE':
        return ObjectVersionIds.include;
      case 'NONE':
        return ObjectVersionIds.none;
    }
    throw Exception('$this is not known in enum ObjectVersionIds');
  }
}

/// The DataSync agents that are connecting to a Network File System (NFS)
/// location.
class OnPremConfig {
  /// The Amazon Resource Names (ARNs) of the agents connecting to a transfer
  /// location.
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

/// Indicates how your transfer task is configured. These options include how
/// DataSync handles files, objects, and their associated metadata during your
/// transfer. You also can specify how to verify data integrity, set bandwidth
/// limits for your task, among other options.
///
/// Each option has a default value. Unless you need to, you don't have to
/// configure any option before calling <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_StartTaskExecution.html">StartTaskExecution</a>.
///
/// You also can override your task options for each task execution. For
/// example, you might want to adjust the <code>LogLevel</code> for an
/// individual execution.
class Options {
  /// Specifies whether to preserve metadata indicating the last time a file was
  /// read or written to.
  /// <note>
  /// The behavior of <code>Atime</code> isn't fully standard across platforms, so
  /// DataSync can only do this on a best-effort basis.
  /// </note>
  /// <ul>
  /// <li>
  /// <code>BEST_EFFORT</code> (default) - DataSync attempts to preserve the
  /// original <code>Atime</code> attribute on all source files (that is, the
  /// version before the <code>PREPARING</code> phase of the task execution). This
  /// option is recommended.
  /// </li>
  /// <li>
  /// <code>NONE</code> - Ignores <code>Atime</code>.
  /// </li>
  /// </ul> <note>
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
  /// <ul>
  /// <li>
  /// <code>INT_VALUE</code> (default) - Preserves the integer value of user ID
  /// (UID) and GID, which is recommended.
  /// </li>
  /// <li>
  /// <code>NONE</code> - Ignores UID and GID.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied">Metadata
  /// copied by DataSync</a>.
  final Gid? gid;

  /// Specifies the type of logs that DataSync publishes to a Amazon CloudWatch
  /// Logs log group. To specify the log group, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateTask.html#DataSync-CreateTask-request-CloudWatchLogGroupArn">CloudWatchLogGroupArn</a>.
  ///
  /// <ul>
  /// <li>
  /// <code>BASIC</code> - Publishes logs with only basic information (such as
  /// transfer errors).
  /// </li>
  /// <li>
  /// <code>TRANSFER</code> - Publishes logs for all files or objects that your
  /// DataSync task transfers and performs data-integrity checks on.
  /// </li>
  /// <li>
  /// <code>OFF</code> - No logs are published.
  /// </li>
  /// </ul>
  final LogLevel? logLevel;

  /// Specifies whether to preserve metadata indicating the last time that a file
  /// was written to before the <code>PREPARING</code> phase of your task
  /// execution. This option is required when you need to run the a task more than
  /// once.
  ///
  /// <ul>
  /// <li>
  /// <code>PRESERVE</code> (default) - Preserves original <code>Mtime</code>,
  /// which is recommended.
  /// </li>
  /// <li>
  /// <code>NONE</code> - Ignores <code>Mtime</code>.
  /// </li>
  /// </ul> <note>
  /// If <code>Mtime</code> is set to <code>PRESERVE</code>, <code>Atime</code>
  /// must be set to <code>BEST_EFFORT</code>.
  ///
  /// If <code>Mtime</code> is set to <code>NONE</code>, <code>Atime</code> must
  /// also be set to <code>NONE</code>.
  /// </note>
  final Mtime? mtime;

  /// Specifies whether you want DataSync to <code>PRESERVE</code> object tags
  /// (default behavior) when transferring between object storage systems. If you
  /// want your DataSync task to ignore object tags, specify the <code>NONE</code>
  /// value.
  final ObjectTags? objectTags;

  /// Specifies whether DataSync should modify or preserve data at the destination
  /// location.
  ///
  /// <ul>
  /// <li>
  /// <code>ALWAYS</code> (default) - DataSync modifies data in the destination
  /// location when source data (including metadata) has changed.
  ///
  /// If DataSync overwrites objects, you might incur additional charges for
  /// certain Amazon S3 storage classes (for example, for retrieval or early
  /// deletion). For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Storage
  /// class considerations with Amazon S3 transfers</a>.
  /// </li>
  /// <li>
  /// <code>NEVER</code> - DataSync doesn't overwrite data in the destination
  /// location even if the source data has changed. You can use this option to
  /// protect against overwriting changes made to files or objects in the
  /// destination.
  /// </li>
  /// </ul>
  final OverwriteMode? overwriteMode;

  /// Specifies which users or groups can access a file for a specific purpose
  /// such as reading, writing, or execution of the file.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied">Metadata
  /// copied by DataSync</a>.
  ///
  /// <ul>
  /// <li>
  /// <code>PRESERVE</code> (default) - Preserves POSIX-style permissions, which
  /// is recommended.
  /// </li>
  /// <li>
  /// <code>NONE</code> - Ignores POSIX-style permissions.
  /// </li>
  /// </ul> <note>
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
  /// <ul>
  /// <li>
  /// <code>PRESERVE</code> (default) - Ignores such destination files, which is
  /// recommended.
  /// </li>
  /// <li>
  /// <code>REMOVE</code> - Deletes destination files that aren’t present in the
  /// source.
  /// </li>
  /// </ul> <note>
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
  /// <ul>
  /// <li>
  /// <code>NONE</code> (default) - Ignores special devices (recommended).
  /// </li>
  /// <li>
  /// <code>PRESERVE</code> - Preserves character and block device metadata. This
  /// option currently isn't supported for Amazon EFS.
  /// </li>
  /// </ul>
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
  /// <ul>
  /// <li>
  /// <code>OWNER_DACL</code> (default) - For each copied object, DataSync copies
  /// the following metadata:
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
  /// </ul> </li>
  /// <li>
  /// <code>OWNER_DACL_SACL</code> - For each copied object, DataSync copies the
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
  /// choosing a user with the right permissions, see required permissions for <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">SMB</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html#create-fsx-windows-location-permissions">FSx
  /// for Windows File Server</a>, or <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-smb">FSx
  /// for ONTAP</a> (depending on the type of location in your transfer).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NONE</code> - None of the SMB security descriptor components are
  /// copied. Destination objects are owned by the user that was provided for
  /// accessing the destination location. DACLs and SACLs are set based on the
  /// destination server’s configuration.
  /// </li>
  /// </ul>
  final SmbSecurityDescriptorCopyFlags? securityDescriptorCopyFlags;

  /// Specifies whether your transfer tasks should be put into a queue during
  /// certain scenarios when <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#running-multiple-tasks">running
  /// multiple tasks</a>. This is <code>ENABLED</code> by default.
  final TaskQueueing? taskQueueing;

  /// Determines whether DataSync transfers only the data and metadata that differ
  /// between the source and the destination location or transfers all the content
  /// from the source (without comparing what's in the destination).
  ///
  /// <ul>
  /// <li>
  /// <code>CHANGED</code> (default) - DataSync copies only data or metadata that
  /// is new or different content from the source location to the destination
  /// location.
  /// </li>
  /// <li>
  /// <code>ALL</code> - DataSync copies everything in the source to the
  /// destination without comparing differences between the locations.
  /// </li>
  /// </ul>
  final TransferMode? transferMode;

  /// Specifies the POSIX user ID (UID) of the file's owner.
  ///
  /// <ul>
  /// <li>
  /// <code>INT_VALUE</code> (default) - Preserves the integer value of UID and
  /// group ID (GID), which is recommended.
  /// </li>
  /// <li>
  /// <code>NONE</code> - Ignores UID and GID.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/special-files.html#metadata-copied">Metadata
  /// copied by DataSync</a>.
  final Uid? uid;

  /// Specifies how and when DataSync checks the integrity of your data during a
  /// transfer.
  ///
  /// <ul>
  /// <li>
  /// <code>ONLY_FILES_TRANSFERRED</code> (recommended) - DataSync calculates the
  /// checksum of transferred files and metadata at the source location. At the
  /// end of the transfer, DataSync then compares this checksum to the checksum
  /// calculated on those files at the destination.
  ///
  /// We recommend this option when transferring to S3 Glacier Flexible Retrieval
  /// or S3 Glacier Deep Archive storage classes. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Storage
  /// class considerations with Amazon S3 locations</a>.
  /// </li>
  /// <li>
  /// <code>POINT_IN_TIME_CONSISTENT</code> (default) - At the end of the
  /// transfer, DataSync scans the entire source and destination to verify that
  /// both locations are fully synchronized.
  ///
  /// If you use a <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">manifest</a>,
  /// DataSync only scans and verifies what's listed in the manifest.
  ///
  /// You can't use this option when transferring to S3 Glacier Flexible Retrieval
  /// or S3 Glacier Deep Archive storage classes. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Storage
  /// class considerations with Amazon S3 locations</a>.
  /// </li>
  /// <li>
  /// <code>NONE</code> - DataSync doesn't run additional verification at the end
  /// of the transfer. All data transmissions are still integrity-checked with
  /// checksum verification during the transfer.
  /// </li>
  /// </ul>
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

/// The platform-related details about the DataSync agent, such as the version
/// number.
class Platform {
  /// The version of the DataSync agent.
  final String? version;

  Platform({
    this.version,
  });

  factory Platform.fromJson(Map<String, dynamic> json) {
    return Platform(
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      if (version != null) 'Version': version,
    };
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

/// Specifies how your DataSync agent connects to Amazon Web Services using a <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html#choose-service-endpoint-vpc">virtual
/// private cloud (VPC) service endpoint</a>. An agent that uses a VPC endpoint
/// isn't accessible over the public internet.
class PrivateLinkConfig {
  /// Specifies the VPC endpoint provided by <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html">Amazon
  /// Web Services PrivateLink</a> that your agent connects to.
  final String? privateLinkEndpoint;

  /// Specifies the Amazon Resource Names (ARN) of the security group that
  /// provides DataSync access to your VPC endpoint. You can only specify one ARN.
  final List<String>? securityGroupArns;

  /// Specifies the ARN of the subnet where your VPC endpoint is located. You can
  /// only specify one ARN.
  final List<String>? subnetArns;

  /// Specifies the ID of the VPC endpoint that your agent connects to.
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

/// Specifies where DataSync uploads your <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a>.
class ReportDestination {
  /// Specifies the Amazon S3 bucket where DataSync uploads your task report.
  final ReportDestinationS3? s3;

  ReportDestination({
    this.s3,
  });

  factory ReportDestination.fromJson(Map<String, dynamic> json) {
    return ReportDestination(
      s3: json['S3'] != null
          ? ReportDestinationS3.fromJson(json['S3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 'S3': s3,
    };
  }
}

/// Specifies the Amazon S3 bucket where DataSync uploads your <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a>.
class ReportDestinationS3 {
  /// Specifies the Amazon Resource Name (ARN) of the IAM policy that allows
  /// DataSync to upload a task report to your S3 bucket. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">Allowing
  /// DataSync to upload a task report to an Amazon S3 bucket</a>.
  final String bucketAccessRoleArn;

  /// Specifies the ARN of the S3 bucket where DataSync uploads your report.
  final String s3BucketArn;

  /// Specifies a bucket prefix for your report.
  final String? subdirectory;

  ReportDestinationS3({
    required this.bucketAccessRoleArn,
    required this.s3BucketArn,
    this.subdirectory,
  });

  factory ReportDestinationS3.fromJson(Map<String, dynamic> json) {
    return ReportDestinationS3(
      bucketAccessRoleArn: json['BucketAccessRoleArn'] as String,
      s3BucketArn: json['S3BucketArn'] as String,
      subdirectory: json['Subdirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketAccessRoleArn = this.bucketAccessRoleArn;
    final s3BucketArn = this.s3BucketArn;
    final subdirectory = this.subdirectory;
    return {
      'BucketAccessRoleArn': bucketAccessRoleArn,
      'S3BucketArn': s3BucketArn,
      if (subdirectory != null) 'Subdirectory': subdirectory,
    };
  }
}

enum ReportLevel {
  errorsOnly,
  successesAndErrors,
}

extension ReportLevelValueExtension on ReportLevel {
  String toValue() {
    switch (this) {
      case ReportLevel.errorsOnly:
        return 'ERRORS_ONLY';
      case ReportLevel.successesAndErrors:
        return 'SUCCESSES_AND_ERRORS';
    }
  }
}

extension ReportLevelFromString on String {
  ReportLevel toReportLevel() {
    switch (this) {
      case 'ERRORS_ONLY':
        return ReportLevel.errorsOnly;
      case 'SUCCESSES_AND_ERRORS':
        return ReportLevel.successesAndErrors;
    }
    throw Exception('$this is not known in enum ReportLevel');
  }
}

enum ReportOutputType {
  summaryOnly,
  standard,
}

extension ReportOutputTypeValueExtension on ReportOutputType {
  String toValue() {
    switch (this) {
      case ReportOutputType.summaryOnly:
        return 'SUMMARY_ONLY';
      case ReportOutputType.standard:
        return 'STANDARD';
    }
  }
}

extension ReportOutputTypeFromString on String {
  ReportOutputType toReportOutputType() {
    switch (this) {
      case 'SUMMARY_ONLY':
        return ReportOutputType.summaryOnly;
      case 'STANDARD':
        return ReportOutputType.standard;
    }
    throw Exception('$this is not known in enum ReportOutputType');
  }
}

/// Specifies the level of detail for a particular aspect of your DataSync <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a>.
class ReportOverride {
  /// Specifies whether your task report includes errors only or successes and
  /// errors.
  ///
  /// For example, your report might mostly include only what didn't go well in
  /// your transfer (<code>ERRORS_ONLY</code>). At the same time, you want to
  /// verify that your <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">task
  /// filter</a> is working correctly. In this situation, you can get a list of
  /// what files DataSync successfully skipped and if something transferred that
  /// you didn't to transfer (<code>SUCCESSES_AND_ERRORS</code>).
  final ReportLevel? reportLevel;

  ReportOverride({
    this.reportLevel,
  });

  factory ReportOverride.fromJson(Map<String, dynamic> json) {
    return ReportOverride(
      reportLevel: (json['ReportLevel'] as String?)?.toReportLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final reportLevel = this.reportLevel;
    return {
      if (reportLevel != null) 'ReportLevel': reportLevel.toValue(),
    };
  }
}

/// The level of detail included in each aspect of your DataSync <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a>.
class ReportOverrides {
  /// Specifies the level of reporting for the files, objects, and directories
  /// that DataSync attempted to delete in your destination location. This only
  /// applies if you <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html">configure
  /// your task</a> to delete data in the destination that isn't in the source.
  final ReportOverride? deleted;

  /// Specifies the level of reporting for the files, objects, and directories
  /// that DataSync attempted to skip during your transfer.
  final ReportOverride? skipped;

  /// Specifies the level of reporting for the files, objects, and directories
  /// that DataSync attempted to transfer.
  final ReportOverride? transferred;

  /// Specifies the level of reporting for the files, objects, and directories
  /// that DataSync attempted to verify at the end of your transfer.
  final ReportOverride? verified;

  ReportOverrides({
    this.deleted,
    this.skipped,
    this.transferred,
    this.verified,
  });

  factory ReportOverrides.fromJson(Map<String, dynamic> json) {
    return ReportOverrides(
      deleted: json['Deleted'] != null
          ? ReportOverride.fromJson(json['Deleted'] as Map<String, dynamic>)
          : null,
      skipped: json['Skipped'] != null
          ? ReportOverride.fromJson(json['Skipped'] as Map<String, dynamic>)
          : null,
      transferred: json['Transferred'] != null
          ? ReportOverride.fromJson(json['Transferred'] as Map<String, dynamic>)
          : null,
      verified: json['Verified'] != null
          ? ReportOverride.fromJson(json['Verified'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deleted = this.deleted;
    final skipped = this.skipped;
    final transferred = this.transferred;
    final verified = this.verified;
    return {
      if (deleted != null) 'Deleted': deleted,
      if (skipped != null) 'Skipped': skipped,
      if (transferred != null) 'Transferred': transferred,
      if (verified != null) 'Verified': verified,
    };
  }
}

/// Indicates whether DataSync created a complete <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a> for your transfer.
class ReportResult {
  /// Indicates the code associated with the error if DataSync can't create a
  /// complete report.
  final String? errorCode;

  /// Provides details about issues creating a report.
  final String? errorDetail;

  /// Indicates whether DataSync is still working on your report, created a
  /// report, or can't create a complete report.
  final PhaseStatus? status;

  ReportResult({
    this.errorCode,
    this.errorDetail,
    this.status,
  });

  factory ReportResult.fromJson(Map<String, dynamic> json) {
    return ReportResult(
      errorCode: json['ErrorCode'] as String?,
      errorDetail: json['ErrorDetail'] as String?,
      status: (json['Status'] as String?)?.toPhaseStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorDetail = this.errorDetail;
    final status = this.status;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorDetail != null) 'ErrorDetail': errorDetail,
      if (status != null) 'Status': status.toValue(),
    };
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

/// Specifies the Amazon Resource Name (ARN) of the Identity and Access
/// Management (IAM) role that DataSync uses to access your S3 bucket.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-access">Accessing
/// S3 buckets</a>.
class S3Config {
  /// Specifies the ARN of the IAM role that DataSync uses to access your S3
  /// bucket.
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

/// Specifies the S3 bucket where you're hosting the manifest that you want
/// DataSync to use. For more information and configuration examples, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
/// what DataSync transfers by using a manifest</a>.
class S3ManifestConfig {
  /// Specifies the Identity and Access Management (IAM) role that allows DataSync
  /// to access your manifest. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html#transferring-with-manifest-access">Providing
  /// DataSync access to your manifest</a>.
  final String bucketAccessRoleArn;

  /// Specifies the Amazon S3 object key of your manifest. This can include a
  /// prefix (for example, <code>prefix/my-manifest.csv</code>).
  final String manifestObjectPath;

  /// Specifies the Amazon Resource Name (ARN) of the S3 bucket where you're
  /// hosting your manifest.
  final String s3BucketArn;

  /// Specifies the object version ID of the manifest that you want DataSync to
  /// use. If you don't set this, DataSync uses the latest version of the object.
  final String? manifestObjectVersionId;

  S3ManifestConfig({
    required this.bucketAccessRoleArn,
    required this.manifestObjectPath,
    required this.s3BucketArn,
    this.manifestObjectVersionId,
  });

  factory S3ManifestConfig.fromJson(Map<String, dynamic> json) {
    return S3ManifestConfig(
      bucketAccessRoleArn: json['BucketAccessRoleArn'] as String,
      manifestObjectPath: json['ManifestObjectPath'] as String,
      s3BucketArn: json['S3BucketArn'] as String,
      manifestObjectVersionId: json['ManifestObjectVersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketAccessRoleArn = this.bucketAccessRoleArn;
    final manifestObjectPath = this.manifestObjectPath;
    final s3BucketArn = this.s3BucketArn;
    final manifestObjectVersionId = this.manifestObjectVersionId;
    return {
      'BucketAccessRoleArn': bucketAccessRoleArn,
      'ManifestObjectPath': manifestObjectPath,
      'S3BucketArn': s3BucketArn,
      if (manifestObjectVersionId != null)
        'ManifestObjectVersionId': manifestObjectVersionId,
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

enum ScheduleDisabledBy {
  user,
  service,
}

extension ScheduleDisabledByValueExtension on ScheduleDisabledBy {
  String toValue() {
    switch (this) {
      case ScheduleDisabledBy.user:
        return 'USER';
      case ScheduleDisabledBy.service:
        return 'SERVICE';
    }
  }
}

extension ScheduleDisabledByFromString on String {
  ScheduleDisabledBy toScheduleDisabledBy() {
    switch (this) {
      case 'USER':
        return ScheduleDisabledBy.user;
      case 'SERVICE':
        return ScheduleDisabledBy.service;
    }
    throw Exception('$this is not known in enum ScheduleDisabledBy');
  }
}

enum ScheduleStatus {
  enabled,
  disabled,
}

extension ScheduleStatusValueExtension on ScheduleStatus {
  String toValue() {
    switch (this) {
      case ScheduleStatus.enabled:
        return 'ENABLED';
      case ScheduleStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ScheduleStatusFromString on String {
  ScheduleStatus toScheduleStatus() {
    switch (this) {
      case 'ENABLED':
        return ScheduleStatus.enabled;
      case 'DISABLED':
        return ScheduleStatus.disabled;
    }
    throw Exception('$this is not known in enum ScheduleStatus');
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

/// Specifies the manifest that you want DataSync to use and where it's hosted.
/// For more information and configuration examples, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
/// what DataSync transfers by using a manifest</a>.
class SourceManifestConfig {
  /// Specifies the S3 bucket where you're hosting your manifest.
  final S3ManifestConfig s3;

  SourceManifestConfig({
    required this.s3,
  });

  factory SourceManifestConfig.fromJson(Map<String, dynamic> json) {
    return SourceManifestConfig(
      s3: S3ManifestConfig.fromJson(json['S3'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      'S3': s3,
    };
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

/// Represents a single entry in a list of DataSync task executions that's
/// returned with the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListTaskExecutions.html">ListTaskExecutions</a>
/// operation.
class TaskExecutionListEntry {
  /// The status of a task execution. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/understand-task-statuses.html#understand-task-execution-statuses">Task
  /// execution statuses</a>.
  final TaskExecutionStatus? status;

  /// The Amazon Resource Name (ARN) of a task execution.
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
  cancelling,
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
      case TaskExecutionStatus.cancelling:
        return 'CANCELLING';
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
      case 'CANCELLING':
        return TaskExecutionStatus.cancelling;
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

/// Specifies how you want to configure a task report, which provides detailed
/// information about for your DataSync transfer.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">Task
/// reports</a>.
class TaskReportConfig {
  /// Specifies the Amazon S3 bucket where DataSync uploads your task report. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html#task-report-access">Task
  /// reports</a>.
  final ReportDestination? destination;

  /// Specifies whether your task report includes the new version of each object
  /// transferred into an S3 bucket. This only applies if you <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/manage-versioning-examples.html">enable
  /// versioning on your bucket</a>. Keep in mind that setting this to
  /// <code>INCLUDE</code> can increase the duration of your task execution.
  final ObjectVersionIds? objectVersionIds;

  /// Specifies the type of task report that you want:
  ///
  /// <ul>
  /// <li>
  /// <code>SUMMARY_ONLY</code>: Provides necessary details about your task,
  /// including the number of files, objects, and directories transferred and
  /// transfer duration.
  /// </li>
  /// <li>
  /// <code>STANDARD</code>: Provides complete details about your task, including
  /// a full list of files, objects, and directories that were transferred,
  /// skipped, verified, and more.
  /// </li>
  /// </ul>
  final ReportOutputType? outputType;

  /// Customizes the reporting level for aspects of your task report. For example,
  /// your report might generally only include errors, but you could specify that
  /// you want a list of successes and errors just for the files that DataSync
  /// attempted to delete in your destination location.
  final ReportOverrides? overrides;

  /// Specifies whether you want your task report to include only what went wrong
  /// with your transfer or a list of what succeeded and didn't.
  ///
  /// <ul>
  /// <li>
  /// <code>ERRORS_ONLY</code>: A report shows what DataSync was unable to
  /// transfer, skip, verify, and delete.
  /// </li>
  /// <li>
  /// <code>SUCCESSES_AND_ERRORS</code>: A report shows what DataSync was able and
  /// unable to transfer, skip, verify, and delete.
  /// </li>
  /// </ul>
  final ReportLevel? reportLevel;

  TaskReportConfig({
    this.destination,
    this.objectVersionIds,
    this.outputType,
    this.overrides,
    this.reportLevel,
  });

  factory TaskReportConfig.fromJson(Map<String, dynamic> json) {
    return TaskReportConfig(
      destination: json['Destination'] != null
          ? ReportDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      objectVersionIds:
          (json['ObjectVersionIds'] as String?)?.toObjectVersionIds(),
      outputType: (json['OutputType'] as String?)?.toReportOutputType(),
      overrides: json['Overrides'] != null
          ? ReportOverrides.fromJson(json['Overrides'] as Map<String, dynamic>)
          : null,
      reportLevel: (json['ReportLevel'] as String?)?.toReportLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final objectVersionIds = this.objectVersionIds;
    final outputType = this.outputType;
    final overrides = this.overrides;
    final reportLevel = this.reportLevel;
    return {
      if (destination != null) 'Destination': destination,
      if (objectVersionIds != null)
        'ObjectVersionIds': objectVersionIds.toValue(),
      if (outputType != null) 'OutputType': outputType.toValue(),
      if (overrides != null) 'Overrides': overrides,
      if (reportLevel != null) 'ReportLevel': reportLevel.toValue(),
    };
  }
}

/// Configures your DataSync task to run on a <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">schedule</a>
/// (at a minimum interval of 1 hour).
class TaskSchedule {
  /// Specifies your task schedule by using a cron expression in UTC time. For
  /// information about cron expression syntax, see the <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-cron-expressions.html">
  /// <i>Amazon EventBridge User Guide</i> </a>.
  final String scheduleExpression;

  /// Specifies whether to enable or disable your task schedule. Your schedule is
  /// enabled by default, but there can be situations where you need to disable
  /// it. For example, you might need to pause a recurring transfer to fix an
  /// issue with your task or perform maintenance on your storage system.
  ///
  /// DataSync might disable your schedule automatically if your task fails
  /// repeatedly with the same error. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_TaskScheduleDetails.html">TaskScheduleDetails</a>.
  final ScheduleStatus? status;

  TaskSchedule({
    required this.scheduleExpression,
    this.status,
  });

  factory TaskSchedule.fromJson(Map<String, dynamic> json) {
    return TaskSchedule(
      scheduleExpression: json['ScheduleExpression'] as String,
      status: (json['Status'] as String?)?.toScheduleStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    final status = this.status;
    return {
      'ScheduleExpression': scheduleExpression,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Provides information about your DataSync <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">task
/// schedule</a>.
class TaskScheduleDetails {
  /// Indicates how your task schedule was disabled.
  ///
  /// <ul>
  /// <li>
  /// <code>USER</code> - Your schedule was manually disabled by using the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_UpdateTask.html">UpdateTask</a>
  /// operation or DataSync console.
  /// </li>
  /// <li>
  /// <code>SERVICE</code> - Your schedule was automatically disabled by DataSync
  /// because the task failed repeatedly with the same error.
  /// </li>
  /// </ul>
  final ScheduleDisabledBy? disabledBy;

  /// Provides a reason if the task schedule is disabled.
  ///
  /// If your schedule is disabled by <code>USER</code>, you see a <code>Manually
  /// disabled by user.</code> message.
  ///
  /// If your schedule is disabled by <code>SERVICE</code>, you see an error
  /// message to help you understand why the task keeps failing. For information
  /// on resolving DataSync errors, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html">Troubleshooting
  /// issues with DataSync transfers</a>.
  final String? disabledReason;

  /// Indicates the last time the status of your task schedule changed. For
  /// example, if DataSync automatically disables your schedule because of a
  /// repeated error, you can see when the schedule was disabled.
  final DateTime? statusUpdateTime;

  TaskScheduleDetails({
    this.disabledBy,
    this.disabledReason,
    this.statusUpdateTime,
  });

  factory TaskScheduleDetails.fromJson(Map<String, dynamic> json) {
    return TaskScheduleDetails(
      disabledBy: (json['DisabledBy'] as String?)?.toScheduleDisabledBy(),
      disabledReason: json['DisabledReason'] as String?,
      statusUpdateTime: timeStampFromJson(json['StatusUpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final disabledBy = this.disabledBy;
    final disabledReason = this.disabledReason;
    final statusUpdateTime = this.statusUpdateTime;
    return {
      if (disabledBy != null) 'DisabledBy': disabledBy.toValue(),
      if (disabledReason != null) 'DisabledReason': disabledReason,
      if (statusUpdateTime != null)
        'StatusUpdateTime': unixTimestampToJson(statusUpdateTime),
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

class UpdateLocationAzureBlobResponse {
  UpdateLocationAzureBlobResponse();

  factory UpdateLocationAzureBlobResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationAzureBlobResponse();
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
