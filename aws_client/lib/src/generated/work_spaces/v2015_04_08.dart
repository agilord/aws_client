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

/// Amazon WorkSpaces enables you to provision virtual, cloud-based Microsoft
/// Windows or Amazon Linux desktops for your users, known as <i>WorkSpaces</i>.
/// WorkSpaces eliminates the need to procure and deploy hardware or install
/// complex software. You can quickly add or remove users as your needs change.
/// Users can access their virtual desktops from multiple devices or web
/// browsers.
class WorkSpaces {
  final _s.JsonProtocol _protocol;
  WorkSpaces({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workspaces',
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

  /// Accepts the account link invitation.
  /// <important>
  /// There's currently no unlinking capability after you accept the account
  /// linking invitation.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [linkId] :
  /// The identifier of the account link.
  ///
  /// Parameter [clientToken] :
  /// A string of up to 64 ASCII characters that Amazon EFS uses to ensure
  /// idempotent creation.
  Future<AcceptAccountLinkInvitationResult> acceptAccountLinkInvitation({
    required String linkId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.AcceptAccountLinkInvitation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LinkId': linkId,
        if (clientToken != null) 'ClientToken': clientToken,
      },
    );

    return AcceptAccountLinkInvitationResult.fromJson(jsonResponse.body);
  }

  /// Associates the specified connection alias with the specified directory to
  /// enable cross-Region redirection. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
  /// Cross-Region Redirection for Amazon WorkSpaces</a>.
  /// <note>
  /// Before performing this operation, call <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeConnectionAliases.html">
  /// DescribeConnectionAliases</a> to make sure that the current state of the
  /// connection alias is <code>CREATED</code>.
  /// </note>
  ///
  /// May throw [ResourceAssociatedException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [InvalidResourceStateException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [aliasId] :
  /// The identifier of the connection alias.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the directory to associate the connection alias with.
  Future<AssociateConnectionAliasResult> associateConnectionAlias({
    required String aliasId,
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.AssociateConnectionAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
        'ResourceId': resourceId,
      },
    );

    return AssociateConnectionAliasResult.fromJson(jsonResponse.body);
  }

