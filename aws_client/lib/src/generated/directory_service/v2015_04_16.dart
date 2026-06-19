// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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
  /// May throw [ClientException].
  /// May throw [DirectoryAlreadySharedException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [IpRouteLimitExceededException].
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
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 88, Source: Managed Microsoft
  /// AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 123, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 138, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 389, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 464, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom UDP Rule, Protocol: UDP, Range: 445, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 88, Source: Managed Microsoft
  /// AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 135, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 445, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 464, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 636, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 1024-65535, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: Custom TCP Rule, Protocol: TCP, Range: 3268-33269, Source: Managed
  /// Microsoft AD VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: DNS (UDP), Protocol: UDP, Range: 53, Source: Managed Microsoft AD
  /// VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: DNS (TCP), Protocol: TCP, Range: 53, Source: Managed Microsoft AD
  /// VPC IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: LDAP, Protocol: TCP, Range: 389, Source: Managed Microsoft AD VPC
  /// IPv4 CIDR
  /// </li>
  /// <li>
  /// Type: All ICMP, Protocol: All, Range: N/A, Source: Managed Microsoft AD
  /// VPC IPv4 CIDR
  /// </li>
  /// </ul>
  ///
  ///
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
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryAlreadyInRegionException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [RegionLimitExceededException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [TagLimitExceededException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryLimitExceededException].
  /// May throw [InvalidParameterException].
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
  /// Parameter [networkType] :
  /// The network type for your directory. The default value is
  /// <code>IPv4</code> or <code>IPv6</code> based on the provided subnet
  /// capabilities.
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
    NetworkType? networkType,
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
        'Size': size.value,
        if (description != null) 'Description': description,
        if (networkType != null) 'NetworkType': networkType.value,
        if (shortName != null) 'ShortName': shortName,
        if (tags != null) 'Tags': tags,
      },
    );

    return ConnectDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Creates an alias for a directory and assigns the alias to the directory.
  /// The alias is used to construct the access URL for the directory, such as
  /// <code>http://<alias>.awsapps.com</code>.
  /// <important>
  /// After an alias has been created, it cannot be deleted or reused, so this
  /// operation should only be used when absolutely necessary.
  /// </important>
  ///
  /// May throw [ClientException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The directory ID of the Amazon Web Services directory for which you are
  /// creating the conditional forwarder.
  ///
  /// Parameter [remoteDomainName] :
  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// will set up a trust relationship.
  ///
  /// Parameter [dnsIpAddrs] :
  /// The IP addresses of the remote DNS server associated with
  /// RemoteDomainName.
  ///
  /// Parameter [dnsIpv6Addrs] :
  /// The IPv6 addresses of the remote DNS server associated with
  /// RemoteDomainName.
  Future<void> createConditionalForwarder({
    required String directoryId,
    required String remoteDomainName,
    List<String>? dnsIpAddrs,
    List<String>? dnsIpv6Addrs,
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
        'RemoteDomainName': remoteDomainName,
        if (dnsIpAddrs != null) 'DnsIpAddrs': dnsIpAddrs,
        if (dnsIpv6Addrs != null) 'DnsIpv6Addrs': dnsIpv6Addrs,
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
  /// May throw [ClientException].
  /// May throw [DirectoryLimitExceededException].
  /// May throw [InvalidParameterException].
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
  /// Numbers and upper case and lowercase (?=.*\d)(?=.*\[A-Z\])(?=.*\[a-z\])
  /// </li>
  /// <li>
  /// Numbers and special characters and lower case
  /// (?=.*\d)(?=.*\[^A-Za-z0-9\s\])(?=.*\[a-z\])
  /// </li>
  /// <li>
  /// Special characters and upper case and lower case
  /// (?=.*\[^A-Za-z0-9\s\])(?=.*\[A-Z\])(?=.*\[a-z\])
  /// </li>
  /// <li>
  /// Numbers and upper case and special characters
  /// (?=.*\d)(?=.*\[A-Z\])(?=.*\[^A-Za-z0-9\s\])
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
  /// Parameter [networkType] :
  /// The network type for your directory. Simple AD supports IPv4 and
  /// Dual-stack only.
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
    NetworkType? networkType,
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
        'Size': size.value,
        if (description != null) 'Description': description,
        if (networkType != null) 'NetworkType': networkType.value,
        if (shortName != null) 'ShortName': shortName,
        if (tags != null) 'Tags': tags,
        if (vpcSettings != null) 'VpcSettings': vpcSettings,
      },
    );

    return CreateDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Creates a hybrid directory that connects your self-managed Active
  /// Directory (AD) infrastructure and Amazon Web Services.
  ///
  /// You must have a successful directory assessment using
  /// <a>StartADAssessment</a> to validate your environment compatibility before
  /// you use this operation.
  ///
  /// Updates are applied asynchronously. Use <a>DescribeDirectories</a> to
  /// monitor the progress of directory creation.
  ///
  /// May throw [ADAssessmentLimitExceededException].
  /// May throw [ClientException].
  /// May throw [DirectoryLimitExceededException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier of the successful directory assessment that
  /// validates your self-managed AD environment. You must have a successful
  /// directory assessment before you create a hybrid directory.
  ///
  /// Parameter [secretArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret that contains the credentials for the service account used to join
  /// hybrid domain controllers to your self-managed AD domain. This secret is
  /// used once and not stored.
  ///
  /// The secret must contain key-value pairs with keys matching
  /// <code>customerAdAdminDomainUsername</code> and
  /// <code>customerAdAdminDomainPassword</code>. For example:
  /// <code>{"customerAdAdminDomainUsername":"carlos_salazar","customerAdAdminDomainPassword":"ExamplePassword123!"}</code>.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the directory. Each tag consists of a key and
  /// value pair. You can specify multiple tags as a list.
  Future<CreateHybridADResult> createHybridAD({
    required String assessmentId,
    required String secretArn,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateHybridAD'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssessmentId': assessmentId,
        'SecretArn': secretArn,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateHybridADResult.fromJson(jsonResponse.body);
  }

  /// Creates a subscription to forward real-time Directory Service domain
  /// controller security logs to the specified Amazon CloudWatch log group in
  /// your Amazon Web Services account.
  ///
  /// May throw [ClientException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InsufficientPermissionsException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryLimitExceededException].
  /// May throw [InvalidParameterException].
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
  /// Parameter [networkType] :
  /// The network type for your domain. The default value is <code>IPv4</code>
  /// or <code>IPv6</code> based on the provided subnet capabilities.
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
    NetworkType? networkType,
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
        if (edition != null) 'Edition': edition.value,
        if (networkType != null) 'NetworkType': networkType.value,
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [SnapshotLimitExceededException].
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
  /// May throw [ClientException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// The trust password. The trust password must be the same password that was
  /// used when creating the trust relationship on the external domain.
  ///
  /// Parameter [conditionalForwarderIpAddrs] :
  /// The IP addresses of the remote DNS server associated with
  /// RemoteDomainName.
  ///
  /// Parameter [conditionalForwarderIpv6Addrs] :
  /// The IPv6 addresses of the remote DNS server associated with
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
    List<String>? conditionalForwarderIpv6Addrs,
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
        'TrustDirection': trustDirection.value,
        'TrustPassword': trustPassword,
        if (conditionalForwarderIpAddrs != null)
          'ConditionalForwarderIpAddrs': conditionalForwarderIpAddrs,
        if (conditionalForwarderIpv6Addrs != null)
          'ConditionalForwarderIpv6Addrs': conditionalForwarderIpv6Addrs,
        if (selectiveAuth != null) 'SelectiveAuth': selectiveAuth.value,
        if (trustType != null) 'TrustType': trustType.value,
      },
    );

    return CreateTrustResult.fromJson(jsonResponse.body);
  }

  /// Deletes a directory assessment and all associated data. This operation
  /// permanently removes the assessment results, validation reports, and
  /// configuration information.
  ///
  /// You cannot delete system-initiated assessments. You can delete
  /// customer-created assessments even if they are in progress.
  ///
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier of the directory assessment to delete.
  Future<DeleteADAssessmentResult> deleteADAssessment({
    required String assessmentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeleteADAssessment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssessmentId': assessmentId,
      },
    );

    return DeleteADAssessmentResult.fromJson(jsonResponse.body);
  }

  /// Deletes a conditional forwarder that has been set up for your Amazon Web
  /// Services directory.
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// May throw [CertificateDoesNotExistException].
  /// May throw [CertificateInUseException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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

  /// Retrieves detailed information about a directory assessment, including its
  /// current status, validation results, and configuration details. Use this
  /// operation to monitor assessment progress and review results.
  ///
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier of the directory assessment to describe.
  Future<DescribeADAssessmentResult> describeADAssessment({
    required String assessmentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeADAssessment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssessmentId': assessmentId,
      },
    );

    return DescribeADAssessmentResult.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about the certificate authority (CA)
  /// enrollment policy for the specified directory. This policy determines how
  /// client certificates are automatically enrolled and managed through Amazon
  /// Web Services Private Certificate Authority.
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to retrieve the CA enrollment
  /// policy information.
  Future<DescribeCAEnrollmentPolicyResult> describeCAEnrollmentPolicy({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeCAEnrollmentPolicy'
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

    return DescribeCAEnrollmentPolicyResult.fromJson(jsonResponse.body);
  }

  /// Displays information about the certificate registered for secure LDAP or
  /// client certificate authentication.
  ///
  /// May throw [CertificateDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
        if (type != null) 'Type': type.value,
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
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
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

  /// Obtains status of directory data access enablement through the Directory
  /// Service Data API for the specified directory.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The directory identifier.
  Future<DescribeDirectoryDataAccessResult> describeDirectoryDataAccess({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeDirectoryDataAccess'
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

    return DescribeDirectoryDataAccessResult.fromJson(jsonResponse.body);
  }

  /// Provides information about any domain controllers in your directory.
  ///
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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

  /// Retrieves information about update activities for a hybrid directory. This
  /// operation provides details about configuration changes, administrator
  /// account updates, and self-managed instance settings (IDs and DNS IPs).
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the hybrid directory for which to retrieve update
  /// information.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request to
  /// <a>DescribeHybridADUpdate</a>. Pass null if this is the first request.
  ///
  /// Parameter [updateType] :
  /// The type of update activities to retrieve. Valid values include
  /// <code>SelfManagedInstances</code> and
  /// <code>HybridAdministratorAccount</code>.
  Future<DescribeHybridADUpdateResult> describeHybridADUpdate({
    required String directoryId,
    String? nextToken,
    HybridUpdateType? updateType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DescribeHybridADUpdate'
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
        if (updateType != null) 'UpdateType': updateType.value,
      },
    );

    return DescribeHybridADUpdateResult.fromJson(jsonResponse.body);
  }

  /// Describes the status of LDAP security for the specified directory.
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
        if (type != null) 'Type': type.value,
      },
    );

    return DescribeLDAPSSettingsResult.fromJson(jsonResponse.body);
  }

  /// Provides information about the Regions that are configured for
  /// multi-Region replication.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
        if (status != null) 'Status': status.value,
      },
    );

    return DescribeSettingsResult.fromJson(jsonResponse.body);
  }

  /// Returns the shared directories in your account.
  ///
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
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
        'UpdateType': updateType.value,
        if (nextToken != null) 'NextToken': nextToken,
        if (regionName != null) 'RegionName': regionName,
      },
    );

    return DescribeUpdateDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Disables the certificate authority (CA) enrollment policy for the
  /// specified directory. This stops automatic certificate enrollment and
  /// management for domain-joined clients, but does not affect existing
  /// certificates.
  /// <important>
  /// Disabling the CA enrollment policy prevents new certificates from being
  /// automatically enrolled, but existing certificates remain valid and
  /// functional until they expire.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [DisableAlreadyInProgressException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to disable the CA enrollment
  /// policy.
  Future<void> disableCAEnrollmentPolicy({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableCAEnrollmentPolicy'
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

  /// Disables alternative client authentication methods for the specified
  /// directory.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidClientAuthStatusException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory
  ///
  /// Parameter [type] :
  /// The type of client authentication to disable. Currently the only parameter
  /// <code>"SmartCard"</code> is supported.
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
        'Type': type.value,
      },
    );
  }

  /// Deactivates access to directory data via the Directory Service Data API
  /// for the specified directory. For more information, see <a
  /// href="https://docs.aws.amazon.com/directoryservicedata/latest/DirectoryServiceDataAPIReference/Welcome.html">Directory
  /// Service Data API Reference</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryInDesiredStateException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The directory identifier.
  Future<void> disableDirectoryDataAccess({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableDirectoryDataAccess'
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

  /// Deactivates LDAP secure calls for the specified directory.
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidLDAPSStatusException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
        'Type': type.value,
      },
    );
  }

  /// Disables multi-factor authentication (MFA) with the Remote Authentication
  /// Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD
  /// directory.
  ///
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
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
  /// May throw [AuthenticationFailedException].
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InsufficientPermissionsException].
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

  /// Enables certificate authority (CA) enrollment policy for the specified
  /// directory. This allows domain-joined clients to automatically request and
  /// receive certificates from the specified Amazon Web Services Private
  /// Certificate Authority.
  /// <note>
  /// Before enabling CA enrollment, ensure that the PCA connector is properly
  /// configured and accessible from the directory. The connector must be in an
  /// active state and have the necessary permissions.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EnableAlreadyInProgressException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to enable the CA enrollment
  /// policy.
  ///
  /// Parameter [pcaConnectorArn] :
  /// The Amazon Resource Name (ARN) of the Private Certificate Authority (PCA)
  /// connector to use for automatic certificate enrollment. This connector must
  /// be properly configured and accessible from the directory.
  ///
  /// The ARN format is:
  /// <code>arn:aws:pca-connector-ad:<i>region</i>:<i>account-id</i>:connector/<i>connector-id</i>
  /// </code>
  Future<void> enableCAEnrollmentPolicy({
    required String directoryId,
    required String pcaConnectorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableCAEnrollmentPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'PcaConnectorArn': pcaConnectorArn,
      },
    );
  }

  /// Enables alternative client authentication methods for the specified
  /// directory.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidClientAuthStatusException].
  /// May throw [NoAvailableCertificateException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
        'Type': type.value,
      },
    );
  }

  /// Enables access to directory data via the Directory Service Data API for
  /// the specified directory. For more information, see <a
  /// href="https://docs.aws.amazon.com/directoryservicedata/latest/DirectoryServiceDataAPIReference/Welcome.html">Directory
  /// Service Data API Reference</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryInDesiredStateException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The directory identifier.
  Future<void> enableDirectoryDataAccess({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableDirectoryDataAccess'
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

  /// Activates the switch for the specific directory to always use LDAP secure
  /// calls.
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidLDAPSStatusException].
  /// May throw [InvalidParameterException].
  /// May throw [NoAvailableCertificateException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
        'Type': type.value,
      },
    );
  }

  /// Enables multi-factor authentication (MFA) with the Remote Authentication
  /// Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD
  /// directory.
  ///
  /// May throw [ClientException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// May throw [AuthenticationFailedException].
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InsufficientPermissionsException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
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

  /// Retrieves a list of directory assessments for the specified directory or
  /// all assessments in your account. Use this operation to monitor assessment
  /// status and manage multiple assessments.
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to list assessments. If not
  /// specified, all assessments in your account are returned.
  ///
  /// Parameter [limit] :
  /// The maximum number of assessment summaries to return.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request to <a>ListADAssessments</a>.
  /// Pass null if this is the first request.
  Future<ListADAssessmentsResult> listADAssessments({
    String? directoryId,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ListADAssessments'
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

    return ListADAssessmentsResult.fromJson(jsonResponse.body);
  }

  /// For the specified directory, lists all the certificates registered for a
  /// secure LDAP or client certificate authentication.
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
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
  /// May throw [CertificateAlreadyExistsException].
  /// May throw [CertificateLimitExceededException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidCertificateException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
        if (type != null) 'Type': type.value,
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryAlreadySharedException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// Identifier (ID) of the directory from which you want to remove the IP
  /// addresses.
  ///
  /// Parameter [cidrIps] :
  /// IP address blocks that you want to remove.
  ///
  /// Parameter [cidrIpv6s] :
  /// IPv6 address blocks that you want to remove.
  Future<void> removeIpRoutes({
    required String directoryId,
    List<String>? cidrIps,
    List<String>? cidrIpv6s,
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
        'DirectoryId': directoryId,
        if (cidrIps != null) 'CidrIps': cidrIps,
        if (cidrIpv6s != null) 'CidrIpv6s': cidrIpv6s,
      },
    );
  }

  /// Stops all replication and removes the domain controllers from the
  /// specified Region. You cannot remove the primary Region with this
  /// operation. Instead, use the <code>DeleteDirectory</code> API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// directory. Disabled users will become enabled and can be authenticated
  /// following the API call.
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
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidPasswordException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  /// May throw [UserDoesNotExistException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryAlreadySharedException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTargetException].
  /// May throw [OrganizationsException].
  /// May throw [ServiceException].
  /// May throw [ShareLimitExceededException].
  /// May throw [UnsupportedOperationException].
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
        'ShareMethod': shareMethod.value,
        'ShareTarget': shareTarget,
        if (shareNotes != null) 'ShareNotes': shareNotes,
      },
    );

    return ShareDirectoryResult.fromJson(jsonResponse.body);
  }

  /// Initiates a directory assessment to validate your self-managed AD
  /// environment for hybrid domain join. The assessment checks compatibility
  /// and connectivity of the self-managed AD environment.
  ///
  /// A directory assessment is automatically created when you create a hybrid
  /// directory. There are two types of assessments: <code>CUSTOMER</code> and
  /// <code>SYSTEM</code>. Your Amazon Web Services account has a limit of 100
  /// <code>CUSTOMER</code> directory assessments.
  ///
  /// The assessment process typically takes 30 minutes or more to complete. The
  /// assessment process is asynchronous and you can monitor it with
  /// <code>DescribeADAssessment</code>.
  ///
  /// The <code>InstanceIds</code> must have a one-to-one correspondence with
  /// <code>CustomerDnsIps</code>, meaning that if the IP address for instance
  /// i-10243410 is 10.24.34.100 and the IP address for instance i-10243420 is
  /// 10.24.34.200, then the input arrays must maintain the same order
  /// relationship, either \[10.24.34.100, 10.24.34.200\] paired with
  /// \[i-10243410, i-10243420\] or \[10.24.34.200, 10.24.34.100\] paired with
  /// \[i-10243420, i-10243410\].
  ///
  /// Note: You must provide exactly one <code>DirectoryId</code> or
  /// <code>AssessmentConfiguration</code>.
  ///
  /// May throw [ADAssessmentLimitExceededException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [assessmentConfiguration] :
  /// Configuration parameters for the directory assessment, including DNS
  /// server information, domain name, Amazon VPC subnet, and Amazon Web
  /// Services System Manager managed node details.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to perform the assessment. This
  /// should be an existing directory. If the assessment is not for an existing
  /// directory, this parameter should be omitted.
  Future<StartADAssessmentResult> startADAssessment({
    AssessmentConfiguration? assessmentConfiguration,
    String? directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.StartADAssessment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (assessmentConfiguration != null)
          'AssessmentConfiguration': assessmentConfiguration,
        if (directoryId != null) 'DirectoryId': directoryId,
      },
    );

    return StartADAssessmentResult.fromJson(jsonResponse.body);
  }

  /// Applies a schema extension to a Microsoft AD directory.
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [SnapshotLimitExceededException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryNotSharedException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidTargetException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The directory ID of the Amazon Web Services directory for which to update
  /// the conditional forwarder.
  ///
  /// Parameter [remoteDomainName] :
  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// will set up a trust relationship.
  ///
  /// Parameter [dnsIpAddrs] :
  /// The updated IP addresses of the remote DNS server associated with the
  /// conditional forwarder.
  ///
  /// Parameter [dnsIpv6Addrs] :
  /// The updated IPv6 addresses of the remote DNS server associated with the
  /// conditional forwarder.
  Future<void> updateConditionalForwarder({
    required String directoryId,
    required String remoteDomainName,
    List<String>? dnsIpAddrs,
    List<String>? dnsIpv6Addrs,
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
        'RemoteDomainName': remoteDomainName,
        if (dnsIpAddrs != null) 'DnsIpAddrs': dnsIpAddrs,
        if (dnsIpv6Addrs != null) 'DnsIpv6Addrs': dnsIpv6Addrs,
      },
    );
  }

  /// Updates directory configuration for the specified update type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryInDesiredStateException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [SnapshotLimitExceededException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory to update.
  ///
  /// Parameter [updateType] :
  /// The type of update to perform on the directory.
  ///
  /// Parameter [createSnapshotBeforeUpdate] :
  /// Specifies whether to create a directory snapshot before performing the
  /// update.
  ///
  /// Parameter [directorySizeUpdateSettings] :
  /// Directory size configuration to apply during the update operation.
  ///
  /// Parameter [networkUpdateSettings] :
  /// Network configuration to apply during the directory update operation.
  ///
  /// Parameter [oSUpdateSettings] :
  /// Operating system configuration to apply during the directory update
  /// operation.
  Future<void> updateDirectorySetup({
    required String directoryId,
    required UpdateType updateType,
    bool? createSnapshotBeforeUpdate,
    DirectorySizeUpdateSettings? directorySizeUpdateSettings,
    NetworkUpdateSettings? networkUpdateSettings,
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
        'UpdateType': updateType.value,
        if (createSnapshotBeforeUpdate != null)
          'CreateSnapshotBeforeUpdate': createSnapshotBeforeUpdate,
        if (directorySizeUpdateSettings != null)
          'DirectorySizeUpdateSettings': directorySizeUpdateSettings,
        if (networkUpdateSettings != null)
          'NetworkUpdateSettings': networkUpdateSettings,
        if (oSUpdateSettings != null) 'OSUpdateSettings': oSUpdateSettings,
      },
    );
  }

  /// Updates the configuration of an existing hybrid directory. You can recover
  /// hybrid directory administrator account or modify self-managed instance
  /// settings.
  ///
  /// Updates are applied asynchronously. Use <a>DescribeHybridADUpdate</a> to
  /// monitor the progress of configuration changes.
  ///
  /// The <code>InstanceIds</code> must have a one-to-one correspondence with
  /// <code>CustomerDnsIps</code>, meaning that if the IP address for instance
  /// i-10243410 is 10.24.34.100 and the IP address for instance i-10243420 is
  /// 10.24.34.200, then the input arrays must maintain the same order
  /// relationship, either \[10.24.34.100, 10.24.34.200\] paired with
  /// \[i-10243410, i-10243420\] or \[10.24.34.200, 10.24.34.100\] paired with
  /// \[i-10243420, i-10243410\].
  /// <note>
  /// You must provide at least one update to
  /// <a>UpdateHybridADRequest$HybridAdministratorAccountUpdate</a> or
  /// <a>UpdateHybridADRequest$SelfManagedInstancesSettings</a>.
  /// </note>
  ///
  /// May throw [ADAssessmentLimitExceededException].
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the hybrid directory to update.
  ///
  /// Parameter [hybridAdministratorAccountUpdate] :
  /// We create a hybrid directory administrator account when we create a hybrid
  /// directory. Use <code>HybridAdministratorAccountUpdate</code> to recover
  /// the hybrid directory administrator account if you have deleted it.
  ///
  /// To recover your hybrid directory administrator account, we need temporary
  /// access to a user in your self-managed AD with administrator permissions in
  /// the form of a secret from Amazon Web Services Secrets Manager. We use
  /// these credentials once during recovery and don't store them.
  ///
  /// If your hybrid directory administrator account exists, then you don’t need
  /// to use <code>HybridAdministratorAccountUpdate</code>, even if you have
  /// updated your self-managed AD administrator user.
  ///
  /// Parameter [selfManagedInstancesSettings] :
  /// Updates to the self-managed AD configuration, including DNS server IP
  /// addresses and Amazon Web Services System Manager managed node identifiers.
  Future<UpdateHybridADResult> updateHybridAD({
    required String directoryId,
    HybridAdministratorAccountUpdate? hybridAdministratorAccountUpdate,
    HybridCustomerInstancesSettings? selfManagedInstancesSettings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.UpdateHybridAD'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        if (hybridAdministratorAccountUpdate != null)
          'HybridAdministratorAccountUpdate': hybridAdministratorAccountUpdate,
        if (selfManagedInstancesSettings != null)
          'SelfManagedInstancesSettings': selfManagedInstancesSettings,
      },
    );

    return UpdateHybridADResult.fromJson(jsonResponse.body);
  }

  /// Adds or removes domain controllers to or from the directory. Based on the
  /// difference between current value and new value (provided through this API
  /// call), domain controllers will be added or removed. It may take up to 45
  /// minutes for any new domain controllers to become fully active once the
  /// requested number of domain controllers is updated. During this time, you
  /// cannot make another update request.
  ///
  /// May throw [ClientException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [DomainControllerLimitExceededException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [DirectoryDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [IncompatibleSettingsException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  /// May throw [UnsupportedSettingsException].
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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
        if (selectiveAuth != null) 'SelectiveAuth': selectiveAuth.value,
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
  /// May throw [ClientException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
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

