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

import 'v2018_11_05.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Transfer Family is a fully managed service that enables the transfer of
/// files over the File Transfer Protocol (FTP), File Transfer Protocol over SSL
/// (FTPS), or Secure Shell (SSH) File Transfer Protocol (SFTP) directly into
/// and out of Amazon Simple Storage Service (Amazon S3) or Amazon EFS.
/// Additionally, you can use Applicability Statement 2 (AS2) to transfer files
/// into and out of Amazon S3. Amazon Web Services helps you seamlessly migrate
/// your file transfer workflows to Transfer Family by integrating with existing
/// authentication systems, and providing DNS routing with Amazon Route 53 so
/// nothing changes for your customers and partners, or their applications. With
/// your data in Amazon S3, you can use it with Amazon Web Services services for
/// processing, analytics, machine learning, and archiving. Getting started with
/// Transfer Family is easy since there is no infrastructure to buy and set up.
class Transfer {
  final _s.JsonProtocol _protocol;
  factory Transfer({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'transfer',
    );
    return Transfer._(
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
  Transfer._({
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

  /// Used by administrators to choose which groups in the directory should have
  /// access to upload and download files over the enabled protocols using
  /// Transfer Family. For example, a Microsoft Active Directory might contain
  /// 50,000 users, but only a small fraction might need the ability to transfer
  /// files to the server. An administrator can use <code>CreateAccess</code> to
  /// limit the access to the correct set of users who need this ability.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [externalId] :
  /// A unique identifier that is required to identify specific groups within
  /// your directory. The users of the group that you associate have access to
  /// your Amazon S3 or Amazon EFS resources over the enabled protocols using
  /// Transfer Family. If you know the group name, you can view the SID values
  /// by running the following command using Windows PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regular expression used to validate this parameter is a string of
  /// characters consisting of uppercase and lowercase alphanumeric characters
  /// with no spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that controls your users' access to your Amazon S3 bucket or Amazon
  /// EFS file system. The policies attached to this role determine the level of
  /// access that you want to provide your users when transferring files into
  /// and out of your Amazon S3 bucket or Amazon EFS file system. The IAM role
  /// should also contain a trust relationship that allows the server to access
  /// your resources when servicing your users' transfer requests.
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance. This is the
  /// specific server that you added your user to.
  ///
  /// Parameter [homeDirectory] :
  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  /// <note>
  /// You can use the <code>HomeDirectory</code> parameter for
  /// <code>HomeDirectoryType</code> when it is set to either <code>PATH</code>
  /// or <code>LOGICAL</code>.
  /// </note>
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you
  /// only specify a target, it is displayed as is. You also must ensure that
  /// your Identity and Access Management (IAM) role provides access to paths in
  /// <code>Target</code>. This value can be set only when
  /// <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example.
  ///
  /// <code>\[ { "Entry": "/directory1", "Target":
  /// "/bucket_name/home/mydirectory" } \]</code>
  ///
  /// In most cases, you can use this value instead of the session policy to
  /// lock down your user to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to
  /// <code>/</code> and set <code>Target</code> to the
  /// <code>HomeDirectory</code> parameter value.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example for <code>chroot</code>.
  ///
  /// <code>\[ { "Entry": "/", "Target": "/bucket_name/home/mydirectory" }
  /// \]</code>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) that you want your users' home
  /// directory to be when they log in to the server. If you set it to
  /// <code>PATH</code>, the user will see the absolute Amazon S3 bucket or
  /// Amazon EFS path as is in their file transfer protocol clients. If you set
  /// it to <code>LOGICAL</code>, you need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// Amazon EFS paths visible to your users.
  /// <note>
  /// If <code>HomeDirectoryType</code> is <code>LOGICAL</code>, you must
  /// provide mappings, using the <code>HomeDirectoryMappings</code> parameter.
  /// If, on the other hand, <code>HomeDirectoryType</code> is
  /// <code>PATH</code>, you provide an absolute path using the
  /// <code>HomeDirectory</code> parameter. You cannot have both
  /// <code>HomeDirectory</code> and <code>HomeDirectoryMappings</code> in your
  /// template.
  /// </note>
  ///
  /// Parameter [policy] :
  /// A session policy for your user so that you can use the same Identity and
  /// Access Management (IAM) role across multiple users. This policy scopes
  /// down a user's access to portions of their Amazon S3 bucket. Variables that
  /// you can use inside this policy include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// This policy applies only when the domain of <code>ServerId</code> is
  /// Amazon S3. Amazon EFS does not use session policies.
  ///
  /// For session policies, Transfer Family stores the policy as a JSON blob,
  /// instead of the Amazon Resource Name (ARN) of the policy. You save the
  /// policy as a JSON blob and pass it in the <code>Policy</code> argument.
  ///
  /// For an example of a session policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/session-policy.html">Example
  /// session policy</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a>
  /// in the <i>Security Token Service API Reference</i>.
  /// </note>
  Future<CreateAccessResponse> createAccess({
    required String externalId,
    required String role,
    required String serverId,
    String? homeDirectory,
    List<HomeDirectoryMapEntry>? homeDirectoryMappings,
    HomeDirectoryType? homeDirectoryType,
    String? policy,
    PosixProfile? posixProfile,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.CreateAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExternalId': externalId,
        'Role': role,
        'ServerId': serverId,
        if (homeDirectory != null) 'HomeDirectory': homeDirectory,
        if (homeDirectoryMappings != null)
          'HomeDirectoryMappings': homeDirectoryMappings,
        if (homeDirectoryType != null)
          'HomeDirectoryType': homeDirectoryType.value,
        if (policy != null) 'Policy': policy,
        if (posixProfile != null) 'PosixProfile': posixProfile,
      },
    );

    return CreateAccessResponse.fromJson(jsonResponse.body);
  }

  /// Allows you to delete the access specified in the <code>ServerID</code> and
  /// <code>ExternalID</code> parameters.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [externalId] :
  /// A unique identifier that is required to identify specific groups within
  /// your directory. The users of the group that you associate have access to
  /// your Amazon S3 or Amazon EFS resources over the enabled protocols using
  /// Transfer Family. If you know the group name, you can view the SID values
  /// by running the following command using Windows PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regular expression used to validate this parameter is a string of
  /// characters consisting of uppercase and lowercase alphanumeric characters
  /// with no spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that has this user
  /// assigned.
  Future<void> deleteAccess({
    required String externalId,
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteAccess'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExternalId': externalId,
        'ServerId': serverId,
      },
    );
  }

  /// Deletes the host key that's specified in the <code>HostKeyId</code>
  /// parameter.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [hostKeyId] :
  /// The identifier of the host key that you are deleting.
  ///
  /// Parameter [serverId] :
  /// The identifier of the server that contains the host key that you are
  /// deleting.
  Future<void> deleteHostKey({
    required String hostKeyId,
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteHostKey'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HostKeyId': hostKeyId,
        'ServerId': serverId,
      },
    );
  }

  /// Deletes a user's Secure Shell (SSH) public key.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a file transfer protocol-enabled
  /// server instance that has the user assigned to it.
  ///
  /// Parameter [sshPublicKeyId] :
  /// A unique identifier used to reference your user's specific SSH key.
  ///
  /// Parameter [userName] :
  /// A unique string that identifies a user whose public key is being deleted.
  Future<void> deleteSshPublicKey({
    required String serverId,
    required String sshPublicKeyId,
    required String userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteSshPublicKey'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        'SshPublicKeyId': sshPublicKeyId,
        'UserName': userName,
      },
    );
  }

  /// Describes the access that is assigned to the specific file transfer
  /// protocol-enabled server, as identified by its <code>ServerId</code>
  /// property and its <code>ExternalId</code>.
  ///
  /// The response from this call returns the properties of the access that is
  /// associated with the <code>ServerId</code> value that was specified.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [externalId] :
  /// A unique identifier that is required to identify specific groups within
  /// your directory. The users of the group that you associate have access to
  /// your Amazon S3 or Amazon EFS resources over the enabled protocols using
  /// Transfer Family. If you know the group name, you can view the SID values
  /// by running the following command using Windows PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regular expression used to validate this parameter is a string of
  /// characters consisting of uppercase and lowercase alphanumeric characters
  /// with no spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that has this access
  /// assigned.
  Future<DescribeAccessResponse> describeAccess({
    required String externalId,
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExternalId': externalId,
        'ServerId': serverId,
      },
    );

    return DescribeAccessResponse.fromJson(jsonResponse.body);
  }

  /// You can use <code>DescribeExecution</code> to check the details of the
  /// execution of the specified workflow.
  /// <note>
  /// This API call only returns details for in-progress workflows.
  ///
  /// If you provide an ID for an execution that is not in progress, or if the
  /// execution doesn't match the specified workflow ID, you receive a
  /// <code>ResourceNotFound</code> exception.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [executionId] :
  /// A unique identifier for the execution of a workflow.
  ///
  /// Parameter [workflowId] :
  /// A unique identifier for the workflow.
  Future<DescribeExecutionResponse> describeExecution({
    required String executionId,
    required String workflowId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExecutionId': executionId,
        'WorkflowId': workflowId,
      },
    );

    return DescribeExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Returns the details of the host key that's specified by the
  /// <code>HostKeyId</code> and <code>ServerId</code>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [hostKeyId] :
  /// The identifier of the host key that you want described.
  ///
  /// Parameter [serverId] :
  /// The identifier of the server that contains the host key that you want
  /// described.
  Future<DescribeHostKeyResponse> describeHostKey({
    required String hostKeyId,
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeHostKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HostKeyId': hostKeyId,
        'ServerId': serverId,
      },
    );

    return DescribeHostKeyResponse.fromJson(jsonResponse.body);
  }

  /// Describes the security policy that is attached to your server or SFTP
  /// connector. The response contains a description of the security policy's
  /// properties. For more information about security policies, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html">Working
  /// with security policies for servers</a> or <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/security-policies-connectors.html">Working
  /// with security policies for SFTP connectors</a>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [securityPolicyName] :
  /// Specify the text name of the security policy for which you want the
  /// details.
  Future<DescribeSecurityPolicyResponse> describeSecurityPolicy({
    required String securityPolicyName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeSecurityPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecurityPolicyName': securityPolicyName,
      },
    );

    return DescribeSecurityPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Adds a host key to the server that's specified by the
  /// <code>ServerId</code> parameter.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [hostKeyBody] :
  /// The private key portion of an SSH key pair.
  ///
  /// Transfer Family accepts RSA, ECDSA, and ED25519 keys.
  ///
  /// Parameter [serverId] :
  /// The identifier of the server that contains the host key that you are
  /// importing.
  ///
  /// Parameter [description] :
  /// The text description that identifies this host key.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for host keys.
  Future<ImportHostKeyResponse> importHostKey({
    required String hostKeyBody,
    required String serverId,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ImportHostKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HostKeyBody': hostKeyBody,
        'ServerId': serverId,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportHostKeyResponse.fromJson(jsonResponse.body);
  }

  /// Adds a Secure Shell (SSH) public key to a Transfer Family user identified
  /// by a <code>UserName</code> value assigned to the specific file transfer
  /// protocol-enabled server, identified by <code>ServerId</code>.
  ///
  /// The response returns the <code>UserName</code> value, the
  /// <code>ServerId</code> value, and the name of the
  /// <code>SshPublicKeyId</code>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server.
  ///
  /// Parameter [sshPublicKeyBody] :
  /// The public key portion of an SSH key pair.
  ///
  /// Transfer Family accepts RSA, ECDSA, and ED25519 keys.
  ///
  /// Parameter [userName] :
  /// The name of the Transfer Family user that is assigned to one or more
  /// servers.
  Future<ImportSshPublicKeyResponse> importSshPublicKey({
    required String serverId,
    required String sshPublicKeyBody,
    required String userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ImportSshPublicKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        'SshPublicKeyBody': sshPublicKeyBody,
        'UserName': userName,
      },
    );

    return ImportSshPublicKeyResponse.fromJson(jsonResponse.body);
  }

  /// Lists the details for all the accesses you have on your server.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that has users assigned
  /// to it.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// When you can get additional results from the <code>ListAccesses</code>
  /// call, a <code>NextToken</code> parameter is returned in the output. You
  /// can then pass in a subsequent command to the <code>NextToken</code>
  /// parameter to continue listing additional accesses.
  Future<ListAccessesResponse> listAccesses({
    required String serverId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListAccesses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAccessesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all in-progress executions for the specified workflow.
  /// <note>
  /// If the specified workflow ID cannot be found, <code>ListExecutions</code>
  /// returns a <code>ResourceNotFound</code> exception.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [workflowId] :
  /// A unique identifier for the workflow.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// <code>ListExecutions</code> returns the <code>NextToken</code> parameter
  /// in the output. You can then pass the <code>NextToken</code> parameter in a
  /// subsequent command to continue listing additional executions.
  ///
  /// This is useful for pagination, for instance. If you have 100 executions
  /// for a workflow, you might only want to list first 10. If so, call the API
  /// by specifying the <code>max-results</code>:
  ///
  /// <code>aws transfer list-executions --max-results 10</code>
  ///
  /// This returns details for the first 10 executions, as well as the pointer
  /// (<code>NextToken</code>) to the eleventh execution. You can now call the
  /// API again, supplying the <code>NextToken</code> value you received:
  ///
  /// <code>aws transfer list-executions --max-results 10 --next-token
  /// $somePointerReturnedFromPreviousListResult</code>
  ///
  /// This call returns the next 10 executions, the 11th through the 20th. You
  /// can then repeat the call until the details for all 100 executions have
  /// been returned.
  Future<ListExecutionsResponse> listExecutions({
    required String workflowId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkflowId': workflowId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListExecutionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns real-time updates and detailed information on the status of each
  /// individual file being transferred in a specific file transfer operation.
  /// You specify the file transfer by providing its <code>ConnectorId</code>
  /// and its <code>TransferId</code>.
  /// <note>
  /// File transfer results are available up to 7 days after an operation has
  /// been requested.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [connectorId] :
  /// A unique identifier for a connector. This value should match the value
  /// supplied to the corresponding <code>StartFileTransfer</code> call.
  ///
  /// Parameter [transferId] :
  /// A unique identifier for a file transfer. This value should match the value
  /// supplied to the corresponding <code>StartFileTransfer</code> call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of files to return in a single page. Note that
  /// currently you can specify a maximum of 10 file paths in a single <a
  /// href="https://docs.aws.amazon.com/transfer/latest/APIReference/API_StartFileTransfer.html">StartFileTransfer</a>
  /// operation. Thus, the maximum number of file transfer results that can be
  /// returned in a single page is 10.
  ///
  /// Parameter [nextToken] :
  /// If there are more file details than returned in this call, use this value
  /// for a subsequent call to <code>ListFileTransferResults</code> to retrieve
  /// them.
  Future<ListFileTransferResultsResponse> listFileTransferResults({
    required String connectorId,
    required String transferId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListFileTransferResults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectorId': connectorId,
        'TransferId': transferId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFileTransferResultsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of host keys for the server that's specified by the
  /// <code>ServerId</code> parameter.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [serverId] :
  /// The identifier of the server that contains the host keys that you want to
  /// view.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// When there are additional results that were not returned, a
  /// <code>NextToken</code> parameter is returned. You can use that value for a
  /// subsequent call to <code>ListHostKeys</code> to continue listing results.
  Future<ListHostKeysResponse> listHostKeys({
    required String serverId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListHostKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListHostKeysResponse.fromJson(jsonResponse.body);
  }

  /// Lists the security policies that are attached to your servers and SFTP
  /// connectors. For more information about security policies, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html">Working
  /// with security policies for servers</a> or <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/security-policies-connectors.html">Working
  /// with security policies for SFTP connectors</a>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of security policies to return as a response to the
  /// <code>ListSecurityPolicies</code> query.
  ///
  /// Parameter [nextToken] :
  /// When additional results are obtained from the
  /// <code>ListSecurityPolicies</code> command, a <code>NextToken</code>
  /// parameter is returned in the output. You can then pass the
  /// <code>NextToken</code> parameter in a subsequent command to continue
  /// listing additional security policies.
  Future<ListSecurityPoliciesResponse> listSecurityPolicies({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListSecurityPolicies'
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

    return ListSecurityPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all of the tags associated with the Amazon Resource Name (ARN) that
  /// you specify. The resource can be a user, server, or role.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  /// Requests the tags associated with a particular Amazon Resource Name (ARN).
  /// An ARN is an identifier for a specific Amazon Web Services resource, such
  /// as a server, user, or role.
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of tags to return as a response to the
  /// <code>ListTagsForResource</code> request.
  ///
  /// Parameter [nextToken] :
  /// When you request additional results from the
  /// <code>ListTagsForResource</code> operation, a <code>NextToken</code>
  /// parameter is returned in the input. You can then pass in a subsequent
  /// command to the <code>NextToken</code> parameter to continue listing
  /// additional tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Sends a callback for asynchronous custom steps.
  ///
  /// The <code>ExecutionId</code>, <code>WorkflowId</code>, and
  /// <code>Token</code> are passed to the target resource during execution of a
  /// custom step of a workflow. You must include those with their callback as
  /// well as providing a status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [executionId] :
  /// A unique identifier for the execution of a workflow.
  ///
  /// Parameter [status] :
  /// Indicates whether the specified step succeeded or failed.
  ///
  /// Parameter [token] :
  /// Used to distinguish between multiple callbacks for multiple Lambda steps
  /// within the same execution.
  ///
  /// Parameter [workflowId] :
  /// A unique identifier for the workflow.
  Future<void> sendWorkflowStepState({
    required String executionId,
    required CustomStepStatus status,
    required String token,
    required String workflowId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.SendWorkflowStepState'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExecutionId': executionId,
        'Status': status.value,
        'Token': token,
        'WorkflowId': workflowId,
      },
    );
  }

  /// Retrieves a list of the contents of a directory from a remote SFTP server.
  /// You specify the connector ID, the output path, and the remote directory
  /// path. You can also specify the optional <code>MaxItems</code> value to
  /// control the maximum number of items that are listed from the remote
  /// directory. This API returns a list of all files and directories in the
  /// remote directory (up to the maximum value), but does not return files or
  /// folders in sub-directories. That is, it only returns a list of files and
  /// directories one-level deep.
  ///
  /// After you receive the listing file, you can provide the files that you
  /// want to transfer to the <code>RetrieveFilePaths</code> parameter of the
  /// <code>StartFileTransfer</code> API call.
  ///
  /// The naming convention for the output file is <code>
  /// <i>connector-ID</i>-<i>listing-ID</i>.json</code>. The output file
  /// contains the following information:
  ///
  /// <ul>
  /// <li>
  /// <code>filePath</code>: the complete path of a remote file, relative to the
  /// directory of the listing request for your SFTP connector on the remote
  /// server.
  /// </li>
  /// <li>
  /// <code>modifiedTimestamp</code>: the last time the file was modified, in
  /// UTC time format. This field is optional. If the remote file attributes
  /// don't contain a timestamp, it is omitted from the file listing.
  /// </li>
  /// <li>
  /// <code>size</code>: the size of the file, in bytes. This field is optional.
  /// If the remote file attributes don't contain a file size, it is omitted
  /// from the file listing.
  /// </li>
  /// <li>
  /// <code>path</code>: the complete path of a remote directory, relative to
  /// the directory of the listing request for your SFTP connector on the remote
  /// server.
  /// </li>
  /// <li>
  /// <code>truncated</code>: a flag indicating whether the list output contains
  /// all of the items contained in the remote directory or not. If your
  /// <code>Truncated</code> output value is true, you can increase the value
  /// provided in the optional <code>max-items</code> input attribute to be able
  /// to list more items (up to the maximum allowed list size of 200,000 items).
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [connectorId] :
  /// The unique identifier for the connector.
  ///
  /// Parameter [outputDirectoryPath] :
  /// Specifies the path (bucket and prefix) in Amazon S3 storage to store the
  /// results of the directory listing.
  ///
  /// Parameter [remoteDirectoryPath] :
  /// Specifies the directory on the remote SFTP server for which you want to
  /// list its contents.
  ///
  /// Parameter [maxItems] :
  /// An optional parameter where you can specify the maximum number of
  /// file/directory names to retrieve. The default value is 1,000.
  Future<StartDirectoryListingResponse> startDirectoryListing({
    required String connectorId,
    required String outputDirectoryPath,
    required String remoteDirectoryPath,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.StartDirectoryListing'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectorId': connectorId,
        'OutputDirectoryPath': outputDirectoryPath,
        'RemoteDirectoryPath': remoteDirectoryPath,
        if (maxItems != null) 'MaxItems': maxItems,
      },
    );

    return StartDirectoryListingResponse.fromJson(jsonResponse.body);
  }

  /// Begins a file transfer between local Amazon Web Services storage and a
  /// remote AS2 or SFTP server.
  ///
  /// <ul>
  /// <li>
  /// For an AS2 connector, you specify the <code>ConnectorId</code> and one or
  /// more <code>SendFilePaths</code> to identify the files you want to
  /// transfer.
  /// </li>
  /// <li>
  /// For an SFTP connector, the file transfer can be either outbound or
  /// inbound. In both cases, you specify the <code>ConnectorId</code>.
  /// Depending on the direction of the transfer, you also specify the following
  /// items:
  ///
  /// <ul>
  /// <li>
  /// If you are transferring file from a partner's SFTP server to Amazon Web
  /// Services storage, you specify one or more <code>RetrieveFilePaths</code>
  /// to identify the files you want to transfer, and a
  /// <code>LocalDirectoryPath</code> to specify the destination folder.
  /// </li>
  /// <li>
  /// If you are transferring file to a partner's SFTP server from Amazon Web
  /// Services storage, you specify one or more <code>SendFilePaths</code> to
  /// identify the files you want to transfer, and a
  /// <code>RemoteDirectoryPath</code> to specify the destination folder.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [connectorId] :
  /// The unique identifier for the connector.
  ///
  /// Parameter [customHttpHeaders] :
  /// An array of key-value pairs that represent custom HTTP headers to include
  /// in AS2 messages. These headers are added to the AS2 message when sending
  /// files to your trading partner.
  ///
  /// Parameter [localDirectoryPath] :
  /// For an inbound transfer, the <code>LocaDirectoryPath</code> specifies the
  /// destination for one or more files that are transferred from the partner's
  /// SFTP server.
  ///
  /// Parameter [remoteDirectoryPath] :
  /// For an outbound transfer, the <code>RemoteDirectoryPath</code> specifies
  /// the destination for one or more files that are transferred to the
  /// partner's SFTP server. If you don't specify a
  /// <code>RemoteDirectoryPath</code>, the destination for transferred files is
  /// the SFTP user's home directory.
  ///
  /// Parameter [retrieveFilePaths] :
  /// One or more source paths for the partner's SFTP server. Each string
  /// represents a source file path for one inbound file transfer.
  ///
  /// Parameter [sendFilePaths] :
  /// One or more source paths for the Amazon S3 storage. Each string represents
  /// a source file path for one outbound file transfer. For example, <code>
  /// <i>amzn-s3-demo-bucket</i>/<i>myfile.txt</i> </code>.
  /// <note>
  /// Replace <code> <i>amzn-s3-demo-bucket</i> </code> with one of your actual
  /// buckets.
  /// </note>
  Future<StartFileTransferResponse> startFileTransfer({
    required String connectorId,
    List<CustomHttpHeader>? customHttpHeaders,
    String? localDirectoryPath,
    String? remoteDirectoryPath,
    List<String>? retrieveFilePaths,
    List<String>? sendFilePaths,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.StartFileTransfer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectorId': connectorId,
        if (customHttpHeaders != null) 'CustomHttpHeaders': customHttpHeaders,
        if (localDirectoryPath != null)
          'LocalDirectoryPath': localDirectoryPath,
        if (remoteDirectoryPath != null)
          'RemoteDirectoryPath': remoteDirectoryPath,
        if (retrieveFilePaths != null) 'RetrieveFilePaths': retrieveFilePaths,
        if (sendFilePaths != null) 'SendFilePaths': sendFilePaths,
      },
    );

    return StartFileTransferResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a file or directory on the remote SFTP server.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [connectorId] :
  /// The unique identifier for the connector.
  ///
  /// Parameter [deletePath] :
  /// The absolute path of the file or directory to delete. You can only specify
  /// one path per call to this operation.
  Future<StartRemoteDeleteResponse> startRemoteDelete({
    required String connectorId,
    required String deletePath,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.StartRemoteDelete'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectorId': connectorId,
        'DeletePath': deletePath,
      },
    );

    return StartRemoteDeleteResponse.fromJson(jsonResponse.body);
  }

  /// Moves or renames a file or directory on the remote SFTP server.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [connectorId] :
  /// The unique identifier for the connector.
  ///
  /// Parameter [sourcePath] :
  /// The absolute path of the file or directory to move or rename. You can only
  /// specify one path per call to this operation.
  ///
  /// Parameter [targetPath] :
  /// The absolute path for the target of the move/rename operation.
  Future<StartRemoteMoveResponse> startRemoteMove({
    required String connectorId,
    required String sourcePath,
    required String targetPath,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.StartRemoteMove'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectorId': connectorId,
        'SourcePath': sourcePath,
        'TargetPath': targetPath,
      },
    );

    return StartRemoteMoveResponse.fromJson(jsonResponse.body);
  }

  /// Changes the state of a file transfer protocol-enabled server from
  /// <code>OFFLINE</code> to <code>ONLINE</code>. It has no impact on a server
  /// that is already <code>ONLINE</code>. An <code>ONLINE</code> server can
  /// accept and process file transfer jobs.
  ///
  /// The state of <code>STARTING</code> indicates that the server is in an
  /// intermediate state, either not fully able to respond, or not fully online.
  /// The values of <code>START_FAILED</code> can indicate an error condition.
  ///
  /// No response is returned from this call.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that you start.
  Future<void> startServer({
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.StartServer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
      },
    );
  }

  /// Changes the state of a file transfer protocol-enabled server from
  /// <code>ONLINE</code> to <code>OFFLINE</code>. An <code>OFFLINE</code>
  /// server cannot accept and process file transfer jobs. Information tied to
  /// your server, such as server and user properties, are not affected by
  /// stopping your server.
  /// <note>
  /// Stopping the server does not reduce or impact your file transfer protocol
  /// endpoint billing; you must delete the server to stop being billed.
  /// </note>
  /// The state of <code>STOPPING</code> indicates that the server is in an
  /// intermediate state, either not fully able to respond, or not fully
  /// offline. The values of <code>STOP_FAILED</code> can indicate an error
  /// condition.
  ///
  /// No response is returned from this call.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that you stopped.
  Future<void> stopServer({
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.StopServer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
      },
    );
  }

  /// Attaches a key-value pair to a resource, as identified by its Amazon
  /// Resource Name (ARN). Resources are users, servers, roles, and other
  /// entities.
  ///
  /// There is no response returned from this call.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  /// An Amazon Resource Name (ARN) for a specific Amazon Web Services resource,
  /// such as a server, user, or role.
  ///
  /// Parameter [tags] :
  /// Key-value pairs assigned to ARNs that you can use to group and search for
  /// resources by type. You can attach this metadata to resources (servers,
  /// users, workflows, and so on) for any purpose.
  Future<void> tagResource({
    required String arn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
        'Tags': tags,
      },
    );
  }

  /// Tests whether your SFTP connector is set up successfully. We highly
  /// recommend that you call this operation to test your ability to transfer
  /// files between local Amazon Web Services storage and a trading partner's
  /// SFTP server.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [connectorId] :
  /// The unique identifier for the connector.
  Future<TestConnectionResponse> testConnection({
    required String connectorId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.TestConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectorId': connectorId,
      },
    );

    return TestConnectionResponse.fromJson(jsonResponse.body);
  }

  /// If the <code>IdentityProviderType</code> of a file transfer
  /// protocol-enabled server is <code>AWS_DIRECTORY_SERVICE</code> or
  /// <code>API_Gateway</code>, tests whether your identity provider is set up
  /// successfully. We highly recommend that you call this operation to test
  /// your authentication method as soon as you create your server. By doing so,
  /// you can troubleshoot issues with the identity provider integration to
  /// ensure that your users can successfully use the service.
  ///
  /// The <code>ServerId</code> and <code>UserName</code> parameters are
  /// required. The <code>ServerProtocol</code>, <code>SourceIp</code>, and
  /// <code>UserPassword</code> are all optional.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// You cannot use <code>TestIdentityProvider</code> if the
  /// <code>IdentityProviderType</code> of your server is
  /// <code>SERVICE_MANAGED</code>.
  /// </li>
  /// <li>
  /// <code>TestIdentityProvider</code> does not work with keys: it only accepts
  /// passwords.
  /// </li>
  /// <li>
  /// <code>TestIdentityProvider</code> can test the password operation for a
  /// custom Identity Provider that handles keys and passwords.
  /// </li>
  /// <li>
  /// If you provide any incorrect values for any parameters, the
  /// <code>Response</code> field is empty.
  /// </li>
  /// <li>
  /// If you provide a server ID for a server that uses service-managed users,
  /// you get an error:
  ///
  /// <code> An error occurred (InvalidRequestException) when calling the
  /// TestIdentityProvider operation: s-<i>server-ID</i> not configured for
  /// external auth </code>
  /// </li>
  /// <li>
  /// If you enter a Server ID for the <code>--server-id</code> parameter that
  /// does not identify an actual Transfer server, you receive the following
  /// error:
  ///
  /// <code>An error occurred (ResourceNotFoundException) when calling the
  /// TestIdentityProvider operation: Unknown server</code>.
  ///
  /// It is possible your sever is in a different region. You can specify a
  /// region by adding the following: <code>--region region-code</code>, such as
  /// <code>--region us-east-2</code> to specify a server in <b>US East
  /// (Ohio)</b>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned identifier for a specific server. That server's user
  /// authentication method is tested with a user name and password.
  ///
  /// Parameter [userName] :
  /// The name of the account to be tested.
  ///
  /// Parameter [serverProtocol] :
  /// The type of file transfer protocol to be tested.
  ///
  /// The available protocols are:
  ///
  /// <ul>
  /// <li>
  /// Secure Shell (SSH) File Transfer Protocol (SFTP)
  /// </li>
  /// <li>
  /// File Transfer Protocol Secure (FTPS)
  /// </li>
  /// <li>
  /// File Transfer Protocol (FTP)
  /// </li>
  /// <li>
  /// Applicability Statement 2 (AS2)
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceIp] :
  /// The source IP address of the account to be tested.
  ///
  /// Parameter [userPassword] :
  /// The password of the account to be tested.
  Future<TestIdentityProviderResponse> testIdentityProvider({
    required String serverId,
    required String userName,
    Protocol? serverProtocol,
    String? sourceIp,
    String? userPassword,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.TestIdentityProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        'UserName': userName,
        if (serverProtocol != null) 'ServerProtocol': serverProtocol.value,
        if (sourceIp != null) 'SourceIp': sourceIp,
        if (userPassword != null) 'UserPassword': userPassword,
      },
    );

    return TestIdentityProviderResponse.fromJson(jsonResponse.body);
  }

  /// Detaches a key-value pair from a resource, as identified by its Amazon
  /// Resource Name (ARN). Resources are users, servers, roles, and other
  /// entities.
  ///
  /// No response is returned from this call.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  /// The value of the resource that will have the tag removed. An Amazon
  /// Resource Name (ARN) is an identifier for a specific Amazon Web Services
  /// resource, such as a server, user, or role.
  ///
  /// Parameter [tagKeys] :
  /// TagKeys are key-value pairs assigned to ARNs that can be used to group and
  /// search for resources by type. This metadata can be attached to resources
  /// for any purpose.
  Future<void> untagResource({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Allows you to update parameters for the access specified in the
  /// <code>ServerID</code> and <code>ExternalID</code> parameters.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [externalId] :
  /// A unique identifier that is required to identify specific groups within
  /// your directory. The users of the group that you associate have access to
  /// your Amazon S3 or Amazon EFS resources over the enabled protocols using
  /// Transfer Family. If you know the group name, you can view the SID values
  /// by running the following command using Windows PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regular expression used to validate this parameter is a string of
  /// characters consisting of uppercase and lowercase alphanumeric characters
  /// with no spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance. This is the
  /// specific server that you added your user to.
  ///
  /// Parameter [homeDirectory] :
  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  /// <note>
  /// You can use the <code>HomeDirectory</code> parameter for
  /// <code>HomeDirectoryType</code> when it is set to either <code>PATH</code>
  /// or <code>LOGICAL</code>.
  /// </note>
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you
  /// only specify a target, it is displayed as is. You also must ensure that
  /// your Identity and Access Management (IAM) role provides access to paths in
  /// <code>Target</code>. This value can be set only when
  /// <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example.
  ///
  /// <code>\[ { "Entry": "/directory1", "Target":
  /// "/bucket_name/home/mydirectory" } \]</code>
  ///
  /// In most cases, you can use this value instead of the session policy to
  /// lock down your user to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to
  /// <code>/</code> and set <code>Target</code> to the
  /// <code>HomeDirectory</code> parameter value.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example for <code>chroot</code>.
  ///
  /// <code>\[ { "Entry": "/", "Target": "/bucket_name/home/mydirectory" }
  /// \]</code>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) that you want your users' home
  /// directory to be when they log in to the server. If you set it to
  /// <code>PATH</code>, the user will see the absolute Amazon S3 bucket or
  /// Amazon EFS path as is in their file transfer protocol clients. If you set
  /// it to <code>LOGICAL</code>, you need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// Amazon EFS paths visible to your users.
  /// <note>
  /// If <code>HomeDirectoryType</code> is <code>LOGICAL</code>, you must
  /// provide mappings, using the <code>HomeDirectoryMappings</code> parameter.
  /// If, on the other hand, <code>HomeDirectoryType</code> is
  /// <code>PATH</code>, you provide an absolute path using the
  /// <code>HomeDirectory</code> parameter. You cannot have both
  /// <code>HomeDirectory</code> and <code>HomeDirectoryMappings</code> in your
  /// template.
  /// </note>
  ///
  /// Parameter [policy] :
  /// A session policy for your user so that you can use the same Identity and
  /// Access Management (IAM) role across multiple users. This policy scopes
  /// down a user's access to portions of their Amazon S3 bucket. Variables that
  /// you can use inside this policy include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// This policy applies only when the domain of <code>ServerId</code> is
  /// Amazon S3. Amazon EFS does not use session policies.
  ///
  /// For session policies, Transfer Family stores the policy as a JSON blob,
  /// instead of the Amazon Resource Name (ARN) of the policy. You save the
  /// policy as a JSON blob and pass it in the <code>Policy</code> argument.
  ///
  /// For an example of a session policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/session-policy.html">Example
  /// session policy</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a>
  /// in the <i>Amazon Web ServicesSecurity Token Service API Reference</i>.
  /// </note>
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that controls your users' access to your Amazon S3 bucket or Amazon
  /// EFS file system. The policies attached to this role determine the level of
  /// access that you want to provide your users when transferring files into
  /// and out of your Amazon S3 bucket or Amazon EFS file system. The IAM role
  /// should also contain a trust relationship that allows the server to access
  /// your resources when servicing your users' transfer requests.
  Future<UpdateAccessResponse> updateAccess({
    required String externalId,
    required String serverId,
    String? homeDirectory,
    List<HomeDirectoryMapEntry>? homeDirectoryMappings,
    HomeDirectoryType? homeDirectoryType,
    String? policy,
    PosixProfile? posixProfile,
    String? role,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExternalId': externalId,
        'ServerId': serverId,
        if (homeDirectory != null) 'HomeDirectory': homeDirectory,
        if (homeDirectoryMappings != null)
          'HomeDirectoryMappings': homeDirectoryMappings,
        if (homeDirectoryType != null)
          'HomeDirectoryType': homeDirectoryType.value,
        if (policy != null) 'Policy': policy,
        if (posixProfile != null) 'PosixProfile': posixProfile,
        if (role != null) 'Role': role,
      },
    );

    return UpdateAccessResponse.fromJson(jsonResponse.body);
  }

  /// Updates the description for the host key that's specified by the
  /// <code>ServerId</code> and <code>HostKeyId</code> parameters.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [description] :
  /// An updated description for the host key.
  ///
  /// Parameter [hostKeyId] :
  /// The identifier of the host key that you are updating.
  ///
  /// Parameter [serverId] :
  /// The identifier of the server that contains the host key that you are
  /// updating.
  Future<UpdateHostKeyResponse> updateHostKey({
    required String description,
    required String hostKeyId,
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateHostKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'HostKeyId': hostKeyId,
        'ServerId': serverId,
      },
    );

    return UpdateHostKeyResponse.fromJson(jsonResponse.body);
  }

  /// Creates an agreement. An agreement is a bilateral trading partner
  /// agreement, or partnership, between an Transfer Family server and an AS2
  /// process. The agreement defines the file and message transfer relationship
  /// between the server and the AS2 process. To define an agreement, Transfer
  /// Family combines a server, local profile, partner profile, certificate, and
  /// other attributes.
  ///
  /// The partner is identified with the <code>PartnerProfileId</code>, and the
  /// AS2 process is identified with the <code>LocalProfileId</code>.
  /// <note>
  /// Specify <i>either</i> <code>BaseDirectory</code> or
  /// <code>CustomDirectories</code>, but not both. Specifying both causes the
  /// command to fail.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accessRole] :
  /// Connectors are used to send files using either the AS2 or SFTP protocol.
  /// For the access role, provide the Amazon Resource Name (ARN) of the
  /// Identity and Access Management role to use.
  ///
  /// <b>For AS2 connectors</b>
  ///
  /// With AS2, you can send files by calling <code>StartFileTransfer</code> and
  /// specifying the file paths in the request parameter,
  /// <code>SendFilePaths</code>. We use the file’s parent directory (for
  /// example, for <code>--send-file-paths /bucket/dir/file.txt</code>, parent
  /// directory is <code>/bucket/dir/</code>) to temporarily store a processed
  /// AS2 message file, store the MDN when we receive them from the partner, and
  /// write a final JSON file containing relevant metadata of the transmission.
  /// So, the <code>AccessRole</code> needs to provide read and write access to
  /// the parent directory of the file location used in the
  /// <code>StartFileTransfer</code> request. Additionally, you need to provide
  /// read and write access to the parent directory of the files that you intend
  /// to send with <code>StartFileTransfer</code>.
  ///
  /// If you are using Basic authentication for your AS2 connector, the access
  /// role requires the <code>secretsmanager:GetSecretValue</code> permission
  /// for the secret. If the secret is encrypted using a customer-managed key
  /// instead of the Amazon Web Services managed key in Secrets Manager, then
  /// the role also needs the <code>kms:Decrypt</code> permission for that key.
  ///
  /// <b>For SFTP connectors</b>
  ///
  /// Make sure that the access role provides read and write access to the
  /// parent directory of the file location that's used in the
  /// <code>StartFileTransfer</code> request. Additionally, make sure that the
  /// role provides <code>secretsmanager:GetSecretValue</code> permission to
  /// Secrets Manager.
  ///
  /// Parameter [localProfileId] :
  /// A unique identifier for the AS2 local profile.
  ///
  /// Parameter [partnerProfileId] :
  /// A unique identifier for the partner profile used in the agreement.
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance. This is the
  /// specific server that the agreement uses.
  ///
  /// Parameter [baseDirectory] :
  /// The landing directory (folder) for files transferred by using the AS2
  /// protocol.
  ///
  /// A <code>BaseDirectory</code> example is
  /// <code>/<i>amzn-s3-demo-bucket</i>/home/mydirectory</code>.
  ///
  /// Parameter [customDirectories] :
  /// A <code>CustomDirectoriesType</code> structure. This structure specifies
  /// custom directories for storing various AS2 message files. You can specify
  /// directories for the following types of files.
  ///
  /// <ul>
  /// <li>
  /// Failed files
  /// </li>
  /// <li>
  /// MDN files
  /// </li>
  /// <li>
  /// Payload files
  /// </li>
  /// <li>
  /// Status files
  /// </li>
  /// <li>
  /// Temporary files
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A name or short description to identify the agreement.
  ///
  /// Parameter [enforceMessageSigning] :
  /// Determines whether or not unsigned messages from your trading partners
  /// will be accepted.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>: Transfer Family rejects unsigned messages from your
  /// trading partner.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> (default value): Transfer Family accepts unsigned
  /// messages from your trading partner.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preserveFilename] :
  /// Determines whether or not Transfer Family appends a unique string of
  /// characters to the end of the AS2 message payload filename when saving it.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>: the filename provided by your trading parter is
  /// preserved when the file is saved.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> (default value): when Transfer Family saves the
  /// file, the filename is adjusted, as described in <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/send-as2-messages.html#file-names-as2">File
  /// names and locations</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [status] :
  /// The status of the agreement. The agreement can be either
  /// <code>ACTIVE</code> or <code>INACTIVE</code>.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for agreements.
  Future<CreateAgreementResponse> createAgreement({
    required String accessRole,
    required String localProfileId,
    required String partnerProfileId,
    required String serverId,
    String? baseDirectory,
    CustomDirectoriesType? customDirectories,
    String? description,
    EnforceMessageSigningType? enforceMessageSigning,
    PreserveFilenameType? preserveFilename,
    AgreementStatusType? status,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.CreateAgreement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessRole': accessRole,
        'LocalProfileId': localProfileId,
        'PartnerProfileId': partnerProfileId,
        'ServerId': serverId,
        if (baseDirectory != null) 'BaseDirectory': baseDirectory,
        if (customDirectories != null) 'CustomDirectories': customDirectories,
        if (description != null) 'Description': description,
        if (enforceMessageSigning != null)
          'EnforceMessageSigning': enforceMessageSigning.value,
        if (preserveFilename != null)
          'PreserveFilename': preserveFilename.value,
        if (status != null) 'Status': status.value,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAgreementResponse.fromJson(jsonResponse.body);
  }

  /// Describes the agreement that's identified by the <code>AgreementId</code>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [agreementId] :
  /// A unique identifier for the agreement. This identifier is returned when
  /// you create an agreement.
  ///
  /// Parameter [serverId] :
  /// The server identifier that's associated with the agreement.
  Future<DescribeAgreementResponse> describeAgreement({
    required String agreementId,
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeAgreement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgreementId': agreementId,
        'ServerId': serverId,
      },
    );

    return DescribeAgreementResponse.fromJson(jsonResponse.body);
  }

  /// Updates some of the parameters for an existing agreement. Provide the
  /// <code>AgreementId</code> and the <code>ServerId</code> for the agreement
  /// that you want to update, along with the new values for the parameters to
  /// update.
  /// <note>
  /// Specify <i>either</i> <code>BaseDirectory</code> or
  /// <code>CustomDirectories</code>, but not both. Specifying both causes the
  /// command to fail.
  ///
  /// If you update an agreement from using base directory to custom
  /// directories, the base directory is no longer used. Similarly, if you
  /// change from custom directories to a base directory, the custom directories
  /// are no longer used.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [agreementId] :
  /// A unique identifier for the agreement. This identifier is returned when
  /// you create an agreement.
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance. This is the
  /// specific server that the agreement uses.
  ///
  /// Parameter [accessRole] :
  /// Connectors are used to send files using either the AS2 or SFTP protocol.
  /// For the access role, provide the Amazon Resource Name (ARN) of the
  /// Identity and Access Management role to use.
  ///
  /// <b>For AS2 connectors</b>
  ///
  /// With AS2, you can send files by calling <code>StartFileTransfer</code> and
  /// specifying the file paths in the request parameter,
  /// <code>SendFilePaths</code>. We use the file’s parent directory (for
  /// example, for <code>--send-file-paths /bucket/dir/file.txt</code>, parent
  /// directory is <code>/bucket/dir/</code>) to temporarily store a processed
  /// AS2 message file, store the MDN when we receive them from the partner, and
  /// write a final JSON file containing relevant metadata of the transmission.
  /// So, the <code>AccessRole</code> needs to provide read and write access to
  /// the parent directory of the file location used in the
  /// <code>StartFileTransfer</code> request. Additionally, you need to provide
  /// read and write access to the parent directory of the files that you intend
  /// to send with <code>StartFileTransfer</code>.
  ///
  /// If you are using Basic authentication for your AS2 connector, the access
  /// role requires the <code>secretsmanager:GetSecretValue</code> permission
  /// for the secret. If the secret is encrypted using a customer-managed key
  /// instead of the Amazon Web Services managed key in Secrets Manager, then
  /// the role also needs the <code>kms:Decrypt</code> permission for that key.
  ///
  /// <b>For SFTP connectors</b>
  ///
  /// Make sure that the access role provides read and write access to the
  /// parent directory of the file location that's used in the
  /// <code>StartFileTransfer</code> request. Additionally, make sure that the
  /// role provides <code>secretsmanager:GetSecretValue</code> permission to
  /// Secrets Manager.
  ///
  /// Parameter [baseDirectory] :
  /// To change the landing directory (folder) for files that are transferred,
  /// provide the bucket folder that you want to use; for example,
  /// <code>/<i>amzn-s3-demo-bucket</i>/<i>home</i>/<i>mydirectory</i> </code>.
  ///
  /// Parameter [customDirectories] :
  /// A <code>CustomDirectoriesType</code> structure. This structure specifies
  /// custom directories for storing various AS2 message files. You can specify
  /// directories for the following types of files.
  ///
  /// <ul>
  /// <li>
  /// Failed files
  /// </li>
  /// <li>
  /// MDN files
  /// </li>
  /// <li>
  /// Payload files
  /// </li>
  /// <li>
  /// Status files
  /// </li>
  /// <li>
  /// Temporary files
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// To replace the existing description, provide a short description for the
  /// agreement.
  ///
  /// Parameter [enforceMessageSigning] :
  /// Determines whether or not unsigned messages from your trading partners
  /// will be accepted.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>: Transfer Family rejects unsigned messages from your
  /// trading partner.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> (default value): Transfer Family accepts unsigned
  /// messages from your trading partner.
  /// </li>
  /// </ul>
  ///
  /// Parameter [localProfileId] :
  /// A unique identifier for the AS2 local profile.
  ///
  /// To change the local profile identifier, provide a new value here.
  ///
  /// Parameter [partnerProfileId] :
  /// A unique identifier for the partner profile. To change the partner profile
  /// identifier, provide a new value here.
  ///
  /// Parameter [preserveFilename] :
  /// Determines whether or not Transfer Family appends a unique string of
  /// characters to the end of the AS2 message payload filename when saving it.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>: the filename provided by your trading parter is
  /// preserved when the file is saved.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> (default value): when Transfer Family saves the
  /// file, the filename is adjusted, as described in <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/send-as2-messages.html#file-names-as2">File
  /// names and locations</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [status] :
  /// You can update the status for the agreement, either activating an inactive
  /// agreement or the reverse.
  Future<UpdateAgreementResponse> updateAgreement({
    required String agreementId,
    required String serverId,
    String? accessRole,
    String? baseDirectory,
    CustomDirectoriesType? customDirectories,
    String? description,
    EnforceMessageSigningType? enforceMessageSigning,
    String? localProfileId,
    String? partnerProfileId,
    PreserveFilenameType? preserveFilename,
    AgreementStatusType? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateAgreement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgreementId': agreementId,
        'ServerId': serverId,
        if (accessRole != null) 'AccessRole': accessRole,
        if (baseDirectory != null) 'BaseDirectory': baseDirectory,
        if (customDirectories != null) 'CustomDirectories': customDirectories,
        if (description != null) 'Description': description,
        if (enforceMessageSigning != null)
          'EnforceMessageSigning': enforceMessageSigning.value,
        if (localProfileId != null) 'LocalProfileId': localProfileId,
        if (partnerProfileId != null) 'PartnerProfileId': partnerProfileId,
        if (preserveFilename != null)
          'PreserveFilename': preserveFilename.value,
        if (status != null) 'Status': status.value,
      },
    );

    return UpdateAgreementResponse.fromJson(jsonResponse.body);
  }

  /// Delete the agreement that's specified in the provided
  /// <code>AgreementId</code>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [agreementId] :
  /// A unique identifier for the agreement. This identifier is returned when
  /// you create an agreement.
  ///
  /// Parameter [serverId] :
  /// The server identifier associated with the agreement that you are deleting.
  Future<void> deleteAgreement({
    required String agreementId,
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteAgreement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AgreementId': agreementId,
        'ServerId': serverId,
      },
    );
  }

  /// Returns a list of the agreements for the server that's identified by the
  /// <code>ServerId</code> that you supply. If you want to limit the results to
  /// a certain number, supply a value for the <code>MaxResults</code>
  /// parameter. If you ran the command previously and received a value for
  /// <code>NextToken</code>, you can supply that value to continue listing
  /// agreements from where you left off.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [serverId] :
  /// The identifier of the server for which you want a list of agreements.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// When you can get additional results from the <code>ListAgreements</code>
  /// call, a <code>NextToken</code> parameter is returned in the output. You
  /// can then pass in a subsequent command to the <code>NextToken</code>
  /// parameter to continue listing additional agreements.
  Future<ListAgreementsResponse> listAgreements({
    required String serverId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListAgreements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAgreementsResponse.fromJson(jsonResponse.body);
  }

  /// Imports the signing and encryption certificates that you need to create
  /// local (AS2) profiles and partner profiles.
  ///
  /// You can import both the certificate and its chain in the
  /// <code>Certificate</code> parameter.
  ///
  /// After importing a certificate, Transfer Family automatically creates a
  /// Amazon CloudWatch metric called <code>DaysUntilExpiry</code> that tracks
  /// the number of days until the certificate expires. The metric is based on
  /// the <code>InactiveDate</code> parameter and is published daily in the
  /// <code>AWS/Transfer</code> namespace.
  /// <important>
  /// It can take up to a full day after importing a certificate for Transfer
  /// Family to emit the <code>DaysUntilExpiry</code> metric to your account.
  /// </important> <note>
  /// If you use the <code>Certificate</code> parameter to upload both the
  /// certificate and its chain, don't use the <code>CertificateChain</code>
  /// parameter.
  /// </note>
  /// <b>CloudWatch monitoring</b>
  ///
  /// The <code>DaysUntilExpiry</code> metric includes the following
  /// specifications:
  ///
  /// <ul>
  /// <li>
  /// <b>Units:</b> Count (days)
  /// </li>
  /// <li>
  /// <b>Dimensions:</b> <code>CertificateId</code> (always present),
  /// <code>Description</code> (if provided during certificate import)
  /// </li>
  /// <li>
  /// <b>Statistics:</b> Minimum, Maximum, Average
  /// </li>
  /// <li>
  /// <b>Frequency:</b> Published daily
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [certificate] :
  /// <ul>
  /// <li>
  /// For the CLI, provide a file path for a certificate in URI format. For
  /// example, <code>--certificate file://encryption-cert.pem</code>.
  /// Alternatively, you can provide the raw content.
  /// </li>
  /// <li>
  /// For the SDK, specify the raw content of a certificate file. For example,
  /// <code>--certificate "`cat encryption-cert.pem`"</code>.
  /// </li>
  /// </ul> <note>
  /// You can provide both the certificate and its chain in this parameter,
  /// without needing to use the <code>CertificateChain</code> parameter. If you
  /// use this parameter for both the certificate and its chain, do not use the
  /// <code>CertificateChain</code> parameter.
  /// </note>
  ///
  /// Parameter [usage] :
  /// Specifies how this certificate is used. It can be used in the following
  /// ways:
  ///
  /// <ul>
  /// <li>
  /// <code>SIGNING</code>: For signing AS2 messages
  /// </li>
  /// <li>
  /// <code>ENCRYPTION</code>: For encrypting AS2 messages
  /// </li>
  /// <li>
  /// <code>TLS</code>: For securing AS2 communications sent over HTTPS
  /// </li>
  /// </ul>
  ///
  /// Parameter [activeDate] :
  /// An optional date that specifies when the certificate becomes active. If
  /// you do not specify a value, <code>ActiveDate</code> takes the same value
  /// as <code>NotBeforeDate</code>, which is specified by the CA.
  ///
  /// Parameter [certificateChain] :
  /// An optional list of certificates that make up the chain for the
  /// certificate that's being imported.
  ///
  /// Parameter [description] :
  /// A short description that helps identify the certificate.
  ///
  /// Parameter [inactiveDate] :
  /// An optional date that specifies when the certificate becomes inactive. If
  /// you do not specify a value, <code>InactiveDate</code> takes the same value
  /// as <code>NotAfterDate</code>, which is specified by the CA.
  ///
  /// Parameter [privateKey] :
  /// <ul>
  /// <li>
  /// For the CLI, provide a file path for a private key in URI format. For
  /// example, <code>--private-key file://encryption-key.pem</code>.
  /// Alternatively, you can provide the raw content of the private key file.
  /// </li>
  /// <li>
  /// For the SDK, specify the raw content of a private key file. For example,
  /// <code>--private-key "`cat encryption-key.pem`"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for certificates.
  Future<ImportCertificateResponse> importCertificate({
    required String certificate,
    required CertificateUsageType usage,
    DateTime? activeDate,
    String? certificateChain,
    String? description,
    DateTime? inactiveDate,
    String? privateKey,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ImportCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Certificate': certificate,
        'Usage': usage.value,
        if (activeDate != null) 'ActiveDate': unixTimestampToJson(activeDate),
        if (certificateChain != null) 'CertificateChain': certificateChain,
        if (description != null) 'Description': description,
        if (inactiveDate != null)
          'InactiveDate': unixTimestampToJson(inactiveDate),
        if (privateKey != null) 'PrivateKey': privateKey,
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Describes the certificate that's identified by the
  /// <code>CertificateId</code>.
  /// <note>
  /// Transfer Family automatically publishes a Amazon CloudWatch metric called
  /// <code>DaysUntilExpiry</code> for imported certificates. This metric tracks
  /// the number of days until the certificate expires based on the
  /// <code>InactiveDate</code>. The metric is available in the
  /// <code>AWS/Transfer</code> namespace and includes the
  /// <code>CertificateId</code> as a dimension.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [certificateId] :
  /// An array of identifiers for the imported certificates. You use this
  /// identifier for working with profiles and partner profiles.
  Future<DescribeCertificateResponse> describeCertificate({
    required String certificateId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateId': certificateId,
      },
    );

    return DescribeCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Updates the active and inactive dates for a certificate.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [certificateId] :
  /// The identifier of the certificate object that you are updating.
  ///
  /// Parameter [activeDate] :
  /// An optional date that specifies when the certificate becomes active. If
  /// you do not specify a value, <code>ActiveDate</code> takes the same value
  /// as <code>NotBeforeDate</code>, which is specified by the CA.
  ///
  /// Parameter [description] :
  /// A short description to help identify the certificate.
  ///
  /// Parameter [inactiveDate] :
  /// An optional date that specifies when the certificate becomes inactive. If
  /// you do not specify a value, <code>InactiveDate</code> takes the same value
  /// as <code>NotAfterDate</code>, which is specified by the CA.
  Future<UpdateCertificateResponse> updateCertificate({
    required String certificateId,
    DateTime? activeDate,
    String? description,
    DateTime? inactiveDate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateId': certificateId,
        if (activeDate != null) 'ActiveDate': unixTimestampToJson(activeDate),
        if (description != null) 'Description': description,
        if (inactiveDate != null)
          'InactiveDate': unixTimestampToJson(inactiveDate),
      },
    );

    return UpdateCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the certificate that's specified in the <code>CertificateId</code>
  /// parameter.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [certificateId] :
  /// The identifier of the certificate object that you are deleting.
  Future<void> deleteCertificate({
    required String certificateId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteCertificate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateId': certificateId,
      },
    );
  }

  /// Returns a list of the current certificates that have been imported into
  /// Transfer Family. If you want to limit the results to a certain number,
  /// supply a value for the <code>MaxResults</code> parameter. If you ran the
  /// command previously and received a value for the <code>NextToken</code>
  /// parameter, you can supply that value to continue listing certificates from
  /// where you left off.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// When you can get additional results from the <code>ListCertificates</code>
  /// call, a <code>NextToken</code> parameter is returned in the output. You
  /// can then pass in a subsequent command to the <code>NextToken</code>
  /// parameter to continue listing additional certificates.
  Future<ListCertificatesResponse> listCertificates({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListCertificates'
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

    return ListCertificatesResponse.fromJson(jsonResponse.body);
  }

  /// Creates the connector, which captures the parameters for a connection for
  /// the AS2 or SFTP protocol. For AS2, the connector is required for sending
  /// files to an externally hosted AS2 server. For SFTP, the connector is
  /// required when sending files to an SFTP server or receiving files from an
  /// SFTP server. For more details about connectors, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/configure-as2-connector.html">Configure
  /// AS2 connectors</a> and <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/configure-sftp-connector.html">Create
  /// SFTP connectors</a>.
  /// <note>
  /// You must specify exactly one configuration object: either for AS2
  /// (<code>As2Config</code>) or SFTP (<code>SftpConfig</code>).
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accessRole] :
  /// Connectors are used to send files using either the AS2 or SFTP protocol.
  /// For the access role, provide the Amazon Resource Name (ARN) of the
  /// Identity and Access Management role to use.
  ///
  /// <b>For AS2 connectors</b>
  ///
  /// With AS2, you can send files by calling <code>StartFileTransfer</code> and
  /// specifying the file paths in the request parameter,
  /// <code>SendFilePaths</code>. We use the file’s parent directory (for
  /// example, for <code>--send-file-paths /bucket/dir/file.txt</code>, parent
  /// directory is <code>/bucket/dir/</code>) to temporarily store a processed
  /// AS2 message file, store the MDN when we receive them from the partner, and
  /// write a final JSON file containing relevant metadata of the transmission.
  /// So, the <code>AccessRole</code> needs to provide read and write access to
  /// the parent directory of the file location used in the
  /// <code>StartFileTransfer</code> request. Additionally, you need to provide
  /// read and write access to the parent directory of the files that you intend
  /// to send with <code>StartFileTransfer</code>.
  ///
  /// If you are using Basic authentication for your AS2 connector, the access
  /// role requires the <code>secretsmanager:GetSecretValue</code> permission
  /// for the secret. If the secret is encrypted using a customer-managed key
  /// instead of the Amazon Web Services managed key in Secrets Manager, then
  /// the role also needs the <code>kms:Decrypt</code> permission for that key.
  ///
  /// <b>For SFTP connectors</b>
  ///
  /// Make sure that the access role provides read and write access to the
  /// parent directory of the file location that's used in the
  /// <code>StartFileTransfer</code> request. Additionally, make sure that the
  /// role provides <code>secretsmanager:GetSecretValue</code> permission to
  /// Secrets Manager.
  ///
  /// Parameter [as2Config] :
  /// A structure that contains the parameters for an AS2 connector object.
  ///
  /// Parameter [egressConfig] :
  /// Specifies the egress configuration for the connector, which determines how
  /// traffic is routed from the connector to the SFTP server. When set to VPC,
  /// enables routing through customer VPCs using VPC_LATTICE for private
  /// connectivity.
  ///
  /// Parameter [ipAddressType] :
  /// Specifies the IP address type for the connector's network connections.
  /// When set to <code>IPV4</code>, the connector uses IPv4 addresses only.
  /// When set to <code>DUALSTACK</code>, the connector supports both IPv4 and
  /// IPv6 addresses, with IPv6 preferred when available.
  ///
  /// Parameter [loggingRole] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that allows a connector to turn on CloudWatch logging for Amazon S3
  /// events. When set, you can view connector activity in your CloudWatch logs.
  ///
  /// Parameter [securityPolicyName] :
  /// Specifies the name of the security policy for the connector.
  ///
  /// Parameter [sftpConfig] :
  /// A structure that contains the parameters for an SFTP connector object.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for connectors. Tags
  /// are metadata attached to connectors for any purpose.
  ///
  /// Parameter [url] :
  /// The URL of the partner's AS2 or SFTP endpoint.
  ///
  /// When creating AS2 connectors or service-managed SFTP connectors
  /// (connectors without egress configuration), you must provide a URL to
  /// specify the remote server endpoint. For VPC Lattice type connectors, the
  /// URL must be null.
  Future<CreateConnectorResponse> createConnector({
    required String accessRole,
    As2ConnectorConfig? as2Config,
    ConnectorEgressConfig? egressConfig,
    ConnectorsIpAddressType? ipAddressType,
    String? loggingRole,
    String? securityPolicyName,
    SftpConnectorConfig? sftpConfig,
    List<Tag>? tags,
    String? url,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.CreateConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessRole': accessRole,
        if (as2Config != null) 'As2Config': as2Config,
        if (egressConfig != null) 'EgressConfig': egressConfig,
        if (ipAddressType != null) 'IpAddressType': ipAddressType.value,
        if (loggingRole != null) 'LoggingRole': loggingRole,
        if (securityPolicyName != null)
          'SecurityPolicyName': securityPolicyName,
        if (sftpConfig != null) 'SftpConfig': sftpConfig,
        if (tags != null) 'Tags': tags,
        if (url != null) 'Url': url,
      },
    );

    return CreateConnectorResponse.fromJson(jsonResponse.body);
  }

  /// Describes the connector that's identified by the <code>ConnectorId.</code>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [connectorId] :
  /// The unique identifier for the connector.
  Future<DescribeConnectorResponse> describeConnector({
    required String connectorId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectorId': connectorId,
      },
    );

    return DescribeConnectorResponse.fromJson(jsonResponse.body);
  }

  /// Updates some of the parameters for an existing connector. Provide the
  /// <code>ConnectorId</code> for the connector that you want to update, along
  /// with the new values for the parameters to update.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [connectorId] :
  /// The unique identifier for the connector.
  ///
  /// Parameter [accessRole] :
  /// Connectors are used to send files using either the AS2 or SFTP protocol.
  /// For the access role, provide the Amazon Resource Name (ARN) of the
  /// Identity and Access Management role to use.
  ///
  /// <b>For AS2 connectors</b>
  ///
  /// With AS2, you can send files by calling <code>StartFileTransfer</code> and
  /// specifying the file paths in the request parameter,
  /// <code>SendFilePaths</code>. We use the file’s parent directory (for
  /// example, for <code>--send-file-paths /bucket/dir/file.txt</code>, parent
  /// directory is <code>/bucket/dir/</code>) to temporarily store a processed
  /// AS2 message file, store the MDN when we receive them from the partner, and
  /// write a final JSON file containing relevant metadata of the transmission.
  /// So, the <code>AccessRole</code> needs to provide read and write access to
  /// the parent directory of the file location used in the
  /// <code>StartFileTransfer</code> request. Additionally, you need to provide
  /// read and write access to the parent directory of the files that you intend
  /// to send with <code>StartFileTransfer</code>.
  ///
  /// If you are using Basic authentication for your AS2 connector, the access
  /// role requires the <code>secretsmanager:GetSecretValue</code> permission
  /// for the secret. If the secret is encrypted using a customer-managed key
  /// instead of the Amazon Web Services managed key in Secrets Manager, then
  /// the role also needs the <code>kms:Decrypt</code> permission for that key.
  ///
  /// <b>For SFTP connectors</b>
  ///
  /// Make sure that the access role provides read and write access to the
  /// parent directory of the file location that's used in the
  /// <code>StartFileTransfer</code> request. Additionally, make sure that the
  /// role provides <code>secretsmanager:GetSecretValue</code> permission to
  /// Secrets Manager.
  ///
  /// Parameter [as2Config] :
  /// A structure that contains the parameters for an AS2 connector object.
  ///
  /// Parameter [egressConfig] :
  /// Updates the egress configuration for the connector, allowing you to modify
  /// how traffic is routed from the connector to the SFTP server. Changes to
  /// VPC configuration may require connector restart.
  ///
  /// Parameter [ipAddressType] :
  /// Specifies the IP address type for the connector's network connections.
  /// When set to <code>IPV4</code>, the connector uses IPv4 addresses only.
  /// When set to <code>DUALSTACK</code>, the connector supports both IPv4 and
  /// IPv6 addresses, with IPv6 preferred when available.
  ///
  /// Parameter [loggingRole] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that allows a connector to turn on CloudWatch logging for Amazon S3
  /// events. When set, you can view connector activity in your CloudWatch logs.
  ///
  /// Parameter [securityPolicyName] :
  /// Specifies the name of the security policy for the connector.
  ///
  /// Parameter [sftpConfig] :
  /// A structure that contains the parameters for an SFTP connector object.
  ///
  /// Parameter [url] :
  /// The URL of the partner's AS2 or SFTP endpoint.
  ///
  /// When creating AS2 connectors or service-managed SFTP connectors
  /// (connectors without egress configuration), you must provide a URL to
  /// specify the remote server endpoint. For VPC Lattice type connectors, the
  /// URL must be null.
  Future<UpdateConnectorResponse> updateConnector({
    required String connectorId,
    String? accessRole,
    As2ConnectorConfig? as2Config,
    UpdateConnectorEgressConfig? egressConfig,
    ConnectorsIpAddressType? ipAddressType,
    String? loggingRole,
    String? securityPolicyName,
    SftpConnectorConfig? sftpConfig,
    String? url,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectorId': connectorId,
        if (accessRole != null) 'AccessRole': accessRole,
        if (as2Config != null) 'As2Config': as2Config,
        if (egressConfig != null) 'EgressConfig': egressConfig,
        if (ipAddressType != null) 'IpAddressType': ipAddressType.value,
        if (loggingRole != null) 'LoggingRole': loggingRole,
        if (securityPolicyName != null)
          'SecurityPolicyName': securityPolicyName,
        if (sftpConfig != null) 'SftpConfig': sftpConfig,
        if (url != null) 'Url': url,
      },
    );

    return UpdateConnectorResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the connector that's specified in the provided
  /// <code>ConnectorId</code>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [connectorId] :
  /// The unique identifier for the connector.
  Future<void> deleteConnector({
    required String connectorId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteConnector'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectorId': connectorId,
      },
    );
  }

  /// Lists the connectors for the specified Region.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// When you can get additional results from the <code>ListConnectors</code>
  /// call, a <code>NextToken</code> parameter is returned in the output. You
  /// can then pass in a subsequent command to the <code>NextToken</code>
  /// parameter to continue listing additional connectors.
  Future<ListConnectorsResponse> listConnectors({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListConnectors'
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

    return ListConnectorsResponse.fromJson(jsonResponse.body);
  }

  /// Creates the local or partner profile to use for AS2 transfers.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [as2Id] :
  /// The <code>As2Id</code> is the <i>AS2-name</i>, as defined in the <a
  /// href="https://datatracker.ietf.org/doc/html/rfc4130">RFC 4130</a>. For
  /// inbound transfers, this is the <code>AS2-From</code> header for the AS2
  /// messages sent from the partner. For outbound connectors, this is the
  /// <code>AS2-To</code> header for the AS2 messages sent to the partner using
  /// the <code>StartFileTransfer</code> API operation. This ID cannot include
  /// spaces.
  ///
  /// Parameter [profileType] :
  /// Determines the type of profile to create:
  ///
  /// <ul>
  /// <li>
  /// Specify <code>LOCAL</code> to create a local profile. A local profile
  /// represents the AS2-enabled Transfer Family server organization or party.
  /// </li>
  /// <li>
  /// Specify <code>PARTNER</code> to create a partner profile. A partner
  /// profile represents a remote organization, external to Transfer Family.
  /// </li>
  /// </ul>
  ///
  /// Parameter [certificateIds] :
  /// An array of identifiers for the imported certificates. You use this
  /// identifier for working with profiles and partner profiles.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for AS2 profiles.
  Future<CreateProfileResponse> createProfile({
    required String as2Id,
    required ProfileType profileType,
    List<String>? certificateIds,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.CreateProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'As2Id': as2Id,
        'ProfileType': profileType.value,
        if (certificateIds != null) 'CertificateIds': certificateIds,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateProfileResponse.fromJson(jsonResponse.body);
  }

  /// Returns the details of the profile that's specified by the
  /// <code>ProfileId</code>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [profileId] :
  /// The identifier of the profile that you want described.
  Future<DescribeProfileResponse> describeProfile({
    required String profileId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProfileId': profileId,
      },
    );

    return DescribeProfileResponse.fromJson(jsonResponse.body);
  }

  /// Updates some of the parameters for an existing profile. Provide the
  /// <code>ProfileId</code> for the profile that you want to update, along with
  /// the new values for the parameters to update.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [profileId] :
  /// The identifier of the profile object that you are updating.
  ///
  /// Parameter [certificateIds] :
  /// An array of identifiers for the imported certificates. You use this
  /// identifier for working with profiles and partner profiles.
  Future<UpdateProfileResponse> updateProfile({
    required String profileId,
    List<String>? certificateIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProfileId': profileId,
        if (certificateIds != null) 'CertificateIds': certificateIds,
      },
    );

    return UpdateProfileResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the profile that's specified in the <code>ProfileId</code>
  /// parameter.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [profileId] :
  /// The identifier of the profile that you are deleting.
  Future<void> deleteProfile({
    required String profileId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteProfile'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProfileId': profileId,
      },
    );
  }

  /// Returns a list of the profiles for your system. If you want to limit the
  /// results to a certain number, supply a value for the
  /// <code>MaxResults</code> parameter. If you ran the command previously and
  /// received a value for <code>NextToken</code>, you can supply that value to
  /// continue listing profiles from where you left off.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// When there are additional results that were not returned, a
  /// <code>NextToken</code> parameter is returned. You can use that value for a
  /// subsequent call to <code>ListProfiles</code> to continue listing results.
  ///
  /// Parameter [profileType] :
  /// Indicates whether to list only <code>LOCAL</code> type profiles or only
  /// <code>PARTNER</code> type profiles. If not supplied in the request, the
  /// command lists all types of profiles.
  Future<ListProfilesResponse> listProfiles({
    int? maxResults,
    String? nextToken,
    ProfileType? profileType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListProfiles'
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
        if (profileType != null) 'ProfileType': profileType.value,
      },
    );

    return ListProfilesResponse.fromJson(jsonResponse.body);
  }

  /// Instantiates an auto-scaling virtual server based on the selected file
  /// transfer protocol in Amazon Web Services. When you make updates to your
  /// file transfer protocol-enabled server or when you work with users, use the
  /// service-generated <code>ServerId</code> property that is assigned to the
  /// newly created server.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [certificate] :
  /// The Amazon Resource Name (ARN) of the Certificate Manager (ACM)
  /// certificate. Required when <code>Protocols</code> is set to
  /// <code>FTPS</code>.
  ///
  /// To request a new public certificate, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html">Request
  /// a public certificate</a> in the <i>Certificate Manager User Guide</i>.
  ///
  /// To import an existing certificate into ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// certificates into ACM</a> in the <i>Certificate Manager User Guide</i>.
  ///
  /// To request a private certificate to use FTPS through private IP addresses,
  /// see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-private.html">Request
  /// a private certificate</a> in the <i>Certificate Manager User Guide</i>.
  ///
  /// Certificates with the following cryptographic algorithms and key sizes are
  /// supported:
  ///
  /// <ul>
  /// <li>
  /// 2048-bit RSA (RSA_2048)
  /// </li>
  /// <li>
  /// 4096-bit RSA (RSA_4096)
  /// </li>
  /// <li>
  /// Elliptic Prime Curve 256 bit (EC_prime256v1)
  /// </li>
  /// <li>
  /// Elliptic Prime Curve 384 bit (EC_secp384r1)
  /// </li>
  /// <li>
  /// Elliptic Prime Curve 521 bit (EC_secp521r1)
  /// </li>
  /// </ul> <note>
  /// The certificate must be a valid SSL/TLS X.509 version 3 certificate with
  /// FQDN or IP address specified and information about the issuer.
  /// </note>
  ///
  /// Parameter [domain] :
  /// The domain of the storage system that is used for file transfers. There
  /// are two domains available: Amazon Simple Storage Service (Amazon S3) and
  /// Amazon Elastic File System (Amazon EFS). The default value is S3.
  /// <note>
  /// After the server is created, the domain cannot be changed.
  /// </note>
  ///
  /// Parameter [endpointDetails] :
  /// The virtual private cloud (VPC) endpoint settings that are configured for
  /// your server. When you host your endpoint within your VPC, you can make
  /// your endpoint accessible only to resources within your VPC, or you can
  /// attach Elastic IP addresses and make your endpoint accessible to clients
  /// over the internet. Your VPC's default security groups are automatically
  /// assigned to your endpoint.
  ///
  /// Parameter [endpointType] :
  /// The type of endpoint that you want your server to use. You can choose to
  /// make your server's endpoint publicly accessible (PUBLIC) or host it inside
  /// your VPC. With an endpoint that is hosted in a VPC, you can restrict
  /// access to your server and resources only within your VPC or choose to make
  /// it internet facing by attaching Elastic IP addresses directly to it.
  /// <note>
  /// After May 19, 2021, you won't be able to create a server using
  /// <code>EndpointType=VPC_ENDPOINT</code> in your Amazon Web Services account
  /// if your account hasn't already done so before May 19, 2021. If you have
  /// already created servers with <code>EndpointType=VPC_ENDPOINT</code> in
  /// your Amazon Web Services account on or before May 19, 2021, you will not
  /// be affected. After this date, use
  /// <code>EndpointType</code>=<code>VPC</code>.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
  ///
  /// It is recommended that you use <code>VPC</code> as the
  /// <code>EndpointType</code>. With this endpoint type, you have the option to
  /// directly associate up to three Elastic IPv4 addresses (BYO IP included)
  /// with your server's endpoint and use VPC security groups to restrict
  /// traffic by the client's public IP address. This is not possible with
  /// <code>EndpointType</code> set to <code>VPC_ENDPOINT</code>.
  /// </note>
  ///
  /// Parameter [hostKey] :
  /// The RSA, ECDSA, or ED25519 private key to use for your SFTP-enabled
  /// server. You can add multiple host keys, in case you want to rotate keys,
  /// or have a set of active keys that use different algorithms.
  ///
  /// Use the following command to generate an RSA 2048 bit key with no
  /// passphrase:
  ///
  /// <code>ssh-keygen -t rsa -b 2048 -N "" -m PEM -f my-new-server-key</code>.
  ///
  /// Use a minimum value of 2048 for the <code>-b</code> option. You can create
  /// a stronger key by using 3072 or 4096.
  ///
  /// Use the following command to generate an ECDSA 256 bit key with no
  /// passphrase:
  ///
  /// <code>ssh-keygen -t ecdsa -b 256 -N "" -m PEM -f my-new-server-key</code>.
  ///
  /// Valid values for the <code>-b</code> option for ECDSA are 256, 384, and
  /// 521.
  ///
  /// Use the following command to generate an ED25519 key with no passphrase:
  ///
  /// <code>ssh-keygen -t ed25519 -N "" -f my-new-server-key</code>.
  ///
  /// For all of these commands, you can replace <i>my-new-server-key</i> with a
  /// string of your choice.
  /// <important>
  /// If you aren't planning to migrate existing users from an existing
  /// SFTP-enabled server to a new server, don't update the host key.
  /// Accidentally changing a server's host key can be disruptive.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key">Manage
  /// host keys for your SFTP-enabled server</a> in the <i>Transfer Family User
  /// Guide</i>.
  ///
  /// Parameter [identityProviderDetails] :
  /// Required when <code>IdentityProviderType</code> is set to
  /// <code>AWS_DIRECTORY_SERVICE</code>, <code>Amazon Web
  /// Services_LAMBDA</code> or <code>API_GATEWAY</code>. Accepts an array
  /// containing all of the information required to use a directory in
  /// <code>AWS_DIRECTORY_SERVICE</code> or invoke a customer-supplied
  /// authentication API, including the API Gateway URL. Cannot be specified
  /// when <code>IdentityProviderType</code> is set to
  /// <code>SERVICE_MANAGED</code>.
  ///
  /// Parameter [identityProviderType] :
  /// The mode of authentication for a server. The default value is
  /// <code>SERVICE_MANAGED</code>, which allows you to store and access user
  /// credentials within the Transfer Family service.
  ///
  /// Use <code>AWS_DIRECTORY_SERVICE</code> to provide access to Active
  /// Directory groups in Directory Service for Microsoft Active Directory or
  /// Microsoft Active Directory in your on-premises environment or in Amazon
  /// Web Services using AD Connector. This option also requires you to provide
  /// a Directory ID by using the <code>IdentityProviderDetails</code>
  /// parameter.
  ///
  /// Use the <code>API_GATEWAY</code> value to integrate with an identity
  /// provider of your choosing. The <code>API_GATEWAY</code> setting requires
  /// you to provide an Amazon API Gateway endpoint URL to call for
  /// authentication by using the <code>IdentityProviderDetails</code>
  /// parameter.
  ///
  /// Use the <code>AWS_LAMBDA</code> value to directly use an Lambda function
  /// as your identity provider. If you choose this value, you must specify the
  /// ARN for the Lambda function in the <code>Function</code> parameter for the
  /// <code>IdentityProviderDetails</code> data type.
  ///
  /// Parameter [ipAddressType] :
  /// Specifies whether to use IPv4 only, or to use dual-stack (IPv4 and IPv6)
  /// for your Transfer Family endpoint. The default value is <code>IPV4</code>.
  /// <important>
  /// The <code>IpAddressType</code> parameter has the following limitations:
  ///
  /// <ul>
  /// <li>
  /// It cannot be changed while the server is online. You must stop the server
  /// before modifying this parameter.
  /// </li>
  /// <li>
  /// It cannot be updated to <code>DUALSTACK</code> if the server has
  /// <code>AddressAllocationIds</code> specified.
  /// </li>
  /// </ul> </important> <note>
  /// When using <code>DUALSTACK</code> as the <code>IpAddressType</code>, you
  /// cannot set the <code>AddressAllocationIds</code> parameter for the <a
  /// href="https://docs.aws.amazon.com/transfer/latest/APIReference/API_EndpointDetails.html">EndpointDetails</a>
  /// for the server.
  /// </note>
  ///
  /// Parameter [loggingRole] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that allows a server to turn on Amazon CloudWatch logging for Amazon
  /// S3 or Amazon EFS events. When set, you can view user activity in your
  /// CloudWatch logs.
  ///
  /// Parameter [postAuthenticationLoginBanner] :
  /// Specifies a string to display when users connect to a server. This string
  /// is displayed after the user authenticates.
  /// <note>
  /// The SFTP protocol does not support post-authentication display banners.
  /// </note>
  ///
  /// Parameter [preAuthenticationLoginBanner] :
  /// Specifies a string to display when users connect to a server. This string
  /// is displayed before the user authenticates. For example, the following
  /// banner displays details about using the system:
  ///
  /// <code>This system is for the use of authorized users only. Individuals
  /// using this computer system without authority, or in excess of their
  /// authority, are subject to having all of their activities on this system
  /// monitored and recorded by system personnel.</code>
  ///
  /// Parameter [protocolDetails] :
  /// The protocol settings that are configured for your server.
  /// <note>
  /// Avoid placing Network Load Balancers (NLBs) or NAT gateways in front of
  /// Transfer Family servers, as this increases costs and can cause performance
  /// issues, including reduced connection limits for FTPS. For more details,
  /// see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/infrastructure-security.html#nlb-considerations">
  /// Avoid placing NLBs and NATs in front of Transfer Family</a>.
  /// </note>
  /// <ul>
  /// <li>
  /// To indicate passive mode (for FTP and FTPS protocols), use the
  /// <code>PassiveIp</code> parameter. Enter a single dotted-quad IPv4 address,
  /// such as the external IP address of a firewall, router, or load balancer.
  /// </li>
  /// <li>
  /// To ignore the error that is generated when the client attempts to use the
  /// <code>SETSTAT</code> command on a file that you are uploading to an Amazon
  /// S3 bucket, use the <code>SetStatOption</code> parameter. To have the
  /// Transfer Family server ignore the <code>SETSTAT</code> command and upload
  /// files without needing to make any changes to your SFTP client, set the
  /// value to <code>ENABLE_NO_OP</code>. If you set the
  /// <code>SetStatOption</code> parameter to <code>ENABLE_NO_OP</code>,
  /// Transfer Family generates a log entry to Amazon CloudWatch Logs, so that
  /// you can determine when the client is making a <code>SETSTAT</code> call.
  /// </li>
  /// <li>
  /// To determine whether your Transfer Family server resumes recent,
  /// negotiated sessions through a unique session ID, use the
  /// <code>TlsSessionResumptionMode</code> parameter.
  /// </li>
  /// <li>
  /// <code>As2Transports</code> indicates the transport method for the AS2
  /// messages. Currently, only HTTP is supported.
  /// </li>
  /// </ul>
  ///
  /// Parameter [protocols] :
  /// Specifies the file transfer protocol or protocols over which your file
  /// transfer protocol client can connect to your server's endpoint. The
  /// available protocols are:
  ///
  /// <ul>
  /// <li>
  /// <code>SFTP</code> (Secure Shell (SSH) File Transfer Protocol): File
  /// transfer over SSH
  /// </li>
  /// <li>
  /// <code>FTPS</code> (File Transfer Protocol Secure): File transfer with TLS
  /// encryption
  /// </li>
  /// <li>
  /// <code>FTP</code> (File Transfer Protocol): Unencrypted file transfer
  /// </li>
  /// <li>
  /// <code>AS2</code> (Applicability Statement 2): used for transporting
  /// structured business-to-business data
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If you select <code>FTPS</code>, you must choose a certificate stored in
  /// Certificate Manager (ACM) which is used to identify your server when
  /// clients connect to it over FTPS.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> includes either <code>FTP</code> or
  /// <code>FTPS</code>, then the <code>EndpointType</code> must be
  /// <code>VPC</code> and the <code>IdentityProviderType</code> must be either
  /// <code>AWS_DIRECTORY_SERVICE</code>, <code>AWS_LAMBDA</code>, or
  /// <code>API_GATEWAY</code>.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> includes <code>FTP</code>, then
  /// <code>AddressAllocationIds</code> cannot be associated.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> is set only to <code>SFTP</code>, the
  /// <code>EndpointType</code> can be set to <code>PUBLIC</code> and the
  /// <code>IdentityProviderType</code> can be set any of the supported identity
  /// types: <code>SERVICE_MANAGED</code>, <code>AWS_DIRECTORY_SERVICE</code>,
  /// <code>AWS_LAMBDA</code>, or <code>API_GATEWAY</code>.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> includes <code>AS2</code>, then the
  /// <code>EndpointType</code> must be <code>VPC</code>, and domain must be
  /// Amazon S3.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [s3StorageOptions] :
  /// Specifies whether or not performance for your Amazon S3 directories is
  /// optimized.
  ///
  /// <ul>
  /// <li>
  /// If using the console, this is enabled by default.
  /// </li>
  /// <li>
  /// If using the API or CLI, this is disabled by default.
  /// </li>
  /// </ul>
  /// By default, home directory mappings have a <code>TYPE</code> of
  /// <code>DIRECTORY</code>. If you enable this option, you would then need to
  /// explicitly set the <code>HomeDirectoryMapEntry</code> <code>Type</code> to
  /// <code>FILE</code> if you want a mapping to have a file target.
  ///
  /// Parameter [securityPolicyName] :
  /// Specifies the name of the security policy for the server.
  ///
  /// Parameter [structuredLogDestinations] :
  /// Specifies the log groups to which your server logs are sent.
  ///
  /// To specify a log group, you must provide the ARN for an existing log
  /// group. In this case, the format of the log group is as follows:
  ///
  /// <code>arn:aws:logs:region-name:amazon-account-id:log-group:log-group-name:*</code>
  ///
  /// For example,
  /// <code>arn:aws:logs:us-east-1:111122223333:log-group:mytestgroup:*</code>
  ///
  /// If you have previously specified a log group for a server, you can clear
  /// it, and in effect turn off structured logging, by providing an empty value
  /// for this parameter in an <code>update-server</code> call. For example:
  ///
  /// <code>update-server --server-id s-1234567890abcdef0
  /// --structured-log-destinations</code>
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for servers.
  ///
  /// Parameter [workflowDetails] :
  /// Specifies the workflow ID for the workflow to assign and the execution
  /// role that's used for executing the workflow.
  ///
  /// In addition to a workflow to execute when a file is uploaded completely,
  /// <code>WorkflowDetails</code> can also contain a workflow ID (and execution
  /// role) for a workflow to execute on partial upload. A partial upload occurs
  /// when the server session disconnects while the file is still being
  /// uploaded.
  Future<CreateServerResponse> createServer({
    String? certificate,
    Domain? domain,
    EndpointDetails? endpointDetails,
    EndpointType? endpointType,
    String? hostKey,
    IdentityProviderDetails? identityProviderDetails,
    IdentityProviderType? identityProviderType,
    IpAddressType? ipAddressType,
    String? loggingRole,
    String? postAuthenticationLoginBanner,
    String? preAuthenticationLoginBanner,
    ProtocolDetails? protocolDetails,
    List<Protocol>? protocols,
    S3StorageOptions? s3StorageOptions,
    String? securityPolicyName,
    List<String>? structuredLogDestinations,
    List<Tag>? tags,
    WorkflowDetails? workflowDetails,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.CreateServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (certificate != null) 'Certificate': certificate,
        if (domain != null) 'Domain': domain.value,
        if (endpointDetails != null) 'EndpointDetails': endpointDetails,
        if (endpointType != null) 'EndpointType': endpointType.value,
        if (hostKey != null) 'HostKey': hostKey,
        if (identityProviderDetails != null)
          'IdentityProviderDetails': identityProviderDetails,
        if (identityProviderType != null)
          'IdentityProviderType': identityProviderType.value,
        if (ipAddressType != null) 'IpAddressType': ipAddressType.value,
        if (loggingRole != null) 'LoggingRole': loggingRole,
        if (postAuthenticationLoginBanner != null)
          'PostAuthenticationLoginBanner': postAuthenticationLoginBanner,
        if (preAuthenticationLoginBanner != null)
          'PreAuthenticationLoginBanner': preAuthenticationLoginBanner,
        if (protocolDetails != null) 'ProtocolDetails': protocolDetails,
        if (protocols != null)
          'Protocols': protocols.map((e) => e.value).toList(),
        if (s3StorageOptions != null) 'S3StorageOptions': s3StorageOptions,
        if (securityPolicyName != null)
          'SecurityPolicyName': securityPolicyName,
        if (structuredLogDestinations != null)
          'StructuredLogDestinations': structuredLogDestinations,
        if (tags != null) 'Tags': tags,
        if (workflowDetails != null) 'WorkflowDetails': workflowDetails,
      },
    );

    return CreateServerResponse.fromJson(jsonResponse.body);
  }

  /// Describes a file transfer protocol-enabled server that you specify by
  /// passing the <code>ServerId</code> parameter.
  ///
  /// The response contains a description of a server's properties. When you set
  /// <code>EndpointType</code> to VPC, the response will contain the
  /// <code>EndpointDetails</code>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server.
  Future<DescribeServerResponse> describeServer({
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
      },
    );

    return DescribeServerResponse.fromJson(jsonResponse.body);
  }

  /// Updates the file transfer protocol-enabled server's properties after that
  /// server has been created.
  ///
  /// The <code>UpdateServer</code> call returns the <code>ServerId</code> of
  /// the server you updated.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance that the
  /// Transfer Family user is assigned to.
  ///
  /// Parameter [certificate] :
  /// The Amazon Resource Name (ARN) of the Amazon Web ServicesCertificate
  /// Manager (ACM) certificate. Required when <code>Protocols</code> is set to
  /// <code>FTPS</code>.
  ///
  /// To request a new public certificate, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html">Request
  /// a public certificate</a> in the <i> Amazon Web ServicesCertificate Manager
  /// User Guide</i>.
  ///
  /// To import an existing certificate into ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// certificates into ACM</a> in the <i> Amazon Web ServicesCertificate
  /// Manager User Guide</i>.
  ///
  /// To request a private certificate to use FTPS through private IP addresses,
  /// see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-private.html">Request
  /// a private certificate</a> in the <i> Amazon Web ServicesCertificate
  /// Manager User Guide</i>.
  ///
  /// Certificates with the following cryptographic algorithms and key sizes are
  /// supported:
  ///
  /// <ul>
  /// <li>
  /// 2048-bit RSA (RSA_2048)
  /// </li>
  /// <li>
  /// 4096-bit RSA (RSA_4096)
  /// </li>
  /// <li>
  /// Elliptic Prime Curve 256 bit (EC_prime256v1)
  /// </li>
  /// <li>
  /// Elliptic Prime Curve 384 bit (EC_secp384r1)
  /// </li>
  /// <li>
  /// Elliptic Prime Curve 521 bit (EC_secp521r1)
  /// </li>
  /// </ul> <note>
  /// The certificate must be a valid SSL/TLS X.509 version 3 certificate with
  /// FQDN or IP address specified and information about the issuer.
  /// </note>
  ///
  /// Parameter [endpointDetails] :
  /// The virtual private cloud (VPC) endpoint settings that are configured for
  /// your server. When you host your endpoint within your VPC, you can make
  /// your endpoint accessible only to resources within your VPC, or you can
  /// attach Elastic IP addresses and make your endpoint accessible to clients
  /// over the internet. Your VPC's default security groups are automatically
  /// assigned to your endpoint.
  ///
  /// Parameter [endpointType] :
  /// The type of endpoint that you want your server to use. You can choose to
  /// make your server's endpoint publicly accessible (PUBLIC) or host it inside
  /// your VPC. With an endpoint that is hosted in a VPC, you can restrict
  /// access to your server and resources only within your VPC or choose to make
  /// it internet facing by attaching Elastic IP addresses directly to it.
  /// <note>
  /// After May 19, 2021, you won't be able to create a server using
  /// <code>EndpointType=VPC_ENDPOINT</code> in your Amazon Web Services account
  /// if your account hasn't already done so before May 19, 2021. If you have
  /// already created servers with <code>EndpointType=VPC_ENDPOINT</code> in
  /// your Amazon Web Services account on or before May 19, 2021, you will not
  /// be affected. After this date, use
  /// <code>EndpointType</code>=<code>VPC</code>.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
  ///
  /// It is recommended that you use <code>VPC</code> as the
  /// <code>EndpointType</code>. With this endpoint type, you have the option to
  /// directly associate up to three Elastic IPv4 addresses (BYO IP included)
  /// with your server's endpoint and use VPC security groups to restrict
  /// traffic by the client's public IP address. This is not possible with
  /// <code>EndpointType</code> set to <code>VPC_ENDPOINT</code>.
  /// </note>
  ///
  /// Parameter [hostKey] :
  /// The RSA, ECDSA, or ED25519 private key to use for your SFTP-enabled
  /// server. You can add multiple host keys, in case you want to rotate keys,
  /// or have a set of active keys that use different algorithms.
  ///
  /// Use the following command to generate an RSA 2048 bit key with no
  /// passphrase:
  ///
  /// <code>ssh-keygen -t rsa -b 2048 -N "" -m PEM -f my-new-server-key</code>.
  ///
  /// Use a minimum value of 2048 for the <code>-b</code> option. You can create
  /// a stronger key by using 3072 or 4096.
  ///
  /// Use the following command to generate an ECDSA 256 bit key with no
  /// passphrase:
  ///
  /// <code>ssh-keygen -t ecdsa -b 256 -N "" -m PEM -f my-new-server-key</code>.
  ///
  /// Valid values for the <code>-b</code> option for ECDSA are 256, 384, and
  /// 521.
  ///
  /// Use the following command to generate an ED25519 key with no passphrase:
  ///
  /// <code>ssh-keygen -t ed25519 -N "" -f my-new-server-key</code>.
  ///
  /// For all of these commands, you can replace <i>my-new-server-key</i> with a
  /// string of your choice.
  /// <important>
  /// If you aren't planning to migrate existing users from an existing
  /// SFTP-enabled server to a new server, don't update the host key.
  /// Accidentally changing a server's host key can be disruptive.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key">Manage
  /// host keys for your SFTP-enabled server</a> in the <i>Transfer Family User
  /// Guide</i>.
  ///
  /// Parameter [identityProviderDetails] :
  /// An array containing all of the information required to call a customer's
  /// authentication API method.
  ///
  /// Parameter [identityProviderType] :
  /// The mode of authentication for a server. The default value is
  /// <code>SERVICE_MANAGED</code>, which allows you to store and access user
  /// credentials within the Transfer Family service.
  ///
  /// Use <code>AWS_DIRECTORY_SERVICE</code> to provide access to Active
  /// Directory groups in Directory Service for Microsoft Active Directory or
  /// Microsoft Active Directory in your on-premises environment or in Amazon
  /// Web Services using AD Connector. This option also requires you to provide
  /// a Directory ID by using the <code>IdentityProviderDetails</code>
  /// parameter.
  ///
  /// Use the <code>API_GATEWAY</code> value to integrate with an identity
  /// provider of your choosing. The <code>API_GATEWAY</code> setting requires
  /// you to provide an Amazon API Gateway endpoint URL to call for
  /// authentication by using the <code>IdentityProviderDetails</code>
  /// parameter.
  ///
  /// Use the <code>AWS_LAMBDA</code> value to directly use an Lambda function
  /// as your identity provider. If you choose this value, you must specify the
  /// ARN for the Lambda function in the <code>Function</code> parameter for the
  /// <code>IdentityProviderDetails</code> data type.
  ///
  /// Parameter [ipAddressType] :
  /// Specifies whether to use IPv4 only, or to use dual-stack (IPv4 and IPv6)
  /// for your Transfer Family endpoint. The default value is <code>IPV4</code>.
  /// <important>
  /// The <code>IpAddressType</code> parameter has the following limitations:
  ///
  /// <ul>
  /// <li>
  /// It cannot be changed while the server is online. You must stop the server
  /// before modifying this parameter.
  /// </li>
  /// <li>
  /// It cannot be updated to <code>DUALSTACK</code> if the server has
  /// <code>AddressAllocationIds</code> specified.
  /// </li>
  /// </ul> </important> <note>
  /// When using <code>DUALSTACK</code> as the <code>IpAddressType</code>, you
  /// cannot set the <code>AddressAllocationIds</code> parameter for the <a
  /// href="https://docs.aws.amazon.com/transfer/latest/APIReference/API_EndpointDetails.html">EndpointDetails</a>
  /// for the server.
  /// </note>
  ///
  /// Parameter [loggingRole] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that allows a server to turn on Amazon CloudWatch logging for Amazon
  /// S3 or Amazon EFS events. When set, you can view user activity in your
  /// CloudWatch logs.
  ///
  /// Parameter [postAuthenticationLoginBanner] :
  /// Specifies a string to display when users connect to a server. This string
  /// is displayed after the user authenticates.
  /// <note>
  /// The SFTP protocol does not support post-authentication display banners.
  /// </note>
  ///
  /// Parameter [preAuthenticationLoginBanner] :
  /// Specifies a string to display when users connect to a server. This string
  /// is displayed before the user authenticates. For example, the following
  /// banner displays details about using the system:
  ///
  /// <code>This system is for the use of authorized users only. Individuals
  /// using this computer system without authority, or in excess of their
  /// authority, are subject to having all of their activities on this system
  /// monitored and recorded by system personnel.</code>
  ///
  /// Parameter [protocolDetails] :
  /// The protocol settings that are configured for your server.
  /// <note>
  /// Avoid placing Network Load Balancers (NLBs) or NAT gateways in front of
  /// Transfer Family servers, as this increases costs and can cause performance
  /// issues, including reduced connection limits for FTPS. For more details,
  /// see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/infrastructure-security.html#nlb-considerations">
  /// Avoid placing NLBs and NATs in front of Transfer Family</a>.
  /// </note>
  /// <ul>
  /// <li>
  /// To indicate passive mode (for FTP and FTPS protocols), use the
  /// <code>PassiveIp</code> parameter. Enter a single dotted-quad IPv4 address,
  /// such as the external IP address of a firewall, router, or load balancer.
  /// </li>
  /// <li>
  /// To ignore the error that is generated when the client attempts to use the
  /// <code>SETSTAT</code> command on a file that you are uploading to an Amazon
  /// S3 bucket, use the <code>SetStatOption</code> parameter. To have the
  /// Transfer Family server ignore the <code>SETSTAT</code> command and upload
  /// files without needing to make any changes to your SFTP client, set the
  /// value to <code>ENABLE_NO_OP</code>. If you set the
  /// <code>SetStatOption</code> parameter to <code>ENABLE_NO_OP</code>,
  /// Transfer Family generates a log entry to Amazon CloudWatch Logs, so that
  /// you can determine when the client is making a <code>SETSTAT</code> call.
  /// </li>
  /// <li>
  /// To determine whether your Transfer Family server resumes recent,
  /// negotiated sessions through a unique session ID, use the
  /// <code>TlsSessionResumptionMode</code> parameter.
  /// </li>
  /// <li>
  /// <code>As2Transports</code> indicates the transport method for the AS2
  /// messages. Currently, only HTTP is supported.
  /// </li>
  /// </ul>
  ///
  /// Parameter [protocols] :
  /// Specifies the file transfer protocol or protocols over which your file
  /// transfer protocol client can connect to your server's endpoint. The
  /// available protocols are:
  ///
  /// <ul>
  /// <li>
  /// <code>SFTP</code> (Secure Shell (SSH) File Transfer Protocol): File
  /// transfer over SSH
  /// </li>
  /// <li>
  /// <code>FTPS</code> (File Transfer Protocol Secure): File transfer with TLS
  /// encryption
  /// </li>
  /// <li>
  /// <code>FTP</code> (File Transfer Protocol): Unencrypted file transfer
  /// </li>
  /// <li>
  /// <code>AS2</code> (Applicability Statement 2): used for transporting
  /// structured business-to-business data
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If you select <code>FTPS</code>, you must choose a certificate stored in
  /// Certificate Manager (ACM) which is used to identify your server when
  /// clients connect to it over FTPS.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> includes either <code>FTP</code> or
  /// <code>FTPS</code>, then the <code>EndpointType</code> must be
  /// <code>VPC</code> and the <code>IdentityProviderType</code> must be either
  /// <code>AWS_DIRECTORY_SERVICE</code>, <code>AWS_LAMBDA</code>, or
  /// <code>API_GATEWAY</code>.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> includes <code>FTP</code>, then
  /// <code>AddressAllocationIds</code> cannot be associated.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> is set only to <code>SFTP</code>, the
  /// <code>EndpointType</code> can be set to <code>PUBLIC</code> and the
  /// <code>IdentityProviderType</code> can be set any of the supported identity
  /// types: <code>SERVICE_MANAGED</code>, <code>AWS_DIRECTORY_SERVICE</code>,
  /// <code>AWS_LAMBDA</code>, or <code>API_GATEWAY</code>.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> includes <code>AS2</code>, then the
  /// <code>EndpointType</code> must be <code>VPC</code>, and domain must be
  /// Amazon S3.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [s3StorageOptions] :
  /// Specifies whether or not performance for your Amazon S3 directories is
  /// optimized.
  ///
  /// <ul>
  /// <li>
  /// If using the console, this is enabled by default.
  /// </li>
  /// <li>
  /// If using the API or CLI, this is disabled by default.
  /// </li>
  /// </ul>
  /// By default, home directory mappings have a <code>TYPE</code> of
  /// <code>DIRECTORY</code>. If you enable this option, you would then need to
  /// explicitly set the <code>HomeDirectoryMapEntry</code> <code>Type</code> to
  /// <code>FILE</code> if you want a mapping to have a file target.
  ///
  /// Parameter [securityPolicyName] :
  /// Specifies the name of the security policy for the server.
  ///
  /// Parameter [structuredLogDestinations] :
  /// Specifies the log groups to which your server logs are sent.
  ///
  /// To specify a log group, you must provide the ARN for an existing log
  /// group. In this case, the format of the log group is as follows:
  ///
  /// <code>arn:aws:logs:region-name:amazon-account-id:log-group:log-group-name:*</code>
  ///
  /// For example,
  /// <code>arn:aws:logs:us-east-1:111122223333:log-group:mytestgroup:*</code>
  ///
  /// If you have previously specified a log group for a server, you can clear
  /// it, and in effect turn off structured logging, by providing an empty value
  /// for this parameter in an <code>update-server</code> call. For example:
  ///
  /// <code>update-server --server-id s-1234567890abcdef0
  /// --structured-log-destinations</code>
  ///
  /// Parameter [workflowDetails] :
  /// Specifies the workflow ID for the workflow to assign and the execution
  /// role that's used for executing the workflow.
  ///
  /// In addition to a workflow to execute when a file is uploaded completely,
  /// <code>WorkflowDetails</code> can also contain a workflow ID (and execution
  /// role) for a workflow to execute on partial upload. A partial upload occurs
  /// when the server session disconnects while the file is still being
  /// uploaded.
  ///
  /// To remove an associated workflow from a server, you can provide an empty
  /// <code>OnUpload</code> object, as in the following example.
  ///
  /// <code>aws transfer update-server --server-id s-01234567890abcdef
  /// --workflow-details '{"OnUpload":\[\]}'</code>
  Future<UpdateServerResponse> updateServer({
    required String serverId,
    String? certificate,
    EndpointDetails? endpointDetails,
    EndpointType? endpointType,
    String? hostKey,
    IdentityProviderDetails? identityProviderDetails,
    IdentityProviderType? identityProviderType,
    IpAddressType? ipAddressType,
    String? loggingRole,
    String? postAuthenticationLoginBanner,
    String? preAuthenticationLoginBanner,
    ProtocolDetails? protocolDetails,
    List<Protocol>? protocols,
    S3StorageOptions? s3StorageOptions,
    String? securityPolicyName,
    List<String>? structuredLogDestinations,
    WorkflowDetails? workflowDetails,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        if (certificate != null) 'Certificate': certificate,
        if (endpointDetails != null) 'EndpointDetails': endpointDetails,
        if (endpointType != null) 'EndpointType': endpointType.value,
        if (hostKey != null) 'HostKey': hostKey,
        if (identityProviderDetails != null)
          'IdentityProviderDetails': identityProviderDetails,
        if (identityProviderType != null)
          'IdentityProviderType': identityProviderType.value,
        if (ipAddressType != null) 'IpAddressType': ipAddressType.value,
        if (loggingRole != null) 'LoggingRole': loggingRole,
        if (postAuthenticationLoginBanner != null)
          'PostAuthenticationLoginBanner': postAuthenticationLoginBanner,
        if (preAuthenticationLoginBanner != null)
          'PreAuthenticationLoginBanner': preAuthenticationLoginBanner,
        if (protocolDetails != null) 'ProtocolDetails': protocolDetails,
        if (protocols != null)
          'Protocols': protocols.map((e) => e.value).toList(),
        if (s3StorageOptions != null) 'S3StorageOptions': s3StorageOptions,
        if (securityPolicyName != null)
          'SecurityPolicyName': securityPolicyName,
        if (structuredLogDestinations != null)
          'StructuredLogDestinations': structuredLogDestinations,
        if (workflowDetails != null) 'WorkflowDetails': workflowDetails,
      },
    );

    return UpdateServerResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the file transfer protocol-enabled server that you specify.
  ///
  /// No response returns from this operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [serverId] :
  /// A unique system-assigned identifier for a server instance.
  Future<void> deleteServer({
    required String serverId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteServer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
      },
    );
  }

  /// Lists the file transfer protocol-enabled servers that are associated with
  /// your Amazon Web Services account.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of servers to return as a response to the
  /// <code>ListServers</code> query.
  ///
  /// Parameter [nextToken] :
  /// When additional results are obtained from the <code>ListServers</code>
  /// command, a <code>NextToken</code> parameter is returned in the output. You
  /// can then pass the <code>NextToken</code> parameter in a subsequent command
  /// to continue listing additional servers.
  Future<ListServersResponse> listServers({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListServers'
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

    return ListServersResponse.fromJson(jsonResponse.body);
  }

  /// Creates a user and associates them with an existing file transfer
  /// protocol-enabled server. You can only create and associate users with
  /// servers that have the <code>IdentityProviderType</code> set to
  /// <code>SERVICE_MANAGED</code>. Using parameters for
  /// <code>CreateUser</code>, you can specify the user name, set the home
  /// directory, store the user's public key, and assign the user's Identity and
  /// Access Management (IAM) role. You can also optionally add a session
  /// policy, and assign metadata with tags that can be used to group and search
  /// for users.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that controls your users' access to your Amazon S3 bucket or Amazon
  /// EFS file system. The policies attached to this role determine the level of
  /// access that you want to provide your users when transferring files into
  /// and out of your Amazon S3 bucket or Amazon EFS file system. The IAM role
  /// should also contain a trust relationship that allows the server to access
  /// your resources when servicing your users' transfer requests.
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance. This is the
  /// specific server that you added your user to.
  ///
  /// Parameter [userName] :
  /// A unique string that identifies a user and is associated with a
  /// <code>ServerId</code>. This user name must be a minimum of 3 and a maximum
  /// of 100 characters long. The following are valid characters: a-z, A-Z, 0-9,
  /// underscore '_', hyphen '-', period '.', and at sign '@'. The user name
  /// can't start with a hyphen, period, or at sign.
  ///
  /// Parameter [homeDirectory] :
  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  /// <note>
  /// You can use the <code>HomeDirectory</code> parameter for
  /// <code>HomeDirectoryType</code> when it is set to either <code>PATH</code>
  /// or <code>LOGICAL</code>.
  /// </note>
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you
  /// only specify a target, it is displayed as is. You also must ensure that
  /// your Identity and Access Management (IAM) role provides access to paths in
  /// <code>Target</code>. This value can be set only when
  /// <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example.
  ///
  /// <code>\[ { "Entry": "/directory1", "Target":
  /// "/bucket_name/home/mydirectory" } \]</code>
  ///
  /// In most cases, you can use this value instead of the session policy to
  /// lock your user down to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to
  /// <code>/</code> and set <code>Target</code> to the value the user should
  /// see for their home directory when they log in.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example for <code>chroot</code>.
  ///
  /// <code>\[ { "Entry": "/", "Target": "/bucket_name/home/mydirectory" }
  /// \]</code>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) that you want your users' home
  /// directory to be when they log in to the server. If you set it to
  /// <code>PATH</code>, the user will see the absolute Amazon S3 bucket or
  /// Amazon EFS path as is in their file transfer protocol clients. If you set
  /// it to <code>LOGICAL</code>, you need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// Amazon EFS paths visible to your users.
  /// <note>
  /// If <code>HomeDirectoryType</code> is <code>LOGICAL</code>, you must
  /// provide mappings, using the <code>HomeDirectoryMappings</code> parameter.
  /// If, on the other hand, <code>HomeDirectoryType</code> is
  /// <code>PATH</code>, you provide an absolute path using the
  /// <code>HomeDirectory</code> parameter. You cannot have both
  /// <code>HomeDirectory</code> and <code>HomeDirectoryMappings</code> in your
  /// template.
  /// </note>
  ///
  /// Parameter [policy] :
  /// A session policy for your user so that you can use the same Identity and
  /// Access Management (IAM) role across multiple users. This policy scopes
  /// down a user's access to portions of their Amazon S3 bucket. Variables that
  /// you can use inside this policy include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// This policy applies only when the domain of <code>ServerId</code> is
  /// Amazon S3. Amazon EFS does not use session policies.
  ///
  /// For session policies, Transfer Family stores the policy as a JSON blob,
  /// instead of the Amazon Resource Name (ARN) of the policy. You save the
  /// policy as a JSON blob and pass it in the <code>Policy</code> argument.
  ///
  /// For an example of a session policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/session-policy.html">Example
  /// session policy</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a>
  /// in the <i>Amazon Web Services Security Token Service API Reference</i>.
  /// </note>
  ///
  /// Parameter [posixProfile] :
  /// Specifies the full POSIX identity, including user ID (<code>Uid</code>),
  /// group ID (<code>Gid</code>), and any secondary groups IDs
  /// (<code>SecondaryGids</code>), that controls your users' access to your
  /// Amazon EFS file systems. The POSIX permissions that are set on files and
  /// directories in Amazon EFS determine the level of access your users get
  /// when transferring files into and out of your Amazon EFS file systems.
  ///
  /// Parameter [sshPublicKeyBody] :
  /// The public portion of the Secure Shell (SSH) key used to authenticate the
  /// user to the server.
  ///
  /// The three standard SSH public key format elements are <code>&lt;key
  /// type&gt;</code>, <code>&lt;body base64&gt;</code>, and an optional
  /// <code>&lt;comment&gt;</code>, with spaces between each element.
  ///
  /// Transfer Family accepts RSA, ECDSA, and ED25519 keys.
  ///
  /// <ul>
  /// <li>
  /// For RSA keys, the key type is <code>ssh-rsa</code>.
  /// </li>
  /// <li>
  /// For ED25519 keys, the key type is <code>ssh-ed25519</code>.
  /// </li>
  /// <li>
  /// For ECDSA keys, the key type is either <code>ecdsa-sha2-nistp256</code>,
  /// <code>ecdsa-sha2-nistp384</code>, or <code>ecdsa-sha2-nistp521</code>,
  /// depending on the size of the key you generated.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for users. Tags are
  /// metadata attached to users for any purpose.
  Future<CreateUserResponse> createUser({
    required String role,
    required String serverId,
    required String userName,
    String? homeDirectory,
    List<HomeDirectoryMapEntry>? homeDirectoryMappings,
    HomeDirectoryType? homeDirectoryType,
    String? policy,
    PosixProfile? posixProfile,
    String? sshPublicKeyBody,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.CreateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Role': role,
        'ServerId': serverId,
        'UserName': userName,
        if (homeDirectory != null) 'HomeDirectory': homeDirectory,
        if (homeDirectoryMappings != null)
          'HomeDirectoryMappings': homeDirectoryMappings,
        if (homeDirectoryType != null)
          'HomeDirectoryType': homeDirectoryType.value,
        if (policy != null) 'Policy': policy,
        if (posixProfile != null) 'PosixProfile': posixProfile,
        if (sshPublicKeyBody != null) 'SshPublicKeyBody': sshPublicKeyBody,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Describes the user assigned to the specific file transfer protocol-enabled
  /// server, as identified by its <code>ServerId</code> property.
  ///
  /// The response from this call returns the properties of the user associated
  /// with the <code>ServerId</code> value that was specified.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that has this user
  /// assigned.
  ///
  /// Parameter [userName] :
  /// The name of the user assigned to one or more servers. User names are part
  /// of the sign-in credentials to use the Transfer Family service and perform
  /// file transfer tasks.
  Future<DescribeUserResponse> describeUser({
    required String serverId,
    required String userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        'UserName': userName,
      },
    );

    return DescribeUserResponse.fromJson(jsonResponse.body);
  }

  /// Assigns new properties to a user. Parameters you pass modify any or all of
  /// the following: the home directory, role, and policy for the
  /// <code>UserName</code> and <code>ServerId</code> you specify.
  ///
  /// The response returns the <code>ServerId</code> and the
  /// <code>UserName</code> for the updated user.
  ///
  /// In the console, you can select <i>Restricted</i> when you create or update
  /// a user. This ensures that the user can't access anything outside of their
  /// home directory. The programmatic way to configure this behavior is to
  /// update the user. Set their <code>HomeDirectoryType</code> to
  /// <code>LOGICAL</code>, and specify <code>HomeDirectoryMappings</code> with
  /// <code>Entry</code> as root (<code>/</code>) and <code>Target</code> as
  /// their home directory.
  ///
  /// For example, if the user's home directory is
  /// <code>/test/admin-user</code>, the following command updates the user so
  /// that their configuration in the console shows the <i>Restricted</i> flag
  /// as selected.
  ///
  /// <code> aws transfer update-user --server-id &lt;server-id&gt; --user-name
  /// admin-user --home-directory-type LOGICAL --home-directory-mappings
  /// "\[{\"Entry\":\"/\", \"Target\":\"/test/admin-user\"}\]"</code>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a Transfer Family server instance
  /// that the user is assigned to.
  ///
  /// Parameter [userName] :
  /// A unique string that identifies a user and is associated with a server as
  /// specified by the <code>ServerId</code>. This user name must be a minimum
  /// of 3 and a maximum of 100 characters long. The following are valid
  /// characters: a-z, A-Z, 0-9, underscore '_', hyphen '-', period '.', and at
  /// sign '@'. The user name can't start with a hyphen, period, or at sign.
  ///
  /// Parameter [homeDirectory] :
  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  /// <note>
  /// You can use the <code>HomeDirectory</code> parameter for
  /// <code>HomeDirectoryType</code> when it is set to either <code>PATH</code>
  /// or <code>LOGICAL</code>.
  /// </note>
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you
  /// only specify a target, it is displayed as is. You also must ensure that
  /// your Identity and Access Management (IAM) role provides access to paths in
  /// <code>Target</code>. This value can be set only when
  /// <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example.
  ///
  /// <code>\[ { "Entry": "/directory1", "Target":
  /// "/bucket_name/home/mydirectory" } \]</code>
  ///
  /// In most cases, you can use this value instead of the session policy to
  /// lock down your user to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to '/'
  /// and set <code>Target</code> to the HomeDirectory parameter value.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example for <code>chroot</code>.
  ///
  /// <code>\[ { "Entry": "/", "Target": "/bucket_name/home/mydirectory" }
  /// \]</code>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) that you want your users' home
  /// directory to be when they log in to the server. If you set it to
  /// <code>PATH</code>, the user will see the absolute Amazon S3 bucket or
  /// Amazon EFS path as is in their file transfer protocol clients. If you set
  /// it to <code>LOGICAL</code>, you need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// Amazon EFS paths visible to your users.
  /// <note>
  /// If <code>HomeDirectoryType</code> is <code>LOGICAL</code>, you must
  /// provide mappings, using the <code>HomeDirectoryMappings</code> parameter.
  /// If, on the other hand, <code>HomeDirectoryType</code> is
  /// <code>PATH</code>, you provide an absolute path using the
  /// <code>HomeDirectory</code> parameter. You cannot have both
  /// <code>HomeDirectory</code> and <code>HomeDirectoryMappings</code> in your
  /// template.
  /// </note>
  ///
  /// Parameter [policy] :
  /// A session policy for your user so that you can use the same Identity and
  /// Access Management (IAM) role across multiple users. This policy scopes
  /// down a user's access to portions of their Amazon S3 bucket. Variables that
  /// you can use inside this policy include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// This policy applies only when the domain of <code>ServerId</code> is
  /// Amazon S3. Amazon EFS does not use session policies.
  ///
  /// For session policies, Transfer Family stores the policy as a JSON blob,
  /// instead of the Amazon Resource Name (ARN) of the policy. You save the
  /// policy as a JSON blob and pass it in the <code>Policy</code> argument.
  ///
  /// For an example of a session policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/session-policy">Creating
  /// a session policy</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a>
  /// in the <i>Amazon Web Services Security Token Service API Reference</i>.
  /// </note>
  ///
  /// Parameter [posixProfile] :
  /// Specifies the full POSIX identity, including user ID (<code>Uid</code>),
  /// group ID (<code>Gid</code>), and any secondary groups IDs
  /// (<code>SecondaryGids</code>), that controls your users' access to your
  /// Amazon Elastic File Systems (Amazon EFS). The POSIX permissions that are
  /// set on files and directories in your file system determines the level of
  /// access your users get when transferring files into and out of your Amazon
  /// EFS file systems.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that controls your users' access to your Amazon S3 bucket or Amazon
  /// EFS file system. The policies attached to this role determine the level of
  /// access that you want to provide your users when transferring files into
  /// and out of your Amazon S3 bucket or Amazon EFS file system. The IAM role
  /// should also contain a trust relationship that allows the server to access
  /// your resources when servicing your users' transfer requests.
  Future<UpdateUserResponse> updateUser({
    required String serverId,
    required String userName,
    String? homeDirectory,
    List<HomeDirectoryMapEntry>? homeDirectoryMappings,
    HomeDirectoryType? homeDirectoryType,
    String? policy,
    PosixProfile? posixProfile,
    String? role,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        'UserName': userName,
        if (homeDirectory != null) 'HomeDirectory': homeDirectory,
        if (homeDirectoryMappings != null)
          'HomeDirectoryMappings': homeDirectoryMappings,
        if (homeDirectoryType != null)
          'HomeDirectoryType': homeDirectoryType.value,
        if (policy != null) 'Policy': policy,
        if (posixProfile != null) 'PosixProfile': posixProfile,
        if (role != null) 'Role': role,
      },
    );

    return UpdateUserResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the user belonging to a file transfer protocol-enabled server you
  /// specify.
  ///
  /// No response returns from this operation.
  /// <note>
  /// When you delete a user from a server, the user's information is lost.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance that has the
  /// user assigned to it.
  ///
  /// Parameter [userName] :
  /// A unique string that identifies a user that is being deleted from a
  /// server.
  Future<void> deleteUser({
    required String serverId,
    required String userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        'UserName': userName,
      },
    );
  }

  /// Lists the users for a file transfer protocol-enabled server that you
  /// specify by passing the <code>ServerId</code> parameter.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that has users assigned
  /// to it.
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of users to return as a response to the
  /// <code>ListUsers</code> request.
  ///
  /// Parameter [nextToken] :
  /// If there are additional results from the <code>ListUsers</code> call, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass the <code>NextToken</code> to a subsequent <code>ListUsers</code>
  /// command, to continue listing additional users.
  Future<ListUsersResponse> listUsers({
    required String serverId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerId': serverId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListUsersResponse.fromJson(jsonResponse.body);
  }

  /// Describes the web app customization object that's identified by
  /// <code>WebAppId</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [webAppId] :
  /// Provide the unique identifier for the web app.
  Future<DescribeWebAppCustomizationResponse> describeWebAppCustomization({
    required String webAppId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeWebAppCustomization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebAppId': webAppId,
      },
    );

    return DescribeWebAppCustomizationResponse.fromJson(jsonResponse.body);
  }

  /// Assigns new customization properties to a web app. You can modify the icon
  /// file, logo file, and title.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [webAppId] :
  /// Provide the identifier of the web app that you are updating.
  ///
  /// Parameter [faviconFile] :
  /// Specify an icon file data string (in base64 encoding).
  ///
  /// Parameter [logoFile] :
  /// Specify logo file data string (in base64 encoding).
  ///
  /// Parameter [title] :
  /// Provide an updated title.
  Future<UpdateWebAppCustomizationResponse> updateWebAppCustomization({
    required String webAppId,
    Uint8List? faviconFile,
    Uint8List? logoFile,
    String? title,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateWebAppCustomization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebAppId': webAppId,
        if (faviconFile != null) 'FaviconFile': base64Encode(faviconFile),
        if (logoFile != null) 'LogoFile': base64Encode(logoFile),
        if (title != null) 'Title': title,
      },
    );

    return UpdateWebAppCustomizationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the <code>WebAppCustomization</code> object that corresponds to
  /// the web app ID specified.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [webAppId] :
  /// Provide the unique identifier for the web app that contains the
  /// customizations that you are deleting.
  Future<void> deleteWebAppCustomization({
    required String webAppId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteWebAppCustomization'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebAppId': webAppId,
      },
    );
  }

  /// Creates a web app based on specified parameters, and returns the ID for
  /// the new web app. You can configure the web app to be publicly accessible
  /// or hosted within a VPC.
  ///
  /// For more information about using VPC endpoints with Transfer Family, see
  /// <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/create-webapp-in-vpc.html">Create
  /// a Transfer Family web app in a VPC</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identityProviderDetails] :
  /// You can provide a structure that contains the details for the identity
  /// provider to use with your web app.
  ///
  /// For more details about this parameter, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/webapp-identity-center.html">Configure
  /// your identity provider for Transfer Family web apps</a>.
  ///
  /// Parameter [accessEndpoint] :
  /// The <code>AccessEndpoint</code> is the URL that you provide to your users
  /// for them to interact with the Transfer Family web app. You can specify a
  /// custom URL or use the default value.
  ///
  /// Before you enter a custom URL for this parameter, follow the steps
  /// described in <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/webapp-customize.html">Update
  /// your access endpoint with a custom URL</a>.
  ///
  /// Parameter [endpointDetails] :
  /// The endpoint configuration for the web app. You can specify whether the
  /// web app endpoint is publicly accessible or hosted within a VPC.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for web apps.
  ///
  /// Parameter [webAppEndpointPolicy] :
  /// Setting for the type of endpoint policy for the web app. The default value
  /// is <code>STANDARD</code>.
  ///
  /// If you are creating the web app in an Amazon Web Services GovCloud (US)
  /// Region, you can set this parameter to <code>FIPS</code>.
  ///
  /// Parameter [webAppUnits] :
  /// A union that contains the value for number of concurrent connections or
  /// the user sessions on your web app.
  Future<CreateWebAppResponse> createWebApp({
    required WebAppIdentityProviderDetails identityProviderDetails,
    String? accessEndpoint,
    WebAppEndpointDetails? endpointDetails,
    List<Tag>? tags,
    WebAppEndpointPolicy? webAppEndpointPolicy,
    WebAppUnits? webAppUnits,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.CreateWebApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityProviderDetails': identityProviderDetails,
        if (accessEndpoint != null) 'AccessEndpoint': accessEndpoint,
        if (endpointDetails != null) 'EndpointDetails': endpointDetails,
        if (tags != null) 'Tags': tags,
        if (webAppEndpointPolicy != null)
          'WebAppEndpointPolicy': webAppEndpointPolicy.value,
        if (webAppUnits != null) 'WebAppUnits': webAppUnits,
      },
    );

    return CreateWebAppResponse.fromJson(jsonResponse.body);
  }

  /// Describes the web app that's identified by <code>WebAppId</code>. The
  /// response includes endpoint configuration details such as whether the web
  /// app is publicly accessible or VPC hosted.
  ///
  /// For more information about using VPC endpoints with Transfer Family, see
  /// <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/create-webapp-in-vpc.html">Create
  /// a Transfer Family web app in a VPC</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [webAppId] :
  /// Provide the unique identifier for the web app.
  Future<DescribeWebAppResponse> describeWebApp({
    required String webAppId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeWebApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebAppId': webAppId,
      },
    );

    return DescribeWebAppResponse.fromJson(jsonResponse.body);
  }

  /// Assigns new properties to a web app. You can modify the access point,
  /// identity provider details, endpoint configuration, and the web app units.
  ///
  /// For more information about using VPC endpoints with Transfer Family, see
  /// <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/create-webapp-in-vpc.html">Create
  /// a Transfer Family web app in a VPC</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [webAppId] :
  /// Provide the identifier of the web app that you are updating.
  ///
  /// Parameter [accessEndpoint] :
  /// The <code>AccessEndpoint</code> is the URL that you provide to your users
  /// for them to interact with the Transfer Family web app. You can specify a
  /// custom URL or use the default value.
  ///
  /// Parameter [endpointDetails] :
  /// The updated endpoint configuration for the web app. You can modify the
  /// endpoint type and VPC configuration settings.
  ///
  /// Parameter [identityProviderDetails] :
  /// Provide updated identity provider values in a
  /// <code>WebAppIdentityProviderDetails</code> object.
  ///
  /// Parameter [webAppUnits] :
  /// A union that contains the value for number of concurrent connections or
  /// the user sessions on your web app.
  Future<UpdateWebAppResponse> updateWebApp({
    required String webAppId,
    String? accessEndpoint,
    UpdateWebAppEndpointDetails? endpointDetails,
    UpdateWebAppIdentityProviderDetails? identityProviderDetails,
    WebAppUnits? webAppUnits,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UpdateWebApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebAppId': webAppId,
        if (accessEndpoint != null) 'AccessEndpoint': accessEndpoint,
        if (endpointDetails != null) 'EndpointDetails': endpointDetails,
        if (identityProviderDetails != null)
          'IdentityProviderDetails': identityProviderDetails,
        if (webAppUnits != null) 'WebAppUnits': webAppUnits,
      },
    );

    return UpdateWebAppResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified web app.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [webAppId] :
  /// Provide the unique identifier for the web app that you are deleting.
  Future<void> deleteWebApp({
    required String webAppId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteWebApp'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WebAppId': webAppId,
      },
    );
  }

  /// Lists all web apps associated with your Amazon Web Services account for
  /// your current region. The response includes the endpoint type for each web
  /// app, showing whether it is publicly accessible or VPC hosted.
  ///
  /// For more information about using VPC endpoints with Transfer Family, see
  /// <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/create-webapp-in-vpc.html">Create
  /// a Transfer Family web app in a VPC</a>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// Returns the <code>NextToken</code> parameter in the output. You can then
  /// pass the <code>NextToken</code> parameter in a subsequent command to
  /// continue listing additional web apps.
  Future<ListWebAppsResponse> listWebApps({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListWebApps'
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

    return ListWebAppsResponse.fromJson(jsonResponse.body);
  }

  /// Allows you to create a workflow with specified steps and step details the
  /// workflow invokes after file transfer completes. After creating a workflow,
  /// you can associate the workflow created with any transfer servers by
  /// specifying the <code>workflow-details</code> field in
  /// <code>CreateServer</code> and <code>UpdateServer</code> operations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [steps] :
  /// Specifies the details for the steps that are in the specified workflow.
  ///
  /// The <code>TYPE</code> specifies which of the following actions is being
  /// taken for this step.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>COPY</code> </b> - Copy the file to another location.
  /// </li>
  /// <li>
  /// <b> <code>CUSTOM</code> </b> - Perform a custom step with an Lambda
  /// function target.
  /// </li>
  /// <li>
  /// <b> <code>DECRYPT</code> </b> - Decrypt a file that was encrypted before
  /// it was uploaded.
  /// </li>
  /// <li>
  /// <b> <code>DELETE</code> </b> - Delete the file.
  /// </li>
  /// <li>
  /// <b> <code>TAG</code> </b> - Add a tag to the file.
  /// </li>
  /// </ul> <note>
  /// Currently, copying and tagging are supported only on S3.
  /// </note>
  /// For file location, you specify either the Amazon S3 bucket and key, or the
  /// Amazon EFS file system ID and path.
  ///
  /// Parameter [description] :
  /// A textual description for the workflow.
  ///
  /// Parameter [onExceptionSteps] :
  /// Specifies the steps (actions) to take if errors are encountered during
  /// execution of the workflow.
  /// <note>
  /// For custom steps, the Lambda function needs to send <code>FAILURE</code>
  /// to the call back API to kick off the exception steps. Additionally, if the
  /// Lambda does not send <code>SUCCESS</code> before it times out, the
  /// exception steps are executed.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for workflows. Tags
  /// are metadata attached to workflows for any purpose.
  Future<CreateWorkflowResponse> createWorkflow({
    required List<WorkflowStep> steps,
    String? description,
    List<WorkflowStep>? onExceptionSteps,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.CreateWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Steps': steps,
        if (description != null) 'Description': description,
        if (onExceptionSteps != null) 'OnExceptionSteps': onExceptionSteps,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified workflow.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [workflowId] :
  /// A unique identifier for the workflow.
  Future<DescribeWorkflowResponse> describeWorkflow({
    required String workflowId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DescribeWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkflowId': workflowId,
      },
    );

    return DescribeWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [workflowId] :
  /// A unique identifier for the workflow.
  Future<void> deleteWorkflow({
    required String workflowId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteWorkflow'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkflowId': workflowId,
      },
    );
  }

  /// Lists all workflows associated with your Amazon Web Services account for
  /// your current region.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// <code>ListWorkflows</code> returns the <code>NextToken</code> parameter in
  /// the output. You can then pass the <code>NextToken</code> parameter in a
  /// subsequent command to continue listing additional workflows.
  Future<ListWorkflowsResponse> listWorkflows({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.ListWorkflows'
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

    return ListWorkflowsResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class CreateAccessResponse {
  /// The external identifier of the group whose users have access to your Amazon
  /// S3 or Amazon EFS resources over the enabled protocols using Transfer Family.
  final String externalId;

  /// The identifier of the server that the user is attached to.
  final String serverId;

  CreateAccessResponse({
    required this.externalId,
    required this.serverId,
  });

  factory CreateAccessResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccessResponse(
      externalId: (json['ExternalId'] as String?) ?? '',
      serverId: (json['ServerId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final externalId = this.externalId;
    final serverId = this.serverId;
    return {
      'ExternalId': externalId,
      'ServerId': serverId,
    };
  }
}

/// @nodoc
class DescribeAccessResponse {
  /// The external identifier of the server that the access is attached to.
  final DescribedAccess access;

  /// A system-assigned unique identifier for a server that has this access
  /// assigned.
  final String serverId;

  DescribeAccessResponse({
    required this.access,
    required this.serverId,
  });

  factory DescribeAccessResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccessResponse(
      access: DescribedAccess.fromJson(
          (json['Access'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      serverId: (json['ServerId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final access = this.access;
    final serverId = this.serverId;
    return {
      'Access': access,
      'ServerId': serverId,
    };
  }
}

/// @nodoc
class DescribeExecutionResponse {
  /// The structure that contains the details of the workflow' execution.
  final DescribedExecution execution;

  /// A unique identifier for the workflow.
  final String workflowId;

  DescribeExecutionResponse({
    required this.execution,
    required this.workflowId,
  });

  factory DescribeExecutionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeExecutionResponse(
      execution: DescribedExecution.fromJson(
          (json['Execution'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      workflowId: (json['WorkflowId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final execution = this.execution;
    final workflowId = this.workflowId;
    return {
      'Execution': execution,
      'WorkflowId': workflowId,
    };
  }
}

/// @nodoc
class DescribeHostKeyResponse {
  /// Returns the details for the specified host key.
  final DescribedHostKey hostKey;

  DescribeHostKeyResponse({
    required this.hostKey,
  });

  factory DescribeHostKeyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeHostKeyResponse(
      hostKey: DescribedHostKey.fromJson(
          (json['HostKey'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final hostKey = this.hostKey;
    return {
      'HostKey': hostKey,
    };
  }
}

/// @nodoc
class DescribeSecurityPolicyResponse {
  /// An array containing the properties of the security policy.
  final DescribedSecurityPolicy securityPolicy;

  DescribeSecurityPolicyResponse({
    required this.securityPolicy,
  });

  factory DescribeSecurityPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSecurityPolicyResponse(
      securityPolicy: DescribedSecurityPolicy.fromJson(
          (json['SecurityPolicy'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final securityPolicy = this.securityPolicy;
    return {
      'SecurityPolicy': securityPolicy,
    };
  }
}

/// @nodoc
class ImportHostKeyResponse {
  /// Returns the host key identifier for the imported key.
  final String hostKeyId;

  /// Returns the server identifier that contains the imported key.
  final String serverId;

  ImportHostKeyResponse({
    required this.hostKeyId,
    required this.serverId,
  });

  factory ImportHostKeyResponse.fromJson(Map<String, dynamic> json) {
    return ImportHostKeyResponse(
      hostKeyId: (json['HostKeyId'] as String?) ?? '',
      serverId: (json['ServerId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final hostKeyId = this.hostKeyId;
    final serverId = this.serverId;
    return {
      'HostKeyId': hostKeyId,
      'ServerId': serverId,
    };
  }
}

/// Identifies the user, the server they belong to, and the identifier of the
/// SSH public key associated with that user. A user can have more than one key
/// on each server that they are associated with.
///
/// @nodoc
class ImportSshPublicKeyResponse {
  /// A system-assigned unique identifier for a server.
  final String serverId;

  /// The name given to a public key by the system that was imported.
  final String sshPublicKeyId;

  /// A user name assigned to the <code>ServerID</code> value that you specified.
  final String userName;

  ImportSshPublicKeyResponse({
    required this.serverId,
    required this.sshPublicKeyId,
    required this.userName,
  });

  factory ImportSshPublicKeyResponse.fromJson(Map<String, dynamic> json) {
    return ImportSshPublicKeyResponse(
      serverId: (json['ServerId'] as String?) ?? '',
      sshPublicKeyId: (json['SshPublicKeyId'] as String?) ?? '',
      userName: (json['UserName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    final sshPublicKeyId = this.sshPublicKeyId;
    final userName = this.userName;
    return {
      'ServerId': serverId,
      'SshPublicKeyId': sshPublicKeyId,
      'UserName': userName,
    };
  }
}

/// @nodoc
class ListAccessesResponse {
  /// Returns the accesses and their properties for the <code>ServerId</code>
  /// value that you specify.
  final List<ListedAccess> accesses;

  /// A system-assigned unique identifier for a server that has users assigned to
  /// it.
  final String serverId;

  /// When you can get additional results from the <code>ListAccesses</code> call,
  /// a <code>NextToken</code> parameter is returned in the output. You can then
  /// pass in a subsequent command to the <code>NextToken</code> parameter to
  /// continue listing additional accesses.
  final String? nextToken;

  ListAccessesResponse({
    required this.accesses,
    required this.serverId,
    this.nextToken,
  });

  factory ListAccessesResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessesResponse(
      accesses: ((json['Accesses'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedAccess.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverId: (json['ServerId'] as String?) ?? '',
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accesses = this.accesses;
    final serverId = this.serverId;
    final nextToken = this.nextToken;
    return {
      'Accesses': accesses,
      'ServerId': serverId,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListExecutionsResponse {
  /// Returns the details for each execution, in a <code>ListedExecution</code>
  /// array.
  final List<ListedExecution> executions;

  /// A unique identifier for the workflow.
  final String workflowId;

  /// <code>ListExecutions</code> returns the <code>NextToken</code> parameter in
  /// the output. You can then pass the <code>NextToken</code> parameter in a
  /// subsequent command to continue listing additional executions.
  final String? nextToken;

  ListExecutionsResponse({
    required this.executions,
    required this.workflowId,
    this.nextToken,
  });

  factory ListExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListExecutionsResponse(
      executions: ((json['Executions'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowId: (json['WorkflowId'] as String?) ?? '',
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executions = this.executions;
    final workflowId = this.workflowId;
    final nextToken = this.nextToken;
    return {
      'Executions': executions,
      'WorkflowId': workflowId,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListFileTransferResultsResponse {
  /// Returns the details for the files transferred in the transfer identified by
  /// the <code>TransferId</code> and <code>ConnectorId</code> specified.
  ///
  /// <ul>
  /// <li>
  /// <code>FilePath</code>: the filename and path to where the file was sent to
  /// or retrieved from.
  /// </li>
  /// <li>
  /// <code>StatusCode</code>: current status for the transfer. The status
  /// returned is one of the following values:<code>QUEUED</code>,
  /// <code>IN_PROGRESS</code>, <code>COMPLETED</code>, or <code>FAILED</code>
  /// </li>
  /// <li>
  /// <code>FailureCode</code>: for transfers that fail, this parameter contains a
  /// code indicating the reason. For example,
  /// <code>RETRIEVE_FILE_NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>FailureMessage</code>: for transfers that fail, this parameter
  /// describes the reason for the failure.
  /// </li>
  /// </ul>
  final List<ConnectorFileTransferResult> fileTransferResults;

  /// Returns a token that you can use to call
  /// <code>ListFileTransferResults</code> again and receive additional results,
  /// if there are any (against the same <code>TransferId</code>.
  final String? nextToken;

  ListFileTransferResultsResponse({
    required this.fileTransferResults,
    this.nextToken,
  });

  factory ListFileTransferResultsResponse.fromJson(Map<String, dynamic> json) {
    return ListFileTransferResultsResponse(
      fileTransferResults: ((json['FileTransferResults'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ConnectorFileTransferResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileTransferResults = this.fileTransferResults;
    final nextToken = this.nextToken;
    return {
      'FileTransferResults': fileTransferResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListHostKeysResponse {
  /// Returns an array, where each item contains the details of a host key.
  final List<ListedHostKey> hostKeys;

  /// Returns the server identifier that contains the listed host keys.
  final String serverId;

  /// Returns a token that you can use to call <code>ListHostKeys</code> again and
  /// receive additional results, if there are any.
  final String? nextToken;

  ListHostKeysResponse({
    required this.hostKeys,
    required this.serverId,
    this.nextToken,
  });

  factory ListHostKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListHostKeysResponse(
      hostKeys: ((json['HostKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedHostKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverId: (json['ServerId'] as String?) ?? '',
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostKeys = this.hostKeys;
    final serverId = this.serverId;
    final nextToken = this.nextToken;
    return {
      'HostKeys': hostKeys,
      'ServerId': serverId,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSecurityPoliciesResponse {
  /// An array of security policies that were listed.
  final List<String> securityPolicyNames;

  /// When you can get additional results from the
  /// <code>ListSecurityPolicies</code> operation, a <code>NextToken</code>
  /// parameter is returned in the output. In a following command, you can pass in
  /// the <code>NextToken</code> parameter to continue listing security policies.
  final String? nextToken;

  ListSecurityPoliciesResponse({
    required this.securityPolicyNames,
    this.nextToken,
  });

  factory ListSecurityPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListSecurityPoliciesResponse(
      securityPolicyNames: ((json['SecurityPolicyNames'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityPolicyNames = this.securityPolicyNames;
    final nextToken = this.nextToken;
    return {
      'SecurityPolicyNames': securityPolicyNames,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The ARN you specified to list the tags of.
  final String? arn;

  /// When you can get additional results from the
  /// <code>ListTagsForResource</code> call, a <code>NextToken</code> parameter is
  /// returned in the output. You can then pass in a subsequent command to the
  /// <code>NextToken</code> parameter to continue listing additional tags.
  final String? nextToken;

  /// Key-value pairs that are assigned to a resource, usually for the purpose of
  /// grouping and searching for items. Tags are metadata that you define.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.arn,
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      arn: json['Arn'] as String?,
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class SendWorkflowStepStateResponse {
  SendWorkflowStepStateResponse();

  factory SendWorkflowStepStateResponse.fromJson(Map<String, dynamic> _) {
    return SendWorkflowStepStateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StartDirectoryListingResponse {
  /// Returns a unique identifier for the directory listing call.
  final String listingId;

  /// Returns the file name where the results are stored. This is a combination of
  /// the connector ID and the listing ID:
  /// <code>&lt;connector-id&gt;-&lt;listing-id&gt;.json</code>.
  final String outputFileName;

  StartDirectoryListingResponse({
    required this.listingId,
    required this.outputFileName,
  });

  factory StartDirectoryListingResponse.fromJson(Map<String, dynamic> json) {
    return StartDirectoryListingResponse(
      listingId: (json['ListingId'] as String?) ?? '',
      outputFileName: (json['OutputFileName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final listingId = this.listingId;
    final outputFileName = this.outputFileName;
    return {
      'ListingId': listingId,
      'OutputFileName': outputFileName,
    };
  }
}

/// @nodoc
class StartFileTransferResponse {
  /// Returns the unique identifier for the file transfer.
  final String transferId;

  StartFileTransferResponse({
    required this.transferId,
  });

  factory StartFileTransferResponse.fromJson(Map<String, dynamic> json) {
    return StartFileTransferResponse(
      transferId: (json['TransferId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final transferId = this.transferId;
    return {
      'TransferId': transferId,
    };
  }
}

/// @nodoc
class StartRemoteDeleteResponse {
  /// Returns a unique identifier for the delete operation.
  final String deleteId;

  StartRemoteDeleteResponse({
    required this.deleteId,
  });

  factory StartRemoteDeleteResponse.fromJson(Map<String, dynamic> json) {
    return StartRemoteDeleteResponse(
      deleteId: (json['DeleteId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final deleteId = this.deleteId;
    return {
      'DeleteId': deleteId,
    };
  }
}

/// @nodoc
class StartRemoteMoveResponse {
  /// Returns a unique identifier for the move/rename operation.
  final String moveId;

  StartRemoteMoveResponse({
    required this.moveId,
  });

  factory StartRemoteMoveResponse.fromJson(Map<String, dynamic> json) {
    return StartRemoteMoveResponse(
      moveId: (json['MoveId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final moveId = this.moveId;
    return {
      'MoveId': moveId,
    };
  }
}

/// @nodoc
class TestConnectionResponse {
  /// Returns the identifier of the connector object that you are testing.
  final String? connectorId;

  /// Structure that contains the SFTP connector host key.
  final SftpConnectorConnectionDetails? sftpConnectionDetails;

  /// Returns <code>OK</code> for successful test, or <code>ERROR</code> if the
  /// test fails.
  final String? status;

  /// Returns <code>Connection succeeded</code> if the test is successful. Or,
  /// returns a descriptive error message if the test fails. The following list
  /// provides troubleshooting details, depending on the error message that you
  /// receive.
  ///
  /// <ul>
  /// <li>
  /// Verify that your secret name aligns with the one in Transfer Role
  /// permissions.
  /// </li>
  /// <li>
  /// Verify the server URL in the connector configuration , and verify that the
  /// login credentials work successfully outside of the connector.
  /// </li>
  /// <li>
  /// Verify that the secret exists and is formatted correctly.
  /// </li>
  /// <li>
  /// Verify that the trusted host key in the connector configuration matches the
  /// <code>ssh-keyscan</code> output.
  /// </li>
  /// </ul>
  final String? statusMessage;

  TestConnectionResponse({
    this.connectorId,
    this.sftpConnectionDetails,
    this.status,
    this.statusMessage,
  });

  factory TestConnectionResponse.fromJson(Map<String, dynamic> json) {
    return TestConnectionResponse(
      connectorId: json['ConnectorId'] as String?,
      sftpConnectionDetails: json['SftpConnectionDetails'] != null
          ? SftpConnectorConnectionDetails.fromJson(
              json['SftpConnectionDetails'] as Map<String, dynamic>)
          : null,
      status: json['Status'] as String?,
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorId = this.connectorId;
    final sftpConnectionDetails = this.sftpConnectionDetails;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (connectorId != null) 'ConnectorId': connectorId,
      if (sftpConnectionDetails != null)
        'SftpConnectionDetails': sftpConnectionDetails,
      if (status != null) 'Status': status,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class TestIdentityProviderResponse {
  /// The HTTP status code that is the response from your API Gateway or your
  /// Lambda function.
  final int statusCode;

  /// The endpoint of the service used to authenticate a user.
  final String url;

  /// A message that indicates whether the test was successful or not.
  /// <note>
  /// If an empty string is returned, the most likely cause is that the
  /// authentication failed due to an incorrect username or password.
  /// </note>
  final String? message;

  /// The response that is returned from your API Gateway or your Lambda function.
  final String? response;

  TestIdentityProviderResponse({
    required this.statusCode,
    required this.url,
    this.message,
    this.response,
  });

  factory TestIdentityProviderResponse.fromJson(Map<String, dynamic> json) {
    return TestIdentityProviderResponse(
      statusCode: (json['StatusCode'] as int?) ?? 0,
      url: (json['Url'] as String?) ?? '',
      message: json['Message'] as String?,
      response: json['Response'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final url = this.url;
    final message = this.message;
    final response = this.response;
    return {
      'StatusCode': statusCode,
      'Url': url,
      if (message != null) 'Message': message,
      if (response != null) 'Response': response,
    };
  }
}

/// @nodoc
class UpdateAccessResponse {
  /// The external identifier of the group whose users have access to your Amazon
  /// S3 or Amazon EFS resources over the enabled protocols using Amazon Web
  /// ServicesTransfer Family.
  final String externalId;

  /// The identifier of the server that the user is attached to.
  final String serverId;

  UpdateAccessResponse({
    required this.externalId,
    required this.serverId,
  });

  factory UpdateAccessResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAccessResponse(
      externalId: (json['ExternalId'] as String?) ?? '',
      serverId: (json['ServerId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final externalId = this.externalId;
    final serverId = this.serverId;
    return {
      'ExternalId': externalId,
      'ServerId': serverId,
    };
  }
}

/// @nodoc
class UpdateHostKeyResponse {
  /// Returns the host key identifier for the updated host key.
  final String hostKeyId;

  /// Returns the server identifier for the server that contains the updated host
  /// key.
  final String serverId;

  UpdateHostKeyResponse({
    required this.hostKeyId,
    required this.serverId,
  });

  factory UpdateHostKeyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateHostKeyResponse(
      hostKeyId: (json['HostKeyId'] as String?) ?? '',
      serverId: (json['ServerId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final hostKeyId = this.hostKeyId;
    final serverId = this.serverId;
    return {
      'HostKeyId': hostKeyId,
      'ServerId': serverId,
    };
  }
}

/// @nodoc
class CreateAgreementResponse {
  /// The unique identifier for the agreement. Use this ID for deleting, or
  /// updating an agreement, as well as in any other API calls that require that
  /// you specify the agreement ID.
  final String agreementId;

  CreateAgreementResponse({
    required this.agreementId,
  });

  factory CreateAgreementResponse.fromJson(Map<String, dynamic> json) {
    return CreateAgreementResponse(
      agreementId: (json['AgreementId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    return {
      'AgreementId': agreementId,
    };
  }
}

/// @nodoc
class DescribeAgreementResponse {
  /// The details for the specified agreement, returned as a
  /// <code>DescribedAgreement</code> object.
  final DescribedAgreement agreement;

  DescribeAgreementResponse({
    required this.agreement,
  });

  factory DescribeAgreementResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAgreementResponse(
      agreement: DescribedAgreement.fromJson(
          (json['Agreement'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agreement = this.agreement;
    return {
      'Agreement': agreement,
    };
  }
}

/// @nodoc
class UpdateAgreementResponse {
  /// A unique identifier for the agreement. This identifier is returned when you
  /// create an agreement.
  final String agreementId;

  UpdateAgreementResponse({
    required this.agreementId,
  });

  factory UpdateAgreementResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgreementResponse(
      agreementId: (json['AgreementId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    return {
      'AgreementId': agreementId,
    };
  }
}

/// @nodoc
class ListAgreementsResponse {
  /// Returns an array, where each item contains the details of an agreement.
  final List<ListedAgreement> agreements;

  /// Returns a token that you can use to call <code>ListAgreements</code> again
  /// and receive additional results, if there are any.
  final String? nextToken;

  ListAgreementsResponse({
    required this.agreements,
    this.nextToken,
  });

  factory ListAgreementsResponse.fromJson(Map<String, dynamic> json) {
    return ListAgreementsResponse(
      agreements: ((json['Agreements'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedAgreement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreements = this.agreements;
    final nextToken = this.nextToken;
    return {
      'Agreements': agreements,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ImportCertificateResponse {
  /// An array of identifiers for the imported certificates. You use this
  /// identifier for working with profiles and partner profiles.
  final String certificateId;

  ImportCertificateResponse({
    required this.certificateId,
  });

  factory ImportCertificateResponse.fromJson(Map<String, dynamic> json) {
    return ImportCertificateResponse(
      certificateId: (json['CertificateId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final certificateId = this.certificateId;
    return {
      'CertificateId': certificateId,
    };
  }
}

/// @nodoc
class DescribeCertificateResponse {
  /// The details for the specified certificate, returned as an object.
  final DescribedCertificate certificate;

  DescribeCertificateResponse({
    required this.certificate,
  });

  factory DescribeCertificateResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCertificateResponse(
      certificate: DescribedCertificate.fromJson(
          (json['Certificate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    return {
      'Certificate': certificate,
    };
  }
}

/// @nodoc
class UpdateCertificateResponse {
  /// Returns the identifier of the certificate object that you are updating.
  final String certificateId;

  UpdateCertificateResponse({
    required this.certificateId,
  });

  factory UpdateCertificateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCertificateResponse(
      certificateId: (json['CertificateId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final certificateId = this.certificateId;
    return {
      'CertificateId': certificateId,
    };
  }
}

/// @nodoc
class ListCertificatesResponse {
  /// Returns an array of the certificates that are specified in the
  /// <code>ListCertificates</code> call.
  final List<ListedCertificate> certificates;

  /// Returns the next token, which you can use to list the next certificate.
  final String? nextToken;

  ListCertificatesResponse({
    required this.certificates,
    this.nextToken,
  });

  factory ListCertificatesResponse.fromJson(Map<String, dynamic> json) {
    return ListCertificatesResponse(
      certificates: ((json['Certificates'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedCertificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificates = this.certificates;
    final nextToken = this.nextToken;
    return {
      'Certificates': certificates,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateConnectorResponse {
  /// The unique identifier for the connector, returned after the API call
  /// succeeds.
  final String connectorId;

  CreateConnectorResponse({
    required this.connectorId,
  });

  factory CreateConnectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectorResponse(
      connectorId: (json['ConnectorId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connectorId = this.connectorId;
    return {
      'ConnectorId': connectorId,
    };
  }
}

/// @nodoc
class DescribeConnectorResponse {
  /// The structure that contains the details of the connector.
  final DescribedConnector connector;

  DescribeConnectorResponse({
    required this.connector,
  });

  factory DescribeConnectorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConnectorResponse(
      connector: DescribedConnector.fromJson(
          (json['Connector'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final connector = this.connector;
    return {
      'Connector': connector,
    };
  }
}

/// @nodoc
class UpdateConnectorResponse {
  /// Returns the identifier of the connector object that you are updating.
  final String connectorId;

  UpdateConnectorResponse({
    required this.connectorId,
  });

  factory UpdateConnectorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectorResponse(
      connectorId: (json['ConnectorId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connectorId = this.connectorId;
    return {
      'ConnectorId': connectorId,
    };
  }
}

/// @nodoc
class ListConnectorsResponse {
  /// Returns an array, where each item contains the details of a connector.
  final List<ListedConnector> connectors;

  /// Returns a token that you can use to call <code>ListConnectors</code> again
  /// and receive additional results, if there are any.
  final String? nextToken;

  ListConnectorsResponse({
    required this.connectors,
    this.nextToken,
  });

  factory ListConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorsResponse(
      connectors: ((json['Connectors'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedConnector.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectors = this.connectors;
    final nextToken = this.nextToken;
    return {
      'Connectors': connectors,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateProfileResponse {
  /// The unique identifier for the AS2 profile, returned after the API call
  /// succeeds.
  final String profileId;

  CreateProfileResponse({
    required this.profileId,
  });

  factory CreateProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateProfileResponse(
      profileId: (json['ProfileId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    return {
      'ProfileId': profileId,
    };
  }
}

/// @nodoc
class DescribeProfileResponse {
  /// The details of the specified profile, returned as an object.
  final DescribedProfile profile;

  DescribeProfileResponse({
    required this.profile,
  });

  factory DescribeProfileResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProfileResponse(
      profile: DescribedProfile.fromJson(
          (json['Profile'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final profile = this.profile;
    return {
      'Profile': profile,
    };
  }
}

/// @nodoc
class UpdateProfileResponse {
  /// Returns the identifier for the profile that's being updated.
  final String profileId;

  UpdateProfileResponse({
    required this.profileId,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      profileId: (json['ProfileId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    return {
      'ProfileId': profileId,
    };
  }
}

/// @nodoc
class ListProfilesResponse {
  /// Returns an array, where each item contains the details of a profile.
  final List<ListedProfile> profiles;

  /// Returns a token that you can use to call <code>ListProfiles</code> again and
  /// receive additional results, if there are any.
  final String? nextToken;

  ListProfilesResponse({
    required this.profiles,
    this.nextToken,
  });

  factory ListProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListProfilesResponse(
      profiles: ((json['Profiles'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final profiles = this.profiles;
    final nextToken = this.nextToken;
    return {
      'Profiles': profiles,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateServerResponse {
  /// The service-assigned identifier of the server that is created.
  final String serverId;

  CreateServerResponse({
    required this.serverId,
  });

  factory CreateServerResponse.fromJson(Map<String, dynamic> json) {
    return CreateServerResponse(
      serverId: (json['ServerId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    return {
      'ServerId': serverId,
    };
  }
}

/// @nodoc
class DescribeServerResponse {
  /// An array containing the properties of a server with the
  /// <code>ServerID</code> you specified.
  final DescribedServer server;

  DescribeServerResponse({
    required this.server,
  });

  factory DescribeServerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeServerResponse(
      server: DescribedServer.fromJson(
          (json['Server'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    return {
      'Server': server,
    };
  }
}

/// @nodoc
class UpdateServerResponse {
  /// A system-assigned unique identifier for a server that the Transfer Family
  /// user is assigned to.
  final String serverId;

  UpdateServerResponse({
    required this.serverId,
  });

  factory UpdateServerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServerResponse(
      serverId: (json['ServerId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    return {
      'ServerId': serverId,
    };
  }
}

/// @nodoc
class ListServersResponse {
  /// An array of servers that were listed.
  final List<ListedServer> servers;

  /// When you can get additional results from the <code>ListServers</code>
  /// operation, a <code>NextToken</code> parameter is returned in the output. In
  /// a following command, you can pass in the <code>NextToken</code> parameter to
  /// continue listing additional servers.
  final String? nextToken;

  ListServersResponse({
    required this.servers,
    this.nextToken,
  });

  factory ListServersResponse.fromJson(Map<String, dynamic> json) {
    return ListServersResponse(
      servers: ((json['Servers'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final servers = this.servers;
    final nextToken = this.nextToken;
    return {
      'Servers': servers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateUserResponse {
  /// The identifier of the server that the user is attached to.
  final String serverId;

  /// A unique string that identifies a Transfer Family user.
  final String userName;

  CreateUserResponse({
    required this.serverId,
    required this.userName,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      serverId: (json['ServerId'] as String?) ?? '',
      userName: (json['UserName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    final userName = this.userName;
    return {
      'ServerId': serverId,
      'UserName': userName,
    };
  }
}

/// @nodoc
class DescribeUserResponse {
  /// A system-assigned unique identifier for a server that has this user
  /// assigned.
  final String serverId;

  /// An array containing the properties of the Transfer Family user for the
  /// <code>ServerID</code> value that you specified.
  final DescribedUser user;

  DescribeUserResponse({
    required this.serverId,
    required this.user,
  });

  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUserResponse(
      serverId: (json['ServerId'] as String?) ?? '',
      user: DescribedUser.fromJson(
          (json['User'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    final user = this.user;
    return {
      'ServerId': serverId,
      'User': user,
    };
  }
}

/// <code>UpdateUserResponse</code> returns the user name and identifier for the
/// request to update a user's properties.
///
/// @nodoc
class UpdateUserResponse {
  /// A system-assigned unique identifier for a Transfer Family server instance
  /// that the account is assigned to.
  final String serverId;

  /// The unique identifier for a user that is assigned to a server instance that
  /// was specified in the request.
  final String userName;

  UpdateUserResponse({
    required this.serverId,
    required this.userName,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      serverId: (json['ServerId'] as String?) ?? '',
      userName: (json['UserName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    final userName = this.userName;
    return {
      'ServerId': serverId,
      'UserName': userName,
    };
  }
}

/// @nodoc
class ListUsersResponse {
  /// A system-assigned unique identifier for a server that the users are assigned
  /// to.
  final String serverId;

  /// Returns the Transfer Family users and their properties for the
  /// <code>ServerId</code> value that you specify.
  final List<ListedUser> users;

  /// When you can get additional results from the <code>ListUsers</code> call, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass in a subsequent command to the <code>NextToken</code> parameter to
  /// continue listing additional users.
  final String? nextToken;

  ListUsersResponse({
    required this.serverId,
    required this.users,
    this.nextToken,
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      serverId: (json['ServerId'] as String?) ?? '',
      users: ((json['Users'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    final users = this.users;
    final nextToken = this.nextToken;
    return {
      'ServerId': serverId,
      'Users': users,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class DescribeWebAppCustomizationResponse {
  /// Returns a structure that contains the details of the web app customizations.
  final DescribedWebAppCustomization webAppCustomization;

  DescribeWebAppCustomizationResponse({
    required this.webAppCustomization,
  });

  factory DescribeWebAppCustomizationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeWebAppCustomizationResponse(
      webAppCustomization: DescribedWebAppCustomization.fromJson(
          (json['WebAppCustomization'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final webAppCustomization = this.webAppCustomization;
    return {
      'WebAppCustomization': webAppCustomization,
    };
  }
}

/// @nodoc
class UpdateWebAppCustomizationResponse {
  /// Returns the unique identifier for the web app being updated.
  final String webAppId;

  UpdateWebAppCustomizationResponse({
    required this.webAppId,
  });

  factory UpdateWebAppCustomizationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateWebAppCustomizationResponse(
      webAppId: (json['WebAppId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final webAppId = this.webAppId;
    return {
      'WebAppId': webAppId,
    };
  }
}

/// @nodoc
class CreateWebAppResponse {
  /// Returns a unique identifier for the web app.
  final String webAppId;

  CreateWebAppResponse({
    required this.webAppId,
  });

  factory CreateWebAppResponse.fromJson(Map<String, dynamic> json) {
    return CreateWebAppResponse(
      webAppId: (json['WebAppId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final webAppId = this.webAppId;
    return {
      'WebAppId': webAppId,
    };
  }
}

/// @nodoc
class DescribeWebAppResponse {
  /// Returns a structure that contains the details of the web app.
  final DescribedWebApp webApp;

  DescribeWebAppResponse({
    required this.webApp,
  });

  factory DescribeWebAppResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWebAppResponse(
      webApp: DescribedWebApp.fromJson(
          (json['WebApp'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final webApp = this.webApp;
    return {
      'WebApp': webApp,
    };
  }
}

/// @nodoc
class UpdateWebAppResponse {
  /// Returns the unique identifier for the web app being updated.
  final String webAppId;

  UpdateWebAppResponse({
    required this.webAppId,
  });

  factory UpdateWebAppResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWebAppResponse(
      webAppId: (json['WebAppId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final webAppId = this.webAppId;
    return {
      'WebAppId': webAppId,
    };
  }
}

/// @nodoc
class ListWebAppsResponse {
  /// Returns, for each listed web app, a structure that contains details for the
  /// web app.
  final List<ListedWebApp> webApps;

  /// Provide this value for the <code>NextToken</code> parameter in a subsequent
  /// command to continue listing additional web apps.
  final String? nextToken;

  ListWebAppsResponse({
    required this.webApps,
    this.nextToken,
  });

  factory ListWebAppsResponse.fromJson(Map<String, dynamic> json) {
    return ListWebAppsResponse(
      webApps: ((json['WebApps'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedWebApp.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final webApps = this.webApps;
    final nextToken = this.nextToken;
    return {
      'WebApps': webApps,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateWorkflowResponse {
  /// A unique identifier for the workflow.
  final String workflowId;

  CreateWorkflowResponse({
    required this.workflowId,
  });

  factory CreateWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowResponse(
      workflowId: (json['WorkflowId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final workflowId = this.workflowId;
    return {
      'WorkflowId': workflowId,
    };
  }
}

/// @nodoc
class DescribeWorkflowResponse {
  /// The structure that contains the details of the workflow.
  final DescribedWorkflow workflow;

  DescribeWorkflowResponse({
    required this.workflow,
  });

  factory DescribeWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWorkflowResponse(
      workflow: DescribedWorkflow.fromJson(
          (json['Workflow'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final workflow = this.workflow;
    return {
      'Workflow': workflow,
    };
  }
}

/// @nodoc
class ListWorkflowsResponse {
  /// Returns the <code>Arn</code>, <code>WorkflowId</code>, and
  /// <code>Description</code> for each workflow.
  final List<ListedWorkflow> workflows;

  /// <code>ListWorkflows</code> returns the <code>NextToken</code> parameter in
  /// the output. You can then pass the <code>NextToken</code> parameter in a
  /// subsequent command to continue listing additional workflows.
  final String? nextToken;

  ListWorkflowsResponse({
    required this.workflows,
    this.nextToken,
  });

  factory ListWorkflowsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowsResponse(
      workflows: ((json['Workflows'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedWorkflow.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflows = this.workflows;
    final nextToken = this.nextToken;
    return {
      'Workflows': workflows,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Contains the identifier, text description, and Amazon Resource Name (ARN)
/// for the workflow.
///
/// @nodoc
class ListedWorkflow {
  /// Specifies the unique Amazon Resource Name (ARN) for the workflow.
  final String? arn;

  /// Specifies the text description for the workflow.
  final String? description;

  /// A unique identifier for the workflow.
  final String? workflowId;

  ListedWorkflow({
    this.arn,
    this.description,
    this.workflowId,
  });

  factory ListedWorkflow.fromJson(Map<String, dynamic> json) {
    return ListedWorkflow(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      workflowId: json['WorkflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final workflowId = this.workflowId;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (workflowId != null) 'WorkflowId': workflowId,
    };
  }
}

/// Describes the properties of the specified workflow
///
/// @nodoc
class DescribedWorkflow {
  /// Specifies the unique Amazon Resource Name (ARN) for the workflow.
  final String arn;

  /// Specifies the text description for the workflow.
  final String? description;

  /// Specifies the steps (actions) to take if errors are encountered during
  /// execution of the workflow.
  final List<WorkflowStep>? onExceptionSteps;

  /// Specifies the details for the steps that are in the specified workflow.
  final List<WorkflowStep>? steps;

  /// Key-value pairs that can be used to group and search for workflows. Tags are
  /// metadata attached to workflows for any purpose.
  final List<Tag>? tags;

  /// A unique identifier for the workflow.
  final String? workflowId;

  DescribedWorkflow({
    required this.arn,
    this.description,
    this.onExceptionSteps,
    this.steps,
    this.tags,
    this.workflowId,
  });

  factory DescribedWorkflow.fromJson(Map<String, dynamic> json) {
    return DescribedWorkflow(
      arn: (json['Arn'] as String?) ?? '',
      description: json['Description'] as String?,
      onExceptionSteps: (json['OnExceptionSteps'] as List?)
          ?.nonNulls
          .map((e) => WorkflowStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['Steps'] as List?)
          ?.nonNulls
          .map((e) => WorkflowStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowId: json['WorkflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final onExceptionSteps = this.onExceptionSteps;
    final steps = this.steps;
    final tags = this.tags;
    final workflowId = this.workflowId;
    return {
      'Arn': arn,
      if (description != null) 'Description': description,
      if (onExceptionSteps != null) 'OnExceptionSteps': onExceptionSteps,
      if (steps != null) 'Steps': steps,
      if (tags != null) 'Tags': tags,
      if (workflowId != null) 'WorkflowId': workflowId,
    };
  }
}

/// Creates a key-value pair for a specific resource. Tags are metadata that you
/// can use to search for and group a resource for various purposes. You can
/// apply tags to servers, users, and roles. A tag key can take more than one
/// value. For example, to group servers for accounting purposes, you might
/// create a tag called <code>Group</code> and assign the values
/// <code>Research</code> and <code>Accounting</code> to that group.
///
/// @nodoc
class Tag {
  /// The name assigned to the tag that you create.
  final String key;

  /// Contains one or more values that you assigned to the key name you create.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
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

/// The basic building block of a workflow.
///
/// @nodoc
class WorkflowStep {
  /// Details for a step that performs a file copy.
  ///
  /// Consists of the following values:
  ///
  /// <ul>
  /// <li>
  /// A description
  /// </li>
  /// <li>
  /// An Amazon S3 location for the destination of the file copy.
  /// </li>
  /// <li>
  /// A flag that indicates whether to overwrite an existing file of the same
  /// name. The default is <code>FALSE</code>.
  /// </li>
  /// </ul>
  final CopyStepDetails? copyStepDetails;

  /// Details for a step that invokes an Lambda function.
  ///
  /// Consists of the Lambda function's name, target, and timeout (in seconds).
  final CustomStepDetails? customStepDetails;

  /// Details for a step that decrypts an encrypted file.
  ///
  /// Consists of the following values:
  ///
  /// <ul>
  /// <li>
  /// A descriptive name
  /// </li>
  /// <li>
  /// An Amazon S3 or Amazon Elastic File System (Amazon EFS) location for the
  /// source file to decrypt.
  /// </li>
  /// <li>
  /// An S3 or Amazon EFS location for the destination of the file decryption.
  /// </li>
  /// <li>
  /// A flag that indicates whether to overwrite an existing file of the same
  /// name. The default is <code>FALSE</code>.
  /// </li>
  /// <li>
  /// The type of encryption that's used. Currently, only PGP encryption is
  /// supported.
  /// </li>
  /// </ul>
  final DecryptStepDetails? decryptStepDetails;

  /// Details for a step that deletes the file.
  final DeleteStepDetails? deleteStepDetails;

  /// Details for a step that creates one or more tags.
  ///
  /// You specify one or more tags. Each tag contains a key-value pair.
  final TagStepDetails? tagStepDetails;

  /// Currently, the following step types are supported.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>COPY</code> </b> - Copy the file to another location.
  /// </li>
  /// <li>
  /// <b> <code>CUSTOM</code> </b> - Perform a custom step with an Lambda function
  /// target.
  /// </li>
  /// <li>
  /// <b> <code>DECRYPT</code> </b> - Decrypt a file that was encrypted before it
  /// was uploaded.
  /// </li>
  /// <li>
  /// <b> <code>DELETE</code> </b> - Delete the file.
  /// </li>
  /// <li>
  /// <b> <code>TAG</code> </b> - Add a tag to the file.
  /// </li>
  /// </ul>
  final WorkflowStepType? type;

  WorkflowStep({
    this.copyStepDetails,
    this.customStepDetails,
    this.decryptStepDetails,
    this.deleteStepDetails,
    this.tagStepDetails,
    this.type,
  });

  factory WorkflowStep.fromJson(Map<String, dynamic> json) {
    return WorkflowStep(
      copyStepDetails: json['CopyStepDetails'] != null
          ? CopyStepDetails.fromJson(
              json['CopyStepDetails'] as Map<String, dynamic>)
          : null,
      customStepDetails: json['CustomStepDetails'] != null
          ? CustomStepDetails.fromJson(
              json['CustomStepDetails'] as Map<String, dynamic>)
          : null,
      decryptStepDetails: json['DecryptStepDetails'] != null
          ? DecryptStepDetails.fromJson(
              json['DecryptStepDetails'] as Map<String, dynamic>)
          : null,
      deleteStepDetails: json['DeleteStepDetails'] != null
          ? DeleteStepDetails.fromJson(
              json['DeleteStepDetails'] as Map<String, dynamic>)
          : null,
      tagStepDetails: json['TagStepDetails'] != null
          ? TagStepDetails.fromJson(
              json['TagStepDetails'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.let(WorkflowStepType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final copyStepDetails = this.copyStepDetails;
    final customStepDetails = this.customStepDetails;
    final decryptStepDetails = this.decryptStepDetails;
    final deleteStepDetails = this.deleteStepDetails;
    final tagStepDetails = this.tagStepDetails;
    final type = this.type;
    return {
      if (copyStepDetails != null) 'CopyStepDetails': copyStepDetails,
      if (customStepDetails != null) 'CustomStepDetails': customStepDetails,
      if (decryptStepDetails != null) 'DecryptStepDetails': decryptStepDetails,
      if (deleteStepDetails != null) 'DeleteStepDetails': deleteStepDetails,
      if (tagStepDetails != null) 'TagStepDetails': tagStepDetails,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class WorkflowStepType {
  static const copy = WorkflowStepType._('COPY');
  static const custom = WorkflowStepType._('CUSTOM');
  static const tag = WorkflowStepType._('TAG');
  static const delete = WorkflowStepType._('DELETE');
  static const decrypt = WorkflowStepType._('DECRYPT');

  final String value;

  const WorkflowStepType._(this.value);

  static const values = [copy, custom, tag, delete, decrypt];

  static WorkflowStepType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkflowStepType._(value));

  @override
  bool operator ==(other) => other is WorkflowStepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Each step type has its own <code>StepDetails</code> structure.
///
/// @nodoc
class CopyStepDetails {
  /// Specifies the location for the file being copied. Use
  /// <code>${Transfer:UserName}</code> or <code>${Transfer:UploadDate}</code> in
  /// this field to parametrize the destination prefix by username or uploaded
  /// date.
  ///
  /// <ul>
  /// <li>
  /// Set the value of <code>DestinationFileLocation</code> to
  /// <code>${Transfer:UserName}</code> to copy uploaded files to an Amazon S3
  /// bucket that is prefixed with the name of the Transfer Family user that
  /// uploaded the file.
  /// </li>
  /// <li>
  /// Set the value of <code>DestinationFileLocation</code> to
  /// <code>${Transfer:UploadDate}</code> to copy uploaded files to an Amazon S3
  /// bucket that is prefixed with the date of the upload.
  /// <note>
  /// The system resolves <code>UploadDate</code> to a date format of
  /// <i>YYYY-MM-DD</i>, based on the date the file is uploaded in UTC.
  /// </note> </li>
  /// </ul>
  final InputFileLocation? destinationFileLocation;

  /// The name of the step, used as an identifier.
  final String? name;

  /// A flag that indicates whether to overwrite an existing file of the same
  /// name. The default is <code>FALSE</code>.
  ///
  /// If the workflow is processing a file that has the same name as an existing
  /// file, the behavior is as follows:
  ///
  /// <ul>
  /// <li>
  /// If <code>OverwriteExisting</code> is <code>TRUE</code>, the existing file is
  /// replaced with the file being processed.
  /// </li>
  /// <li>
  /// If <code>OverwriteExisting</code> is <code>FALSE</code>, nothing happens,
  /// and the workflow processing stops.
  /// </li>
  /// </ul>
  final OverwriteExisting? overwriteExisting;

  /// Specifies which file to use as input to the workflow step: either the output
  /// from the previous step, or the originally uploaded file for the workflow.
  ///
  /// <ul>
  /// <li>
  /// To use the previous file as the input, enter <code>${previous.file}</code>.
  /// In this case, this workflow step uses the output file from the previous
  /// workflow step as input. This is the default value.
  /// </li>
  /// <li>
  /// To use the originally uploaded file location as input for this step, enter
  /// <code>${original.file}</code>.
  /// </li>
  /// </ul>
  final String? sourceFileLocation;

  CopyStepDetails({
    this.destinationFileLocation,
    this.name,
    this.overwriteExisting,
    this.sourceFileLocation,
  });

  factory CopyStepDetails.fromJson(Map<String, dynamic> json) {
    return CopyStepDetails(
      destinationFileLocation: json['DestinationFileLocation'] != null
          ? InputFileLocation.fromJson(
              json['DestinationFileLocation'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      overwriteExisting: (json['OverwriteExisting'] as String?)
          ?.let(OverwriteExisting.fromString),
      sourceFileLocation: json['SourceFileLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationFileLocation = this.destinationFileLocation;
    final name = this.name;
    final overwriteExisting = this.overwriteExisting;
    final sourceFileLocation = this.sourceFileLocation;
    return {
      if (destinationFileLocation != null)
        'DestinationFileLocation': destinationFileLocation,
      if (name != null) 'Name': name,
      if (overwriteExisting != null)
        'OverwriteExisting': overwriteExisting.value,
      if (sourceFileLocation != null) 'SourceFileLocation': sourceFileLocation,
    };
  }
}

/// Each step type has its own <code>StepDetails</code> structure.
///
/// @nodoc
class CustomStepDetails {
  /// The name of the step, used as an identifier.
  final String? name;

  /// Specifies which file to use as input to the workflow step: either the output
  /// from the previous step, or the originally uploaded file for the workflow.
  ///
  /// <ul>
  /// <li>
  /// To use the previous file as the input, enter <code>${previous.file}</code>.
  /// In this case, this workflow step uses the output file from the previous
  /// workflow step as input. This is the default value.
  /// </li>
  /// <li>
  /// To use the originally uploaded file location as input for this step, enter
  /// <code>${original.file}</code>.
  /// </li>
  /// </ul>
  final String? sourceFileLocation;

  /// The ARN for the Lambda function that is being called.
  final String? target;

  /// Timeout, in seconds, for the step.
  final int? timeoutSeconds;

  CustomStepDetails({
    this.name,
    this.sourceFileLocation,
    this.target,
    this.timeoutSeconds,
  });

  factory CustomStepDetails.fromJson(Map<String, dynamic> json) {
    return CustomStepDetails(
      name: json['Name'] as String?,
      sourceFileLocation: json['SourceFileLocation'] as String?,
      target: json['Target'] as String?,
      timeoutSeconds: json['TimeoutSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sourceFileLocation = this.sourceFileLocation;
    final target = this.target;
    final timeoutSeconds = this.timeoutSeconds;
    return {
      if (name != null) 'Name': name,
      if (sourceFileLocation != null) 'SourceFileLocation': sourceFileLocation,
      if (target != null) 'Target': target,
      if (timeoutSeconds != null) 'TimeoutSeconds': timeoutSeconds,
    };
  }
}

/// The name of the step, used to identify the delete step.
///
/// @nodoc
class DeleteStepDetails {
  /// The name of the step, used as an identifier.
  final String? name;

  /// Specifies which file to use as input to the workflow step: either the output
  /// from the previous step, or the originally uploaded file for the workflow.
  ///
  /// <ul>
  /// <li>
  /// To use the previous file as the input, enter <code>${previous.file}</code>.
  /// In this case, this workflow step uses the output file from the previous
  /// workflow step as input. This is the default value.
  /// </li>
  /// <li>
  /// To use the originally uploaded file location as input for this step, enter
  /// <code>${original.file}</code>.
  /// </li>
  /// </ul>
  final String? sourceFileLocation;

  DeleteStepDetails({
    this.name,
    this.sourceFileLocation,
  });

  factory DeleteStepDetails.fromJson(Map<String, dynamic> json) {
    return DeleteStepDetails(
      name: json['Name'] as String?,
      sourceFileLocation: json['SourceFileLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sourceFileLocation = this.sourceFileLocation;
    return {
      if (name != null) 'Name': name,
      if (sourceFileLocation != null) 'SourceFileLocation': sourceFileLocation,
    };
  }
}

/// Each step type has its own <code>StepDetails</code> structure.
///
/// The key/value pairs used to tag a file during the execution of a workflow
/// step.
///
/// @nodoc
class TagStepDetails {
  /// The name of the step, used as an identifier.
  final String? name;

  /// Specifies which file to use as input to the workflow step: either the output
  /// from the previous step, or the originally uploaded file for the workflow.
  ///
  /// <ul>
  /// <li>
  /// To use the previous file as the input, enter <code>${previous.file}</code>.
  /// In this case, this workflow step uses the output file from the previous
  /// workflow step as input. This is the default value.
  /// </li>
  /// <li>
  /// To use the originally uploaded file location as input for this step, enter
  /// <code>${original.file}</code>.
  /// </li>
  /// </ul>
  final String? sourceFileLocation;

  /// Array that contains from 1 to 10 key/value pairs.
  final List<S3Tag>? tags;

  TagStepDetails({
    this.name,
    this.sourceFileLocation,
    this.tags,
  });

  factory TagStepDetails.fromJson(Map<String, dynamic> json) {
    return TagStepDetails(
      name: json['Name'] as String?,
      sourceFileLocation: json['SourceFileLocation'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => S3Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sourceFileLocation = this.sourceFileLocation;
    final tags = this.tags;
    return {
      if (name != null) 'Name': name,
      if (sourceFileLocation != null) 'SourceFileLocation': sourceFileLocation,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Each step type has its own <code>StepDetails</code> structure.
///
/// @nodoc
class DecryptStepDetails {
  /// Specifies the location for the file being decrypted. Use
  /// <code>${Transfer:UserName}</code> or <code>${Transfer:UploadDate}</code> in
  /// this field to parametrize the destination prefix by username or uploaded
  /// date.
  ///
  /// <ul>
  /// <li>
  /// Set the value of <code>DestinationFileLocation</code> to
  /// <code>${Transfer:UserName}</code> to decrypt uploaded files to an Amazon S3
  /// bucket that is prefixed with the name of the Transfer Family user that
  /// uploaded the file.
  /// </li>
  /// <li>
  /// Set the value of <code>DestinationFileLocation</code> to
  /// <code>${Transfer:UploadDate}</code> to decrypt uploaded files to an Amazon
  /// S3 bucket that is prefixed with the date of the upload.
  /// <note>
  /// The system resolves <code>UploadDate</code> to a date format of
  /// <i>YYYY-MM-DD</i>, based on the date the file is uploaded in UTC.
  /// </note> </li>
  /// </ul>
  final InputFileLocation destinationFileLocation;

  /// The type of encryption used. Currently, this value must be <code>PGP</code>.
  final EncryptionType type;

  /// The name of the step, used as an identifier.
  final String? name;

  /// A flag that indicates whether to overwrite an existing file of the same
  /// name. The default is <code>FALSE</code>.
  ///
  /// If the workflow is processing a file that has the same name as an existing
  /// file, the behavior is as follows:
  ///
  /// <ul>
  /// <li>
  /// If <code>OverwriteExisting</code> is <code>TRUE</code>, the existing file is
  /// replaced with the file being processed.
  /// </li>
  /// <li>
  /// If <code>OverwriteExisting</code> is <code>FALSE</code>, nothing happens,
  /// and the workflow processing stops.
  /// </li>
  /// </ul>
  final OverwriteExisting? overwriteExisting;

  /// Specifies which file to use as input to the workflow step: either the output
  /// from the previous step, or the originally uploaded file for the workflow.
  ///
  /// <ul>
  /// <li>
  /// To use the previous file as the input, enter <code>${previous.file}</code>.
  /// In this case, this workflow step uses the output file from the previous
  /// workflow step as input. This is the default value.
  /// </li>
  /// <li>
  /// To use the originally uploaded file location as input for this step, enter
  /// <code>${original.file}</code>.
  /// </li>
  /// </ul>
  final String? sourceFileLocation;

  DecryptStepDetails({
    required this.destinationFileLocation,
    required this.type,
    this.name,
    this.overwriteExisting,
    this.sourceFileLocation,
  });

  factory DecryptStepDetails.fromJson(Map<String, dynamic> json) {
    return DecryptStepDetails(
      destinationFileLocation: InputFileLocation.fromJson(
          (json['DestinationFileLocation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      type: EncryptionType.fromString((json['Type'] as String?) ?? ''),
      name: json['Name'] as String?,
      overwriteExisting: (json['OverwriteExisting'] as String?)
          ?.let(OverwriteExisting.fromString),
      sourceFileLocation: json['SourceFileLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationFileLocation = this.destinationFileLocation;
    final type = this.type;
    final name = this.name;
    final overwriteExisting = this.overwriteExisting;
    final sourceFileLocation = this.sourceFileLocation;
    return {
      'DestinationFileLocation': destinationFileLocation,
      'Type': type.value,
      if (name != null) 'Name': name,
      if (overwriteExisting != null)
        'OverwriteExisting': overwriteExisting.value,
      if (sourceFileLocation != null) 'SourceFileLocation': sourceFileLocation,
    };
  }
}

/// @nodoc
class EncryptionType {
  static const pgp = EncryptionType._('PGP');

  final String value;

  const EncryptionType._(this.value);

  static const values = [pgp];

  static EncryptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionType._(value));

  @override
  bool operator ==(other) => other is EncryptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OverwriteExisting {
  static const $true = OverwriteExisting._('TRUE');
  static const $false = OverwriteExisting._('FALSE');

  final String value;

  const OverwriteExisting._(this.value);

  static const values = [$true, $false];

  static OverwriteExisting fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OverwriteExisting._(value));

  @override
  bool operator ==(other) => other is OverwriteExisting && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the location for the file that's being processed.
///
/// @nodoc
class InputFileLocation {
  /// Specifies the details for the Amazon Elastic File System (Amazon EFS) file
  /// that's being decrypted.
  final EfsFileLocation? efsFileLocation;

  /// Specifies the details for the Amazon S3 file that's being copied or
  /// decrypted.
  final S3InputFileLocation? s3FileLocation;

  InputFileLocation({
    this.efsFileLocation,
    this.s3FileLocation,
  });

  factory InputFileLocation.fromJson(Map<String, dynamic> json) {
    return InputFileLocation(
      efsFileLocation: json['EfsFileLocation'] != null
          ? EfsFileLocation.fromJson(
              json['EfsFileLocation'] as Map<String, dynamic>)
          : null,
      s3FileLocation: json['S3FileLocation'] != null
          ? S3InputFileLocation.fromJson(
              json['S3FileLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final efsFileLocation = this.efsFileLocation;
    final s3FileLocation = this.s3FileLocation;
    return {
      if (efsFileLocation != null) 'EfsFileLocation': efsFileLocation,
      if (s3FileLocation != null) 'S3FileLocation': s3FileLocation,
    };
  }
}

/// Specifies the customer input Amazon S3 file location. If it is used inside
/// <code>copyStepDetails.DestinationFileLocation</code>, it should be the S3
/// copy destination.
///
/// You need to provide the bucket and key. The key can represent either a path
/// or a file. This is determined by whether or not you end the key value with
/// the forward slash (/) character. If the final character is "/", then your
/// file is copied to the folder, and its name does not change. If, rather, the
/// final character is alphanumeric, your uploaded file is renamed to the path
/// value. In this case, if a file with that name already exists, it is
/// overwritten.
///
/// For example, if your path is <code>shared-files/bob/</code>, your uploaded
/// files are copied to the <code>shared-files/bob/</code>, folder. If your path
/// is <code>shared-files/today</code>, each uploaded file is copied to the
/// <code>shared-files</code> folder and named <code>today</code>: each upload
/// overwrites the previous version of the <i>bob</i> file.
///
/// @nodoc
class S3InputFileLocation {
  /// Specifies the S3 bucket for the customer input file.
  final String? bucket;

  /// The name assigned to the file when it was created in Amazon S3. You use the
  /// object key to retrieve the object.
  final String? key;

  S3InputFileLocation({
    this.bucket,
    this.key,
  });

  factory S3InputFileLocation.fromJson(Map<String, dynamic> json) {
    return S3InputFileLocation(
      bucket: json['Bucket'] as String?,
      key: json['Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (key != null) 'Key': key,
    };
  }
}

/// Specifies the details for the file location for the file that's being used
/// in the workflow. Only applicable if you are using Amazon Elastic File
/// Systems (Amazon EFS) for storage.
///
///
///
/// @nodoc
class EfsFileLocation {
  /// The identifier of the file system, assigned by Amazon EFS.
  final String? fileSystemId;

  /// The pathname for the folder being used by a workflow.
  final String? path;

  EfsFileLocation({
    this.fileSystemId,
    this.path,
  });

  factory EfsFileLocation.fromJson(Map<String, dynamic> json) {
    return EfsFileLocation(
      fileSystemId: json['FileSystemId'] as String?,
      path: json['Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemId = this.fileSystemId;
    final path = this.path;
    return {
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (path != null) 'Path': path,
    };
  }
}

/// Specifies the key-value pair that are assigned to a file during the
/// execution of a Tagging step.
///
/// @nodoc
class S3Tag {
  /// The name assigned to the tag that you create.
  final String key;

  /// The value that corresponds to the key.
  final String value;

  S3Tag({
    required this.key,
    required this.value,
  });

  factory S3Tag.fromJson(Map<String, dynamic> json) {
    return S3Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
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

/// a structure that contains details for the web app.
///
/// @nodoc
class ListedWebApp {
  /// The Amazon Resource Name (ARN) for the web app.
  final String arn;

  /// The unique identifier for the web app.
  final String webAppId;

  /// The <code>AccessEndpoint</code> is the URL that you provide to your users
  /// for them to interact with the Transfer Family web app. You can specify a
  /// custom URL or use the default value.
  final String? accessEndpoint;

  /// The type of endpoint hosting the web app. Valid values are
  /// <code>PUBLIC</code> for publicly accessible endpoints and <code>VPC</code>
  /// for VPC-hosted endpoints.
  final WebAppEndpointType? endpointType;

  /// The <code>WebAppEndpoint</code> is the unique URL for your Transfer Family
  /// web app. This is the value that you use when you configure <b>Origins</b> on
  /// CloudFront.
  final String? webAppEndpoint;

  ListedWebApp({
    required this.arn,
    required this.webAppId,
    this.accessEndpoint,
    this.endpointType,
    this.webAppEndpoint,
  });

  factory ListedWebApp.fromJson(Map<String, dynamic> json) {
    return ListedWebApp(
      arn: (json['Arn'] as String?) ?? '',
      webAppId: (json['WebAppId'] as String?) ?? '',
      accessEndpoint: json['AccessEndpoint'] as String?,
      endpointType:
          (json['EndpointType'] as String?)?.let(WebAppEndpointType.fromString),
      webAppEndpoint: json['WebAppEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final webAppId = this.webAppId;
    final accessEndpoint = this.accessEndpoint;
    final endpointType = this.endpointType;
    final webAppEndpoint = this.webAppEndpoint;
    return {
      'Arn': arn,
      'WebAppId': webAppId,
      if (accessEndpoint != null) 'AccessEndpoint': accessEndpoint,
      if (endpointType != null) 'EndpointType': endpointType.value,
      if (webAppEndpoint != null) 'WebAppEndpoint': webAppEndpoint,
    };
  }
}

/// @nodoc
class WebAppEndpointType {
  static const public = WebAppEndpointType._('PUBLIC');
  static const vpc = WebAppEndpointType._('VPC');

  final String value;

  const WebAppEndpointType._(this.value);

  static const values = [public, vpc];

  static WebAppEndpointType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WebAppEndpointType._(value));

  @override
  bool operator ==(other) =>
      other is WebAppEndpointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A union that contains the <code>UpdateWebAppIdentityCenterConfig</code>
/// object.
///
/// @nodoc
class UpdateWebAppIdentityProviderDetails {
  /// A structure that describes the values to use for the IAM Identity Center
  /// settings when you update a web app.
  final UpdateWebAppIdentityCenterConfig? identityCenterConfig;

  UpdateWebAppIdentityProviderDetails({
    this.identityCenterConfig,
  });

  Map<String, dynamic> toJson() {
    final identityCenterConfig = this.identityCenterConfig;
    return {
      if (identityCenterConfig != null)
        'IdentityCenterConfig': identityCenterConfig,
    };
  }
}

/// Contains an integer value that represents the value for number of concurrent
/// connections or the user sessions on your web app.
///
/// @nodoc
class WebAppUnits {
  /// An integer that represents the number of units for your desired number of
  /// concurrent connections, or the number of user sessions on your web app at
  /// the same time.
  ///
  /// Each increment allows an additional 250 concurrent sessions: a value of
  /// <code>1</code> sets the number of concurrent sessions to 250; <code>2</code>
  /// sets a value of 500, and so on.
  final int? provisioned;

  WebAppUnits({
    this.provisioned,
  });

  factory WebAppUnits.fromJson(Map<String, dynamic> json) {
    return WebAppUnits(
      provisioned: json['Provisioned'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final provisioned = this.provisioned;
    return {
      if (provisioned != null) 'Provisioned': provisioned,
    };
  }
}

/// Contains the endpoint configuration details for updating a web app,
/// including VPC settings for endpoints hosted within a VPC.
///
/// @nodoc
class UpdateWebAppEndpointDetails {
  /// The VPC configuration details for updating a web app endpoint hosted within
  /// a VPC. This includes the subnet IDs for endpoint deployment.
  final UpdateWebAppVpcConfig? vpc;

  UpdateWebAppEndpointDetails({
    this.vpc,
  });

  Map<String, dynamic> toJson() {
    final vpc = this.vpc;
    return {
      if (vpc != null) 'Vpc': vpc,
    };
  }
}

/// Contains the VPC configuration settings for updating a web app endpoint,
/// including the subnet IDs where the endpoint should be deployed.
///
/// @nodoc
class UpdateWebAppVpcConfig {
  /// The IP address type for the web app's VPC endpoint. This determines whether
  /// the endpoint is accessible over IPv4 only, or over both IPv4 and IPv6.
  final WebAppVpcEndpointIpAddressType? ipAddressType;

  /// The list of subnet IDs within the VPC where the web app endpoint should be
  /// deployed during the update operation.
  final List<String>? subnetIds;

  UpdateWebAppVpcConfig({
    this.ipAddressType,
    this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final ipAddressType = this.ipAddressType;
    final subnetIds = this.subnetIds;
    return {
      if (ipAddressType != null) 'IpAddressType': ipAddressType.value,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// @nodoc
class WebAppVpcEndpointIpAddressType {
  static const ipv4 = WebAppVpcEndpointIpAddressType._('IPV4');
  static const dualstack = WebAppVpcEndpointIpAddressType._('DUALSTACK');

  final String value;

  const WebAppVpcEndpointIpAddressType._(this.value);

  static const values = [ipv4, dualstack];

  static WebAppVpcEndpointIpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WebAppVpcEndpointIpAddressType._(value));

  @override
  bool operator ==(other) =>
      other is WebAppVpcEndpointIpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that describes the values to use for the IAM Identity Center
/// settings when you update a web app.
///
/// @nodoc
class UpdateWebAppIdentityCenterConfig {
  /// The IAM role used to access IAM Identity Center.
  final String? role;

  UpdateWebAppIdentityCenterConfig({
    this.role,
  });

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      if (role != null) 'Role': role,
    };
  }
}

/// A structure that describes the parameters for the web app, as identified by
/// the <code>WebAppId</code>.
///
/// @nodoc
class DescribedWebApp {
  /// The Amazon Resource Name (ARN) of the web app.
  final String arn;

  /// The unique identifier for the web app.
  final String webAppId;

  /// The <code>AccessEndpoint</code> is the URL that you provide to your users
  /// for them to interact with the Transfer Family web app. You can specify a
  /// custom URL or use the default value.
  final String? accessEndpoint;

  /// The endpoint configuration details for the web app, including VPC settings
  /// if the endpoint is hosted within a VPC.
  final DescribedWebAppEndpointDetails? describedEndpointDetails;

  /// A structure that contains the details for the identity provider used by the
  /// web app.
  final DescribedWebAppIdentityProviderDetails?
      describedIdentityProviderDetails;

  /// The type of endpoint hosting the web app. Valid values are
  /// <code>PUBLIC</code> for publicly accessible endpoints and <code>VPC</code>
  /// for VPC-hosted endpoints that provide network isolation.
  final WebAppEndpointType? endpointType;

  /// Key-value pairs that can be used to group and search for web apps. Tags are
  /// metadata attached to web apps for any purpose.
  final List<Tag>? tags;

  /// The <code>WebAppEndpoint</code> is the unique URL for your Transfer Family
  /// web app. This is the value that you use when you configure <b>Origins</b> on
  /// CloudFront.
  final String? webAppEndpoint;

  /// Setting for the type of endpoint policy for the web app. The default value
  /// is <code>STANDARD</code>.
  ///
  /// If your web app was created in an Amazon Web Services GovCloud (US) Region,
  /// the value of this parameter can be <code>FIPS</code>, which indicates the
  /// web app endpoint is FIPS-compliant.
  final WebAppEndpointPolicy? webAppEndpointPolicy;

  /// A union that contains the value for number of concurrent connections or the
  /// user sessions on your web app.
  final WebAppUnits? webAppUnits;

  DescribedWebApp({
    required this.arn,
    required this.webAppId,
    this.accessEndpoint,
    this.describedEndpointDetails,
    this.describedIdentityProviderDetails,
    this.endpointType,
    this.tags,
    this.webAppEndpoint,
    this.webAppEndpointPolicy,
    this.webAppUnits,
  });

  factory DescribedWebApp.fromJson(Map<String, dynamic> json) {
    return DescribedWebApp(
      arn: (json['Arn'] as String?) ?? '',
      webAppId: (json['WebAppId'] as String?) ?? '',
      accessEndpoint: json['AccessEndpoint'] as String?,
      describedEndpointDetails: json['DescribedEndpointDetails'] != null
          ? DescribedWebAppEndpointDetails.fromJson(
              json['DescribedEndpointDetails'] as Map<String, dynamic>)
          : null,
      describedIdentityProviderDetails:
          json['DescribedIdentityProviderDetails'] != null
              ? DescribedWebAppIdentityProviderDetails.fromJson(
                  json['DescribedIdentityProviderDetails']
                      as Map<String, dynamic>)
              : null,
      endpointType:
          (json['EndpointType'] as String?)?.let(WebAppEndpointType.fromString),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      webAppEndpoint: json['WebAppEndpoint'] as String?,
      webAppEndpointPolicy: (json['WebAppEndpointPolicy'] as String?)
          ?.let(WebAppEndpointPolicy.fromString),
      webAppUnits: json['WebAppUnits'] != null
          ? WebAppUnits.fromJson(json['WebAppUnits'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final webAppId = this.webAppId;
    final accessEndpoint = this.accessEndpoint;
    final describedEndpointDetails = this.describedEndpointDetails;
    final describedIdentityProviderDetails =
        this.describedIdentityProviderDetails;
    final endpointType = this.endpointType;
    final tags = this.tags;
    final webAppEndpoint = this.webAppEndpoint;
    final webAppEndpointPolicy = this.webAppEndpointPolicy;
    final webAppUnits = this.webAppUnits;
    return {
      'Arn': arn,
      'WebAppId': webAppId,
      if (accessEndpoint != null) 'AccessEndpoint': accessEndpoint,
      if (describedEndpointDetails != null)
        'DescribedEndpointDetails': describedEndpointDetails,
      if (describedIdentityProviderDetails != null)
        'DescribedIdentityProviderDetails': describedIdentityProviderDetails,
      if (endpointType != null) 'EndpointType': endpointType.value,
      if (tags != null) 'Tags': tags,
      if (webAppEndpoint != null) 'WebAppEndpoint': webAppEndpoint,
      if (webAppEndpointPolicy != null)
        'WebAppEndpointPolicy': webAppEndpointPolicy.value,
      if (webAppUnits != null) 'WebAppUnits': webAppUnits,
    };
  }
}

/// Returns a structure that contains the identity provider details for your web
/// app.
///
/// @nodoc
class DescribedWebAppIdentityProviderDetails {
  /// Returns a structure for your identity provider details. This structure
  /// contains the instance ARN and role being used for the web app.
  final DescribedIdentityCenterConfig? identityCenterConfig;

  DescribedWebAppIdentityProviderDetails({
    this.identityCenterConfig,
  });

  factory DescribedWebAppIdentityProviderDetails.fromJson(
      Map<String, dynamic> json) {
    return DescribedWebAppIdentityProviderDetails(
      identityCenterConfig: json['IdentityCenterConfig'] != null
          ? DescribedIdentityCenterConfig.fromJson(
              json['IdentityCenterConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final identityCenterConfig = this.identityCenterConfig;
    return {
      if (identityCenterConfig != null)
        'IdentityCenterConfig': identityCenterConfig,
    };
  }
}

/// @nodoc
class WebAppEndpointPolicy {
  static const fips = WebAppEndpointPolicy._('FIPS');
  static const standard = WebAppEndpointPolicy._('STANDARD');

  final String value;

  const WebAppEndpointPolicy._(this.value);

  static const values = [fips, standard];

  static WebAppEndpointPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WebAppEndpointPolicy._(value));

  @override
  bool operator ==(other) =>
      other is WebAppEndpointPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the endpoint configuration details for a web app, including VPC
/// configuration when the endpoint is hosted within a VPC.
///
/// @nodoc
class DescribedWebAppEndpointDetails {
  /// The VPC configuration details when the web app endpoint is hosted within a
  /// VPC. This includes the VPC ID, subnet IDs, and VPC endpoint ID.
  final DescribedWebAppVpcConfig? vpc;

  DescribedWebAppEndpointDetails({
    this.vpc,
  });

  factory DescribedWebAppEndpointDetails.fromJson(Map<String, dynamic> json) {
    return DescribedWebAppEndpointDetails(
      vpc: json['Vpc'] != null
          ? DescribedWebAppVpcConfig.fromJson(
              json['Vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpc = this.vpc;
    return {
      if (vpc != null) 'Vpc': vpc,
    };
  }
}

/// Contains the VPC configuration details for a web app endpoint, including the
/// VPC identifier, subnet IDs, and VPC endpoint ID used for hosting the
/// endpoint.
///
/// @nodoc
class DescribedWebAppVpcConfig {
  /// The list of subnet IDs within the VPC where the web app endpoint is
  /// deployed. These subnets must be in the same VPC and provide network
  /// connectivity for the endpoint.
  final List<String>? subnetIds;

  /// The identifier of the VPC endpoint created for the web app.
  final String? vpcEndpointId;

  /// The identifier of the VPC where the web app endpoint is hosted.
  final String? vpcId;

  DescribedWebAppVpcConfig({
    this.subnetIds,
    this.vpcEndpointId,
    this.vpcId,
  });

  factory DescribedWebAppVpcConfig.fromJson(Map<String, dynamic> json) {
    return DescribedWebAppVpcConfig(
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcEndpointId: json['VpcEndpointId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetIds = this.subnetIds;
    final vpcEndpointId = this.vpcEndpointId;
    final vpcId = this.vpcId;
    return {
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// A structure that contains the details of the IAM Identity Center used for
/// your web app. Returned during a call to <code>DescribeWebApp</code>.
///
/// @nodoc
class DescribedIdentityCenterConfig {
  /// The Amazon Resource Name (ARN) for the IAM Identity Center application: this
  /// value is set automatically when you create your web app.
  final String? applicationArn;

  /// The Amazon Resource Name (ARN) for the IAM Identity Center used for the web
  /// app.
  final String? instanceArn;

  /// The IAM role in IAM Identity Center used for the web app.
  final String? role;

  DescribedIdentityCenterConfig({
    this.applicationArn,
    this.instanceArn,
    this.role,
  });

  factory DescribedIdentityCenterConfig.fromJson(Map<String, dynamic> json) {
    return DescribedIdentityCenterConfig(
      applicationArn: json['ApplicationArn'] as String?,
      instanceArn: json['InstanceArn'] as String?,
      role: json['Role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final instanceArn = this.instanceArn;
    final role = this.role;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (role != null) 'Role': role,
    };
  }
}

/// A union that contains the <code>IdentityCenterConfig</code> object.
///
/// @nodoc
class WebAppIdentityProviderDetails {
  /// A structure that describes the values to use for the IAM Identity Center
  /// settings when you create a web app.
  final IdentityCenterConfig? identityCenterConfig;

  WebAppIdentityProviderDetails({
    this.identityCenterConfig,
  });

  Map<String, dynamic> toJson() {
    final identityCenterConfig = this.identityCenterConfig;
    return {
      if (identityCenterConfig != null)
        'IdentityCenterConfig': identityCenterConfig,
    };
  }
}

/// Contains the endpoint configuration for a web app, including VPC settings
/// when the endpoint is hosted within a VPC.
///
/// @nodoc
class WebAppEndpointDetails {
  /// The VPC configuration for hosting the web app endpoint within a VPC.
  final WebAppVpcConfig? vpc;

  WebAppEndpointDetails({
    this.vpc,
  });

  Map<String, dynamic> toJson() {
    final vpc = this.vpc;
    return {
      if (vpc != null) 'Vpc': vpc,
    };
  }
}

/// Contains the VPC configuration settings for hosting a web app endpoint,
/// including the VPC ID, subnet IDs, and security group IDs for access control.
///
/// @nodoc
class WebAppVpcConfig {
  /// The IP address type for the web app's VPC endpoint. This determines whether
  /// the endpoint is accessible over IPv4 only, or over both IPv4 and IPv6.
  final WebAppVpcEndpointIpAddressType? ipAddressType;

  /// The list of security group IDs that control access to the web app endpoint.
  /// These security groups determine which sources can access the endpoint based
  /// on IP addresses and port configurations.
  final List<String>? securityGroupIds;

  /// The list of subnet IDs within the VPC where the web app endpoint will be
  /// deployed. These subnets must be in the same VPC specified in the VpcId
  /// parameter.
  final List<String>? subnetIds;

  /// The identifier of the VPC where the web app endpoint will be hosted.
  final String? vpcId;

  WebAppVpcConfig({
    this.ipAddressType,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  Map<String, dynamic> toJson() {
    final ipAddressType = this.ipAddressType;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (ipAddressType != null) 'IpAddressType': ipAddressType.value,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// A structure that describes the values to use for the IAM Identity Center
/// settings when you create or update a web app.
///
/// @nodoc
class IdentityCenterConfig {
  /// The Amazon Resource Name (ARN) for the IAM Identity Center used for the web
  /// app.
  final String? instanceArn;

  /// The IAM role in IAM Identity Center used for the web app.
  final String? role;

  IdentityCenterConfig({
    this.instanceArn,
    this.role,
  });

  Map<String, dynamic> toJson() {
    final instanceArn = this.instanceArn;
    final role = this.role;
    return {
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (role != null) 'Role': role,
    };
  }
}

/// A structure that contains the customization fields for the web app. You can
/// provide a title, logo, and icon to customize the appearance of your web app.
///
/// @nodoc
class DescribedWebAppCustomization {
  /// Returns the Amazon Resource Name (ARN) for the web app.
  final String arn;

  /// Returns the unique identifier for your web app.
  final String webAppId;

  /// Returns an icon file data string (in base64 encoding).
  final Uint8List? faviconFile;

  /// Returns a logo file data string (in base64 encoding).
  final Uint8List? logoFile;

  /// Returns the page title that you defined for your web app.
  final String? title;

  DescribedWebAppCustomization({
    required this.arn,
    required this.webAppId,
    this.faviconFile,
    this.logoFile,
    this.title,
  });

  factory DescribedWebAppCustomization.fromJson(Map<String, dynamic> json) {
    return DescribedWebAppCustomization(
      arn: (json['Arn'] as String?) ?? '',
      webAppId: (json['WebAppId'] as String?) ?? '',
      faviconFile: _s.decodeNullableUint8List(json['FaviconFile'] as String?),
      logoFile: _s.decodeNullableUint8List(json['LogoFile'] as String?),
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final webAppId = this.webAppId;
    final faviconFile = this.faviconFile;
    final logoFile = this.logoFile;
    final title = this.title;
    return {
      'Arn': arn,
      'WebAppId': webAppId,
      if (faviconFile != null) 'FaviconFile': base64Encode(faviconFile),
      if (logoFile != null) 'LogoFile': base64Encode(logoFile),
      if (title != null) 'Title': title,
    };
  }
}

/// Returns properties of the user that you specify.
///
/// @nodoc
class ListedUser {
  /// Provides the unique Amazon Resource Name (ARN) for the user that you want to
  /// learn about.
  final String arn;

  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  /// <note>
  /// You can use the <code>HomeDirectory</code> parameter for
  /// <code>HomeDirectoryType</code> when it is set to either <code>PATH</code> or
  /// <code>LOGICAL</code>.
  /// </note>
  final String? homeDirectory;

  /// The type of landing directory (folder) that you want your users' home
  /// directory to be when they log in to the server. If you set it to
  /// <code>PATH</code>, the user will see the absolute Amazon S3 bucket or Amazon
  /// EFS path as is in their file transfer protocol clients. If you set it to
  /// <code>LOGICAL</code>, you need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// Amazon EFS paths visible to your users.
  /// <note>
  /// If <code>HomeDirectoryType</code> is <code>LOGICAL</code>, you must provide
  /// mappings, using the <code>HomeDirectoryMappings</code> parameter. If, on the
  /// other hand, <code>HomeDirectoryType</code> is <code>PATH</code>, you provide
  /// an absolute path using the <code>HomeDirectory</code> parameter. You cannot
  /// have both <code>HomeDirectory</code> and <code>HomeDirectoryMappings</code>
  /// in your template.
  /// </note>
  final HomeDirectoryType? homeDirectoryType;

  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that controls your users' access to your Amazon S3 bucket or Amazon EFS
  /// file system. The policies attached to this role determine the level of
  /// access that you want to provide your users when transferring files into and
  /// out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should
  /// also contain a trust relationship that allows the server to access your
  /// resources when servicing your users' transfer requests.
  /// <note>
  /// The IAM role that controls your users' access to your Amazon S3 bucket for
  /// servers with <code>Domain=S3</code>, or your EFS file system for servers
  /// with <code>Domain=EFS</code>.
  ///
  /// The policies attached to this role determine the level of access you want to
  /// provide your users when transferring files into and out of your S3 buckets
  /// or EFS file systems.
  /// </note>
  final String? role;

  /// Specifies the number of SSH public keys stored for the user you specified.
  final int? sshPublicKeyCount;

  /// Specifies the name of the user whose ARN was specified. User names are used
  /// for authentication purposes.
  final String? userName;

  ListedUser({
    required this.arn,
    this.homeDirectory,
    this.homeDirectoryType,
    this.role,
    this.sshPublicKeyCount,
    this.userName,
  });

  factory ListedUser.fromJson(Map<String, dynamic> json) {
    return ListedUser(
      arn: (json['Arn'] as String?) ?? '',
      homeDirectory: json['HomeDirectory'] as String?,
      homeDirectoryType: (json['HomeDirectoryType'] as String?)
          ?.let(HomeDirectoryType.fromString),
      role: json['Role'] as String?,
      sshPublicKeyCount: json['SshPublicKeyCount'] as int?,
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final homeDirectory = this.homeDirectory;
    final homeDirectoryType = this.homeDirectoryType;
    final role = this.role;
    final sshPublicKeyCount = this.sshPublicKeyCount;
    final userName = this.userName;
    return {
      'Arn': arn,
      if (homeDirectory != null) 'HomeDirectory': homeDirectory,
      if (homeDirectoryType != null)
        'HomeDirectoryType': homeDirectoryType.value,
      if (role != null) 'Role': role,
      if (sshPublicKeyCount != null) 'SshPublicKeyCount': sshPublicKeyCount,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// @nodoc
class HomeDirectoryType {
  static const path = HomeDirectoryType._('PATH');
  static const logical = HomeDirectoryType._('LOGICAL');

  final String value;

  const HomeDirectoryType._(this.value);

  static const values = [path, logical];

  static HomeDirectoryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HomeDirectoryType._(value));

  @override
  bool operator ==(other) => other is HomeDirectoryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The full POSIX identity, including user ID (<code>Uid</code>), group ID
/// (<code>Gid</code>), and any secondary groups IDs
/// (<code>SecondaryGids</code>), that controls your users' access to your
/// Amazon EFS file systems. The POSIX permissions that are set on files and
/// directories in your file system determine the level of access your users get
/// when transferring files into and out of your Amazon EFS file systems.
///
/// @nodoc
class PosixProfile {
  /// The POSIX group ID used for all EFS operations by this user.
  final int gid;

  /// The POSIX user ID used for all EFS operations by this user.
  final int uid;

  /// The secondary POSIX group IDs used for all EFS operations by this user.
  final List<int>? secondaryGids;

  PosixProfile({
    required this.gid,
    required this.uid,
    this.secondaryGids,
  });

  factory PosixProfile.fromJson(Map<String, dynamic> json) {
    return PosixProfile(
      gid: (json['Gid'] as int?) ?? 0,
      uid: (json['Uid'] as int?) ?? 0,
      secondaryGids: (json['SecondaryGids'] as List?)
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
      'Gid': gid,
      'Uid': uid,
      if (secondaryGids != null) 'SecondaryGids': secondaryGids,
    };
  }
}

/// Represents an object that contains entries and targets for
/// <code>HomeDirectoryMappings</code>.
///
/// The following is an <code>Entry</code> and <code>Target</code> pair example
/// for <code>chroot</code>.
///
/// <code>\[ { "Entry": "/", "Target": "/bucket_name/home/mydirectory" }
/// \]</code>
///
/// @nodoc
class HomeDirectoryMapEntry {
  /// Represents an entry for <code>HomeDirectoryMappings</code>.
  final String entry;

  /// Represents the map target that is used in a
  /// <code>HomeDirectoryMapEntry</code>.
  final String target;

  /// Specifies the type of mapping. Set the type to <code>FILE</code> if you want
  /// the mapping to point to a file, or <code>DIRECTORY</code> for the directory
  /// to point to a directory.
  /// <note>
  /// By default, home directory mappings have a <code>Type</code> of
  /// <code>DIRECTORY</code> when you create a Transfer Family server. You would
  /// need to explicitly set <code>Type</code> to <code>FILE</code> if you want a
  /// mapping to have a file target.
  /// </note>
  final MapType? type;

  HomeDirectoryMapEntry({
    required this.entry,
    required this.target,
    this.type,
  });

  factory HomeDirectoryMapEntry.fromJson(Map<String, dynamic> json) {
    return HomeDirectoryMapEntry(
      entry: (json['Entry'] as String?) ?? '',
      target: (json['Target'] as String?) ?? '',
      type: (json['Type'] as String?)?.let(MapType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final entry = this.entry;
    final target = this.target;
    final type = this.type;
    return {
      'Entry': entry,
      'Target': target,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class MapType {
  static const file = MapType._('FILE');
  static const directory = MapType._('DIRECTORY');

  final String value;

  const MapType._(this.value);

  static const values = [file, directory];

  static MapType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MapType._(value));

  @override
  bool operator ==(other) => other is MapType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the properties of a user that was specified.
///
/// @nodoc
class DescribedUser {
  /// Specifies the unique Amazon Resource Name (ARN) for the user that was
  /// requested to be described.
  final String arn;

  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  /// <note>
  /// You can use the <code>HomeDirectory</code> parameter for
  /// <code>HomeDirectoryType</code> when it is set to either <code>PATH</code> or
  /// <code>LOGICAL</code>.
  /// </note>
  final String? homeDirectory;

  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you only
  /// specify a target, it is displayed as is. You also must ensure that your
  /// Identity and Access Management (IAM) role provides access to paths in
  /// <code>Target</code>. This value can be set only when
  /// <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// In most cases, you can use this value instead of the session policy to lock
  /// your user down to the designated home directory ("<code>chroot</code>"). To
  /// do this, you can set <code>Entry</code> to '/' and set <code>Target</code>
  /// to the HomeDirectory parameter value.
  final List<HomeDirectoryMapEntry>? homeDirectoryMappings;

  /// The type of landing directory (folder) that you want your users' home
  /// directory to be when they log in to the server. If you set it to
  /// <code>PATH</code>, the user will see the absolute Amazon S3 bucket or Amazon
  /// EFS path as is in their file transfer protocol clients. If you set it to
  /// <code>LOGICAL</code>, you need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// Amazon EFS paths visible to your users.
  /// <note>
  /// If <code>HomeDirectoryType</code> is <code>LOGICAL</code>, you must provide
  /// mappings, using the <code>HomeDirectoryMappings</code> parameter. If, on the
  /// other hand, <code>HomeDirectoryType</code> is <code>PATH</code>, you provide
  /// an absolute path using the <code>HomeDirectory</code> parameter. You cannot
  /// have both <code>HomeDirectory</code> and <code>HomeDirectoryMappings</code>
  /// in your template.
  /// </note>
  final HomeDirectoryType? homeDirectoryType;

  /// A session policy for your user so that you can use the same Identity and
  /// Access Management (IAM) role across multiple users. This policy scopes down
  /// a user's access to portions of their Amazon S3 bucket. Variables that you
  /// can use inside this policy include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  final String? policy;

  /// Specifies the full POSIX identity, including user ID (<code>Uid</code>),
  /// group ID (<code>Gid</code>), and any secondary groups IDs
  /// (<code>SecondaryGids</code>), that controls your users' access to your
  /// Amazon Elastic File System (Amazon EFS) file systems. The POSIX permissions
  /// that are set on files and directories in your file system determine the
  /// level of access your users get when transferring files into and out of your
  /// Amazon EFS file systems.
  final PosixProfile? posixProfile;

  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that controls your users' access to your Amazon S3 bucket or Amazon EFS
  /// file system. The policies attached to this role determine the level of
  /// access that you want to provide your users when transferring files into and
  /// out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should
  /// also contain a trust relationship that allows the server to access your
  /// resources when servicing your users' transfer requests.
  final String? role;

  /// Specifies the public key portion of the Secure Shell (SSH) keys stored for
  /// the described user.
  /// <note>
  /// To delete the public key body, set its value to zero keys, as shown here:
  ///
  /// <code>SshPublicKeys: \[\]</code>
  /// </note>
  final List<SshPublicKey>? sshPublicKeys;

  /// Specifies the key-value pairs for the user requested. Tag can be used to
  /// search for and group users for a variety of purposes.
  final List<Tag>? tags;

  /// Specifies the name of the user that was requested to be described. User
  /// names are used for authentication purposes. This is the string that will be
  /// used by your user when they log in to your server.
  final String? userName;

  DescribedUser({
    required this.arn,
    this.homeDirectory,
    this.homeDirectoryMappings,
    this.homeDirectoryType,
    this.policy,
    this.posixProfile,
    this.role,
    this.sshPublicKeys,
    this.tags,
    this.userName,
  });

  factory DescribedUser.fromJson(Map<String, dynamic> json) {
    return DescribedUser(
      arn: (json['Arn'] as String?) ?? '',
      homeDirectory: json['HomeDirectory'] as String?,
      homeDirectoryMappings: (json['HomeDirectoryMappings'] as List?)
          ?.nonNulls
          .map((e) => HomeDirectoryMapEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeDirectoryType: (json['HomeDirectoryType'] as String?)
          ?.let(HomeDirectoryType.fromString),
      policy: json['Policy'] as String?,
      posixProfile: json['PosixProfile'] != null
          ? PosixProfile.fromJson(json['PosixProfile'] as Map<String, dynamic>)
          : null,
      role: json['Role'] as String?,
      sshPublicKeys: (json['SshPublicKeys'] as List?)
          ?.nonNulls
          .map((e) => SshPublicKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final homeDirectory = this.homeDirectory;
    final homeDirectoryMappings = this.homeDirectoryMappings;
    final homeDirectoryType = this.homeDirectoryType;
    final policy = this.policy;
    final posixProfile = this.posixProfile;
    final role = this.role;
    final sshPublicKeys = this.sshPublicKeys;
    final tags = this.tags;
    final userName = this.userName;
    return {
      'Arn': arn,
      if (homeDirectory != null) 'HomeDirectory': homeDirectory,
      if (homeDirectoryMappings != null)
        'HomeDirectoryMappings': homeDirectoryMappings,
      if (homeDirectoryType != null)
        'HomeDirectoryType': homeDirectoryType.value,
      if (policy != null) 'Policy': policy,
      if (posixProfile != null) 'PosixProfile': posixProfile,
      if (role != null) 'Role': role,
      if (sshPublicKeys != null) 'SshPublicKeys': sshPublicKeys,
      if (tags != null) 'Tags': tags,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Provides information about the public Secure Shell (SSH) key that is
/// associated with a Transfer Family user for the specific file transfer
/// protocol-enabled server (as identified by <code>ServerId</code>). The
/// information returned includes the date the key was imported, the public key
/// contents, and the public key ID. A user can store more than one SSH public
/// key associated with their user name on a specific server.
///
/// @nodoc
class SshPublicKey {
  /// Specifies the date that the public key was added to the Transfer Family
  /// user.
  final DateTime dateImported;

  /// Specifies the content of the SSH public key as specified by the
  /// <code>PublicKeyId</code>.
  ///
  /// Transfer Family accepts RSA, ECDSA, and ED25519 keys.
  final String sshPublicKeyBody;

  /// Specifies the <code>SshPublicKeyId</code> parameter contains the identifier
  /// of the public key.
  final String sshPublicKeyId;

  SshPublicKey({
    required this.dateImported,
    required this.sshPublicKeyBody,
    required this.sshPublicKeyId,
  });

  factory SshPublicKey.fromJson(Map<String, dynamic> json) {
    return SshPublicKey(
      dateImported: nonNullableTimeStampFromJson(json['DateImported'] ?? 0),
      sshPublicKeyBody: (json['SshPublicKeyBody'] as String?) ?? '',
      sshPublicKeyId: (json['SshPublicKeyId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dateImported = this.dateImported;
    final sshPublicKeyBody = this.sshPublicKeyBody;
    final sshPublicKeyId = this.sshPublicKeyId;
    return {
      'DateImported': unixTimestampToJson(dateImported),
      'SshPublicKeyBody': sshPublicKeyBody,
      'SshPublicKeyId': sshPublicKeyId,
    };
  }
}

/// Returns properties of a file transfer protocol-enabled server that was
/// specified.
///
/// @nodoc
class ListedServer {
  /// Specifies the unique Amazon Resource Name (ARN) for a server to be listed.
  final String arn;

  /// Specifies the domain of the storage system that is used for file transfers.
  /// There are two domains available: Amazon Simple Storage Service (Amazon S3)
  /// and Amazon Elastic File System (Amazon EFS). The default value is S3.
  final Domain? domain;

  /// Specifies the type of VPC endpoint that your server is connected to. If your
  /// server is connected to a VPC endpoint, your server isn't accessible over the
  /// public internet.
  final EndpointType? endpointType;

  /// The mode of authentication for a server. The default value is
  /// <code>SERVICE_MANAGED</code>, which allows you to store and access user
  /// credentials within the Transfer Family service.
  ///
  /// Use <code>AWS_DIRECTORY_SERVICE</code> to provide access to Active Directory
  /// groups in Directory Service for Microsoft Active Directory or Microsoft
  /// Active Directory in your on-premises environment or in Amazon Web Services
  /// using AD Connector. This option also requires you to provide a Directory ID
  /// by using the <code>IdentityProviderDetails</code> parameter.
  ///
  /// Use the <code>API_GATEWAY</code> value to integrate with an identity
  /// provider of your choosing. The <code>API_GATEWAY</code> setting requires you
  /// to provide an Amazon API Gateway endpoint URL to call for authentication by
  /// using the <code>IdentityProviderDetails</code> parameter.
  ///
  /// Use the <code>AWS_LAMBDA</code> value to directly use an Lambda function as
  /// your identity provider. If you choose this value, you must specify the ARN
  /// for the Lambda function in the <code>Function</code> parameter for the
  /// <code>IdentityProviderDetails</code> data type.
  final IdentityProviderType? identityProviderType;

  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that allows a server to turn on Amazon CloudWatch logging for Amazon S3
  /// or Amazon EFS events. When set, you can view user activity in your
  /// CloudWatch logs.
  final String? loggingRole;

  /// Specifies the unique system assigned identifier for the servers that were
  /// listed.
  final String? serverId;

  /// The condition of the server that was described. A value of
  /// <code>ONLINE</code> indicates that the server can accept jobs and transfer
  /// files. A <code>State</code> value of <code>OFFLINE</code> means that the
  /// server cannot perform file transfer operations.
  ///
  /// The states of <code>STARTING</code> and <code>STOPPING</code> indicate that
  /// the server is in an intermediate state, either not fully able to respond, or
  /// not fully offline. The values of <code>START_FAILED</code> or
  /// <code>STOP_FAILED</code> can indicate an error condition.
  final State? state;

  /// Specifies the number of users that are assigned to a server you specified
  /// with the <code>ServerId</code>.
  final int? userCount;

  ListedServer({
    required this.arn,
    this.domain,
    this.endpointType,
    this.identityProviderType,
    this.loggingRole,
    this.serverId,
    this.state,
    this.userCount,
  });

  factory ListedServer.fromJson(Map<String, dynamic> json) {
    return ListedServer(
      arn: (json['Arn'] as String?) ?? '',
      domain: (json['Domain'] as String?)?.let(Domain.fromString),
      endpointType:
          (json['EndpointType'] as String?)?.let(EndpointType.fromString),
      identityProviderType: (json['IdentityProviderType'] as String?)
          ?.let(IdentityProviderType.fromString),
      loggingRole: json['LoggingRole'] as String?,
      serverId: json['ServerId'] as String?,
      state: (json['State'] as String?)?.let(State.fromString),
      userCount: json['UserCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final domain = this.domain;
    final endpointType = this.endpointType;
    final identityProviderType = this.identityProviderType;
    final loggingRole = this.loggingRole;
    final serverId = this.serverId;
    final state = this.state;
    final userCount = this.userCount;
    return {
      'Arn': arn,
      if (domain != null) 'Domain': domain.value,
      if (endpointType != null) 'EndpointType': endpointType.value,
      if (identityProviderType != null)
        'IdentityProviderType': identityProviderType.value,
      if (loggingRole != null) 'LoggingRole': loggingRole,
      if (serverId != null) 'ServerId': serverId,
      if (state != null) 'State': state.value,
      if (userCount != null) 'UserCount': userCount,
    };
  }
}

/// @nodoc
class Domain {
  static const s3 = Domain._('S3');
  static const efs = Domain._('EFS');

  final String value;

  const Domain._(this.value);

  static const values = [s3, efs];

  static Domain fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Domain._(value));

  @override
  bool operator ==(other) => other is Domain && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The mode of authentication for a server. The default value is
/// <code>SERVICE_MANAGED</code>, which allows you to store and access user
/// credentials within the Transfer Family service.
///
/// Use <code>AWS_DIRECTORY_SERVICE</code> to provide access to Active Directory
/// groups in Directory Service for Microsoft Active Directory or Microsoft
/// Active Directory in your on-premises environment or in Amazon Web Services
/// using AD Connector. This option also requires you to provide a Directory ID
/// by using the <code>IdentityProviderDetails</code> parameter.
///
/// Use the <code>API_GATEWAY</code> value to integrate with an identity
/// provider of your choosing. The <code>API_GATEWAY</code> setting requires you
/// to provide an Amazon API Gateway endpoint URL to call for authentication by
/// using the <code>IdentityProviderDetails</code> parameter.
///
/// Use the <code>AWS_LAMBDA</code> value to directly use an Lambda function as
/// your identity provider. If you choose this value, you must specify the ARN
/// for the Lambda function in the <code>Function</code> parameter for the
/// <code>IdentityProviderDetails</code> data type.
///
/// @nodoc
class IdentityProviderType {
  static const serviceManaged = IdentityProviderType._('SERVICE_MANAGED');
  static const apiGateway = IdentityProviderType._('API_GATEWAY');
  static const awsDirectoryService =
      IdentityProviderType._('AWS_DIRECTORY_SERVICE');
  static const awsLambda = IdentityProviderType._('AWS_LAMBDA');

  final String value;

  const IdentityProviderType._(this.value);

  static const values = [
    serviceManaged,
    apiGateway,
    awsDirectoryService,
    awsLambda
  ];

  static IdentityProviderType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdentityProviderType._(value));

  @override
  bool operator ==(other) =>
      other is IdentityProviderType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EndpointType {
  static const public = EndpointType._('PUBLIC');
  static const vpc = EndpointType._('VPC');
  static const vpcEndpoint = EndpointType._('VPC_ENDPOINT');

  final String value;

  const EndpointType._(this.value);

  static const values = [public, vpc, vpcEndpoint];

  static EndpointType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EndpointType._(value));

  @override
  bool operator ==(other) => other is EndpointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the condition of a file transfer protocol-enabled server with
/// respect to its ability to perform file operations. There are six possible
/// states: <code>OFFLINE</code>, <code>ONLINE</code>, <code>STARTING</code>,
/// <code>STOPPING</code>, <code>START_FAILED</code>, and
/// <code>STOP_FAILED</code>.
///
/// <code>OFFLINE</code> indicates that the server exists, but that it is not
/// available for file operations. <code>ONLINE</code> indicates that the server
/// is available to perform file operations. <code>STARTING</code> indicates
/// that the server's was instantiated, but the server is not yet available to
/// perform file operations. Under normal conditions, it can take a couple of
/// minutes for the server to be completely operational. Both
/// <code>START_FAILED</code> and <code>STOP_FAILED</code> are error conditions.
///
/// @nodoc
class State {
  static const offline = State._('OFFLINE');
  static const online = State._('ONLINE');
  static const starting = State._('STARTING');
  static const stopping = State._('STOPPING');
  static const startFailed = State._('START_FAILED');
  static const stopFailed = State._('STOP_FAILED');

  final String value;

  const State._(this.value);

  static const values = [
    offline,
    online,
    starting,
    stopping,
    startFailed,
    stopFailed
  ];

  static State fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => State._(value));

  @override
  bool operator ==(other) => other is State && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The protocol settings that are configured for your server.
///
/// @nodoc
class ProtocolDetails {
  /// Indicates the transport method for the AS2 messages. Currently, only HTTP is
  /// supported.
  final List<As2Transport>? as2Transports;

  /// Indicates passive mode, for FTP and FTPS protocols. Enter a single IPv4
  /// address, such as the public IP address of a firewall, router, or load
  /// balancer. For example:
  ///
  /// <code>aws transfer update-server --protocol-details PassiveIp=0.0.0.0</code>
  ///
  /// Replace <code>0.0.0.0</code> in the example above with the actual IP address
  /// you want to use.
  /// <note>
  /// If you change the <code>PassiveIp</code> value, you must stop and then
  /// restart your Transfer Family server for the change to take effect. For
  /// details on using passive mode (PASV) in a NAT environment, see <a
  /// href="http://aws.amazon.com/blogs/storage/configuring-your-ftps-server-behind-a-firewall-or-nat-with-aws-transfer-family/">Configuring
  /// your FTPS server behind a firewall or NAT with Transfer Family</a>.
  ///
  /// Additionally, avoid placing Network Load Balancers (NLBs) or NAT gateways in
  /// front of Transfer Family servers. This configuration increases costs and can
  /// cause performance issues. When NLBs or NATs are in the communication path,
  /// Transfer Family cannot accurately recognize client IP addresses, which
  /// impacts connection sharding and limits FTPS servers to only 300 simultaneous
  /// connections instead of 10,000. If you must use an NLB, use port 21 for
  /// health checks and enable TLS session resumption by setting
  /// <code>TlsSessionResumptionMode = ENFORCED</code>. For optimal performance,
  /// migrate to VPC endpoints with Elastic IP addresses instead of using NLBs.
  /// For more details, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/infrastructure-security.html#nlb-considerations">
  /// Avoid placing NLBs and NATs in front of Transfer Family</a>.
  /// </note>
  /// <i>Special values</i>
  ///
  /// The <code>AUTO</code> and <code>0.0.0.0</code> are special values for the
  /// <code>PassiveIp</code> parameter. The value <code>PassiveIp=AUTO</code> is
  /// assigned by default to FTP and FTPS type servers. In this case, the server
  /// automatically responds with one of the endpoint IPs within the PASV
  /// response. <code>PassiveIp=0.0.0.0</code> has a more unique application for
  /// its usage. For example, if you have a High Availability (HA) Network Load
  /// Balancer (NLB) environment, where you have 3 subnets, you can only specify a
  /// single IP address using the <code>PassiveIp</code> parameter. This reduces
  /// the effectiveness of having High Availability. In this case, you can specify
  /// <code>PassiveIp=0.0.0.0</code>. This tells the client to use the same IP
  /// address as the Control connection and utilize all AZs for their connections.
  /// Note, however, that not all FTP clients support the
  /// <code>PassiveIp=0.0.0.0</code> response. FileZilla and WinSCP do support it.
  /// If you are using other clients, check to see if your client supports the
  /// <code>PassiveIp=0.0.0.0</code> response.
  final String? passiveIp;

  /// Use the <code>SetStatOption</code> to ignore the error that is generated
  /// when the client attempts to use <code>SETSTAT</code> on a file you are
  /// uploading to an S3 bucket.
  ///
  /// Some SFTP file transfer clients can attempt to change the attributes of
  /// remote files, including timestamp and permissions, using commands, such as
  /// <code>SETSTAT</code> when uploading the file. However, these commands are
  /// not compatible with object storage systems, such as Amazon S3. Due to this
  /// incompatibility, file uploads from these clients can result in errors even
  /// when the file is otherwise successfully uploaded.
  ///
  /// Set the value to <code>ENABLE_NO_OP</code> to have the Transfer Family
  /// server ignore the <code>SETSTAT</code> command, and upload files without
  /// needing to make any changes to your SFTP client. While the
  /// <code>SetStatOption</code> <code>ENABLE_NO_OP</code> setting ignores the
  /// error, it does generate a log entry in Amazon CloudWatch Logs, so you can
  /// determine when the client is making a <code>SETSTAT</code> call.
  /// <note>
  /// If you want to preserve the original timestamp for your file, and modify
  /// other file attributes using <code>SETSTAT</code>, you can use Amazon EFS as
  /// backend storage with Transfer Family.
  /// </note>
  final SetStatOption? setStatOption;

  /// A property used with Transfer Family servers that use the FTPS protocol. TLS
  /// Session Resumption provides a mechanism to resume or share a negotiated
  /// secret key between the control and data connection for an FTPS session.
  /// <code>TlsSessionResumptionMode</code> determines whether or not the server
  /// resumes recent, negotiated sessions through a unique session ID. This
  /// property is available during <code>CreateServer</code> and
  /// <code>UpdateServer</code> calls. If a <code>TlsSessionResumptionMode</code>
  /// value is not specified during <code>CreateServer</code>, it is set to
  /// <code>ENFORCED</code> by default.
  ///
  /// <ul>
  /// <li>
  /// <code>DISABLED</code>: the server does not process TLS session resumption
  /// client requests and creates a new TLS session for each request.
  /// </li>
  /// <li>
  /// <code>ENABLED</code>: the server processes and accepts clients that are
  /// performing TLS session resumption. The server doesn't reject client data
  /// connections that do not perform the TLS session resumption client
  /// processing.
  /// </li>
  /// <li>
  /// <code>ENFORCED</code>: the server processes and accepts clients that are
  /// performing TLS session resumption. The server rejects client data
  /// connections that do not perform the TLS session resumption client
  /// processing. Before you set the value to <code>ENFORCED</code>, test your
  /// clients.
  /// <note>
  /// Not all FTPS clients perform TLS session resumption. So, if you choose to
  /// enforce TLS session resumption, you prevent any connections from FTPS
  /// clients that don't perform the protocol negotiation. To determine whether or
  /// not you can use the <code>ENFORCED</code> value, you need to test your
  /// clients.
  /// </note> </li>
  /// </ul>
  final TlsSessionResumptionMode? tlsSessionResumptionMode;

  ProtocolDetails({
    this.as2Transports,
    this.passiveIp,
    this.setStatOption,
    this.tlsSessionResumptionMode,
  });

  factory ProtocolDetails.fromJson(Map<String, dynamic> json) {
    return ProtocolDetails(
      as2Transports: (json['As2Transports'] as List?)
          ?.nonNulls
          .map((e) => As2Transport.fromString((e as String)))
          .toList(),
      passiveIp: json['PassiveIp'] as String?,
      setStatOption:
          (json['SetStatOption'] as String?)?.let(SetStatOption.fromString),
      tlsSessionResumptionMode: (json['TlsSessionResumptionMode'] as String?)
          ?.let(TlsSessionResumptionMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final as2Transports = this.as2Transports;
    final passiveIp = this.passiveIp;
    final setStatOption = this.setStatOption;
    final tlsSessionResumptionMode = this.tlsSessionResumptionMode;
    return {
      if (as2Transports != null)
        'As2Transports': as2Transports.map((e) => e.value).toList(),
      if (passiveIp != null) 'PassiveIp': passiveIp,
      if (setStatOption != null) 'SetStatOption': setStatOption.value,
      if (tlsSessionResumptionMode != null)
        'TlsSessionResumptionMode': tlsSessionResumptionMode.value,
    };
  }
}

/// The virtual private cloud (VPC) endpoint settings that are configured for
/// your file transfer protocol-enabled server. With a VPC endpoint, you can
/// restrict access to your server and resources only within your VPC. To
/// control incoming internet traffic, invoke the <code>UpdateServer</code> API
/// and attach an Elastic IP address to your server's endpoint.
/// <note>
/// After May 19, 2021, you won't be able to create a server using
/// <code>EndpointType=VPC_ENDPOINT</code> in your Amazon Web Services account
/// if your account hasn't already done so before May 19, 2021. If you have
/// already created servers with <code>EndpointType=VPC_ENDPOINT</code> in your
/// Amazon Web Services account on or before May 19, 2021, you will not be
/// affected. After this date, use <code>EndpointType</code>=<code>VPC</code>.
///
/// For more information, see
/// https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
///
/// It is recommended that you use <code>VPC</code> as the
/// <code>EndpointType</code>. With this endpoint type, you have the option to
/// directly associate up to three Elastic IPv4 addresses (BYO IP included) with
/// your server's endpoint and use VPC security groups to restrict traffic by
/// the client's public IP address. This is not possible with
/// <code>EndpointType</code> set to <code>VPC_ENDPOINT</code>.
/// </note>
///
/// @nodoc
class EndpointDetails {
  /// A list of address allocation IDs that are required to attach an Elastic IP
  /// address to your server's endpoint.
  ///
  /// An address allocation ID corresponds to the allocation ID of an Elastic IP
  /// address. This value can be retrieved from the <code>allocationId</code>
  /// field from the Amazon EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Address.html">Address</a>
  /// data type. One way to retrieve this value is by calling the EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeAddresses.html">DescribeAddresses</a>
  /// API.
  ///
  /// This parameter is optional. Set this parameter if you want to make your VPC
  /// endpoint public-facing. For details, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#create-internet-facing-endpoint">Create
  /// an internet-facing endpoint for your server</a>.
  /// <note>
  /// This property can only be set as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>EndpointType</code> must be set to <code>VPC</code>
  /// </li>
  /// <li>
  /// The Transfer Family server must be offline.
  /// </li>
  /// <li>
  /// You cannot set this parameter for Transfer Family servers that use the FTP
  /// protocol.
  /// </li>
  /// <li>
  /// The server must already have <code>SubnetIds</code> populated
  /// (<code>SubnetIds</code> and <code>AddressAllocationIds</code> cannot be
  /// updated simultaneously).
  /// </li>
  /// <li>
  /// <code>AddressAllocationIds</code> can't contain duplicates, and must be
  /// equal in length to <code>SubnetIds</code>. For example, if you have three
  /// subnet IDs, you must also specify three address allocation IDs.
  /// </li>
  /// <li>
  /// Call the <code>UpdateServer</code> API to set or change this parameter.
  /// </li>
  /// <li>
  /// You can't set address allocation IDs for servers that have an
  /// <code>IpAddressType</code> set to <code>DUALSTACK</code> You can only set
  /// this property if <code>IpAddressType</code> is set to <code>IPV4</code>.
  /// </li>
  /// </ul> </note>
  final List<String>? addressAllocationIds;

  /// A list of security groups IDs that are available to attach to your server's
  /// endpoint.
  /// <note>
  /// While <code>SecurityGroupIds</code> appears in the response syntax for
  /// consistency with <code>CreateServer</code> and <code>UpdateServer</code>
  /// operations, this field is not populated in <code>DescribeServer</code>
  /// responses. Security groups are managed at the VPC endpoint level and can be
  /// modified outside of the Transfer Family service. To retrieve current
  /// security group information, use the EC2 <code>DescribeVpcEndpoints</code>
  /// API with the <code>VpcEndpointId</code> returned in the response.
  ///
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC</code>.
  ///
  /// You can edit the <code>SecurityGroupIds</code> property in the <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/API_UpdateServer.html">UpdateServer</a>
  /// API only if you are changing the <code>EndpointType</code> from
  /// <code>PUBLIC</code> or <code>VPC_ENDPOINT</code> to <code>VPC</code>. To
  /// change security groups associated with your server's VPC endpoint after
  /// creation, use the Amazon EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyVpcEndpoint.html">ModifyVpcEndpoint</a>
  /// API.
  /// </note>
  final List<String>? securityGroupIds;

  /// A list of subnet IDs that are required to host your server endpoint in your
  /// VPC.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC</code>.
  /// </note>
  final List<String>? subnetIds;

  /// The identifier of the VPC endpoint.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC_ENDPOINT</code>.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
  /// </note>
  final String? vpcEndpointId;

  /// The VPC identifier of the VPC in which a server's endpoint will be hosted.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC</code>.
  /// </note>
  final String? vpcId;

  EndpointDetails({
    this.addressAllocationIds,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcEndpointId,
    this.vpcId,
  });

  factory EndpointDetails.fromJson(Map<String, dynamic> json) {
    return EndpointDetails(
      addressAllocationIds: (json['AddressAllocationIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcEndpointId: json['VpcEndpointId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressAllocationIds = this.addressAllocationIds;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcEndpointId = this.vpcEndpointId;
    final vpcId = this.vpcId;
    return {
      if (addressAllocationIds != null)
        'AddressAllocationIds': addressAllocationIds,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Returns information related to the type of user authentication that is in
/// use for a file transfer protocol-enabled server's users. A server can have
/// only one method of authentication.
///
/// @nodoc
class IdentityProviderDetails {
  /// The identifier of the Directory Service directory that you want to use as
  /// your identity provider.
  final String? directoryId;

  /// The ARN for a Lambda function to use for the Identity provider.
  final String? function;

  /// This parameter is only applicable if your <code>IdentityProviderType</code>
  /// is <code>API_GATEWAY</code>. Provides the type of
  /// <code>InvocationRole</code> used to authenticate the user account.
  final String? invocationRole;

  /// For SFTP-enabled servers, and for custom identity providers <i>only</i>, you
  /// can specify whether to authenticate using a password, SSH key pair, or both.
  ///
  /// <ul>
  /// <li>
  /// <code>PASSWORD</code> - users must provide their password to connect.
  /// </li>
  /// <li>
  /// <code>PUBLIC_KEY</code> - users must provide their private key to connect.
  /// </li>
  /// <li>
  /// <code>PUBLIC_KEY_OR_PASSWORD</code> - users can authenticate with either
  /// their password or their key. This is the default value.
  /// </li>
  /// <li>
  /// <code>PUBLIC_KEY_AND_PASSWORD</code> - users must provide both their private
  /// key and their password to connect. The server checks the key first, and then
  /// if the key is valid, the system prompts for a password. If the private key
  /// provided does not match the public key that is stored, authentication fails.
  /// </li>
  /// </ul>
  final SftpAuthenticationMethods? sftpAuthenticationMethods;

  /// Provides the location of the service endpoint used to authenticate users.
  final String? url;

  IdentityProviderDetails({
    this.directoryId,
    this.function,
    this.invocationRole,
    this.sftpAuthenticationMethods,
    this.url,
  });

  factory IdentityProviderDetails.fromJson(Map<String, dynamic> json) {
    return IdentityProviderDetails(
      directoryId: json['DirectoryId'] as String?,
      function: json['Function'] as String?,
      invocationRole: json['InvocationRole'] as String?,
      sftpAuthenticationMethods: (json['SftpAuthenticationMethods'] as String?)
          ?.let(SftpAuthenticationMethods.fromString),
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final function = this.function;
    final invocationRole = this.invocationRole;
    final sftpAuthenticationMethods = this.sftpAuthenticationMethods;
    final url = this.url;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (function != null) 'Function': function,
      if (invocationRole != null) 'InvocationRole': invocationRole,
      if (sftpAuthenticationMethods != null)
        'SftpAuthenticationMethods': sftpAuthenticationMethods.value,
      if (url != null) 'Url': url,
    };
  }
}

/// Container for the <code>WorkflowDetail</code> data type. It is used by
/// actions that trigger a workflow to begin execution.
///
/// @nodoc
class WorkflowDetails {
  /// A trigger that starts a workflow if a file is only partially uploaded. You
  /// can attach a workflow to a server that executes whenever there is a partial
  /// upload.
  ///
  /// A <i>partial upload</i> occurs when a file is open when the session
  /// disconnects.
  /// <note>
  /// <code>OnPartialUpload</code> can contain a maximum of one
  /// <code>WorkflowDetail</code> object.
  /// </note>
  final List<WorkflowDetail>? onPartialUpload;

  /// A trigger that starts a workflow: the workflow begins to execute after a
  /// file is uploaded.
  ///
  /// To remove an associated workflow from a server, you can provide an empty
  /// <code>OnUpload</code> object, as in the following example.
  ///
  /// <code>aws transfer update-server --server-id s-01234567890abcdef
  /// --workflow-details '{"OnUpload":\[\]}'</code>
  /// <note>
  /// <code>OnUpload</code> can contain a maximum of one
  /// <code>WorkflowDetail</code> object.
  /// </note>
  final List<WorkflowDetail>? onUpload;

  WorkflowDetails({
    this.onPartialUpload,
    this.onUpload,
  });

  factory WorkflowDetails.fromJson(Map<String, dynamic> json) {
    return WorkflowDetails(
      onPartialUpload: (json['OnPartialUpload'] as List?)
          ?.nonNulls
          .map((e) => WorkflowDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      onUpload: (json['OnUpload'] as List?)
          ?.nonNulls
          .map((e) => WorkflowDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final onPartialUpload = this.onPartialUpload;
    final onUpload = this.onUpload;
    return {
      if (onPartialUpload != null) 'OnPartialUpload': onPartialUpload,
      if (onUpload != null) 'OnUpload': onUpload,
    };
  }
}

/// The Amazon S3 storage options that are configured for your server.
///
/// @nodoc
class S3StorageOptions {
  /// Specifies whether or not performance for your Amazon S3 directories is
  /// optimized.
  ///
  /// <ul>
  /// <li>
  /// If using the console, this is enabled by default.
  /// </li>
  /// <li>
  /// If using the API or CLI, this is disabled by default.
  /// </li>
  /// </ul>
  /// By default, home directory mappings have a <code>TYPE</code> of
  /// <code>DIRECTORY</code>. If you enable this option, you would then need to
  /// explicitly set the <code>HomeDirectoryMapEntry</code> <code>Type</code> to
  /// <code>FILE</code> if you want a mapping to have a file target.
  final DirectoryListingOptimization? directoryListingOptimization;

  S3StorageOptions({
    this.directoryListingOptimization,
  });

  factory S3StorageOptions.fromJson(Map<String, dynamic> json) {
    return S3StorageOptions(
      directoryListingOptimization:
          (json['DirectoryListingOptimization'] as String?)
              ?.let(DirectoryListingOptimization.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final directoryListingOptimization = this.directoryListingOptimization;
    return {
      if (directoryListingOptimization != null)
        'DirectoryListingOptimization': directoryListingOptimization.value,
    };
  }
}

/// @nodoc
class IpAddressType {
  static const ipv4 = IpAddressType._('IPV4');
  static const dualstack = IpAddressType._('DUALSTACK');

  final String value;

  const IpAddressType._(this.value);

  static const values = [ipv4, dualstack];

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

/// Indicates whether optimization to directory listing on S3 servers is used.
/// Disabled by default for compatibility.
///
/// @nodoc
class DirectoryListingOptimization {
  static const enabled = DirectoryListingOptimization._('ENABLED');
  static const disabled = DirectoryListingOptimization._('DISABLED');

  final String value;

  const DirectoryListingOptimization._(this.value);

  static const values = [enabled, disabled];

  static DirectoryListingOptimization fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DirectoryListingOptimization._(value));

  @override
  bool operator ==(other) =>
      other is DirectoryListingOptimization && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the workflow ID for the workflow to assign and the execution role
/// that's used for executing the workflow.
///
/// In addition to a workflow to execute when a file is uploaded completely,
/// <code>WorkflowDetails</code> can also contain a workflow ID (and execution
/// role) for a workflow to execute on partial upload. A partial upload occurs
/// when the server session disconnects while the file is still being uploaded.
///
/// @nodoc
class WorkflowDetail {
  /// Includes the necessary permissions for S3, EFS, and Lambda operations that
  /// Transfer can assume, so that all workflow steps can operate on the required
  /// resources
  final String executionRole;

  /// A unique identifier for the workflow.
  final String workflowId;

  WorkflowDetail({
    required this.executionRole,
    required this.workflowId,
  });

  factory WorkflowDetail.fromJson(Map<String, dynamic> json) {
    return WorkflowDetail(
      executionRole: (json['ExecutionRole'] as String?) ?? '',
      workflowId: (json['WorkflowId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final executionRole = this.executionRole;
    final workflowId = this.workflowId;
    return {
      'ExecutionRole': executionRole,
      'WorkflowId': workflowId,
    };
  }
}

/// @nodoc
class Protocol {
  static const sftp = Protocol._('SFTP');
  static const ftp = Protocol._('FTP');
  static const ftps = Protocol._('FTPS');
  static const as2 = Protocol._('AS2');

  final String value;

  const Protocol._(this.value);

  static const values = [sftp, ftp, ftps, as2];

  static Protocol fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Protocol._(value));

  @override
  bool operator ==(other) => other is Protocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SftpAuthenticationMethods {
  static const password = SftpAuthenticationMethods._('PASSWORD');
  static const publicKey = SftpAuthenticationMethods._('PUBLIC_KEY');
  static const publicKeyOrPassword =
      SftpAuthenticationMethods._('PUBLIC_KEY_OR_PASSWORD');
  static const publicKeyAndPassword =
      SftpAuthenticationMethods._('PUBLIC_KEY_AND_PASSWORD');

  final String value;

  const SftpAuthenticationMethods._(this.value);

  static const values = [
    password,
    publicKey,
    publicKeyOrPassword,
    publicKeyAndPassword
  ];

  static SftpAuthenticationMethods fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SftpAuthenticationMethods._(value));

  @override
  bool operator ==(other) =>
      other is SftpAuthenticationMethods && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TlsSessionResumptionMode {
  static const disabled = TlsSessionResumptionMode._('DISABLED');
  static const enabled = TlsSessionResumptionMode._('ENABLED');
  static const enforced = TlsSessionResumptionMode._('ENFORCED');

  final String value;

  const TlsSessionResumptionMode._(this.value);

  static const values = [disabled, enabled, enforced];

  static TlsSessionResumptionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TlsSessionResumptionMode._(value));

  @override
  bool operator ==(other) =>
      other is TlsSessionResumptionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SetStatOption {
  static const $default = SetStatOption._('DEFAULT');
  static const enableNoOp = SetStatOption._('ENABLE_NO_OP');

  final String value;

  const SetStatOption._(this.value);

  static const values = [$default, enableNoOp];

  static SetStatOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SetStatOption._(value));

  @override
  bool operator ==(other) => other is SetStatOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class As2Transport {
  static const http = As2Transport._('HTTP');

  final String value;

  const As2Transport._(this.value);

  static const values = [http];

  static As2Transport fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => As2Transport._(value));

  @override
  bool operator ==(other) => other is As2Transport && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the properties of a file transfer protocol-enabled server that was
/// specified.
///
/// @nodoc
class DescribedServer {
  /// Specifies the unique Amazon Resource Name (ARN) of the server.
  final String arn;

  /// The list of egress IP addresses of this server. These IP addresses are only
  /// relevant for servers that use the AS2 protocol. They are used for sending
  /// asynchronous MDNs.
  ///
  /// These IP addresses are assigned automatically when you create an AS2 server.
  /// Additionally, if you update an existing server and add the AS2 protocol,
  /// static IP addresses are assigned as well.
  final List<String>? as2ServiceManagedEgressIpAddresses;

  /// Specifies the ARN of the Amazon Web ServicesCertificate Manager (ACM)
  /// certificate. Required when <code>Protocols</code> is set to
  /// <code>FTPS</code>.
  final String? certificate;

  /// Specifies the domain of the storage system that is used for file transfers.
  /// There are two domains available: Amazon Simple Storage Service (Amazon S3)
  /// and Amazon Elastic File System (Amazon EFS). The default value is S3.
  final Domain? domain;

  /// The virtual private cloud (VPC) endpoint settings that are configured for
  /// your server. When you host your endpoint within your VPC, you can make your
  /// endpoint accessible only to resources within your VPC, or you can attach
  /// Elastic IP addresses and make your endpoint accessible to clients over the
  /// internet. Your VPC's default security groups are automatically assigned to
  /// your endpoint.
  final EndpointDetails? endpointDetails;

  /// Defines the type of endpoint that your server is connected to. If your
  /// server is connected to a VPC endpoint, your server isn't accessible over the
  /// public internet.
  final EndpointType? endpointType;

  /// Specifies the Base64-encoded SHA256 fingerprint of the server's host key.
  /// This value is equivalent to the output of the <code>ssh-keygen -l -f
  /// my-new-server-key</code> command.
  final String? hostKeyFingerprint;

  /// Specifies information to call a customer-supplied authentication API. This
  /// field is not populated when the <code>IdentityProviderType</code> of a
  /// server is <code>AWS_DIRECTORY_SERVICE</code> or
  /// <code>SERVICE_MANAGED</code>.
  final IdentityProviderDetails? identityProviderDetails;

  /// The mode of authentication for a server. The default value is
  /// <code>SERVICE_MANAGED</code>, which allows you to store and access user
  /// credentials within the Transfer Family service.
  ///
  /// Use <code>AWS_DIRECTORY_SERVICE</code> to provide access to Active Directory
  /// groups in Directory Service for Microsoft Active Directory or Microsoft
  /// Active Directory in your on-premises environment or in Amazon Web Services
  /// using AD Connector. This option also requires you to provide a Directory ID
  /// by using the <code>IdentityProviderDetails</code> parameter.
  ///
  /// Use the <code>API_GATEWAY</code> value to integrate with an identity
  /// provider of your choosing. The <code>API_GATEWAY</code> setting requires you
  /// to provide an Amazon API Gateway endpoint URL to call for authentication by
  /// using the <code>IdentityProviderDetails</code> parameter.
  ///
  /// Use the <code>AWS_LAMBDA</code> value to directly use an Lambda function as
  /// your identity provider. If you choose this value, you must specify the ARN
  /// for the Lambda function in the <code>Function</code> parameter for the
  /// <code>IdentityProviderDetails</code> data type.
  final IdentityProviderType? identityProviderType;

  /// Specifies whether to use IPv4 only, or to use dual-stack (IPv4 and IPv6) for
  /// your Transfer Family endpoint. The default value is <code>IPV4</code>.
  /// <important>
  /// The <code>IpAddressType</code> parameter has the following limitations:
  ///
  /// <ul>
  /// <li>
  /// It cannot be changed while the server is online. You must stop the server
  /// before modifying this parameter.
  /// </li>
  /// <li>
  /// It cannot be updated to <code>DUALSTACK</code> if the server has
  /// <code>AddressAllocationIds</code> specified.
  /// </li>
  /// </ul> </important> <note>
  /// When using <code>DUALSTACK</code> as the <code>IpAddressType</code>, you
  /// cannot set the <code>AddressAllocationIds</code> parameter for the <a
  /// href="https://docs.aws.amazon.com/transfer/latest/APIReference/API_EndpointDetails.html">EndpointDetails</a>
  /// for the server.
  /// </note>
  final IpAddressType? ipAddressType;

  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that allows a server to turn on Amazon CloudWatch logging for Amazon S3
  /// or Amazon EFS events. When set, you can view user activity in your
  /// CloudWatch logs.
  final String? loggingRole;

  /// Specifies a string to display when users connect to a server. This string is
  /// displayed after the user authenticates.
  /// <note>
  /// The SFTP protocol does not support post-authentication display banners.
  /// </note>
  final String? postAuthenticationLoginBanner;

  /// Specifies a string to display when users connect to a server. This string is
  /// displayed before the user authenticates. For example, the following banner
  /// displays details about using the system:
  ///
  /// <code>This system is for the use of authorized users only. Individuals using
  /// this computer system without authority, or in excess of their authority, are
  /// subject to having all of their activities on this system monitored and
  /// recorded by system personnel.</code>
  final String? preAuthenticationLoginBanner;

  /// The protocol settings that are configured for your server.
  /// <note>
  /// Avoid placing Network Load Balancers (NLBs) or NAT gateways in front of
  /// Transfer Family servers, as this increases costs and can cause performance
  /// issues, including reduced connection limits for FTPS. For more details, see
  /// <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/infrastructure-security.html#nlb-considerations">
  /// Avoid placing NLBs and NATs in front of Transfer Family</a>.
  /// </note>
  /// <ul>
  /// <li>
  /// To indicate passive mode (for FTP and FTPS protocols), use the
  /// <code>PassiveIp</code> parameter. Enter a single dotted-quad IPv4 address,
  /// such as the external IP address of a firewall, router, or load balancer.
  /// </li>
  /// <li>
  /// To ignore the error that is generated when the client attempts to use the
  /// <code>SETSTAT</code> command on a file that you are uploading to an Amazon
  /// S3 bucket, use the <code>SetStatOption</code> parameter. To have the
  /// Transfer Family server ignore the <code>SETSTAT</code> command and upload
  /// files without needing to make any changes to your SFTP client, set the value
  /// to <code>ENABLE_NO_OP</code>. If you set the <code>SetStatOption</code>
  /// parameter to <code>ENABLE_NO_OP</code>, Transfer Family generates a log
  /// entry to Amazon CloudWatch Logs, so that you can determine when the client
  /// is making a <code>SETSTAT</code> call.
  /// </li>
  /// <li>
  /// To determine whether your Transfer Family server resumes recent, negotiated
  /// sessions through a unique session ID, use the
  /// <code>TlsSessionResumptionMode</code> parameter.
  /// </li>
  /// <li>
  /// <code>As2Transports</code> indicates the transport method for the AS2
  /// messages. Currently, only HTTP is supported.
  /// </li>
  /// </ul>
  final ProtocolDetails? protocolDetails;

  /// Specifies the file transfer protocol or protocols over which your file
  /// transfer protocol client can connect to your server's endpoint. The
  /// available protocols are:
  ///
  /// <ul>
  /// <li>
  /// <code>SFTP</code> (Secure Shell (SSH) File Transfer Protocol): File transfer
  /// over SSH
  /// </li>
  /// <li>
  /// <code>FTPS</code> (File Transfer Protocol Secure): File transfer with TLS
  /// encryption
  /// </li>
  /// <li>
  /// <code>FTP</code> (File Transfer Protocol): Unencrypted file transfer
  /// </li>
  /// <li>
  /// <code>AS2</code> (Applicability Statement 2): used for transporting
  /// structured business-to-business data
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If you select <code>FTPS</code>, you must choose a certificate stored in
  /// Certificate Manager (ACM) which is used to identify your server when clients
  /// connect to it over FTPS.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> includes either <code>FTP</code> or
  /// <code>FTPS</code>, then the <code>EndpointType</code> must be
  /// <code>VPC</code> and the <code>IdentityProviderType</code> must be either
  /// <code>AWS_DIRECTORY_SERVICE</code>, <code>AWS_LAMBDA</code>, or
  /// <code>API_GATEWAY</code>.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> includes <code>FTP</code>, then
  /// <code>AddressAllocationIds</code> cannot be associated.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> is set only to <code>SFTP</code>, the
  /// <code>EndpointType</code> can be set to <code>PUBLIC</code> and the
  /// <code>IdentityProviderType</code> can be set any of the supported identity
  /// types: <code>SERVICE_MANAGED</code>, <code>AWS_DIRECTORY_SERVICE</code>,
  /// <code>AWS_LAMBDA</code>, or <code>API_GATEWAY</code>.
  /// </li>
  /// <li>
  /// If <code>Protocol</code> includes <code>AS2</code>, then the
  /// <code>EndpointType</code> must be <code>VPC</code>, and domain must be
  /// Amazon S3.
  /// </li>
  /// </ul> </note>
  final List<Protocol>? protocols;

  /// Specifies whether or not performance for your Amazon S3 directories is
  /// optimized.
  ///
  /// <ul>
  /// <li>
  /// If using the console, this is enabled by default.
  /// </li>
  /// <li>
  /// If using the API or CLI, this is disabled by default.
  /// </li>
  /// </ul>
  /// By default, home directory mappings have a <code>TYPE</code> of
  /// <code>DIRECTORY</code>. If you enable this option, you would then need to
  /// explicitly set the <code>HomeDirectoryMapEntry</code> <code>Type</code> to
  /// <code>FILE</code> if you want a mapping to have a file target.
  final S3StorageOptions? s3StorageOptions;

  /// Specifies the name of the security policy for the server.
  final String? securityPolicyName;

  /// Specifies the unique system-assigned identifier for a server that you
  /// instantiate.
  final String? serverId;

  /// The condition of the server that was described. A value of
  /// <code>ONLINE</code> indicates that the server can accept jobs and transfer
  /// files. A <code>State</code> value of <code>OFFLINE</code> means that the
  /// server cannot perform file transfer operations.
  ///
  /// The states of <code>STARTING</code> and <code>STOPPING</code> indicate that
  /// the server is in an intermediate state, either not fully able to respond, or
  /// not fully offline. The values of <code>START_FAILED</code> or
  /// <code>STOP_FAILED</code> can indicate an error condition.
  final State? state;

  /// Specifies the log groups to which your server logs are sent.
  ///
  /// To specify a log group, you must provide the ARN for an existing log group.
  /// In this case, the format of the log group is as follows:
  ///
  /// <code>arn:aws:logs:region-name:amazon-account-id:log-group:log-group-name:*</code>
  ///
  /// For example,
  /// <code>arn:aws:logs:us-east-1:111122223333:log-group:mytestgroup:*</code>
  ///
  /// If you have previously specified a log group for a server, you can clear it,
  /// and in effect turn off structured logging, by providing an empty value for
  /// this parameter in an <code>update-server</code> call. For example:
  ///
  /// <code>update-server --server-id s-1234567890abcdef0
  /// --structured-log-destinations</code>
  final List<String>? structuredLogDestinations;

  /// Specifies the key-value pairs that you can use to search for and group
  /// servers that were assigned to the server that was described.
  final List<Tag>? tags;

  /// Specifies the number of users that are assigned to a server you specified
  /// with the <code>ServerId</code>.
  final int? userCount;

  /// Specifies the workflow ID for the workflow to assign and the execution role
  /// that's used for executing the workflow.
  ///
  /// In addition to a workflow to execute when a file is uploaded completely,
  /// <code>WorkflowDetails</code> can also contain a workflow ID (and execution
  /// role) for a workflow to execute on partial upload. A partial upload occurs
  /// when the server session disconnects while the file is still being uploaded.
  final WorkflowDetails? workflowDetails;

  DescribedServer({
    required this.arn,
    this.as2ServiceManagedEgressIpAddresses,
    this.certificate,
    this.domain,
    this.endpointDetails,
    this.endpointType,
    this.hostKeyFingerprint,
    this.identityProviderDetails,
    this.identityProviderType,
    this.ipAddressType,
    this.loggingRole,
    this.postAuthenticationLoginBanner,
    this.preAuthenticationLoginBanner,
    this.protocolDetails,
    this.protocols,
    this.s3StorageOptions,
    this.securityPolicyName,
    this.serverId,
    this.state,
    this.structuredLogDestinations,
    this.tags,
    this.userCount,
    this.workflowDetails,
  });

  factory DescribedServer.fromJson(Map<String, dynamic> json) {
    return DescribedServer(
      arn: (json['Arn'] as String?) ?? '',
      as2ServiceManagedEgressIpAddresses:
          (json['As2ServiceManagedEgressIpAddresses'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      certificate: json['Certificate'] as String?,
      domain: (json['Domain'] as String?)?.let(Domain.fromString),
      endpointDetails: json['EndpointDetails'] != null
          ? EndpointDetails.fromJson(
              json['EndpointDetails'] as Map<String, dynamic>)
          : null,
      endpointType:
          (json['EndpointType'] as String?)?.let(EndpointType.fromString),
      hostKeyFingerprint: json['HostKeyFingerprint'] as String?,
      identityProviderDetails: json['IdentityProviderDetails'] != null
          ? IdentityProviderDetails.fromJson(
              json['IdentityProviderDetails'] as Map<String, dynamic>)
          : null,
      identityProviderType: (json['IdentityProviderType'] as String?)
          ?.let(IdentityProviderType.fromString),
      ipAddressType:
          (json['IpAddressType'] as String?)?.let(IpAddressType.fromString),
      loggingRole: json['LoggingRole'] as String?,
      postAuthenticationLoginBanner:
          json['PostAuthenticationLoginBanner'] as String?,
      preAuthenticationLoginBanner:
          json['PreAuthenticationLoginBanner'] as String?,
      protocolDetails: json['ProtocolDetails'] != null
          ? ProtocolDetails.fromJson(
              json['ProtocolDetails'] as Map<String, dynamic>)
          : null,
      protocols: (json['Protocols'] as List?)
          ?.nonNulls
          .map((e) => Protocol.fromString((e as String)))
          .toList(),
      s3StorageOptions: json['S3StorageOptions'] != null
          ? S3StorageOptions.fromJson(
              json['S3StorageOptions'] as Map<String, dynamic>)
          : null,
      securityPolicyName: json['SecurityPolicyName'] as String?,
      serverId: json['ServerId'] as String?,
      state: (json['State'] as String?)?.let(State.fromString),
      structuredLogDestinations: (json['StructuredLogDestinations'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      userCount: json['UserCount'] as int?,
      workflowDetails: json['WorkflowDetails'] != null
          ? WorkflowDetails.fromJson(
              json['WorkflowDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final as2ServiceManagedEgressIpAddresses =
        this.as2ServiceManagedEgressIpAddresses;
    final certificate = this.certificate;
    final domain = this.domain;
    final endpointDetails = this.endpointDetails;
    final endpointType = this.endpointType;
    final hostKeyFingerprint = this.hostKeyFingerprint;
    final identityProviderDetails = this.identityProviderDetails;
    final identityProviderType = this.identityProviderType;
    final ipAddressType = this.ipAddressType;
    final loggingRole = this.loggingRole;
    final postAuthenticationLoginBanner = this.postAuthenticationLoginBanner;
    final preAuthenticationLoginBanner = this.preAuthenticationLoginBanner;
    final protocolDetails = this.protocolDetails;
    final protocols = this.protocols;
    final s3StorageOptions = this.s3StorageOptions;
    final securityPolicyName = this.securityPolicyName;
    final serverId = this.serverId;
    final state = this.state;
    final structuredLogDestinations = this.structuredLogDestinations;
    final tags = this.tags;
    final userCount = this.userCount;
    final workflowDetails = this.workflowDetails;
    return {
      'Arn': arn,
      if (as2ServiceManagedEgressIpAddresses != null)
        'As2ServiceManagedEgressIpAddresses':
            as2ServiceManagedEgressIpAddresses,
      if (certificate != null) 'Certificate': certificate,
      if (domain != null) 'Domain': domain.value,
      if (endpointDetails != null) 'EndpointDetails': endpointDetails,
      if (endpointType != null) 'EndpointType': endpointType.value,
      if (hostKeyFingerprint != null) 'HostKeyFingerprint': hostKeyFingerprint,
      if (identityProviderDetails != null)
        'IdentityProviderDetails': identityProviderDetails,
      if (identityProviderType != null)
        'IdentityProviderType': identityProviderType.value,
      if (ipAddressType != null) 'IpAddressType': ipAddressType.value,
      if (loggingRole != null) 'LoggingRole': loggingRole,
      if (postAuthenticationLoginBanner != null)
        'PostAuthenticationLoginBanner': postAuthenticationLoginBanner,
      if (preAuthenticationLoginBanner != null)
        'PreAuthenticationLoginBanner': preAuthenticationLoginBanner,
      if (protocolDetails != null) 'ProtocolDetails': protocolDetails,
      if (protocols != null)
        'Protocols': protocols.map((e) => e.value).toList(),
      if (s3StorageOptions != null) 'S3StorageOptions': s3StorageOptions,
      if (securityPolicyName != null) 'SecurityPolicyName': securityPolicyName,
      if (serverId != null) 'ServerId': serverId,
      if (state != null) 'State': state.value,
      if (structuredLogDestinations != null)
        'StructuredLogDestinations': structuredLogDestinations,
      if (tags != null) 'Tags': tags,
      if (userCount != null) 'UserCount': userCount,
      if (workflowDetails != null) 'WorkflowDetails': workflowDetails,
    };
  }
}

/// Returns the properties of the profile that was specified.
///
/// @nodoc
class ListedProfile {
  /// The Amazon Resource Name (ARN) of the specified profile.
  final String? arn;

  /// The <code>As2Id</code> is the <i>AS2-name</i>, as defined in the <a
  /// href="https://datatracker.ietf.org/doc/html/rfc4130">RFC 4130</a>. For
  /// inbound transfers, this is the <code>AS2-From</code> header for the AS2
  /// messages sent from the partner. For outbound connectors, this is the
  /// <code>AS2-To</code> header for the AS2 messages sent to the partner using
  /// the <code>StartFileTransfer</code> API operation. This ID cannot include
  /// spaces.
  final String? as2Id;

  /// A unique identifier for the local or partner AS2 profile.
  final String? profileId;

  /// Indicates whether to list only <code>LOCAL</code> type profiles or only
  /// <code>PARTNER</code> type profiles. If not supplied in the request, the
  /// command lists all types of profiles.
  final ProfileType? profileType;

  ListedProfile({
    this.arn,
    this.as2Id,
    this.profileId,
    this.profileType,
  });

  factory ListedProfile.fromJson(Map<String, dynamic> json) {
    return ListedProfile(
      arn: json['Arn'] as String?,
      as2Id: json['As2Id'] as String?,
      profileId: json['ProfileId'] as String?,
      profileType:
          (json['ProfileType'] as String?)?.let(ProfileType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final as2Id = this.as2Id;
    final profileId = this.profileId;
    final profileType = this.profileType;
    return {
      if (arn != null) 'Arn': arn,
      if (as2Id != null) 'As2Id': as2Id,
      if (profileId != null) 'ProfileId': profileId,
      if (profileType != null) 'ProfileType': profileType.value,
    };
  }
}

/// @nodoc
class ProfileType {
  static const local = ProfileType._('LOCAL');
  static const partner = ProfileType._('PARTNER');

  final String value;

  const ProfileType._(this.value);

  static const values = [local, partner];

  static ProfileType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ProfileType._(value));

  @override
  bool operator ==(other) => other is ProfileType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details for a local or partner AS2 profile.
///
/// @nodoc
class DescribedProfile {
  /// The unique Amazon Resource Name (ARN) for the profile.
  final String arn;

  /// The <code>As2Id</code> is the <i>AS2-name</i>, as defined in the <a
  /// href="https://datatracker.ietf.org/doc/html/rfc4130">RFC 4130</a>. For
  /// inbound transfers, this is the <code>AS2-From</code> header for the AS2
  /// messages sent from the partner. For outbound connectors, this is the
  /// <code>AS2-To</code> header for the AS2 messages sent to the partner using
  /// the <code>StartFileTransfer</code> API operation. This ID cannot include
  /// spaces.
  final String? as2Id;

  /// An array of identifiers for the imported certificates. You use this
  /// identifier for working with profiles and partner profiles.
  final List<String>? certificateIds;

  /// A unique identifier for the local or partner AS2 profile.
  final String? profileId;

  /// Indicates whether to list only <code>LOCAL</code> type profiles or only
  /// <code>PARTNER</code> type profiles. If not supplied in the request, the
  /// command lists all types of profiles.
  final ProfileType? profileType;

  /// Key-value pairs that can be used to group and search for profiles.
  final List<Tag>? tags;

  DescribedProfile({
    required this.arn,
    this.as2Id,
    this.certificateIds,
    this.profileId,
    this.profileType,
    this.tags,
  });

  factory DescribedProfile.fromJson(Map<String, dynamic> json) {
    return DescribedProfile(
      arn: (json['Arn'] as String?) ?? '',
      as2Id: json['As2Id'] as String?,
      certificateIds: (json['CertificateIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      profileId: json['ProfileId'] as String?,
      profileType:
          (json['ProfileType'] as String?)?.let(ProfileType.fromString),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final as2Id = this.as2Id;
    final certificateIds = this.certificateIds;
    final profileId = this.profileId;
    final profileType = this.profileType;
    final tags = this.tags;
    return {
      'Arn': arn,
      if (as2Id != null) 'As2Id': as2Id,
      if (certificateIds != null) 'CertificateIds': certificateIds,
      if (profileId != null) 'ProfileId': profileId,
      if (profileType != null) 'ProfileType': profileType.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Returns details of the connector that is specified.
///
/// @nodoc
class ListedConnector {
  /// The Amazon Resource Name (ARN) of the specified connector.
  final String? arn;

  /// The unique identifier for the connector.
  final String? connectorId;

  /// The URL of the partner's AS2 or SFTP endpoint.
  ///
  /// When creating AS2 connectors or service-managed SFTP connectors (connectors
  /// without egress configuration), you must provide a URL to specify the remote
  /// server endpoint. For VPC Lattice type connectors, the URL must be null.
  final String? url;

  ListedConnector({
    this.arn,
    this.connectorId,
    this.url,
  });

  factory ListedConnector.fromJson(Map<String, dynamic> json) {
    return ListedConnector(
      arn: json['Arn'] as String?,
      connectorId: json['ConnectorId'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectorId = this.connectorId;
    final url = this.url;
    return {
      if (arn != null) 'Arn': arn,
      if (connectorId != null) 'ConnectorId': connectorId,
      if (url != null) 'Url': url,
    };
  }
}

/// Contains the details for an AS2 connector object. The connector object is
/// used for AS2 outbound processes, to connect the Transfer Family customer
/// with the trading partner.
///
/// @nodoc
class As2ConnectorConfig {
  /// Configuration settings for asynchronous Message Disposition Notification
  /// (MDN) responses. This allows you to configure where asynchronous MDN
  /// responses should be sent and which servers should handle them.
  final As2AsyncMdnConnectorConfig? asyncMdnConfig;

  /// Provides Basic authentication support to the AS2 Connectors API. To use
  /// Basic authentication, you must provide the name or Amazon Resource Name
  /// (ARN) of a secret in Secrets Manager.
  ///
  /// The default value for this parameter is <code>null</code>, which indicates
  /// that Basic authentication is not enabled for the connector.
  ///
  /// If the connector should use Basic authentication, the secret needs to be in
  /// the following format:
  ///
  /// <code>{ "Username": "user-name", "Password": "user-password" }</code>
  ///
  /// Replace <code>user-name</code> and <code>user-password</code> with the
  /// credentials for the actual user that is being authenticated.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// You are storing these credentials in Secrets Manager, <i>not passing them
  /// directly</i> into this API.
  /// </li>
  /// <li>
  /// If you are using the API, SDKs, or CloudFormation to configure your
  /// connector, then you must create the secret before you can enable Basic
  /// authentication. However, if you are using the Amazon Web Services management
  /// console, you can have the system create the secret for you.
  /// </li>
  /// </ul>
  /// If you have previously enabled Basic authentication for a connector, you can
  /// disable it by using the <code>UpdateConnector</code> API call. For example,
  /// if you are using the CLI, you can run the following command to remove Basic
  /// authentication:
  ///
  /// <code>update-connector --connector-id my-connector-id --as2-config
  /// 'BasicAuthSecretId=""'</code>
  final String? basicAuthSecretId;

  /// Specifies whether the AS2 file is compressed.
  final CompressionEnum? compression;

  /// The algorithm that is used to encrypt the file.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// Do not use the <code>DES_EDE3_CBC</code> algorithm unless you must support a
  /// legacy client that requires it, as it is a weak encryption algorithm.
  /// </li>
  /// <li>
  /// You can only specify <code>NONE</code> if the URL for your connector uses
  /// HTTPS. Using HTTPS ensures that no traffic is sent in clear text.
  /// </li>
  /// </ul>
  final EncryptionAlg? encryptionAlgorithm;

  /// A unique identifier for the AS2 local profile.
  final String? localProfileId;

  /// Used for outbound requests (from an Transfer Family connector to a partner
  /// AS2 server) to determine whether the partner response for transfers is
  /// synchronous or asynchronous. Specify either of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ASYNC</code>: The system expects an asynchronous MDN response,
  /// confirming that the file was transferred successfully (or not).
  /// </li>
  /// <li>
  /// <code>SYNC</code>: The system expects a synchronous MDN response, confirming
  /// that the file was transferred successfully (or not).
  /// </li>
  /// <li>
  /// <code>NONE</code>: Specifies that no MDN response is required.
  /// </li>
  /// </ul>
  final MdnResponse? mdnResponse;

  /// The signing algorithm for the MDN response.
  /// <note>
  /// If set to DEFAULT (or not set at all), the value for
  /// <code>SigningAlgorithm</code> is used.
  /// </note>
  final MdnSigningAlg? mdnSigningAlgorithm;

  /// Used as the <code>Subject</code> HTTP header attribute in AS2 messages that
  /// are being sent with the connector.
  final String? messageSubject;

  /// A unique identifier for the partner profile for the connector.
  final String? partnerProfileId;

  /// Allows you to use the Amazon S3 <code>Content-Type</code> that is associated
  /// with objects in S3 instead of having the content type mapped based on the
  /// file extension. This parameter is enabled by default when you create an AS2
  /// connector from the console, but disabled by default when you create an AS2
  /// connector by calling the API directly.
  final PreserveContentType? preserveContentType;

  /// The algorithm that is used to sign the AS2 messages sent with the connector.
  final SigningAlg? signingAlgorithm;

  As2ConnectorConfig({
    this.asyncMdnConfig,
    this.basicAuthSecretId,
    this.compression,
    this.encryptionAlgorithm,
    this.localProfileId,
    this.mdnResponse,
    this.mdnSigningAlgorithm,
    this.messageSubject,
    this.partnerProfileId,
    this.preserveContentType,
    this.signingAlgorithm,
  });

  factory As2ConnectorConfig.fromJson(Map<String, dynamic> json) {
    return As2ConnectorConfig(
      asyncMdnConfig: json['AsyncMdnConfig'] != null
          ? As2AsyncMdnConnectorConfig.fromJson(
              json['AsyncMdnConfig'] as Map<String, dynamic>)
          : null,
      basicAuthSecretId: json['BasicAuthSecretId'] as String?,
      compression:
          (json['Compression'] as String?)?.let(CompressionEnum.fromString),
      encryptionAlgorithm: (json['EncryptionAlgorithm'] as String?)
          ?.let(EncryptionAlg.fromString),
      localProfileId: json['LocalProfileId'] as String?,
      mdnResponse:
          (json['MdnResponse'] as String?)?.let(MdnResponse.fromString),
      mdnSigningAlgorithm: (json['MdnSigningAlgorithm'] as String?)
          ?.let(MdnSigningAlg.fromString),
      messageSubject: json['MessageSubject'] as String?,
      partnerProfileId: json['PartnerProfileId'] as String?,
      preserveContentType: (json['PreserveContentType'] as String?)
          ?.let(PreserveContentType.fromString),
      signingAlgorithm:
          (json['SigningAlgorithm'] as String?)?.let(SigningAlg.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final asyncMdnConfig = this.asyncMdnConfig;
    final basicAuthSecretId = this.basicAuthSecretId;
    final compression = this.compression;
    final encryptionAlgorithm = this.encryptionAlgorithm;
    final localProfileId = this.localProfileId;
    final mdnResponse = this.mdnResponse;
    final mdnSigningAlgorithm = this.mdnSigningAlgorithm;
    final messageSubject = this.messageSubject;
    final partnerProfileId = this.partnerProfileId;
    final preserveContentType = this.preserveContentType;
    final signingAlgorithm = this.signingAlgorithm;
    return {
      if (asyncMdnConfig != null) 'AsyncMdnConfig': asyncMdnConfig,
      if (basicAuthSecretId != null) 'BasicAuthSecretId': basicAuthSecretId,
      if (compression != null) 'Compression': compression.value,
      if (encryptionAlgorithm != null)
        'EncryptionAlgorithm': encryptionAlgorithm.value,
      if (localProfileId != null) 'LocalProfileId': localProfileId,
      if (mdnResponse != null) 'MdnResponse': mdnResponse.value,
      if (mdnSigningAlgorithm != null)
        'MdnSigningAlgorithm': mdnSigningAlgorithm.value,
      if (messageSubject != null) 'MessageSubject': messageSubject,
      if (partnerProfileId != null) 'PartnerProfileId': partnerProfileId,
      if (preserveContentType != null)
        'PreserveContentType': preserveContentType.value,
      if (signingAlgorithm != null) 'SigningAlgorithm': signingAlgorithm.value,
    };
  }
}

/// Contains the details for an SFTP connector object. The connector object is
/// used for transferring files to and from a partner's SFTP server.
///
/// @nodoc
class SftpConnectorConfig {
  /// Specify the number of concurrent connections that your connector creates to
  /// the remote server. The default value is <code>1</code>. The maximum values
  /// is <code>5</code>.
  /// <note>
  /// If you are using the Amazon Web Services Management Console, the default
  /// value is <code>5</code>.
  /// </note>
  /// This parameter specifies the number of active connections that your
  /// connector can establish with the remote server at the same time. Increasing
  /// this value can enhance connector performance when transferring large file
  /// batches by enabling parallel operations.
  final int? maxConcurrentConnections;

  /// The public portion of the host key, or keys, that are used to identify the
  /// external server to which you are connecting. You can use the
  /// <code>ssh-keyscan</code> command against the SFTP server to retrieve the
  /// necessary key.
  /// <note>
  /// <code>TrustedHostKeys</code> is optional for <code>CreateConnector</code>.
  /// If not provided, you can use <code>TestConnection</code> to retrieve the
  /// server host key during the initial connection attempt, and subsequently
  /// update the connector with the observed host key.
  /// </note>
  /// When creating connectors with egress config (VPC_LATTICE type connectors),
  /// since host name is not something we can verify, the only accepted trusted
  /// host key format is <code>key-type key-body</code> without the host name. For
  /// example: <code>ssh-rsa AAAAB3Nza...&lt;long-string-for-public-key&gt;</code>
  ///
  /// The three standard SSH public key format elements are <code>&lt;key
  /// type&gt;</code>, <code>&lt;body base64&gt;</code>, and an optional
  /// <code>&lt;comment&gt;</code>, with spaces between each element. Specify only
  /// the <code>&lt;key type&gt;</code> and <code>&lt;body base64&gt;</code>: do
  /// not enter the <code>&lt;comment&gt;</code> portion of the key.
  ///
  /// For the trusted host key, Transfer Family accepts RSA and ECDSA keys.
  ///
  /// <ul>
  /// <li>
  /// For RSA keys, the <code>&lt;key type&gt;</code> string is
  /// <code>ssh-rsa</code>.
  /// </li>
  /// <li>
  /// For ECDSA keys, the <code>&lt;key type&gt;</code> string is either
  /// <code>ecdsa-sha2-nistp256</code>, <code>ecdsa-sha2-nistp384</code>, or
  /// <code>ecdsa-sha2-nistp521</code>, depending on the size of the key you
  /// generated.
  /// </li>
  /// </ul>
  /// Run this command to retrieve the SFTP server host key, where your SFTP
  /// server name is <code>ftp.host.com</code>.
  ///
  /// <code>ssh-keyscan ftp.host.com</code>
  ///
  /// This prints the public host key to standard output.
  ///
  /// <code>ftp.host.com ssh-rsa
  /// AAAAB3Nza...&lt;long-string-for-public-key&gt;</code>
  ///
  /// Copy and paste this string into the <code>TrustedHostKeys</code> field for
  /// the <code>create-connector</code> command or into the <b>Trusted host
  /// keys</b> field in the console.
  ///
  /// For VPC Lattice type connectors (VPC_LATTICE), remove the hostname from the
  /// key and use only the <code>key-type key-body</code> format. In this example,
  /// it should be: <code>ssh-rsa
  /// AAAAB3Nza...&lt;long-string-for-public-key&gt;</code>
  final List<String>? trustedHostKeys;

  /// The identifier for the secret (in Amazon Web Services Secrets Manager) that
  /// contains the SFTP user's private key, password, or both. The identifier must
  /// be the Amazon Resource Name (ARN) of the secret.
  /// <note>
  /// <ul>
  /// <li>
  /// Required when creating an SFTP connector
  /// </li>
  /// <li>
  /// Optional when updating an existing SFTP connector
  /// </li>
  /// </ul> </note>
  final String? userSecretId;

  SftpConnectorConfig({
    this.maxConcurrentConnections,
    this.trustedHostKeys,
    this.userSecretId,
  });

  factory SftpConnectorConfig.fromJson(Map<String, dynamic> json) {
    return SftpConnectorConfig(
      maxConcurrentConnections: json['MaxConcurrentConnections'] as int?,
      trustedHostKeys: (json['TrustedHostKeys'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      userSecretId: json['UserSecretId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxConcurrentConnections = this.maxConcurrentConnections;
    final trustedHostKeys = this.trustedHostKeys;
    final userSecretId = this.userSecretId;
    return {
      if (maxConcurrentConnections != null)
        'MaxConcurrentConnections': maxConcurrentConnections,
      if (trustedHostKeys != null) 'TrustedHostKeys': trustedHostKeys,
      if (userSecretId != null) 'UserSecretId': userSecretId,
    };
  }
}

/// Structure for updating the egress configuration of an existing connector.
/// Allows modification of how traffic is routed from the connector to the SFTP
/// server, including VPC_LATTICE settings.
///
/// @nodoc
class UpdateConnectorEgressConfig {
  /// VPC_LATTICE configuration updates for the connector. Use this to modify the
  /// Resource Configuration ARN or port number for VPC-based connectivity.
  final UpdateConnectorVpcLatticeEgressConfig? vpcLattice;

  UpdateConnectorEgressConfig({
    this.vpcLattice,
  });

  Map<String, dynamic> toJson() {
    final vpcLattice = this.vpcLattice;
    return {
      if (vpcLattice != null) 'VpcLattice': vpcLattice,
    };
  }
}

/// @nodoc
class ConnectorsIpAddressType {
  static const ipv4 = ConnectorsIpAddressType._('IPV4');
  static const dualstack = ConnectorsIpAddressType._('DUALSTACK');

  final String value;

  const ConnectorsIpAddressType._(this.value);

  static const values = [ipv4, dualstack];

  static ConnectorsIpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectorsIpAddressType._(value));

  @override
  bool operator ==(other) =>
      other is ConnectorsIpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// VPC_LATTICE egress configuration updates for modifying how the connector
/// routes traffic through customer VPCs. Changes to these settings may require
/// connector restart to take effect.
///
/// @nodoc
class UpdateConnectorVpcLatticeEgressConfig {
  /// Updated port number for SFTP connections through VPC_LATTICE. Change this if
  /// the target SFTP server port has been modified or if connecting to a
  /// different server endpoint.
  final int? portNumber;

  /// Updated ARN of the VPC_LATTICE Resource Configuration. Use this to change
  /// the target SFTP server location or modify the network path through the
  /// customer's VPC infrastructure.
  final String? resourceConfigurationArn;

  UpdateConnectorVpcLatticeEgressConfig({
    this.portNumber,
    this.resourceConfigurationArn,
  });

  Map<String, dynamic> toJson() {
    final portNumber = this.portNumber;
    final resourceConfigurationArn = this.resourceConfigurationArn;
    return {
      if (portNumber != null) 'PortNumber': portNumber,
      if (resourceConfigurationArn != null)
        'ResourceConfigurationArn': resourceConfigurationArn,
    };
  }
}

/// @nodoc
class CompressionEnum {
  static const zlib = CompressionEnum._('ZLIB');
  static const disabled = CompressionEnum._('DISABLED');

  final String value;

  const CompressionEnum._(this.value);

  static const values = [zlib, disabled];

  static CompressionEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CompressionEnum._(value));

  @override
  bool operator ==(other) => other is CompressionEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EncryptionAlg {
  static const aes128Cbc = EncryptionAlg._('AES128_CBC');
  static const aes192Cbc = EncryptionAlg._('AES192_CBC');
  static const aes256Cbc = EncryptionAlg._('AES256_CBC');
  static const desEde3Cbc = EncryptionAlg._('DES_EDE3_CBC');
  static const none = EncryptionAlg._('NONE');

  final String value;

  const EncryptionAlg._(this.value);

  static const values = [aes128Cbc, aes192Cbc, aes256Cbc, desEde3Cbc, none];

  static EncryptionAlg fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionAlg._(value));

  @override
  bool operator ==(other) => other is EncryptionAlg && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SigningAlg {
  static const sha256 = SigningAlg._('SHA256');
  static const sha384 = SigningAlg._('SHA384');
  static const sha512 = SigningAlg._('SHA512');
  static const sha1 = SigningAlg._('SHA1');
  static const none = SigningAlg._('NONE');

  final String value;

  const SigningAlg._(this.value);

  static const values = [sha256, sha384, sha512, sha1, none];

  static SigningAlg fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SigningAlg._(value));

  @override
  bool operator ==(other) => other is SigningAlg && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MdnSigningAlg {
  static const sha256 = MdnSigningAlg._('SHA256');
  static const sha384 = MdnSigningAlg._('SHA384');
  static const sha512 = MdnSigningAlg._('SHA512');
  static const sha1 = MdnSigningAlg._('SHA1');
  static const none = MdnSigningAlg._('NONE');
  static const $default = MdnSigningAlg._('DEFAULT');

  final String value;

  const MdnSigningAlg._(this.value);

  static const values = [sha256, sha384, sha512, sha1, none, $default];

  static MdnSigningAlg fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MdnSigningAlg._(value));

  @override
  bool operator ==(other) => other is MdnSigningAlg && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MdnResponse {
  static const sync = MdnResponse._('SYNC');
  static const none = MdnResponse._('NONE');
  static const async = MdnResponse._('ASYNC');

  final String value;

  const MdnResponse._(this.value);

  static const values = [sync, none, async];

  static MdnResponse fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MdnResponse._(value));

  @override
  bool operator ==(other) => other is MdnResponse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PreserveContentType {
  static const enabled = PreserveContentType._('ENABLED');
  static const disabled = PreserveContentType._('DISABLED');

  final String value;

  const PreserveContentType._(this.value);

  static const values = [enabled, disabled];

  static PreserveContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PreserveContentType._(value));

  @override
  bool operator ==(other) =>
      other is PreserveContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the configuration details for asynchronous Message Disposition
/// Notification (MDN) responses in AS2 connectors. This configuration specifies
/// where asynchronous MDN responses should be sent and which servers should
/// handle them.
///
/// @nodoc
class As2AsyncMdnConnectorConfig {
  /// A list of server identifiers that can handle asynchronous MDN responses. You
  /// can specify between 1 and 10 server IDs.
  final List<String>? serverIds;

  /// The URL endpoint where asynchronous MDN responses should be sent.
  final String? url;

  As2AsyncMdnConnectorConfig({
    this.serverIds,
    this.url,
  });

  factory As2AsyncMdnConnectorConfig.fromJson(Map<String, dynamic> json) {
    return As2AsyncMdnConnectorConfig(
      serverIds: (json['ServerIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serverIds = this.serverIds;
    final url = this.url;
    return {
      if (serverIds != null) 'ServerIds': serverIds,
      if (url != null) 'Url': url,
    };
  }
}

/// Describes the parameters for the connector, as identified by the
/// <code>ConnectorId</code>.
///
/// @nodoc
class DescribedConnector {
  /// The unique Amazon Resource Name (ARN) for the connector.
  final String arn;

  /// Type of egress configuration for the connector. SERVICE_MANAGED uses
  /// Transfer Family managed NAT gateways, while VPC_LATTICE routes traffic
  /// through customer VPCs using VPC Lattice.
  final ConnectorEgressType egressType;

  /// Current status of the connector. PENDING indicates creation/update in
  /// progress, ACTIVE means ready for operations, and ERRORED indicates a failure
  /// requiring attention.
  final ConnectorStatus status;

  /// Connectors are used to send files using either the AS2 or SFTP protocol. For
  /// the access role, provide the Amazon Resource Name (ARN) of the Identity and
  /// Access Management role to use.
  ///
  /// <b>For AS2 connectors</b>
  ///
  /// With AS2, you can send files by calling <code>StartFileTransfer</code> and
  /// specifying the file paths in the request parameter,
  /// <code>SendFilePaths</code>. We use the file’s parent directory (for example,
  /// for <code>--send-file-paths /bucket/dir/file.txt</code>, parent directory is
  /// <code>/bucket/dir/</code>) to temporarily store a processed AS2 message
  /// file, store the MDN when we receive them from the partner, and write a final
  /// JSON file containing relevant metadata of the transmission. So, the
  /// <code>AccessRole</code> needs to provide read and write access to the parent
  /// directory of the file location used in the <code>StartFileTransfer</code>
  /// request. Additionally, you need to provide read and write access to the
  /// parent directory of the files that you intend to send with
  /// <code>StartFileTransfer</code>.
  ///
  /// If you are using Basic authentication for your AS2 connector, the access
  /// role requires the <code>secretsmanager:GetSecretValue</code> permission for
  /// the secret. If the secret is encrypted using a customer-managed key instead
  /// of the Amazon Web Services managed key in Secrets Manager, then the role
  /// also needs the <code>kms:Decrypt</code> permission for that key.
  ///
  /// <b>For SFTP connectors</b>
  ///
  /// Make sure that the access role provides read and write access to the parent
  /// directory of the file location that's used in the
  /// <code>StartFileTransfer</code> request. Additionally, make sure that the
  /// role provides <code>secretsmanager:GetSecretValue</code> permission to
  /// Secrets Manager.
  final String? accessRole;

  /// A structure that contains the parameters for an AS2 connector object.
  final As2ConnectorConfig? as2Config;

  /// The unique identifier for the connector.
  final String? connectorId;

  /// Current egress configuration of the connector, showing how traffic is routed
  /// to the SFTP server. Contains VPC Lattice settings when using VPC_LATTICE
  /// egress type.
  ///
  /// When using the VPC_LATTICE egress type, Transfer Family uses a managed
  /// Service Network to simplify the resource sharing process.
  final DescribedConnectorEgressConfig? egressConfig;

  /// Error message providing details when the connector is in ERRORED status.
  /// Contains information to help troubleshoot connector creation or operation
  /// failures.
  final String? errorMessage;

  /// IP address type for the connector's network connections. When set to
  /// <code>IPV4</code>, the connector uses IPv4 addresses only. When set to
  /// <code>DUALSTACK</code>, the connector supports both IPv4 and IPv6 addresses,
  /// with IPv6 preferred when available.
  final ConnectorsIpAddressType? ipAddressType;

  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that allows a connector to turn on CloudWatch logging for Amazon S3
  /// events. When set, you can view connector activity in your CloudWatch logs.
  final String? loggingRole;

  /// The text name of the security policy for the specified connector.
  final String? securityPolicyName;

  /// The list of egress IP addresses of this connector. These IP addresses are
  /// assigned automatically when you create the connector.
  final List<String>? serviceManagedEgressIpAddresses;

  /// A structure that contains the parameters for an SFTP connector object.
  final SftpConnectorConfig? sftpConfig;

  /// Key-value pairs that can be used to group and search for connectors.
  final List<Tag>? tags;

  /// The URL of the partner's AS2 or SFTP endpoint.
  ///
  /// When creating AS2 connectors or service-managed SFTP connectors (connectors
  /// without egress configuration), you must provide a URL to specify the remote
  /// server endpoint. For VPC Lattice type connectors, the URL must be null.
  final String? url;

  DescribedConnector({
    required this.arn,
    required this.egressType,
    required this.status,
    this.accessRole,
    this.as2Config,
    this.connectorId,
    this.egressConfig,
    this.errorMessage,
    this.ipAddressType,
    this.loggingRole,
    this.securityPolicyName,
    this.serviceManagedEgressIpAddresses,
    this.sftpConfig,
    this.tags,
    this.url,
  });

  factory DescribedConnector.fromJson(Map<String, dynamic> json) {
    return DescribedConnector(
      arn: (json['Arn'] as String?) ?? '',
      egressType:
          ConnectorEgressType.fromString((json['EgressType'] as String?) ?? ''),
      status: ConnectorStatus.fromString((json['Status'] as String?) ?? ''),
      accessRole: json['AccessRole'] as String?,
      as2Config: json['As2Config'] != null
          ? As2ConnectorConfig.fromJson(
              json['As2Config'] as Map<String, dynamic>)
          : null,
      connectorId: json['ConnectorId'] as String?,
      egressConfig: json['EgressConfig'] != null
          ? DescribedConnectorEgressConfig.fromJson(
              json['EgressConfig'] as Map<String, dynamic>)
          : null,
      errorMessage: json['ErrorMessage'] as String?,
      ipAddressType: (json['IpAddressType'] as String?)
          ?.let(ConnectorsIpAddressType.fromString),
      loggingRole: json['LoggingRole'] as String?,
      securityPolicyName: json['SecurityPolicyName'] as String?,
      serviceManagedEgressIpAddresses:
          (json['ServiceManagedEgressIpAddresses'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      sftpConfig: json['SftpConfig'] != null
          ? SftpConnectorConfig.fromJson(
              json['SftpConfig'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final egressType = this.egressType;
    final status = this.status;
    final accessRole = this.accessRole;
    final as2Config = this.as2Config;
    final connectorId = this.connectorId;
    final egressConfig = this.egressConfig;
    final errorMessage = this.errorMessage;
    final ipAddressType = this.ipAddressType;
    final loggingRole = this.loggingRole;
    final securityPolicyName = this.securityPolicyName;
    final serviceManagedEgressIpAddresses =
        this.serviceManagedEgressIpAddresses;
    final sftpConfig = this.sftpConfig;
    final tags = this.tags;
    final url = this.url;
    return {
      'Arn': arn,
      'EgressType': egressType.value,
      'Status': status.value,
      if (accessRole != null) 'AccessRole': accessRole,
      if (as2Config != null) 'As2Config': as2Config,
      if (connectorId != null) 'ConnectorId': connectorId,
      if (egressConfig != null) 'EgressConfig': egressConfig,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (ipAddressType != null) 'IpAddressType': ipAddressType.value,
      if (loggingRole != null) 'LoggingRole': loggingRole,
      if (securityPolicyName != null) 'SecurityPolicyName': securityPolicyName,
      if (serviceManagedEgressIpAddresses != null)
        'ServiceManagedEgressIpAddresses': serviceManagedEgressIpAddresses,
      if (sftpConfig != null) 'SftpConfig': sftpConfig,
      if (tags != null) 'Tags': tags,
      if (url != null) 'Url': url,
    };
  }
}

/// Response structure containing the current egress configuration details for
/// the connector. Shows how traffic is currently routed from the connector to
/// the SFTP server.
///
/// @nodoc
class DescribedConnectorEgressConfig {
  /// VPC_LATTICE configuration details in the response, showing the current
  /// Resource Configuration ARN and port settings for VPC-based connectivity.
  final DescribedConnectorVpcLatticeEgressConfig? vpcLattice;

  DescribedConnectorEgressConfig({
    this.vpcLattice,
  });

  factory DescribedConnectorEgressConfig.fromJson(Map<String, dynamic> json) {
    return DescribedConnectorEgressConfig(
      vpcLattice: json['VpcLattice'] != null
          ? DescribedConnectorVpcLatticeEgressConfig.fromJson(
              json['VpcLattice'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcLattice = this.vpcLattice;
    return {
      if (vpcLattice != null) 'VpcLattice': vpcLattice,
    };
  }
}

/// @nodoc
class ConnectorEgressType {
  static const serviceManaged = ConnectorEgressType._('SERVICE_MANAGED');
  static const vpcLattice = ConnectorEgressType._('VPC_LATTICE');

  final String value;

  const ConnectorEgressType._(this.value);

  static const values = [serviceManaged, vpcLattice];

  static ConnectorEgressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectorEgressType._(value));

  @override
  bool operator ==(other) =>
      other is ConnectorEgressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConnectorStatus {
  static const active = ConnectorStatus._('ACTIVE');
  static const errored = ConnectorStatus._('ERRORED');
  static const pending = ConnectorStatus._('PENDING');

  final String value;

  const ConnectorStatus._(this.value);

  static const values = [active, errored, pending];

  static ConnectorStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectorStatus._(value));

  @override
  bool operator ==(other) => other is ConnectorStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// VPC_LATTICE egress configuration details in the response, containing the
/// Resource Configuration ARN and port number currently configured for the
/// connector.
///
/// @nodoc
class DescribedConnectorVpcLatticeEgressConfig {
  /// ARN of the VPC_LATTICE Resource Configuration currently used by the
  /// connector. This Resource Configuration defines the network path to the SFTP
  /// server through the customer's VPC.
  final String resourceConfigurationArn;

  /// Port number currently configured for SFTP connections through VPC_LATTICE.
  /// Shows the port on which the connector attempts to connect to the target SFTP
  /// server.
  final int? portNumber;

  DescribedConnectorVpcLatticeEgressConfig({
    required this.resourceConfigurationArn,
    this.portNumber,
  });

  factory DescribedConnectorVpcLatticeEgressConfig.fromJson(
      Map<String, dynamic> json) {
    return DescribedConnectorVpcLatticeEgressConfig(
      resourceConfigurationArn:
          (json['ResourceConfigurationArn'] as String?) ?? '',
      portNumber: json['PortNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceConfigurationArn = this.resourceConfigurationArn;
    final portNumber = this.portNumber;
    return {
      'ResourceConfigurationArn': resourceConfigurationArn,
      if (portNumber != null) 'PortNumber': portNumber,
    };
  }
}

/// Configuration structure that defines how traffic is routed from the
/// connector to the SFTP server. Contains VPC Lattice settings when using
/// VPC_LATTICE egress type for private connectivity through customer VPCs.
///
/// @nodoc
class ConnectorEgressConfig {
  /// VPC_LATTICE configuration for routing connector traffic through customer
  /// VPCs. Enables private connectivity to SFTP servers without requiring public
  /// internet access or complex network configurations.
  final ConnectorVpcLatticeEgressConfig? vpcLattice;

  ConnectorEgressConfig({
    this.vpcLattice,
  });

  Map<String, dynamic> toJson() {
    final vpcLattice = this.vpcLattice;
    return {
      if (vpcLattice != null) 'VpcLattice': vpcLattice,
    };
  }
}

/// VPC_LATTICE egress configuration that specifies the Resource Configuration
/// ARN and port for connecting to SFTP servers through customer VPCs. Requires
/// a valid Resource Configuration with appropriate network access.
///
/// @nodoc
class ConnectorVpcLatticeEgressConfig {
  /// ARN of the VPC_LATTICE Resource Configuration that defines the target SFTP
  /// server location. Must point to a valid Resource Configuration in the
  /// customer's VPC with appropriate network connectivity to the SFTP server.
  final String resourceConfigurationArn;

  /// Port number for connecting to the SFTP server through VPC_LATTICE. Defaults
  /// to 22 if not specified. Must match the port on which the target SFTP server
  /// is listening.
  final int? portNumber;

  ConnectorVpcLatticeEgressConfig({
    required this.resourceConfigurationArn,
    this.portNumber,
  });

  Map<String, dynamic> toJson() {
    final resourceConfigurationArn = this.resourceConfigurationArn;
    final portNumber = this.portNumber;
    return {
      'ResourceConfigurationArn': resourceConfigurationArn,
      if (portNumber != null) 'PortNumber': portNumber,
    };
  }
}

/// Describes the properties of a certificate.
///
/// @nodoc
class ListedCertificate {
  /// An optional date that specifies when the certificate becomes active. If you
  /// do not specify a value, <code>ActiveDate</code> takes the same value as
  /// <code>NotBeforeDate</code>, which is specified by the CA.
  final DateTime? activeDate;

  /// The Amazon Resource Name (ARN) of the specified certificate.
  final String? arn;

  /// An array of identifiers for the imported certificates. You use this
  /// identifier for working with profiles and partner profiles.
  final String? certificateId;

  /// The name or short description that's used to identify the certificate.
  final String? description;

  /// An optional date that specifies when the certificate becomes inactive. If
  /// you do not specify a value, <code>InactiveDate</code> takes the same value
  /// as <code>NotAfterDate</code>, which is specified by the CA.
  final DateTime? inactiveDate;

  /// The certificate can be either <code>ACTIVE</code>,
  /// <code>PENDING_ROTATION</code>, or <code>INACTIVE</code>.
  /// <code>PENDING_ROTATION</code> means that this certificate will replace the
  /// current certificate when it expires.
  final CertificateStatusType? status;

  /// The type for the certificate. If a private key has been specified for the
  /// certificate, its type is <code>CERTIFICATE_WITH_PRIVATE_KEY</code>. If there
  /// is no private key, the type is <code>CERTIFICATE</code>.
  final CertificateType? type;

  /// Specifies how this certificate is used. It can be used in the following
  /// ways:
  ///
  /// <ul>
  /// <li>
  /// <code>SIGNING</code>: For signing AS2 messages
  /// </li>
  /// <li>
  /// <code>ENCRYPTION</code>: For encrypting AS2 messages
  /// </li>
  /// <li>
  /// <code>TLS</code>: For securing AS2 communications sent over HTTPS
  /// </li>
  /// </ul>
  final CertificateUsageType? usage;

  ListedCertificate({
    this.activeDate,
    this.arn,
    this.certificateId,
    this.description,
    this.inactiveDate,
    this.status,
    this.type,
    this.usage,
  });

  factory ListedCertificate.fromJson(Map<String, dynamic> json) {
    return ListedCertificate(
      activeDate: timeStampFromJson(json['ActiveDate']),
      arn: json['Arn'] as String?,
      certificateId: json['CertificateId'] as String?,
      description: json['Description'] as String?,
      inactiveDate: timeStampFromJson(json['InactiveDate']),
      status:
          (json['Status'] as String?)?.let(CertificateStatusType.fromString),
      type: (json['Type'] as String?)?.let(CertificateType.fromString),
      usage: (json['Usage'] as String?)?.let(CertificateUsageType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final activeDate = this.activeDate;
    final arn = this.arn;
    final certificateId = this.certificateId;
    final description = this.description;
    final inactiveDate = this.inactiveDate;
    final status = this.status;
    final type = this.type;
    final usage = this.usage;
    return {
      if (activeDate != null) 'ActiveDate': unixTimestampToJson(activeDate),
      if (arn != null) 'Arn': arn,
      if (certificateId != null) 'CertificateId': certificateId,
      if (description != null) 'Description': description,
      if (inactiveDate != null)
        'InactiveDate': unixTimestampToJson(inactiveDate),
      if (status != null) 'Status': status.value,
      if (type != null) 'Type': type.value,
      if (usage != null) 'Usage': usage.value,
    };
  }
}

/// @nodoc
class CertificateUsageType {
  static const signing = CertificateUsageType._('SIGNING');
  static const encryption = CertificateUsageType._('ENCRYPTION');
  static const tls = CertificateUsageType._('TLS');

  final String value;

  const CertificateUsageType._(this.value);

  static const values = [signing, encryption, tls];

  static CertificateUsageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateUsageType._(value));

  @override
  bool operator ==(other) =>
      other is CertificateUsageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CertificateStatusType {
  static const active = CertificateStatusType._('ACTIVE');
  static const pendingRotation = CertificateStatusType._('PENDING_ROTATION');
  static const inactive = CertificateStatusType._('INACTIVE');

  final String value;

  const CertificateStatusType._(this.value);

  static const values = [active, pendingRotation, inactive];

  static CertificateStatusType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateStatusType._(value));

  @override
  bool operator ==(other) =>
      other is CertificateStatusType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CertificateType {
  static const certificate = CertificateType._('CERTIFICATE');
  static const certificateWithPrivateKey =
      CertificateType._('CERTIFICATE_WITH_PRIVATE_KEY');

  final String value;

  const CertificateType._(this.value);

  static const values = [certificate, certificateWithPrivateKey];

  static CertificateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateType._(value));

  @override
  bool operator ==(other) => other is CertificateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the properties of a certificate.
///
/// @nodoc
class DescribedCertificate {
  /// The unique Amazon Resource Name (ARN) for the certificate.
  final String arn;

  /// An optional date that specifies when the certificate becomes active. If you
  /// do not specify a value, <code>ActiveDate</code> takes the same value as
  /// <code>NotBeforeDate</code>, which is specified by the CA.
  final DateTime? activeDate;

  /// The file name for the certificate.
  final String? certificate;

  /// The list of certificates that make up the chain for the certificate.
  final String? certificateChain;

  /// An array of identifiers for the imported certificates. You use this
  /// identifier for working with profiles and partner profiles.
  final String? certificateId;

  /// The name or description that's used to identity the certificate.
  final String? description;

  /// An optional date that specifies when the certificate becomes inactive. If
  /// you do not specify a value, <code>InactiveDate</code> takes the same value
  /// as <code>NotAfterDate</code>, which is specified by the CA.
  final DateTime? inactiveDate;

  /// The final date that the certificate is valid.
  final DateTime? notAfterDate;

  /// The earliest date that the certificate is valid.
  final DateTime? notBeforeDate;

  /// The serial number for the certificate.
  final String? serial;

  /// A certificate's status can be either <code>ACTIVE</code> or
  /// <code>INACTIVE</code>.
  ///
  /// You can set <code>ActiveDate</code> and <code>InactiveDate</code> in the
  /// <code>UpdateCertificate</code> call. If you set values for these parameters,
  /// those values are used to determine whether the certificate has a status of
  /// <code>ACTIVE</code> or <code>INACTIVE</code>.
  ///
  /// If you don't set values for <code>ActiveDate</code> and
  /// <code>InactiveDate</code>, we use the <code>NotBefore</code> and
  /// <code>NotAfter</code> date as specified on the X509 certificate to determine
  /// when a certificate is active and when it is inactive.
  final CertificateStatusType? status;

  /// Key-value pairs that can be used to group and search for certificates.
  final List<Tag>? tags;

  /// If a private key has been specified for the certificate, its type is
  /// <code>CERTIFICATE_WITH_PRIVATE_KEY</code>. If there is no private key, the
  /// type is <code>CERTIFICATE</code>.
  final CertificateType? type;

  /// Specifies how this certificate is used. It can be used in the following
  /// ways:
  ///
  /// <ul>
  /// <li>
  /// <code>SIGNING</code>: For signing AS2 messages
  /// </li>
  /// <li>
  /// <code>ENCRYPTION</code>: For encrypting AS2 messages
  /// </li>
  /// <li>
  /// <code>TLS</code>: For securing AS2 communications sent over HTTPS
  /// </li>
  /// </ul>
  final CertificateUsageType? usage;

  DescribedCertificate({
    required this.arn,
    this.activeDate,
    this.certificate,
    this.certificateChain,
    this.certificateId,
    this.description,
    this.inactiveDate,
    this.notAfterDate,
    this.notBeforeDate,
    this.serial,
    this.status,
    this.tags,
    this.type,
    this.usage,
  });

  factory DescribedCertificate.fromJson(Map<String, dynamic> json) {
    return DescribedCertificate(
      arn: (json['Arn'] as String?) ?? '',
      activeDate: timeStampFromJson(json['ActiveDate']),
      certificate: json['Certificate'] as String?,
      certificateChain: json['CertificateChain'] as String?,
      certificateId: json['CertificateId'] as String?,
      description: json['Description'] as String?,
      inactiveDate: timeStampFromJson(json['InactiveDate']),
      notAfterDate: timeStampFromJson(json['NotAfterDate']),
      notBeforeDate: timeStampFromJson(json['NotBeforeDate']),
      serial: json['Serial'] as String?,
      status:
          (json['Status'] as String?)?.let(CertificateStatusType.fromString),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.let(CertificateType.fromString),
      usage: (json['Usage'] as String?)?.let(CertificateUsageType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final activeDate = this.activeDate;
    final certificate = this.certificate;
    final certificateChain = this.certificateChain;
    final certificateId = this.certificateId;
    final description = this.description;
    final inactiveDate = this.inactiveDate;
    final notAfterDate = this.notAfterDate;
    final notBeforeDate = this.notBeforeDate;
    final serial = this.serial;
    final status = this.status;
    final tags = this.tags;
    final type = this.type;
    final usage = this.usage;
    return {
      'Arn': arn,
      if (activeDate != null) 'ActiveDate': unixTimestampToJson(activeDate),
      if (certificate != null) 'Certificate': certificate,
      if (certificateChain != null) 'CertificateChain': certificateChain,
      if (certificateId != null) 'CertificateId': certificateId,
      if (description != null) 'Description': description,
      if (inactiveDate != null)
        'InactiveDate': unixTimestampToJson(inactiveDate),
      if (notAfterDate != null)
        'NotAfterDate': unixTimestampToJson(notAfterDate),
      if (notBeforeDate != null)
        'NotBeforeDate': unixTimestampToJson(notBeforeDate),
      if (serial != null) 'Serial': serial,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.value,
      if (usage != null) 'Usage': usage.value,
    };
  }
}

/// Describes the properties of an agreement.
///
/// @nodoc
class ListedAgreement {
  /// A unique identifier for the agreement. This identifier is returned when you
  /// create an agreement.
  final String? agreementId;

  /// The Amazon Resource Name (ARN) of the specified agreement.
  final String? arn;

  /// The current description for the agreement. You can change it by calling the
  /// <code>UpdateAgreement</code> operation and providing a new description.
  final String? description;

  /// A unique identifier for the AS2 local profile.
  final String? localProfileId;

  /// A unique identifier for the partner profile.
  final String? partnerProfileId;

  /// The unique identifier for the agreement.
  final String? serverId;

  /// The agreement can be either <code>ACTIVE</code> or <code>INACTIVE</code>.
  final AgreementStatusType? status;

  ListedAgreement({
    this.agreementId,
    this.arn,
    this.description,
    this.localProfileId,
    this.partnerProfileId,
    this.serverId,
    this.status,
  });

  factory ListedAgreement.fromJson(Map<String, dynamic> json) {
    return ListedAgreement(
      agreementId: json['AgreementId'] as String?,
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      localProfileId: json['LocalProfileId'] as String?,
      partnerProfileId: json['PartnerProfileId'] as String?,
      serverId: json['ServerId'] as String?,
      status: (json['Status'] as String?)?.let(AgreementStatusType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final arn = this.arn;
    final description = this.description;
    final localProfileId = this.localProfileId;
    final partnerProfileId = this.partnerProfileId;
    final serverId = this.serverId;
    final status = this.status;
    return {
      if (agreementId != null) 'AgreementId': agreementId,
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (localProfileId != null) 'LocalProfileId': localProfileId,
      if (partnerProfileId != null) 'PartnerProfileId': partnerProfileId,
      if (serverId != null) 'ServerId': serverId,
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class AgreementStatusType {
  static const active = AgreementStatusType._('ACTIVE');
  static const inactive = AgreementStatusType._('INACTIVE');

  final String value;

  const AgreementStatusType._(this.value);

  static const values = [active, inactive];

  static AgreementStatusType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgreementStatusType._(value));

  @override
  bool operator ==(other) =>
      other is AgreementStatusType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PreserveFilenameType {
  static const enabled = PreserveFilenameType._('ENABLED');
  static const disabled = PreserveFilenameType._('DISABLED');

  final String value;

  const PreserveFilenameType._(this.value);

  static const values = [enabled, disabled];

  static PreserveFilenameType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PreserveFilenameType._(value));

  @override
  bool operator ==(other) =>
      other is PreserveFilenameType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EnforceMessageSigningType {
  static const enabled = EnforceMessageSigningType._('ENABLED');
  static const disabled = EnforceMessageSigningType._('DISABLED');

  final String value;

  const EnforceMessageSigningType._(this.value);

  static const values = [enabled, disabled];

  static EnforceMessageSigningType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EnforceMessageSigningType._(value));

  @override
  bool operator ==(other) =>
      other is EnforceMessageSigningType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains Amazon S3 locations for storing specific types of AS2 message
/// files.
///
/// @nodoc
class CustomDirectoriesType {
  /// Specifies a location to store failed AS2 message files.
  final String failedFilesDirectory;

  /// Specifies a location to store MDN files.
  final String mdnFilesDirectory;

  /// Specifies a location to store the payload for AS2 message files.
  final String payloadFilesDirectory;

  /// Specifies a location to store AS2 status messages.
  final String statusFilesDirectory;

  /// Specifies a location to store temporary AS2 message files.
  final String temporaryFilesDirectory;

  CustomDirectoriesType({
    required this.failedFilesDirectory,
    required this.mdnFilesDirectory,
    required this.payloadFilesDirectory,
    required this.statusFilesDirectory,
    required this.temporaryFilesDirectory,
  });

  factory CustomDirectoriesType.fromJson(Map<String, dynamic> json) {
    return CustomDirectoriesType(
      failedFilesDirectory: (json['FailedFilesDirectory'] as String?) ?? '',
      mdnFilesDirectory: (json['MdnFilesDirectory'] as String?) ?? '',
      payloadFilesDirectory: (json['PayloadFilesDirectory'] as String?) ?? '',
      statusFilesDirectory: (json['StatusFilesDirectory'] as String?) ?? '',
      temporaryFilesDirectory:
          (json['TemporaryFilesDirectory'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final failedFilesDirectory = this.failedFilesDirectory;
    final mdnFilesDirectory = this.mdnFilesDirectory;
    final payloadFilesDirectory = this.payloadFilesDirectory;
    final statusFilesDirectory = this.statusFilesDirectory;
    final temporaryFilesDirectory = this.temporaryFilesDirectory;
    return {
      'FailedFilesDirectory': failedFilesDirectory,
      'MdnFilesDirectory': mdnFilesDirectory,
      'PayloadFilesDirectory': payloadFilesDirectory,
      'StatusFilesDirectory': statusFilesDirectory,
      'TemporaryFilesDirectory': temporaryFilesDirectory,
    };
  }
}

/// Describes the properties of an agreement.
///
/// @nodoc
class DescribedAgreement {
  /// The unique Amazon Resource Name (ARN) for the agreement.
  final String arn;

  /// Connectors are used to send files using either the AS2 or SFTP protocol. For
  /// the access role, provide the Amazon Resource Name (ARN) of the Identity and
  /// Access Management role to use.
  ///
  /// <b>For AS2 connectors</b>
  ///
  /// With AS2, you can send files by calling <code>StartFileTransfer</code> and
  /// specifying the file paths in the request parameter,
  /// <code>SendFilePaths</code>. We use the file’s parent directory (for example,
  /// for <code>--send-file-paths /bucket/dir/file.txt</code>, parent directory is
  /// <code>/bucket/dir/</code>) to temporarily store a processed AS2 message
  /// file, store the MDN when we receive them from the partner, and write a final
  /// JSON file containing relevant metadata of the transmission. So, the
  /// <code>AccessRole</code> needs to provide read and write access to the parent
  /// directory of the file location used in the <code>StartFileTransfer</code>
  /// request. Additionally, you need to provide read and write access to the
  /// parent directory of the files that you intend to send with
  /// <code>StartFileTransfer</code>.
  ///
  /// If you are using Basic authentication for your AS2 connector, the access
  /// role requires the <code>secretsmanager:GetSecretValue</code> permission for
  /// the secret. If the secret is encrypted using a customer-managed key instead
  /// of the Amazon Web Services managed key in Secrets Manager, then the role
  /// also needs the <code>kms:Decrypt</code> permission for that key.
  ///
  /// <b>For SFTP connectors</b>
  ///
  /// Make sure that the access role provides read and write access to the parent
  /// directory of the file location that's used in the
  /// <code>StartFileTransfer</code> request. Additionally, make sure that the
  /// role provides <code>secretsmanager:GetSecretValue</code> permission to
  /// Secrets Manager.
  final String? accessRole;

  /// A unique identifier for the agreement. This identifier is returned when you
  /// create an agreement.
  final String? agreementId;

  /// The landing directory (folder) for files that are transferred by using the
  /// AS2 protocol.
  final String? baseDirectory;

  /// A <code>CustomDirectoriesType</code> structure. This structure specifies
  /// custom directories for storing various AS2 message files. You can specify
  /// directories for the following types of files.
  ///
  /// <ul>
  /// <li>
  /// Failed files
  /// </li>
  /// <li>
  /// MDN files
  /// </li>
  /// <li>
  /// Payload files
  /// </li>
  /// <li>
  /// Status files
  /// </li>
  /// <li>
  /// Temporary files
  /// </li>
  /// </ul>
  final CustomDirectoriesType? customDirectories;

  /// The name or short description that's used to identify the agreement.
  final String? description;

  /// Determines whether or not unsigned messages from your trading partners will
  /// be accepted.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>: Transfer Family rejects unsigned messages from your
  /// trading partner.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> (default value): Transfer Family accepts unsigned
  /// messages from your trading partner.
  /// </li>
  /// </ul>
  final EnforceMessageSigningType? enforceMessageSigning;

  /// A unique identifier for the AS2 local profile.
  final String? localProfileId;

  /// A unique identifier for the partner profile used in the agreement.
  final String? partnerProfileId;

  /// Determines whether or not Transfer Family appends a unique string of
  /// characters to the end of the AS2 message payload filename when saving it.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>: the filename provided by your trading parter is
  /// preserved when the file is saved.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> (default value): when Transfer Family saves the file,
  /// the filename is adjusted, as described in <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/send-as2-messages.html#file-names-as2">File
  /// names and locations</a>.
  /// </li>
  /// </ul>
  final PreserveFilenameType? preserveFilename;

  /// A system-assigned unique identifier for a server instance. This identifier
  /// indicates the specific server that the agreement uses.
  final String? serverId;

  /// The current status of the agreement, either <code>ACTIVE</code> or
  /// <code>INACTIVE</code>.
  final AgreementStatusType? status;

  /// Key-value pairs that can be used to group and search for agreements.
  final List<Tag>? tags;

  DescribedAgreement({
    required this.arn,
    this.accessRole,
    this.agreementId,
    this.baseDirectory,
    this.customDirectories,
    this.description,
    this.enforceMessageSigning,
    this.localProfileId,
    this.partnerProfileId,
    this.preserveFilename,
    this.serverId,
    this.status,
    this.tags,
  });

  factory DescribedAgreement.fromJson(Map<String, dynamic> json) {
    return DescribedAgreement(
      arn: (json['Arn'] as String?) ?? '',
      accessRole: json['AccessRole'] as String?,
      agreementId: json['AgreementId'] as String?,
      baseDirectory: json['BaseDirectory'] as String?,
      customDirectories: json['CustomDirectories'] != null
          ? CustomDirectoriesType.fromJson(
              json['CustomDirectories'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      enforceMessageSigning: (json['EnforceMessageSigning'] as String?)
          ?.let(EnforceMessageSigningType.fromString),
      localProfileId: json['LocalProfileId'] as String?,
      partnerProfileId: json['PartnerProfileId'] as String?,
      preserveFilename: (json['PreserveFilename'] as String?)
          ?.let(PreserveFilenameType.fromString),
      serverId: json['ServerId'] as String?,
      status: (json['Status'] as String?)?.let(AgreementStatusType.fromString),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final accessRole = this.accessRole;
    final agreementId = this.agreementId;
    final baseDirectory = this.baseDirectory;
    final customDirectories = this.customDirectories;
    final description = this.description;
    final enforceMessageSigning = this.enforceMessageSigning;
    final localProfileId = this.localProfileId;
    final partnerProfileId = this.partnerProfileId;
    final preserveFilename = this.preserveFilename;
    final serverId = this.serverId;
    final status = this.status;
    final tags = this.tags;
    return {
      'Arn': arn,
      if (accessRole != null) 'AccessRole': accessRole,
      if (agreementId != null) 'AgreementId': agreementId,
      if (baseDirectory != null) 'BaseDirectory': baseDirectory,
      if (customDirectories != null) 'CustomDirectories': customDirectories,
      if (description != null) 'Description': description,
      if (enforceMessageSigning != null)
        'EnforceMessageSigning': enforceMessageSigning.value,
      if (localProfileId != null) 'LocalProfileId': localProfileId,
      if (partnerProfileId != null) 'PartnerProfileId': partnerProfileId,
      if (preserveFilename != null) 'PreserveFilename': preserveFilename.value,
      if (serverId != null) 'ServerId': serverId,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains the details for an SFTP connector connection.
///
/// @nodoc
class SftpConnectorConnectionDetails {
  /// The SSH public key of the remote SFTP server. This is returned during the
  /// initial connection attempt when you call <code>TestConnection</code>. It
  /// allows you to retrieve the valid server host key to update the connector
  /// when you are unable to obtain it in advance.
  final String? hostKey;

  SftpConnectorConnectionDetails({
    this.hostKey,
  });

  factory SftpConnectorConnectionDetails.fromJson(Map<String, dynamic> json) {
    return SftpConnectorConnectionDetails(
      hostKey: json['HostKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostKey = this.hostKey;
    return {
      if (hostKey != null) 'HostKey': hostKey,
    };
  }
}

/// Represents a custom HTTP header that can be included in AS2 messages. Each
/// header consists of a key-value pair.
///
/// @nodoc
class CustomHttpHeader {
  /// The name of the custom HTTP header.
  final String? key;

  /// The value of the custom HTTP header.
  final String? value;

  CustomHttpHeader({
    this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// @nodoc
class CustomStepStatus {
  static const success = CustomStepStatus._('SUCCESS');
  static const failure = CustomStepStatus._('FAILURE');

  final String value;

  const CustomStepStatus._(this.value);

  static const values = [success, failure];

  static CustomStepStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomStepStatus._(value));

  @override
  bool operator ==(other) => other is CustomStepStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Returns properties of the host key that's specified.
///
/// @nodoc
class ListedHostKey {
  /// The unique Amazon Resource Name (ARN) of the host key.
  final String arn;

  /// The date on which the host key was added to the server.
  final DateTime? dateImported;

  /// The current description for the host key. You can change it by calling the
  /// <code>UpdateHostKey</code> operation and providing a new description.
  final String? description;

  /// The public key fingerprint, which is a short sequence of bytes used to
  /// identify the longer public key.
  final String? fingerprint;

  /// A unique identifier for the host key.
  final String? hostKeyId;

  /// The encryption algorithm that is used for the host key. The
  /// <code>Type</code> parameter is specified by using one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>ssh-rsa</code>
  /// </li>
  /// <li>
  /// <code>ssh-ed25519</code>
  /// </li>
  /// <li>
  /// <code>ecdsa-sha2-nistp256</code>
  /// </li>
  /// <li>
  /// <code>ecdsa-sha2-nistp384</code>
  /// </li>
  /// <li>
  /// <code>ecdsa-sha2-nistp521</code>
  /// </li>
  /// </ul>
  final String? type;

  ListedHostKey({
    required this.arn,
    this.dateImported,
    this.description,
    this.fingerprint,
    this.hostKeyId,
    this.type,
  });

  factory ListedHostKey.fromJson(Map<String, dynamic> json) {
    return ListedHostKey(
      arn: (json['Arn'] as String?) ?? '',
      dateImported: timeStampFromJson(json['DateImported']),
      description: json['Description'] as String?,
      fingerprint: json['Fingerprint'] as String?,
      hostKeyId: json['HostKeyId'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateImported = this.dateImported;
    final description = this.description;
    final fingerprint = this.fingerprint;
    final hostKeyId = this.hostKeyId;
    final type = this.type;
    return {
      'Arn': arn,
      if (dateImported != null)
        'DateImported': unixTimestampToJson(dateImported),
      if (description != null) 'Description': description,
      if (fingerprint != null) 'Fingerprint': fingerprint,
      if (hostKeyId != null) 'HostKeyId': hostKeyId,
      if (type != null) 'Type': type,
    };
  }
}

/// A structure that contains the details for files transferred using an SFTP
/// connector, during a single transfer.
///
/// @nodoc
class ConnectorFileTransferResult {
  /// The filename and path to where the file was sent to or retrieved from.
  final String filePath;

  /// The current status for the transfer.
  final TransferTableStatus statusCode;

  /// For transfers that fail, this parameter contains a code indicating the
  /// reason. For example, <code>RETRIEVE_FILE_NOT_FOUND</code>
  final String? failureCode;

  /// For transfers that fail, this parameter describes the reason for the
  /// failure.
  final String? failureMessage;

  ConnectorFileTransferResult({
    required this.filePath,
    required this.statusCode,
    this.failureCode,
    this.failureMessage,
  });

  factory ConnectorFileTransferResult.fromJson(Map<String, dynamic> json) {
    return ConnectorFileTransferResult(
      filePath: (json['FilePath'] as String?) ?? '',
      statusCode:
          TransferTableStatus.fromString((json['StatusCode'] as String?) ?? ''),
      failureCode: json['FailureCode'] as String?,
      failureMessage: json['FailureMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filePath = this.filePath;
    final statusCode = this.statusCode;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    return {
      'FilePath': filePath,
      'StatusCode': statusCode.value,
      if (failureCode != null) 'FailureCode': failureCode,
      if (failureMessage != null) 'FailureMessage': failureMessage,
    };
  }
}

/// @nodoc
class TransferTableStatus {
  static const queued = TransferTableStatus._('QUEUED');
  static const inProgress = TransferTableStatus._('IN_PROGRESS');
  static const completed = TransferTableStatus._('COMPLETED');
  static const failed = TransferTableStatus._('FAILED');

  final String value;

  const TransferTableStatus._(this.value);

  static const values = [queued, inProgress, completed, failed];

  static TransferTableStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TransferTableStatus._(value));

  @override
  bool operator ==(other) =>
      other is TransferTableStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Returns properties of the execution that is specified.
///
/// @nodoc
class ListedExecution {
  /// A unique identifier for the execution of a workflow.
  final String? executionId;

  /// A structure that describes the Amazon S3 or EFS file location. This is the
  /// file location when the execution begins: if the file is being copied, this
  /// is the initial (as opposed to destination) file location.
  final FileLocation? initialFileLocation;

  /// A container object for the session details that are associated with a
  /// workflow.
  final ServiceMetadata? serviceMetadata;

  /// The status is one of the execution. Can be in progress, completed, exception
  /// encountered, or handling the exception.
  final ExecutionStatus? status;

  ListedExecution({
    this.executionId,
    this.initialFileLocation,
    this.serviceMetadata,
    this.status,
  });

  factory ListedExecution.fromJson(Map<String, dynamic> json) {
    return ListedExecution(
      executionId: json['ExecutionId'] as String?,
      initialFileLocation: json['InitialFileLocation'] != null
          ? FileLocation.fromJson(
              json['InitialFileLocation'] as Map<String, dynamic>)
          : null,
      serviceMetadata: json['ServiceMetadata'] != null
          ? ServiceMetadata.fromJson(
              json['ServiceMetadata'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(ExecutionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final initialFileLocation = this.initialFileLocation;
    final serviceMetadata = this.serviceMetadata;
    final status = this.status;
    return {
      if (executionId != null) 'ExecutionId': executionId,
      if (initialFileLocation != null)
        'InitialFileLocation': initialFileLocation,
      if (serviceMetadata != null) 'ServiceMetadata': serviceMetadata,
      if (status != null) 'Status': status.value,
    };
  }
}

/// Specifies the Amazon S3 or EFS file details to be used in the step.
///
/// @nodoc
class FileLocation {
  /// Specifies the Amazon EFS identifier and the path for the file being used.
  final EfsFileLocation? efsFileLocation;

  /// Specifies the S3 details for the file being used, such as bucket, ETag, and
  /// so forth.
  final S3FileLocation? s3FileLocation;

  FileLocation({
    this.efsFileLocation,
    this.s3FileLocation,
  });

  factory FileLocation.fromJson(Map<String, dynamic> json) {
    return FileLocation(
      efsFileLocation: json['EfsFileLocation'] != null
          ? EfsFileLocation.fromJson(
              json['EfsFileLocation'] as Map<String, dynamic>)
          : null,
      s3FileLocation: json['S3FileLocation'] != null
          ? S3FileLocation.fromJson(
              json['S3FileLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final efsFileLocation = this.efsFileLocation;
    final s3FileLocation = this.s3FileLocation;
    return {
      if (efsFileLocation != null) 'EfsFileLocation': efsFileLocation,
      if (s3FileLocation != null) 'S3FileLocation': s3FileLocation,
    };
  }
}

/// A container object for the session details that are associated with a
/// workflow.
///
/// @nodoc
class ServiceMetadata {
  /// The Server ID (<code>ServerId</code>), Session ID (<code>SessionId</code>)
  /// and user (<code>UserName</code>) make up the <code>UserDetails</code>.
  final UserDetails userDetails;

  ServiceMetadata({
    required this.userDetails,
  });

  factory ServiceMetadata.fromJson(Map<String, dynamic> json) {
    return ServiceMetadata(
      userDetails: UserDetails.fromJson(
          (json['UserDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final userDetails = this.userDetails;
    return {
      'UserDetails': userDetails,
    };
  }
}

/// @nodoc
class ExecutionStatus {
  static const inProgress = ExecutionStatus._('IN_PROGRESS');
  static const completed = ExecutionStatus._('COMPLETED');
  static const exception = ExecutionStatus._('EXCEPTION');
  static const handlingException = ExecutionStatus._('HANDLING_EXCEPTION');

  final String value;

  const ExecutionStatus._(this.value);

  static const values = [inProgress, completed, exception, handlingException];

  static ExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionStatus._(value));

  @override
  bool operator ==(other) => other is ExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the user name, server ID, and session ID for a workflow.
///
/// @nodoc
class UserDetails {
  /// The system-assigned unique identifier for a Transfer server instance.
  final String serverId;

  /// A unique string that identifies a Transfer Family user associated with a
  /// server.
  final String userName;

  /// The system-assigned unique identifier for a session that corresponds to the
  /// workflow.
  final String? sessionId;

  UserDetails({
    required this.serverId,
    required this.userName,
    this.sessionId,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      serverId: (json['ServerId'] as String?) ?? '',
      userName: (json['UserName'] as String?) ?? '',
      sessionId: json['SessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    final userName = this.userName;
    final sessionId = this.sessionId;
    return {
      'ServerId': serverId,
      'UserName': userName,
      if (sessionId != null) 'SessionId': sessionId,
    };
  }
}

/// Specifies the details for the file location for the file that's being used
/// in the workflow. Only applicable if you are using S3 storage.
///
/// @nodoc
class S3FileLocation {
  /// Specifies the S3 bucket that contains the file being used.
  final String? bucket;

  /// The entity tag is a hash of the object. The ETag reflects changes only to
  /// the contents of an object, not its metadata.
  final String? etag;

  /// The name assigned to the file when it was created in Amazon S3. You use the
  /// object key to retrieve the object.
  final String? key;

  /// Specifies the file version.
  final String? versionId;

  S3FileLocation({
    this.bucket,
    this.etag,
    this.key,
    this.versionId,
  });

  factory S3FileLocation.fromJson(Map<String, dynamic> json) {
    return S3FileLocation(
      bucket: json['Bucket'] as String?,
      etag: json['Etag'] as String?,
      key: json['Key'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final etag = this.etag;
    final key = this.key;
    final versionId = this.versionId;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (etag != null) 'Etag': etag,
      if (key != null) 'Key': key,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// Lists the properties for one or more specified associated accesses.
///
/// @nodoc
class ListedAccess {
  /// A unique identifier that is required to identify specific groups within your
  /// directory. The users of the group that you associate have access to your
  /// Amazon S3 or Amazon EFS resources over the enabled protocols using Transfer
  /// Family. If you know the group name, you can view the SID values by running
  /// the following command using Windows PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regular expression used to validate this parameter is a string of
  /// characters consisting of uppercase and lowercase alphanumeric characters
  /// with no spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  final String? externalId;

  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  /// <note>
  /// You can use the <code>HomeDirectory</code> parameter for
  /// <code>HomeDirectoryType</code> when it is set to either <code>PATH</code> or
  /// <code>LOGICAL</code>.
  /// </note>
  final String? homeDirectory;

  /// The type of landing directory (folder) that you want your users' home
  /// directory to be when they log in to the server. If you set it to
  /// <code>PATH</code>, the user will see the absolute Amazon S3 bucket or Amazon
  /// EFS path as is in their file transfer protocol clients. If you set it to
  /// <code>LOGICAL</code>, you need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// Amazon EFS paths visible to your users.
  /// <note>
  /// If <code>HomeDirectoryType</code> is <code>LOGICAL</code>, you must provide
  /// mappings, using the <code>HomeDirectoryMappings</code> parameter. If, on the
  /// other hand, <code>HomeDirectoryType</code> is <code>PATH</code>, you provide
  /// an absolute path using the <code>HomeDirectory</code> parameter. You cannot
  /// have both <code>HomeDirectory</code> and <code>HomeDirectoryMappings</code>
  /// in your template.
  /// </note>
  final HomeDirectoryType? homeDirectoryType;

  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that controls your users' access to your Amazon S3 bucket or Amazon EFS
  /// file system. The policies attached to this role determine the level of
  /// access that you want to provide your users when transferring files into and
  /// out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should
  /// also contain a trust relationship that allows the server to access your
  /// resources when servicing your users' transfer requests.
  final String? role;

  ListedAccess({
    this.externalId,
    this.homeDirectory,
    this.homeDirectoryType,
    this.role,
  });

  factory ListedAccess.fromJson(Map<String, dynamic> json) {
    return ListedAccess(
      externalId: json['ExternalId'] as String?,
      homeDirectory: json['HomeDirectory'] as String?,
      homeDirectoryType: (json['HomeDirectoryType'] as String?)
          ?.let(HomeDirectoryType.fromString),
      role: json['Role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final externalId = this.externalId;
    final homeDirectory = this.homeDirectory;
    final homeDirectoryType = this.homeDirectoryType;
    final role = this.role;
    return {
      if (externalId != null) 'ExternalId': externalId,
      if (homeDirectory != null) 'HomeDirectory': homeDirectory,
      if (homeDirectoryType != null)
        'HomeDirectoryType': homeDirectoryType.value,
      if (role != null) 'Role': role,
    };
  }
}

/// Describes the properties of a security policy that you specify. For more
/// information about security policies, see <a
/// href="https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html">Working
/// with security policies for servers</a> or <a
/// href="https://docs.aws.amazon.com/transfer/latest/userguide/security-policies-connectors.html">Working
/// with security policies for SFTP connectors</a>.
///
/// @nodoc
class DescribedSecurityPolicy {
  /// The text name of the specified security policy.
  final String securityPolicyName;

  /// Specifies whether this policy enables Federal Information Processing
  /// Standards (FIPS). This parameter applies to both server and connector
  /// security policies.
  final bool? fips;

  /// Lists the file transfer protocols that the security policy applies to.
  final List<SecurityPolicyProtocol>? protocols;

  /// Lists the enabled Secure Shell (SSH) cipher encryption algorithms in the
  /// security policy that is attached to the server or connector. This parameter
  /// applies to both server and connector security policies.
  final List<String>? sshCiphers;

  /// Lists the host key algorithms for the security policy.
  /// <note>
  /// This parameter only applies to security policies for connectors.
  /// </note>
  final List<String>? sshHostKeyAlgorithms;

  /// Lists the enabled SSH key exchange (KEX) encryption algorithms in the
  /// security policy that is attached to the server or connector. This parameter
  /// applies to both server and connector security policies.
  final List<String>? sshKexs;

  /// Lists the enabled SSH message authentication code (MAC) encryption
  /// algorithms in the security policy that is attached to the server or
  /// connector. This parameter applies to both server and connector security
  /// policies.
  final List<String>? sshMacs;

  /// Lists the enabled Transport Layer Security (TLS) cipher encryption
  /// algorithms in the security policy that is attached to the server.
  /// <note>
  /// This parameter only applies to security policies for servers.
  /// </note>
  final List<String>? tlsCiphers;

  /// The resource type to which the security policy applies, either server or
  /// connector.
  final SecurityPolicyResourceType? type;

  DescribedSecurityPolicy({
    required this.securityPolicyName,
    this.fips,
    this.protocols,
    this.sshCiphers,
    this.sshHostKeyAlgorithms,
    this.sshKexs,
    this.sshMacs,
    this.tlsCiphers,
    this.type,
  });

  factory DescribedSecurityPolicy.fromJson(Map<String, dynamic> json) {
    return DescribedSecurityPolicy(
      securityPolicyName: (json['SecurityPolicyName'] as String?) ?? '',
      fips: json['Fips'] as bool?,
      protocols: (json['Protocols'] as List?)
          ?.nonNulls
          .map((e) => SecurityPolicyProtocol.fromString((e as String)))
          .toList(),
      sshCiphers: (json['SshCiphers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      sshHostKeyAlgorithms: (json['SshHostKeyAlgorithms'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      sshKexs:
          (json['SshKexs'] as List?)?.nonNulls.map((e) => e as String).toList(),
      sshMacs:
          (json['SshMacs'] as List?)?.nonNulls.map((e) => e as String).toList(),
      tlsCiphers: (json['TlsCiphers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      type:
          (json['Type'] as String?)?.let(SecurityPolicyResourceType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final securityPolicyName = this.securityPolicyName;
    final fips = this.fips;
    final protocols = this.protocols;
    final sshCiphers = this.sshCiphers;
    final sshHostKeyAlgorithms = this.sshHostKeyAlgorithms;
    final sshKexs = this.sshKexs;
    final sshMacs = this.sshMacs;
    final tlsCiphers = this.tlsCiphers;
    final type = this.type;
    return {
      'SecurityPolicyName': securityPolicyName,
      if (fips != null) 'Fips': fips,
      if (protocols != null)
        'Protocols': protocols.map((e) => e.value).toList(),
      if (sshCiphers != null) 'SshCiphers': sshCiphers,
      if (sshHostKeyAlgorithms != null)
        'SshHostKeyAlgorithms': sshHostKeyAlgorithms,
      if (sshKexs != null) 'SshKexs': sshKexs,
      if (sshMacs != null) 'SshMacs': sshMacs,
      if (tlsCiphers != null) 'TlsCiphers': tlsCiphers,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class SecurityPolicyResourceType {
  static const server = SecurityPolicyResourceType._('SERVER');
  static const connector = SecurityPolicyResourceType._('CONNECTOR');

  final String value;

  const SecurityPolicyResourceType._(this.value);

  static const values = [server, connector];

  static SecurityPolicyResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SecurityPolicyResourceType._(value));

  @override
  bool operator ==(other) =>
      other is SecurityPolicyResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SecurityPolicyProtocol {
  static const sftp = SecurityPolicyProtocol._('SFTP');
  static const ftps = SecurityPolicyProtocol._('FTPS');

  final String value;

  const SecurityPolicyProtocol._(this.value);

  static const values = [sftp, ftps];

  static SecurityPolicyProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SecurityPolicyProtocol._(value));

  @override
  bool operator ==(other) =>
      other is SecurityPolicyProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details for a server host key.
///
/// @nodoc
class DescribedHostKey {
  /// The unique Amazon Resource Name (ARN) for the host key.
  final String arn;

  /// The date on which the host key was added to the server.
  final DateTime? dateImported;

  /// The text description for this host key.
  final String? description;

  /// The public key fingerprint, which is a short sequence of bytes used to
  /// identify the longer public key.
  final String? hostKeyFingerprint;

  /// A unique identifier for the host key.
  final String? hostKeyId;

  /// Key-value pairs that can be used to group and search for host keys.
  final List<Tag>? tags;

  /// The encryption algorithm that is used for the host key. The
  /// <code>Type</code> parameter is specified by using one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>ssh-rsa</code>
  /// </li>
  /// <li>
  /// <code>ssh-ed25519</code>
  /// </li>
  /// <li>
  /// <code>ecdsa-sha2-nistp256</code>
  /// </li>
  /// <li>
  /// <code>ecdsa-sha2-nistp384</code>
  /// </li>
  /// <li>
  /// <code>ecdsa-sha2-nistp521</code>
  /// </li>
  /// </ul>
  final String? type;

  DescribedHostKey({
    required this.arn,
    this.dateImported,
    this.description,
    this.hostKeyFingerprint,
    this.hostKeyId,
    this.tags,
    this.type,
  });

  factory DescribedHostKey.fromJson(Map<String, dynamic> json) {
    return DescribedHostKey(
      arn: (json['Arn'] as String?) ?? '',
      dateImported: timeStampFromJson(json['DateImported']),
      description: json['Description'] as String?,
      hostKeyFingerprint: json['HostKeyFingerprint'] as String?,
      hostKeyId: json['HostKeyId'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateImported = this.dateImported;
    final description = this.description;
    final hostKeyFingerprint = this.hostKeyFingerprint;
    final hostKeyId = this.hostKeyId;
    final tags = this.tags;
    final type = this.type;
    return {
      'Arn': arn,
      if (dateImported != null)
        'DateImported': unixTimestampToJson(dateImported),
      if (description != null) 'Description': description,
      if (hostKeyFingerprint != null) 'HostKeyFingerprint': hostKeyFingerprint,
      if (hostKeyId != null) 'HostKeyId': hostKeyId,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type,
    };
  }
}

/// The details for an execution object.
///
/// @nodoc
class DescribedExecution {
  /// A unique identifier for the execution of a workflow.
  final String? executionId;

  /// The IAM role associated with the execution.
  final String? executionRole;

  /// A structure that describes the Amazon S3 or EFS file location. This is the
  /// file location when the execution begins: if the file is being copied, this
  /// is the initial (as opposed to destination) file location.
  final FileLocation? initialFileLocation;

  /// The IAM logging role associated with the execution.
  final LoggingConfiguration? loggingConfiguration;
  final PosixProfile? posixProfile;

  /// A structure that describes the execution results. This includes a list of
  /// the steps along with the details of each step, error type and message (if
  /// any), and the <code>OnExceptionSteps</code> structure.
  final ExecutionResults? results;

  /// A container object for the session details that are associated with a
  /// workflow.
  final ServiceMetadata? serviceMetadata;

  /// The status is one of the execution. Can be in progress, completed, exception
  /// encountered, or handling the exception.
  final ExecutionStatus? status;

  DescribedExecution({
    this.executionId,
    this.executionRole,
    this.initialFileLocation,
    this.loggingConfiguration,
    this.posixProfile,
    this.results,
    this.serviceMetadata,
    this.status,
  });

  factory DescribedExecution.fromJson(Map<String, dynamic> json) {
    return DescribedExecution(
      executionId: json['ExecutionId'] as String?,
      executionRole: json['ExecutionRole'] as String?,
      initialFileLocation: json['InitialFileLocation'] != null
          ? FileLocation.fromJson(
              json['InitialFileLocation'] as Map<String, dynamic>)
          : null,
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
      posixProfile: json['PosixProfile'] != null
          ? PosixProfile.fromJson(json['PosixProfile'] as Map<String, dynamic>)
          : null,
      results: json['Results'] != null
          ? ExecutionResults.fromJson(json['Results'] as Map<String, dynamic>)
          : null,
      serviceMetadata: json['ServiceMetadata'] != null
          ? ServiceMetadata.fromJson(
              json['ServiceMetadata'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(ExecutionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final executionRole = this.executionRole;
    final initialFileLocation = this.initialFileLocation;
    final loggingConfiguration = this.loggingConfiguration;
    final posixProfile = this.posixProfile;
    final results = this.results;
    final serviceMetadata = this.serviceMetadata;
    final status = this.status;
    return {
      if (executionId != null) 'ExecutionId': executionId,
      if (executionRole != null) 'ExecutionRole': executionRole,
      if (initialFileLocation != null)
        'InitialFileLocation': initialFileLocation,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
      if (posixProfile != null) 'PosixProfile': posixProfile,
      if (results != null) 'Results': results,
      if (serviceMetadata != null) 'ServiceMetadata': serviceMetadata,
      if (status != null) 'Status': status.value,
    };
  }
}

/// Consists of the logging role and the log group name.
///
/// @nodoc
class LoggingConfiguration {
  /// The name of the CloudWatch logging group for the Transfer Family server to
  /// which this workflow belongs.
  final String? logGroupName;

  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that allows a server to turn on Amazon CloudWatch logging for Amazon S3
  /// or Amazon EFS events. When set, you can view user activity in your
  /// CloudWatch logs.
  final String? loggingRole;

  LoggingConfiguration({
    this.logGroupName,
    this.loggingRole,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      logGroupName: json['LogGroupName'] as String?,
      loggingRole: json['LoggingRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    final loggingRole = this.loggingRole;
    return {
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (loggingRole != null) 'LoggingRole': loggingRole,
    };
  }
}

/// Specifies the steps in the workflow, as well as the steps to execute in case
/// of any errors during workflow execution.
///
/// @nodoc
class ExecutionResults {
  /// Specifies the steps (actions) to take if errors are encountered during
  /// execution of the workflow.
  final List<ExecutionStepResult>? onExceptionSteps;

  /// Specifies the details for the steps that are in the specified workflow.
  final List<ExecutionStepResult>? steps;

  ExecutionResults({
    this.onExceptionSteps,
    this.steps,
  });

  factory ExecutionResults.fromJson(Map<String, dynamic> json) {
    return ExecutionResults(
      onExceptionSteps: (json['OnExceptionSteps'] as List?)
          ?.nonNulls
          .map((e) => ExecutionStepResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['Steps'] as List?)
          ?.nonNulls
          .map((e) => ExecutionStepResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final onExceptionSteps = this.onExceptionSteps;
    final steps = this.steps;
    return {
      if (onExceptionSteps != null) 'OnExceptionSteps': onExceptionSteps,
      if (steps != null) 'Steps': steps,
    };
  }
}

/// Specifies the following details for the step: error (if any), outputs (if
/// any), and the step type.
///
/// @nodoc
class ExecutionStepResult {
  /// Specifies the details for an error, if it occurred during execution of the
  /// specified workflow step.
  final ExecutionError? error;

  /// The values for the key/value pair applied as a tag to the file. Only
  /// applicable if the step type is <code>TAG</code>.
  final String? outputs;

  /// One of the available step types.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>COPY</code> </b> - Copy the file to another location.
  /// </li>
  /// <li>
  /// <b> <code>CUSTOM</code> </b> - Perform a custom step with an Lambda function
  /// target.
  /// </li>
  /// <li>
  /// <b> <code>DECRYPT</code> </b> - Decrypt a file that was encrypted before it
  /// was uploaded.
  /// </li>
  /// <li>
  /// <b> <code>DELETE</code> </b> - Delete the file.
  /// </li>
  /// <li>
  /// <b> <code>TAG</code> </b> - Add a tag to the file.
  /// </li>
  /// </ul>
  final WorkflowStepType? stepType;

  ExecutionStepResult({
    this.error,
    this.outputs,
    this.stepType,
  });

  factory ExecutionStepResult.fromJson(Map<String, dynamic> json) {
    return ExecutionStepResult(
      error: json['Error'] != null
          ? ExecutionError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      outputs: json['Outputs'] as String?,
      stepType: (json['StepType'] as String?)?.let(WorkflowStepType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final outputs = this.outputs;
    final stepType = this.stepType;
    return {
      if (error != null) 'Error': error,
      if (outputs != null) 'Outputs': outputs,
      if (stepType != null) 'StepType': stepType.value,
    };
  }
}

/// Specifies the error message and type, for an error that occurs during the
/// execution of the workflow.
///
/// @nodoc
class ExecutionError {
  /// Specifies the descriptive message that corresponds to the
  /// <code>ErrorType</code>.
  final String message;

  /// Specifies the error type.
  ///
  /// <ul>
  /// <li>
  /// <code>ALREADY_EXISTS</code>: occurs for a copy step, if the overwrite option
  /// is not selected and a file with the same name already exists in the target
  /// location.
  /// </li>
  /// <li>
  /// <code>BAD_REQUEST</code>: a general bad request: for example, a step that
  /// attempts to tag an EFS file returns <code>BAD_REQUEST</code>, as only S3
  /// files can be tagged.
  /// </li>
  /// <li>
  /// <code>CUSTOM_STEP_FAILED</code>: occurs when the custom step provided a
  /// callback that indicates failure.
  /// </li>
  /// <li>
  /// <code>INTERNAL_SERVER_ERROR</code>: a catch-all error that can occur for a
  /// variety of reasons.
  /// </li>
  /// <li>
  /// <code>NOT_FOUND</code>: occurs when a requested entity, for example a source
  /// file for a copy step, does not exist.
  /// </li>
  /// <li>
  /// <code>PERMISSION_DENIED</code>: occurs if your policy does not contain the
  /// correct permissions to complete one or more of the steps in the workflow.
  /// </li>
  /// <li>
  /// <code>TIMEOUT</code>: occurs when the execution times out.
  /// <note>
  /// You can set the <code>TimeoutSeconds</code> for a custom step, anywhere from
  /// 1 second to 1800 seconds (30 minutes).
  /// </note> </li>
  /// <li>
  /// <code>THROTTLED</code>: occurs if you exceed the new execution refill rate
  /// of one workflow per second.
  /// </li>
  /// </ul>
  final ExecutionErrorType type;

  ExecutionError({
    required this.message,
    required this.type,
  });

  factory ExecutionError.fromJson(Map<String, dynamic> json) {
    return ExecutionError(
      message: (json['Message'] as String?) ?? '',
      type: ExecutionErrorType.fromString((json['Type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      'Message': message,
      'Type': type.value,
    };
  }
}

/// @nodoc
class ExecutionErrorType {
  static const permissionDenied = ExecutionErrorType._('PERMISSION_DENIED');
  static const customStepFailed = ExecutionErrorType._('CUSTOM_STEP_FAILED');
  static const throttled = ExecutionErrorType._('THROTTLED');
  static const alreadyExists = ExecutionErrorType._('ALREADY_EXISTS');
  static const notFound = ExecutionErrorType._('NOT_FOUND');
  static const badRequest = ExecutionErrorType._('BAD_REQUEST');
  static const timeout = ExecutionErrorType._('TIMEOUT');
  static const internalServerError =
      ExecutionErrorType._('INTERNAL_SERVER_ERROR');

  final String value;

  const ExecutionErrorType._(this.value);

  static const values = [
    permissionDenied,
    customStepFailed,
    throttled,
    alreadyExists,
    notFound,
    badRequest,
    timeout,
    internalServerError
  ];

  static ExecutionErrorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionErrorType._(value));

  @override
  bool operator ==(other) =>
      other is ExecutionErrorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the properties of the access that was specified.
///
/// @nodoc
class DescribedAccess {
  /// A unique identifier that is required to identify specific groups within your
  /// directory. The users of the group that you associate have access to your
  /// Amazon S3 or Amazon EFS resources over the enabled protocols using Transfer
  /// Family. If you know the group name, you can view the SID values by running
  /// the following command using Windows PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regular expression used to validate this parameter is a string of
  /// characters consisting of uppercase and lowercase alphanumeric characters
  /// with no spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  final String? externalId;

  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  /// <note>
  /// You can use the <code>HomeDirectory</code> parameter for
  /// <code>HomeDirectoryType</code> when it is set to either <code>PATH</code> or
  /// <code>LOGICAL</code>.
  /// </note>
  final String? homeDirectory;

  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you only
  /// specify a target, it is displayed as is. You also must ensure that your
  /// Identity and Access Management (IAM) role provides access to paths in
  /// <code>Target</code>. This value can be set only when
  /// <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// In most cases, you can use this value instead of the session policy to lock
  /// down the associated access to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to '/'
  /// and set <code>Target</code> to the <code>HomeDirectory</code> parameter
  /// value.
  final List<HomeDirectoryMapEntry>? homeDirectoryMappings;

  /// The type of landing directory (folder) that you want your users' home
  /// directory to be when they log in to the server. If you set it to
  /// <code>PATH</code>, the user will see the absolute Amazon S3 bucket or Amazon
  /// EFS path as is in their file transfer protocol clients. If you set it to
  /// <code>LOGICAL</code>, you need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// Amazon EFS paths visible to your users.
  /// <note>
  /// If <code>HomeDirectoryType</code> is <code>LOGICAL</code>, you must provide
  /// mappings, using the <code>HomeDirectoryMappings</code> parameter. If, on the
  /// other hand, <code>HomeDirectoryType</code> is <code>PATH</code>, you provide
  /// an absolute path using the <code>HomeDirectory</code> parameter. You cannot
  /// have both <code>HomeDirectory</code> and <code>HomeDirectoryMappings</code>
  /// in your template.
  /// </note>
  final HomeDirectoryType? homeDirectoryType;

  /// A session policy for your user so that you can use the same Identity and
  /// Access Management (IAM) role across multiple users. This policy scopes down
  /// a user's access to portions of their Amazon S3 bucket. Variables that you
  /// can use inside this policy include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  final String? policy;
  final PosixProfile? posixProfile;

  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that controls your users' access to your Amazon S3 bucket or Amazon EFS
  /// file system. The policies attached to this role determine the level of
  /// access that you want to provide your users when transferring files into and
  /// out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should
  /// also contain a trust relationship that allows the server to access your
  /// resources when servicing your users' transfer requests.
  final String? role;

  DescribedAccess({
    this.externalId,
    this.homeDirectory,
    this.homeDirectoryMappings,
    this.homeDirectoryType,
    this.policy,
    this.posixProfile,
    this.role,
  });

  factory DescribedAccess.fromJson(Map<String, dynamic> json) {
    return DescribedAccess(
      externalId: json['ExternalId'] as String?,
      homeDirectory: json['HomeDirectory'] as String?,
      homeDirectoryMappings: (json['HomeDirectoryMappings'] as List?)
          ?.nonNulls
          .map((e) => HomeDirectoryMapEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeDirectoryType: (json['HomeDirectoryType'] as String?)
          ?.let(HomeDirectoryType.fromString),
      policy: json['Policy'] as String?,
      posixProfile: json['PosixProfile'] != null
          ? PosixProfile.fromJson(json['PosixProfile'] as Map<String, dynamic>)
          : null,
      role: json['Role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final externalId = this.externalId;
    final homeDirectory = this.homeDirectory;
    final homeDirectoryMappings = this.homeDirectoryMappings;
    final homeDirectoryType = this.homeDirectoryType;
    final policy = this.policy;
    final posixProfile = this.posixProfile;
    final role = this.role;
    return {
      if (externalId != null) 'ExternalId': externalId,
      if (homeDirectory != null) 'HomeDirectory': homeDirectory,
      if (homeDirectoryMappings != null)
        'HomeDirectoryMappings': homeDirectoryMappings,
      if (homeDirectoryType != null)
        'HomeDirectoryType': homeDirectoryType.value,
      if (policy != null) 'Policy': policy,
      if (posixProfile != null) 'PosixProfile': posixProfile,
      if (role != null) 'Role': role,
    };
  }
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
class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String? type, String? message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

/// @nodoc
class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

/// @nodoc
class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

/// @nodoc
class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String? type, String? message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServiceError': (type, message) =>
      InternalServiceError(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceExistsException': (type, message) =>
      ResourceExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