  /// Associates the specified IP access control group with the specified
  /// directory.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidResourceStateException].
  /// May throw [AccessDeniedException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  ///
  /// Parameter [groupIds] :
  /// The identifiers of one or more IP access control groups.
  Future<void> associateIpGroups({
    required String directoryId,
    required List<String> groupIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.AssociateIpGroups'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'GroupIds': groupIds,
      },
    );
  }

  /// Associates the specified application to the specified WorkSpace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ComputeNotCompatibleException].
  /// May throw [OperatingSystemNotCompatibleException].
  /// May throw [ApplicationNotSupportedException].
  /// May throw [IncompatibleApplicationsException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application.
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  Future<AssociateWorkspaceApplicationResult> associateWorkspaceApplication({
    required String applicationId,
    required String workspaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.AssociateWorkspaceApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationId': applicationId,
        'WorkspaceId': workspaceId,
      },
    );

    return AssociateWorkspaceApplicationResult.fromJson(jsonResponse.body);
  }

  /// Adds one or more rules to the specified IP access control group.
  ///
  /// This action gives users permission to access their WorkSpaces from the
  /// CIDR address ranges specified in the rules.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidResourceStateException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [groupId] :
  /// The identifier of the group.
  ///
  /// Parameter [userRules] :
  /// The rules to add to the group.
  Future<void> authorizeIpRules({
    required String groupId,
    required List<IpRuleItem> userRules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.AuthorizeIpRules'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'UserRules': userRules,
      },
    );
  }

  /// Copies the specified image from the specified Region to the current
  /// Region. For more information about copying images, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/copy-custom-image.html">
  /// Copy a Custom WorkSpaces Image</a>.
  ///
  /// In the China (Ningxia) Region, you can copy images only within the same
  /// Region.
  ///
  /// In Amazon Web Services GovCloud (US), to copy images to and from other
  /// Regions, contact Amazon Web Services Support.
  /// <important>
  /// Before copying a shared image, be sure to verify that it has been shared
  /// from the correct Amazon Web Services account. To determine if an image has
  /// been shared and to see the ID of the Amazon Web Services account that owns
  /// an image, use the <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceImages.html">DescribeWorkSpaceImages</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceImagePermissions.html">DescribeWorkspaceImagePermissions</a>
  /// API operations.
  /// </important>
  ///
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [OperationNotSupportedException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [name] :
  /// The name of the image.
  ///
  /// Parameter [sourceImageId] :
  /// The identifier of the source image.
  ///
  /// Parameter [sourceRegion] :
  /// The identifier of the source Region.
  ///
  /// Parameter [description] :
  /// A description of the image.
  ///
  /// Parameter [tags] :
  /// The tags for the image.
  Future<CopyWorkspaceImageResult> copyWorkspaceImage({
    required String name,
    required String sourceImageId,
    required String sourceRegion,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CopyWorkspaceImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'SourceImageId': sourceImageId,
        'SourceRegion': sourceRegion,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CopyWorkspaceImageResult.fromJson(jsonResponse.body);
  }

  /// Creates the account link invitation.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [targetAccountId] :
  /// The identifier of the target account.
  ///
  /// Parameter [clientToken] :
  /// A string of up to 64 ASCII characters that Amazon EFS uses to ensure
  /// idempotent creation.
  Future<CreateAccountLinkInvitationResult> createAccountLinkInvitation({
    required String targetAccountId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateAccountLinkInvitation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TargetAccountId': targetAccountId,
        if (clientToken != null) 'ClientToken': clientToken,
      },
    );

    return CreateAccountLinkInvitationResult.fromJson(jsonResponse.body);
  }

  /// Creates a client-add-in for Amazon Connect within a directory. You can
  /// create only one Amazon Connect client add-in within a directory.
  ///
  /// This client add-in allows WorkSpaces users to seamlessly connect to Amazon
  /// Connect.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceCreationFailedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the client add-in.
  ///
  /// Parameter [resourceId] :
  /// The directory identifier for which to configure the client add-in.
  ///
  /// Parameter [url] :
  /// The endpoint URL of the Amazon Connect client add-in.
  Future<CreateConnectClientAddInResult> createConnectClientAddIn({
    required String name,
    required String resourceId,
    required String url,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateConnectClientAddIn'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'ResourceId': resourceId,
        'URL': url,
      },
    );

    return CreateConnectClientAddInResult.fromJson(jsonResponse.body);
  }

  /// Creates the specified connection alias for use with cross-Region
  /// redirection. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
  /// Cross-Region Redirection for Amazon WorkSpaces</a>.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidResourceStateException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [connectionString] :
  /// A connection string in the form of a fully qualified domain name (FQDN),
  /// such as <code>www.example.com</code>.
  /// <important>
  /// After you create a connection string, it is always associated to your
  /// Amazon Web Services account. You cannot recreate the same connection
  /// string with a different account, even if you delete all instances of it
  /// from the original account. The connection string is globally reserved for
  /// your account.
  /// </important>
  ///
  /// Parameter [tags] :
  /// The tags to associate with the connection alias.
  Future<CreateConnectionAliasResult> createConnectionAlias({
    required String connectionString,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateConnectionAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionString': connectionString,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateConnectionAliasResult.fromJson(jsonResponse.body);
  }

  /// Creates an IP access control group.
  ///
  /// An IP access control group provides you with the ability to control the IP
  /// addresses from which users are allowed to access their WorkSpaces. To
  /// specify the CIDR address ranges, add rules to your IP access control group
  /// and then associate the group with your directory. You can add rules when
  /// you create the group or at any time using <a>AuthorizeIpRules</a>.
  ///
  /// There is a default IP access control group associated with your directory.
  /// If you don't associate an IP access control group with your directory, the
  /// default group is used. The default group includes a default rule that
  /// allows users to access their WorkSpaces from anywhere. You cannot modify
  /// the default IP access control group for your directory.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceCreationFailedException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [groupName] :
  /// The name of the group.
  ///
  /// Parameter [groupDesc] :
  /// The description of the group.
  ///
  /// Parameter [tags] :
  /// The tags. Each WorkSpaces resource can have a maximum of 50 tags.
  ///
  /// Parameter [userRules] :
  /// The rules to add to the group.
  Future<CreateIpGroupResult> createIpGroup({
    required String groupName,
    String? groupDesc,
    List<Tag>? tags,
    List<IpRuleItem>? userRules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateIpGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupName': groupName,
        if (groupDesc != null) 'GroupDesc': groupDesc,
        if (tags != null) 'Tags': tags,
        if (userRules != null) 'UserRules': userRules,
      },
    );

    return CreateIpGroupResult.fromJson(jsonResponse.body);
  }

  /// Creates a standby WorkSpace in a secondary Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceLimitExceededException].
  ///
  /// Parameter [primaryRegion] :
  /// The Region of the primary WorkSpace.
  ///
  /// Parameter [standbyWorkspaces] :
  /// Information about the standby WorkSpace to be created.
  Future<CreateStandbyWorkspacesResult> createStandbyWorkspaces({
    required String primaryRegion,
    required List<StandbyWorkspace> standbyWorkspaces,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateStandbyWorkspaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PrimaryRegion': primaryRegion,
        'StandbyWorkspaces': standbyWorkspaces,
      },
    );

    return CreateStandbyWorkspacesResult.fromJson(jsonResponse.body);
  }

  /// Creates the specified tags for the specified WorkSpaces resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceLimitExceededException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the WorkSpaces resource. The supported resource types
  /// are WorkSpaces, registered directories, images, custom bundles, IP access
  /// control groups, and connection aliases.
  ///
  /// Parameter [tags] :
  /// The tags. Each WorkSpaces resource can have a maximum of 50 tags.
  Future<void> createTags({
    required String resourceId,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateTags'
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

  /// Creates a new updated WorkSpace image based on the specified source image.
  /// The new updated WorkSpace image has the latest drivers and other updates
  /// required by the Amazon WorkSpaces components.
  ///
  /// To determine which WorkSpace images need to be updated with the latest
  /// Amazon WorkSpaces requirements, use <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceImages.html">
  /// DescribeWorkspaceImages</a>.
  /// <note>
  /// <ul>
  /// <li>
  /// Only Windows 10, Windows Server 2016, and Windows Server 2019 WorkSpace
  /// images can be programmatically updated at this time.
  /// </li>
  /// <li>
  /// Microsoft Windows updates and other application updates are not included
  /// in the update process.
  /// </li>
  /// <li>
  /// The source WorkSpace image is not deleted. You can delete the source image
  /// after you've verified your new updated image and created a new bundle.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotSupportedException].
  /// May throw [InvalidResourceStateException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [description] :
  /// A description of whether updates for the WorkSpace image are available.
  ///
  /// Parameter [name] :
  /// The name of the new updated WorkSpace image.
  ///
  /// Parameter [sourceImageId] :
  /// The identifier of the source WorkSpace image.
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the new updated WorkSpace image.
  /// <note>
  /// To add tags at the same time when you're creating the updated image, you
  /// must create an IAM policy that grants your IAM user permissions to use
  /// <code>workspaces:CreateTags</code>.
  /// </note>
  Future<CreateUpdatedWorkspaceImageResult> createUpdatedWorkspaceImage({
    required String description,
    required String name,
    required String sourceImageId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateUpdatedWorkspaceImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'Name': name,
        'SourceImageId': sourceImageId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateUpdatedWorkspaceImageResult.fromJson(jsonResponse.body);
  }

  /// Creates the specified WorkSpace bundle. For more information about
  /// creating WorkSpace bundles, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/create-custom-bundle.html">
  /// Create a Custom WorkSpaces Image and Bundle</a>.
  ///
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [bundleDescription] :
  /// The description of the bundle.
  ///
  /// Parameter [bundleName] :
  /// The name of the bundle.
  ///
  /// Parameter [imageId] :
  /// The identifier of the image that is used to create the bundle.
  ///
  /// Parameter [tags] :
  /// The tags associated with the bundle.
  /// <note>
  /// To add tags at the same time when you're creating the bundle, you must
  /// create an IAM policy that grants your IAM user permissions to use
  /// <code>workspaces:CreateTags</code>.
  /// </note>
  Future<CreateWorkspaceBundleResult> createWorkspaceBundle({
    required String bundleDescription,
    required String bundleName,
    required ComputeType computeType,
    required String imageId,
    required UserStorage userStorage,
    RootStorage? rootStorage,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateWorkspaceBundle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BundleDescription': bundleDescription,
        'BundleName': bundleName,
        'ComputeType': computeType,
        'ImageId': imageId,
        'UserStorage': userStorage,
        if (rootStorage != null) 'RootStorage': rootStorage,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateWorkspaceBundleResult.fromJson(jsonResponse.body);
  }

  /// Creates a new WorkSpace image from an existing WorkSpace.
  ///
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotSupportedException].
  /// May throw [InvalidResourceStateException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [description] :
  /// The description of the new WorkSpace image.
  ///
  /// Parameter [name] :
  /// The name of the new WorkSpace image.
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the source WorkSpace
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the new WorkSpace image. To add tags when
  /// you're creating the image, you must create an IAM policy that grants your
  /// IAM user permission to use <code>workspaces:CreateTags</code>.
  Future<CreateWorkspaceImageResult> createWorkspaceImage({
    required String description,
    required String name,
    required String workspaceId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateWorkspaceImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'Name': name,
        'WorkspaceId': workspaceId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateWorkspaceImageResult.fromJson(jsonResponse.body);
  }

  /// Creates one or more WorkSpaces.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces are
  /// created.
  /// <note>
  /// <ul>
  /// <li>
  /// The <code>MANUAL</code> running mode value is only supported by Amazon
  /// WorkSpaces Core. Contact your account team to be allow-listed to use this
  /// value. For more information, see <a
  /// href="http://aws.amazon.com/workspaces/core/">Amazon WorkSpaces Core</a>.
  /// </li>
  /// <li>
  /// You don't need to specify the <code>PCOIP</code> protocol for Linux
  /// bundles because <code>WSP</code> is the default protocol for those
  /// bundles.
  /// </li>
  /// <li>
  /// User-decoupled WorkSpaces are only supported by Amazon WorkSpaces Core.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [workspaces] :
  /// The WorkSpaces to create. You can specify up to 25 WorkSpaces.
  Future<CreateWorkspacesResult> createWorkspaces({
    required List<WorkspaceRequest> workspaces,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateWorkspaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Workspaces': workspaces,
      },
    );

    return CreateWorkspacesResult.fromJson(jsonResponse.body);
  }

  /// Deletes the account link invitation.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [linkId] :
  /// The identifier of the account link.
  ///
  /// Parameter [clientToken] :
  /// A string of up to 64 ASCII characters that Amazon EFS uses to ensure
  /// idempotent creation.
  Future<DeleteAccountLinkInvitationResult> deleteAccountLinkInvitation({
    required String linkId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteAccountLinkInvitation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LinkId': linkId,
        if (clientToken != null) 'ClientToken': clientToken,
      },
    );

    return DeleteAccountLinkInvitationResult.fromJson(jsonResponse.body);
  }

  /// Deletes customized client branding. Client branding allows you to
  /// customize your WorkSpace's client login portal. You can tailor your login
  /// portal company logo, the support email address, support link, link to
  /// reset password, and a custom message for users trying to sign in.
  ///
  /// After you delete your customized client branding, your login portal
  /// reverts to the default client branding.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [platforms] :
  /// The device type for which you want to delete client branding.
  ///
  /// Parameter [resourceId] :
  /// The directory identifier of the WorkSpace for which you want to delete
  /// client branding.
  Future<void> deleteClientBranding({
    required List<ClientDeviceType> platforms,
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteClientBranding'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Platforms': platforms.map((e) => e.toValue()).toList(),
        'ResourceId': resourceId,
      },
    );
  }

  /// Deletes a client-add-in for Amazon Connect that is configured within a
  /// directory.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [addInId] :
  /// The identifier of the client add-in to delete.
  ///
  /// Parameter [resourceId] :
  /// The directory identifier for which the client add-in is configured.
  Future<void> deleteConnectClientAddIn({
    required String addInId,
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteConnectClientAddIn'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddInId': addInId,
        'ResourceId': resourceId,
      },
    );
  }

  /// Deletes the specified connection alias. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
  /// Cross-Region Redirection for Amazon WorkSpaces</a>.
  /// <important>
  /// <b>If you will no longer be using a fully qualified domain name (FQDN) as
  /// the registration code for your WorkSpaces users, you must take certain
  /// precautions to prevent potential security issues.</b> For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html#cross-region-redirection-security-considerations">
  /// Security Considerations if You Stop Using Cross-Region Redirection</a>.
  /// </important> <note>
  /// To delete a connection alias that has been shared, the shared account must
  /// first disassociate the connection alias from any directories it has been
  /// associated with. Then you must unshare the connection alias from the
  /// account it has been shared with. You can delete a connection alias only
  /// after it is no longer shared with any accounts or associated with any
  /// directories.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAssociatedException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [InvalidResourceStateException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [aliasId] :
  /// The identifier of the connection alias to delete.
  Future<void> deleteConnectionAlias({
    required String aliasId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteConnectionAlias'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
      },
    );
  }

  /// Deletes the specified IP access control group.
  ///
  /// You cannot delete an IP access control group that is associated with a
  /// directory.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAssociatedException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [groupId] :
  /// The identifier of the IP access control group.
  Future<void> deleteIpGroup({
    required String groupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteIpGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
      },
    );
  }

  /// Deletes the specified tags from the specified WorkSpaces resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the WorkSpaces resource. The supported resource types
  /// are WorkSpaces, registered directories, images, custom bundles, IP access
  /// control groups, and connection aliases.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> deleteTags({
    required String resourceId,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteTags'
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

  /// Deletes the specified WorkSpace bundle. For more information about
  /// deleting WorkSpace bundles, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/delete_bundle.html">
  /// Delete a Custom WorkSpaces Bundle or Image</a>.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAssociatedException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [bundleId] :
  /// The identifier of the bundle.
  Future<void> deleteWorkspaceBundle({
    String? bundleId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteWorkspaceBundle'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (bundleId != null) 'BundleId': bundleId,
      },
    );
  }

  /// Deletes the specified image from your account. To delete an image, you
  /// must first delete any bundles that are associated with the image and
  /// unshare the image if it is shared with other accounts.
  ///
  /// May throw [ResourceAssociatedException].
  /// May throw [InvalidResourceStateException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [imageId] :
  /// The identifier of the image.
  Future<void> deleteWorkspaceImage({
    required String imageId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteWorkspaceImage'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImageId': imageId,
      },
    );
  }

  /// Deploys associated applications to the specified WorkSpace
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [IncompatibleApplicationsException].
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  ///
  /// Parameter [force] :
  /// Indicates whether the force flag is applied for the specified WorkSpace.
  /// When the force flag is enabled, it allows previously failed deployments to
  /// be retried.
  Future<DeployWorkspaceApplicationsResult> deployWorkspaceApplications({
    required String workspaceId,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeployWorkspaceApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceId': workspaceId,
        if (force != null) 'Force': force,
      },
    );

    return DeployWorkspaceApplicationsResult.fromJson(jsonResponse.body);
  }

  /// Deregisters the specified directory. This operation is asynchronous and
  /// returns before the WorkSpace directory is deregistered. If any WorkSpaces
  /// are registered to this directory, you must remove them before you can
  /// deregister the directory.
  /// <note>
  /// Simple AD and AD Connector are made available to you free of charge to use
  /// with WorkSpaces. If there are no WorkSpaces being used with your Simple AD
  /// or AD Connector directory for 30 consecutive days, this directory will be
  /// automatically deregistered for use with Amazon WorkSpaces, and you will be
  /// charged for this directory as per the <a
  /// href="http://aws.amazon.com/directoryservice/pricing/">Directory Service
  /// pricing terms</a>.
  ///
  /// To delete empty directories, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/delete-workspaces-directory.html">
  /// Delete the Directory for Your WorkSpaces</a>. If you delete your Simple AD
  /// or AD Connector directory, you can always create a new one when you want
  /// to start using WorkSpaces again.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidResourceStateException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory. If any WorkSpaces are registered to this
  /// directory, you must remove them before you deregister the directory, or
  /// you will receive an OperationNotSupportedException error.
  Future<void> deregisterWorkspaceDirectory({
    required String directoryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeregisterWorkspaceDirectory'
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

  /// Retrieves a list that describes the configuration of Bring Your Own
  /// License (BYOL) for the specified account.
  ///
  /// May throw [AccessDeniedException].
  Future<DescribeAccountResult> describeAccount() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeAccountResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes modifications to the configuration of
  /// Bring Your Own License (BYOL) for the specified account.
  ///
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeAccountModificationsResult> describeAccountModifications({
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeAccountModifications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAccountModificationsResult.fromJson(jsonResponse.body);
  }

  /// Describes the associations between the application and the specified
  /// associated resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the specified application.
  ///
  /// Parameter [associatedResourceTypes] :
  /// The resource type of the associated resources.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of associations to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeApplicationAssociationsResult>
      describeApplicationAssociations({
    required String applicationId,
    required List<ApplicationAssociatedResourceType> associatedResourceTypes,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeApplicationAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationId': applicationId,
        'AssociatedResourceTypes':
            associatedResourceTypes.map((e) => e.toValue()).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeApplicationAssociationsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified applications by filtering based on their compute
  /// types, license availability, operating systems, and owners.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [applicationIds] :
  /// The identifiers of one or more applications.
  ///
  /// Parameter [computeTypeNames] :
  /// The compute types supported by the applications.
  ///
  /// Parameter [licenseType] :
  /// The license availability for the applications.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of applications to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  ///
  /// Parameter [operatingSystemNames] :
  /// The operating systems supported by the applications.
  ///
  /// Parameter [owner] :
  /// The owner of the applications.
  Future<DescribeApplicationsResult> describeApplications({
    List<String>? applicationIds,
    List<Compute>? computeTypeNames,
    WorkSpaceApplicationLicenseType? licenseType,
    int? maxResults,
    String? nextToken,
    List<OperatingSystemName>? operatingSystemNames,
    String? owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (applicationIds != null) 'ApplicationIds': applicationIds,
        if (computeTypeNames != null)
          'ComputeTypeNames': computeTypeNames.map((e) => e.toValue()).toList(),
        if (licenseType != null) 'LicenseType': licenseType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (operatingSystemNames != null)
          'OperatingSystemNames':
              operatingSystemNames.map((e) => e.toValue()).toList(),
        if (owner != null) 'Owner': owner,
      },
    );

    return DescribeApplicationsResult.fromJson(jsonResponse.body);
  }

  /// Describes the associations between the applications and the specified
  /// bundle.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [associatedResourceTypes] :
  /// The resource types of the associated resource.
  ///
  /// Parameter [bundleId] :
  /// The identifier of the bundle.
  Future<DescribeBundleAssociationsResult> describeBundleAssociations({
    required List<BundleAssociatedResourceType> associatedResourceTypes,
    required String bundleId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeBundleAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociatedResourceTypes':
            associatedResourceTypes.map((e) => e.toValue()).toList(),
        'BundleId': bundleId,
      },
    );

    return DescribeBundleAssociationsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified client branding. Client branding allows you to
  /// customize the log in page of various device types for your users. You can
  /// add your company logo, the support email address, support link, link to
  /// reset password, and a custom message for users trying to sign in.
  /// <note>
  /// Only device types that have branding information configured will be shown
  /// in the response.
  /// </note>
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceId] :
  /// The directory identifier of the WorkSpace for which you want to view
  /// client branding information.
  Future<DescribeClientBrandingResult> describeClientBranding({
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeClientBranding'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
      },
    );

    return DescribeClientBrandingResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more specified Amazon WorkSpaces
  /// clients.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceIds] :
  /// The resource identifier, in the form of directory IDs.
  Future<DescribeClientPropertiesResult> describeClientProperties({
    required List<String> resourceIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeClientProperties'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceIds': resourceIds,
      },
    );

    return DescribeClientPropertiesResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of Amazon Connect client add-ins that have been created.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceId] :
  /// The directory identifier for which the client add-in is configured.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeConnectClientAddInsResult> describeConnectClientAddIns({
    required String resourceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeConnectClientAddIns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConnectClientAddInsResult.fromJson(jsonResponse.body);
  }

  /// Describes the permissions that the owner of a connection alias has granted
  /// to another Amazon Web Services account for the specified connection alias.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
  /// Cross-Region Redirection for Amazon WorkSpaces</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [aliasId] :
  /// The identifier of the connection alias.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeConnectionAliasPermissionsResult>
      describeConnectionAliasPermissions({
    required String aliasId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeConnectionAliasPermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConnectionAliasPermissionsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes the connection aliases used for
  /// cross-Region redirection. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
  /// Cross-Region Redirection for Amazon WorkSpaces</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [aliasIds] :
  /// The identifiers of the connection aliases to describe.
  ///
  /// Parameter [limit] :
  /// The maximum number of connection aliases to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the directory associated with the connection alias.
  Future<DescribeConnectionAliasesResult> describeConnectionAliases({
    List<String>? aliasIds,
    int? limit,
    String? nextToken,
    String? resourceId,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeConnectionAliases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (aliasIds != null) 'AliasIds': aliasIds,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceId != null) 'ResourceId': resourceId,
      },
    );

    return DescribeConnectionAliasesResult.fromJson(jsonResponse.body);
  }

  /// Describes the associations between the applications and the specified
  /// image.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [associatedResourceTypes] :
  /// The resource types of the associated resource.
  ///
  /// Parameter [imageId] :
  /// The identifier of the image.
  Future<DescribeImageAssociationsResult> describeImageAssociations({
    required List<ImageAssociatedResourceType> associatedResourceTypes,
    required String imageId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeImageAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociatedResourceTypes':
            associatedResourceTypes.map((e) => e.toValue()).toList(),
        'ImageId': imageId,
      },
    );

    return DescribeImageAssociationsResult.fromJson(jsonResponse.body);
  }

  /// Describes one or more of your IP access control groups.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [groupIds] :
  /// The identifiers of one or more IP access control groups.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeIpGroupsResult> describeIpGroups({
    List<String>? groupIds,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeIpGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (groupIds != null) 'GroupIds': groupIds,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeIpGroupsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified tags for the specified WorkSpaces resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the WorkSpaces resource. The supported resource types
  /// are WorkSpaces, registered directories, images, custom bundles, IP access
  /// control groups, and connection aliases.
  Future<DescribeTagsResult> describeTags({
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
      },
    );

    return DescribeTagsResult.fromJson(jsonResponse.body);
  }

  /// Describes the associations betweens applications and the specified
  /// WorkSpace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [associatedResourceTypes] :
  /// The resource types of the associated resources.
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  Future<DescribeWorkspaceAssociationsResult> describeWorkspaceAssociations({
    required List<WorkSpaceAssociatedResourceType> associatedResourceTypes,
    required String workspaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeWorkspaceAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociatedResourceTypes':
            associatedResourceTypes.map((e) => e.toValue()).toList(),
        'WorkspaceId': workspaceId,
      },
    );

    return DescribeWorkspaceAssociationsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes the available WorkSpace bundles.
  ///
  /// You can filter the results using either bundle ID or owner, but not both.
  ///
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [bundleIds] :
  /// The identifiers of the bundles. You cannot combine this parameter with any
  /// other filter.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. (You received this token from a
  /// previous call.)
  ///
  /// Parameter [owner] :
  /// The owner of the bundles. You cannot combine this parameter with any other
  /// filter.
  ///
  /// To describe the bundles provided by Amazon Web Services, specify
  /// <code>AMAZON</code>. To describe the bundles that belong to your account,
  /// don't specify a value.
  Future<DescribeWorkspaceBundlesResult> describeWorkspaceBundles({
    List<String>? bundleIds,
    String? nextToken,
    String? owner,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeWorkspaceBundles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (bundleIds != null) 'BundleIds': bundleIds,
        if (nextToken != null) 'NextToken': nextToken,
        if (owner != null) 'Owner': owner,
      },
    );

    return DescribeWorkspaceBundlesResult.fromJson(jsonResponse.body);
  }

  /// Describes the available directories that are registered with Amazon
  /// WorkSpaces.
  ///
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [directoryIds] :
  /// The identifiers of the directories. If the value is null, all directories
  /// are retrieved.
  ///
  /// Parameter [limit] :
  /// The maximum number of directories to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeWorkspaceDirectoriesResult> describeWorkspaceDirectories({
    List<String>? directoryIds,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeWorkspaceDirectories'
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

    return DescribeWorkspaceDirectoriesResult.fromJson(jsonResponse.body);
  }

  /// Describes the permissions that the owner of an image has granted to other
  /// Amazon Web Services accounts for an image.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [imageId] :
  /// The identifier of the image.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeWorkspaceImagePermissionsResult>
      describeWorkspaceImagePermissions({
    required String imageId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeWorkspaceImagePermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImageId': imageId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeWorkspaceImagePermissionsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list that describes one or more specified images, if the image
  /// identifiers are provided. Otherwise, all images in the account are
  /// described.
  ///
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [imageIds] :
  /// The identifier of the image.
  ///
  /// Parameter [imageType] :
  /// The type (owned or shared) of the image.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeWorkspaceImagesResult> describeWorkspaceImages({
    List<String>? imageIds,
    ImageType? imageType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeWorkspaceImages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (imageIds != null) 'ImageIds': imageIds,
        if (imageType != null) 'ImageType': imageType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeWorkspaceImagesResult.fromJson(jsonResponse.body);
  }

  /// Describes the snapshots for the specified WorkSpace.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  Future<DescribeWorkspaceSnapshotsResult> describeWorkspaceSnapshots({
    required String workspaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeWorkspaceSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceId': workspaceId,
      },
    );

    return DescribeWorkspaceSnapshotsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified WorkSpaces.
  ///
  /// You can filter the results by using the bundle identifier, directory
  /// identifier, or owner, but you can specify only one filter at a time.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [bundleId] :
  /// The identifier of the bundle. All WorkSpaces that are created from this
  /// bundle are retrieved. You cannot combine this parameter with any other
  /// filter.
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory. In addition, you can optionally specify a
  /// specific directory user (see <code>UserName</code>). You cannot combine
  /// this parameter with any other filter.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  ///
  /// Parameter [userName] :
  /// The name of the directory user. You must specify this parameter with
  /// <code>DirectoryId</code>.
  ///
  /// Parameter [workspaceIds] :
  /// The identifiers of the WorkSpaces. You cannot combine this parameter with
  /// any other filter.
  ///
  /// Because the <a>CreateWorkspaces</a> operation is asynchronous, the
  /// identifier it returns is not immediately available. If you immediately
  /// call <a>DescribeWorkspaces</a> with this identifier, no information is
  /// returned.
  ///
  /// Parameter [workspaceName] :
  /// The name of the user-decoupled WorkSpace.
  Future<DescribeWorkspacesResult> describeWorkspaces({
    String? bundleId,
    String? directoryId,
    int? limit,
    String? nextToken,
    String? userName,
    List<String>? workspaceIds,
    String? workspaceName,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeWorkspaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (bundleId != null) 'BundleId': bundleId,
        if (directoryId != null) 'DirectoryId': directoryId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
        if (userName != null) 'UserName': userName,
        if (workspaceIds != null) 'WorkspaceIds': workspaceIds,
        if (workspaceName != null) 'WorkspaceName': workspaceName,
      },
    );

    return DescribeWorkspacesResult.fromJson(jsonResponse.body);
  }

  /// Describes the connection status of the specified WorkSpaces.
  ///
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  ///
  /// Parameter [workspaceIds] :
  /// The identifiers of the WorkSpaces. You can specify up to 25 WorkSpaces.
  Future<DescribeWorkspacesConnectionStatusResult>
      describeWorkspacesConnectionStatus({
    String? nextToken,
    List<String>? workspaceIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DescribeWorkspacesConnectionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (workspaceIds != null) 'WorkspaceIds': workspaceIds,
      },
    );

    return DescribeWorkspacesConnectionStatusResult.fromJson(jsonResponse.body);
  }

  /// Disassociates a connection alias from a directory. Disassociating a
  /// connection alias disables cross-Region redirection between two directories
  /// in different Regions. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
  /// Cross-Region Redirection for Amazon WorkSpaces</a>.
  /// <note>
  /// Before performing this operation, call <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeConnectionAliases.html">
  /// DescribeConnectionAliases</a> to make sure that the current state of the
  /// connection alias is <code>CREATED</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [InvalidResourceStateException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [aliasId] :
  /// The identifier of the connection alias to disassociate.
  Future<void> disassociateConnectionAlias({
    required String aliasId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DisassociateConnectionAlias'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
      },
    );
  }

  /// Disassociates the specified IP access control group from the specified
  /// directory.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidResourceStateException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory.
  ///
  /// Parameter [groupIds] :
  /// The identifiers of one or more IP access control groups.
  Future<void> disassociateIpGroups({
    required String directoryId,
    required List<String> groupIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DisassociateIpGroups'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'GroupIds': groupIds,
      },
    );
  }

  /// Disassociates the specified application from a WorkSpace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application.
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  Future<DisassociateWorkspaceApplicationResult>
      disassociateWorkspaceApplication({
    required String applicationId,
    required String workspaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DisassociateWorkspaceApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationId': applicationId,
        'WorkspaceId': workspaceId,
      },
    );

    return DisassociateWorkspaceApplicationResult.fromJson(jsonResponse.body);
  }

  /// Retrieves account link information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [linkId] :
  /// The identifier of the account to link.
  ///
  /// Parameter [linkedAccountId] :
  /// The identifier of the account link
  Future<GetAccountLinkResult> getAccountLink({
    String? linkId,
    String? linkedAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.GetAccountLink'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (linkId != null) 'LinkId': linkId,
        if (linkedAccountId != null) 'LinkedAccountId': linkedAccountId,
      },
    );

    return GetAccountLinkResult.fromJson(jsonResponse.body);
  }

  /// Imports client branding. Client branding allows you to customize your
  /// WorkSpace's client login portal. You can tailor your login portal company
  /// logo, the support email address, support link, link to reset password, and
  /// a custom message for users trying to sign in.
  ///
  /// After you import client branding, the default branding experience for the
  /// specified platform type is replaced with the imported experience
  /// <note>
  /// <ul>
  /// <li>
  /// You must specify at least one platform type when importing client
  /// branding.
  /// </li>
  /// <li>
  /// You can import up to 6 MB of data with each request. If your request
  /// exceeds this limit, you can import client branding for different platform
  /// types using separate requests.
  /// </li>
  /// <li>
  /// In each platform type, the <code>SupportEmail</code> and
  /// <code>SupportLink</code> parameters are mutually exclusive. You can
  /// specify only one parameter for each platform type, but not both.
  /// </li>
  /// <li>
  /// Imported data can take up to a minute to appear in the WorkSpaces client.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceId] :
  /// The directory identifier of the WorkSpace for which you want to import
  /// client branding.
  ///
  /// Parameter [deviceTypeAndroid] :
  /// The branding information to import for Android devices.
  ///
  /// Parameter [deviceTypeIos] :
  /// The branding information to import for iOS devices.
  ///
  /// Parameter [deviceTypeLinux] :
  /// The branding information to import for Linux devices.
  ///
  /// Parameter [deviceTypeOsx] :
  /// The branding information to import for macOS devices.
  ///
  /// Parameter [deviceTypeWeb] :
  /// The branding information to import for web access.
  ///
  /// Parameter [deviceTypeWindows] :
  /// The branding information to import for Windows devices.
  Future<ImportClientBrandingResult> importClientBranding({
    required String resourceId,
    DefaultImportClientBrandingAttributes? deviceTypeAndroid,
    IosImportClientBrandingAttributes? deviceTypeIos,
    DefaultImportClientBrandingAttributes? deviceTypeLinux,
    DefaultImportClientBrandingAttributes? deviceTypeOsx,
    DefaultImportClientBrandingAttributes? deviceTypeWeb,
    DefaultImportClientBrandingAttributes? deviceTypeWindows,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ImportClientBranding'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        if (deviceTypeAndroid != null) 'DeviceTypeAndroid': deviceTypeAndroid,
        if (deviceTypeIos != null) 'DeviceTypeIos': deviceTypeIos,
        if (deviceTypeLinux != null) 'DeviceTypeLinux': deviceTypeLinux,
        if (deviceTypeOsx != null) 'DeviceTypeOsx': deviceTypeOsx,
        if (deviceTypeWeb != null) 'DeviceTypeWeb': deviceTypeWeb,
        if (deviceTypeWindows != null) 'DeviceTypeWindows': deviceTypeWindows,
      },
    );

    return ImportClientBrandingResult.fromJson(jsonResponse.body);
  }

  /// Imports the specified Windows 10 or 11 Bring Your Own License (BYOL) image
  /// into Amazon WorkSpaces. The image must be an already licensed Amazon EC2
  /// image that is in your Amazon Web Services account, and you must own the
  /// image. For more information about creating BYOL images, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html">
  /// Bring Your Own Windows Desktop Licenses</a>.
  ///
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotSupportedException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [ec2ImageId] :
  /// The identifier of the EC2 image.
  ///
  /// Parameter [imageDescription] :
  /// The description of the WorkSpace image.
  ///
  /// Parameter [imageName] :
  /// The name of the WorkSpace image.
  ///
  /// Parameter [ingestionProcess] :
  /// The ingestion process to be used when importing the image, depending on
  /// which protocol you want to use for your BYOL Workspace image, either
  /// PCoIP, WorkSpaces Streaming Protocol (WSP), or bring your own protocol
  /// (BYOP). To use WSP, specify a value that ends in <code>_WSP</code>. To use
  /// PCoIP, specify a value that does not end in <code>_WSP</code>. To use
  /// BYOP, specify a value that ends in <code>_BYOP</code>.
  ///
  /// For non-GPU-enabled bundles (bundles other than Graphics or GraphicsPro),
  /// specify <code>BYOL_REGULAR</code>, <code>BYOL_REGULAR_WSP</code>, or
  /// <code>BYOL_REGULAR_BYOP</code>, depending on the protocol.
  /// <note>
  /// The <code>BYOL_REGULAR_BYOP</code> and
  /// <code>BYOL_GRAPHICS_G4DN_BYOP</code> values are only supported by Amazon
  /// WorkSpaces Core. Contact your account team to be allow-listed to use these
  /// values. For more information, see <a
  /// href="http://aws.amazon.com/workspaces/core/">Amazon WorkSpaces Core</a>.
  /// </note>
  ///
  /// Parameter [applications] :
  /// If specified, the version of Microsoft Office to subscribe to. Valid only
  /// for Windows 10 and 11 BYOL images. For more information about subscribing
  /// to Office for BYOL images, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html">
  /// Bring Your Own Windows Desktop Licenses</a>.
  /// <note>
  /// <ul>
  /// <li>
  /// Although this parameter is an array, only one item is allowed at this
  /// time.
  /// </li>
  /// <li>
  /// Windows 11 only supports <code>Microsoft_Office_2019</code>.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [tags] :
  /// The tags. Each WorkSpaces resource can have a maximum of 50 tags.
  Future<ImportWorkspaceImageResult> importWorkspaceImage({
    required String ec2ImageId,
    required String imageDescription,
    required String imageName,
    required WorkspaceImageIngestionProcess ingestionProcess,
    List<Application>? applications,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ImportWorkspaceImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Ec2ImageId': ec2ImageId,
        'ImageDescription': imageDescription,
        'ImageName': imageName,
        'IngestionProcess': ingestionProcess.toValue(),
        if (applications != null)
          'Applications': applications.map((e) => e.toValue()).toList(),
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportWorkspaceImageResult.fromJson(jsonResponse.body);
  }

  /// Lists all account links.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [linkStatusFilter] :
  /// Filters the account based on their link status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of accounts to return.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  Future<ListAccountLinksResult> listAccountLinks({
    List<AccountLinkStatusEnum>? linkStatusFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ListAccountLinks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (linkStatusFilter != null)
          'LinkStatusFilter': linkStatusFilter.map((e) => e.toValue()).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAccountLinksResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of IP address ranges, specified as IPv4 CIDR blocks, that
  /// you can use for the network management interface when you enable Bring
  /// Your Own License (BYOL).
  ///
  /// This operation can be run only by Amazon Web Services accounts that are
  /// enabled for BYOL. If your account isn't enabled for BYOL, you'll receive
  /// an <code>AccessDeniedException</code> error.
  ///
  /// The management network interface is connected to a secure Amazon
  /// WorkSpaces management network. It is used for interactive streaming of the
  /// WorkSpace desktop to Amazon WorkSpaces clients, and to allow Amazon
  /// WorkSpaces to manage the WorkSpace.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [managementCidrRangeConstraint] :
  /// The IP address range to search. Specify an IP address range that is
  /// compatible with your network and in CIDR notation (that is, specify the
  /// range as an IPv4 CIDR block).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<ListAvailableManagementCidrRangesResult>
      listAvailableManagementCidrRanges({
    required String managementCidrRangeConstraint,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ListAvailableManagementCidrRanges'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ManagementCidrRangeConstraint': managementCidrRangeConstraint,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAvailableManagementCidrRangesResult.fromJson(jsonResponse.body);
  }

  /// Migrates a WorkSpace from one operating system or bundle type to another,
  /// while retaining the data on the user volume.
  ///
  /// The migration process recreates the WorkSpace by using a new root volume
  /// from the target bundle image and the user volume from the last available
  /// snapshot of the original WorkSpace. During migration, the original
  /// <code>D:\Users\%USERNAME%</code> user profile folder is renamed to
  /// <code>D:\Users\%USERNAME%MMddyyTHHmmss%.NotMigrated</code>. A new
  /// <code>D:\Users\%USERNAME%\</code> folder is generated by the new OS.
  /// Certain files in the old user profile are moved to the new user profile.
  ///
  /// For available migration scenarios, details about what happens during
  /// migration, and best practices, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/migrate-workspaces.html">Migrate
  /// a WorkSpace</a>.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [OperationNotSupportedException].
  /// May throw [OperationInProgressException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [bundleId] :
  /// The identifier of the target bundle type to migrate the WorkSpace to.
  ///
  /// Parameter [sourceWorkspaceId] :
  /// The identifier of the WorkSpace to migrate from.
  Future<MigrateWorkspaceResult> migrateWorkspace({
    required String bundleId,
    required String sourceWorkspaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.MigrateWorkspace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BundleId': bundleId,
        'SourceWorkspaceId': sourceWorkspaceId,
      },
    );

    return MigrateWorkspaceResult.fromJson(jsonResponse.body);
  }

  /// Modifies the configuration of Bring Your Own License (BYOL) for the
  /// specified account.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidResourceStateException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dedicatedTenancyManagementCidrRange] :
  /// The IP address range, specified as an IPv4 CIDR block, for the management
  /// network interface. Specify an IP address range that is compatible with
  /// your network and in CIDR notation (that is, specify the range as an IPv4
  /// CIDR block). The CIDR block size must be /16 (for example,
  /// 203.0.113.25/16). It must also be specified as available by the
  /// <code>ListAvailableManagementCidrRanges</code> operation.
  ///
  /// Parameter [dedicatedTenancySupport] :
  /// The status of BYOL.
  Future<void> modifyAccount({
    String? dedicatedTenancyManagementCidrRange,
    DedicatedTenancySupportEnum? dedicatedTenancySupport,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyAccount'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (dedicatedTenancyManagementCidrRange != null)
          'DedicatedTenancyManagementCidrRange':
              dedicatedTenancyManagementCidrRange,
        if (dedicatedTenancySupport != null)
          'DedicatedTenancySupport': dedicatedTenancySupport.toValue(),
      },
    );
  }

  /// Modifies the properties of the certificate-based authentication you want
  /// to use with your WorkSpaces.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceId] :
  /// The resource identifiers, in the form of directory IDs.
  ///
  /// Parameter [certificateBasedAuthProperties] :
  /// The properties of the certificate-based authentication.
  ///
  /// Parameter [propertiesToDelete] :
  /// The properties of the certificate-based authentication you want to delete.
  Future<void> modifyCertificateBasedAuthProperties({
    required String resourceId,
    CertificateBasedAuthProperties? certificateBasedAuthProperties,
    List<DeletableCertificateBasedAuthProperty>? propertiesToDelete,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyCertificateBasedAuthProperties'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        if (certificateBasedAuthProperties != null)
          'CertificateBasedAuthProperties': certificateBasedAuthProperties,
        if (propertiesToDelete != null)
          'PropertiesToDelete':
              propertiesToDelete.map((e) => e.toValue()).toList(),
      },
    );
  }

  /// Modifies the properties of the specified Amazon WorkSpaces clients.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clientProperties] :
  /// Information about the Amazon WorkSpaces client.
  ///
  /// Parameter [resourceId] :
  /// The resource identifiers, in the form of directory IDs.
  Future<void> modifyClientProperties({
    required ClientProperties clientProperties,
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyClientProperties'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientProperties': clientProperties,
        'ResourceId': resourceId,
      },
    );
  }

  /// Modifies multiple properties related to SAML 2.0 authentication, including
  /// the enablement status, user access URL, and relay state parameter name
  /// that are used for configuring federation with an SAML 2.0 identity
  /// provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceId] :
  /// The directory identifier for which you want to configure SAML properties.
  ///
  /// Parameter [propertiesToDelete] :
  /// The SAML properties to delete as part of your request.
  ///
  /// Specify one of the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>SAML_PROPERTIES_USER_ACCESS_URL</code> to delete the user access
  /// URL.
  /// </li>
  /// <li>
  /// <code>SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME</code> to delete the
  /// relay state parameter name.
  /// </li>
  /// </ul>
  ///
  /// Parameter [samlProperties] :
  /// The properties for configuring SAML 2.0 authentication.
  Future<void> modifySamlProperties({
    required String resourceId,
    List<DeletableSamlProperty>? propertiesToDelete,
    SamlProperties? samlProperties,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifySamlProperties'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        if (propertiesToDelete != null)
          'PropertiesToDelete':
              propertiesToDelete.map((e) => e.toValue()).toList(),
        if (samlProperties != null) 'SamlProperties': samlProperties,
      },
    );
  }

  /// Modifies the self-service WorkSpace management capabilities for your
  /// users. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/enable-user-self-service-workspace-management.html">Enable
  /// Self-Service WorkSpace Management Capabilities for Your Users</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the directory.
  ///
  /// Parameter [selfservicePermissions] :
  /// The permissions to enable or disable self-service capabilities.
  Future<void> modifySelfservicePermissions({
    required String resourceId,
    required SelfservicePermissions selfservicePermissions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifySelfservicePermissions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'SelfservicePermissions': selfservicePermissions,
      },
    );
  }

  /// Specifies which devices and operating systems users can use to access
  /// their WorkSpaces. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/update-directory-details.html#control-device-access">
  /// Control Device Access</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the directory.
  ///
  /// Parameter [workspaceAccessProperties] :
  /// The device types and operating systems to enable or disable for access.
  Future<void> modifyWorkspaceAccessProperties({
    required String resourceId,
    required WorkspaceAccessProperties workspaceAccessProperties,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyWorkspaceAccessProperties'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'WorkspaceAccessProperties': workspaceAccessProperties,
      },
    );
  }

  /// Modify the default properties used to create WorkSpaces.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the directory.
  ///
  /// Parameter [workspaceCreationProperties] :
  /// The default properties for creating WorkSpaces.
  Future<void> modifyWorkspaceCreationProperties({
    required String resourceId,
    required WorkspaceCreationProperties workspaceCreationProperties,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyWorkspaceCreationProperties'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'WorkspaceCreationProperties': workspaceCreationProperties,
      },
    );
  }

  /// Modifies the specified WorkSpace properties. For important information
  /// about how to modify the size of the root and user volumes, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html">
  /// Modify a WorkSpace</a>.
  /// <note>
  /// The <code>MANUAL</code> running mode value is only supported by Amazon
  /// WorkSpaces Core. Contact your account team to be allow-listed to use this
  /// value. For more information, see <a
  /// href="http://aws.amazon.com/workspaces/core/">Amazon WorkSpaces Core</a>.
  /// </note>
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [InvalidResourceStateException].
  /// May throw [OperationInProgressException].
  /// May throw [UnsupportedWorkspaceConfigurationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  ///
  /// Parameter [dataReplication] :
  /// Indicates the data replication status.
  ///
  /// Parameter [workspaceProperties] :
  /// The properties of the WorkSpace.
  Future<void> modifyWorkspaceProperties({
    required String workspaceId,
    DataReplication? dataReplication,
    WorkspaceProperties? workspaceProperties,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyWorkspaceProperties'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceId': workspaceId,
        if (dataReplication != null)
          'DataReplication': dataReplication.toValue(),
        if (workspaceProperties != null)
          'WorkspaceProperties': workspaceProperties,
      },
    );
  }

  /// Sets the state of the specified WorkSpace.
  ///
  /// To maintain a WorkSpace without being interrupted, set the WorkSpace state
  /// to <code>ADMIN_MAINTENANCE</code>. WorkSpaces in this state do not respond
  /// to requests to reboot, stop, start, rebuild, or restore. An AutoStop
  /// WorkSpace in this state is not stopped. Users cannot log into a WorkSpace
  /// in the <code>ADMIN_MAINTENANCE</code> state.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [InvalidResourceStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  ///
  /// Parameter [workspaceState] :
  /// The WorkSpace state.
  Future<void> modifyWorkspaceState({
    required String workspaceId,
    required TargetWorkspaceState workspaceState,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyWorkspaceState'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceId': workspaceId,
        'WorkspaceState': workspaceState.toValue(),
      },
    );
  }

  /// Reboots the specified WorkSpaces.
  ///
  /// You cannot reboot a WorkSpace unless its state is <code>AVAILABLE</code>,
  /// <code>UNHEALTHY</code>, or <code>REBOOTING</code>. Reboot a WorkSpace in
  /// the <code>REBOOTING</code> state only if your WorkSpace has been stuck in
  /// the <code>REBOOTING</code> state for over 20 minutes.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces have
  /// rebooted.
  ///
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [rebootWorkspaceRequests] :
  /// The WorkSpaces to reboot. You can specify up to 25 WorkSpaces.
  Future<RebootWorkspacesResult> rebootWorkspaces({
    required List<RebootRequest> rebootWorkspaceRequests,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.RebootWorkspaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RebootWorkspaceRequests': rebootWorkspaceRequests,
      },
    );

    return RebootWorkspacesResult.fromJson(jsonResponse.body);
  }

  /// Rebuilds the specified WorkSpace.
  ///
  /// You cannot rebuild a WorkSpace unless its state is <code>AVAILABLE</code>,
  /// <code>ERROR</code>, <code>UNHEALTHY</code>, <code>STOPPED</code>, or
  /// <code>REBOOTING</code>.
  ///
  /// Rebuilding a WorkSpace is a potentially destructive action that can result
  /// in the loss of data. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/reset-workspace.html">Rebuild
  /// a WorkSpace</a>.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces have been
  /// completely rebuilt.
  ///
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [rebuildWorkspaceRequests] :
  /// The WorkSpace to rebuild. You can specify a single WorkSpace.
  Future<RebuildWorkspacesResult> rebuildWorkspaces({
    required List<RebuildRequest> rebuildWorkspaceRequests,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.RebuildWorkspaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RebuildWorkspaceRequests': rebuildWorkspaceRequests,
      },
    );

    return RebuildWorkspacesResult.fromJson(jsonResponse.body);
  }

  /// Registers the specified directory. This operation is asynchronous and
  /// returns before the WorkSpace directory is registered. If this is the first
  /// time you are registering a directory, you will need to create the
  /// workspaces_DefaultRole role before you can register a directory. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/workspaces-access-control.html#create-default-role">
  /// Creating the workspaces_DefaultRole Role</a>.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [WorkspacesDefaultRoleNotFoundException].
  /// May throw [InvalidResourceStateException].
  /// May throw [UnsupportedNetworkConfigurationException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [directoryId] :
  /// The identifier of the directory. You cannot register a directory if it
  /// does not have a status of Active. If the directory does not have a status
  /// of Active, you will receive an InvalidResourceStateException error. If you
  /// have already registered the maximum number of directories that you can
  /// register with Amazon WorkSpaces, you will receive a
  /// ResourceLimitExceededException error. Deregister directories that you are
  /// not using for WorkSpaces, and try again.
  ///
  /// Parameter [enableWorkDocs] :
  /// Indicates whether Amazon WorkDocs is enabled or disabled. If you have
  /// enabled this parameter and WorkDocs is not available in the Region, you
  /// will receive an OperationNotSupportedException error. Set
  /// <code>EnableWorkDocs</code> to disabled, and try again.
  ///
  /// Parameter [enableSelfService] :
  /// Indicates whether self-service capabilities are enabled or disabled.
  ///
  /// Parameter [subnetIds] :
  /// The identifiers of the subnets for your virtual private cloud (VPC). Make
  /// sure that the subnets are in supported Availability Zones. The subnets
  /// must also be in separate Availability Zones. If these conditions are not
  /// met, you will receive an OperationNotSupportedException error.
  ///
  /// Parameter [tags] :
  /// The tags associated with the directory.
  ///
  /// Parameter [tenancy] :
  /// Indicates whether your WorkSpace directory is dedicated or shared. To use
  /// Bring Your Own License (BYOL) images, this value must be set to
  /// <code>DEDICATED</code> and your Amazon Web Services account must be
  /// enabled for BYOL. If your account has not been enabled for BYOL, you will
  /// receive an InvalidParameterValuesException error. For more information
  /// about BYOL images, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html">Bring
  /// Your Own Windows Desktop Images</a>.
  Future<void> registerWorkspaceDirectory({
    required String directoryId,
    required bool enableWorkDocs,
    bool? enableSelfService,
    List<String>? subnetIds,
    List<Tag>? tags,
    Tenancy? tenancy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.RegisterWorkspaceDirectory'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DirectoryId': directoryId,
        'EnableWorkDocs': enableWorkDocs,
        if (enableSelfService != null) 'EnableSelfService': enableSelfService,
        if (subnetIds != null) 'SubnetIds': subnetIds,
        if (tags != null) 'Tags': tags,
        if (tenancy != null) 'Tenancy': tenancy.toValue(),
      },
    );
  }

  /// Rejects the account link invitation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [linkId] :
  /// The identifier of the account link
  ///
  /// Parameter [clientToken] :
  /// The client token of the account link invitation to reject.
  Future<RejectAccountLinkInvitationResult> rejectAccountLinkInvitation({
    required String linkId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.RejectAccountLinkInvitation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LinkId': linkId,
        if (clientToken != null) 'ClientToken': clientToken,
      },
    );

    return RejectAccountLinkInvitationResult.fromJson(jsonResponse.body);
  }

  /// Restores the specified WorkSpace to its last known healthy state.
  ///
  /// You cannot restore a WorkSpace unless its state is <code>
  /// AVAILABLE</code>, <code>ERROR</code>, <code>UNHEALTHY</code>, or
  /// <code>STOPPED</code>.
  ///
  /// Restoring a WorkSpace is a potentially destructive action that can result
  /// in the loss of data. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/restore-workspace.html">Restore
  /// a WorkSpace</a>.
  ///
  /// This operation is asynchronous and returns before the WorkSpace is
  /// completely restored.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  Future<void> restoreWorkspace({
    required String workspaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.RestoreWorkspace'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceId': workspaceId,
      },
    );
  }

  /// Removes one or more rules from the specified IP access control group.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidResourceStateException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [groupId] :
  /// The identifier of the group.
  ///
  /// Parameter [userRules] :
  /// The rules to remove from the group.
  Future<void> revokeIpRules({
    required String groupId,
    required List<String> userRules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.RevokeIpRules'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'UserRules': userRules,
      },
    );
  }

  /// Starts the specified WorkSpaces.
  ///
  /// You cannot start a WorkSpace unless it has a running mode of
  /// <code>AutoStop</code> and a state of <code>STOPPED</code>.
  ///
  /// Parameter [startWorkspaceRequests] :
  /// The WorkSpaces to start. You can specify up to 25 WorkSpaces.
  Future<StartWorkspacesResult> startWorkspaces({
    required List<StartRequest> startWorkspaceRequests,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.StartWorkspaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StartWorkspaceRequests': startWorkspaceRequests,
      },
    );

    return StartWorkspacesResult.fromJson(jsonResponse.body);
  }

  /// Stops the specified WorkSpaces.
  ///
  /// You cannot stop a WorkSpace unless it has a running mode of
  /// <code>AutoStop</code> and a state of <code>AVAILABLE</code>,
  /// <code>IMPAIRED</code>, <code>UNHEALTHY</code>, or <code>ERROR</code>.
  ///
  /// Parameter [stopWorkspaceRequests] :
  /// The WorkSpaces to stop. You can specify up to 25 WorkSpaces.
  Future<StopWorkspacesResult> stopWorkspaces({
    required List<StopRequest> stopWorkspaceRequests,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.StopWorkspaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StopWorkspaceRequests': stopWorkspaceRequests,
      },
    );

    return StopWorkspacesResult.fromJson(jsonResponse.body);
  }

  /// Terminates the specified WorkSpaces.
  /// <important>
  /// Terminating a WorkSpace is a permanent action and cannot be undone. The
  /// user's data is destroyed. If you need to archive any user data, contact
  /// Amazon Web Services Support before terminating the WorkSpace.
  /// </important>
  /// You can terminate a WorkSpace that is in any state except
  /// <code>SUSPENDED</code>.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces have been
  /// completely terminated. After a WorkSpace is terminated, the
  /// <code>TERMINATED</code> state is returned only briefly before the
  /// WorkSpace directory metadata is cleaned up, so this state is rarely
  /// returned. To confirm that a WorkSpace is terminated, check for the
  /// WorkSpace ID by using <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaces.html">
  /// DescribeWorkSpaces</a>. If the WorkSpace ID isn't returned, then the
  /// WorkSpace has been successfully terminated.
  /// <note>
  /// Simple AD and AD Connector are made available to you free of charge to use
  /// with WorkSpaces. If there are no WorkSpaces being used with your Simple AD
  /// or AD Connector directory for 30 consecutive days, this directory will be
  /// automatically deregistered for use with Amazon WorkSpaces, and you will be
  /// charged for this directory as per the <a
  /// href="http://aws.amazon.com/directoryservice/pricing/">Directory Service
  /// pricing terms</a>.
  ///
  /// To delete empty directories, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/delete-workspaces-directory.html">
  /// Delete the Directory for Your WorkSpaces</a>. If you delete your Simple AD
  /// or AD Connector directory, you can always create a new one when you want
  /// to start using WorkSpaces again.
  /// </note>
  ///
  /// Parameter [terminateWorkspaceRequests] :
  /// The WorkSpaces to terminate. You can specify up to 25 WorkSpaces.
  Future<TerminateWorkspacesResult> terminateWorkspaces({
    required List<TerminateRequest> terminateWorkspaceRequests,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.TerminateWorkspaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TerminateWorkspaceRequests': terminateWorkspaceRequests,
      },
    );

    return TerminateWorkspacesResult.fromJson(jsonResponse.body);
  }

  /// Updates a Amazon Connect client add-in. Use this action to update the name
  /// and endpoint URL of a Amazon Connect client add-in.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [addInId] :
  /// The identifier of the client add-in to update.
  ///
  /// Parameter [resourceId] :
  /// The directory identifier for which the client add-in is configured.
  ///
  /// Parameter [name] :
  /// The name of the client add-in.
  ///
  /// Parameter [url] :
  /// The endpoint URL of the Amazon Connect client add-in.
  Future<void> updateConnectClientAddIn({
    required String addInId,
    required String resourceId,
    String? name,
    String? url,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.UpdateConnectClientAddIn'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddInId': addInId,
        'ResourceId': resourceId,
        if (name != null) 'Name': name,
        if (url != null) 'URL': url,
      },
    );
  }

  /// Shares or unshares a connection alias with one account by specifying
  /// whether that account has permission to associate the connection alias with
  /// a directory. If the association permission is granted, the connection
  /// alias is shared with that account. If the association permission is
  /// revoked, the connection alias is unshared with the account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
  /// Cross-Region Redirection for Amazon WorkSpaces</a>.
  /// <note>
  /// <ul>
  /// <li>
  /// Before performing this operation, call <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeConnectionAliases.html">
  /// DescribeConnectionAliases</a> to make sure that the current state of the
  /// connection alias is <code>CREATED</code>.
  /// </li>
  /// <li>
  /// To delete a connection alias that has been shared, the shared account must
  /// first disassociate the connection alias from any directories it has been
  /// associated with. Then you must unshare the connection alias from the
  /// account it has been shared with. You can delete a connection alias only
  /// after it is no longer shared with any accounts or associated with any
  /// directories.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAssociatedException].
  /// May throw [InvalidResourceStateException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [aliasId] :
  /// The identifier of the connection alias that you want to update permissions
  /// for.
  ///
  /// Parameter [connectionAliasPermission] :
  /// Indicates whether to share or unshare the connection alias with the
  /// specified Amazon Web Services account.
  Future<void> updateConnectionAliasPermission({
    required String aliasId,
    required ConnectionAliasPermission connectionAliasPermission,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.UpdateConnectionAliasPermission'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
        'ConnectionAliasPermission': connectionAliasPermission,
      },
    );
  }

  /// Replaces the current rules of the specified IP access control group with
  /// the specified rules.
  ///
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidResourceStateException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [groupId] :
  /// The identifier of the group.
  ///
  /// Parameter [userRules] :
  /// One or more rules.
  Future<void> updateRulesOfIpGroup({
    required String groupId,
    required List<IpRuleItem> userRules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.UpdateRulesOfIpGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'UserRules': userRules,
      },
    );
  }

  /// Updates a WorkSpace bundle with a new image. For more information about
  /// updating WorkSpace bundles, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/update-custom-bundle.html">
  /// Update a Custom WorkSpaces Bundle</a>.
  /// <important>
  /// Existing WorkSpaces aren't automatically updated when you update the
  /// bundle that they're based on. To update existing WorkSpaces that are based
  /// on a bundle that you've updated, you must either rebuild the WorkSpaces or
  /// delete and recreate them.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [bundleId] :
  /// The identifier of the bundle.
  ///
  /// Parameter [imageId] :
  /// The identifier of the image.
  Future<void> updateWorkspaceBundle({
    String? bundleId,
    String? imageId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.UpdateWorkspaceBundle'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (bundleId != null) 'BundleId': bundleId,
        if (imageId != null) 'ImageId': imageId,
      },
    );
  }

  /// Shares or unshares an image with one account in the same Amazon Web
  /// Services Region by specifying whether that account has permission to copy
  /// the image. If the copy image permission is granted, the image is shared
  /// with that account. If the copy image permission is revoked, the image is
  /// unshared with the account.
  ///
  /// After an image has been shared, the recipient account can copy the image
  /// to other Regions as needed.
  ///
  /// In the China (Ningxia) Region, you can copy images only within the same
  /// Region.
  ///
  /// In Amazon Web Services GovCloud (US), to copy images to and from other
  /// Regions, contact Amazon Web Services Support.
  ///
  /// For more information about sharing images, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/share-custom-image.html">
  /// Share or Unshare a Custom WorkSpaces Image</a>.
  /// <note>
  /// <ul>
  /// <li>
  /// To delete an image that has been shared, you must unshare the image before
  /// you delete it.
  /// </li>
  /// <li>
  /// Sharing Bring Your Own License (BYOL) images across Amazon Web Services
  /// accounts isn't supported at this time in Amazon Web Services GovCloud
  /// (US). To share BYOL images across accounts in Amazon Web Services GovCloud
  /// (US), contact Amazon Web Services Support.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValuesException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [allowCopyImage] :
  /// The permission to copy the image. This permission can be revoked only
  /// after an image has been shared.
  ///
  /// Parameter [imageId] :
  /// The identifier of the image.
  ///
  /// Parameter [sharedAccountId] :
  /// The identifier of the Amazon Web Services account to share or unshare the
  /// image with.
  /// <important>
  /// Before sharing the image, confirm that you are sharing to the correct
  /// Amazon Web Services account ID.
  /// </important>
  Future<void> updateWorkspaceImagePermission({
    required bool allowCopyImage,
    required String imageId,
    required String sharedAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.UpdateWorkspaceImagePermission'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AllowCopyImage': allowCopyImage,
        'ImageId': imageId,
        'SharedAccountId': sharedAccountId,
      },
    );
  }
}

class AcceptAccountLinkInvitationResult {
  /// Information about the account link.
  final AccountLink? accountLink;

  AcceptAccountLinkInvitationResult({
    this.accountLink,
  });

