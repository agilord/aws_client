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

part '2015-04-08.g.dart';

/// Amazon WorkSpaces enables you to provision virtual, cloud-based Microsoft
/// Windows and Amazon Linux desktops for your users.
class WorkSpaces {
  final _s.JsonProtocol _protocol;
  WorkSpaces({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workspaces',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String aliasId,
    @_s.required String resourceId,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    _s.validateStringLength(
      'aliasId',
      aliasId,
      13,
      68,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^wsca-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    @_s.required String directoryId,
    @_s.required List<String> groupIds,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringLength(
      'directoryId',
      directoryId,
      10,
      65,
      isRequired: true,
    );
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupIds, 'groupIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.AssociateIpGroups'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateIpGroupsResult.fromJson(jsonResponse.body);
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
    @_s.required String groupId,
    @_s.required List<IpRuleItem> userRules,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringPattern(
      'groupId',
      groupId,
      r'''wsipg-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userRules, 'userRules');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.AuthorizeIpRules'
    };
    final jsonResponse = await _protocol.send(
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

    return AuthorizeIpRulesResult.fromJson(jsonResponse.body);
  }

  /// Copies the specified image from the specified Region to the current
  /// Region. For more information about copying images, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/copy-custom-image.html">
  /// Copy a Custom WorkSpaces Image</a>.
  /// <note>
  /// In the China (Ningxia) Region, you can copy images only within the same
  /// Region.
  ///
  /// In the AWS GovCloud (US-West) Region, to copy images to and from other AWS
  /// Regions, contact AWS Support.
  /// </note> <important>
  /// Before copying a shared image, be sure to verify that it has been shared
  /// from the correct AWS account. To determine if an image has been shared and
  /// to see the AWS account ID that owns an image, use the <a
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
    @_s.required String name,
    @_s.required String sourceImageId,
    @_s.required String sourceRegion,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9_./()\\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceImageId, 'sourceImageId');
    _s.validateStringPattern(
      'sourceImageId',
      sourceImageId,
      r'''wsi-[0-9a-z]{9,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceRegion, 'sourceRegion');
    _s.validateStringLength(
      'sourceRegion',
      sourceRegion,
      1,
      31,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sourceRegion',
      sourceRegion,
      r'''^[-0-9a-z]{1,31}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[a-zA-Z0-9_./() -]+$''',
    );
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
  /// After you create a connection string, it is always associated to your AWS
  /// account. You cannot recreate the same connection string with a different
  /// account, even if you delete all instances of it from the original account.
  /// The connection string is globally reserved for your account.
  /// </important>
  ///
  /// Parameter [tags] :
  /// The tags to associate with the connection alias.
  Future<CreateConnectionAliasResult> createConnectionAlias({
    @_s.required String connectionString,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(connectionString, 'connectionString');
    _s.validateStringLength(
      'connectionString',
      connectionString,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'connectionString',
      connectionString,
      r'''^[.0-9a-zA-Z\-]{1,255}$''',
      isRequired: true,
    );
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
    @_s.required String groupName,
    String groupDesc,
    List<Tag> tags,
    List<IpRuleItem> userRules,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
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
    @_s.required String resourceId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.CreateTags'
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

    return CreateTagsResult.fromJson(jsonResponse.body);
  }

  /// Creates one or more WorkSpaces.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces are
  /// created.
  ///
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidParameterValuesException].
  ///
  /// Parameter [workspaces] :
  /// The WorkSpaces to create. You can specify up to 25 WorkSpaces.
  Future<CreateWorkspacesResult> createWorkspaces({
    @_s.required List<WorkspaceRequest> workspaces,
  }) async {
    ArgumentError.checkNotNull(workspaces, 'workspaces');
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
    @_s.required String aliasId,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    _s.validateStringLength(
      'aliasId',
      aliasId,
      13,
      68,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^wsca-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteConnectionAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
      },
    );

    return DeleteConnectionAliasResult.fromJson(jsonResponse.body);
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
    @_s.required String groupId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringPattern(
      'groupId',
      groupId,
      r'''wsipg-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteIpGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
      },
    );

    return DeleteIpGroupResult.fromJson(jsonResponse.body);
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
    @_s.required String resourceId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteTags'
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

    return DeleteTagsResult.fromJson(jsonResponse.body);
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
    @_s.required String imageId,
  }) async {
    ArgumentError.checkNotNull(imageId, 'imageId');
    _s.validateStringPattern(
      'imageId',
      imageId,
      r'''wsi-[0-9a-z]{9,63}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeleteWorkspaceImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImageId': imageId,
      },
    );

    return DeleteWorkspaceImageResult.fromJson(jsonResponse.body);
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
  /// href="http://aws.amazon.com/directoryservice/pricing/">AWS Directory
  /// Services pricing terms</a>.
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
    @_s.required String directoryId,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringLength(
      'directoryId',
      directoryId,
      10,
      65,
      isRequired: true,
    );
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{8,63}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DeregisterWorkspaceDirectory'
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

    return DeregisterWorkspaceDirectoryResult.fromJson(jsonResponse.body);
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
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
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
    @_s.required List<String> resourceIds,
  }) async {
    ArgumentError.checkNotNull(resourceIds, 'resourceIds');
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

  /// Describes the permissions that the owner of a connection alias has granted
  /// to another AWS account for the specified connection alias. For more
  /// information, see <a
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
    @_s.required String aliasId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    _s.validateStringLength(
      'aliasId',
      aliasId,
      13,
      68,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^wsca-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
    List<String> aliasIds,
    int limit,
    String nextToken,
    String resourceId,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1152921504606846976,
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
    List<String> groupIds,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
    @_s.required String resourceId,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// Specify <code>AMAZON</code> to describe the bundles provided by AWS or
  /// null to describe the bundles that belong to your account.
  Future<DescribeWorkspaceBundlesResult> describeWorkspaceBundles({
    List<String> bundleIds,
    String nextToken,
    String owner,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
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
    List<String> directoryIds,
    int limit,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
  /// AWS accounts for an image.
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
    @_s.required String imageId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(imageId, 'imageId');
    _s.validateStringPattern(
      'imageId',
      imageId,
      r'''wsi-[0-9a-z]{9,63}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
    List<String> imageIds,
    ImageType imageType,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
    @_s.required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringPattern(
      'workspaceId',
      workspaceId,
      r'''^ws-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
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
  Future<DescribeWorkspacesResult> describeWorkspaces({
    String bundleId,
    String directoryId,
    int limit,
    String nextToken,
    String userName,
    List<String> workspaceIds,
  }) async {
    _s.validateStringPattern(
      'bundleId',
      bundleId,
      r'''^wsb-[0-9a-z]{8,63}$''',
    );
    _s.validateStringLength(
      'directoryId',
      directoryId,
      10,
      65,
    );
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{8,63}$''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      63,
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
    String nextToken,
    List<String> workspaceIds,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
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
  /// in different AWS Regions. For more information, see <a
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
    @_s.required String aliasId,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    _s.validateStringLength(
      'aliasId',
      aliasId,
      13,
      68,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^wsca-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DisassociateConnectionAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasId': aliasId,
      },
    );

    return DisassociateConnectionAliasResult.fromJson(jsonResponse.body);
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
    @_s.required String directoryId,
    @_s.required List<String> groupIds,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringLength(
      'directoryId',
      directoryId,
      10,
      65,
      isRequired: true,
    );
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupIds, 'groupIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.DisassociateIpGroups'
    };
    final jsonResponse = await _protocol.send(
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

    return DisassociateIpGroupsResult.fromJson(jsonResponse.body);
  }

  /// Imports the specified Windows 10 Bring Your Own License (BYOL) image into
  /// Amazon WorkSpaces. The image must be an already licensed Amazon EC2 image
  /// that is in your AWS account, and you must own the image. For more
  /// information about creating BYOL images, see <a
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
  /// which protocol you want to use for your BYOL Workspace image, either PCoIP
  /// or WorkSpaces Streaming Protocol (WSP). To use WSP, specify a value that
  /// ends in <code>_WSP</code>. To use PCoIP, specify a value that does not end
  /// in <code>_WSP</code>.
  ///
  /// For non-GPU-enabled bundles (bundles other than Graphics or GraphicsPro),
  /// specify <code>BYOL_REGULAR</code> or <code>BYOL_REGULAR_WSP</code>,
  /// depending on the protocol.
  ///
  /// Parameter [applications] :
  /// If specified, the version of Microsoft Office to subscribe to. Valid only
  /// for Windows 10 BYOL images. For more information about subscribing to
  /// Office for BYOL images, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html">
  /// Bring Your Own Windows Desktop Licenses</a>.
  /// <note>
  /// Although this parameter is an array, only one item is allowed at this
  /// time.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tags. Each WorkSpaces resource can have a maximum of 50 tags.
  Future<ImportWorkspaceImageResult> importWorkspaceImage({
    @_s.required String ec2ImageId,
    @_s.required String imageDescription,
    @_s.required String imageName,
    @_s.required WorkspaceImageIngestionProcess ingestionProcess,
    List<Application> applications,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(ec2ImageId, 'ec2ImageId');
    _s.validateStringPattern(
      'ec2ImageId',
      ec2ImageId,
      r'''^ami\-([a-f0-9]{8}|[a-f0-9]{17})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(imageDescription, 'imageDescription');
    _s.validateStringLength(
      'imageDescription',
      imageDescription,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'imageDescription',
      imageDescription,
      r'''^[a-zA-Z0-9_./() -]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(imageName, 'imageName');
    _s.validateStringLength(
      'imageName',
      imageName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'imageName',
      imageName,
      r'''^[a-zA-Z0-9_./()\\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(ingestionProcess, 'ingestionProcess');
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
        'IngestionProcess': ingestionProcess?.toValue() ?? '',
        if (applications != null)
          'Applications': applications.map((e) => e?.toValue() ?? '').toList(),
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportWorkspaceImageResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of IP address ranges, specified as IPv4 CIDR blocks, that
  /// you can use for the network management interface when you enable Bring
  /// Your Own License (BYOL).
  ///
  /// This operation can be run only by AWS accounts that are enabled for BYOL.
  /// If your account isn't enabled for BYOL, you'll receive an
  /// <code>AccessDeniedException</code> error.
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
    @_s.required String managementCidrRangeConstraint,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        managementCidrRangeConstraint, 'managementCidrRangeConstraint');
    _s.validateStringPattern(
      'managementCidrRangeConstraint',
      managementCidrRangeConstraint,
      r'''^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(3[0-2]|[1-2][0-9]|[0-9]))$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
    @_s.required String bundleId,
    @_s.required String sourceWorkspaceId,
  }) async {
    ArgumentError.checkNotNull(bundleId, 'bundleId');
    _s.validateStringPattern(
      'bundleId',
      bundleId,
      r'''^wsb-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceWorkspaceId, 'sourceWorkspaceId');
    _s.validateStringPattern(
      'sourceWorkspaceId',
      sourceWorkspaceId,
      r'''^ws-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
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
    String dedicatedTenancyManagementCidrRange,
    DedicatedTenancySupportEnum dedicatedTenancySupport,
  }) async {
    _s.validateStringPattern(
      'dedicatedTenancyManagementCidrRange',
      dedicatedTenancyManagementCidrRange,
      r'''(^([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.0\.0)(\/(16$))$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyAccount'
    };
    final jsonResponse = await _protocol.send(
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

    return ModifyAccountResult.fromJson(jsonResponse.body);
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
    @_s.required ClientProperties clientProperties,
    @_s.required String resourceId,
  }) async {
    ArgumentError.checkNotNull(clientProperties, 'clientProperties');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyClientProperties'
    };
    final jsonResponse = await _protocol.send(
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

    return ModifyClientPropertiesResult.fromJson(jsonResponse.body);
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
    @_s.required String resourceId,
    @_s.required SelfservicePermissions selfservicePermissions,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      10,
      65,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^d-[0-9a-f]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        selfservicePermissions, 'selfservicePermissions');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifySelfservicePermissions'
    };
    final jsonResponse = await _protocol.send(
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

    return ModifySelfservicePermissionsResult.fromJson(jsonResponse.body);
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
    @_s.required String resourceId,
    @_s.required WorkspaceAccessProperties workspaceAccessProperties,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      10,
      65,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^d-[0-9a-f]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        workspaceAccessProperties, 'workspaceAccessProperties');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyWorkspaceAccessProperties'
    };
    final jsonResponse = await _protocol.send(
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

    return ModifyWorkspaceAccessPropertiesResult.fromJson(jsonResponse.body);
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
    @_s.required String resourceId,
    @_s.required WorkspaceCreationProperties workspaceCreationProperties,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      10,
      65,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^d-[0-9a-f]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        workspaceCreationProperties, 'workspaceCreationProperties');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyWorkspaceCreationProperties'
    };
    final jsonResponse = await _protocol.send(
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

    return ModifyWorkspaceCreationPropertiesResult.fromJson(jsonResponse.body);
  }

  /// Modifies the specified WorkSpace properties. For important information
  /// about how to modify the size of the root and user volumes, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html">
  /// Modify a WorkSpace</a>.
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
  /// Parameter [workspaceProperties] :
  /// The properties of the WorkSpace.
  Future<void> modifyWorkspaceProperties({
    @_s.required String workspaceId,
    @_s.required WorkspaceProperties workspaceProperties,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringPattern(
      'workspaceId',
      workspaceId,
      r'''^ws-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workspaceProperties, 'workspaceProperties');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyWorkspaceProperties'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceId': workspaceId,
        'WorkspaceProperties': workspaceProperties,
      },
    );

    return ModifyWorkspacePropertiesResult.fromJson(jsonResponse.body);
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
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  ///
  /// Parameter [workspaceState] :
  /// The WorkSpace state.
  Future<void> modifyWorkspaceState({
    @_s.required String workspaceId,
    @_s.required TargetWorkspaceState workspaceState,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringPattern(
      'workspaceId',
      workspaceId,
      r'''^ws-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workspaceState, 'workspaceState');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.ModifyWorkspaceState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceId': workspaceId,
        'WorkspaceState': workspaceState?.toValue() ?? '',
      },
    );

    return ModifyWorkspaceStateResult.fromJson(jsonResponse.body);
  }

  /// Reboots the specified WorkSpaces.
  ///
  /// You cannot reboot a WorkSpace unless its state is <code>AVAILABLE</code>
  /// or <code>UNHEALTHY</code>.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces have
  /// rebooted.
  ///
  /// Parameter [rebootWorkspaceRequests] :
  /// The WorkSpaces to reboot. You can specify up to 25 WorkSpaces.
  Future<RebootWorkspacesResult> rebootWorkspaces({
    @_s.required List<RebootRequest> rebootWorkspaceRequests,
  }) async {
    ArgumentError.checkNotNull(
        rebootWorkspaceRequests, 'rebootWorkspaceRequests');
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
  /// Parameter [rebuildWorkspaceRequests] :
  /// The WorkSpace to rebuild. You can specify a single WorkSpace.
  Future<RebuildWorkspacesResult> rebuildWorkspaces({
    @_s.required List<RebuildRequest> rebuildWorkspaceRequests,
  }) async {
    ArgumentError.checkNotNull(
        rebuildWorkspaceRequests, 'rebuildWorkspaceRequests');
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
  /// <code>DEDICATED</code> and your AWS account must be enabled for BYOL. If
  /// your account has not been enabled for BYOL, you will receive an
  /// InvalidParameterValuesException error. For more information about BYOL
  /// images, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html">Bring
  /// Your Own Windows Desktop Images</a>.
  Future<void> registerWorkspaceDirectory({
    @_s.required String directoryId,
    @_s.required bool enableWorkDocs,
    bool enableSelfService,
    List<String> subnetIds,
    List<Tag> tags,
    Tenancy tenancy,
  }) async {
    ArgumentError.checkNotNull(directoryId, 'directoryId');
    _s.validateStringLength(
      'directoryId',
      directoryId,
      10,
      65,
      isRequired: true,
    );
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(enableWorkDocs, 'enableWorkDocs');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.RegisterWorkspaceDirectory'
    };
    final jsonResponse = await _protocol.send(
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

    return RegisterWorkspaceDirectoryResult.fromJson(jsonResponse.body);
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
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the WorkSpace.
  Future<void> restoreWorkspace({
    @_s.required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringPattern(
      'workspaceId',
      workspaceId,
      r'''^ws-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.RestoreWorkspace'
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

    return RestoreWorkspaceResult.fromJson(jsonResponse.body);
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
    @_s.required String groupId,
    @_s.required List<String> userRules,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringPattern(
      'groupId',
      groupId,
      r'''wsipg-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userRules, 'userRules');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.RevokeIpRules'
    };
    final jsonResponse = await _protocol.send(
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

    return RevokeIpRulesResult.fromJson(jsonResponse.body);
  }

  /// Starts the specified WorkSpaces.
  ///
  /// You cannot start a WorkSpace unless it has a running mode of
  /// <code>AutoStop</code> and a state of <code>STOPPED</code>.
  ///
  /// Parameter [startWorkspaceRequests] :
  /// The WorkSpaces to start. You can specify up to 25 WorkSpaces.
  Future<StartWorkspacesResult> startWorkspaces({
    @_s.required List<StartRequest> startWorkspaceRequests,
  }) async {
    ArgumentError.checkNotNull(
        startWorkspaceRequests, 'startWorkspaceRequests');
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
    @_s.required List<StopRequest> stopWorkspaceRequests,
  }) async {
    ArgumentError.checkNotNull(stopWorkspaceRequests, 'stopWorkspaceRequests');
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
  /// AWS Support before terminating the WorkSpace.
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
  /// href="http://aws.amazon.com/directoryservice/pricing/">AWS Directory
  /// Services pricing terms</a>.
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
    @_s.required List<TerminateRequest> terminateWorkspaceRequests,
  }) async {
    ArgumentError.checkNotNull(
        terminateWorkspaceRequests, 'terminateWorkspaceRequests');
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
  /// specified AWS account.
  Future<void> updateConnectionAliasPermission({
    @_s.required String aliasId,
    @_s.required ConnectionAliasPermission connectionAliasPermission,
  }) async {
    ArgumentError.checkNotNull(aliasId, 'aliasId');
    _s.validateStringLength(
      'aliasId',
      aliasId,
      13,
      68,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasId',
      aliasId,
      r'''^wsca-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        connectionAliasPermission, 'connectionAliasPermission');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.UpdateConnectionAliasPermission'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateConnectionAliasPermissionResult.fromJson(jsonResponse.body);
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
    @_s.required String groupId,
    @_s.required List<IpRuleItem> userRules,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringPattern(
      'groupId',
      groupId,
      r'''wsipg-[0-9a-z]{8,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userRules, 'userRules');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.UpdateRulesOfIpGroup'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateRulesOfIpGroupResult.fromJson(jsonResponse.body);
  }

  /// Shares or unshares an image with one account in the same AWS Region by
  /// specifying whether that account has permission to copy the image. If the
  /// copy image permission is granted, the image is shared with that account.
  /// If the copy image permission is revoked, the image is unshared with the
  /// account.
  ///
  /// After an image has been shared, the recipient account can copy the image
  /// to other AWS Regions as needed.
  /// <note>
  /// In the China (Ningxia) Region, you can copy images only within the same
  /// Region.
  ///
  /// In the AWS GovCloud (US-West) Region, to copy images to and from other AWS
  /// Regions, contact AWS Support.
  /// </note>
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
  /// Sharing Bring Your Own License (BYOL) images across AWS accounts isn't
  /// supported at this time in the AWS GovCloud (US-West) Region. To share BYOL
  /// images across accounts in the AWS GovCloud (US-West) Region, contact AWS
  /// Support.
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
  /// The identifier of the AWS account to share or unshare the image with.
  /// <important>
  /// Before sharing the image, confirm that you are sharing to the correct AWS
  /// account ID.
  /// </important>
  Future<void> updateWorkspaceImagePermission({
    @_s.required bool allowCopyImage,
    @_s.required String imageId,
    @_s.required String sharedAccountId,
  }) async {
    ArgumentError.checkNotNull(allowCopyImage, 'allowCopyImage');
    ArgumentError.checkNotNull(imageId, 'imageId');
    _s.validateStringPattern(
      'imageId',
      imageId,
      r'''wsi-[0-9a-z]{9,63}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sharedAccountId, 'sharedAccountId');
    _s.validateStringPattern(
      'sharedAccountId',
      sharedAccountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkspacesService.UpdateWorkspaceImagePermission'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateWorkspaceImagePermissionResult.fromJson(jsonResponse.body);
  }
}

enum AccessPropertyValue {
  @_s.JsonValue('ALLOW')
  allow,
  @_s.JsonValue('DENY')
  deny,
}

/// Describes a modification to the configuration of Bring Your Own License
/// (BYOL) for the specified account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountModification {
  /// The IP address range, specified as an IPv4 CIDR block, for the management
  /// network interface used for the account.
  @_s.JsonKey(name: 'DedicatedTenancyManagementCidrRange')
  final String dedicatedTenancyManagementCidrRange;

  /// The status of BYOL (whether BYOL is being enabled or disabled).
  @_s.JsonKey(name: 'DedicatedTenancySupport')
  final DedicatedTenancySupportResultEnum dedicatedTenancySupport;

  /// The error code that is returned if the configuration of BYOL cannot be
  /// modified.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The text of the error message that is returned if the configuration of BYOL
  /// cannot be modified.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The state of the modification to the configuration of BYOL.
  @_s.JsonKey(name: 'ModificationState')
  final DedicatedTenancyModificationStateEnum modificationState;

  /// The timestamp when the modification of the BYOL configuration was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  AccountModification({
    this.dedicatedTenancyManagementCidrRange,
    this.dedicatedTenancySupport,
    this.errorCode,
    this.errorMessage,
    this.modificationState,
    this.startTime,
  });
  factory AccountModification.fromJson(Map<String, dynamic> json) =>
      _$AccountModificationFromJson(json);
}

enum Application {
  @_s.JsonValue('Microsoft_Office_2016')
  microsoftOffice_2016,
  @_s.JsonValue('Microsoft_Office_2019')
  microsoftOffice_2019,
}

extension on Application {
  String toValue() {
    switch (this) {
      case Application.microsoftOffice_2016:
        return 'Microsoft_Office_2016';
      case Application.microsoftOffice_2019:
        return 'Microsoft_Office_2019';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateConnectionAliasResult {
  /// The identifier of the connection alias association. You use the connection
  /// identifier in the DNS TXT record when you're configuring your DNS routing
  /// policies.
  @_s.JsonKey(name: 'ConnectionIdentifier')
  final String connectionIdentifier;

  AssociateConnectionAliasResult({
    this.connectionIdentifier,
  });
  factory AssociateConnectionAliasResult.fromJson(Map<String, dynamic> json) =>
      _$AssociateConnectionAliasResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateIpGroupsResult {
  AssociateIpGroupsResult();
  factory AssociateIpGroupsResult.fromJson(Map<String, dynamic> json) =>
      _$AssociateIpGroupsResultFromJson(json);
}

enum AssociationStatus {
  @_s.JsonValue('NOT_ASSOCIATED')
  notAssociated,
  @_s.JsonValue('ASSOCIATED_WITH_OWNER_ACCOUNT')
  associatedWithOwnerAccount,
  @_s.JsonValue('ASSOCIATED_WITH_SHARED_ACCOUNT')
  associatedWithSharedAccount,
  @_s.JsonValue('PENDING_ASSOCIATION')
  pendingAssociation,
  @_s.JsonValue('PENDING_DISASSOCIATION')
  pendingDisassociation,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuthorizeIpRulesResult {
  AuthorizeIpRulesResult();
  factory AuthorizeIpRulesResult.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeIpRulesResultFromJson(json);
}

/// Describes an Amazon WorkSpaces client.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ClientProperties {
  /// Specifies whether users can cache their credentials on the Amazon WorkSpaces
  /// client. When enabled, users can choose to reconnect to their WorkSpaces
  /// without re-entering their credentials.
  @_s.JsonKey(name: 'ReconnectEnabled')
  final ReconnectEnum reconnectEnabled;

  ClientProperties({
    this.reconnectEnabled,
  });
  factory ClientProperties.fromJson(Map<String, dynamic> json) =>
      _$ClientPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ClientPropertiesToJson(this);
}

/// Information about the Amazon WorkSpaces client.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClientPropertiesResult {
  /// Information about the Amazon WorkSpaces client.
  @_s.JsonKey(name: 'ClientProperties')
  final ClientProperties clientProperties;

  /// The resource identifier, in the form of a directory ID.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  ClientPropertiesResult({
    this.clientProperties,
    this.resourceId,
  });
  factory ClientPropertiesResult.fromJson(Map<String, dynamic> json) =>
      _$ClientPropertiesResultFromJson(json);
}

enum Compute {
  @_s.JsonValue('VALUE')
  value,
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('PERFORMANCE')
  performance,
  @_s.JsonValue('POWER')
  power,
  @_s.JsonValue('GRAPHICS')
  graphics,
  @_s.JsonValue('POWERPRO')
  powerpro,
  @_s.JsonValue('GRAPHICSPRO')
  graphicspro,
}

/// Describes the compute type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComputeType {
  /// The compute type.
  @_s.JsonKey(name: 'Name')
  final Compute name;

  ComputeType({
    this.name,
  });
  factory ComputeType.fromJson(Map<String, dynamic> json) =>
      _$ComputeTypeFromJson(json);
}

/// Describes a connection alias. Connection aliases are used for cross-Region
/// redirection. For more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
/// Cross-Region Redirection for Amazon WorkSpaces</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectionAlias {
  /// The identifier of the connection alias.
  @_s.JsonKey(name: 'AliasId')
  final String aliasId;

  /// The association status of the connection alias.
  @_s.JsonKey(name: 'Associations')
  final List<ConnectionAliasAssociation> associations;

  /// The connection string specified for the connection alias. The connection
  /// string must be in the form of a fully qualified domain name (FQDN), such as
  /// <code>www.example.com</code>.
  @_s.JsonKey(name: 'ConnectionString')
  final String connectionString;

  /// The identifier of the AWS account that owns the connection alias.
  @_s.JsonKey(name: 'OwnerAccountId')
  final String ownerAccountId;

  /// The current state of the connection alias.
  @_s.JsonKey(name: 'State')
  final ConnectionAliasState state;

  ConnectionAlias({
    this.aliasId,
    this.associations,
    this.connectionString,
    this.ownerAccountId,
    this.state,
  });
  factory ConnectionAlias.fromJson(Map<String, dynamic> json) =>
      _$ConnectionAliasFromJson(json);
}

/// Describes a connection alias association that is used for cross-Region
/// redirection. For more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
/// Cross-Region Redirection for Amazon WorkSpaces</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectionAliasAssociation {
  /// The identifier of the AWS account that associated the connection alias with
  /// a directory.
  @_s.JsonKey(name: 'AssociatedAccountId')
  final String associatedAccountId;

  /// The association status of the connection alias.
  @_s.JsonKey(name: 'AssociationStatus')
  final AssociationStatus associationStatus;

  /// The identifier of the connection alias association. You use the connection
  /// identifier in the DNS TXT record when you're configuring your DNS routing
  /// policies.
  @_s.JsonKey(name: 'ConnectionIdentifier')
  final String connectionIdentifier;

  /// The identifier of the directory associated with a connection alias.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  ConnectionAliasAssociation({
    this.associatedAccountId,
    this.associationStatus,
    this.connectionIdentifier,
    this.resourceId,
  });
  factory ConnectionAliasAssociation.fromJson(Map<String, dynamic> json) =>
      _$ConnectionAliasAssociationFromJson(json);
}

/// Describes the permissions for a connection alias. Connection aliases are
/// used for cross-Region redirection. For more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html">
/// Cross-Region Redirection for Amazon WorkSpaces</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConnectionAliasPermission {
  /// Indicates whether the specified AWS account is allowed to associate the
  /// connection alias with a directory.
  @_s.JsonKey(name: 'AllowAssociation')
  final bool allowAssociation;

