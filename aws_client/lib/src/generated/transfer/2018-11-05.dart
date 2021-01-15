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

part '2018-11-05.g.dart';

/// AWS Transfer Family is a fully managed service that enables the transfer of
/// files over the File Transfer Protocol (FTP), File Transfer Protocol over SSL
/// (FTPS), or Secure Shell (SSH) File Transfer Protocol (SFTP) directly into
/// and out of Amazon Simple Storage Service (Amazon S3). AWS helps you
/// seamlessly migrate your file transfer workflows to AWS Transfer Family by
/// integrating with existing authentication systems, and providing DNS routing
/// with Amazon Route 53 so nothing changes for your customers and partners, or
/// their applications. With your data in Amazon S3, you can use it with AWS
/// services for processing, analytics, machine learning, and archiving. Getting
/// started with AWS Transfer Family is easy since there is no infrastructure to
/// buy and set up.
class Transfer {
  final _s.JsonProtocol _protocol;
  Transfer({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'transfer',
            signingName: 'transfer',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Instantiates an autoscaling virtual server based on the selected file
  /// transfer protocol in AWS. When you make updates to your file transfer
  /// protocol-enabled server or when you work with users, use the
  /// service-generated <code>ServerId</code> property that is assigned to the
  /// newly created server.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [certificate] :
  /// The Amazon Resource Name (ARN) of the AWS Certificate Manager (ACM)
  /// certificate. Required when <code>Protocols</code> is set to
  /// <code>FTPS</code>.
  ///
  /// To request a new public certificate, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html">Request
  /// a public certificate</a> in the <i> AWS Certificate Manager User
  /// Guide</i>.
  ///
  /// To import an existing certificate into ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// certificates into ACM</a> in the <i> AWS Certificate Manager User
  /// Guide</i>.
  ///
  /// To request a private certificate to use FTPS through private IP addresses,
  /// see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-private.html">Request
  /// a private certificate</a> in the <i> AWS Certificate Manager User
  /// Guide</i>.
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
  /// your server. When you host your endpoint within your VPC, you can make it
  /// accessible only to resources within your VPC, or you can attach Elastic
  /// IPs and make it accessible to clients over the internet. Your VPC's
  /// default security groups are automatically assigned to your endpoint.
  ///
  /// Parameter [endpointType] :
  /// The type of VPC endpoint that you want your server to connect to. You can
  /// choose to connect to the public internet or a VPC endpoint. With a VPC
  /// endpoint, you can restrict access to your server and resources only within
  /// your VPC.
  /// <note>
  /// It is recommended that you use <code>VPC</code> as the
  /// <code>EndpointType</code>. With this endpoint type, you have the option to
  /// directly associate up to three Elastic IPv4 addresses (BYO IP included)
  /// with your server's endpoint and use VPC security groups to restrict
  /// traffic by the client's public IP address. This is not possible with
  /// <code>EndpointType</code> set to <code>VPC_ENDPOINT</code>.
  /// </note>
  ///
  /// Parameter [hostKey] :
  /// The RSA private key as generated by the <code>ssh-keygen -N "" -m PEM -f
  /// my-new-server-key</code> command.
  /// <important>
  /// If you aren't planning to migrate existing users from an existing
  /// SFTP-enabled server to a new server, don't update the host key.
  /// Accidentally changing a server's host key can be disruptive.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key">Change
  /// the host key for your SFTP-enabled server</a> in the <i>AWS Transfer
  /// Family User Guide</i>.
  ///
  /// Parameter [identityProviderDetails] :
  /// Required when <code>IdentityProviderType</code> is set to
  /// <code>API_GATEWAY</code>. Accepts an array containing all of the
  /// information required to call a customer-supplied authentication API,
  /// including the API Gateway URL. Not required when
  /// <code>IdentityProviderType</code> is set to <code>SERVICE_MANAGED</code>.
  ///
  /// Parameter [identityProviderType] :
  /// Specifies the mode of authentication for a server. The default value is
  /// <code>SERVICE_MANAGED</code>, which allows you to store and access user
  /// credentials within the AWS Transfer Family service. Use the
  /// <code>API_GATEWAY</code> value to integrate with an identity provider of
  /// your choosing. The <code>API_GATEWAY</code> setting requires you to
  /// provide an API Gateway endpoint URL to call for authentication using the
  /// <code>IdentityProviderDetails</code> parameter.
  ///
  /// Parameter [loggingRole] :
  /// Allows the service to write your users' activity to your Amazon CloudWatch
  /// logs for monitoring and auditing purposes.
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
  /// </ul> <note>
  /// If you select <code>FTPS</code>, you must choose a certificate stored in
  /// AWS Certificate Manager (ACM) which will be used to identify your server
  /// when clients connect to it over FTPS.
  ///
  /// If <code>Protocol</code> includes either <code>FTP</code> or
  /// <code>FTPS</code>, then the <code>EndpointType</code> must be
  /// <code>VPC</code> and the <code>IdentityProviderType</code> must be
  /// <code>API_GATEWAY</code>.
  ///
  /// If <code>Protocol</code> includes <code>FTP</code>, then
  /// <code>AddressAllocationIds</code> cannot be associated.
  ///
  /// If <code>Protocol</code> is set only to <code>SFTP</code>, the
  /// <code>EndpointType</code> can be set to <code>PUBLIC</code> and the
  /// <code>IdentityProviderType</code> can be set to
  /// <code>SERVICE_MANAGED</code>.
  /// </note>
  ///
  /// Parameter [securityPolicyName] :
  /// Specifies the name of the security policy that is attached to the server.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for servers.
  Future<CreateServerResponse> createServer({
    String certificate,
    EndpointDetails endpointDetails,
    EndpointType endpointType,
    String hostKey,
    IdentityProviderDetails identityProviderDetails,
    IdentityProviderType identityProviderType,
    String loggingRole,
    List<Protocol> protocols,
    String securityPolicyName,
    List<Tag> tags,
  }) async {
    _s.validateStringLength(
      'certificate',
      certificate,
      0,
      1600,
    );
    _s.validateStringLength(
      'hostKey',
      hostKey,
      0,
      4096,
    );
    _s.validateStringLength(
      'loggingRole',
      loggingRole,
      20,
      2048,
    );
    _s.validateStringPattern(
      'loggingRole',
      loggingRole,
      r'''arn:.*role/.*''',
    );
    _s.validateStringLength(
      'securityPolicyName',
      securityPolicyName,
      0,
      100,
    );
    _s.validateStringPattern(
      'securityPolicyName',
      securityPolicyName,
      r'''TransferSecurityPolicy-.+''',
    );
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
        if (endpointDetails != null) 'EndpointDetails': endpointDetails,
        if (endpointType != null) 'EndpointType': endpointType.toValue(),
        if (hostKey != null) 'HostKey': hostKey,
        if (identityProviderDetails != null)
          'IdentityProviderDetails': identityProviderDetails,
        if (identityProviderType != null)
          'IdentityProviderType': identityProviderType.toValue(),
        if (loggingRole != null) 'LoggingRole': loggingRole,
        if (protocols != null)
          'Protocols': protocols.map((e) => e?.toValue() ?? '').toList(),
        if (securityPolicyName != null)
          'SecurityPolicyName': securityPolicyName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateServerResponse.fromJson(jsonResponse.body);
  }

  /// Creates a user and associates them with an existing file transfer
  /// protocol-enabled server. You can only create and associate users with
  /// servers that have the <code>IdentityProviderType</code> set to
  /// <code>SERVICE_MANAGED</code>. Using parameters for
  /// <code>CreateUser</code>, you can specify the user name, set the home
  /// directory, store the user's public key, and assign the user's AWS Identity
  /// and Access Management (IAM) role. You can also optionally add a scope-down
  /// policy, and assign metadata with tags that can be used to group and search
  /// for users.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [role] :
  /// The IAM role that controls your users' access to your Amazon S3 bucket.
  /// The policies attached to this role will determine the level of access you
  /// want to provide your users when transferring files into and out of your
  /// Amazon S3 bucket or buckets. The IAM role should also contain a trust
  /// relationship that allows the server to access your resources when
  /// servicing your users' transfer requests.
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance. This is the
  /// specific server that you added your user to.
  ///
  /// Parameter [userName] :
  /// A unique string that identifies a user and is associated with a as
  /// specified by the <code>ServerId</code>. This user name must be a minimum
  /// of 3 and a maximum of 100 characters long. The following are valid
  /// characters: a-z, A-Z, 0-9, underscore '_', hyphen '-', period '.', and at
  /// sign '@'. The user name can't start with a hyphen, period, or at sign.
  ///
  /// Parameter [homeDirectory] :
  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// An example is <i>
  /// <code>your-Amazon-S3-bucket-name&gt;/home/username</code> </i>.
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 paths and keys
  /// should be visible to your user and how you want to make them visible. You
  /// will need to specify the "<code>Entry</code>" and "<code>Target</code>"
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 path. If you only specify a
  /// target, it will be displayed as is. You will need to also make sure that
  /// your IAM role provides access to paths in <code>Target</code>. The
  /// following is an example.
  ///
  /// <code>'[ "/bucket2/documentation", { "Entry": "your-personal-report.pdf",
  /// "Target": "/bucket3/customized-reports/${transfer:UserName}.pdf" }
  /// ]'</code>
  ///
  /// In most cases, you can use this value instead of the scope-down policy to
  /// lock your user down to the designated home directory ("chroot"). To do
  /// this, you can set <code>Entry</code> to '/' and set <code>Target</code> to
  /// the HomeDirectory parameter value.
  /// <note>
  /// If the target of a logical directory entry does not exist in Amazon S3,
  /// the entry will be ignored. As a workaround, you can use the Amazon S3 API
  /// to create 0 byte objects as place holders for your directory. If using the
  /// CLI, use the <code>s3api</code> call instead of <code>s3</code> so you can
  /// use the put-object operation. For example, you use the following:
  /// <code>aws s3api put-object --bucket bucketname --key
  /// path/to/folder/</code>. Make sure that the end of the key name ends in a
  /// '/' for it to be considered a folder.
  /// </note>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>,
  /// the user will see the absolute Amazon S3 bucket paths as is in their file
  /// transfer protocol clients. If you set it <code>LOGICAL</code>, you will
  /// need to provide mappings in the <code>HomeDirectoryMappings</code> for how
  /// you want to make Amazon S3 paths visible to your users.
  ///
  /// Parameter [policy] :
  /// A scope-down policy for your user so you can use the same IAM role across
  /// multiple users. This policy scopes down user access to portions of their
  /// Amazon S3 bucket. Variables that you can use inside this policy include
  /// <code>${Transfer:UserName}</code>, <code>${Transfer:HomeDirectory}</code>,
  /// and <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// For scope-down policies, AWS Transfer Family stores the policy as a JSON
  /// blob, instead of the Amazon Resource Name (ARN) of the policy. You save
  /// the policy as a JSON blob and pass it in the <code>Policy</code> argument.
  ///
  /// For an example of a scope-down policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/users.html#users-policies-scope-down">Creating
  /// a scope-down policy</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a>
  /// in the <i>AWS Security Token Service API Reference</i>.
  /// </note>
  ///
  /// Parameter [sshPublicKeyBody] :
  /// The public portion of the Secure Shell (SSH) key used to authenticate the
  /// user to the server.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to group and search for users. Tags are
  /// metadata attached to users for any purpose.
  Future<CreateUserResponse> createUser({
    @_s.required String role,
    @_s.required String serverId,
    @_s.required String userName,
    String homeDirectory,
    List<HomeDirectoryMapEntry> homeDirectoryMappings,
    HomeDirectoryType homeDirectoryType,
    String policy,
    String sshPublicKeyBody,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'role',
      role,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'role',
      role,
      r'''arn:.*role/.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''^[\w][\w@.-]{2,99}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'homeDirectory',
      homeDirectory,
      0,
      1024,
    );
    _s.validateStringPattern(
      'homeDirectory',
      homeDirectory,
      r'''^$|/.*''',
    );
    _s.validateStringLength(
      'policy',
      policy,
      0,
      2048,
    );
    _s.validateStringLength(
      'sshPublicKeyBody',
      sshPublicKeyBody,
      0,
      2048,
    );
    _s.validateStringPattern(
      'sshPublicKeyBody',
      sshPublicKeyBody,
      r'''^ssh-rsa\s+[A-Za-z0-9+/]+[=]{0,3}(\s+.+)?\s*$''',
    );
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
          'HomeDirectoryType': homeDirectoryType.toValue(),
        if (policy != null) 'Policy': policy,
        if (sshPublicKeyBody != null) 'SshPublicKeyBody': sshPublicKeyBody,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the file transfer protocol-enabled server that you specify.
  ///
  /// No response returns from this operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [serverId] :
  /// A unique system-assigned identifier for a server instance.
  Future<void> deleteServer({
    @_s.required String serverId,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteServer'
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
  }

  /// Deletes a user's Secure Shell (SSH) public key.
  ///
  /// No response is returned from this operation.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
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
    @_s.required String serverId,
    @_s.required String sshPublicKeyId,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sshPublicKeyId, 'sshPublicKeyId');
    _s.validateStringLength(
      'sshPublicKeyId',
      sshPublicKeyId,
      21,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sshPublicKeyId',
      sshPublicKeyId,
      r'''^key-[0-9a-f]{17}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''^[\w][\w@.-]{2,99}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteSshPublicKey'
    };
    final jsonResponse = await _protocol.send(
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

  /// Deletes the user belonging to a file transfer protocol-enabled server you
  /// specify.
  ///
  /// No response returns from this operation.
  /// <note>
  /// When you delete a user from a server, the user's information is lost.
  /// </note>
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance that has the
  /// user assigned to it.
  ///
  /// Parameter [userName] :
  /// A unique string that identifies a user that is being deleted from a
  /// server.
  Future<void> deleteUser({
    @_s.required String serverId,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''^[\w][\w@.-]{2,99}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.DeleteUser'
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
  }

  /// Describes the security policy that is attached to your file transfer
  /// protocol-enabled server. The response contains a description of the
  /// security policy's properties. For more information about security
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html">Working
  /// with security policies</a>.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [securityPolicyName] :
  /// Specifies the name of the security policy that is attached to the server.
  Future<DescribeSecurityPolicyResponse> describeSecurityPolicy({
    @_s.required String securityPolicyName,
  }) async {
    ArgumentError.checkNotNull(securityPolicyName, 'securityPolicyName');
    _s.validateStringLength(
      'securityPolicyName',
      securityPolicyName,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'securityPolicyName',
      securityPolicyName,
      r'''TransferSecurityPolicy-.+''',
      isRequired: true,
    );
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

  /// Describes a file transfer protocol-enabled server that you specify by
  /// passing the <code>ServerId</code> parameter.
  ///
  /// The response contains a description of a server's properties. When you set
  /// <code>EndpointType</code> to VPC, the response will contain the
  /// <code>EndpointDetails</code>.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server.
  Future<DescribeServerResponse> describeServer({
    @_s.required String serverId,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
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

  /// Describes the user assigned to the specific file transfer protocol-enabled
  /// server, as identified by its <code>ServerId</code> property.
  ///
  /// The response from this call returns the properties of the user associated
  /// with the <code>ServerId</code> value that was specified.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that has this user
  /// assigned.
  ///
  /// Parameter [userName] :
  /// The name of the user assigned to one or more servers. User names are part
  /// of the sign-in credentials to use the AWS Transfer Family service and
  /// perform file transfer tasks.
  Future<DescribeUserResponse> describeUser({
    @_s.required String serverId,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''^[\w][\w@.-]{2,99}$''',
      isRequired: true,
    );
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

  /// Adds a Secure Shell (SSH) public key to a user account identified by a
  /// <code>UserName</code> value assigned to the specific file transfer
  /// protocol-enabled server, identified by <code>ServerId</code>.
  ///
  /// The response returns the <code>UserName</code> value, the
  /// <code>ServerId</code> value, and the name of the
  /// <code>SshPublicKeyId</code>.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server.
  ///
  /// Parameter [sshPublicKeyBody] :
  /// The public key portion of an SSH key pair.
  ///
  /// Parameter [userName] :
  /// The name of the user account that is assigned to one or more servers.
  Future<ImportSshPublicKeyResponse> importSshPublicKey({
    @_s.required String serverId,
    @_s.required String sshPublicKeyBody,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sshPublicKeyBody, 'sshPublicKeyBody');
    _s.validateStringLength(
      'sshPublicKeyBody',
      sshPublicKeyBody,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sshPublicKeyBody',
      sshPublicKeyBody,
      r'''^ssh-rsa\s+[A-Za-z0-9+/]+[=]{0,3}(\s+.+)?\s*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''^[\w][\w@.-]{2,99}$''',
      isRequired: true,
    );
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

  /// Lists the security policies that are attached to your file transfer
  /// protocol-enabled servers.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      6144,
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

  /// Lists the file transfer protocol-enabled servers that are associated with
  /// your AWS account.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      6144,
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

  /// Lists all of the tags associated with the Amazon Resource Number (ARN) you
  /// specify. The resource can be a user, server, or role.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [arn] :
  /// Requests the tags associated with a particular Amazon Resource Name (ARN).
  /// An ARN is an identifier for a specific AWS resource, such as a server,
  /// user, or role.
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
    @_s.required String arn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      20,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      6144,
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

  /// Lists the users for a file transfer protocol-enabled server that you
  /// specify by passing the <code>ServerId</code> parameter.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
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
  /// When you can get additional results from the <code>ListUsers</code> call,
  /// a <code>NextToken</code> parameter is returned in the output. You can then
  /// pass in a subsequent command to the <code>NextToken</code> parameter to
  /// continue listing additional users.
  Future<ListUsersResponse> listUsers({
    @_s.required String serverId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      6144,
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
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that you start.
  Future<void> startServer({
    @_s.required String serverId,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.StartServer'
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
  }

  /// Changes the state of a file transfer protocol-enabled server from
  /// <code>ONLINE</code> to <code>OFFLINE</code>. An <code>OFFLINE</code>
  /// server cannot accept and process file transfer jobs. Information tied to
  /// your server, such as server and user properties, are not affected by
  /// stopping your server.
  /// <note>
  /// Stopping the server will not reduce or impact your file transfer protocol
  /// endpoint billing; you must delete the server to stop being billed.
  /// </note>
  /// The state of <code>STOPPING</code> indicates that the server is in an
  /// intermediate state, either not fully able to respond, or not fully
  /// offline. The values of <code>STOP_FAILED</code> can indicate an error
  /// condition.
  ///
  /// No response is returned from this call.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that you stopped.
  Future<void> stopServer({
    @_s.required String serverId,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.StopServer'
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
  }

  /// Attaches a key-value pair to a resource, as identified by its Amazon
  /// Resource Name (ARN). Resources are users, servers, roles, and other
  /// entities.
  ///
  /// There is no response returned from this call.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// An Amazon Resource Name (ARN) for a specific AWS resource, such as a
  /// server, user, or role.
  ///
  /// Parameter [tags] :
  /// Key-value pairs assigned to ARNs that you can use to group and search for
  /// resources by type. You can attach this metadata to user accounts for any
  /// purpose.
  Future<void> tagResource({
    @_s.required String arn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      20,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

  /// If the <code>IdentityProviderType</code> of a file transfer
  /// protocol-enabled server is <code>API_Gateway</code>, tests whether your
  /// API Gateway is set up successfully. We highly recommend that you call this
  /// operation to test your authentication method as soon as you create your
  /// server. By doing so, you can troubleshoot issues with the API Gateway
  /// integration to ensure that your users can successfully use the service.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned identifier for a specific server. That server's user
  /// authentication method is tested with a user name and password.
  ///
  /// Parameter [userName] :
  /// The name of the user account to be tested.
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
  /// </ul>
  ///
  /// Parameter [sourceIp] :
  /// The source IP address of the user account to be tested.
  ///
  /// Parameter [userPassword] :
  /// The password of the user account to be tested.
  Future<TestIdentityProviderResponse> testIdentityProvider({
    @_s.required String serverId,
    @_s.required String userName,
    Protocol serverProtocol,
    String sourceIp,
    String userPassword,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''^[\w][\w@.-]{2,99}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'sourceIp',
      sourceIp,
      0,
      32,
    );
    _s.validateStringPattern(
      'sourceIp',
      sourceIp,
      r'''^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$''',
    );
    _s.validateStringLength(
      'userPassword',
      userPassword,
      0,
      2048,
    );
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
        if (serverProtocol != null) 'ServerProtocol': serverProtocol.toValue(),
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
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The value of the resource that will have the tag removed. An Amazon
  /// Resource Name (ARN) is an identifier for a specific AWS resource, such as
  /// a server, user, or role.
  ///
  /// Parameter [tagKeys] :
  /// TagKeys are key-value pairs assigned to ARNs that can be used to group and
  /// search for resources by type. This metadata can be attached to resources
  /// for any purpose.
  Future<void> untagResource({
    @_s.required String arn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      20,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TransferService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

  /// Updates the file transfer protocol-enabled server's properties after that
  /// server has been created.
  ///
  /// The <code>UpdateServer</code> call returns the <code>ServerId</code> of
  /// the server you updated.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance that the user
  /// account is assigned to.
  ///
  /// Parameter [certificate] :
  /// The Amazon Resource Name (ARN) of the AWS Certificate Manager (ACM)
  /// certificate. Required when <code>Protocols</code> is set to
  /// <code>FTPS</code>.
  ///
  /// To request a new public certificate, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html">Request
  /// a public certificate</a> in the <i> AWS Certificate Manager User
  /// Guide</i>.
  ///
  /// To import an existing certificate into ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// certificates into ACM</a> in the <i> AWS Certificate Manager User
  /// Guide</i>.
  ///
  /// To request a private certificate to use FTPS through private IP addresses,
  /// see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-private.html">Request
  /// a private certificate</a> in the <i> AWS Certificate Manager User
  /// Guide</i>.
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
  /// your server. With a VPC endpoint, you can restrict access to your server
  /// to resources only within your VPC. To control incoming internet traffic,
  /// you will need to associate one or more Elastic IP addresses with your
  /// server's endpoint.
  ///
  /// Parameter [endpointType] :
  /// The type of endpoint that you want your server to connect to. You can
  /// choose to connect to the public internet or a VPC endpoint. With a VPC
  /// endpoint, you can restrict access to your server and resources only within
  /// your VPC.
  /// <note>
  /// It is recommended that you use <code>VPC</code> as the
  /// <code>EndpointType</code>. With this endpoint type, you have the option to
  /// directly associate up to three Elastic IPv4 addresses (BYO IP included)
  /// with your server's endpoint and use VPC security groups to restrict
  /// traffic by the client's public IP address. This is not possible with
  /// <code>EndpointType</code> set to <code>VPC_ENDPOINT</code>.
  /// </note>
  ///
  /// Parameter [hostKey] :
  /// The RSA private key as generated by <code>ssh-keygen -N "" -m PEM -f
  /// my-new-server-key</code>.
  /// <important>
  /// If you aren't planning to migrate existing users from an existing server
  /// to a new server, don't update the host key. Accidentally changing a
  /// server's host key can be disruptive.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key">Change
  /// the host key for your SFTP-enabled server</a> in the <i>AWS Transfer
  /// Family User Guide</i>.
  ///
  /// Parameter [identityProviderDetails] :
  /// An array containing all of the information required to call a customer's
  /// authentication API method.
  ///
  /// Parameter [loggingRole] :
  /// Changes the AWS Identity and Access Management (IAM) role that allows
  /// Amazon S3 events to be logged in Amazon CloudWatch, turning logging on or
  /// off.
  ///
  /// Parameter [protocols] :
  /// Specifies the file transfer protocol or protocols over which your file
  /// transfer protocol client can connect to your server's endpoint. The
  /// available protocols are:
  ///
  /// <ul>
  /// <li>
  /// Secure Shell (SSH) File Transfer Protocol (SFTP): File transfer over SSH
  /// </li>
  /// <li>
  /// File Transfer Protocol Secure (FTPS): File transfer with TLS encryption
  /// </li>
  /// <li>
  /// File Transfer Protocol (FTP): Unencrypted file transfer
  /// </li>
  /// </ul> <note>
  /// If you select <code>FTPS</code>, you must choose a certificate stored in
  /// AWS Certificate Manager (ACM) which will be used to identify your server
  /// when clients connect to it over FTPS.
  ///
  /// If <code>Protocol</code> includes either <code>FTP</code> or
  /// <code>FTPS</code>, then the <code>EndpointType</code> must be
  /// <code>VPC</code> and the <code>IdentityProviderType</code> must be
  /// <code>API_GATEWAY</code>.
  ///
  /// If <code>Protocol</code> includes <code>FTP</code>, then
  /// <code>AddressAllocationIds</code> cannot be associated.
  ///
  /// If <code>Protocol</code> is set only to <code>SFTP</code>, the
  /// <code>EndpointType</code> can be set to <code>PUBLIC</code> and the
  /// <code>IdentityProviderType</code> can be set to
  /// <code>SERVICE_MANAGED</code>.
  /// </note>
  ///
  /// Parameter [securityPolicyName] :
  /// Specifies the name of the security policy that is attached to the server.
  Future<UpdateServerResponse> updateServer({
    @_s.required String serverId,
    String certificate,
    EndpointDetails endpointDetails,
    EndpointType endpointType,
    String hostKey,
    IdentityProviderDetails identityProviderDetails,
    String loggingRole,
    List<Protocol> protocols,
    String securityPolicyName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'certificate',
      certificate,
      0,
      1600,
    );
    _s.validateStringLength(
      'hostKey',
      hostKey,
      0,
      4096,
    );
    _s.validateStringLength(
      'loggingRole',
      loggingRole,
      0,
      2048,
    );
    _s.validateStringPattern(
      'loggingRole',
      loggingRole,
      r'''^$|arn:.*role/.*''',
    );
    _s.validateStringLength(
      'securityPolicyName',
      securityPolicyName,
      0,
      100,
    );
    _s.validateStringPattern(
      'securityPolicyName',
      securityPolicyName,
      r'''TransferSecurityPolicy-.+''',
    );
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
        if (endpointType != null) 'EndpointType': endpointType.toValue(),
        if (hostKey != null) 'HostKey': hostKey,
        if (identityProviderDetails != null)
          'IdentityProviderDetails': identityProviderDetails,
        if (loggingRole != null) 'LoggingRole': loggingRole,
        if (protocols != null)
          'Protocols': protocols.map((e) => e?.toValue() ?? '').toList(),
        if (securityPolicyName != null)
          'SecurityPolicyName': securityPolicyName,
      },
    );

    return UpdateServerResponse.fromJson(jsonResponse.body);
  }

  /// Assigns new properties to a user. Parameters you pass modify any or all of
  /// the following: the home directory, role, and policy for the
  /// <code>UserName</code> and <code>ServerId</code> you specify.
  ///
  /// The response returns the <code>ServerId</code> and the
  /// <code>UserName</code> for the updated user.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server instance that the user
  /// account is assigned to.
  ///
  /// Parameter [userName] :
  /// A unique string that identifies a user and is associated with a server as
  /// specified by the <code>ServerId</code>. This user name must be a minimum
  /// of 3 and a maximum of 100 characters long. The following are valid
  /// characters: a-z, A-Z, 0-9, underscore '_', hyphen '-', period '.', and at
  /// sign '@'. The user name can't start with a hyphen, period, or at sign.
  ///
  /// Parameter [homeDirectory] :
  /// Specifies the landing directory (folder) for a user when they log in to
  /// the server using their file transfer protocol client.
  ///
  /// An example is <code>your-Amazon-S3-bucket-name&gt;/home/username</code>.
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 paths and keys
  /// should be visible to your user and how you want to make them visible. You
  /// will need to specify the "<code>Entry</code>" and "<code>Target</code>"
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 path. If you only specify a
  /// target, it will be displayed as is. You will need to also make sure that
  /// your IAM role provides access to paths in <code>Target</code>. The
  /// following is an example.
  ///
  /// <code>'[ "/bucket2/documentation", { "Entry": "your-personal-report.pdf",
  /// "Target": "/bucket3/customized-reports/${transfer:UserName}.pdf" }
  /// ]'</code>
  ///
  /// In most cases, you can use this value instead of the scope-down policy to
  /// lock your user down to the designated home directory ("chroot"). To do
  /// this, you can set <code>Entry</code> to '/' and set <code>Target</code> to
  /// the HomeDirectory parameter value.
  /// <note>
  /// If the target of a logical directory entry does not exist in Amazon S3,
  /// the entry will be ignored. As a workaround, you can use the Amazon S3 API
  /// to create 0 byte objects as place holders for your directory. If using the
  /// CLI, use the <code>s3api</code> call instead of <code>s3</code> so you can
  /// use the put-object operation. For example, you use the following:
  /// <code>aws s3api put-object --bucket bucketname --key
  /// path/to/folder/</code>. Make sure that the end of the key name ends in a /
  /// for it to be considered a folder.
  /// </note>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>,
  /// the user will see the absolute Amazon S3 bucket paths as is in their file
  /// transfer protocol clients. If you set it <code>LOGICAL</code>, you will
  /// need to provide mappings in the <code>HomeDirectoryMappings</code> for how
  /// you want to make Amazon S3 paths visible to your users.
  ///
  /// Parameter [policy] :
  /// Allows you to supply a scope-down policy for your user so you can use the
  /// same IAM role across multiple users. The policy scopes down user access to
  /// portions of your Amazon S3 bucket. Variables you can use inside this
  /// policy include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// For scope-down policies, AWS Transfer Family stores the policy as a JSON
  /// blob, instead of the Amazon Resource Name (ARN) of the policy. You save
  /// the policy as a JSON blob and pass it in the <code>Policy</code> argument.
  ///
  /// For an example of a scope-down policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/users.html#users-policies-scope-down">Creating
  /// a scope-down policy</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a>
  /// in the <i>AWS Security Token Service API Reference</i>.
  /// </note>
  ///
  /// Parameter [role] :
  /// The IAM role that controls your users' access to your Amazon S3 bucket.
  /// The policies attached to this role will determine the level of access you
  /// want to provide your users when transferring files into and out of your
  /// Amazon S3 bucket or buckets. The IAM role should also contain a trust
  /// relationship that allows the server to access your resources when
  /// servicing your users' transfer requests.
  Future<UpdateUserResponse> updateUser({
    @_s.required String serverId,
    @_s.required String userName,
    String homeDirectory,
    List<HomeDirectoryMapEntry> homeDirectoryMappings,
    HomeDirectoryType homeDirectoryType,
    String policy,
    String role,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverId',
      serverId,
      r'''^s-([0-9a-f]{17})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''^[\w][\w@.-]{2,99}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'homeDirectory',
      homeDirectory,
      0,
      1024,
    );
    _s.validateStringPattern(
      'homeDirectory',
      homeDirectory,
      r'''^$|/.*''',
    );
    _s.validateStringLength(
      'policy',
      policy,
      0,
      2048,
    );
    _s.validateStringLength(
      'role',
      role,
      20,
      2048,
    );
    _s.validateStringPattern(
      'role',
      role,
      r'''arn:.*role/.*''',
    );
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
          'HomeDirectoryType': homeDirectoryType.toValue(),
        if (policy != null) 'Policy': policy,
        if (role != null) 'Role': role,
      },
    );

    return UpdateUserResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateServerResponse {
  /// The service-assigned ID of the server that is created.
  @_s.JsonKey(name: 'ServerId')
  final String serverId;

  CreateServerResponse({
    @_s.required this.serverId,
  });
  factory CreateServerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateServerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserResponse {
  /// The ID of the server that the user is attached to.
  @_s.JsonKey(name: 'ServerId')
  final String serverId;

  /// A unique string that identifies a user account associated with a server.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  CreateUserResponse({
    @_s.required this.serverId,
    @_s.required this.userName,
  });
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSecurityPolicyResponse {
  /// An array containing the properties of the security policy.
  @_s.JsonKey(name: 'SecurityPolicy')
  final DescribedSecurityPolicy securityPolicy;

  DescribeSecurityPolicyResponse({
    @_s.required this.securityPolicy,
  });
  factory DescribeSecurityPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSecurityPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeServerResponse {
  /// An array containing the properties of a server with the
  /// <code>ServerID</code> you specified.
  @_s.JsonKey(name: 'Server')
  final DescribedServer server;

  DescribeServerResponse({
    @_s.required this.server,
  });
  factory DescribeServerResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeServerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserResponse {
  /// A system-assigned unique identifier for a server that has this user
  /// assigned.
  @_s.JsonKey(name: 'ServerId')
  final String serverId;

  /// An array containing the properties of the user account for the
  /// <code>ServerID</code> value that you specified.
  @_s.JsonKey(name: 'User')
  final DescribedUser user;

  DescribeUserResponse({
    @_s.required this.serverId,
    @_s.required this.user,
  });
  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserResponseFromJson(json);
}

/// Describes the properties of a security policy that was specified. For more
/// information about security policies, see <a
/// href="https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html">Working
/// with security policies</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribedSecurityPolicy {
  /// Specifies the name of the security policy that is attached to the server.
  @_s.JsonKey(name: 'SecurityPolicyName')
  final String securityPolicyName;

  /// Specifies whether this policy enables Federal Information Processing
  /// Standards (FIPS).
  @_s.JsonKey(name: 'Fips')
  final bool fips;

  /// Specifies the enabled Secure Shell (SSH) cipher encryption algorithms in the
  /// security policy that is attached to the server.
  @_s.JsonKey(name: 'SshCiphers')
  final List<String> sshCiphers;

  /// Specifies the enabled SSH key exchange (KEX) encryption algorithms in the
  /// security policy that is attached to the server.
  @_s.JsonKey(name: 'SshKexs')
  final List<String> sshKexs;

  /// Specifies the enabled SSH message authentication code (MAC) encryption
  /// algorithms in the security policy that is attached to the server.
  @_s.JsonKey(name: 'SshMacs')
  final List<String> sshMacs;

  /// Specifies the enabled Transport Layer Security (TLS) cipher encryption
  /// algorithms in the security policy that is attached to the server.
  @_s.JsonKey(name: 'TlsCiphers')
  final List<String> tlsCiphers;

  DescribedSecurityPolicy({
    @_s.required this.securityPolicyName,
    this.fips,
    this.sshCiphers,
    this.sshKexs,
    this.sshMacs,
    this.tlsCiphers,
  });
  factory DescribedSecurityPolicy.fromJson(Map<String, dynamic> json) =>
      _$DescribedSecurityPolicyFromJson(json);
}

/// Describes the properties of a file transfer protocol-enabled server that was
/// specified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribedServer {
  /// Specifies the unique Amazon Resource Name (ARN) of the server.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Specifies the ARN of the AWS Certificate Manager (ACM) certificate. Required
  /// when <code>Protocols</code> is set to <code>FTPS</code>.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// Specifies the virtual private cloud (VPC) endpoint settings that you
  /// configured for your server.
  @_s.JsonKey(name: 'EndpointDetails')
  final EndpointDetails endpointDetails;

  /// Defines the type of endpoint that your server is connected to. If your
  /// server is connected to a VPC endpoint, your server isn't accessible over the
  /// public internet.
  @_s.JsonKey(name: 'EndpointType')
  final EndpointType endpointType;

  /// Specifies the Base64-encoded SHA256 fingerprint of the server's host key.
  /// This value is equivalent to the output of the <code>ssh-keygen -l -f
  /// my-new-server-key</code> command.
  @_s.JsonKey(name: 'HostKeyFingerprint')
  final String hostKeyFingerprint;

  /// Specifies information to call a customer-supplied authentication API. This
  /// field is not populated when the <code>IdentityProviderType</code> of a
  /// server is <code>SERVICE_MANAGED</code>.
  @_s.JsonKey(name: 'IdentityProviderDetails')
  final IdentityProviderDetails identityProviderDetails;

  /// Specifies the mode of authentication method enabled for this service. A
  /// value of <code>SERVICE_MANAGED</code> means that you are using this server
  /// to store and access user credentials within the service. A value of
  /// <code>API_GATEWAY</code> indicates that you have integrated an API Gateway
  /// endpoint that will be invoked for authenticating your user into the service.
  @_s.JsonKey(name: 'IdentityProviderType')
  final IdentityProviderType identityProviderType;

  /// Specifies the AWS Identity and Access Management (IAM) role that allows a
  /// server to turn on Amazon CloudWatch logging for Amazon S3 events. When set,
  /// user activity can be viewed in your CloudWatch logs.
  @_s.JsonKey(name: 'LoggingRole')
  final String loggingRole;

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
  /// </ul>
  @_s.JsonKey(name: 'Protocols')
  final List<Protocol> protocols;

  /// Specifies the name of the security policy that is attached to the server.
  @_s.JsonKey(name: 'SecurityPolicyName')
  final String securityPolicyName;

  /// Specifies the unique system-assigned identifier for a server that you
  /// instantiate.
  @_s.JsonKey(name: 'ServerId')
  final String serverId;

  /// Specifies the condition of a server for the server that was described. A
  /// value of <code>ONLINE</code> indicates that the server can accept jobs and
  /// transfer files. A <code>State</code> value of <code>OFFLINE</code> means
  /// that the server cannot perform file transfer operations.
  ///
  /// The states of <code>STARTING</code> and <code>STOPPING</code> indicate that
  /// the server is in an intermediate state, either not fully able to respond, or
  /// not fully offline. The values of <code>START_FAILED</code> or
  /// <code>STOP_FAILED</code> can indicate an error condition.
  @_s.JsonKey(name: 'State')
  final State state;

  /// Specifies the key-value pairs that you can use to search for and group
  /// servers that were assigned to the server that was described.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// Specifies the number of users that are assigned to a server you specified
  /// with the <code>ServerId</code>.
  @_s.JsonKey(name: 'UserCount')
  final int userCount;

  DescribedServer({
    @_s.required this.arn,
    this.certificate,
    this.endpointDetails,
    this.endpointType,
    this.hostKeyFingerprint,
    this.identityProviderDetails,
    this.identityProviderType,
    this.loggingRole,
    this.protocols,
    this.securityPolicyName,
    this.serverId,
    this.state,
    this.tags,
    this.userCount,
  });
  factory DescribedServer.fromJson(Map<String, dynamic> json) =>
      _$DescribedServerFromJson(json);
}

/// Describes the properties of a user that was specified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribedUser {
  /// Specifies the unique Amazon Resource Name (ARN) for the user that was
  /// requested to be described.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Specifies the landing directory (or folder), which is the location that
  /// files are written to or read from in an Amazon S3 bucket, for the described
  /// user. An example is <i>
  /// <code>your-Amazon-S3-bucket-name&gt;/home/username</code> </i>.
  @_s.JsonKey(name: 'HomeDirectory')
  final String homeDirectory;

  /// Specifies the logical directory mappings that specify what Amazon S3 paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You will need to specify the "<code>Entry</code>" and
  /// "<code>Target</code>" pair, where <code>Entry</code> shows how the path is
  /// made visible and <code>Target</code> is the actual Amazon S3 path. If you
  /// only specify a target, it will be displayed as is. You will need to also
  /// make sure that your AWS Identity and Access Management (IAM) role provides
  /// access to paths in <code>Target</code>.
  ///
  /// In most cases, you can use this value instead of the scope-down policy to
  /// lock your user down to the designated home directory ("chroot"). To do this,
  /// you can set <code>Entry</code> to '/' and set <code>Target</code> to the
  /// HomeDirectory parameter value.
  @_s.JsonKey(name: 'HomeDirectoryMappings')
  final List<HomeDirectoryMapEntry> homeDirectoryMappings;

  /// Specifies the type of landing directory (folder) you mapped for your users
  /// to see when they log into the file transfer protocol-enabled server. If you
  /// set it to <code>PATH</code>, the user will see the absolute Amazon S3 bucket
  /// paths as is in their file transfer protocol clients. If you set it
  /// <code>LOGICAL</code>, you will need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 paths
  /// visible to your users.
  @_s.JsonKey(name: 'HomeDirectoryType')
  final HomeDirectoryType homeDirectoryType;

  /// Specifies the name of the policy in use for the described user.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  /// Specifies the IAM role that controls your users' access to your Amazon S3
  /// bucket. The policies attached to this role will determine the level of
  /// access you want to provide your users when transferring files into and out
  /// of your Amazon S3 bucket or buckets. The IAM role should also contain a
  /// trust relationship that allows a server to access your resources when
  /// servicing your users' transfer requests.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// Specifies the public key portion of the Secure Shell (SSH) keys stored for
  /// the described user.
  @_s.JsonKey(name: 'SshPublicKeys')
  final List<SshPublicKey> sshPublicKeys;

  /// Specifies the key-value pairs for the user requested. Tag can be used to
  /// search for and group users for a variety of purposes.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// Specifies the name of the user that was requested to be described. User
  /// names are used for authentication purposes. This is the string that will be
  /// used by your user when they log in to your server.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  DescribedUser({
    @_s.required this.arn,
    this.homeDirectory,
    this.homeDirectoryMappings,
    this.homeDirectoryType,
    this.policy,
    this.role,
    this.sshPublicKeys,
    this.tags,
    this.userName,
  });
  factory DescribedUser.fromJson(Map<String, dynamic> json) =>
      _$DescribedUserFromJson(json);
}

/// The virtual private cloud (VPC) endpoint settings that are configured for
/// your file transfer protocol-enabled server. With a VPC endpoint, you can
/// restrict access to your server and resources only within your VPC. To
/// control incoming internet traffic, invoke the <code>UpdateServer</code> API
/// and attach an Elastic IP to your server's endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EndpointDetails {
  /// A list of address allocation IDs that are required to attach an Elastic IP
  /// address to your server's endpoint.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC</code> and it is only valid in the <code>UpdateServer</code> API.
  /// </note>
  @_s.JsonKey(name: 'AddressAllocationIds')
  final List<String> addressAllocationIds;

  /// A list of security groups IDs that are available to attach to your server's
  /// endpoint.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC</code>.
  ///
  /// You can only edit the <code>SecurityGroupIds</code> property in the
  /// <code>UpdateServer</code> API and only if you are changing the
  /// <code>EndpointType</code> from <code>PUBLIC</code> or
  /// <code>VPC_ENDPOINT</code> to <code>VPC</code>.
  /// </note>
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// A list of subnet IDs that are required to host your server endpoint in your
  /// VPC.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC</code>.
  /// </note>
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The ID of the VPC endpoint.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC_ENDPOINT</code>.
  /// </note>
  @_s.JsonKey(name: 'VpcEndpointId')
  final String vpcEndpointId;

  /// The VPC ID of the VPC in which a server's endpoint will be hosted.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC</code>.
  /// </note>
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  EndpointDetails({
    this.addressAllocationIds,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcEndpointId,
    this.vpcId,
  });
  factory EndpointDetails.fromJson(Map<String, dynamic> json) =>
      _$EndpointDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointDetailsToJson(this);
}

enum EndpointType {
  @_s.JsonValue('PUBLIC')
  public,
  @_s.JsonValue('VPC')
  vpc,
  @_s.JsonValue('VPC_ENDPOINT')
  vpcEndpoint,
}

extension on EndpointType {
  String toValue() {
    switch (this) {
      case EndpointType.public:
        return 'PUBLIC';
      case EndpointType.vpc:
        return 'VPC';
      case EndpointType.vpcEndpoint:
        return 'VPC_ENDPOINT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents an object that contains entries and targets for
/// <code>HomeDirectoryMappings</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HomeDirectoryMapEntry {
  /// Represents an entry and a target for <code>HomeDirectoryMappings</code>.
  @_s.JsonKey(name: 'Entry')
  final String entry;

  /// Represents the map target that is used in a
  /// <code>HomeDirectorymapEntry</code>.
  @_s.JsonKey(name: 'Target')
  final String target;

  HomeDirectoryMapEntry({
    @_s.required this.entry,
    @_s.required this.target,
  });
  factory HomeDirectoryMapEntry.fromJson(Map<String, dynamic> json) =>
      _$HomeDirectoryMapEntryFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDirectoryMapEntryToJson(this);
}

enum HomeDirectoryType {
  @_s.JsonValue('PATH')
  path,
  @_s.JsonValue('LOGICAL')
  logical,
}

extension on HomeDirectoryType {
  String toValue() {
    switch (this) {
      case HomeDirectoryType.path:
        return 'PATH';
      case HomeDirectoryType.logical:
        return 'LOGICAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Returns information related to the type of user authentication that is in
/// use for a file transfer protocol-enabled server's users. A server can have
/// only one method of authentication.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IdentityProviderDetails {
  /// Provides the type of <code>InvocationRole</code> used to authenticate the
  /// user account.
  @_s.JsonKey(name: 'InvocationRole')
  final String invocationRole;

  /// Provides the location of the service endpoint used to authenticate users.
  @_s.JsonKey(name: 'Url')
  final String url;

  IdentityProviderDetails({
    this.invocationRole,
    this.url,
  });
  factory IdentityProviderDetails.fromJson(Map<String, dynamic> json) =>
      _$IdentityProviderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityProviderDetailsToJson(this);
}

/// Returns information related to the type of user authentication that is in
/// use for a file transfer protocol-enabled server's users. For
/// <code>SERVICE_MANAGED</code> authentication, the Secure Shell (SSH) public
/// keys are stored with a user on the server instance. For
/// <code>API_GATEWAY</code> authentication, your custom authentication method
/// is implemented by using an API call. The server can have only one method of
/// authentication.
enum IdentityProviderType {
  @_s.JsonValue('SERVICE_MANAGED')
  serviceManaged,
  @_s.JsonValue('API_GATEWAY')
  apiGateway,
}

extension on IdentityProviderType {
  String toValue() {
    switch (this) {
      case IdentityProviderType.serviceManaged:
        return 'SERVICE_MANAGED';
      case IdentityProviderType.apiGateway:
        return 'API_GATEWAY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Identifies the user, the server they belong to, and the identifier of the
/// SSH public key associated with that user. A user can have more than one key
/// on each server that they are associated with.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportSshPublicKeyResponse {
  /// A system-assigned unique identifier for a server.
  @_s.JsonKey(name: 'ServerId')
  final String serverId;

  /// The name given to a public key by the system that was imported.
  @_s.JsonKey(name: 'SshPublicKeyId')
  final String sshPublicKeyId;

  /// A user name assigned to the <code>ServerID</code> value that you specified.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  ImportSshPublicKeyResponse({
    @_s.required this.serverId,
    @_s.required this.sshPublicKeyId,
    @_s.required this.userName,
  });
  factory ImportSshPublicKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportSshPublicKeyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSecurityPoliciesResponse {
  /// An array of security policies that were listed.
  @_s.JsonKey(name: 'SecurityPolicyNames')
  final List<String> securityPolicyNames;

  /// When you can get additional results from the
  /// <code>ListSecurityPolicies</code> operation, a <code>NextToken</code>
  /// parameter is returned in the output. In a following command, you can pass in
  /// the <code>NextToken</code> parameter to continue listing security policies.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListSecurityPoliciesResponse({
    @_s.required this.securityPolicyNames,
    this.nextToken,
  });
  factory ListSecurityPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSecurityPoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListServersResponse {
  /// An array of servers that were listed.
  @_s.JsonKey(name: 'Servers')
  final List<ListedServer> servers;

  /// When you can get additional results from the <code>ListServers</code>
  /// operation, a <code>NextToken</code> parameter is returned in the output. In
  /// a following command, you can pass in the <code>NextToken</code> parameter to
  /// continue listing additional servers.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListServersResponse({
    @_s.required this.servers,
    this.nextToken,
  });
  factory ListServersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListServersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The ARN you specified to list the tags of.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// When you can get additional results from the
  /// <code>ListTagsForResource</code> call, a <code>NextToken</code> parameter is
  /// returned in the output. You can then pass in a subsequent command to the
  /// <code>NextToken</code> parameter to continue listing additional tags.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Key-value pairs that are assigned to a resource, usually for the purpose of
  /// grouping and searching for items. Tags are metadata that you define.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.arn,
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersResponse {
  /// A system-assigned unique identifier for a server that the users are assigned
  /// to.
  @_s.JsonKey(name: 'ServerId')
  final String serverId;

  /// Returns the user accounts and their properties for the <code>ServerId</code>
  /// value that you specify.
  @_s.JsonKey(name: 'Users')
  final List<ListedUser> users;

  /// When you can get additional results from the <code>ListUsers</code> call, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass in a subsequent command to the <code>NextToken</code> parameter to
  /// continue listing additional users.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListUsersResponse({
    @_s.required this.serverId,
    @_s.required this.users,
    this.nextToken,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersResponseFromJson(json);
}

/// Returns properties of a file transfer protocol-enabled server that was
/// specified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListedServer {
  /// Specifies the unique Amazon Resource Name (ARN) for a server to be listed.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Specifies the type of VPC endpoint that your server is connected to. If your
  /// server is connected to a VPC endpoint, your server isn't accessible over the
  /// public internet.
  @_s.JsonKey(name: 'EndpointType')
  final EndpointType endpointType;

  /// Specifies the authentication method used to validate a user for a server
  /// that was specified. This can include Secure Shell (SSH), user name and
  /// password combinations, or your own custom authentication method. Valid
  /// values include <code>SERVICE_MANAGED</code> or <code>API_GATEWAY</code>.
  @_s.JsonKey(name: 'IdentityProviderType')
  final IdentityProviderType identityProviderType;

  /// Specifies the AWS Identity and Access Management (IAM) role that allows a
  /// server to turn on Amazon CloudWatch logging.
  @_s.JsonKey(name: 'LoggingRole')
  final String loggingRole;

  /// Specifies the unique system assigned identifier for the servers that were
  /// listed.
  @_s.JsonKey(name: 'ServerId')
  final String serverId;

  /// Specifies the condition of a server for the server that was described. A
  /// value of <code>ONLINE</code> indicates that the server can accept jobs and
  /// transfer files. A <code>State</code> value of <code>OFFLINE</code> means
  /// that the server cannot perform file transfer operations.
  ///
  /// The states of <code>STARTING</code> and <code>STOPPING</code> indicate that
  /// the server is in an intermediate state, either not fully able to respond, or
  /// not fully offline. The values of <code>START_FAILED</code> or
  /// <code>STOP_FAILED</code> can indicate an error condition.
  @_s.JsonKey(name: 'State')
  final State state;

  /// Specifies the number of users that are assigned to a server you specified
  /// with the <code>ServerId</code>.
  @_s.JsonKey(name: 'UserCount')
  final int userCount;

  ListedServer({
    @_s.required this.arn,
    this.endpointType,
    this.identityProviderType,
    this.loggingRole,
    this.serverId,
    this.state,
    this.userCount,
  });
  factory ListedServer.fromJson(Map<String, dynamic> json) =>
      _$ListedServerFromJson(json);
}

/// Returns properties of the user that you specify.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListedUser {
  /// Provides the unique Amazon Resource Name (ARN) for the user that you want to
  /// learn about.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Specifies the location that files are written to or read from an Amazon S3
  /// bucket for the user you specify by their ARN.
  @_s.JsonKey(name: 'HomeDirectory')
  final String homeDirectory;

  /// Specifies the type of landing directory (folder) you mapped for your users'
  /// home directory. If you set it to <code>PATH</code>, the user will see the
  /// absolute Amazon S3 bucket paths as is in their file transfer protocol
  /// clients. If you set it <code>LOGICAL</code>, you will need to provide
  /// mappings in the <code>HomeDirectoryMappings</code> for how you want to make
  /// Amazon S3 paths visible to your users.
  @_s.JsonKey(name: 'HomeDirectoryType')
  final HomeDirectoryType homeDirectoryType;

  /// Specifies the role that is in use by this user. A <i>role</i> is an AWS
  /// Identity and Access Management (IAM) entity that, in this case, allows a
  /// file transfer protocol-enabled server to act on a user's behalf. It allows
  /// the server to inherit the trust relationship that enables that user to
  /// perform file operations to their Amazon S3 bucket.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// Specifies the number of SSH public keys stored for the user you specified.
  @_s.JsonKey(name: 'SshPublicKeyCount')
  final int sshPublicKeyCount;

  /// Specifies the name of the user whose ARN was specified. User names are used
  /// for authentication purposes.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  ListedUser({
    @_s.required this.arn,
    this.homeDirectory,
    this.homeDirectoryType,
    this.role,
    this.sshPublicKeyCount,
    this.userName,
  });
  factory ListedUser.fromJson(Map<String, dynamic> json) =>
      _$ListedUserFromJson(json);
}

enum Protocol {
  @_s.JsonValue('SFTP')
  sftp,
  @_s.JsonValue('FTP')
  ftp,
  @_s.JsonValue('FTPS')
  ftps,
}

extension on Protocol {
  String toValue() {
    switch (this) {
      case Protocol.sftp:
        return 'SFTP';
      case Protocol.ftp:
        return 'FTP';
      case Protocol.ftps:
        return 'FTPS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides information about the public Secure Shell (SSH) key that is
/// associated with a user account for the specific file transfer
/// protocol-enabled server (as identified by <code>ServerId</code>). The
/// information returned includes the date the key was imported, the public key
/// contents, and the public key ID. A user can store more than one SSH public
/// key associated with their user name on a specific server.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SshPublicKey {
  /// Specifies the date that the public key was added to the user account.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DateImported')
  final DateTime dateImported;

  /// Specifies the content of the SSH public key as specified by the
  /// <code>PublicKeyId</code>.
  @_s.JsonKey(name: 'SshPublicKeyBody')
  final String sshPublicKeyBody;

  /// Specifies the <code>SshPublicKeyId</code> parameter contains the identifier
  /// of the public key.
  @_s.JsonKey(name: 'SshPublicKeyId')
  final String sshPublicKeyId;

  SshPublicKey({
    @_s.required this.dateImported,
    @_s.required this.sshPublicKeyBody,
    @_s.required this.sshPublicKeyId,
  });
  factory SshPublicKey.fromJson(Map<String, dynamic> json) =>
      _$SshPublicKeyFromJson(json);
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
enum State {
  @_s.JsonValue('OFFLINE')
  offline,
  @_s.JsonValue('ONLINE')
  online,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('START_FAILED')
  startFailed,
  @_s.JsonValue('STOP_FAILED')
  stopFailed,
}

/// Creates a key-value pair for a specific resource. Tags are metadata that you
/// can use to search for and group a resource for various purposes. You can
/// apply tags to servers, users, and roles. A tag key can take more than one
/// value. For example, to group servers for accounting purposes, you might
/// create a tag called <code>Group</code> and assign the values
/// <code>Research</code> and <code>Accounting</code> to that group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The name assigned to the tag that you create.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Contains one or more values that you assigned to the key name you create.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestIdentityProviderResponse {
  /// The HTTP status code that is the response from your API Gateway.
  @_s.JsonKey(name: 'StatusCode')
  final int statusCode;

  /// The endpoint of the service used to authenticate a user.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// A message that indicates whether the test was successful or not.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The response that is returned from your API Gateway.
  @_s.JsonKey(name: 'Response')
  final String response;

  TestIdentityProviderResponse({
    @_s.required this.statusCode,
    @_s.required this.url,
    this.message,
    this.response,
  });
  factory TestIdentityProviderResponse.fromJson(Map<String, dynamic> json) =>
      _$TestIdentityProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateServerResponse {
  /// A system-assigned unique identifier for a server that the user account is
  /// assigned to.
  @_s.JsonKey(name: 'ServerId')
  final String serverId;

  UpdateServerResponse({
    @_s.required this.serverId,
  });
  factory UpdateServerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateServerResponseFromJson(json);
}

/// <code>UpdateUserResponse</code> returns the user name and identifier for the
/// request to update a user's properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserResponse {
  /// A system-assigned unique identifier for a server instance that the user
  /// account is assigned to.
  @_s.JsonKey(name: 'ServerId')
  final String serverId;

  /// The unique identifier for a user that is assigned to a server instance that
  /// was specified in the request.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  UpdateUserResponse({
    @_s.required this.serverId,
    @_s.required this.userName,
  });
  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String type, String message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String type, String message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
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
