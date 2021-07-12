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

/// Amazon Web Services Transfer Family is a fully managed service that enables
/// the transfer of files over the File Transfer Protocol (FTP), File Transfer
/// Protocol over SSL (FTPS), or Secure Shell (SSH) File Transfer Protocol
/// (SFTP) directly into and out of Amazon Simple Storage Service (Amazon S3).
/// Amazon Web Services helps you seamlessly migrate your file transfer
/// workflows to Amazon Web Services Transfer Family by integrating with
/// existing authentication systems, and providing DNS routing with Amazon Route
/// 53 so nothing changes for your customers and partners, or their
/// applications. With your data in Amazon S3, you can use it with Amazon Web
/// Services services for processing, analytics, machine learning, and
/// archiving. Getting started with Amazon Web Services Transfer Family is easy
/// since there is no infrastructure to buy and set up.
class Transfer {
  final _s.JsonProtocol _protocol;
  Transfer({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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

  /// Used by administrators to choose which groups in the directory should have
  /// access to upload and download files over the enabled protocols using
  /// Amazon Web Services Transfer Family. For example, a Microsoft Active
  /// Directory might contain 50,000 users, but only a small fraction might need
  /// the ability to transfer files to the server. An administrator can use
  /// <code>CreateAccess</code> to limit the access to the correct set of users
  /// who need this ability.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [externalId] :
  /// A unique identifier that is required to identify specific groups within
  /// your directory. The users of the group that you associate have access to
  /// your Amazon S3 or Amazon EFS resources over the enabled protocols using
  /// Amazon Web Services Transfer Family. If you know the group name, you can
  /// view the SID values by running the following command using Windows
  /// PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of uppercase and lowercase alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// Parameter [role] :
  /// Specifies the Amazon Resource Name (ARN) of the IAM role that controls
  /// your users' access to your Amazon S3 bucket or EFS file system. The
  /// policies attached to this role determine the level of access that you want
  /// to provide your users when transferring files into and out of your Amazon
  /// S3 bucket or EFS file system. The IAM role should also contain a trust
  /// relationship that allows the server to access your resources when
  /// servicing your users' transfer requests.
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
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you
  /// only specify a target, it is displayed as is. You also must ensure that
  /// your Amazon Web Services Identity and Access Management (IAM) role
  /// provides access to paths in <code>Target</code>. This value can only be
  /// set when <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example.
  ///
  /// <code>[ { "Entry": "your-personal-report.pdf", "Target":
  /// "/bucket3/customized-reports/${transfer:UserName}.pdf" } ]</code>
  ///
  /// In most cases, you can use this value instead of the scope-down policy to
  /// lock down your user to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to
  /// <code>/</code> and set <code>Target</code> to the
  /// <code>HomeDirectory</code> parameter value.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example for <code>chroot</code>.
  ///
  /// <code>[ { "Entry:": "/", "Target": "/bucket_name/home/mydirectory" }
  /// ]</code>
  /// <note>
  /// If the target of a logical directory entry does not exist in Amazon S3 or
  /// EFS, the entry is ignored. As a workaround, you can use the Amazon S3 API
  /// or EFS API to create 0 byte objects as place holders for your directory.
  /// If using the CLI, use the <code>s3api</code> or <code>efsapi</code> call
  /// instead of <code>s3</code> or <code>efs</code> so you can use the
  /// put-object operation. For example, you use the following: <code>aws s3api
  /// put-object --bucket bucketname --key path/to/folder/</code>. Make sure
  /// that the end of the key name ends in a <code>/</code> for it to be
  /// considered a folder.
  /// </note>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>,
  /// the user will see the absolute Amazon S3 bucket or EFS paths as is in
  /// their file transfer protocol clients. If you set it <code>LOGICAL</code>,
  /// you will need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// EFS paths visible to your users.
  ///
  /// Parameter [policy] :
  /// A scope-down policy for your user so that you can use the same IAM role
  /// across multiple users. This policy scopes down user access to portions of
  /// their Amazon S3 bucket. Variables that you can use inside this policy
  /// include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// This only applies when domain of <code>ServerId</code> is S3. Amazon EFS
  /// does not use scope-down policies.
  ///
  /// For scope-down policies, Amazon Web Services Transfer Family stores the
  /// policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the
  /// policy. You save the policy as a JSON blob and pass it in the
  /// <code>Policy</code> argument.
  ///
  /// For an example of a scope-down policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/scope-down-policy.html">Example
  /// scope-down policy</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a>
  /// in the <i>Amazon Web Services Security Token Service API Reference</i>.
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
    ArgumentError.checkNotNull(externalId, 'externalId');
    _s.validateStringLength(
      'externalId',
      externalId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'role',
      role,
      20,
      2048,
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
    _s.validateStringLength(
      'homeDirectory',
      homeDirectory,
      0,
      1024,
    );
    _s.validateStringLength(
      'policy',
      policy,
      0,
      2048,
    );
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
          'HomeDirectoryType': homeDirectoryType.toValue(),
        if (policy != null) 'Policy': policy,
        if (posixProfile != null) 'PosixProfile': posixProfile,
      },
    );

    return CreateAccessResponse.fromJson(jsonResponse.body);
  }

