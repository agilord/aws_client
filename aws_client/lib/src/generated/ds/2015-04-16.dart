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

part '2015-04-16.g.dart';

/// AWS Directory Service is a web service that makes it easy for you to setup
/// and run directories in the AWS cloud, or connect your AWS resources with an
/// existing on-premises Microsoft Active Directory. This guide provides
/// detailed information about AWS Directory Service operations, data types,
/// parameters, and errors. For information about AWS Directory Services
/// features, see <a href="https://aws.amazon.com/directoryservice/">AWS
/// Directory Service</a> and the <a
/// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/what_is.html">AWS
/// Directory Service Administration Guide</a>.
/// <note>
/// AWS provides SDKs that consist of libraries and sample code for various
/// programming languages and platforms (Java, Ruby, .Net, iOS, Android, etc.).
/// The SDKs provide a convenient way to create programmatic access to AWS
/// Directory Service and other AWS services. For more information about the AWS
/// SDKs, including how to download and install them, see <a
/// href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>.
/// </note>
class Directory {
  final _s.JsonProtocol _protocol;
  Directory({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ds',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String sharedDirectoryId,
  }) async {
    ArgumentError.checkNotNull(sharedDirectoryId, 'sharedDirectoryId');
    _s.validateStringPattern(
      'sharedDirectoryId',
      sharedDirectoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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

  /// If the DNS server for your on-premises domain uses a publicly addressable
  /// IP address, you must add a CIDR address block to correctly route traffic
  /// to and from your Microsoft AD on Amazon Web Services. <i>AddIpRoutes</i>
  /// adds this address block. You can also use <i>AddIpRoutes</i> to facilitate
  /// routing traffic that uses public IP ranges from your Microsoft AD on AWS
  /// to a peer VPC.
  ///
  /// Before you call <i>AddIpRoutes</i>, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the <i>AddIpRoutes</i>
  /// operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">AWS
  /// Directory Service API Permissions: Actions, Resources, and Conditions
  /// Reference</a>.
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
  /// often the IP address block of the DNS server used for your on-premises
  /// domain.
  ///
  /// Parameter [updateSecurityGroupForDirectoryControllers] :
  /// If set to true, updates the inbound and outbound rules of the security
  /// group that has the description: "AWS created security group for
  /// <i>directory ID</i> directory controllers." Following are the new rules:
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
    @_s.required String directoryId,
    @_s.required List<IpRoute> ipRoutes,
    bool updateSecurityGroupForDirectoryControllers,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(ipRoutes, 'ipRoutes');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.AddIpRoutes'
    };
    final jsonResponse = await _protocol.send(
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

    return AddIpRoutesResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
    @_s.required String regionName,
    @_s.required DirectoryVpcSettings vPCSettings,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(regionName, 'regionName');
    _s.validateStringLength(
      'regionName',
      regionName,
      8,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vPCSettings, 'vPCSettings');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.AddRegion'
    };
    final jsonResponse = await _protocol.send(
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

    return AddRegionResult.fromJson(jsonResponse.body);
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
    @_s.required String resourceId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^[d]-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.AddTagsToResource'
    };
    final jsonResponse = await _protocol.send(
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

    return AddTagsToResourceResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
    @_s.required String schemaExtensionId,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaExtensionId, 'schemaExtensionId');
    _s.validateStringPattern(
      'schemaExtensionId',
      schemaExtensionId,
      r'''^e-[0-9a-f]{10}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CancelSchemaExtension'
    };
    final jsonResponse = await _protocol.send(
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

    return CancelSchemaExtensionResult.fromJson(jsonResponse.body);
  }

  /// Creates an AD Connector to connect to an on-premises directory.
  ///
  /// Before you call <code>ConnectDirectory</code>, ensure that all of the
  /// required permissions have been explicitly granted through a policy. For
  /// details about what permissions are required to run the
  /// <code>ConnectDirectory</code> operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">AWS
  /// Directory Service API Permissions: Actions, Resources, and Conditions
  /// Reference</a>.
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
  /// The fully qualified name of the on-premises directory, such as
  /// <code>corp.example.com</code>.
  ///
  /// Parameter [password] :
  /// The password for the on-premises user account.
  ///
  /// Parameter [size] :
  /// The size of the directory.
  ///
  /// Parameter [description] :
  /// A description for the directory.
  ///
  /// Parameter [shortName] :
  /// The NetBIOS name of the on-premises directory, such as <code>CORP</code>.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to AD Connector.
  Future<ConnectDirectoryResult> connectDirectory({
    @_s.required DirectoryConnectSettings connectSettings,
    @_s.required String name,
    @_s.required String password,
    @_s.required DirectorySize size,
    String description,
    String shortName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(connectSettings, 'connectSettings');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^([a-zA-Z0-9]+[\\.-])+([a-zA-Z0-9])+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(size, 'size');
    _s.validateStringLength(
      'description',
      description,
      0,
      128,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^([a-zA-Z0-9_])[\\a-zA-Z0-9_@#%*+=:?./!\s-]*$''',
    );
    _s.validateStringPattern(
      'shortName',
      shortName,
      r'''^[^\\/:*?"<>|.]+[^\\/:*?"<>|]*$''',
    );
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
        'Size': size?.toValue() ?? '',
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
  /// The alias must be unique amongst all aliases in AWS. This operation throws
  /// an <code>EntityAlreadyExistsException</code> error if the alias already
  /// exists.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory for which to create the alias.
  Future<CreateAliasResult> createAlias({
    @_s.required String alias,
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(alias, 'alias');
    _s.validateStringLength(
      'alias',
      alias,
      1,
      62,
      isRequired: true,
    );
    _s.validateStringPattern(
      'alias',
      alias,
      r'''^(?!d-)([\da-zA-Z]+)([-]*[\da-zA-Z])*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required String computerName,
    @_s.required String directoryId,
    @_s.required String password,
    List<Attribute> computerAttributes,
    String organizationalUnitDistinguishedName,
  }) async {
    ArgumentError.checkNotNull(computerName, 'computerName');
    _s.validateStringLength(
      'computerName',
      computerName,
      1,
      15,
      isRequired: true,
    );
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      8,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'organizationalUnitDistinguishedName',
      organizationalUnitDistinguishedName,
      1,
      2000,
    );
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

  /// Creates a conditional forwarder associated with your AWS directory.
  /// Conditional forwarders are required in order to set up a trust
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
  /// The directory ID of the AWS directory for which you are creating the
  /// conditional forwarder.
  ///
  /// Parameter [dnsIpAddrs] :
  /// The IP addresses of the remote DNS server associated with
  /// RemoteDomainName.
  ///
  /// Parameter [remoteDomainName] :
  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// will set up a trust relationship.
  Future<void> createConditionalForwarder({
    @_s.required String directoryId,
    @_s.required List<String> dnsIpAddrs,
    @_s.required String remoteDomainName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dnsIpAddrs, 'dnsIpAddrs');
    ArgumentError.checkNotNull(remoteDomainName, 'remoteDomainName');
    _s.validateStringPattern(
      'remoteDomainName',
      remoteDomainName,
      r'''^([a-zA-Z0-9]+[\\.-])+([a-zA-Z0-9])+[.]?$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateConditionalForwarder'
    };
    final jsonResponse = await _protocol.send(
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

    return CreateConditionalForwarderResult.fromJson(jsonResponse.body);
  }

  /// Creates a Simple AD directory. For more information, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_simple_ad.html">Simple
  /// Active Directory</a> in the <i>AWS Directory Service Admin Guide</i>.
  ///
  /// Before you call <code>CreateDirectory</code>, ensure that all of the
  /// required permissions have been explicitly granted through a policy. For
  /// details about what permissions are required to run the
  /// <code>CreateDirectory</code> operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">AWS
  /// Directory Service API Permissions: Actions, Resources, and Conditions
  /// Reference</a>.
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
    @_s.required String name,
    @_s.required String password,
    @_s.required DirectorySize size,
    String description,
    String shortName,
    List<Tag> tags,
    DirectoryVpcSettings vpcSettings,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^([a-zA-Z0-9]+[\\.-])+([a-zA-Z0-9])+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringPattern(
      'password',
      password,
      r'''(?=^.{8,64}$)((?=.*\d)(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[^A-Za-z0-9\s])(?=.*[a-z])|(?=.*[^A-Za-z0-9\s])(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9\s]))^.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(size, 'size');
    _s.validateStringLength(
      'description',
      description,
      0,
      128,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^([a-zA-Z0-9_])[\\a-zA-Z0-9_@#%*+=:?./!\s-]*$''',
    );
    _s.validateStringPattern(
      'shortName',
      shortName,
      r'''^[^\\/:*?"<>|.]+[^\\/:*?"<>|]*$''',
    );
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
        'Size': size?.toValue() ?? '',
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
  /// your AWS account.
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
    @_s.required String directoryId,
    @_s.required String logGroupName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[-._/#A-Za-z0-9]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.CreateLogSubscription'
    };
    final jsonResponse = await _protocol.send(
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

    return CreateLogSubscriptionResult.fromJson(jsonResponse.body);
  }

  /// Creates a Microsoft AD directory in the AWS Cloud. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html">AWS
  /// Managed Microsoft AD</a> in the <i>AWS Directory Service Admin Guide</i>.
  ///
  /// Before you call <i>CreateMicrosoftAD</i>, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the <i>CreateMicrosoftAD</i>
  /// operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">AWS
  /// Directory Service API Permissions: Actions, Resources, and Conditions
  /// Reference</a>.
  ///
  /// May throw [DirectoryLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [name] :
  /// The fully qualified domain name for the AWS Managed Microsoft AD
  /// directory, such as <code>corp.example.com</code>. This name will resolve
  /// inside your VPC only. It does not need to be publicly resolvable.
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
  /// A description for the directory. This label will appear on the AWS console
  /// <code>Directory Details</code> page after the directory is created.
  ///
  /// Parameter [edition] :
  /// AWS Managed Microsoft AD is available in two editions:
  /// <code>Standard</code> and <code>Enterprise</code>. <code>Enterprise</code>
  /// is the default.
  ///
  /// Parameter [shortName] :
  /// The NetBIOS name for your domain, such as <code>CORP</code>. If you don't
  /// specify a NetBIOS name, it will default to the first part of your
  /// directory DNS. For example, <code>CORP</code> for the directory DNS
  /// <code>corp.example.com</code>.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the AWS Managed Microsoft AD directory.
  Future<CreateMicrosoftADResult> createMicrosoftAD({
    @_s.required String name,
    @_s.required String password,
    @_s.required DirectoryVpcSettings vpcSettings,
    String description,
    DirectoryEdition edition,
    String shortName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^([a-zA-Z0-9]+[\\.-])+([a-zA-Z0-9])+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringPattern(
      'password',
      password,
      r'''(?=^.{8,64}$)((?=.*\d)(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[^A-Za-z0-9\s])(?=.*[a-z])|(?=.*[^A-Za-z0-9\s])(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9\s]))^.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(vpcSettings, 'vpcSettings');
    _s.validateStringLength(
      'description',
      description,
      0,
      128,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^([a-zA-Z0-9_])[\\a-zA-Z0-9_@#%*+=:?./!\s-]*$''',
    );
    _s.validateStringPattern(
      'shortName',
      shortName,
      r'''^[^\\/:*?"<>|.]+[^\\/:*?"<>|]*$''',
    );
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

  /// Creates a snapshot of a Simple AD or Microsoft AD directory in the AWS
  /// cloud.
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
    @_s.required String directoryId,
    String name,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([a-zA-Z0-9_])[\\a-zA-Z0-9_@#%*+=:?./!\s-]*$''',
    );
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

  /// AWS Directory Service for Microsoft Active Directory allows you to
  /// configure trust relationships. For example, you can establish a trust
  /// between your AWS Managed Microsoft AD directory, and your existing
  /// on-premises Microsoft Active Directory. This would allow you to provide
  /// users and groups access to resources in either domain, with a single set
  /// of credentials.
  ///
  /// This action initiates the creation of the AWS side of a trust relationship
  /// between an AWS Managed Microsoft AD directory and an external domain. You
  /// can create either a forest trust or an external trust.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [directoryId] :
  /// The Directory ID of the AWS Managed Microsoft AD directory for which to
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
    @_s.required String directoryId,
    @_s.required String remoteDomainName,
    @_s.required TrustDirection trustDirection,
    @_s.required String trustPassword,
    List<String> conditionalForwarderIpAddrs,
    SelectiveAuth selectiveAuth,
    TrustType trustType,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(remoteDomainName, 'remoteDomainName');
    _s.validateStringPattern(
      'remoteDomainName',
      remoteDomainName,
      r'''^([a-zA-Z0-9]+[\\.-])+([a-zA-Z0-9])+[.]?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(trustDirection, 'trustDirection');
    ArgumentError.checkNotNull(trustPassword, 'trustPassword');
    _s.validateStringLength(
      'trustPassword',
      trustPassword,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trustPassword',
      trustPassword,
      r'''(.|\s)*\S(.|\s)*''',
      isRequired: true,
    );
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
        'TrustDirection': trustDirection?.toValue() ?? '',
        'TrustPassword': trustPassword,
        if (conditionalForwarderIpAddrs != null)
          'ConditionalForwarderIpAddrs': conditionalForwarderIpAddrs,
        if (selectiveAuth != null) 'SelectiveAuth': selectiveAuth.toValue(),
        if (trustType != null) 'TrustType': trustType.toValue(),
      },
    );

    return CreateTrustResult.fromJson(jsonResponse.body);
  }

  /// Deletes a conditional forwarder that has been set up for your AWS
  /// directory.
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
    @_s.required String directoryId,
    @_s.required String remoteDomainName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(remoteDomainName, 'remoteDomainName');
    _s.validateStringPattern(
      'remoteDomainName',
      remoteDomainName,
      r'''^([a-zA-Z0-9]+[\\.-])+([a-zA-Z0-9])+[.]?$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeleteConditionalForwarder'
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
      },
    );

    return DeleteConditionalForwarderResult.fromJson(jsonResponse.body);
  }

  /// Deletes an AWS Directory Service directory.
  ///
  /// Before you call <code>DeleteDirectory</code>, ensure that all of the
  /// required permissions have been explicitly granted through a policy. For
  /// details about what permissions are required to run the
  /// <code>DeleteDirectory</code> operation, see <a
  /// href="http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html">AWS
  /// Directory Service API Permissions: Actions, Resources, and Conditions
  /// Reference</a>.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory to delete.
  Future<DeleteDirectoryResult> deleteDirectory({
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeleteLogSubscription'
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

    return DeleteLogSubscriptionResult.fromJson(jsonResponse.body);
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
    @_s.required String snapshotId,
  }) async {
    ArgumentError.checkNotNull(snapshotId, 'snapshotId');
    _s.validateStringPattern(
      'snapshotId',
      snapshotId,
      r'''^s-[0-9a-f]{10}$''',
      isRequired: true,
    );
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

  /// Deletes an existing trust relationship between your AWS Managed Microsoft
  /// AD directory and an external domain.
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
    @_s.required String trustId,
    bool deleteAssociatedConditionalForwarder,
  }) async {
    ArgumentError.checkNotNull(trustId, 'trustId');
    _s.validateStringPattern(
      'trustId',
      trustId,
      r'''^t-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required String certificateId,
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''^c-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeregisterCertificate'
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

    return DeregisterCertificateResult.fromJson(jsonResponse.body);
  }

  /// Removes the specified directory as a publisher to the specified SNS topic.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The Directory ID to remove as a publisher. This directory will no longer
  /// send messages to the specified SNS topic.
  ///
  /// Parameter [topicName] :
  /// The name of the SNS topic from which to remove the directory as a
  /// publisher.
  Future<void> deregisterEventTopic({
    @_s.required String directoryId,
    @_s.required String topicName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(topicName, 'topicName');
    _s.validateStringLength(
      'topicName',
      topicName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'topicName',
      topicName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DeregisterEventTopic'
    };
    final jsonResponse = await _protocol.send(
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

    return DeregisterEventTopicResult.fromJson(jsonResponse.body);
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
    @_s.required String certificateId,
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''^c-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required String directoryId,
    List<String> remoteDomainNames,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    List<String> directoryIds,
    int limit,
    String nextToken,
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
    @_s.required String directoryId,
    List<String> domainControllerIds,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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

  /// Obtains information about which SNS topics receive status messages from
  /// the specified directory.
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
  /// The Directory ID for which to get the list of associated SNS topics. If
  /// this member is null, associations for all Directory IDs are returned.
  ///
  /// Parameter [topicNames] :
  /// A list of SNS topic names for which to obtain the information. If this
  /// member is null, all associations for the specified Directory ID are
  /// returned.
  ///
  /// An empty list results in an <code>InvalidParameterException</code> being
  /// thrown.
  Future<DescribeEventTopicsResult> describeEventTopics({
    String directoryId,
    List<String> topicNames,
  }) async {
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
    );
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
    @_s.required String directoryId,
    int limit,
    String nextToken,
    LDAPSType type,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required String directoryId,
    String nextToken,
    String regionName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'regionName',
      regionName,
      8,
      32,
    );
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
    @_s.required String ownerDirectoryId,
    int limit,
    String nextToken,
    List<String> sharedDirectoryIds,
  }) async {
    ArgumentError.checkNotNull(ownerDirectoryId, 'ownerDirectoryId');
    _s.validateStringPattern(
      'ownerDirectoryId',
      ownerDirectoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    String directoryId,
    int limit,
    String nextToken,
    List<String> snapshotIds,
  }) async {
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
    );
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
  /// The Directory ID of the AWS directory that is a part of the requested
  /// trust relationship.
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
    String directoryId,
    int limit,
    String nextToken,
    List<String> trustIds,
  }) async {
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
    );
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
    @_s.required String directoryId,
    @_s.required ClientAuthenticationType type,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableClientAuthentication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'Type': type?.toValue() ?? '',
      },
    );

    return DisableClientAuthenticationResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
    @_s.required LDAPSType type,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableLDAPS'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'Type': type?.toValue() ?? '',
      },
    );

    return DisableLDAPSResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableRadius'
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

    return DisableRadiusResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
    String password,
    String userName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'password',
      password,
      1,
      128,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[a-zA-Z0-9._-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.DisableSso'
    };
    final jsonResponse = await _protocol.send(
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

    return DisableSsoResult.fromJson(jsonResponse.body);
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
  /// Service User to the LDAP service in the on-premises AD.
  Future<void> enableClientAuthentication({
    @_s.required String directoryId,
    @_s.required ClientAuthenticationType type,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableClientAuthentication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'Type': type?.toValue() ?? '',
      },
    );

    return EnableClientAuthenticationResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
    @_s.required LDAPSType type,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableLDAPS'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'Type': type?.toValue() ?? '',
      },
    );

    return EnableLDAPSResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
    @_s.required RadiusSettings radiusSettings,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(radiusSettings, 'radiusSettings');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableRadius'
    };
    final jsonResponse = await _protocol.send(
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

    return EnableRadiusResult.fromJson(jsonResponse.body);
  }

  /// Enables single sign-on for a directory. Single sign-on allows users in
  /// your directory to access certain AWS services from a computer joined to
  /// the directory without having to enter their credentials separately.
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
    @_s.required String directoryId,
    String password,
    String userName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'password',
      password,
      1,
      128,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[a-zA-Z0-9._-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.EnableSso'
    };
    final jsonResponse = await _protocol.send(
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

    return EnableSsoResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required String directoryId,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required String directoryId,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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

  /// Lists the active log subscriptions for the AWS account.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// If a <i>DirectoryID</i> is provided, lists only the log subscription
  /// associated with that directory. If no <i>DirectoryId</i> is provided,
  /// lists all log subscriptions associated with your AWS account. If there are
  /// no log subscriptions for the AWS account or the directory, an empty list
  /// will be returned.
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return.
  Future<ListLogSubscriptionsResult> listLogSubscriptions({
    String directoryId,
    int limit,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
    );
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
    @_s.required String directoryId,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required String resourceId,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^[d]-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required String certificateData,
    @_s.required String directoryId,
    ClientCertAuthSettings clientCertAuthSettings,
    CertificateType type,
  }) async {
    ArgumentError.checkNotNull(certificateData, 'certificateData');
    _s.validateStringLength(
      'certificateData',
      certificateData,
      1,
      8192,
      isRequired: true,
    );
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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

  /// Associates a directory with an SNS topic. This establishes the directory
  /// as a publisher to the specified SNS topic. You can then receive email or
  /// text (SMS) messages when the status of your directory changes. You get
  /// notified if your directory goes from an Active status to an Impaired or
  /// Inoperable status. You also receive a notification when the directory
  /// returns to an Active status.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The Directory ID that will publish status messages to the SNS topic.
  ///
  /// Parameter [topicName] :
  /// The SNS topic name to which the directory will publish status messages.
  /// This SNS topic must be in the same region as the specified Directory ID.
  Future<void> registerEventTopic({
    @_s.required String directoryId,
    @_s.required String topicName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(topicName, 'topicName');
    _s.validateStringLength(
      'topicName',
      topicName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'topicName',
      topicName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RegisterEventTopic'
    };
    final jsonResponse = await _protocol.send(
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

    return RegisterEventTopicResult.fromJson(jsonResponse.body);
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
    @_s.required String sharedDirectoryId,
  }) async {
    ArgumentError.checkNotNull(sharedDirectoryId, 'sharedDirectoryId');
    _s.validateStringPattern(
      'sharedDirectoryId',
      sharedDirectoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
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
    @_s.required List<String> cidrIps,
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(cidrIps, 'cidrIps');
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RemoveIpRoutes'
    };
    final jsonResponse = await _protocol.send(
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

    return RemoveIpRoutesResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RemoveRegion'
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

    return RemoveRegionResult.fromJson(jsonResponse.body);
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
    @_s.required String resourceId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^[d]-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RemoveTagsFromResource'
    };
    final jsonResponse = await _protocol.send(
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

    return RemoveTagsFromResourceResult.fromJson(jsonResponse.body);
  }

  /// Resets the password for any user in your AWS Managed Microsoft AD or
  /// Simple AD directory.
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
  /// For AWS Managed Microsoft AD, you can only reset the password for a user
  /// that is in an OU based off of the NetBIOS name that you typed when you
  /// created your directory. For example, you cannot reset the password for a
  /// user in the <b>AWS Reserved</b> OU. For more information about the OU
  /// structure for an AWS Managed Microsoft AD directory, see <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_getting_started_what_gets_created.html">What
  /// Gets Created</a> in the <i>AWS Directory Service Administration Guide</i>.
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
  /// Identifier of the AWS Managed Microsoft AD or Simple AD directory in which
  /// the user resides.
  ///
  /// Parameter [newPassword] :
  /// The new password that will be reset.
  ///
  /// Parameter [userName] :
  /// The user name of the user whose password will be reset.
  Future<void> resetUserPassword({
    @_s.required String directoryId,
    @_s.required String newPassword,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(newPassword, 'newPassword');
    _s.validateStringLength(
      'newPassword',
      newPassword,
      1,
      127,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''^(?!.*\\|.*"|.*\/|.*\[|.*\]|.*:|.*;|.*\||.*=|.*,|.*\+|.*\*|.*\?|.*<|.*>|.*@).*$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.ResetUserPassword'
    };
    final jsonResponse = await _protocol.send(
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

    return ResetUserPasswordResult.fromJson(jsonResponse.body);
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
    @_s.required String snapshotId,
  }) async {
    ArgumentError.checkNotNull(snapshotId, 'snapshotId');
    _s.validateStringPattern(
      'snapshotId',
      snapshotId,
      r'''^s-[0-9a-f]{10}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.RestoreFromSnapshot'
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

    return RestoreFromSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Shares a specified directory (<code>DirectoryId</code>) in your AWS
  /// account (directory owner) with another AWS account (directory consumer).
  /// With this operation you can use your directory from any AWS account and
  /// from any Amazon VPC within an AWS Region.
  ///
  /// When you share your AWS Managed Microsoft AD directory, AWS Directory
  /// Service creates a shared directory in the directory consumer account. This
  /// shared directory contains the metadata to provide access to the directory
  /// within the directory owner account. The shared directory is visible in all
  /// VPCs in the directory consumer account.
  ///
  /// The <code>ShareMethod</code> parameter determines whether the specified
  /// directory can be shared between AWS accounts inside the same AWS
  /// organization (<code>ORGANIZATIONS</code>). It also determines whether you
  /// can share the directory with any other AWS account either inside or
  /// outside of the organization (<code>HANDSHAKE</code>).
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
  /// Identifier of the AWS Managed Microsoft AD directory that you want to
  /// share with other AWS accounts.
  ///
  /// Parameter [shareMethod] :
  /// The method used when sharing a directory to determine whether the
  /// directory should be shared within your AWS organization
  /// (<code>ORGANIZATIONS</code>) or with any AWS account by sending a
  /// directory sharing request (<code>HANDSHAKE</code>).
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
    @_s.required String directoryId,
    @_s.required ShareMethod shareMethod,
    @_s.required ShareTarget shareTarget,
    String shareNotes,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(shareMethod, 'shareMethod');
    ArgumentError.checkNotNull(shareTarget, 'shareTarget');
    _s.validateStringLength(
      'shareNotes',
      shareNotes,
      0,
      1024,
    );
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
        'ShareMethod': shareMethod?.toValue() ?? '',
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
    @_s.required bool createSnapshotBeforeSchemaExtension,
    @_s.required String description,
    @_s.required String directoryId,
    @_s.required String ldifContent,
  }) async {
    ArgumentError.checkNotNull(createSnapshotBeforeSchemaExtension,
        'createSnapshotBeforeSchemaExtension');
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^([a-zA-Z0-9_])[\\a-zA-Z0-9_@#%*+=:?./!\s-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(ldifContent, 'ldifContent');
    _s.validateStringLength(
      'ldifContent',
      ldifContent,
      1,
      500000,
      isRequired: true,
    );
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
  /// The identifier of the AWS Managed Microsoft AD directory that you want to
  /// stop sharing.
  ///
  /// Parameter [unshareTarget] :
  /// Identifier for the directory consumer account with whom the directory has
  /// to be unshared.
  Future<UnshareDirectoryResult> unshareDirectory({
    @_s.required String directoryId,
    @_s.required UnshareTarget unshareTarget,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(unshareTarget, 'unshareTarget');
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

  /// Updates a conditional forwarder that has been set up for your AWS
  /// directory.
  ///
  /// May throw [EntityDoesNotExistException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ClientException].
  /// May throw [ServiceException].
  ///
  /// Parameter [directoryId] :
  /// The directory ID of the AWS directory for which to update the conditional
  /// forwarder.
  ///
  /// Parameter [dnsIpAddrs] :
  /// The updated IP addresses of the remote DNS server associated with the
  /// conditional forwarder.
  ///
  /// Parameter [remoteDomainName] :
  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// will set up a trust relationship.
  Future<void> updateConditionalForwarder({
    @_s.required String directoryId,
    @_s.required List<String> dnsIpAddrs,
    @_s.required String remoteDomainName,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dnsIpAddrs, 'dnsIpAddrs');
    ArgumentError.checkNotNull(remoteDomainName, 'remoteDomainName');
    _s.validateStringPattern(
      'remoteDomainName',
      remoteDomainName,
      r'''^([a-zA-Z0-9]+[\\.-])+([a-zA-Z0-9])+[.]?$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.UpdateConditionalForwarder'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateConditionalForwarderResult.fromJson(jsonResponse.body);
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
    @_s.required int desiredNumber,
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(desiredNumber, 'desiredNumber');
    _s.validateNumRange(
      'desiredNumber',
      desiredNumber,
      2,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'DirectoryService_20150416.UpdateNumberOfDomainControllers'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateNumberOfDomainControllersResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
    @_s.required RadiusSettings radiusSettings,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(radiusSettings, 'radiusSettings');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DirectoryService_20150416.UpdateRadius'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateRadiusResult.fromJson(jsonResponse.body);
  }

  /// Updates the trust that has been set up between your AWS Managed Microsoft
  /// AD directory and an on-premises Active Directory.
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
    @_s.required String trustId,
    SelectiveAuth selectiveAuth,
  }) async {
    ArgumentError.checkNotNull(trustId, 'trustId');
    _s.validateStringPattern(
      'trustId',
      trustId,
      r'''^t-[0-9a-f]{10}$''',
      isRequired: true,
    );
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

  /// AWS Directory Service for Microsoft Active Directory allows you to
  /// configure and verify trust relationships.
  ///
  /// This action verifies a trust relationship between your AWS Managed
  /// Microsoft AD directory and an external domain.
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
    @_s.required String trustId,
  }) async {
    ArgumentError.checkNotNull(trustId, 'trustId');
    _s.validateStringPattern(
      'trustId',
      trustId,
      r'''^t-[0-9a-f]{10}$''',
      isRequired: true,
    );
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptSharedDirectoryResult {
  /// The shared directory in the directory consumer account.
  @_s.JsonKey(name: 'SharedDirectory')
  final SharedDirectory sharedDirectory;

  AcceptSharedDirectoryResult({
    this.sharedDirectory,
  });
  factory AcceptSharedDirectoryResult.fromJson(Map<String, dynamic> json) =>
      _$AcceptSharedDirectoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddIpRoutesResult {
  AddIpRoutesResult();
  factory AddIpRoutesResult.fromJson(Map<String, dynamic> json) =>
      _$AddIpRoutesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddRegionResult {
  AddRegionResult();
  factory AddRegionResult.fromJson(Map<String, dynamic> json) =>
      _$AddRegionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddTagsToResourceResult {
  AddTagsToResourceResult();
  factory AddTagsToResourceResult.fromJson(Map<String, dynamic> json) =>
      _$AddTagsToResourceResultFromJson(json);
}

/// Represents a named directory attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Attribute {
  /// The name of the attribute.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the attribute.
  @_s.JsonKey(name: 'Value')
  final String value;

  Attribute({
    this.name,
    this.value,
  });
  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelSchemaExtensionResult {
  CancelSchemaExtensionResult();
  factory CancelSchemaExtensionResult.fromJson(Map<String, dynamic> json) =>
      _$CancelSchemaExtensionResultFromJson(json);
}

/// Information about the certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Certificate {
  /// The identifier of the certificate.
  @_s.JsonKey(name: 'CertificateId')
  final String certificateId;

  /// A <code>ClientCertAuthSettings</code> object that contains client
  /// certificate authentication settings.
  @_s.JsonKey(name: 'ClientCertAuthSettings')
  final ClientCertAuthSettings clientCertAuthSettings;

  /// The common name for the certificate.
  @_s.JsonKey(name: 'CommonName')
  final String commonName;

  /// The date and time when the certificate will expire.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpiryDateTime')
  final DateTime expiryDateTime;

  /// The date and time that the certificate was registered.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RegisteredDateTime')
  final DateTime registeredDateTime;

  /// The state of the certificate.
  @_s.JsonKey(name: 'State')
  final CertificateState state;

  /// Describes a state change for the certificate.
  @_s.JsonKey(name: 'StateReason')
  final String stateReason;

  /// The function that the registered certificate performs. Valid values include
  /// <code>ClientLDAPS</code> or <code>ClientCertAuth</code>. The default value
  /// is <code>ClientLDAPS</code>.
  @_s.JsonKey(name: 'Type')
  final CertificateType type;

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
  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);
}

/// Contains general information about a certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CertificateInfo {
  /// The identifier of the certificate.
  @_s.JsonKey(name: 'CertificateId')
  final String certificateId;

  /// The common name for the certificate.
  @_s.JsonKey(name: 'CommonName')
  final String commonName;

  /// The date and time when the certificate will expire.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpiryDateTime')
  final DateTime expiryDateTime;

  /// The state of the certificate.
  @_s.JsonKey(name: 'State')
  final CertificateState state;

  /// The function that the registered certificate performs. Valid values include
  /// <code>ClientLDAPS</code> or <code>ClientCertAuth</code>. The default value
  /// is <code>ClientLDAPS</code>.
  @_s.JsonKey(name: 'Type')
  final CertificateType type;

  CertificateInfo({
    this.certificateId,
    this.commonName,
    this.expiryDateTime,
    this.state,
    this.type,
  });
  factory CertificateInfo.fromJson(Map<String, dynamic> json) =>
      _$CertificateInfoFromJson(json);
}

enum CertificateState {
  @_s.JsonValue('Registering')
  registering,
  @_s.JsonValue('Registered')
  registered,
  @_s.JsonValue('RegisterFailed')
  registerFailed,
  @_s.JsonValue('Deregistering')
  deregistering,
  @_s.JsonValue('Deregistered')
  deregistered,
  @_s.JsonValue('DeregisterFailed')
  deregisterFailed,
}

enum CertificateType {
  @_s.JsonValue('ClientCertAuth')
  clientCertAuth,
  @_s.JsonValue('ClientLDAPS')
  clientLDAPS,
}

extension on CertificateType {
  String toValue() {
    switch (this) {
      case CertificateType.clientCertAuth:
        return 'ClientCertAuth';
      case CertificateType.clientLDAPS:
        return 'ClientLDAPS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ClientAuthenticationType {
  @_s.JsonValue('SmartCard')
  smartCard,
}

extension on ClientAuthenticationType {
  String toValue() {
    switch (this) {
      case ClientAuthenticationType.smartCard:
        return 'SmartCard';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about the client certificate authentication settings
/// for the <code>RegisterCertificate</code> and
/// <code>DescribeCertificate</code> operations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ClientCertAuthSettings {
  /// Specifies the URL of the default OCSP server used to check for revocation
  /// status. A secondary value to any OCSP address found in the AIA extension of
  /// the user certificate.
  @_s.JsonKey(name: 'OCSPUrl')
  final String oCSPUrl;

  ClientCertAuthSettings({
    this.oCSPUrl,
  });
  factory ClientCertAuthSettings.fromJson(Map<String, dynamic> json) =>
      _$ClientCertAuthSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ClientCertAuthSettingsToJson(this);
}

/// Contains information about a computer account in a directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Computer {
  /// An array of <a>Attribute</a> objects containing the LDAP attributes that
  /// belong to the computer account.
  @_s.JsonKey(name: 'ComputerAttributes')
  final List<Attribute> computerAttributes;

  /// The identifier of the computer.
  @_s.JsonKey(name: 'ComputerId')
  final String computerId;

  /// The computer name.
  @_s.JsonKey(name: 'ComputerName')
  final String computerName;

  Computer({
    this.computerAttributes,
    this.computerId,
    this.computerName,
  });
  factory Computer.fromJson(Map<String, dynamic> json) =>
      _$ComputerFromJson(json);
}

/// Points to a remote domain with which you are setting up a trust
/// relationship. Conditional forwarders are required in order to set up a trust
/// relationship with another domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConditionalForwarder {
  /// The IP addresses of the remote DNS server associated with RemoteDomainName.
  /// This is the IP address of the DNS server that your conditional forwarder
  /// points to.
  @_s.JsonKey(name: 'DnsIpAddrs')
  final List<String> dnsIpAddrs;

  /// The fully qualified domain name (FQDN) of the remote domains pointed to by
  /// the conditional forwarder.
  @_s.JsonKey(name: 'RemoteDomainName')
  final String remoteDomainName;

  /// The replication scope of the conditional forwarder. The only allowed value
  /// is <code>Domain</code>, which will replicate the conditional forwarder to
  /// all of the domain controllers for your AWS directory.
  @_s.JsonKey(name: 'ReplicationScope')
  final ReplicationScope replicationScope;

  ConditionalForwarder({
    this.dnsIpAddrs,
    this.remoteDomainName,
    this.replicationScope,
  });
  factory ConditionalForwarder.fromJson(Map<String, dynamic> json) =>
      _$ConditionalForwarderFromJson(json);
}

/// Contains the results of the <a>ConnectDirectory</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectDirectoryResult {
  /// The identifier of the new directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  ConnectDirectoryResult({
    this.directoryId,
  });
  factory ConnectDirectoryResult.fromJson(Map<String, dynamic> json) =>
      _$ConnectDirectoryResultFromJson(json);
}

/// Contains the results of the <a>CreateAlias</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAliasResult {
  /// The alias for the directory.
  @_s.JsonKey(name: 'Alias')
  final String alias;

  /// The identifier of the directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  CreateAliasResult({
    this.alias,
    this.directoryId,
  });
  factory CreateAliasResult.fromJson(Map<String, dynamic> json) =>
      _$CreateAliasResultFromJson(json);
}

/// Contains the results for the <a>CreateComputer</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateComputerResult {
  /// A <a>Computer</a> object that represents the computer account.
  @_s.JsonKey(name: 'Computer')
  final Computer computer;

  CreateComputerResult({
    this.computer,
  });
  factory CreateComputerResult.fromJson(Map<String, dynamic> json) =>
      _$CreateComputerResultFromJson(json);
}

/// The result of a CreateConditinalForwarder request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConditionalForwarderResult {
  CreateConditionalForwarderResult();
  factory CreateConditionalForwarderResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateConditionalForwarderResultFromJson(json);
}

/// Contains the results of the <a>CreateDirectory</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDirectoryResult {
  /// The identifier of the directory that was created.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  CreateDirectoryResult({
    this.directoryId,
  });
  factory CreateDirectoryResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDirectoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLogSubscriptionResult {
  CreateLogSubscriptionResult();
  factory CreateLogSubscriptionResult.fromJson(Map<String, dynamic> json) =>
      _$CreateLogSubscriptionResultFromJson(json);
}

/// Result of a CreateMicrosoftAD request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMicrosoftADResult {
  /// The identifier of the directory that was created.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  CreateMicrosoftADResult({
    this.directoryId,
  });
  factory CreateMicrosoftADResult.fromJson(Map<String, dynamic> json) =>
      _$CreateMicrosoftADResultFromJson(json);
}

/// Contains the results of the <a>CreateSnapshot</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSnapshotResult {
  /// The identifier of the snapshot that was created.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  CreateSnapshotResult({
    this.snapshotId,
  });
  factory CreateSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$CreateSnapshotResultFromJson(json);
}

/// The result of a CreateTrust request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTrustResult {
  /// A unique identifier for the trust relationship that was created.
  @_s.JsonKey(name: 'TrustId')
  final String trustId;

  CreateTrustResult({
    this.trustId,
  });
  factory CreateTrustResult.fromJson(Map<String, dynamic> json) =>
      _$CreateTrustResultFromJson(json);
}

/// The result of a DeleteConditionalForwarder request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConditionalForwarderResult {
  DeleteConditionalForwarderResult();
  factory DeleteConditionalForwarderResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteConditionalForwarderResultFromJson(json);
}

/// Contains the results of the <a>DeleteDirectory</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDirectoryResult {
  /// The directory identifier.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  DeleteDirectoryResult({
    this.directoryId,
  });
  factory DeleteDirectoryResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDirectoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLogSubscriptionResult {
  DeleteLogSubscriptionResult();
  factory DeleteLogSubscriptionResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteLogSubscriptionResultFromJson(json);
}

/// Contains the results of the <a>DeleteSnapshot</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSnapshotResult {
  /// The identifier of the directory snapshot that was deleted.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  DeleteSnapshotResult({
    this.snapshotId,
  });
  factory DeleteSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteSnapshotResultFromJson(json);
}

/// The result of a DeleteTrust request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTrustResult {
  /// The Trust ID of the trust relationship that was deleted.
  @_s.JsonKey(name: 'TrustId')
  final String trustId;

  DeleteTrustResult({
    this.trustId,
  });
  factory DeleteTrustResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteTrustResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterCertificateResult {
  DeregisterCertificateResult();
  factory DeregisterCertificateResult.fromJson(Map<String, dynamic> json) =>
      _$DeregisterCertificateResultFromJson(json);
}

/// The result of a DeregisterEventTopic request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterEventTopicResult {
  DeregisterEventTopicResult();
  factory DeregisterEventTopicResult.fromJson(Map<String, dynamic> json) =>
      _$DeregisterEventTopicResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCertificateResult {
  /// Information about the certificate, including registered date time,
  /// certificate state, the reason for the state, expiration date time, and
  /// certificate common name.
  @_s.JsonKey(name: 'Certificate')
  final Certificate certificate;

  DescribeCertificateResult({
    this.certificate,
  });
  factory DescribeCertificateResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeCertificateResultFromJson(json);
}

/// The result of a DescribeConditionalForwarder request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConditionalForwardersResult {
  /// The list of conditional forwarders that have been created.
  @_s.JsonKey(name: 'ConditionalForwarders')
  final List<ConditionalForwarder> conditionalForwarders;

  DescribeConditionalForwardersResult({
    this.conditionalForwarders,
  });
  factory DescribeConditionalForwardersResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConditionalForwardersResultFromJson(json);
}

/// Contains the results of the <a>DescribeDirectories</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDirectoriesResult {
  /// The list of <a>DirectoryDescription</a> objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the <code>Limit</code> member of the request. This occurs if
  /// there are less than the requested number of items left to retrieve, or if
  /// the limitations of the operation have been exceeded.
  @_s.JsonKey(name: 'DirectoryDescriptions')
  final List<DirectoryDescription> directoryDescriptions;

  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent call to
  /// <a>DescribeDirectories</a> to retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeDirectoriesResult({
    this.directoryDescriptions,
    this.nextToken,
  });
  factory DescribeDirectoriesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeDirectoriesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDomainControllersResult {
  /// List of the <a>DomainController</a> objects that were retrieved.
  @_s.JsonKey(name: 'DomainControllers')
  final List<DomainController> domainControllers;

  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent call to
  /// <a>DescribeDomainControllers</a> retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeDomainControllersResult({
    this.domainControllers,
    this.nextToken,
  });
  factory DescribeDomainControllersResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeDomainControllersResultFromJson(json);
}

/// The result of a DescribeEventTopic request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventTopicsResult {
  /// A list of SNS topic names that receive status messages from the specified
  /// Directory ID.
  @_s.JsonKey(name: 'EventTopics')
  final List<EventTopic> eventTopics;

  DescribeEventTopicsResult({
    this.eventTopics,
  });
  factory DescribeEventTopicsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventTopicsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLDAPSSettingsResult {
  /// Information about LDAP security for the specified directory, including
  /// status of enablement, state last updated date time, and the reason for the
  /// state.
  @_s.JsonKey(name: 'LDAPSSettingsInfo')
  final List<LDAPSSettingInfo> lDAPSSettingsInfo;

  /// The next token used to retrieve the LDAPS settings if the number of setting
  /// types exceeds page limit and there is another page.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeLDAPSSettingsResult({
    this.lDAPSSettingsInfo,
    this.nextToken,
  });
  factory DescribeLDAPSSettingsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeLDAPSSettingsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRegionsResult {
  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent call to
  /// <a>DescribeRegions</a> to retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of Region information related to the directory for each replicated
  /// Region.
  @_s.JsonKey(name: 'RegionsDescription')
  final List<RegionDescription> regionsDescription;

  DescribeRegionsResult({
    this.nextToken,
    this.regionsDescription,
  });
  factory DescribeRegionsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeRegionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSharedDirectoriesResult {
  /// If not null, token that indicates that more results are available. Pass this
  /// value for the <code>NextToken</code> parameter in a subsequent call to
  /// <a>DescribeSharedDirectories</a> to retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of all shared directories in your account.
  @_s.JsonKey(name: 'SharedDirectories')
  final List<SharedDirectory> sharedDirectories;

  DescribeSharedDirectoriesResult({
    this.nextToken,
    this.sharedDirectories,
  });
  factory DescribeSharedDirectoriesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeSharedDirectoriesResultFromJson(json);
}

/// Contains the results of the <a>DescribeSnapshots</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSnapshotsResult {
  /// If not null, more results are available. Pass this value in the
  /// <i>NextToken</i> member of a subsequent call to <a>DescribeSnapshots</a>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of <a>Snapshot</a> objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the <i>Limit</i> member of the request. This occurs if there
  /// are less than the requested number of items left to retrieve, or if the
  /// limitations of the operation have been exceeded.
  @_s.JsonKey(name: 'Snapshots')
  final List<Snapshot> snapshots;

  DescribeSnapshotsResult({
    this.nextToken,
    this.snapshots,
  });
  factory DescribeSnapshotsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeSnapshotsResultFromJson(json);
}

/// The result of a DescribeTrust request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTrustsResult {
  /// If not null, more results are available. Pass this value for the
  /// <i>NextToken</i> parameter in a subsequent call to <a>DescribeTrusts</a> to
  /// retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of Trust objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the <i>Limit</i> member of the request. This occurs if there
  /// are less than the requested number of items left to retrieve, or if the
  /// limitations of the operation have been exceeded.
  @_s.JsonKey(name: 'Trusts')
  final List<Trust> trusts;

  DescribeTrustsResult({
    this.nextToken,
    this.trusts,
  });
  factory DescribeTrustsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeTrustsResultFromJson(json);
}

/// Contains information for the <a>ConnectDirectory</a> operation when an AD
/// Connector directory is being created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DirectoryConnectSettings {
  /// A list of one or more IP addresses of DNS servers or domain controllers in
  /// the on-premises directory.
  @_s.JsonKey(name: 'CustomerDnsIps')
  final List<String> customerDnsIps;

  /// The user name of an account in the on-premises directory that is used to
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
  @_s.JsonKey(name: 'CustomerUserName')
  final String customerUserName;

  /// A list of subnet identifiers in the VPC in which the AD Connector is
  /// created.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The identifier of the VPC in which the AD Connector is created.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DirectoryConnectSettings({
    @_s.required this.customerDnsIps,
    @_s.required this.customerUserName,
    @_s.required this.subnetIds,
    @_s.required this.vpcId,
  });
  Map<String, dynamic> toJson() => _$DirectoryConnectSettingsToJson(this);
}

/// Contains information about an AD Connector directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DirectoryConnectSettingsDescription {
  /// A list of the Availability Zones that the directory is in.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// The IP addresses of the AD Connector servers.
  @_s.JsonKey(name: 'ConnectIps')
  final List<String> connectIps;

  /// The user name of the service account in the on-premises directory.
  @_s.JsonKey(name: 'CustomerUserName')
  final String customerUserName;

  /// The security group identifier for the AD Connector directory.
  @_s.JsonKey(name: 'SecurityGroupId')
  final String securityGroupId;

  /// A list of subnet identifiers in the VPC that the AD Connector is in.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The identifier of the VPC that the AD Connector is in.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DirectoryConnectSettingsDescription({
    this.availabilityZones,
    this.connectIps,
    this.customerUserName,
    this.securityGroupId,
    this.subnetIds,
    this.vpcId,
  });
  factory DirectoryConnectSettingsDescription.fromJson(
          Map<String, dynamic> json) =>
      _$DirectoryConnectSettingsDescriptionFromJson(json);
}

/// Contains information about an AWS Directory Service directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DirectoryDescription {
  /// The access URL for the directory, such as
  /// <code>http://&lt;alias&gt;.awsapps.com</code>. If no alias has been created
  /// for the directory, <code>&lt;alias&gt;</code> is the directory identifier,
  /// such as <code>d-XXXXXXXXXX</code>.
  @_s.JsonKey(name: 'AccessUrl')
  final String accessUrl;

  /// The alias for the directory. If no alias has been created for the directory,
  /// the alias is the directory identifier, such as <code>d-XXXXXXXXXX</code>.
  @_s.JsonKey(name: 'Alias')
  final String alias;

  /// A <a>DirectoryConnectSettingsDescription</a> object that contains additional
  /// information about an AD Connector directory. This member is only present if
  /// the directory is an AD Connector directory.
  @_s.JsonKey(name: 'ConnectSettings')
  final DirectoryConnectSettingsDescription connectSettings;

  /// The description for the directory.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The desired number of domain controllers in the directory if the directory
  /// is Microsoft AD.
  @_s.JsonKey(name: 'DesiredNumberOfDomainControllers')
  final int desiredNumberOfDomainControllers;

  /// The directory identifier.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The IP addresses of the DNS servers for the directory. For a Simple AD or
  /// Microsoft AD directory, these are the IP addresses of the Simple AD or
  /// Microsoft AD directory servers. For an AD Connector directory, these are the
  /// IP addresses of the DNS servers or domain controllers in the on-premises
  /// directory to which the AD Connector is connected.
  @_s.JsonKey(name: 'DnsIpAddrs')
  final List<String> dnsIpAddrs;

  /// The edition associated with this directory.
  @_s.JsonKey(name: 'Edition')
  final DirectoryEdition edition;

  /// Specifies when the directory was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LaunchTime')
  final DateTime launchTime;

  /// The fully qualified name of the directory.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Describes the AWS Managed Microsoft AD directory in the directory owner
  /// account.
  @_s.JsonKey(name: 'OwnerDirectoryDescription')
  final OwnerDirectoryDescription ownerDirectoryDescription;

  /// A <a>RadiusSettings</a> object that contains information about the RADIUS
  /// server configured for this directory.
  @_s.JsonKey(name: 'RadiusSettings')
  final RadiusSettings radiusSettings;

  /// The status of the RADIUS MFA server connection.
  @_s.JsonKey(name: 'RadiusStatus')
  final RadiusStatus radiusStatus;

  /// Lists the Regions where the directory has replicated.
  @_s.JsonKey(name: 'RegionsInfo')
  final RegionsInfo regionsInfo;

  /// The method used when sharing a directory to determine whether the directory
  /// should be shared within your AWS organization (<code>ORGANIZATIONS</code>)
  /// or with any AWS account by sending a shared directory request
  /// (<code>HANDSHAKE</code>).
  @_s.JsonKey(name: 'ShareMethod')
  final ShareMethod shareMethod;

  /// A directory share request that is sent by the directory owner to the
  /// directory consumer. The request includes a typed message to help the
  /// directory consumer administrator determine whether to approve or reject the
  /// share invitation.
  @_s.JsonKey(name: 'ShareNotes')
  final String shareNotes;

  /// Current directory status of the shared AWS Managed Microsoft AD directory.
  @_s.JsonKey(name: 'ShareStatus')
  final ShareStatus shareStatus;

  /// The short name of the directory.
  @_s.JsonKey(name: 'ShortName')
  final String shortName;

  /// The directory size.
  @_s.JsonKey(name: 'Size')
  final DirectorySize size;

  /// Indicates if single sign-on is enabled for the directory. For more
  /// information, see <a>EnableSso</a> and <a>DisableSso</a>.
  @_s.JsonKey(name: 'SsoEnabled')
  final bool ssoEnabled;

  /// The current stage of the directory.
  @_s.JsonKey(name: 'Stage')
  final DirectoryStage stage;

  /// The date and time that the stage was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StageLastUpdatedDateTime')
  final DateTime stageLastUpdatedDateTime;

  /// Additional information about the directory stage.
  @_s.JsonKey(name: 'StageReason')
  final String stageReason;

  /// The directory size.
  @_s.JsonKey(name: 'Type')
  final DirectoryType type;

  /// A <a>DirectoryVpcSettingsDescription</a> object that contains additional
  /// information about a directory. This member is only present if the directory
  /// is a Simple AD or Managed AD directory.
  @_s.JsonKey(name: 'VpcSettings')
  final DirectoryVpcSettingsDescription vpcSettings;

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
  factory DirectoryDescription.fromJson(Map<String, dynamic> json) =>
      _$DirectoryDescriptionFromJson(json);
}

enum DirectoryEdition {
  @_s.JsonValue('Enterprise')
  enterprise,
  @_s.JsonValue('Standard')
  standard,
}

extension on DirectoryEdition {
  String toValue() {
    switch (this) {
      case DirectoryEdition.enterprise:
        return 'Enterprise';
      case DirectoryEdition.standard:
        return 'Standard';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains directory limit information for a Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DirectoryLimits {
  /// The current number of cloud directories in the Region.
  @_s.JsonKey(name: 'CloudOnlyDirectoriesCurrentCount')
  final int cloudOnlyDirectoriesCurrentCount;

  /// The maximum number of cloud directories allowed in the Region.
  @_s.JsonKey(name: 'CloudOnlyDirectoriesLimit')
  final int cloudOnlyDirectoriesLimit;

  /// Indicates if the cloud directory limit has been reached.
  @_s.JsonKey(name: 'CloudOnlyDirectoriesLimitReached')
  final bool cloudOnlyDirectoriesLimitReached;

  /// The current number of AWS Managed Microsoft AD directories in the region.
  @_s.JsonKey(name: 'CloudOnlyMicrosoftADCurrentCount')
  final int cloudOnlyMicrosoftADCurrentCount;

  /// The maximum number of AWS Managed Microsoft AD directories allowed in the
  /// region.
  @_s.JsonKey(name: 'CloudOnlyMicrosoftADLimit')
  final int cloudOnlyMicrosoftADLimit;

  /// Indicates if the AWS Managed Microsoft AD directory limit has been reached.
  @_s.JsonKey(name: 'CloudOnlyMicrosoftADLimitReached')
  final bool cloudOnlyMicrosoftADLimitReached;

  /// The current number of connected directories in the Region.
  @_s.JsonKey(name: 'ConnectedDirectoriesCurrentCount')
  final int connectedDirectoriesCurrentCount;

  /// The maximum number of connected directories allowed in the Region.
  @_s.JsonKey(name: 'ConnectedDirectoriesLimit')
  final int connectedDirectoriesLimit;

  /// Indicates if the connected directory limit has been reached.
  @_s.JsonKey(name: 'ConnectedDirectoriesLimitReached')
  final bool connectedDirectoriesLimitReached;

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
  factory DirectoryLimits.fromJson(Map<String, dynamic> json) =>
      _$DirectoryLimitsFromJson(json);
}

enum DirectorySize {
  @_s.JsonValue('Small')
  small,
  @_s.JsonValue('Large')
  large,
}

extension on DirectorySize {
  String toValue() {
    switch (this) {
      case DirectorySize.small:
        return 'Small';
      case DirectorySize.large:
        return 'Large';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DirectoryStage {
  @_s.JsonValue('Requested')
  requested,
  @_s.JsonValue('Creating')
  creating,
  @_s.JsonValue('Created')
  created,
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Inoperable')
  inoperable,
  @_s.JsonValue('Impaired')
  impaired,
  @_s.JsonValue('Restoring')
  restoring,
  @_s.JsonValue('RestoreFailed')
  restoreFailed,
  @_s.JsonValue('Deleting')
  deleting,
  @_s.JsonValue('Deleted')
  deleted,
  @_s.JsonValue('Failed')
  failed,
}

enum DirectoryType {
  @_s.JsonValue('SimpleAD')
  simpleAD,
  @_s.JsonValue('ADConnector')
  aDConnector,
  @_s.JsonValue('MicrosoftAD')
  microsoftAD,
  @_s.JsonValue('SharedMicrosoftAD')
  sharedMicrosoftAD,
}

/// Contains VPC information for the <a>CreateDirectory</a> or
/// <a>CreateMicrosoftAD</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DirectoryVpcSettings {
  /// The identifiers of the subnets for the directory servers. The two subnets
  /// must be in different Availability Zones. AWS Directory Service creates a
  /// directory server and a DNS server in each of these subnets.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The identifier of the VPC in which to create the directory.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DirectoryVpcSettings({
    @_s.required this.subnetIds,
    @_s.required this.vpcId,
  });
  factory DirectoryVpcSettings.fromJson(Map<String, dynamic> json) =>
      _$DirectoryVpcSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DirectoryVpcSettingsToJson(this);
}

/// Contains information about the directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DirectoryVpcSettingsDescription {
  /// The list of Availability Zones that the directory is in.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// The domain controller security group identifier for the directory.
  @_s.JsonKey(name: 'SecurityGroupId')
  final String securityGroupId;

  /// The identifiers of the subnets for the directory servers.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The identifier of the VPC that the directory is in.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DirectoryVpcSettingsDescription({
    this.availabilityZones,
    this.securityGroupId,
    this.subnetIds,
    this.vpcId,
  });
  factory DirectoryVpcSettingsDescription.fromJson(Map<String, dynamic> json) =>
      _$DirectoryVpcSettingsDescriptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableClientAuthenticationResult {
  DisableClientAuthenticationResult();
  factory DisableClientAuthenticationResult.fromJson(
          Map<String, dynamic> json) =>
      _$DisableClientAuthenticationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableLDAPSResult {
  DisableLDAPSResult();
  factory DisableLDAPSResult.fromJson(Map<String, dynamic> json) =>
      _$DisableLDAPSResultFromJson(json);
}

/// Contains the results of the <a>DisableRadius</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableRadiusResult {
  DisableRadiusResult();
  factory DisableRadiusResult.fromJson(Map<String, dynamic> json) =>
      _$DisableRadiusResultFromJson(json);
}

/// Contains the results of the <a>DisableSso</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableSsoResult {
  DisableSsoResult();
  factory DisableSsoResult.fromJson(Map<String, dynamic> json) =>
      _$DisableSsoResultFromJson(json);
}

/// Contains information about the domain controllers for a specified directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainController {
  /// The Availability Zone where the domain controller is located.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// Identifier of the directory where the domain controller resides.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The IP address of the domain controller.
  @_s.JsonKey(name: 'DnsIpAddr')
  final String dnsIpAddr;

  /// Identifies a specific domain controller in the directory.
  @_s.JsonKey(name: 'DomainControllerId')
  final String domainControllerId;

  /// Specifies when the domain controller was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LaunchTime')
  final DateTime launchTime;

  /// The status of the domain controller.
  @_s.JsonKey(name: 'Status')
  final DomainControllerStatus status;

  /// The date and time that the status was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StatusLastUpdatedDateTime')
  final DateTime statusLastUpdatedDateTime;

  /// A description of the domain controller state.
  @_s.JsonKey(name: 'StatusReason')
  final String statusReason;

  /// Identifier of the subnet in the VPC that contains the domain controller.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The identifier of the VPC that contains the domain controller.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

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
  factory DomainController.fromJson(Map<String, dynamic> json) =>
      _$DomainControllerFromJson(json);
}

enum DomainControllerStatus {
  @_s.JsonValue('Creating')
  creating,
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Impaired')
  impaired,
  @_s.JsonValue('Restoring')
  restoring,
  @_s.JsonValue('Deleting')
  deleting,
  @_s.JsonValue('Deleted')
  deleted,
  @_s.JsonValue('Failed')
  failed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableClientAuthenticationResult {
  EnableClientAuthenticationResult();
  factory EnableClientAuthenticationResult.fromJson(
          Map<String, dynamic> json) =>
      _$EnableClientAuthenticationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableLDAPSResult {
  EnableLDAPSResult();
  factory EnableLDAPSResult.fromJson(Map<String, dynamic> json) =>
      _$EnableLDAPSResultFromJson(json);
}

/// Contains the results of the <a>EnableRadius</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableRadiusResult {
  EnableRadiusResult();
  factory EnableRadiusResult.fromJson(Map<String, dynamic> json) =>
      _$EnableRadiusResultFromJson(json);
}

/// Contains the results of the <a>EnableSso</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableSsoResult {
  EnableSsoResult();
  factory EnableSsoResult.fromJson(Map<String, dynamic> json) =>
      _$EnableSsoResultFromJson(json);
}

/// Information about SNS topic and AWS Directory Service directory
/// associations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventTopic {
  /// The date and time of when you associated your directory with the SNS topic.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDateTime')
  final DateTime createdDateTime;

  /// The Directory ID of an AWS Directory Service directory that will publish
  /// status messages to an SNS topic.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The topic registration status.
  @_s.JsonKey(name: 'Status')
  final TopicStatus status;

  /// The SNS topic ARN (Amazon Resource Name).
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  /// The name of an AWS SNS topic the receives status messages from the
  /// directory.
  @_s.JsonKey(name: 'TopicName')
  final String topicName;

  EventTopic({
    this.createdDateTime,
    this.directoryId,
    this.status,
    this.topicArn,
    this.topicName,
  });
  factory EventTopic.fromJson(Map<String, dynamic> json) =>
      _$EventTopicFromJson(json);
}

/// Contains the results of the <a>GetDirectoryLimits</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDirectoryLimitsResult {
  /// A <a>DirectoryLimits</a> object that contains the directory limits for the
  /// current rRegion.
  @_s.JsonKey(name: 'DirectoryLimits')
  final DirectoryLimits directoryLimits;

  GetDirectoryLimitsResult({
    this.directoryLimits,
  });
  factory GetDirectoryLimitsResult.fromJson(Map<String, dynamic> json) =>
      _$GetDirectoryLimitsResultFromJson(json);
}

/// Contains the results of the <a>GetSnapshotLimits</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSnapshotLimitsResult {
  /// A <a>SnapshotLimits</a> object that contains the manual snapshot limits for
  /// the specified directory.
  @_s.JsonKey(name: 'SnapshotLimits')
  final SnapshotLimits snapshotLimits;

  GetSnapshotLimitsResult({
    this.snapshotLimits,
  });
  factory GetSnapshotLimitsResult.fromJson(Map<String, dynamic> json) =>
      _$GetSnapshotLimitsResultFromJson(json);
}

/// IP address block. This is often the address block of the DNS server used for
/// your on-premises domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class IpRoute {
  /// IP address block using CIDR format, for example 10.0.0.0/24. This is often
  /// the address block of the DNS server used for your on-premises domain. For a
  /// single IP address use a CIDR address block with /32. For example
  /// 10.0.0.0/32.
  @_s.JsonKey(name: 'CidrIp')
  final String cidrIp;

  /// Description of the address block.
  @_s.JsonKey(name: 'Description')
  final String description;

  IpRoute({
    this.cidrIp,
    this.description,
  });
  Map<String, dynamic> toJson() => _$IpRouteToJson(this);
}

/// Information about one or more IP address blocks.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IpRouteInfo {
  /// The date and time the address block was added to the directory.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'AddedDateTime')
  final DateTime addedDateTime;

  /// IP address block in the <a>IpRoute</a>.
  @_s.JsonKey(name: 'CidrIp')
  final String cidrIp;

  /// Description of the <a>IpRouteInfo</a>.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Identifier (ID) of the directory associated with the IP addresses.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The status of the IP address block.
  @_s.JsonKey(name: 'IpRouteStatusMsg')
  final IpRouteStatusMsg ipRouteStatusMsg;

  /// The reason for the IpRouteStatusMsg.
  @_s.JsonKey(name: 'IpRouteStatusReason')
  final String ipRouteStatusReason;

  IpRouteInfo({
    this.addedDateTime,
    this.cidrIp,
    this.description,
    this.directoryId,
    this.ipRouteStatusMsg,
    this.ipRouteStatusReason,
  });
  factory IpRouteInfo.fromJson(Map<String, dynamic> json) =>
      _$IpRouteInfoFromJson(json);
}

enum IpRouteStatusMsg {
  @_s.JsonValue('Adding')
  adding,
  @_s.JsonValue('Added')
  added,
  @_s.JsonValue('Removing')
  removing,
  @_s.JsonValue('Removed')
  removed,
  @_s.JsonValue('AddFailed')
  addFailed,
  @_s.JsonValue('RemoveFailed')
  removeFailed,
}

/// Contains general information about the LDAPS settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LDAPSSettingInfo {
  /// The state of the LDAPS settings.
  @_s.JsonKey(name: 'LDAPSStatus')
  final LDAPSStatus lDAPSStatus;

  /// Describes a state change for LDAPS.
  @_s.JsonKey(name: 'LDAPSStatusReason')
  final String lDAPSStatusReason;

  /// The date and time when the LDAPS settings were last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  LDAPSSettingInfo({
    this.lDAPSStatus,
    this.lDAPSStatusReason,
    this.lastUpdatedDateTime,
  });
  factory LDAPSSettingInfo.fromJson(Map<String, dynamic> json) =>
      _$LDAPSSettingInfoFromJson(json);
}

enum LDAPSStatus {
  @_s.JsonValue('Enabling')
  enabling,
  @_s.JsonValue('Enabled')
  enabled,
  @_s.JsonValue('EnableFailed')
  enableFailed,
  @_s.JsonValue('Disabled')
  disabled,
}

enum LDAPSType {
  @_s.JsonValue('Client')
  client,
}

extension on LDAPSType {
  String toValue() {
    switch (this) {
      case LDAPSType.client:
        return 'Client';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCertificatesResult {
  /// A list of certificates with basic details including certificate ID,
  /// certificate common name, certificate state.
  @_s.JsonKey(name: 'CertificatesInfo')
  final List<CertificateInfo> certificatesInfo;

  /// Indicates whether another page of certificates is available when the number
  /// of available certificates exceeds the page limit.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCertificatesResult({
    this.certificatesInfo,
    this.nextToken,
  });
  factory ListCertificatesResult.fromJson(Map<String, dynamic> json) =>
      _$ListCertificatesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIpRoutesResult {
  /// A list of <a>IpRoute</a>s.
  @_s.JsonKey(name: 'IpRoutesInfo')
  final List<IpRouteInfo> ipRoutesInfo;

  /// If not null, more results are available. Pass this value for the
  /// <i>NextToken</i> parameter in a subsequent call to <a>ListIpRoutes</a> to
  /// retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIpRoutesResult({
    this.ipRoutesInfo,
    this.nextToken,
  });
  factory ListIpRoutesResult.fromJson(Map<String, dynamic> json) =>
      _$ListIpRoutesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLogSubscriptionsResult {
  /// A list of active <a>LogSubscription</a> objects for calling the AWS account.
  @_s.JsonKey(name: 'LogSubscriptions')
  final List<LogSubscription> logSubscriptions;

  /// The token for the next set of items to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLogSubscriptionsResult({
    this.logSubscriptions,
    this.nextToken,
  });
  factory ListLogSubscriptionsResult.fromJson(Map<String, dynamic> json) =>
      _$ListLogSubscriptionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSchemaExtensionsResult {
  /// If not null, more results are available. Pass this value for the
  /// <code>NextToken</code> parameter in a subsequent call to
  /// <code>ListSchemaExtensions</code> to retrieve the next set of items.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the schema extensions applied to the directory.
  @_s.JsonKey(name: 'SchemaExtensionsInfo')
  final List<SchemaExtensionInfo> schemaExtensionsInfo;

  ListSchemaExtensionsResult({
    this.nextToken,
    this.schemaExtensionsInfo,
  });
  factory ListSchemaExtensionsResult.fromJson(Map<String, dynamic> json) =>
      _$ListSchemaExtensionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResult {
  /// Reserved for future use.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of tags returned by the ListTagsForResource operation.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResult({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResultFromJson(json);
}

/// Represents a log subscription, which tracks real-time data from a chosen log
/// group to a specified destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogSubscription {
  /// Identifier (ID) of the directory that you want to associate with the log
  /// subscription.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The name of the log group.
  @_s.JsonKey(name: 'LogGroupName')
  final String logGroupName;

  /// The date and time that the log subscription was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubscriptionCreatedDateTime')
  final DateTime subscriptionCreatedDateTime;

  LogSubscription({
    this.directoryId,
    this.logGroupName,
    this.subscriptionCreatedDateTime,
  });
  factory LogSubscription.fromJson(Map<String, dynamic> json) =>
      _$LogSubscriptionFromJson(json);
}

/// Describes the directory owner account details that have been shared to the
/// directory consumer account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OwnerDirectoryDescription {
  /// Identifier of the directory owner account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// Identifier of the AWS Managed Microsoft AD directory in the directory owner
  /// account.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// IP address of the directory’s domain controllers.
  @_s.JsonKey(name: 'DnsIpAddrs')
  final List<String> dnsIpAddrs;

  /// A <a>RadiusSettings</a> object that contains information about the RADIUS
  /// server.
  @_s.JsonKey(name: 'RadiusSettings')
  final RadiusSettings radiusSettings;

  /// Information about the status of the RADIUS server.
  @_s.JsonKey(name: 'RadiusStatus')
  final RadiusStatus radiusStatus;

  /// Information about the VPC settings for the directory.
  @_s.JsonKey(name: 'VpcSettings')
  final DirectoryVpcSettingsDescription vpcSettings;

  OwnerDirectoryDescription({
    this.accountId,
    this.directoryId,
    this.dnsIpAddrs,
    this.radiusSettings,
    this.radiusStatus,
    this.vpcSettings,
  });
  factory OwnerDirectoryDescription.fromJson(Map<String, dynamic> json) =>
      _$OwnerDirectoryDescriptionFromJson(json);
}

enum RadiusAuthenticationProtocol {
  @_s.JsonValue('PAP')
  pap,
  @_s.JsonValue('CHAP')
  chap,
  @_s.JsonValue('MS-CHAPv1')
  msCHAPv1,
  @_s.JsonValue('MS-CHAPv2')
  msCHAPv2,
}

/// Contains information about a Remote Authentication Dial In User Service
/// (RADIUS) server.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RadiusSettings {
  /// The protocol specified for your RADIUS endpoints.
  @_s.JsonKey(name: 'AuthenticationProtocol')
  final RadiusAuthenticationProtocol authenticationProtocol;

  /// Not currently used.
  @_s.JsonKey(name: 'DisplayLabel')
  final String displayLabel;

  /// The port that your RADIUS server is using for communications. Your
  /// on-premises network must allow inbound traffic over this port from the AWS
  /// Directory Service servers.
  @_s.JsonKey(name: 'RadiusPort')
  final int radiusPort;

  /// The maximum number of times that communication with the RADIUS server is
  /// attempted.
  @_s.JsonKey(name: 'RadiusRetries')
  final int radiusRetries;

  /// An array of strings that contains the fully qualified domain name (FQDN) or
  /// IP addresses of the RADIUS server endpoints, or the FQDN or IP addresses of
  /// your RADIUS server load balancer.
  @_s.JsonKey(name: 'RadiusServers')
  final List<String> radiusServers;

  /// The amount of time, in seconds, to wait for the RADIUS server to respond.
  @_s.JsonKey(name: 'RadiusTimeout')
  final int radiusTimeout;

  /// Required for enabling RADIUS on the directory.
  @_s.JsonKey(name: 'SharedSecret')
  final String sharedSecret;

  /// Not currently used.
  @_s.JsonKey(name: 'UseSameUsername')
  final bool useSameUsername;

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
  factory RadiusSettings.fromJson(Map<String, dynamic> json) =>
      _$RadiusSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RadiusSettingsToJson(this);
}

enum RadiusStatus {
  @_s.JsonValue('Creating')
  creating,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
}

/// The replicated Region information for a directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegionDescription {
  /// The desired number of domain controllers in the specified Region for the
  /// specified directory.
  @_s.JsonKey(name: 'DesiredNumberOfDomainControllers')
  final int desiredNumberOfDomainControllers;

  /// The identifier of the directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The date and time that the Region description was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// Specifies when the Region replication began.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LaunchTime')
  final DateTime launchTime;

  /// The name of the Region. For example, <code>us-east-1</code>.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  /// Specifies whether the Region is the primary Region or an additional Region.
  @_s.JsonKey(name: 'RegionType')
  final RegionType regionType;

  /// The status of the replication process for the specified Region.
  @_s.JsonKey(name: 'Status')
  final DirectoryStage status;

  /// The date and time that the Region status was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StatusLastUpdatedDateTime')
  final DateTime statusLastUpdatedDateTime;
  @_s.JsonKey(name: 'VpcSettings')
  final DirectoryVpcSettings vpcSettings;

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
  factory RegionDescription.fromJson(Map<String, dynamic> json) =>
      _$RegionDescriptionFromJson(json);
}

enum RegionType {
  @_s.JsonValue('Primary')
  primary,
  @_s.JsonValue('Additional')
  additional,
}

/// Provides information about the Regions that are configured for multi-Region
/// replication.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegionsInfo {
  /// Lists the Regions where the directory has been replicated, excluding the
  /// primary Region.
  @_s.JsonKey(name: 'AdditionalRegions')
  final List<String> additionalRegions;

  /// The Region where the AWS Managed Microsoft AD directory was originally
  /// created.
  @_s.JsonKey(name: 'PrimaryRegion')
  final String primaryRegion;

  RegionsInfo({
    this.additionalRegions,
    this.primaryRegion,
  });
  factory RegionsInfo.fromJson(Map<String, dynamic> json) =>
      _$RegionsInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterCertificateResult {
  /// The identifier of the certificate.
  @_s.JsonKey(name: 'CertificateId')
  final String certificateId;

  RegisterCertificateResult({
    this.certificateId,
  });
  factory RegisterCertificateResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterCertificateResultFromJson(json);
}

/// The result of a RegisterEventTopic request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterEventTopicResult {
  RegisterEventTopicResult();
  factory RegisterEventTopicResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterEventTopicResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectSharedDirectoryResult {
  /// Identifier of the shared directory in the directory consumer account.
  @_s.JsonKey(name: 'SharedDirectoryId')
  final String sharedDirectoryId;

  RejectSharedDirectoryResult({
    this.sharedDirectoryId,
  });
  factory RejectSharedDirectoryResult.fromJson(Map<String, dynamic> json) =>
      _$RejectSharedDirectoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveIpRoutesResult {
  RemoveIpRoutesResult();
  factory RemoveIpRoutesResult.fromJson(Map<String, dynamic> json) =>
      _$RemoveIpRoutesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveRegionResult {
  RemoveRegionResult();
  factory RemoveRegionResult.fromJson(Map<String, dynamic> json) =>
      _$RemoveRegionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveTagsFromResourceResult {
  RemoveTagsFromResourceResult();
  factory RemoveTagsFromResourceResult.fromJson(Map<String, dynamic> json) =>
      _$RemoveTagsFromResourceResultFromJson(json);
}

enum ReplicationScope {
  @_s.JsonValue('Domain')
  domain,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResetUserPasswordResult {
  ResetUserPasswordResult();
  factory ResetUserPasswordResult.fromJson(Map<String, dynamic> json) =>
      _$ResetUserPasswordResultFromJson(json);
}

/// Contains the results of the <a>RestoreFromSnapshot</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreFromSnapshotResult {
  RestoreFromSnapshotResult();
  factory RestoreFromSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$RestoreFromSnapshotResultFromJson(json);
}

/// Information about a schema extension.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SchemaExtensionInfo {
  /// A description of the schema extension.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier of the directory to which the schema extension is applied.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The date and time that the schema extension was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDateTime')
  final DateTime endDateTime;

  /// The identifier of the schema extension.
  @_s.JsonKey(name: 'SchemaExtensionId')
  final String schemaExtensionId;

  /// The current status of the schema extension.
  @_s.JsonKey(name: 'SchemaExtensionStatus')
  final SchemaExtensionStatus schemaExtensionStatus;

  /// The reason for the <code>SchemaExtensionStatus</code>.
  @_s.JsonKey(name: 'SchemaExtensionStatusReason')
  final String schemaExtensionStatusReason;

  /// The date and time that the schema extension started being applied to the
  /// directory.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartDateTime')
  final DateTime startDateTime;

  SchemaExtensionInfo({
    this.description,
    this.directoryId,
    this.endDateTime,
    this.schemaExtensionId,
    this.schemaExtensionStatus,
    this.schemaExtensionStatusReason,
    this.startDateTime,
  });
  factory SchemaExtensionInfo.fromJson(Map<String, dynamic> json) =>
      _$SchemaExtensionInfoFromJson(json);
}

enum SchemaExtensionStatus {
  @_s.JsonValue('Initializing')
  initializing,
  @_s.JsonValue('CreatingSnapshot')
  creatingSnapshot,
  @_s.JsonValue('UpdatingSchema')
  updatingSchema,
  @_s.JsonValue('Replicating')
  replicating,
  @_s.JsonValue('CancelInProgress')
  cancelInProgress,
  @_s.JsonValue('RollbackInProgress')
  rollbackInProgress,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Completed')
  completed,
}

enum SelectiveAuth {
  @_s.JsonValue('Enabled')
  enabled,
  @_s.JsonValue('Disabled')
  disabled,
}

extension on SelectiveAuth {
  String toValue() {
    switch (this) {
      case SelectiveAuth.enabled:
        return 'Enabled';
      case SelectiveAuth.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ShareDirectoryResult {
  /// Identifier of the directory that is stored in the directory consumer account
  /// that is shared from the specified directory (<code>DirectoryId</code>).
  @_s.JsonKey(name: 'SharedDirectoryId')
  final String sharedDirectoryId;

  ShareDirectoryResult({
    this.sharedDirectoryId,
  });
  factory ShareDirectoryResult.fromJson(Map<String, dynamic> json) =>
      _$ShareDirectoryResultFromJson(json);
}

enum ShareMethod {
  @_s.JsonValue('ORGANIZATIONS')
  organizations,
  @_s.JsonValue('HANDSHAKE')
  handshake,
}

extension on ShareMethod {
  String toValue() {
    switch (this) {
      case ShareMethod.organizations:
        return 'ORGANIZATIONS';
      case ShareMethod.handshake:
        return 'HANDSHAKE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ShareStatus {
  @_s.JsonValue('Shared')
  shared,
  @_s.JsonValue('PendingAcceptance')
  pendingAcceptance,
  @_s.JsonValue('Rejected')
  rejected,
  @_s.JsonValue('Rejecting')
  rejecting,
  @_s.JsonValue('RejectFailed')
  rejectFailed,
  @_s.JsonValue('Sharing')
  sharing,
  @_s.JsonValue('ShareFailed')
  shareFailed,
  @_s.JsonValue('Deleted')
  deleted,
  @_s.JsonValue('Deleting')
  deleting,
}

/// Identifier that contains details about the directory consumer account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ShareTarget {
  /// Identifier of the directory consumer account.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Type of identifier to be used in the <code>Id</code> field.
  @_s.JsonKey(name: 'Type')
  final TargetType type;

  ShareTarget({
    @_s.required this.id,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$ShareTargetToJson(this);
}

/// Details about the shared directory in the directory owner account for which
/// the share request in the directory consumer account has been accepted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SharedDirectory {
  /// The date and time that the shared directory was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDateTime')
  final DateTime createdDateTime;

  /// The date and time that the shared directory was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// Identifier of the directory owner account, which contains the directory that
  /// has been shared to the consumer account.
  @_s.JsonKey(name: 'OwnerAccountId')
  final String ownerAccountId;

  /// Identifier of the directory in the directory owner account.
  @_s.JsonKey(name: 'OwnerDirectoryId')
  final String ownerDirectoryId;

  /// The method used when sharing a directory to determine whether the directory
  /// should be shared within your AWS organization (<code>ORGANIZATIONS</code>)
  /// or with any AWS account by sending a shared directory request
  /// (<code>HANDSHAKE</code>).
  @_s.JsonKey(name: 'ShareMethod')
  final ShareMethod shareMethod;

  /// A directory share request that is sent by the directory owner to the
  /// directory consumer. The request includes a typed message to help the
  /// directory consumer administrator determine whether to approve or reject the
  /// share invitation.
  @_s.JsonKey(name: 'ShareNotes')
  final String shareNotes;

  /// Current directory status of the shared AWS Managed Microsoft AD directory.
  @_s.JsonKey(name: 'ShareStatus')
  final ShareStatus shareStatus;

  /// Identifier of the directory consumer account that has access to the shared
  /// directory (<code>OwnerDirectoryId</code>) in the directory owner account.
  @_s.JsonKey(name: 'SharedAccountId')
  final String sharedAccountId;

  /// Identifier of the shared directory in the directory consumer account. This
  /// identifier is different for each directory owner account.
  @_s.JsonKey(name: 'SharedDirectoryId')
  final String sharedDirectoryId;

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
  factory SharedDirectory.fromJson(Map<String, dynamic> json) =>
      _$SharedDirectoryFromJson(json);
}

/// Describes a directory snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Snapshot {
  /// The directory identifier.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The descriptive name of the snapshot.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The snapshot identifier.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  /// The date and time that the snapshot was taken.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The snapshot status.
  @_s.JsonKey(name: 'Status')
  final SnapshotStatus status;

  /// The snapshot type.
  @_s.JsonKey(name: 'Type')
  final SnapshotType type;

  Snapshot({
    this.directoryId,
    this.name,
    this.snapshotId,
    this.startTime,
    this.status,
    this.type,
  });
  factory Snapshot.fromJson(Map<String, dynamic> json) =>
      _$SnapshotFromJson(json);
}

/// Contains manual snapshot limit information for a directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SnapshotLimits {
  /// The current number of manual snapshots of the directory.
  @_s.JsonKey(name: 'ManualSnapshotsCurrentCount')
  final int manualSnapshotsCurrentCount;

  /// The maximum number of manual snapshots allowed.
  @_s.JsonKey(name: 'ManualSnapshotsLimit')
  final int manualSnapshotsLimit;

  /// Indicates if the manual snapshot limit has been reached.
  @_s.JsonKey(name: 'ManualSnapshotsLimitReached')
  final bool manualSnapshotsLimitReached;

  SnapshotLimits({
    this.manualSnapshotsCurrentCount,
    this.manualSnapshotsLimit,
    this.manualSnapshotsLimitReached,
  });
  factory SnapshotLimits.fromJson(Map<String, dynamic> json) =>
      _$SnapshotLimitsFromJson(json);
}

enum SnapshotStatus {
  @_s.JsonValue('Creating')
  creating,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
}

enum SnapshotType {
  @_s.JsonValue('Auto')
  auto,
  @_s.JsonValue('Manual')
  manual,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSchemaExtensionResult {
  /// The identifier of the schema extension that will be applied.
  @_s.JsonKey(name: 'SchemaExtensionId')
  final String schemaExtensionId;

  StartSchemaExtensionResult({
    this.schemaExtensionId,
  });
  factory StartSchemaExtensionResult.fromJson(Map<String, dynamic> json) =>
      _$StartSchemaExtensionResultFromJson(json);
}

/// Metadata assigned to a directory consisting of a key-value pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// Required name of the tag. The string value can be Unicode characters and
  /// cannot be prefixed with "aws:". The string can contain only the set of
  /// Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java
  /// regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The optional value of the tag. The string value can be Unicode characters.
  /// The string can contain only the set of Unicode letters, digits, white-space,
  /// '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

enum TargetType {
  @_s.JsonValue('ACCOUNT')
  account,
}

enum TopicStatus {
  @_s.JsonValue('Registered')
  registered,
  @_s.JsonValue('Topic not found')
  topicNotFound,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Deleted')
  deleted,
}

/// Describes a trust relationship between an AWS Managed Microsoft AD directory
/// and an external domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Trust {
  /// The date and time that the trust relationship was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDateTime')
  final DateTime createdDateTime;

  /// The Directory ID of the AWS directory involved in the trust relationship.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The date and time that the trust relationship was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The Fully Qualified Domain Name (FQDN) of the external domain involved in
  /// the trust relationship.
  @_s.JsonKey(name: 'RemoteDomainName')
  final String remoteDomainName;

  /// Current state of selective authentication for the trust.
  @_s.JsonKey(name: 'SelectiveAuth')
  final SelectiveAuth selectiveAuth;

  /// The date and time that the TrustState was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StateLastUpdatedDateTime')
  final DateTime stateLastUpdatedDateTime;

  /// The trust relationship direction.
  @_s.JsonKey(name: 'TrustDirection')
  final TrustDirection trustDirection;

  /// The unique ID of the trust relationship.
  @_s.JsonKey(name: 'TrustId')
  final String trustId;

  /// The trust relationship state.
  @_s.JsonKey(name: 'TrustState')
  final TrustState trustState;

  /// The reason for the TrustState.
  @_s.JsonKey(name: 'TrustStateReason')
  final String trustStateReason;

  /// The trust relationship type. <code>Forest</code> is the default.
  @_s.JsonKey(name: 'TrustType')
  final TrustType trustType;

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
  factory Trust.fromJson(Map<String, dynamic> json) => _$TrustFromJson(json);
}

enum TrustDirection {
  @_s.JsonValue('One-Way: Outgoing')
  oneWayOutgoing,
  @_s.JsonValue('One-Way: Incoming')
  oneWayIncoming,
  @_s.JsonValue('Two-Way')
  twoWay,
}

extension on TrustDirection {
  String toValue() {
    switch (this) {
      case TrustDirection.oneWayOutgoing:
        return 'One-Way: Outgoing';
      case TrustDirection.oneWayIncoming:
        return 'One-Way: Incoming';
      case TrustDirection.twoWay:
        return 'Two-Way';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum TrustState {
  @_s.JsonValue('Creating')
  creating,
  @_s.JsonValue('Created')
  created,
  @_s.JsonValue('Verifying')
  verifying,
  @_s.JsonValue('VerifyFailed')
  verifyFailed,
  @_s.JsonValue('Verified')
  verified,
  @_s.JsonValue('Updating')
  updating,
  @_s.JsonValue('UpdateFailed')
  updateFailed,
  @_s.JsonValue('Updated')
  updated,
  @_s.JsonValue('Deleting')
  deleting,
  @_s.JsonValue('Deleted')
  deleted,
  @_s.JsonValue('Failed')
  failed,
}

enum TrustType {
  @_s.JsonValue('Forest')
  forest,
  @_s.JsonValue('External')
  external,
}

extension on TrustType {
  String toValue() {
    switch (this) {
      case TrustType.forest:
        return 'Forest';
      case TrustType.external:
        return 'External';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnshareDirectoryResult {
  /// Identifier of the directory stored in the directory consumer account that is
  /// to be unshared from the specified directory (<code>DirectoryId</code>).
  @_s.JsonKey(name: 'SharedDirectoryId')
  final String sharedDirectoryId;

  UnshareDirectoryResult({
    this.sharedDirectoryId,
  });
  factory UnshareDirectoryResult.fromJson(Map<String, dynamic> json) =>
      _$UnshareDirectoryResultFromJson(json);
}

/// Identifier that contains details about the directory consumer account with
/// whom the directory is being unshared.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UnshareTarget {
  /// Identifier of the directory consumer account.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Type of identifier to be used in the <i>Id</i> field.
  @_s.JsonKey(name: 'Type')
  final TargetType type;

  UnshareTarget({
    @_s.required this.id,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$UnshareTargetToJson(this);
}

/// The result of an UpdateConditionalForwarder request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConditionalForwarderResult {
  UpdateConditionalForwarderResult();
  factory UpdateConditionalForwarderResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateConditionalForwarderResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNumberOfDomainControllersResult {
  UpdateNumberOfDomainControllersResult();
  factory UpdateNumberOfDomainControllersResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateNumberOfDomainControllersResultFromJson(json);
}

/// Contains the results of the <a>UpdateRadius</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRadiusResult {
  UpdateRadiusResult();
  factory UpdateRadiusResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateRadiusResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTrustResult {
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// Identifier of the trust relationship.
  @_s.JsonKey(name: 'TrustId')
  final String trustId;

  UpdateTrustResult({
    this.requestId,
    this.trustId,
  });
  factory UpdateTrustResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateTrustResultFromJson(json);
}

/// Result of a VerifyTrust request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VerifyTrustResult {
  /// The unique Trust ID of the trust relationship that was verified.
  @_s.JsonKey(name: 'TrustId')
  final String trustId;

  VerifyTrustResult({
    this.trustId,
  });
  factory VerifyTrustResult.fromJson(Map<String, dynamic> json) =>
      _$VerifyTrustResultFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AuthenticationFailedException extends _s.GenericAwsException {
  AuthenticationFailedException({String type, String message})
      : super(
            type: type,
            code: 'AuthenticationFailedException',
            message: message);
}

class CertificateAlreadyExistsException extends _s.GenericAwsException {
  CertificateAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'CertificateAlreadyExistsException',
            message: message);
}

class CertificateDoesNotExistException extends _s.GenericAwsException {
  CertificateDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'CertificateDoesNotExistException',
            message: message);
}

class CertificateInUseException extends _s.GenericAwsException {
  CertificateInUseException({String type, String message})
      : super(type: type, code: 'CertificateInUseException', message: message);
}

class CertificateLimitExceededException extends _s.GenericAwsException {
  CertificateLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'CertificateLimitExceededException',
            message: message);
}

class ClientException extends _s.GenericAwsException {
  ClientException({String type, String message})
      : super(type: type, code: 'ClientException', message: message);
}

class DirectoryAlreadyInRegionException extends _s.GenericAwsException {
  DirectoryAlreadyInRegionException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryAlreadyInRegionException',
            message: message);
}

class DirectoryAlreadySharedException extends _s.GenericAwsException {
  DirectoryAlreadySharedException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryAlreadySharedException',
            message: message);
}

class DirectoryDoesNotExistException extends _s.GenericAwsException {
  DirectoryDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryDoesNotExistException',
            message: message);
}

class DirectoryLimitExceededException extends _s.GenericAwsException {
  DirectoryLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryLimitExceededException',
            message: message);
}

class DirectoryNotSharedException extends _s.GenericAwsException {
  DirectoryNotSharedException({String type, String message})
      : super(
            type: type, code: 'DirectoryNotSharedException', message: message);
}

class DirectoryUnavailableException extends _s.GenericAwsException {
  DirectoryUnavailableException({String type, String message})
      : super(
            type: type,
            code: 'DirectoryUnavailableException',
            message: message);
}

class DomainControllerLimitExceededException extends _s.GenericAwsException {
  DomainControllerLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'DomainControllerLimitExceededException',
            message: message);
}

class EntityAlreadyExistsException extends _s.GenericAwsException {
  EntityAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'EntityAlreadyExistsException', message: message);
}

class EntityDoesNotExistException extends _s.GenericAwsException {
  EntityDoesNotExistException({String type, String message})
      : super(
            type: type, code: 'EntityDoesNotExistException', message: message);
}

class InsufficientPermissionsException extends _s.GenericAwsException {
  InsufficientPermissionsException({String type, String message})
      : super(
            type: type,
            code: 'InsufficientPermissionsException',
            message: message);
}

class InvalidCertificateException extends _s.GenericAwsException {
  InvalidCertificateException({String type, String message})
      : super(
            type: type, code: 'InvalidCertificateException', message: message);
}

class InvalidClientAuthStatusException extends _s.GenericAwsException {
  InvalidClientAuthStatusException({String type, String message})
      : super(
            type: type,
            code: 'InvalidClientAuthStatusException',
            message: message);
}

class InvalidLDAPSStatusException extends _s.GenericAwsException {
  InvalidLDAPSStatusException({String type, String message})
      : super(
            type: type, code: 'InvalidLDAPSStatusException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidPasswordException extends _s.GenericAwsException {
  InvalidPasswordException({String type, String message})
      : super(type: type, code: 'InvalidPasswordException', message: message);
}

class InvalidTargetException extends _s.GenericAwsException {
  InvalidTargetException({String type, String message})
      : super(type: type, code: 'InvalidTargetException', message: message);
}

class IpRouteLimitExceededException extends _s.GenericAwsException {
  IpRouteLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'IpRouteLimitExceededException',
            message: message);
}

class NoAvailableCertificateException extends _s.GenericAwsException {
  NoAvailableCertificateException({String type, String message})
      : super(
            type: type,
            code: 'NoAvailableCertificateException',
            message: message);
}

class OrganizationsException extends _s.GenericAwsException {
  OrganizationsException({String type, String message})
      : super(type: type, code: 'OrganizationsException', message: message);
}

class RegionLimitExceededException extends _s.GenericAwsException {
  RegionLimitExceededException({String type, String message})
      : super(
            type: type, code: 'RegionLimitExceededException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String type, String message})
      : super(type: type, code: 'ServiceException', message: message);
}

class ShareLimitExceededException extends _s.GenericAwsException {
  ShareLimitExceededException({String type, String message})
      : super(
            type: type, code: 'ShareLimitExceededException', message: message);
}

class SnapshotLimitExceededException extends _s.GenericAwsException {
  SnapshotLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'SnapshotLimitExceededException',
            message: message);
}

class TagLimitExceededException extends _s.GenericAwsException {
  TagLimitExceededException({String type, String message})
      : super(type: type, code: 'TagLimitExceededException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

class UserDoesNotExistException extends _s.GenericAwsException {
  UserDoesNotExistException({String type, String message})
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
  'UserDoesNotExistException': (type, message) =>
      UserDoesNotExistException(type: type, message: message),
};