  /// The identifier of the AWS account that the connection alias is shared with.
  @_s.JsonKey(name: 'SharedAccountId')
  final String sharedAccountId;

  ConnectionAliasPermission({
    @_s.required this.allowAssociation,
    @_s.required this.sharedAccountId,
  });
  factory ConnectionAliasPermission.fromJson(Map<String, dynamic> json) =>
      _$ConnectionAliasPermissionFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionAliasPermissionToJson(this);
}

enum ConnectionAliasState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('DELETING')
  deleting,
}

enum ConnectionState {
  @_s.JsonValue('CONNECTED')
  connected,
  @_s.JsonValue('DISCONNECTED')
  disconnected,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CopyWorkspaceImageResult {
  /// The identifier of the image.
  @_s.JsonKey(name: 'ImageId')
  final String imageId;

  CopyWorkspaceImageResult({
    this.imageId,
  });
  factory CopyWorkspaceImageResult.fromJson(Map<String, dynamic> json) =>
      _$CopyWorkspaceImageResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConnectionAliasResult {
  /// The identifier of the connection alias.
  @_s.JsonKey(name: 'AliasId')
  final String aliasId;

  CreateConnectionAliasResult({
    this.aliasId,
  });
  factory CreateConnectionAliasResult.fromJson(Map<String, dynamic> json) =>
      _$CreateConnectionAliasResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIpGroupResult {
  /// The identifier of the group.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  CreateIpGroupResult({
    this.groupId,
  });
  factory CreateIpGroupResult.fromJson(Map<String, dynamic> json) =>
      _$CreateIpGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTagsResult {
  CreateTagsResult();
  factory CreateTagsResult.fromJson(Map<String, dynamic> json) =>
      _$CreateTagsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorkspacesResult {
  /// Information about the WorkSpaces that could not be created.
  @_s.JsonKey(name: 'FailedRequests')
  final List<FailedCreateWorkspaceRequest> failedRequests;

  /// Information about the WorkSpaces that were created.
  ///
  /// Because this operation is asynchronous, the identifier returned is not
  /// immediately available for use with other operations. For example, if you
  /// call <a>DescribeWorkspaces</a> before the WorkSpace is created, the
  /// information returned can be incomplete.
  @_s.JsonKey(name: 'PendingRequests')
  final List<Workspace> pendingRequests;

  CreateWorkspacesResult({
    this.failedRequests,
    this.pendingRequests,
  });
  factory CreateWorkspacesResult.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkspacesResultFromJson(json);
}

enum DedicatedTenancyModificationStateEnum {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
}

enum DedicatedTenancySupportEnum {
  @_s.JsonValue('ENABLED')
  enabled,
}

extension on DedicatedTenancySupportEnum {
  String toValue() {
    switch (this) {
      case DedicatedTenancySupportEnum.enabled:
        return 'ENABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DedicatedTenancySupportResultEnum {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Describes the default values that are used to create WorkSpaces. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/update-directory-details.html">Update
/// Directory Details for Your WorkSpaces</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DefaultWorkspaceCreationProperties {
  /// The identifier of the default security group to apply to WorkSpaces when
  /// they are created. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces-security-groups.html">
  /// Security Groups for Your WorkSpaces</a>.
  @_s.JsonKey(name: 'CustomSecurityGroupId')
  final String customSecurityGroupId;

  /// The organizational unit (OU) in the directory for the WorkSpace machine
  /// accounts.
  @_s.JsonKey(name: 'DefaultOu')
  final String defaultOu;

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
  @_s.JsonKey(name: 'EnableInternetAccess')
  final bool enableInternetAccess;

  /// Specifies whether maintenance mode is enabled for WorkSpaces. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/workspace-maintenance.html">WorkSpace
  /// Maintenance</a>.
  @_s.JsonKey(name: 'EnableMaintenanceMode')
  final bool enableMaintenanceMode;

  /// Specifies whether the directory is enabled for Amazon WorkDocs.
  @_s.JsonKey(name: 'EnableWorkDocs')
  final bool enableWorkDocs;

  /// Specifies whether WorkSpace users are local administrators on their
  /// WorkSpaces.
  @_s.JsonKey(name: 'UserEnabledAsLocalAdministrator')
  final bool userEnabledAsLocalAdministrator;

  DefaultWorkspaceCreationProperties({
    this.customSecurityGroupId,
    this.defaultOu,
    this.enableInternetAccess,
    this.enableMaintenanceMode,
    this.enableWorkDocs,
    this.userEnabledAsLocalAdministrator,
  });
  factory DefaultWorkspaceCreationProperties.fromJson(
          Map<String, dynamic> json) =>
      _$DefaultWorkspaceCreationPropertiesFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConnectionAliasResult {
  DeleteConnectionAliasResult();
  factory DeleteConnectionAliasResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteConnectionAliasResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteIpGroupResult {
  DeleteIpGroupResult();
  factory DeleteIpGroupResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteIpGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTagsResult {
  DeleteTagsResult();
  factory DeleteTagsResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteTagsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWorkspaceImageResult {
  DeleteWorkspaceImageResult();
  factory DeleteWorkspaceImageResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteWorkspaceImageResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterWorkspaceDirectoryResult {
  DeregisterWorkspaceDirectoryResult();
  factory DeregisterWorkspaceDirectoryResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeregisterWorkspaceDirectoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountModificationsResult {
  /// The list of modifications to the configuration of BYOL.
  @_s.JsonKey(name: 'AccountModifications')
  final List<AccountModification> accountModifications;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeAccountModificationsResult({
    this.accountModifications,
    this.nextToken,
  });
  factory DescribeAccountModificationsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAccountModificationsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountResult {
  /// The IP address range, specified as an IPv4 CIDR block, used for the
  /// management network interface.
  ///
  /// The management network interface is connected to a secure Amazon WorkSpaces
  /// management network. It is used for interactive streaming of the WorkSpace
  /// desktop to Amazon WorkSpaces clients, and to allow Amazon WorkSpaces to
  /// manage the WorkSpace.
  @_s.JsonKey(name: 'DedicatedTenancyManagementCidrRange')
  final String dedicatedTenancyManagementCidrRange;

  /// The status of BYOL (whether BYOL is enabled or disabled).
  @_s.JsonKey(name: 'DedicatedTenancySupport')
  final DedicatedTenancySupportResultEnum dedicatedTenancySupport;

  DescribeAccountResult({
    this.dedicatedTenancyManagementCidrRange,
    this.dedicatedTenancySupport,
  });
  factory DescribeAccountResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeAccountResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeClientPropertiesResult {
  /// Information about the specified Amazon WorkSpaces clients.
  @_s.JsonKey(name: 'ClientPropertiesList')
  final List<ClientPropertiesResult> clientPropertiesList;

  DescribeClientPropertiesResult({
    this.clientPropertiesList,
  });
  factory DescribeClientPropertiesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeClientPropertiesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConnectionAliasPermissionsResult {
  /// The identifier of the connection alias.
  @_s.JsonKey(name: 'AliasId')
  final String aliasId;

  /// The permissions associated with a connection alias.
  @_s.JsonKey(name: 'ConnectionAliasPermissions')
  final List<ConnectionAliasPermission> connectionAliasPermissions;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeConnectionAliasPermissionsResult({
    this.aliasId,
    this.connectionAliasPermissions,
    this.nextToken,
  });
  factory DescribeConnectionAliasPermissionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConnectionAliasPermissionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConnectionAliasesResult {
  /// Information about the specified connection aliases.
  @_s.JsonKey(name: 'ConnectionAliases')
  final List<ConnectionAlias> connectionAliases;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeConnectionAliasesResult({
    this.connectionAliases,
    this.nextToken,
  });
  factory DescribeConnectionAliasesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeConnectionAliasesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeIpGroupsResult {
  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the IP access control groups.
  @_s.JsonKey(name: 'Result')
  final List<WorkspacesIpGroup> result;

  DescribeIpGroupsResult({
    this.nextToken,
    this.result,
  });
  factory DescribeIpGroupsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeIpGroupsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTagsResult {
  /// The tags.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  DescribeTagsResult({
    this.tagList,
  });
  factory DescribeTagsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeTagsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkspaceBundlesResult {
  /// Information about the bundles.
  @_s.JsonKey(name: 'Bundles')
  final List<WorkspaceBundle> bundles;

  /// The token to use to retrieve the next set of results, or null if there are
  /// no more results available. This token is valid for one day and must be used
  /// within that time frame.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeWorkspaceBundlesResult({
    this.bundles,
    this.nextToken,
  });
  factory DescribeWorkspaceBundlesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorkspaceBundlesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkspaceDirectoriesResult {
  /// Information about the directories.
  @_s.JsonKey(name: 'Directories')
  final List<WorkspaceDirectory> directories;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeWorkspaceDirectoriesResult({
    this.directories,
    this.nextToken,
  });
  factory DescribeWorkspaceDirectoriesResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeWorkspaceDirectoriesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkspaceImagePermissionsResult {
  /// The identifier of the image.
  @_s.JsonKey(name: 'ImageId')
  final String imageId;

  /// The identifiers of the AWS accounts that the image has been shared with.
  @_s.JsonKey(name: 'ImagePermissions')
  final List<ImagePermission> imagePermissions;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeWorkspaceImagePermissionsResult({
    this.imageId,
    this.imagePermissions,
    this.nextToken,
  });
  factory DescribeWorkspaceImagePermissionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeWorkspaceImagePermissionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkspaceImagesResult {
  /// Information about the images.
  @_s.JsonKey(name: 'Images')
  final List<WorkspaceImage> images;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeWorkspaceImagesResult({
    this.images,
    this.nextToken,
  });
  factory DescribeWorkspaceImagesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorkspaceImagesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkspaceSnapshotsResult {
  /// Information about the snapshots that can be used to rebuild a WorkSpace.
  /// These snapshots include the user volume.
  @_s.JsonKey(name: 'RebuildSnapshots')
  final List<Snapshot> rebuildSnapshots;

  /// Information about the snapshots that can be used to restore a WorkSpace.
  /// These snapshots include both the root volume and the user volume.
  @_s.JsonKey(name: 'RestoreSnapshots')
  final List<Snapshot> restoreSnapshots;

  DescribeWorkspaceSnapshotsResult({
    this.rebuildSnapshots,
    this.restoreSnapshots,
  });
  factory DescribeWorkspaceSnapshotsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeWorkspaceSnapshotsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkspacesConnectionStatusResult {
  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the connection status of the WorkSpace.
  @_s.JsonKey(name: 'WorkspacesConnectionStatus')
  final List<WorkspaceConnectionStatus> workspacesConnectionStatus;

  DescribeWorkspacesConnectionStatusResult({
    this.nextToken,
    this.workspacesConnectionStatus,
  });
  factory DescribeWorkspacesConnectionStatusResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeWorkspacesConnectionStatusResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkspacesResult {
  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the WorkSpaces.
  ///
  /// Because <a>CreateWorkspaces</a> is an asynchronous operation, some of the
  /// returned information could be incomplete.
  @_s.JsonKey(name: 'Workspaces')
  final List<Workspace> workspaces;

  DescribeWorkspacesResult({
    this.nextToken,
    this.workspaces,
  });
  factory DescribeWorkspacesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorkspacesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateConnectionAliasResult {
  DisassociateConnectionAliasResult();
  factory DisassociateConnectionAliasResult.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateConnectionAliasResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateIpGroupsResult {
  DisassociateIpGroupsResult();
  factory DisassociateIpGroupsResult.fromJson(Map<String, dynamic> json) =>
      _$DisassociateIpGroupsResultFromJson(json);
}

/// Describes a WorkSpace that cannot be created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedCreateWorkspaceRequest {
  /// The error code that is returned if the WorkSpace cannot be created.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The text of the error message that is returned if the WorkSpace cannot be
  /// created.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// Information about the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceRequest')
  final WorkspaceRequest workspaceRequest;

  FailedCreateWorkspaceRequest({
    this.errorCode,
    this.errorMessage,
    this.workspaceRequest,
  });
  factory FailedCreateWorkspaceRequest.fromJson(Map<String, dynamic> json) =>
      _$FailedCreateWorkspaceRequestFromJson(json);
}

/// Describes a WorkSpace that could not be rebooted. (<a>RebootWorkspaces</a>),
/// rebuilt (<a>RebuildWorkspaces</a>), restored (<a>RestoreWorkspace</a>),
/// terminated (<a>TerminateWorkspaces</a>), started (<a>StartWorkspaces</a>),
/// or stopped (<a>StopWorkspaces</a>).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedWorkspaceChangeRequest {
  /// The error code that is returned if the WorkSpace cannot be rebooted.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The text of the error message that is returned if the WorkSpace cannot be
  /// rebooted.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier of the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceId')
  final String workspaceId;

  FailedWorkspaceChangeRequest({
    this.errorCode,
    this.errorMessage,
    this.workspaceId,
  });
  factory FailedWorkspaceChangeRequest.fromJson(Map<String, dynamic> json) =>
      _$FailedWorkspaceChangeRequestFromJson(json);
}

/// Describes the AWS accounts that have been granted permission to use a shared
/// image. For more information about sharing images, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/share-custom-image.html">
/// Share or Unshare a Custom WorkSpaces Image</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImagePermission {
  /// The identifier of the AWS account that an image has been shared with.
  @_s.JsonKey(name: 'SharedAccountId')
  final String sharedAccountId;

  ImagePermission({
    this.sharedAccountId,
  });
  factory ImagePermission.fromJson(Map<String, dynamic> json) =>
      _$ImagePermissionFromJson(json);
}

enum ImageType {
  @_s.JsonValue('OWNED')
  owned,
  @_s.JsonValue('SHARED')
  shared,
}

extension on ImageType {
  String toValue() {
    switch (this) {
      case ImageType.owned:
        return 'OWNED';
      case ImageType.shared:
        return 'SHARED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportWorkspaceImageResult {
  /// The identifier of the WorkSpace image.
  @_s.JsonKey(name: 'ImageId')
  final String imageId;

  ImportWorkspaceImageResult({
    this.imageId,
  });
  factory ImportWorkspaceImageResult.fromJson(Map<String, dynamic> json) =>
      _$ImportWorkspaceImageResultFromJson(json);
}

/// Describes a rule for an IP access control group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IpRuleItem {
  /// The IP address range, in CIDR notation.
  @_s.JsonKey(name: 'ipRule')
  final String ipRule;

  /// The description.
  @_s.JsonKey(name: 'ruleDesc')
  final String ruleDesc;

  IpRuleItem({
    this.ipRule,
    this.ruleDesc,
  });
  factory IpRuleItem.fromJson(Map<String, dynamic> json) =>
      _$IpRuleItemFromJson(json);

  Map<String, dynamic> toJson() => _$IpRuleItemToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAvailableManagementCidrRangesResult {
  /// The list of available IP address ranges, specified as IPv4 CIDR blocks.
  @_s.JsonKey(name: 'ManagementCidrRanges')
  final List<String> managementCidrRanges;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAvailableManagementCidrRangesResult({
    this.managementCidrRanges,
    this.nextToken,
  });
  factory ListAvailableManagementCidrRangesResult.fromJson(
          Map<String, dynamic> json) =>
      _$ListAvailableManagementCidrRangesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MigrateWorkspaceResult {
  /// The original identifier of the WorkSpace that is being migrated.
  @_s.JsonKey(name: 'SourceWorkspaceId')
  final String sourceWorkspaceId;

  /// The new identifier of the WorkSpace that is being migrated. If the migration
  /// does not succeed, the target WorkSpace ID will not be used, and the
  /// WorkSpace will still have the original WorkSpace ID.
  @_s.JsonKey(name: 'TargetWorkspaceId')
  final String targetWorkspaceId;

  MigrateWorkspaceResult({
    this.sourceWorkspaceId,
    this.targetWorkspaceId,
  });
  factory MigrateWorkspaceResult.fromJson(Map<String, dynamic> json) =>
      _$MigrateWorkspaceResultFromJson(json);
}

enum ModificationResourceEnum {
  @_s.JsonValue('ROOT_VOLUME')
  rootVolume,
  @_s.JsonValue('USER_VOLUME')
  userVolume,
  @_s.JsonValue('COMPUTE_TYPE')
  computeType,
}

/// Describes a WorkSpace modification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModificationState {
  /// The resource.
  @_s.JsonKey(name: 'Resource')
  final ModificationResourceEnum resource;

  /// The modification state.
  @_s.JsonKey(name: 'State')
  final ModificationStateEnum state;

  ModificationState({
    this.resource,
    this.state,
  });
  factory ModificationState.fromJson(Map<String, dynamic> json) =>
      _$ModificationStateFromJson(json);
}

enum ModificationStateEnum {
  @_s.JsonValue('UPDATE_INITIATED')
  updateInitiated,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyAccountResult {
  ModifyAccountResult();
  factory ModifyAccountResult.fromJson(Map<String, dynamic> json) =>
      _$ModifyAccountResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyClientPropertiesResult {
  ModifyClientPropertiesResult();
  factory ModifyClientPropertiesResult.fromJson(Map<String, dynamic> json) =>
      _$ModifyClientPropertiesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifySelfservicePermissionsResult {
  ModifySelfservicePermissionsResult();
  factory ModifySelfservicePermissionsResult.fromJson(
          Map<String, dynamic> json) =>
      _$ModifySelfservicePermissionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyWorkspaceAccessPropertiesResult {
  ModifyWorkspaceAccessPropertiesResult();
  factory ModifyWorkspaceAccessPropertiesResult.fromJson(
          Map<String, dynamic> json) =>
      _$ModifyWorkspaceAccessPropertiesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyWorkspaceCreationPropertiesResult {
  ModifyWorkspaceCreationPropertiesResult();
  factory ModifyWorkspaceCreationPropertiesResult.fromJson(
          Map<String, dynamic> json) =>
      _$ModifyWorkspaceCreationPropertiesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyWorkspacePropertiesResult {
  ModifyWorkspacePropertiesResult();
  factory ModifyWorkspacePropertiesResult.fromJson(Map<String, dynamic> json) =>
      _$ModifyWorkspacePropertiesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyWorkspaceStateResult {
  ModifyWorkspaceStateResult();
  factory ModifyWorkspaceStateResult.fromJson(Map<String, dynamic> json) =>
      _$ModifyWorkspaceStateResultFromJson(json);
}

/// The operating system that the image is running.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OperatingSystem {
  /// The operating system.
  @_s.JsonKey(name: 'Type')
  final OperatingSystemType type;

  OperatingSystem({
    this.type,
  });
  factory OperatingSystem.fromJson(Map<String, dynamic> json) =>
      _$OperatingSystemFromJson(json);
}

enum OperatingSystemType {
  @_s.JsonValue('WINDOWS')
  windows,
  @_s.JsonValue('LINUX')
  linux,
}

/// Describes the information used to reboot a WorkSpace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RebootRequest {
  /// The identifier of the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceId')
  final String workspaceId;

  RebootRequest({
    @_s.required this.workspaceId,
  });
  Map<String, dynamic> toJson() => _$RebootRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RebootWorkspacesResult {
  /// Information about the WorkSpaces that could not be rebooted.
  @_s.JsonKey(name: 'FailedRequests')
  final List<FailedWorkspaceChangeRequest> failedRequests;

  RebootWorkspacesResult({
    this.failedRequests,
  });
  factory RebootWorkspacesResult.fromJson(Map<String, dynamic> json) =>
      _$RebootWorkspacesResultFromJson(json);
}

/// Describes the information used to rebuild a WorkSpace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RebuildRequest {
  /// The identifier of the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceId')
  final String workspaceId;

  RebuildRequest({
    @_s.required this.workspaceId,
  });
  Map<String, dynamic> toJson() => _$RebuildRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RebuildWorkspacesResult {
  /// Information about the WorkSpace that could not be rebuilt.
  @_s.JsonKey(name: 'FailedRequests')
  final List<FailedWorkspaceChangeRequest> failedRequests;

  RebuildWorkspacesResult({
    this.failedRequests,
  });
  factory RebuildWorkspacesResult.fromJson(Map<String, dynamic> json) =>
      _$RebuildWorkspacesResultFromJson(json);
}

enum ReconnectEnum {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterWorkspaceDirectoryResult {
  RegisterWorkspaceDirectoryResult();
  factory RegisterWorkspaceDirectoryResult.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterWorkspaceDirectoryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreWorkspaceResult {
  RestoreWorkspaceResult();
  factory RestoreWorkspaceResult.fromJson(Map<String, dynamic> json) =>
      _$RestoreWorkspaceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RevokeIpRulesResult {
  RevokeIpRulesResult();
  factory RevokeIpRulesResult.fromJson(Map<String, dynamic> json) =>
      _$RevokeIpRulesResultFromJson(json);
}

/// Describes the root volume for a WorkSpace bundle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RootStorage {
  /// The size of the root volume.
  @_s.JsonKey(name: 'Capacity')
  final String capacity;

  RootStorage({
    this.capacity,
  });
  factory RootStorage.fromJson(Map<String, dynamic> json) =>
      _$RootStorageFromJson(json);
}

enum RunningMode {
  @_s.JsonValue('AUTO_STOP')
  autoStop,
  @_s.JsonValue('ALWAYS_ON')
  alwaysOn,
}

/// Describes the self-service permissions for a directory. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/enable-user-self-service-workspace-management.html">Enable
/// Self-Service WorkSpace Management Capabilities for Your Users</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SelfservicePermissions {
  /// Specifies whether users can change the compute type (bundle) for their
  /// WorkSpace.
  @_s.JsonKey(name: 'ChangeComputeType')
  final ReconnectEnum changeComputeType;

  /// Specifies whether users can increase the volume size of the drives on their
  /// WorkSpace.
  @_s.JsonKey(name: 'IncreaseVolumeSize')
  final ReconnectEnum increaseVolumeSize;

  /// Specifies whether users can rebuild the operating system of a WorkSpace to
  /// its original state.
  @_s.JsonKey(name: 'RebuildWorkspace')
  final ReconnectEnum rebuildWorkspace;

  /// Specifies whether users can restart their WorkSpace.
  @_s.JsonKey(name: 'RestartWorkspace')
  final ReconnectEnum restartWorkspace;

  /// Specifies whether users can switch the running mode of their WorkSpace.
  @_s.JsonKey(name: 'SwitchRunningMode')
  final ReconnectEnum switchRunningMode;

  SelfservicePermissions({
    this.changeComputeType,
    this.increaseVolumeSize,
    this.rebuildWorkspace,
    this.restartWorkspace,
    this.switchRunningMode,
  });
  factory SelfservicePermissions.fromJson(Map<String, dynamic> json) =>
      _$SelfservicePermissionsFromJson(json);

  Map<String, dynamic> toJson() => _$SelfservicePermissionsToJson(this);
}

/// Describes a snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Snapshot {
  /// The time when the snapshot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SnapshotTime')
  final DateTime snapshotTime;

  Snapshot({
    this.snapshotTime,
  });
  factory Snapshot.fromJson(Map<String, dynamic> json) =>
      _$SnapshotFromJson(json);
}

/// Information used to start a WorkSpace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartRequest {
  /// The identifier of the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceId')
  final String workspaceId;

  StartRequest({
    this.workspaceId,
  });
  Map<String, dynamic> toJson() => _$StartRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartWorkspacesResult {
  /// Information about the WorkSpaces that could not be started.
  @_s.JsonKey(name: 'FailedRequests')
  final List<FailedWorkspaceChangeRequest> failedRequests;

  StartWorkspacesResult({
    this.failedRequests,
  });
  factory StartWorkspacesResult.fromJson(Map<String, dynamic> json) =>
      _$StartWorkspacesResultFromJson(json);
}

/// Describes the information used to stop a WorkSpace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StopRequest {
  /// The identifier of the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceId')
  final String workspaceId;

  StopRequest({
    this.workspaceId,
  });
  Map<String, dynamic> toJson() => _$StopRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopWorkspacesResult {
  /// Information about the WorkSpaces that could not be stopped.
  @_s.JsonKey(name: 'FailedRequests')
  final List<FailedWorkspaceChangeRequest> failedRequests;

  StopWorkspacesResult({
    this.failedRequests,
  });
  factory StopWorkspacesResult.fromJson(Map<String, dynamic> json) =>
      _$StopWorkspacesResultFromJson(json);
}

/// Describes a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

enum TargetWorkspaceState {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('ADMIN_MAINTENANCE')
  adminMaintenance,
}

extension on TargetWorkspaceState {
  String toValue() {
    switch (this) {
      case TargetWorkspaceState.available:
        return 'AVAILABLE';
      case TargetWorkspaceState.adminMaintenance:
        return 'ADMIN_MAINTENANCE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Tenancy {
  @_s.JsonValue('DEDICATED')
  dedicated,
  @_s.JsonValue('SHARED')
  shared,
}

extension on Tenancy {
  String toValue() {
    switch (this) {
      case Tenancy.dedicated:
        return 'DEDICATED';
      case Tenancy.shared:
        return 'SHARED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the information used to terminate a WorkSpace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TerminateRequest {
  /// The identifier of the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceId')
  final String workspaceId;

  TerminateRequest({
    @_s.required this.workspaceId,
  });
  Map<String, dynamic> toJson() => _$TerminateRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TerminateWorkspacesResult {
  /// Information about the WorkSpaces that could not be terminated.
  @_s.JsonKey(name: 'FailedRequests')
  final List<FailedWorkspaceChangeRequest> failedRequests;

  TerminateWorkspacesResult({
    this.failedRequests,
  });
  factory TerminateWorkspacesResult.fromJson(Map<String, dynamic> json) =>
      _$TerminateWorkspacesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConnectionAliasPermissionResult {
  UpdateConnectionAliasPermissionResult();
  factory UpdateConnectionAliasPermissionResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateConnectionAliasPermissionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRulesOfIpGroupResult {
  UpdateRulesOfIpGroupResult();
  factory UpdateRulesOfIpGroupResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateRulesOfIpGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWorkspaceImagePermissionResult {
  UpdateWorkspaceImagePermissionResult();
  factory UpdateWorkspaceImagePermissionResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateWorkspaceImagePermissionResultFromJson(json);
}

/// Describes the user storage for a WorkSpace bundle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserStorage {
  /// The size of the user storage.
  @_s.JsonKey(name: 'Capacity')
  final String capacity;

  UserStorage({
    this.capacity,
  });
  factory UserStorage.fromJson(Map<String, dynamic> json) =>
      _$UserStorageFromJson(json);
}

/// Describes a WorkSpace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Workspace {
  /// The identifier of the bundle used to create the WorkSpace.
  @_s.JsonKey(name: 'BundleId')
  final String bundleId;

  /// The name of the WorkSpace, as seen by the operating system. The format of
  /// this name varies. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/launch-workspaces-tutorials.html">
  /// Launch a WorkSpace</a>.
  @_s.JsonKey(name: 'ComputerName')
  final String computerName;

  /// The identifier of the AWS Directory Service directory for the WorkSpace.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The error code that is returned if the WorkSpace cannot be created.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The text of the error message that is returned if the WorkSpace cannot be
  /// created.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The IP address of the WorkSpace.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// The modification states of the WorkSpace.
  @_s.JsonKey(name: 'ModificationStates')
  final List<ModificationState> modificationStates;

  /// Indicates whether the data stored on the root volume is encrypted.
  @_s.JsonKey(name: 'RootVolumeEncryptionEnabled')
  final bool rootVolumeEncryptionEnabled;

  /// The operational state of the WorkSpace.
  /// <note>
  /// After a WorkSpace is terminated, the <code>TERMINATED</code> state is
  /// returned only briefly before the WorkSpace directory metadata is cleaned up,
  /// so this state is rarely returned. To confirm that a WorkSpace is terminated,
  /// check for the WorkSpace ID by using <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaces.html">
  /// DescribeWorkSpaces</a>. If the WorkSpace ID isn't returned, then the
  /// WorkSpace has been successfully terminated.
  /// </note>
  @_s.JsonKey(name: 'State')
  final WorkspaceState state;

  /// The identifier of the subnet for the WorkSpace.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The user for the WorkSpace.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  /// Indicates whether the data stored on the user volume is encrypted.
  @_s.JsonKey(name: 'UserVolumeEncryptionEnabled')
  final bool userVolumeEncryptionEnabled;

  /// The symmetric AWS KMS customer master key (CMK) used to encrypt data stored
  /// on your WorkSpace. Amazon WorkSpaces does not support asymmetric CMKs.
  @_s.JsonKey(name: 'VolumeEncryptionKey')
  final String volumeEncryptionKey;

  /// The identifier of the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceId')
  final String workspaceId;

  /// The properties of the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceProperties')
  final WorkspaceProperties workspaceProperties;

  Workspace({
    this.bundleId,
    this.computerName,
    this.directoryId,
    this.errorCode,
    this.errorMessage,
    this.ipAddress,
    this.modificationStates,
    this.rootVolumeEncryptionEnabled,
    this.state,
    this.subnetId,
    this.userName,
    this.userVolumeEncryptionEnabled,
    this.volumeEncryptionKey,
    this.workspaceId,
    this.workspaceProperties,
  });
  factory Workspace.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFromJson(json);
}

/// The device types and operating systems that can be used to access a
/// WorkSpace. For more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/workspaces-network-requirements.html">Amazon
/// WorkSpaces Client Network Requirements</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WorkspaceAccessProperties {
  /// Indicates whether users can use Android devices to access their WorkSpaces.
  @_s.JsonKey(name: 'DeviceTypeAndroid')
  final AccessPropertyValue deviceTypeAndroid;

  /// Indicates whether users can use Chromebooks to access their WorkSpaces.
  @_s.JsonKey(name: 'DeviceTypeChromeOs')
  final AccessPropertyValue deviceTypeChromeOs;

  /// Indicates whether users can use iOS devices to access their WorkSpaces.
  @_s.JsonKey(name: 'DeviceTypeIos')
  final AccessPropertyValue deviceTypeIos;

  /// Indicates whether users can use macOS clients to access their WorkSpaces. To
  /// restrict WorkSpaces access to trusted devices (also known as managed
  /// devices) with valid certificates, specify a value of <code>TRUST</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/trusted-devices.html">Restrict
  /// WorkSpaces Access to Trusted Devices</a>.
  @_s.JsonKey(name: 'DeviceTypeOsx')
  final AccessPropertyValue deviceTypeOsx;

  /// Indicates whether users can access their WorkSpaces through a web browser.
  @_s.JsonKey(name: 'DeviceTypeWeb')
  final AccessPropertyValue deviceTypeWeb;

  /// Indicates whether users can use Windows clients to access their WorkSpaces.
  /// To restrict WorkSpaces access to trusted devices (also known as managed
  /// devices) with valid certificates, specify a value of <code>TRUST</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/trusted-devices.html">Restrict
  /// WorkSpaces Access to Trusted Devices</a>.
  @_s.JsonKey(name: 'DeviceTypeWindows')
  final AccessPropertyValue deviceTypeWindows;

  /// Indicates whether users can use zero client devices to access their
  /// WorkSpaces.
  @_s.JsonKey(name: 'DeviceTypeZeroClient')
  final AccessPropertyValue deviceTypeZeroClient;

  WorkspaceAccessProperties({
    this.deviceTypeAndroid,
    this.deviceTypeChromeOs,
    this.deviceTypeIos,
    this.deviceTypeOsx,
    this.deviceTypeWeb,
    this.deviceTypeWindows,
    this.deviceTypeZeroClient,
  });
  factory WorkspaceAccessProperties.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceAccessPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$WorkspaceAccessPropertiesToJson(this);
}

/// Describes a WorkSpace bundle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkspaceBundle {
  /// The bundle identifier.
  @_s.JsonKey(name: 'BundleId')
  final String bundleId;

  /// The compute type. For more information, see <a
  /// href="http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles">Amazon
  /// WorkSpaces Bundles</a>.
  @_s.JsonKey(name: 'ComputeType')
  final ComputeType computeType;

  /// A description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The image identifier of the bundle.
  @_s.JsonKey(name: 'ImageId')
  final String imageId;

  /// The last time that the bundle was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The name of the bundle.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The owner of the bundle. This is the account identifier of the owner, or
  /// <code>AMAZON</code> if the bundle is provided by AWS.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The size of the root volume.
  @_s.JsonKey(name: 'RootStorage')
  final RootStorage rootStorage;

  /// The size of the user storage.
  @_s.JsonKey(name: 'UserStorage')
  final UserStorage userStorage;

  WorkspaceBundle({
    this.bundleId,
    this.computeType,
    this.description,
    this.imageId,
    this.lastUpdatedTime,
    this.name,
    this.owner,
    this.rootStorage,
    this.userStorage,
  });
  factory WorkspaceBundle.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceBundleFromJson(json);
}

/// Describes the connection status of a WorkSpace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkspaceConnectionStatus {
  /// The connection state of the WorkSpace. The connection state is unknown if
  /// the WorkSpace is stopped.
  @_s.JsonKey(name: 'ConnectionState')
  final ConnectionState connectionState;

  /// The timestamp of the connection status check.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ConnectionStateCheckTimestamp')
  final DateTime connectionStateCheckTimestamp;

  /// The timestamp of the last known user connection.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastKnownUserConnectionTimestamp')
  final DateTime lastKnownUserConnectionTimestamp;

  /// The identifier of the WorkSpace.
  @_s.JsonKey(name: 'WorkspaceId')
  final String workspaceId;

  WorkspaceConnectionStatus({
    this.connectionState,
    this.connectionStateCheckTimestamp,
    this.lastKnownUserConnectionTimestamp,
    this.workspaceId,
  });
  factory WorkspaceConnectionStatus.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceConnectionStatusFromJson(json);
}

/// Describes the default properties that are used for creating WorkSpaces. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/update-directory-details.html">Update
/// Directory Details for Your WorkSpaces</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WorkspaceCreationProperties {
  /// The identifier of your custom security group.
  @_s.JsonKey(name: 'CustomSecurityGroupId')
  final String customSecurityGroupId;

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
  @_s.JsonKey(name: 'DefaultOu')
  final String defaultOu;

  /// Indicates whether internet access is enabled for your WorkSpaces.
  @_s.JsonKey(name: 'EnableInternetAccess')
  final bool enableInternetAccess;

  /// Indicates whether maintenance mode is enabled for your WorkSpaces. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/workspace-maintenance.html">WorkSpace
  /// Maintenance</a>.
  @_s.JsonKey(name: 'EnableMaintenanceMode')
  final bool enableMaintenanceMode;

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
  @_s.JsonKey(name: 'EnableWorkDocs')
  final bool enableWorkDocs;

  /// Indicates whether users are local administrators of their WorkSpaces.
  @_s.JsonKey(name: 'UserEnabledAsLocalAdministrator')
  final bool userEnabledAsLocalAdministrator;

  WorkspaceCreationProperties({
    this.customSecurityGroupId,
    this.defaultOu,
    this.enableInternetAccess,
    this.enableMaintenanceMode,
    this.enableWorkDocs,
    this.userEnabledAsLocalAdministrator,
  });
  Map<String, dynamic> toJson() => _$WorkspaceCreationPropertiesToJson(this);
}

/// Describes a directory that is used with Amazon WorkSpaces.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkspaceDirectory {
  /// The directory alias.
  @_s.JsonKey(name: 'Alias')
  final String alias;

  /// The user name for the service account.
  @_s.JsonKey(name: 'CustomerUserName')
  final String customerUserName;

  /// The directory identifier.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The name of the directory.
  @_s.JsonKey(name: 'DirectoryName')
  final String directoryName;

  /// The directory type.
  @_s.JsonKey(name: 'DirectoryType')
  final WorkspaceDirectoryType directoryType;

  /// The IP addresses of the DNS servers for the directory.
  @_s.JsonKey(name: 'DnsIpAddresses')
  final List<String> dnsIpAddresses;

  /// The identifier of the IAM role. This is the role that allows Amazon
  /// WorkSpaces to make calls to other services, such as Amazon EC2, on your
  /// behalf.
  @_s.JsonKey(name: 'IamRoleId')
  final String iamRoleId;

  /// The registration code for the directory. This is the code that users enter
  /// in their Amazon WorkSpaces client application to connect to the directory.
  @_s.JsonKey(name: 'RegistrationCode')
  final String registrationCode;

  /// The default self-service permissions for WorkSpaces in the directory.
  @_s.JsonKey(name: 'SelfservicePermissions')
  final SelfservicePermissions selfservicePermissions;

  /// The state of the directory's registration with Amazon WorkSpaces. After a
  /// directory is deregistered, the <code>DEREGISTERED</code> state is returned
  /// very briefly before the directory metadata is cleaned up, so this state is
  /// rarely returned. To confirm that a directory is deregistered, check for the
  /// directory ID by using <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceDirectories.html">
  /// DescribeWorkspaceDirectories</a>. If the directory ID isn't returned, then
  /// the directory has been successfully deregistered.
  @_s.JsonKey(name: 'State')
  final WorkspaceDirectoryState state;

  /// The identifiers of the subnets used with the directory.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// Specifies whether the directory is dedicated or shared. To use Bring Your
  /// Own License (BYOL), this value must be set to <code>DEDICATED</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html">Bring
  /// Your Own Windows Desktop Images</a>.
  @_s.JsonKey(name: 'Tenancy')
  final Tenancy tenancy;

  /// The devices and operating systems that users can use to access WorkSpaces.
  @_s.JsonKey(name: 'WorkspaceAccessProperties')
  final WorkspaceAccessProperties workspaceAccessProperties;

  /// The default creation properties for all WorkSpaces in the directory.
  @_s.JsonKey(name: 'WorkspaceCreationProperties')
  final DefaultWorkspaceCreationProperties workspaceCreationProperties;

  /// The identifier of the security group that is assigned to new WorkSpaces.
  @_s.JsonKey(name: 'WorkspaceSecurityGroupId')
  final String workspaceSecurityGroupId;

  /// The identifiers of the IP access control groups associated with the
  /// directory.
  @_s.JsonKey(name: 'ipGroupIds')
  final List<String> ipGroupIds;

  WorkspaceDirectory({
    this.alias,
    this.customerUserName,
    this.directoryId,
    this.directoryName,
    this.directoryType,
    this.dnsIpAddresses,
    this.iamRoleId,
    this.registrationCode,
    this.selfservicePermissions,
    this.state,
    this.subnetIds,
    this.tenancy,
    this.workspaceAccessProperties,
    this.workspaceCreationProperties,
    this.workspaceSecurityGroupId,
    this.ipGroupIds,
  });
  factory WorkspaceDirectory.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDirectoryFromJson(json);
}

enum WorkspaceDirectoryState {
  @_s.JsonValue('REGISTERING')
  registering,
  @_s.JsonValue('REGISTERED')
  registered,
  @_s.JsonValue('DEREGISTERING')
  deregistering,
  @_s.JsonValue('DEREGISTERED')
  deregistered,
  @_s.JsonValue('ERROR')
  error,
}

enum WorkspaceDirectoryType {
  @_s.JsonValue('SIMPLE_AD')
  simpleAd,
  @_s.JsonValue('AD_CONNECTOR')
  adConnector,
}

/// Describes a WorkSpace image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkspaceImage {
  /// The date when the image was created. If the image has been shared, the AWS
  /// account that the image has been shared with sees the original creation date
  /// of the image.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Created')
  final DateTime created;

  /// The description of the image.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The error code that is returned for the image.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The text of the error message that is returned for the image.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier of the image.
  @_s.JsonKey(name: 'ImageId')
  final String imageId;

  /// The name of the image.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The operating system that the image is running.
  @_s.JsonKey(name: 'OperatingSystem')
  final OperatingSystem operatingSystem;

  /// The identifier of the AWS account that owns the image.
  @_s.JsonKey(name: 'OwnerAccountId')
  final String ownerAccountId;

  /// Specifies whether the image is running on dedicated hardware. When Bring
  /// Your Own License (BYOL) is enabled, this value is set to
  /// <code>DEDICATED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html">Bring
  /// Your Own Windows Desktop Images</a>.
  @_s.JsonKey(name: 'RequiredTenancy')
  final WorkspaceImageRequiredTenancy requiredTenancy;

  /// The status of the image.
  @_s.JsonKey(name: 'State')
  final WorkspaceImageState state;

  WorkspaceImage({
    this.created,
    this.description,
    this.errorCode,
    this.errorMessage,
    this.imageId,
    this.name,
    this.operatingSystem,
    this.ownerAccountId,
    this.requiredTenancy,
    this.state,
  });
  factory WorkspaceImage.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceImageFromJson(json);
}

enum WorkspaceImageIngestionProcess {
  @_s.JsonValue('BYOL_REGULAR')
  byolRegular,
  @_s.JsonValue('BYOL_GRAPHICS')
  byolGraphics,
  @_s.JsonValue('BYOL_GRAPHICSPRO')
  byolGraphicspro,
  @_s.JsonValue('BYOL_REGULAR_WSP')
  byolRegularWsp,
}

extension on WorkspaceImageIngestionProcess {
  String toValue() {
    switch (this) {
      case WorkspaceImageIngestionProcess.byolRegular:
        return 'BYOL_REGULAR';
      case WorkspaceImageIngestionProcess.byolGraphics:
        return 'BYOL_GRAPHICS';
      case WorkspaceImageIngestionProcess.byolGraphicspro:
        return 'BYOL_GRAPHICSPRO';
      case WorkspaceImageIngestionProcess.byolRegularWsp:
        return 'BYOL_REGULAR_WSP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum WorkspaceImageRequiredTenancy {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('DEDICATED')
  dedicated,
}

enum WorkspaceImageState {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('ERROR')
  error,
}

/// Describes a WorkSpace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WorkspaceProperties {
  /// The compute type. For more information, see <a
  /// href="http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles">Amazon
  /// WorkSpaces Bundles</a>.
  @_s.JsonKey(name: 'ComputeTypeName')
  final Compute computeTypeName;

  /// The size of the root volume. For important information about how to modify
  /// the size of the root and user volumes, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html">Modify
  /// a WorkSpace</a>.
  @_s.JsonKey(name: 'RootVolumeSizeGib')
  final int rootVolumeSizeGib;

  /// The running mode. For more information, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/running-mode.html">Manage
  /// the WorkSpace Running Mode</a>.
  @_s.JsonKey(name: 'RunningMode')
  final RunningMode runningMode;

  /// The time after a user logs off when WorkSpaces are automatically stopped.
  /// Configured in 60-minute intervals.
  @_s.JsonKey(name: 'RunningModeAutoStopTimeoutInMinutes')
  final int runningModeAutoStopTimeoutInMinutes;

  /// The size of the user storage. For important information about how to modify
  /// the size of the root and user volumes, see <a
  /// href="https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html">Modify
  /// a WorkSpace</a>.
  @_s.JsonKey(name: 'UserVolumeSizeGib')
  final int userVolumeSizeGib;

  WorkspaceProperties({
    this.computeTypeName,
    this.rootVolumeSizeGib,
    this.runningMode,
    this.runningModeAutoStopTimeoutInMinutes,
    this.userVolumeSizeGib,
  });
  factory WorkspaceProperties.fromJson(Map<String, dynamic> json) =>
      _$WorkspacePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$WorkspacePropertiesToJson(this);
}

/// Describes the information used to create a WorkSpace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WorkspaceRequest {
  /// The identifier of the bundle for the WorkSpace. You can use
  /// <a>DescribeWorkspaceBundles</a> to list the available bundles.
  @_s.JsonKey(name: 'BundleId')
  final String bundleId;

  /// The identifier of the AWS Directory Service directory for the WorkSpace. You
  /// can use <a>DescribeWorkspaceDirectories</a> to list the available
  /// directories.
  @_s.JsonKey(name: 'DirectoryId')
  final String directoryId;

  /// The user name of the user for the WorkSpace. This user name must exist in
  /// the AWS Directory Service directory for the WorkSpace.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  /// Indicates whether the data stored on the root volume is encrypted.
  @_s.JsonKey(name: 'RootVolumeEncryptionEnabled')
  final bool rootVolumeEncryptionEnabled;

  /// The tags for the WorkSpace.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// Indicates whether the data stored on the user volume is encrypted.
  @_s.JsonKey(name: 'UserVolumeEncryptionEnabled')
  final bool userVolumeEncryptionEnabled;

  /// The symmetric AWS KMS customer master key (CMK) used to encrypt data stored
  /// on your WorkSpace. Amazon WorkSpaces does not support asymmetric CMKs.
  @_s.JsonKey(name: 'VolumeEncryptionKey')
  final String volumeEncryptionKey;

  /// The WorkSpace properties.
  @_s.JsonKey(name: 'WorkspaceProperties')
  final WorkspaceProperties workspaceProperties;

  WorkspaceRequest({
    @_s.required this.bundleId,
    @_s.required this.directoryId,
    @_s.required this.userName,
    this.rootVolumeEncryptionEnabled,
    this.tags,
    this.userVolumeEncryptionEnabled,
    this.volumeEncryptionKey,
    this.workspaceProperties,
  });
  factory WorkspaceRequest.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WorkspaceRequestToJson(this);
}

enum WorkspaceState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('IMPAIRED')
  impaired,
  @_s.JsonValue('UNHEALTHY')
  unhealthy,
  @_s.JsonValue('REBOOTING')
  rebooting,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('REBUILDING')
  rebuilding,
  @_s.JsonValue('RESTORING')
  restoring,
  @_s.JsonValue('MAINTENANCE')
  maintenance,
  @_s.JsonValue('ADMIN_MAINTENANCE')
  adminMaintenance,
  @_s.JsonValue('TERMINATING')
  terminating,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('SUSPENDED')
  suspended,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('ERROR')
  error,
}

/// Describes an IP access control group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkspacesIpGroup {
  /// The description of the group.
  @_s.JsonKey(name: 'groupDesc')
  final String groupDesc;

  /// The identifier of the group.
  @_s.JsonKey(name: 'groupId')
  final String groupId;

  /// The name of the group.
  @_s.JsonKey(name: 'groupName')
  final String groupName;

  /// The rules.
  @_s.JsonKey(name: 'userRules')
  final List<IpRuleItem> userRules;

  WorkspacesIpGroup({
    this.groupDesc,
    this.groupId,
    this.groupName,
    this.userRules,
  });
  factory WorkspacesIpGroup.fromJson(Map<String, dynamic> json) =>
      _$WorkspacesIpGroupFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InvalidParameterValuesException extends _s.GenericAwsException {
  InvalidParameterValuesException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValuesException',
            message: message);
}

class InvalidResourceStateException extends _s.GenericAwsException {
  InvalidResourceStateException({String type, String message})
      : super(
            type: type,
            code: 'InvalidResourceStateException',
            message: message);
}

class OperationInProgressException extends _s.GenericAwsException {
  OperationInProgressException({String type, String message})
      : super(
            type: type, code: 'OperationInProgressException', message: message);
}

class OperationNotSupportedException extends _s.GenericAwsException {
  OperationNotSupportedException({String type, String message})
      : super(
            type: type,
            code: 'OperationNotSupportedException',
            message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceAssociatedException extends _s.GenericAwsException {
  ResourceAssociatedException({String type, String message})
      : super(
            type: type, code: 'ResourceAssociatedException', message: message);
}

class ResourceCreationFailedException extends _s.GenericAwsException {
  ResourceCreationFailedException({String type, String message})
      : super(
            type: type,
            code: 'ResourceCreationFailedException',
            message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class UnsupportedNetworkConfigurationException extends _s.GenericAwsException {
  UnsupportedNetworkConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedNetworkConfigurationException',
            message: message);
}

class UnsupportedWorkspaceConfigurationException
    extends _s.GenericAwsException {
  UnsupportedWorkspaceConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedWorkspaceConfigurationException',
            message: message);
}

class WorkspacesDefaultRoleNotFoundException extends _s.GenericAwsException {
  WorkspacesDefaultRoleNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'WorkspacesDefaultRoleNotFoundException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InvalidParameterValuesException': (type, message) =>
      InvalidParameterValuesException(type: type, message: message),
  'InvalidResourceStateException': (type, message) =>
      InvalidResourceStateException(type: type, message: message),
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
  'WorkspacesDefaultRoleNotFoundException': (type, message) =>
      WorkspacesDefaultRoleNotFoundException(type: type, message: message),
};
