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

part 'ds-2015-04-16.g.dart';

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
class DirectoryService {
  final _s.JsonProtocol _protocol;
  DirectoryService({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'ds',
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
      payload: AcceptSharedDirectoryRequest(
        sharedDirectoryId: sharedDirectoryId,
      ),
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
      payload: AddIpRoutesRequest(
        directoryId: directoryId,
        ipRoutes: ipRoutes,
        updateSecurityGroupForDirectoryControllers:
            updateSecurityGroupForDirectoryControllers,
      ),
    );

    return AddIpRoutesResult.fromJson(jsonResponse.body);
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
      payload: AddTagsToResourceRequest(
        resourceId: resourceId,
        tags: tags,
      ),
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
      payload: CancelSchemaExtensionRequest(
        directoryId: directoryId,
        schemaExtensionId: schemaExtensionId,
      ),
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
      r'''^[^\\/:*?\"\<\>|.]+[^\\/:*?\"<>|]*$''',
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
      payload: ConnectDirectoryRequest(
        connectSettings: connectSettings,
        name: name,
        password: password,
        size: size,
        description: description,
        shortName: shortName,
        tags: tags,
      ),
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
      payload: CreateAliasRequest(
        alias: alias,
        directoryId: directoryId,
      ),
    );

    return CreateAliasResult.fromJson(jsonResponse.body);
  }

  /// Creates a computer account in the specified directory, and joins the
  /// computer to the directory.
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
      payload: CreateComputerRequest(
        computerName: computerName,
        directoryId: directoryId,
        password: password,
        computerAttributes: computerAttributes,
        organizationalUnitDistinguishedName:
            organizationalUnitDistinguishedName,
      ),
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
      payload: CreateConditionalForwarderRequest(
        directoryId: directoryId,
        dnsIpAddrs: dnsIpAddrs,
        remoteDomainName: remoteDomainName,
      ),
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
      r'''^[^\\/:*?\"\<\>|.]+[^\\/:*?\"<>|]*$''',
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
      payload: CreateDirectoryRequest(
        name: name,
        password: password,
        size: size,
        description: description,
        shortName: shortName,
        tags: tags,
        vpcSettings: vpcSettings,
      ),
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
      payload: CreateLogSubscriptionRequest(
        directoryId: directoryId,
        logGroupName: logGroupName,
      ),
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
      r'''^[^\\/:*?\"\<\>|.]+[^\\/:*?\"<>|]*$''',
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
      payload: CreateMicrosoftADRequest(
        name: name,
        password: password,
        vpcSettings: vpcSettings,
        description: description,
        edition: edition,
        shortName: shortName,
        tags: tags,
      ),
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
      payload: CreateSnapshotRequest(
        directoryId: directoryId,
        name: name,
      ),
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
      payload: CreateTrustRequest(
        directoryId: directoryId,
        remoteDomainName: remoteDomainName,
        trustDirection: trustDirection,
        trustPassword: trustPassword,
        conditionalForwarderIpAddrs: conditionalForwarderIpAddrs,
        selectiveAuth: selectiveAuth,
        trustType: trustType,
      ),
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
      payload: DeleteConditionalForwarderRequest(
        directoryId: directoryId,
        remoteDomainName: remoteDomainName,
      ),
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
      payload: DeleteDirectoryRequest(
        directoryId: directoryId,
      ),
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
      payload: DeleteLogSubscriptionRequest(
        directoryId: directoryId,
      ),
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
      payload: DeleteSnapshotRequest(
        snapshotId: snapshotId,
      ),
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
      payload: DeleteTrustRequest(
        trustId: trustId,
        deleteAssociatedConditionalForwarder:
            deleteAssociatedConditionalForwarder,
      ),
    );

    return DeleteTrustResult.fromJson(jsonResponse.body);
  }

  /// Deletes from the system the certificate that was registered for a secured
  /// LDAP connection.
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
      payload: DeregisterCertificateRequest(
        certificateId: certificateId,
        directoryId: directoryId,
      ),
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
      payload: DeregisterEventTopicRequest(
        directoryId: directoryId,
        topicName: topicName,
      ),
    );

    return DeregisterEventTopicResult.fromJson(jsonResponse.body);
  }

  /// Displays information about the certificate registered for a secured LDAP
  /// connection.
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
      payload: DescribeCertificateRequest(
        certificateId: certificateId,
        directoryId: directoryId,
      ),
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
      payload: DescribeConditionalForwardersRequest(
        directoryId: directoryId,
        remoteDomainNames: remoteDomainNames,
      ),
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
      payload: DescribeDirectoriesRequest(
        directoryIds: directoryIds,
        limit: limit,
        nextToken: nextToken,
      ),
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
      payload: DescribeDomainControllersRequest(
        directoryId: directoryId,
        domainControllerIds: domainControllerIds,
        limit: limit,
        nextToken: nextToken,
      ),
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
      payload: DescribeEventTopicsRequest(
        directoryId: directoryId,
        topicNames: topicNames,
      ),
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
      payload: DescribeLDAPSSettingsRequest(
        directoryId: directoryId,
        limit: limit,
        nextToken: nextToken,
        type: type,
      ),
    );

    return DescribeLDAPSSettingsResult.fromJson(jsonResponse.body);
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
      payload: DescribeSharedDirectoriesRequest(
        ownerDirectoryId: ownerDirectoryId,
        limit: limit,
        nextToken: nextToken,
        sharedDirectoryIds: sharedDirectoryIds,
      ),
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
      payload: DescribeSnapshotsRequest(
        directoryId: directoryId,
        limit: limit,
        nextToken: nextToken,
        snapshotIds: snapshotIds,
      ),
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
      payload: DescribeTrustsRequest(
        directoryId: directoryId,
        limit: limit,
        nextToken: nextToken,
        trustIds: trustIds,
      ),
    );

    return DescribeTrustsResult.fromJson(jsonResponse.body);
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
      payload: DisableLDAPSRequest(
        directoryId: directoryId,
        type: type,
      ),
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
      payload: DisableRadiusRequest(
        directoryId: directoryId,
      ),
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
      payload: DisableSsoRequest(
        directoryId: directoryId,
        password: password,
        userName: userName,
      ),
    );

    return DisableSsoResult.fromJson(jsonResponse.body);
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
      payload: EnableLDAPSRequest(
        directoryId: directoryId,
        type: type,
      ),
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
      payload: EnableRadiusRequest(
        directoryId: directoryId,
        radiusSettings: radiusSettings,
      ),
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
      payload: EnableSsoRequest(
        directoryId: directoryId,
        password: password,
        userName: userName,
      ),
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
      payload: GetSnapshotLimitsRequest(
        directoryId: directoryId,
      ),
    );

    return GetSnapshotLimitsResult.fromJson(jsonResponse.body);
  }

  /// For the specified directory, lists all the certificates registered for a
  /// secured LDAP connection.
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
      payload: ListCertificatesRequest(
        directoryId: directoryId,
        limit: limit,
        nextToken: nextToken,
      ),
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
      payload: ListIpRoutesRequest(
        directoryId: directoryId,
        limit: limit,
        nextToken: nextToken,
      ),
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
      payload: ListLogSubscriptionsRequest(
        directoryId: directoryId,
        limit: limit,
        nextToken: nextToken,
      ),
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
      payload: ListSchemaExtensionsRequest(
        directoryId: directoryId,
        limit: limit,
        nextToken: nextToken,
      ),
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
      payload: ListTagsForResourceRequest(
        resourceId: resourceId,
        limit: limit,
        nextToken: nextToken,
      ),
    );

    return ListTagsForResourceResult.fromJson(jsonResponse.body);
  }

  /// Registers a certificate for secured LDAP connection.
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
  Future<RegisterCertificateResult> registerCertificate({
    @_s.required String certificateData,
    @_s.required String directoryId,
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
      payload: RegisterCertificateRequest(
        certificateData: certificateData,
        directoryId: directoryId,
      ),
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
      payload: RegisterEventTopicRequest(
        directoryId: directoryId,
        topicName: topicName,
      ),
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
      payload: RejectSharedDirectoryRequest(
        sharedDirectoryId: sharedDirectoryId,
      ),
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
      payload: RemoveIpRoutesRequest(
        cidrIps: cidrIps,
        directoryId: directoryId,
      ),
    );

    return RemoveIpRoutesResult.fromJson(jsonResponse.body);
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
      payload: RemoveTagsFromResourceRequest(
        resourceId: resourceId,
        tagKeys: tagKeys,
      ),
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
      payload: ResetUserPasswordRequest(
        directoryId: directoryId,
        newPassword: newPassword,
        userName: userName,
      ),
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
      payload: RestoreFromSnapshotRequest(
        snapshotId: snapshotId,
      ),
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
      payload: ShareDirectoryRequest(
        directoryId: directoryId,
        shareMethod: shareMethod,
        shareTarget: shareTarget,
        shareNotes: shareNotes,
      ),
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
      payload: StartSchemaExtensionRequest(
        createSnapshotBeforeSchemaExtension:
            createSnapshotBeforeSchemaExtension,
        description: description,
        directoryId: directoryId,
        ldifContent: ldifContent,
      ),
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
      payload: UnshareDirectoryRequest(
        directoryId: directoryId,
        unshareTarget: unshareTarget,
      ),
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
      payload: UpdateConditionalForwarderRequest(
        directoryId: directoryId,
        dnsIpAddrs: dnsIpAddrs,
        remoteDomainName: remoteDomainName,
      ),
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
      payload: UpdateNumberOfDomainControllersRequest(
        desiredNumber: desiredNumber,
        directoryId: directoryId,
      ),
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
      payload: UpdateRadiusRequest(
        directoryId: directoryId,
        radiusSettings: radiusSettings,
      ),
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
      payload: UpdateTrustRequest(
        trustId: trustId,
        selectiveAuth: selectiveAuth,
      ),
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
      payload: VerifyTrustRequest(
        trustId: trustId,
      ),
    );

    return VerifyTrustResult.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AcceptSharedDirectoryRequest {
  /// Identifier of the shared directory in the directory consumer account. This
  /// identifier is different for each directory owner account.
  @_s.JsonKey(name: 'SharedDirectoryId')
  final String sharedDirectoryId;

  AcceptSharedDirectoryRequest({
    @_s.required this.sharedDirectoryId,
  });
  Map<String, dynamic> toJson() => _$AcceptSharedDirectoryRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class AddIpRoutesRequest {
  /// Identifier (ID) of the directory to which to add the address block.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// IP address blocks, using CIDR format, of the traffic to route. This is often
  /// the IP address block of the DNS server used for your on-premises domain.
  @_s.JsonKey(name: 'IpRoutes')
  final List<IpRoute> ipRoutes;

  /// If set to true, updates the inbound and outbound rules of the security group
  /// that has the description: "AWS created security group for <i>directory
  /// ID</i> directory controllers." Following are the new rules:
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
  @_s.JsonKey(name: 'UpdateSecurityGroupForDirectoryControllers')
  final bool updateSecurityGroupForDirectoryControllers;

  AddIpRoutesRequest({
    @_s.required this.directoryId,
    @_s.required this.ipRoutes,
    this.updateSecurityGroupForDirectoryControllers,
  });
  Map<String, dynamic> toJson() => _$AddIpRoutesRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class AddTagsToResourceRequest {
  /// Identifier (ID) for the directory to which to add the tag.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The tags to be assigned to the directory.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  AddTagsToResourceRequest({
    @_s.required this.resourceId,
    @_s.required this.tags,
  });
  Map<String, dynamic> toJson() => _$AddTagsToResourceRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class CancelSchemaExtensionRequest {
  /// The identifier of the directory whose schema extension will be canceled.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The identifier of the schema extension that will be canceled.
  @_s.JsonKey(name: 'SchemaExtensionId')
  final String schemaExtensionId;

  CancelSchemaExtensionRequest({
    @_s.required this.directoryId,
    @_s.required this.schemaExtensionId,
  });
  Map<String, dynamic> toJson() => _$CancelSchemaExtensionRequestToJson(this);
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

  /// The common name for the certificate.
  @_s.JsonKey(name: 'CommonName')
  final String commonName;

  /// The date and time when the certificate will expire.
  @_s.JsonKey(
      name: 'ExpiryDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime expiryDateTime;

  /// The date and time that the certificate was registered.
  @_s.JsonKey(
      name: 'RegisteredDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime registeredDateTime;

  /// The state of the certificate.
  @_s.JsonKey(name: 'State')
  final CertificateState state;

  /// Describes a state change for the certificate.
  @_s.JsonKey(name: 'StateReason')
  final String stateReason;

  Certificate({
    this.certificateId,
    this.commonName,
    this.expiryDateTime,
    this.registeredDateTime,
    this.state,
    this.stateReason,
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
  @_s.JsonKey(
      name: 'ExpiryDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime expiryDateTime;

  /// The state of the certificate.
  @_s.JsonKey(name: 'State')
  final CertificateState state;

  CertificateInfo({
    this.certificateId,
    this.commonName,
    this.expiryDateTime,
    this.state,
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

/// Contains the inputs for the <a>ConnectDirectory</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConnectDirectoryRequest {
  /// A <a>DirectoryConnectSettings</a> object that contains additional
  /// information for the operation.
  @_s.JsonKey(name: 'ConnectSettings')
  final DirectoryConnectSettings connectSettings;

  /// The fully qualified name of the on-premises directory, such as
  /// <code>corp.example.com</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The password for the on-premises user account.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The size of the directory.
  @_s.JsonKey(name: 'Size')
  final DirectorySize size;

  /// A description for the directory.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The NetBIOS name of the on-premises directory, such as <code>CORP</code>.
  @_s.JsonKey(name: 'ShortName')
  final String shortName;

  /// The tags to be assigned to AD Connector.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ConnectDirectoryRequest({
    @_s.required this.connectSettings,
    @_s.required this.name,
    @_s.required this.password,
    @_s.required this.size,
    this.description,
    this.shortName,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$ConnectDirectoryRequestToJson(this);
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

/// Contains the inputs for the <a>CreateAlias</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateAliasRequest {
  /// The requested alias.
  ///
  /// The alias must be unique amongst all aliases in AWS. This operation throws
  /// an <code>EntityAlreadyExistsException</code> error if the alias already
  /// exists.
  @_s.JsonKey(name: 'Alias')
  final String alias;

  /// The identifier of the directory for which to create the alias.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  CreateAliasRequest({
    @_s.required this.alias,
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() => _$CreateAliasRequestToJson(this);
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

/// Contains the inputs for the <a>CreateComputer</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateComputerRequest {
  /// The name of the computer account.
  @_s.JsonKey(name: 'ComputerName')
  final String computerName;

  /// The identifier of the directory in which to create the computer account.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// A one-time password that is used to join the computer to the directory. You
  /// should generate a random, strong password to use for this parameter.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// An array of <a>Attribute</a> objects that contain any LDAP attributes to
  /// apply to the computer account.
  @_s.JsonKey(name: 'ComputerAttributes')
  final List<Attribute> computerAttributes;

  /// The fully-qualified distinguished name of the organizational unit to place
  /// the computer account in.
  @_s.JsonKey(name: 'OrganizationalUnitDistinguishedName')
  final String organizationalUnitDistinguishedName;

  CreateComputerRequest({
    @_s.required this.computerName,
    @_s.required this.directoryId,
    @_s.required this.password,
    this.computerAttributes,
    this.organizationalUnitDistinguishedName,
  });
  Map<String, dynamic> toJson() => _$CreateComputerRequestToJson(this);
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

/// Initiates the creation of a conditional forwarder for your AWS Directory
/// Service for Microsoft Active Directory. Conditional forwarders are required
/// in order to set up a trust relationship with another domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateConditionalForwarderRequest {
  /// The directory ID of the AWS directory for which you are creating the
  /// conditional forwarder.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The IP addresses of the remote DNS server associated with RemoteDomainName.
  @_s.JsonKey(name: 'DnsIpAddrs')
  final List<String> dnsIpAddrs;

  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// will set up a trust relationship.
  @_s.JsonKey(name: 'RemoteDomainName')
  final String remoteDomainName;

  CreateConditionalForwarderRequest({
    @_s.required this.directoryId,
    @_s.required this.dnsIpAddrs,
    @_s.required this.remoteDomainName,
  });
  Map<String, dynamic> toJson() =>
      _$CreateConditionalForwarderRequestToJson(this);
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

/// Contains the inputs for the <a>CreateDirectory</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateDirectoryRequest {
  /// The fully qualified name for the directory, such as
  /// <code>corp.example.com</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The password for the directory administrator. The directory creation process
  /// creates a directory administrator account with the user name
  /// <code>Administrator</code> and this password.
  ///
  /// If you need to change the password for the administrator account, you can
  /// use the <a>ResetUserPassword</a> API call.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The size of the directory.
  @_s.JsonKey(name: 'Size')
  final DirectorySize size;

  /// A description for the directory.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The NetBIOS name of the directory, such as <code>CORP</code>.
  @_s.JsonKey(name: 'ShortName')
  final String shortName;

  /// The tags to be assigned to the Simple AD directory.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// A <a>DirectoryVpcSettings</a> object that contains additional information
  /// for the operation.
  @_s.JsonKey(name: 'VpcSettings')
  final DirectoryVpcSettings vpcSettings;

  CreateDirectoryRequest({
    @_s.required this.name,
    @_s.required this.password,
    @_s.required this.size,
    this.description,
    this.shortName,
    this.tags,
    this.vpcSettings,
  });
  Map<String, dynamic> toJson() => _$CreateDirectoryRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class CreateLogSubscriptionRequest {
  /// Identifier of the directory to which you want to subscribe and receive
  /// real-time logs to your specified CloudWatch log group.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The name of the CloudWatch log group where the real-time domain controller
  /// logs are forwarded.
  @_s.JsonKey(name: 'LogGroupName')
  final String logGroupName;

  CreateLogSubscriptionRequest({
    @_s.required this.directoryId,
    @_s.required this.logGroupName,
  });
  Map<String, dynamic> toJson() => _$CreateLogSubscriptionRequestToJson(this);
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

/// Creates an AWS Managed Microsoft AD directory.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateMicrosoftADRequest {
  /// The fully qualified domain name for the AWS Managed Microsoft AD directory,
  /// such as <code>corp.example.com</code>. This name will resolve inside your
  /// VPC only. It does not need to be publicly resolvable.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The password for the default administrative user named <code>Admin</code>.
  ///
  /// If you need to change the password for the administrator account, you can
  /// use the <a>ResetUserPassword</a> API call.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// Contains VPC information for the <a>CreateDirectory</a> or
  /// <a>CreateMicrosoftAD</a> operation.
  @_s.JsonKey(name: 'VpcSettings')
  final DirectoryVpcSettings vpcSettings;

  /// A description for the directory. This label will appear on the AWS console
  /// <code>Directory Details</code> page after the directory is created.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// AWS Managed Microsoft AD is available in two editions: <code>Standard</code>
  /// and <code>Enterprise</code>. <code>Enterprise</code> is the default.
  @_s.JsonKey(name: 'Edition')
  final DirectoryEdition edition;

  /// The NetBIOS name for your domain, such as <code>CORP</code>. If you don't
  /// specify a NetBIOS name, it will default to the first part of your directory
  /// DNS. For example, <code>CORP</code> for the directory DNS
  /// <code>corp.example.com</code>.
  @_s.JsonKey(name: 'ShortName')
  final String shortName;

  /// The tags to be assigned to the AWS Managed Microsoft AD directory.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  CreateMicrosoftADRequest({
    @_s.required this.name,
    @_s.required this.password,
    @_s.required this.vpcSettings,
    this.description,
    this.edition,
    this.shortName,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateMicrosoftADRequestToJson(this);
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

/// Contains the inputs for the <a>CreateSnapshot</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateSnapshotRequest {
  /// The identifier of the directory of which to take a snapshot.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The descriptive name to apply to the snapshot.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateSnapshotRequest({
    @_s.required this.directoryId,
    this.name,
  });
  Map<String, dynamic> toJson() => _$CreateSnapshotRequestToJson(this);
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

/// AWS Directory Service for Microsoft Active Directory allows you to configure
/// trust relationships. For example, you can establish a trust between your AWS
/// Managed Microsoft AD directory, and your existing on-premises Microsoft
/// Active Directory. This would allow you to provide users and groups access to
/// resources in either domain, with a single set of credentials.
///
/// This action initiates the creation of the AWS side of a trust relationship
/// between an AWS Managed Microsoft AD directory and an external domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateTrustRequest {
  /// The Directory ID of the AWS Managed Microsoft AD directory for which to
  /// establish the trust relationship.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The Fully Qualified Domain Name (FQDN) of the external domain for which to
  /// create the trust relationship.
  @_s.JsonKey(name: 'RemoteDomainName')
  final String remoteDomainName;

  /// The direction of the trust relationship.
  @_s.JsonKey(name: 'TrustDirection')
  final TrustDirection trustDirection;

  /// The trust password. The must be the same password that was used when
  /// creating the trust relationship on the external domain.
  @_s.JsonKey(name: 'TrustPassword')
  final String trustPassword;

  /// The IP addresses of the remote DNS server associated with RemoteDomainName.
  @_s.JsonKey(name: 'ConditionalForwarderIpAddrs')
  final List<String> conditionalForwarderIpAddrs;

  /// Optional parameter to enable selective authentication for the trust.
  @_s.JsonKey(name: 'SelectiveAuth')
  final SelectiveAuth selectiveAuth;

  /// The trust relationship type. <code>Forest</code> is the default.
  @_s.JsonKey(name: 'TrustType')
  final TrustType trustType;

  CreateTrustRequest({
    @_s.required this.directoryId,
    @_s.required this.remoteDomainName,
    @_s.required this.trustDirection,
    @_s.required this.trustPassword,
    this.conditionalForwarderIpAddrs,
    this.selectiveAuth,
    this.trustType,
  });
  Map<String, dynamic> toJson() => _$CreateTrustRequestToJson(this);
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

/// Deletes a conditional forwarder.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteConditionalForwarderRequest {
  /// The directory ID for which you are deleting the conditional forwarder.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// are deleting the conditional forwarder.
  @_s.JsonKey(name: 'RemoteDomainName')
  final String remoteDomainName;

  DeleteConditionalForwarderRequest({
    @_s.required this.directoryId,
    @_s.required this.remoteDomainName,
  });
  Map<String, dynamic> toJson() =>
      _$DeleteConditionalForwarderRequestToJson(this);
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

/// Contains the inputs for the <a>DeleteDirectory</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteDirectoryRequest {
  /// The identifier of the directory to delete.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  DeleteDirectoryRequest({
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() => _$DeleteDirectoryRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DeleteLogSubscriptionRequest {
  /// Identifier of the directory whose log subscription you want to delete.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  DeleteLogSubscriptionRequest({
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() => _$DeleteLogSubscriptionRequestToJson(this);
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

/// Contains the inputs for the <a>DeleteSnapshot</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteSnapshotRequest {
  /// The identifier of the directory snapshot to be deleted.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  DeleteSnapshotRequest({
    @_s.required this.snapshotId,
  });
  Map<String, dynamic> toJson() => _$DeleteSnapshotRequestToJson(this);
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

/// Deletes the local side of an existing trust relationship between the AWS
/// Managed Microsoft AD directory and the external domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteTrustRequest {
  /// The Trust ID of the trust relationship to be deleted.
  @_s.JsonKey(name: 'TrustId')
  final String trustId;

  /// Delete a conditional forwarder as part of a DeleteTrustRequest.
  @_s.JsonKey(name: 'DeleteAssociatedConditionalForwarder')
  final bool deleteAssociatedConditionalForwarder;

  DeleteTrustRequest({
    @_s.required this.trustId,
    this.deleteAssociatedConditionalForwarder,
  });
  Map<String, dynamic> toJson() => _$DeleteTrustRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DeregisterCertificateRequest {
  /// The identifier of the certificate.
  @_s.JsonKey(name: 'CertificateId')
  final String certificateId;

  /// The identifier of the directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  DeregisterCertificateRequest({
    @_s.required this.certificateId,
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() => _$DeregisterCertificateRequestToJson(this);
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

/// Removes the specified directory as a publisher to the specified SNS topic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeregisterEventTopicRequest {
  /// The Directory ID to remove as a publisher. This directory will no longer
  /// send messages to the specified SNS topic.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The name of the SNS topic from which to remove the directory as a publisher.
  @_s.JsonKey(name: 'TopicName')
  final String topicName;

  DeregisterEventTopicRequest({
    @_s.required this.directoryId,
    @_s.required this.topicName,
  });
  Map<String, dynamic> toJson() => _$DeregisterEventTopicRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DescribeCertificateRequest {
  /// The identifier of the certificate.
  @_s.JsonKey(name: 'CertificateId')
  final String certificateId;

  /// The identifier of the directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  DescribeCertificateRequest({
    @_s.required this.certificateId,
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() => _$DescribeCertificateRequestToJson(this);
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

/// Describes a conditional forwarder.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeConditionalForwardersRequest {
  /// The directory ID for which to get the list of associated conditional
  /// forwarders.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The fully qualified domain names (FQDN) of the remote domains for which to
  /// get the list of associated conditional forwarders. If this member is null,
  /// all conditional forwarders are returned.
  @_s.JsonKey(name: 'RemoteDomainNames')
  final List<String> remoteDomainNames;

  DescribeConditionalForwardersRequest({
    @_s.required this.directoryId,
    this.remoteDomainNames,
  });
  Map<String, dynamic> toJson() =>
      _$DescribeConditionalForwardersRequestToJson(this);
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

/// Contains the inputs for the <a>DescribeDirectories</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeDirectoriesRequest {
  /// A list of identifiers of the directories for which to obtain the
  /// information. If this member is null, all directories that belong to the
  /// current account are returned.
  ///
  /// An empty list results in an <code>InvalidParameterException</code> being
  /// thrown.
  @_s.JsonKey(name: 'DirectoryIds')
  final List<String> directoryIds;

  /// The maximum number of items to return. If this value is zero, the maximum
  /// number of items is specified by the limitations of the operation.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The <code>DescribeDirectoriesResult.NextToken</code> value from a previous
  /// call to <a>DescribeDirectories</a>. Pass null if this is the first call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeDirectoriesRequest({
    this.directoryIds,
    this.limit,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$DescribeDirectoriesRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DescribeDomainControllersRequest {
  /// Identifier of the directory for which to retrieve the domain controller
  /// information.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// A list of identifiers for the domain controllers whose information will be
  /// provided.
  @_s.JsonKey(name: 'DomainControllerIds')
  final List<String> domainControllerIds;

  /// The maximum number of items to return.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The <i>DescribeDomainControllers.NextToken</i> value from a previous call to
  /// <a>DescribeDomainControllers</a>. Pass null if this is the first call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeDomainControllersRequest({
    @_s.required this.directoryId,
    this.domainControllerIds,
    this.limit,
    this.nextToken,
  });
  Map<String, dynamic> toJson() =>
      _$DescribeDomainControllersRequestToJson(this);
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

/// Describes event topics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeEventTopicsRequest {
  /// The Directory ID for which to get the list of associated SNS topics. If this
  /// member is null, associations for all Directory IDs are returned.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// A list of SNS topic names for which to obtain the information. If this
  /// member is null, all associations for the specified Directory ID are
  /// returned.
  ///
  /// An empty list results in an <code>InvalidParameterException</code> being
  /// thrown.
  @_s.JsonKey(name: 'TopicNames')
  final List<String> topicNames;

  DescribeEventTopicsRequest({
    this.directoryId,
    this.topicNames,
  });
  Map<String, dynamic> toJson() => _$DescribeEventTopicsRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DescribeLDAPSSettingsRequest {
  /// The identifier of the directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// Specifies the number of items that should be displayed on one page.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The type of next token used for pagination.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The type of LDAP security to enable. Currently only the value
  /// <code>Client</code> is supported.
  @_s.JsonKey(name: 'Type')
  final LDAPSType type;

  DescribeLDAPSSettingsRequest({
    @_s.required this.directoryId,
    this.limit,
    this.nextToken,
    this.type,
  });
  Map<String, dynamic> toJson() => _$DescribeLDAPSSettingsRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DescribeSharedDirectoriesRequest {
  /// Returns the identifier of the directory in the directory owner account.
  @_s.JsonKey(name: 'OwnerDirectoryId')
  final String ownerDirectoryId;

  /// The number of shared directories to return in the response object.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The <code>DescribeSharedDirectoriesResult.NextToken</code> value from a
  /// previous call to <a>DescribeSharedDirectories</a>. Pass null if this is the
  /// first call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of identifiers of all shared directories in your account.
  @_s.JsonKey(name: 'SharedDirectoryIds')
  final List<String> sharedDirectoryIds;

  DescribeSharedDirectoriesRequest({
    @_s.required this.ownerDirectoryId,
    this.limit,
    this.nextToken,
    this.sharedDirectoryIds,
  });
  Map<String, dynamic> toJson() =>
      _$DescribeSharedDirectoriesRequestToJson(this);
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

/// Contains the inputs for the <a>DescribeSnapshots</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeSnapshotsRequest {
  /// The identifier of the directory for which to retrieve snapshot information.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The maximum number of objects to return.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The <i>DescribeSnapshotsResult.NextToken</i> value from a previous call to
  /// <a>DescribeSnapshots</a>. Pass null if this is the first call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of identifiers of the snapshots to obtain the information for. If
  /// this member is null or empty, all snapshots are returned using the
  /// <i>Limit</i> and <i>NextToken</i> members.
  @_s.JsonKey(name: 'SnapshotIds')
  final List<String> snapshotIds;

  DescribeSnapshotsRequest({
    this.directoryId,
    this.limit,
    this.nextToken,
    this.snapshotIds,
  });
  Map<String, dynamic> toJson() => _$DescribeSnapshotsRequestToJson(this);
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

/// Describes the trust relationships for a particular AWS Managed Microsoft AD
/// directory. If no input parameters are are provided, such as directory ID or
/// trust ID, this request describes all the trust relationships.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeTrustsRequest {
  /// The Directory ID of the AWS directory that is a part of the requested trust
  /// relationship.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The maximum number of objects to return.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The <i>DescribeTrustsResult.NextToken</i> value from a previous call to
  /// <a>DescribeTrusts</a>. Pass null if this is the first call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of identifiers of the trust relationships for which to obtain the
  /// information. If this member is null, all trust relationships that belong to
  /// the current account are returned.
  ///
  /// An empty list results in an <code>InvalidParameterException</code> being
  /// thrown.
  @_s.JsonKey(name: 'TrustIds')
  final List<String> trustIds;

  DescribeTrustsRequest({
    this.directoryId,
    this.limit,
    this.nextToken,
    this.trustIds,
  });
  Map<String, dynamic> toJson() => _$DescribeTrustsRequestToJson(this);
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
  @_s.JsonKey(
      name: 'LaunchTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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
  @_s.JsonKey(
      name: 'StageLastUpdatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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
    createFactory: false,
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
    createFactory: false,
    createToJson: true)
class DisableLDAPSRequest {
  /// The identifier of the directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The type of LDAP security to enable. Currently only the value
  /// <code>Client</code> is supported.
  @_s.JsonKey(name: 'Type')
  final LDAPSType type;

  DisableLDAPSRequest({
    @_s.required this.directoryId,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$DisableLDAPSRequestToJson(this);
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

/// Contains the inputs for the <a>DisableRadius</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DisableRadiusRequest {
  /// The identifier of the directory for which to disable MFA.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  DisableRadiusRequest({
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() => _$DisableRadiusRequestToJson(this);
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

/// Contains the inputs for the <a>DisableSso</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DisableSsoRequest {
  /// The identifier of the directory for which to disable single-sign on.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The password of an alternate account to use to disable single-sign on. This
  /// is only used for AD Connector directories. For more information, see the
  /// <i>UserName</i> parameter.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The username of an alternate account to use to disable single-sign on. This
  /// is only used for AD Connector directories. This account must have privileges
  /// to remove a service principal name.
  ///
  /// If the AD Connector service account does not have privileges to remove a
  /// service principal name, you can specify an alternate account with the
  /// <i>UserName</i> and <i>Password</i> parameters. These credentials are only
  /// used to disable single sign-on and are not stored by the service. The AD
  /// Connector service account is not changed.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  DisableSsoRequest({
    @_s.required this.directoryId,
    this.password,
    this.userName,
  });
  Map<String, dynamic> toJson() => _$DisableSsoRequestToJson(this);
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
  @_s.JsonKey(
      name: 'LaunchTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime launchTime;

  /// The status of the domain controller.
  @_s.JsonKey(name: 'Status')
  final DomainControllerStatus status;

  /// The date and time that the status was last updated.
  @_s.JsonKey(
      name: 'StatusLastUpdatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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
    createFactory: false,
    createToJson: true)
class EnableLDAPSRequest {
  /// The identifier of the directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The type of LDAP security to enable. Currently only the value
  /// <code>Client</code> is supported.
  @_s.JsonKey(name: 'Type')
  final LDAPSType type;

  EnableLDAPSRequest({
    @_s.required this.directoryId,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$EnableLDAPSRequestToJson(this);
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

/// Contains the inputs for the <a>EnableRadius</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EnableRadiusRequest {
  /// The identifier of the directory for which to enable MFA.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// A <a>RadiusSettings</a> object that contains information about the RADIUS
  /// server.
  @_s.JsonKey(name: 'RadiusSettings')
  final RadiusSettings radiusSettings;

  EnableRadiusRequest({
    @_s.required this.directoryId,
    @_s.required this.radiusSettings,
  });
  Map<String, dynamic> toJson() => _$EnableRadiusRequestToJson(this);
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

/// Contains the inputs for the <a>EnableSso</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EnableSsoRequest {
  /// The identifier of the directory for which to enable single-sign on.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The password of an alternate account to use to enable single-sign on. This
  /// is only used for AD Connector directories. For more information, see the
  /// <i>UserName</i> parameter.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The username of an alternate account to use to enable single-sign on. This
  /// is only used for AD Connector directories. This account must have privileges
  /// to add a service principal name.
  ///
  /// If the AD Connector service account does not have privileges to add a
  /// service principal name, you can specify an alternate account with the
  /// <i>UserName</i> and <i>Password</i> parameters. These credentials are only
  /// used to enable single sign-on and are not stored by the service. The AD
  /// Connector service account is not changed.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  EnableSsoRequest({
    @_s.required this.directoryId,
    this.password,
    this.userName,
  });
  Map<String, dynamic> toJson() => _$EnableSsoRequestToJson(this);
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
  @_s.JsonKey(
      name: 'CreatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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

/// Contains the inputs for the <a>GetSnapshotLimits</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetSnapshotLimitsRequest {
  /// Contains the identifier of the directory to obtain the limits for.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  GetSnapshotLimitsRequest({
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() => _$GetSnapshotLimitsRequestToJson(this);
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
  @_s.JsonKey(
      name: 'AddedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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
  @_s.JsonKey(
      name: 'LastUpdatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListCertificatesRequest {
  /// The identifier of the directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The number of items that should show up on one page
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// A token for requesting another page of certificates if the
  /// <code>NextToken</code> response element indicates that more certificates are
  /// available. Use the value of the returned <code>NextToken</code> element in
  /// your request until the token comes back as <code>null</code>. Pass
  /// <code>null</code> if this is the first call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCertificatesRequest({
    @_s.required this.directoryId,
    this.limit,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListCertificatesRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class ListIpRoutesRequest {
  /// Identifier (ID) of the directory for which you want to retrieve the IP
  /// addresses.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// Maximum number of items to return. If this value is zero, the maximum number
  /// of items is specified by the limitations of the operation.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The <i>ListIpRoutes.NextToken</i> value from a previous call to
  /// <a>ListIpRoutes</a>. Pass null if this is the first call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIpRoutesRequest({
    @_s.required this.directoryId,
    this.limit,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListIpRoutesRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class ListLogSubscriptionsRequest {
  /// If a <i>DirectoryID</i> is provided, lists only the log subscription
  /// associated with that directory. If no <i>DirectoryId</i> is provided, lists
  /// all log subscriptions associated with your AWS account. If there are no log
  /// subscriptions for the AWS account or the directory, an empty list will be
  /// returned.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The maximum number of items returned.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The token for the next set of items to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLogSubscriptionsRequest({
    this.directoryId,
    this.limit,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListLogSubscriptionsRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class ListSchemaExtensionsRequest {
  /// The identifier of the directory from which to retrieve the schema extension
  /// information.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The maximum number of items to return.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// The <code>ListSchemaExtensions.NextToken</code> value from a previous call
  /// to <code>ListSchemaExtensions</code>. Pass null if this is the first call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListSchemaExtensionsRequest({
    @_s.required this.directoryId,
    this.limit,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListSchemaExtensionsRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class ListTagsForResourceRequest {
  /// Identifier (ID) of the directory for which you want to retrieve tags.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// Reserved for future use.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  /// Reserved for future use.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTagsForResourceRequest({
    @_s.required this.resourceId,
    this.limit,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListTagsForResourceRequestToJson(this);
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
  @_s.JsonKey(
      name: 'SubscriptionCreatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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

  /// An array of strings that contains the IP addresses of the RADIUS server
  /// endpoints, or the IP addresses of your RADIUS server load balancer.
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RegisterCertificateRequest {
  /// The certificate PEM string that needs to be registered.
  @_s.JsonKey(name: 'CertificateData')
  final String certificateData;

  /// The identifier of the directory.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  RegisterCertificateRequest({
    @_s.required this.certificateData,
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() => _$RegisterCertificateRequestToJson(this);
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

/// Registers a new event topic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RegisterEventTopicRequest {
  /// The Directory ID that will publish status messages to the SNS topic.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The SNS topic name to which the directory will publish status messages. This
  /// SNS topic must be in the same region as the specified Directory ID.
  @_s.JsonKey(name: 'TopicName')
  final String topicName;

  RegisterEventTopicRequest({
    @_s.required this.directoryId,
    @_s.required this.topicName,
  });
  Map<String, dynamic> toJson() => _$RegisterEventTopicRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class RejectSharedDirectoryRequest {
  /// Identifier of the shared directory in the directory consumer account. This
  /// identifier is different for each directory owner account.
  @_s.JsonKey(name: 'SharedDirectoryId')
  final String sharedDirectoryId;

  RejectSharedDirectoryRequest({
    @_s.required this.sharedDirectoryId,
  });
  Map<String, dynamic> toJson() => _$RejectSharedDirectoryRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class RemoveIpRoutesRequest {
  /// IP address blocks that you want to remove.
  @_s.JsonKey(name: 'CidrIps')
  final List<String> cidrIps;

  /// Identifier (ID) of the directory from which you want to remove the IP
  /// addresses.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  RemoveIpRoutesRequest({
    @_s.required this.cidrIps,
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() => _$RemoveIpRoutesRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class RemoveTagsFromResourceRequest {
  /// Identifier (ID) of the directory from which to remove the tag.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The tag key (name) of the tag to be removed.
  @_s.JsonKey(name: 'TagKeys')
  final List<String> tagKeys;

  RemoveTagsFromResourceRequest({
    @_s.required this.resourceId,
    @_s.required this.tagKeys,
  });
  Map<String, dynamic> toJson() => _$RemoveTagsFromResourceRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class ResetUserPasswordRequest {
  /// Identifier of the AWS Managed Microsoft AD or Simple AD directory in which
  /// the user resides.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The new password that will be reset.
  @_s.JsonKey(name: 'NewPassword')
  final String newPassword;

  /// The user name of the user whose password will be reset.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  ResetUserPasswordRequest({
    @_s.required this.directoryId,
    @_s.required this.newPassword,
    @_s.required this.userName,
  });
  Map<String, dynamic> toJson() => _$ResetUserPasswordRequestToJson(this);
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

/// An object representing the inputs for the <a>RestoreFromSnapshot</a>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RestoreFromSnapshotRequest {
  /// The identifier of the snapshot to restore from.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  RestoreFromSnapshotRequest({
    @_s.required this.snapshotId,
  });
  Map<String, dynamic> toJson() => _$RestoreFromSnapshotRequestToJson(this);
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
  @_s.JsonKey(
      name: 'EndDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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
  @_s.JsonKey(
      name: 'StartDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ShareDirectoryRequest {
  /// Identifier of the AWS Managed Microsoft AD directory that you want to share
  /// with other AWS accounts.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The method used when sharing a directory to determine whether the directory
  /// should be shared within your AWS organization (<code>ORGANIZATIONS</code>)
  /// or with any AWS account by sending a directory sharing request
  /// (<code>HANDSHAKE</code>).
  @_s.JsonKey(name: 'ShareMethod')
  final ShareMethod shareMethod;

  /// Identifier for the directory consumer account with whom the directory is to
  /// be shared.
  @_s.JsonKey(name: 'ShareTarget')
  final ShareTarget shareTarget;

  /// A directory share request that is sent by the directory owner to the
  /// directory consumer. The request includes a typed message to help the
  /// directory consumer administrator determine whether to approve or reject the
  /// share invitation.
  @_s.JsonKey(name: 'ShareNotes')
  final String shareNotes;

  ShareDirectoryRequest({
    @_s.required this.directoryId,
    @_s.required this.shareMethod,
    @_s.required this.shareTarget,
    this.shareNotes,
  });
  Map<String, dynamic> toJson() => _$ShareDirectoryRequestToJson(this);
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
  @_s.JsonKey(
      name: 'CreatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdDateTime;

  /// The date and time that the shared directory was last updated.
  @_s.JsonKey(
      name: 'LastUpdatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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
  @_s.JsonKey(
      name: 'StartTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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
    createFactory: false,
    createToJson: true)
class StartSchemaExtensionRequest {
  /// If true, creates a snapshot of the directory before applying the schema
  /// extension.
  @_s.JsonKey(name: 'CreateSnapshotBeforeSchemaExtension')
  final bool createSnapshotBeforeSchemaExtension;

  /// A description of the schema extension.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier of the directory for which the schema extension will be
  /// applied to.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The LDIF file represented as a string. To construct the LdifContent string,
  /// precede each line as it would be formatted in an ldif file with \n. See the
  /// example request below for more details. The file size can be no larger than
  /// 1MB.
  @_s.JsonKey(name: 'LdifContent')
  final String ldifContent;

  StartSchemaExtensionRequest({
    @_s.required this.createSnapshotBeforeSchemaExtension,
    @_s.required this.description,
    @_s.required this.directoryId,
    @_s.required this.ldifContent,
  });
  Map<String, dynamic> toJson() => _$StartSchemaExtensionRequestToJson(this);
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
  @_s.JsonKey(
      name: 'CreatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdDateTime;

  /// The Directory ID of the AWS directory involved in the trust relationship.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The date and time that the trust relationship was last updated.
  @_s.JsonKey(
      name: 'LastUpdatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedDateTime;

  /// The Fully Qualified Domain Name (FQDN) of the external domain involved in
  /// the trust relationship.
  @_s.JsonKey(name: 'RemoteDomainName')
  final String remoteDomainName;

  /// Current state of selective authentication for the trust.
  @_s.JsonKey(name: 'SelectiveAuth')
  final SelectiveAuth selectiveAuth;

  /// The date and time that the TrustState was last updated.
  @_s.JsonKey(
      name: 'StateLastUpdatedDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UnshareDirectoryRequest {
  /// The identifier of the AWS Managed Microsoft AD directory that you want to
  /// stop sharing.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// Identifier for the directory consumer account with whom the directory has to
  /// be unshared.
  @_s.JsonKey(name: 'UnshareTarget')
  final UnshareTarget unshareTarget;

  UnshareDirectoryRequest({
    @_s.required this.directoryId,
    @_s.required this.unshareTarget,
  });
  Map<String, dynamic> toJson() => _$UnshareDirectoryRequestToJson(this);
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

/// Updates a conditional forwarder.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateConditionalForwarderRequest {
  /// The directory ID of the AWS directory for which to update the conditional
  /// forwarder.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The updated IP addresses of the remote DNS server associated with the
  /// conditional forwarder.
  @_s.JsonKey(name: 'DnsIpAddrs')
  final List<String> dnsIpAddrs;

  /// The fully qualified domain name (FQDN) of the remote domain with which you
  /// will set up a trust relationship.
  @_s.JsonKey(name: 'RemoteDomainName')
  final String remoteDomainName;

  UpdateConditionalForwarderRequest({
    @_s.required this.directoryId,
    @_s.required this.dnsIpAddrs,
    @_s.required this.remoteDomainName,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateConditionalForwarderRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class UpdateNumberOfDomainControllersRequest {
  /// The number of domain controllers desired in the directory.
  @_s.JsonKey(name: 'DesiredNumber')
  final int desiredNumber;

  /// Identifier of the directory to which the domain controllers will be added or
  /// removed.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  UpdateNumberOfDomainControllersRequest({
    @_s.required this.desiredNumber,
    @_s.required this.directoryId,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateNumberOfDomainControllersRequestToJson(this);
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

/// Contains the inputs for the <a>UpdateRadius</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateRadiusRequest {
  /// The identifier of the directory for which to update the RADIUS server
  /// information.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// A <a>RadiusSettings</a> object that contains information about the RADIUS
  /// server.
  @_s.JsonKey(name: 'RadiusSettings')
  final RadiusSettings radiusSettings;

  UpdateRadiusRequest({
    @_s.required this.directoryId,
    @_s.required this.radiusSettings,
  });
  Map<String, dynamic> toJson() => _$UpdateRadiusRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class UpdateTrustRequest {
  /// Identifier of the trust relationship.
  @_s.JsonKey(name: 'TrustId')
  final String trustId;

  /// Updates selective authentication for the trust.
  @_s.JsonKey(name: 'SelectiveAuth')
  final SelectiveAuth selectiveAuth;

  UpdateTrustRequest({
    @_s.required this.trustId,
    this.selectiveAuth,
  });
  Map<String, dynamic> toJson() => _$UpdateTrustRequestToJson(this);
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

/// Initiates the verification of an existing trust relationship between an AWS
/// Managed Microsoft AD directory and an external domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VerifyTrustRequest {
  /// The unique Trust ID of the trust relationship to verify.
  @_s.JsonKey(name: 'TrustId')
  final String trustId;

  VerifyTrustRequest({
    @_s.required this.trustId,
  });
  Map<String, dynamic> toJson() => _$VerifyTrustRequestToJson(this);
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