  factory AcceptAccountLinkInvitationResult.fromJson(
      Map<String, dynamic> json) {
    return AcceptAccountLinkInvitationResult(
      accountLink: json['AccountLink'] != null
          ? AccountLink.fromJson(json['AccountLink'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLink = this.accountLink;
    return {
      if (accountLink != null) 'AccountLink': accountLink,
    };
  }
}

enum AccessPropertyValue {
  allow,
  deny,
}

extension AccessPropertyValueValueExtension on AccessPropertyValue {
  String toValue() {
    switch (this) {
      case AccessPropertyValue.allow:
        return 'ALLOW';
      case AccessPropertyValue.deny:
        return 'DENY';
    }
  }
}

extension AccessPropertyValueFromString on String {
  AccessPropertyValue toAccessPropertyValue() {
    switch (this) {
      case 'ALLOW':
        return AccessPropertyValue.allow;
      case 'DENY':
        return AccessPropertyValue.deny;
    }
    throw Exception('$this is not known in enum AccessPropertyValue');
  }
}

/// Information about about the account link.
class AccountLink {
  /// The identifier of the account link.
  final String? accountLinkId;

  /// The status of the account link.
  final AccountLinkStatusEnum? accountLinkStatus;

  /// The identifier of the source account.
  final String? sourceAccountId;

  /// The identifier of the target account.
  final String? targetAccountId;

  AccountLink({
    this.accountLinkId,
    this.accountLinkStatus,
    this.sourceAccountId,
    this.targetAccountId,
  });

  factory AccountLink.fromJson(Map<String, dynamic> json) {
    return AccountLink(
      accountLinkId: json['AccountLinkId'] as String?,
      accountLinkStatus:
          (json['AccountLinkStatus'] as String?)?.toAccountLinkStatusEnum(),
      sourceAccountId: json['SourceAccountId'] as String?,
      targetAccountId: json['TargetAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLinkId = this.accountLinkId;
    final accountLinkStatus = this.accountLinkStatus;
    final sourceAccountId = this.sourceAccountId;
    final targetAccountId = this.targetAccountId;
    return {
      if (accountLinkId != null) 'AccountLinkId': accountLinkId,
      if (accountLinkStatus != null)
        'AccountLinkStatus': accountLinkStatus.toValue(),
      if (sourceAccountId != null) 'SourceAccountId': sourceAccountId,
      if (targetAccountId != null) 'TargetAccountId': targetAccountId,
    };
  }
}

enum AccountLinkStatusEnum {
  linked,
  linkingFailed,
  linkNotFound,
  pendingAcceptanceByTargetAccount,
  rejected,
}

extension AccountLinkStatusEnumValueExtension on AccountLinkStatusEnum {
  String toValue() {
    switch (this) {
      case AccountLinkStatusEnum.linked:
        return 'LINKED';
      case AccountLinkStatusEnum.linkingFailed:
        return 'LINKING_FAILED';
      case AccountLinkStatusEnum.linkNotFound:
        return 'LINK_NOT_FOUND';
      case AccountLinkStatusEnum.pendingAcceptanceByTargetAccount:
        return 'PENDING_ACCEPTANCE_BY_TARGET_ACCOUNT';
      case AccountLinkStatusEnum.rejected:
        return 'REJECTED';
    }
  }
}

extension AccountLinkStatusEnumFromString on String {
  AccountLinkStatusEnum toAccountLinkStatusEnum() {
    switch (this) {
      case 'LINKED':
        return AccountLinkStatusEnum.linked;
      case 'LINKING_FAILED':
        return AccountLinkStatusEnum.linkingFailed;
      case 'LINK_NOT_FOUND':
        return AccountLinkStatusEnum.linkNotFound;
      case 'PENDING_ACCEPTANCE_BY_TARGET_ACCOUNT':
        return AccountLinkStatusEnum.pendingAcceptanceByTargetAccount;
      case 'REJECTED':
        return AccountLinkStatusEnum.rejected;
    }
    throw Exception('$this is not known in enum AccountLinkStatusEnum');
  }
}

/// Describes a modification to the configuration of Bring Your Own License
/// (BYOL) for the specified account.
class AccountModification {
  /// The IP address range, specified as an IPv4 CIDR block, for the management
  /// network interface used for the account.
  final String? dedicatedTenancyManagementCidrRange;

  /// The status of BYOL (whether BYOL is being enabled or disabled).
  final DedicatedTenancySupportResultEnum? dedicatedTenancySupport;

  /// The error code that is returned if the configuration of BYOL cannot be
  /// modified.
  final String? errorCode;

  /// The text of the error message that is returned if the configuration of BYOL
  /// cannot be modified.
  final String? errorMessage;

  /// The state of the modification to the configuration of BYOL.
  final DedicatedTenancyModificationStateEnum? modificationState;

  /// The timestamp when the modification of the BYOL configuration was started.
  final DateTime? startTime;

  AccountModification({
    this.dedicatedTenancyManagementCidrRange,
    this.dedicatedTenancySupport,
    this.errorCode,
    this.errorMessage,
    this.modificationState,
    this.startTime,
  });

  factory AccountModification.fromJson(Map<String, dynamic> json) {
    return AccountModification(
      dedicatedTenancyManagementCidrRange:
          json['DedicatedTenancyManagementCidrRange'] as String?,
      dedicatedTenancySupport: (json['DedicatedTenancySupport'] as String?)
          ?.toDedicatedTenancySupportResultEnum(),
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      modificationState: (json['ModificationState'] as String?)
          ?.toDedicatedTenancyModificationStateEnum(),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final dedicatedTenancyManagementCidrRange =
        this.dedicatedTenancyManagementCidrRange;
    final dedicatedTenancySupport = this.dedicatedTenancySupport;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final modificationState = this.modificationState;
    final startTime = this.startTime;
    return {
      if (dedicatedTenancyManagementCidrRange != null)
        'DedicatedTenancyManagementCidrRange':
            dedicatedTenancyManagementCidrRange,
      if (dedicatedTenancySupport != null)
        'DedicatedTenancySupport': dedicatedTenancySupport.toValue(),
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (modificationState != null)
        'ModificationState': modificationState.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

enum Application {
  microsoftOffice_2016,
  microsoftOffice_2019,
}

extension ApplicationValueExtension on Application {
  String toValue() {
    switch (this) {
      case Application.microsoftOffice_2016:
        return 'Microsoft_Office_2016';
      case Application.microsoftOffice_2019:
        return 'Microsoft_Office_2019';
    }
  }
}

extension ApplicationFromString on String {
  Application toApplication() {
    switch (this) {
      case 'Microsoft_Office_2016':
        return Application.microsoftOffice_2016;
      case 'Microsoft_Office_2019':
        return Application.microsoftOffice_2019;
    }
    throw Exception('$this is not known in enum Application');
  }
}

enum ApplicationAssociatedResourceType {
  workspace,
  bundle,
  image,
}

extension ApplicationAssociatedResourceTypeValueExtension
    on ApplicationAssociatedResourceType {
  String toValue() {
    switch (this) {
      case ApplicationAssociatedResourceType.workspace:
        return 'WORKSPACE';
      case ApplicationAssociatedResourceType.bundle:
        return 'BUNDLE';
      case ApplicationAssociatedResourceType.image:
        return 'IMAGE';
    }
  }
}

extension ApplicationAssociatedResourceTypeFromString on String {
  ApplicationAssociatedResourceType toApplicationAssociatedResourceType() {
    switch (this) {
      case 'WORKSPACE':
        return ApplicationAssociatedResourceType.workspace;
      case 'BUNDLE':
        return ApplicationAssociatedResourceType.bundle;
      case 'IMAGE':
        return ApplicationAssociatedResourceType.image;
    }
    throw Exception(
        '$this is not known in enum ApplicationAssociatedResourceType');
  }
}

/// Describes the association between an application and an application
/// resource.
class ApplicationResourceAssociation {
  /// The identifier of the application.
  final String? applicationId;

  /// The identifier of the associated resource.
  final String? associatedResourceId;

  /// The resource type of the associated resource.
  final ApplicationAssociatedResourceType? associatedResourceType;

  /// The time the association was created.
  final DateTime? created;

  /// The time the association status was last updated.
  final DateTime? lastUpdatedTime;

  /// The status of the application resource association.
  final AssociationState? state;

  /// The reason the association deployment failed.
  final AssociationStateReason? stateReason;

  ApplicationResourceAssociation({
    this.applicationId,
    this.associatedResourceId,
    this.associatedResourceType,
    this.created,
    this.lastUpdatedTime,
    this.state,
    this.stateReason,
  });

  factory ApplicationResourceAssociation.fromJson(Map<String, dynamic> json) {
    return ApplicationResourceAssociation(
      applicationId: json['ApplicationId'] as String?,
      associatedResourceId: json['AssociatedResourceId'] as String?,
      associatedResourceType: (json['AssociatedResourceType'] as String?)
          ?.toApplicationAssociatedResourceType(),
      created: timeStampFromJson(json['Created']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      state: (json['State'] as String?)?.toAssociationState(),
      stateReason: json['StateReason'] != null
          ? AssociationStateReason.fromJson(
              json['StateReason'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final associatedResourceId = this.associatedResourceId;
    final associatedResourceType = this.associatedResourceType;
    final created = this.created;
    final lastUpdatedTime = this.lastUpdatedTime;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (associatedResourceId != null)
        'AssociatedResourceId': associatedResourceId,
      if (associatedResourceType != null)
        'AssociatedResourceType': associatedResourceType.toValue(),
      if (created != null) 'Created': unixTimestampToJson(created),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

class AssociateConnectionAliasResult {
  /// The identifier of the connection alias association. You use the connection
  /// identifier in the DNS TXT record when you're configuring your DNS routing
  /// policies.
  final String? connectionIdentifier;

  AssociateConnectionAliasResult({
    this.connectionIdentifier,
  });

  factory AssociateConnectionAliasResult.fromJson(Map<String, dynamic> json) {
    return AssociateConnectionAliasResult(
      connectionIdentifier: json['ConnectionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionIdentifier = this.connectionIdentifier;
    return {
      if (connectionIdentifier != null)
        'ConnectionIdentifier': connectionIdentifier,
    };
  }
}

class AssociateIpGroupsResult {
  AssociateIpGroupsResult();

  factory AssociateIpGroupsResult.fromJson(Map<String, dynamic> _) {
    return AssociateIpGroupsResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateWorkspaceApplicationResult {
  /// Information about the association between the specified WorkSpace and the
  /// specified application.
  final WorkspaceResourceAssociation? association;

  AssociateWorkspaceApplicationResult({
    this.association,
  });

  factory AssociateWorkspaceApplicationResult.fromJson(
      Map<String, dynamic> json) {
    return AssociateWorkspaceApplicationResult(
      association: json['Association'] != null
          ? WorkspaceResourceAssociation.fromJson(
              json['Association'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    return {
      if (association != null) 'Association': association,
    };
  }
}

enum AssociationErrorCode {
  validationErrorInsufficientDiskSpace,
  validationErrorInsufficientMemory,
  validationErrorUnsupportedOperatingSystem,
  deploymentErrorInternalServerError,
  deploymentErrorWorkspaceUnreachable,
}

extension AssociationErrorCodeValueExtension on AssociationErrorCode {
  String toValue() {
    switch (this) {
      case AssociationErrorCode.validationErrorInsufficientDiskSpace:
        return 'ValidationError.InsufficientDiskSpace';
      case AssociationErrorCode.validationErrorInsufficientMemory:
        return 'ValidationError.InsufficientMemory';
      case AssociationErrorCode.validationErrorUnsupportedOperatingSystem:
        return 'ValidationError.UnsupportedOperatingSystem';
      case AssociationErrorCode.deploymentErrorInternalServerError:
        return 'DeploymentError.InternalServerError';
      case AssociationErrorCode.deploymentErrorWorkspaceUnreachable:
        return 'DeploymentError.WorkspaceUnreachable';
    }
  }
}

extension AssociationErrorCodeFromString on String {
  AssociationErrorCode toAssociationErrorCode() {
    switch (this) {
      case 'ValidationError.InsufficientDiskSpace':
        return AssociationErrorCode.validationErrorInsufficientDiskSpace;
      case 'ValidationError.InsufficientMemory':
        return AssociationErrorCode.validationErrorInsufficientMemory;
      case 'ValidationError.UnsupportedOperatingSystem':
        return AssociationErrorCode.validationErrorUnsupportedOperatingSystem;
      case 'DeploymentError.InternalServerError':
        return AssociationErrorCode.deploymentErrorInternalServerError;
      case 'DeploymentError.WorkspaceUnreachable':
        return AssociationErrorCode.deploymentErrorWorkspaceUnreachable;
    }
    throw Exception('$this is not known in enum AssociationErrorCode');
  }
}

enum AssociationState {
  pendingInstall,
  pendingInstallDeployment,
  pendingUninstall,
  pendingUninstallDeployment,
  installing,
  uninstalling,
  error,
  completed,
  removed,
}

extension AssociationStateValueExtension on AssociationState {
  String toValue() {
    switch (this) {
      case AssociationState.pendingInstall:
        return 'PENDING_INSTALL';
      case AssociationState.pendingInstallDeployment:
        return 'PENDING_INSTALL_DEPLOYMENT';
      case AssociationState.pendingUninstall:
        return 'PENDING_UNINSTALL';
      case AssociationState.pendingUninstallDeployment:
        return 'PENDING_UNINSTALL_DEPLOYMENT';
      case AssociationState.installing:
        return 'INSTALLING';
      case AssociationState.uninstalling:
        return 'UNINSTALLING';
      case AssociationState.error:
        return 'ERROR';
      case AssociationState.completed:
        return 'COMPLETED';
      case AssociationState.removed:
        return 'REMOVED';
    }
  }
}

extension AssociationStateFromString on String {
  AssociationState toAssociationState() {
    switch (this) {
      case 'PENDING_INSTALL':
        return AssociationState.pendingInstall;
      case 'PENDING_INSTALL_DEPLOYMENT':
        return AssociationState.pendingInstallDeployment;
      case 'PENDING_UNINSTALL':
        return AssociationState.pendingUninstall;
      case 'PENDING_UNINSTALL_DEPLOYMENT':
        return AssociationState.pendingUninstallDeployment;
      case 'INSTALLING':
        return AssociationState.installing;
      case 'UNINSTALLING':
        return AssociationState.uninstalling;
      case 'ERROR':
        return AssociationState.error;
      case 'COMPLETED':
        return AssociationState.completed;
      case 'REMOVED':
        return AssociationState.removed;
    }
    throw Exception('$this is not known in enum AssociationState');
  }
}

/// Indicates the reason that the association deployment failed, including the
/// error code and error message.
class AssociationStateReason {
  /// The error code of the association deployment failure.
  final AssociationErrorCode? errorCode;

  /// The error message of the association deployment failure.
  final String? errorMessage;

  AssociationStateReason({
    this.errorCode,
    this.errorMessage,
  });

  factory AssociationStateReason.fromJson(Map<String, dynamic> json) {
    return AssociationStateReason(
      errorCode: (json['ErrorCode'] as String?)?.toAssociationErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

enum AssociationStatus {
  notAssociated,
  associatedWithOwnerAccount,
  associatedWithSharedAccount,
  pendingAssociation,
  pendingDisassociation,
}

extension AssociationStatusValueExtension on AssociationStatus {
  String toValue() {
    switch (this) {
      case AssociationStatus.notAssociated:
        return 'NOT_ASSOCIATED';
      case AssociationStatus.associatedWithOwnerAccount:
        return 'ASSOCIATED_WITH_OWNER_ACCOUNT';
      case AssociationStatus.associatedWithSharedAccount:
        return 'ASSOCIATED_WITH_SHARED_ACCOUNT';
      case AssociationStatus.pendingAssociation:
        return 'PENDING_ASSOCIATION';
      case AssociationStatus.pendingDisassociation:
        return 'PENDING_DISASSOCIATION';
    }
  }
}

extension AssociationStatusFromString on String {
  AssociationStatus toAssociationStatus() {
    switch (this) {
      case 'NOT_ASSOCIATED':
        return AssociationStatus.notAssociated;
      case 'ASSOCIATED_WITH_OWNER_ACCOUNT':
        return AssociationStatus.associatedWithOwnerAccount;
      case 'ASSOCIATED_WITH_SHARED_ACCOUNT':
        return AssociationStatus.associatedWithSharedAccount;
      case 'PENDING_ASSOCIATION':
        return AssociationStatus.pendingAssociation;
      case 'PENDING_DISASSOCIATION':
        return AssociationStatus.pendingDisassociation;
    }
    throw Exception('$this is not known in enum AssociationStatus');
  }
}

class AuthorizeIpRulesResult {
  AuthorizeIpRulesResult();

  factory AuthorizeIpRulesResult.fromJson(Map<String, dynamic> _) {
    return AuthorizeIpRulesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum BundleAssociatedResourceType {
  application,
}

extension BundleAssociatedResourceTypeValueExtension
    on BundleAssociatedResourceType {
  String toValue() {
    switch (this) {
      case BundleAssociatedResourceType.application:
        return 'APPLICATION';
    }
  }
}

extension BundleAssociatedResourceTypeFromString on String {
  BundleAssociatedResourceType toBundleAssociatedResourceType() {
    switch (this) {
      case 'APPLICATION':
        return BundleAssociatedResourceType.application;
    }
    throw Exception('$this is not known in enum BundleAssociatedResourceType');
  }
}

/// Describes the association between an application and a bundle resource.
class BundleResourceAssociation {
  /// The identifier of the associated resource.
  final String? associatedResourceId;

  /// The resource type of the associated resources.
  final BundleAssociatedResourceType? associatedResourceType;

  /// The identifier of the bundle.
  final String? bundleId;

  /// The time the association is created.
  final DateTime? created;

  /// The time the association status was last updated.
  final DateTime? lastUpdatedTime;

  /// The status of the bundle resource association.
  final AssociationState? state;

  /// The reason the association deployment failed.
  final AssociationStateReason? stateReason;

  BundleResourceAssociation({
    this.associatedResourceId,
    this.associatedResourceType,
    this.bundleId,
    this.created,
    this.lastUpdatedTime,
    this.state,
    this.stateReason,
  });

  factory BundleResourceAssociation.fromJson(Map<String, dynamic> json) {
    return BundleResourceAssociation(
      associatedResourceId: json['AssociatedResourceId'] as String?,
      associatedResourceType: (json['AssociatedResourceType'] as String?)
          ?.toBundleAssociatedResourceType(),
      bundleId: json['BundleId'] as String?,
      created: timeStampFromJson(json['Created']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      state: (json['State'] as String?)?.toAssociationState(),
      stateReason: json['StateReason'] != null
          ? AssociationStateReason.fromJson(
              json['StateReason'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedResourceId = this.associatedResourceId;
    final associatedResourceType = this.associatedResourceType;
    final bundleId = this.bundleId;
    final created = this.created;
    final lastUpdatedTime = this.lastUpdatedTime;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (associatedResourceId != null)
        'AssociatedResourceId': associatedResourceId,
      if (associatedResourceType != null)
        'AssociatedResourceType': associatedResourceType.toValue(),
      if (bundleId != null) 'BundleId': bundleId,
      if (created != null) 'Created': unixTimestampToJson(created),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

enum BundleType {
  regular,
  standby,
}

extension BundleTypeValueExtension on BundleType {
  String toValue() {
    switch (this) {
      case BundleType.regular:
        return 'REGULAR';
      case BundleType.standby:
        return 'STANDBY';
    }
  }
}

extension BundleTypeFromString on String {
  BundleType toBundleType() {
    switch (this) {
      case 'REGULAR':
        return BundleType.regular;
      case 'STANDBY':
        return BundleType.standby;
    }
    throw Exception('$this is not known in enum BundleType');
  }
}

/// Describes the properties of the certificate-based authentication you want to
/// use with your WorkSpaces.
class CertificateBasedAuthProperties {
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Certificate
  /// Manager Private CA resource.
  final String? certificateAuthorityArn;

  /// The status of the certificate-based authentication properties.
  final CertificateBasedAuthStatusEnum? status;

  CertificateBasedAuthProperties({
    this.certificateAuthorityArn,
    this.status,
  });

  factory CertificateBasedAuthProperties.fromJson(Map<String, dynamic> json) {
    return CertificateBasedAuthProperties(
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      status: (json['Status'] as String?)?.toCertificateBasedAuthStatusEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final status = this.status;
    return {
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum CertificateBasedAuthStatusEnum {
  disabled,
  enabled,
}

extension CertificateBasedAuthStatusEnumValueExtension
    on CertificateBasedAuthStatusEnum {
  String toValue() {
    switch (this) {
      case CertificateBasedAuthStatusEnum.disabled:
        return 'DISABLED';
      case CertificateBasedAuthStatusEnum.enabled:
        return 'ENABLED';
    }
  }
}

extension CertificateBasedAuthStatusEnumFromString on String {
  CertificateBasedAuthStatusEnum toCertificateBasedAuthStatusEnum() {
    switch (this) {
      case 'DISABLED':
        return CertificateBasedAuthStatusEnum.disabled;
      case 'ENABLED':
        return CertificateBasedAuthStatusEnum.enabled;
    }
    throw Exception(
        '$this is not known in enum CertificateBasedAuthStatusEnum');
  }
}

enum ClientDeviceType {
  deviceTypeWindows,
  deviceTypeOsx,
  deviceTypeAndroid,
  deviceTypeIos,
  deviceTypeLinux,
  deviceTypeWeb,
}

extension ClientDeviceTypeValueExtension on ClientDeviceType {
  String toValue() {
    switch (this) {
      case ClientDeviceType.deviceTypeWindows:
        return 'DeviceTypeWindows';
      case ClientDeviceType.deviceTypeOsx:
        return 'DeviceTypeOsx';
      case ClientDeviceType.deviceTypeAndroid:
        return 'DeviceTypeAndroid';
      case ClientDeviceType.deviceTypeIos:
        return 'DeviceTypeIos';
      case ClientDeviceType.deviceTypeLinux:
        return 'DeviceTypeLinux';
      case ClientDeviceType.deviceTypeWeb:
        return 'DeviceTypeWeb';
    }
  }
}

extension ClientDeviceTypeFromString on String {
  ClientDeviceType toClientDeviceType() {
    switch (this) {
      case 'DeviceTypeWindows':
        return ClientDeviceType.deviceTypeWindows;
      case 'DeviceTypeOsx':
        return ClientDeviceType.deviceTypeOsx;
      case 'DeviceTypeAndroid':
        return ClientDeviceType.deviceTypeAndroid;
      case 'DeviceTypeIos':
        return ClientDeviceType.deviceTypeIos;
      case 'DeviceTypeLinux':
        return ClientDeviceType.deviceTypeLinux;
      case 'DeviceTypeWeb':
        return ClientDeviceType.deviceTypeWeb;
    }
    throw Exception('$this is not known in enum ClientDeviceType');
  }
}

/// Describes an Amazon WorkSpaces client.
class ClientProperties {
  /// Specifies whether users can upload diagnostic log files of Amazon WorkSpaces
  /// client directly to WorkSpaces to troubleshoot issues when using the
  /// WorkSpaces client. When enabled, the log files will be sent to WorkSpaces
  /// automatically and will be applied to all users in the specified directory.
  final LogUploadEnum? logUploadEnabled;

  /// Specifies whether users can cache their credentials on the Amazon WorkSpaces
  /// client. When enabled, users can choose to reconnect to their WorkSpaces
  /// without re-entering their credentials.
  final ReconnectEnum? reconnectEnabled;

  ClientProperties({
    this.logUploadEnabled,
    this.reconnectEnabled,
  });

  factory ClientProperties.fromJson(Map<String, dynamic> json) {
    return ClientProperties(
      logUploadEnabled:
          (json['LogUploadEnabled'] as String?)?.toLogUploadEnum(),
      reconnectEnabled:
          (json['ReconnectEnabled'] as String?)?.toReconnectEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final logUploadEnabled = this.logUploadEnabled;
    final reconnectEnabled = this.reconnectEnabled;
    return {
      if (logUploadEnabled != null)
        'LogUploadEnabled': logUploadEnabled.toValue(),
      if (reconnectEnabled != null)
        'ReconnectEnabled': reconnectEnabled.toValue(),
    };
  }
}

/// Information about the Amazon WorkSpaces client.
class ClientPropertiesResult {
  /// Information about the Amazon WorkSpaces client.
  final ClientProperties? clientProperties;

  /// The resource identifier, in the form of a directory ID.
  final String? resourceId;

  ClientPropertiesResult({
    this.clientProperties,
    this.resourceId,
  });

  factory ClientPropertiesResult.fromJson(Map<String, dynamic> json) {
    return ClientPropertiesResult(
      clientProperties: json['ClientProperties'] != null
          ? ClientProperties.fromJson(
              json['ClientProperties'] as Map<String, dynamic>)
          : null,
      resourceId: json['ResourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientProperties = this.clientProperties;
    final resourceId = this.resourceId;
    return {
      if (clientProperties != null) 'ClientProperties': clientProperties,
      if (resourceId != null) 'ResourceId': resourceId,
    };
  }
}

enum Compute {
  value,
  standard,
  performance,
  power,
  graphics,
  powerpro,
  graphicspro,
  graphicsG4dn,
  graphicsproG4dn,
}

extension ComputeValueExtension on Compute {
  String toValue() {
    switch (this) {
      case Compute.value:
        return 'VALUE';
      case Compute.standard:
        return 'STANDARD';
      case Compute.performance:
        return 'PERFORMANCE';
      case Compute.power:
        return 'POWER';
      case Compute.graphics:
        return 'GRAPHICS';
      case Compute.powerpro:
        return 'POWERPRO';
      case Compute.graphicspro:
        return 'GRAPHICSPRO';
      case Compute.graphicsG4dn:
        return 'GRAPHICS_G4DN';
      case Compute.graphicsproG4dn:
        return 'GRAPHICSPRO_G4DN';
    }
  }
}

extension ComputeFromString on String {
  Compute toCompute() {
    switch (this) {
      case 'VALUE':
        return Compute.value;
      case 'STANDARD':
        return Compute.standard;
      case 'PERFORMANCE':
        return Compute.performance;
      case 'POWER':
        return Compute.power;
      case 'GRAPHICS':
        return Compute.graphics;
      case 'POWERPRO':
        return Compute.powerpro;
      case 'GRAPHICSPRO':
        return Compute.graphicspro;
      case 'GRAPHICS_G4DN':
        return Compute.graphicsG4dn;
      case 'GRAPHICSPRO_G4DN':
        return Compute.graphicsproG4dn;
    }
    throw Exception('$this is not known in enum Compute');
  }
}

/// Describes the compute type of the bundle.
class ComputeType {
  /// The compute type.
  final Compute? name;

  ComputeType({
    this.name,
  });

  factory ComputeType.fromJson(Map<String, dynamic> json) {
    return ComputeType(
      name: (json['Name'] as String?)?.toCompute(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name.toValue(),
    };
  }
}

/// Describes an Amazon Connect client add-in.
class ConnectClientAddIn {
  /// The client add-in identifier.
  final String? addInId;

  /// The name of the client add in.
  final String? name;

  /// The directory identifier for which the client add-in is configured.
  final String? resourceId;

  /// The endpoint URL of the client add-in.
  final String? url;

  ConnectClientAddIn({
    this.addInId,
    this.name,
    this.resourceId,
    this.url,
  });

  factory ConnectClientAddIn.fromJson(Map<String, dynamic> json) {
    return ConnectClientAddIn(
      addInId: json['AddInId'] as String?,
      name: json['Name'] as String?,
      resourceId: json['ResourceId'] as String?,
      url: json['URL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addInId = this.addInId;
    final name = this.name;
    final resourceId = this.resourceId;
    final url = this.url;
    return {
      if (addInId != null) 'AddInId': addInId,
      if (name != null) 'Name': name,
      if (resourceId != null) 'ResourceId': resourceId,
      if (url != null) 'URL': url,
    };
  }
}

/// Describes a connection alias. Connection aliases are used for cross-Region
/// redirection. For more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
/// Cross-Region Redirection for Amazon WorkSpaces</a>.
class ConnectionAlias {
  /// The identifier of the connection alias.
  final String? aliasId;

  /// The association status of the connection alias.
  final List<ConnectionAliasAssociation>? associations;

  /// The connection string specified for the connection alias. The connection
  /// string must be in the form of a fully qualified domain name (FQDN), such as
  /// <code>www.example.com</code>.
  final String? connectionString;

  /// The identifier of the Amazon Web Services account that owns the connection
  /// alias.
  final String? ownerAccountId;

  /// The current state of the connection alias.
  final ConnectionAliasState? state;

  ConnectionAlias({
    this.aliasId,
    this.associations,
    this.connectionString,
    this.ownerAccountId,
    this.state,
  });

  factory ConnectionAlias.fromJson(Map<String, dynamic> json) {
    return ConnectionAlias(
      aliasId: json['AliasId'] as String?,
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConnectionAliasAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      connectionString: json['ConnectionString'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      state: (json['State'] as String?)?.toConnectionAliasState(),
    );
  }

  Map<String, dynamic> toJson() {
    final aliasId = this.aliasId;
    final associations = this.associations;
    final connectionString = this.connectionString;
    final ownerAccountId = this.ownerAccountId;
    final state = this.state;
    return {
      if (aliasId != null) 'AliasId': aliasId,
      if (associations != null) 'Associations': associations,
      if (connectionString != null) 'ConnectionString': connectionString,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// Describes a connection alias association that is used for cross-Region
/// redirection. For more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
/// Cross-Region Redirection for Amazon WorkSpaces</a>.
class ConnectionAliasAssociation {
  /// The identifier of the Amazon Web Services account that associated the
  /// connection alias with a directory.
  final String? associatedAccountId;

  /// The association status of the connection alias.
  final AssociationStatus? associationStatus;

  /// The identifier of the connection alias association. You use the connection
  /// identifier in the DNS TXT record when you're configuring your DNS routing
  /// policies.
  final String? connectionIdentifier;

  /// The identifier of the directory associated with a connection alias.
  final String? resourceId;

  ConnectionAliasAssociation({
    this.associatedAccountId,
    this.associationStatus,
    this.connectionIdentifier,
    this.resourceId,
  });

  factory ConnectionAliasAssociation.fromJson(Map<String, dynamic> json) {
    return ConnectionAliasAssociation(
      associatedAccountId: json['AssociatedAccountId'] as String?,
      associationStatus:
          (json['AssociationStatus'] as String?)?.toAssociationStatus(),
      connectionIdentifier: json['ConnectionIdentifier'] as String?,
      resourceId: json['ResourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAccountId = this.associatedAccountId;
    final associationStatus = this.associationStatus;
    final connectionIdentifier = this.connectionIdentifier;
    final resourceId = this.resourceId;
    return {
      if (associatedAccountId != null)
        'AssociatedAccountId': associatedAccountId,
      if (associationStatus != null)
        'AssociationStatus': associationStatus.toValue(),
      if (connectionIdentifier != null)
        'ConnectionIdentifier': connectionIdentifier,
      if (resourceId != null) 'ResourceId': resourceId,
    };
  }
}

/// Describes the permissions for a connection alias. Connection aliases are
/// used for cross-Region redirection. For more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
/// Cross-Region Redirection for Amazon WorkSpaces</a>.
class ConnectionAliasPermission {
  /// Indicates whether the specified Amazon Web Services account is allowed to
  /// associate the connection alias with a directory.
  final bool allowAssociation;

  /// The identifier of the Amazon Web Services account that the connection alias
  /// is shared with.
  final String sharedAccountId;

  ConnectionAliasPermission({
    required this.allowAssociation,
    required this.sharedAccountId,
  });

  factory ConnectionAliasPermission.fromJson(Map<String, dynamic> json) {
    return ConnectionAliasPermission(
      allowAssociation: json['AllowAssociation'] as bool,
      sharedAccountId: json['SharedAccountId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final allowAssociation = this.allowAssociation;
    final sharedAccountId = this.sharedAccountId;
    return {
      'AllowAssociation': allowAssociation,
      'SharedAccountId': sharedAccountId,
    };
  }
}

enum ConnectionAliasState {
  creating,
  created,
  deleting,
}

extension ConnectionAliasStateValueExtension on ConnectionAliasState {
  String toValue() {
    switch (this) {
      case ConnectionAliasState.creating:
        return 'CREATING';
      case ConnectionAliasState.created:
        return 'CREATED';
      case ConnectionAliasState.deleting:
        return 'DELETING';
    }
  }
}

extension ConnectionAliasStateFromString on String {
  ConnectionAliasState toConnectionAliasState() {
    switch (this) {
      case 'CREATING':
        return ConnectionAliasState.creating;
      case 'CREATED':
        return ConnectionAliasState.created;
      case 'DELETING':
        return ConnectionAliasState.deleting;
    }
    throw Exception('$this is not known in enum ConnectionAliasState');
  }
}

enum ConnectionState {
  connected,
  disconnected,
  unknown,
}

extension ConnectionStateValueExtension on ConnectionState {
  String toValue() {
    switch (this) {
      case ConnectionState.connected:
        return 'CONNECTED';
      case ConnectionState.disconnected:
        return 'DISCONNECTED';
      case ConnectionState.unknown:
        return 'UNKNOWN';
    }
  }
}

extension ConnectionStateFromString on String {
  ConnectionState toConnectionState() {
    switch (this) {
      case 'CONNECTED':
        return ConnectionState.connected;
      case 'DISCONNECTED':
        return ConnectionState.disconnected;
      case 'UNKNOWN':
        return ConnectionState.unknown;
    }
    throw Exception('$this is not known in enum ConnectionState');
  }
}

class CopyWorkspaceImageResult {
  /// The identifier of the image.
  final String? imageId;

  CopyWorkspaceImageResult({
    this.imageId,
  });

  factory CopyWorkspaceImageResult.fromJson(Map<String, dynamic> json) {
    return CopyWorkspaceImageResult(
      imageId: json['ImageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    return {
      if (imageId != null) 'ImageId': imageId,
    };
  }
}

class CreateAccountLinkInvitationResult {
  /// Information about the account link.
  final AccountLink? accountLink;

  CreateAccountLinkInvitationResult({
    this.accountLink,
  });

  factory CreateAccountLinkInvitationResult.fromJson(
      Map<String, dynamic> json) {
    return CreateAccountLinkInvitationResult(
      accountLink: json['AccountLink'] != null
          ? AccountLink.fromJson(json['AccountLink'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLink = this.accountLink;
    return {
      if (accountLink != null) 'AccountLink': accountLink,
    };
  }
}

class CreateConnectClientAddInResult {
  /// The client add-in identifier.
  final String? addInId;

  CreateConnectClientAddInResult({
    this.addInId,
  });

  factory CreateConnectClientAddInResult.fromJson(Map<String, dynamic> json) {
    return CreateConnectClientAddInResult(
      addInId: json['AddInId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addInId = this.addInId;
    return {
      if (addInId != null) 'AddInId': addInId,
    };
  }
}

class CreateConnectionAliasResult {
  /// The identifier of the connection alias.
  final String? aliasId;

  CreateConnectionAliasResult({
    this.aliasId,
  });

  factory CreateConnectionAliasResult.fromJson(Map<String, dynamic> json) {
    return CreateConnectionAliasResult(
      aliasId: json['AliasId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasId = this.aliasId;
    return {
      if (aliasId != null) 'AliasId': aliasId,
    };
  }
}

class CreateIpGroupResult {
  /// The identifier of the group.
  final String? groupId;

  CreateIpGroupResult({
    this.groupId,
  });

  factory CreateIpGroupResult.fromJson(Map<String, dynamic> json) {
    return CreateIpGroupResult(
      groupId: json['GroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    return {
      if (groupId != null) 'GroupId': groupId,
    };
  }
}

class CreateStandbyWorkspacesResult {
  /// Information about the standby WorkSpace that could not be created.
  final List<FailedCreateStandbyWorkspacesRequest>? failedStandbyRequests;

  /// Information about the standby WorkSpace that was created.
  final List<PendingCreateStandbyWorkspacesRequest>? pendingStandbyRequests;

  CreateStandbyWorkspacesResult({
    this.failedStandbyRequests,
    this.pendingStandbyRequests,
  });

  factory CreateStandbyWorkspacesResult.fromJson(Map<String, dynamic> json) {
    return CreateStandbyWorkspacesResult(
      failedStandbyRequests: (json['FailedStandbyRequests'] as List?)
          ?.whereNotNull()
          .map((e) => FailedCreateStandbyWorkspacesRequest.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      pendingStandbyRequests: (json['PendingStandbyRequests'] as List?)
          ?.whereNotNull()
          .map((e) => PendingCreateStandbyWorkspacesRequest.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedStandbyRequests = this.failedStandbyRequests;
    final pendingStandbyRequests = this.pendingStandbyRequests;
    return {
      if (failedStandbyRequests != null)
        'FailedStandbyRequests': failedStandbyRequests,
      if (pendingStandbyRequests != null)
        'PendingStandbyRequests': pendingStandbyRequests,
    };
  }
}

class CreateTagsResult {
  CreateTagsResult();

  factory CreateTagsResult.fromJson(Map<String, dynamic> _) {
    return CreateTagsResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateUpdatedWorkspaceImageResult {
  /// The identifier of the new updated WorkSpace image.
  final String? imageId;

  CreateUpdatedWorkspaceImageResult({
    this.imageId,
  });

  factory CreateUpdatedWorkspaceImageResult.fromJson(
      Map<String, dynamic> json) {
    return CreateUpdatedWorkspaceImageResult(
      imageId: json['ImageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    return {
      if (imageId != null) 'ImageId': imageId,
    };
  }
}

class CreateWorkspaceBundleResult {
  final WorkspaceBundle? workspaceBundle;

  CreateWorkspaceBundleResult({
    this.workspaceBundle,
  });

  factory CreateWorkspaceBundleResult.fromJson(Map<String, dynamic> json) {
    return CreateWorkspaceBundleResult(
      workspaceBundle: json['WorkspaceBundle'] != null
          ? WorkspaceBundle.fromJson(
              json['WorkspaceBundle'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workspaceBundle = this.workspaceBundle;
    return {
      if (workspaceBundle != null) 'WorkspaceBundle': workspaceBundle,
    };
  }
}

class CreateWorkspaceImageResult {
  /// The date when the image was created.
  final DateTime? created;

  /// The description of the image.
  final String? description;

  /// The identifier of the new WorkSpace image.
  final String? imageId;

  /// The name of the image.
  final String? name;

  /// The operating system that the image is running.
  final OperatingSystem? operatingSystem;

  /// The identifier of the Amazon Web Services account that owns the image.
  final String? ownerAccountId;

  /// Specifies whether the image is running on dedicated hardware. When Bring
  /// Your Own License (BYOL) is enabled, this value is set to DEDICATED. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.htm">
  /// Bring Your Own Windows Desktop Images.</a>.
  final WorkspaceImageRequiredTenancy? requiredTenancy;

  /// The availability status of the image.
  final WorkspaceImageState? state;

  CreateWorkspaceImageResult({
    this.created,
    this.description,
    this.imageId,
    this.name,
    this.operatingSystem,
    this.ownerAccountId,
    this.requiredTenancy,
    this.state,
  });

  factory CreateWorkspaceImageResult.fromJson(Map<String, dynamic> json) {
    return CreateWorkspaceImageResult(
      created: timeStampFromJson(json['Created']),
      description: json['Description'] as String?,
      imageId: json['ImageId'] as String?,
      name: json['Name'] as String?,
      operatingSystem: json['OperatingSystem'] != null
          ? OperatingSystem.fromJson(
              json['OperatingSystem'] as Map<String, dynamic>)
          : null,
      ownerAccountId: json['OwnerAccountId'] as String?,
      requiredTenancy: (json['RequiredTenancy'] as String?)
          ?.toWorkspaceImageRequiredTenancy(),
      state: (json['State'] as String?)?.toWorkspaceImageState(),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final description = this.description;
    final imageId = this.imageId;
    final name = this.name;
    final operatingSystem = this.operatingSystem;
    final ownerAccountId = this.ownerAccountId;
    final requiredTenancy = this.requiredTenancy;
    final state = this.state;
    return {
      if (created != null) 'Created': unixTimestampToJson(created),
      if (description != null) 'Description': description,
      if (imageId != null) 'ImageId': imageId,
      if (name != null) 'Name': name,
      if (operatingSystem != null) 'OperatingSystem': operatingSystem,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (requiredTenancy != null) 'RequiredTenancy': requiredTenancy.toValue(),
      if (state != null) 'State': state.toValue(),
    };
  }
}

class CreateWorkspacesResult {
  /// Information about the WorkSpaces that could not be created.
  final List<FailedCreateWorkspaceRequest>? failedRequests;

  /// Information about the WorkSpaces that were created.
  ///
  /// Because this operation is asynchronous, the identifier returned is not
  /// immediately available for use with other operations. For example, if you
  /// call <a>DescribeWorkspaces</a> before the WorkSpace is created, the
  /// information returned can be incomplete.
  final List<Workspace>? pendingRequests;

  CreateWorkspacesResult({
    this.failedRequests,
    this.pendingRequests,
  });

  factory CreateWorkspacesResult.fromJson(Map<String, dynamic> json) {
    return CreateWorkspacesResult(
      failedRequests: (json['FailedRequests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FailedCreateWorkspaceRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingRequests: (json['PendingRequests'] as List?)
          ?.whereNotNull()
          .map((e) => Workspace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRequests = this.failedRequests;
    final pendingRequests = this.pendingRequests;
    return {
      if (failedRequests != null) 'FailedRequests': failedRequests,
      if (pendingRequests != null) 'PendingRequests': pendingRequests,
    };
  }
}

enum DataReplication {
  noReplication,
  primaryAsSource,
}

extension DataReplicationValueExtension on DataReplication {
  String toValue() {
    switch (this) {
      case DataReplication.noReplication:
        return 'NO_REPLICATION';
      case DataReplication.primaryAsSource:
        return 'PRIMARY_AS_SOURCE';
    }
  }
}

extension DataReplicationFromString on String {
  DataReplication toDataReplication() {
    switch (this) {
      case 'NO_REPLICATION':
        return DataReplication.noReplication;
      case 'PRIMARY_AS_SOURCE':
        return DataReplication.primaryAsSource;
    }
    throw Exception('$this is not known in enum DataReplication');
  }
}

/// Describes the data replication settings.
class DataReplicationSettings {
  /// Indicates whether data replication is enabled, and if enabled, the type of
  /// data replication.
  final DataReplication? dataReplication;

  /// The date and time at which the last successful snapshot was taken of the
  /// primary WorkSpace used for replicating data.
  final DateTime? recoverySnapshotTime;

  DataReplicationSettings({
    this.dataReplication,
    this.recoverySnapshotTime,
  });

  factory DataReplicationSettings.fromJson(Map<String, dynamic> json) {
    return DataReplicationSettings(
      dataReplication:
          (json['DataReplication'] as String?)?.toDataReplication(),
      recoverySnapshotTime: timeStampFromJson(json['RecoverySnapshotTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataReplication = this.dataReplication;
    final recoverySnapshotTime = this.recoverySnapshotTime;
    return {
      if (dataReplication != null) 'DataReplication': dataReplication.toValue(),
      if (recoverySnapshotTime != null)
        'RecoverySnapshotTime': unixTimestampToJson(recoverySnapshotTime),
    };
  }
}

enum DedicatedTenancyAccountType {
  sourceAccount,
  targetAccount,
}

extension DedicatedTenancyAccountTypeValueExtension
    on DedicatedTenancyAccountType {
  String toValue() {
    switch (this) {
      case DedicatedTenancyAccountType.sourceAccount:
        return 'SOURCE_ACCOUNT';
      case DedicatedTenancyAccountType.targetAccount:
        return 'TARGET_ACCOUNT';
    }
  }
}

extension DedicatedTenancyAccountTypeFromString on String {
  DedicatedTenancyAccountType toDedicatedTenancyAccountType() {
    switch (this) {
      case 'SOURCE_ACCOUNT':
        return DedicatedTenancyAccountType.sourceAccount;
      case 'TARGET_ACCOUNT':
        return DedicatedTenancyAccountType.targetAccount;
    }
    throw Exception('$this is not known in enum DedicatedTenancyAccountType');
  }
}

enum DedicatedTenancyModificationStateEnum {
  pending,
  completed,
  failed,
}

extension DedicatedTenancyModificationStateEnumValueExtension
    on DedicatedTenancyModificationStateEnum {
  String toValue() {
    switch (this) {
      case DedicatedTenancyModificationStateEnum.pending:
        return 'PENDING';
      case DedicatedTenancyModificationStateEnum.completed:
        return 'COMPLETED';
      case DedicatedTenancyModificationStateEnum.failed:
        return 'FAILED';
    }
  }
}

extension DedicatedTenancyModificationStateEnumFromString on String {
  DedicatedTenancyModificationStateEnum
      toDedicatedTenancyModificationStateEnum() {
    switch (this) {
      case 'PENDING':
        return DedicatedTenancyModificationStateEnum.pending;
      case 'COMPLETED':
        return DedicatedTenancyModificationStateEnum.completed;
      case 'FAILED':
        return DedicatedTenancyModificationStateEnum.failed;
    }
    throw Exception(
        '$this is not known in enum DedicatedTenancyModificationStateEnum');
  }
}

enum DedicatedTenancySupportEnum {
  enabled,
}

extension DedicatedTenancySupportEnumValueExtension
    on DedicatedTenancySupportEnum {
  String toValue() {
    switch (this) {
      case DedicatedTenancySupportEnum.enabled:
        return 'ENABLED';
    }
  }
}

extension DedicatedTenancySupportEnumFromString on String {
  DedicatedTenancySupportEnum toDedicatedTenancySupportEnum() {
    switch (this) {
      case 'ENABLED':
        return DedicatedTenancySupportEnum.enabled;
    }
    throw Exception('$this is not known in enum DedicatedTenancySupportEnum');
  }
}

enum DedicatedTenancySupportResultEnum {
  enabled,
  disabled,
}

extension DedicatedTenancySupportResultEnumValueExtension
    on DedicatedTenancySupportResultEnum {
  String toValue() {
    switch (this) {
      case DedicatedTenancySupportResultEnum.enabled:
        return 'ENABLED';
      case DedicatedTenancySupportResultEnum.disabled:
        return 'DISABLED';
    }
  }
}

extension DedicatedTenancySupportResultEnumFromString on String {
  DedicatedTenancySupportResultEnum toDedicatedTenancySupportResultEnum() {
    switch (this) {
      case 'ENABLED':
        return DedicatedTenancySupportResultEnum.enabled;
      case 'DISABLED':
        return DedicatedTenancySupportResultEnum.disabled;
    }
    throw Exception(
        '$this is not known in enum DedicatedTenancySupportResultEnum');
  }
}

/// Returns default client branding attributes that were imported. These
/// attributes display on the client login screen.
/// <important>
/// Client branding attributes are public facing. Ensure that you don't include
/// sensitive information.
/// </important>
class DefaultClientBrandingAttributes {
  /// The forgotten password link. This is the web address that users can go to if
  /// they forget the password for their WorkSpace.
  final String? forgotPasswordLink;

  /// The login message. Specified as a key value pair, in which the key is a
  /// locale and the value is the localized message for that locale. The only key
  /// supported is <code>en_US</code>. The HTML tags supported include the
  /// following: <code>a, b, blockquote, br, cite, code, dd, dl, dt, div, em, i,
  /// li, ol, p, pre, q, small, span, strike, strong, sub, sup, u, ul</code>.
  final Map<String, String>? loginMessage;

  /// The logo. The only image format accepted is a binary data object that is
  /// converted from a <code>.png</code> file.
  final String? logoUrl;

  /// The support email. The company's customer support email address.
  /// <note>
  /// <ul>
  /// <li>
  /// In each platform type, the <code>SupportEmail</code> and
  /// <code>SupportLink</code> parameters are mutually exclusive. You can specify
  /// one parameter for each platform type, but not both.
  /// </li>
  /// <li>
  /// The default email is <code>workspaces-feedback@amazon.com</code>.
  /// </li>
  /// </ul> </note>
  final String? supportEmail;

  /// The support link. The link for the company's customer support page for their
  /// WorkSpace.
  /// <note>
  /// <ul>
  /// <li>
  /// In each platform type, the <code>SupportEmail</code> and
  /// <code>SupportLink</code> parameters are mutually exclusive.You can specify
  /// one parameter for each platform type, but not both.
  /// </li>
  /// <li>
  /// The default support link is <code>workspaces-feedback@amazon.com</code>.
  /// </li>
  /// </ul> </note>
  final String? supportLink;

  DefaultClientBrandingAttributes({
    this.forgotPasswordLink,
    this.loginMessage,
    this.logoUrl,
    this.supportEmail,
    this.supportLink,
  });

  factory DefaultClientBrandingAttributes.fromJson(Map<String, dynamic> json) {
    return DefaultClientBrandingAttributes(
      forgotPasswordLink: json['ForgotPasswordLink'] as String?,
      loginMessage: (json['LoginMessage'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      logoUrl: json['LogoUrl'] as String?,
      supportEmail: json['SupportEmail'] as String?,
      supportLink: json['SupportLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final forgotPasswordLink = this.forgotPasswordLink;
    final loginMessage = this.loginMessage;
    final logoUrl = this.logoUrl;
    final supportEmail = this.supportEmail;
    final supportLink = this.supportLink;
    return {
      if (forgotPasswordLink != null) 'ForgotPasswordLink': forgotPasswordLink,
      if (loginMessage != null) 'LoginMessage': loginMessage,
      if (logoUrl != null) 'LogoUrl': logoUrl,
      if (supportEmail != null) 'SupportEmail': supportEmail,
      if (supportLink != null) 'SupportLink': supportLink,
    };
  }
}

/// The default client branding attributes to be imported. These attributes
/// display on the client login screen.
/// <important>
/// Client branding attributes are public facing. Ensure that you do not include
/// sensitive information.
/// </important>
class DefaultImportClientBrandingAttributes {
  /// The forgotten password link. This is the web address that users can go to if
  /// they forget the password for their WorkSpace.
  final String? forgotPasswordLink;

  /// The login message. Specified as a key value pair, in which the key is a
  /// locale and the value is the localized message for that locale. The only key
  /// supported is <code>en_US</code>. The HTML tags supported include the
  /// following: <code>a, b, blockquote, br, cite, code, dd, dl, dt, div, em, i,
  /// li, ol, p, pre, q, small, span, strike, strong, sub, sup, u, ul</code>.
  final Map<String, String>? loginMessage;

  /// The logo. The only image format accepted is a binary data object that is
  /// converted from a <code>.png</code> file.
  final Uint8List? logo;

  /// The support email. The company's customer support email address.
  /// <note>
  /// <ul>
  /// <li>
  /// In each platform type, the <code>SupportEmail</code> and
  /// <code>SupportLink</code> parameters are mutually exclusive. You can specify
  /// one parameter for each platform type, but not both.
  /// </li>
  /// <li>
  /// The default email is <code>workspaces-feedback@amazon.com</code>.
  /// </li>
  /// </ul> </note>
  final String? supportEmail;

  /// The support link. The link for the company's customer support page for their
  /// WorkSpace.
  /// <note>
  /// <ul>
  /// <li>
  /// In each platform type, the <code>SupportEmail</code> and
  /// <code>SupportLink</code> parameters are mutually exclusive. You can specify
  /// one parameter for each platform type, but not both.
  /// </li>
  /// <li>
  /// The default support link is <code>workspaces-feedback@amazon.com</code>.
  /// </li>
  /// </ul> </note>
  final String? supportLink;

  DefaultImportClientBrandingAttributes({
    this.forgotPasswordLink,
    this.loginMessage,
    this.logo,
    this.supportEmail,
    this.supportLink,
  });

  Map<String, dynamic> toJson() {
    final forgotPasswordLink = this.forgotPasswordLink;
    final loginMessage = this.loginMessage;
    final logo = this.logo;
    final supportEmail = this.supportEmail;
    final supportLink = this.supportLink;
    return {
      if (forgotPasswordLink != null) 'ForgotPasswordLink': forgotPasswordLink,
      if (loginMessage != null) 'LoginMessage': loginMessage,
      if (logo != null) 'Logo': base64Encode(logo),
      if (supportEmail != null) 'SupportEmail': supportEmail,
      if (supportLink != null) 'SupportLink': supportLink,
    };
  }
}

/// Describes the default values that are used to create WorkSpaces. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/update-directory-details.html">Update
/// Directory Details for Your WorkSpaces</a>.
class DefaultWorkspaceCreationProperties {
  /// The identifier of the default security group to apply to WorkSpaces when
  /// they are created. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces-security-groups.html">
  /// Security Groups for Your WorkSpaces</a>.
  final String? customSecurityGroupId;

  /// The organizational unit (OU) in the directory for the WorkSpace machine
  /// accounts.
  final String? defaultOu;

  /// Specifies whether to automatically assign an Elastic public IP address to
  /// WorkSpaces in this directory by default. If enabled, the Elastic public IP
  /// address allows outbound internet access from your WorkSpaces when you’re
  /// using an internet gateway in the Amazon VPC in which your WorkSpaces are
  /// located. If you're using a Network Address Translation (NAT) gateway for
  /// outbound internet access from your VPC, or if your WorkSpaces are in public
  /// subnets and you manually assign them Elastic IP addresses, you should
  /// disable this setting. This setting applies to new WorkSpaces that you launch
  /// or to existing WorkSpaces that you rebuild. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces-vpc.html">
  /// Configure a VPC for Amazon WorkSpaces</a>.
  final bool? enableInternetAccess;

  /// Specifies whether maintenance mode is enabled for WorkSpaces. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/workspace-maintenance.html">WorkSpace
  /// Maintenance</a>.
  final bool? enableMaintenanceMode;

  /// Specifies whether the directory is enabled for Amazon WorkDocs.
  final bool? enableWorkDocs;

  /// Specifies whether WorkSpace users are local administrators on their
  /// WorkSpaces.
  final bool? userEnabledAsLocalAdministrator;

  DefaultWorkspaceCreationProperties({
    this.customSecurityGroupId,
    this.defaultOu,
    this.enableInternetAccess,
    this.enableMaintenanceMode,
    this.enableWorkDocs,
    this.userEnabledAsLocalAdministrator,
  });

  factory DefaultWorkspaceCreationProperties.fromJson(
      Map<String, dynamic> json) {
    return DefaultWorkspaceCreationProperties(
      customSecurityGroupId: json['CustomSecurityGroupId'] as String?,
      defaultOu: json['DefaultOu'] as String?,
      enableInternetAccess: json['EnableInternetAccess'] as bool?,
      enableMaintenanceMode: json['EnableMaintenanceMode'] as bool?,
      enableWorkDocs: json['EnableWorkDocs'] as bool?,
      userEnabledAsLocalAdministrator:
          json['UserEnabledAsLocalAdministrator'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final customSecurityGroupId = this.customSecurityGroupId;
    final defaultOu = this.defaultOu;
    final enableInternetAccess = this.enableInternetAccess;
    final enableMaintenanceMode = this.enableMaintenanceMode;
    final enableWorkDocs = this.enableWorkDocs;
    final userEnabledAsLocalAdministrator =
        this.userEnabledAsLocalAdministrator;
    return {
      if (customSecurityGroupId != null)
        'CustomSecurityGroupId': customSecurityGroupId,
      if (defaultOu != null) 'DefaultOu': defaultOu,
      if (enableInternetAccess != null)
        'EnableInternetAccess': enableInternetAccess,
      if (enableMaintenanceMode != null)
        'EnableMaintenanceMode': enableMaintenanceMode,
      if (enableWorkDocs != null) 'EnableWorkDocs': enableWorkDocs,
      if (userEnabledAsLocalAdministrator != null)
        'UserEnabledAsLocalAdministrator': userEnabledAsLocalAdministrator,
    };
  }
}

enum DeletableCertificateBasedAuthProperty {
  certificateBasedAuthPropertiesCertificateAuthorityArn,
}

extension DeletableCertificateBasedAuthPropertyValueExtension
    on DeletableCertificateBasedAuthProperty {
  String toValue() {
    switch (this) {
      case DeletableCertificateBasedAuthProperty
            .certificateBasedAuthPropertiesCertificateAuthorityArn:
        return 'CERTIFICATE_BASED_AUTH_PROPERTIES_CERTIFICATE_AUTHORITY_ARN';
    }
  }
}

extension DeletableCertificateBasedAuthPropertyFromString on String {
  DeletableCertificateBasedAuthProperty
      toDeletableCertificateBasedAuthProperty() {
    switch (this) {
      case 'CERTIFICATE_BASED_AUTH_PROPERTIES_CERTIFICATE_AUTHORITY_ARN':
        return DeletableCertificateBasedAuthProperty
            .certificateBasedAuthPropertiesCertificateAuthorityArn;
    }
    throw Exception(
        '$this is not known in enum DeletableCertificateBasedAuthProperty');
  }
}

enum DeletableSamlProperty {
  samlPropertiesUserAccessUrl,
  samlPropertiesRelayStateParameterName,
}

extension DeletableSamlPropertyValueExtension on DeletableSamlProperty {
  String toValue() {
    switch (this) {
      case DeletableSamlProperty.samlPropertiesUserAccessUrl:
        return 'SAML_PROPERTIES_USER_ACCESS_URL';
      case DeletableSamlProperty.samlPropertiesRelayStateParameterName:
        return 'SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME';
    }
  }
}

extension DeletableSamlPropertyFromString on String {
  DeletableSamlProperty toDeletableSamlProperty() {
    switch (this) {
      case 'SAML_PROPERTIES_USER_ACCESS_URL':
        return DeletableSamlProperty.samlPropertiesUserAccessUrl;
      case 'SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME':
        return DeletableSamlProperty.samlPropertiesRelayStateParameterName;
    }
    throw Exception('$this is not known in enum DeletableSamlProperty');
  }
}

class DeleteAccountLinkInvitationResult {
  /// Information about the account link.
  final AccountLink? accountLink;

  DeleteAccountLinkInvitationResult({
    this.accountLink,
  });

  factory DeleteAccountLinkInvitationResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteAccountLinkInvitationResult(
      accountLink: json['AccountLink'] != null
          ? AccountLink.fromJson(json['AccountLink'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLink = this.accountLink;
    return {
      if (accountLink != null) 'AccountLink': accountLink,
    };
  }
}

class DeleteClientBrandingResult {
  DeleteClientBrandingResult();

  factory DeleteClientBrandingResult.fromJson(Map<String, dynamic> _) {
    return DeleteClientBrandingResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteConnectClientAddInResult {
  DeleteConnectClientAddInResult();

  factory DeleteConnectClientAddInResult.fromJson(Map<String, dynamic> _) {
    return DeleteConnectClientAddInResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteConnectionAliasResult {
  DeleteConnectionAliasResult();

  factory DeleteConnectionAliasResult.fromJson(Map<String, dynamic> _) {
    return DeleteConnectionAliasResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIpGroupResult {
  DeleteIpGroupResult();

  factory DeleteIpGroupResult.fromJson(Map<String, dynamic> _) {
    return DeleteIpGroupResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTagsResult {
  DeleteTagsResult();

  factory DeleteTagsResult.fromJson(Map<String, dynamic> _) {
    return DeleteTagsResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkspaceBundleResult {
  DeleteWorkspaceBundleResult();

  factory DeleteWorkspaceBundleResult.fromJson(Map<String, dynamic> _) {
    return DeleteWorkspaceBundleResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkspaceImageResult {
  DeleteWorkspaceImageResult();

  factory DeleteWorkspaceImageResult.fromJson(Map<String, dynamic> _) {
    return DeleteWorkspaceImageResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeployWorkspaceApplicationsResult {
  /// The list of deployed associations and information about them.
  final WorkSpaceApplicationDeployment? deployment;

  DeployWorkspaceApplicationsResult({
    this.deployment,
  });

  factory DeployWorkspaceApplicationsResult.fromJson(
      Map<String, dynamic> json) {
    return DeployWorkspaceApplicationsResult(
      deployment: json['Deployment'] != null
          ? WorkSpaceApplicationDeployment.fromJson(
              json['Deployment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deployment = this.deployment;
    return {
      if (deployment != null) 'Deployment': deployment,
    };
  }
}

class DeregisterWorkspaceDirectoryResult {
  DeregisterWorkspaceDirectoryResult();

  factory DeregisterWorkspaceDirectoryResult.fromJson(Map<String, dynamic> _) {
    return DeregisterWorkspaceDirectoryResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAccountModificationsResult {
  /// The list of modifications to the configuration of BYOL.
  final List<AccountModification>? accountModifications;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  DescribeAccountModificationsResult({
    this.accountModifications,
    this.nextToken,
  });

  factory DescribeAccountModificationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeAccountModificationsResult(
      accountModifications: (json['AccountModifications'] as List?)
          ?.whereNotNull()
          .map((e) => AccountModification.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountModifications = this.accountModifications;
    final nextToken = this.nextToken;
    return {
      if (accountModifications != null)
        'AccountModifications': accountModifications,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeAccountResult {
  /// The type of linked account.
  final DedicatedTenancyAccountType? dedicatedTenancyAccountType;

  /// The IP address range, specified as an IPv4 CIDR block, used for the
  /// management network interface.
  ///
  /// The management network interface is connected to a secure Amazon WorkSpaces
  /// management network. It is used for interactive streaming of the WorkSpace
  /// desktop to Amazon WorkSpaces clients, and to allow Amazon WorkSpaces to
  /// manage the WorkSpace.
  final String? dedicatedTenancyManagementCidrRange;

  /// The status of BYOL (whether BYOL is enabled or disabled).
  final DedicatedTenancySupportResultEnum? dedicatedTenancySupport;

  DescribeAccountResult({
    this.dedicatedTenancyAccountType,
    this.dedicatedTenancyManagementCidrRange,
    this.dedicatedTenancySupport,
  });

  factory DescribeAccountResult.fromJson(Map<String, dynamic> json) {
    return DescribeAccountResult(
      dedicatedTenancyAccountType:
          (json['DedicatedTenancyAccountType'] as String?)
              ?.toDedicatedTenancyAccountType(),
      dedicatedTenancyManagementCidrRange:
          json['DedicatedTenancyManagementCidrRange'] as String?,
      dedicatedTenancySupport: (json['DedicatedTenancySupport'] as String?)
          ?.toDedicatedTenancySupportResultEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final dedicatedTenancyAccountType = this.dedicatedTenancyAccountType;
    final dedicatedTenancyManagementCidrRange =
        this.dedicatedTenancyManagementCidrRange;
    final dedicatedTenancySupport = this.dedicatedTenancySupport;
    return {
      if (dedicatedTenancyAccountType != null)
        'DedicatedTenancyAccountType': dedicatedTenancyAccountType.toValue(),
      if (dedicatedTenancyManagementCidrRange != null)
        'DedicatedTenancyManagementCidrRange':
            dedicatedTenancyManagementCidrRange,
      if (dedicatedTenancySupport != null)
        'DedicatedTenancySupport': dedicatedTenancySupport.toValue(),
    };
  }
}

class DescribeApplicationAssociationsResult {
  /// List of associations and information about them.
  final List<ApplicationResourceAssociation>? associations;

  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  final String? nextToken;

  DescribeApplicationAssociationsResult({
    this.associations,
    this.nextToken,
  });

  factory DescribeApplicationAssociationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeApplicationAssociationsResult(
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationResourceAssociation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final nextToken = this.nextToken;
    return {
      if (associations != null) 'Associations': associations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeApplicationsResult {
  /// List of information about the specified applications.
  final List<WorkSpaceApplication>? applications;

  /// If you received a <code>NextToken</code> from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  final String? nextToken;

  DescribeApplicationsResult({
    this.applications,
    this.nextToken,
  });

  factory DescribeApplicationsResult.fromJson(Map<String, dynamic> json) {
    return DescribeApplicationsResult(
      applications: (json['Applications'] as List?)
          ?.whereNotNull()
          .map((e) => WorkSpaceApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      if (applications != null) 'Applications': applications,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeBundleAssociationsResult {
  /// List of information about the specified associations.
  final List<BundleResourceAssociation>? associations;

  DescribeBundleAssociationsResult({
    this.associations,
  });

  factory DescribeBundleAssociationsResult.fromJson(Map<String, dynamic> json) {
    return DescribeBundleAssociationsResult(
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BundleResourceAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    return {
      if (associations != null) 'Associations': associations,
    };
  }
}

class DescribeClientBrandingResult {
  /// The branding information for Android devices.
  final DefaultClientBrandingAttributes? deviceTypeAndroid;

  /// The branding information for iOS devices.
  final IosClientBrandingAttributes? deviceTypeIos;

  /// The branding information for Linux devices.
  final DefaultClientBrandingAttributes? deviceTypeLinux;

  /// The branding information for macOS devices.
  final DefaultClientBrandingAttributes? deviceTypeOsx;

  /// The branding information for Web access.
  final DefaultClientBrandingAttributes? deviceTypeWeb;

  /// The branding information for Windows devices.
  final DefaultClientBrandingAttributes? deviceTypeWindows;

  DescribeClientBrandingResult({
    this.deviceTypeAndroid,
    this.deviceTypeIos,
    this.deviceTypeLinux,
    this.deviceTypeOsx,
    this.deviceTypeWeb,
    this.deviceTypeWindows,
  });

  factory DescribeClientBrandingResult.fromJson(Map<String, dynamic> json) {
    return DescribeClientBrandingResult(
      deviceTypeAndroid: json['DeviceTypeAndroid'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeAndroid'] as Map<String, dynamic>)
          : null,
      deviceTypeIos: json['DeviceTypeIos'] != null
          ? IosClientBrandingAttributes.fromJson(
              json['DeviceTypeIos'] as Map<String, dynamic>)
          : null,
      deviceTypeLinux: json['DeviceTypeLinux'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeLinux'] as Map<String, dynamic>)
          : null,
      deviceTypeOsx: json['DeviceTypeOsx'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeOsx'] as Map<String, dynamic>)
          : null,
      deviceTypeWeb: json['DeviceTypeWeb'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeWeb'] as Map<String, dynamic>)
          : null,
      deviceTypeWindows: json['DeviceTypeWindows'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeWindows'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceTypeAndroid = this.deviceTypeAndroid;
    final deviceTypeIos = this.deviceTypeIos;
    final deviceTypeLinux = this.deviceTypeLinux;
    final deviceTypeOsx = this.deviceTypeOsx;
    final deviceTypeWeb = this.deviceTypeWeb;
    final deviceTypeWindows = this.deviceTypeWindows;
    return {
      if (deviceTypeAndroid != null) 'DeviceTypeAndroid': deviceTypeAndroid,
      if (deviceTypeIos != null) 'DeviceTypeIos': deviceTypeIos,
      if (deviceTypeLinux != null) 'DeviceTypeLinux': deviceTypeLinux,
      if (deviceTypeOsx != null) 'DeviceTypeOsx': deviceTypeOsx,
      if (deviceTypeWeb != null) 'DeviceTypeWeb': deviceTypeWeb,
      if (deviceTypeWindows != null) 'DeviceTypeWindows': deviceTypeWindows,
    };
  }
}

class DescribeClientPropertiesResult {
  /// Information about the specified Amazon WorkSpaces clients.
  final List<ClientPropertiesResult>? clientPropertiesList;

  DescribeClientPropertiesResult({
    this.clientPropertiesList,
  });

  factory DescribeClientPropertiesResult.fromJson(Map<String, dynamic> json) {
    return DescribeClientPropertiesResult(
      clientPropertiesList: (json['ClientPropertiesList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ClientPropertiesResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientPropertiesList = this.clientPropertiesList;
    return {
      if (clientPropertiesList != null)
        'ClientPropertiesList': clientPropertiesList,
    };
  }
}

class DescribeConnectClientAddInsResult {
  /// Information about client add-ins.
  final List<ConnectClientAddIn>? addIns;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  DescribeConnectClientAddInsResult({
    this.addIns,
    this.nextToken,
  });

  factory DescribeConnectClientAddInsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeConnectClientAddInsResult(
      addIns: (json['AddIns'] as List?)
          ?.whereNotNull()
          .map((e) => ConnectClientAddIn.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addIns = this.addIns;
    final nextToken = this.nextToken;
    return {
      if (addIns != null) 'AddIns': addIns,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeConnectionAliasPermissionsResult {
  /// The identifier of the connection alias.
  final String? aliasId;

  /// The permissions associated with a connection alias.
  final List<ConnectionAliasPermission>? connectionAliasPermissions;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  DescribeConnectionAliasPermissionsResult({
    this.aliasId,
    this.connectionAliasPermissions,
    this.nextToken,
  });

  factory DescribeConnectionAliasPermissionsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeConnectionAliasPermissionsResult(
      aliasId: json['AliasId'] as String?,
      connectionAliasPermissions: (json['ConnectionAliasPermissions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConnectionAliasPermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasId = this.aliasId;
    final connectionAliasPermissions = this.connectionAliasPermissions;
    final nextToken = this.nextToken;
    return {
      if (aliasId != null) 'AliasId': aliasId,
      if (connectionAliasPermissions != null)
        'ConnectionAliasPermissions': connectionAliasPermissions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeConnectionAliasesResult {
  /// Information about the specified connection aliases.
  final List<ConnectionAlias>? connectionAliases;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  DescribeConnectionAliasesResult({
    this.connectionAliases,
    this.nextToken,
  });

  factory DescribeConnectionAliasesResult.fromJson(Map<String, dynamic> json) {
    return DescribeConnectionAliasesResult(
      connectionAliases: (json['ConnectionAliases'] as List?)
          ?.whereNotNull()
          .map((e) => ConnectionAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionAliases = this.connectionAliases;
    final nextToken = this.nextToken;
    return {
      if (connectionAliases != null) 'ConnectionAliases': connectionAliases,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeImageAssociationsResult {
  /// List of information about the specified associations.
  final List<ImageResourceAssociation>? associations;

  DescribeImageAssociationsResult({
    this.associations,
  });

  factory DescribeImageAssociationsResult.fromJson(Map<String, dynamic> json) {
    return DescribeImageAssociationsResult(
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ImageResourceAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    return {
      if (associations != null) 'Associations': associations,
    };
  }
}

class DescribeIpGroupsResult {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// Information about the IP access control groups.
  final List<WorkspacesIpGroup>? result;

  DescribeIpGroupsResult({
    this.nextToken,
    this.result,
  });

  factory DescribeIpGroupsResult.fromJson(Map<String, dynamic> json) {
    return DescribeIpGroupsResult(
      nextToken: json['NextToken'] as String?,
      result: (json['Result'] as List?)
          ?.whereNotNull()
          .map((e) => WorkspacesIpGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final result = this.result;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (result != null) 'Result': result,
    };
  }
}

class DescribeTagsResult {
  /// The tags.
  final List<Tag>? tagList;

  DescribeTagsResult({
    this.tagList,
  });

  factory DescribeTagsResult.fromJson(Map<String, dynamic> json) {
    return DescribeTagsResult(
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

class DescribeWorkspaceAssociationsResult {
  /// List of information about the specified associations.
  final List<WorkspaceResourceAssociation>? associations;

  DescribeWorkspaceAssociationsResult({
    this.associations,
  });

  factory DescribeWorkspaceAssociationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeWorkspaceAssociationsResult(
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WorkspaceResourceAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    return {
      if (associations != null) 'Associations': associations,
    };
  }
}

class DescribeWorkspaceBundlesResult {
  /// Information about the bundles.
  final List<WorkspaceBundle>? bundles;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return. This token is valid for one day
  /// and must be used within that time frame.
  final String? nextToken;

  DescribeWorkspaceBundlesResult({
    this.bundles,
    this.nextToken,
  });

  factory DescribeWorkspaceBundlesResult.fromJson(Map<String, dynamic> json) {
    return DescribeWorkspaceBundlesResult(
      bundles: (json['Bundles'] as List?)
          ?.whereNotNull()
          .map((e) => WorkspaceBundle.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bundles = this.bundles;
    final nextToken = this.nextToken;
    return {
      if (bundles != null) 'Bundles': bundles,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeWorkspaceDirectoriesResult {
  /// Information about the directories.
  final List<WorkspaceDirectory>? directories;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  DescribeWorkspaceDirectoriesResult({
    this.directories,
    this.nextToken,
  });

  factory DescribeWorkspaceDirectoriesResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeWorkspaceDirectoriesResult(
      directories: (json['Directories'] as List?)
          ?.whereNotNull()
          .map((e) => WorkspaceDirectory.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directories = this.directories;
    final nextToken = this.nextToken;
    return {
      if (directories != null) 'Directories': directories,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeWorkspaceImagePermissionsResult {
  /// The identifier of the image.
  final String? imageId;

  /// The identifiers of the Amazon Web Services accounts that the image has been
  /// shared with.
  final List<ImagePermission>? imagePermissions;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  DescribeWorkspaceImagePermissionsResult({
    this.imageId,
    this.imagePermissions,
    this.nextToken,
  });

  factory DescribeWorkspaceImagePermissionsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeWorkspaceImagePermissionsResult(
      imageId: json['ImageId'] as String?,
      imagePermissions: (json['ImagePermissions'] as List?)
          ?.whereNotNull()
          .map((e) => ImagePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    final imagePermissions = this.imagePermissions;
    final nextToken = this.nextToken;
    return {
      if (imageId != null) 'ImageId': imageId,
      if (imagePermissions != null) 'ImagePermissions': imagePermissions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeWorkspaceImagesResult {
  /// Information about the images.
  final List<WorkspaceImage>? images;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  DescribeWorkspaceImagesResult({
    this.images,
    this.nextToken,
  });

  factory DescribeWorkspaceImagesResult.fromJson(Map<String, dynamic> json) {
    return DescribeWorkspaceImagesResult(
      images: (json['Images'] as List?)
          ?.whereNotNull()
          .map((e) => WorkspaceImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final images = this.images;
    final nextToken = this.nextToken;
    return {
      if (images != null) 'Images': images,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeWorkspaceSnapshotsResult {
  /// Information about the snapshots that can be used to rebuild a WorkSpace.
  /// These snapshots include the user volume.
  final List<Snapshot>? rebuildSnapshots;

  /// Information about the snapshots that can be used to restore a WorkSpace.
  /// These snapshots include both the root volume and the user volume.
  final List<Snapshot>? restoreSnapshots;

  DescribeWorkspaceSnapshotsResult({
    this.rebuildSnapshots,
    this.restoreSnapshots,
  });

  factory DescribeWorkspaceSnapshotsResult.fromJson(Map<String, dynamic> json) {
    return DescribeWorkspaceSnapshotsResult(
      rebuildSnapshots: (json['RebuildSnapshots'] as List?)
          ?.whereNotNull()
          .map((e) => Snapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      restoreSnapshots: (json['RestoreSnapshots'] as List?)
          ?.whereNotNull()
          .map((e) => Snapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rebuildSnapshots = this.rebuildSnapshots;
    final restoreSnapshots = this.restoreSnapshots;
    return {
      if (rebuildSnapshots != null) 'RebuildSnapshots': rebuildSnapshots,
      if (restoreSnapshots != null) 'RestoreSnapshots': restoreSnapshots,
    };
  }
}

class DescribeWorkspacesConnectionStatusResult {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// Information about the connection status of the WorkSpace.
  final List<WorkspaceConnectionStatus>? workspacesConnectionStatus;

  DescribeWorkspacesConnectionStatusResult({
    this.nextToken,
    this.workspacesConnectionStatus,
  });

  factory DescribeWorkspacesConnectionStatusResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeWorkspacesConnectionStatusResult(
      nextToken: json['NextToken'] as String?,
      workspacesConnectionStatus: (json['WorkspacesConnectionStatus'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WorkspaceConnectionStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workspacesConnectionStatus = this.workspacesConnectionStatus;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workspacesConnectionStatus != null)
        'WorkspacesConnectionStatus': workspacesConnectionStatus,
    };
  }
}

class DescribeWorkspacesResult {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// Information about the WorkSpaces.
  ///
  /// Because <a>CreateWorkspaces</a> is an asynchronous operation, some of the
  /// returned information could be incomplete.
  final List<Workspace>? workspaces;

  DescribeWorkspacesResult({
    this.nextToken,
    this.workspaces,
  });

  factory DescribeWorkspacesResult.fromJson(Map<String, dynamic> json) {
    return DescribeWorkspacesResult(
      nextToken: json['NextToken'] as String?,
      workspaces: (json['Workspaces'] as List?)
          ?.whereNotNull()
          .map((e) => Workspace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workspaces = this.workspaces;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workspaces != null) 'Workspaces': workspaces,
    };
  }
}

class DisassociateConnectionAliasResult {
  DisassociateConnectionAliasResult();

  factory DisassociateConnectionAliasResult.fromJson(Map<String, dynamic> _) {
    return DisassociateConnectionAliasResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateIpGroupsResult {
  DisassociateIpGroupsResult();

  factory DisassociateIpGroupsResult.fromJson(Map<String, dynamic> _) {
    return DisassociateIpGroupsResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateWorkspaceApplicationResult {
  /// Information about the targeted association.
  final WorkspaceResourceAssociation? association;

  DisassociateWorkspaceApplicationResult({
    this.association,
  });

  factory DisassociateWorkspaceApplicationResult.fromJson(
      Map<String, dynamic> json) {
    return DisassociateWorkspaceApplicationResult(
      association: json['Association'] != null
          ? WorkspaceResourceAssociation.fromJson(
              json['Association'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    return {
      if (association != null) 'Association': association,
    };
  }
}

/// Describes in-depth details about the error. These details include the
/// possible causes of the error and troubleshooting information.
class ErrorDetails {
  /// Indicates the error code returned.
  final WorkspaceImageErrorDetailCode? errorCode;

  /// The text of the error message related the error code.
  final String? errorMessage;

  ErrorDetails({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      errorCode:
          (json['ErrorCode'] as String?)?.toWorkspaceImageErrorDetailCode(),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// Describes the standby WorkSpace that could not be created.
class FailedCreateStandbyWorkspacesRequest {
  /// The error code that is returned if the standby WorkSpace could not be
  /// created.
  final String? errorCode;

  /// The text of the error message that is returned if the standby WorkSpace
  /// could not be created.
  final String? errorMessage;

  /// Information about the standby WorkSpace that could not be created.
  final StandbyWorkspace? standbyWorkspaceRequest;

  FailedCreateStandbyWorkspacesRequest({
    this.errorCode,
    this.errorMessage,
    this.standbyWorkspaceRequest,
  });

  factory FailedCreateStandbyWorkspacesRequest.fromJson(
      Map<String, dynamic> json) {
    return FailedCreateStandbyWorkspacesRequest(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      standbyWorkspaceRequest: json['StandbyWorkspaceRequest'] != null
          ? StandbyWorkspace.fromJson(
              json['StandbyWorkspaceRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final standbyWorkspaceRequest = this.standbyWorkspaceRequest;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (standbyWorkspaceRequest != null)
        'StandbyWorkspaceRequest': standbyWorkspaceRequest,
    };
  }
}

/// Describes a WorkSpace that cannot be created.
class FailedCreateWorkspaceRequest {
  /// The error code that is returned if the WorkSpace cannot be created.
  final String? errorCode;

  /// The text of the error message that is returned if the WorkSpace cannot be
  /// created.
  final String? errorMessage;

  /// Information about the WorkSpace.
  final WorkspaceRequest? workspaceRequest;

  FailedCreateWorkspaceRequest({
    this.errorCode,
    this.errorMessage,
    this.workspaceRequest,
  });

  factory FailedCreateWorkspaceRequest.fromJson(Map<String, dynamic> json) {
    return FailedCreateWorkspaceRequest(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      workspaceRequest: json['WorkspaceRequest'] != null
          ? WorkspaceRequest.fromJson(
              json['WorkspaceRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final workspaceRequest = this.workspaceRequest;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (workspaceRequest != null) 'WorkspaceRequest': workspaceRequest,
    };
  }
}

/// Describes a WorkSpace that could not be rebooted. (<a>RebootWorkspaces</a>),
/// rebuilt (<a>RebuildWorkspaces</a>), restored (<a>RestoreWorkspace</a>),
/// terminated (<a>TerminateWorkspaces</a>), started (<a>StartWorkspaces</a>),
/// or stopped (<a>StopWorkspaces</a>).
class FailedWorkspaceChangeRequest {
  /// The error code that is returned if the WorkSpace cannot be rebooted.
  final String? errorCode;

  /// The text of the error message that is returned if the WorkSpace cannot be
  /// rebooted.
  final String? errorMessage;

  /// The identifier of the WorkSpace.
  final String? workspaceId;

  FailedWorkspaceChangeRequest({
    this.errorCode,
    this.errorMessage,
    this.workspaceId,
  });

  factory FailedWorkspaceChangeRequest.fromJson(Map<String, dynamic> json) {
    return FailedWorkspaceChangeRequest(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      workspaceId: json['WorkspaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final workspaceId = this.workspaceId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (workspaceId != null) 'WorkspaceId': workspaceId,
    };
  }
}

class GetAccountLinkResult {
  /// The account link of the account link to retrieve.
  final AccountLink? accountLink;

  GetAccountLinkResult({
    this.accountLink,
  });

  factory GetAccountLinkResult.fromJson(Map<String, dynamic> json) {
    return GetAccountLinkResult(
      accountLink: json['AccountLink'] != null
          ? AccountLink.fromJson(json['AccountLink'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLink = this.accountLink;
    return {
      if (accountLink != null) 'AccountLink': accountLink,
    };
  }
}

enum ImageAssociatedResourceType {
  application,
}

extension ImageAssociatedResourceTypeValueExtension
    on ImageAssociatedResourceType {
  String toValue() {
    switch (this) {
      case ImageAssociatedResourceType.application:
        return 'APPLICATION';
    }
  }
}

extension ImageAssociatedResourceTypeFromString on String {
  ImageAssociatedResourceType toImageAssociatedResourceType() {
    switch (this) {
      case 'APPLICATION':
        return ImageAssociatedResourceType.application;
    }
    throw Exception('$this is not known in enum ImageAssociatedResourceType');
  }
}

/// Describes the Amazon Web Services accounts that have been granted permission
/// to use a shared image. For more information about sharing images, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/share-custom-image.html">
/// Share or Unshare a Custom WorkSpaces Image</a>.
class ImagePermission {
  /// The identifier of the Amazon Web Services account that an image has been
  /// shared with.
  final String? sharedAccountId;

  ImagePermission({
    this.sharedAccountId,
  });

  factory ImagePermission.fromJson(Map<String, dynamic> json) {
    return ImagePermission(
      sharedAccountId: json['SharedAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sharedAccountId = this.sharedAccountId;
    return {
      if (sharedAccountId != null) 'SharedAccountId': sharedAccountId,
    };
  }
}

/// Describes the association between an application and an image resource.
class ImageResourceAssociation {
  /// The identifier of the associated resource.
  final String? associatedResourceId;

  /// The resource type of the associated resources.
  final ImageAssociatedResourceType? associatedResourceType;

  /// The time the association is created.
  final DateTime? created;

  /// The identifier of the image.
  final String? imageId;

  /// The time the association status was last updated.
  final DateTime? lastUpdatedTime;

  /// The status of the image resource association.
  final AssociationState? state;

  /// The reason the association deployment failed.
  final AssociationStateReason? stateReason;

  ImageResourceAssociation({
    this.associatedResourceId,
    this.associatedResourceType,
    this.created,
    this.imageId,
    this.lastUpdatedTime,
    this.state,
    this.stateReason,
  });

  factory ImageResourceAssociation.fromJson(Map<String, dynamic> json) {
    return ImageResourceAssociation(
      associatedResourceId: json['AssociatedResourceId'] as String?,
      associatedResourceType: (json['AssociatedResourceType'] as String?)
          ?.toImageAssociatedResourceType(),
      created: timeStampFromJson(json['Created']),
      imageId: json['ImageId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      state: (json['State'] as String?)?.toAssociationState(),
      stateReason: json['StateReason'] != null
          ? AssociationStateReason.fromJson(
              json['StateReason'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedResourceId = this.associatedResourceId;
    final associatedResourceType = this.associatedResourceType;
    final created = this.created;
    final imageId = this.imageId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (associatedResourceId != null)
        'AssociatedResourceId': associatedResourceId,
      if (associatedResourceType != null)
        'AssociatedResourceType': associatedResourceType.toValue(),
      if (created != null) 'Created': unixTimestampToJson(created),
      if (imageId != null) 'ImageId': imageId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

enum ImageType {
  owned,
  shared,
}

extension ImageTypeValueExtension on ImageType {
  String toValue() {
    switch (this) {
      case ImageType.owned:
        return 'OWNED';
      case ImageType.shared:
        return 'SHARED';
    }
  }
}

extension ImageTypeFromString on String {
  ImageType toImageType() {
    switch (this) {
      case 'OWNED':
        return ImageType.owned;
      case 'SHARED':
        return ImageType.shared;
    }
    throw Exception('$this is not known in enum ImageType');
  }
}

class ImportClientBrandingResult {
  /// The branding information configured for Android devices.
  final DefaultClientBrandingAttributes? deviceTypeAndroid;

  /// The branding information configured for iOS devices.
  final IosClientBrandingAttributes? deviceTypeIos;

  /// The branding information configured for Linux devices.
  final DefaultClientBrandingAttributes? deviceTypeLinux;

  /// The branding information configured for macOS devices.
  final DefaultClientBrandingAttributes? deviceTypeOsx;

  /// The branding information configured for web access.
  final DefaultClientBrandingAttributes? deviceTypeWeb;

  /// The branding information configured for Windows devices.
  final DefaultClientBrandingAttributes? deviceTypeWindows;

  ImportClientBrandingResult({
    this.deviceTypeAndroid,
    this.deviceTypeIos,
    this.deviceTypeLinux,
    this.deviceTypeOsx,
    this.deviceTypeWeb,
    this.deviceTypeWindows,
  });

  factory ImportClientBrandingResult.fromJson(Map<String, dynamic> json) {
    return ImportClientBrandingResult(
      deviceTypeAndroid: json['DeviceTypeAndroid'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeAndroid'] as Map<String, dynamic>)
          : null,
      deviceTypeIos: json['DeviceTypeIos'] != null
          ? IosClientBrandingAttributes.fromJson(
              json['DeviceTypeIos'] as Map<String, dynamic>)
          : null,
      deviceTypeLinux: json['DeviceTypeLinux'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeLinux'] as Map<String, dynamic>)
          : null,
      deviceTypeOsx: json['DeviceTypeOsx'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeOsx'] as Map<String, dynamic>)
          : null,
      deviceTypeWeb: json['DeviceTypeWeb'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeWeb'] as Map<String, dynamic>)
          : null,
      deviceTypeWindows: json['DeviceTypeWindows'] != null
          ? DefaultClientBrandingAttributes.fromJson(
              json['DeviceTypeWindows'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceTypeAndroid = this.deviceTypeAndroid;
    final deviceTypeIos = this.deviceTypeIos;
    final deviceTypeLinux = this.deviceTypeLinux;
    final deviceTypeOsx = this.deviceTypeOsx;
    final deviceTypeWeb = this.deviceTypeWeb;
    final deviceTypeWindows = this.deviceTypeWindows;
    return {
      if (deviceTypeAndroid != null) 'DeviceTypeAndroid': deviceTypeAndroid,
      if (deviceTypeIos != null) 'DeviceTypeIos': deviceTypeIos,
      if (deviceTypeLinux != null) 'DeviceTypeLinux': deviceTypeLinux,
      if (deviceTypeOsx != null) 'DeviceTypeOsx': deviceTypeOsx,
      if (deviceTypeWeb != null) 'DeviceTypeWeb': deviceTypeWeb,
      if (deviceTypeWindows != null) 'DeviceTypeWindows': deviceTypeWindows,
    };
  }
}

class ImportWorkspaceImageResult {
  /// The identifier of the WorkSpace image.
  final String? imageId;

  ImportWorkspaceImageResult({
    this.imageId,
  });

  factory ImportWorkspaceImageResult.fromJson(Map<String, dynamic> json) {
    return ImportWorkspaceImageResult(
      imageId: json['ImageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    return {
      if (imageId != null) 'ImageId': imageId,
    };
  }
}

/// The client branding attributes for iOS device types. These attributes are
/// displayed on the iOS client login screen only.
/// <important>
/// Client branding attributes are public facing. Ensure you do not include
/// sensitive information.
/// </important>
class IosClientBrandingAttributes {
  /// The forgotten password link. This is the web address that users can go to if
  /// they forget the password for their WorkSpace.
  final String? forgotPasswordLink;

  /// The login message. Specified as a key value pair, in which the key is a
  /// locale and the value is the localized message for that locale. The only key
  /// supported is <code>en_US</code>. The HTML tags supported include the
  /// following: <code>a, b, blockquote, br, cite, code, dd, dl, dt, div, em, i,
  /// li, ol, p, pre, q, small, span, strike, strong, sub, sup, u, ul</code>.
  final Map<String, String>? loginMessage;

  /// The @2x version of the logo. This is the higher resolution display that
  /// offers a scale factor of 2.0 (or @2x). The only image format accepted is a
  /// binary data object that is converted from a <code>.png</code> file.
  /// <note>
  /// For more information about iOS image size and resolution, see <a
  /// href="https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/">Image
  /// Size and Resolution </a> in the <i>Apple Human Interface Guidelines</i>.
  /// </note>
  final String? logo2xUrl;

  /// The @3x version of the logo. This is the higher resolution display that
  /// offers a scale factor of 3.0 (or @3x).The only image format accepted is a
  /// binary data object that is converted from a <code>.png</code> file.
  /// <note>
  /// For more information about iOS image size and resolution, see <a
  /// href="https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/">Image
  /// Size and Resolution </a> in the <i>Apple Human Interface Guidelines</i>.
  /// </note>
  final String? logo3xUrl;

  /// The logo. This is the standard-resolution display that has a 1:1 pixel
  /// density (or @1x), where one pixel is equal to one point. The only image
  /// format accepted is a binary data object that is converted from a
  /// <code>.png</code> file.
  final String? logoUrl;

  /// The support email. The company's customer support email address.
  /// <note>
  /// <ul>
  /// <li>
  /// In each platform type, the <code>SupportEmail</code> and
  /// <code>SupportLink</code> parameters are mutually exclusive. You can specify
  /// one parameter for each platform type, but not both.
  /// </li>
  /// <li>
  /// The default email is <code>workspaces-feedback@amazon.com</code>.
  /// </li>
  /// </ul> </note>
  final String? supportEmail;

  /// The support link. The link for the company's customer support page for their
  /// WorkSpace.
  /// <note>
  /// <ul>
  /// <li>
  /// In each platform type, the <code>SupportEmail</code> and
  /// <code>SupportLink</code> parameters are mutually exclusive. You can specify
  /// one parameter for each platform type, but not both.
  /// </li>
  /// <li>
  /// The default support link is <code>workspaces-feedback@amazon.com</code>.
  /// </li>
  /// </ul> </note>
  final String? supportLink;

  IosClientBrandingAttributes({
    this.forgotPasswordLink,
    this.loginMessage,
    this.logo2xUrl,
    this.logo3xUrl,
    this.logoUrl,
    this.supportEmail,
    this.supportLink,
  });

  factory IosClientBrandingAttributes.fromJson(Map<String, dynamic> json) {
    return IosClientBrandingAttributes(
      forgotPasswordLink: json['ForgotPasswordLink'] as String?,
      loginMessage: (json['LoginMessage'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      logo2xUrl: json['Logo2xUrl'] as String?,
      logo3xUrl: json['Logo3xUrl'] as String?,
      logoUrl: json['LogoUrl'] as String?,
      supportEmail: json['SupportEmail'] as String?,
      supportLink: json['SupportLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final forgotPasswordLink = this.forgotPasswordLink;
    final loginMessage = this.loginMessage;
    final logo2xUrl = this.logo2xUrl;
    final logo3xUrl = this.logo3xUrl;
    final logoUrl = this.logoUrl;
    final supportEmail = this.supportEmail;
    final supportLink = this.supportLink;
    return {
      if (forgotPasswordLink != null) 'ForgotPasswordLink': forgotPasswordLink,
      if (loginMessage != null) 'LoginMessage': loginMessage,
      if (logo2xUrl != null) 'Logo2xUrl': logo2xUrl,
      if (logo3xUrl != null) 'Logo3xUrl': logo3xUrl,
      if (logoUrl != null) 'LogoUrl': logoUrl,
      if (supportEmail != null) 'SupportEmail': supportEmail,
      if (supportLink != null) 'SupportLink': supportLink,
    };
  }
}

/// The client branding attributes to import for iOS device types. These
/// attributes are displayed on the iOS client login screen.
/// <important>
/// Client branding attributes are public facing. Ensure you do not include
/// sensitive information.
/// </important>
class IosImportClientBrandingAttributes {
  /// The forgotten password link. This is the web address that users can go to if
  /// they forget the password for their WorkSpace.
  final String? forgotPasswordLink;

  /// The login message. Specified as a key value pair, in which the key is a
  /// locale and the value is the localized message for that locale. The only key
  /// supported is <code>en_US</code>. The HTML tags supported include the
  /// following: <code>a, b, blockquote, br, cite, code, dd, dl, dt, div, em, i,
  /// li, ol, p, pre, q, small, span, strike, strong, sub, sup, u, ul</code>.
  final Map<String, String>? loginMessage;

  /// The logo. This is the standard-resolution display that has a 1:1 pixel
  /// density (or @1x), where one pixel is equal to one point. The only image
  /// format accepted is a binary data object that is converted from a
  /// <code>.png</code> file.
  final Uint8List? logo;

  /// The @2x version of the logo. This is the higher resolution display that
  /// offers a scale factor of 2.0 (or @2x). The only image format accepted is a
  /// binary data object that is converted from a <code>.png</code> file.
  /// <note>
  /// For more information about iOS image size and resolution, see <a
  /// href="https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/">Image
  /// Size and Resolution </a> in the <i>Apple Human Interface Guidelines</i>.
  /// </note>
  final Uint8List? logo2x;

  /// The @3x version of the logo. This is the higher resolution display that
  /// offers a scale factor of 3.0 (or @3x). The only image format accepted is a
  /// binary data object that is converted from a <code>.png</code> file.
  /// <note>
  /// For more information about iOS image size and resolution, see <a
  /// href="https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/">Image
  /// Size and Resolution </a> in the <i>Apple Human Interface Guidelines</i>.
  /// </note>
  final Uint8List? logo3x;

  /// The support email. The company's customer support email address.
  /// <note>
  /// <ul>
  /// <li>
  /// In each platform type, the <code>SupportEmail</code> and
  /// <code>SupportLink</code> parameters are mutually exclusive. You can specify
  /// one parameter for each platform type, but not both.
  /// </li>
  /// <li>
  /// The default email is <code>workspaces-feedback@amazon.com</code>.
  /// </li>
  /// </ul> </note>
  final String? supportEmail;

  /// The support link. The link for the company's customer support page for their
  /// WorkSpace.
  /// <note>
  /// <ul>
  /// <li>
  /// In each platform type, the <code>SupportEmail</code> and
  /// <code>SupportLink</code> parameters are mutually exclusive. You can specify
  /// one parameter for each platform type, but not both.
  /// </li>
  /// <li>
  /// The default support link is <code>workspaces-feedback@amazon.com</code>.
  /// </li>
  /// </ul> </note>
  final String? supportLink;

  IosImportClientBrandingAttributes({
    this.forgotPasswordLink,
    this.loginMessage,
    this.logo,
    this.logo2x,
    this.logo3x,
    this.supportEmail,
    this.supportLink,
  });

  Map<String, dynamic> toJson() {
    final forgotPasswordLink = this.forgotPasswordLink;
    final loginMessage = this.loginMessage;
    final logo = this.logo;
    final logo2x = this.logo2x;
    final logo3x = this.logo3x;
    final supportEmail = this.supportEmail;
    final supportLink = this.supportLink;
    return {
      if (forgotPasswordLink != null) 'ForgotPasswordLink': forgotPasswordLink,
      if (loginMessage != null) 'LoginMessage': loginMessage,
      if (logo != null) 'Logo': base64Encode(logo),
      if (logo2x != null) 'Logo2x': base64Encode(logo2x),
      if (logo3x != null) 'Logo3x': base64Encode(logo3x),
      if (supportEmail != null) 'SupportEmail': supportEmail,
      if (supportLink != null) 'SupportLink': supportLink,
    };
  }
}

/// Describes a rule for an IP access control group.
class IpRuleItem {
  /// The IP address range, in CIDR notation.
  final String? ipRule;

  /// The description.
  final String? ruleDesc;

  IpRuleItem({
    this.ipRule,
    this.ruleDesc,
  });

  factory IpRuleItem.fromJson(Map<String, dynamic> json) {
    return IpRuleItem(
      ipRule: json['ipRule'] as String?,
      ruleDesc: json['ruleDesc'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipRule = this.ipRule;
    final ruleDesc = this.ruleDesc;
    return {
      if (ipRule != null) 'ipRule': ipRule,
      if (ruleDesc != null) 'ruleDesc': ruleDesc,
    };
  }
}

class ListAccountLinksResult {
  /// Information about the account links.
  final List<AccountLink>? accountLinks;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListAccountLinksResult({
    this.accountLinks,
    this.nextToken,
  });

  factory ListAccountLinksResult.fromJson(Map<String, dynamic> json) {
    return ListAccountLinksResult(
      accountLinks: (json['AccountLinks'] as List?)
          ?.whereNotNull()
          .map((e) => AccountLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLinks = this.accountLinks;
    final nextToken = this.nextToken;
    return {
      if (accountLinks != null) 'AccountLinks': accountLinks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAvailableManagementCidrRangesResult {
  /// The list of available IP address ranges, specified as IPv4 CIDR blocks.
  final List<String>? managementCidrRanges;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListAvailableManagementCidrRangesResult({
    this.managementCidrRanges,
    this.nextToken,
  });

  factory ListAvailableManagementCidrRangesResult.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableManagementCidrRangesResult(
      managementCidrRanges: (json['ManagementCidrRanges'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final managementCidrRanges = this.managementCidrRanges;
    final nextToken = this.nextToken;
    return {
      if (managementCidrRanges != null)
        'ManagementCidrRanges': managementCidrRanges,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum LogUploadEnum {
  enabled,
  disabled,
}

extension LogUploadEnumValueExtension on LogUploadEnum {
  String toValue() {
    switch (this) {
      case LogUploadEnum.enabled:
        return 'ENABLED';
      case LogUploadEnum.disabled:
        return 'DISABLED';
    }
  }
}

extension LogUploadEnumFromString on String {
  LogUploadEnum toLogUploadEnum() {
    switch (this) {
      case 'ENABLED':
        return LogUploadEnum.enabled;
      case 'DISABLED':
        return LogUploadEnum.disabled;
    }
    throw Exception('$this is not known in enum LogUploadEnum');
  }
}

class MigrateWorkspaceResult {
  /// The original identifier of the WorkSpace that is being migrated.
  final String? sourceWorkspaceId;

  /// The new identifier of the WorkSpace that is being migrated. If the migration
  /// does not succeed, the target WorkSpace ID will not be used, and the
  /// WorkSpace will still have the original WorkSpace ID.
  final String? targetWorkspaceId;

  MigrateWorkspaceResult({
    this.sourceWorkspaceId,
    this.targetWorkspaceId,
  });

  factory MigrateWorkspaceResult.fromJson(Map<String, dynamic> json) {
    return MigrateWorkspaceResult(
      sourceWorkspaceId: json['SourceWorkspaceId'] as String?,
      targetWorkspaceId: json['TargetWorkspaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceWorkspaceId = this.sourceWorkspaceId;
    final targetWorkspaceId = this.targetWorkspaceId;
    return {
      if (sourceWorkspaceId != null) 'SourceWorkspaceId': sourceWorkspaceId,
      if (targetWorkspaceId != null) 'TargetWorkspaceId': targetWorkspaceId,
    };
  }
}

enum ModificationResourceEnum {
  rootVolume,
  userVolume,
  computeType,
}

extension ModificationResourceEnumValueExtension on ModificationResourceEnum {
  String toValue() {
    switch (this) {
      case ModificationResourceEnum.rootVolume:
        return 'ROOT_VOLUME';
      case ModificationResourceEnum.userVolume:
        return 'USER_VOLUME';
      case ModificationResourceEnum.computeType:
        return 'COMPUTE_TYPE';
    }
  }
}

extension ModificationResourceEnumFromString on String {
  ModificationResourceEnum toModificationResourceEnum() {
    switch (this) {
      case 'ROOT_VOLUME':
        return ModificationResourceEnum.rootVolume;
      case 'USER_VOLUME':
        return ModificationResourceEnum.userVolume;
      case 'COMPUTE_TYPE':
        return ModificationResourceEnum.computeType;
    }
    throw Exception('$this is not known in enum ModificationResourceEnum');
  }
}

/// Describes a WorkSpace modification.
class ModificationState {
  /// The resource.
  final ModificationResourceEnum? resource;

  /// The modification state.
  final ModificationStateEnum? state;

  ModificationState({
    this.resource,
    this.state,
  });

  factory ModificationState.fromJson(Map<String, dynamic> json) {
    return ModificationState(
      resource: (json['Resource'] as String?)?.toModificationResourceEnum(),
      state: (json['State'] as String?)?.toModificationStateEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final state = this.state;
    return {
      if (resource != null) 'Resource': resource.toValue(),
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum ModificationStateEnum {
  updateInitiated,
  updateInProgress,
}

extension ModificationStateEnumValueExtension on ModificationStateEnum {
  String toValue() {
    switch (this) {
      case ModificationStateEnum.updateInitiated:
        return 'UPDATE_INITIATED';
      case ModificationStateEnum.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
    }
  }
}

extension ModificationStateEnumFromString on String {
  ModificationStateEnum toModificationStateEnum() {
    switch (this) {
      case 'UPDATE_INITIATED':
        return ModificationStateEnum.updateInitiated;
      case 'UPDATE_IN_PROGRESS':
        return ModificationStateEnum.updateInProgress;
    }
    throw Exception('$this is not known in enum ModificationStateEnum');
  }
}

class ModifyAccountResult {
  ModifyAccountResult();

  factory ModifyAccountResult.fromJson(Map<String, dynamic> _) {
    return ModifyAccountResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ModifyCertificateBasedAuthPropertiesResult {
  ModifyCertificateBasedAuthPropertiesResult();

  factory ModifyCertificateBasedAuthPropertiesResult.fromJson(
      Map<String, dynamic> _) {
    return ModifyCertificateBasedAuthPropertiesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ModifyClientPropertiesResult {
  ModifyClientPropertiesResult();

  factory ModifyClientPropertiesResult.fromJson(Map<String, dynamic> _) {
    return ModifyClientPropertiesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ModifySamlPropertiesResult {
  ModifySamlPropertiesResult();

  factory ModifySamlPropertiesResult.fromJson(Map<String, dynamic> _) {
    return ModifySamlPropertiesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ModifySelfservicePermissionsResult {
  ModifySelfservicePermissionsResult();

  factory ModifySelfservicePermissionsResult.fromJson(Map<String, dynamic> _) {
    return ModifySelfservicePermissionsResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ModifyWorkspaceAccessPropertiesResult {
  ModifyWorkspaceAccessPropertiesResult();

  factory ModifyWorkspaceAccessPropertiesResult.fromJson(
      Map<String, dynamic> _) {
    return ModifyWorkspaceAccessPropertiesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ModifyWorkspaceCreationPropertiesResult {
  ModifyWorkspaceCreationPropertiesResult();

  factory ModifyWorkspaceCreationPropertiesResult.fromJson(
      Map<String, dynamic> _) {
    return ModifyWorkspaceCreationPropertiesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ModifyWorkspacePropertiesResult {
  ModifyWorkspacePropertiesResult();

  factory ModifyWorkspacePropertiesResult.fromJson(Map<String, dynamic> _) {
    return ModifyWorkspacePropertiesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ModifyWorkspaceStateResult {
  ModifyWorkspaceStateResult();

  factory ModifyWorkspaceStateResult.fromJson(Map<String, dynamic> _) {
    return ModifyWorkspaceStateResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The operating system that the image is running.
class OperatingSystem {
  /// The operating system.
  final OperatingSystemType? type;

  OperatingSystem({
    this.type,
  });

  factory OperatingSystem.fromJson(Map<String, dynamic> json) {
    return OperatingSystem(
      type: (json['Type'] as String?)?.toOperatingSystemType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum OperatingSystemName {
  amazonLinux_2,
  ubuntu_18_04,
  ubuntu_20_04,
  ubuntu_22_04,
  unknown,
  windows_10,
  windows_11,
  windows_7,
  windowsServer_2016,
  windowsServer_2019,
  windowsServer_2022,
}

extension OperatingSystemNameValueExtension on OperatingSystemName {
  String toValue() {
    switch (this) {
      case OperatingSystemName.amazonLinux_2:
        return 'AMAZON_LINUX_2';
      case OperatingSystemName.ubuntu_18_04:
        return 'UBUNTU_18_04';
      case OperatingSystemName.ubuntu_20_04:
        return 'UBUNTU_20_04';
      case OperatingSystemName.ubuntu_22_04:
        return 'UBUNTU_22_04';
      case OperatingSystemName.unknown:
        return 'UNKNOWN';
      case OperatingSystemName.windows_10:
        return 'WINDOWS_10';
      case OperatingSystemName.windows_11:
        return 'WINDOWS_11';
      case OperatingSystemName.windows_7:
        return 'WINDOWS_7';
      case OperatingSystemName.windowsServer_2016:
        return 'WINDOWS_SERVER_2016';
      case OperatingSystemName.windowsServer_2019:
        return 'WINDOWS_SERVER_2019';
      case OperatingSystemName.windowsServer_2022:
        return 'WINDOWS_SERVER_2022';
    }
  }
}

extension OperatingSystemNameFromString on String {
  OperatingSystemName toOperatingSystemName() {
    switch (this) {
      case 'AMAZON_LINUX_2':
        return OperatingSystemName.amazonLinux_2;
      case 'UBUNTU_18_04':
        return OperatingSystemName.ubuntu_18_04;
      case 'UBUNTU_20_04':
        return OperatingSystemName.ubuntu_20_04;
      case 'UBUNTU_22_04':
        return OperatingSystemName.ubuntu_22_04;
      case 'UNKNOWN':
        return OperatingSystemName.unknown;
      case 'WINDOWS_10':
        return OperatingSystemName.windows_10;
      case 'WINDOWS_11':
        return OperatingSystemName.windows_11;
      case 'WINDOWS_7':
        return OperatingSystemName.windows_7;
      case 'WINDOWS_SERVER_2016':
        return OperatingSystemName.windowsServer_2016;
      case 'WINDOWS_SERVER_2019':
        return OperatingSystemName.windowsServer_2019;
      case 'WINDOWS_SERVER_2022':
        return OperatingSystemName.windowsServer_2022;
    }
    throw Exception('$this is not known in enum OperatingSystemName');
  }
}

enum OperatingSystemType {
  windows,
  linux,
}

extension OperatingSystemTypeValueExtension on OperatingSystemType {
  String toValue() {
    switch (this) {
      case OperatingSystemType.windows:
        return 'WINDOWS';
      case OperatingSystemType.linux:
        return 'LINUX';
    }
  }
}

extension OperatingSystemTypeFromString on String {
  OperatingSystemType toOperatingSystemType() {
    switch (this) {
      case 'WINDOWS':
        return OperatingSystemType.windows;
      case 'LINUX':
        return OperatingSystemType.linux;
    }
    throw Exception('$this is not known in enum OperatingSystemType');
  }
}

/// Information about the standby WorkSpace.
class PendingCreateStandbyWorkspacesRequest {
  /// The identifier of the directory for the standby WorkSpace.
  final String? directoryId;

  /// The operational state of the standby WorkSpace.
  final WorkspaceState? state;

  /// Describes the standby WorkSpace that was created.
  ///
  /// Because this operation is asynchronous, the identifier returned is not
  /// immediately available for use with other operations. For example, if you
  /// call <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaces.html">
  /// DescribeWorkspaces</a> before the WorkSpace is created, the information
  /// returned can be incomplete.
  final String? userName;

  /// The identifier of the standby WorkSpace.
  final String? workspaceId;

  PendingCreateStandbyWorkspacesRequest({
    this.directoryId,
    this.state,
    this.userName,
    this.workspaceId,
  });

  factory PendingCreateStandbyWorkspacesRequest.fromJson(
      Map<String, dynamic> json) {
    return PendingCreateStandbyWorkspacesRequest(
      directoryId: json['DirectoryId'] as String?,
      state: (json['State'] as String?)?.toWorkspaceState(),
      userName: json['UserName'] as String?,
      workspaceId: json['WorkspaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final state = this.state;
    final userName = this.userName;
    final workspaceId = this.workspaceId;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
      if (state != null) 'State': state.toValue(),
      if (userName != null) 'UserName': userName,
      if (workspaceId != null) 'WorkspaceId': workspaceId,
    };
  }
}

enum Protocol {
  pcoip,
  wsp,
}

extension ProtocolValueExtension on Protocol {
  String toValue() {
    switch (this) {
      case Protocol.pcoip:
        return 'PCOIP';
      case Protocol.wsp:
        return 'WSP';
    }
  }
}

extension ProtocolFromString on String {
  Protocol toProtocol() {
    switch (this) {
      case 'PCOIP':
        return Protocol.pcoip;
      case 'WSP':
        return Protocol.wsp;
    }
    throw Exception('$this is not known in enum Protocol');
  }
}

/// Describes the information used to reboot a WorkSpace.
class RebootRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  RebootRequest({
    required this.workspaceId,
  });

  Map<String, dynamic> toJson() {
    final workspaceId = this.workspaceId;
    return {
      'WorkspaceId': workspaceId,
    };
  }
}

class RebootWorkspacesResult {
  /// Information about the WorkSpaces that could not be rebooted.
  final List<FailedWorkspaceChangeRequest>? failedRequests;

  RebootWorkspacesResult({
    this.failedRequests,
  });

  factory RebootWorkspacesResult.fromJson(Map<String, dynamic> json) {
    return RebootWorkspacesResult(
      failedRequests: (json['FailedRequests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRequests = this.failedRequests;
    return {
      if (failedRequests != null) 'FailedRequests': failedRequests,
    };
  }
}

/// Describes the information used to rebuild a WorkSpace.
class RebuildRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  RebuildRequest({
    required this.workspaceId,
  });

  Map<String, dynamic> toJson() {
    final workspaceId = this.workspaceId;
    return {
      'WorkspaceId': workspaceId,
    };
  }
}

class RebuildWorkspacesResult {
  /// Information about the WorkSpace that could not be rebuilt.
  final List<FailedWorkspaceChangeRequest>? failedRequests;

  RebuildWorkspacesResult({
    this.failedRequests,
  });

  factory RebuildWorkspacesResult.fromJson(Map<String, dynamic> json) {
    return RebuildWorkspacesResult(
      failedRequests: (json['FailedRequests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRequests = this.failedRequests;
    return {
      if (failedRequests != null) 'FailedRequests': failedRequests,
    };
  }
}

enum ReconnectEnum {
  enabled,
  disabled,
}

extension ReconnectEnumValueExtension on ReconnectEnum {
  String toValue() {
    switch (this) {
      case ReconnectEnum.enabled:
        return 'ENABLED';
      case ReconnectEnum.disabled:
        return 'DISABLED';
    }
  }
}

extension ReconnectEnumFromString on String {
  ReconnectEnum toReconnectEnum() {
    switch (this) {
      case 'ENABLED':
        return ReconnectEnum.enabled;
      case 'DISABLED':
        return ReconnectEnum.disabled;
    }
    throw Exception('$this is not known in enum ReconnectEnum');
  }
}

class RegisterWorkspaceDirectoryResult {
  RegisterWorkspaceDirectoryResult();

  factory RegisterWorkspaceDirectoryResult.fromJson(Map<String, dynamic> _) {
    return RegisterWorkspaceDirectoryResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RejectAccountLinkInvitationResult {
  /// Information about the account link.
  final AccountLink? accountLink;

  RejectAccountLinkInvitationResult({
    this.accountLink,
  });

  factory RejectAccountLinkInvitationResult.fromJson(
      Map<String, dynamic> json) {
    return RejectAccountLinkInvitationResult(
      accountLink: json['AccountLink'] != null
          ? AccountLink.fromJson(json['AccountLink'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLink = this.accountLink;
    return {
      if (accountLink != null) 'AccountLink': accountLink,
    };
  }
}

/// Describes the related WorkSpace. The related WorkSpace could be a standby
/// WorkSpace or primary WorkSpace related to the specified WorkSpace.
class RelatedWorkspaceProperties {
  /// The Region of the related WorkSpace.
  final String? region;

  /// Indicates the state of the WorkSpace.
  final WorkspaceState? state;

  /// Indicates the type of WorkSpace.
  final StandbyWorkspaceRelationshipType? type;

  /// The identifier of the related WorkSpace.
  final String? workspaceId;

  RelatedWorkspaceProperties({
    this.region,
    this.state,
    this.type,
    this.workspaceId,
  });

  factory RelatedWorkspaceProperties.fromJson(Map<String, dynamic> json) {
    return RelatedWorkspaceProperties(
      region: json['Region'] as String?,
      state: (json['State'] as String?)?.toWorkspaceState(),
      type: (json['Type'] as String?)?.toStandbyWorkspaceRelationshipType(),
      workspaceId: json['WorkspaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final state = this.state;
    final type = this.type;
    final workspaceId = this.workspaceId;
    return {
      if (region != null) 'Region': region,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (workspaceId != null) 'WorkspaceId': workspaceId,
    };
  }
}

class RestoreWorkspaceResult {
  RestoreWorkspaceResult();

  factory RestoreWorkspaceResult.fromJson(Map<String, dynamic> _) {
    return RestoreWorkspaceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RevokeIpRulesResult {
  RevokeIpRulesResult();

  factory RevokeIpRulesResult.fromJson(Map<String, dynamic> _) {
    return RevokeIpRulesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the root volume for a WorkSpace bundle.
class RootStorage {
  /// The size of the root volume.
  final String? capacity;

  RootStorage({
    this.capacity,
  });

  factory RootStorage.fromJson(Map<String, dynamic> json) {
    return RootStorage(
      capacity: json['Capacity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacity = this.capacity;
    return {
      if (capacity != null) 'Capacity': capacity,
    };
  }
}

enum RunningMode {
  autoStop,
  alwaysOn,
  manual,
}

extension RunningModeValueExtension on RunningMode {
  String toValue() {
    switch (this) {
      case RunningMode.autoStop:
        return 'AUTO_STOP';
      case RunningMode.alwaysOn:
        return 'ALWAYS_ON';
      case RunningMode.manual:
        return 'MANUAL';
    }
  }
}

extension RunningModeFromString on String {
  RunningMode toRunningMode() {
    switch (this) {
      case 'AUTO_STOP':
        return RunningMode.autoStop;
      case 'ALWAYS_ON':
        return RunningMode.alwaysOn;
      case 'MANUAL':
        return RunningMode.manual;
    }
    throw Exception('$this is not known in enum RunningMode');
  }
}

/// Describes the enablement status, user access URL, and relay state parameter
/// name that are used for configuring federation with an SAML 2.0 identity
/// provider.
class SamlProperties {
  /// The relay state parameter name supported by the SAML 2.0 identity provider
  /// (IdP). When the end user is redirected to the user access URL from the
  /// WorkSpaces client application, this relay state parameter name is appended
  /// as a query parameter to the URL along with the relay state endpoint to
  /// return the user to the client application session.
  ///
  /// To use SAML 2.0 authentication with WorkSpaces, the IdP must support
  /// IdP-initiated deep linking for the relay state URL. Consult your IdP
  /// documentation for more information.
  final String? relayStateParameterName;

  /// Indicates the status of SAML 2.0 authentication. These statuses include the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// If the setting is <code>DISABLED</code>, end users will be directed to login
  /// with their directory credentials.
  /// </li>
  /// <li>
  /// If the setting is <code>ENABLED</code>, end users will be directed to login
  /// via the user access URL. Users attempting to connect to WorkSpaces from a
  /// client application that does not support SAML 2.0 authentication will not be
  /// able to connect.
  /// </li>
  /// <li>
  /// If the setting is <code>ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK</code>, end
  /// users will be directed to login via the user access URL on supported client
  /// applications, but will not prevent clients that do not support SAML 2.0
  /// authentication from connecting as if SAML 2.0 authentication was disabled.
  /// </li>
  /// </ul>
  final SamlStatusEnum? status;

  /// The SAML 2.0 identity provider (IdP) user access URL is the URL a user would
  /// navigate to in their web browser in order to federate from the IdP and
  /// directly access the application, without any SAML 2.0 service provider (SP)
  /// bindings.
  final String? userAccessUrl;

  SamlProperties({
    this.relayStateParameterName,
    this.status,
    this.userAccessUrl,
  });

  factory SamlProperties.fromJson(Map<String, dynamic> json) {
    return SamlProperties(
      relayStateParameterName: json['RelayStateParameterName'] as String?,
      status: (json['Status'] as String?)?.toSamlStatusEnum(),
      userAccessUrl: json['UserAccessUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relayStateParameterName = this.relayStateParameterName;
    final status = this.status;
    final userAccessUrl = this.userAccessUrl;
    return {
      if (relayStateParameterName != null)
        'RelayStateParameterName': relayStateParameterName,
      if (status != null) 'Status': status.toValue(),
      if (userAccessUrl != null) 'UserAccessUrl': userAccessUrl,
    };
  }
}

enum SamlStatusEnum {
  disabled,
  enabled,
  enabledWithDirectoryLoginFallback,
}

extension SamlStatusEnumValueExtension on SamlStatusEnum {
  String toValue() {
    switch (this) {
      case SamlStatusEnum.disabled:
        return 'DISABLED';
      case SamlStatusEnum.enabled:
        return 'ENABLED';
      case SamlStatusEnum.enabledWithDirectoryLoginFallback:
        return 'ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK';
    }
  }
}

extension SamlStatusEnumFromString on String {
  SamlStatusEnum toSamlStatusEnum() {
    switch (this) {
      case 'DISABLED':
        return SamlStatusEnum.disabled;
      case 'ENABLED':
        return SamlStatusEnum.enabled;
      case 'ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK':
        return SamlStatusEnum.enabledWithDirectoryLoginFallback;
    }
    throw Exception('$this is not known in enum SamlStatusEnum');
  }
}

/// Describes the self-service permissions for a directory. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/enable-user-self-service-workspace-management.html">Enable
/// Self-Service WorkSpace Management Capabilities for Your Users</a>.
class SelfservicePermissions {
  /// Specifies whether users can change the compute type (bundle) for their
  /// WorkSpace.
  final ReconnectEnum? changeComputeType;

  /// Specifies whether users can increase the volume size of the drives on their
  /// WorkSpace.
  final ReconnectEnum? increaseVolumeSize;

  /// Specifies whether users can rebuild the operating system of a WorkSpace to
  /// its original state.
  final ReconnectEnum? rebuildWorkspace;

  /// Specifies whether users can restart their WorkSpace.
  final ReconnectEnum? restartWorkspace;

  /// Specifies whether users can switch the running mode of their WorkSpace.
  final ReconnectEnum? switchRunningMode;

  SelfservicePermissions({
    this.changeComputeType,
    this.increaseVolumeSize,
    this.rebuildWorkspace,
    this.restartWorkspace,
    this.switchRunningMode,
  });

  factory SelfservicePermissions.fromJson(Map<String, dynamic> json) {
    return SelfservicePermissions(
      changeComputeType:
          (json['ChangeComputeType'] as String?)?.toReconnectEnum(),
      increaseVolumeSize:
          (json['IncreaseVolumeSize'] as String?)?.toReconnectEnum(),
      rebuildWorkspace:
          (json['RebuildWorkspace'] as String?)?.toReconnectEnum(),
      restartWorkspace:
          (json['RestartWorkspace'] as String?)?.toReconnectEnum(),
      switchRunningMode:
          (json['SwitchRunningMode'] as String?)?.toReconnectEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeComputeType = this.changeComputeType;
    final increaseVolumeSize = this.increaseVolumeSize;
    final rebuildWorkspace = this.rebuildWorkspace;
    final restartWorkspace = this.restartWorkspace;
    final switchRunningMode = this.switchRunningMode;
    return {
      if (changeComputeType != null)
        'ChangeComputeType': changeComputeType.toValue(),
      if (increaseVolumeSize != null)
        'IncreaseVolumeSize': increaseVolumeSize.toValue(),
      if (rebuildWorkspace != null)
        'RebuildWorkspace': rebuildWorkspace.toValue(),
      if (restartWorkspace != null)
        'RestartWorkspace': restartWorkspace.toValue(),
      if (switchRunningMode != null)
        'SwitchRunningMode': switchRunningMode.toValue(),
    };
  }
}

/// Describes a snapshot.
class Snapshot {
  /// The time when the snapshot was created.
  final DateTime? snapshotTime;

  Snapshot({
    this.snapshotTime,
  });

  factory Snapshot.fromJson(Map<String, dynamic> json) {
    return Snapshot(
      snapshotTime: timeStampFromJson(json['SnapshotTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotTime = this.snapshotTime;
    return {
      if (snapshotTime != null)
        'SnapshotTime': unixTimestampToJson(snapshotTime),
    };
  }
}

/// Describes a standby WorkSpace.
class StandbyWorkspace {
  /// The identifier of the directory for the standby WorkSpace.
  final String directoryId;

  /// The identifier of the standby WorkSpace.
  final String primaryWorkspaceId;

  /// Indicates whether data replication is enabled, and if enabled, the type of
  /// data replication.
  final DataReplication? dataReplication;

  /// The tags associated with the standby WorkSpace.
  final List<Tag>? tags;

  /// The volume encryption key of the standby WorkSpace.
  final String? volumeEncryptionKey;

  StandbyWorkspace({
    required this.directoryId,
    required this.primaryWorkspaceId,
    this.dataReplication,
    this.tags,
    this.volumeEncryptionKey,
  });

  factory StandbyWorkspace.fromJson(Map<String, dynamic> json) {
    return StandbyWorkspace(
      directoryId: json['DirectoryId'] as String,
      primaryWorkspaceId: json['PrimaryWorkspaceId'] as String,
      dataReplication:
          (json['DataReplication'] as String?)?.toDataReplication(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumeEncryptionKey: json['VolumeEncryptionKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    final primaryWorkspaceId = this.primaryWorkspaceId;
    final dataReplication = this.dataReplication;
    final tags = this.tags;
    final volumeEncryptionKey = this.volumeEncryptionKey;
    return {
      'DirectoryId': directoryId,
      'PrimaryWorkspaceId': primaryWorkspaceId,
      if (dataReplication != null) 'DataReplication': dataReplication.toValue(),
      if (tags != null) 'Tags': tags,
      if (volumeEncryptionKey != null)
        'VolumeEncryptionKey': volumeEncryptionKey,
    };
  }
}

enum StandbyWorkspaceRelationshipType {
  primary,
  standby,
}

extension StandbyWorkspaceRelationshipTypeValueExtension
    on StandbyWorkspaceRelationshipType {
  String toValue() {
    switch (this) {
      case StandbyWorkspaceRelationshipType.primary:
        return 'PRIMARY';
      case StandbyWorkspaceRelationshipType.standby:
        return 'STANDBY';
    }
  }
}

extension StandbyWorkspaceRelationshipTypeFromString on String {
  StandbyWorkspaceRelationshipType toStandbyWorkspaceRelationshipType() {
    switch (this) {
      case 'PRIMARY':
        return StandbyWorkspaceRelationshipType.primary;
      case 'STANDBY':
        return StandbyWorkspaceRelationshipType.standby;
    }
    throw Exception(
        '$this is not known in enum StandbyWorkspaceRelationshipType');
  }
}

/// Describes the properties of the related standby WorkSpaces.
class StandbyWorkspacesProperties {
  /// Indicates whether data replication is enabled, and if enabled, the type of
  /// data replication.
  final DataReplication? dataReplication;

  /// The date and time at which the last successful snapshot was taken of the
  /// primary WorkSpace used for replicating data.
  final DateTime? recoverySnapshotTime;

  /// The identifier of the standby WorkSpace
  final String? standbyWorkspaceId;

  StandbyWorkspacesProperties({
    this.dataReplication,
    this.recoverySnapshotTime,
    this.standbyWorkspaceId,
  });

  factory StandbyWorkspacesProperties.fromJson(Map<String, dynamic> json) {
    return StandbyWorkspacesProperties(
      dataReplication:
          (json['DataReplication'] as String?)?.toDataReplication(),
      recoverySnapshotTime: timeStampFromJson(json['RecoverySnapshotTime']),
      standbyWorkspaceId: json['StandbyWorkspaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataReplication = this.dataReplication;
    final recoverySnapshotTime = this.recoverySnapshotTime;
    final standbyWorkspaceId = this.standbyWorkspaceId;
    return {
      if (dataReplication != null) 'DataReplication': dataReplication.toValue(),
      if (recoverySnapshotTime != null)
        'RecoverySnapshotTime': unixTimestampToJson(recoverySnapshotTime),
      if (standbyWorkspaceId != null) 'StandbyWorkspaceId': standbyWorkspaceId,
    };
  }
}

/// Information used to start a WorkSpace.
class StartRequest {
  /// The identifier of the WorkSpace.
  final String? workspaceId;

  StartRequest({
    this.workspaceId,
  });

  Map<String, dynamic> toJson() {
    final workspaceId = this.workspaceId;
    return {
      if (workspaceId != null) 'WorkspaceId': workspaceId,
    };
  }
}

class StartWorkspacesResult {
  /// Information about the WorkSpaces that could not be started.
  final List<FailedWorkspaceChangeRequest>? failedRequests;

  StartWorkspacesResult({
    this.failedRequests,
  });

  factory StartWorkspacesResult.fromJson(Map<String, dynamic> json) {
    return StartWorkspacesResult(
      failedRequests: (json['FailedRequests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRequests = this.failedRequests;
    return {
      if (failedRequests != null) 'FailedRequests': failedRequests,
    };
  }
}

/// Describes the information used to stop a WorkSpace.
class StopRequest {
  /// The identifier of the WorkSpace.
  final String? workspaceId;

  StopRequest({
    this.workspaceId,
  });

  Map<String, dynamic> toJson() {
    final workspaceId = this.workspaceId;
    return {
      if (workspaceId != null) 'WorkspaceId': workspaceId,
    };
  }
}

class StopWorkspacesResult {
  /// Information about the WorkSpaces that could not be stopped.
  final List<FailedWorkspaceChangeRequest>? failedRequests;

  StopWorkspacesResult({
    this.failedRequests,
  });

  factory StopWorkspacesResult.fromJson(Map<String, dynamic> json) {
    return StopWorkspacesResult(
      failedRequests: (json['FailedRequests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRequests = this.failedRequests;
    return {
      if (failedRequests != null) 'FailedRequests': failedRequests,
    };
  }
}

/// Describes a tag.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
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

enum TargetWorkspaceState {
  available,
  adminMaintenance,
}

extension TargetWorkspaceStateValueExtension on TargetWorkspaceState {
  String toValue() {
    switch (this) {
      case TargetWorkspaceState.available:
        return 'AVAILABLE';
      case TargetWorkspaceState.adminMaintenance:
        return 'ADMIN_MAINTENANCE';
    }
  }
}

extension TargetWorkspaceStateFromString on String {
  TargetWorkspaceState toTargetWorkspaceState() {
    switch (this) {
      case 'AVAILABLE':
        return TargetWorkspaceState.available;
      case 'ADMIN_MAINTENANCE':
        return TargetWorkspaceState.adminMaintenance;
    }
    throw Exception('$this is not known in enum TargetWorkspaceState');
  }
}

enum Tenancy {
  dedicated,
  shared,
}

extension TenancyValueExtension on Tenancy {
  String toValue() {
    switch (this) {
      case Tenancy.dedicated:
        return 'DEDICATED';
      case Tenancy.shared:
        return 'SHARED';
    }
  }
}

extension TenancyFromString on String {
  Tenancy toTenancy() {
    switch (this) {
      case 'DEDICATED':
        return Tenancy.dedicated;
      case 'SHARED':
        return Tenancy.shared;
    }
    throw Exception('$this is not known in enum Tenancy');
  }
}

/// Describes the information used to terminate a WorkSpace.
class TerminateRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  TerminateRequest({
    required this.workspaceId,
  });

  Map<String, dynamic> toJson() {
    final workspaceId = this.workspaceId;
    return {
      'WorkspaceId': workspaceId,
    };
  }
}

class TerminateWorkspacesResult {
  /// Information about the WorkSpaces that could not be terminated.
  final List<FailedWorkspaceChangeRequest>? failedRequests;

  TerminateWorkspacesResult({
    this.failedRequests,
  });

  factory TerminateWorkspacesResult.fromJson(Map<String, dynamic> json) {
    return TerminateWorkspacesResult(
      failedRequests: (json['FailedRequests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FailedWorkspaceChangeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRequests = this.failedRequests;
    return {
      if (failedRequests != null) 'FailedRequests': failedRequests,
    };
  }
}

class UpdateConnectClientAddInResult {
  UpdateConnectClientAddInResult();

  factory UpdateConnectClientAddInResult.fromJson(Map<String, dynamic> _) {
    return UpdateConnectClientAddInResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateConnectionAliasPermissionResult {
  UpdateConnectionAliasPermissionResult();

  factory UpdateConnectionAliasPermissionResult.fromJson(
      Map<String, dynamic> _) {
    return UpdateConnectionAliasPermissionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes whether a WorkSpace image needs to be updated with the latest
/// drivers and other components required by Amazon WorkSpaces.
/// <note>
/// Only Windows 10 WorkSpace images can be programmatically updated at this
/// time.
/// </note>
class UpdateResult {
  /// A description of whether updates for the WorkSpace image are pending or
  /// available.
  final String? description;

  /// Indicates whether updated drivers or other components are available for the
  /// specified WorkSpace image.
  final bool? updateAvailable;

  UpdateResult({
    this.description,
    this.updateAvailable,
  });

  factory UpdateResult.fromJson(Map<String, dynamic> json) {
    return UpdateResult(
      description: json['Description'] as String?,
      updateAvailable: json['UpdateAvailable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final updateAvailable = this.updateAvailable;
    return {
      if (description != null) 'Description': description,
      if (updateAvailable != null) 'UpdateAvailable': updateAvailable,
    };
  }
}

class UpdateRulesOfIpGroupResult {
  UpdateRulesOfIpGroupResult();

  factory UpdateRulesOfIpGroupResult.fromJson(Map<String, dynamic> _) {
    return UpdateRulesOfIpGroupResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWorkspaceBundleResult {
  UpdateWorkspaceBundleResult();

  factory UpdateWorkspaceBundleResult.fromJson(Map<String, dynamic> _) {
    return UpdateWorkspaceBundleResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWorkspaceImagePermissionResult {
  UpdateWorkspaceImagePermissionResult();

  factory UpdateWorkspaceImagePermissionResult.fromJson(
      Map<String, dynamic> _) {
    return UpdateWorkspaceImagePermissionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the user volume for a WorkSpace bundle.
class UserStorage {
  /// The size of the user volume.
  final String? capacity;

  UserStorage({
    this.capacity,
  });

  factory UserStorage.fromJson(Map<String, dynamic> json) {
    return UserStorage(
      capacity: json['Capacity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacity = this.capacity;
    return {
      if (capacity != null) 'Capacity': capacity,
    };
  }
}

/// Describes the WorkSpace application.
class WorkSpaceApplication {
  /// The identifier of the application.
  final String? applicationId;

  /// The time the application is created.
  final DateTime? created;

  /// The description of the WorkSpace application.
  final String? description;

  /// The license availability for the applications.
  final WorkSpaceApplicationLicenseType? licenseType;

  /// The name of the WorkSpace application.
  final String? name;

  /// The owner of the WorkSpace application.
  final String? owner;

  /// The status of WorkSpace application.
  final WorkSpaceApplicationState? state;

  /// The supported compute types of the WorkSpace application.
  final List<Compute>? supportedComputeTypeNames;

  /// The supported operating systems of the WorkSpace application.
  final List<OperatingSystemName>? supportedOperatingSystemNames;

  WorkSpaceApplication({
    this.applicationId,
    this.created,
    this.description,
    this.licenseType,
    this.name,
    this.owner,
    this.state,
    this.supportedComputeTypeNames,
    this.supportedOperatingSystemNames,
  });

  factory WorkSpaceApplication.fromJson(Map<String, dynamic> json) {
    return WorkSpaceApplication(
      applicationId: json['ApplicationId'] as String?,
      created: timeStampFromJson(json['Created']),
      description: json['Description'] as String?,
      licenseType:
          (json['LicenseType'] as String?)?.toWorkSpaceApplicationLicenseType(),
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      state: (json['State'] as String?)?.toWorkSpaceApplicationState(),
      supportedComputeTypeNames: (json['SupportedComputeTypeNames'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toCompute())
          .toList(),
      supportedOperatingSystemNames:
          (json['SupportedOperatingSystemNames'] as List?)
              ?.whereNotNull()
              .map((e) => (e as String).toOperatingSystemName())
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final created = this.created;
    final description = this.description;
    final licenseType = this.licenseType;
    final name = this.name;
    final owner = this.owner;
    final state = this.state;
    final supportedComputeTypeNames = this.supportedComputeTypeNames;
    final supportedOperatingSystemNames = this.supportedOperatingSystemNames;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (created != null) 'Created': unixTimestampToJson(created),
      if (description != null) 'Description': description,
      if (licenseType != null) 'LicenseType': licenseType.toValue(),
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (state != null) 'State': state.toValue(),
      if (supportedComputeTypeNames != null)
        'SupportedComputeTypeNames':
            supportedComputeTypeNames.map((e) => e.toValue()).toList(),
      if (supportedOperatingSystemNames != null)
        'SupportedOperatingSystemNames':
            supportedOperatingSystemNames.map((e) => e.toValue()).toList(),
    };
  }
}

/// Describes the WorkSpace application deployment.
class WorkSpaceApplicationDeployment {
  /// The associations between the applications and the associated resources.
  final List<WorkspaceResourceAssociation>? associations;

  WorkSpaceApplicationDeployment({
    this.associations,
  });

  factory WorkSpaceApplicationDeployment.fromJson(Map<String, dynamic> json) {
    return WorkSpaceApplicationDeployment(
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WorkspaceResourceAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    return {
      if (associations != null) 'Associations': associations,
    };
  }
}

enum WorkSpaceApplicationLicenseType {
  licensed,
  unlicensed,
}

extension WorkSpaceApplicationLicenseTypeValueExtension
    on WorkSpaceApplicationLicenseType {
  String toValue() {
    switch (this) {
      case WorkSpaceApplicationLicenseType.licensed:
        return 'LICENSED';
      case WorkSpaceApplicationLicenseType.unlicensed:
        return 'UNLICENSED';
    }
  }
}

extension WorkSpaceApplicationLicenseTypeFromString on String {
  WorkSpaceApplicationLicenseType toWorkSpaceApplicationLicenseType() {
    switch (this) {
      case 'LICENSED':
        return WorkSpaceApplicationLicenseType.licensed;
      case 'UNLICENSED':
        return WorkSpaceApplicationLicenseType.unlicensed;
    }
    throw Exception(
        '$this is not known in enum WorkSpaceApplicationLicenseType');
  }
}

enum WorkSpaceApplicationState {
  pending,
  error,
  available,
  uninstallOnly,
}

extension WorkSpaceApplicationStateValueExtension on WorkSpaceApplicationState {
  String toValue() {
    switch (this) {
      case WorkSpaceApplicationState.pending:
        return 'PENDING';
      case WorkSpaceApplicationState.error:
        return 'ERROR';
      case WorkSpaceApplicationState.available:
        return 'AVAILABLE';
      case WorkSpaceApplicationState.uninstallOnly:
        return 'UNINSTALL_ONLY';
    }
  }
}

extension WorkSpaceApplicationStateFromString on String {
  WorkSpaceApplicationState toWorkSpaceApplicationState() {
    switch (this) {
      case 'PENDING':
        return WorkSpaceApplicationState.pending;
      case 'ERROR':
        return WorkSpaceApplicationState.error;
      case 'AVAILABLE':
        return WorkSpaceApplicationState.available;
      case 'UNINSTALL_ONLY':
        return WorkSpaceApplicationState.uninstallOnly;
    }
    throw Exception('$this is not known in enum WorkSpaceApplicationState');
  }
}

enum WorkSpaceAssociatedResourceType {
  application,
}

extension WorkSpaceAssociatedResourceTypeValueExtension
    on WorkSpaceAssociatedResourceType {
  String toValue() {
    switch (this) {
      case WorkSpaceAssociatedResourceType.application:
        return 'APPLICATION';
    }
  }
}

extension WorkSpaceAssociatedResourceTypeFromString on String {
  WorkSpaceAssociatedResourceType toWorkSpaceAssociatedResourceType() {
    switch (this) {
      case 'APPLICATION':
        return WorkSpaceAssociatedResourceType.application;
    }
    throw Exception(
        '$this is not known in enum WorkSpaceAssociatedResourceType');
  }
}

/// Describes a WorkSpace.
class Workspace {
  /// The identifier of the bundle used to create the WorkSpace.
  final String? bundleId;

  /// The name of the WorkSpace, as seen by the operating system. The format of
  /// this name varies. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/launch-workspaces-tutorials.html">
  /// Launch a WorkSpace</a>.
  final String? computerName;

  /// Indicates the settings of the data replication.
  final DataReplicationSettings? dataReplicationSettings;

  /// The identifier of the Directory Service directory for the WorkSpace.
  final String? directoryId;

  /// The error code that is returned if the WorkSpace cannot be created.
  final String? errorCode;

  /// The text of the error message that is returned if the WorkSpace cannot be
  /// created.
  final String? errorMessage;

  /// The IP address of the WorkSpace.
  final String? ipAddress;

  /// The modification states of the WorkSpace.
  final List<ModificationState>? modificationStates;

  /// The standby WorkSpace or primary WorkSpace related to the specified
  /// WorkSpace.
  final List<RelatedWorkspaceProperties>? relatedWorkspaces;

  /// Indicates whether the data stored on the root volume is encrypted.
  final bool? rootVolumeEncryptionEnabled;

  /// The properties of the standby WorkSpace
  final List<StandbyWorkspacesProperties>? standbyWorkspacesProperties;

  /// The operational state of the WorkSpace.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – The WorkSpace is in a waiting state (for example, the
  /// WorkSpace is being created).
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> – The WorkSpace is running and has passed the health
  /// checks.
  /// </li>
  /// <li>
  /// <code>IMPAIRED</code> – Refer to <code>UNHEALTHY</code> state.
  /// </li>
  /// <li>
  /// <code>UNHEALTHY</code> – The WorkSpace is not responding to health checks.
  /// </li>
  /// <li>
  /// <code>REBOOTING</code> – The WorkSpace is being rebooted (restarted).
  /// </li>
  /// <li>
  /// <code>STARTING</code> – The WorkSpace is starting up and health checks are
  /// being run.
  /// </li>
  /// <li>
  /// <code>REBUILDING</code> – The WorkSpace is being rebuilt.
  /// </li>
  /// <li>
  /// <code>RESTORING</code> – The WorkSpace is being restored.
  /// </li>
  /// <li>
  /// <code>MAINTENANCE</code> – The WorkSpace is undergoing scheduled maintenance
  /// by Amazon Web Services.
  /// </li>
  /// <li>
  /// <code>ADMIN_MAINTENANCE</code> – The WorkSpace is undergoing maintenance by
  /// the WorkSpaces administrator.
  /// </li>
  /// <li>
  /// <code>TERMINATING</code> – The WorkSpace is being deleted.
  /// </li>
  /// <li>
  /// <code>TERMINATED</code> – The WorkSpace has been deleted.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code> – The WorkSpace has been suspended for image
  /// creation.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> – The WorkSpace is undergoing an update.
  /// </li>
  /// <li>
  /// <code>STOPPING</code> – The WorkSpace is being stopped.
  /// </li>
  /// <li>
  /// <code>STOPPED</code> – The WorkSpace has been stopped.
  /// </li>
  /// <li>
  /// <code>ERROR </code> – The WorkSpace is an error state (for example, an error
  /// occurred during startup).
  /// </li>
  /// </ul> <note>
  /// After a WorkSpace is terminated, the <code>TERMINATED</code> state is
  /// returned only briefly before the WorkSpace directory metadata is cleaned up,
  /// so this state is rarely returned. To confirm that a WorkSpace is terminated,
  /// check for the WorkSpace ID by using <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaces.html">
  /// DescribeWorkSpaces</a>. If the WorkSpace ID isn't returned, then the
  /// WorkSpace has been successfully terminated.
  /// </note>
  final WorkspaceState? state;

  /// The identifier of the subnet for the WorkSpace.
  final String? subnetId;

  /// The user for the WorkSpace.
  final String? userName;

  /// Indicates whether the data stored on the user volume is encrypted.
  final bool? userVolumeEncryptionEnabled;

  /// The ARN of the symmetric KMS key used to encrypt data stored on your
  /// WorkSpace. Amazon WorkSpaces does not support asymmetric KMS keys.
  final String? volumeEncryptionKey;

  /// The identifier of the WorkSpace.
  final String? workspaceId;

  /// The name of the user-decoupled WorkSpace.
  final String? workspaceName;

  /// The properties of the WorkSpace.
  final WorkspaceProperties? workspaceProperties;

  Workspace({
    this.bundleId,
    this.computerName,
    this.dataReplicationSettings,
    this.directoryId,
    this.errorCode,
    this.errorMessage,
    this.ipAddress,
    this.modificationStates,
    this.relatedWorkspaces,
    this.rootVolumeEncryptionEnabled,
    this.standbyWorkspacesProperties,
    this.state,
    this.subnetId,
    this.userName,
    this.userVolumeEncryptionEnabled,
    this.volumeEncryptionKey,
    this.workspaceId,
    this.workspaceName,
    this.workspaceProperties,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) {
    return Workspace(
      bundleId: json['BundleId'] as String?,
      computerName: json['ComputerName'] as String?,
      dataReplicationSettings: json['DataReplicationSettings'] != null
          ? DataReplicationSettings.fromJson(
              json['DataReplicationSettings'] as Map<String, dynamic>)
          : null,
      directoryId: json['DirectoryId'] as String?,
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      ipAddress: json['IpAddress'] as String?,
      modificationStates: (json['ModificationStates'] as List?)
          ?.whereNotNull()
          .map((e) => ModificationState.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedWorkspaces: (json['RelatedWorkspaces'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RelatedWorkspaceProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      rootVolumeEncryptionEnabled: json['RootVolumeEncryptionEnabled'] as bool?,
      standbyWorkspacesProperties: (json['StandbyWorkspacesProperties']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              StandbyWorkspacesProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['State'] as String?)?.toWorkspaceState(),
      subnetId: json['SubnetId'] as String?,
      userName: json['UserName'] as String?,
      userVolumeEncryptionEnabled: json['UserVolumeEncryptionEnabled'] as bool?,
      volumeEncryptionKey: json['VolumeEncryptionKey'] as String?,
      workspaceId: json['WorkspaceId'] as String?,
      workspaceName: json['WorkspaceName'] as String?,
      workspaceProperties: json['WorkspaceProperties'] != null
          ? WorkspaceProperties.fromJson(
              json['WorkspaceProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final computerName = this.computerName;
    final dataReplicationSettings = this.dataReplicationSettings;
    final directoryId = this.directoryId;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final ipAddress = this.ipAddress;
    final modificationStates = this.modificationStates;
    final relatedWorkspaces = this.relatedWorkspaces;
    final rootVolumeEncryptionEnabled = this.rootVolumeEncryptionEnabled;
    final standbyWorkspacesProperties = this.standbyWorkspacesProperties;
    final state = this.state;
    final subnetId = this.subnetId;
    final userName = this.userName;
    final userVolumeEncryptionEnabled = this.userVolumeEncryptionEnabled;
    final volumeEncryptionKey = this.volumeEncryptionKey;
    final workspaceId = this.workspaceId;
    final workspaceName = this.workspaceName;
    final workspaceProperties = this.workspaceProperties;
    return {
      if (bundleId != null) 'BundleId': bundleId,
      if (computerName != null) 'ComputerName': computerName,
      if (dataReplicationSettings != null)
        'DataReplicationSettings': dataReplicationSettings,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (modificationStates != null) 'ModificationStates': modificationStates,
      if (relatedWorkspaces != null) 'RelatedWorkspaces': relatedWorkspaces,
      if (rootVolumeEncryptionEnabled != null)
        'RootVolumeEncryptionEnabled': rootVolumeEncryptionEnabled,
      if (standbyWorkspacesProperties != null)
        'StandbyWorkspacesProperties': standbyWorkspacesProperties,
      if (state != null) 'State': state.toValue(),
      if (subnetId != null) 'SubnetId': subnetId,
      if (userName != null) 'UserName': userName,
      if (userVolumeEncryptionEnabled != null)
        'UserVolumeEncryptionEnabled': userVolumeEncryptionEnabled,
      if (volumeEncryptionKey != null)
        'VolumeEncryptionKey': volumeEncryptionKey,
      if (workspaceId != null) 'WorkspaceId': workspaceId,
      if (workspaceName != null) 'WorkspaceName': workspaceName,
      if (workspaceProperties != null)
        'WorkspaceProperties': workspaceProperties,
    };
  }
}

/// The device types and operating systems that can be used to access a
/// WorkSpace. For more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/workspaces-network-requirements.html">Amazon
/// WorkSpaces Client Network Requirements</a>.
class WorkspaceAccessProperties {
  /// Indicates whether users can use Android and Android-compatible Chrome OS
  /// devices to access their WorkSpaces.
  final AccessPropertyValue? deviceTypeAndroid;

  /// Indicates whether users can use Chromebooks to access their WorkSpaces.
  final AccessPropertyValue? deviceTypeChromeOs;

  /// Indicates whether users can use iOS devices to access their WorkSpaces.
  final AccessPropertyValue? deviceTypeIos;

  /// Indicates whether users can use Linux clients to access their WorkSpaces.
  final AccessPropertyValue? deviceTypeLinux;

  /// Indicates whether users can use macOS clients to access their WorkSpaces.
  final AccessPropertyValue? deviceTypeOsx;

  /// Indicates whether users can access their WorkSpaces through a web browser.
  final AccessPropertyValue? deviceTypeWeb;

  /// Indicates whether users can use Windows clients to access their WorkSpaces.
  final AccessPropertyValue? deviceTypeWindows;

  /// Indicates whether users can use zero client devices to access their
  /// WorkSpaces.
  final AccessPropertyValue? deviceTypeZeroClient;

  WorkspaceAccessProperties({
    this.deviceTypeAndroid,
    this.deviceTypeChromeOs,
    this.deviceTypeIos,
    this.deviceTypeLinux,
    this.deviceTypeOsx,
    this.deviceTypeWeb,
    this.deviceTypeWindows,
    this.deviceTypeZeroClient,
  });

  factory WorkspaceAccessProperties.fromJson(Map<String, dynamic> json) {
    return WorkspaceAccessProperties(
      deviceTypeAndroid:
          (json['DeviceTypeAndroid'] as String?)?.toAccessPropertyValue(),
      deviceTypeChromeOs:
          (json['DeviceTypeChromeOs'] as String?)?.toAccessPropertyValue(),
      deviceTypeIos:
          (json['DeviceTypeIos'] as String?)?.toAccessPropertyValue(),
      deviceTypeLinux:
          (json['DeviceTypeLinux'] as String?)?.toAccessPropertyValue(),
      deviceTypeOsx:
          (json['DeviceTypeOsx'] as String?)?.toAccessPropertyValue(),
      deviceTypeWeb:
          (json['DeviceTypeWeb'] as String?)?.toAccessPropertyValue(),
      deviceTypeWindows:
          (json['DeviceTypeWindows'] as String?)?.toAccessPropertyValue(),
      deviceTypeZeroClient:
          (json['DeviceTypeZeroClient'] as String?)?.toAccessPropertyValue(),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceTypeAndroid = this.deviceTypeAndroid;
    final deviceTypeChromeOs = this.deviceTypeChromeOs;
    final deviceTypeIos = this.deviceTypeIos;
    final deviceTypeLinux = this.deviceTypeLinux;
    final deviceTypeOsx = this.deviceTypeOsx;
    final deviceTypeWeb = this.deviceTypeWeb;
    final deviceTypeWindows = this.deviceTypeWindows;
    final deviceTypeZeroClient = this.deviceTypeZeroClient;
    return {
      if (deviceTypeAndroid != null)
        'DeviceTypeAndroid': deviceTypeAndroid.toValue(),
      if (deviceTypeChromeOs != null)
        'DeviceTypeChromeOs': deviceTypeChromeOs.toValue(),
      if (deviceTypeIos != null) 'DeviceTypeIos': deviceTypeIos.toValue(),
      if (deviceTypeLinux != null) 'DeviceTypeLinux': deviceTypeLinux.toValue(),
      if (deviceTypeOsx != null) 'DeviceTypeOsx': deviceTypeOsx.toValue(),
      if (deviceTypeWeb != null) 'DeviceTypeWeb': deviceTypeWeb.toValue(),
      if (deviceTypeWindows != null)
        'DeviceTypeWindows': deviceTypeWindows.toValue(),
      if (deviceTypeZeroClient != null)
        'DeviceTypeZeroClient': deviceTypeZeroClient.toValue(),
    };
  }
}

/// Describes a WorkSpace bundle.
class WorkspaceBundle {
  /// The identifier of the bundle.
  final String? bundleId;

  /// The type of WorkSpace bundle.
  final BundleType? bundleType;

  /// The compute type of the bundle. For more information, see <a
  /// href="http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles">Amazon
  /// WorkSpaces Bundles</a>.
  final ComputeType? computeType;

  /// The time when the bundle was created.
  final DateTime? creationTime;

  /// The description of the bundle.
  final String? description;

  /// The identifier of the image that was used to create the bundle.
  final String? imageId;

  /// The last time that the bundle was updated.
  final DateTime? lastUpdatedTime;

  /// The name of the bundle.
  final String? name;

  /// The owner of the bundle. This is the account identifier of the owner, or
  /// <code>AMAZON</code> if the bundle is provided by Amazon Web Services.
  final String? owner;

  /// The size of the root volume.
  final RootStorage? rootStorage;

  /// The state of the WorkSpace bundle.
  final WorkspaceBundleState? state;

  /// The size of the user volume.
  final UserStorage? userStorage;

  WorkspaceBundle({
    this.bundleId,
    this.bundleType,
    this.computeType,
    this.creationTime,
    this.description,
    this.imageId,
    this.lastUpdatedTime,
    this.name,
    this.owner,
    this.rootStorage,
    this.state,
    this.userStorage,
  });

  factory WorkspaceBundle.fromJson(Map<String, dynamic> json) {
    return WorkspaceBundle(
      bundleId: json['BundleId'] as String?,
      bundleType: (json['BundleType'] as String?)?.toBundleType(),
      computeType: json['ComputeType'] != null
          ? ComputeType.fromJson(json['ComputeType'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      imageId: json['ImageId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      rootStorage: json['RootStorage'] != null
          ? RootStorage.fromJson(json['RootStorage'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.toWorkspaceBundleState(),
      userStorage: json['UserStorage'] != null
          ? UserStorage.fromJson(json['UserStorage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final bundleType = this.bundleType;
    final computeType = this.computeType;
    final creationTime = this.creationTime;
    final description = this.description;
    final imageId = this.imageId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final owner = this.owner;
    final rootStorage = this.rootStorage;
    final state = this.state;
    final userStorage = this.userStorage;
    return {
      if (bundleId != null) 'BundleId': bundleId,
      if (bundleType != null) 'BundleType': bundleType.toValue(),
      if (computeType != null) 'ComputeType': computeType,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (imageId != null) 'ImageId': imageId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (rootStorage != null) 'RootStorage': rootStorage,
      if (state != null) 'State': state.toValue(),
      if (userStorage != null) 'UserStorage': userStorage,
    };
  }
}

enum WorkspaceBundleState {
  available,
  pending,
  error,
}

extension WorkspaceBundleStateValueExtension on WorkspaceBundleState {
  String toValue() {
    switch (this) {
      case WorkspaceBundleState.available:
        return 'AVAILABLE';
      case WorkspaceBundleState.pending:
        return 'PENDING';
      case WorkspaceBundleState.error:
        return 'ERROR';
    }
  }
}

extension WorkspaceBundleStateFromString on String {
  WorkspaceBundleState toWorkspaceBundleState() {
    switch (this) {
      case 'AVAILABLE':
        return WorkspaceBundleState.available;
      case 'PENDING':
        return WorkspaceBundleState.pending;
      case 'ERROR':
        return WorkspaceBundleState.error;
    }
    throw Exception('$this is not known in enum WorkspaceBundleState');
  }
}

/// Describes the connection status of a WorkSpace.
class WorkspaceConnectionStatus {
  /// The connection state of the WorkSpace. The connection state is unknown if
  /// the WorkSpace is stopped.
  final ConnectionState? connectionState;

  /// The timestamp of the connection status check.
  final DateTime? connectionStateCheckTimestamp;

  /// The timestamp of the last known user connection.
  final DateTime? lastKnownUserConnectionTimestamp;

  /// The identifier of the WorkSpace.
  final String? workspaceId;

  WorkspaceConnectionStatus({
    this.connectionState,
    this.connectionStateCheckTimestamp,
    this.lastKnownUserConnectionTimestamp,
    this.workspaceId,
  });

  factory WorkspaceConnectionStatus.fromJson(Map<String, dynamic> json) {
    return WorkspaceConnectionStatus(
      connectionState:
          (json['ConnectionState'] as String?)?.toConnectionState(),
      connectionStateCheckTimestamp:
          timeStampFromJson(json['ConnectionStateCheckTimestamp']),
      lastKnownUserConnectionTimestamp:
          timeStampFromJson(json['LastKnownUserConnectionTimestamp']),
      workspaceId: json['WorkspaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionState = this.connectionState;
    final connectionStateCheckTimestamp = this.connectionStateCheckTimestamp;
    final lastKnownUserConnectionTimestamp =
        this.lastKnownUserConnectionTimestamp;
    final workspaceId = this.workspaceId;
    return {
      if (connectionState != null) 'ConnectionState': connectionState.toValue(),
      if (connectionStateCheckTimestamp != null)
        'ConnectionStateCheckTimestamp':
            unixTimestampToJson(connectionStateCheckTimestamp),
      if (lastKnownUserConnectionTimestamp != null)
        'LastKnownUserConnectionTimestamp':
            unixTimestampToJson(lastKnownUserConnectionTimestamp),
      if (workspaceId != null) 'WorkspaceId': workspaceId,
    };
  }
}

/// Describes the default properties that are used for creating WorkSpaces. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/update-directory-details.html">Update
/// Directory Details for Your WorkSpaces</a>.
class WorkspaceCreationProperties {
  /// The identifier of your custom security group.
  final String? customSecurityGroupId;

  /// The default organizational unit (OU) for your WorkSpaces directories. This
  /// string must be the full Lightweight Directory Access Protocol (LDAP)
  /// distinguished name for the target domain and OU. It must be in the form
  /// <code>"OU=<i>value</i>,DC=<i>value</i>,DC=<i>value</i>"</code>, where
  /// <i>value</i> is any string of characters, and the number of domain
  /// components (DCs) is two or more. For example,
  /// <code>OU=WorkSpaces_machines,DC=machines,DC=example,DC=com</code>.
  /// <important>
  /// <ul>
  /// <li>
  /// To avoid errors, certain characters in the distinguished name must be
  /// escaped. For more information, see <a
  /// href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/distinguished-names">
  /// Distinguished Names</a> in the Microsoft documentation.
  /// </li>
  /// <li>
  /// The API doesn't validate whether the OU exists.
  /// </li>
  /// </ul> </important>
  final String? defaultOu;

  /// Indicates whether internet access is enabled for your WorkSpaces.
  final bool? enableInternetAccess;

  /// Indicates whether maintenance mode is enabled for your WorkSpaces. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/workspace-maintenance.html">WorkSpace
  /// Maintenance</a>.
  final bool? enableMaintenanceMode;

  /// Indicates whether Amazon WorkDocs is enabled for your WorkSpaces.
  /// <note>
  /// If WorkDocs is already enabled for a WorkSpaces directory and you disable
  /// it, new WorkSpaces launched in the directory will not have WorkDocs enabled.
  /// However, WorkDocs remains enabled for any existing WorkSpaces, unless you
  /// either disable users' access to WorkDocs or you delete the WorkDocs site. To
  /// disable users' access to WorkDocs, see <a
  /// href="https://docs.aws.amazon.com/workdocs/latest/adminguide/inactive-user.html">Disabling
  /// Users</a> in the <i>Amazon WorkDocs Administration Guide</i>. To delete a
  /// WorkDocs site, see <a
  /// href="https://docs.aws.amazon.com/workdocs/latest/adminguide/manage-sites.html">Deleting
  /// a Site</a> in the <i>Amazon WorkDocs Administration Guide</i>.
  ///
  /// If you enable WorkDocs on a directory that already has existing WorkSpaces,
  /// the existing WorkSpaces and any new WorkSpaces that are launched in the
  /// directory will have WorkDocs enabled.
  /// </note>
  final bool? enableWorkDocs;

  /// Indicates whether users are local administrators of their WorkSpaces.
  final bool? userEnabledAsLocalAdministrator;

  WorkspaceCreationProperties({
    this.customSecurityGroupId,
    this.defaultOu,
    this.enableInternetAccess,
    this.enableMaintenanceMode,
    this.enableWorkDocs,
    this.userEnabledAsLocalAdministrator,
  });

  Map<String, dynamic> toJson() {
    final customSecurityGroupId = this.customSecurityGroupId;
    final defaultOu = this.defaultOu;
    final enableInternetAccess = this.enableInternetAccess;
    final enableMaintenanceMode = this.enableMaintenanceMode;
    final enableWorkDocs = this.enableWorkDocs;
    final userEnabledAsLocalAdministrator =
        this.userEnabledAsLocalAdministrator;
    return {
      if (customSecurityGroupId != null)
        'CustomSecurityGroupId': customSecurityGroupId,
      if (defaultOu != null) 'DefaultOu': defaultOu,
      if (enableInternetAccess != null)
        'EnableInternetAccess': enableInternetAccess,
      if (enableMaintenanceMode != null)
        'EnableMaintenanceMode': enableMaintenanceMode,
      if (enableWorkDocs != null) 'EnableWorkDocs': enableWorkDocs,
      if (userEnabledAsLocalAdministrator != null)
        'UserEnabledAsLocalAdministrator': userEnabledAsLocalAdministrator,
    };
  }
}

/// Describes a directory that is used with Amazon WorkSpaces.
class WorkspaceDirectory {
  /// The directory alias.
  final String? alias;

  /// The certificate-based authentication properties used to authenticate SAML
  /// 2.0 Identity Provider (IdP) user identities to Active Directory for
  /// WorkSpaces login.
  final CertificateBasedAuthProperties? certificateBasedAuthProperties;

  /// The user name for the service account.
  final String? customerUserName;

  /// The directory identifier.
  final String? directoryId;

  /// The name of the directory.
  final String? directoryName;

  /// The directory type.
  final WorkspaceDirectoryType? directoryType;

  /// The IP addresses of the DNS servers for the directory.
  final List<String>? dnsIpAddresses;

  /// The identifier of the IAM role. This is the role that allows Amazon
  /// WorkSpaces to make calls to other services, such as Amazon EC2, on your
  /// behalf.
  final String? iamRoleId;

  /// The registration code for the directory. This is the code that users enter
  /// in their Amazon WorkSpaces client application to connect to the directory.
  final String? registrationCode;

  /// Describes the enablement status, user access URL, and relay state parameter
  /// name that are used for configuring federation with an SAML 2.0 identity
  /// provider.
  final SamlProperties? samlProperties;

  /// The default self-service permissions for WorkSpaces in the directory.
  final SelfservicePermissions? selfservicePermissions;

  /// The state of the directory's registration with Amazon WorkSpaces. After a
  /// directory is deregistered, the <code>DEREGISTERED</code> state is returned
  /// very briefly before the directory metadata is cleaned up, so this state is
  /// rarely returned. To confirm that a directory is deregistered, check for the
  /// directory ID by using <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceDirectories.html">
  /// DescribeWorkspaceDirectories</a>. If the directory ID isn't returned, then
  /// the directory has been successfully deregistered.
  final WorkspaceDirectoryState? state;

  /// The identifiers of the subnets used with the directory.
  final List<String>? subnetIds;

  /// Specifies whether the directory is dedicated or shared. To use Bring Your
  /// Own License (BYOL), this value must be set to <code>DEDICATED</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html">Bring
  /// Your Own Windows Desktop Images</a>.
  final Tenancy? tenancy;

  /// The devices and operating systems that users can use to access WorkSpaces.
  final WorkspaceAccessProperties? workspaceAccessProperties;

  /// The default creation properties for all WorkSpaces in the directory.
  final DefaultWorkspaceCreationProperties? workspaceCreationProperties;

  /// The identifier of the security group that is assigned to new WorkSpaces.
  final String? workspaceSecurityGroupId;

  /// The identifiers of the IP access control groups associated with the
  /// directory.
  final List<String>? ipGroupIds;

  WorkspaceDirectory({
    this.alias,
    this.certificateBasedAuthProperties,
    this.customerUserName,
    this.directoryId,
    this.directoryName,
    this.directoryType,
    this.dnsIpAddresses,
    this.iamRoleId,
    this.registrationCode,
    this.samlProperties,
    this.selfservicePermissions,
    this.state,
    this.subnetIds,
    this.tenancy,
    this.workspaceAccessProperties,
    this.workspaceCreationProperties,
    this.workspaceSecurityGroupId,
    this.ipGroupIds,
  });

  factory WorkspaceDirectory.fromJson(Map<String, dynamic> json) {
    return WorkspaceDirectory(
      alias: json['Alias'] as String?,
      certificateBasedAuthProperties: json['CertificateBasedAuthProperties'] !=
              null
          ? CertificateBasedAuthProperties.fromJson(
              json['CertificateBasedAuthProperties'] as Map<String, dynamic>)
          : null,
      customerUserName: json['CustomerUserName'] as String?,
      directoryId: json['DirectoryId'] as String?,
      directoryName: json['DirectoryName'] as String?,
      directoryType:
          (json['DirectoryType'] as String?)?.toWorkspaceDirectoryType(),
      dnsIpAddresses: (json['DnsIpAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      iamRoleId: json['IamRoleId'] as String?,
      registrationCode: json['RegistrationCode'] as String?,
      samlProperties: json['SamlProperties'] != null
          ? SamlProperties.fromJson(
              json['SamlProperties'] as Map<String, dynamic>)
          : null,
      selfservicePermissions: json['SelfservicePermissions'] != null
          ? SelfservicePermissions.fromJson(
              json['SelfservicePermissions'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.toWorkspaceDirectoryState(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tenancy: (json['Tenancy'] as String?)?.toTenancy(),
      workspaceAccessProperties: json['WorkspaceAccessProperties'] != null
          ? WorkspaceAccessProperties.fromJson(
              json['WorkspaceAccessProperties'] as Map<String, dynamic>)
          : null,
      workspaceCreationProperties: json['WorkspaceCreationProperties'] != null
          ? DefaultWorkspaceCreationProperties.fromJson(
              json['WorkspaceCreationProperties'] as Map<String, dynamic>)
          : null,
      workspaceSecurityGroupId: json['WorkspaceSecurityGroupId'] as String?,
      ipGroupIds: (json['ipGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final certificateBasedAuthProperties = this.certificateBasedAuthProperties;
    final customerUserName = this.customerUserName;
    final directoryId = this.directoryId;
    final directoryName = this.directoryName;
    final directoryType = this.directoryType;
    final dnsIpAddresses = this.dnsIpAddresses;
    final iamRoleId = this.iamRoleId;
    final registrationCode = this.registrationCode;
    final samlProperties = this.samlProperties;
    final selfservicePermissions = this.selfservicePermissions;
    final state = this.state;
    final subnetIds = this.subnetIds;
    final tenancy = this.tenancy;
    final workspaceAccessProperties = this.workspaceAccessProperties;
    final workspaceCreationProperties = this.workspaceCreationProperties;
    final workspaceSecurityGroupId = this.workspaceSecurityGroupId;
    final ipGroupIds = this.ipGroupIds;
    return {
      if (alias != null) 'Alias': alias,
      if (certificateBasedAuthProperties != null)
        'CertificateBasedAuthProperties': certificateBasedAuthProperties,
      if (customerUserName != null) 'CustomerUserName': customerUserName,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (directoryName != null) 'DirectoryName': directoryName,
      if (directoryType != null) 'DirectoryType': directoryType.toValue(),
      if (dnsIpAddresses != null) 'DnsIpAddresses': dnsIpAddresses,
      if (iamRoleId != null) 'IamRoleId': iamRoleId,
      if (registrationCode != null) 'RegistrationCode': registrationCode,
      if (samlProperties != null) 'SamlProperties': samlProperties,
      if (selfservicePermissions != null)
        'SelfservicePermissions': selfservicePermissions,
      if (state != null) 'State': state.toValue(),
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (tenancy != null) 'Tenancy': tenancy.toValue(),
      if (workspaceAccessProperties != null)
        'WorkspaceAccessProperties': workspaceAccessProperties,
      if (workspaceCreationProperties != null)
        'WorkspaceCreationProperties': workspaceCreationProperties,
      if (workspaceSecurityGroupId != null)
        'WorkspaceSecurityGroupId': workspaceSecurityGroupId,
      if (ipGroupIds != null) 'ipGroupIds': ipGroupIds,
    };
  }
}

enum WorkspaceDirectoryState {
  registering,
  registered,
  deregistering,
  deregistered,
  error,
}

extension WorkspaceDirectoryStateValueExtension on WorkspaceDirectoryState {
  String toValue() {
    switch (this) {
      case WorkspaceDirectoryState.registering:
        return 'REGISTERING';
      case WorkspaceDirectoryState.registered:
        return 'REGISTERED';
      case WorkspaceDirectoryState.deregistering:
        return 'DEREGISTERING';
      case WorkspaceDirectoryState.deregistered:
        return 'DEREGISTERED';
      case WorkspaceDirectoryState.error:
        return 'ERROR';
    }
  }
}

extension WorkspaceDirectoryStateFromString on String {
  WorkspaceDirectoryState toWorkspaceDirectoryState() {
    switch (this) {
      case 'REGISTERING':
        return WorkspaceDirectoryState.registering;
      case 'REGISTERED':
        return WorkspaceDirectoryState.registered;
      case 'DEREGISTERING':
        return WorkspaceDirectoryState.deregistering;
      case 'DEREGISTERED':
        return WorkspaceDirectoryState.deregistered;
      case 'ERROR':
        return WorkspaceDirectoryState.error;
    }
    throw Exception('$this is not known in enum WorkspaceDirectoryState');
  }
}

enum WorkspaceDirectoryType {
  simpleAd,
  adConnector,
}

extension WorkspaceDirectoryTypeValueExtension on WorkspaceDirectoryType {
  String toValue() {
    switch (this) {
      case WorkspaceDirectoryType.simpleAd:
        return 'SIMPLE_AD';
      case WorkspaceDirectoryType.adConnector:
        return 'AD_CONNECTOR';
    }
  }
}

extension WorkspaceDirectoryTypeFromString on String {
  WorkspaceDirectoryType toWorkspaceDirectoryType() {
    switch (this) {
      case 'SIMPLE_AD':
        return WorkspaceDirectoryType.simpleAd;
      case 'AD_CONNECTOR':
        return WorkspaceDirectoryType.adConnector;
    }
    throw Exception('$this is not known in enum WorkspaceDirectoryType');
  }
}

/// Describes a WorkSpace image.
class WorkspaceImage {
  /// The date when the image was created. If the image has been shared, the
  /// Amazon Web Services account that the image has been shared with sees the
  /// original creation date of the image.
  final DateTime? created;

  /// The description of the image.
  final String? description;

  /// The error code that is returned for the image.
  final String? errorCode;

  /// Additional details of the error returned for the image, including the
  /// possible causes of the errors and troubleshooting information.
  final List<ErrorDetails>? errorDetails;

  /// The text of the error message that is returned for the image.
  final String? errorMessage;

  /// The identifier of the image.
  final String? imageId;

  /// The name of the image.
  final String? name;

  /// The operating system that the image is running.
  final OperatingSystem? operatingSystem;

  /// The identifier of the Amazon Web Services account that owns the image.
  final String? ownerAccountId;

  /// Specifies whether the image is running on dedicated hardware. When Bring
  /// Your Own License (BYOL) is enabled, this value is set to
  /// <code>DEDICATED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html">Bring
  /// Your Own Windows Desktop Images</a>.
  final WorkspaceImageRequiredTenancy? requiredTenancy;

  /// The status of the image.
  final WorkspaceImageState? state;

  /// The updates (if any) that are available for the specified image.
  final UpdateResult? updates;

  WorkspaceImage({
    this.created,
    this.description,
    this.errorCode,
    this.errorDetails,
    this.errorMessage,
    this.imageId,
    this.name,
    this.operatingSystem,
    this.ownerAccountId,
    this.requiredTenancy,
    this.state,
    this.updates,
  });

  factory WorkspaceImage.fromJson(Map<String, dynamic> json) {
    return WorkspaceImage(
      created: timeStampFromJson(json['Created']),
      description: json['Description'] as String?,
      errorCode: json['ErrorCode'] as String?,
      errorDetails: (json['ErrorDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['ErrorMessage'] as String?,
      imageId: json['ImageId'] as String?,
      name: json['Name'] as String?,
      operatingSystem: json['OperatingSystem'] != null
          ? OperatingSystem.fromJson(
              json['OperatingSystem'] as Map<String, dynamic>)
          : null,
      ownerAccountId: json['OwnerAccountId'] as String?,
      requiredTenancy: (json['RequiredTenancy'] as String?)
          ?.toWorkspaceImageRequiredTenancy(),
      state: (json['State'] as String?)?.toWorkspaceImageState(),
      updates: json['Updates'] != null
          ? UpdateResult.fromJson(json['Updates'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final description = this.description;
    final errorCode = this.errorCode;
    final errorDetails = this.errorDetails;
    final errorMessage = this.errorMessage;
    final imageId = this.imageId;
    final name = this.name;
    final operatingSystem = this.operatingSystem;
    final ownerAccountId = this.ownerAccountId;
    final requiredTenancy = this.requiredTenancy;
    final state = this.state;
    final updates = this.updates;
    return {
      if (created != null) 'Created': unixTimestampToJson(created),
      if (description != null) 'Description': description,
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (imageId != null) 'ImageId': imageId,
      if (name != null) 'Name': name,
      if (operatingSystem != null) 'OperatingSystem': operatingSystem,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (requiredTenancy != null) 'RequiredTenancy': requiredTenancy.toValue(),
      if (state != null) 'State': state.toValue(),
      if (updates != null) 'Updates': updates,
    };
  }
}

enum WorkspaceImageErrorDetailCode {
  outdatedPowershellVersion,
  officeInstalled,
  pCoIPAgentInstalled,
  windowsUpdatesEnabled,
  autoMountDisabled,
  workspacesBYOLAccountNotFound,
  workspacesBYOLAccountDisabled,
  dHCPDisabled,
  diskFreeSpace,
  additionalDrivesAttached,
  oSNotSupported,
  domainJoined,
  azureDomainJoined,
  firewallEnabled,
  vMWareToolsInstalled,
  diskSizeExceeded,
  incompatiblePartitioning,
  pendingReboot,
  autoLogonEnabled,
  realTimeUniversalDisabled,
  multipleBootPartition,
  requires64BitOS,
  zeroRearmCount,
  inPlaceUpgrade,
  antiVirusInstalled,
  uEFINotSupported,
}

extension WorkspaceImageErrorDetailCodeValueExtension
    on WorkspaceImageErrorDetailCode {
  String toValue() {
    switch (this) {
      case WorkspaceImageErrorDetailCode.outdatedPowershellVersion:
        return 'OutdatedPowershellVersion';
      case WorkspaceImageErrorDetailCode.officeInstalled:
        return 'OfficeInstalled';
      case WorkspaceImageErrorDetailCode.pCoIPAgentInstalled:
        return 'PCoIPAgentInstalled';
      case WorkspaceImageErrorDetailCode.windowsUpdatesEnabled:
        return 'WindowsUpdatesEnabled';
      case WorkspaceImageErrorDetailCode.autoMountDisabled:
        return 'AutoMountDisabled';
      case WorkspaceImageErrorDetailCode.workspacesBYOLAccountNotFound:
        return 'WorkspacesBYOLAccountNotFound';
      case WorkspaceImageErrorDetailCode.workspacesBYOLAccountDisabled:
        return 'WorkspacesBYOLAccountDisabled';
      case WorkspaceImageErrorDetailCode.dHCPDisabled:
        return 'DHCPDisabled';
      case WorkspaceImageErrorDetailCode.diskFreeSpace:
        return 'DiskFreeSpace';
      case WorkspaceImageErrorDetailCode.additionalDrivesAttached:
        return 'AdditionalDrivesAttached';
      case WorkspaceImageErrorDetailCode.oSNotSupported:
        return 'OSNotSupported';
      case WorkspaceImageErrorDetailCode.domainJoined:
        return 'DomainJoined';
      case WorkspaceImageErrorDetailCode.azureDomainJoined:
        return 'AzureDomainJoined';
      case WorkspaceImageErrorDetailCode.firewallEnabled:
        return 'FirewallEnabled';
      case WorkspaceImageErrorDetailCode.vMWareToolsInstalled:
        return 'VMWareToolsInstalled';
      case WorkspaceImageErrorDetailCode.diskSizeExceeded:
        return 'DiskSizeExceeded';
      case WorkspaceImageErrorDetailCode.incompatiblePartitioning:
        return 'IncompatiblePartitioning';
      case WorkspaceImageErrorDetailCode.pendingReboot:
        return 'PendingReboot';
      case WorkspaceImageErrorDetailCode.autoLogonEnabled:
        return 'AutoLogonEnabled';
      case WorkspaceImageErrorDetailCode.realTimeUniversalDisabled:
        return 'RealTimeUniversalDisabled';
      case WorkspaceImageErrorDetailCode.multipleBootPartition:
        return 'MultipleBootPartition';
      case WorkspaceImageErrorDetailCode.requires64BitOS:
        return 'Requires64BitOS';
      case WorkspaceImageErrorDetailCode.zeroRearmCount:
        return 'ZeroRearmCount';
      case WorkspaceImageErrorDetailCode.inPlaceUpgrade:
        return 'InPlaceUpgrade';
      case WorkspaceImageErrorDetailCode.antiVirusInstalled:
        return 'AntiVirusInstalled';
      case WorkspaceImageErrorDetailCode.uEFINotSupported:
        return 'UEFINotSupported';
    }
  }
}

extension WorkspaceImageErrorDetailCodeFromString on String {
  WorkspaceImageErrorDetailCode toWorkspaceImageErrorDetailCode() {
    switch (this) {
      case 'OutdatedPowershellVersion':
        return WorkspaceImageErrorDetailCode.outdatedPowershellVersion;
      case 'OfficeInstalled':
        return WorkspaceImageErrorDetailCode.officeInstalled;
      case 'PCoIPAgentInstalled':
        return WorkspaceImageErrorDetailCode.pCoIPAgentInstalled;
      case 'WindowsUpdatesEnabled':
        return WorkspaceImageErrorDetailCode.windowsUpdatesEnabled;
      case 'AutoMountDisabled':
        return WorkspaceImageErrorDetailCode.autoMountDisabled;
      case 'WorkspacesBYOLAccountNotFound':
        return WorkspaceImageErrorDetailCode.workspacesBYOLAccountNotFound;
      case 'WorkspacesBYOLAccountDisabled':
        return WorkspaceImageErrorDetailCode.workspacesBYOLAccountDisabled;
      case 'DHCPDisabled':
        return WorkspaceImageErrorDetailCode.dHCPDisabled;
      case 'DiskFreeSpace':
        return WorkspaceImageErrorDetailCode.diskFreeSpace;
      case 'AdditionalDrivesAttached':
        return WorkspaceImageErrorDetailCode.additionalDrivesAttached;
      case 'OSNotSupported':
        return WorkspaceImageErrorDetailCode.oSNotSupported;
      case 'DomainJoined':
        return WorkspaceImageErrorDetailCode.domainJoined;
      case 'AzureDomainJoined':
        return WorkspaceImageErrorDetailCode.azureDomainJoined;
      case 'FirewallEnabled':
        return WorkspaceImageErrorDetailCode.firewallEnabled;
      case 'VMWareToolsInstalled':
        return WorkspaceImageErrorDetailCode.vMWareToolsInstalled;
      case 'DiskSizeExceeded':
        return WorkspaceImageErrorDetailCode.diskSizeExceeded;
      case 'IncompatiblePartitioning':
        return WorkspaceImageErrorDetailCode.incompatiblePartitioning;
      case 'PendingReboot':
        return WorkspaceImageErrorDetailCode.pendingReboot;
      case 'AutoLogonEnabled':
        return WorkspaceImageErrorDetailCode.autoLogonEnabled;
      case 'RealTimeUniversalDisabled':
        return WorkspaceImageErrorDetailCode.realTimeUniversalDisabled;
      case 'MultipleBootPartition':
        return WorkspaceImageErrorDetailCode.multipleBootPartition;
      case 'Requires64BitOS':
        return WorkspaceImageErrorDetailCode.requires64BitOS;
      case 'ZeroRearmCount':
        return WorkspaceImageErrorDetailCode.zeroRearmCount;
      case 'InPlaceUpgrade':
        return WorkspaceImageErrorDetailCode.inPlaceUpgrade;
      case 'AntiVirusInstalled':
        return WorkspaceImageErrorDetailCode.antiVirusInstalled;
      case 'UEFINotSupported':
        return WorkspaceImageErrorDetailCode.uEFINotSupported;
    }
    throw Exception('$this is not known in enum WorkspaceImageErrorDetailCode');
  }
}

enum WorkspaceImageIngestionProcess {
  byolRegular,
  byolGraphics,
  byolGraphicspro,
  byolGraphicsG4dn,
  byolRegularWsp,
  byolRegularByop,
  byolGraphicsG4dnByop,
}

extension WorkspaceImageIngestionProcessValueExtension
    on WorkspaceImageIngestionProcess {
  String toValue() {
    switch (this) {
      case WorkspaceImageIngestionProcess.byolRegular:
        return 'BYOL_REGULAR';
      case WorkspaceImageIngestionProcess.byolGraphics:
        return 'BYOL_GRAPHICS';
      case WorkspaceImageIngestionProcess.byolGraphicspro:
        return 'BYOL_GRAPHICSPRO';
      case WorkspaceImageIngestionProcess.byolGraphicsG4dn:
        return 'BYOL_GRAPHICS_G4DN';
      case WorkspaceImageIngestionProcess.byolRegularWsp:
        return 'BYOL_REGULAR_WSP';
      case WorkspaceImageIngestionProcess.byolRegularByop:
        return 'BYOL_REGULAR_BYOP';
      case WorkspaceImageIngestionProcess.byolGraphicsG4dnByop:
        return 'BYOL_GRAPHICS_G4DN_BYOP';
    }
  }
}

extension WorkspaceImageIngestionProcessFromString on String {
  WorkspaceImageIngestionProcess toWorkspaceImageIngestionProcess() {
    switch (this) {
      case 'BYOL_REGULAR':
        return WorkspaceImageIngestionProcess.byolRegular;
      case 'BYOL_GRAPHICS':
        return WorkspaceImageIngestionProcess.byolGraphics;
      case 'BYOL_GRAPHICSPRO':
        return WorkspaceImageIngestionProcess.byolGraphicspro;
      case 'BYOL_GRAPHICS_G4DN':
        return WorkspaceImageIngestionProcess.byolGraphicsG4dn;
      case 'BYOL_REGULAR_WSP':
        return WorkspaceImageIngestionProcess.byolRegularWsp;
      case 'BYOL_REGULAR_BYOP':
        return WorkspaceImageIngestionProcess.byolRegularByop;
      case 'BYOL_GRAPHICS_G4DN_BYOP':
        return WorkspaceImageIngestionProcess.byolGraphicsG4dnByop;
    }
    throw Exception(
        '$this is not known in enum WorkspaceImageIngestionProcess');
  }
}

enum WorkspaceImageRequiredTenancy {
  $default,
  dedicated,
}

extension WorkspaceImageRequiredTenancyValueExtension
    on WorkspaceImageRequiredTenancy {
  String toValue() {
    switch (this) {
      case WorkspaceImageRequiredTenancy.$default:
        return 'DEFAULT';
      case WorkspaceImageRequiredTenancy.dedicated:
        return 'DEDICATED';
    }
  }
}

extension WorkspaceImageRequiredTenancyFromString on String {
  WorkspaceImageRequiredTenancy toWorkspaceImageRequiredTenancy() {
    switch (this) {
      case 'DEFAULT':
        return WorkspaceImageRequiredTenancy.$default;
      case 'DEDICATED':
        return WorkspaceImageRequiredTenancy.dedicated;
    }
    throw Exception('$this is not known in enum WorkspaceImageRequiredTenancy');
  }
}

enum WorkspaceImageState {
  available,
  pending,
  error,
}

extension WorkspaceImageStateValueExtension on WorkspaceImageState {
  String toValue() {
    switch (this) {
      case WorkspaceImageState.available:
        return 'AVAILABLE';
      case WorkspaceImageState.pending:
        return 'PENDING';
      case WorkspaceImageState.error:
        return 'ERROR';
    }
  }
}

extension WorkspaceImageStateFromString on String {
  WorkspaceImageState toWorkspaceImageState() {
    switch (this) {
      case 'AVAILABLE':
        return WorkspaceImageState.available;
      case 'PENDING':
        return WorkspaceImageState.pending;
      case 'ERROR':
        return WorkspaceImageState.error;
    }
    throw Exception('$this is not known in enum WorkspaceImageState');
  }
}

/// Describes a WorkSpace.
class WorkspaceProperties {
  /// The compute type. For more information, see <a
  /// href="http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles">Amazon
  /// WorkSpaces Bundles</a>.
  final Compute? computeTypeName;

  /// The name of the operating system.
  final OperatingSystemName? operatingSystemName;

  /// The protocol. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces-protocols.html">
  /// Protocols for Amazon WorkSpaces</a>.
  /// <note>
  /// <ul>
  /// <li>
  /// Only available for WorkSpaces created with PCoIP bundles.
  /// </li>
  /// <li>
  /// The <code>Protocols</code> property is case sensitive. Ensure you use
  /// <code>PCOIP</code> or <code>WSP</code>.
  /// </li>
  /// <li>
  /// Unavailable for Windows 7 WorkSpaces and WorkSpaces using GPU-based bundles
  /// (Graphics, GraphicsPro, Graphics.g4dn, and GraphicsPro.g4dn).
  /// </li>
  /// </ul> </note>
  final List<Protocol>? protocols;

  /// The size of the root volume. For important information about how to modify
  /// the size of the root and user volumes, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html">Modify
  /// a WorkSpace</a>.
  final int? rootVolumeSizeGib;

  /// The running mode. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/running-mode.html">Manage
  /// the WorkSpace Running Mode</a>.
  /// <note>
  /// The <code>MANUAL</code> value is only supported by Amazon WorkSpaces Core.
  /// Contact your account team to be allow-listed to use this value. For more
  /// information, see <a href="http://aws.amazon.com/workspaces/core/">Amazon
  /// WorkSpaces Core</a>.
  /// </note>
  final RunningMode? runningMode;

  /// The time after a user logs off when WorkSpaces are automatically stopped.
  /// Configured in 60-minute intervals.
  final int? runningModeAutoStopTimeoutInMinutes;

  /// The size of the user storage. For important information about how to modify
  /// the size of the root and user volumes, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html">Modify
  /// a WorkSpace</a>.
  final int? userVolumeSizeGib;

  WorkspaceProperties({
    this.computeTypeName,
    this.operatingSystemName,
    this.protocols,
    this.rootVolumeSizeGib,
    this.runningMode,
    this.runningModeAutoStopTimeoutInMinutes,
    this.userVolumeSizeGib,
  });

  factory WorkspaceProperties.fromJson(Map<String, dynamic> json) {
    return WorkspaceProperties(
      computeTypeName: (json['ComputeTypeName'] as String?)?.toCompute(),
      operatingSystemName:
          (json['OperatingSystemName'] as String?)?.toOperatingSystemName(),
      protocols: (json['Protocols'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toProtocol())
          .toList(),
      rootVolumeSizeGib: json['RootVolumeSizeGib'] as int?,
      runningMode: (json['RunningMode'] as String?)?.toRunningMode(),
      runningModeAutoStopTimeoutInMinutes:
          json['RunningModeAutoStopTimeoutInMinutes'] as int?,
      userVolumeSizeGib: json['UserVolumeSizeGib'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeTypeName = this.computeTypeName;
    final operatingSystemName = this.operatingSystemName;
    final protocols = this.protocols;
    final rootVolumeSizeGib = this.rootVolumeSizeGib;
    final runningMode = this.runningMode;
    final runningModeAutoStopTimeoutInMinutes =
        this.runningModeAutoStopTimeoutInMinutes;
    final userVolumeSizeGib = this.userVolumeSizeGib;
    return {
      if (computeTypeName != null) 'ComputeTypeName': computeTypeName.toValue(),
      if (operatingSystemName != null)
        'OperatingSystemName': operatingSystemName.toValue(),
      if (protocols != null)
        'Protocols': protocols.map((e) => e.toValue()).toList(),
      if (rootVolumeSizeGib != null) 'RootVolumeSizeGib': rootVolumeSizeGib,
      if (runningMode != null) 'RunningMode': runningMode.toValue(),
      if (runningModeAutoStopTimeoutInMinutes != null)
        'RunningModeAutoStopTimeoutInMinutes':
            runningModeAutoStopTimeoutInMinutes,
      if (userVolumeSizeGib != null) 'UserVolumeSizeGib': userVolumeSizeGib,
    };
  }
}

/// Describes the information used to create a WorkSpace.
class WorkspaceRequest {
  /// The identifier of the bundle for the WorkSpace. You can use
  /// <a>DescribeWorkspaceBundles</a> to list the available bundles.
  final String bundleId;

  /// The identifier of the Directory Service directory for the WorkSpace. You can
  /// use <a>DescribeWorkspaceDirectories</a> to list the available directories.
  final String directoryId;

  /// The user name of the user for the WorkSpace. This user name must exist in
  /// the Directory Service directory for the WorkSpace.
  ///
  /// The reserved keyword, <code>[UNDEFINED]</code>, is used when creating
  /// user-decoupled WorkSpaces.
  final String userName;

  /// Indicates whether the data stored on the root volume is encrypted.
  final bool? rootVolumeEncryptionEnabled;

  /// The tags for the WorkSpace.
  final List<Tag>? tags;

  /// Indicates whether the data stored on the user volume is encrypted.
  final bool? userVolumeEncryptionEnabled;

  /// The ARN of the symmetric KMS key used to encrypt data stored on your
  /// WorkSpace. Amazon WorkSpaces does not support asymmetric KMS keys.
  final String? volumeEncryptionKey;

  /// The name of the user-decoupled WorkSpace.
  final String? workspaceName;

  /// The WorkSpace properties.
  final WorkspaceProperties? workspaceProperties;

  WorkspaceRequest({
    required this.bundleId,
    required this.directoryId,
    required this.userName,
    this.rootVolumeEncryptionEnabled,
    this.tags,
    this.userVolumeEncryptionEnabled,
    this.volumeEncryptionKey,
    this.workspaceName,
    this.workspaceProperties,
  });

  factory WorkspaceRequest.fromJson(Map<String, dynamic> json) {
    return WorkspaceRequest(
      bundleId: json['BundleId'] as String,
      directoryId: json['DirectoryId'] as String,
      userName: json['UserName'] as String,
      rootVolumeEncryptionEnabled: json['RootVolumeEncryptionEnabled'] as bool?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      userVolumeEncryptionEnabled: json['UserVolumeEncryptionEnabled'] as bool?,
      volumeEncryptionKey: json['VolumeEncryptionKey'] as String?,
      workspaceName: json['WorkspaceName'] as String?,
      workspaceProperties: json['WorkspaceProperties'] != null
          ? WorkspaceProperties.fromJson(
              json['WorkspaceProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final directoryId = this.directoryId;
    final userName = this.userName;
    final rootVolumeEncryptionEnabled = this.rootVolumeEncryptionEnabled;
    final tags = this.tags;
    final userVolumeEncryptionEnabled = this.userVolumeEncryptionEnabled;
    final volumeEncryptionKey = this.volumeEncryptionKey;
    final workspaceName = this.workspaceName;
    final workspaceProperties = this.workspaceProperties;
    return {
      'BundleId': bundleId,
      'DirectoryId': directoryId,
      'UserName': userName,
      if (rootVolumeEncryptionEnabled != null)
        'RootVolumeEncryptionEnabled': rootVolumeEncryptionEnabled,
      if (tags != null) 'Tags': tags,
      if (userVolumeEncryptionEnabled != null)
        'UserVolumeEncryptionEnabled': userVolumeEncryptionEnabled,
      if (volumeEncryptionKey != null)
        'VolumeEncryptionKey': volumeEncryptionKey,
      if (workspaceName != null) 'WorkspaceName': workspaceName,
      if (workspaceProperties != null)
        'WorkspaceProperties': workspaceProperties,
    };
  }
}

/// Describes the association between an application and a WorkSpace resource.
class WorkspaceResourceAssociation {
  /// The identifier of the associated resource.
  final String? associatedResourceId;

  /// The resource types of the associated resource.
  final WorkSpaceAssociatedResourceType? associatedResourceType;

  /// The time the association is created.
  final DateTime? created;

  /// The time the association status was last updated.
  final DateTime? lastUpdatedTime;

  /// The status of the WorkSpace resource association.
  final AssociationState? state;

  /// The reason the association deployment failed.
  final AssociationStateReason? stateReason;

  /// The identifier of the WorkSpace.
  final String? workspaceId;

  WorkspaceResourceAssociation({
    this.associatedResourceId,
    this.associatedResourceType,
    this.created,
    this.lastUpdatedTime,
    this.state,
    this.stateReason,
    this.workspaceId,
  });

  factory WorkspaceResourceAssociation.fromJson(Map<String, dynamic> json) {
    return WorkspaceResourceAssociation(
      associatedResourceId: json['AssociatedResourceId'] as String?,
      associatedResourceType: (json['AssociatedResourceType'] as String?)
          ?.toWorkSpaceAssociatedResourceType(),
      created: timeStampFromJson(json['Created']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      state: (json['State'] as String?)?.toAssociationState(),
      stateReason: json['StateReason'] != null
          ? AssociationStateReason.fromJson(
              json['StateReason'] as Map<String, dynamic>)
          : null,
      workspaceId: json['WorkspaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedResourceId = this.associatedResourceId;
    final associatedResourceType = this.associatedResourceType;
    final created = this.created;
    final lastUpdatedTime = this.lastUpdatedTime;
    final state = this.state;
    final stateReason = this.stateReason;
    final workspaceId = this.workspaceId;
    return {
      if (associatedResourceId != null)
        'AssociatedResourceId': associatedResourceId,
      if (associatedResourceType != null)
        'AssociatedResourceType': associatedResourceType.toValue(),
      if (created != null) 'Created': unixTimestampToJson(created),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
      if (workspaceId != null) 'WorkspaceId': workspaceId,
    };
  }
}

enum WorkspaceState {
  pending,
  available,
  impaired,
  unhealthy,
  rebooting,
  starting,
  rebuilding,
  restoring,
  maintenance,
  adminMaintenance,
  terminating,
  terminated,
  suspended,
  updating,
  stopping,
  stopped,
  error,
}

extension WorkspaceStateValueExtension on WorkspaceState {
  String toValue() {
    switch (this) {
      case WorkspaceState.pending:
        return 'PENDING';
      case WorkspaceState.available:
        return 'AVAILABLE';
      case WorkspaceState.impaired:
        return 'IMPAIRED';
      case WorkspaceState.unhealthy:
        return 'UNHEALTHY';
      case WorkspaceState.rebooting:
        return 'REBOOTING';
      case WorkspaceState.starting:
        return 'STARTING';
      case WorkspaceState.rebuilding:
        return 'REBUILDING';
      case WorkspaceState.restoring:
        return 'RESTORING';
      case WorkspaceState.maintenance:
        return 'MAINTENANCE';
      case WorkspaceState.adminMaintenance:
        return 'ADMIN_MAINTENANCE';
      case WorkspaceState.terminating:
        return 'TERMINATING';
      case WorkspaceState.terminated:
        return 'TERMINATED';
      case WorkspaceState.suspended:
        return 'SUSPENDED';
      case WorkspaceState.updating:
        return 'UPDATING';
      case WorkspaceState.stopping:
        return 'STOPPING';
      case WorkspaceState.stopped:
        return 'STOPPED';
      case WorkspaceState.error:
        return 'ERROR';
    }
  }
}

extension WorkspaceStateFromString on String {
  WorkspaceState toWorkspaceState() {
    switch (this) {
      case 'PENDING':
        return WorkspaceState.pending;
      case 'AVAILABLE':
        return WorkspaceState.available;
      case 'IMPAIRED':
        return WorkspaceState.impaired;
      case 'UNHEALTHY':
        return WorkspaceState.unhealthy;
      case 'REBOOTING':
        return WorkspaceState.rebooting;
      case 'STARTING':
        return WorkspaceState.starting;
      case 'REBUILDING':
        return WorkspaceState.rebuilding;
      case 'RESTORING':
        return WorkspaceState.restoring;
      case 'MAINTENANCE':
        return WorkspaceState.maintenance;
      case 'ADMIN_MAINTENANCE':
        return WorkspaceState.adminMaintenance;
      case 'TERMINATING':
        return WorkspaceState.terminating;
      case 'TERMINATED':
        return WorkspaceState.terminated;
      case 'SUSPENDED':
        return WorkspaceState.suspended;
      case 'UPDATING':
        return WorkspaceState.updating;
      case 'STOPPING':
        return WorkspaceState.stopping;
      case 'STOPPED':
        return WorkspaceState.stopped;
      case 'ERROR':
        return WorkspaceState.error;
    }
    throw Exception('$this is not known in enum WorkspaceState');
  }
}

/// Describes an IP access control group.
class WorkspacesIpGroup {
  /// The description of the group.
  final String? groupDesc;

  /// The identifier of the group.
  final String? groupId;

  /// The name of the group.
  final String? groupName;

  /// The rules.
  final List<IpRuleItem>? userRules;

  WorkspacesIpGroup({
    this.groupDesc,
    this.groupId,
    this.groupName,
    this.userRules,
  });

  factory WorkspacesIpGroup.fromJson(Map<String, dynamic> json) {
    return WorkspacesIpGroup(
      groupDesc: json['groupDesc'] as String?,
      groupId: json['groupId'] as String?,
      groupName: json['groupName'] as String?,
      userRules: (json['userRules'] as List?)
          ?.whereNotNull()
          .map((e) => IpRuleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupDesc = this.groupDesc;
    final groupId = this.groupId;
    final groupName = this.groupName;
    final userRules = this.userRules;
    return {
      if (groupDesc != null) 'groupDesc': groupDesc,
      if (groupId != null) 'groupId': groupId,
      if (groupName != null) 'groupName': groupName,
      if (userRules != null) 'userRules': userRules,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ApplicationNotSupportedException extends _s.GenericAwsException {
  ApplicationNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'ApplicationNotSupportedException',
            message: message);
}

class ComputeNotCompatibleException extends _s.GenericAwsException {
  ComputeNotCompatibleException({String? type, String? message})
      : super(
            type: type,
            code: 'ComputeNotCompatibleException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class IncompatibleApplicationsException extends _s.GenericAwsException {
  IncompatibleApplicationsException({String? type, String? message})
      : super(
            type: type,
            code: 'IncompatibleApplicationsException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidParameterValuesException extends _s.GenericAwsException {
  InvalidParameterValuesException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValuesException',
            message: message);
}

class InvalidResourceStateException extends _s.GenericAwsException {
  InvalidResourceStateException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidResourceStateException',
            message: message);
}

class OperatingSystemNotCompatibleException extends _s.GenericAwsException {
  OperatingSystemNotCompatibleException({String? type, String? message})
      : super(
            type: type,
            code: 'OperatingSystemNotCompatibleException',
            message: message);
}

class OperationInProgressException extends _s.GenericAwsException {
  OperationInProgressException({String? type, String? message})
      : super(
            type: type, code: 'OperationInProgressException', message: message);
}

class OperationNotSupportedException extends _s.GenericAwsException {
  OperationNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotSupportedException',
            message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceAssociatedException extends _s.GenericAwsException {
  ResourceAssociatedException({String? type, String? message})
      : super(
            type: type, code: 'ResourceAssociatedException', message: message);
}

class ResourceCreationFailedException extends _s.GenericAwsException {
  ResourceCreationFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceCreationFailedException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class UnsupportedNetworkConfigurationException extends _s.GenericAwsException {
  UnsupportedNetworkConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedNetworkConfigurationException',
            message: message);
}

class UnsupportedWorkspaceConfigurationException
    extends _s.GenericAwsException {
  UnsupportedWorkspaceConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedWorkspaceConfigurationException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

class WorkspacesDefaultRoleNotFoundException extends _s.GenericAwsException {
  WorkspacesDefaultRoleNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'WorkspacesDefaultRoleNotFoundException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ApplicationNotSupportedException': (type, message) =>
      ApplicationNotSupportedException(type: type, message: message),
  'ComputeNotCompatibleException': (type, message) =>
      ComputeNotCompatibleException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'IncompatibleApplicationsException': (type, message) =>
      IncompatibleApplicationsException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidParameterValuesException': (type, message) =>
      InvalidParameterValuesException(type: type, message: message),
  'InvalidResourceStateException': (type, message) =>
      InvalidResourceStateException(type: type, message: message),
  'OperatingSystemNotCompatibleException': (type, message) =>
      OperatingSystemNotCompatibleException(type: type, message: message),
  'OperationInProgressException': (type, message) =>
      OperationInProgressException(type: type, message: message),
  'OperationNotSupportedException': (type, message) =>
      OperationNotSupportedException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceAssociatedException': (type, message) =>
      ResourceAssociatedException(type: type, message: message),
  'ResourceCreationFailedException': (type, message) =>
      ResourceCreationFailedException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'UnsupportedNetworkConfigurationException': (type, message) =>
      UnsupportedNetworkConfigurationException(type: type, message: message),
  'UnsupportedWorkspaceConfigurationException': (type, message) =>
      UnsupportedWorkspaceConfigurationException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
  'WorkspacesDefaultRoleNotFoundException': (type, message) =>
      WorkspacesDefaultRoleNotFoundException(type: type, message: message),
};
