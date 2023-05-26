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

/// Directory Service is a web service that makes it easy for you to setup and
/// run directories in the Amazon Web Services cloud, or connect your Amazon Web
/// Services resources with an existing self-managed Microsoft Active Directory.
/// This guide provides detailed information about Directory Service operations,
/// data types, parameters, and errors. For information about Directory Services
/// features, see <a href="https://aws.amazon.com/directoryservice/">Directory
/// Service</a> and the <a
/// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/what_is.html">Directory
/// Service Administration Guide</a>.
/// <note>
/// Amazon Web Services provides SDKs that consist of libraries and sample code
/// for various programming languages and platforms (Java, Ruby, .Net, iOS,
/// Android, etc.). The SDKs provide a convenient way to create programmatic
/// access to Directory Service and other Amazon Web Services services. For more
/// information about the Amazon Web Services SDKs, including how to download
/// and install them, see <a href="http://aws.amazon.com/tools/">Tools for
/// Amazon Web Services</a>.
/// </note>
class Directory {
  final _s.JsonProtocol _protocol;
  Directory({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ds',
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

  /// Accepts a directory sharing request that was sent from the directory owner
  /// account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [DirectoryAlreadySharedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [sharedDirectoryId] :
  /// Identifier of the shared directory in the directory consumer account. This
  /// identifier is different for each directory owner account.
  Future<AcceptSharedDirectoryResult> acceptSharedDirectory({
    required String sharedDirectoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.AcceptSharedDirectory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SharedDirectoryId': sharedDirectoryId,
      },
    );

    return AcceptSharedDirectoryResult.fromJson(jsonResponse.body);
  }

  /// If the DNS server for your self-managed domain uses a publicly addressable
  /// IP address, you must add a CIDR address block to correctly route traffic
  /// to and from your Microsoft AD on Amazon Web Services. <i>AddIpRoutes</i>
  /// adds this address block. You can also use <i>AddIpRoutes</i> to facilitate
  /// routing traffic that uses public IP ranges from your Microsoft AD on
  /// Amazon Web Services to a peer VPC.
  ///
  /// Before you call <i>AddIpRoutes</i>, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the <i>AddIpRoutes</i>
  /// operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">Directory
  /// Service API Permissions: Actions, Resources, and Conditions Reference</a>.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [InvalidParameterException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [IpRouteLimitExceededException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// Identifier (ID) of the directory to which to add the address block.
  ///
  /// Parameter [ipRoutes] :
  /// IP address blocks, using CIDR format, of the traffic to route. This is
  /// often the IP address block of the DNS server used for your self-managed
  /// domain.
  ///
  /// Parameter [updateSecurityGroupForDirectoryControllers] :
  /// If set to true, updates the inbound and outbound rules of the security
  /// group that has the description: "Amazon Web Services created security
  /// group for <i>directory ID</i> directory controllers." Following are the
  /// new rules:
  ///
  /// Inbound:
  ///
  /// <ul>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 88, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 123, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 138, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 389, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 464, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 445, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 88, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 135, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 445, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 464, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 636, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 1024-65535, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 3268-33269, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: DNS (UDP), Protocol: UDP, Range: 53, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: DNS (TCP), Protocol: TCP, Range: 53, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: LDAP, Protocol: TCP, Range: 389, Source: 0.0.0.0/0
  /// </li>
  /// <li>
  /// Type: All ICMP, Protocol: All, Range: N/A, Source: 0.0.0.0/0
  /// </li>
  /// </ul> <p/>
  /// Outbound:
  ///
  /// <ul>
  /// <li>
  /// Type: All traffic, Protocol: All, Range: All, Destination: 0.0.0.0/0
  /// </li>
  /// </ul>
  /// These security rules impact an internal network interface that is not
  /// exposed publicly.
  Future<void> addIpRoutes({
    required String directoryId,
    required List<IpRoute> ipRoutes,
    bool? updateSecurityGroupForDirectoryControllers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.AddIpRoutes'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'IpRoutes': ipRoutes,
        if (updateSecurityGroupForDirectoryControllers != null)
          'UpdateSecurityGroupForDirectoryControllers':
              updateSecurityGroupForDirectoryControllers,
      },
    );
  }