/// @nodoc
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

/// @nodoc
class AddIpRoutesResult {
  AddIpRoutesResult();

  factory AddIpRoutesResult.fromJson(Map<String, dynamic> _) {
    return AddIpRoutesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class AddRegionResult {
  AddRegionResult();

  factory AddRegionResult.fromJson(Map<String, dynamic> _) {
    return AddRegionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class AddTagsToResourceResult {
  AddTagsToResourceResult();

  factory AddTagsToResourceResult.fromJson(Map<String, dynamic> _) {
    return AddTagsToResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CancelSchemaExtensionResult {
  CancelSchemaExtensionResult();

  factory CancelSchemaExtensionResult.fromJson(Map<String, dynamic> _) {
    return CancelSchemaExtensionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>ConnectDirectory</a> operation.
///
/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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

/// @nodoc
class CreateHybridADResult {
  /// The unique identifier of the newly created hybrid directory.
  final String? directoryId;

  CreateHybridADResult({
    this.directoryId,
  });

  factory CreateHybridADResult.fromJson(Map<String, dynamic> json) {
    return CreateHybridADResult(
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

/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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

/// @nodoc
class DeleteADAssessmentResult {
  /// The unique identifier of the deleted directory assessment.
  final String? assessmentId;

  DeleteADAssessmentResult({
    this.assessmentId,
  });

  factory DeleteADAssessmentResult.fromJson(Map<String, dynamic> json) {
    return DeleteADAssessmentResult(
      assessmentId: json['AssessmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    return {
      if (assessmentId != null) 'AssessmentId': assessmentId,
    };
  }
}

/// The result of a DeleteConditionalForwarder request.
///
/// @nodoc
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
///
/// @nodoc
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

/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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

/// @nodoc
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
///
/// @nodoc
class DeregisterEventTopicResult {
  DeregisterEventTopicResult();

  factory DeregisterEventTopicResult.fromJson(Map<String, dynamic> _) {
    return DeregisterEventTopicResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DescribeADAssessmentResult {
  /// Detailed information about the self-managed instance settings (IDs and DNS
  /// IPs).
  final Assessment? assessment;

  /// A list of assessment reports containing validation results for each domain
  /// controller and test category. Each report includes specific validation
  /// details and outcomes.
  final List<AssessmentReport>? assessmentReports;

  DescribeADAssessmentResult({
    this.assessment,
    this.assessmentReports,
  });

  factory DescribeADAssessmentResult.fromJson(Map<String, dynamic> json) {
    return DescribeADAssessmentResult(
      assessment: json['Assessment'] != null
          ? Assessment.fromJson(json['Assessment'] as Map<String, dynamic>)
          : null,
      assessmentReports: (json['AssessmentReports'] as List?)
          ?.nonNulls
          .map((e) => AssessmentReport.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final assessment = this.assessment;
    final assessmentReports = this.assessmentReports;
    return {
      if (assessment != null) 'Assessment': assessment,
      if (assessmentReports != null) 'AssessmentReports': assessmentReports,
    };
  }
}

/// Contains the results of the <a>DescribeCAEnrollmentPolicy</a> operation.
///
/// @nodoc
class DescribeCAEnrollmentPolicyResult {
  /// The current status of the CA enrollment policy. This indicates if automatic
  /// certificate enrollment is currently active, inactive, or in a transitional
  /// state.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code> - The policy is being activated T
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> - The policy is active and automatic certificate
  /// enrollment is operational
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The policy activation or deactivation failed
  /// </li>
  /// <li>
  /// <code>DISABLING</code> - The policy is being deactivated
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - The policy is inactive and automatic certificate
  /// enrollment is not available
  /// </li>
  /// <li>
  /// <code>IMPAIRED</code> - Network connectivity is impaired.
  /// </li>
  /// </ul>
  final CaEnrollmentPolicyStatus? caEnrollmentPolicyStatus;

  /// Additional information explaining the current status of the CA enrollment
  /// policy, particularly useful when the policy is in an error or transitional
  /// state.
  final String? caEnrollmentPolicyStatusReason;

  /// The identifier of the directory associated with this CA enrollment policy.
  final String? directoryId;

  /// The date and time when the CA enrollment policy was last modified or
  /// updated.
  final DateTime? lastUpdatedDateTime;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services Private
  /// Certificate Authority (PCA) connector that is configured for automatic
  /// certificate enrollment in this directory.
  final String? pcaConnectorArn;

  DescribeCAEnrollmentPolicyResult({
    this.caEnrollmentPolicyStatus,
    this.caEnrollmentPolicyStatusReason,
    this.directoryId,
    this.lastUpdatedDateTime,
    this.pcaConnectorArn,
  });

  factory DescribeCAEnrollmentPolicyResult.fromJson(Map<String, dynamic> json) {
    return DescribeCAEnrollmentPolicyResult(
      caEnrollmentPolicyStatus: (json['CaEnrollmentPolicyStatus'] as String?)
          ?.let(CaEnrollmentPolicyStatus.fromString),
      caEnrollmentPolicyStatusReason:
          json['CaEnrollmentPolicyStatusReason'] as String?,
      directoryId: json['DirectoryId'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
      pcaConnectorArn: json['PcaConnectorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caEnrollmentPolicyStatus = this.caEnrollmentPolicyStatus;
    final caEnrollmentPolicyStatusReason = this.caEnrollmentPolicyStatusReason;
    final directoryId = this.directoryId;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final pcaConnectorArn = this.pcaConnectorArn;
    return {
      if (caEnrollmentPolicyStatus != null)
        'CaEnrollmentPolicyStatus': caEnrollmentPolicyStatus.value,
      if (caEnrollmentPolicyStatusReason != null)
        'CaEnrollmentPolicyStatusReason': caEnrollmentPolicyStatusReason,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (pcaConnectorArn != null) 'PcaConnectorArn': pcaConnectorArn,
    };
  }
}

/// @nodoc
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

/// @nodoc
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
              ?.nonNulls
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
///
/// @nodoc
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
          ?.nonNulls
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
///
/// @nodoc
class DescribeDirectoriesResult {
  /// The list of available <a>DirectoryDescription</a> objects that were
  /// retrieved.
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
          ?.nonNulls
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

/// @nodoc
class DescribeDirectoryDataAccessResult {
  /// The current status of data access through the Directory Service Data API.
  final DataAccessStatus? dataAccessStatus;

  DescribeDirectoryDataAccessResult({
    this.dataAccessStatus,
  });

  factory DescribeDirectoryDataAccessResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeDirectoryDataAccessResult(
      dataAccessStatus: (json['DataAccessStatus'] as String?)
          ?.let(DataAccessStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessStatus = this.dataAccessStatus;
    return {
      if (dataAccessStatus != null) 'DataAccessStatus': dataAccessStatus.value,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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
///
/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class DescribeHybridADUpdateResult {
  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent request to retrieve the
  /// next set of items.
  final String? nextToken;

  /// Information about update activities for the hybrid directory, organized by
  /// update type.
  final HybridUpdateActivities? updateActivities;

  DescribeHybridADUpdateResult({
    this.nextToken,
    this.updateActivities,
  });

  factory DescribeHybridADUpdateResult.fromJson(Map<String, dynamic> json) {
    return DescribeHybridADUpdateResult(
      nextToken: json['NextToken'] as String?,
      updateActivities: json['UpdateActivities'] != null
          ? HybridUpdateActivities.fromJson(
              json['UpdateActivities'] as Map<String, dynamic>)
          : null,
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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
///
/// @nodoc
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
          ?.nonNulls
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
///
/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// Contains the results of the <a>DisableCAEnrollmentPolicy</a> operation.
///
/// @nodoc
class DisableCAEnrollmentPolicyResult {
  DisableCAEnrollmentPolicyResult();

  factory DisableCAEnrollmentPolicyResult.fromJson(Map<String, dynamic> _) {
    return DisableCAEnrollmentPolicyResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DisableClientAuthenticationResult {
  DisableClientAuthenticationResult();

  factory DisableClientAuthenticationResult.fromJson(Map<String, dynamic> _) {
    return DisableClientAuthenticationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DisableDirectoryDataAccessResult {
  DisableDirectoryDataAccessResult();

  factory DisableDirectoryDataAccessResult.fromJson(Map<String, dynamic> _) {
    return DisableDirectoryDataAccessResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
class DisableSsoResult {
  DisableSsoResult();

  factory DisableSsoResult.fromJson(Map<String, dynamic> _) {
    return DisableSsoResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>EnableCAEnrollmentPolicy</a> operation.
///
/// @nodoc
class EnableCAEnrollmentPolicyResult {
  EnableCAEnrollmentPolicyResult();

  factory EnableCAEnrollmentPolicyResult.fromJson(Map<String, dynamic> _) {
    return EnableCAEnrollmentPolicyResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class EnableClientAuthenticationResult {
  EnableClientAuthenticationResult();

  factory EnableClientAuthenticationResult.fromJson(Map<String, dynamic> _) {
    return EnableClientAuthenticationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class EnableDirectoryDataAccessResult {
  EnableDirectoryDataAccessResult();

  factory EnableDirectoryDataAccessResult.fromJson(Map<String, dynamic> _) {
    return EnableDirectoryDataAccessResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
class EnableSsoResult {
  EnableSsoResult();

  factory EnableSsoResult.fromJson(Map<String, dynamic> _) {
    return EnableSsoResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the results of the <a>GetDirectoryLimits</a> operation.
///
/// @nodoc
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
///
/// @nodoc
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

/// @nodoc
class ListADAssessmentsResult {
  /// A list of assessment summaries containing basic information about each
  /// directory assessment.
  final List<AssessmentSummary>? assessments;

  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent request to retrieve the
  /// next set of items.
  final String? nextToken;

  ListADAssessmentsResult({
    this.assessments,
    this.nextToken,
  });

  factory ListADAssessmentsResult.fromJson(Map<String, dynamic> json) {
    return ListADAssessmentsResult(
      assessments: (json['Assessments'] as List?)
          ?.nonNulls
          .map((e) => AssessmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessments = this.assessments;
    final nextToken = this.nextToken;
    return {
      if (assessments != null) 'Assessments': assessments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
///
/// @nodoc
class RegisterEventTopicResult {
  RegisterEventTopicResult();

  factory RegisterEventTopicResult.fromJson(Map<String, dynamic> _) {
    return RegisterEventTopicResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
class RemoveIpRoutesResult {
  RemoveIpRoutesResult();

  factory RemoveIpRoutesResult.fromJson(Map<String, dynamic> _) {
    return RemoveIpRoutesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class RemoveRegionResult {
  RemoveRegionResult();

  factory RemoveRegionResult.fromJson(Map<String, dynamic> _) {
    return RemoveRegionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class RemoveTagsFromResourceResult {
  RemoveTagsFromResourceResult();

  factory RemoveTagsFromResourceResult.fromJson(Map<String, dynamic> _) {
    return RemoveTagsFromResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
///
/// @nodoc
class RestoreFromSnapshotResult {
  RestoreFromSnapshotResult();

  factory RestoreFromSnapshotResult.fromJson(Map<String, dynamic> _) {
    return RestoreFromSnapshotResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
class StartADAssessmentResult {
  /// The unique identifier of the newly started directory assessment. Use this
  /// identifier to monitor assessment progress and retrieve results.
  final String? assessmentId;

  StartADAssessmentResult({
    this.assessmentId,
  });

  factory StartADAssessmentResult.fromJson(Map<String, dynamic> json) {
    return StartADAssessmentResult(
      assessmentId: json['AssessmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    return {
      if (assessmentId != null) 'AssessmentId': assessmentId,
    };
  }
}

/// @nodoc
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

/// @nodoc
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

/// The result of an UpdateConditionalForwarder request.
///
/// @nodoc
class UpdateConditionalForwarderResult {
  UpdateConditionalForwarderResult();

  factory UpdateConditionalForwarderResult.fromJson(Map<String, dynamic> _) {
    return UpdateConditionalForwarderResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateDirectorySetupResult {
  UpdateDirectorySetupResult();

  factory UpdateDirectorySetupResult.fromJson(Map<String, dynamic> _) {
    return UpdateDirectorySetupResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateHybridADResult {
  /// The identifier of the assessment performed to validate the update
  /// configuration. This assessment ensures the updated settings are compatible
  /// with your environment.
  final String? assessmentId;

  /// The identifier of the updated hybrid directory.
  final String? directoryId;

  UpdateHybridADResult({
    this.assessmentId,
    this.directoryId,
  });

  factory UpdateHybridADResult.fromJson(Map<String, dynamic> json) {
    return UpdateHybridADResult(
      assessmentId: json['AssessmentId'] as String?,
      directoryId: json['DirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final directoryId = this.directoryId;
    return {
      if (assessmentId != null) 'AssessmentId': assessmentId,
      if (directoryId != null) 'DirectoryId': directoryId,
    };
  }
}

/// @nodoc
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
///
/// @nodoc
class UpdateRadiusResult {
  UpdateRadiusResult();

  factory UpdateRadiusResult.fromJson(Map<String, dynamic> _) {
    return UpdateRadiusResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
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

/// Result of a VerifyTrust request.
///
/// @nodoc
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

/// @nodoc
class SelectiveAuth {
  static const enabled = SelectiveAuth._('Enabled');
  static const disabled = SelectiveAuth._('Disabled');

  final String value;

  const SelectiveAuth._(this.value);

  static const values = [enabled, disabled];

  static SelectiveAuth fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SelectiveAuth._(value));

  @override
  bool operator ==(other) => other is SelectiveAuth && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the configurable settings for a directory.
///
/// @nodoc
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

/// Contains information about a Remote Authentication Dial In User Service
/// (RADIUS) server.
///
/// @nodoc
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
  /// retried after the initial attempt.
  final int? radiusRetries;

  /// The fully qualified domain name (FQDN) or IP addresses of the RADIUS server
  /// endpoints, or the FQDN or IP addresses of your RADIUS server load balancer.
  final List<String>? radiusServers;

  /// The IPv6 addresses of the RADIUS server endpoints or RADIUS server load
  /// balancer.
  final List<String>? radiusServersIpv6;

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
    this.radiusServersIpv6,
    this.radiusTimeout,
    this.sharedSecret,
    this.useSameUsername,
  });

  factory RadiusSettings.fromJson(Map<String, dynamic> json) {
    return RadiusSettings(
      authenticationProtocol: (json['AuthenticationProtocol'] as String?)
          ?.let(RadiusAuthenticationProtocol.fromString),
      displayLabel: json['DisplayLabel'] as String?,
      radiusPort: json['RadiusPort'] as int?,
      radiusRetries: json['RadiusRetries'] as int?,
      radiusServers: (json['RadiusServers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      radiusServersIpv6: (json['RadiusServersIpv6'] as List?)
          ?.nonNulls
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
    final radiusServersIpv6 = this.radiusServersIpv6;
    final radiusTimeout = this.radiusTimeout;
    final sharedSecret = this.sharedSecret;
    final useSameUsername = this.useSameUsername;
    return {
      if (authenticationProtocol != null)
        'AuthenticationProtocol': authenticationProtocol.value,
      if (displayLabel != null) 'DisplayLabel': displayLabel,
      if (radiusPort != null) 'RadiusPort': radiusPort,
      if (radiusRetries != null) 'RadiusRetries': radiusRetries,
      if (radiusServers != null) 'RadiusServers': radiusServers,
      if (radiusServersIpv6 != null) 'RadiusServersIpv6': radiusServersIpv6,
      if (radiusTimeout != null) 'RadiusTimeout': radiusTimeout,
      if (sharedSecret != null) 'SharedSecret': sharedSecret,
      if (useSameUsername != null) 'UseSameUsername': useSameUsername,
    };
  }
}

/// @nodoc
class RadiusAuthenticationProtocol {
  static const pap = RadiusAuthenticationProtocol._('PAP');
  static const chap = RadiusAuthenticationProtocol._('CHAP');
  static const msCHAPv1 = RadiusAuthenticationProtocol._('MS-CHAPv1');
  static const msCHAPv2 = RadiusAuthenticationProtocol._('MS-CHAPv2');

  final String value;

  const RadiusAuthenticationProtocol._(this.value);

  static const values = [pap, chap, msCHAPv1, msCHAPv2];

  static RadiusAuthenticationProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RadiusAuthenticationProtocol._(value));

  @override
  bool operator ==(other) =>
      other is RadiusAuthenticationProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Use to recover to the hybrid directory administrator account credentials.
///
/// @nodoc
class HybridAdministratorAccountUpdate {
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret that contains the credentials for the AD administrator user, and
  /// enables hybrid domain controllers to join the managed AD domain. For
  /// example:
  ///
  /// <code>
  /// {"customerAdAdminDomainUsername":"carlos_salazar","customerAdAdminDomainPassword":"ExamplePassword123!"}.
  /// </code>
  final String secretArn;

  HybridAdministratorAccountUpdate({
    required this.secretArn,
  });

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    return {
      'SecretArn': secretArn,
    };
  }
}

/// Contains configuration settings for self-managed instances with SSM used in
/// hybrid directory operations.
///
/// @nodoc
class HybridCustomerInstancesSettings {
  /// The IP addresses of the DNS servers or domain controllers in your
  /// self-managed AD environment.
  final List<String> customerDnsIps;

  /// The identifiers of the self-managed instances with SSM used in hybrid
  /// directory.
  final List<String> instanceIds;

  HybridCustomerInstancesSettings({
    required this.customerDnsIps,
    required this.instanceIds,
  });

  Map<String, dynamic> toJson() {
    final customerDnsIps = this.customerDnsIps;
    final instanceIds = this.instanceIds;
    return {
      'CustomerDnsIps': customerDnsIps,
      'InstanceIds': instanceIds,
    };
  }
}

/// @nodoc
class UpdateType {
  static const os = UpdateType._('OS');
  static const network = UpdateType._('NETWORK');
  static const size = UpdateType._('SIZE');

  final String value;

  const UpdateType._(this.value);

  static const values = [os, network, size];

  static UpdateType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UpdateType._(value));

  @override
  bool operator ==(other) => other is UpdateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// OS version that the directory needs to be updated to.
///
/// @nodoc
class OSUpdateSettings {
  /// OS version that the directory needs to be updated to.
  final OSVersion? oSVersion;

  OSUpdateSettings({
    this.oSVersion,
  });

  factory OSUpdateSettings.fromJson(Map<String, dynamic> json) {
    return OSUpdateSettings(
      oSVersion: (json['OSVersion'] as String?)?.let(OSVersion.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final oSVersion = this.oSVersion;
    return {
      if (oSVersion != null) 'OSVersion': oSVersion.value,
    };
  }
}

/// Contains the directory size configuration for update operations.
///
/// @nodoc
class DirectorySizeUpdateSettings {
  /// The target directory size for the update operation.
  final DirectorySize? directorySize;

  DirectorySizeUpdateSettings({
    this.directorySize,
  });

  Map<String, dynamic> toJson() {
    final directorySize = this.directorySize;
    return {
      if (directorySize != null) 'DirectorySize': directorySize.value,
    };
  }
}

/// Contains the network configuration for directory update operations.
///
/// @nodoc
class NetworkUpdateSettings {
  /// IPv6 addresses of DNS servers or domain controllers in the self-managed
  /// directory. Required only when updating an AD Connector directory.
  final List<String>? customerDnsIpsV6;

  /// The target network type for the directory update.
  final NetworkType? networkType;

  NetworkUpdateSettings({
    this.customerDnsIpsV6,
    this.networkType,
  });

  Map<String, dynamic> toJson() {
    final customerDnsIpsV6 = this.customerDnsIpsV6;
    final networkType = this.networkType;
    return {
      if (customerDnsIpsV6 != null) 'CustomerDnsIpsV6': customerDnsIpsV6,
      if (networkType != null) 'NetworkType': networkType.value,
    };
  }
}

/// @nodoc
class NetworkType {
  static const dualStack = NetworkType._('Dual-stack');
  static const iPv4 = NetworkType._('IPv4');
  static const iPv6 = NetworkType._('IPv6');

  final String value;

  const NetworkType._(this.value);

  static const values = [dualStack, iPv4, iPv6];

  static NetworkType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NetworkType._(value));

  @override
  bool operator ==(other) => other is NetworkType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DirectorySize {
  static const small = DirectorySize._('Small');
  static const large = DirectorySize._('Large');

  final String value;

  const DirectorySize._(this.value);

  static const values = [small, large];

  static DirectorySize fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DirectorySize._(value));

  @override
  bool operator ==(other) => other is DirectorySize && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OSVersion {
  static const server_2012 = OSVersion._('SERVER_2012');
  static const server_2019 = OSVersion._('SERVER_2019');

  final String value;

  const OSVersion._(this.value);

  static const values = [server_2012, server_2019];

  static OSVersion fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OSVersion._(value));

  @override
  bool operator ==(other) => other is OSVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Identifier that contains details about the directory consumer account with
/// whom the directory is being unshared.
///
/// @nodoc
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
      'Type': type.value,
    };
  }
}

/// @nodoc
class TargetType {
  static const account = TargetType._('ACCOUNT');

  final String value;

  const TargetType._(this.value);

  static const values = [account];

  static TargetType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TargetType._(value));

  @override
  bool operator ==(other) => other is TargetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configuration parameters required to perform a directory
/// assessment.
///
/// @nodoc
class AssessmentConfiguration {
  /// A list of IP addresses for the DNS servers or domain controllers in your
  /// self-managed AD that are tested during the assessment.
  final List<String> customerDnsIps;

  /// The fully qualified domain name (FQDN) of the self-managed AD domain to
  /// assess.
  final String dnsName;

  /// The identifiers of the self-managed instances with SSM that are used to
  /// perform connectivity and validation tests.
  final List<String> instanceIds;
  final DirectoryVpcSettings vpcSettings;

  /// By default, the service attaches a security group to allow network access to
  /// the self-managed nodes in your Amazon VPC. You can optionally supply your
  /// own security group that allows network traffic to and from your self-managed
  /// domain controllers outside of your Amazon VPC.
  final List<String>? securityGroupIds;

  AssessmentConfiguration({
    required this.customerDnsIps,
    required this.dnsName,
    required this.instanceIds,
    required this.vpcSettings,
    this.securityGroupIds,
  });

  Map<String, dynamic> toJson() {
    final customerDnsIps = this.customerDnsIps;
    final dnsName = this.dnsName;
    final instanceIds = this.instanceIds;
    final vpcSettings = this.vpcSettings;
    final securityGroupIds = this.securityGroupIds;
    return {
      'CustomerDnsIps': customerDnsIps,
      'DnsName': dnsName,
      'InstanceIds': instanceIds,
      'VpcSettings': vpcSettings,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
    };
  }
}

/// Contains VPC information for the <a>CreateDirectory</a>,
/// <a>CreateMicrosoftAD</a>, or <a>CreateHybridAD</a> operation.
///
/// @nodoc
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
      subnetIds: ((json['SubnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: (json['VpcId'] as String?) ?? '',
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

/// Identifier that contains details about the directory consumer account.
///
/// @nodoc
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
      'Type': type.value,
    };
  }
}

/// @nodoc
class ShareMethod {
  static const organizations = ShareMethod._('ORGANIZATIONS');
  static const handshake = ShareMethod._('HANDSHAKE');

  final String value;

  const ShareMethod._(this.value);

  static const values = [organizations, handshake];

  static ShareMethod fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ShareMethod._(value));

  @override
  bool operator ==(other) => other is ShareMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CertificateType {
  static const clientCertAuth = CertificateType._('ClientCertAuth');
  static const clientLDAPS = CertificateType._('ClientLDAPS');

  final String value;

  const CertificateType._(this.value);

  static const values = [clientCertAuth, clientLDAPS];

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

/// Contains information about the client certificate authentication settings
/// for the <code>RegisterCertificate</code> and
/// <code>DescribeCertificate</code> operations.
///
/// @nodoc
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

/// Metadata assigned to a directory consisting of a key-value pair.
///
/// @nodoc
class Tag {
  /// Required name of the tag. The string value can be Unicode characters and
  /// cannot be prefixed with "aws:". The string can contain only the set of
  /// Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-', ':',
  /// '@'(Java regex: "^(\[\\p{L}\\p{Z}\\p{N}_.:/=+\\-\]*)$").
  final String key;

  /// The optional value of the tag. The string value can be Unicode characters.
  /// The string can contain only the set of Unicode letters, digits, white-space,
  /// '_', '.', '/', '=', '+', '-', ':', '@' (Java regex:
  /// "^(\[\\p{L}\\p{Z}\\p{N}_.:/=+\\-\]*)$").
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

/// Information about a schema extension.
///
/// @nodoc
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
      schemaExtensionStatus: (json['SchemaExtensionStatus'] as String?)
          ?.let(SchemaExtensionStatus.fromString),
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
        'SchemaExtensionStatus': schemaExtensionStatus.value,
      if (schemaExtensionStatusReason != null)
        'SchemaExtensionStatusReason': schemaExtensionStatusReason,
      if (startDateTime != null)
        'StartDateTime': unixTimestampToJson(startDateTime),
    };
  }
}

/// @nodoc
class SchemaExtensionStatus {
  static const initializing = SchemaExtensionStatus._('Initializing');
  static const creatingSnapshot = SchemaExtensionStatus._('CreatingSnapshot');
  static const updatingSchema = SchemaExtensionStatus._('UpdatingSchema');
  static const replicating = SchemaExtensionStatus._('Replicating');
  static const cancelInProgress = SchemaExtensionStatus._('CancelInProgress');
  static const rollbackInProgress =
      SchemaExtensionStatus._('RollbackInProgress');
  static const cancelled = SchemaExtensionStatus._('Cancelled');
  static const failed = SchemaExtensionStatus._('Failed');
  static const completed = SchemaExtensionStatus._('Completed');

  final String value;

  const SchemaExtensionStatus._(this.value);

  static const values = [
    initializing,
    creatingSnapshot,
    updatingSchema,
    replicating,
    cancelInProgress,
    rollbackInProgress,
    cancelled,
    failed,
    completed
  ];

  static SchemaExtensionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaExtensionStatus._(value));

  @override
  bool operator ==(other) =>
      other is SchemaExtensionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a log subscription, which tracks real-time data from a chosen log
/// group to a specified destination.
///
/// @nodoc
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

/// Information about one or more IP address blocks.
///
/// @nodoc
class IpRouteInfo {
  /// The date and time the address block was added to the directory.
  final DateTime? addedDateTime;

  /// IP address block in the <a>IpRoute</a>.
  final String? cidrIp;

  /// IPv6 address block in the <a>IpRoute</a>.
  final String? cidrIpv6;

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
    this.cidrIpv6,
    this.description,
    this.directoryId,
    this.ipRouteStatusMsg,
    this.ipRouteStatusReason,
  });

  factory IpRouteInfo.fromJson(Map<String, dynamic> json) {
    return IpRouteInfo(
      addedDateTime: timeStampFromJson(json['AddedDateTime']),
      cidrIp: json['CidrIp'] as String?,
      cidrIpv6: json['CidrIpv6'] as String?,
      description: json['Description'] as String?,
      directoryId: json['DirectoryId'] as String?,
      ipRouteStatusMsg: (json['IpRouteStatusMsg'] as String?)
          ?.let(IpRouteStatusMsg.fromString),
      ipRouteStatusReason: json['IpRouteStatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addedDateTime = this.addedDateTime;
    final cidrIp = this.cidrIp;
    final cidrIpv6 = this.cidrIpv6;
    final description = this.description;
    final directoryId = this.directoryId;
    final ipRouteStatusMsg = this.ipRouteStatusMsg;
    final ipRouteStatusReason = this.ipRouteStatusReason;
    return {
      if (addedDateTime != null)
        'AddedDateTime': unixTimestampToJson(addedDateTime),
      if (cidrIp != null) 'CidrIp': cidrIp,
      if (cidrIpv6 != null) 'CidrIpv6': cidrIpv6,
      if (description != null) 'Description': description,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (ipRouteStatusMsg != null) 'IpRouteStatusMsg': ipRouteStatusMsg.value,
      if (ipRouteStatusReason != null)
        'IpRouteStatusReason': ipRouteStatusReason,
    };
  }
}

/// @nodoc
class IpRouteStatusMsg {
  static const adding = IpRouteStatusMsg._('Adding');
  static const added = IpRouteStatusMsg._('Added');
  static const removing = IpRouteStatusMsg._('Removing');
  static const removed = IpRouteStatusMsg._('Removed');
  static const addFailed = IpRouteStatusMsg._('AddFailed');
  static const removeFailed = IpRouteStatusMsg._('RemoveFailed');

  final String value;

  const IpRouteStatusMsg._(this.value);

  static const values = [
    adding,
    added,
    removing,
    removed,
    addFailed,
    removeFailed
  ];

  static IpRouteStatusMsg fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IpRouteStatusMsg._(value));

  @override
  bool operator ==(other) => other is IpRouteStatusMsg && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains general information about a certificate.
///
/// @nodoc
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
      state: (json['State'] as String?)?.let(CertificateState.fromString),
      type: (json['Type'] as String?)?.let(CertificateType.fromString),
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
      if (state != null) 'State': state.value,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class CertificateState {
  static const registering = CertificateState._('Registering');
  static const registered = CertificateState._('Registered');
  static const registerFailed = CertificateState._('RegisterFailed');
  static const deregistering = CertificateState._('Deregistering');
  static const deregistered = CertificateState._('Deregistered');
  static const deregisterFailed = CertificateState._('DeregisterFailed');

  final String value;

  const CertificateState._(this.value);

  static const values = [
    registering,
    registered,
    registerFailed,
    deregistering,
    deregistered,
    deregisterFailed
  ];

  static CertificateState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateState._(value));

  @override
  bool operator ==(other) => other is CertificateState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a directory assessment, providing a
/// high-level overview without detailed validation results.
///
/// @nodoc
class AssessmentSummary {
  /// The unique identifier of the directory assessment.
  final String? assessmentId;

  /// The IP addresses of the DNS servers or domain controllers in your
  /// self-managed AD environment.
  final List<String>? customerDnsIps;

  /// The identifier of the directory associated with this assessment.
  final String? directoryId;

  /// The fully qualified domain name (FQDN) of the Active Directory domain being
  /// assessed.
  final String? dnsName;

  /// The date and time when the assessment status was last updated.
  final DateTime? lastUpdateDateTime;

  /// The type of assessment report generated. Valid values include
  /// <code>CUSTOMER</code> and <code>SYSTEM</code>.
  final String? reportType;

  /// The date and time when the assessment was initiated.
  final DateTime? startTime;

  /// The current status of the assessment. Valid values include
  /// <code>SUCCESS</code>, <code>FAILED</code>, <code>PENDING</code>, and
  /// <code>IN_PROGRESS</code>.
  final String? status;

  AssessmentSummary({
    this.assessmentId,
    this.customerDnsIps,
    this.directoryId,
    this.dnsName,
    this.lastUpdateDateTime,
    this.reportType,
    this.startTime,
    this.status,
  });

  factory AssessmentSummary.fromJson(Map<String, dynamic> json) {
    return AssessmentSummary(
      assessmentId: json['AssessmentId'] as String?,
      customerDnsIps: (json['CustomerDnsIps'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      directoryId: json['DirectoryId'] as String?,
      dnsName: json['DnsName'] as String?,
      lastUpdateDateTime: timeStampFromJson(json['LastUpdateDateTime']),
      reportType: json['ReportType'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final customerDnsIps = this.customerDnsIps;
    final directoryId = this.directoryId;
    final dnsName = this.dnsName;
    final lastUpdateDateTime = this.lastUpdateDateTime;
    final reportType = this.reportType;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (assessmentId != null) 'AssessmentId': assessmentId,
      if (customerDnsIps != null) 'CustomerDnsIps': customerDnsIps,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (dnsName != null) 'DnsName': dnsName,
      if (lastUpdateDateTime != null)
        'LastUpdateDateTime': unixTimestampToJson(lastUpdateDateTime),
      if (reportType != null) 'ReportType': reportType,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status,
    };
  }
}

/// Contains manual snapshot limit information for a directory.
///
/// @nodoc
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

/// Contains directory limit information for a Region.
///
/// @nodoc
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

/// @nodoc
class LDAPSType {
  static const client = LDAPSType._('Client');

  final String value;

  const LDAPSType._(this.value);

  static const values = [client];

  static LDAPSType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LDAPSType._(value));

  @override
  bool operator ==(other) => other is LDAPSType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ClientAuthenticationType {
  static const smartCard = ClientAuthenticationType._('SmartCard');
  static const smartCardOrPassword =
      ClientAuthenticationType._('SmartCardOrPassword');

  final String value;

  const ClientAuthenticationType._(this.value);

  static const values = [smartCard, smartCardOrPassword];

  static ClientAuthenticationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClientAuthenticationType._(value));

  @override
  bool operator ==(other) =>
      other is ClientAuthenticationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An entry of update information related to a requested update type.
///
/// @nodoc
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
      status: (json['Status'] as String?)?.let(UpdateStatus.fromString),
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
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// @nodoc
class UpdateStatus {
  static const updated = UpdateStatus._('Updated');
  static const updating = UpdateStatus._('Updating');
  static const updateFailed = UpdateStatus._('UpdateFailed');

  final String value;

  const UpdateStatus._(this.value);

  static const values = [updated, updating, updateFailed];

  static UpdateStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UpdateStatus._(value));

  @override
  bool operator ==(other) => other is UpdateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The value for a given type of <code>UpdateSettings</code>.
///
/// @nodoc
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

/// Describes a trust relationship between an Managed Microsoft AD directory and
/// an external domain.
///
/// @nodoc
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
      selectiveAuth:
          (json['SelectiveAuth'] as String?)?.let(SelectiveAuth.fromString),
      stateLastUpdatedDateTime:
          timeStampFromJson(json['StateLastUpdatedDateTime']),
      trustDirection:
          (json['TrustDirection'] as String?)?.let(TrustDirection.fromString),
      trustId: json['TrustId'] as String?,
      trustState: (json['TrustState'] as String?)?.let(TrustState.fromString),
      trustStateReason: json['TrustStateReason'] as String?,
      trustType: (json['TrustType'] as String?)?.let(TrustType.fromString),
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
      if (selectiveAuth != null) 'SelectiveAuth': selectiveAuth.value,
      if (stateLastUpdatedDateTime != null)
        'StateLastUpdatedDateTime':
            unixTimestampToJson(stateLastUpdatedDateTime),
      if (trustDirection != null) 'TrustDirection': trustDirection.value,
      if (trustId != null) 'TrustId': trustId,
      if (trustState != null) 'TrustState': trustState.value,
      if (trustStateReason != null) 'TrustStateReason': trustStateReason,
      if (trustType != null) 'TrustType': trustType.value,
    };
  }
}

/// @nodoc
class TrustType {
  static const forest = TrustType._('Forest');
  static const external = TrustType._('External');

  final String value;

  const TrustType._(this.value);

  static const values = [forest, external];

  static TrustType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TrustType._(value));

  @override
  bool operator ==(other) => other is TrustType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TrustDirection {
  static const oneWayOutgoing = TrustDirection._('One-Way: Outgoing');
  static const oneWayIncoming = TrustDirection._('One-Way: Incoming');
  static const twoWay = TrustDirection._('Two-Way');

  final String value;

  const TrustDirection._(this.value);

  static const values = [oneWayOutgoing, oneWayIncoming, twoWay];

  static TrustDirection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrustDirection._(value));

  @override
  bool operator ==(other) => other is TrustDirection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TrustState {
  static const creating = TrustState._('Creating');
  static const created = TrustState._('Created');
  static const verifying = TrustState._('Verifying');
  static const verifyFailed = TrustState._('VerifyFailed');
  static const verified = TrustState._('Verified');
  static const updating = TrustState._('Updating');
  static const updateFailed = TrustState._('UpdateFailed');
  static const updated = TrustState._('Updated');
  static const deleting = TrustState._('Deleting');
  static const deleted = TrustState._('Deleted');
  static const failed = TrustState._('Failed');

  final String value;

  const TrustState._(this.value);

  static const values = [
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
    failed
  ];

  static TrustState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TrustState._(value));

  @override
  bool operator ==(other) => other is TrustState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a directory snapshot.
///
/// @nodoc
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
      status: (json['Status'] as String?)?.let(SnapshotStatus.fromString),
      type: (json['Type'] as String?)?.let(SnapshotType.fromString),
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
      if (status != null) 'Status': status.value,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class SnapshotType {
  static const auto = SnapshotType._('Auto');
  static const manual = SnapshotType._('Manual');

  final String value;

  const SnapshotType._(this.value);

  static const values = [auto, manual];

  static SnapshotType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SnapshotType._(value));

  @override
  bool operator ==(other) => other is SnapshotType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SnapshotStatus {
  static const creating = SnapshotStatus._('Creating');
  static const completed = SnapshotStatus._('Completed');
  static const failed = SnapshotStatus._('Failed');

  final String value;

  const SnapshotStatus._(this.value);

  static const values = [creating, completed, failed];

  static SnapshotStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SnapshotStatus._(value));

  @override
  bool operator ==(other) => other is SnapshotStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the shared directory in the directory owner account for which
/// the share request in the directory consumer account has been accepted.
///
/// @nodoc
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
      shareMethod:
          (json['ShareMethod'] as String?)?.let(ShareMethod.fromString),
      shareNotes: json['ShareNotes'] as String?,
      shareStatus:
          (json['ShareStatus'] as String?)?.let(ShareStatus.fromString),
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
      if (shareMethod != null) 'ShareMethod': shareMethod.value,
      if (shareNotes != null) 'ShareNotes': shareNotes,
      if (shareStatus != null) 'ShareStatus': shareStatus.value,
      if (sharedAccountId != null) 'SharedAccountId': sharedAccountId,
      if (sharedDirectoryId != null) 'SharedDirectoryId': sharedDirectoryId,
    };
  }
}

/// @nodoc
class ShareStatus {
  static const shared = ShareStatus._('Shared');
  static const pendingAcceptance = ShareStatus._('PendingAcceptance');
  static const rejected = ShareStatus._('Rejected');
  static const rejecting = ShareStatus._('Rejecting');
  static const rejectFailed = ShareStatus._('RejectFailed');
  static const sharing = ShareStatus._('Sharing');
  static const shareFailed = ShareStatus._('ShareFailed');
  static const deleted = ShareStatus._('Deleted');
  static const deleting = ShareStatus._('Deleting');

  final String value;

  const ShareStatus._(this.value);

  static const values = [
    shared,
    pendingAcceptance,
    rejected,
    rejecting,
    rejectFailed,
    sharing,
    shareFailed,
    deleted,
    deleting
  ];

  static ShareStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ShareStatus._(value));

  @override
  bool operator ==(other) => other is ShareStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the specified configurable setting for a
/// directory.
///
/// @nodoc
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
              (k, e) => MapEntry(
                  k, DirectoryConfigurationStatus.fromString((e as String)))),
      requestStatus: (json['RequestStatus'] as String?)
          ?.let(DirectoryConfigurationStatus.fromString),
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
            requestDetailedStatus.map((k, e) => MapEntry(k, e.value)),
      if (requestStatus != null) 'RequestStatus': requestStatus.value,
      if (requestStatusMessage != null)
        'RequestStatusMessage': requestStatusMessage,
      if (requestedValue != null) 'RequestedValue': requestedValue,
      if (type != null) 'Type': type,
    };
  }
}

/// @nodoc
class DirectoryConfigurationStatus {
  static const requested = DirectoryConfigurationStatus._('Requested');
  static const updating = DirectoryConfigurationStatus._('Updating');
  static const updated = DirectoryConfigurationStatus._('Updated');
  static const failed = DirectoryConfigurationStatus._('Failed');
  static const $default = DirectoryConfigurationStatus._('Default');

  final String value;

  const DirectoryConfigurationStatus._(this.value);

  static const values = [requested, updating, updated, failed, $default];

  static DirectoryConfigurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DirectoryConfigurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is DirectoryConfigurationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The replicated Region information for a directory.
///
/// @nodoc
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
      regionType: (json['RegionType'] as String?)?.let(RegionType.fromString),
      status: (json['Status'] as String?)?.let(DirectoryStage.fromString),
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
      if (regionType != null) 'RegionType': regionType.value,
      if (status != null) 'Status': status.value,
      if (statusLastUpdatedDateTime != null)
        'StatusLastUpdatedDateTime':
            unixTimestampToJson(statusLastUpdatedDateTime),
      if (vpcSettings != null) 'VpcSettings': vpcSettings,
    };
  }
}

/// @nodoc
class RegionType {
  static const primary = RegionType._('Primary');
  static const additional = RegionType._('Additional');

  final String value;

  const RegionType._(this.value);

  static const values = [primary, additional];

  static RegionType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RegionType._(value));

  @override
  bool operator ==(other) => other is RegionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DirectoryStage {
  static const requested = DirectoryStage._('Requested');
  static const creating = DirectoryStage._('Creating');
  static const created = DirectoryStage._('Created');
  static const active = DirectoryStage._('Active');
  static const inoperable = DirectoryStage._('Inoperable');
  static const impaired = DirectoryStage._('Impaired');
  static const restoring = DirectoryStage._('Restoring');
  static const restoreFailed = DirectoryStage._('RestoreFailed');
  static const deleting = DirectoryStage._('Deleting');
  static const deleted = DirectoryStage._('Deleted');
  static const failed = DirectoryStage._('Failed');
  static const updating = DirectoryStage._('Updating');

  final String value;

  const DirectoryStage._(this.value);

  static const values = [
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
    updating
  ];

  static DirectoryStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DirectoryStage._(value));

  @override
  bool operator ==(other) => other is DirectoryStage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains general information about the LDAPS settings.
///
/// @nodoc
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
      lDAPSStatus:
          (json['LDAPSStatus'] as String?)?.let(LDAPSStatus.fromString),
      lDAPSStatusReason: json['LDAPSStatusReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final lDAPSStatus = this.lDAPSStatus;
    final lDAPSStatusReason = this.lDAPSStatusReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    return {
      if (lDAPSStatus != null) 'LDAPSStatus': lDAPSStatus.value,
      if (lDAPSStatusReason != null) 'LDAPSStatusReason': lDAPSStatusReason,
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
    };
  }
}

/// @nodoc
class LDAPSStatus {
  static const enabling = LDAPSStatus._('Enabling');
  static const enabled = LDAPSStatus._('Enabled');
  static const enableFailed = LDAPSStatus._('EnableFailed');
  static const disabled = LDAPSStatus._('Disabled');

  final String value;

  const LDAPSStatus._(this.value);

  static const values = [enabling, enabled, enableFailed, disabled];

  static LDAPSStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LDAPSStatus._(value));

  @override
  bool operator ==(other) => other is LDAPSStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about update activities for different components of a
/// hybrid directory.
///
/// @nodoc
class HybridUpdateActivities {
  /// A list of update activities related to hybrid directory administrator
  /// account changes.
  final List<HybridUpdateInfoEntry>? hybridAdministratorAccount;

  /// A list of update activities related to the self-managed instances with SSM
  /// in the self-managed instances with SSM hybrid directory configuration.
  final List<HybridUpdateInfoEntry>? selfManagedInstances;

  HybridUpdateActivities({
    this.hybridAdministratorAccount,
    this.selfManagedInstances,
  });

  factory HybridUpdateActivities.fromJson(Map<String, dynamic> json) {
    return HybridUpdateActivities(
      hybridAdministratorAccount: (json['HybridAdministratorAccount'] as List?)
          ?.nonNulls
          .map((e) => HybridUpdateInfoEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      selfManagedInstances: (json['SelfManagedInstances'] as List?)
          ?.nonNulls
          .map((e) => HybridUpdateInfoEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hybridAdministratorAccount = this.hybridAdministratorAccount;
    final selfManagedInstances = this.selfManagedInstances;
    return {
      if (hybridAdministratorAccount != null)
        'HybridAdministratorAccount': hybridAdministratorAccount,
      if (selfManagedInstances != null)
        'SelfManagedInstances': selfManagedInstances,
    };
  }
}

/// Contains detailed information about a specific update activity for a hybrid
/// directory component.
///
/// @nodoc
class HybridUpdateInfoEntry {
  /// The identifier of the assessment performed to validate this update
  /// configuration.
  final String? assessmentId;

  /// Specifies if the update was initiated by the customer or Amazon Web
  /// Services.
  final String? initiatedBy;

  /// The date and time when the update activity status was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The new configuration values being applied in this update.
  final HybridUpdateValue? newValue;

  /// The previous configuration values before this update was applied.
  final HybridUpdateValue? previousValue;

  /// The date and time when the update activity was initiated.
  final DateTime? startTime;

  /// The current status of the update activity. Valid values include
  /// <code>UPDATED</code>, <code>UPDATING</code>, and <code>UPDATE_FAILED</code>.
  final UpdateStatus? status;

  /// A human-readable description of the update status, including any error
  /// details or progress information.
  final String? statusReason;

  HybridUpdateInfoEntry({
    this.assessmentId,
    this.initiatedBy,
    this.lastUpdatedDateTime,
    this.newValue,
    this.previousValue,
    this.startTime,
    this.status,
    this.statusReason,
  });

  factory HybridUpdateInfoEntry.fromJson(Map<String, dynamic> json) {
    return HybridUpdateInfoEntry(
      assessmentId: json['AssessmentId'] as String?,
      initiatedBy: json['InitiatedBy'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['LastUpdatedDateTime']),
      newValue: json['NewValue'] != null
          ? HybridUpdateValue.fromJson(json['NewValue'] as Map<String, dynamic>)
          : null,
      previousValue: json['PreviousValue'] != null
          ? HybridUpdateValue.fromJson(
              json['PreviousValue'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.let(UpdateStatus.fromString),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final initiatedBy = this.initiatedBy;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final newValue = this.newValue;
    final previousValue = this.previousValue;
    final startTime = this.startTime;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (assessmentId != null) 'AssessmentId': assessmentId,
      if (initiatedBy != null) 'InitiatedBy': initiatedBy,
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (newValue != null) 'NewValue': newValue,
      if (previousValue != null) 'PreviousValue': previousValue,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// Contains the configuration values for a hybrid directory update, including
/// Amazon Web Services System Manager managed node and DNS information.
///
/// @nodoc
class HybridUpdateValue {
  /// The IP addresses of the DNS servers or domain controllers in the hybrid
  /// directory configuration.
  final List<String>? dnsIps;

  /// The identifiers of the self-managed instances with SSM in the hybrid
  /// directory configuration.
  final List<String>? instanceIds;

  HybridUpdateValue({
    this.dnsIps,
    this.instanceIds,
  });

  factory HybridUpdateValue.fromJson(Map<String, dynamic> json) {
    return HybridUpdateValue(
      dnsIps:
          (json['DnsIps'] as List?)?.nonNulls.map((e) => e as String).toList(),
      instanceIds: (json['InstanceIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dnsIps = this.dnsIps;
    final instanceIds = this.instanceIds;
    return {
      if (dnsIps != null) 'DnsIps': dnsIps,
      if (instanceIds != null) 'InstanceIds': instanceIds,
    };
  }
}

/// @nodoc
class HybridUpdateType {
  static const selfManagedInstances =
      HybridUpdateType._('SelfManagedInstances');
  static const hybridAdministratorAccount =
      HybridUpdateType._('HybridAdministratorAccount');

  final String value;

  const HybridUpdateType._(this.value);

  static const values = [selfManagedInstances, hybridAdministratorAccount];

  static HybridUpdateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HybridUpdateType._(value));

  @override
  bool operator ==(other) => other is HybridUpdateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about Amazon SNS topic and Directory Service directory
/// associations.
///
/// @nodoc
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
      status: (json['Status'] as String?)?.let(TopicStatus.fromString),
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
      if (status != null) 'Status': status.value,
      if (topicArn != null) 'TopicArn': topicArn,
      if (topicName != null) 'TopicName': topicName,
    };
  }
}

/// @nodoc
class TopicStatus {
  static const registered = TopicStatus._('Registered');
  static const topicNotFound = TopicStatus._('Topic not found');
  static const failed = TopicStatus._('Failed');
  static const deleted = TopicStatus._('Deleted');

  final String value;

  const TopicStatus._(this.value);

  static const values = [registered, topicNotFound, failed, deleted];

  static TopicStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TopicStatus._(value));

  @override
  bool operator ==(other) => other is TopicStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the domain controllers for a specified directory.
///
/// @nodoc
class DomainController {
  /// The Availability Zone where the domain controller is located.
  final String? availabilityZone;

  /// Identifier of the directory where the domain controller resides.
  final String? directoryId;

  /// The IP address of the domain controller.
  final String? dnsIpAddr;

  /// The IPv6 address of the domain controller.
  final String? dnsIpv6Addr;

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
    this.dnsIpv6Addr,
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
      dnsIpv6Addr: json['DnsIpv6Addr'] as String?,
      domainControllerId: json['DomainControllerId'] as String?,
      launchTime: timeStampFromJson(json['LaunchTime']),
      status:
          (json['Status'] as String?)?.let(DomainControllerStatus.fromString),
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
    final dnsIpv6Addr = this.dnsIpv6Addr;
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
      if (dnsIpv6Addr != null) 'DnsIpv6Addr': dnsIpv6Addr,
      if (domainControllerId != null) 'DomainControllerId': domainControllerId,
      if (launchTime != null) 'LaunchTime': unixTimestampToJson(launchTime),
      if (status != null) 'Status': status.value,
      if (statusLastUpdatedDateTime != null)
        'StatusLastUpdatedDateTime':
            unixTimestampToJson(statusLastUpdatedDateTime),
      if (statusReason != null) 'StatusReason': statusReason,
      if (subnetId != null) 'SubnetId': subnetId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// @nodoc
class DomainControllerStatus {
  static const creating = DomainControllerStatus._('Creating');
  static const active = DomainControllerStatus._('Active');
  static const impaired = DomainControllerStatus._('Impaired');
  static const restoring = DomainControllerStatus._('Restoring');
  static const deleting = DomainControllerStatus._('Deleting');
  static const deleted = DomainControllerStatus._('Deleted');
  static const failed = DomainControllerStatus._('Failed');
  static const updating = DomainControllerStatus._('Updating');

  final String value;

  const DomainControllerStatus._(this.value);

  static const values = [
    creating,
    active,
    impaired,
    restoring,
    deleting,
    deleted,
    failed,
    updating
  ];

  static DomainControllerStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DomainControllerStatus._(value));

  @override
  bool operator ==(other) =>
      other is DomainControllerStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DataAccessStatus {
  static const disabled = DataAccessStatus._('Disabled');
  static const disabling = DataAccessStatus._('Disabling');
  static const enabled = DataAccessStatus._('Enabled');
  static const enabling = DataAccessStatus._('Enabling');
  static const failed = DataAccessStatus._('Failed');

  final String value;

  const DataAccessStatus._(this.value);

  static const values = [disabled, disabling, enabled, enabling, failed];

  static DataAccessStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataAccessStatus._(value));

  @override
  bool operator ==(other) => other is DataAccessStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about an Directory Service directory.
///
/// @nodoc
class DirectoryDescription {
  /// The access URL for the directory, such as
  /// <code>http://<alias>.awsapps.com</code>. If no alias exists,
  /// <code><alias></code> is the directory identifier, such as
  /// <code>d-XXXXXXXXXX</code>.
  final String? accessUrl;

  /// The alias for the directory. If no alias exists, the alias is the directory
  /// identifier, such as <code>d-XXXXXXXXXX</code>.
  final String? alias;

  /// <a>DirectoryConnectSettingsDescription</a> object that contains additional
  /// information about an AD Connector directory. Present only for AD Connector
  /// directories.
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
  /// IP addresses of self-managed directory to which the AD Connector is
  /// connected.
  final List<String>? dnsIpAddrs;

  /// The IPv6 addresses of the DNS servers for the directory. For a Simple AD or
  /// Microsoft AD directory, these are the IPv6 addresses of the Simple AD or
  /// Microsoft AD directory servers. For an AD Connector directory, these are the
  /// IPv6 addresses of the DNS servers or domain controllers in your self-managed
  /// directory to which the AD Connector is connected.
  final List<String>? dnsIpv6Addrs;

  /// The edition associated with this directory.
  final DirectoryEdition? edition;

  /// Contains information about the hybrid directory configuration for the
  /// directory, including Amazon Web Services System Manager managed node
  /// identifiers and DNS IPs.
  final HybridSettingsDescription? hybridSettings;

  /// The date and time when the directory was created.
  final DateTime? launchTime;

  /// The fully qualified name of the directory.
  final String? name;

  /// The network type of the directory.
  final NetworkType? networkType;

  /// The operating system (OS) version of the directory.
  final OSVersion? osVersion;

  /// Describes the Managed Microsoft AD directory in the directory owner account.
  final OwnerDirectoryDescription? ownerDirectoryDescription;

  /// Information about the <a>RadiusSettings</a> object configured for this
  /// directory.
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

  /// Indicates whether single sign-on is enabled for the directory. For more
  /// information, see <a>EnableSso</a> and <a>DisableSso</a>.
  final bool? ssoEnabled;

  /// The current stage of the directory.
  final DirectoryStage? stage;

  /// The date and time when the stage was last updated.
  final DateTime? stageLastUpdatedDateTime;

  /// Additional information about the directory stage.
  final String? stageReason;

  /// The directory type.
  final DirectoryType? type;

  /// A <a>DirectoryVpcSettingsDescription</a> object that contains additional
  /// information about a directory. Present only for Simple AD and Managed
  /// Microsoft AD directories.
  final DirectoryVpcSettingsDescription? vpcSettings;

  DirectoryDescription({
    this.accessUrl,
    this.alias,
    this.connectSettings,
    this.description,
    this.desiredNumberOfDomainControllers,
    this.directoryId,
    this.dnsIpAddrs,
    this.dnsIpv6Addrs,
    this.edition,
    this.hybridSettings,
    this.launchTime,
    this.name,
    this.networkType,
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      dnsIpv6Addrs: (json['DnsIpv6Addrs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      edition: (json['Edition'] as String?)?.let(DirectoryEdition.fromString),
      hybridSettings: json['HybridSettings'] != null
          ? HybridSettingsDescription.fromJson(
              json['HybridSettings'] as Map<String, dynamic>)
          : null,
      launchTime: timeStampFromJson(json['LaunchTime']),
      name: json['Name'] as String?,
      networkType:
          (json['NetworkType'] as String?)?.let(NetworkType.fromString),
      osVersion: (json['OsVersion'] as String?)?.let(OSVersion.fromString),
      ownerDirectoryDescription: json['OwnerDirectoryDescription'] != null
          ? OwnerDirectoryDescription.fromJson(
              json['OwnerDirectoryDescription'] as Map<String, dynamic>)
          : null,
      radiusSettings: json['RadiusSettings'] != null
          ? RadiusSettings.fromJson(
              json['RadiusSettings'] as Map<String, dynamic>)
          : null,
      radiusStatus:
          (json['RadiusStatus'] as String?)?.let(RadiusStatus.fromString),
      regionsInfo: json['RegionsInfo'] != null
          ? RegionsInfo.fromJson(json['RegionsInfo'] as Map<String, dynamic>)
          : null,
      shareMethod:
          (json['ShareMethod'] as String?)?.let(ShareMethod.fromString),
      shareNotes: json['ShareNotes'] as String?,
      shareStatus:
          (json['ShareStatus'] as String?)?.let(ShareStatus.fromString),
      shortName: json['ShortName'] as String?,
      size: (json['Size'] as String?)?.let(DirectorySize.fromString),
      ssoEnabled: json['SsoEnabled'] as bool?,
      stage: (json['Stage'] as String?)?.let(DirectoryStage.fromString),
      stageLastUpdatedDateTime:
          timeStampFromJson(json['StageLastUpdatedDateTime']),
      stageReason: json['StageReason'] as String?,
      type: (json['Type'] as String?)?.let(DirectoryType.fromString),
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
    final dnsIpv6Addrs = this.dnsIpv6Addrs;
    final edition = this.edition;
    final hybridSettings = this.hybridSettings;
    final launchTime = this.launchTime;
    final name = this.name;
    final networkType = this.networkType;
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
      if (dnsIpv6Addrs != null) 'DnsIpv6Addrs': dnsIpv6Addrs,
      if (edition != null) 'Edition': edition.value,
      if (hybridSettings != null) 'HybridSettings': hybridSettings,
      if (launchTime != null) 'LaunchTime': unixTimestampToJson(launchTime),
      if (name != null) 'Name': name,
      if (networkType != null) 'NetworkType': networkType.value,
      if (osVersion != null) 'OsVersion': osVersion.value,
      if (ownerDirectoryDescription != null)
        'OwnerDirectoryDescription': ownerDirectoryDescription,
      if (radiusSettings != null) 'RadiusSettings': radiusSettings,
      if (radiusStatus != null) 'RadiusStatus': radiusStatus.value,
      if (regionsInfo != null) 'RegionsInfo': regionsInfo,
      if (shareMethod != null) 'ShareMethod': shareMethod.value,
      if (shareNotes != null) 'ShareNotes': shareNotes,
      if (shareStatus != null) 'ShareStatus': shareStatus.value,
      if (shortName != null) 'ShortName': shortName,
      if (size != null) 'Size': size.value,
      if (ssoEnabled != null) 'SsoEnabled': ssoEnabled,
      if (stage != null) 'Stage': stage.value,
      if (stageLastUpdatedDateTime != null)
        'StageLastUpdatedDateTime':
            unixTimestampToJson(stageLastUpdatedDateTime),
      if (stageReason != null) 'StageReason': stageReason,
      if (type != null) 'Type': type.value,
      if (vpcSettings != null) 'VpcSettings': vpcSettings,
    };
  }
}

/// @nodoc
class DirectoryEdition {
  static const enterprise = DirectoryEdition._('Enterprise');
  static const standard = DirectoryEdition._('Standard');
  static const hybrid = DirectoryEdition._('Hybrid');

  final String value;

  const DirectoryEdition._(this.value);

  static const values = [enterprise, standard, hybrid];

  static DirectoryEdition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DirectoryEdition._(value));

  @override
  bool operator ==(other) => other is DirectoryEdition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DirectoryType {
  static const simpleAD = DirectoryType._('SimpleAD');
  static const aDConnector = DirectoryType._('ADConnector');
  static const microsoftAD = DirectoryType._('MicrosoftAD');
  static const sharedMicrosoftAD = DirectoryType._('SharedMicrosoftAD');

  final String value;

  const DirectoryType._(this.value);

  static const values = [simpleAD, aDConnector, microsoftAD, sharedMicrosoftAD];

  static DirectoryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DirectoryType._(value));

  @override
  bool operator ==(other) => other is DirectoryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the directory.
///
/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      securityGroupId: json['SecurityGroupId'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
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

/// Contains information about an AD Connector directory.
///
/// @nodoc
class DirectoryConnectSettingsDescription {
  /// The Availability Zones that the directory is in.
  final List<String>? availabilityZones;

  /// The IP addresses of the AD Connector servers.
  final List<String>? connectIps;

  /// The IPv6 addresses of the AD Connector servers.
  final List<String>? connectIpsV6;

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
    this.connectIpsV6,
    this.customerUserName,
    this.securityGroupId,
    this.subnetIds,
    this.vpcId,
  });

  factory DirectoryConnectSettingsDescription.fromJson(
      Map<String, dynamic> json) {
    return DirectoryConnectSettingsDescription(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      connectIps: (json['ConnectIps'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      connectIpsV6: (json['ConnectIpsV6'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      customerUserName: json['CustomerUserName'] as String?,
      securityGroupId: json['SecurityGroupId'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final connectIps = this.connectIps;
    final connectIpsV6 = this.connectIpsV6;
    final customerUserName = this.customerUserName;
    final securityGroupId = this.securityGroupId;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (connectIps != null) 'ConnectIps': connectIps,
      if (connectIpsV6 != null) 'ConnectIpsV6': connectIpsV6,
      if (customerUserName != null) 'CustomerUserName': customerUserName,
      if (securityGroupId != null) 'SecurityGroupId': securityGroupId,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// @nodoc
class RadiusStatus {
  static const creating = RadiusStatus._('Creating');
  static const completed = RadiusStatus._('Completed');
  static const failed = RadiusStatus._('Failed');

  final String value;

  const RadiusStatus._(this.value);

  static const values = [creating, completed, failed];

  static RadiusStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RadiusStatus._(value));

  @override
  bool operator ==(other) => other is RadiusStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the directory owner account details shared with the directory
/// consumer account.
///
/// @nodoc
class OwnerDirectoryDescription {
  /// Identifier of the directory owner account.
  final String? accountId;

  /// Identifier of the Managed Microsoft AD directory in the directory owner
  /// account.
  final String? directoryId;

  /// IP address of the directory’s domain controllers.
  final List<String>? dnsIpAddrs;

  /// IPv6 addresses of the directory’s domain controllers.
  final List<String>? dnsIpv6Addrs;

  /// Network type of the directory in the directory owner account.
  final NetworkType? networkType;

  /// Information about the <a>RadiusSettings</a> object server configuration.
  final RadiusSettings? radiusSettings;

  /// The status of the RADIUS server.
  final RadiusStatus? radiusStatus;

  /// Information about the VPC settings for the directory.
  final DirectoryVpcSettingsDescription? vpcSettings;

  OwnerDirectoryDescription({
    this.accountId,
    this.directoryId,
    this.dnsIpAddrs,
    this.dnsIpv6Addrs,
    this.networkType,
    this.radiusSettings,
    this.radiusStatus,
    this.vpcSettings,
  });

  factory OwnerDirectoryDescription.fromJson(Map<String, dynamic> json) {
    return OwnerDirectoryDescription(
      accountId: json['AccountId'] as String?,
      directoryId: json['DirectoryId'] as String?,
      dnsIpAddrs: (json['DnsIpAddrs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      dnsIpv6Addrs: (json['DnsIpv6Addrs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      networkType:
          (json['NetworkType'] as String?)?.let(NetworkType.fromString),
      radiusSettings: json['RadiusSettings'] != null
          ? RadiusSettings.fromJson(
              json['RadiusSettings'] as Map<String, dynamic>)
          : null,
      radiusStatus:
          (json['RadiusStatus'] as String?)?.let(RadiusStatus.fromString),
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
    final dnsIpv6Addrs = this.dnsIpv6Addrs;
    final networkType = this.networkType;
    final radiusSettings = this.radiusSettings;
    final radiusStatus = this.radiusStatus;
    final vpcSettings = this.vpcSettings;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (dnsIpAddrs != null) 'DnsIpAddrs': dnsIpAddrs,
      if (dnsIpv6Addrs != null) 'DnsIpv6Addrs': dnsIpv6Addrs,
      if (networkType != null) 'NetworkType': networkType.value,
      if (radiusSettings != null) 'RadiusSettings': radiusSettings,
      if (radiusStatus != null) 'RadiusStatus': radiusStatus.value,
      if (vpcSettings != null) 'VpcSettings': vpcSettings,
    };
  }
}

/// Provides information about the Regions that are configured for multi-Region
/// replication.
///
/// @nodoc
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
          ?.nonNulls
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

/// Describes the current hybrid directory configuration settings for a
/// directory.
///
/// @nodoc
class HybridSettingsDescription {
  /// The IP addresses of the DNS servers in your self-managed AD environment.
  final List<String>? selfManagedDnsIpAddrs;

  /// The identifiers of the self-managed instances with SSM used for hybrid
  /// directory operations.
  final List<String>? selfManagedInstanceIds;

  HybridSettingsDescription({
    this.selfManagedDnsIpAddrs,
    this.selfManagedInstanceIds,
  });

  factory HybridSettingsDescription.fromJson(Map<String, dynamic> json) {
    return HybridSettingsDescription(
      selfManagedDnsIpAddrs: (json['SelfManagedDnsIpAddrs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      selfManagedInstanceIds: (json['SelfManagedInstanceIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final selfManagedDnsIpAddrs = this.selfManagedDnsIpAddrs;
    final selfManagedInstanceIds = this.selfManagedInstanceIds;
    return {
      if (selfManagedDnsIpAddrs != null)
        'SelfManagedDnsIpAddrs': selfManagedDnsIpAddrs,
      if (selfManagedInstanceIds != null)
        'SelfManagedInstanceIds': selfManagedInstanceIds,
    };
  }
}

/// Points to a remote domain with which you are setting up a trust
/// relationship. Conditional forwarders are required in order to set up a trust
/// relationship with another domain.
///
/// @nodoc
class ConditionalForwarder {
  /// The IP addresses of the remote DNS server associated with RemoteDomainName.
  /// This is the IP address of the DNS server that your conditional forwarder
  /// points to.
  final List<String>? dnsIpAddrs;

  /// The IPv6 addresses of the remote DNS server associated with
  /// RemoteDomainName. This is the IPv6 address of the DNS server that your
  /// conditional forwarder points to.
  final List<String>? dnsIpv6Addrs;

  /// The fully qualified domain name (FQDN) of the remote domains pointed to by
  /// the conditional forwarder.
  final String? remoteDomainName;

  /// The replication scope of the conditional forwarder. The only allowed value
  /// is <code>Domain</code>, which will replicate the conditional forwarder to
  /// all of the domain controllers for your Amazon Web Services directory.
  final ReplicationScope? replicationScope;

  ConditionalForwarder({
    this.dnsIpAddrs,
    this.dnsIpv6Addrs,
    this.remoteDomainName,
    this.replicationScope,
  });

  factory ConditionalForwarder.fromJson(Map<String, dynamic> json) {
    return ConditionalForwarder(
      dnsIpAddrs: (json['DnsIpAddrs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      dnsIpv6Addrs: (json['DnsIpv6Addrs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      remoteDomainName: json['RemoteDomainName'] as String?,
      replicationScope: (json['ReplicationScope'] as String?)
          ?.let(ReplicationScope.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dnsIpAddrs = this.dnsIpAddrs;
    final dnsIpv6Addrs = this.dnsIpv6Addrs;
    final remoteDomainName = this.remoteDomainName;
    final replicationScope = this.replicationScope;
    return {
      if (dnsIpAddrs != null) 'DnsIpAddrs': dnsIpAddrs,
      if (dnsIpv6Addrs != null) 'DnsIpv6Addrs': dnsIpv6Addrs,
      if (remoteDomainName != null) 'RemoteDomainName': remoteDomainName,
      if (replicationScope != null) 'ReplicationScope': replicationScope.value,
    };
  }
}

/// @nodoc
class ReplicationScope {
  static const domain = ReplicationScope._('Domain');

  final String value;

  const ReplicationScope._(this.value);

  static const values = [domain];

  static ReplicationScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationScope._(value));

  @override
  bool operator ==(other) => other is ReplicationScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a client authentication method for a directory.
///
/// @nodoc
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
      status: (json['Status'] as String?)
          ?.let(ClientAuthenticationStatus.fromString),
      type: (json['Type'] as String?)?.let(ClientAuthenticationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final status = this.status;
    final type = this.type;
    return {
      if (lastUpdatedDateTime != null)
        'LastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (status != null) 'Status': status.value,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class ClientAuthenticationStatus {
  static const enabled = ClientAuthenticationStatus._('Enabled');
  static const disabled = ClientAuthenticationStatus._('Disabled');

  final String value;

  const ClientAuthenticationStatus._(this.value);

  static const values = [enabled, disabled];

  static ClientAuthenticationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClientAuthenticationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ClientAuthenticationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the certificate.
///
/// @nodoc
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
      state: (json['State'] as String?)?.let(CertificateState.fromString),
      stateReason: json['StateReason'] as String?,
      type: (json['Type'] as String?)?.let(CertificateType.fromString),
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
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class CaEnrollmentPolicyStatus {
  static const inProgress = CaEnrollmentPolicyStatus._('InProgress');
  static const success = CaEnrollmentPolicyStatus._('Success');
  static const failed = CaEnrollmentPolicyStatus._('Failed');
  static const disabling = CaEnrollmentPolicyStatus._('Disabling');
  static const disabled = CaEnrollmentPolicyStatus._('Disabled');
  static const impaired = CaEnrollmentPolicyStatus._('Impaired');

  final String value;

  const CaEnrollmentPolicyStatus._(this.value);

  static const values = [
    inProgress,
    success,
    failed,
    disabling,
    disabled,
    impaired
  ];

  static CaEnrollmentPolicyStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CaEnrollmentPolicyStatus._(value));

  @override
  bool operator ==(other) =>
      other is CaEnrollmentPolicyStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about a directory assessment, including
/// configuration parameters, status, and validation results.
///
/// @nodoc
class Assessment {
  /// The unique identifier of the directory assessment.
  final String? assessmentId;

  /// The IP addresses of the DNS servers or domain controllers in your
  /// self-managed AD environment.
  final List<String>? customerDnsIps;

  /// The identifier of the directory associated with this assessment.
  final String? directoryId;

  /// The fully qualified domain name (FQDN) of the Active Directory domain being
  /// assessed.
  final String? dnsName;

  /// The date and time when the assessment status was last updated.
  final DateTime? lastUpdateDateTime;

  /// The type of assessment report generated. Valid values are
  /// <code>CUSTOMER</code> and <code>SYSTEM</code>.
  final String? reportType;

  /// The security groups identifiers attached to the network interfaces.
  final List<String>? securityGroupIds;

  /// The identifiers of the self-managed AD instances used to perform the
  /// assessment.
  final List<String>? selfManagedInstanceIds;

  /// The date and time when the assessment was initiated.
  final DateTime? startTime;

  /// The current status of the assessment. Valid values include
  /// <code>SUCCESS</code>, <code>FAILED</code>, <code>PENDING</code>, and
  /// <code>IN_PROGRESS</code>.
  final String? status;

  /// A detailed status code providing additional information about the assessment
  /// state.
  final String? statusCode;

  /// A human-readable description of the current assessment status, including any
  /// error details or progress information.
  final String? statusReason;

  /// A list of subnet identifiers in the Amazon VPC in which the hybrid directory
  /// is created.
  final List<String>? subnetIds;

  /// The version of the assessment framework used to evaluate your self-managed
  /// AD environment.
  final String? version;

  /// Contains Amazon VPC information for the <code>StartADAssessment</code>
  /// operation.
  final String? vpcId;

  Assessment({
    this.assessmentId,
    this.customerDnsIps,
    this.directoryId,
    this.dnsName,
    this.lastUpdateDateTime,
    this.reportType,
    this.securityGroupIds,
    this.selfManagedInstanceIds,
    this.startTime,
    this.status,
    this.statusCode,
    this.statusReason,
    this.subnetIds,
    this.version,
    this.vpcId,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      assessmentId: json['AssessmentId'] as String?,
      customerDnsIps: (json['CustomerDnsIps'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      directoryId: json['DirectoryId'] as String?,
      dnsName: json['DnsName'] as String?,
      lastUpdateDateTime: timeStampFromJson(json['LastUpdateDateTime']),
      reportType: json['ReportType'] as String?,
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      selfManagedInstanceIds: (json['SelfManagedInstanceIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
      status: json['Status'] as String?,
      statusCode: json['StatusCode'] as String?,
      statusReason: json['StatusReason'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      version: json['Version'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final customerDnsIps = this.customerDnsIps;
    final directoryId = this.directoryId;
    final dnsName = this.dnsName;
    final lastUpdateDateTime = this.lastUpdateDateTime;
    final reportType = this.reportType;
    final securityGroupIds = this.securityGroupIds;
    final selfManagedInstanceIds = this.selfManagedInstanceIds;
    final startTime = this.startTime;
    final status = this.status;
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    final subnetIds = this.subnetIds;
    final version = this.version;
    final vpcId = this.vpcId;
    return {
      if (assessmentId != null) 'AssessmentId': assessmentId,
      if (customerDnsIps != null) 'CustomerDnsIps': customerDnsIps,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (dnsName != null) 'DnsName': dnsName,
      if (lastUpdateDateTime != null)
        'LastUpdateDateTime': unixTimestampToJson(lastUpdateDateTime),
      if (reportType != null) 'ReportType': reportType,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (selfManagedInstanceIds != null)
        'SelfManagedInstanceIds': selfManagedInstanceIds,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status,
      if (statusCode != null) 'StatusCode': statusCode,
      if (statusReason != null) 'StatusReason': statusReason,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (version != null) 'Version': version,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Contains the results of validation tests performed against a specific domain
/// controller during a directory assessment.
///
/// @nodoc
class AssessmentReport {
  /// The IP address of the domain controller that was tested during the
  /// assessment.
  final String? domainControllerIp;

  /// A list of validation results for different test categories performed against
  /// this domain controller.
  final List<AssessmentValidation>? validations;

  AssessmentReport({
    this.domainControllerIp,
    this.validations,
  });

  factory AssessmentReport.fromJson(Map<String, dynamic> json) {
    return AssessmentReport(
      domainControllerIp: json['DomainControllerIp'] as String?,
      validations: (json['Validations'] as List?)
          ?.nonNulls
          .map((e) => AssessmentValidation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainControllerIp = this.domainControllerIp;
    final validations = this.validations;
    return {
      if (domainControllerIp != null) 'DomainControllerIp': domainControllerIp,
      if (validations != null) 'Validations': validations,
    };
  }
}

/// Contains information about a specific validation test performed during a
/// directory assessment.
///
/// @nodoc
class AssessmentValidation {
  /// The category of the validation test.
  final String? category;

  /// The date and time when the validation test was completed or last updated.
  final DateTime? lastUpdateDateTime;

  /// The name of the specific validation test performed within the category.
  final String? name;

  /// The date and time when the validation test was started.
  final DateTime? startTime;

  /// The result status of the validation test. Valid values include
  /// <code>SUCCESS</code>, <code>FAILED</code>, <code>PENDING</code>, and
  /// <code>IN_PROGRESS</code>.
  final String? status;

  /// A detailed status code providing additional information about the validation
  /// result.
  final String? statusCode;

  /// A human-readable description of the validation result, including any error
  /// details or recommendations.
  final String? statusReason;

  AssessmentValidation({
    this.category,
    this.lastUpdateDateTime,
    this.name,
    this.startTime,
    this.status,
    this.statusCode,
    this.statusReason,
  });

  factory AssessmentValidation.fromJson(Map<String, dynamic> json) {
    return AssessmentValidation(
      category: json['Category'] as String?,
      lastUpdateDateTime: timeStampFromJson(json['LastUpdateDateTime']),
      name: json['Name'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: json['Status'] as String?,
      statusCode: json['StatusCode'] as String?,
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final lastUpdateDateTime = this.lastUpdateDateTime;
    final name = this.name;
    final startTime = this.startTime;
    final status = this.status;
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      if (category != null) 'Category': category,
      if (lastUpdateDateTime != null)
        'LastUpdateDateTime': unixTimestampToJson(lastUpdateDateTime),
      if (name != null) 'Name': name,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status,
      if (statusCode != null) 'StatusCode': statusCode,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// Contains information about a computer account in a directory.
///
/// @nodoc
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
          ?.nonNulls
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

/// Represents a named directory attribute.
///
/// @nodoc
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

/// Contains connection settings for creating an AD Connector with the
/// <a>ConnectDirectory</a> action.
///
/// @nodoc
class DirectoryConnectSettings {
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

  /// The IP addresses of DNS servers or domain controllers in your self-managed
  /// directory.
  final List<String>? customerDnsIps;

  /// The IPv6 addresses of DNS servers or domain controllers in your self-managed
  /// directory.
  final List<String>? customerDnsIpsV6;

  DirectoryConnectSettings({
    required this.customerUserName,
    required this.subnetIds,
    required this.vpcId,
    this.customerDnsIps,
    this.customerDnsIpsV6,
  });

  Map<String, dynamic> toJson() {
    final customerUserName = this.customerUserName;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final customerDnsIps = this.customerDnsIps;
    final customerDnsIpsV6 = this.customerDnsIpsV6;
    return {
      'CustomerUserName': customerUserName,
      'SubnetIds': subnetIds,
      'VpcId': vpcId,
      if (customerDnsIps != null) 'CustomerDnsIps': customerDnsIps,
      if (customerDnsIpsV6 != null) 'CustomerDnsIpsV6': customerDnsIpsV6,
    };
  }
}

/// Contains the IP address block. This is often the address block of the DNS
/// server used for your self-managed domain.
///
/// @nodoc
class IpRoute {
  /// IP address block in CIDR format, such as 10.0.0.0/24. This is often the
  /// address block of the DNS server used for your self-managed domain. For a
  /// single IP address, use a CIDR address block with /32. For example,
  /// 10.0.0.0/32.
  final String? cidrIp;

  /// IPv6 address block in CIDR format, such as 2001:db8::/32. This is often the
  /// address block of the DNS server used for your self-managed domain. For a
  /// single IPv6 address, use a CIDR address block with /128. For example,
  /// 2001:db8::1/128.
  final String? cidrIpv6;

  /// Description of the address block.
  final String? description;

  IpRoute({
    this.cidrIp,
    this.cidrIpv6,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final cidrIp = this.cidrIp;
    final cidrIpv6 = this.cidrIpv6;
    final description = this.description;
    return {
      if (cidrIp != null) 'CidrIp': cidrIp,
      if (cidrIpv6 != null) 'CidrIpv6': cidrIpv6,
      if (description != null) 'Description': description,
    };
  }
}

/// @nodoc
class ADAssessmentLimitExceededException extends _s.GenericAwsException {
  ADAssessmentLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ADAssessmentLimitExceededException',
            message: message);
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class AuthenticationFailedException extends _s.GenericAwsException {
  AuthenticationFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'AuthenticationFailedException',
            message: message);
}

/// @nodoc
class CertificateAlreadyExistsException extends _s.GenericAwsException {
  CertificateAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'CertificateAlreadyExistsException',
            message: message);
}

/// @nodoc
class CertificateDoesNotExistException extends _s.GenericAwsException {
  CertificateDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'CertificateDoesNotExistException',
            message: message);
}

/// @nodoc
class CertificateInUseException extends _s.GenericAwsException {
  CertificateInUseException({String? type, String? message})
      : super(type: type, code: 'CertificateInUseException', message: message);
}

/// @nodoc
class CertificateLimitExceededException extends _s.GenericAwsException {
  CertificateLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CertificateLimitExceededException',
            message: message);
}

/// @nodoc
class ClientException extends _s.GenericAwsException {
  ClientException({String? type, String? message})
      : super(type: type, code: 'ClientException', message: message);
}

/// @nodoc
class DirectoryAlreadyInRegionException extends _s.GenericAwsException {
  DirectoryAlreadyInRegionException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryAlreadyInRegionException',
            message: message);
}

/// @nodoc
class DirectoryAlreadySharedException extends _s.GenericAwsException {
  DirectoryAlreadySharedException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryAlreadySharedException',
            message: message);
}

/// @nodoc
class DirectoryDoesNotExistException extends _s.GenericAwsException {
  DirectoryDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryDoesNotExistException',
            message: message);
}

/// @nodoc
class DirectoryInDesiredStateException extends _s.GenericAwsException {
  DirectoryInDesiredStateException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryInDesiredStateException',
            message: message);
}

/// @nodoc
class DirectoryLimitExceededException extends _s.GenericAwsException {
  DirectoryLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryLimitExceededException',
            message: message);
}

/// @nodoc
class DirectoryNotSharedException extends _s.GenericAwsException {
  DirectoryNotSharedException({String? type, String? message})
      : super(
            type: type, code: 'DirectoryNotSharedException', message: message);
}

/// @nodoc
class DirectoryUnavailableException extends _s.GenericAwsException {
  DirectoryUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryUnavailableException',
            message: message);
}

/// @nodoc
class DisableAlreadyInProgressException extends _s.GenericAwsException {
  DisableAlreadyInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'DisableAlreadyInProgressException',
            message: message);
}

/// @nodoc
class DomainControllerLimitExceededException extends _s.GenericAwsException {
  DomainControllerLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DomainControllerLimitExceededException',
            message: message);
}

/// @nodoc
class EnableAlreadyInProgressException extends _s.GenericAwsException {
  EnableAlreadyInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'EnableAlreadyInProgressException',
            message: message);
}

/// @nodoc
class EntityAlreadyExistsException extends _s.GenericAwsException {
  EntityAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'EntityAlreadyExistsException', message: message);
}

/// @nodoc
class EntityDoesNotExistException extends _s.GenericAwsException {
  EntityDoesNotExistException({String? type, String? message})
      : super(
            type: type, code: 'EntityDoesNotExistException', message: message);
}

/// @nodoc
class IncompatibleSettingsException extends _s.GenericAwsException {
  IncompatibleSettingsException({String? type, String? message})
      : super(
            type: type,
            code: 'IncompatibleSettingsException',
            message: message);
}

/// @nodoc
class InsufficientPermissionsException extends _s.GenericAwsException {
  InsufficientPermissionsException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientPermissionsException',
            message: message);
}

/// @nodoc
class InvalidCertificateException extends _s.GenericAwsException {
  InvalidCertificateException({String? type, String? message})
      : super(
            type: type, code: 'InvalidCertificateException', message: message);
}

/// @nodoc
class InvalidClientAuthStatusException extends _s.GenericAwsException {
  InvalidClientAuthStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClientAuthStatusException',
            message: message);
}

/// @nodoc
class InvalidLDAPSStatusException extends _s.GenericAwsException {
  InvalidLDAPSStatusException({String? type, String? message})
      : super(
            type: type, code: 'InvalidLDAPSStatusException', message: message);
}

/// @nodoc
class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

/// @nodoc
class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

/// @nodoc
class InvalidPasswordException extends _s.GenericAwsException {
  InvalidPasswordException({String? type, String? message})
      : super(type: type, code: 'InvalidPasswordException', message: message);
}

/// @nodoc
class InvalidTargetException extends _s.GenericAwsException {
  InvalidTargetException({String? type, String? message})
      : super(type: type, code: 'InvalidTargetException', message: message);
}

/// @nodoc
class IpRouteLimitExceededException extends _s.GenericAwsException {
  IpRouteLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'IpRouteLimitExceededException',
            message: message);
}

/// @nodoc
class NoAvailableCertificateException extends _s.GenericAwsException {
  NoAvailableCertificateException({String? type, String? message})
      : super(
            type: type,
            code: 'NoAvailableCertificateException',
            message: message);
}

/// @nodoc
class OrganizationsException extends _s.GenericAwsException {
  OrganizationsException({String? type, String? message})
      : super(type: type, code: 'OrganizationsException', message: message);
}

/// @nodoc
class RegionLimitExceededException extends _s.GenericAwsException {
  RegionLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'RegionLimitExceededException', message: message);
}

/// @nodoc
class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

/// @nodoc
class ShareLimitExceededException extends _s.GenericAwsException {
  ShareLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'ShareLimitExceededException', message: message);
}

/// @nodoc
class SnapshotLimitExceededException extends _s.GenericAwsException {
  SnapshotLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'SnapshotLimitExceededException',
            message: message);
}

/// @nodoc
class TagLimitExceededException extends _s.GenericAwsException {
  TagLimitExceededException({String? type, String? message})
      : super(type: type, code: 'TagLimitExceededException', message: message);
}

/// @nodoc
class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

/// @nodoc
class UnsupportedSettingsException extends _s.GenericAwsException {
  UnsupportedSettingsException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedSettingsException', message: message);
}

/// @nodoc
class UserDoesNotExistException extends _s.GenericAwsException {
  UserDoesNotExistException({String? type, String? message})
      : super(type: type, code: 'UserDoesNotExistException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ADAssessmentLimitExceededException': (type, message) =>
      ADAssessmentLimitExceededException(type: type, message: message),
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
  'DisableAlreadyInProgressException': (type, message) =>
      DisableAlreadyInProgressException(type: type, message: message),
  'DomainControllerLimitExceededException': (type, message) =>
      DomainControllerLimitExceededException(type: type, message: message),
  'EnableAlreadyInProgressException': (type, message) =>
      EnableAlreadyInProgressException(type: type, message: message),
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