  /// Instantiates an auto-scaling virtual server based on the selected file
  /// transfer protocol in Amazon Web Services. When you make updates to your
  /// file transfer protocol-enabled server or when you work with users, use the
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
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Certificate
  /// Manager (ACM) certificate. Required when <code>Protocols</code> is set to
  /// <code>FTPS</code>.
  ///
  /// To request a new public certificate, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html">Request
  /// a public certificate</a> in the <i> Amazon Web Services Certificate
  /// Manager User Guide</i>.
  ///
  /// To import an existing certificate into ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// certificates into ACM</a> in the <i> Amazon Web Services Certificate
  /// Manager User Guide</i>.
  ///
  /// To request a private certificate to use FTPS through private IP addresses,
  /// see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-private.html">Request
  /// a private certificate</a> in the <i> Amazon Web Services Certificate
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
  /// your server. When you host your endpoint within your VPC, you can make it
  /// accessible only to resources within your VPC, or you can attach Elastic IP
  /// addresses and make it accessible to clients over the internet. Your VPC's
  /// default security groups are automatically assigned to your endpoint.
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
  /// The RSA private key as generated by the <code>ssh-keygen -N "" -m PEM -f
  /// my-new-server-key</code> command.
  /// <important>
  /// If you aren't planning to migrate existing users from an existing
  /// SFTP-enabled server to a new server, don't update the host key.
  /// Accidentally changing a server's host key can be disruptive.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key">Change
  /// the host key for your SFTP-enabled server</a> in the <i>Amazon Web
  /// Services Transfer Family User Guide</i>.
  ///
  /// Parameter [identityProviderDetails] :
  /// Required when <code>IdentityProviderType</code> is set to
  /// <code>AWS_DIRECTORY_SERVICE</code> or <code>API_GATEWAY</code>. Accepts an
  /// array containing all of the information required to use a directory in
  /// <code>AWS_DIRECTORY_SERVICE</code> or invoke a customer-supplied
  /// authentication API, including the API Gateway URL. Not required when
  /// <code>IdentityProviderType</code> is set to <code>SERVICE_MANAGED</code>.
  ///
  /// Parameter [identityProviderType] :
  /// Specifies the mode of authentication for a server. The default value is
  /// <code>SERVICE_MANAGED</code>, which allows you to store and access user
  /// credentials within the Amazon Web Services Transfer Family service.
  ///
  /// Use <code>AWS_DIRECTORY_SERVICE</code> to provide access to Active
  /// Directory groups in Amazon Web Services Managed Active Directory or
  /// Microsoft Active Directory in your on-premises environment or in Amazon
  /// Web Services using AD Connectors. This option also requires you to provide
  /// a Directory ID using the <code>IdentityProviderDetails</code> parameter.
  ///
  /// Use the <code>API_GATEWAY</code> value to integrate with an identity
  /// provider of your choosing. The <code>API_GATEWAY</code> setting requires
  /// you to provide an API Gateway endpoint URL to call for authentication
  /// using the <code>IdentityProviderDetails</code> parameter.
  ///
  /// Parameter [loggingRole] :
  /// Specifies the Amazon Resource Name (ARN) of the Amazon Web Services
  /// Identity and Access Management (IAM) role that allows a server to turn on
  /// Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. When set,
  /// user activity can be viewed in your CloudWatch logs.
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
  /// Amazon Web Services Certificate Manager (ACM) which is used to identify
  /// your server when clients connect to it over FTPS.
  ///
  /// If <code>Protocol</code> includes either <code>FTP</code> or
  /// <code>FTPS</code>, then the <code>EndpointType</code> must be
  /// <code>VPC</code> and the <code>IdentityProviderType</code> must be
  /// <code>AWS_DIRECTORY_SERVICE</code> or <code>API_GATEWAY</code>.
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
    String? certificate,
    Domain? domain,
    EndpointDetails? endpointDetails,
    EndpointType? endpointType,
    String? hostKey,
    IdentityProviderDetails? identityProviderDetails,
    IdentityProviderType? identityProviderType,
    String? loggingRole,
    List<Protocol>? protocols,
    String? securityPolicyName,
    List<Tag>? tags,
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
    _s.validateStringLength(
      'securityPolicyName',
      securityPolicyName,
      0,
      100,
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
        if (domain != null) 'Domain': domain.toValue(),
        if (endpointDetails != null) 'EndpointDetails': endpointDetails,
        if (endpointType != null) 'EndpointType': endpointType.toValue(),
        if (hostKey != null) 'HostKey': hostKey,
        if (identityProviderDetails != null)
          'IdentityProviderDetails': identityProviderDetails,
        if (identityProviderType != null)
          'IdentityProviderType': identityProviderType.toValue(),
        if (loggingRole != null) 'LoggingRole': loggingRole,
        if (protocols != null)
          'Protocols': protocols.map((e) => e.toValue()).toList(),
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
  /// directory, store the user's public key, and assign the user's Amazon Web
  /// Services Identity and Access Management (IAM) role. You can also
  /// optionally add a scope-down policy, and assign metadata with tags that can
  /// be used to group and search for users.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [role] :
  /// Specifies the Amazon Resource Name (ARN) of the IAM role that controls
  /// your users' access to your Amazon S3 bucket or EFS file system. The
  /// policies attached to this role determine the level of access that you want
  /// to provide your users when transferring files into and out of your Amazon
  /// S3 bucket or EFS file system. The IAM role should also contain a trust
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
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you
  /// only specify a target, it is displayed as is. You also must ensure that
  /// your Amazon Web Services Identity and Access Management (IAM) role
  /// provides access to paths in <code>Target</code>. This value can only be
  /// set when <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example.
  ///
  /// <code>[ { "Entry": "your-personal-report.pdf", "Target":
  /// "/bucket3/customized-reports/${transfer:UserName}.pdf" } ]</code>
  ///
  /// In most cases, you can use this value instead of the scope-down policy to
  /// lock your user down to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to
  /// <code>/</code> and set <code>Target</code> to the HomeDirectory parameter
  /// value.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example for <code>chroot</code>.
  ///
  /// <code>[ { "Entry:": "/", "Target": "/bucket_name/home/mydirectory" }
  /// ]</code>
  /// <note>
  /// If the target of a logical directory entry does not exist in Amazon S3 or
  /// EFS, the entry is ignored. As a workaround, you can use the Amazon S3 API
  /// or EFS API to create 0 byte objects as place holders for your directory.
  /// If using the CLI, use the <code>s3api</code> or <code>efsapi</code> call
  /// instead of <code>s3</code> or <code>efs</code> so you can use the
  /// put-object operation. For example, you use the following: <code>aws s3api
  /// put-object --bucket bucketname --key path/to/folder/</code>. Make sure
  /// that the end of the key name ends in a <code>/</code> for it to be
  /// considered a folder.
  /// </note>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>,
  /// the user will see the absolute Amazon S3 bucket or EFS paths as is in
  /// their file transfer protocol clients. If you set it <code>LOGICAL</code>,
  /// you will need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// EFS paths visible to your users.
  ///
  /// Parameter [policy] :
  /// A scope-down policy for your user so that you can use the same IAM role
  /// across multiple users. This policy scopes down user access to portions of
  /// their Amazon S3 bucket. Variables that you can use inside this policy
  /// include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// This only applies when domain of ServerId is S3. EFS does not use scope
  /// down policy.
  ///
  /// For scope-down policies, Amazon Web Services Transfer Family stores the
  /// policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the
  /// policy. You save the policy as a JSON blob and pass it in the
  /// <code>Policy</code> argument.
  ///
  /// For an example of a scope-down policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/scope-down-policy.html">Example
  /// scope-down policy</a>.
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
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'role',
      role,
      20,
      2048,
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
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'homeDirectory',
      homeDirectory,
      0,
      1024,
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
        if (posixProfile != null) 'PosixProfile': posixProfile,
        if (sshPublicKeyBody != null) 'SshPublicKeyBody': sshPublicKeyBody,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Allows you to delete the access specified in the <code>ServerID</code> and
  /// <code>ExternalID</code> parameters.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [externalId] :
  /// A unique identifier that is required to identify specific groups within
  /// your directory. The users of the group that you associate have access to
  /// your Amazon S3 or Amazon EFS resources over the enabled protocols using
  /// Amazon Web Services Transfer Family. If you know the group name, you can
  /// view the SID values by running the following command using Windows
  /// PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of uppercase and lowercase alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that has this user
  /// assigned.
  Future<void> deleteAccess({
    required String externalId,
    required String serverId,
  }) async {
    ArgumentError.checkNotNull(externalId, 'externalId');
    _s.validateStringLength(
      'externalId',
      externalId,
      1,
      256,
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
    required String serverId,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
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
    required String serverId,
    required String sshPublicKeyId,
    required String userName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
      isRequired: true,
    );
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
    required String serverId,
    required String userName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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

  /// Describes the access that is assigned to the specific file transfer
  /// protocol-enabled server, as identified by its <code>ServerId</code>
  /// property and its <code>ExternalID</code>.
  ///
  /// The response from this call returns the properties of the access that is
  /// associated with the <code>ServerId</code> value that was specified.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [externalId] :
  /// A unique identifier that is required to identify specific groups within
  /// your directory. The users of the group that you associate have access to
  /// your Amazon S3 or Amazon EFS resources over the enabled protocols using
  /// Amazon Web Services Transfer Family. If you know the group name, you can
  /// view the SID values by running the following command using Windows
  /// PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of uppercase and lowercase alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// Parameter [serverId] :
  /// A system-assigned unique identifier for a server that has this access
  /// assigned.
  Future<DescribeAccessResponse> describeAccess({
    required String externalId,
    required String serverId,
  }) async {
    ArgumentError.checkNotNull(externalId, 'externalId');
    _s.validateStringLength(
      'externalId',
      externalId,
      1,
      256,
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
    required String securityPolicyName,
  }) async {
    ArgumentError.checkNotNull(securityPolicyName, 'securityPolicyName');
    _s.validateStringLength(
      'securityPolicyName',
      securityPolicyName,
      0,
      100,
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
    required String serverId,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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
  /// of the sign-in credentials to use the Amazon Web Services Transfer Family
  /// service and perform file transfer tasks.
  Future<DescribeUserResponse> describeUser({
    required String serverId,
    required String userName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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
    required String serverId,
    required String sshPublicKeyBody,
    required String userName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      3,
      100,
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

  /// Lists the details for all the accesses you have on your server.
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
  /// Specifies the maximum number of access SIDs to return.
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
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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
    int? maxResults,
    String? nextToken,
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
  /// your Amazon Web Services account.
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
    int? maxResults,
    String? nextToken,
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

  /// Lists all of the tags associated with the Amazon Resource Name (ARN) that
  /// you specify. The resource can be a user, server, or role.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidRequestException].
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
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      20,
      1600,
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
    required String serverId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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
    required String serverId,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
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
    required String serverId,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
      isRequired: true,
    );
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
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// An Amazon Resource Name (ARN) for a specific Amazon Web Services resource,
  /// such as a server, user, or role.
  ///
  /// Parameter [tags] :
  /// Key-value pairs assigned to ARNs that you can use to group and search for
  /// resources by type. You can attach this metadata to user accounts for any
  /// purpose.
  Future<void> tagResource({
    required String arn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      20,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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

  /// If the <code>IdentityProviderType</code> of a file transfer
  /// protocol-enabled server is <code>AWS_DIRECTORY_SERVICE</code> or
  /// <code>API_Gateway</code>, tests whether your identity provider is set up
  /// successfully. We highly recommend that you call this operation to test
  /// your authentication method as soon as you create your server. By doing so,
  /// you can troubleshoot issues with the identity provider integration to
  /// ensure that your users can successfully use the service.
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
    required String serverId,
    required String userName,
    Protocol? serverProtocol,
    String? sourceIp,
    String? userPassword,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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
    _s.validateStringLength(
      'sourceIp',
      sourceIp,
      0,
      32,
    );
    _s.validateStringLength(
      'userPassword',
      userPassword,
      0,
      1024,
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
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      20,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [externalId] :
  /// A unique identifier that is required to identify specific groups within
  /// your directory. The users of the group that you associate have access to
  /// your Amazon S3 or Amazon EFS resources over the enabled protocols using
  /// Amazon Web Services Transfer Family. If you know the group name, you can
  /// view the SID values by running the following command using Windows
  /// PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of uppercase and lowercase alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
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
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you
  /// only specify a target, it is displayed as is. You also must ensure that
  /// your Amazon Web Services Identity and Access Management (IAM) role
  /// provides access to paths in <code>Target</code>. This value can only be
  /// set when <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example.
  ///
  /// <code>[ { "Entry": "your-personal-report.pdf", "Target":
  /// "/bucket3/customized-reports/${transfer:UserName}.pdf" } ]</code>
  ///
  /// In most cases, you can use this value instead of the scope-down policy to
  /// lock down your user to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to
  /// <code>/</code> and set <code>Target</code> to the
  /// <code>HomeDirectory</code> parameter value.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example for <code>chroot</code>.
  ///
  /// <code>[ { "Entry:": "/", "Target": "/bucket_name/home/mydirectory" }
  /// ]</code>
  /// <note>
  /// If the target of a logical directory entry does not exist in Amazon S3 or
  /// EFS, the entry is ignored. As a workaround, you can use the Amazon S3 API
  /// or EFS API to create 0 byte objects as place holders for your directory.
  /// If using the CLI, use the <code>s3api</code> or <code>efsapi</code> call
  /// instead of <code>s3</code> or <code>efs</code> so you can use the
  /// put-object operation. For example, you use the following: <code>aws s3api
  /// put-object --bucket bucketname --key path/to/folder/</code>. Make sure
  /// that the end of the key name ends in a <code>/</code> for it to be
  /// considered a folder.
  /// </note>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>,
  /// the user will see the absolute Amazon S3 bucket or EFS paths as is in
  /// their file transfer protocol clients. If you set it <code>LOGICAL</code>,
  /// you will need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// EFS paths visible to your users.
  ///
  /// Parameter [policy] :
  /// A scope-down policy for your user so that you can use the same IAM role
  /// across multiple users. This policy scopes down user access to portions of
  /// their Amazon S3 bucket. Variables that you can use inside this policy
  /// include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// This only applies when domain of <code>ServerId</code> is S3. Amazon EFS
  /// does not use scope down policy.
  ///
  /// For scope-down policies, Amazon Web ServicesTransfer Family stores the
  /// policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the
  /// policy. You save the policy as a JSON blob and pass it in the
  /// <code>Policy</code> argument.
  ///
  /// For an example of a scope-down policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/scope-down-policy.html">Example
  /// scope-down policy</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a>
  /// in the <i>Amazon Web ServicesSecurity Token Service API Reference</i>.
  /// </note>
  ///
  /// Parameter [role] :
  /// Specifies the Amazon Resource Name (ARN) of the IAM role that controls
  /// your users' access to your Amazon S3 bucket or EFS file system. The
  /// policies attached to this role determine the level of access that you want
  /// to provide your users when transferring files into and out of your Amazon
  /// S3 bucket or EFS file system. The IAM role should also contain a trust
  /// relationship that allows the server to access your resources when
  /// servicing your users' transfer requests.
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
    ArgumentError.checkNotNull(externalId, 'externalId');
    _s.validateStringLength(
      'externalId',
      externalId,
      1,
      256,
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
    _s.validateStringLength(
      'homeDirectory',
      homeDirectory,
      0,
      1024,
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
          'HomeDirectoryType': homeDirectoryType.toValue(),
        if (policy != null) 'Policy': policy,
        if (posixProfile != null) 'PosixProfile': posixProfile,
        if (role != null) 'Role': role,
      },
    );

    return UpdateAccessResponse.fromJson(jsonResponse.body);
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
  /// your server. When you host your endpoint within your VPC, you can make it
  /// accessible only to resources within your VPC, or you can attach Elastic IP
  /// addresses and make it accessible to clients over the internet. Your VPC's
  /// default security groups are automatically assigned to your endpoint.
  ///
  /// Parameter [endpointType] :
  /// The type of endpoint that you want your server to use. You can choose to
  /// make your server's endpoint publicly accessible (PUBLIC) or host it inside
  /// your VPC. With an endpoint that is hosted in a VPC, you can restrict
  /// access to your server and resources only within your VPC or choose to make
  /// it internet facing by attaching Elastic IP addresses directly to it.
  /// <note>
  /// After May 19, 2021, you won't be able to create a server using
  /// <code>EndpointType=VPC_ENDPOINT</code> in your Amazon Web Servicesaccount
  /// if your account hasn't already done so before May 19, 2021. If you have
  /// already created servers with <code>EndpointType=VPC_ENDPOINT</code> in
  /// your Amazon Web Servicesaccount on or before May 19, 2021, you will not be
  /// affected. After this date, use <code>EndpointType</code>=<code>VPC</code>.
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
  /// The RSA private key as generated by <code>ssh-keygen -N "" -m PEM -f
  /// my-new-server-key</code>.
  /// <important>
  /// If you aren't planning to migrate existing users from an existing server
  /// to a new server, don't update the host key. Accidentally changing a
  /// server's host key can be disruptive.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key">Change
  /// the host key for your SFTP-enabled server</a> in the <i>Amazon Web
  /// ServicesTransfer Family User Guide</i>.
  ///
  /// Parameter [identityProviderDetails] :
  /// An array containing all of the information required to call a customer's
  /// authentication API method.
  ///
  /// Parameter [loggingRole] :
  /// Specifies the Amazon Resource Name (ARN) of the Amazon Web Services
  /// Identity and Access Management (IAM) role that allows a server to turn on
  /// Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. When set,
  /// user activity can be viewed in your CloudWatch logs.
  ///
  /// Parameter [protocolDetails] :
  /// The protocol settings that are configured for your server.
  ///
  /// Use the <code>PassiveIp</code> parameter to indicate passive mode (for FTP
  /// and FTPS protocols). Enter a single dotted-quad IPv4 address, such as the
  /// external IP address of a firewall, router, or load balancer.
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
  /// Amazon Web ServicesCertificate Manager (ACM) which will be used to
  /// identify your server when clients connect to it over FTPS.
  ///
  /// If <code>Protocol</code> includes either <code>FTP</code> or
  /// <code>FTPS</code>, then the <code>EndpointType</code> must be
  /// <code>VPC</code> and the <code>IdentityProviderType</code> must be
  /// <code>AWS_DIRECTORY_SERVICE</code> or <code>API_GATEWAY</code>.
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
    required String serverId,
    String? certificate,
    EndpointDetails? endpointDetails,
    EndpointType? endpointType,
    String? hostKey,
    IdentityProviderDetails? identityProviderDetails,
    String? loggingRole,
    ProtocolDetails? protocolDetails,
    List<Protocol>? protocols,
    String? securityPolicyName,
  }) async {
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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
    _s.validateStringLength(
      'securityPolicyName',
      securityPolicyName,
      0,
      100,
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
        if (protocolDetails != null) 'ProtocolDetails': protocolDetails,
        if (protocols != null)
          'Protocols': protocols.map((e) => e.toValue()).toList(),
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
  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  ///
  /// Parameter [homeDirectoryMappings] :
  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you
  /// only specify a target, it is displayed as is. You also must ensure that
  /// your Amazon Web Services Identity and Access Management (IAM) role
  /// provides access to paths in <code>Target</code>. This value can only be
  /// set when <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example.
  ///
  /// <code>[ { "Entry": "your-personal-report.pdf", "Target":
  /// "/bucket3/customized-reports/${transfer:UserName}.pdf" } ]</code>
  ///
  /// In most cases, you can use this value instead of the scope-down policy to
  /// lock down your user to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to '/'
  /// and set <code>Target</code> to the HomeDirectory parameter value.
  ///
  /// The following is an <code>Entry</code> and <code>Target</code> pair
  /// example for <code>chroot</code>.
  ///
  /// <code>[ { "Entry:": "/", "Target": "/bucket_name/home/mydirectory" }
  /// ]</code>
  /// <note>
  /// If the target of a logical directory entry does not exist in Amazon S3 or
  /// EFS, the entry is ignored. As a workaround, you can use the Amazon S3 API
  /// or EFS API to create 0 byte objects as place holders for your directory.
  /// If using the CLI, use the <code>s3api</code> or <code>efsapi</code> call
  /// instead of <code>s3</code> or <code>efs</code> so you can use the
  /// put-object operation. For example, you use the following: <code>aws s3api
  /// put-object --bucket bucketname --key path/to/folder/</code>. Make sure
  /// that the end of the key name ends in a <code>/</code> for it to be
  /// considered a folder.
  /// </note>
  ///
  /// Parameter [homeDirectoryType] :
  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>,
  /// the user will see the absolute Amazon S3 bucket or EFS paths as is in
  /// their file transfer protocol clients. If you set it <code>LOGICAL</code>,
  /// you will need to provide mappings in the
  /// <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 or
  /// EFS paths visible to your users.
  ///
  /// Parameter [policy] :
  /// A scope-down policy for your user so that you can use the same IAM role
  /// across multiple users. This policy scopes down user access to portions of
  /// their Amazon S3 bucket. Variables that you can use inside this policy
  /// include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  /// <note>
  /// This only applies when domain of <code>ServerId</code> is S3. Amazon EFS
  /// does not use scope-down policies.
  ///
  /// For scope-down policies, Amazon Web ServicesTransfer Family stores the
  /// policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the
  /// policy. You save the policy as a JSON blob and pass it in the
  /// <code>Policy</code> argument.
  ///
  /// For an example of a scope-down policy, see <a
  /// href="https://docs.aws.amazon.com/transfer/latest/userguide/users.html#users-policies-scope-down">Creating
  /// a scope-down policy</a>.
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
  /// Specifies the Amazon Resource Name (ARN) of the IAM role that controls
  /// your users' access to your Amazon S3 bucket or EFS file system. The
  /// policies attached to this role determine the level of access that you want
  /// to provide your users when transferring files into and out of your Amazon
  /// S3 bucket or EFS file system. The IAM role should also contain a trust
  /// relationship that allows the server to access your resources when
  /// servicing your users' transfer requests.
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
    ArgumentError.checkNotNull(serverId, 'serverId');
    _s.validateStringLength(
      'serverId',
      serverId,
      19,
      19,
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
    _s.validateStringLength(
      'homeDirectory',
      homeDirectory,
      0,
      1024,
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
        if (posixProfile != null) 'PosixProfile': posixProfile,
        if (role != null) 'Role': role,
      },
    );

    return UpdateUserResponse.fromJson(jsonResponse.body);
  }
}

class CreateAccessResponse {
  /// The external ID of the group whose users have access to your Amazon S3 or
  /// Amazon EFS resources over the enabled protocols using Amazon Web Services
  /// Transfer Family.
  final String externalId;

  /// The ID of the server that the user is attached to.
  final String serverId;

  CreateAccessResponse({
    required this.externalId,
    required this.serverId,
  });

  factory CreateAccessResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccessResponse(
      externalId: json['ExternalId'] as String,
      serverId: json['ServerId'] as String,
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

class CreateServerResponse {
  /// The service-assigned ID of the server that is created.
  final String serverId;

  CreateServerResponse({
    required this.serverId,
  });

  factory CreateServerResponse.fromJson(Map<String, dynamic> json) {
    return CreateServerResponse(
      serverId: json['ServerId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    return {
      'ServerId': serverId,
    };
  }
}

class CreateUserResponse {
  /// The ID of the server that the user is attached to.
  final String serverId;

  /// A unique string that identifies a user account associated with a server.
  final String userName;

  CreateUserResponse({
    required this.serverId,
    required this.userName,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      serverId: json['ServerId'] as String,
      userName: json['UserName'] as String,
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

class DescribeAccessResponse {
  /// The external ID of the server that the access is attached to.
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
      access: DescribedAccess.fromJson(json['Access'] as Map<String, dynamic>),
      serverId: json['ServerId'] as String,
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

class DescribeSecurityPolicyResponse {
  /// An array containing the properties of the security policy.
  final DescribedSecurityPolicy securityPolicy;

  DescribeSecurityPolicyResponse({
    required this.securityPolicy,
  });

  factory DescribeSecurityPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSecurityPolicyResponse(
      securityPolicy: DescribedSecurityPolicy.fromJson(
          json['SecurityPolicy'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final securityPolicy = this.securityPolicy;
    return {
      'SecurityPolicy': securityPolicy,
    };
  }
}

class DescribeServerResponse {
  /// An array containing the properties of a server with the
  /// <code>ServerID</code> you specified.
  final DescribedServer server;

  DescribeServerResponse({
    required this.server,
  });

  factory DescribeServerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeServerResponse(
      server: DescribedServer.fromJson(json['Server'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    return {
      'Server': server,
    };
  }
}

class DescribeUserResponse {
  /// A system-assigned unique identifier for a server that has this user
  /// assigned.
  final String serverId;

  /// An array containing the properties of the user account for the
  /// <code>ServerID</code> value that you specified.
  final DescribedUser user;

  DescribeUserResponse({
    required this.serverId,
    required this.user,
  });

  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUserResponse(
      serverId: json['ServerId'] as String,
      user: DescribedUser.fromJson(json['User'] as Map<String, dynamic>),
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

/// Describes the properties of the access that was specified.
class DescribedAccess {
  /// A unique identifier that is required to identify specific groups within your
  /// directory. The users of the group that you associate have access to your
  /// Amazon S3 or Amazon EFS resources over the enabled protocols using Amazon
  /// Web Services Transfer Family. If you know the group name, you can view the
  /// SID values by running the following command using Windows PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of uppercase and lowercase alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following characters:
  /// =,.@:/-
  final String? externalId;

  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  final String? homeDirectory;

  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you only
  /// specify a target, it is displayed as is. You also must ensure that your
  /// Amazon Web Services Identity and Access Management (IAM) role provides
  /// access to paths in <code>Target</code>. This value can only be set when
  /// <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// In most cases, you can use this value instead of the scope-down policy to
  /// lock down the associated access to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to '/'
  /// and set <code>Target</code> to the <code>HomeDirectory</code> parameter
  /// value.
  final List<HomeDirectoryMapEntry>? homeDirectoryMappings;

  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>, the
  /// user will see the absolute Amazon S3 bucket or EFS paths as is in their file
  /// transfer protocol clients. If you set it <code>LOGICAL</code>, you will need
  /// to provide mappings in the <code>HomeDirectoryMappings</code> for how you
  /// want to make Amazon S3 or EFS paths visible to your users.
  final HomeDirectoryType? homeDirectoryType;

  /// A scope-down policy for your user so that you can use the same IAM role
  /// across multiple users. This policy scopes down user access to portions of
  /// their Amazon S3 bucket. Variables that you can use inside this policy
  /// include <code>${Transfer:UserName}</code>,
  /// <code>${Transfer:HomeDirectory}</code>, and
  /// <code>${Transfer:HomeBucket}</code>.
  final String? policy;
  final PosixProfile? posixProfile;

  /// Specifies the Amazon Resource Name (ARN) of the IAM role that controls your
  /// users' access to your Amazon S3 bucket or EFS file system. The policies
  /// attached to this role determine the level of access that you want to provide
  /// your users when transferring files into and out of your Amazon S3 bucket or
  /// EFS file system. The IAM role should also contain a trust relationship that
  /// allows the server to access your resources when servicing your users'
  /// transfer requests.
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
          ?.whereNotNull()
          .map((e) => HomeDirectoryMapEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeDirectoryType:
          (json['HomeDirectoryType'] as String?)?.toHomeDirectoryType(),
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
        'HomeDirectoryType': homeDirectoryType.toValue(),
      if (policy != null) 'Policy': policy,
      if (posixProfile != null) 'PosixProfile': posixProfile,
      if (role != null) 'Role': role,
    };
  }
}

/// Describes the properties of a security policy that was specified. For more
/// information about security policies, see <a
/// href="https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html">Working
/// with security policies</a>.
class DescribedSecurityPolicy {
  /// Specifies the name of the security policy that is attached to the server.
  final String securityPolicyName;

  /// Specifies whether this policy enables Federal Information Processing
  /// Standards (FIPS).
  final bool? fips;

  /// Specifies the enabled Secure Shell (SSH) cipher encryption algorithms in the
  /// security policy that is attached to the server.
  final List<String>? sshCiphers;

  /// Specifies the enabled SSH key exchange (KEX) encryption algorithms in the
  /// security policy that is attached to the server.
  final List<String>? sshKexs;

  /// Specifies the enabled SSH message authentication code (MAC) encryption
  /// algorithms in the security policy that is attached to the server.
  final List<String>? sshMacs;

  /// Specifies the enabled Transport Layer Security (TLS) cipher encryption
  /// algorithms in the security policy that is attached to the server.
  final List<String>? tlsCiphers;

  DescribedSecurityPolicy({
    required this.securityPolicyName,
    this.fips,
    this.sshCiphers,
    this.sshKexs,
    this.sshMacs,
    this.tlsCiphers,
  });

  factory DescribedSecurityPolicy.fromJson(Map<String, dynamic> json) {
    return DescribedSecurityPolicy(
      securityPolicyName: json['SecurityPolicyName'] as String,
      fips: json['Fips'] as bool?,
      sshCiphers: (json['SshCiphers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sshKexs: (json['SshKexs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sshMacs: (json['SshMacs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tlsCiphers: (json['TlsCiphers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityPolicyName = this.securityPolicyName;
    final fips = this.fips;
    final sshCiphers = this.sshCiphers;
    final sshKexs = this.sshKexs;
    final sshMacs = this.sshMacs;
    final tlsCiphers = this.tlsCiphers;
    return {
      'SecurityPolicyName': securityPolicyName,
      if (fips != null) 'Fips': fips,
      if (sshCiphers != null) 'SshCiphers': sshCiphers,
      if (sshKexs != null) 'SshKexs': sshKexs,
      if (sshMacs != null) 'SshMacs': sshMacs,
      if (tlsCiphers != null) 'TlsCiphers': tlsCiphers,
    };
  }
}

/// Describes the properties of a file transfer protocol-enabled server that was
/// specified.
class DescribedServer {
  /// Specifies the unique Amazon Resource Name (ARN) of the server.
  final String arn;

  /// Specifies the ARN of the Amazon Web ServicesCertificate Manager (ACM)
  /// certificate. Required when <code>Protocols</code> is set to
  /// <code>FTPS</code>.
  final String? certificate;

  /// Specifies the domain of the storage system that is used for file transfers.
  final Domain? domain;

  /// The virtual private cloud (VPC) endpoint settings that are configured for
  /// your server. When you host your endpoint within your VPC, you can make it
  /// accessible only to resources within your VPC, or you can attach Elastic IP
  /// addresses and make it accessible to clients over the internet. Your VPC's
  /// default security groups are automatically assigned to your endpoint.
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

  /// Specifies the mode of authentication for a server. The default value is
  /// <code>SERVICE_MANAGED</code>, which allows you to store and access user
  /// credentials within the Amazon Web Services Transfer Family service.
  ///
  /// Use <code>AWS_DIRECTORY_SERVICE</code> to provide access to Active Directory
  /// groups in Amazon Web Services Managed Active Directory or Microsoft Active
  /// Directory in your on-premises environment or in Amazon Web Services using AD
  /// Connectors. This option also requires you to provide a Directory ID using
  /// the <code>IdentityProviderDetails</code> parameter.
  ///
  /// Use the <code>API_GATEWAY</code> value to integrate with an identity
  /// provider of your choosing. The <code>API_GATEWAY</code> setting requires you
  /// to provide an API Gateway endpoint URL to call for authentication using the
  /// <code>IdentityProviderDetails</code> parameter.
  final IdentityProviderType? identityProviderType;

  /// Specifies the Amazon Resource Name (ARN) of the Amazon Web Services Identity
  /// and Access Management (IAM) role that allows a server to turn on Amazon
  /// CloudWatch logging for Amazon S3 or Amazon EFS events. When set, user
  /// activity can be viewed in your CloudWatch logs.
  final String? loggingRole;

  /// The protocol settings that are configured for your server.
  ///
  /// Use the <code>PassiveIp</code> parameter to indicate passive mode. Enter a
  /// single dotted-quad IPv4 address, such as the external IP address of a
  /// firewall, router, or load balancer.
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
  /// </ul>
  final List<Protocol>? protocols;

  /// Specifies the name of the security policy that is attached to the server.
  final String? securityPolicyName;

  /// Specifies the unique system-assigned identifier for a server that you
  /// instantiate.
  final String? serverId;

  /// Specifies the condition of a server for the server that was described. A
  /// value of <code>ONLINE</code> indicates that the server can accept jobs and
  /// transfer files. A <code>State</code> value of <code>OFFLINE</code> means
  /// that the server cannot perform file transfer operations.
  ///
  /// The states of <code>STARTING</code> and <code>STOPPING</code> indicate that
  /// the server is in an intermediate state, either not fully able to respond, or
  /// not fully offline. The values of <code>START_FAILED</code> or
  /// <code>STOP_FAILED</code> can indicate an error condition.
  final State? state;

  /// Specifies the key-value pairs that you can use to search for and group
  /// servers that were assigned to the server that was described.
  final List<Tag>? tags;

  /// Specifies the number of users that are assigned to a server you specified
  /// with the <code>ServerId</code>.
  final int? userCount;

  DescribedServer({
    required this.arn,
    this.certificate,
    this.domain,
    this.endpointDetails,
    this.endpointType,
    this.hostKeyFingerprint,
    this.identityProviderDetails,
    this.identityProviderType,
    this.loggingRole,
    this.protocolDetails,
    this.protocols,
    this.securityPolicyName,
    this.serverId,
    this.state,
    this.tags,
    this.userCount,
  });

  factory DescribedServer.fromJson(Map<String, dynamic> json) {
    return DescribedServer(
      arn: json['Arn'] as String,
      certificate: json['Certificate'] as String?,
      domain: (json['Domain'] as String?)?.toDomain(),
      endpointDetails: json['EndpointDetails'] != null
          ? EndpointDetails.fromJson(
              json['EndpointDetails'] as Map<String, dynamic>)
          : null,
      endpointType: (json['EndpointType'] as String?)?.toEndpointType(),
      hostKeyFingerprint: json['HostKeyFingerprint'] as String?,
      identityProviderDetails: json['IdentityProviderDetails'] != null
          ? IdentityProviderDetails.fromJson(
              json['IdentityProviderDetails'] as Map<String, dynamic>)
          : null,
      identityProviderType:
          (json['IdentityProviderType'] as String?)?.toIdentityProviderType(),
      loggingRole: json['LoggingRole'] as String?,
      protocolDetails: json['ProtocolDetails'] != null
          ? ProtocolDetails.fromJson(
              json['ProtocolDetails'] as Map<String, dynamic>)
          : null,
      protocols: (json['Protocols'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toProtocol())
          .toList(),
      securityPolicyName: json['SecurityPolicyName'] as String?,
      serverId: json['ServerId'] as String?,
      state: (json['State'] as String?)?.toState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      userCount: json['UserCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final certificate = this.certificate;
    final domain = this.domain;
    final endpointDetails = this.endpointDetails;
    final endpointType = this.endpointType;
    final hostKeyFingerprint = this.hostKeyFingerprint;
    final identityProviderDetails = this.identityProviderDetails;
    final identityProviderType = this.identityProviderType;
    final loggingRole = this.loggingRole;
    final protocolDetails = this.protocolDetails;
    final protocols = this.protocols;
    final securityPolicyName = this.securityPolicyName;
    final serverId = this.serverId;
    final state = this.state;
    final tags = this.tags;
    final userCount = this.userCount;
    return {
      'Arn': arn,
      if (certificate != null) 'Certificate': certificate,
      if (domain != null) 'Domain': domain.toValue(),
      if (endpointDetails != null) 'EndpointDetails': endpointDetails,
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (hostKeyFingerprint != null) 'HostKeyFingerprint': hostKeyFingerprint,
      if (identityProviderDetails != null)
        'IdentityProviderDetails': identityProviderDetails,
      if (identityProviderType != null)
        'IdentityProviderType': identityProviderType.toValue(),
      if (loggingRole != null) 'LoggingRole': loggingRole,
      if (protocolDetails != null) 'ProtocolDetails': protocolDetails,
      if (protocols != null)
        'Protocols': protocols.map((e) => e.toValue()).toList(),
      if (securityPolicyName != null) 'SecurityPolicyName': securityPolicyName,
      if (serverId != null) 'ServerId': serverId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (userCount != null) 'UserCount': userCount,
    };
  }
}

/// Describes the properties of a user that was specified.
class DescribedUser {
  /// Specifies the unique Amazon Resource Name (ARN) for the user that was
  /// requested to be described.
  final String arn;

  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  final String? homeDirectory;

  /// Logical directory mappings that specify what Amazon S3 or Amazon EFS paths
  /// and keys should be visible to your user and how you want to make them
  /// visible. You must specify the <code>Entry</code> and <code>Target</code>
  /// pair, where <code>Entry</code> shows how the path is made visible and
  /// <code>Target</code> is the actual Amazon S3 or Amazon EFS path. If you only
  /// specify a target, it is displayed as is. You also must ensure that your
  /// Amazon Web Services Identity and Access Management (IAM) role provides
  /// access to paths in <code>Target</code>. This value can only be set when
  /// <code>HomeDirectoryType</code> is set to <i>LOGICAL</i>.
  ///
  /// In most cases, you can use this value instead of the scope-down policy to
  /// lock your user down to the designated home directory
  /// ("<code>chroot</code>"). To do this, you can set <code>Entry</code> to '/'
  /// and set <code>Target</code> to the HomeDirectory parameter value.
  final List<HomeDirectoryMapEntry>? homeDirectoryMappings;

  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>, the
  /// user will see the absolute Amazon S3 bucket or EFS paths as is in their file
  /// transfer protocol clients. If you set it <code>LOGICAL</code>, you will need
  /// to provide mappings in the <code>HomeDirectoryMappings</code> for how you
  /// want to make Amazon S3 or EFS paths visible to your users.
  final HomeDirectoryType? homeDirectoryType;

  /// A scope-down policy for your user so that you can use the same IAM role
  /// across multiple users. This policy scopes down user access to portions of
  /// their Amazon S3 bucket. Variables that you can use inside this policy
  /// include <code>${Transfer:UserName}</code>,
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

  /// Specifies the Amazon Resource Name (ARN) of the IAM role that controls your
  /// users' access to your Amazon S3 bucket or EFS file system. The policies
  /// attached to this role determine the level of access that you want to provide
  /// your users when transferring files into and out of your Amazon S3 bucket or
  /// EFS file system. The IAM role should also contain a trust relationship that
  /// allows the server to access your resources when servicing your users'
  /// transfer requests.
  final String? role;

  /// Specifies the public key portion of the Secure Shell (SSH) keys stored for
  /// the described user.
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
      arn: json['Arn'] as String,
      homeDirectory: json['HomeDirectory'] as String?,
      homeDirectoryMappings: (json['HomeDirectoryMappings'] as List?)
          ?.whereNotNull()
          .map((e) => HomeDirectoryMapEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeDirectoryType:
          (json['HomeDirectoryType'] as String?)?.toHomeDirectoryType(),
      policy: json['Policy'] as String?,
      posixProfile: json['PosixProfile'] != null
          ? PosixProfile.fromJson(json['PosixProfile'] as Map<String, dynamic>)
          : null,
      role: json['Role'] as String?,
      sshPublicKeys: (json['SshPublicKeys'] as List?)
          ?.whereNotNull()
          .map((e) => SshPublicKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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
        'HomeDirectoryType': homeDirectoryType.toValue(),
      if (policy != null) 'Policy': policy,
      if (posixProfile != null) 'PosixProfile': posixProfile,
      if (role != null) 'Role': role,
      if (sshPublicKeys != null) 'SshPublicKeys': sshPublicKeys,
      if (tags != null) 'Tags': tags,
      if (userName != null) 'UserName': userName,
    };
  }
}

enum Domain {
  s3,
  efs,
}

extension on Domain {
  String toValue() {
    switch (this) {
      case Domain.s3:
        return 'S3';
      case Domain.efs:
        return 'EFS';
    }
  }
}

extension on String {
  Domain toDomain() {
    switch (this) {
      case 'S3':
        return Domain.s3;
      case 'EFS':
        return Domain.efs;
    }
    throw Exception('$this is not known in enum Domain');
  }
}

/// The virtual private cloud (VPC) endpoint settings that are configured for
/// your file transfer protocol-enabled server. With a VPC endpoint, you can
/// restrict access to your server and resources only within your VPC. To
/// control incoming internet traffic, invoke the <code>UpdateServer</code> API
/// and attach an Elastic IP address to your server's endpoint.
/// <note>
/// After May 19, 2021, you won't be able to create a server using
/// <code>EndpointType=VPC_ENDPOINT</code> in your Amazon Web Servicesaccount if
/// your account hasn't already done so before May 19, 2021. If you have already
/// created servers with <code>EndpointType=VPC_ENDPOINT</code> in your Amazon
/// Web Servicesaccount on or before May 19, 2021, you will not be affected.
/// After this date, use <code>EndpointType</code>=<code>VPC</code>.
///
/// For more information, see
/// https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
/// </note>
class EndpointDetails {
  /// A list of address allocation IDs that are required to attach an Elastic IP
  /// address to your server's endpoint.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC</code> and it is only valid in the <code>UpdateServer</code> API.
  /// </note>
  final List<String>? addressAllocationIds;

  /// A list of security groups IDs that are available to attach to your server's
  /// endpoint.
  /// <note>
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

  /// The ID of the VPC endpoint.
  /// <note>
  /// This property can only be set when <code>EndpointType</code> is set to
  /// <code>VPC_ENDPOINT</code>.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
  /// </note>
  final String? vpcEndpointId;

  /// The VPC ID of the VPC in which a server's endpoint will be hosted.
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
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

enum EndpointType {
  public,
  vpc,
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
  }
}

extension on String {
  EndpointType toEndpointType() {
    switch (this) {
      case 'PUBLIC':
        return EndpointType.public;
      case 'VPC':
        return EndpointType.vpc;
      case 'VPC_ENDPOINT':
        return EndpointType.vpcEndpoint;
    }
    throw Exception('$this is not known in enum EndpointType');
  }
}

/// Represents an object that contains entries and targets for
/// <code>HomeDirectoryMappings</code>.
///
/// The following is an <code>Entry</code> and <code>Target</code> pair example
/// for <code>chroot</code>.
///
/// <code>[ { "Entry:": "/", "Target": "/bucket_name/home/mydirectory" }
/// ]</code>
/// <note>
/// If the target of a logical directory entry does not exist in Amazon S3 or
/// EFS, the entry is ignored. As a workaround, you can use the Amazon S3 API or
/// EFS API to create 0 byte objects as place holders for your directory. If
/// using the CLI, use the <code>s3api</code> or <code>efsapi</code> call
/// instead of <code>s3</code> or <code>efs</code> so you can use the put-object
/// operation. For example, you use the following: <code>aws s3api put-object
/// --bucket bucketname --key path/to/folder/</code>. Make sure that the end of
/// the key name ends in a <code>/</code> for it to be considered a folder.
/// </note>
class HomeDirectoryMapEntry {
  /// Represents an entry for <code>HomeDirectoryMappings</code>.
  final String entry;

  /// Represents the map target that is used in a
  /// <code>HomeDirectorymapEntry</code>.
  final String target;

  HomeDirectoryMapEntry({
    required this.entry,
    required this.target,
  });

  factory HomeDirectoryMapEntry.fromJson(Map<String, dynamic> json) {
    return HomeDirectoryMapEntry(
      entry: json['Entry'] as String,
      target: json['Target'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entry = this.entry;
    final target = this.target;
    return {
      'Entry': entry,
      'Target': target,
    };
  }
}

enum HomeDirectoryType {
  path,
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
  }
}

extension on String {
  HomeDirectoryType toHomeDirectoryType() {
    switch (this) {
      case 'PATH':
        return HomeDirectoryType.path;
      case 'LOGICAL':
        return HomeDirectoryType.logical;
    }
    throw Exception('$this is not known in enum HomeDirectoryType');
  }
}

/// Returns information related to the type of user authentication that is in
/// use for a file transfer protocol-enabled server's users. A server can have
/// only one method of authentication.
class IdentityProviderDetails {
  /// The identifier of the Amazon Web ServicesDirectory Service directory that
  /// you want to stop sharing.
  final String? directoryId;

  /// Provides the type of <code>InvocationRole</code> used to authenticate the
  /// user account.
  final String? invocationRole;

  /// Provides the location of the service endpoint used to authenticate users.
  final String? url;

  IdentityProviderDetails({
    this.directoryId,
    this.invocationRole,
    this.url,
  });

  factory IdentityProviderDetails.fromJson(Map<String, dynamic> json) {
    return IdentityProviderDetails(
      directoryId: json['DirectoryId'] as String?,
      invocationRole: json['InvocationRole'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final invocationRole = this.invocationRole;
    final url = this.url;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (invocationRole != null) 'InvocationRole': invocationRole,
      if (url != null) 'Url': url,
    };
  }
}

/// Returns information related to the type of user authentication that is in
/// use for a file transfer protocol-enabled server's users. For
/// <code>AWS_DIRECTORY_SERVICE</code> or <code>SERVICE_MANAGED</code>
/// authentication, the Secure Shell (SSH) public keys are stored with a user on
/// the server instance. For <code>API_GATEWAY</code> authentication, your
/// custom authentication method is implemented by using an API call. The server
/// can have only one method of authentication.
enum IdentityProviderType {
  serviceManaged,
  apiGateway,
  awsDirectoryService,
}

extension on IdentityProviderType {
  String toValue() {
    switch (this) {
      case IdentityProviderType.serviceManaged:
        return 'SERVICE_MANAGED';
      case IdentityProviderType.apiGateway:
        return 'API_GATEWAY';
      case IdentityProviderType.awsDirectoryService:
        return 'AWS_DIRECTORY_SERVICE';
    }
  }
}

extension on String {
  IdentityProviderType toIdentityProviderType() {
    switch (this) {
      case 'SERVICE_MANAGED':
        return IdentityProviderType.serviceManaged;
      case 'API_GATEWAY':
        return IdentityProviderType.apiGateway;
      case 'AWS_DIRECTORY_SERVICE':
        return IdentityProviderType.awsDirectoryService;
    }
    throw Exception('$this is not known in enum IdentityProviderType');
  }
}

/// Identifies the user, the server they belong to, and the identifier of the
/// SSH public key associated with that user. A user can have more than one key
/// on each server that they are associated with.
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
      serverId: json['ServerId'] as String,
      sshPublicKeyId: json['SshPublicKeyId'] as String,
      userName: json['UserName'] as String,
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
      accesses: (json['Accesses'] as List)
          .whereNotNull()
          .map((e) => ListedAccess.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverId: json['ServerId'] as String,
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
      securityPolicyNames: (json['SecurityPolicyNames'] as List)
          .whereNotNull()
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
      servers: (json['Servers'] as List)
          .whereNotNull()
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
          ?.whereNotNull()
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

class ListUsersResponse {
  /// A system-assigned unique identifier for a server that the users are assigned
  /// to.
  final String serverId;

  /// Returns the user accounts and their properties for the <code>ServerId</code>
  /// value that you specify.
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
      serverId: json['ServerId'] as String,
      users: (json['Users'] as List)
          .whereNotNull()
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

/// Lists the properties for one or more specified associated accesses.
class ListedAccess {
  /// A unique identifier that is required to identify specific groups within your
  /// directory. The users of the group that you associate have access to your
  /// Amazon S3 or Amazon EFS resources over the enabled protocols using Amazon
  /// Web Services Transfer Family. If you know the group name, you can view the
  /// SID values by running the following command using Windows PowerShell.
  ///
  /// <code>Get-ADGroup -Filter {samAccountName -like "<i>YourGroupName</i>*"}
  /// -Properties * | Select SamAccountName,ObjectSid</code>
  ///
  /// In that command, replace <i>YourGroupName</i> with the name of your Active
  /// Directory group.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of uppercase and lowercase alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following characters:
  /// =,.@:/-
  final String? externalId;

  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  final String? homeDirectory;

  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>, the
  /// user will see the absolute Amazon S3 bucket or EFS paths as is in their file
  /// transfer protocol clients. If you set it <code>LOGICAL</code>, you will need
  /// to provide mappings in the <code>HomeDirectoryMappings</code> for how you
  /// want to make Amazon S3 or EFS paths visible to your users.
  final HomeDirectoryType? homeDirectoryType;

  /// Specifies the Amazon Resource Name (ARN) of the IAM role that controls your
  /// users' access to your Amazon S3 bucket or EFS file system. The policies
  /// attached to this role determine the level of access that you want to provide
  /// your users when transferring files into and out of your Amazon S3 bucket or
  /// EFS file system. The IAM role should also contain a trust relationship that
  /// allows the server to access your resources when servicing your users'
  /// transfer requests.
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
      homeDirectoryType:
          (json['HomeDirectoryType'] as String?)?.toHomeDirectoryType(),
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
        'HomeDirectoryType': homeDirectoryType.toValue(),
      if (role != null) 'Role': role,
    };
  }
}

/// Returns properties of a file transfer protocol-enabled server that was
/// specified.
class ListedServer {
  /// Specifies the unique Amazon Resource Name (ARN) for a server to be listed.
  final String arn;

  /// Specifies the domain of the storage system that is used for file transfers.
  final Domain? domain;

  /// Specifies the type of VPC endpoint that your server is connected to. If your
  /// server is connected to a VPC endpoint, your server isn't accessible over the
  /// public internet.
  final EndpointType? endpointType;

  /// Specifies the mode of authentication for a server. The default value is
  /// <code>SERVICE_MANAGED</code>, which allows you to store and access user
  /// credentials within the Amazon Web Services Transfer Family service.
  ///
  /// Use <code>AWS_DIRECTORY_SERVICE</code> to provide access to Active Directory
  /// groups in Amazon Web Services Managed Active Directory or Microsoft Active
  /// Directory in your on-premises environment or in Amazon Web Services using AD
  /// Connectors. This option also requires you to provide a Directory ID using
  /// the <code>IdentityProviderDetails</code> parameter.
  ///
  /// Use the <code>API_GATEWAY</code> value to integrate with an identity
  /// provider of your choosing. The <code>API_GATEWAY</code> setting requires you
  /// to provide an API Gateway endpoint URL to call for authentication using the
  /// <code>IdentityProviderDetails</code> parameter.
  final IdentityProviderType? identityProviderType;

  /// Specifies the Amazon Resource Name (ARN) of the Amazon Web Services Identity
  /// and Access Management (IAM) role that allows a server to turn on Amazon
  /// CloudWatch logging for Amazon S3 or Amazon EFS events. When set, user
  /// activity can be viewed in your CloudWatch logs.
  final String? loggingRole;

  /// Specifies the unique system assigned identifier for the servers that were
  /// listed.
  final String? serverId;

  /// Specifies the condition of a server for the server that was described. A
  /// value of <code>ONLINE</code> indicates that the server can accept jobs and
  /// transfer files. A <code>State</code> value of <code>OFFLINE</code> means
  /// that the server cannot perform file transfer operations.
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
      arn: json['Arn'] as String,
      domain: (json['Domain'] as String?)?.toDomain(),
      endpointType: (json['EndpointType'] as String?)?.toEndpointType(),
      identityProviderType:
          (json['IdentityProviderType'] as String?)?.toIdentityProviderType(),
      loggingRole: json['LoggingRole'] as String?,
      serverId: json['ServerId'] as String?,
      state: (json['State'] as String?)?.toState(),
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
      if (domain != null) 'Domain': domain.toValue(),
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (identityProviderType != null)
        'IdentityProviderType': identityProviderType.toValue(),
      if (loggingRole != null) 'LoggingRole': loggingRole,
      if (serverId != null) 'ServerId': serverId,
      if (state != null) 'State': state.toValue(),
      if (userCount != null) 'UserCount': userCount,
    };
  }
}

/// Returns properties of the user that you specify.
class ListedUser {
  /// Provides the unique Amazon Resource Name (ARN) for the user that you want to
  /// learn about.
  final String arn;

  /// The landing directory (folder) for a user when they log in to the server
  /// using the client.
  ///
  /// A <code>HomeDirectory</code> example is
  /// <code>/bucket_name/home/mydirectory</code>.
  final String? homeDirectory;

  /// The type of landing directory (folder) you want your users' home directory
  /// to be when they log into the server. If you set it to <code>PATH</code>, the
  /// user will see the absolute Amazon S3 bucket or EFS paths as is in their file
  /// transfer protocol clients. If you set it <code>LOGICAL</code>, you will need
  /// to provide mappings in the <code>HomeDirectoryMappings</code> for how you
  /// want to make Amazon S3 or EFS paths visible to your users.
  final HomeDirectoryType? homeDirectoryType;

  /// Specifies the Amazon Resource Name (ARN) of the IAM role that controls your
  /// users' access to your Amazon S3 bucket or EFS file system. The policies
  /// attached to this role determine the level of access that you want to provide
  /// your users when transferring files into and out of your Amazon S3 bucket or
  /// EFS file system. The IAM role should also contain a trust relationship that
  /// allows the server to access your resources when servicing your users'
  /// transfer requests.
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
      arn: json['Arn'] as String,
      homeDirectory: json['HomeDirectory'] as String?,
      homeDirectoryType:
          (json['HomeDirectoryType'] as String?)?.toHomeDirectoryType(),
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
        'HomeDirectoryType': homeDirectoryType.toValue(),
      if (role != null) 'Role': role,
      if (sshPublicKeyCount != null) 'SshPublicKeyCount': sshPublicKeyCount,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// The full POSIX identity, including user ID (<code>Uid</code>), group ID
/// (<code>Gid</code>), and any secondary groups IDs
/// (<code>SecondaryGids</code>), that controls your users' access to your
/// Amazon EFS file systems. The POSIX permissions that are set on files and
/// directories in your file system determine the level of access your users get
/// when transferring files into and out of your Amazon EFS file systems.
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

enum Protocol {
  sftp,
  ftp,
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
  }
}

extension on String {
  Protocol toProtocol() {
    switch (this) {
      case 'SFTP':
        return Protocol.sftp;
      case 'FTP':
        return Protocol.ftp;
      case 'FTPS':
        return Protocol.ftps;
    }
    throw Exception('$this is not known in enum Protocol');
  }
}

/// The protocol settings that are configured for your server.
/// <note>
/// This type is only valid in the <code>UpdateServer</code> API.
/// </note>
class ProtocolDetails {
  /// Indicates passive mode, for FTP and FTPS protocols. Enter a single
  /// dotted-quad IPv4 address, such as the external IP address of a firewall,
  /// router, or load balancer. For example:
  ///
  /// <code> aws transfer update-server --protocol-details
  /// PassiveIp=<i>0.0.0.0</i> </code>
  ///
  /// Replace <code> <i>0.0.0.0</i> </code> in the example above with the actual
  /// IP address you want to use.
  final String? passiveIp;

  ProtocolDetails({
    this.passiveIp,
  });

  factory ProtocolDetails.fromJson(Map<String, dynamic> json) {
    return ProtocolDetails(
      passiveIp: json['PassiveIp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final passiveIp = this.passiveIp;
    return {
      if (passiveIp != null) 'PassiveIp': passiveIp,
    };
  }
}

/// Provides information about the public Secure Shell (SSH) key that is
/// associated with a user account for the specific file transfer
/// protocol-enabled server (as identified by <code>ServerId</code>). The
/// information returned includes the date the key was imported, the public key
/// contents, and the public key ID. A user can store more than one SSH public
/// key associated with their user name on a specific server.
class SshPublicKey {
  /// Specifies the date that the public key was added to the user account.
  final DateTime dateImported;

  /// Specifies the content of the SSH public key as specified by the
  /// <code>PublicKeyId</code>.
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
      dateImported:
          nonNullableTimeStampFromJson(json['DateImported'] as Object),
      sshPublicKeyBody: json['SshPublicKeyBody'] as String,
      sshPublicKeyId: json['SshPublicKeyId'] as String,
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
  offline,
  online,
  starting,
  stopping,
  startFailed,
  stopFailed,
}

extension on State {
  String toValue() {
    switch (this) {
      case State.offline:
        return 'OFFLINE';
      case State.online:
        return 'ONLINE';
      case State.starting:
        return 'STARTING';
      case State.stopping:
        return 'STOPPING';
      case State.startFailed:
        return 'START_FAILED';
      case State.stopFailed:
        return 'STOP_FAILED';
    }
  }
}

extension on String {
  State toState() {
    switch (this) {
      case 'OFFLINE':
        return State.offline;
      case 'ONLINE':
        return State.online;
      case 'STARTING':
        return State.starting;
      case 'STOPPING':
        return State.stopping;
      case 'START_FAILED':
        return State.startFailed;
      case 'STOP_FAILED':
        return State.stopFailed;
    }
    throw Exception('$this is not known in enum State');
  }
}

/// Creates a key-value pair for a specific resource. Tags are metadata that you
/// can use to search for and group a resource for various purposes. You can
/// apply tags to servers, users, and roles. A tag key can take more than one
/// value. For example, to group servers for accounting purposes, you might
/// create a tag called <code>Group</code> and assign the values
/// <code>Research</code> and <code>Accounting</code> to that group.
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

class TestIdentityProviderResponse {
  /// The HTTP status code that is the response from your API Gateway.
  final int statusCode;

  /// The endpoint of the service used to authenticate a user.
  final String url;

  /// A message that indicates whether the test was successful or not.
  final String? message;

  /// The response that is returned from your API Gateway.
  final String? response;

  TestIdentityProviderResponse({
    required this.statusCode,
    required this.url,
    this.message,
    this.response,
  });

  factory TestIdentityProviderResponse.fromJson(Map<String, dynamic> json) {
    return TestIdentityProviderResponse(
      statusCode: json['StatusCode'] as int,
      url: json['Url'] as String,
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

class UpdateAccessResponse {
  /// The external ID of the group whose users have access to your Amazon S3 or
  /// Amazon EFS resources over the enabled protocols using Amazon Web
  /// ServicesTransfer Family.
  final String externalId;

  /// The ID of the server that the user is attached to.
  final String serverId;

  UpdateAccessResponse({
    required this.externalId,
    required this.serverId,
  });

  factory UpdateAccessResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAccessResponse(
      externalId: json['ExternalId'] as String,
      serverId: json['ServerId'] as String,
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

class UpdateServerResponse {
  /// A system-assigned unique identifier for a server that the user account is
  /// assigned to.
  final String serverId;

  UpdateServerResponse({
    required this.serverId,
  });

  factory UpdateServerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServerResponse(
      serverId: json['ServerId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final serverId = this.serverId;
    return {
      'ServerId': serverId,
    };
  }
}

/// <code>UpdateUserResponse</code> returns the user name and identifier for the
/// request to update a user's properties.
class UpdateUserResponse {
  /// A system-assigned unique identifier for a server instance that the user
  /// account is assigned to.
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
      serverId: json['ServerId'] as String,
      userName: json['UserName'] as String,
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String? type, String? message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String? type, String? message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

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