  /// Adds two domain controllers in the specified Region for the specified
  /// directory.
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [DirectoryAlreadyInRegionException].
  /// May throw [UnsupportedOperationException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [RegionLimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory to which you want to add Region
  /// replication.
  ///
  /// Parameter [regionName] :
  /// The name of the Region where you want to add domain controllers for
  /// replication. For example, <code>us-east-1</code>.
  Future<void> addRegion({
    required String directoryId,
    required String regionName,
    required DirectoryVpcSettings vPCSettings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.AddRegion'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'RegionName': regionName,
        'VPCSettings': vPCSettings,
      },
    );
  }

  /// Adds or overwrites one or more tags for the specified directory. Each
  /// directory can have a maximum of 50 tags. Each tag consists of a key and
  /// optional value. Tag keys must be unique to each resource.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [TagLimitExceededException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [resourceId] :
  /// Identifier (ID) for the directory to which to add the tag.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the directory.
  Future<void> addTagsToResource({
    required String resourceId,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.AddTagsToResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'Tags': tags,
      },
    );
  }

  /// Cancels an in-progress schema extension to a Microsoft AD directory. Once
  /// a schema extension has started replicating to all domain controllers, the
  /// task can no longer be canceled. A schema extension can be canceled during
  /// any of the following states; <code>Initializing</code>,
  /// <code>CreatingSnapshot</code>, and <code>UpdatingSchema</code>.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory whose schema extension will be canceled.
  ///
  /// Parameter [schemaExtensionId] :
  /// The identifier of the schema extension that will be canceled.
  Future<void> cancelSchemaExtension({
    required String directoryId,
    required String schemaExtensionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CancelSchemaExtension'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'SchemaExtensionId': schemaExtensionId,
      },
    );
  }

  /// Creates an AD Connector to connect to a self-managed directory.
  ///
  /// Before you call <code>ConnectDirectory</code>, ensure that all of the
  /// required permissions have been explicitly granted through a policy. For
  /// details about what permissions are required to run the
  /// <code>ConnectDirectory</code> operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">Directory
  /// Service API Permissions: Actions, Resources, and Conditions Reference</a>.
  ///
  /// May throw [DirectoryLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [connectSettings] :
  /// A <a>DirectoryConnectSettings</a> object that contains additional
  /// information for the operation.
  ///
  /// Parameter [name] :
  /// The fully qualified name of your self-managed directory, such as
  /// <code>corp.example.com</code>.
  ///
  /// Parameter [password] :
  /// The password for your self-managed user account.
  ///
  /// Parameter [size] :
  /// The size of the directory.
  ///
  /// Parameter [description] :
  /// A description for the directory.
  ///
  /// Parameter [shortName] :
  /// The NetBIOS name of your self-managed directory, such as
  /// <code>CORP</code>.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to AD Connector.
  Future<ConnectDirectoryResult> connectDirectory({
    required DirectoryConnectSettings connectSettings,
    required String name,
    required String password,
    required DirectorySize size,
    String? description,
    String? shortName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ConnectDirectory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectSettings': connectSettings,
        'Name': name,
        'Password': password,
        'Size': size.toValue(),
        if (description != null) 'Description': description,
        if (shortName != null) 'ShortName': shortName,
        if (tags != null) 'Tags': tags,
      },
    );

    return ConnectDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Creates an alias for a directory and assigns the alias to the directory.
  /// The alias is used to construct the access URL for the directory, such as
  /// <code>http://&lt;alias&gt;.awsapps.com</code>.
  /// <important>
  /// After an alias has been created, it cannot be deleted or reused, so this
  /// operation should only be used when absolutely necessary.
  /// </important>
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [alias] :
  /// The requested alias.
  ///
  /// The alias must be unique amongst all aliases in Amazon Web Services. This
  /// operation throws an <code>EntityAlreadyExistsException</code> error if the
  /// alias already exists.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to create the alias.
  Future<CreateAliasResult> createAlias({
    required String alias,
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Alias': alias,
        'DirectoryId': directoryId,
      },
    );

    return CreateAliasResult.fromJson(jsonResponse.body);
  }

  /// Creates an Active Directory computer object in the specified directory.
  ///
  /// May throw [AuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [computerName] :
  /// The name of the computer account.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory in which to create the computer account.
  ///
  /// Parameter [password] :
  /// A one-time password that is used to join the computer to the directory.
  /// You should generate a random, strong password to use for this parameter.
  ///
  /// Parameter [computerAttributes] :
  /// An array of <a>Attribute</a> objects that contain any LDAP attributes to
  /// apply to the computer account.
  ///
  /// Parameter [organizationalUnitDistinguishedName] :
  /// The fully-qualified distinguished name of the organizational unit to place
  /// the computer account in.
  Future<CreateComputerResult> createComputer({
    required String computerName,
    required String directoryId,
    required String password,
    List<Attribute>? computerAttributes,
    String? organizationalUnitDistinguishedName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateComputer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComputerName': computerName,
        'DirectoryId': directoryId,
        'Password': password,
        if (computerAttributes != null)
          'ComputerAttributes': computerAttributes,
        if (organizationalUnitDistinguishedName != null)
          'OrganizationalUnitDistinguishedName':
              organizationalUnitDistinguishedName,
      },
    );

    return CreateComputerResult.fromJson(jsonResponse.body);
  }

  /// Creates a conditional forwarder associated with your Amazon Web Services
  /// directory. Conditional forwarders are required in order to set up a trust
  /// relationship with another domain. The conditional forwarder points to the
  /// trusted domain.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The directory ID of the Amazon Web Services directory for which you are
  /// creating the conditional forwarder.
  ///
  /// Parameter [dnsIpAddrs] :
  /// The IP addresses of the remote DNS server associated with
  /// RemoteDomainName.
  ///
  /// Parameter [remoteDomainName] :
  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// will set up a trust relationship.
  Future<void> createConditionalForwarder({
    required String directoryId,
    required List<String> dnsIpAddrs,
    required String remoteDomainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateConditionalForwarder'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'DnsIpAddrs': dnsIpAddrs,
        'RemoteDomainName': remoteDomainName,
      },
    );
  }

  /// Creates a Simple AD directory. For more information, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_simple_ad.html">Simple
  /// Active Directory</a> in the <i>Directory Service Admin Guide</i>.
  ///
  /// Before you call <code>CreateDirectory</code>, ensure that all of the
  /// required permissions have been explicitly granted through a policy. For
  /// details about what permissions are required to run the
  /// <code>CreateDirectory</code> operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">Directory
  /// Service API Permissions: Actions, Resources, and Conditions Reference</a>.
  ///
  /// May throw [DirectoryLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [name] :
  /// The fully qualified name for the directory, such as
  /// <code>corp.example.com</code>.
  ///
  /// Parameter [password] :
  /// The password for the directory administrator. The directory creation
  /// process creates a directory administrator account with the user name
  /// <code>Administrator</code> and this password.
  ///
  /// If you need to change the password for the administrator account, you can
  /// use the <a>ResetUserPassword</a> API call.
  ///
  /// The regex pattern for this string is made up of the following conditions:
  ///
  /// <ul>
  /// <li>
  /// Length (?=^.{8,64}$) – Must be between 8 and 64 characters
  /// </li>
  /// </ul>
  /// AND any 3 of the following password complexity rules required by Active
  /// Directory:
  ///
  /// <ul>
  /// <li>
  /// Numbers and upper case and lowercase (?=.*\d)(?=.*[A-Z])(?=.*[a-z])
  /// </li>
  /// <li>
  /// Numbers and special characters and lower case
  /// (?=.*\d)(?=.*[^A-Za-z0-9\s])(?=.*[a-z])
  /// </li>
  /// <li>
  /// Special characters and upper case and lower case
  /// (?=.*[^A-Za-z0-9\s])(?=.*[A-Z])(?=.*[a-z])
  /// </li>
  /// <li>
  /// Numbers and upper case and special characters
  /// (?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9\s])
  /// </li>
  /// </ul>
  /// For additional information about how Active Directory passwords are
  /// enforced, see <a
  /// href="https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/password-must-meet-complexity-requirements">Password
  /// must meet complexity requirements</a> on the Microsoft website.
  ///
  /// Parameter [size] :
  /// The size of the directory.
  ///
  /// Parameter [description] :
  /// A description for the directory.
  ///
  /// Parameter [shortName] :
  /// The NetBIOS name of the directory, such as <code>CORP</code>.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Simple AD directory.
  ///
  /// Parameter [vpcSettings] :
  /// A <a>DirectoryVpcSettings</a> object that contains additional information
  /// for the operation.
  Future<CreateDirectoryResult> createDirectory({
    required String name,
    required String password,
    required DirectorySize size,
    String? description,
    String? shortName,
    List<Tag>? tags,
    DirectoryVpcSettings? vpcSettings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateDirectory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Password': password,
        'Size': size.toValue(),
        if (description != null) 'Description': description,
        if (shortName != null) 'ShortName': shortName,
        if (tags != null) 'Tags': tags,
        if (vpcSettings != null) 'VpcSettings': vpcSettings,
      },
    );

    return CreateDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Creates a subscription to forward real-time Directory Service domain
  /// controller security logs to the specified Amazon CloudWatch log group in
  /// your Amazon Web Services account.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InsufficientPermissionsException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// Identifier of the directory to which you want to subscribe and receive
  /// real-time logs to your specified CloudWatch log group.
  ///
  /// Parameter [logGroupName] :
  /// The name of the CloudWatch log group where the real-time domain controller
  /// logs are forwarded.
  Future<void> createLogSubscription({
    required String directoryId,
    required String logGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateLogSubscription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'LogGroupName': logGroupName,
      },
    );
  }

  /// Creates a Microsoft AD directory in the Amazon Web Services Cloud. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html">Managed
  /// Microsoft AD</a> in the <i>Directory Service Admin Guide</i>.
  ///
  /// Before you call <i>CreateMicrosoftAD</i>, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the <i>CreateMicrosoftAD</i>
  /// operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">Directory
  /// Service API Permissions: Actions, Resources, and Conditions Reference</a>.
  ///
  /// May throw [DirectoryLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [name] :
  /// The fully qualified domain name for the Managed Microsoft AD directory,
  /// such as <code>corp.example.com</code>. This name will resolve inside your
  /// VPC only. It does not need to be publicly resolvable.
  ///
  /// Parameter [password] :
  /// The password for the default administrative user named <code>Admin</code>.
  ///
  /// If you need to change the password for the administrator account, you can
  /// use the <a>ResetUserPassword</a> API call.
  ///
  /// Parameter [vpcSettings] :
  /// Contains VPC information for the <a>CreateDirectory</a> or
  /// <a>CreateMicrosoftAD</a> operation.
  ///
  /// Parameter [description] :
  /// A description for the directory. This label will appear on the Amazon Web
  /// Services console <code>Directory Details</code> page after the directory
  /// is created.
  ///
  /// Parameter [edition] :
  /// Managed Microsoft AD is available in two editions: <code>Standard</code>
  /// and <code>Enterprise</code>. <code>Enterprise</code> is the default.
  ///
  /// Parameter [shortName] :
  /// The NetBIOS name for your domain, such as <code>CORP</code>. If you don't
  /// specify a NetBIOS name, it will default to the first part of your
  /// directory DNS. For example, <code>CORP</code> for the directory DNS
  /// <code>corp.example.com</code>.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Managed Microsoft AD directory.
  Future<CreateMicrosoftADResult> createMicrosoftAD({
    required String name,
    required String password,
    required DirectoryVpcSettings vpcSettings,
    String? description,
    DirectoryEdition? edition,
    String? shortName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateMicrosoftAD'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Password': password,
        'VpcSettings': vpcSettings,
        if (description != null) 'Description': description,
        if (edition != null) 'Edition': edition.toValue(),
        if (shortName != null) 'ShortName': shortName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateMicrosoftADResult.fromJson(jsonResponse.body);
  }

  /// Creates a snapshot of a Simple AD or Microsoft AD directory in the Amazon
  /// Web Services cloud.
  /// <note>
  /// You cannot take snapshots of AD Connector directories.
  /// </note>
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [SnapshotLimitExceededException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory of which to take a snapshot.
  ///
  /// Parameter [name] :
  /// The descriptive name to apply to the snapshot.
  Future<CreateSnapshotResult> createSnapshot({
    required String directoryId,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (name != null) 'Name': name,
      },
    );

    return CreateSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Directory Service for Microsoft Active Directory allows you to configure
  /// trust relationships. For example, you can establish a trust between your
  /// Managed Microsoft AD directory, and your existing self-managed Microsoft
  /// Active Directory. This would allow you to provide users and groups access
  /// to resources in either domain, with a single set of credentials.
  ///
  /// This action initiates the creation of the Amazon Web Services side of a
  /// trust relationship between an Managed Microsoft AD directory and an
  /// external domain. You can create either a forest trust or an external
  /// trust.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The Directory ID of the Managed Microsoft AD directory for which to
  /// establish the trust relationship.
  ///
  /// Parameter [remoteDomainName] :
  /// The Fully Qualified Domain Name (FQDN) of the external domain for which to
  /// create the trust relationship.
  ///
  /// Parameter [trustDirection] :
  /// The direction of the trust relationship.
  ///
  /// Parameter [trustPassword] :
  /// The trust password. The must be the same password that was used when
  /// creating the trust relationship on the external domain.
  ///
  /// Parameter [conditionalForwarderIpAddrs] :
  /// The IP addresses of the remote DNS server associated with
  /// RemoteDomainName.
  ///
  /// Parameter [selectiveAuth] :
  /// Optional parameter to enable selective authentication for the trust.
  ///
  /// Parameter [trustType] :
  /// The trust relationship type. <code>Forest</code> is the default.
  Future<CreateTrustResult> createTrust({
    required String directoryId,
    required String remoteDomainName,
    required TrustDirection trustDirection,
    required String trustPassword,
    List<String>? conditionalForwarderIpAddrs,
    SelectiveAuth? selectiveAuth,
    TrustType? trustType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateTrust'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'RemoteDomainName': remoteDomainName,
        'TrustDirection': trustDirection.toValue(),
        'TrustPassword': trustPassword,
        if (conditionalForwarderIpAddrs != null)
          'ConditionalForwarderIpAddrs': conditionalForwarderIpAddrs,
        if (selectiveAuth != null) 'SelectiveAuth': selectiveAuth.toValue(),
        if (trustType != null) 'TrustType': trustType.toValue(),
      },
    );

    return CreateTrustResult.fromJson(jsonResponse.body);
  }

  /// Deletes a conditional forwarder that has been set up for your Amazon Web
  /// Services directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The directory ID for which you are deleting the conditional forwarder.
  ///
  /// Parameter [remoteDomainName] :
  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// are deleting the conditional forwarder.
  Future<void> deleteConditionalForwarder({
    required String directoryId,
    required String remoteDomainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeleteConditionalForwarder'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'RemoteDomainName': remoteDomainName,
      },
    );
  }

  /// Deletes an Directory Service directory.
  ///
  /// Before you call <code>DeleteDirectory</code>, ensure that all of the
  /// required permissions have been explicitly granted through a policy. For
  /// details about what permissions are required to run the
  /// <code>DeleteDirectory</code> operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">Directory
  /// Service API Permissions: Actions, Resources, and Conditions Reference</a>.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory to delete.
  Future<DeleteDirectoryResult> deleteDirectory({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeleteDirectory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
      },
    );

    return DeleteDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified log subscription.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// Identifier of the directory whose log subscription you want to delete.
  Future<void> deleteLogSubscription({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeleteLogSubscription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
      },
    );
  }

  /// Deletes a directory snapshot.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [snapshotId] :
  /// The identifier of the directory snapshot to be deleted.
  Future<DeleteSnapshotResult> deleteSnapshot({
    required String snapshotId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeleteSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SnapshotId': snapshotId,
      },
    );

    return DeleteSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Deletes an existing trust relationship between your Managed Microsoft AD
  /// directory and an external domain.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [trustId] :
  /// The Trust ID of the trust relationship to be deleted.
  ///
  /// Parameter [deleteAssociatedConditionalForwarder] :
  /// Delete a conditional forwarder as part of a DeleteTrustRequest.
  Future<DeleteTrustResult> deleteTrust({
    required String trustId,
    bool? deleteAssociatedConditionalForwarder,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeleteTrust'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrustId': trustId,
        if (deleteAssociatedConditionalForwarder != null)
          'DeleteAssociatedConditionalForwarder':
              deleteAssociatedConditionalForwarder,
      },
    );

    return DeleteTrustResult.fromJson(jsonResponse.body);
  }

  /// Deletes from the system the certificate that was registered for secure
  /// LDAP or client certificate authentication.
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [CertificateDoesNotExistException].
  /// May throw [CertificateInUseException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [certificateId] :
  /// The identifier of the certificate.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  Future<void> deregisterCertificate({
    required String certificateId,
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeregisterCertificate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateId': certificateId,
        'DirectoryId': directoryId,
      },
    );
  }

  /// Removes the specified directory as a publisher to the specified Amazon SNS
  /// topic.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The Directory ID to remove as a publisher. This directory will no longer
  /// send messages to the specified Amazon SNS topic.
  ///
  /// Parameter [topicName] :
  /// The name of the Amazon SNS topic from which to remove the directory as a
  /// publisher.
  Future<void> deregisterEventTopic({
    required String directoryId,
    required String topicName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeregisterEventTopic'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'TopicName': topicName,
      },
    );
  }

  /// Displays information about the certificate registered for secure LDAP or
  /// client certificate authentication.
  ///
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [CertificateDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [certificateId] :
  /// The identifier of the certificate.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  Future<DescribeCertificateResult> describeCertificate({
    required String certificateId,
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateId': certificateId,
        'DirectoryId': directoryId,
      },
    );

    return DescribeCertificateResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the type of client authentication for the
  /// specified directory, if the type is specified. If no type is specified,
  /// information about all client authentication types that are supported for
  /// the specified directory is retrieved. Currently, only
  /// <code>SmartCard</code> is supported.
  ///
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to retrieve information.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return. If this value is zero, the maximum
  /// number of items is specified by the limitations of the operation.
  ///
  /// Parameter [nextToken] :
  /// The <i>DescribeClientAuthenticationSettingsResult.NextToken</i> value from
  /// a previous call to <a>DescribeClientAuthenticationSettings</a>. Pass null
  /// if this is the first call.
  ///
  /// Parameter [type] :
  /// The type of client authentication for which to retrieve information. If no
  /// type is specified, a list of all client authentication types that are
  /// supported for the specified directory is retrieved.
  Future<DescribeClientAuthenticationSettingsResult>
      describeClientAuthenticationSettings({
    required String directoryId,
    int? limit,
    String? nextToken,
    ClientAuthenticationType? type,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'DirectoryService_20150416.DescribeClientAuthenticationSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return DescribeClientAuthenticationSettingsResult.fromJson(
        jsonResponse.body);
  }

  /// Obtains information about the conditional forwarders for this account.
  ///
  /// If no input parameters are provided for RemoteDomainNames, this request
  /// describes all conditional forwarders for the specified directory ID.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The directory ID for which to get the list of associated conditional
  /// forwarders.
  ///
  /// Parameter [remoteDomainNames] :
  /// The fully qualified domain names (FQDN) of the remote domains for which to
  /// get the list of associated conditional forwarders. If this member is null,
  /// all conditional forwarders are returned.
  Future<DescribeConditionalForwardersResult> describeConditionalForwarders({
    required String directoryId,
    List<String>? remoteDomainNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeConditionalForwarders'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (remoteDomainNames != null) 'RemoteDomainNames': remoteDomainNames,
      },
    );

    return DescribeConditionalForwardersResult.fromJson(jsonResponse.body);
  }

  /// Obtains information about the directories that belong to this account.
  ///
  /// You can retrieve information about specific directories by passing the
  /// directory identifiers in the <code>DirectoryIds</code> parameter.
  /// Otherwise, all directories that belong to the current account are
  /// returned.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> request and response parameters. If more results
  /// are available, the <code>DescribeDirectoriesResult.NextToken</code> member
  /// contains a token that you pass in the next call to
  /// <a>DescribeDirectories</a> to retrieve the next set of items.
  ///
  /// You can also specify a maximum number of return results with the
  /// <code>Limit</code> parameter.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryIds] :
  /// A list of identifiers of the directories for which to obtain the
  /// information. If this member is null, all directories that belong to the
  /// current account are returned.
  ///
  /// An empty list results in an <code>InvalidParameterException</code> being
  /// thrown.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return. If this value is zero, the maximum
  /// number of items is specified by the limitations of the operation.
  ///
  /// Parameter [nextToken] :
  /// The <code>DescribeDirectoriesResult.NextToken</code> value from a previous
  /// call to <a>DescribeDirectories</a>. Pass null if this is the first call.
  Future<DescribeDirectoriesResult> describeDirectories({
    List<String>? directoryIds,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeDirectories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (directoryIds != null) 'DirectoryIds': directoryIds,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeDirectoriesResult.fromJson(jsonResponse.body);
  }

  /// Provides information about any domain controllers in your directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// Identifier of the directory for which to retrieve the domain controller
  /// information.
  ///
  /// Parameter [domainControllerIds] :
  /// A list of identifiers for the domain controllers whose information will be
  /// provided.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// The <i>DescribeDomainControllers.NextToken</i> value from a previous call
  /// to <a>DescribeDomainControllers</a>. Pass null if this is the first call.
  Future<DescribeDomainControllersResult> describeDomainControllers({
    required String directoryId,
    List<String>? domainControllerIds,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeDomainControllers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (domainControllerIds != null)
          'DomainControllerIds': domainControllerIds,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeDomainControllersResult.fromJson(jsonResponse.body);
  }

  /// Obtains information about which Amazon SNS topics receive status messages
  /// from the specified directory.
  ///
  /// If no input parameters are provided, such as DirectoryId or TopicName,
  /// this request describes all of the associations in the account.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The Directory ID for which to get the list of associated Amazon SNS
  /// topics. If this member is null, associations for all Directory IDs are
  /// returned.
  ///
  /// Parameter [topicNames] :
  /// A list of Amazon SNS topic names for which to obtain the information. If
  /// this member is null, all associations for the specified Directory ID are
  /// returned.
  ///
  /// An empty list results in an <code>InvalidParameterException</code> being
  /// thrown.
  Future<DescribeEventTopicsResult> describeEventTopics({
    String? directoryId,
    List<String>? topicNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeEventTopics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (directoryId != null) 'DirectoryId': directoryId,
        if (topicNames != null) 'TopicNames': topicNames,
      },
    );

    return DescribeEventTopicsResult.fromJson(jsonResponse.body);
  }

  /// Describes the status of LDAP security for the specified directory.
  ///
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  ///
  /// Parameter [limit] :
  /// Specifies the number of items that should be displayed on one page.
  ///
  /// Parameter [nextToken] :
  /// The type of next token used for pagination.
  ///
  /// Parameter [type] :
  /// The type of LDAP security to enable. Currently only the value
  /// <code>Client</code> is supported.
  Future<DescribeLDAPSSettingsResult> describeLDAPSSettings({
    required String directoryId,
    int? limit,
    String? nextToken,
    LDAPSType? type,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeLDAPSSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return DescribeLDAPSSettingsResult.fromJson(jsonResponse.body);
  }

  /// Provides information about the Regions that are configured for
  /// multi-Region replication.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  ///
  /// Parameter [nextToken] :
  /// The <code>DescribeRegionsResult.NextToken</code> value from a previous
  /// call to <a>DescribeRegions</a>. Pass null if this is the first call.
  ///
  /// Parameter [regionName] :
  /// The name of the Region. For example, <code>us-east-1</code>.
  Future<DescribeRegionsResult> describeRegions({
    required String directoryId,
    String? nextToken,
    String? regionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeRegions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (nextToken != null) 'NextToken': nextToken,
        if (regionName != null) 'RegionName': regionName,
      },
    );

    return DescribeRegionsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the configurable settings for the specified
  /// directory.
  ///
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to retrieve information.
  ///
  /// Parameter [nextToken] :
  /// The <code>DescribeSettingsResult.NextToken</code> value from a previous
  /// call to <a>DescribeSettings</a>. Pass null if this is the first call.
  ///
  /// Parameter [status] :
  /// The status of the directory settings for which to retrieve information.
  Future<DescribeSettingsResult> describeSettings({
    required String directoryId,
    String? nextToken,
    DirectoryConfigurationStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return DescribeSettingsResult.fromJson(jsonResponse.body);
  }

  /// Returns the shared directories in your account.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [ownerDirectoryId] :
  /// Returns the identifier of the directory in the directory owner account.
  ///
  /// Parameter [limit] :
  /// The number of shared directories to return in the response object.
  ///
  /// Parameter [nextToken] :
  /// The <code>DescribeSharedDirectoriesResult.NextToken</code> value from a
  /// previous call to <a>DescribeSharedDirectories</a>. Pass null if this is
  /// the first call.
  ///
  /// Parameter [sharedDirectoryIds] :
  /// A list of identifiers of all shared directories in your account.
  Future<DescribeSharedDirectoriesResult> describeSharedDirectories({
    required String ownerDirectoryId,
    int? limit,
    String? nextToken,
    List<String>? sharedDirectoryIds,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeSharedDirectories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OwnerDirectoryId': ownerDirectoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (sharedDirectoryIds != null)
          'SharedDirectoryIds': sharedDirectoryIds,
      },
    );

    return DescribeSharedDirectoriesResult.fromJson(jsonResponse.body);
  }

  /// Obtains information about the directory snapshots that belong to this
  /// account.
  ///
  /// This operation supports pagination with the use of the <i>NextToken</i>
  /// request and response parameters. If more results are available, the
  /// <i>DescribeSnapshots.NextToken</i> member contains a token that you pass
  /// in the next call to <a>DescribeSnapshots</a> to retrieve the next set of
  /// items.
  ///
  /// You can also specify a maximum number of return results with the
  /// <i>Limit</i> parameter.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to retrieve snapshot
  /// information.
  ///
  /// Parameter [limit] :
  /// The maximum number of objects to return.
  ///
  /// Parameter [nextToken] :
  /// The <i>DescribeSnapshotsResult.NextToken</i> value from a previous call to
  /// <a>DescribeSnapshots</a>. Pass null if this is the first call.
  ///
  /// Parameter [snapshotIds] :
  /// A list of identifiers of the snapshots to obtain the information for. If
  /// this member is null or empty, all snapshots are returned using the
  /// <i>Limit</i> and <i>NextToken</i> members.
  Future<DescribeSnapshotsResult> describeSnapshots({
    String? directoryId,
    int? limit,
    String? nextToken,
    List<String>? snapshotIds,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (directoryId != null) 'DirectoryId': directoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (snapshotIds != null) 'SnapshotIds': snapshotIds,
      },
    );

    return DescribeSnapshotsResult.fromJson(jsonResponse.body);
  }

  /// Obtains information about the trust relationships for this account.
  ///
  /// If no input parameters are provided, such as DirectoryId or TrustIds, this
  /// request describes all the trust relationships belonging to the account.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The Directory ID of the Amazon Web Services directory that is a part of
  /// the requested trust relationship.
  ///
  /// Parameter [limit] :
  /// The maximum number of objects to return.
  ///
  /// Parameter [nextToken] :
  /// The <i>DescribeTrustsResult.NextToken</i> value from a previous call to
  /// <a>DescribeTrusts</a>. Pass null if this is the first call.
  ///
  /// Parameter [trustIds] :
  /// A list of identifiers of the trust relationships for which to obtain the
  /// information. If this member is null, all trust relationships that belong
  /// to the current account are returned.
  ///
  /// An empty list results in an <code>InvalidParameterException</code> being
  /// thrown.
  Future<DescribeTrustsResult> describeTrusts({
    String? directoryId,
    int? limit,
    String? nextToken,
    List<String>? trustIds,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeTrusts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (directoryId != null) 'DirectoryId': directoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (trustIds != null) 'TrustIds': trustIds,
      },
    );

    return DescribeTrustsResult.fromJson(jsonResponse.body);
  }

  /// Describes the updates of a directory for a particular update type.
  ///
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [directoryId] :
  /// The unique identifier of the directory.
  ///
  /// Parameter [updateType] :
  /// The type of updates you want to describe for the directory.
  ///
  /// Parameter [nextToken] :
  /// The <code>DescribeUpdateDirectoryResult</code>. NextToken value from a
  /// previous call to <a>DescribeUpdateDirectory</a>. Pass null if this is the
  /// first call.
  ///
  /// Parameter [regionName] :
  /// The name of the Region.
  Future<DescribeUpdateDirectoryResult> describeUpdateDirectory({
    required String directoryId,
    required UpdateType updateType,
    String? nextToken,
    String? regionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeUpdateDirectory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'UpdateType': updateType.toValue(),
        if (nextToken != null) 'NextToken': nextToken,
        if (regionName != null) 'RegionName': regionName,
      },
    );

    return DescribeUpdateDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Disables alternative client authentication methods for the specified
  /// directory.
  ///
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidClientAuthStatusException].
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory
  ///
  /// Parameter [type] :
  /// The type of client authentication to disable. Currently, only the
  /// parameter, <code>SmartCard</code> is supported.
  Future<void> disableClientAuthentication({
    required String directoryId,
    required ClientAuthenticationType type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableClientAuthentication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'Type': type.toValue(),
      },
    );
  }

  /// Deactivates LDAP secure calls for the specified directory.
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidLDAPSStatusException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  ///
  /// Parameter [type] :
  /// The type of LDAP security to enable. Currently only the value
  /// <code>Client</code> is supported.
  Future<void> disableLDAPS({
    required String directoryId,
    required LDAPSType type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableLDAPS'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'Type': type.toValue(),
      },
    );
  }

  /// Disables multi-factor authentication (MFA) with the Remote Authentication
  /// Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD
  /// directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to disable MFA.
  Future<void> disableRadius({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableRadius'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
      },
    );
  }

  /// Disables single-sign on for a directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InsufficientPermissionsException].
  /// May throw [AuthenticationFailedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to disable single-sign on.
  ///
  /// Parameter [password] :
  /// The password of an alternate account to use to disable single-sign on.
  /// This is only used for AD Connector directories. For more information, see
  /// the <i>UserName</i> parameter.
  ///
  /// Parameter [userName] :
  /// The username of an alternate account to use to disable single-sign on.
  /// This is only used for AD Connector directories. This account must have
  /// privileges to remove a service principal name.
  ///
  /// If the AD Connector service account does not have privileges to remove a
  /// service principal name, you can specify an alternate account with the
  /// <i>UserName</i> and <i>Password</i> parameters. These credentials are only
  /// used to disable single sign-on and are not stored by the service. The AD
  /// Connector service account is not changed.
  Future<void> disableSso({
    required String directoryId,
    String? password,
    String? userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableSso'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (password != null) 'Password': password,
        if (userName != null) 'UserName': userName,
      },
    );
  }

  /// Enables alternative client authentication methods for the specified
  /// directory.
  ///
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidClientAuthStatusException].
  /// May throw [AccessDeniedException].
  /// May throw [NoAvailableCertificateException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the specified directory.
  ///
  /// Parameter [type] :
  /// The type of client authentication to enable. Currently only the value
  /// <code>SmartCard</code> is supported. Smart card authentication in AD
  /// Connector requires that you enable Kerberos Constrained Delegation for the
  /// Service User to the LDAP service in your self-managed AD.
  Future<void> enableClientAuthentication({
    required String directoryId,
    required ClientAuthenticationType type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableClientAuthentication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'Type': type.toValue(),
      },
    );
  }

  /// Activates the switch for the specific directory to always use LDAP secure
  /// calls.
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [NoAvailableCertificateException].
  /// May throw [InvalidLDAPSStatusException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  ///
  /// Parameter [type] :
  /// The type of LDAP security to enable. Currently only the value
  /// <code>Client</code> is supported.
  Future<void> enableLDAPS({
    required String directoryId,
    required LDAPSType type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableLDAPS'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'Type': type.toValue(),
      },
    );
  }

  /// Enables multi-factor authentication (MFA) with the Remote Authentication
  /// Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD
  /// directory.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to enable MFA.
  ///
  /// Parameter [radiusSettings] :
  /// A <a>RadiusSettings</a> object that contains information about the RADIUS
  /// server.
  Future<void> enableRadius({
    required String directoryId,
    required RadiusSettings radiusSettings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableRadius'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'RadiusSettings': radiusSettings,
      },
    );
  }

  /// Enables single sign-on for a directory. Single sign-on allows users in
  /// your directory to access certain Amazon Web Services services from a
  /// computer joined to the directory without having to enter their credentials
  /// separately.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InsufficientPermissionsException].
  /// May throw [AuthenticationFailedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to enable single-sign on.
  ///
  /// Parameter [password] :
  /// The password of an alternate account to use to enable single-sign on. This
  /// is only used for AD Connector directories. For more information, see the
  /// <i>UserName</i> parameter.
  ///
  /// Parameter [userName] :
  /// The username of an alternate account to use to enable single-sign on. This
  /// is only used for AD Connector directories. This account must have
  /// privileges to add a service principal name.
  ///
  /// If the AD Connector service account does not have privileges to add a
  /// service principal name, you can specify an alternate account with the
  /// <i>UserName</i> and <i>Password</i> parameters. These credentials are only
  /// used to enable single sign-on and are not stored by the service. The AD
  /// Connector service account is not changed.
  Future<void> enableSso({
    required String directoryId,
    String? password,
    String? userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableSso'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (password != null) 'Password': password,
        if (userName != null) 'UserName': userName,
      },
    );
  }

  /// Obtains directory limit information for the current Region.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  Future<GetDirectoryLimitsResult> getDirectoryLimits() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.GetDirectoryLimits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetDirectoryLimitsResult.fromJson(jsonResponse.body);
  }

  /// Obtains the manual snapshot limits for a directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// Contains the identifier of the directory to obtain the limits for.
  Future<GetSnapshotLimitsResult> getSnapshotLimits({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.GetSnapshotLimits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
      },
    );

    return GetSnapshotLimitsResult.fromJson(jsonResponse.body);
  }

  /// For the specified directory, lists all the certificates registered for a
  /// secure LDAP or client certificate authentication.
  ///
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  ///
  /// Parameter [limit] :
  /// The number of items that should show up on one page
  ///
  /// Parameter [nextToken] :
  /// A token for requesting another page of certificates if the
  /// <code>NextToken</code> response element indicates that more certificates
  /// are available. Use the value of the returned <code>NextToken</code>
  /// element in your request until the token comes back as <code>null</code>.
  /// Pass <code>null</code> if this is the first call.
  Future<ListCertificatesResult> listCertificates({
    required String directoryId,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ListCertificates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCertificatesResult.fromJson(jsonResponse.body);
  }

  /// Lists the address blocks that you have added to a directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// Identifier (ID) of the directory for which you want to retrieve the IP
  /// addresses.
  ///
  /// Parameter [limit] :
  /// Maximum number of items to return. If this value is zero, the maximum
  /// number of items is specified by the limitations of the operation.
  ///
  /// Parameter [nextToken] :
  /// The <i>ListIpRoutes.NextToken</i> value from a previous call to
  /// <a>ListIpRoutes</a>. Pass null if this is the first call.
  Future<ListIpRoutesResult> listIpRoutes({
    required String directoryId,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ListIpRoutes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListIpRoutesResult.fromJson(jsonResponse.body);
  }

  /// Lists the active log subscriptions for the Amazon Web Services account.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// If a <i>DirectoryID</i> is provided, lists only the log subscription
  /// associated with that directory. If no <i>DirectoryId</i> is provided,
  /// lists all log subscriptions associated with your Amazon Web Services
  /// account. If there are no log subscriptions for the Amazon Web Services
  /// account or the directory, an empty list will be returned.
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return.
  Future<ListLogSubscriptionsResult> listLogSubscriptions({
    String? directoryId,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ListLogSubscriptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (directoryId != null) 'DirectoryId': directoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLogSubscriptionsResult.fromJson(jsonResponse.body);
  }

  /// Lists all schema extensions applied to a Microsoft AD Directory.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory from which to retrieve the schema
  /// extension information.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// The <code>ListSchemaExtensions.NextToken</code> value from a previous call
  /// to <code>ListSchemaExtensions</code>. Pass null if this is the first call.
  Future<ListSchemaExtensionsResult> listSchemaExtensions({
    required String directoryId,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ListSchemaExtensions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSchemaExtensionsResult.fromJson(jsonResponse.body);
  }

  /// Lists all tags on a directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [resourceId] :
  /// Identifier (ID) of the directory for which you want to retrieve tags.
  ///
  /// Parameter [limit] :
  /// Reserved for future use.
  ///
  /// Parameter [nextToken] :
  /// Reserved for future use.
  Future<ListTagsForResourceResult> listTagsForResource({
    required String resourceId,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResult.fromJson(jsonResponse.body);
  }

  /// Registers a certificate for a secure LDAP or client certificate
  /// authentication.
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidCertificateException].
  /// May throw [CertificateLimitExceededException].
  /// May throw [CertificateAlreadyExistsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [certificateData] :
  /// The certificate PEM string that needs to be registered.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  ///
  /// Parameter [clientCertAuthSettings] :
  /// A <code>ClientCertAuthSettings</code> object that contains client
  /// certificate authentication settings.
  ///
  /// Parameter [type] :
  /// The function that the registered certificate performs. Valid values
  /// include <code>ClientLDAPS</code> or <code>ClientCertAuth</code>. The
  /// default value is <code>ClientLDAPS</code>.
  Future<RegisterCertificateResult> registerCertificate({
    required String certificateData,
    required String directoryId,
    ClientCertAuthSettings? clientCertAuthSettings,
    CertificateType? type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RegisterCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateData': certificateData,
        'DirectoryId': directoryId,
        if (clientCertAuthSettings != null)
          'ClientCertAuthSettings': clientCertAuthSettings,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return RegisterCertificateResult.fromJson(jsonResponse.body);
  }

  /// Associates a directory with an Amazon SNS topic. This establishes the
  /// directory as a publisher to the specified Amazon SNS topic. You can then
  /// receive email or text (SMS) messages when the status of your directory
  /// changes. You get notified if your directory goes from an Active status to
  /// an Impaired or Inoperable status. You also receive a notification when the
  /// directory returns to an Active status.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The Directory ID that will publish status messages to the Amazon SNS
  /// topic.
  ///
  /// Parameter [topicName] :
  /// The Amazon SNS topic name to which the directory will publish status
  /// messages. This Amazon SNS topic must be in the same region as the
  /// specified Directory ID.
  Future<void> registerEventTopic({
    required String directoryId,
    required String topicName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RegisterEventTopic'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'TopicName': topicName,
      },
    );
  }

  /// Rejects a directory sharing request that was sent from the directory owner
  /// account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [DirectoryAlreadySharedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [sharedDirectoryId] :
  /// Identifier of the shared directory in the directory consumer account. This
  /// identifier is different for each directory owner account.
  Future<RejectSharedDirectoryResult> rejectSharedDirectory({
    required String sharedDirectoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RejectSharedDirectory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SharedDirectoryId': sharedDirectoryId,
      },
    );

    return RejectSharedDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Removes IP address blocks from a directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [cidrIps] :
  /// IP address blocks that you want to remove.
  ///
  /// Parameter [directoryId] :
  /// Identifier (ID) of the directory from which you want to remove the IP
  /// addresses.
  Future<void> removeIpRoutes({
    required List<String> cidrIps,
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RemoveIpRoutes'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CidrIps': cidrIps,
        'DirectoryId': directoryId,
      },
    );
  }

  /// Stops all replication and removes the domain controllers from the
  /// specified Region. You cannot remove the primary Region with this
  /// operation. Instead, use the <code>DeleteDirectory</code> API.
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which you want to remove Region
  /// replication.
  Future<void> removeRegion({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RemoveRegion'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
      },
    );
  }

  /// Removes tags from a directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [resourceId] :
  /// Identifier (ID) of the directory from which to remove the tag.
  ///
  /// Parameter [tagKeys] :
  /// The tag key (name) of the tag to be removed.
  Future<void> removeTagsFromResource({
    required String resourceId,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RemoveTagsFromResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Resets the password for any user in your Managed Microsoft AD or Simple AD
  /// directory.
  ///
  /// You can reset the password for any user in your directory with the
  /// following exceptions:
  ///
  /// <ul>
  /// <li>
  /// For Simple AD, you cannot reset the password for any user that is a member
  /// of either the <b>Domain Admins</b> or <b>Enterprise Admins</b> group
  /// except for the administrator user.
  /// </li>
  /// <li>
  /// For Managed Microsoft AD, you can only reset the password for a user that
  /// is in an OU based off of the NetBIOS name that you typed when you created
  /// your directory. For example, you cannot reset the password for a user in
  /// the <b>Amazon Web Services Reserved</b> OU. For more information about the
  /// OU structure for an Managed Microsoft AD directory, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_getting_started_what_gets_created.html">What
  /// Gets Created</a> in the <i>Directory Service Administration Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [UserDoesNotExistException].
  /// May throw [InvalidPasswordException].
  /// May throw [UnsupportedOperationException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// Identifier of the Managed Microsoft AD or Simple AD directory in which the
  /// user resides.
  ///
  /// Parameter [newPassword] :
  /// The new password that will be reset.
  ///
  /// Parameter [userName] :
  /// The user name of the user whose password will be reset.
  Future<void> resetUserPassword({
    required String directoryId,
    required String newPassword,
    required String userName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ResetUserPassword'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'NewPassword': newPassword,
        'UserName': userName,
      },
    );
  }

  /// Restores a directory using an existing directory snapshot.
  ///
  /// When you restore a directory from a snapshot, any changes made to the
  /// directory after the snapshot date are overwritten.
  ///
  /// This action returns as soon as the restore operation is initiated. You can
  /// monitor the progress of the restore operation by calling the
  /// <a>DescribeDirectories</a> operation with the directory identifier. When
  /// the <b>DirectoryDescription.Stage</b> value changes to
  /// <code>Active</code>, the restore operation is complete.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [snapshotId] :
  /// The identifier of the snapshot to restore from.
  Future<void> restoreFromSnapshot({
    required String snapshotId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RestoreFromSnapshot'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SnapshotId': snapshotId,
      },
    );
  }

  /// Shares a specified directory (<code>DirectoryId</code>) in your Amazon Web
  /// Services account (directory owner) with another Amazon Web Services
  /// account (directory consumer). With this operation you can use your
  /// directory from any Amazon Web Services account and from any Amazon VPC
  /// within an Amazon Web Services Region.
  ///
  /// When you share your Managed Microsoft AD directory, Directory Service
  /// creates a shared directory in the directory consumer account. This shared
  /// directory contains the metadata to provide access to the directory within
  /// the directory owner account. The shared directory is visible in all VPCs
  /// in the directory consumer account.
  ///
  /// The <code>ShareMethod</code> parameter determines whether the specified
  /// directory can be shared between Amazon Web Services accounts inside the
  /// same Amazon Web Services organization (<code>ORGANIZATIONS</code>). It
  /// also determines whether you can share the directory with any other Amazon
  /// Web Services account either inside or outside of the organization
  /// (<code>HANDSHAKE</code>).
  ///
  /// The <code>ShareNotes</code> parameter is only used when
  /// <code>HANDSHAKE</code> is called, which sends a directory sharing request
  /// to the directory consumer.
  ///
  /// May throw [DirectoryAlreadySharedException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidTargetException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ShareLimitExceededException].
  /// May throw [OrganizationsException].
  /// May throw [AccessDeniedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// Identifier of the Managed Microsoft AD directory that you want to share
  /// with other Amazon Web Services accounts.
  ///
  /// Parameter [shareMethod] :
  /// The method used when sharing a directory to determine whether the
  /// directory should be shared within your Amazon Web Services organization
  /// (<code>ORGANIZATIONS</code>) or with any Amazon Web Services account by
  /// sending a directory sharing request (<code>HANDSHAKE</code>).
  ///
  /// Parameter [shareTarget] :
  /// Identifier for the directory consumer account with whom the directory is
  /// to be shared.
  ///
  /// Parameter [shareNotes] :
  /// A directory share request that is sent by the directory owner to the
  /// directory consumer. The request includes a typed message to help the
  /// directory consumer administrator determine whether to approve or reject
  /// the share invitation.
  Future<ShareDirectoryResult> shareDirectory({
    required String directoryId,
    required ShareMethod shareMethod,
    required ShareTarget shareTarget,
    String? shareNotes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ShareDirectory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'ShareMethod': shareMethod.toValue(),
        'ShareTarget': shareTarget,
        if (shareNotes != null) 'ShareNotes': shareNotes,
      },
    );

    return ShareDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Applies a schema extension to a Microsoft AD directory.
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [SnapshotLimitExceededException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [createSnapshotBeforeSchemaExtension] :
  /// If true, creates a snapshot of the directory before applying the schema
  /// extension.
  ///
  /// Parameter [description] :
  /// A description of the schema extension.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which the schema extension will be
  /// applied to.
  ///
  /// Parameter [ldifContent] :
  /// The LDIF file represented as a string. To construct the LdifContent
  /// string, precede each line as it would be formatted in an ldif file with
  /// \n. See the example request below for more details. The file size can be
  /// no larger than 1MB.
  Future<StartSchemaExtensionResult> startSchemaExtension({
    required bool createSnapshotBeforeSchemaExtension,
    required String description,
    required String directoryId,
    required String ldifContent,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.StartSchemaExtension'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreateSnapshotBeforeSchemaExtension':
            createSnapshotBeforeSchemaExtension,
        'Description': description,
        'DirectoryId': directoryId,
        'LdifContent': ldifContent,
      },
    );

    return StartSchemaExtensionResult.fromJson(jsonResponse.body);
  }

  /// Stops the directory sharing between the directory owner and consumer
  /// accounts.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidTargetException].
  /// May throw [DirectoryNotSharedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the Managed Microsoft AD directory that you want to stop
  /// sharing.
  ///
  /// Parameter [unshareTarget] :
  /// Identifier for the directory consumer account with whom the directory has
  /// to be unshared.
  Future<UnshareDirectoryResult> unshareDirectory({
    required String directoryId,
    required UnshareTarget unshareTarget,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.UnshareDirectory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'UnshareTarget': unshareTarget,
      },
    );

    return UnshareDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Updates a conditional forwarder that has been set up for your Amazon Web
  /// Services directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The directory ID of the Amazon Web Services directory for which to update
  /// the conditional forwarder.
  ///
  /// Parameter [dnsIpAddrs] :
  /// The updated IP addresses of the remote DNS server associated with the
  /// conditional forwarder.
  ///
  /// Parameter [remoteDomainName] :
  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// will set up a trust relationship.
  Future<void> updateConditionalForwarder({
    required String directoryId,
    required List<String> dnsIpAddrs,
    required String remoteDomainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.UpdateConditionalForwarder'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'DnsIpAddrs': dnsIpAddrs,
        'RemoteDomainName': remoteDomainName,
      },
    );
  }

  /// Updates the directory for a particular update type.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [DirectoryInDesiredStateException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [SnapshotLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory on which you want to perform the update.
  ///
  /// Parameter [updateType] :
  /// The type of update that needs to be performed on the directory. For
  /// example, OS.
  ///
  /// Parameter [createSnapshotBeforeUpdate] :
  /// The boolean that specifies if a snapshot for the directory needs to be
  /// taken before updating the directory.
  ///
  /// Parameter [oSUpdateSettings] :
  /// The settings for the OS update that needs to be performed on the
  /// directory.
  Future<void> updateDirectorySetup({
    required String directoryId,
    required UpdateType updateType,
    bool? createSnapshotBeforeUpdate,
    OSUpdateSettings? oSUpdateSettings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.UpdateDirectorySetup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'UpdateType': updateType.toValue(),
        if (createSnapshotBeforeUpdate != null)
          'CreateSnapshotBeforeUpdate': createSnapshotBeforeUpdate,
        if (oSUpdateSettings != null) 'OSUpdateSettings': oSUpdateSettings,
      },
    );
  }

  /// Adds or removes domain controllers to or from the directory. Based on the
  /// difference between current value and new value (provided through this API
  /// call), domain controllers will be added or removed. It may take up to 45
  /// minutes for any new domain controllers to become fully active once the
  /// requested number of domain controllers is updated. During this time, you
  /// cannot make another update request.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [DomainControllerLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [desiredNumber] :
  /// The number of domain controllers desired in the directory.
  ///
  /// Parameter [directoryId] :
  /// Identifier of the directory to which the domain controllers will be added
  /// or removed.
  Future<void> updateNumberOfDomainControllers({
    required int desiredNumber,
    required String directoryId,
  }) async {
    _s.validateNumRange(
      'desiredNumber',
      desiredNumber,
      2,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'DirectoryService_20150416.UpdateNumberOfDomainControllers'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DesiredNumber': desiredNumber,
        'DirectoryId': directoryId,
      },
    );
  }

  /// Updates the Remote Authentication Dial In User Service (RADIUS) server
  /// information for an AD Connector or Microsoft AD directory.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to update the RADIUS server
  /// information.
  ///
  /// Parameter [radiusSettings] :
  /// A <a>RadiusSettings</a> object that contains information about the RADIUS
  /// server.
  Future<void> updateRadius({
    required String directoryId,
    required RadiusSettings radiusSettings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.UpdateRadius'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'RadiusSettings': radiusSettings,
      },
    );
  }

  /// Updates the configurable settings for the specified directory.
  ///
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [UnsupportedOperationException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [IncompatibleSettingsException].
  /// May throw [UnsupportedSettingsException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to update settings.
  ///
  /// Parameter [settings] :
  /// The list of <a>Setting</a> objects.
  Future<UpdateSettingsResult> updateSettings({
    required String directoryId,
    required List<Setting> settings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.UpdateSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'Settings': settings,
      },
    );

    return UpdateSettingsResult.fromJson(jsonResponse.body);
  }

  /// Updates the trust that has been set up between your Managed Microsoft AD
  /// directory and an self-managed Active Directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [trustId] :
  /// Identifier of the trust relationship.
  ///
  /// Parameter [selectiveAuth] :
  /// Updates selective authentication for the trust.
  Future<UpdateTrustResult> updateTrust({
    required String trustId,
    SelectiveAuth? selectiveAuth,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.UpdateTrust'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrustId': trustId,
        if (selectiveAuth != null) 'SelectiveAuth': selectiveAuth.toValue(),
      },
    );

    return UpdateTrustResult.fromJson(jsonResponse.body);
  }

  /// Directory Service for Microsoft Active Directory allows you to configure
  /// and verify trust relationships.
  ///
  /// This action verifies a trust relationship between your Managed Microsoft
  /// AD directory and an external domain.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [trustId] :
  /// The unique Trust ID of the trust relationship to verify.
  Future<VerifyTrustResult> verifyTrust({
    required String trustId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.VerifyTrust'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrustId': trustId,
      },
    );

    return VerifyTrustResult.fromJson(jsonResponse.body);
  }
}

