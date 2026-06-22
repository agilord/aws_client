// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2018_11_09.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// DataSync is an online data movement service that simplifies data migration
/// and helps you quickly, easily, and securely transfer your file or object
/// data to, from, and between Amazon Web Services storage services.
class DataSync {
  final _s.JsonProtocol _protocol;
  factory DataSync({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'datasync',
    );
    return DataSync._(
      protocol: _s.JsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  DataSync._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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

  /// Activates an DataSync agent that you deploy in your storage environment.
  /// The activation process associates the agent with your Amazon Web Services
  /// account.
  ///
  /// If you haven't deployed an agent yet, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html">Do
  /// I need a DataSync agent?</a>
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [activationKey] :
  /// Specifies your DataSync agent's activation key. If you don't have an
  /// activation key, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/activate-agent.html">Activating
  /// your agent</a>.
  ///
  /// Parameter [agentName] :
  /// Specifies a name for your agent. We recommend specifying a name that you
  /// can remember.
  ///
  /// Parameter [securityGroupArns] :
  /// Specifies the Amazon Resource Name (ARN) of the security group that allows
  /// traffic between your agent and VPC service endpoint. You can only specify
  /// one ARN.
  ///
  /// Parameter [subnetArns] :
  /// Specifies the ARN of the subnet where your VPC service endpoint is
  /// located. You can only specify one ARN.
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least one tag for
  /// your agent.
  ///
  /// Parameter [vpcEndpointId] :
  /// Specifies the ID of the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html#datasync-in-vpc">VPC
  /// service endpoint</a> that you're using. For example, a VPC endpoint ID
  /// looks like <code>vpce-01234d5aff67890e1</code>.
  /// <important>
  /// The VPC service endpoint you use must include the DataSync service name
  /// (for example, <code>com.amazonaws.us-east-2.datasync</code>).
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
  /// destination. You can make transfers with or without a <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-creating-agent">DataSync
  /// agent</a> that connects to your container.
  ///
  /// Before you begin, make sure you know <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access">how
  /// DataSync accesses Azure Blob Storage</a> and works with <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers">access
  /// tiers</a> and <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#blob-types">blob
  /// types</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// Parameter [agentArns] :
  /// (Optional) Specifies the Amazon Resource Name (ARN) of the DataSync agent
  /// that can connect with your Azure Blob Storage container. If you are
  /// setting up an agentless cross-cloud transfer, you do not need to specify a
  /// value for this parameter.
  ///
  /// You can specify more than one agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/multiple-agents.html">Using
  /// multiple agents for your transfer</a>.
  /// <note>
  /// Make sure you configure this parameter correctly when you first create
  /// your storage location. You cannot add or remove agents from a storage
  /// location after you create it.
  /// </note>
  ///
  /// Parameter [blobType] :
  /// Specifies the type of blob that you want your objects or files to be when
  /// transferring them into Azure Blob Storage. Currently, DataSync only
  /// supports moving data into Azure Blob Storage as block blobs. For more
  /// information on blob types, see the <a
  /// href="https://learn.microsoft.com/en-us/rest/api/storageservices/understanding-block-blobs--append-blobs--and-page-blobs">Azure
  /// Blob Storage documentation</a>.
  ///
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, which
  /// includes the authentication token that DataSync uses to access a specific
  /// AzureBlob storage location, with a customer-managed KMS key.
  ///
  /// When you include this parameter as part of a
  /// <code>CreateLocationAzureBlob</code> request, you provide only the KMS key
  /// ARN. DataSync uses this KMS key together with the authentication token you
  /// specify for <code>SasConfiguration</code> to create a DataSync-managed
  /// secret to store the location access credentials.
  ///
  /// Make sure that DataSync has permission to access the KMS key that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key">
  /// Using a service-managed secret encrypted with a custom KMS key</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with
  /// <code>SasConfiguration</code>) or <code>CustomSecretConfig</code> (without
  /// <code>SasConfiguration</code>) to provide credentials for a
  /// <code>CreateLocationAzureBlob</code> request. Do not provide both
  /// parameters for the same request.
  /// </note>
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed Secrets Manager
  /// secret where the authentication token for an AzureBlob storage location is
  /// stored in plain text, in Secrets Manager. This configuration includes the
  /// secret ARN, and the ARN for an IAM role that provides access to the
  /// secret. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key">
  /// Using a secret that you manage</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with
  /// <code>SasConfiguration</code>) or <code>CustomSecretConfig</code> (without
  /// <code>SasConfiguration</code>) to provide credentials for a
  /// <code>CreateLocationAzureBlob</code> request. Do not provide both
  /// parameters for the same request.
  /// </note>
  ///
  /// Parameter [sasConfiguration] :
  /// Specifies the SAS configuration that allows DataSync to access your Azure
  /// Blob Storage.
  /// <note>
  /// If you provide an authentication token using
  /// <code>SasConfiguration</code>, but do not provide secret configuration
  /// details using <code>CmkSecretConfig</code> or
  /// <code>CustomSecretConfig</code>, then DataSync stores the token using your
  /// Amazon Web Services account's secrets manager secret.
  /// </note>
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
    required AzureBlobAuthenticationType authenticationType,
    required String containerUrl,
    AzureAccessTier? accessTier,
    List<String>? agentArns,
    AzureBlobType? blobType,
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
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
        'AuthenticationType': authenticationType.value,
        'ContainerUrl': containerUrl,
        if (accessTier != null) 'AccessTier': accessTier.value,
        if (agentArns != null) 'AgentArns': agentArns,
        if (blobType != null) 'BlobType': blobType.value,
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [ec2Config] :
  /// Specifies the subnet and security groups DataSync uses to connect to one
  /// of your Amazon EFS file system's <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/accessing-fs.html">mount
  /// targets</a>.
  ///
  /// Parameter [efsFilesystemArn] :
  /// Specifies the ARN for your Amazon EFS file system.
  ///
  /// Parameter [accessPointArn] :
  /// Specifies the Amazon Resource Name (ARN) of the access point that DataSync
  /// uses to mount your Amazon EFS file system.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam">Accessing
  /// restricted file systems</a>.
  ///
  /// Parameter [fileSystemAccessRoleArn] :
  /// Specifies an Identity and Access Management (IAM) role that allows
  /// DataSync to access your Amazon EFS file system.
  ///
  /// For information on creating this role, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam-role">Creating
  /// a DataSync IAM role for file system access</a>.
  ///
  /// Parameter [inTransitEncryption] :
  /// Specifies whether you want DataSync to use Transport Layer Security (TLS)
  /// 1.2 encryption when it transfers data to or from your Amazon EFS file
  /// system.
  ///
  /// If you specify an access point using <code>AccessPointArn</code> or an IAM
  /// role using <code>FileSystemAccessRoleArn</code>, you must set this
  /// parameter to <code>TLS1_2</code>.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a mount path for your Amazon EFS file system. This is where
  /// DataSync reads or writes data on your file system (depending on if this is
  /// a source or destination location).
  ///
  /// By default, DataSync uses the root directory (or <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html">access
  /// point</a> if you provide one by using <code>AccessPointArn</code>). You
  /// can also include subdirectories using forward slashes (for example,
  /// <code>/path/to/folder</code>).
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
          'InTransitEncryption': inTransitEncryption.value,
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [fsxFilesystemArn] :
  /// Specifies the Amazon Resource Name (ARN) of the FSx for Lustre file
  /// system.
  ///
  /// Parameter [securityGroupArns] :
  /// Specifies the Amazon Resource Names (ARNs) of up to five security groups
  /// that provide access to your FSx for Lustre file system.
  ///
  /// The security groups must be able to access the file system's ports. The
  /// file system must also allow access from the security groups. For
  /// information about file system access, see the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/limit-access-security-groups.html">
  /// <i>Amazon FSx for Lustre User Guide</i> </a>.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a mount path for your FSx for Lustre file system. The path can
  /// include subdirectories.
  ///
  /// When the location is used as a source, DataSync reads data from the mount
  /// path. When the location is used as a destination, DataSync writes data to
  /// the mount path. If you don't include this parameter, DataSync uses the
  /// file system's root directory (<code>/</code>).
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least a name tag
  /// for your location.
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// Specifies a path to the file share in the SVM where you want to transfer
  /// data to or from.
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [fsxFilesystemArn] :
  /// Specifies the Amazon Resource Name (ARN) for the FSx for Windows File
  /// Server file system.
  ///
  /// Parameter [securityGroupArns] :
  /// Specifies the ARNs of the Amazon EC2 security groups that provide access
  /// to your file system's preferred subnet.
  ///
  /// The security groups that you specify must be able to communicate with your
  /// file system's security groups. For information about configuring security
  /// groups for file system access, see the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/limit-access-security-groups.html">
  /// <i>Amazon FSx for Windows File Server User Guide</i> </a>.
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
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, which
  /// includes the password that DataSync uses to access a specific FSx Windows
  /// storage location, with a customer-managed KMS key.
  ///
  /// When you include this parameter as part of a
  /// <code>CreateLocationFsxWindows</code> request, you provide only the KMS
  /// key ARN. DataSync uses this KMS key together with the
  /// <code>Password</code> you specify for to create a DataSync-managed secret
  /// to store the location access credentials.
  ///
  /// Make sure that DataSync has permission to access the KMS key that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key">
  /// Using a service-managed secret encrypted with a custom KMS key</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with
  /// <code>Password</code>) or <code>CustomSecretConfig</code> (without
  /// <code>Password</code>) to provide credentials for a
  /// <code>CreateLocationFsxWindows</code> request. Do not provide both
  /// parameters for the same request.
  /// </note>
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed Secrets Manager
  /// secret where the password for an FSx for Windows File Server storage
  /// location is stored in plain text, in Secrets Manager. This configuration
  /// includes the secret ARN, and the ARN for an IAM role that provides access
  /// to the secret. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key">
  /// Using a secret that you manage</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with
  /// <code>Password</code>) or <code>CustomSecretConfig</code> (without
  /// <code>Password</code>) to provide credentials for a
  /// <code>CreateLocationFsxWindows</code> request. Do not provide both
  /// parameters for the same request.
  /// </note>
  ///
  /// Parameter [domain] :
  /// Specifies the name of the Windows domain that the FSx for Windows File
  /// Server file system belongs to.
  ///
  /// If you have multiple Active Directory domains in your environment,
  /// configuring this parameter makes sure that DataSync connects to the right
  /// file system.
  ///
  /// Parameter [password] :
  /// Specifies the password of the user with the permissions to mount and
  /// access the files, folders, and file metadata in your FSx for Windows File
  /// Server file system.
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
    required List<String> securityGroupArns,
    required String user,
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
    String? domain,
    String? password,
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
        'SecurityGroupArns': securityGroupArns,
        'User': user,
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
        if (domain != null) 'Domain': domain,
        if (password != null) 'Password': password,
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [agentArns] :
  /// The Amazon Resource Names (ARNs) of the DataSync agents that can connect
  /// to your HDFS cluster.
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
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, which
  /// includes the Kerberos keytab that DataSync uses to access a specific
  /// Hadoop Distributed File System (HDFS) storage location, with a
  /// customer-managed KMS key.
  ///
  /// When you include this parameter as part of a
  /// <code>CreateLocationHdfs</code> request, you provide only the KMS key ARN.
  /// DataSync uses this KMS key together with the <code>KerberosKeytab</code>
  /// you specify for to create a DataSync-managed secret to store the location
  /// access credentials.
  ///
  /// Make sure that DataSync has permission to access the KMS key that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key">
  /// Using a service-managed secret encrypted with a custom KMS key</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with
  /// <code>KerberosKeytab</code>) or <code>CustomSecretConfig</code> (without
  /// <code>KerberosKeytab</code>) to provide credentials for a
  /// <code>CreateLocationHdfs</code> request. Do not provide both parameters
  /// for the same request.
  /// </note>
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed Secrets Manager
  /// secret where the Kerberos keytab for the HDFS storage location is stored
  /// in binary, in Secrets Manager. This configuration includes the secret ARN,
  /// and the ARN for an IAM role that provides access to the secret. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key">
  /// Using a secret that you manage</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with
  /// <code>KerberosKeytab</code>) or <code>CustomSecretConfig</code> (without
  /// <code>KerberosKeytab</code>) to provide credentials for a
  /// <code>CreateLocationHdfs</code> request. Do not provide both parameters
  /// for the same request.
  /// </note>
  ///
  /// Parameter [kerberosKeytab] :
  /// The Kerberos key table (keytab) that contains mappings between the defined
  /// Kerberos principal and the encrypted keys. You can load the keytab from a
  /// file by providing the file's address.
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
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
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
        'AuthenticationType': authenticationType.value,
        'NameNodes': nameNodes,
        if (blockSize != null) 'BlockSize': blockSize,
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
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
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [onPremConfig] :
  /// Specifies the Amazon Resource Name (ARN) of the DataSync agent that can
  /// connect to your NFS file server.
  ///
  /// You can specify more than one agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html#multiple-agents">Using
  /// multiple DataSync agents</a>.
  ///
  /// Parameter [serverHostname] :
  /// Specifies the DNS name or IP address (IPv4 or IPv6) of the NFS file server
  /// that your DataSync agent connects to.
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
  /// You can make transfers with or without a <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html#when-agent-required">DataSync
  /// agent</a>.
  ///
  /// Before you begin, make sure that you understand the <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html#create-object-location-prerequisites">prerequisites</a>
  /// for DataSync to work with object storage systems.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [bucketName] :
  /// Specifies the name of the object storage bucket involved in the transfer.
  ///
  /// Parameter [serverHostname] :
  /// Specifies the domain name or IP address (IPv4 or IPv6) of the object
  /// storage server that your DataSync agent connects to.
  ///
  /// Parameter [accessKey] :
  /// Specifies the access key (for example, a user name) if credentials are
  /// required to authenticate with the object storage server.
  ///
  /// Parameter [agentArns] :
  /// (Optional) Specifies the Amazon Resource Names (ARNs) of the DataSync
  /// agents that can connect with your object storage system. If you are
  /// setting up an agentless cross-cloud transfer, you do not need to specify a
  /// value for this parameter.
  /// <note>
  /// Make sure you configure this parameter correctly when you first create
  /// your storage location. You cannot add or remove agents from a storage
  /// location after you create it.
  /// </note>
  ///
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, which
  /// includes the <code>SecretKey</code> that DataSync uses to access a
  /// specific object storage location, with a customer-managed KMS key.
  ///
  /// When you include this parameter as part of a
  /// <code>CreateLocationObjectStorage</code> request, you provide only the KMS
  /// key ARN. DataSync uses this KMS key together with the value you specify
  /// for the <code>SecretKey</code> parameter to create a DataSync-managed
  /// secret to store the location access credentials.
  ///
  /// Make sure that DataSync has permission to access the KMS key that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key">
  /// Using a service-managed secret encrypted with a custom KMS key</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with
  /// <code>SecretKey</code>) or <code>CustomSecretConfig</code> (without
  /// <code>SecretKey</code>) to provide credentials for a
  /// <code>CreateLocationObjectStorage</code> request. Do not provide both
  /// parameters for the same request.
  /// </note>
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed Secrets Manager
  /// secret where the secret key for a specific object storage location is
  /// stored in plain text, in Secrets Manager. This configuration includes the
  /// secret ARN, and the ARN for an IAM role that provides access to the
  /// secret. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key">
  /// Using a secret that you manage</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with
  /// <code>SecretKey</code>) or <code>CustomSecretConfig</code> (without
  /// <code>SecretKey</code>) to provide credentials for a
  /// <code>CreateLocationObjectStorage</code> request. Do not provide both
  /// parameters for the same request.
  /// </note>
  ///
  /// Parameter [secretKey] :
  /// Specifies the secret key (for example, a password) if credentials are
  /// required to authenticate with the object storage server.
  /// <note>
  /// If you provide a secret using <code>SecretKey</code>, but do not provide
  /// secret configuration details using <code>CmkSecretConfig</code> or
  /// <code>CustomSecretConfig</code>, then DataSync stores the token using your
  /// Amazon Web Services account's Secrets Manager secret.
  /// </note>
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
  /// ca_root_certificate.pem > object_storage_certificates.pem</code>
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
  /// communicate. If not specified, the default value is <code>HTTPS</code>.
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
    required String bucketName,
    required String serverHostname,
    String? accessKey,
    List<String>? agentArns,
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
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
        'BucketName': bucketName,
        'ServerHostname': serverHostname,
        if (accessKey != null) 'AccessKey': accessKey,
        if (agentArns != null) 'AgentArns': agentArns,
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
        if (secretKey != null) 'SecretKey': secretKey,
        if (serverCertificate != null)
          'ServerCertificate': base64Encode(serverCertificate),
        if (serverPort != null) 'ServerPort': serverPort,
        if (serverProtocol != null) 'ServerProtocol': serverProtocol.value,
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
        if (s3StorageClass != null) 'S3StorageClass': s3StorageClass.value,
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
  /// Before you begin, make sure that you understand how DataSync accesses SMB
  /// file servers. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">Providing
  /// DataSync access to SMB file servers</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [agentArns] :
  /// Specifies the DataSync agent (or agents) that can connect to your SMB file
  /// server. You specify an agent by using its Amazon Resource Name (ARN).
  ///
  /// Parameter [serverHostname] :
  /// Specifies the domain name or IP address (IPv4 or IPv6) of the SMB file
  /// server that your DataSync agent connects to.
  /// <note>
  /// If you're using Kerberos authentication, you must specify a domain name.
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
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">Providing
  /// DataSync access to SMB file servers</a>.
  ///
  /// Parameter [authenticationType] :
  /// Specifies the authentication protocol that DataSync uses to connect to
  /// your SMB file server. DataSync supports <code>NTLM</code> (default) and
  /// <code>KERBEROS</code> authentication.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">Providing
  /// DataSync access to SMB file servers</a>.
  ///
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, either
  /// a <code>Password</code> or <code>KerberosKeytab</code> (for
  /// <code>NTLM</code> (default) and <code>KERBEROS</code> authentication
  /// types, respectively) that DataSync uses to access a specific SMB storage
  /// location, with a customer-managed KMS key.
  ///
  /// When you include this parameter as part of a
  /// <code>CreateLocationSmbRequest</code> request, you provide only the KMS
  /// key ARN. DataSync uses this KMS key together with either the
  /// <code>Password</code> or <code>KerberosKeytab</code> you specify to create
  /// a DataSync-managed secret to store the location access credentials.
  ///
  /// Make sure that DataSync has permission to access the KMS key that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key">
  /// Using a service-managed secret encrypted with a custom KMS key</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with either
  /// <code>Password</code> or <code>KerberosKeytab</code>) or
  /// <code>CustomSecretConfig</code> (without any <code>Password</code> and
  /// <code>KerberosKeytab</code>) to provide credentials for a
  /// <code>CreateLocationSmbRequest</code> request. Do not provide both
  /// <code>CmkSecretConfig</code> and <code>CustomSecretConfig</code>
  /// parameters for the same request.
  /// </note>
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed Secrets Manager
  /// secret where the SMB storage location credentials is stored in Secrets
  /// Manager as plain text (for <code>Password</code>) or binary (for
  /// <code>KerberosKeytab</code>). This configuration includes the secret ARN,
  /// and the ARN for an IAM role that provides access to the secret. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key">
  /// Using a secret that you manage</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with
  /// <code>SasConfiguration</code>) or <code>CustomSecretConfig</code> (without
  /// <code>SasConfiguration</code>) to provide credentials for a
  /// <code>CreateLocationSmbRequest</code> request. Do not provide both
  /// parameters for the same request.
  /// </note>
  ///
  /// Parameter [dnsIpAddresses] :
  /// Specifies the IPv4 or IPv6 addresses for the DNS servers that your SMB
  /// file server belongs to. This parameter applies only if
  /// <code>AuthenticationType</code> is set to <code>KERBEROS</code>.
  ///
  /// If you have multiple domains in your environment, configuring this
  /// parameter makes sure that DataSync connects to the right SMB file server.
  ///
  /// Parameter [domain] :
  /// Specifies the Windows domain name that your SMB file server belongs to.
  /// This parameter applies only if <code>AuthenticationType</code> is set to
  /// <code>NTLM</code>.
  ///
  /// If you have multiple domains in your environment, configuring this
  /// parameter makes sure that DataSync connects to the right file server.
  ///
  /// Parameter [kerberosKeytab] :
  /// Specifies your Kerberos key table (keytab) file, which includes mappings
  /// between your Kerberos principal and encryption keys.
  ///
  /// To avoid task execution errors, make sure that the Kerberos principal that
  /// you use to create the keytab file matches exactly what you specify for
  /// <code>KerberosPrincipal</code>.
  ///
  /// Parameter [kerberosKrb5Conf] :
  /// Specifies a Kerberos configuration file (<code>krb5.conf</code>) that
  /// defines your Kerberos realm configuration.
  ///
  /// The file must be base64 encoded. If you're using the CLI, the encoding is
  /// done for you.
  ///
  /// Parameter [kerberosPrincipal] :
  /// Specifies a Kerberos principal, which is an identity in your Kerberos
  /// realm that has permission to access the files, folders, and file metadata
  /// in your SMB file server.
  ///
  /// A Kerberos principal might look like
  /// <code>HOST/kerberosuser@MYDOMAIN.ORG</code>.
  ///
  /// Principal names are case sensitive. Your DataSync task execution will fail
  /// if the principal that you specify for this parameter doesn’t exactly match
  /// the principal that you use to create the keytab file.
  ///
  /// Parameter [mountOptions] :
  /// Specifies the version of the SMB protocol that DataSync uses to access
  /// your SMB file server.
  ///
  /// Parameter [password] :
  /// Specifies the password of the user who can mount your SMB file server and
  /// has permission to access the files and folders involved in your transfer.
  /// This parameter applies only if <code>AuthenticationType</code> is set to
  /// <code>NTLM</code>.
  ///
  /// Parameter [tags] :
  /// Specifies labels that help you categorize, filter, and search for your
  /// Amazon Web Services resources. We recommend creating at least a name tag
  /// for your location.
  ///
  /// Parameter [user] :
  /// Specifies the user that can mount and access the files, folders, and file
  /// metadata in your SMB file server. This parameter applies only if
  /// <code>AuthenticationType</code> is set to <code>NTLM</code>.
  ///
  /// For information about choosing a user with the right level of access for
  /// your transfer, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">Providing
  /// DataSync access to SMB file servers</a>.
  Future<CreateLocationSmbResponse> createLocationSmb({
    required List<String> agentArns,
    required String serverHostname,
    required String subdirectory,
    SmbAuthenticationType? authenticationType,
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
    List<String>? dnsIpAddresses,
    String? domain,
    Uint8List? kerberosKeytab,
    Uint8List? kerberosKrb5Conf,
    String? kerberosPrincipal,
    SmbMountOptions? mountOptions,
    String? password,
    List<TagListEntry>? tags,
    String? user,
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
        'ServerHostname': serverHostname,
        'Subdirectory': subdirectory,
        if (authenticationType != null)
          'AuthenticationType': authenticationType.value,
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
        if (dnsIpAddresses != null) 'DnsIpAddresses': dnsIpAddresses,
        if (domain != null) 'Domain': domain,
        if (kerberosKeytab != null)
          'KerberosKeytab': base64Encode(kerberosKeytab),
        if (kerberosKrb5Conf != null)
          'KerberosKrb5Conf': base64Encode(kerberosKrb5Conf),
        if (kerberosPrincipal != null) 'KerberosPrincipal': kerberosPrincipal,
        if (mountOptions != null) 'MountOptions': mountOptions,
        if (password != null) 'Password': password,
        if (tags != null) 'Tags': tags,
        if (user != null) 'User': user,
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// For Enhanced mode tasks, you don't need to specify anything. DataSync
  /// automatically sends logs to a CloudWatch log group named
  /// <code>/aws/datasync</code>.
  ///
  /// Parameter [excludes] :
  /// Specifies exclude filters that define the files, objects, and folders in
  /// your source location that you don't want DataSync to transfer. For more
  /// information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Specifying
  /// what DataSync transfers by using filters</a>.
  ///
  /// Parameter [includes] :
  /// Specifies include filters that define the files, objects, and folders in
  /// your source location that you want DataSync to transfer. For more
  /// information and examples, see <a
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
  /// Parameter [taskMode] :
  /// Specifies one of the following task modes for your data transfer:
  ///
  /// <ul>
  /// <li>
  /// <code>ENHANCED</code> - Transfer virtually unlimited numbers of objects
  /// with higher performance than Basic mode. Enhanced mode tasks optimize the
  /// data transfer process by listing, preparing, transferring, and verifying
  /// data in parallel. Enhanced mode is currently available for transfers
  /// between Amazon S3 locations, transfers between Azure Blob and Amazon S3
  /// without an agent, and transfers between other clouds and Amazon S3 without
  /// an agent.
  /// <note>
  /// To create an Enhanced mode task, the IAM role that you use to call the
  /// <code>CreateTask</code> operation must have the
  /// <code>iam:CreateServiceLinkedRole</code> permission.
  /// </note> </li>
  /// <li>
  /// <code>BASIC</code> (default) - Transfer files or objects between Amazon
  /// Web Services storage and all other supported DataSync locations. Basic
  /// mode tasks are subject to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/datasync-limits.html">quotas</a>
  /// on the number of files, objects, and directories in a dataset. Basic mode
  /// sequentially prepares, transfers, and verifies data, making it slower than
  /// Enhanced mode for most workloads.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html#task-mode-differences">Understanding
  /// task mode differences</a>.
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
    TaskMode? taskMode,
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
        if (taskMode != null) 'TaskMode': taskMode.value,
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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

  /// Provides details about how an DataSync transfer location for Microsoft
  /// Azure Blob Storage is configured.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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

  /// Provides information about a <i>task</i>, which defines where and how
  /// DataSync transfers your data.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// this operation to help monitor the progress of an ongoing data transfer or
  /// check the results of the transfer.
  /// <note>
  /// Some <code>DescribeTaskExecution</code> response elements are only
  /// relevant to a specific task mode. For information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html#task-mode-differences">Understanding
  /// task mode differences</a> and <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transfer-performance-counters.html">Understanding
  /// data transfer performance counters</a>.
  /// </note>
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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

  /// Returns a list of source and destination locations.
  ///
  /// If you have more locations than are returned in a response (that is, the
  /// response returns only a truncated list of your agents), the response
  /// contains a token that you can specify in your next request to fetch the
  /// next page of locations.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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

  /// Returns all the tags associated with an Amazon Web Services resource.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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

  /// Starts an DataSync transfer task. For each task, you can only run one task
  /// execution at a time.
  ///
  /// There are several steps to a task execution. For more information, see <a
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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

  /// Applies a <i>tag</i> to an Amazon Web Services resource. Tags are
  /// key-value pairs that can help you manage, filter, and search for your
  /// resources.
  ///
  /// These include DataSync resources, such as locations, tasks, and task
  /// executions.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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

  /// Modifies the following configurations of the Microsoft Azure Blob Storage
  /// transfer location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html">Configuring
  /// DataSync transfers with Azure Blob Storage</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// (Optional) Specifies the Amazon Resource Name (ARN) of the DataSync agent
  /// that can connect with your Azure Blob Storage container. If you are
  /// setting up an agentless cross-cloud transfer, you do not need to specify a
  /// value for this parameter.
  ///
  /// You can specify more than one agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/multiple-agents.html">Using
  /// multiple agents for your transfer</a>.
  /// <note>
  /// You cannot add or remove agents from a storage location after you
  /// initially create it.
  /// </note>
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
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, such as
  /// an authentication token or set of credentials that DataSync uses to access
  /// a specific transfer location, and a customer-managed KMS key.
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed secret, such as
  /// an authentication token or set of credentials that DataSync uses to access
  /// a specific transfer location, and a customer-managed Identity and Access
  /// Management (IAM) role that provides access to the secret.
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
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
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
        if (accessTier != null) 'AccessTier': accessTier.value,
        if (agentArns != null) 'AgentArns': agentArns,
        if (authenticationType != null)
          'AuthenticationType': authenticationType.value,
        if (blobType != null) 'BlobType': blobType.value,
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
        if (sasConfiguration != null) 'SasConfiguration': sasConfiguration,
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Modifies the following configuration parameters of the Amazon EFS transfer
  /// location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html">Configuring
  /// DataSync transfers with Amazon EFS</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the Amazon EFS transfer
  /// location that you're updating.
  ///
  /// Parameter [accessPointArn] :
  /// Specifies the Amazon Resource Name (ARN) of the access point that DataSync
  /// uses to mount your Amazon EFS file system.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam">Accessing
  /// restricted Amazon EFS file systems</a>.
  ///
  /// Parameter [fileSystemAccessRoleArn] :
  /// Specifies an Identity and Access Management (IAM) role that allows
  /// DataSync to access your Amazon EFS file system.
  ///
  /// For information on creating this role, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam-role">Creating
  /// a DataSync IAM role for Amazon EFS file system access</a>.
  ///
  /// Parameter [inTransitEncryption] :
  /// Specifies whether you want DataSync to use Transport Layer Security (TLS)
  /// 1.2 encryption when it transfers data to or from your Amazon EFS file
  /// system.
  ///
  /// If you specify an access point using <code>AccessPointArn</code> or an IAM
  /// role using <code>FileSystemAccessRoleArn</code>, you must set this
  /// parameter to <code>TLS1_2</code>.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a mount path for your Amazon EFS file system. This is where
  /// DataSync reads or writes data on your file system (depending on if this is
  /// a source or destination location).
  ///
  /// By default, DataSync uses the root directory (or <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html">access
  /// point</a> if you provide one by using <code>AccessPointArn</code>). You
  /// can also include subdirectories using forward slashes (for example,
  /// <code>/path/to/folder</code>).
  Future<void> updateLocationEfs({
    required String locationArn,
    String? accessPointArn,
    String? fileSystemAccessRoleArn,
    EfsInTransitEncryption? inTransitEncryption,
    String? subdirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationEfs'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (accessPointArn != null) 'AccessPointArn': accessPointArn,
        if (fileSystemAccessRoleArn != null)
          'FileSystemAccessRoleArn': fileSystemAccessRoleArn,
        if (inTransitEncryption != null)
          'InTransitEncryption': inTransitEncryption.value,
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Modifies the following configuration parameters of the Amazon FSx for
  /// Lustre transfer location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-lustre-location.html">Configuring
  /// DataSync transfers with FSx for Lustre</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the FSx for Lustre transfer
  /// location that you're updating.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a mount path for your FSx for Lustre file system. The path can
  /// include subdirectories.
  ///
  /// When the location is used as a source, DataSync reads data from the mount
  /// path. When the location is used as a destination, DataSync writes data to
  /// the mount path. If you don't include this parameter, DataSync uses the
  /// file system's root directory (<code>/</code>).
  Future<void> updateLocationFsxLustre({
    required String locationArn,
    String? subdirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationFsxLustre'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Modifies the following configuration parameters of the Amazon FSx for
  /// NetApp ONTAP transfer location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html">Configuring
  /// DataSync transfers with FSx for ONTAP</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the FSx for ONTAP transfer
  /// location that you're updating.
  ///
  /// Parameter [protocol] :
  /// Specifies the data transfer protocol that DataSync uses to access your
  /// Amazon FSx file system.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a path to the file share in the storage virtual machine (SVM)
  /// where you want to transfer data to or from.
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
  Future<void> updateLocationFsxOntap({
    required String locationArn,
    FsxUpdateProtocol? protocol,
    String? subdirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationFsxOntap'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (protocol != null) 'Protocol': protocol,
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Modifies the following configuration parameters of the Amazon FSx for
  /// OpenZFS transfer location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-openzfs-location.html">Configuring
  /// DataSync transfers with FSx for OpenZFS</a>.
  /// <note>
  /// Request parameters related to <code>SMB</code> aren't supported with the
  /// <code>UpdateLocationFsxOpenZfs</code> operation.
  /// </note>
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the FSx for OpenZFS transfer
  /// location that you're updating.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a subdirectory in the location's path that must begin with
  /// <code>/fsx</code>. DataSync uses this subdirectory to read or write data
  /// (depending on whether the file system is a source or destination
  /// location).
  Future<void> updateLocationFsxOpenZfs({
    required String locationArn,
    FsxProtocol? protocol,
    String? subdirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationFsxOpenZfs'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (protocol != null) 'Protocol': protocol,
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Modifies the following configuration parameters of the Amazon FSx for
  /// Windows File Server transfer location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html">Configuring
  /// DataSync transfers with FSx for Windows File Server</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the ARN of the FSx for Windows File Server transfer location
  /// that you're updating.
  ///
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, such as
  /// a <code>Password</code> or set of credentials that DataSync uses to access
  /// a specific transfer location, and a customer-managed KMS key.
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed secret, such as
  /// a <code>Password</code> or set of credentials that DataSync uses to access
  /// a specific transfer location, and a customer-managed Identity and Access
  /// Management (IAM) role that provides access to the secret.
  ///
  /// Parameter [domain] :
  /// Specifies the name of the Windows domain that your FSx for Windows File
  /// Server file system belongs to.
  ///
  /// If you have multiple Active Directory domains in your environment,
  /// configuring this parameter makes sure that DataSync connects to the right
  /// file system.
  ///
  /// Parameter [password] :
  /// Specifies the password of the user with the permissions to mount and
  /// access the files, folders, and file metadata in your FSx for Windows File
  /// Server file system.
  ///
  /// Parameter [subdirectory] :
  /// Specifies a mount path for your file system using forward slashes.
  /// DataSync uses this subdirectory to read or write data (depending on
  /// whether the file system is a source or destination location).
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
  Future<void> updateLocationFsxWindows({
    required String locationArn,
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
    String? domain,
    String? password,
    String? subdirectory,
    String? user,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationFsxWindows'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
        if (domain != null) 'Domain': domain,
        if (password != null) 'Password': password,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (user != null) 'User': user,
      },
    );
  }

  /// Modifies the following configuration parameters of the Hadoop Distributed
  /// File System (HDFS) transfer location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-hdfs-location.html">Configuring
  /// DataSync transfers with an HDFS cluster</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [locationArn] :
  /// The Amazon Resource Name (ARN) of the source HDFS cluster location.
  ///
  /// Parameter [agentArns] :
  /// The Amazon Resource Names (ARNs) of the DataSync agents that can connect
  /// to your HDFS cluster.
  ///
  /// Parameter [authenticationType] :
  /// The type of authentication used to determine the identity of the user.
  ///
  /// Parameter [blockSize] :
  /// The size of the data blocks to write into the HDFS cluster.
  ///
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, such as
  /// a <code>KerberosKeytab</code> or set of credentials that DataSync uses to
  /// access a specific transfer location, and a customer-managed KMS key.
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed secret, such as
  /// a <code>KerberosKeytab</code> or set of credentials that DataSync uses to
  /// access a specific transfer location, and a customer-managed Identity and
  /// Access Management (IAM) role that provides access to the secret.
  ///
  /// Parameter [kerberosKeytab] :
  /// The Kerberos key table (keytab) that contains mappings between the defined
  /// Kerberos principal and the encrypted keys. You can load the keytab from a
  /// file by providing the file's address.
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
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
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
          'AuthenticationType': authenticationType.value,
        if (blockSize != null) 'BlockSize': blockSize,
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
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

  /// Modifies the following configuration parameters of the Network File System
  /// (NFS) transfer location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html">Configuring
  /// transfers with an NFS file server</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the NFS transfer location that
  /// you want to update.
  ///
  /// Parameter [serverHostname] :
  /// Specifies the DNS name or IP address (IPv4 or IPv6) of the NFS file server
  /// that your DataSync agent connects to.
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
    String? serverHostname,
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
        if (serverHostname != null) 'ServerHostname': serverHostname,
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Modifies the following configuration parameters of the object storage
  /// transfer location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html">Configuring
  /// DataSync transfers with an object storage system</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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
  /// (Optional) Specifies the Amazon Resource Names (ARNs) of the DataSync
  /// agents that can connect with your object storage system. If you are
  /// setting up an agentless cross-cloud transfer, you do not need to specify a
  /// value for this parameter.
  /// <note>
  /// You cannot add or remove agents from a storage location after you
  /// initially create it.
  /// </note>
  ///
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, such as
  /// an authentication token or set of credentials that DataSync uses to access
  /// a specific transfer location, and a customer-managed KMS key.
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed secret, such as
  /// an authentication token or set of credentials that DataSync uses to access
  /// a specific transfer location, and a customer-managed Identity and Access
  /// Management (IAM) role that provides access to the secret.
  ///
  /// Parameter [secretKey] :
  /// Specifies the secret key (for example, a password) if credentials are
  /// required to authenticate with the object storage server.
  /// <note>
  /// If you provide a secret using <code>SecretKey</code>, but do not provide
  /// secret configuration details using <code>CmkSecretConfig</code> or
  /// <code>CustomSecretConfig</code>, then DataSync stores the token using your
  /// Amazon Web Services account's Secrets Manager secret.
  /// </note>
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
  /// ca_root_certificate.pem > object_storage_certificates.pem</code>
  ///
  /// To use this parameter, configure <code>ServerProtocol</code> to
  /// <code>HTTPS</code>.
  ///
  /// Updating this parameter doesn't interfere with tasks that you have in
  /// progress.
  ///
  /// Parameter [serverHostname] :
  /// Specifies the domain name or IP address (IPv4 or IPv6) of the object
  /// storage server that your DataSync agent connects to.
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
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
    String? secretKey,
    Uint8List? serverCertificate,
    String? serverHostname,
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
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
        if (secretKey != null) 'SecretKey': secretKey,
        if (serverCertificate != null)
          'ServerCertificate': base64Encode(serverCertificate),
        if (serverHostname != null) 'ServerHostname': serverHostname,
        if (serverPort != null) 'ServerPort': serverPort,
        if (serverProtocol != null) 'ServerProtocol': serverProtocol.value,
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Modifies the following configuration parameters of the Amazon S3 transfer
  /// location that you're using with DataSync.
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
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the Amazon Resource Name (ARN) of the Amazon S3 transfer
  /// location that you're updating.
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
  Future<void> updateLocationS3({
    required String locationArn,
    S3Config? s3Config,
    S3StorageClass? s3StorageClass,
    String? subdirectory,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'FmrsService.UpdateLocationS3'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LocationArn': locationArn,
        if (s3Config != null) 'S3Config': s3Config,
        if (s3StorageClass != null) 'S3StorageClass': s3StorageClass.value,
        if (subdirectory != null) 'Subdirectory': subdirectory,
      },
    );
  }

  /// Modifies the following configuration parameters of the Server Message
  /// Block (SMB) transfer location that you're using with DataSync.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html">Configuring
  /// DataSync transfers with an SMB file server</a>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [locationArn] :
  /// Specifies the ARN of the SMB location that you want to update.
  ///
  /// Parameter [agentArns] :
  /// Specifies the DataSync agent (or agents) that can connect to your SMB file
  /// server. You specify an agent by using its Amazon Resource Name (ARN).
  ///
  /// Parameter [authenticationType] :
  /// Specifies the authentication protocol that DataSync uses to connect to
  /// your SMB file server. DataSync supports <code>NTLM</code> (default) and
  /// <code>KERBEROS</code> authentication.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">Providing
  /// DataSync access to SMB file servers</a>.
  ///
  /// Parameter [cmkSecretConfig] :
  /// Specifies configuration information for a DataSync-managed secret, such as
  /// a <code>Password</code> or <code>KerberosKeytab</code> or set of
  /// credentials that DataSync uses to access a specific transfer location, and
  /// a customer-managed KMS key.
  ///
  /// Parameter [customSecretConfig] :
  /// Specifies configuration information for a customer-managed secret, such as
  /// a <code>Password</code> or <code>KerberosKeytab</code> or set of
  /// credentials that DataSync uses to access a specific transfer location, and
  /// a customer-managed Identity and Access Management (IAM) role that provides
  /// access to the secret.
  ///
  /// Parameter [dnsIpAddresses] :
  /// Specifies the IP addresses (IPv4 or IPv6) for the DNS servers that your
  /// SMB file server belongs to. This parameter applies only if
  /// <code>AuthenticationType</code> is set to <code>KERBEROS</code>.
  ///
  /// If you have multiple domains in your environment, configuring this
  /// parameter makes sure that DataSync connects to the right SMB file server.
  ///
  /// Parameter [domain] :
  /// Specifies the Windows domain name that your SMB file server belongs to.
  /// This parameter applies only if <code>AuthenticationType</code> is set to
  /// <code>NTLM</code>.
  ///
  /// If you have multiple domains in your environment, configuring this
  /// parameter makes sure that DataSync connects to the right file server.
  ///
  /// Parameter [kerberosKeytab] :
  /// Specifies your Kerberos key table (keytab) file, which includes mappings
  /// between your Kerberos principal and encryption keys.
  ///
  /// To avoid task execution errors, make sure that the Kerberos principal that
  /// you use to create the keytab file matches exactly what you specify for
  /// <code>KerberosPrincipal</code>.
  ///
  /// Parameter [kerberosKrb5Conf] :
  /// Specifies a Kerberos configuration file (<code>krb5.conf</code>) that
  /// defines your Kerberos realm configuration.
  ///
  /// The file must be base64 encoded. If you're using the CLI, the encoding is
  /// done for you.
  ///
  /// Parameter [kerberosPrincipal] :
  /// Specifies a Kerberos prinicpal, which is an identity in your Kerberos
  /// realm that has permission to access the files, folders, and file metadata
  /// in your SMB file server.
  ///
  /// A Kerberos principal might look like
  /// <code>HOST/kerberosuser@MYDOMAIN.ORG</code>.
  ///
  /// Principal names are case sensitive. Your DataSync task execution will fail
  /// if the principal that you specify for this parameter doesn’t exactly match
  /// the principal that you use to create the keytab file.
  ///
  /// Parameter [password] :
  /// Specifies the password of the user who can mount your SMB file server and
  /// has permission to access the files and folders involved in your transfer.
  /// This parameter applies only if <code>AuthenticationType</code> is set to
  /// <code>NTLM</code>.
  ///
  /// Parameter [serverHostname] :
  /// Specifies the domain name or IP address (IPv4 or IPv6) of the SMB file
  /// server that your DataSync agent connects to.
  /// <note>
  /// If you're using Kerberos authentication, you must specify a domain name.
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
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">Providing
  /// DataSync access to SMB file servers</a>.
  ///
  /// Parameter [user] :
  /// Specifies the user name that can mount your SMB file server and has
  /// permission to access the files and folders involved in your transfer. This
  /// parameter applies only if <code>AuthenticationType</code> is set to
  /// <code>NTLM</code>.
  ///
  /// For information about choosing a user with the right level of access for
  /// your transfer, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions">Providing
  /// DataSync access to SMB file servers</a>.
  Future<void> updateLocationSmb({
    required String locationArn,
    List<String>? agentArns,
    SmbAuthenticationType? authenticationType,
    CmkSecretConfig? cmkSecretConfig,
    CustomSecretConfig? customSecretConfig,
    List<String>? dnsIpAddresses,
    String? domain,
    Uint8List? kerberosKeytab,
    Uint8List? kerberosKrb5Conf,
    String? kerberosPrincipal,
    SmbMountOptions? mountOptions,
    String? password,
    String? serverHostname,
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
        if (authenticationType != null)
          'AuthenticationType': authenticationType.value,
        if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
        if (customSecretConfig != null)
          'CustomSecretConfig': customSecretConfig,
        if (dnsIpAddresses != null) 'DnsIpAddresses': dnsIpAddresses,
        if (domain != null) 'Domain': domain,
        if (kerberosKeytab != null)
          'KerberosKeytab': base64Encode(kerberosKeytab),
        if (kerberosKrb5Conf != null)
          'KerberosKrb5Conf': base64Encode(kerberosKrb5Conf),
        if (kerberosPrincipal != null) 'KerberosPrincipal': kerberosPrincipal,
        if (mountOptions != null) 'MountOptions': mountOptions,
        if (password != null) 'Password': password,
        if (serverHostname != null) 'ServerHostname': serverHostname,
        if (subdirectory != null) 'Subdirectory': subdirectory,
        if (user != null) 'User': user,
      },
    );
  }

  /// Updates the configuration of a <i>task</i>, which defines where and how
  /// DataSync transfers your data.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [taskArn] :
  /// Specifies the ARN of the task that you want to update.
  ///
  /// Parameter [cloudWatchLogGroupArn] :
  /// Specifies the Amazon Resource Name (ARN) of an Amazon CloudWatch log group
  /// for monitoring your task.
  ///
  /// For Enhanced mode tasks, you must use <code>/aws/datasync</code> as your
  /// log group name. For example:
  ///
  /// <code>arn:aws:logs:us-east-1:111222333444:log-group:/aws/datasync:*</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-logging.html">Monitoring
  /// data transfers with CloudWatch Logs</a>.
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
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
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

/// @nodoc
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
///
/// @nodoc
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

/// @nodoc
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
///
/// @nodoc
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

/// @nodoc
class CreateLocationFsxLustreResponse {
  /// The Amazon Resource Name (ARN) of the FSx for Lustre file system location
  /// that you created.
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class CreateLocationHdfsResponse {
  /// The ARN of the source HDFS cluster location that you create.
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
///
/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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

/// @nodoc
class DeleteAgentResponse {
  DeleteAgentResponse();

  factory DeleteAgentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAgentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteLocationResponse {
  DeleteLocationResponse();

  factory DeleteLocationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLocationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
///
/// @nodoc
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
      endpointType:
          (json['EndpointType'] as String?)?.let(EndpointType.fromString),
      lastConnectionTime: timeStampFromJson(json['LastConnectionTime']),
      name: json['Name'] as String?,
      platform: json['Platform'] != null
          ? Platform.fromJson(json['Platform'] as Map<String, dynamic>)
          : null,
      privateLinkConfig: json['PrivateLinkConfig'] != null
          ? PrivateLinkConfig.fromJson(
              json['PrivateLinkConfig'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(AgentStatus.fromString),
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
      if (endpointType != null) 'EndpointType': endpointType.value,
      if (lastConnectionTime != null)
        'LastConnectionTime': unixTimestampToJson(lastConnectionTime),
      if (name != null) 'Name': name,
      if (platform != null) 'Platform': platform,
      if (privateLinkConfig != null) 'PrivateLinkConfig': privateLinkConfig,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
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

  /// Describes configuration information for a DataSync-managed secret, such as
  /// an authentication token that DataSync uses to access a specific storage
  /// location, with a customer-managed KMS key.
  final CmkSecretConfig? cmkSecretConfig;

  /// The time that your Azure Blob Storage transfer location was created.
  final DateTime? creationTime;

  /// Describes configuration information for a customer-managed secret, such as
  /// an authentication token that DataSync uses to access a specific storage
  /// location, with a customer-managed Identity and Access Management (IAM) role
  /// that provides access to the secret.
  final CustomSecretConfig? customSecretConfig;

  /// The ARN of your Azure Blob Storage transfer location.
  final String? locationArn;

  /// The URL of the Azure Blob Storage container involved in your transfer.
  final String? locationUri;

  /// Describes configuration information for a DataSync-managed secret, such as
  /// an authentication token that DataSync uses to access a specific storage
  /// location. DataSync uses the default Amazon Web Services-managed KMS key to
  /// encrypt this secret in Secrets Manager.
  final ManagedSecretConfig? managedSecretConfig;

  DescribeLocationAzureBlobResponse({
    this.accessTier,
    this.agentArns,
    this.authenticationType,
    this.blobType,
    this.cmkSecretConfig,
    this.creationTime,
    this.customSecretConfig,
    this.locationArn,
    this.locationUri,
    this.managedSecretConfig,
  });

  factory DescribeLocationAzureBlobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLocationAzureBlobResponse(
      accessTier:
          (json['AccessTier'] as String?)?.let(AzureAccessTier.fromString),
      agentArns: (json['AgentArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      authenticationType: (json['AuthenticationType'] as String?)
          ?.let(AzureBlobAuthenticationType.fromString),
      blobType: (json['BlobType'] as String?)?.let(AzureBlobType.fromString),
      cmkSecretConfig: json['CmkSecretConfig'] != null
          ? CmkSecretConfig.fromJson(
              json['CmkSecretConfig'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      customSecretConfig: json['CustomSecretConfig'] != null
          ? CustomSecretConfig.fromJson(
              json['CustomSecretConfig'] as Map<String, dynamic>)
          : null,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      managedSecretConfig: json['ManagedSecretConfig'] != null
          ? ManagedSecretConfig.fromJson(
              json['ManagedSecretConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessTier = this.accessTier;
    final agentArns = this.agentArns;
    final authenticationType = this.authenticationType;
    final blobType = this.blobType;
    final cmkSecretConfig = this.cmkSecretConfig;
    final creationTime = this.creationTime;
    final customSecretConfig = this.customSecretConfig;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final managedSecretConfig = this.managedSecretConfig;
    return {
      if (accessTier != null) 'AccessTier': accessTier.value,
      if (agentArns != null) 'AgentArns': agentArns,
      if (authenticationType != null)
        'AuthenticationType': authenticationType.value,
      if (blobType != null) 'BlobType': blobType.value,
      if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (customSecretConfig != null) 'CustomSecretConfig': customSecretConfig,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (managedSecretConfig != null)
        'ManagedSecretConfig': managedSecretConfig,
    };
  }
}

/// DescribeLocationEfsResponse
///
/// @nodoc
class DescribeLocationEfsResponse {
  /// The ARN of the access point that DataSync uses to access the Amazon EFS file
  /// system.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam">Accessing
  /// restricted file systems</a>.
  final String? accessPointArn;

  /// The time that the location was created.
  final DateTime? creationTime;
  final Ec2Config? ec2Config;

  /// The Identity and Access Management (IAM) role that allows DataSync to access
  /// your Amazon EFS file system.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-iam-role">Creating
  /// a DataSync IAM role for file system access</a>.
  final String? fileSystemAccessRoleArn;

  /// Indicates whether DataSync uses Transport Layer Security (TLS) encryption
  /// when transferring data to or from the Amazon EFS file system.
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
      inTransitEncryption: (json['InTransitEncryption'] as String?)
          ?.let(EfsInTransitEncryption.fromString),
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
        'InTransitEncryption': inTransitEncryption.value,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class DescribeLocationFsxWindowsResponse {
  /// Describes configuration information for a DataSync-managed secret, such as a
  /// <code>Password</code> that DataSync uses to access a specific storage
  /// location, with a customer-managed KMS key.
  final CmkSecretConfig? cmkSecretConfig;

  /// The time that the FSx for Windows File Server location was created.
  final DateTime? creationTime;

  /// Describes configuration information for a customer-managed secret, such as a
  /// <code>Password</code> that DataSync uses to access a specific storage
  /// location, with a customer-managed Identity and Access Management (IAM) role
  /// that provides access to the secret.
  final CustomSecretConfig? customSecretConfig;

  /// The name of the Microsoft Active Directory domain that the FSx for Windows
  /// File Server file system belongs to.
  final String? domain;

  /// The ARN of the FSx for Windows File Server location.
  final String? locationArn;

  /// The uniform resource identifier (URI) of the FSx for Windows File Server
  /// location.
  final String? locationUri;

  /// Describes configuration information for a DataSync-managed secret, such as a
  /// <code>Password</code> that DataSync uses to access a specific storage
  /// location. DataSync uses the default Amazon Web Services-managed KMS key to
  /// encrypt this secret in Secrets Manager.
  final ManagedSecretConfig? managedSecretConfig;

  /// The ARNs of the Amazon EC2 security groups that provide access to your file
  /// system's preferred subnet.
  ///
  /// For information about configuring security groups for file system access,
  /// see the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/limit-access-security-groups.html">
  /// <i>Amazon FSx for Windows File Server User Guide</i> </a>.
  final List<String>? securityGroupArns;

  /// The user with the permissions to mount and access the FSx for Windows File
  /// Server file system.
  final String? user;

  DescribeLocationFsxWindowsResponse({
    this.cmkSecretConfig,
    this.creationTime,
    this.customSecretConfig,
    this.domain,
    this.locationArn,
    this.locationUri,
    this.managedSecretConfig,
    this.securityGroupArns,
    this.user,
  });

  factory DescribeLocationFsxWindowsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLocationFsxWindowsResponse(
      cmkSecretConfig: json['CmkSecretConfig'] != null
          ? CmkSecretConfig.fromJson(
              json['CmkSecretConfig'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      customSecretConfig: json['CustomSecretConfig'] != null
          ? CustomSecretConfig.fromJson(
              json['CustomSecretConfig'] as Map<String, dynamic>)
          : null,
      domain: json['Domain'] as String?,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      managedSecretConfig: json['ManagedSecretConfig'] != null
          ? ManagedSecretConfig.fromJson(
              json['ManagedSecretConfig'] as Map<String, dynamic>)
          : null,
      securityGroupArns: (json['SecurityGroupArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      user: json['User'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cmkSecretConfig = this.cmkSecretConfig;
    final creationTime = this.creationTime;
    final customSecretConfig = this.customSecretConfig;
    final domain = this.domain;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final managedSecretConfig = this.managedSecretConfig;
    final securityGroupArns = this.securityGroupArns;
    final user = this.user;
    return {
      if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (customSecretConfig != null) 'CustomSecretConfig': customSecretConfig,
      if (domain != null) 'Domain': domain,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (managedSecretConfig != null)
        'ManagedSecretConfig': managedSecretConfig,
      if (securityGroupArns != null) 'SecurityGroupArns': securityGroupArns,
      if (user != null) 'User': user,
    };
  }
}

/// @nodoc
class DescribeLocationHdfsResponse {
  /// The ARNs of the DataSync agents that can connect with your HDFS cluster.
  final List<String>? agentArns;

  /// The type of authentication used to determine the identity of the user.
  final HdfsAuthenticationType? authenticationType;

  /// The size of the data blocks to write into the HDFS cluster.
  final int? blockSize;

  /// Describes configuration information for a DataSync-managed secret, such as a
  /// <code>KerberosKeytab</code> that DataSync uses to access a specific storage
  /// location, with a customer-managed KMS key.
  final CmkSecretConfig? cmkSecretConfig;

  /// The time that the HDFS location was created.
  final DateTime? creationTime;

  /// Describes configuration information for a customer-managed secret, such as a
  /// <code>KerberosKeytab</code> that DataSync uses to access a specific storage
  /// location, with a customer-managed Identity and Access Management (IAM) role
  /// that provides access to the secret.
  final CustomSecretConfig? customSecretConfig;

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

  /// Describes configuration information for a DataSync-managed secret, such as a
  /// <code>KerberosKeytab</code> that DataSync uses to access a specific storage
  /// location. DataSync uses the default Amazon Web Services-managed KMS key to
  /// encrypt this secret in Secrets Manager.
  final ManagedSecretConfig? managedSecretConfig;

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
    this.cmkSecretConfig,
    this.creationTime,
    this.customSecretConfig,
    this.kerberosPrincipal,
    this.kmsKeyProviderUri,
    this.locationArn,
    this.locationUri,
    this.managedSecretConfig,
    this.nameNodes,
    this.qopConfiguration,
    this.replicationFactor,
    this.simpleUser,
  });

  factory DescribeLocationHdfsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLocationHdfsResponse(
      agentArns: (json['AgentArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      authenticationType: (json['AuthenticationType'] as String?)
          ?.let(HdfsAuthenticationType.fromString),
      blockSize: json['BlockSize'] as int?,
      cmkSecretConfig: json['CmkSecretConfig'] != null
          ? CmkSecretConfig.fromJson(
              json['CmkSecretConfig'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      customSecretConfig: json['CustomSecretConfig'] != null
          ? CustomSecretConfig.fromJson(
              json['CustomSecretConfig'] as Map<String, dynamic>)
          : null,
      kerberosPrincipal: json['KerberosPrincipal'] as String?,
      kmsKeyProviderUri: json['KmsKeyProviderUri'] as String?,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      managedSecretConfig: json['ManagedSecretConfig'] != null
          ? ManagedSecretConfig.fromJson(
              json['ManagedSecretConfig'] as Map<String, dynamic>)
          : null,
      nameNodes: (json['NameNodes'] as List?)
          ?.nonNulls
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
    final cmkSecretConfig = this.cmkSecretConfig;
    final creationTime = this.creationTime;
    final customSecretConfig = this.customSecretConfig;
    final kerberosPrincipal = this.kerberosPrincipal;
    final kmsKeyProviderUri = this.kmsKeyProviderUri;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final managedSecretConfig = this.managedSecretConfig;
    final nameNodes = this.nameNodes;
    final qopConfiguration = this.qopConfiguration;
    final replicationFactor = this.replicationFactor;
    final simpleUser = this.simpleUser;
    return {
      if (agentArns != null) 'AgentArns': agentArns,
      if (authenticationType != null)
        'AuthenticationType': authenticationType.value,
      if (blockSize != null) 'BlockSize': blockSize,
      if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (customSecretConfig != null) 'CustomSecretConfig': customSecretConfig,
      if (kerberosPrincipal != null) 'KerberosPrincipal': kerberosPrincipal,
      if (kmsKeyProviderUri != null) 'KmsKeyProviderUri': kmsKeyProviderUri,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (managedSecretConfig != null)
        'ManagedSecretConfig': managedSecretConfig,
      if (nameNodes != null) 'NameNodes': nameNodes,
      if (qopConfiguration != null) 'QopConfiguration': qopConfiguration,
      if (replicationFactor != null) 'ReplicationFactor': replicationFactor,
      if (simpleUser != null) 'SimpleUser': simpleUser,
    };
  }
}

/// DescribeLocationNfsResponse
///
/// @nodoc
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
///
/// @nodoc
class DescribeLocationObjectStorageResponse {
  /// The access key (for example, a user name) required to authenticate with the
  /// object storage system.
  final String? accessKey;

  /// The ARNs of the DataSync agents that can connect with your object storage
  /// system.
  final List<String>? agentArns;

  /// Describes configuration information for a DataSync-managed secret, such as
  /// an authentication token or set of credentials that DataSync uses to access a
  /// specific transfer location, and a customer-managed KMS key.
  final CmkSecretConfig? cmkSecretConfig;

  /// The time that the location was created.
  final DateTime? creationTime;

  /// Describes configuration information for a customer-managed secret, such as
  /// an authentication token or set of credentials that DataSync uses to access a
  /// specific transfer location, and a customer-managed Identity and Access
  /// Management (IAM) role that provides access to the secret.
  final CustomSecretConfig? customSecretConfig;

  /// The ARN of the object storage system location.
  final String? locationArn;

  /// The URI of the object storage system location.
  final String? locationUri;

  /// Describes configuration information for a DataSync-managed secret, such as
  /// an authentication token or set of credentials that DataSync uses to access a
  /// specific transfer location. DataSync uses the default Amazon Web
  /// Services-managed KMS key to encrypt this secret in Secrets Manager.
  final ManagedSecretConfig? managedSecretConfig;

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
    this.cmkSecretConfig,
    this.creationTime,
    this.customSecretConfig,
    this.locationArn,
    this.locationUri,
    this.managedSecretConfig,
    this.serverCertificate,
    this.serverPort,
    this.serverProtocol,
  });

  factory DescribeLocationObjectStorageResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLocationObjectStorageResponse(
      accessKey: json['AccessKey'] as String?,
      agentArns: (json['AgentArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      cmkSecretConfig: json['CmkSecretConfig'] != null
          ? CmkSecretConfig.fromJson(
              json['CmkSecretConfig'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      customSecretConfig: json['CustomSecretConfig'] != null
          ? CustomSecretConfig.fromJson(
              json['CustomSecretConfig'] as Map<String, dynamic>)
          : null,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      managedSecretConfig: json['ManagedSecretConfig'] != null
          ? ManagedSecretConfig.fromJson(
              json['ManagedSecretConfig'] as Map<String, dynamic>)
          : null,
      serverCertificate:
          _s.decodeNullableUint8List(json['ServerCertificate'] as String?),
      serverPort: json['ServerPort'] as int?,
      serverProtocol: (json['ServerProtocol'] as String?)
          ?.let(ObjectStorageServerProtocol.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKey = this.accessKey;
    final agentArns = this.agentArns;
    final cmkSecretConfig = this.cmkSecretConfig;
    final creationTime = this.creationTime;
    final customSecretConfig = this.customSecretConfig;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final managedSecretConfig = this.managedSecretConfig;
    final serverCertificate = this.serverCertificate;
    final serverPort = this.serverPort;
    final serverProtocol = this.serverProtocol;
    return {
      if (accessKey != null) 'AccessKey': accessKey,
      if (agentArns != null) 'AgentArns': agentArns,
      if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (customSecretConfig != null) 'CustomSecretConfig': customSecretConfig,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (managedSecretConfig != null)
        'ManagedSecretConfig': managedSecretConfig,
      if (serverCertificate != null)
        'ServerCertificate': base64Encode(serverCertificate),
      if (serverPort != null) 'ServerPort': serverPort,
      if (serverProtocol != null) 'ServerProtocol': serverProtocol.value,
    };
  }
}

/// DescribeLocationS3Response
///
/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      creationTime: timeStampFromJson(json['CreationTime']),
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      s3Config: json['S3Config'] != null
          ? S3Config.fromJson(json['S3Config'] as Map<String, dynamic>)
          : null,
      s3StorageClass:
          (json['S3StorageClass'] as String?)?.let(S3StorageClass.fromString),
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
      if (s3StorageClass != null) 'S3StorageClass': s3StorageClass.value,
    };
  }
}

/// DescribeLocationSmbResponse
///
/// @nodoc
class DescribeLocationSmbResponse {
  /// The ARNs of the DataSync agents that can connect with your SMB file server.
  final List<String>? agentArns;

  /// The authentication protocol that DataSync uses to connect to your SMB file
  /// server.
  final SmbAuthenticationType? authenticationType;

  /// Describes configuration information for a DataSync-managed secret, such as a
  /// <code>Password</code> or <code>KerberosKeytab</code> that DataSync uses to
  /// access a specific storage location, with a customer-managed KMS key.
  final CmkSecretConfig? cmkSecretConfig;

  /// The time that the SMB location was created.
  final DateTime? creationTime;

  /// Describes configuration information for a customer-managed secret, such as a
  /// <code>Password</code> or <code>KerberosKeytab</code> that DataSync uses to
  /// access a specific storage location, with a customer-managed Identity and
  /// Access Management (IAM) role that provides access to the secret.
  final CustomSecretConfig? customSecretConfig;

  /// The IPv4 or IPv6 addresses for the DNS servers that your SMB file server
  /// belongs to. This element applies only if <code>AuthenticationType</code> is
  /// set to <code>KERBEROS</code>.
  final List<String>? dnsIpAddresses;

  /// The name of the Windows domain that the SMB file server belongs to. This
  /// element applies only if <code>AuthenticationType</code> is set to
  /// <code>NTLM</code>.
  final String? domain;

  /// The Kerberos principal that has permission to access the files, folders, and
  /// file metadata in your SMB file server.
  final String? kerberosPrincipal;

  /// The ARN of the SMB location.
  final String? locationArn;

  /// The URI of the SMB location.
  final String? locationUri;

  /// Describes configuration information for a DataSync-managed secret, such as a
  /// <code>Password</code> or <code>KerberosKeytab</code> that DataSync uses to
  /// access a specific storage location. DataSync uses the default Amazon Web
  /// Services-managed KMS key to encrypt this secret in Secrets Manager.
  final ManagedSecretConfig? managedSecretConfig;

  /// The SMB protocol version that DataSync uses to access your SMB file server.
  final SmbMountOptions? mountOptions;

  /// The user that can mount and access the files, folders, and file metadata in
  /// your SMB file server. This element applies only if
  /// <code>AuthenticationType</code> is set to <code>NTLM</code>.
  final String? user;

  DescribeLocationSmbResponse({
    this.agentArns,
    this.authenticationType,
    this.cmkSecretConfig,
    this.creationTime,
    this.customSecretConfig,
    this.dnsIpAddresses,
    this.domain,
    this.kerberosPrincipal,
    this.locationArn,
    this.locationUri,
    this.managedSecretConfig,
    this.mountOptions,
    this.user,
  });

  factory DescribeLocationSmbResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLocationSmbResponse(
      agentArns: (json['AgentArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      authenticationType: (json['AuthenticationType'] as String?)
          ?.let(SmbAuthenticationType.fromString),
      cmkSecretConfig: json['CmkSecretConfig'] != null
          ? CmkSecretConfig.fromJson(
              json['CmkSecretConfig'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      customSecretConfig: json['CustomSecretConfig'] != null
          ? CustomSecretConfig.fromJson(
              json['CustomSecretConfig'] as Map<String, dynamic>)
          : null,
      dnsIpAddresses: (json['DnsIpAddresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      domain: json['Domain'] as String?,
      kerberosPrincipal: json['KerberosPrincipal'] as String?,
      locationArn: json['LocationArn'] as String?,
      locationUri: json['LocationUri'] as String?,
      managedSecretConfig: json['ManagedSecretConfig'] != null
          ? ManagedSecretConfig.fromJson(
              json['ManagedSecretConfig'] as Map<String, dynamic>)
          : null,
      mountOptions: json['MountOptions'] != null
          ? SmbMountOptions.fromJson(
              json['MountOptions'] as Map<String, dynamic>)
          : null,
      user: json['User'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentArns = this.agentArns;
    final authenticationType = this.authenticationType;
    final cmkSecretConfig = this.cmkSecretConfig;
    final creationTime = this.creationTime;
    final customSecretConfig = this.customSecretConfig;
    final dnsIpAddresses = this.dnsIpAddresses;
    final domain = this.domain;
    final kerberosPrincipal = this.kerberosPrincipal;
    final locationArn = this.locationArn;
    final locationUri = this.locationUri;
    final managedSecretConfig = this.managedSecretConfig;
    final mountOptions = this.mountOptions;
    final user = this.user;
    return {
      if (agentArns != null) 'AgentArns': agentArns,
      if (authenticationType != null)
        'AuthenticationType': authenticationType.value,
      if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (customSecretConfig != null) 'CustomSecretConfig': customSecretConfig,
      if (dnsIpAddresses != null) 'DnsIpAddresses': dnsIpAddresses,
      if (domain != null) 'Domain': domain,
      if (kerberosPrincipal != null) 'KerberosPrincipal': kerberosPrincipal,
      if (locationArn != null) 'LocationArn': locationArn,
      if (locationUri != null) 'LocationUri': locationUri,
      if (managedSecretConfig != null)
        'ManagedSecretConfig': managedSecretConfig,
      if (mountOptions != null) 'MountOptions': mountOptions,
      if (user != null) 'User': user,
    };
  }
}

/// DescribeTaskResponse
///
/// @nodoc
class DescribeTaskResponse {
  /// The Amazon Resource Name (ARN) of an Amazon CloudWatch log group for
  /// monitoring your task.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-logging.html">Monitoring
  /// data transfers with CloudWatch Logs</a>.
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
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-task-how-to.html#understand-task-creation-statuses">Task
  /// statuses</a>.
  final TaskStatus? status;

  /// The ARN of your task.
  final String? taskArn;

  /// The task mode that you're using. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Choosing
  /// a task mode for your data transfer</a>.
  final TaskMode? taskMode;

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
    this.taskMode,
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
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      errorCode: json['ErrorCode'] as String?,
      errorDetail: json['ErrorDetail'] as String?,
      excludes: (json['Excludes'] as List?)
          ?.nonNulls
          .map((e) => FilterRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      includes: (json['Includes'] as List?)
          ?.nonNulls
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.let(TaskStatus.fromString),
      taskArn: json['TaskArn'] as String?,
      taskMode: (json['TaskMode'] as String?)?.let(TaskMode.fromString),
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
    final taskMode = this.taskMode;
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
      if (status != null) 'Status': status.value,
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskMode != null) 'TaskMode': taskMode.value,
      if (taskReportConfig != null) 'TaskReportConfig': taskReportConfig,
    };
  }
}

/// DescribeTaskExecutionResponse
///
/// @nodoc
class DescribeTaskExecutionResponse {
  /// The number of physical bytes that DataSync transfers over the network after
  /// compression (if compression is possible). This number is typically less than
  /// <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-BytesTransferred">BytesTransferred</a>
  /// unless the data isn't compressible.
  final int? bytesCompressed;

  /// The number of bytes that DataSync sends to the network before compression
  /// (if compression is possible). For the number of bytes transferred over the
  /// network, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-BytesCompressed">BytesCompressed</a>.
  final int? bytesTransferred;

  /// The number of logical bytes that DataSync actually writes to the destination
  /// location.
  final int? bytesWritten;

  /// The time that the transfer task ends.
  final DateTime? endTime;

  /// The number of logical bytes that DataSync expects to write to the
  /// destination location.
  final int? estimatedBytesToTransfer;

  /// The number of files, objects, and directories that DataSync expects to
  /// delete in your destination location. If you don't configure your task to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html">delete
  /// data in the destination that isn't in the source</a>, the value is always
  /// <code>0</code>.
  /// <note>
  /// For <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>, this counter only includes files or objects. Directories are
  /// counted in <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-EstimatedFoldersToDelete">EstimatedFoldersToDelete</a>.
  /// </note>
  final int? estimatedFilesToDelete;

  /// The number of files, objects, and directories that DataSync expects to
  /// transfer over the network. This value is calculated while DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses">prepares</a>
  /// the transfer.
  ///
  /// How this gets calculated depends primarily on your task’s <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-TransferMode">transfer
  /// mode</a> configuration:
  ///
  /// <ul>
  /// <li>
  /// If <code>TranserMode</code> is set to <code>CHANGED</code> - The calculation
  /// is based on comparing the content of the source and destination locations
  /// and determining the difference that needs to be transferred. The difference
  /// can include:
  ///
  /// <ul>
  /// <li>
  /// Anything that's added or modified at the source location.
  /// </li>
  /// <li>
  /// Anything that's in both locations and modified at the destination after an
  /// initial transfer (unless <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-OverwriteMode">OverwriteMode</a>
  /// is set to <code>NEVER</code>).
  /// </li>
  /// <li>
  /// <b>(Basic task mode only)</b> The number of items that DataSync expects to
  /// delete (if <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-PreserveDeletedFiles">PreserveDeletedFiles</a>
  /// is set to <code>REMOVE</code>).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If <code>TranserMode</code> is set to <code>ALL</code> - The calculation is
  /// based only on the items that DataSync finds at the source location.
  /// </li>
  /// </ul> <note>
  /// For <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>, this counter only includes files or objects. Directories are
  /// counted in <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-EstimatedFoldersToTransfer">EstimatedFoldersToTransfer</a>.
  /// </note>
  final int? estimatedFilesToTransfer;

  /// The number of directories that DataSync expects to delete in your
  /// destination location. If you don't configure your task to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html">delete
  /// data in the destination that isn't in the source</a>, the value is always
  /// <code>0</code>.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final int? estimatedFoldersToDelete;

  /// The number of directories that DataSync expects to transfer over the
  /// network. This value is calculated as DataSync <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses">prepares</a>
  /// directories to transfer.
  ///
  /// How this gets calculated depends primarily on your task’s <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-TransferMode">transfer
  /// mode</a> configuration:
  ///
  /// <ul>
  /// <li>
  /// If <code>TranserMode</code> is set to <code>CHANGED</code> - The calculation
  /// is based on comparing the content of the source and destination locations
  /// and determining the difference that needs to be transferred. The difference
  /// can include:
  ///
  /// <ul>
  /// <li>
  /// Anything that's added or modified at the source location.
  /// </li>
  /// <li>
  /// Anything that's in both locations and modified at the destination after an
  /// initial transfer (unless <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-OverwriteMode">OverwriteMode</a>
  /// is set to <code>NEVER</code>).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If <code>TranserMode</code> is set to <code>ALL</code> - The calculation is
  /// based only on the items that DataSync finds at the source location.
  /// </li>
  /// </ul> <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final int? estimatedFoldersToTransfer;

  /// A list of filter rules that exclude specific data during your transfer. For
  /// more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  final List<FilterRule>? excludes;

  /// The number of files, objects, and directories that DataSync actually deletes
  /// in your destination location. If you don't configure your task to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html">delete
  /// data in the destination that isn't in the source</a>, the value is always
  /// <code>0</code>.
  /// <note>
  /// For <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>, this counter only includes files or objects. Directories are
  /// counted in <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-FoldersDeleted">FoldersDeleted</a>.
  /// </note>
  final int? filesDeleted;

  /// The number of files or objects that DataSync fails to prepare, transfer,
  /// verify, and delete during your task execution.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final TaskExecutionFilesFailedDetail? filesFailed;

  /// The number of files or objects that DataSync finds at your locations.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final TaskExecutionFilesListedDetail? filesListed;

  /// The number of files or objects that DataSync will attempt to transfer after
  /// comparing your source and destination locations.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  /// This counter isn't applicable if you configure your task to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html#task-option-transfer-mode">transfer
  /// all data</a>. In that scenario, DataSync copies everything from the source
  /// to the destination without comparing differences between the locations.
  final int? filesPrepared;

  /// The number of files, objects, and directories that DataSync skips during
  /// your transfer.
  /// <note>
  /// For <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>, this counter only includes files or objects. Directories are
  /// counted in <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-FoldersSkipped">FoldersSkipped</a>.
  /// </note>
  final int? filesSkipped;

  /// The number of files, objects, and directories that DataSync actually
  /// transfers over the network. This value is updated periodically during your
  /// task execution when something is read from the source and sent over the
  /// network.
  ///
  /// If DataSync fails to transfer something, this value can be less than
  /// <code>EstimatedFilesToTransfer</code>. In some cases, this value can also be
  /// greater than <code>EstimatedFilesToTransfer</code>. This element is
  /// implementation-specific for some location types, so don't use it as an exact
  /// indication of what's transferring or to monitor your task execution.
  /// <note>
  /// For <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>, this counter only includes files or objects. Directories are
  /// counted in <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-FoldersTransferred">FoldersTransferred</a>.
  /// </note>
  final int? filesTransferred;

  /// The number of files, objects, and directories that DataSync verifies during
  /// your transfer.
  /// <note>
  /// When you configure your task to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-data-verification-options.html">verify
  /// only the data that's transferred</a>, DataSync doesn't verify directories in
  /// some situations or files that fail to transfer.
  ///
  /// For <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>, this counter only includes files or objects. Directories are
  /// counted in <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeTaskExecution.html#DataSync-DescribeTaskExecution-response-FoldersVerified">FoldersVerified</a>.
  /// </note>
  final int? filesVerified;

  /// The number of directories that DataSync actually deletes in your destination
  /// location. If you don't configure your task to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html">delete
  /// data in the destination that isn't in the source</a>, the value is always
  /// <code>0</code>.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final int? foldersDeleted;

  /// The number of directories that DataSync fails to list, prepare, transfer,
  /// verify, and delete during your task execution.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final TaskExecutionFoldersFailedDetail? foldersFailed;

  /// The number of directories that DataSync finds at your locations.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final TaskExecutionFoldersListedDetail? foldersListed;

  /// The number of directories that DataSync will attempt to transfer after
  /// comparing your source and destination locations.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  /// This counter isn't applicable if you configure your task to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html#task-option-transfer-mode">transfer
  /// all data</a>. In that scenario, DataSync copies everything from the source
  /// to the destination without comparing differences between the locations.
  final int? foldersPrepared;

  /// The number of directories that DataSync skips during your transfer.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final int? foldersSkipped;

  /// The number of directories that DataSync actually transfers over the network.
  /// This value is updated periodically during your task execution when something
  /// is read from the source and sent over the network.
  ///
  /// If DataSync fails to transfer something, this value can be less than
  /// <code>EstimatedFoldersToTransfer</code>. In some cases, this value can also
  /// be greater than <code>EstimatedFoldersToTransfer</code>.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final int? foldersTransferred;

  /// The number of directories that DataSync verifies during your transfer.
  /// <note>
  /// Applies only to <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  final int? foldersVerified;

  /// A list of filter rules that include specific data during your transfer. For
  /// more information and examples, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">Filtering
  /// data transferred by DataSync</a>.
  final List<FilterRule>? includes;

  /// The time that the task execution actually begins. For non-queued tasks,
  /// <code>LaunchTime</code> and <code>StartTime</code> are typically the same.
  /// For queued tasks, <code>LaunchTime</code> is typically later than
  /// <code>StartTime</code> because previously queued tasks must finish running
  /// before newer tasks can begin.
  final DateTime? launchTime;

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

  /// The time that DataSync sends the request to start the task execution. For
  /// non-queued tasks, <code>LaunchTime</code> and <code>StartTime</code> are
  /// typically the same. For queued tasks, <code>LaunchTime</code> is typically
  /// later than <code>StartTime</code> because previously queued tasks must
  /// finish running before newer tasks can begin.
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

  /// The task mode that you're using. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Choosing
  /// a task mode for your data transfer</a>.
  final TaskMode? taskMode;

  /// The configuration of your task report, which provides detailed information
  /// about for your DataSync transfer. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">Creating
  /// a task report</a>.
  final TaskReportConfig? taskReportConfig;

  DescribeTaskExecutionResponse({
    this.bytesCompressed,
    this.bytesTransferred,
    this.bytesWritten,
    this.endTime,
    this.estimatedBytesToTransfer,
    this.estimatedFilesToDelete,
    this.estimatedFilesToTransfer,
    this.estimatedFoldersToDelete,
    this.estimatedFoldersToTransfer,
    this.excludes,
    this.filesDeleted,
    this.filesFailed,
    this.filesListed,
    this.filesPrepared,
    this.filesSkipped,
    this.filesTransferred,
    this.filesVerified,
    this.foldersDeleted,
    this.foldersFailed,
    this.foldersListed,
    this.foldersPrepared,
    this.foldersSkipped,
    this.foldersTransferred,
    this.foldersVerified,
    this.includes,
    this.launchTime,
    this.manifestConfig,
    this.options,
    this.reportResult,
    this.result,
    this.startTime,
    this.status,
    this.taskExecutionArn,
    this.taskMode,
    this.taskReportConfig,
  });

  factory DescribeTaskExecutionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTaskExecutionResponse(
      bytesCompressed: json['BytesCompressed'] as int?,
      bytesTransferred: json['BytesTransferred'] as int?,
      bytesWritten: json['BytesWritten'] as int?,
      endTime: timeStampFromJson(json['EndTime']),
      estimatedBytesToTransfer: json['EstimatedBytesToTransfer'] as int?,
      estimatedFilesToDelete: json['EstimatedFilesToDelete'] as int?,
      estimatedFilesToTransfer: json['EstimatedFilesToTransfer'] as int?,
      estimatedFoldersToDelete: json['EstimatedFoldersToDelete'] as int?,
      estimatedFoldersToTransfer: json['EstimatedFoldersToTransfer'] as int?,
      excludes: (json['Excludes'] as List?)
          ?.nonNulls
          .map((e) => FilterRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      filesDeleted: json['FilesDeleted'] as int?,
      filesFailed: json['FilesFailed'] != null
          ? TaskExecutionFilesFailedDetail.fromJson(
              json['FilesFailed'] as Map<String, dynamic>)
          : null,
      filesListed: json['FilesListed'] != null
          ? TaskExecutionFilesListedDetail.fromJson(
              json['FilesListed'] as Map<String, dynamic>)
          : null,
      filesPrepared: json['FilesPrepared'] as int?,
      filesSkipped: json['FilesSkipped'] as int?,
      filesTransferred: json['FilesTransferred'] as int?,
      filesVerified: json['FilesVerified'] as int?,
      foldersDeleted: json['FoldersDeleted'] as int?,
      foldersFailed: json['FoldersFailed'] != null
          ? TaskExecutionFoldersFailedDetail.fromJson(
              json['FoldersFailed'] as Map<String, dynamic>)
          : null,
      foldersListed: json['FoldersListed'] != null
          ? TaskExecutionFoldersListedDetail.fromJson(
              json['FoldersListed'] as Map<String, dynamic>)
          : null,
      foldersPrepared: json['FoldersPrepared'] as int?,
      foldersSkipped: json['FoldersSkipped'] as int?,
      foldersTransferred: json['FoldersTransferred'] as int?,
      foldersVerified: json['FoldersVerified'] as int?,
      includes: (json['Includes'] as List?)
          ?.nonNulls
          .map((e) => FilterRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      launchTime: timeStampFromJson(json['LaunchTime']),
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
      status: (json['Status'] as String?)?.let(TaskExecutionStatus.fromString),
      taskExecutionArn: json['TaskExecutionArn'] as String?,
      taskMode: (json['TaskMode'] as String?)?.let(TaskMode.fromString),
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
    final endTime = this.endTime;
    final estimatedBytesToTransfer = this.estimatedBytesToTransfer;
    final estimatedFilesToDelete = this.estimatedFilesToDelete;
    final estimatedFilesToTransfer = this.estimatedFilesToTransfer;
    final estimatedFoldersToDelete = this.estimatedFoldersToDelete;
    final estimatedFoldersToTransfer = this.estimatedFoldersToTransfer;
    final excludes = this.excludes;
    final filesDeleted = this.filesDeleted;
    final filesFailed = this.filesFailed;
    final filesListed = this.filesListed;
    final filesPrepared = this.filesPrepared;
    final filesSkipped = this.filesSkipped;
    final filesTransferred = this.filesTransferred;
    final filesVerified = this.filesVerified;
    final foldersDeleted = this.foldersDeleted;
    final foldersFailed = this.foldersFailed;
    final foldersListed = this.foldersListed;
    final foldersPrepared = this.foldersPrepared;
    final foldersSkipped = this.foldersSkipped;
    final foldersTransferred = this.foldersTransferred;
    final foldersVerified = this.foldersVerified;
    final includes = this.includes;
    final launchTime = this.launchTime;
    final manifestConfig = this.manifestConfig;
    final options = this.options;
    final reportResult = this.reportResult;
    final result = this.result;
    final startTime = this.startTime;
    final status = this.status;
    final taskExecutionArn = this.taskExecutionArn;
    final taskMode = this.taskMode;
    final taskReportConfig = this.taskReportConfig;
    return {
      if (bytesCompressed != null) 'BytesCompressed': bytesCompressed,
      if (bytesTransferred != null) 'BytesTransferred': bytesTransferred,
      if (bytesWritten != null) 'BytesWritten': bytesWritten,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (estimatedBytesToTransfer != null)
        'EstimatedBytesToTransfer': estimatedBytesToTransfer,
      if (estimatedFilesToDelete != null)
        'EstimatedFilesToDelete': estimatedFilesToDelete,
      if (estimatedFilesToTransfer != null)
        'EstimatedFilesToTransfer': estimatedFilesToTransfer,
      if (estimatedFoldersToDelete != null)
        'EstimatedFoldersToDelete': estimatedFoldersToDelete,
      if (estimatedFoldersToTransfer != null)
        'EstimatedFoldersToTransfer': estimatedFoldersToTransfer,
      if (excludes != null) 'Excludes': excludes,
      if (filesDeleted != null) 'FilesDeleted': filesDeleted,
      if (filesFailed != null) 'FilesFailed': filesFailed,
      if (filesListed != null) 'FilesListed': filesListed,
      if (filesPrepared != null) 'FilesPrepared': filesPrepared,
      if (filesSkipped != null) 'FilesSkipped': filesSkipped,
      if (filesTransferred != null) 'FilesTransferred': filesTransferred,
      if (filesVerified != null) 'FilesVerified': filesVerified,
      if (foldersDeleted != null) 'FoldersDeleted': foldersDeleted,
      if (foldersFailed != null) 'FoldersFailed': foldersFailed,
      if (foldersListed != null) 'FoldersListed': foldersListed,
      if (foldersPrepared != null) 'FoldersPrepared': foldersPrepared,
      if (foldersSkipped != null) 'FoldersSkipped': foldersSkipped,
      if (foldersTransferred != null) 'FoldersTransferred': foldersTransferred,
      if (foldersVerified != null) 'FoldersVerified': foldersVerified,
      if (includes != null) 'Includes': includes,
      if (launchTime != null) 'LaunchTime': unixTimestampToJson(launchTime),
      if (manifestConfig != null) 'ManifestConfig': manifestConfig,
      if (options != null) 'Options': options,
      if (reportResult != null) 'ReportResult': reportResult,
      if (result != null) 'Result': result,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.value,
      if (taskExecutionArn != null) 'TaskExecutionArn': taskExecutionArn,
      if (taskMode != null) 'TaskMode': taskMode.value,
      if (taskReportConfig != null) 'TaskReportConfig': taskReportConfig,
    };
  }
}

/// ListAgentsResponse
///
/// @nodoc
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
          ?.nonNulls
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
///
/// @nodoc
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
          ?.nonNulls
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
///
/// @nodoc
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
          ?.nonNulls
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
///
/// @nodoc
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
          ?.nonNulls
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
///
/// @nodoc
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
          ?.nonNulls
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

/// StartTaskExecutionResponse
///
/// @nodoc
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
class UpdateAgentResponse {
  UpdateAgentResponse();

  factory UpdateAgentResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAgentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationAzureBlobResponse {
  UpdateLocationAzureBlobResponse();

  factory UpdateLocationAzureBlobResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationAzureBlobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationEfsResponse {
  UpdateLocationEfsResponse();

  factory UpdateLocationEfsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationEfsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationFsxLustreResponse {
  UpdateLocationFsxLustreResponse();

  factory UpdateLocationFsxLustreResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationFsxLustreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationFsxOntapResponse {
  UpdateLocationFsxOntapResponse();

  factory UpdateLocationFsxOntapResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationFsxOntapResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationFsxOpenZfsResponse {
  UpdateLocationFsxOpenZfsResponse();

  factory UpdateLocationFsxOpenZfsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationFsxOpenZfsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationFsxWindowsResponse {
  UpdateLocationFsxWindowsResponse();

  factory UpdateLocationFsxWindowsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationFsxWindowsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationHdfsResponse {
  UpdateLocationHdfsResponse();

  factory UpdateLocationHdfsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationHdfsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationNfsResponse {
  UpdateLocationNfsResponse();

  factory UpdateLocationNfsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationNfsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationObjectStorageResponse {
  UpdateLocationObjectStorageResponse();

  factory UpdateLocationObjectStorageResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationObjectStorageResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationS3Response {
  UpdateLocationS3Response();

  factory UpdateLocationS3Response.fromJson(Map<String, dynamic> _) {
    return UpdateLocationS3Response();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLocationSmbResponse {
  UpdateLocationSmbResponse();

  factory UpdateLocationSmbResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLocationSmbResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateTaskResponse {
  UpdateTaskResponse();

  factory UpdateTaskResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateTaskExecutionResponse {
  UpdateTaskExecutionResponse();

  factory UpdateTaskExecutionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTaskExecutionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
///
/// @nodoc
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
  /// version before the <code>PREPARING</code> steps of the task execution). This
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
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/metadata-copied.html">Understanding
  /// how DataSync handles file and object metadata</a>.
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
  /// was written to before the <code>PREPARING</code> step of your task
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
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/metadata-copied.html">Understanding
  /// how DataSync handles file and object metadata</a>.
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
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/metadata-copied.html">Understanding
  /// how DataSync handles file and object metadata</a>.
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

  /// Specifies whether DataSync transfers only the data (including metadata) that
  /// differs between locations following an initial copy or transfers all data
  /// every time you run the task. If you're planning on recurring transfers, you
  /// might only want to transfer what's changed since your previous task
  /// execution.
  ///
  /// <ul>
  /// <li>
  /// <code>CHANGED</code> (default) - After your initial full transfer, DataSync
  /// copies only the data and metadata that differs between the source and
  /// destination location.
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

  /// Specifies if and how DataSync checks the integrity of your data at the end
  /// of your transfer.
  ///
  /// <ul>
  /// <li>
  /// <code>ONLY_FILES_TRANSFERRED</code> (recommended) - DataSync calculates the
  /// checksum of transferred data (including metadata) at the source location. At
  /// the end of the transfer, DataSync then compares this checksum to the
  /// checksum calculated on that data at the destination.
  /// <note>
  /// This is the default option for <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
  /// mode tasks</a>.
  /// </note>
  /// We recommend this option when transferring to S3 Glacier Flexible Retrieval
  /// or S3 Glacier Deep Archive storage classes. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes">Storage
  /// class considerations with Amazon S3 locations</a>.
  /// </li>
  /// <li>
  /// <code>POINT_IN_TIME_CONSISTENT</code> - At the end of the transfer, DataSync
  /// checks the entire source and destination to verify that both locations are
  /// fully synchronized.
  /// <note>
  /// The is the default option for <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Basic
  /// mode tasks</a> and isn't currently supported with Enhanced mode tasks.
  /// </note>
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
  /// <code>NONE</code> - DataSync performs data integrity checks only during your
  /// transfer. Unlike other options, there's no additional verification at the
  /// end of your transfer.
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
      atime: (json['Atime'] as String?)?.let(Atime.fromString),
      bytesPerSecond: json['BytesPerSecond'] as int?,
      gid: (json['Gid'] as String?)?.let(Gid.fromString),
      logLevel: (json['LogLevel'] as String?)?.let(LogLevel.fromString),
      mtime: (json['Mtime'] as String?)?.let(Mtime.fromString),
      objectTags: (json['ObjectTags'] as String?)?.let(ObjectTags.fromString),
      overwriteMode:
          (json['OverwriteMode'] as String?)?.let(OverwriteMode.fromString),
      posixPermissions: (json['PosixPermissions'] as String?)
          ?.let(PosixPermissions.fromString),
      preserveDeletedFiles: (json['PreserveDeletedFiles'] as String?)
          ?.let(PreserveDeletedFiles.fromString),
      preserveDevices:
          (json['PreserveDevices'] as String?)?.let(PreserveDevices.fromString),
      securityDescriptorCopyFlags:
          (json['SecurityDescriptorCopyFlags'] as String?)
              ?.let(SmbSecurityDescriptorCopyFlags.fromString),
      taskQueueing:
          (json['TaskQueueing'] as String?)?.let(TaskQueueing.fromString),
      transferMode:
          (json['TransferMode'] as String?)?.let(TransferMode.fromString),
      uid: (json['Uid'] as String?)?.let(Uid.fromString),
      verifyMode: (json['VerifyMode'] as String?)?.let(VerifyMode.fromString),
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
      if (atime != null) 'Atime': atime.value,
      if (bytesPerSecond != null) 'BytesPerSecond': bytesPerSecond,
      if (gid != null) 'Gid': gid.value,
      if (logLevel != null) 'LogLevel': logLevel.value,
      if (mtime != null) 'Mtime': mtime.value,
      if (objectTags != null) 'ObjectTags': objectTags.value,
      if (overwriteMode != null) 'OverwriteMode': overwriteMode.value,
      if (posixPermissions != null) 'PosixPermissions': posixPermissions.value,
      if (preserveDeletedFiles != null)
        'PreserveDeletedFiles': preserveDeletedFiles.value,
      if (preserveDevices != null) 'PreserveDevices': preserveDevices.value,
      if (securityDescriptorCopyFlags != null)
        'SecurityDescriptorCopyFlags': securityDescriptorCopyFlags.value,
      if (taskQueueing != null) 'TaskQueueing': taskQueueing.value,
      if (transferMode != null) 'TransferMode': transferMode.value,
      if (uid != null) 'Uid': uid.value,
      if (verifyMode != null) 'VerifyMode': verifyMode.value,
    };
  }
}

/// @nodoc
class VerifyMode {
  static const pointInTimeConsistent = VerifyMode._('POINT_IN_TIME_CONSISTENT');
  static const onlyFilesTransferred = VerifyMode._('ONLY_FILES_TRANSFERRED');
  static const none = VerifyMode._('NONE');

  final String value;

  const VerifyMode._(this.value);

  static const values = [pointInTimeConsistent, onlyFilesTransferred, none];

  static VerifyMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VerifyMode._(value));

  @override
  bool operator ==(other) => other is VerifyMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OverwriteMode {
  static const always = OverwriteMode._('ALWAYS');
  static const never = OverwriteMode._('NEVER');

  final String value;

  const OverwriteMode._(this.value);

  static const values = [always, never];

  static OverwriteMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OverwriteMode._(value));

  @override
  bool operator ==(other) => other is OverwriteMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Atime {
  static const none = Atime._('NONE');
  static const bestEffort = Atime._('BEST_EFFORT');

  final String value;

  const Atime._(this.value);

  static const values = [none, bestEffort];

  static Atime fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Atime._(value));

  @override
  bool operator ==(other) => other is Atime && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Mtime {
  static const none = Mtime._('NONE');
  static const preserve = Mtime._('PRESERVE');

  final String value;

  const Mtime._(this.value);

  static const values = [none, preserve];

  static Mtime fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Mtime._(value));

  @override
  bool operator ==(other) => other is Mtime && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Uid {
  static const none = Uid._('NONE');
  static const intValue = Uid._('INT_VALUE');
  static const name = Uid._('NAME');
  static const both = Uid._('BOTH');

  final String value;

  const Uid._(this.value);

  static const values = [none, intValue, name, both];

  static Uid fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Uid._(value));

  @override
  bool operator ==(other) => other is Uid && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Gid {
  static const none = Gid._('NONE');
  static const intValue = Gid._('INT_VALUE');
  static const name = Gid._('NAME');
  static const both = Gid._('BOTH');

  final String value;

  const Gid._(this.value);

  static const values = [none, intValue, name, both];

  static Gid fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Gid._(value));

  @override
  bool operator ==(other) => other is Gid && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PreserveDeletedFiles {
  static const preserve = PreserveDeletedFiles._('PRESERVE');
  static const remove = PreserveDeletedFiles._('REMOVE');

  final String value;

  const PreserveDeletedFiles._(this.value);

  static const values = [preserve, remove];

  static PreserveDeletedFiles fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PreserveDeletedFiles._(value));

  @override
  bool operator ==(other) =>
      other is PreserveDeletedFiles && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PreserveDevices {
  static const none = PreserveDevices._('NONE');
  static const preserve = PreserveDevices._('PRESERVE');

  final String value;

  const PreserveDevices._(this.value);

  static const values = [none, preserve];

  static PreserveDevices fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PreserveDevices._(value));

  @override
  bool operator ==(other) => other is PreserveDevices && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PosixPermissions {
  static const none = PosixPermissions._('NONE');
  static const preserve = PosixPermissions._('PRESERVE');

  final String value;

  const PosixPermissions._(this.value);

  static const values = [none, preserve];

  static PosixPermissions fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PosixPermissions._(value));

  @override
  bool operator ==(other) => other is PosixPermissions && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TaskQueueing {
  static const enabled = TaskQueueing._('ENABLED');
  static const disabled = TaskQueueing._('DISABLED');

  final String value;

  const TaskQueueing._(this.value);

  static const values = [enabled, disabled];

  static TaskQueueing fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskQueueing._(value));

  @override
  bool operator ==(other) => other is TaskQueueing && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LogLevel {
  static const off = LogLevel._('OFF');
  static const basic = LogLevel._('BASIC');
  static const transfer = LogLevel._('TRANSFER');

  final String value;

  const LogLevel._(this.value);

  static const values = [off, basic, transfer];

  static LogLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogLevel._(value));

  @override
  bool operator ==(other) => other is LogLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TransferMode {
  static const changed = TransferMode._('CHANGED');
  static const all = TransferMode._('ALL');

  final String value;

  const TransferMode._(this.value);

  static const values = [changed, all];

  static TransferMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TransferMode._(value));

  @override
  bool operator ==(other) => other is TransferMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SmbSecurityDescriptorCopyFlags {
  static const none = SmbSecurityDescriptorCopyFlags._('NONE');
  static const ownerDacl = SmbSecurityDescriptorCopyFlags._('OWNER_DACL');
  static const ownerDaclSacl =
      SmbSecurityDescriptorCopyFlags._('OWNER_DACL_SACL');

  final String value;

  const SmbSecurityDescriptorCopyFlags._(this.value);

  static const values = [none, ownerDacl, ownerDaclSacl];

  static SmbSecurityDescriptorCopyFlags fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SmbSecurityDescriptorCopyFlags._(value));

  @override
  bool operator ==(other) =>
      other is SmbSecurityDescriptorCopyFlags && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ObjectTags {
  static const preserve = ObjectTags._('PRESERVE');
  static const none = ObjectTags._('NONE');

  final String value;

  const ObjectTags._(this.value);

  static const values = [preserve, none];

  static ObjectTags fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ObjectTags._(value));

  @override
  bool operator ==(other) => other is ObjectTags && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configures your DataSync task to run on a <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">schedule</a>
/// (at a minimum interval of 1 hour).
///
/// @nodoc
class TaskSchedule {
  /// Specifies your task schedule by using a cron or rate expression.
  ///
  /// Use cron expressions for task schedules that run on a specific time and day.
  /// For example, the following cron expression creates a task schedule that runs
  /// at 8 AM on the first Wednesday of every month:
  ///
  /// <code>cron(0 8 * * 3#1)</code>
  ///
  /// Use rate expressions for task schedules that run on a regular interval. For
  /// example, the following rate expression creates a task schedule that runs
  /// every 12 hours:
  ///
  /// <code>rate(12 hours)</code>
  ///
  /// For information about cron and rate expression syntax, see the <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-scheduled-rule-pattern.html">
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
      scheduleExpression: (json['ScheduleExpression'] as String?) ?? '',
      status: (json['Status'] as String?)?.let(ScheduleStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    final status = this.status;
    return {
      'ScheduleExpression': scheduleExpression,
      if (status != null) 'Status': status.value,
    };
  }
}

/// Configures a manifest, which is a list of files or objects that you want
/// DataSync to transfer. For more information and configuration examples, see
/// <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
/// what DataSync transfers by using a manifest</a>.
///
/// @nodoc
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
      action: (json['Action'] as String?)?.let(ManifestAction.fromString),
      format: (json['Format'] as String?)?.let(ManifestFormat.fromString),
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
      if (action != null) 'Action': action.value,
      if (format != null) 'Format': format.value,
      if (source != null) 'Source': source,
    };
  }
}

/// Specifies how you want to configure a task report, which provides detailed
/// information about for your DataSync transfer.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">Task
/// reports</a>.
///
/// @nodoc
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
      objectVersionIds: (json['ObjectVersionIds'] as String?)
          ?.let(ObjectVersionIds.fromString),
      outputType:
          (json['OutputType'] as String?)?.let(ReportOutputType.fromString),
      overrides: json['Overrides'] != null
          ? ReportOverrides.fromJson(json['Overrides'] as Map<String, dynamic>)
          : null,
      reportLevel:
          (json['ReportLevel'] as String?)?.let(ReportLevel.fromString),
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
      if (objectVersionIds != null) 'ObjectVersionIds': objectVersionIds.value,
      if (outputType != null) 'OutputType': outputType.value,
      if (overrides != null) 'Overrides': overrides,
      if (reportLevel != null) 'ReportLevel': reportLevel.value,
    };
  }
}

/// Specifies where DataSync uploads your <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a>.
///
/// @nodoc
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

/// @nodoc
class ReportOutputType {
  static const summaryOnly = ReportOutputType._('SUMMARY_ONLY');
  static const standard = ReportOutputType._('STANDARD');

  final String value;

  const ReportOutputType._(this.value);

  static const values = [summaryOnly, standard];

  static ReportOutputType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReportOutputType._(value));

  @override
  bool operator ==(other) => other is ReportOutputType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReportLevel {
  static const errorsOnly = ReportLevel._('ERRORS_ONLY');
  static const successesAndErrors = ReportLevel._('SUCCESSES_AND_ERRORS');

  final String value;

  const ReportLevel._(this.value);

  static const values = [errorsOnly, successesAndErrors];

  static ReportLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReportLevel._(value));

  @override
  bool operator ==(other) => other is ReportLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ObjectVersionIds {
  static const include = ObjectVersionIds._('INCLUDE');
  static const none = ObjectVersionIds._('NONE');

  final String value;

  const ObjectVersionIds._(this.value);

  static const values = [include, none];

  static ObjectVersionIds fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ObjectVersionIds._(value));

  @override
  bool operator ==(other) => other is ObjectVersionIds && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The level of detail included in each aspect of your DataSync <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a>.
///
/// @nodoc
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

/// Specifies the level of detail for a particular aspect of your DataSync <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a>.
///
/// @nodoc
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
      reportLevel:
          (json['ReportLevel'] as String?)?.let(ReportLevel.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final reportLevel = this.reportLevel;
    return {
      if (reportLevel != null) 'ReportLevel': reportLevel.value,
    };
  }
}

/// Specifies the Amazon S3 bucket where DataSync uploads your <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a>.
///
/// @nodoc
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
      bucketAccessRoleArn: (json['BucketAccessRoleArn'] as String?) ?? '',
      s3BucketArn: (json['S3BucketArn'] as String?) ?? '',
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

/// @nodoc
class ManifestAction {
  static const transfer = ManifestAction._('TRANSFER');

  final String value;

  const ManifestAction._(this.value);

  static const values = [transfer];

  static ManifestAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ManifestAction._(value));

  @override
  bool operator ==(other) => other is ManifestAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ManifestFormat {
  static const csv = ManifestFormat._('CSV');

  final String value;

  const ManifestFormat._(this.value);

  static const values = [csv];

  static ManifestFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ManifestFormat._(value));

  @override
  bool operator ==(other) => other is ManifestFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the manifest that you want DataSync to use and where it's hosted.
/// For more information and configuration examples, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
/// what DataSync transfers by using a manifest</a>.
///
/// @nodoc
class SourceManifestConfig {
  /// Specifies the S3 bucket where you're hosting your manifest.
  final S3ManifestConfig s3;

  SourceManifestConfig({
    required this.s3,
  });

  factory SourceManifestConfig.fromJson(Map<String, dynamic> json) {
    return SourceManifestConfig(
      s3: S3ManifestConfig.fromJson(
          (json['S3'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      'S3': s3,
    };
  }
}

/// Specifies the S3 bucket where you're hosting the manifest that you want
/// DataSync to use. For more information and configuration examples, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">Specifying
/// what DataSync transfers by using a manifest</a>.
///
/// @nodoc
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
      bucketAccessRoleArn: (json['BucketAccessRoleArn'] as String?) ?? '',
      manifestObjectPath: (json['ManifestObjectPath'] as String?) ?? '',
      s3BucketArn: (json['S3BucketArn'] as String?) ?? '',
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

/// @nodoc
class ScheduleStatus {
  static const enabled = ScheduleStatus._('ENABLED');
  static const disabled = ScheduleStatus._('DISABLED');

  final String value;

  const ScheduleStatus._(this.value);

  static const values = [enabled, disabled];

  static ScheduleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduleStatus._(value));

  @override
  bool operator ==(other) => other is ScheduleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies which files, folders, and objects to include or exclude when
/// transferring files from source to destination.
///
/// @nodoc
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
      filterType: (json['FilterType'] as String?)?.let(FilterType.fromString),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filterType = this.filterType;
    final value = this.value;
    return {
      if (filterType != null) 'FilterType': filterType.value,
      if (value != null) 'Value': value,
    };
  }
}

/// @nodoc
class FilterType {
  static const simplePattern = FilterType._('SIMPLE_PATTERN');

  final String value;

  const FilterType._(this.value);

  static const values = [simplePattern];

  static FilterType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FilterType._(value));

  @override
  bool operator ==(other) => other is FilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies configuration information for a DataSync-managed secret, such as
/// an authentication token, secret key, password, or Kerberos keytab that
/// DataSync uses to access a specific storage location, with a customer-managed
/// KMS key.
/// <note>
/// You can use either <code>CmkSecretConfig</code> or
/// <code>CustomSecretConfig</code> to provide credentials for a
/// <code>CreateLocation</code> request. Do not provide both parameters for the
/// same request.
/// </note>
///
/// @nodoc
class CmkSecretConfig {
  /// Specifies the ARN for the customer-managed KMS key that DataSync uses to
  /// encrypt the DataSync-managed secret stored for <code>SecretArn</code>.
  /// DataSync provides this key to Secrets Manager.
  final String? kmsKeyArn;

  /// Specifies the ARN for the DataSync-managed Secrets Manager secret that that
  /// is used to access a specific storage location. This property is generated by
  /// DataSync and is read-only. DataSync encrypts this secret with the KMS key
  /// that you specify for <code>KmsKeyArn</code>.
  final String? secretArn;

  CmkSecretConfig({
    this.kmsKeyArn,
    this.secretArn,
  });

  factory CmkSecretConfig.fromJson(Map<String, dynamic> json) {
    return CmkSecretConfig(
      kmsKeyArn: json['KmsKeyArn'] as String?,
      secretArn: json['SecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyArn = this.kmsKeyArn;
    final secretArn = this.secretArn;
    return {
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (secretArn != null) 'SecretArn': secretArn,
    };
  }
}

/// Specifies configuration information for a customer-managed Secrets Manager
/// secret where a storage location credentials is stored in Secrets Manager as
/// plain text (for authentication token, secret key, or password) or as binary
/// (for Kerberos keytab). This configuration includes the secret ARN, and the
/// ARN for an IAM role that provides access to the secret.
/// <note>
/// You can use either <code>CmkSecretConfig</code> or
/// <code>CustomSecretConfig</code> to provide credentials for a
/// <code>CreateLocation</code> request. Do not provide both parameters for the
/// same request.
/// </note>
///
/// @nodoc
class CustomSecretConfig {
  /// Specifies the ARN for the Identity and Access Management role that DataSync
  /// uses to access the secret specified for <code>SecretArn</code>.
  final String? secretAccessRoleArn;

  /// Specifies the ARN for an Secrets Manager secret.
  final String? secretArn;

  CustomSecretConfig({
    this.secretAccessRoleArn,
    this.secretArn,
  });

  factory CustomSecretConfig.fromJson(Map<String, dynamic> json) {
    return CustomSecretConfig(
      secretAccessRoleArn: json['SecretAccessRoleArn'] as String?,
      secretArn: json['SecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final secretAccessRoleArn = this.secretAccessRoleArn;
    final secretArn = this.secretArn;
    return {
      if (secretAccessRoleArn != null)
        'SecretAccessRoleArn': secretAccessRoleArn,
      if (secretArn != null) 'SecretArn': secretArn,
    };
  }
}

/// Specifies the version of the Server Message Block (SMB) protocol that
/// DataSync uses to access an SMB file server.
///
/// @nodoc
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
      version: (json['Version'] as String?)?.let(SmbVersion.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      if (version != null) 'Version': version.value,
    };
  }
}

/// @nodoc
class SmbAuthenticationType {
  static const ntlm = SmbAuthenticationType._('NTLM');
  static const kerberos = SmbAuthenticationType._('KERBEROS');

  final String value;

  const SmbAuthenticationType._(this.value);

  static const values = [ntlm, kerberos];

  static SmbAuthenticationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SmbAuthenticationType._(value));

  @override
  bool operator ==(other) =>
      other is SmbAuthenticationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SmbVersion {
  static const automatic = SmbVersion._('AUTOMATIC');
  static const smb2 = SmbVersion._('SMB2');
  static const smb3 = SmbVersion._('SMB3');
  static const smb1 = SmbVersion._('SMB1');
  static const smb2_0 = SmbVersion._('SMB2_0');

  final String value;

  const SmbVersion._(this.value);

  static const values = [automatic, smb2, smb3, smb1, smb2_0];

  static SmbVersion fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SmbVersion._(value));

  @override
  bool operator ==(other) => other is SmbVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class S3StorageClass {
  static const standard = S3StorageClass._('STANDARD');
  static const standardIa = S3StorageClass._('STANDARD_IA');
  static const onezoneIa = S3StorageClass._('ONEZONE_IA');
  static const intelligentTiering = S3StorageClass._('INTELLIGENT_TIERING');
  static const glacier = S3StorageClass._('GLACIER');
  static const deepArchive = S3StorageClass._('DEEP_ARCHIVE');
  static const outposts = S3StorageClass._('OUTPOSTS');
  static const glacierInstantRetrieval =
      S3StorageClass._('GLACIER_INSTANT_RETRIEVAL');

  final String value;

  const S3StorageClass._(this.value);

  static const values = [
    standard,
    standardIa,
    onezoneIa,
    intelligentTiering,
    glacier,
    deepArchive,
    outposts,
    glacierInstantRetrieval
  ];

  static S3StorageClass fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => S3StorageClass._(value));

  @override
  bool operator ==(other) => other is S3StorageClass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the Amazon Resource Name (ARN) of the Identity and Access
/// Management (IAM) role that DataSync uses to access your S3 bucket.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-access">Providing
/// DataSync access to S3 buckets</a>.
///
/// @nodoc
class S3Config {
  /// Specifies the ARN of the IAM role that DataSync uses to access your S3
  /// bucket.
  final String bucketAccessRoleArn;

  S3Config({
    required this.bucketAccessRoleArn,
  });

  factory S3Config.fromJson(Map<String, dynamic> json) {
    return S3Config(
      bucketAccessRoleArn: (json['BucketAccessRoleArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucketAccessRoleArn = this.bucketAccessRoleArn;
    return {
      'BucketAccessRoleArn': bucketAccessRoleArn,
    };
  }
}

/// @nodoc
class ObjectStorageServerProtocol {
  static const https = ObjectStorageServerProtocol._('HTTPS');
  static const http = ObjectStorageServerProtocol._('HTTP');

  final String value;

  const ObjectStorageServerProtocol._(this.value);

  static const values = [https, http];

  static ObjectStorageServerProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ObjectStorageServerProtocol._(value));

  @override
  bool operator ==(other) =>
      other is ObjectStorageServerProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The DataSync agents that can connect to your Network File System (NFS) file
/// server.
///
/// @nodoc
class OnPremConfig {
  /// The Amazon Resource Names (ARNs) of the DataSync agents that can connect to
  /// your NFS file server.
  ///
  /// You can specify more than one agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html#multiple-agents">Using
  /// multiple DataSync agents</a>.
  final List<String> agentArns;

  OnPremConfig({
    required this.agentArns,
  });

  factory OnPremConfig.fromJson(Map<String, dynamic> json) {
    return OnPremConfig(
      agentArns: ((json['AgentArns'] as List?) ?? const [])
          .nonNulls
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

/// Specifies how DataSync can access a location using the NFS protocol.
///
/// @nodoc
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
      version: (json['Version'] as String?)?.let(NfsVersion.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      if (version != null) 'Version': version.value,
    };
  }
}

/// @nodoc
class NfsVersion {
  static const automatic = NfsVersion._('AUTOMATIC');
  static const nfs3 = NfsVersion._('NFS3');
  static const nfs4_0 = NfsVersion._('NFS4_0');
  static const nfs4_1 = NfsVersion._('NFS4_1');

  final String value;

  const NfsVersion._(this.value);

  static const values = [automatic, nfs3, nfs4_0, nfs4_1];

  static NfsVersion fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NfsVersion._(value));

  @override
  bool operator ==(other) => other is NfsVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Quality of Protection (QOP) configuration specifies the Remote Procedure
/// Call (RPC) and data transfer privacy settings configured on the Hadoop
/// Distributed File System (HDFS) cluster.
///
/// @nodoc
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
          ?.let(HdfsDataTransferProtection.fromString),
      rpcProtection:
          (json['RpcProtection'] as String?)?.let(HdfsRpcProtection.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dataTransferProtection = this.dataTransferProtection;
    final rpcProtection = this.rpcProtection;
    return {
      if (dataTransferProtection != null)
        'DataTransferProtection': dataTransferProtection.value,
      if (rpcProtection != null) 'RpcProtection': rpcProtection.value,
    };
  }
}

/// @nodoc
class HdfsAuthenticationType {
  static const simple = HdfsAuthenticationType._('SIMPLE');
  static const kerberos = HdfsAuthenticationType._('KERBEROS');

  final String value;

  const HdfsAuthenticationType._(this.value);

  static const values = [simple, kerberos];

  static HdfsAuthenticationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HdfsAuthenticationType._(value));

  @override
  bool operator ==(other) =>
      other is HdfsAuthenticationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class HdfsRpcProtection {
  static const disabled = HdfsRpcProtection._('DISABLED');
  static const authentication = HdfsRpcProtection._('AUTHENTICATION');
  static const integrity = HdfsRpcProtection._('INTEGRITY');
  static const privacy = HdfsRpcProtection._('PRIVACY');

  final String value;

  const HdfsRpcProtection._(this.value);

  static const values = [disabled, authentication, integrity, privacy];

  static HdfsRpcProtection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HdfsRpcProtection._(value));

  @override
  bool operator ==(other) => other is HdfsRpcProtection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class HdfsDataTransferProtection {
  static const disabled = HdfsDataTransferProtection._('DISABLED');
  static const authentication = HdfsDataTransferProtection._('AUTHENTICATION');
  static const integrity = HdfsDataTransferProtection._('INTEGRITY');
  static const privacy = HdfsDataTransferProtection._('PRIVACY');

  final String value;

  const HdfsDataTransferProtection._(this.value);

  static const values = [disabled, authentication, integrity, privacy];

  static HdfsDataTransferProtection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HdfsDataTransferProtection._(value));

  @override
  bool operator ==(other) =>
      other is HdfsDataTransferProtection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The NameNode of the Hadoop Distributed File System (HDFS). The NameNode
/// manages the file system's namespace. The NameNode performs operations such
/// as opening, closing, and renaming files and directories. The NameNode
/// contains the information to map blocks of data to the DataNodes.
///
/// @nodoc
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
      hostname: (json['Hostname'] as String?) ?? '',
      port: (json['Port'] as int?) ?? 0,
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

/// Specifies the data transfer protocol that DataSync uses to access your
/// Amazon FSx file system.
///
/// @nodoc
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
/// uses to access your FSx for OpenZFS file system or FSx for ONTAP file
/// system's storage virtual machine (SVM).
///
/// @nodoc
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
/// DataSync uses to access your Amazon FSx for NetApp ONTAP file system's
/// storage virtual machine (SVM). For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-access">Providing
/// DataSync access to FSx for ONTAP file systems</a>.
///
/// @nodoc
class FsxProtocolSmb {
  /// Specifies a user that can mount and access the files, folders, and metadata
  /// in your SVM.
  ///
  /// For information about choosing a user with the right level of access for
  /// your transfer, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-smb">Using
  /// the SMB protocol</a>.
  final String user;

  /// Specifies configuration information for a DataSync-managed secret, which
  /// includes the password that DataSync uses to access a specific FSx for ONTAP
  /// storage location (using SMB), with a customer-managed KMS key.
  ///
  /// When you include this parameter as part of a
  /// <code>CreateLocationFsxOntap</code> request, you provide only the KMS key
  /// ARN. DataSync uses this KMS key together with the <code>Password</code> you
  /// specify for to create a DataSync-managed secret to store the location access
  /// credentials.
  ///
  /// Make sure that DataSync has permission to access the KMS key that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#service-secret-custom-key">
  /// Using a service-managed secret encrypted with a custom KMS key</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with <code>Password</code>)
  /// or <code>CustomSecretConfig</code> (without <code>Password</code>) to
  /// provide credentials for a <code>CreateLocationFsxOntap</code> request. Do
  /// not provide both parameters for the same request.
  /// </note>
  final CmkSecretConfig? cmkSecretConfig;

  /// Specifies configuration information for a customer-managed Secrets Manager
  /// secret where the password for an FSx for ONTAP storage location (using SMB)
  /// is stored in plain text, in Secrets Manager. This configuration includes the
  /// secret ARN, and the ARN for an IAM role that provides access to the secret.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/location-credentials.html#custom-secret-custom-key">
  /// Using a secret that you manage</a>.
  /// <note>
  /// You can use either <code>CmkSecretConfig</code> (with <code>Password</code>)
  /// or <code>CustomSecretConfig</code> (without <code>Password</code>) to
  /// provide credentials for a <code>CreateLocationFsxOntap</code> request. Do
  /// not provide both parameters for the same request.
  /// </note>
  final CustomSecretConfig? customSecretConfig;

  /// Specifies the name of the Windows domain that your storage virtual machine
  /// (SVM) belongs to.
  ///
  /// If you have multiple domains in your environment, configuring this setting
  /// makes sure that DataSync connects to the right SVM.
  ///
  /// If you have multiple Active Directory domains in your environment,
  /// configuring this parameter makes sure that DataSync connects to the right
  /// SVM.
  final String? domain;

  /// Describes configuration information for a DataSync-managed secret, such as a
  /// <code>Password</code> that DataSync uses to access a specific storage
  /// location. DataSync uses the default Amazon Web Services-managed KMS key to
  /// encrypt this secret in Secrets Manager.
  /// <note>
  /// Do not provide this for a <code>CreateLocation</code> request.
  /// <code>ManagedSecretConfig</code> is a ReadOnly property and is only be
  /// populated in the <code>DescribeLocation</code> response.
  /// </note>
  final ManagedSecretConfig? managedSecretConfig;
  final SmbMountOptions? mountOptions;

  /// Specifies the password of a user who has permission to access your SVM.
  final String? password;

  FsxProtocolSmb({
    required this.user,
    this.cmkSecretConfig,
    this.customSecretConfig,
    this.domain,
    this.managedSecretConfig,
    this.mountOptions,
    this.password,
  });

  factory FsxProtocolSmb.fromJson(Map<String, dynamic> json) {
    return FsxProtocolSmb(
      user: (json['User'] as String?) ?? '',
      cmkSecretConfig: json['CmkSecretConfig'] != null
          ? CmkSecretConfig.fromJson(
              json['CmkSecretConfig'] as Map<String, dynamic>)
          : null,
      customSecretConfig: json['CustomSecretConfig'] != null
          ? CustomSecretConfig.fromJson(
              json['CustomSecretConfig'] as Map<String, dynamic>)
          : null,
      domain: json['Domain'] as String?,
      managedSecretConfig: json['ManagedSecretConfig'] != null
          ? ManagedSecretConfig.fromJson(
              json['ManagedSecretConfig'] as Map<String, dynamic>)
          : null,
      mountOptions: json['MountOptions'] != null
          ? SmbMountOptions.fromJson(
              json['MountOptions'] as Map<String, dynamic>)
          : null,
      password: json['Password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    final cmkSecretConfig = this.cmkSecretConfig;
    final customSecretConfig = this.customSecretConfig;
    final domain = this.domain;
    final managedSecretConfig = this.managedSecretConfig;
    final mountOptions = this.mountOptions;
    final password = this.password;
    return {
      'User': user,
      if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
      if (customSecretConfig != null) 'CustomSecretConfig': customSecretConfig,
      if (domain != null) 'Domain': domain,
      if (managedSecretConfig != null)
        'ManagedSecretConfig': managedSecretConfig,
      if (mountOptions != null) 'MountOptions': mountOptions,
      if (password != null) 'Password': password,
    };
  }
}

/// Specifies configuration information for a DataSync-managed secret, such as
/// an authentication token or set of credentials that DataSync uses to access a
/// specific transfer location. DataSync uses the default Amazon Web
/// Services-managed KMS key to encrypt this secret in Secrets Manager.
///
/// @nodoc
class ManagedSecretConfig {
  /// Specifies the ARN for an Secrets Manager secret.
  final String? secretArn;

  ManagedSecretConfig({
    this.secretArn,
  });

  factory ManagedSecretConfig.fromJson(Map<String, dynamic> json) {
    return ManagedSecretConfig(
      secretArn: json['SecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    return {
      if (secretArn != null) 'SecretArn': secretArn,
    };
  }
}

/// Specifies the data transfer protocol that DataSync uses to access your
/// Amazon FSx file system.
/// <note>
/// You can't update the Network File System (NFS) protocol configuration for
/// FSx for ONTAP locations. DataSync currently only supports NFS version 3 with
/// this location type.
/// </note>
///
/// @nodoc
class FsxUpdateProtocol {
  final FsxProtocolNfs? nfs;

  /// Specifies the Server Message Block (SMB) protocol configuration that
  /// DataSync uses to access your FSx for ONTAP file system's storage virtual
  /// machine (SVM).
  final FsxUpdateProtocolSmb? smb;

  FsxUpdateProtocol({
    this.nfs,
    this.smb,
  });

  Map<String, dynamic> toJson() {
    final nfs = this.nfs;
    final smb = this.smb;
    return {
      if (nfs != null) 'NFS': nfs,
      if (smb != null) 'SMB': smb,
    };
  }
}

/// Specifies the Server Message Block (SMB) protocol configuration that
/// DataSync uses to access your Amazon FSx for NetApp ONTAP file system's
/// storage virtual machine (SVM). For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-access">Providing
/// DataSync access to FSx for ONTAP file systems</a>.
///
/// @nodoc
class FsxUpdateProtocolSmb {
  /// Specifies configuration information for a DataSync-managed secret, such as a
  /// <code>Password</code> or set of credentials that DataSync uses to access a
  /// specific transfer location, and a customer-managed KMS key.
  final CmkSecretConfig? cmkSecretConfig;

  /// Specifies configuration information for a customer-managed secret, such as a
  /// <code>Password</code> or set of credentials that DataSync uses to access a
  /// specific transfer location. This configuration includes the secret ARN, and
  /// the ARN for an IAM role that provides access to the secret.
  final CustomSecretConfig? customSecretConfig;

  /// Specifies the name of the Windows domain that your storage virtual machine
  /// (SVM) belongs to.
  ///
  /// If you have multiple Active Directory domains in your environment,
  /// configuring this parameter makes sure that DataSync connects to the right
  /// SVM.
  final String? domain;
  final SmbMountOptions? mountOptions;

  /// Specifies the password of a user who has permission to access your SVM.
  final String? password;

  /// Specifies a user that can mount and access the files, folders, and metadata
  /// in your SVM.
  ///
  /// For information about choosing a user with the right level of access for
  /// your transfer, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-smb">Using
  /// the SMB protocol</a>.
  final String? user;

  FsxUpdateProtocolSmb({
    this.cmkSecretConfig,
    this.customSecretConfig,
    this.domain,
    this.mountOptions,
    this.password,
    this.user,
  });

  Map<String, dynamic> toJson() {
    final cmkSecretConfig = this.cmkSecretConfig;
    final customSecretConfig = this.customSecretConfig;
    final domain = this.domain;
    final mountOptions = this.mountOptions;
    final password = this.password;
    final user = this.user;
    return {
      if (cmkSecretConfig != null) 'CmkSecretConfig': cmkSecretConfig,
      if (customSecretConfig != null) 'CustomSecretConfig': customSecretConfig,
      if (domain != null) 'Domain': domain,
      if (mountOptions != null) 'MountOptions': mountOptions,
      if (password != null) 'Password': password,
      if (user != null) 'User': user,
    };
  }
}

/// @nodoc
class EfsInTransitEncryption {
  static const none = EfsInTransitEncryption._('NONE');
  static const tls1_2 = EfsInTransitEncryption._('TLS1_2');

  final String value;

  const EfsInTransitEncryption._(this.value);

  static const values = [none, tls1_2];

  static EfsInTransitEncryption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EfsInTransitEncryption._(value));

  @override
  bool operator ==(other) =>
      other is EfsInTransitEncryption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AzureBlobAuthenticationType {
  static const sas = AzureBlobAuthenticationType._('SAS');
  static const none = AzureBlobAuthenticationType._('NONE');

  final String value;

  const AzureBlobAuthenticationType._(this.value);

  static const values = [sas, none];

  static AzureBlobAuthenticationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AzureBlobAuthenticationType._(value));

  @override
  bool operator ==(other) =>
      other is AzureBlobAuthenticationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The shared access signature (SAS) configuration that allows DataSync to
/// access your Microsoft Azure Blob Storage.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-sas-tokens">SAS
/// tokens</a> for accessing your Azure Blob Storage.
///
/// @nodoc
class AzureBlobSasConfiguration {
  /// Specifies a SAS token that provides permissions to access your Azure Blob
  /// Storage.
  ///
  /// The token is part of the SAS URI string that comes after the storage
  /// resource URI and a question mark. A token looks something like this:
  ///
  /// <code>sp=r&st=2023-12-20T14:54:52Z&se=2023-12-20T22:54:52Z&spr=https&sv=2021-06-08&sr=c&sig=aBBKDWQvyuVcTPH9EBp%2FXTI9E%2F%2Fmq171%2BZU178wcwqU%3D</code>
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

/// @nodoc
class AzureBlobType {
  static const block = AzureBlobType._('BLOCK');

  final String value;

  const AzureBlobType._(this.value);

  static const values = [block];

  static AzureBlobType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AzureBlobType._(value));

  @override
  bool operator ==(other) => other is AzureBlobType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AzureAccessTier {
  static const hot = AzureAccessTier._('HOT');
  static const cool = AzureAccessTier._('COOL');
  static const archive = AzureAccessTier._('ARCHIVE');

  final String value;

  const AzureAccessTier._(this.value);

  static const values = [hot, cool, archive];

  static AzureAccessTier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AzureAccessTier._(value));

  @override
  bool operator ==(other) => other is AzureAccessTier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A key-value pair representing a single tag that's been applied to an Amazon
/// Web Services resource.
///
/// @nodoc
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
      key: (json['Key'] as String?) ?? '',
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

/// Represents a single entry in a list of tasks. <code>TaskListEntry</code>
/// returns an array that contains a list of tasks when the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListTasks.html">ListTasks</a>
/// operation is called. A task includes the source and destination file systems
/// to sync and the options to use for the tasks.
///
/// @nodoc
class TaskListEntry {
  /// The name of the task.
  final String? name;

  /// The status of the task.
  final TaskStatus? status;

  /// The Amazon Resource Name (ARN) of the task.
  final String? taskArn;

  /// The task mode that you're using. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Choosing
  /// a task mode for your data transfer</a>.
  final TaskMode? taskMode;

  TaskListEntry({
    this.name,
    this.status,
    this.taskArn,
    this.taskMode,
  });

  factory TaskListEntry.fromJson(Map<String, dynamic> json) {
    return TaskListEntry(
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.let(TaskStatus.fromString),
      taskArn: json['TaskArn'] as String?,
      taskMode: (json['TaskMode'] as String?)?.let(TaskMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final taskArn = this.taskArn;
    final taskMode = this.taskMode;
    return {
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.value,
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskMode != null) 'TaskMode': taskMode.value,
    };
  }
}

/// @nodoc
class TaskStatus {
  static const available = TaskStatus._('AVAILABLE');
  static const creating = TaskStatus._('CREATING');
  static const queued = TaskStatus._('QUEUED');
  static const running = TaskStatus._('RUNNING');
  static const unavailable = TaskStatus._('UNAVAILABLE');

  final String value;

  const TaskStatus._(this.value);

  static const values = [available, creating, queued, running, unavailable];

  static TaskStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskStatus._(value));

  @override
  bool operator ==(other) => other is TaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TaskMode {
  static const basic = TaskMode._('BASIC');
  static const enhanced = TaskMode._('ENHANCED');

  final String value;

  const TaskMode._(this.value);

  static const values = [basic, enhanced];

  static TaskMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskMode._(value));

  @override
  bool operator ==(other) => other is TaskMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
///
/// @nodoc
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
      'Name': name.value,
      'Operator': operator.value,
      'Values': values,
    };
  }
}

/// @nodoc
class TaskFilterName {
  static const locationId = TaskFilterName._('LocationId');
  static const creationTime = TaskFilterName._('CreationTime');

  final String value;

  const TaskFilterName._(this.value);

  static const values = [locationId, creationTime];

  static TaskFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaskFilterName._(value));

  @override
  bool operator ==(other) => other is TaskFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Operator {
  static const equals = Operator._('Equals');
  static const notEquals = Operator._('NotEquals');
  static const $in = Operator._('In');
  static const lessThanOrEqual = Operator._('LessThanOrEqual');
  static const lessThan = Operator._('LessThan');
  static const greaterThanOrEqual = Operator._('GreaterThanOrEqual');
  static const greaterThan = Operator._('GreaterThan');
  static const contains = Operator._('Contains');
  static const notContains = Operator._('NotContains');
  static const beginsWith = Operator._('BeginsWith');

  final String value;

  const Operator._(this.value);

  static const values = [
    equals,
    notEquals,
    $in,
    lessThanOrEqual,
    lessThan,
    greaterThanOrEqual,
    greaterThan,
    contains,
    notContains,
    beginsWith
  ];

  static Operator fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Operator._(value));

  @override
  bool operator ==(other) => other is Operator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a single entry in a list of DataSync task executions that's
/// returned with the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListTaskExecutions.html">ListTaskExecutions</a>
/// operation.
///
/// @nodoc
class TaskExecutionListEntry {
  /// The status of a task execution. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses">Task
  /// execution statuses</a>.
  final TaskExecutionStatus? status;

  /// The Amazon Resource Name (ARN) of a task execution.
  final String? taskExecutionArn;

  /// The task mode that you're using. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Choosing
  /// a task mode for your data transfer</a>.
  final TaskMode? taskMode;

  TaskExecutionListEntry({
    this.status,
    this.taskExecutionArn,
    this.taskMode,
  });

  factory TaskExecutionListEntry.fromJson(Map<String, dynamic> json) {
    return TaskExecutionListEntry(
      status: (json['Status'] as String?)?.let(TaskExecutionStatus.fromString),
      taskExecutionArn: json['TaskExecutionArn'] as String?,
      taskMode: (json['TaskMode'] as String?)?.let(TaskMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final taskExecutionArn = this.taskExecutionArn;
    final taskMode = this.taskMode;
    return {
      if (status != null) 'Status': status.value,
      if (taskExecutionArn != null) 'TaskExecutionArn': taskExecutionArn,
      if (taskMode != null) 'TaskMode': taskMode.value,
    };
  }
}

/// @nodoc
class TaskExecutionStatus {
  static const queued = TaskExecutionStatus._('QUEUED');
  static const cancelling = TaskExecutionStatus._('CANCELLING');
  static const launching = TaskExecutionStatus._('LAUNCHING');
  static const preparing = TaskExecutionStatus._('PREPARING');
  static const transferring = TaskExecutionStatus._('TRANSFERRING');
  static const verifying = TaskExecutionStatus._('VERIFYING');
  static const success = TaskExecutionStatus._('SUCCESS');
  static const error = TaskExecutionStatus._('ERROR');

  final String value;

  const TaskExecutionStatus._(this.value);

  static const values = [
    queued,
    cancelling,
    launching,
    preparing,
    transferring,
    verifying,
    success,
    error
  ];

  static TaskExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaskExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is TaskExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a single entry in a list of locations.
/// <code>LocationListEntry</code> returns an array that contains a list of
/// locations when the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListLocations.html">ListLocations</a>
/// operation is called.
///
/// @nodoc
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
  /// example for NFS is a valid IPv4 or IPv6 address or a hostname that is
  /// compliant with DNS.
  ///
  /// SUBDIR is a valid file system path, delimited by forward slashes as is the
  /// *nix convention. For NFS and Amazon EFS, it's the export path to mount the
  /// location. For Amazon S3, it's the prefix path that you mount to and treat as
  /// the root of the location.
  ///
  ///
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

/// Narrow down the list of resources returned by <code>ListLocations</code>.
/// For example, to see all your Amazon S3 locations, create a filter using
/// <code>"Name": "LocationType"</code>, <code>"Operator": "Equals"</code>, and
/// <code>"Values": "S3"</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/query-resources.html">filtering
/// resources</a>.
///
/// @nodoc
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
      'Name': name.value,
      'Operator': operator.value,
      'Values': values,
    };
  }
}

/// @nodoc
class LocationFilterName {
  static const locationUri = LocationFilterName._('LocationUri');
  static const locationType = LocationFilterName._('LocationType');
  static const creationTime = LocationFilterName._('CreationTime');

  final String value;

  const LocationFilterName._(this.value);

  static const values = [locationUri, locationType, creationTime];

  static LocationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LocationFilterName._(value));

  @override
  bool operator ==(other) =>
      other is LocationFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a single entry in a list (or array) of DataSync agents when you
/// call the <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/API_ListAgents.html">ListAgents</a>
/// operation.
///
/// @nodoc
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
      status: (json['Status'] as String?)?.let(AgentStatus.fromString),
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
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class AgentStatus {
  static const online = AgentStatus._('ONLINE');
  static const offline = AgentStatus._('OFFLINE');

  final String value;

  const AgentStatus._(this.value);

  static const values = [online, offline];

  static AgentStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AgentStatus._(value));

  @override
  bool operator ==(other) => other is AgentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The platform-related details about the DataSync agent, such as the version
/// number.
///
/// @nodoc
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

/// Provides detailed information about the result of your DataSync task
/// execution.
///
/// @nodoc
class TaskExecutionResultDetail {
  /// An error that DataSync encountered during your task execution. You can use
  /// this information to help <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html">troubleshoot
  /// issues</a>.
  final String? errorCode;

  /// The detailed description of an error that DataSync encountered during your
  /// task execution. You can use this information to help <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/troubleshooting-datasync-locations-tasks.html">troubleshoot
  /// issues</a>.
  final String? errorDetail;

  /// The time in milliseconds that your task execution was in the
  /// <code>PREPARING</code> step. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses">Task
  /// execution statuses</a>.
  ///
  /// For Enhanced mode tasks, the value is always <code>0</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/how-datasync-transfer-works.html#how-datasync-prepares">How
  /// DataSync prepares your data transfer</a>.
  final int? prepareDuration;

  /// The status of the <code>PREPARING</code> step for your task execution. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses">Task
  /// execution statuses</a>.
  final PhaseStatus? prepareStatus;

  /// The time in milliseconds that your task execution ran.
  final int? totalDuration;

  /// The time in milliseconds that your task execution was in the
  /// <code>TRANSFERRING</code> step. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses">Task
  /// execution statuses</a>.
  ///
  /// For Enhanced mode tasks, the value is always <code>0</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/how-datasync-transfer-works.html#how-datasync-transfers">How
  /// DataSync transfers your data</a>.
  final int? transferDuration;

  /// The status of the <code>TRANSFERRING</code> step for your task execution.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses">Task
  /// execution statuses</a>.
  final PhaseStatus? transferStatus;

  /// The time in milliseconds that your task execution was in the
  /// <code>VERIFYING</code> step. For more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses">Task
  /// execution statuses</a>.
  ///
  /// For Enhanced mode tasks, the value is always <code>0</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/how-datasync-transfer-works.html#how-verifying-works">How
  /// DataSync verifies your data's integrity</a>.
  final int? verifyDuration;

  /// The status of the <code>VERIFYING</code> step for your task execution. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/run-task.html#understand-task-execution-statuses">Task
  /// execution statuses</a>.
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
      prepareStatus:
          (json['PrepareStatus'] as String?)?.let(PhaseStatus.fromString),
      totalDuration: json['TotalDuration'] as int?,
      transferDuration: json['TransferDuration'] as int?,
      transferStatus:
          (json['TransferStatus'] as String?)?.let(PhaseStatus.fromString),
      verifyDuration: json['VerifyDuration'] as int?,
      verifyStatus:
          (json['VerifyStatus'] as String?)?.let(PhaseStatus.fromString),
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
      if (prepareStatus != null) 'PrepareStatus': prepareStatus.value,
      if (totalDuration != null) 'TotalDuration': totalDuration,
      if (transferDuration != null) 'TransferDuration': transferDuration,
      if (transferStatus != null) 'TransferStatus': transferStatus.value,
      if (verifyDuration != null) 'VerifyDuration': verifyDuration,
      if (verifyStatus != null) 'VerifyStatus': verifyStatus.value,
    };
  }
}

/// Indicates whether DataSync created a complete <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-reports.html">task
/// report</a> for your transfer.
///
/// @nodoc
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
      status: (json['Status'] as String?)?.let(PhaseStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorDetail = this.errorDetail;
    final status = this.status;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorDetail != null) 'ErrorDetail': errorDetail,
      if (status != null) 'Status': status.value,
    };
  }
}

/// The number of files or objects that DataSync finds at your locations.
/// <note>
/// Applies only to <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
/// mode tasks</a>.
/// </note>
///
/// @nodoc
class TaskExecutionFilesListedDetail {
  /// The number of files or objects that DataSync finds at your destination
  /// location. This counter is only applicable if you <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html#task-option-file-object-handling">configure
  /// your task</a> to delete data in the destination that isn't in the source.
  final int? atDestinationForDelete;

  /// The number of files or objects that DataSync finds at your source location.
  ///
  /// <ul>
  /// <li>
  /// With a <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">manifest</a>,
  /// DataSync lists only what's in your manifest (and not everything at your
  /// source location).
  /// </li>
  /// <li>
  /// With an include <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">filter</a>,
  /// DataSync lists only what matches the filter at your source location.
  /// </li>
  /// <li>
  /// With an exclude filter, DataSync lists everything at your source location
  /// before applying the filter.
  /// </li>
  /// </ul>
  final int? atSource;

  TaskExecutionFilesListedDetail({
    this.atDestinationForDelete,
    this.atSource,
  });

  factory TaskExecutionFilesListedDetail.fromJson(Map<String, dynamic> json) {
    return TaskExecutionFilesListedDetail(
      atDestinationForDelete: json['AtDestinationForDelete'] as int?,
      atSource: json['AtSource'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final atDestinationForDelete = this.atDestinationForDelete;
    final atSource = this.atSource;
    return {
      if (atDestinationForDelete != null)
        'AtDestinationForDelete': atDestinationForDelete,
      if (atSource != null) 'AtSource': atSource,
    };
  }
}

/// The number of files or objects that DataSync fails to prepare, transfer,
/// verify, and delete during your task execution.
/// <note>
/// Applies only to <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
/// mode tasks</a>.
/// </note>
///
/// @nodoc
class TaskExecutionFilesFailedDetail {
  /// The number of files or objects that DataSync fails to delete during your
  /// task execution.
  final int? delete;

  /// The number of files or objects that DataSync fails to prepare during your
  /// task execution.
  final int? prepare;

  /// The number of files or objects that DataSync fails to transfer during your
  /// task execution.
  final int? transfer;

  /// The number of files or objects that DataSync fails to verify during your
  /// task execution.
  final int? verify;

  TaskExecutionFilesFailedDetail({
    this.delete,
    this.prepare,
    this.transfer,
    this.verify,
  });

  factory TaskExecutionFilesFailedDetail.fromJson(Map<String, dynamic> json) {
    return TaskExecutionFilesFailedDetail(
      delete: json['Delete'] as int?,
      prepare: json['Prepare'] as int?,
      transfer: json['Transfer'] as int?,
      verify: json['Verify'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final delete = this.delete;
    final prepare = this.prepare;
    final transfer = this.transfer;
    final verify = this.verify;
    return {
      if (delete != null) 'Delete': delete,
      if (prepare != null) 'Prepare': prepare,
      if (transfer != null) 'Transfer': transfer,
      if (verify != null) 'Verify': verify,
    };
  }
}

/// The number of directories that DataSync finds at your locations.
/// <note>
/// Applies only to <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
/// mode tasks</a>.
/// </note>
///
/// @nodoc
class TaskExecutionFoldersListedDetail {
  /// The number of directories that DataSync finds at your destination location.
  /// This counter is only applicable if you <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/configure-metadata.html#task-option-file-object-handling">configure
  /// your task</a> to delete data in the destination that isn't in the source.
  final int? atDestinationForDelete;

  /// The number of directories that DataSync finds at your source location.
  ///
  /// <ul>
  /// <li>
  /// With a <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/transferring-with-manifest.html">manifest</a>,
  /// DataSync lists only what's in your manifest (and not everything at your
  /// source location).
  /// </li>
  /// <li>
  /// With an include <a
  /// href="https://docs.aws.amazon.com/datasync/latest/userguide/filtering.html">filter</a>,
  /// DataSync lists only what matches the filter at your source location.
  /// </li>
  /// <li>
  /// With an exclude filter, DataSync lists everything at your source location
  /// before applying the filter.
  /// </li>
  /// </ul>
  final int? atSource;

  TaskExecutionFoldersListedDetail({
    this.atDestinationForDelete,
    this.atSource,
  });

  factory TaskExecutionFoldersListedDetail.fromJson(Map<String, dynamic> json) {
    return TaskExecutionFoldersListedDetail(
      atDestinationForDelete: json['AtDestinationForDelete'] as int?,
      atSource: json['AtSource'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final atDestinationForDelete = this.atDestinationForDelete;
    final atSource = this.atSource;
    return {
      if (atDestinationForDelete != null)
        'AtDestinationForDelete': atDestinationForDelete,
      if (atSource != null) 'AtSource': atSource,
    };
  }
}

/// The number of directories that DataSync fails to list, prepare, transfer,
/// verify, and delete during your task execution.
/// <note>
/// Applies only to <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html">Enhanced
/// mode tasks</a>.
/// </note>
///
/// @nodoc
class TaskExecutionFoldersFailedDetail {
  /// The number of directories that DataSync fails to delete during your task
  /// execution.
  final int? delete;

  /// The number of directories that DataSync fails to list during your task
  /// execution.
  final int? list;

  /// The number of directories that DataSync fails to prepare during your task
  /// execution.
  final int? prepare;

  /// The number of directories that DataSync fails to transfer during your task
  /// execution.
  final int? transfer;

  /// The number of directories that DataSync fails to verify during your task
  /// execution.
  final int? verify;

  TaskExecutionFoldersFailedDetail({
    this.delete,
    this.list,
    this.prepare,
    this.transfer,
    this.verify,
  });

  factory TaskExecutionFoldersFailedDetail.fromJson(Map<String, dynamic> json) {
    return TaskExecutionFoldersFailedDetail(
      delete: json['Delete'] as int?,
      list: json['List'] as int?,
      prepare: json['Prepare'] as int?,
      transfer: json['Transfer'] as int?,
      verify: json['Verify'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final delete = this.delete;
    final list = this.list;
    final prepare = this.prepare;
    final transfer = this.transfer;
    final verify = this.verify;
    return {
      if (delete != null) 'Delete': delete,
      if (list != null) 'List': list,
      if (prepare != null) 'Prepare': prepare,
      if (transfer != null) 'Transfer': transfer,
      if (verify != null) 'Verify': verify,
    };
  }
}

/// @nodoc
class PhaseStatus {
  static const pending = PhaseStatus._('PENDING');
  static const success = PhaseStatus._('SUCCESS');
  static const error = PhaseStatus._('ERROR');

  final String value;

  const PhaseStatus._(this.value);

  static const values = [pending, success, error];

  static PhaseStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PhaseStatus._(value));

  @override
  bool operator ==(other) => other is PhaseStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information about your DataSync <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/task-scheduling.html">task
/// schedule</a>.
///
/// @nodoc
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
      disabledBy:
          (json['DisabledBy'] as String?)?.let(ScheduleDisabledBy.fromString),
      disabledReason: json['DisabledReason'] as String?,
      statusUpdateTime: timeStampFromJson(json['StatusUpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final disabledBy = this.disabledBy;
    final disabledReason = this.disabledReason;
    final statusUpdateTime = this.statusUpdateTime;
    return {
      if (disabledBy != null) 'DisabledBy': disabledBy.value,
      if (disabledReason != null) 'DisabledReason': disabledReason,
      if (statusUpdateTime != null)
        'StatusUpdateTime': unixTimestampToJson(statusUpdateTime),
    };
  }
}

/// @nodoc
class ScheduleDisabledBy {
  static const user = ScheduleDisabledBy._('USER');
  static const service = ScheduleDisabledBy._('SERVICE');

  final String value;

  const ScheduleDisabledBy._(this.value);

  static const values = [user, service];

  static ScheduleDisabledBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduleDisabledBy._(value));

  @override
  bool operator ==(other) =>
      other is ScheduleDisabledBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The subnet and security groups that DataSync uses to connect to one of your
/// Amazon EFS file system's <a
/// href="https://docs.aws.amazon.com/efs/latest/ug/accessing-fs.html">mount
/// targets</a>.
///
/// @nodoc
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
      securityGroupArns: ((json['SecurityGroupArns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnetArn: (json['SubnetArn'] as String?) ?? '',
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

/// @nodoc
class EndpointType {
  static const public = EndpointType._('PUBLIC');
  static const privateLink = EndpointType._('PRIVATE_LINK');
  static const fips = EndpointType._('FIPS');
  static const fipsPrivateLink = EndpointType._('FIPS_PRIVATE_LINK');

  final String value;

  const EndpointType._(this.value);

  static const values = [public, privateLink, fips, fipsPrivateLink];

  static EndpointType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EndpointType._(value));

  @override
  bool operator ==(other) => other is EndpointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies how your DataSync agent connects to Amazon Web Services using a <a
/// href="https://docs.aws.amazon.com/datasync/latest/userguide/choose-service-endpoint.html#choose-service-endpoint-vpc">virtual
/// private cloud (VPC) service endpoint</a>. An agent that uses a VPC endpoint
/// isn't accessible over the public internet.
///
/// @nodoc
class PrivateLinkConfig {
  /// Specifies the VPC endpoint provided by <a
  /// href="https://docs.aws.amazon.com/vpc/latest/privatelink/privatelink-share-your-services.html">Amazon
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetArns: (json['SubnetArns'] as List?)
          ?.nonNulls
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

/// @nodoc
class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

/// @nodoc
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