class AcceptSharedDirectoryResult {
  /// The shared directory in the directory consumer account.
  final SharedDirectory? sharedDirectory;

  AcceptSharedDirectoryResult({
    this.sharedDirectory,
  });

  factory AcceptSharedDirectoryResult.fromJson(Map<String, dynamic> json) {
    return AcceptSharedDirectoryResult(
      sharedDirectory: json['SharedDirectory'] != null
          ? SharedDirectory.fromJson(
              json['SharedDirectory'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sharedDirectory = this.sharedDirectory;
    return {
      if (sharedDirectory != null) 'SharedDirectory': sharedDirectory,
    };
  }
}

class AddIpRoutesResult {
  AddIpRoutesResult();

  factory AddIpRoutesResult.fromJson(Map<String, dynamic> _) {
    return AddIpRoutesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AddRegionResult {
  AddRegionResult();

  factory AddRegionResult.fromJson(Map<String, dynamic> _) {
    return AddRegionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AddTagsToResourceResult {
  AddTagsToResourceResult();

  factory AddTagsToResourceResult.fromJson(Map<String, dynamic> _) {
    return AddTagsToResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a named directory attribute.
class Attribute {
  /// The name of the attribute.
  final String? name;

  /// The value of the attribute.
  final String? value;

  Attribute({
    this.name,
    this.value,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

class CancelSchemaExtensionResult {
  CancelSchemaExtensionResult();

  factory CancelSchemaExtensionResult.fromJson(Map<String, dynamic> _) {
    return CancelSchemaExtensionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about the certificate.
class Certificate {
  /// The identifier of the certificate.
  final String? certificateId;

  /// A <code>ClientCertAuthSettings</code> object that contains client
  /// certificate authentication settings.
  final ClientCertAuthSettings? clientCertAuthSettings;

  /// The common name for the certificate.
  final String? commonName;

  /// The date and time when the certificate will expire.
  final DateTime? expiryDateTime;

  /// The date and time that the certificate was registered.
  final DateTime? registeredDateTime;

  /// The state of the certificate.
  final CertificateState? state;

  /// Describes a state change for the certificate.
  final String? stateReason;

  /// The function that the registered certificate performs. Valid values include
  /// <code>ClientLDAPS</code> or <code>ClientCertAuth</code>. The default value
  /// is <code>ClientLDAPS</code>.
  final CertificateType? type;

  Certificate({
    this.certificateId,
    this.clientCertAuthSettings,
    this.commonName,
    this.expiryDateTime,
    this.registeredDateTime,
    this.state,
    this.stateReason,
    this.type,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      certificateId: json['CertificateId'] as String?,
      clientCertAuthSettings: json['ClientCertAuthSettings'] != null
          ? ClientCertAuthSettings.fromJson(
              json['ClientCertAuthSettings'] as Map<String, dynamic>)
          : null,
      commonName: json['CommonName'] as String?,
      expiryDateTime: timeStampFromJson(json['ExpiryDateTime']),
      registeredDateTime: timeStampFromJson(json['RegisteredDateTime']),
      state: (json['State'] as String?)?.toCertificateState(),
      stateReason: json['StateReason'] as String?,
      type: (json['Type'] as String?)?.toCertificateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateId = this.certificateId;
    final clientCertAuthSettings = this.clientCertAuthSettings;
    final commonName = this.commonName;
    final expiryDateTime = this.expiryDateTime;
    final registeredDateTime = this.registeredDateTime;
    final state = this.state;
    final stateReason = this.stateReason;
    final type = this.type;
    return {
      if (certificateId != null) 'CertificateId': certificateId,
      if (clientCertAuthSettings != null)
        'ClientCertAuthSettings': clientCertAuthSettings,
      if (commonName != null) 'CommonName': commonName,
      if (expiryDateTime != null)
        'ExpiryDateTime': unixTimestampToJson(expiryDateTime),
      if (registeredDateTime != null)
        'RegisteredDateTime': unixTimestampToJson(registeredDateTime),
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Contains general information about a certificate.
class CertificateInfo {
  /// The identifier of the certificate.
  final String? certificateId;

  /// The common name for the certificate.
  final String? commonName;

  /// The date and time when the certificate will expire.
  final DateTime? expiryDateTime;

  /// The state of the certificate.
  final CertificateState? state;

  /// The function that the registered certificate performs. Valid values include
  /// <code>ClientLDAPS</code> or <code>ClientCertAuth</code>. The default value
  /// is <code>ClientLDAPS</code>.
  final CertificateType? type;

  CertificateInfo({
    this.certificateId,
    this.commonName,
    this.expiryDateTime,
    this.state,
    this.type,
  });

  factory CertificateInfo.fromJson(Map<String, dynamic> json) {
    return CertificateInfo(
      certificateId: json['CertificateId'] as String?,
      commonName: json['CommonName'] as String?,
      expiryDateTime: timeStampFromJson(json['ExpiryDateTime']),
      state: (json['State'] as String?)?.toCertificateState(),
      type: (json['Type'] as String?)?.toCertificateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateId = this.certificateId;
    final commonName = this.commonName;
    final expiryDateTime = this.expiryDateTime;
    final state = this.state;
    final type = this.type;
    return {
      if (certificateId != null) 'CertificateId': certificateId,
      if (commonName != null) 'CommonName': commonName,
      if (expiryDateTime != null)
        'ExpiryDateTime': unixTimestampToJson(expiryDateTime),
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum CertificateState {
  registering,
  registered,
  registerFailed,
  deregistering,
  deregistered,
  deregisterFailed,
}

extension CertificateStateValueExtension on CertificateState {
  String toValue() {
    switch (this) {
      case CertificateState.registering:
        return 'Registering';
      case CertificateState.registered:
        return 'Registered';
      case CertificateState.registerFailed:
        return 'RegisterFailed';
      case CertificateState.deregistering:
        return 'Deregistering';
      case CertificateState.deregistered:
        return 'Deregistered';
      case CertificateState.deregisterFailed:
        return 'DeregisterFailed';
    }
  }
}

extension CertificateStateFromString on String {
  CertificateState toCertificateState() {
    switch (this) {
      case 'Registering':
        return CertificateState.registering;
      case 'Registered':
        return CertificateState.registered;
      case 'RegisterFailed':
        return CertificateState.registerFailed;
      case 'Deregistering':
        return CertificateState.deregistering;
      case 'Deregistered':
        return CertificateState.deregistered;
      case 'DeregisterFailed':
        return CertificateState.deregisterFailed;
    }
    throw Exception('$this is not known in enum CertificateState');
  }
}

enum CertificateType {
  clientCertAuth,
  clientLDAPS,
}

extension CertificateTypeValueExtension on CertificateType {
  String toValue() {
    switch (this) {
      case CertificateType.clientCertAuth:
        return 'ClientCertAuth';
      case CertificateType.clientLDAPS:
        return 'ClientLDAPS';
    }
  }
}

extension CertificateTypeFromString on String {
  CertificateType toCertificateType() {
    switch (this) {
      case 'ClientCertAuth':
        return CertificateType.clientCertAuth;
      case 'ClientLDAPS':
        return CertificateType.clientLDAPS;
    }
    throw Exception('$this is not known in enum CertificateType');
  }
}

/// Contains information about a client authentication method for a directory.
class ClientAuthenticationSettingInfo {
  /// The date and time when the status of the client authentication type was last
  /// updated.
  final DateTime? lastUpdatedDateTime;

  /// Whether the client authentication type is enabled or disabled for the
  /// specified directory.
  final ClientAuthenticationStatus? status;

  /// The type of client authentication for the specified directory. If no type is
  /// specified, a list of all client authentication types that are supported for
  /// the directory is retrieved.
  final ClientAuthenticationType? type;

  ClientAuthenticationSettingInfo({
    this.lastUpdatedDateTime,
    this.status,
    this.type,
  });

  factory ClientAuthenticationSettingInfo.fromJson(Map<String, dynamic> json) {
    return ClientAuthenticationSettingInfo(
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
      status: (json['Status'] as String?)?.toClientAuthenticationStatus(),
      type: (json['Type'] as String?)?.toClientAuthenticationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final status = this.status;
    final type = this.type;
    return {
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ClientAuthenticationStatus {
  enabled,
  disabled,
}

extension ClientAuthenticationStatusValueExtension
    on ClientAuthenticationStatus {
  String toValue() {
    switch (this) {
      case ClientAuthenticationStatus.enabled:
        return 'Enabled';
      case ClientAuthenticationStatus.disabled:
        return 'Disabled';
    }
  }
}

extension ClientAuthenticationStatusFromString on String {
  ClientAuthenticationStatus toClientAuthenticationStatus() {
    switch (this) {
      case 'Enabled':
        return ClientAuthenticationStatus.enabled;
      case 'Disabled':
        return ClientAuthenticationStatus.disabled;
    }
    throw Exception('$this is not known in enum ClientAuthenticationStatus');
  }
}

enum ClientAuthenticationType {
  smartCard,
  smartCardOrPassword,
}

extension ClientAuthenticationTypeValueExtension on ClientAuthenticationType {
  String toValue() {
    switch (this) {
      case ClientAuthenticationType.smartCard:
        return 'SmartCard';
      case ClientAuthenticationType.smartCardOrPassword:
        return 'SmartCardOrPassword';
    }
  }
}

extension ClientAuthenticationTypeFromString on String {
  ClientAuthenticationType toClientAuthenticationType() {
    switch (this) {
      case 'SmartCard':
        return ClientAuthenticationType.smartCard;
      case 'SmartCardOrPassword':
        return ClientAuthenticationType.smartCardOrPassword;
    }
    throw Exception('$this is not known in enum ClientAuthenticationType');
  }
}

/// Contains information about the client certificate authentication settings
/// for the <code>RegisterCertificate</code> and
/// <code>DescribeCertificate</code> operations.
class ClientCertAuthSettings {
  /// Specifies the URL of the default OCSP server used to check for revocation
  /// status. A secondary value to any OCSP address found in the AIA extension of
  /// the user certificate.
  final String? oCSPUrl;

  ClientCertAuthSettings({
    this.oCSPUrl,
  });

  factory ClientCertAuthSettings.fromJson(Map<String, dynamic> json) {
    return ClientCertAuthSettings(
      oCSPUrl: json['OCSPUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final oCSPUrl = this.oCSPUrl;
    return {
      if (oCSPUrl != null) 'OCSPUrl': oCSPUrl,
    };
  }
}

/// Contains information about a computer account in a directory.
class Computer {
  /// An array of <a>Attribute</a> objects containing the LDAP attributes that
  /// belong to the computer account.
  final List<Attribute>? computerAttributes;

  /// The identifier of the computer.
  final String? computerId;

  /// The computer name.
  final String? computerName;

  Computer({
    this.computerAttributes,
    this.computerId,
    this.computerName,
  });

  factory Computer.fromJson(Map<String, dynamic> json) {
    return Computer(
      computerAttributes: (json['ComputerAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      computerId: json['ComputerId'] as String?,
      computerName: json['ComputerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computerAttributes = this.computerAttributes;
    final computerId = this.computerId;
    final computerName = this.computerName;
    return {
      if (computerAttributes != null) 'ComputerAttributes': computerAttributes,
      if (computerId != null) 'ComputerId': computerId,
      if (computerName != null) 'ComputerName': computerName,
    };
  }
}

/// Points to a remote domain with which you are setting up a trust
/// relationship. Conditional forwarders are required in order to set up a trust
/// relationship with another domain.
class ConditionalForwarder {
  /// The IP addresses of the remote DNS server associated with RemoteDomainName.
  /// This is the IP address of the DNS server that your conditional forwarder
  /// points to.
  final List<String>? dnsIpAddrs;

  /// The fully qualified domain name (FQDN) of the remote domains pointed to by
  /// the conditional forwarder.
  final String? remoteDomainName;

  /// The replication scope of the conditional forwarder. The only allowed value
  /// is <code>Domain</code>, which will replicate the conditional forwarder to
  /// all of the domain controllers for your Amazon Web Services directory.
  final ReplicationScope? replicationScope;

  ConditionalForwarder({
    this.dnsIpAddrs,
    this.remoteDomainName,
    this.replicationScope,
  });

  factory ConditionalForwarder.fromJson(Map<String, dynamic> json) {
    return ConditionalForwarder(
      dnsIpAddrs: (json['DnsIpAddrs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      remoteDomainName: json['RemoteDomainName'] as String?,
      replicationScope:
          (json['ReplicationScope'] as String?)?.toReplicationScope(),
    );
  }

  Map<String, dynamic> toJson() {
    final dnsIpAddrs = this.dnsIpAddrs;
    final remoteDomainName = this.remoteDomainName;
    final replicationScope = this.replicationScope;
    return {
      if (dnsIpAddrs != null) 'DnsIpAddrs': dnsIpAddrs,
      if (remoteDomainName != null) 'RemoteDomainName': remoteDomainName,
      if (replicationScope != null)
        'ReplicationScope': replicationScope.toValue(),
    };
  }
}

/// Contains the results of the <a>ConnectDirectory</a> operation.
class ConnectDirectoryResult {
  /// The identifier of the new directory.
  final String? directoryId;

  ConnectDirectoryResult({
    this.directoryId,
  });

  factory ConnectDirectoryResult.fromJson(Map<String, dynamic> json) {
    return ConnectDirectoryResult(
      directoryId: json['DirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
    };
  }
}

/// Contains the results of the <a>CreateAlias</a> operation.
class CreateAliasResult {
  /// The alias for the directory.
  final String? alias;

  /// The identifier of the directory.
  final String? directoryId;

  CreateAliasResult({
    this.alias,
    this.directoryId,
  });

  factory CreateAliasResult.fromJson(Map<String, dynamic> json) {
    return CreateAliasResult(
      alias: json['Alias'] as String?,
      directoryId: json['DirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final directoryId = this.directoryId;
    return {
      if (alias != null) 'Alias': alias,
      if (directoryId != null) 'DirectoryId': directoryId,
    };
  }
}

/// Contains the results for the <a>CreateComputer</a> operation.
class CreateComputerResult {
  /// A <a>Computer</a> object that represents the computer account.
  final Computer? computer;

  CreateComputerResult({
    this.computer,
  });

  factory CreateComputerResult.fromJson(Map<String, dynamic> json) {
    return CreateComputerResult(
      computer: json['Computer'] != null
          ? Computer.fromJson(json['Computer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computer = this.computer;
    return {
      if (computer != null) 'Computer': computer,
    };
  }
}

/// The result of a CreateConditinalForwarder request.
class CreateConditionalForwarderResult {
  CreateConditionalForwarderResult();

  factory CreateConditionalForwarderResult.fromJson(Map<String, dynamic> _) {
    return CreateConditionalForwarderResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>CreateDirectory</a> operation.
class CreateDirectoryResult {
  /// The identifier of the directory that was created.
  final String? directoryId;

  CreateDirectoryResult({
    this.directoryId,
  });

  factory CreateDirectoryResult.fromJson(Map<String, dynamic> json) {
    return CreateDirectoryResult(
      directoryId: json['DirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
    };
  }
}

class CreateLogSubscriptionResult {
  CreateLogSubscriptionResult();

  factory CreateLogSubscriptionResult.fromJson(Map<String, dynamic> _) {
    return CreateLogSubscriptionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Result of a CreateMicrosoftAD request.
class CreateMicrosoftADResult {
  /// The identifier of the directory that was created.
  final String? directoryId;

  CreateMicrosoftADResult({
    this.directoryId,
  });

  factory CreateMicrosoftADResult.fromJson(Map<String, dynamic> json) {
    return CreateMicrosoftADResult(
      directoryId: json['DirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
    };
  }
}

/// Contains the results of the <a>CreateSnapshot</a> operation.
class CreateSnapshotResult {
  /// The identifier of the snapshot that was created.
  final String? snapshotId;

  CreateSnapshotResult({
    this.snapshotId,
  });

  factory CreateSnapshotResult.fromJson(Map<String, dynamic> json) {
    return CreateSnapshotResult(
      snapshotId: json['SnapshotId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotId = this.snapshotId;
    return {
      if (snapshotId != null) 'SnapshotId': snapshotId,
    };
  }
}

/// The result of a CreateTrust request.
class CreateTrustResult {
  /// A unique identifier for the trust relationship that was created.
  final String? trustId;

  CreateTrustResult({
    this.trustId,
  });

  factory CreateTrustResult.fromJson(Map<String, dynamic> json) {
    return CreateTrustResult(
      trustId: json['TrustId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trustId = this.trustId;
    return {
      if (trustId != null) 'TrustId': trustId,
    };
  }
}

/// The result of a DeleteConditionalForwarder request.
class DeleteConditionalForwarderResult {
  DeleteConditionalForwarderResult();

  factory DeleteConditionalForwarderResult.fromJson(Map<String, dynamic> _) {
    return DeleteConditionalForwarderResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>DeleteDirectory</a> operation.
class DeleteDirectoryResult {
  /// The directory identifier.
  final String? directoryId;

  DeleteDirectoryResult({
    this.directoryId,
  });

  factory DeleteDirectoryResult.fromJson(Map<String, dynamic> json) {
    return DeleteDirectoryResult(
      directoryId: json['DirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
    };
  }
}

class DeleteLogSubscriptionResult {
  DeleteLogSubscriptionResult();

  factory DeleteLogSubscriptionResult.fromJson(Map<String, dynamic> _) {
    return DeleteLogSubscriptionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>DeleteSnapshot</a> operation.
class DeleteSnapshotResult {
  /// The identifier of the directory snapshot that was deleted.
  final String? snapshotId;

  DeleteSnapshotResult({
    this.snapshotId,
  });

  factory DeleteSnapshotResult.fromJson(Map<String, dynamic> json) {
    return DeleteSnapshotResult(
      snapshotId: json['SnapshotId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotId = this.snapshotId;
    return {
      if (snapshotId != null) 'SnapshotId': snapshotId,
    };
  }
}

/// The result of a DeleteTrust request.
class DeleteTrustResult {
  /// The Trust ID of the trust relationship that was deleted.
  final String? trustId;

  DeleteTrustResult({
    this.trustId,
  });

  factory DeleteTrustResult.fromJson(Map<String, dynamic> json) {
    return DeleteTrustResult(
      trustId: json['TrustId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trustId = this.trustId;
    return {
      if (trustId != null) 'TrustId': trustId,
    };
  }
}

class DeregisterCertificateResult {
  DeregisterCertificateResult();

  factory DeregisterCertificateResult.fromJson(Map<String, dynamic> _) {
    return DeregisterCertificateResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result of a DeregisterEventTopic request.
class DeregisterEventTopicResult {
  DeregisterEventTopicResult();

  factory DeregisterEventTopicResult.fromJson(Map<String, dynamic> _) {
    return DeregisterEventTopicResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeCertificateResult {
  /// Information about the certificate, including registered date time,
  /// certificate state, the reason for the state, expiration date time, and
  /// certificate common name.
  final Certificate? certificate;

  DescribeCertificateResult({
    this.certificate,
  });

  factory DescribeCertificateResult.fromJson(Map<String, dynamic> json) {
    return DescribeCertificateResult(
      certificate: json['Certificate'] != null
          ? Certificate.fromJson(json['Certificate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    return {
      if (certificate != null) 'Certificate': certificate,
    };
  }
}

class DescribeClientAuthenticationSettingsResult {
  /// Information about the type of client authentication for the specified
  /// directory. The following information is retrieved: The date and time when
  /// the status of the client authentication type was last updated, whether the
  /// client authentication type is enabled or disabled, and the type of client
  /// authentication.
  final List<ClientAuthenticationSettingInfo>? clientAuthenticationSettingsInfo;

  /// The next token used to retrieve the client authentication settings if the
  /// number of setting types exceeds page limit and there is another page.
  final String? nextToken;

  DescribeClientAuthenticationSettingsResult({
    this.clientAuthenticationSettingsInfo,
    this.nextToken,
  });

  factory DescribeClientAuthenticationSettingsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeClientAuthenticationSettingsResult(
      clientAuthenticationSettingsInfo:
          (json['ClientAuthenticationSettingsInfo'] as List?)
              ?.whereNotNull()
              .map((e) => ClientAuthenticationSettingInfo.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientAuthenticationSettingsInfo =
        this.clientAuthenticationSettingsInfo;
    final nextToken = this.nextToken;
    return {
      if (clientAuthenticationSettingsInfo != null)
        'ClientAuthenticationSettingsInfo': clientAuthenticationSettingsInfo,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The result of a DescribeConditionalForwarder request.
class DescribeConditionalForwardersResult {
  /// The list of conditional forwarders that have been created.
  final List<ConditionalForwarder>? conditionalForwarders;

  DescribeConditionalForwardersResult({
    this.conditionalForwarders,
  });

  factory DescribeConditionalForwardersResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeConditionalForwardersResult(
      conditionalForwarders: (json['ConditionalForwarders'] as List?)
          ?.whereNotNull()
          .map((e) => ConditionalForwarder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final conditionalForwarders = this.conditionalForwarders;
    return {
      if (conditionalForwarders != null)
        'ConditionalForwarders': conditionalForwarders,
    };
  }
}

/// Contains the results of the <a>DescribeDirectories</a> operation.
class DescribeDirectoriesResult {
  /// The list of <a>DirectoryDescription</a> objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the <code>Limit</code> member of the request. This occurs if
  /// there are less than the requested number of items left to retrieve, or if
  /// the limitations of the operation have been exceeded.
  final List<DirectoryDescription>? directoryDescriptions;

  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent call to
  /// <a>DescribeDirectories</a> to retrieve the next set of items.
  final String? nextToken;

  DescribeDirectoriesResult({
    this.directoryDescriptions,
    this.nextToken,
  });

  factory DescribeDirectoriesResult.fromJson(Map<String, dynamic> json) {
    return DescribeDirectoriesResult(
      directoryDescriptions: (json['DirectoryDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => DirectoryDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryDescriptions = this.directoryDescriptions;
    final nextToken = this.nextToken;
    return {
      if (directoryDescriptions != null)
        'DirectoryDescriptions': directoryDescriptions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeDomainControllersResult {
  /// List of the <a>DomainController</a> objects that were retrieved.
  final List<DomainController>? domainControllers;

  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent call to
  /// <a>DescribeDomainControllers</a> retrieve the next set of items.
  final String? nextToken;

  DescribeDomainControllersResult({
    this.domainControllers,
    this.nextToken,
  });

  factory DescribeDomainControllersResult.fromJson(Map<String, dynamic> json) {
    return DescribeDomainControllersResult(
      domainControllers: (json['DomainControllers'] as List?)
          ?.whereNotNull()
          .map((e) => DomainController.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainControllers = this.domainControllers;
    final nextToken = this.nextToken;
    return {
      if (domainControllers != null) 'DomainControllers': domainControllers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The result of a DescribeEventTopic request.
class DescribeEventTopicsResult {
  /// A list of Amazon SNS topic names that receive status messages from the
  /// specified Directory ID.
  final List<EventTopic>? eventTopics;

  DescribeEventTopicsResult({
    this.eventTopics,
  });

  factory DescribeEventTopicsResult.fromJson(Map<String, dynamic> json) {
    return DescribeEventTopicsResult(
      eventTopics: (json['EventTopics'] as List?)
          ?.whereNotNull()
          .map((e) => EventTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventTopics = this.eventTopics;
    return {
      if (eventTopics != null) 'EventTopics': eventTopics,
    };
  }
}

class DescribeLDAPSSettingsResult {
  /// Information about LDAP security for the specified directory, including
  /// status of enablement, state last updated date time, and the reason for the
  /// state.
  final List<LDAPSSettingInfo>? lDAPSSettingsInfo;

  /// The next token used to retrieve the LDAPS settings if the number of setting
  /// types exceeds page limit and there is another page.
  final String? nextToken;

  DescribeLDAPSSettingsResult({
    this.lDAPSSettingsInfo,
    this.nextToken,
  });

  factory DescribeLDAPSSettingsResult.fromJson(Map<String, dynamic> json) {
    return DescribeLDAPSSettingsResult(
      lDAPSSettingsInfo: (json['LDAPSSettingsInfo'] as List?)
          ?.whereNotNull()
          .map((e) => LDAPSSettingInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lDAPSSettingsInfo = this.lDAPSSettingsInfo;
    final nextToken = this.nextToken;
    return {
      if (lDAPSSettingsInfo != null) 'LDAPSSettingsInfo': lDAPSSettingsInfo,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeRegionsResult {
  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent call to
  /// <a>DescribeRegions</a> to retrieve the next set of items.
  final String? nextToken;

  /// List of Region information related to the directory for each replicated
  /// Region.
  final List<RegionDescription>? regionsDescription;

  DescribeRegionsResult({
    this.nextToken,
    this.regionsDescription,
  });

  factory DescribeRegionsResult.fromJson(Map<String, dynamic> json) {
    return DescribeRegionsResult(
      nextToken: json['NextToken'] as String?,
      regionsDescription: (json['RegionsDescription'] as List?)
          ?.whereNotNull()
          .map((e) => RegionDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final regionsDescription = this.regionsDescription;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (regionsDescription != null) 'RegionsDescription': regionsDescription,
    };
  }
}

class DescribeSettingsResult {
  /// The identifier of the directory.
  final String? directoryId;

  /// If not null, token that indicates that more results are available. Pass this
  /// value for the <code>NextToken</code> parameter in a subsequent call to
  /// <code>DescribeSettings</code> to retrieve the next set of items.
  final String? nextToken;

  /// The list of <a>SettingEntry</a> objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the <code>Limit</code> member of the request. This occurs if
  /// there are less than the requested number of items left to retrieve, or if
  /// the limitations of the operation have been exceeded.
  final List<SettingEntry>? settingEntries;

  DescribeSettingsResult({
    this.directoryId,
    this.nextToken,
    this.settingEntries,
  });

  factory DescribeSettingsResult.fromJson(Map<String, dynamic> json) {
    return DescribeSettingsResult(
      directoryId: json['DirectoryId'] as String?,
      nextToken: json['NextToken'] as String?,
      settingEntries: (json['SettingEntries'] as List?)
          ?.whereNotNull()
          .map((e) => SettingEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final nextToken = this.nextToken;
    final settingEntries = this.settingEntries;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (nextToken != null) 'NextToken': nextToken,
      if (settingEntries != null) 'SettingEntries': settingEntries,
    };
  }
}

class DescribeSharedDirectoriesResult {
  /// If not null, token that indicates that more results are available. Pass this
  /// value for the <code>NextToken</code> parameter in a subsequent call to
  /// <a>DescribeSharedDirectories</a> to retrieve the next set of items.
  final String? nextToken;

  /// A list of all shared directories in your account.
  final List<SharedDirectory>? sharedDirectories;

  DescribeSharedDirectoriesResult({
    this.nextToken,
    this.sharedDirectories,
  });

  factory DescribeSharedDirectoriesResult.fromJson(Map<String, dynamic> json) {
    return DescribeSharedDirectoriesResult(
      nextToken: json['NextToken'] as String?,
      sharedDirectories: (json['SharedDirectories'] as List?)
          ?.whereNotNull()
          .map((e) => SharedDirectory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sharedDirectories = this.sharedDirectories;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sharedDirectories != null) 'SharedDirectories': sharedDirectories,
    };
  }
}

/// Contains the results of the <a>DescribeSnapshots</a> operation.
class DescribeSnapshotsResult {
  /// If not null, more results are available. Pass this value in the
  /// <i>NextToken</i> member of a subsequent call to <a>DescribeSnapshots</a>.
  final String? nextToken;

  /// The list of <a>Snapshot</a> objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the <i>Limit</i> member of the request. This occurs if there
  /// are less than the requested number of items left to retrieve, or if the
  /// limitations of the operation have been exceeded.
  final List<Snapshot>? snapshots;

  DescribeSnapshotsResult({
    this.nextToken,
    this.snapshots,
  });

  factory DescribeSnapshotsResult.fromJson(Map<String, dynamic> json) {
    return DescribeSnapshotsResult(
      nextToken: json['NextToken'] as String?,
      snapshots: (json['Snapshots'] as List?)
          ?.whereNotNull()
          .map((e) => Snapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final snapshots = this.snapshots;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (snapshots != null) 'Snapshots': snapshots,
    };
  }
}

/// The result of a DescribeTrust request.
class DescribeTrustsResult {
  /// If not null, more results are available. Pass this value for the
  /// <i>NextToken</i> parameter in a subsequent call to <a>DescribeTrusts</a> to
  /// retrieve the next set of items.
  final String? nextToken;

  /// The list of Trust objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the <i>Limit</i> member of the request. This occurs if there
  /// are less than the requested number of items left to retrieve, or if the
  /// limitations of the operation have been exceeded.
  final List<Trust>? trusts;

  DescribeTrustsResult({
    this.nextToken,
    this.trusts,
  });

  factory DescribeTrustsResult.fromJson(Map<String, dynamic> json) {
    return DescribeTrustsResult(
      nextToken: json['NextToken'] as String?,
      trusts: (json['Trusts'] as List?)
          ?.whereNotNull()
          .map((e) => Trust.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final trusts = this.trusts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (trusts != null) 'Trusts': trusts,
    };
  }
}

class DescribeUpdateDirectoryResult {
  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter.
  final String? nextToken;

  /// The list of update activities on a directory for the requested update type.
  final List<UpdateInfoEntry>? updateActivities;

  DescribeUpdateDirectoryResult({
    this.nextToken,
    this.updateActivities,
  });

  factory DescribeUpdateDirectoryResult.fromJson(Map<String, dynamic> json) {
    return DescribeUpdateDirectoryResult(
      nextToken: json['NextToken'] as String?,
      updateActivities: (json['UpdateActivities'] as List?)
          ?.whereNotNull()
          .map((e) => UpdateInfoEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final updateActivities = this.updateActivities;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (updateActivities != null) 'UpdateActivities': updateActivities,
    };
  }
}

enum DirectoryConfigurationStatus {
  requested,
  updating,
  updated,
  failed,
  $default,
}

extension DirectoryConfigurationStatusValueExtension
    on DirectoryConfigurationStatus {
  String toValue() {
    switch (this) {
      case DirectoryConfigurationStatus.requested:
        return 'Requested';
      case DirectoryConfigurationStatus.updating:
        return 'Updating';
      case DirectoryConfigurationStatus.updated:
        return 'Updated';
      case DirectoryConfigurationStatus.failed:
        return 'Failed';
      case DirectoryConfigurationStatus.$default:
        return 'Default';
    }
  }
}

extension DirectoryConfigurationStatusFromString on String {
  DirectoryConfigurationStatus toDirectoryConfigurationStatus() {
    switch (this) {
      case 'Requested':
        return DirectoryConfigurationStatus.requested;
      case 'Updating':
        return DirectoryConfigurationStatus.updating;
      case 'Updated':
        return DirectoryConfigurationStatus.updated;
      case 'Failed':
        return DirectoryConfigurationStatus.failed;
      case 'Default':
        return DirectoryConfigurationStatus.$default;
    }
    throw Exception('$this is not known in enum DirectoryConfigurationStatus');
  }
}

/// Contains information for the <a>ConnectDirectory</a> operation when an AD
/// Connector directory is being created.
class DirectoryConnectSettings {
  /// A list of one or more IP addresses of DNS servers or domain controllers in
  /// your self-managed directory.
  final List<String> customerDnsIps;

  /// The user name of an account in your self-managed directory that is used to
  /// connect to the directory. This account must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// Read users and groups
  /// </li>
  /// <li>
  /// Create computer objects
  /// </li>
  /// <li>
  /// Join computers to the domain
  /// </li>
  /// </ul>
  final String customerUserName;

  /// A list of subnet identifiers in the VPC in which the AD Connector is
  /// created.
  final List<String> subnetIds;

  /// The identifier of the VPC in which the AD Connector is created.
  final String vpcId;

  DirectoryConnectSettings({
    required this.customerDnsIps,
    required this.customerUserName,
    required this.subnetIds,
    required this.vpcId,
  });

  Map<String, dynamic> toJson() {
    final customerDnsIps = this.customerDnsIps;
    final customerUserName = this.customerUserName;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      'CustomerDnsIps': customerDnsIps,
      'CustomerUserName': customerUserName,
      'SubnetIds': subnetIds,
      'VpcId': vpcId,
    };
  }
}

/// Contains information about an AD Connector directory.
class DirectoryConnectSettingsDescription {
  /// A list of the Availability Zones that the directory is in.
  final List<String>? availabilityZones;

  /// The IP addresses of the AD Connector servers.
  final List<String>? connectIps;

  /// The user name of the service account in your self-managed directory.
  final String? customerUserName;

  /// The security group identifier for the AD Connector directory.
  final String? securityGroupId;

  /// A list of subnet identifiers in the VPC that the AD Connector is in.
  final List<String>? subnetIds;

  /// The identifier of the VPC that the AD Connector is in.
  final String? vpcId;

  DirectoryConnectSettingsDescription({
    this.availabilityZones,
    this.connectIps,
    this.customerUserName,
    this.securityGroupId,
    this.subnetIds,
    this.vpcId,
  });

  factory DirectoryConnectSettingsDescription.fromJson(
      Map<String, dynamic> json) {
    return DirectoryConnectSettingsDescription(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      connectIps: (json['ConnectIps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      customerUserName: json['CustomerUserName'] as String?,
      securityGroupId: json['SecurityGroupId'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final connectIps = this.connectIps;
    final customerUserName = this.customerUserName;
    final securityGroupId = this.securityGroupId;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (connectIps != null) 'ConnectIps': connectIps,
      if (customerUserName != null) 'CustomerUserName': customerUserName,
      if (securityGroupId != null) 'SecurityGroupId': securityGroupId,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Contains information about an Directory Service directory.
class DirectoryDescription {
  /// The access URL for the directory, such as
  /// <code>http://&lt;alias&gt;.awsapps.com</code>. If no alias has been created
  /// for the directory, <code>&lt;alias&gt;</code> is the directory identifier,
  /// such as <code>d-XXXXXXXXXX</code>.
  final String? accessUrl;

  /// The alias for the directory. If no alias has been created for the directory,
  /// the alias is the directory identifier, such as <code>d-XXXXXXXXXX</code>.
  final String? alias;

  /// A <a>DirectoryConnectSettingsDescription</a> object that contains additional
  /// information about an AD Connector directory. This member is only present if
  /// the directory is an AD Connector directory.
  final DirectoryConnectSettingsDescription? connectSettings;

  /// The description for the directory.
  final String? description;

  /// The desired number of domain controllers in the directory if the directory
  /// is Microsoft AD.
  final int? desiredNumberOfDomainControllers;

  /// The directory identifier.
  final String? directoryId;

  /// The IP addresses of the DNS servers for the directory. For a Simple AD or
  /// Microsoft AD directory, these are the IP addresses of the Simple AD or
  /// Microsoft AD directory servers. For an AD Connector directory, these are the
  /// IP addresses of the DNS servers or domain controllers in your self-managed
  /// directory to which the AD Connector is connected.
  final List<String>? dnsIpAddrs;

  /// The edition associated with this directory.
  final DirectoryEdition? edition;

  /// Specifies when the directory was created.
  final DateTime? launchTime;

  /// The fully qualified name of the directory.
  final String? name;

  /// The operating system (OS) version of the directory.
  final OSVersion? osVersion;

  /// Describes the Managed Microsoft AD directory in the directory owner account.
  final OwnerDirectoryDescription? ownerDirectoryDescription;

  /// A <a>RadiusSettings</a> object that contains information about the RADIUS
  /// server configured for this directory.
  final RadiusSettings? radiusSettings;

  /// The status of the RADIUS MFA server connection.
  final RadiusStatus? radiusStatus;

  /// Lists the Regions where the directory has replicated.
  final RegionsInfo? regionsInfo;

  /// The method used when sharing a directory to determine whether the directory
  /// should be shared within your Amazon Web Services organization
  /// (<code>ORGANIZATIONS</code>) or with any Amazon Web Services account by
  /// sending a shared directory request (<code>HANDSHAKE</code>).
  final ShareMethod? shareMethod;

  /// A directory share request that is sent by the directory owner to the
  /// directory consumer. The request includes a typed message to help the
  /// directory consumer administrator determine whether to approve or reject the
  /// share invitation.
  final String? shareNotes;

  /// Current directory status of the shared Managed Microsoft AD directory.
  final ShareStatus? shareStatus;

  /// The short name of the directory.
  final String? shortName;

  /// The directory size.
  final DirectorySize? size;

  /// Indicates if single sign-on is enabled for the directory. For more
  /// information, see <a>EnableSso</a> and <a>DisableSso</a>.
  final bool? ssoEnabled;

  /// The current stage of the directory.
  final DirectoryStage? stage;

  /// The date and time that the stage was last updated.
  final DateTime? stageLastUpdatedDateTime;

  /// Additional information about the directory stage.
  final String? stageReason;

  /// The directory size.
  final DirectoryType? type;

  /// A <a>DirectoryVpcSettingsDescription</a> object that contains additional
  /// information about a directory. This member is only present if the directory
  /// is a Simple AD or Managed Microsoft AD directory.
  final DirectoryVpcSettingsDescription? vpcSettings;

  DirectoryDescription({
    this.accessUrl,
    this.alias,
    this.connectSettings,
    this.description,
    this.desiredNumberOfDomainControllers,
    this.directoryId,
    this.dnsIpAddrs,
    this.edition,
    this.launchTime,
    this.name,
    this.osVersion,
    this.ownerDirectoryDescription,
    this.radiusSettings,
    this.radiusStatus,
    this.regionsInfo,
    this.shareMethod,
    this.shareNotes,
    this.shareStatus,
    this.shortName,
    this.size,
    this.ssoEnabled,
    this.stage,
    this.stageLastUpdatedDateTime,
    this.stageReason,
    this.type,
    this.vpcSettings,
  });

  factory DirectoryDescription.fromJson(Map<String, dynamic> json) {
    return DirectoryDescription(
      accessUrl: json['AccessUrl'] as String?,
      alias: json['Alias'] as String?,
      connectSettings: json['ConnectSettings'] != null
          ? DirectoryConnectSettingsDescription.fromJson(
              json['ConnectSettings'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      desiredNumberOfDomainControllers:
          json['DesiredNumberOfDomainControllers'] as int?,
      directoryId: json['DirectoryId'] as String?,
      dnsIpAddrs: (json['DnsIpAddrs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      edition: (json['Edition'] as String?)?.toDirectoryEdition(),
      launchTime: timeStampFromJson(json['LaunchTime']),
      name: json['Name'] as String?,
      osVersion: (json['OsVersion'] as String?)?.toOSVersion(),
      ownerDirectoryDescription: json['OwnerDirectoryDescription'] != null
          ? OwnerDirectoryDescription.fromJson(
              json['OwnerDirectoryDescription'] as Map<String, dynamic>)
          : null,
      radiusSettings: json['RadiusSettings'] != null
          ? RadiusSettings.fromJson(
              json['RadiusSettings'] as Map<String, dynamic>)
          : null,
      radiusStatus: (json['RadiusStatus'] as String?)?.toRadiusStatus(),
      regionsInfo: json['RegionsInfo'] != null
          ? RegionsInfo.fromJson(json['RegionsInfo'] as Map<String, dynamic>)
          : null,
      shareMethod: (json['ShareMethod'] as String?)?.toShareMethod(),
      shareNotes: json['ShareNotes'] as String?,
      shareStatus: (json['ShareStatus'] as String?)?.toShareStatus(),
      shortName: json['ShortName'] as String?,
      size: (json['Size'] as String?)?.toDirectorySize(),
      ssoEnabled: json['SsoEnabled'] as bool?,
      stage: (json['Stage'] as String?)?.toDirectoryStage(),
      stageLastUpdatedDateTime:
          timeStampFromJson(json['StageLastUpdatedDateTime']),
      stageReason: json['StageReason'] as String?,
      type: (json['Type'] as String?)?.toDirectoryType(),
      vpcSettings: json['VpcSettings'] != null
          ? DirectoryVpcSettingsDescription.fromJson(
              json['VpcSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessUrl = this.accessUrl;
    final alias = this.alias;
    final connectSettings = this.connectSettings;
    final description = this.description;
    final desiredNumberOfDomainControllers =
        this.desiredNumberOfDomainControllers;
    final directoryId = this.directoryId;
    final dnsIpAddrs = this.dnsIpAddrs;
    final edition = this.edition;
    final launchTime = this.launchTime;
    final name = this.name;
    final osVersion = this.osVersion;
    final ownerDirectoryDescription = this.ownerDirectoryDescription;
    final radiusSettings = this.radiusSettings;
    final radiusStatus = this.radiusStatus;
    final regionsInfo = this.regionsInfo;
    final shareMethod = this.shareMethod;
    final shareNotes = this.shareNotes;
    final shareStatus = this.shareStatus;
    final shortName = this.shortName;
    final size = this.size;
    final ssoEnabled = this.ssoEnabled;
    final stage = this.stage;
    final stageLastUpdatedDateTime = this.stageLastUpdatedDateTime;
    final stageReason = this.stageReason;
    final type = this.type;
    final vpcSettings = this.vpcSettings;
    return {
      if (accessUrl != null) 'AccessUrl': accessUrl,
      if (alias != null) 'Alias': alias,
      if (connectSettings != null) 'ConnectSettings': connectSettings,
      if (description != null) 'Description': description,
      if (desiredNumberOfDomainControllers != null)
        'DesiredNumberOfDomainControllers': desiredNumberOfDomainControllers,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (dnsIpAddrs != null) 'DnsIpAddrs': dnsIpAddrs,
      if (edition != null) 'Edition': edition.toValue(),
      if (launchTime != null) 'LaunchTime': unixTimestampToJson(launchTime),
      if (name != null) 'Name': name,
      if (osVersion != null) 'OsVersion': osVersion.toValue(),
      if (ownerDirectoryDescription != null)
        'OwnerDirectoryDescription': ownerDirectoryDescription,
      if (radiusSettings != null) 'RadiusSettings': radiusSettings,
      if (radiusStatus != null) 'RadiusStatus': radiusStatus.toValue(),
      if (regionsInfo != null) 'RegionsInfo': regionsInfo,
      if (shareMethod != null) 'ShareMethod': shareMethod.toValue(),
      if (shareNotes != null) 'ShareNotes': shareNotes,
      if (shareStatus != null) 'ShareStatus': shareStatus.toValue(),
      if (shortName != null) 'ShortName': shortName,
      if (size != null) 'Size': size.toValue(),
      if (ssoEnabled != null) 'SsoEnabled': ssoEnabled,
      if (stage != null) 'Stage': stage.toValue(),
      if (stageLastUpdatedDateTime != null)
        'StageLastUpdatedDateTime':
            unixTimestampToJson(stageLastUpdatedDateTime),
      if (stageReason != null) 'StageReason': stageReason,
      if (type != null) 'Type': type.toValue(),
      if (vpcSettings != null) 'VpcSettings': vpcSettings,
    };
  }
}

enum DirectoryEdition {
  enterprise,
  standard,
}

extension DirectoryEditionValueExtension on DirectoryEdition {
  String toValue() {
    switch (this) {
      case DirectoryEdition.enterprise:
        return 'Enterprise';
      case DirectoryEdition.standard:
        return 'Standard';
    }
  }
}

extension DirectoryEditionFromString on String {
  DirectoryEdition toDirectoryEdition() {
    switch (this) {
      case 'Enterprise':
        return DirectoryEdition.enterprise;
      case 'Standard':
        return DirectoryEdition.standard;
    }
    throw Exception('$this is not known in enum DirectoryEdition');
  }
}

/// Contains directory limit information for a Region.
class DirectoryLimits {
  /// The current number of cloud directories in the Region.
  final int? cloudOnlyDirectoriesCurrentCount;

  /// The maximum number of cloud directories allowed in the Region.
  final int? cloudOnlyDirectoriesLimit;

  /// Indicates if the cloud directory limit has been reached.
  final bool? cloudOnlyDirectoriesLimitReached;

  /// The current number of Managed Microsoft AD directories in the region.
  final int? cloudOnlyMicrosoftADCurrentCount;

  /// The maximum number of Managed Microsoft AD directories allowed in the
  /// region.
  final int? cloudOnlyMicrosoftADLimit;

  /// Indicates if the Managed Microsoft AD directory limit has been reached.
  final bool? cloudOnlyMicrosoftADLimitReached;

  /// The current number of connected directories in the Region.
  final int? connectedDirectoriesCurrentCount;

  /// The maximum number of connected directories allowed in the Region.
  final int? connectedDirectoriesLimit;

  /// Indicates if the connected directory limit has been reached.
  final bool? connectedDirectoriesLimitReached;

  DirectoryLimits({
    this.cloudOnlyDirectoriesCurrentCount,
    this.cloudOnlyDirectoriesLimit,
    this.cloudOnlyDirectoriesLimitReached,
    this.cloudOnlyMicrosoftADCurrentCount,
    this.cloudOnlyMicrosoftADLimit,
    this.cloudOnlyMicrosoftADLimitReached,
    this.connectedDirectoriesCurrentCount,
    this.connectedDirectoriesLimit,
    this.connectedDirectoriesLimitReached,
  });

  factory DirectoryLimits.fromJson(Map<String, dynamic> json) {
    return DirectoryLimits(
      cloudOnlyDirectoriesCurrentCount:
          json['CloudOnlyDirectoriesCurrentCount'] as int?,
      cloudOnlyDirectoriesLimit: json['CloudOnlyDirectoriesLimit'] as int?,
      cloudOnlyDirectoriesLimitReached:
          json['CloudOnlyDirectoriesLimitReached'] as bool?,
      cloudOnlyMicrosoftADCurrentCount:
          json['CloudOnlyMicrosoftADCurrentCount'] as int?,
      cloudOnlyMicrosoftADLimit: json['CloudOnlyMicrosoftADLimit'] as int?,
      cloudOnlyMicrosoftADLimitReached:
          json['CloudOnlyMicrosoftADLimitReached'] as bool?,
      connectedDirectoriesCurrentCount:
          json['ConnectedDirectoriesCurrentCount'] as int?,
      connectedDirectoriesLimit: json['ConnectedDirectoriesLimit'] as int?,
      connectedDirectoriesLimitReached:
          json['ConnectedDirectoriesLimitReached'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudOnlyDirectoriesCurrentCount =
        this.cloudOnlyDirectoriesCurrentCount;
    final cloudOnlyDirectoriesLimit = this.cloudOnlyDirectoriesLimit;
    final cloudOnlyDirectoriesLimitReached =
        this.cloudOnlyDirectoriesLimitReached;
    final cloudOnlyMicrosoftADCurrentCount =
        this.cloudOnlyMicrosoftADCurrentCount;
    final cloudOnlyMicrosoftADLimit = this.cloudOnlyMicrosoftADLimit;
    final cloudOnlyMicrosoftADLimitReached =
        this.cloudOnlyMicrosoftADLimitReached;
    final connectedDirectoriesCurrentCount =
        this.connectedDirectoriesCurrentCount;
    final connectedDirectoriesLimit = this.connectedDirectoriesLimit;
    final connectedDirectoriesLimitReached =
        this.connectedDirectoriesLimitReached;
    return {
      if (cloudOnlyDirectoriesCurrentCount != null)
        'CloudOnlyDirectoriesCurrentCount': cloudOnlyDirectoriesCurrentCount,
      if (cloudOnlyDirectoriesLimit != null)
        'CloudOnlyDirectoriesLimit': cloudOnlyDirectoriesLimit,
      if (cloudOnlyDirectoriesLimitReached != null)
        'CloudOnlyDirectoriesLimitReached': cloudOnlyDirectoriesLimitReached,
      if (cloudOnlyMicrosoftADCurrentCount != null)
        'CloudOnlyMicrosoftADCurrentCount': cloudOnlyMicrosoftADCurrentCount,
      if (cloudOnlyMicrosoftADLimit != null)
        'CloudOnlyMicrosoftADLimit': cloudOnlyMicrosoftADLimit,
      if (cloudOnlyMicrosoftADLimitReached != null)
        'CloudOnlyMicrosoftADLimitReached': cloudOnlyMicrosoftADLimitReached,
      if (connectedDirectoriesCurrentCount != null)
        'ConnectedDirectoriesCurrentCount': connectedDirectoriesCurrentCount,
      if (connectedDirectoriesLimit != null)
        'ConnectedDirectoriesLimit': connectedDirectoriesLimit,
      if (connectedDirectoriesLimitReached != null)
        'ConnectedDirectoriesLimitReached': connectedDirectoriesLimitReached,
    };
  }
}

enum DirectorySize {
  small,
  large,
}

extension DirectorySizeValueExtension on DirectorySize {
  String toValue() {
    switch (this) {
      case DirectorySize.small:
        return 'Small';
      case DirectorySize.large:
        return 'Large';
    }
  }
}

extension DirectorySizeFromString on String {
  DirectorySize toDirectorySize() {
    switch (this) {
      case 'Small':
        return DirectorySize.small;
      case 'Large':
        return DirectorySize.large;
    }
    throw Exception('$this is not known in enum DirectorySize');
  }
}

enum DirectoryStage {
  requested,
  creating,
  created,
  active,
  inoperable,
  impaired,
  restoring,
  restoreFailed,
  deleting,
  deleted,
  failed,
}

extension DirectoryStageValueExtension on DirectoryStage {
  String toValue() {
    switch (this) {
      case DirectoryStage.requested:
        return 'Requested';
      case DirectoryStage.creating:
        return 'Creating';
      case DirectoryStage.created:
        return 'Created';
      case DirectoryStage.active:
        return 'Active';
      case DirectoryStage.inoperable:
        return 'Inoperable';
      case DirectoryStage.impaired:
        return 'Impaired';
      case DirectoryStage.restoring:
        return 'Restoring';
      case DirectoryStage.restoreFailed:
        return 'RestoreFailed';
      case DirectoryStage.deleting:
        return 'Deleting';
      case DirectoryStage.deleted:
        return 'Deleted';
      case DirectoryStage.failed:
        return 'Failed';
    }
  }
}

extension DirectoryStageFromString on String {
  DirectoryStage toDirectoryStage() {
    switch (this) {
      case 'Requested':
        return DirectoryStage.requested;
      case 'Creating':
        return DirectoryStage.creating;
      case 'Created':
        return DirectoryStage.created;
      case 'Active':
        return DirectoryStage.active;
      case 'Inoperable':
        return DirectoryStage.inoperable;
      case 'Impaired':
        return DirectoryStage.impaired;
      case 'Restoring':
        return DirectoryStage.restoring;
      case 'RestoreFailed':
        return DirectoryStage.restoreFailed;
      case 'Deleting':
        return DirectoryStage.deleting;
      case 'Deleted':
        return DirectoryStage.deleted;
      case 'Failed':
        return DirectoryStage.failed;
    }
    throw Exception('$this is not known in enum DirectoryStage');
  }
}

enum DirectoryType {
  simpleAD,
  aDConnector,
  microsoftAD,
  sharedMicrosoftAD,
}

extension DirectoryTypeValueExtension on DirectoryType {
  String toValue() {
    switch (this) {
      case DirectoryType.simpleAD:
        return 'SimpleAD';
      case DirectoryType.aDConnector:
        return 'ADConnector';
      case DirectoryType.microsoftAD:
        return 'MicrosoftAD';
      case DirectoryType.sharedMicrosoftAD:
        return 'SharedMicrosoftAD';
    }
  }
}

extension DirectoryTypeFromString on String {
  DirectoryType toDirectoryType() {
    switch (this) {
      case 'SimpleAD':
        return DirectoryType.simpleAD;
      case 'ADConnector':
        return DirectoryType.aDConnector;
      case 'MicrosoftAD':
        return DirectoryType.microsoftAD;
      case 'SharedMicrosoftAD':
        return DirectoryType.sharedMicrosoftAD;
    }
    throw Exception('$this is not known in enum DirectoryType');
  }
}

/// Contains VPC information for the <a>CreateDirectory</a> or
/// <a>CreateMicrosoftAD</a> operation.
class DirectoryVpcSettings {
  /// The identifiers of the subnets for the directory servers. The two subnets
  /// must be in different Availability Zones. Directory Service creates a
  /// directory server and a DNS server in each of these subnets.
  final List<String> subnetIds;

  /// The identifier of the VPC in which to create the directory.
  final String vpcId;

  DirectoryVpcSettings({
    required this.subnetIds,
    required this.vpcId,
  });

  factory DirectoryVpcSettings.fromJson(Map<String, dynamic> json) {
    return DirectoryVpcSettings(
      subnetIds: (json['SubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      'SubnetIds': subnetIds,
      'VpcId': vpcId,
    };
  }
}

/// Contains information about the directory.
class DirectoryVpcSettingsDescription {
  /// The list of Availability Zones that the directory is in.
  final List<String>? availabilityZones;

  /// The domain controller security group identifier for the directory.
  final String? securityGroupId;

  /// The identifiers of the subnets for the directory servers.
  final List<String>? subnetIds;

  /// The identifier of the VPC that the directory is in.
  final String? vpcId;

  DirectoryVpcSettingsDescription({
    this.availabilityZones,
    this.securityGroupId,
    this.subnetIds,
    this.vpcId,
  });

  factory DirectoryVpcSettingsDescription.fromJson(Map<String, dynamic> json) {
    return DirectoryVpcSettingsDescription(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupId: json['SecurityGroupId'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final securityGroupId = this.securityGroupId;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (securityGroupId != null) 'SecurityGroupId': securityGroupId,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class DisableClientAuthenticationResult {
  DisableClientAuthenticationResult();

  factory DisableClientAuthenticationResult.fromJson(Map<String, dynamic> _) {
    return DisableClientAuthenticationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisableLDAPSResult {
  DisableLDAPSResult();

  factory DisableLDAPSResult.fromJson(Map<String, dynamic> _) {
    return DisableLDAPSResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>DisableRadius</a> operation.
class DisableRadiusResult {
  DisableRadiusResult();

  factory DisableRadiusResult.fromJson(Map<String, dynamic> _) {
    return DisableRadiusResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>DisableSso</a> operation.
class DisableSsoResult {
  DisableSsoResult();

  factory DisableSsoResult.fromJson(Map<String, dynamic> _) {
    return DisableSsoResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about the domain controllers for a specified directory.
class DomainController {
  /// The Availability Zone where the domain controller is located.
  final String? availabilityZone;

  /// Identifier of the directory where the domain controller resides.
  final String? directoryId;

  /// The IP address of the domain controller.
  final String? dnsIpAddr;

  /// Identifies a specific domain controller in the directory.
  final String? domainControllerId;

  /// Specifies when the domain controller was created.
  final DateTime? launchTime;

  /// The status of the domain controller.
  final DomainControllerStatus? status;

  /// The date and time that the status was last updated.
  final DateTime? statusLastUpdatedDateTime;

  /// A description of the domain controller state.
  final String? statusReason;

  /// Identifier of the subnet in the VPC that contains the domain controller.
  final String? subnetId;

  /// The identifier of the VPC that contains the domain controller.
  final String? vpcId;

  DomainController({
    this.availabilityZone,
    this.directoryId,
    this.dnsIpAddr,
    this.domainControllerId,
    this.launchTime,
    this.status,
    this.statusLastUpdatedDateTime,
    this.statusReason,
    this.subnetId,
    this.vpcId,
  });

  factory DomainController.fromJson(Map<String, dynamic> json) {
    return DomainController(
      availabilityZone: json['AvailabilityZone'] as String?,
      directoryId: json['DirectoryId'] as String?,
      dnsIpAddr: json['DnsIpAddr'] as String?,
      domainControllerId: json['DomainControllerId'] as String?,
      launchTime: timeStampFromJson(json['LaunchTime']),
      status: (json['Status'] as String?)?.toDomainControllerStatus(),
      statusLastUpdatedDateTime:
          timeStampFromJson(json['StatusLastUpdatedDateTime']),
      statusReason: json['StatusReason'] as String?,
      subnetId: json['SubnetId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final directoryId = this.directoryId;
    final dnsIpAddr = this.dnsIpAddr;
    final domainControllerId = this.domainControllerId;
    final launchTime = this.launchTime;
    final status = this.status;
    final statusLastUpdatedDateTime = this.statusLastUpdatedDateTime;
    final statusReason = this.statusReason;
    final subnetId = this.subnetId;
    final vpcId = this.vpcId;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (dnsIpAddr != null) 'DnsIpAddr': dnsIpAddr,
      if (domainControllerId != null) 'DomainControllerId': domainControllerId,
      if (launchTime != null) 'LaunchTime': unixTimestampToJson(launchTime),
      if (status != null) 'Status': status.toValue(),
      if (statusLastUpdatedDateTime != null)
        'StatusLastUpdatedDateTime':
            unixTimestampToJson(statusLastUpdatedDateTime),
      if (statusReason != null) 'StatusReason': statusReason,
      if (subnetId != null) 'SubnetId': subnetId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

enum DomainControllerStatus {
  creating,
  active,
  impaired,
  restoring,
  deleting,
  deleted,
  failed,
}

extension DomainControllerStatusValueExtension on DomainControllerStatus {
  String toValue() {
    switch (this) {
      case DomainControllerStatus.creating:
        return 'Creating';
      case DomainControllerStatus.active:
        return 'Active';
      case DomainControllerStatus.impaired:
        return 'Impaired';
      case DomainControllerStatus.restoring:
        return 'Restoring';
      case DomainControllerStatus.deleting:
        return 'Deleting';
      case DomainControllerStatus.deleted:
        return 'Deleted';
      case DomainControllerStatus.failed:
        return 'Failed';
    }
  }
}

extension DomainControllerStatusFromString on String {
  DomainControllerStatus toDomainControllerStatus() {
    switch (this) {
      case 'Creating':
        return DomainControllerStatus.creating;
      case 'Active':
        return DomainControllerStatus.active;
      case 'Impaired':
        return DomainControllerStatus.impaired;
      case 'Restoring':
        return DomainControllerStatus.restoring;
      case 'Deleting':
        return DomainControllerStatus.deleting;
      case 'Deleted':
        return DomainControllerStatus.deleted;
      case 'Failed':
        return DomainControllerStatus.failed;
    }
    throw Exception('$this is not known in enum DomainControllerStatus');
  }
}

class EnableClientAuthenticationResult {
  EnableClientAuthenticationResult();

  factory EnableClientAuthenticationResult.fromJson(Map<String, dynamic> _) {
    return EnableClientAuthenticationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class EnableLDAPSResult {
  EnableLDAPSResult();

  factory EnableLDAPSResult.fromJson(Map<String, dynamic> _) {
    return EnableLDAPSResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>EnableRadius</a> operation.
class EnableRadiusResult {
  EnableRadiusResult();

  factory EnableRadiusResult.fromJson(Map<String, dynamic> _) {
    return EnableRadiusResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>EnableSso</a> operation.
class EnableSsoResult {
  EnableSsoResult();

  factory EnableSsoResult.fromJson(Map<String, dynamic> _) {
    return EnableSsoResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about Amazon SNS topic and Directory Service directory
/// associations.
class EventTopic {
  /// The date and time of when you associated your directory with the Amazon SNS
  /// topic.
  final DateTime? createdDateTime;

  /// The Directory ID of an Directory Service directory that will publish status
  /// messages to an Amazon SNS topic.
  final String? directoryId;

  /// The topic registration status.
  final TopicStatus? status;

  /// The Amazon SNS topic ARN (Amazon Resource Name).
  final String? topicArn;

  /// The name of an Amazon SNS topic the receives status messages from the
  /// directory.
  final String? topicName;

  EventTopic({
    this.createdDateTime,
    this.directoryId,
    this.status,
    this.topicArn,
    this.topicName,
  });

  factory EventTopic.fromJson(Map<String, dynamic> json) {
    return EventTopic(
      createdDateTime: timeStampFromJson(json['CreatedDateTime']),
      directoryId: json['DirectoryId'] as String?,
      status: (json['Status'] as String?)?.toTopicStatus(),
      topicArn: json['TopicArn'] as String?,
      topicName: json['TopicName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDateTime = this.createdDateTime;
    final directoryId = this.directoryId;
    final status = this.status;
    final topicArn = this.topicArn;
    final topicName = this.topicName;
    return {
      if (createdDateTime != null)
        'CreatedDateTime': unixTimestampToJson(createdDateTime),
      if (directoryId != null) 'DirectoryId': directoryId,
      if (status != null) 'Status': status.toValue(),
      if (topicArn != null) 'TopicArn': topicArn,
      if (topicName != null) 'TopicName': topicName,
    };
  }
}

/// Contains the results of the <a>GetDirectoryLimits</a> operation.
class GetDirectoryLimitsResult {
  /// A <a>DirectoryLimits</a> object that contains the directory limits for the
  /// current Region.
  final DirectoryLimits? directoryLimits;

  GetDirectoryLimitsResult({
    this.directoryLimits,
  });

  factory GetDirectoryLimitsResult.fromJson(Map<String, dynamic> json) {
    return GetDirectoryLimitsResult(
      directoryLimits: json['DirectoryLimits'] != null
          ? DirectoryLimits.fromJson(
              json['DirectoryLimits'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryLimits = this.directoryLimits;
    return {
      if (directoryLimits != null) 'DirectoryLimits': directoryLimits,
    };
  }
}

/// Contains the results of the <a>GetSnapshotLimits</a> operation.
class GetSnapshotLimitsResult {
  /// A <a>SnapshotLimits</a> object that contains the manual snapshot limits for
  /// the specified directory.
  final SnapshotLimits? snapshotLimits;

  GetSnapshotLimitsResult({
    this.snapshotLimits,
  });

  factory GetSnapshotLimitsResult.fromJson(Map<String, dynamic> json) {
    return GetSnapshotLimitsResult(
      snapshotLimits: json['SnapshotLimits'] != null
          ? SnapshotLimits.fromJson(
              json['SnapshotLimits'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotLimits = this.snapshotLimits;
    return {
      if (snapshotLimits != null) 'SnapshotLimits': snapshotLimits,
    };
  }
}

/// IP address block. This is often the address block of the DNS server used for
/// your self-managed domain.
class IpRoute {
  /// IP address block using CIDR format, for example 10.0.0.0/24. This is often
  /// the address block of the DNS server used for your self-managed domain. For a
  /// single IP address use a CIDR address block with /32. For example
  /// 10.0.0.0/32.
  final String? cidrIp;

  /// Description of the address block.
  final String? description;

  IpRoute({
    this.cidrIp,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final cidrIp = this.cidrIp;
    final description = this.description;
    return {
      if (cidrIp != null) 'CidrIp': cidrIp,
      if (description != null) 'Description': description,
    };
  }
}

/// Information about one or more IP address blocks.
class IpRouteInfo {
  /// The date and time the address block was added to the directory.
  final DateTime? addedDateTime;

  /// IP address block in the <a>IpRoute</a>.
  final String? cidrIp;

  /// Description of the <a>IpRouteInfo</a>.
  final String? description;

  /// Identifier (ID) of the directory associated with the IP addresses.
  final String? directoryId;

  /// The status of the IP address block.
  final IpRouteStatusMsg? ipRouteStatusMsg;

  /// The reason for the IpRouteStatusMsg.
  final String? ipRouteStatusReason;

  IpRouteInfo({
    this.addedDateTime,
    this.cidrIp,
    this.description,
    this.directoryId,
    this.ipRouteStatusMsg,
    this.ipRouteStatusReason,
  });

  factory IpRouteInfo.fromJson(Map<String, dynamic> json) {
    return IpRouteInfo(
      addedDateTime: timeStampFromJson(json['AddedDateTime']),
      cidrIp: json['CidrIp'] as String?,
      description: json['Description'] as String?,
      directoryId: json['DirectoryId'] as String?,
      ipRouteStatusMsg:
          (json['IpRouteStatusMsg'] as String?)?.toIpRouteStatusMsg(),
      ipRouteStatusReason: json['IpRouteStatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addedDateTime = this.addedDateTime;
    final cidrIp = this.cidrIp;
    final description = this.description;
    final directoryId = this.directoryId;
    final ipRouteStatusMsg = this.ipRouteStatusMsg;
    final ipRouteStatusReason = this.ipRouteStatusReason;
    return {
      if (addedDateTime != null)
        'AddedDateTime': unixTimestampToJson(addedDateTime),
      if (cidrIp != null) 'CidrIp': cidrIp,
      if (description != null) 'Description': description,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (ipRouteStatusMsg != null)
        'IpRouteStatusMsg': ipRouteStatusMsg.toValue(),
      if (ipRouteStatusReason != null)
        'IpRouteStatusReason': ipRouteStatusReason,
    };
  }
}

enum IpRouteStatusMsg {
  adding,
  added,
  removing,
  removed,
  addFailed,
  removeFailed,
}

extension IpRouteStatusMsgValueExtension on IpRouteStatusMsg {
  String toValue() {
    switch (this) {
      case IpRouteStatusMsg.adding:
        return 'Adding';
      case IpRouteStatusMsg.added:
        return 'Added';
      case IpRouteStatusMsg.removing:
        return 'Removing';
      case IpRouteStatusMsg.removed:
        return 'Removed';
      case IpRouteStatusMsg.addFailed:
        return 'AddFailed';
      case IpRouteStatusMsg.removeFailed:
        return 'RemoveFailed';
    }
  }
}

extension IpRouteStatusMsgFromString on String {
  IpRouteStatusMsg toIpRouteStatusMsg() {
    switch (this) {
      case 'Adding':
        return IpRouteStatusMsg.adding;
      case 'Added':
        return IpRouteStatusMsg.added;
      case 'Removing':
        return IpRouteStatusMsg.removing;
      case 'Removed':
        return IpRouteStatusMsg.removed;
      case 'AddFailed':
        return IpRouteStatusMsg.addFailed;
      case 'RemoveFailed':
        return IpRouteStatusMsg.removeFailed;
    }
    throw Exception('$this is not known in enum IpRouteStatusMsg');
  }
}

/// Contains general information about the LDAPS settings.
class LDAPSSettingInfo {
  /// The state of the LDAPS settings.
  final LDAPSStatus? lDAPSStatus;

  /// Describes a state change for LDAPS.
  final String? lDAPSStatusReason;

  /// The date and time when the LDAPS settings were last updated.
  final DateTime? lastUpdatedDateTime;

  LDAPSSettingInfo({
    this.lDAPSStatus,
    this.lDAPSStatusReason,
    this.lastUpdatedDateTime,
  });

  factory LDAPSSettingInfo.fromJson(Map<String, dynamic> json) {
    return LDAPSSettingInfo(
      lDAPSStatus: (json['LDAPSStatus'] as String?)?.toLDAPSStatus(),
      lDAPSStatusReason: json['LDAPSStatusReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final lDAPSStatus = this.lDAPSStatus;
    final lDAPSStatusReason = this.lDAPSStatusReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    return {
      if (lDAPSStatus != null) 'LDAPSStatus': lDAPSStatus.toValue(),
      if (lDAPSStatusReason != null) 'LDAPSStatusReason': lDAPSStatusReason,
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
    };
  }
}

enum LDAPSStatus {
  enabling,
  enabled,
  enableFailed,
  disabled,
}

extension LDAPSStatusValueExtension on LDAPSStatus {
  String toValue() {
    switch (this) {
      case LDAPSStatus.enabling:
        return 'Enabling';
      case LDAPSStatus.enabled:
        return 'Enabled';
      case LDAPSStatus.enableFailed:
        return 'EnableFailed';
      case LDAPSStatus.disabled:
        return 'Disabled';
    }
  }
}

extension LDAPSStatusFromString on String {
  LDAPSStatus toLDAPSStatus() {
    switch (this) {
      case 'Enabling':
        return LDAPSStatus.enabling;
      case 'Enabled':
        return LDAPSStatus.enabled;
      case 'EnableFailed':
        return LDAPSStatus.enableFailed;
      case 'Disabled':
        return LDAPSStatus.disabled;
    }
    throw Exception('$this is not known in enum LDAPSStatus');
  }
}

enum LDAPSType {
  client,
}

extension LDAPSTypeValueExtension on LDAPSType {
  String toValue() {
    switch (this) {
      case LDAPSType.client:
        return 'Client';
    }
  }
}

extension LDAPSTypeFromString on String {
  LDAPSType toLDAPSType() {
    switch (this) {
      case 'Client':
        return LDAPSType.client;
    }
    throw Exception('$this is not known in enum LDAPSType');
  }
}

class ListCertificatesResult {
  /// A list of certificates with basic details including certificate ID,
  /// certificate common name, certificate state.
  final List<CertificateInfo>? certificatesInfo;

  /// Indicates whether another page of certificates is available when the number
  /// of available certificates exceeds the page limit.
  final String? nextToken;

  ListCertificatesResult({
    this.certificatesInfo,
    this.nextToken,
  });

  factory ListCertificatesResult.fromJson(Map<String, dynamic> json) {
    return ListCertificatesResult(
      certificatesInfo: (json['CertificatesInfo'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificatesInfo = this.certificatesInfo;
    final nextToken = this.nextToken;
    return {
      if (certificatesInfo != null) 'CertificatesInfo': certificatesInfo,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIpRoutesResult {
  /// A list of <a>IpRoute</a>s.
  final List<IpRouteInfo>? ipRoutesInfo;

  /// If not null, more results are available. Pass this value for the
  /// <i>NextToken</i> parameter in a subsequent call to <a>ListIpRoutes</a> to
  /// retrieve the next set of items.
  final String? nextToken;

  ListIpRoutesResult({
    this.ipRoutesInfo,
    this.nextToken,
  });

  factory ListIpRoutesResult.fromJson(Map<String, dynamic> json) {
    return ListIpRoutesResult(
      ipRoutesInfo: (json['IpRoutesInfo'] as List?)
          ?.whereNotNull()
          .map((e) => IpRouteInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipRoutesInfo = this.ipRoutesInfo;
    final nextToken = this.nextToken;
    return {
      if (ipRoutesInfo != null) 'IpRoutesInfo': ipRoutesInfo,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLogSubscriptionsResult {
  /// A list of active <a>LogSubscription</a> objects for calling the Amazon Web
  /// Services account.
  final List<LogSubscription>? logSubscriptions;

  /// The token for the next set of items to return.
  final String? nextToken;

  ListLogSubscriptionsResult({
    this.logSubscriptions,
    this.nextToken,
  });

  factory ListLogSubscriptionsResult.fromJson(Map<String, dynamic> json) {
    return ListLogSubscriptionsResult(
      logSubscriptions: (json['LogSubscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => LogSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logSubscriptions = this.logSubscriptions;
    final nextToken = this.nextToken;
    return {
      if (logSubscriptions != null) 'LogSubscriptions': logSubscriptions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSchemaExtensionsResult {
  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent call to
  /// <code>ListSchemaExtensions</code> to retrieve the next set of items.
  final String? nextToken;

  /// Information about the schema extensions applied to the directory.
  final List<SchemaExtensionInfo>? schemaExtensionsInfo;

  ListSchemaExtensionsResult({
    this.nextToken,
    this.schemaExtensionsInfo,
  });

  factory ListSchemaExtensionsResult.fromJson(Map<String, dynamic> json) {
    return ListSchemaExtensionsResult(
      nextToken: json['NextToken'] as String?,
      schemaExtensionsInfo: (json['SchemaExtensionsInfo'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaExtensionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemaExtensionsInfo = this.schemaExtensionsInfo;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (schemaExtensionsInfo != null)
        'SchemaExtensionsInfo': schemaExtensionsInfo,
    };
  }
}

class ListTagsForResourceResult {
  /// Reserved for future use.
  final String? nextToken;

  /// List of tags returned by the ListTagsForResource operation.
  final List<Tag>? tags;

  ListTagsForResourceResult({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
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

/// Represents a log subscription, which tracks real-time data from a chosen log
/// group to a specified destination.
class LogSubscription {
  /// Identifier (ID) of the directory that you want to associate with the log
  /// subscription.
  final String? directoryId;

  /// The name of the log group.
  final String? logGroupName;

  /// The date and time that the log subscription was created.
  final DateTime? subscriptionCreatedDateTime;

  LogSubscription({
    this.directoryId,
    this.logGroupName,
    this.subscriptionCreatedDateTime,
  });

  factory LogSubscription.fromJson(Map<String, dynamic> json) {
    return LogSubscription(
      directoryId: json['DirectoryId'] as String?,
      logGroupName: json['LogGroupName'] as String?,
      subscriptionCreatedDateTime:
          timeStampFromJson(json['SubscriptionCreatedDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final logGroupName = this.logGroupName;
    final subscriptionCreatedDateTime = this.subscriptionCreatedDateTime;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (subscriptionCreatedDateTime != null)
        'SubscriptionCreatedDateTime':
            unixTimestampToJson(subscriptionCreatedDateTime),
    };
  }
}

/// OS version that the directory needs to be updated to.
class OSUpdateSettings {
  /// OS version that the directory needs to be updated to.
  final OSVersion? oSVersion;

  OSUpdateSettings({
    this.oSVersion,
  });

  factory OSUpdateSettings.fromJson(Map<String, dynamic> json) {
    return OSUpdateSettings(
      oSVersion: (json['OSVersion'] as String?)?.toOSVersion(),
    );
  }

  Map<String, dynamic> toJson() {
    final oSVersion = this.oSVersion;
    return {
      if (oSVersion != null) 'OSVersion': oSVersion.toValue(),
    };
  }
}

enum OSVersion {
  server_2012,
  server_2019,
}

extension OSVersionValueExtension on OSVersion {
  String toValue() {
    switch (this) {
      case OSVersion.server_2012:
        return 'SERVER_2012';
      case OSVersion.server_2019:
        return 'SERVER_2019';
    }
  }
}

extension OSVersionFromString on String {
  OSVersion toOSVersion() {
    switch (this) {
      case 'SERVER_2012':
        return OSVersion.server_2012;
      case 'SERVER_2019':
        return OSVersion.server_2019;
    }
    throw Exception('$this is not known in enum OSVersion');
  }
}

/// Describes the directory owner account details that have been shared to the
/// directory consumer account.
class OwnerDirectoryDescription {
  /// Identifier of the directory owner account.
  final String? accountId;

  /// Identifier of the Managed Microsoft AD directory in the directory owner
  /// account.
  final String? directoryId;

  /// IP address of the directory’s domain controllers.
  final List<String>? dnsIpAddrs;

  /// A <a>RadiusSettings</a> object that contains information about the RADIUS
  /// server.
  final RadiusSettings? radiusSettings;

  /// Information about the status of the RADIUS server.
  final RadiusStatus? radiusStatus;

  /// Information about the VPC settings for the directory.
  final DirectoryVpcSettingsDescription? vpcSettings;

  OwnerDirectoryDescription({
    this.accountId,
    this.directoryId,
    this.dnsIpAddrs,
    this.radiusSettings,
    this.radiusStatus,
    this.vpcSettings,
  });

  factory OwnerDirectoryDescription.fromJson(Map<String, dynamic> json) {
    return OwnerDirectoryDescription(
      accountId: json['AccountId'] as String?,
      directoryId: json['DirectoryId'] as String?,
      dnsIpAddrs: (json['DnsIpAddrs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      radiusSettings: json['RadiusSettings'] != null
          ? RadiusSettings.fromJson(
              json['RadiusSettings'] as Map<String, dynamic>)
          : null,
      radiusStatus: (json['RadiusStatus'] as String?)?.toRadiusStatus(),
      vpcSettings: json['VpcSettings'] != null
          ? DirectoryVpcSettingsDescription.fromJson(
              json['VpcSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final directoryId = this.directoryId;
    final dnsIpAddrs = this.dnsIpAddrs;
    final radiusSettings = this.radiusSettings;
    final radiusStatus = this.radiusStatus;
    final vpcSettings = this.vpcSettings;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (dnsIpAddrs != null) 'DnsIpAddrs': dnsIpAddrs,
      if (radiusSettings != null) 'RadiusSettings': radiusSettings,
      if (radiusStatus != null) 'RadiusStatus': radiusStatus.toValue(),
      if (vpcSettings != null) 'VpcSettings': vpcSettings,
    };
  }
}

enum RadiusAuthenticationProtocol {
  pap,
  chap,
  msCHAPv1,
  msCHAPv2,
}

extension RadiusAuthenticationProtocolValueExtension
    on RadiusAuthenticationProtocol {
  String toValue() {
    switch (this) {
      case RadiusAuthenticationProtocol.pap:
        return 'PAP';
      case RadiusAuthenticationProtocol.chap:
        return 'CHAP';
      case RadiusAuthenticationProtocol.msCHAPv1:
        return 'MS-CHAPv1';
      case RadiusAuthenticationProtocol.msCHAPv2:
        return 'MS-CHAPv2';
    }
  }
}

extension RadiusAuthenticationProtocolFromString on String {
  RadiusAuthenticationProtocol toRadiusAuthenticationProtocol() {
    switch (this) {
      case 'PAP':
        return RadiusAuthenticationProtocol.pap;
      case 'CHAP':
        return RadiusAuthenticationProtocol.chap;
      case 'MS-CHAPv1':
        return RadiusAuthenticationProtocol.msCHAPv1;
      case 'MS-CHAPv2':
        return RadiusAuthenticationProtocol.msCHAPv2;
    }
    throw Exception('$this is not known in enum RadiusAuthenticationProtocol');
  }
}

/// Contains information about a Remote Authentication Dial In User Service
/// (RADIUS) server.
class RadiusSettings {
  /// The protocol specified for your RADIUS endpoints.
  final RadiusAuthenticationProtocol? authenticationProtocol;

  /// Not currently used.
  final String? displayLabel;

  /// The port that your RADIUS server is using for communications. Your
  /// self-managed network must allow inbound traffic over this port from the
  /// Directory Service servers.
  final int? radiusPort;

  /// The maximum number of times that communication with the RADIUS server is
  /// attempted.
  final int? radiusRetries;

  /// An array of strings that contains the fully qualified domain name (FQDN) or
  /// IP addresses of the RADIUS server endpoints, or the FQDN or IP addresses of
  /// your RADIUS server load balancer.
  final List<String>? radiusServers;

  /// The amount of time, in seconds, to wait for the RADIUS server to respond.
  final int? radiusTimeout;

  /// Required for enabling RADIUS on the directory.
  final String? sharedSecret;

  /// Not currently used.
  final bool? useSameUsername;

  RadiusSettings({
    this.authenticationProtocol,
    this.displayLabel,
    this.radiusPort,
    this.radiusRetries,
    this.radiusServers,
    this.radiusTimeout,
    this.sharedSecret,
    this.useSameUsername,
  });

  factory RadiusSettings.fromJson(Map<String, dynamic> json) {
    return RadiusSettings(
      authenticationProtocol: (json['AuthenticationProtocol'] as String?)
          ?.toRadiusAuthenticationProtocol(),
      displayLabel: json['DisplayLabel'] as String?,
      radiusPort: json['RadiusPort'] as int?,
      radiusRetries: json['RadiusRetries'] as int?,
      radiusServers: (json['RadiusServers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      radiusTimeout: json['RadiusTimeout'] as int?,
      sharedSecret: json['SharedSecret'] as String?,
      useSameUsername: json['UseSameUsername'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationProtocol = this.authenticationProtocol;
    final displayLabel = this.displayLabel;
    final radiusPort = this.radiusPort;
    final radiusRetries = this.radiusRetries;
    final radiusServers = this.radiusServers;
    final radiusTimeout = this.radiusTimeout;
    final sharedSecret = this.sharedSecret;
    final useSameUsername = this.useSameUsername;
    return {
      if (authenticationProtocol != null)
        'AuthenticationProtocol': authenticationProtocol.toValue(),
      if (displayLabel != null) 'DisplayLabel': displayLabel,
      if (radiusPort != null) 'RadiusPort': radiusPort,
      if (radiusRetries != null) 'RadiusRetries': radiusRetries,
      if (radiusServers != null) 'RadiusServers': radiusServers,
      if (radiusTimeout != null) 'RadiusTimeout': radiusTimeout,
      if (sharedSecret != null) 'SharedSecret': sharedSecret,
      if (useSameUsername != null) 'UseSameUsername': useSameUsername,
    };
  }
}

enum RadiusStatus {
  creating,
  completed,
  failed,
}

extension RadiusStatusValueExtension on RadiusStatus {
  String toValue() {
    switch (this) {
      case RadiusStatus.creating:
        return 'Creating';
      case RadiusStatus.completed:
        return 'Completed';
      case RadiusStatus.failed:
        return 'Failed';
    }
  }
}

extension RadiusStatusFromString on String {
  RadiusStatus toRadiusStatus() {
    switch (this) {
      case 'Creating':
        return RadiusStatus.creating;
      case 'Completed':
        return RadiusStatus.completed;
      case 'Failed':
        return RadiusStatus.failed;
    }
    throw Exception('$this is not known in enum RadiusStatus');
  }
}

/// The replicated Region information for a directory.
class RegionDescription {
  /// The desired number of domain controllers in the specified Region for the
  /// specified directory.
  final int? desiredNumberOfDomainControllers;

  /// The identifier of the directory.
  final String? directoryId;

  /// The date and time that the Region description was last updated.
  final DateTime? lastUpdatedDateTime;

  /// Specifies when the Region replication began.
  final DateTime? launchTime;

  /// The name of the Region. For example, <code>us-east-1</code>.
  final String? regionName;

  /// Specifies whether the Region is the primary Region or an additional Region.
  final RegionType? regionType;

  /// The status of the replication process for the specified Region.
  final DirectoryStage? status;

  /// The date and time that the Region status was last updated.
  final DateTime? statusLastUpdatedDateTime;
  final DirectoryVpcSettings? vpcSettings;

  RegionDescription({
    this.desiredNumberOfDomainControllers,
    this.directoryId,
    this.lastUpdatedDateTime,
    this.launchTime,
    this.regionName,
    this.regionType,
    this.status,
    this.statusLastUpdatedDateTime,
    this.vpcSettings,
  });

  factory RegionDescription.fromJson(Map<String, dynamic> json) {
    return RegionDescription(
      desiredNumberOfDomainControllers:
          json['DesiredNumberOfDomainControllers'] as int?,
      directoryId: json['DirectoryId'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
      launchTime: timeStampFromJson(json['LaunchTime']),
      regionName: json['RegionName'] as String?,
      regionType: (json['RegionType'] as String?)?.toRegionType(),
      status: (json['Status'] as String?)?.toDirectoryStage(),
      statusLastUpdatedDateTime:
          timeStampFromJson(json['StatusLastUpdatedDateTime']),
      vpcSettings: json['VpcSettings'] != null
          ? DirectoryVpcSettings.fromJson(
              json['VpcSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final desiredNumberOfDomainControllers =
        this.desiredNumberOfDomainControllers;
    final directoryId = this.directoryId;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final launchTime = this.launchTime;
    final regionName = this.regionName;
    final regionType = this.regionType;
    final status = this.status;
    final statusLastUpdatedDateTime = this.statusLastUpdatedDateTime;
    final vpcSettings = this.vpcSettings;
    return {
      if (desiredNumberOfDomainControllers != null)
        'DesiredNumberOfDomainControllers': desiredNumberOfDomainControllers,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (launchTime != null) 'LaunchTime': unixTimestampToJson(launchTime),
      if (regionName != null) 'RegionName': regionName,
      if (regionType != null) 'RegionType': regionType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (statusLastUpdatedDateTime != null)
        'StatusLastUpdatedDateTime':
            unixTimestampToJson(statusLastUpdatedDateTime),
      if (vpcSettings != null) 'VpcSettings': vpcSettings,
    };
  }
}

enum RegionType {
  primary,
  additional,
}

extension RegionTypeValueExtension on RegionType {
  String toValue() {
    switch (this) {
      case RegionType.primary:
        return 'Primary';
      case RegionType.additional:
        return 'Additional';
    }
  }
}

extension RegionTypeFromString on String {
  RegionType toRegionType() {
    switch (this) {
      case 'Primary':
        return RegionType.primary;
      case 'Additional':
        return RegionType.additional;
    }
    throw Exception('$this is not known in enum RegionType');
  }
}

/// Provides information about the Regions that are configured for multi-Region
/// replication.
class RegionsInfo {
  /// Lists the Regions where the directory has been replicated, excluding the
  /// primary Region.
  final List<String>? additionalRegions;

  /// The Region where the Managed Microsoft AD directory was originally created.
  final String? primaryRegion;

  RegionsInfo({
    this.additionalRegions,
    this.primaryRegion,
  });

  factory RegionsInfo.fromJson(Map<String, dynamic> json) {
    return RegionsInfo(
      additionalRegions: (json['AdditionalRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      primaryRegion: json['PrimaryRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalRegions = this.additionalRegions;
    final primaryRegion = this.primaryRegion;
    return {
      if (additionalRegions != null) 'AdditionalRegions': additionalRegions,
      if (primaryRegion != null) 'PrimaryRegion': primaryRegion,
    };
  }
}

class RegisterCertificateResult {
  /// The identifier of the certificate.
  final String? certificateId;

  RegisterCertificateResult({
    this.certificateId,
  });

  factory RegisterCertificateResult.fromJson(Map<String, dynamic> json) {
    return RegisterCertificateResult(
      certificateId: json['CertificateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateId = this.certificateId;
    return {
      if (certificateId != null) 'CertificateId': certificateId,
    };
  }
}

/// The result of a RegisterEventTopic request.
class RegisterEventTopicResult {
  RegisterEventTopicResult();

  factory RegisterEventTopicResult.fromJson(Map<String, dynamic> _) {
    return RegisterEventTopicResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RejectSharedDirectoryResult {
  /// Identifier of the shared directory in the directory consumer account.
  final String? sharedDirectoryId;

  RejectSharedDirectoryResult({
    this.sharedDirectoryId,
  });

  factory RejectSharedDirectoryResult.fromJson(Map<String, dynamic> json) {
    return RejectSharedDirectoryResult(
      sharedDirectoryId: json['SharedDirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sharedDirectoryId = this.sharedDirectoryId;
    return {
      if (sharedDirectoryId != null) 'SharedDirectoryId': sharedDirectoryId,
    };
  }
}

class RemoveIpRoutesResult {
  RemoveIpRoutesResult();

  factory RemoveIpRoutesResult.fromJson(Map<String, dynamic> _) {
    return RemoveIpRoutesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RemoveRegionResult {
  RemoveRegionResult();

  factory RemoveRegionResult.fromJson(Map<String, dynamic> _) {
    return RemoveRegionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RemoveTagsFromResourceResult {
  RemoveTagsFromResourceResult();

  factory RemoveTagsFromResourceResult.fromJson(Map<String, dynamic> _) {
    return RemoveTagsFromResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum ReplicationScope {
  domain,
}

extension ReplicationScopeValueExtension on ReplicationScope {
  String toValue() {
    switch (this) {
      case ReplicationScope.domain:
        return 'Domain';
    }
  }
}

extension ReplicationScopeFromString on String {
  ReplicationScope toReplicationScope() {
    switch (this) {
      case 'Domain':
        return ReplicationScope.domain;
    }
    throw Exception('$this is not known in enum ReplicationScope');
  }
}

class ResetUserPasswordResult {
  ResetUserPasswordResult();

  factory ResetUserPasswordResult.fromJson(Map<String, dynamic> _) {
    return ResetUserPasswordResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>RestoreFromSnapshot</a> operation.
class RestoreFromSnapshotResult {
  RestoreFromSnapshotResult();

  factory RestoreFromSnapshotResult.fromJson(Map<String, dynamic> _) {
    return RestoreFromSnapshotResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a schema extension.
class SchemaExtensionInfo {
  /// A description of the schema extension.
  final String? description;

  /// The identifier of the directory to which the schema extension is applied.
  final String? directoryId;

  /// The date and time that the schema extension was completed.
  final DateTime? endDateTime;

  /// The identifier of the schema extension.
  final String? schemaExtensionId;

  /// The current status of the schema extension.
  final SchemaExtensionStatus? schemaExtensionStatus;

  /// The reason for the <code>SchemaExtensionStatus</code>.
  final String? schemaExtensionStatusReason;

  /// The date and time that the schema extension started being applied to the
  /// directory.
  final DateTime? startDateTime;

  SchemaExtensionInfo({
    this.description,
    this.directoryId,
    this.endDateTime,
    this.schemaExtensionId,
    this.schemaExtensionStatus,
    this.schemaExtensionStatusReason,
    this.startDateTime,
  });

  factory SchemaExtensionInfo.fromJson(Map<String, dynamic> json) {
    return SchemaExtensionInfo(
      description: json['Description'] as String?,
      directoryId: json['DirectoryId'] as String?,
      endDateTime: timeStampFromJson(json['EndDateTime']),
      schemaExtensionId: json['SchemaExtensionId'] as String?,
      schemaExtensionStatus:
          (json['SchemaExtensionStatus'] as String?)?.toSchemaExtensionStatus(),
      schemaExtensionStatusReason:
          json['SchemaExtensionStatusReason'] as String?,
      startDateTime: timeStampFromJson(json['StartDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final directoryId = this.directoryId;
    final endDateTime = this.endDateTime;
    final schemaExtensionId = this.schemaExtensionId;
    final schemaExtensionStatus = this.schemaExtensionStatus;
    final schemaExtensionStatusReason = this.schemaExtensionStatusReason;
    final startDateTime = this.startDateTime;
    return {
      if (description != null) 'Description': description,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (schemaExtensionId != null) 'SchemaExtensionId': schemaExtensionId,
      if (schemaExtensionStatus != null)
        'SchemaExtensionStatus': schemaExtensionStatus.toValue(),
      if (schemaExtensionStatusReason != null)
        'SchemaExtensionStatusReason': schemaExtensionStatusReason,
      if (startDateTime != null)
        'StartDateTime': unixTimestampToJson(startDateTime),
    };
  }
}

enum SchemaExtensionStatus {
  initializing,
  creatingSnapshot,
  updatingSchema,
  replicating,
  cancelInProgress,
  rollbackInProgress,
  cancelled,
  failed,
  completed,
}

extension SchemaExtensionStatusValueExtension on SchemaExtensionStatus {
  String toValue() {
    switch (this) {
      case SchemaExtensionStatus.initializing:
        return 'Initializing';
      case SchemaExtensionStatus.creatingSnapshot:
        return 'CreatingSnapshot';
      case SchemaExtensionStatus.updatingSchema:
        return 'UpdatingSchema';
      case SchemaExtensionStatus.replicating:
        return 'Replicating';
      case SchemaExtensionStatus.cancelInProgress:
        return 'CancelInProgress';
      case SchemaExtensionStatus.rollbackInProgress:
        return 'RollbackInProgress';
      case SchemaExtensionStatus.cancelled:
        return 'Cancelled';
      case SchemaExtensionStatus.failed:
        return 'Failed';
      case SchemaExtensionStatus.completed:
        return 'Completed';
    }
  }
}

extension SchemaExtensionStatusFromString on String {
  SchemaExtensionStatus toSchemaExtensionStatus() {
    switch (this) {
      case 'Initializing':
        return SchemaExtensionStatus.initializing;
      case 'CreatingSnapshot':
        return SchemaExtensionStatus.creatingSnapshot;
      case 'UpdatingSchema':
        return SchemaExtensionStatus.updatingSchema;
      case 'Replicating':
        return SchemaExtensionStatus.replicating;
      case 'CancelInProgress':
        return SchemaExtensionStatus.cancelInProgress;
      case 'RollbackInProgress':
        return SchemaExtensionStatus.rollbackInProgress;
      case 'Cancelled':
        return SchemaExtensionStatus.cancelled;
      case 'Failed':
        return SchemaExtensionStatus.failed;
      case 'Completed':
        return SchemaExtensionStatus.completed;
    }
    throw Exception('$this is not known in enum SchemaExtensionStatus');
  }
}

enum SelectiveAuth {
  enabled,
  disabled,
}

extension SelectiveAuthValueExtension on SelectiveAuth {
  String toValue() {
    switch (this) {
      case SelectiveAuth.enabled:
        return 'Enabled';
      case SelectiveAuth.disabled:
        return 'Disabled';
    }
  }
}

extension SelectiveAuthFromString on String {
  SelectiveAuth toSelectiveAuth() {
    switch (this) {
      case 'Enabled':
        return SelectiveAuth.enabled;
      case 'Disabled':
        return SelectiveAuth.disabled;
    }
    throw Exception('$this is not known in enum SelectiveAuth');
  }
}

/// Contains information about the configurable settings for a directory.
class Setting {
  /// The name of the directory setting. For example:
  ///
  /// <code>TLS_1_0</code>
  final String name;

  /// The value of the directory setting for which to retrieve information. For
  /// example, for <code>TLS_1_0</code>, the valid values are: <code>Enable</code>
  /// and <code>Disable</code>.
  final String value;

  Setting({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// Contains information about the specified configurable setting for a
/// directory.
class SettingEntry {
  /// The valid range of values for the directory setting. These values depend on
  /// the <code>DataType</code> of your directory.
  final String? allowedValues;

  /// The value of the directory setting that is applied to the directory.
  final String? appliedValue;

  /// The data type of a directory setting. This is used to define the
  /// <code>AllowedValues</code> of a setting. For example a data type can be
  /// <code>Boolean</code>, <code>DurationInSeconds</code>, or <code>Enum</code>.
  final String? dataType;

  /// The date and time when the request to update a directory setting was last
  /// submitted.
  final DateTime? lastRequestedDateTime;

  /// The date and time when the directory setting was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the directory setting. For example:
  ///
  /// <code>TLS_1_0</code>
  final String? name;

  /// Details about the status of the request to update the directory setting. If
  /// the directory setting is deployed in more than one region, status is
  /// returned for the request in each region where the setting is deployed.
  final Map<String, DirectoryConfigurationStatus>? requestDetailedStatus;

  /// The overall status of the request to update the directory setting request.
  /// If the directory setting is deployed in more than one region, and the
  /// request fails in any region, the overall status is <code>Failed</code>.
  final DirectoryConfigurationStatus? requestStatus;

  /// The last status message for the directory status request.
  final String? requestStatusMessage;

  /// The value that was last requested for the directory setting.
  final String? requestedValue;

  /// The type, or category, of a directory setting. Similar settings have the
  /// same type. For example, <code>Protocol</code>, <code>Cipher</code>, or
  /// <code>Certificate-Based Authentication</code>.
  final String? type;

  SettingEntry({
    this.allowedValues,
    this.appliedValue,
    this.dataType,
    this.lastRequestedDateTime,
    this.lastUpdatedDateTime,
    this.name,
    this.requestDetailedStatus,
    this.requestStatus,
    this.requestStatusMessage,
    this.requestedValue,
    this.type,
  });

  factory SettingEntry.fromJson(Map<String, dynamic> json) {
    return SettingEntry(
      allowedValues: json['AllowedValues'] as String?,
      appliedValue: json['AppliedValue'] as String?,
      dataType: json['DataType'] as String?,
      lastRequestedDateTime: timeStampFromJson(json['LastRequestedDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
      name: json['Name'] as String?,
      requestDetailedStatus:
          (json['RequestDetailedStatus'] as Map<String, dynamic>?)?.map(
              (k, e) =>
                  MapEntry(k, (e as String).toDirectoryConfigurationStatus())),
      requestStatus:
          (json['RequestStatus'] as String?)?.toDirectoryConfigurationStatus(),
      requestStatusMessage: json['RequestStatusMessage'] as String?,
      requestedValue: json['RequestedValue'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final appliedValue = this.appliedValue;
    final dataType = this.dataType;
    final lastRequestedDateTime = this.lastRequestedDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final requestDetailedStatus = this.requestDetailedStatus;
    final requestStatus = this.requestStatus;
    final requestStatusMessage = this.requestStatusMessage;
    final requestedValue = this.requestedValue;
    final type = this.type;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (appliedValue != null) 'AppliedValue': appliedValue,
      if (dataType != null) 'DataType': dataType,
      if (lastRequestedDateTime != null)
        'LastRequestedDateTime': unixTimestampToJson(lastRequestedDateTime),
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'Name': name,
      if (requestDetailedStatus != null)
        'RequestDetailedStatus':
            requestDetailedStatus.map((k, e) => MapEntry(k, e.toValue())),
      if (requestStatus != null) 'RequestStatus': requestStatus.toValue(),
      if (requestStatusMessage != null)
        'RequestStatusMessage': requestStatusMessage,
      if (requestedValue != null) 'RequestedValue': requestedValue,
      if (type != null) 'Type': type,
    };
  }
}

class ShareDirectoryResult {
  /// Identifier of the directory that is stored in the directory consumer account
  /// that is shared from the specified directory (<code>DirectoryId</code>).
  final String? sharedDirectoryId;

  ShareDirectoryResult({
    this.sharedDirectoryId,
  });

  factory ShareDirectoryResult.fromJson(Map<String, dynamic> json) {
    return ShareDirectoryResult(
      sharedDirectoryId: json['SharedDirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sharedDirectoryId = this.sharedDirectoryId;
    return {
      if (sharedDirectoryId != null) 'SharedDirectoryId': sharedDirectoryId,
    };
  }
}

enum ShareMethod {
  organizations,
  handshake,
}

extension ShareMethodValueExtension on ShareMethod {
  String toValue() {
    switch (this) {
      case ShareMethod.organizations:
        return 'ORGANIZATIONS';
      case ShareMethod.handshake:
        return 'HANDSHAKE';
    }
  }
}

extension ShareMethodFromString on String {
  ShareMethod toShareMethod() {
    switch (this) {
      case 'ORGANIZATIONS':
        return ShareMethod.organizations;
      case 'HANDSHAKE':
        return ShareMethod.handshake;
    }
    throw Exception('$this is not known in enum ShareMethod');
  }
}

enum ShareStatus {
  shared,
  pendingAcceptance,
  rejected,
  rejecting,
  rejectFailed,
  sharing,
  shareFailed,
  deleted,
  deleting,
}

extension ShareStatusValueExtension on ShareStatus {
  String toValue() {
    switch (this) {
      case ShareStatus.shared:
        return 'Shared';
      case ShareStatus.pendingAcceptance:
        return 'PendingAcceptance';
      case ShareStatus.rejected:
        return 'Rejected';
      case ShareStatus.rejecting:
        return 'Rejecting';
      case ShareStatus.rejectFailed:
        return 'RejectFailed';
      case ShareStatus.sharing:
        return 'Sharing';
      case ShareStatus.shareFailed:
        return 'ShareFailed';
      case ShareStatus.deleted:
        return 'Deleted';
      case ShareStatus.deleting:
        return 'Deleting';
    }
  }
}

extension ShareStatusFromString on String {
  ShareStatus toShareStatus() {
    switch (this) {
      case 'Shared':
        return ShareStatus.shared;
      case 'PendingAcceptance':
        return ShareStatus.pendingAcceptance;
      case 'Rejected':
        return ShareStatus.rejected;
      case 'Rejecting':
        return ShareStatus.rejecting;
      case 'RejectFailed':
        return ShareStatus.rejectFailed;
      case 'Sharing':
        return ShareStatus.sharing;
      case 'ShareFailed':
        return ShareStatus.shareFailed;
      case 'Deleted':
        return ShareStatus.deleted;
      case 'Deleting':
        return ShareStatus.deleting;
    }
    throw Exception('$this is not known in enum ShareStatus');
  }
}

/// Identifier that contains details about the directory consumer account.
class ShareTarget {
  /// Identifier of the directory consumer account.
  final String id;

  /// Type of identifier to be used in the <code>Id</code> field.
  final TargetType type;

  ShareTarget({
    required this.id,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      'Id': id,
      'Type': type.toValue(),
    };
  }
}

/// Details about the shared directory in the directory owner account for which
/// the share request in the directory consumer account has been accepted.
class SharedDirectory {
  /// The date and time that the shared directory was created.
  final DateTime? createdDateTime;

  /// The date and time that the shared directory was last updated.
  final DateTime? lastUpdatedDateTime;

  /// Identifier of the directory owner account, which contains the directory that
  /// has been shared to the consumer account.
  final String? ownerAccountId;

  /// Identifier of the directory in the directory owner account.
  final String? ownerDirectoryId;

  /// The method used when sharing a directory to determine whether the directory
  /// should be shared within your Amazon Web Services organization
  /// (<code>ORGANIZATIONS</code>) or with any Amazon Web Services account by
  /// sending a shared directory request (<code>HANDSHAKE</code>).
  final ShareMethod? shareMethod;

  /// A directory share request that is sent by the directory owner to the
  /// directory consumer. The request includes a typed message to help the
  /// directory consumer administrator determine whether to approve or reject the
  /// share invitation.
  final String? shareNotes;

  /// Current directory status of the shared Managed Microsoft AD directory.
  final ShareStatus? shareStatus;

  /// Identifier of the directory consumer account that has access to the shared
  /// directory (<code>OwnerDirectoryId</code>) in the directory owner account.
  final String? sharedAccountId;

  /// Identifier of the shared directory in the directory consumer account. This
  /// identifier is different for each directory owner account.
  final String? sharedDirectoryId;

  SharedDirectory({
    this.createdDateTime,
    this.lastUpdatedDateTime,
    this.ownerAccountId,
    this.ownerDirectoryId,
    this.shareMethod,
    this.shareNotes,
    this.shareStatus,
    this.sharedAccountId,
    this.sharedDirectoryId,
  });

  factory SharedDirectory.fromJson(Map<String, dynamic> json) {
    return SharedDirectory(
      createdDateTime: timeStampFromJson(json['CreatedDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
      ownerAccountId: json['OwnerAccountId'] as String?,
      ownerDirectoryId: json['OwnerDirectoryId'] as String?,
      shareMethod: (json['ShareMethod'] as String?)?.toShareMethod(),
      shareNotes: json['ShareNotes'] as String?,
      shareStatus: (json['ShareStatus'] as String?)?.toShareStatus(),
      sharedAccountId: json['SharedAccountId'] as String?,
      sharedDirectoryId: json['SharedDirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDateTime = this.createdDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final ownerAccountId = this.ownerAccountId;
    final ownerDirectoryId = this.ownerDirectoryId;
    final shareMethod = this.shareMethod;
    final shareNotes = this.shareNotes;
    final shareStatus = this.shareStatus;
    final sharedAccountId = this.sharedAccountId;
    final sharedDirectoryId = this.sharedDirectoryId;
    return {
      if (createdDateTime != null)
        'CreatedDateTime': unixTimestampToJson(createdDateTime),
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (ownerDirectoryId != null) 'OwnerDirectoryId': ownerDirectoryId,
      if (shareMethod != null) 'ShareMethod': shareMethod.toValue(),
      if (shareNotes != null) 'ShareNotes': shareNotes,
      if (shareStatus != null) 'ShareStatus': shareStatus.toValue(),
      if (sharedAccountId != null) 'SharedAccountId': sharedAccountId,
      if (sharedDirectoryId != null) 'SharedDirectoryId': sharedDirectoryId,
    };
  }
}

/// Describes a directory snapshot.
class Snapshot {
  /// The directory identifier.
  final String? directoryId;

  /// The descriptive name of the snapshot.
  final String? name;

  /// The snapshot identifier.
  final String? snapshotId;

  /// The date and time that the snapshot was taken.
  final DateTime? startTime;

  /// The snapshot status.
  final SnapshotStatus? status;

  /// The snapshot type.
  final SnapshotType? type;

  Snapshot({
    this.directoryId,
    this.name,
    this.snapshotId,
    this.startTime,
    this.status,
    this.type,
  });

  factory Snapshot.fromJson(Map<String, dynamic> json) {
    return Snapshot(
      directoryId: json['DirectoryId'] as String?,
      name: json['Name'] as String?,
      snapshotId: json['SnapshotId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toSnapshotStatus(),
      type: (json['Type'] as String?)?.toSnapshotType(),
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final name = this.name;
    final snapshotId = this.snapshotId;
    final startTime = this.startTime;
    final status = this.status;
    final type = this.type;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (name != null) 'Name': name,
      if (snapshotId != null) 'SnapshotId': snapshotId,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Contains manual snapshot limit information for a directory.
class SnapshotLimits {
  /// The current number of manual snapshots of the directory.
  final int? manualSnapshotsCurrentCount;

  /// The maximum number of manual snapshots allowed.
  final int? manualSnapshotsLimit;

  /// Indicates if the manual snapshot limit has been reached.
  final bool? manualSnapshotsLimitReached;

  SnapshotLimits({
    this.manualSnapshotsCurrentCount,
    this.manualSnapshotsLimit,
    this.manualSnapshotsLimitReached,
  });

  factory SnapshotLimits.fromJson(Map<String, dynamic> json) {
    return SnapshotLimits(
      manualSnapshotsCurrentCount: json['ManualSnapshotsCurrentCount'] as int?,
      manualSnapshotsLimit: json['ManualSnapshotsLimit'] as int?,
      manualSnapshotsLimitReached: json['ManualSnapshotsLimitReached'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final manualSnapshotsCurrentCount = this.manualSnapshotsCurrentCount;
    final manualSnapshotsLimit = this.manualSnapshotsLimit;
    final manualSnapshotsLimitReached = this.manualSnapshotsLimitReached;
    return {
      if (manualSnapshotsCurrentCount != null)
        'ManualSnapshotsCurrentCount': manualSnapshotsCurrentCount,
      if (manualSnapshotsLimit != null)
        'ManualSnapshotsLimit': manualSnapshotsLimit,
      if (manualSnapshotsLimitReached != null)
        'ManualSnapshotsLimitReached': manualSnapshotsLimitReached,
    };
  }
}

enum SnapshotStatus {
  creating,
  completed,
  failed,
}

extension SnapshotStatusValueExtension on SnapshotStatus {
  String toValue() {
    switch (this) {
      case SnapshotStatus.creating:
        return 'Creating';
      case SnapshotStatus.completed:
        return 'Completed';
      case SnapshotStatus.failed:
        return 'Failed';
    }
  }
}

extension SnapshotStatusFromString on String {
  SnapshotStatus toSnapshotStatus() {
    switch (this) {
      case 'Creating':
        return SnapshotStatus.creating;
      case 'Completed':
        return SnapshotStatus.completed;
      case 'Failed':
        return SnapshotStatus.failed;
    }
    throw Exception('$this is not known in enum SnapshotStatus');
  }
}

enum SnapshotType {
  auto,
  manual,
}

extension SnapshotTypeValueExtension on SnapshotType {
  String toValue() {
    switch (this) {
      case SnapshotType.auto:
        return 'Auto';
      case SnapshotType.manual:
        return 'Manual';
    }
  }
}

extension SnapshotTypeFromString on String {
  SnapshotType toSnapshotType() {
    switch (this) {
      case 'Auto':
        return SnapshotType.auto;
      case 'Manual':
        return SnapshotType.manual;
    }
    throw Exception('$this is not known in enum SnapshotType');
  }
}

class StartSchemaExtensionResult {
  /// The identifier of the schema extension that will be applied.
  final String? schemaExtensionId;

  StartSchemaExtensionResult({
    this.schemaExtensionId,
  });

  factory StartSchemaExtensionResult.fromJson(Map<String, dynamic> json) {
    return StartSchemaExtensionResult(
      schemaExtensionId: json['SchemaExtensionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaExtensionId = this.schemaExtensionId;
    return {
      if (schemaExtensionId != null) 'SchemaExtensionId': schemaExtensionId,
    };
  }
}

/// Metadata assigned to a directory consisting of a key-value pair.
class Tag {
  /// Required name of the tag. The string value can be Unicode characters and
  /// cannot be prefixed with "aws:". The string can contain only the set of
  /// Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java
  /// regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  final String key;

  /// The optional value of the tag. The string value can be Unicode characters.
  /// The string can contain only the set of Unicode letters, digits, white-space,
  /// '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
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

enum TargetType {
  account,
}

extension TargetTypeValueExtension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.account:
        return 'ACCOUNT';
    }
  }
}

extension TargetTypeFromString on String {
  TargetType toTargetType() {
    switch (this) {
      case 'ACCOUNT':
        return TargetType.account;
    }
    throw Exception('$this is not known in enum TargetType');
  }
}

enum TopicStatus {
  registered,
  topicNotFound,
  failed,
  deleted,
}

extension TopicStatusValueExtension on TopicStatus {
  String toValue() {
    switch (this) {
      case TopicStatus.registered:
        return 'Registered';
      case TopicStatus.topicNotFound:
        return 'Topic not found';
      case TopicStatus.failed:
        return 'Failed';
      case TopicStatus.deleted:
        return 'Deleted';
    }
  }
}

extension TopicStatusFromString on String {
  TopicStatus toTopicStatus() {
    switch (this) {
      case 'Registered':
        return TopicStatus.registered;
      case 'Topic not found':
        return TopicStatus.topicNotFound;
      case 'Failed':
        return TopicStatus.failed;
      case 'Deleted':
        return TopicStatus.deleted;
    }
    throw Exception('$this is not known in enum TopicStatus');
  }
}

/// Describes a trust relationship between an Managed Microsoft AD directory and
/// an external domain.
class Trust {
  /// The date and time that the trust relationship was created.
  final DateTime? createdDateTime;

  /// The Directory ID of the Amazon Web Services directory involved in the trust
  /// relationship.
  final String? directoryId;

  /// The date and time that the trust relationship was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The Fully Qualified Domain Name (FQDN) of the external domain involved in
  /// the trust relationship.
  final String? remoteDomainName;

  /// Current state of selective authentication for the trust.
  final SelectiveAuth? selectiveAuth;

  /// The date and time that the TrustState was last updated.
  final DateTime? stateLastUpdatedDateTime;

  /// The trust relationship direction.
  final TrustDirection? trustDirection;

  /// The unique ID of the trust relationship.
  final String? trustId;

  /// The trust relationship state.
  final TrustState? trustState;

  /// The reason for the TrustState.
  final String? trustStateReason;

  /// The trust relationship type. <code>Forest</code> is the default.
  final TrustType? trustType;

  Trust({
    this.createdDateTime,
    this.directoryId,
    this.lastUpdatedDateTime,
    this.remoteDomainName,
    this.selectiveAuth,
    this.stateLastUpdatedDateTime,
    this.trustDirection,
    this.trustId,
    this.trustState,
    this.trustStateReason,
    this.trustType,
  });

  factory Trust.fromJson(Map<String, dynamic> json) {
    return Trust(
      createdDateTime: timeStampFromJson(json['CreatedDateTime']),
      directoryId: json['DirectoryId'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
      remoteDomainName: json['RemoteDomainName'] as String?,
      selectiveAuth: (json['SelectiveAuth'] as String?)?.toSelectiveAuth(),
      stateLastUpdatedDateTime:
          timeStampFromJson(json['StateLastUpdatedDateTime']),
      trustDirection: (json['TrustDirection'] as String?)?.toTrustDirection(),
      trustId: json['TrustId'] as String?,
      trustState: (json['TrustState'] as String?)?.toTrustState(),
      trustStateReason: json['TrustStateReason'] as String?,
      trustType: (json['TrustType'] as String?)?.toTrustType(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDateTime = this.createdDateTime;
    final directoryId = this.directoryId;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final remoteDomainName = this.remoteDomainName;
    final selectiveAuth = this.selectiveAuth;
    final stateLastUpdatedDateTime = this.stateLastUpdatedDateTime;
    final trustDirection = this.trustDirection;
    final trustId = this.trustId;
    final trustState = this.trustState;
    final trustStateReason = this.trustStateReason;
    final trustType = this.trustType;
    return {
      if (createdDateTime != null)
        'CreatedDateTime': unixTimestampToJson(createdDateTime),
      if (directoryId != null) 'DirectoryId': directoryId,
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (remoteDomainName != null) 'RemoteDomainName': remoteDomainName,
      if (selectiveAuth != null) 'SelectiveAuth': selectiveAuth.toValue(),
      if (stateLastUpdatedDateTime != null)
        'StateLastUpdatedDateTime':
            unixTimestampToJson(stateLastUpdatedDateTime),
      if (trustDirection != null) 'TrustDirection': trustDirection.toValue(),
      if (trustId != null) 'TrustId': trustId,
      if (trustState != null) 'TrustState': trustState.toValue(),
      if (trustStateReason != null) 'TrustStateReason': trustStateReason,
      if (trustType != null) 'TrustType': trustType.toValue(),
    };
  }
}

enum TrustDirection {
  oneWayOutgoing,
  oneWayIncoming,
  twoWay,
}

extension TrustDirectionValueExtension on TrustDirection {
  String toValue() {
    switch (this) {
      case TrustDirection.oneWayOutgoing:
        return 'One-Way: Outgoing';
      case TrustDirection.oneWayIncoming:
        return 'One-Way: Incoming';
      case TrustDirection.twoWay:
        return 'Two-Way';
    }
  }
}

extension TrustDirectionFromString on String {
  TrustDirection toTrustDirection() {
    switch (this) {
      case 'One-Way: Outgoing':
        return TrustDirection.oneWayOutgoing;
      case 'One-Way: Incoming':
        return TrustDirection.oneWayIncoming;
      case 'Two-Way':
        return TrustDirection.twoWay;
    }
    throw Exception('$this is not known in enum TrustDirection');
  }
}

enum TrustState {
  creating,
  created,
  verifying,
  verifyFailed,
  verified,
  updating,
  updateFailed,
  updated,
  deleting,
  deleted,
  failed,
}

extension TrustStateValueExtension on TrustState {
  String toValue() {
    switch (this) {
      case TrustState.creating:
        return 'Creating';
      case TrustState.created:
        return 'Created';
      case TrustState.verifying:
        return 'Verifying';
      case TrustState.verifyFailed:
        return 'VerifyFailed';
      case TrustState.verified:
        return 'Verified';
      case TrustState.updating:
        return 'Updating';
      case TrustState.updateFailed:
        return 'UpdateFailed';
      case TrustState.updated:
        return 'Updated';
      case TrustState.deleting:
        return 'Deleting';
      case TrustState.deleted:
        return 'Deleted';
      case TrustState.failed:
        return 'Failed';
    }
  }
}

extension TrustStateFromString on String {
  TrustState toTrustState() {
    switch (this) {
      case 'Creating':
        return TrustState.creating;
      case 'Created':
        return TrustState.created;
      case 'Verifying':
        return TrustState.verifying;
      case 'VerifyFailed':
        return TrustState.verifyFailed;
      case 'Verified':
        return TrustState.verified;
      case 'Updating':
        return TrustState.updating;
      case 'UpdateFailed':
        return TrustState.updateFailed;
      case 'Updated':
        return TrustState.updated;
      case 'Deleting':
        return TrustState.deleting;
      case 'Deleted':
        return TrustState.deleted;
      case 'Failed':
        return TrustState.failed;
    }
    throw Exception('$this is not known in enum TrustState');
  }
}

enum TrustType {
  forest,
  external,
}

extension TrustTypeValueExtension on TrustType {
  String toValue() {
    switch (this) {
      case TrustType.forest:
        return 'Forest';
      case TrustType.external:
        return 'External';
    }
  }
}

extension TrustTypeFromString on String {
  TrustType toTrustType() {
    switch (this) {
      case 'Forest':
        return TrustType.forest;
      case 'External':
        return TrustType.external;
    }
    throw Exception('$this is not known in enum TrustType');
  }
}

class UnshareDirectoryResult {
  /// Identifier of the directory stored in the directory consumer account that is
  /// to be unshared from the specified directory (<code>DirectoryId</code>).
  final String? sharedDirectoryId;

  UnshareDirectoryResult({
    this.sharedDirectoryId,
  });

  factory UnshareDirectoryResult.fromJson(Map<String, dynamic> json) {
    return UnshareDirectoryResult(
      sharedDirectoryId: json['SharedDirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sharedDirectoryId = this.sharedDirectoryId;
    return {
      if (sharedDirectoryId != null) 'SharedDirectoryId': sharedDirectoryId,
    };
  }
}

/// Identifier that contains details about the directory consumer account with
/// whom the directory is being unshared.
class UnshareTarget {
  /// Identifier of the directory consumer account.
  final String id;

  /// Type of identifier to be used in the <i>Id</i> field.
  final TargetType type;

  UnshareTarget({
    required this.id,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      'Id': id,
      'Type': type.toValue(),
    };
  }
}

/// The result of an UpdateConditionalForwarder request.
class UpdateConditionalForwarderResult {
  UpdateConditionalForwarderResult();

  factory UpdateConditionalForwarderResult.fromJson(Map<String, dynamic> _) {
    return UpdateConditionalForwarderResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDirectorySetupResult {
  UpdateDirectorySetupResult();

  factory UpdateDirectorySetupResult.fromJson(Map<String, dynamic> _) {
    return UpdateDirectorySetupResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An entry of update information related to a requested update type.
class UpdateInfoEntry {
  /// This specifies if the update was initiated by the customer or by the service
  /// team.
  final String? initiatedBy;

  /// The last updated date and time of a particular directory setting.
  final DateTime? lastUpdatedDateTime;

  /// The new value of the target setting.
  final UpdateValue? newValue;

  /// The old value of the target setting.
  final UpdateValue? previousValue;

  /// The name of the Region.
  final String? region;

  /// The start time of the <code>UpdateDirectorySetup</code> for the particular
  /// type.
  final DateTime? startTime;

  /// The status of the update performed on the directory.
  final UpdateStatus? status;

  /// The reason for the current status of the update type activity.
  final String? statusReason;

  UpdateInfoEntry({
    this.initiatedBy,
    this.lastUpdatedDateTime,
    this.newValue,
    this.previousValue,
    this.region,
    this.startTime,
    this.status,
    this.statusReason,
  });

  factory UpdateInfoEntry.fromJson(Map<String, dynamic> json) {
    return UpdateInfoEntry(
      initiatedBy: json['InitiatedBy'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
      newValue: json['NewValue'] != null
          ? UpdateValue.fromJson(json['NewValue'] as Map<String, dynamic>)
          : null,
      previousValue: json['PreviousValue'] != null
          ? UpdateValue.fromJson(json['PreviousValue'] as Map<String, dynamic>)
          : null,
      region: json['Region'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toUpdateStatus(),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final initiatedBy = this.initiatedBy;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final newValue = this.newValue;
    final previousValue = this.previousValue;
    final region = this.region;
    final startTime = this.startTime;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (initiatedBy != null) 'InitiatedBy': initiatedBy,
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (newValue != null) 'NewValue': newValue,
      if (previousValue != null) 'PreviousValue': previousValue,
      if (region != null) 'Region': region,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

class UpdateNumberOfDomainControllersResult {
  UpdateNumberOfDomainControllersResult();

  factory UpdateNumberOfDomainControllersResult.fromJson(
      Map<String, dynamic> _) {
    return UpdateNumberOfDomainControllersResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>UpdateRadius</a> operation.
class UpdateRadiusResult {
  UpdateRadiusResult();

  factory UpdateRadiusResult.fromJson(Map<String, dynamic> _) {
    return UpdateRadiusResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateSettingsResult {
  /// The identifier of the directory.
  final String? directoryId;

  UpdateSettingsResult({
    this.directoryId,
  });

  factory UpdateSettingsResult.fromJson(Map<String, dynamic> json) {
    return UpdateSettingsResult(
      directoryId: json['DirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
    };
  }
}

enum UpdateStatus {
  updated,
  updating,
  updateFailed,
}

extension UpdateStatusValueExtension on UpdateStatus {
  String toValue() {
    switch (this) {
      case UpdateStatus.updated:
        return 'Updated';
      case UpdateStatus.updating:
        return 'Updating';
      case UpdateStatus.updateFailed:
        return 'UpdateFailed';
    }
  }
}

extension UpdateStatusFromString on String {
  UpdateStatus toUpdateStatus() {
    switch (this) {
      case 'Updated':
        return UpdateStatus.updated;
      case 'Updating':
        return UpdateStatus.updating;
      case 'UpdateFailed':
        return UpdateStatus.updateFailed;
    }
    throw Exception('$this is not known in enum UpdateStatus');
  }
}

class UpdateTrustResult {
  final String? requestId;

  /// Identifier of the trust relationship.
  final String? trustId;

  UpdateTrustResult({
    this.requestId,
    this.trustId,
  });

  factory UpdateTrustResult.fromJson(Map<String, dynamic> json) {
    return UpdateTrustResult(
      requestId: json['RequestId'] as String?,
      trustId: json['TrustId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final trustId = this.trustId;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (trustId != null) 'TrustId': trustId,
    };
  }
}

enum UpdateType {
  os,
}

extension UpdateTypeValueExtension on UpdateType {
  String toValue() {
    switch (this) {
      case UpdateType.os:
        return 'OS';
    }
  }
}

extension UpdateTypeFromString on String {
  UpdateType toUpdateType() {
    switch (this) {
      case 'OS':
        return UpdateType.os;
    }
    throw Exception('$this is not known in enum UpdateType');
  }
}

/// The value for a given type of <code>UpdateSettings</code>.
class UpdateValue {
  /// The OS update related settings.
  final OSUpdateSettings? oSUpdateSettings;

  UpdateValue({
    this.oSUpdateSettings,
  });

  factory UpdateValue.fromJson(Map<String, dynamic> json) {
    return UpdateValue(
      oSUpdateSettings: json['OSUpdateSettings'] != null
          ? OSUpdateSettings.fromJson(
              json['OSUpdateSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final oSUpdateSettings = this.oSUpdateSettings;
    return {
      if (oSUpdateSettings != null) 'OSUpdateSettings': oSUpdateSettings,
    };
  }
}

/// Result of a VerifyTrust request.
class VerifyTrustResult {
  /// The unique Trust ID of the trust relationship that was verified.
  final String? trustId;

  VerifyTrustResult({
    this.trustId,
  });

  factory VerifyTrustResult.fromJson(Map<String, dynamic> json) {
    return VerifyTrustResult(
      trustId: json['TrustId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trustId = this.trustId;
    return {
      if (trustId != null) 'TrustId': trustId,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AuthenticationFailedException extends _s.GenericAwsException {
  AuthenticationFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'AuthenticationFailedException',
            message: message);
}

class CertificateAlreadyExistsException extends _s.GenericAwsException {
  CertificateAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'CertificateAlreadyExistsException',
            message: message);
}

class CertificateDoesNotExistException extends _s.GenericAwsException {
  CertificateDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'CertificateDoesNotExistException',
            message: message);
}

class CertificateInUseException extends _s.GenericAwsException {
  CertificateInUseException({String? type, String? message})
      : super(type: type, code: 'CertificateInUseException', message: message);
}

class CertificateLimitExceededException extends _s.GenericAwsException {
  CertificateLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CertificateLimitExceededException',
            message: message);
}

class ClientException extends _s.GenericAwsException {
  ClientException({String? type, String? message})
      : super(type: type, code: 'ClientException', message: message);
}

class DirectoryAlreadyInRegionException extends _s.GenericAwsException {
  DirectoryAlreadyInRegionException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryAlreadyInRegionException',
            message: message);
}

class DirectoryAlreadySharedException extends _s.GenericAwsException {
  DirectoryAlreadySharedException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryAlreadySharedException',
            message: message);
}

class DirectoryDoesNotExistException extends _s.GenericAwsException {
  DirectoryDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryDoesNotExistException',
            message: message);
}

class DirectoryInDesiredStateException extends _s.GenericAwsException {
  DirectoryInDesiredStateException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryInDesiredStateException',
            message: message);
}

class DirectoryLimitExceededException extends _s.GenericAwsException {
  DirectoryLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryLimitExceededException',
            message: message);
}

class DirectoryNotSharedException extends _s.GenericAwsException {
  DirectoryNotSharedException({String? type, String? message})
      : super(
            type: type, code: 'DirectoryNotSharedException', message: message);
}

class DirectoryUnavailableException extends _s.GenericAwsException {
  DirectoryUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryUnavailableException',
            message: message);
}

class DomainControllerLimitExceededException extends _s.GenericAwsException {
  DomainControllerLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DomainControllerLimitExceededException',
            message: message);
}

class EntityAlreadyExistsException extends _s.GenericAwsException {
  EntityAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'EntityAlreadyExistsException', message: message);
}

class EntityDoesNotExistException extends _s.GenericAwsException {
  EntityDoesNotExistException({String? type, String? message})
      : super(
            type: type, code: 'EntityDoesNotExistException', message: message);
}

class IncompatibleSettingsException extends _s.GenericAwsException {
  IncompatibleSettingsException({String? type, String? message})
      : super(
            type: type,
            code: 'IncompatibleSettingsException',
            message: message);
}

class InsufficientPermissionsException extends _s.GenericAwsException {
  InsufficientPermissionsException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientPermissionsException',
            message: message);
}

class InvalidCertificateException extends _s.GenericAwsException {
  InvalidCertificateException({String? type, String? message})
      : super(
            type: type, code: 'InvalidCertificateException', message: message);
}

class InvalidClientAuthStatusException extends _s.GenericAwsException {
  InvalidClientAuthStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClientAuthStatusException',
            message: message);
}

class InvalidLDAPSStatusException extends _s.GenericAwsException {
  InvalidLDAPSStatusException({String? type, String? message})
      : super(
            type: type, code: 'InvalidLDAPSStatusException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidPasswordException extends _s.GenericAwsException {
  InvalidPasswordException({String? type, String? message})
      : super(type: type, code: 'InvalidPasswordException', message: message);
}

class InvalidTargetException extends _s.GenericAwsException {
  InvalidTargetException({String? type, String? message})
      : super(type: type, code: 'InvalidTargetException', message: message);
}

class IpRouteLimitExceededException extends _s.GenericAwsException {
  IpRouteLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'IpRouteLimitExceededException',
            message: message);
}

class NoAvailableCertificateException extends _s.GenericAwsException {
  NoAvailableCertificateException({String? type, String? message})
      : super(
            type: type,
            code: 'NoAvailableCertificateException',
            message: message);
}

class OrganizationsException extends _s.GenericAwsException {
  OrganizationsException({String? type, String? message})
      : super(type: type, code: 'OrganizationsException', message: message);
}

class RegionLimitExceededException extends _s.GenericAwsException {
  RegionLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'RegionLimitExceededException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

class ShareLimitExceededException extends _s.GenericAwsException {
  ShareLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'ShareLimitExceededException', message: message);
}

class SnapshotLimitExceededException extends _s.GenericAwsException {
  SnapshotLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotLimitExceededException',
            message: message);
}

class TagLimitExceededException extends _s.GenericAwsException {
  TagLimitExceededException({String? type, String? message})
      : super(type: type, code: 'TagLimitExceededException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

class UnsupportedSettingsException extends _s.GenericAwsException {
  UnsupportedSettingsException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedSettingsException', message: message);
}

class UserDoesNotExistException extends _s.GenericAwsException {
  UserDoesNotExistException({String? type, String? message})
      : super(type: type, code: 'UserDoesNotExistException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AuthenticationFailedException': (type, message) =>
      AuthenticationFailedException(type: type, message: message),
  'CertificateAlreadyExistsException': (type, message) =>
      CertificateAlreadyExistsException(type: type, message: message),
  'CertificateDoesNotExistException': (type, message) =>
      CertificateDoesNotExistException(type: type, message: message),
  'CertificateInUseException': (type, message) =>
      CertificateInUseException(type: type, message: message),
  'CertificateLimitExceededException': (type, message) =>
      CertificateLimitExceededException(type: type, message: message),
  'ClientException': (type, message) =>
      ClientException(type: type, message: message),
  'DirectoryAlreadyInRegionException': (type, message) =>
      DirectoryAlreadyInRegionException(type: type, message: message),
  'DirectoryAlreadySharedException': (type, message) =>
      DirectoryAlreadySharedException(type: type, message: message),
  'DirectoryDoesNotExistException': (type, message) =>
      DirectoryDoesNotExistException(type: type, message: message),
  'DirectoryInDesiredStateException': (type, message) =>
      DirectoryInDesiredStateException(type: type, message: message),
  'DirectoryLimitExceededException': (type, message) =>
      DirectoryLimitExceededException(type: type, message: message),
  'DirectoryNotSharedException': (type, message) =>
      DirectoryNotSharedException(type: type, message: message),
  'DirectoryUnavailableException': (type, message) =>
      DirectoryUnavailableException(type: type, message: message),
  'DomainControllerLimitExceededException': (type, message) =>
      DomainControllerLimitExceededException(type: type, message: message),
  'EntityAlreadyExistsException': (type, message) =>
      EntityAlreadyExistsException(type: type, message: message),
  'EntityDoesNotExistException': (type, message) =>
      EntityDoesNotExistException(type: type, message: message),
  'IncompatibleSettingsException': (type, message) =>
      IncompatibleSettingsException(type: type, message: message),
  'InsufficientPermissionsException': (type, message) =>
      InsufficientPermissionsException(type: type, message: message),
  'InvalidCertificateException': (type, message) =>
      InvalidCertificateException(type: type, message: message),
  'InvalidClientAuthStatusException': (type, message) =>
      InvalidClientAuthStatusException(type: type, message: message),
  'InvalidLDAPSStatusException': (type, message) =>
      InvalidLDAPSStatusException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidPasswordException': (type, message) =>
      InvalidPasswordException(type: type, message: message),
  'InvalidTargetException': (type, message) =>
      InvalidTargetException(type: type, message: message),
  'IpRouteLimitExceededException': (type, message) =>
      IpRouteLimitExceededException(type: type, message: message),
  'NoAvailableCertificateException': (type, message) =>
      NoAvailableCertificateException(type: type, message: message),
  'OrganizationsException': (type, message) =>
      OrganizationsException(type: type, message: message),
  'RegionLimitExceededException': (type, message) =>
      RegionLimitExceededException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'ShareLimitExceededException': (type, message) =>
      ShareLimitExceededException(type: type, message: message),
  'SnapshotLimitExceededException': (type, message) =>
      SnapshotLimitExceededException(type: type, message: message),
  'TagLimitExceededException': (type, message) =>
      TagLimitExceededException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
  'UnsupportedSettingsException': (type, message) =>
      UnsupportedSettingsException(type: type, message: message),
  'UserDoesNotExistException': (type, message) =>
      UserDoesNotExistException(type: type, message: message),
};
