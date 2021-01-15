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

part '2017-04-19.g.dart';

/// This is the API reference for AWS CodeStar. This reference provides
/// descriptions of the operations and data types for the AWS CodeStar API along
/// with usage examples.
class CodeStar {
  final _s.JsonProtocol _protocol;
  CodeStar({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codestar',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds an IAM user to the team for an AWS CodeStar project.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ProjectNotFoundException].
  /// May throw [TeamMemberAlreadyAssociatedException].
  /// May throw [ValidationException].
  /// May throw [InvalidServiceRoleException].
  /// May throw [ProjectConfigurationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project to which you will add the IAM user.
  ///
  /// Parameter [projectRole] :
  /// The AWS CodeStar project role that will apply to this user. This role
  /// determines what actions a user can take in an AWS CodeStar project.
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) for the IAM user you want to add to the AWS
  /// CodeStar project.
  ///
  /// Parameter [clientRequestToken] :
  /// A user- or system-generated token that identifies the entity that
  /// requested the team member association to the project. This token can be
  /// used to repeat the request.
  ///
  /// Parameter [remoteAccessAllowed] :
  /// Whether the team member is allowed to use an SSH public/private key pair
  /// to remotely access project resources, for example Amazon EC2 instances.
  Future<AssociateTeamMemberResult> associateTeamMember({
    @_s.required String projectId,
    @_s.required String projectRole,
    @_s.required String userArn,
    String clientRequestToken,
    bool remoteAccessAllowed,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectRole, 'projectRole');
    _s.validateStringPattern(
      'projectRole',
      projectRole,
      r'''^(Owner|Viewer|Contributor)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userArn, 'userArn');
    _s.validateStringLength(
      'userArn',
      userArn,
      32,
      95,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''^arn:aws:iam::\d{12}:user(?:(\u002F)|(\u002F[\u0021-\u007E]+\u002F))[\w+=,.@-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      256,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[\w:/-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.AssociateTeamMember'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectId': projectId,
        'projectRole': projectRole,
        'userArn': userArn,
        if (clientRequestToken != null)
          'clientRequestToken': clientRequestToken,
        if (remoteAccessAllowed != null)
          'remoteAccessAllowed': remoteAccessAllowed,
      },
    );

    return AssociateTeamMemberResult.fromJson(jsonResponse.body);
  }

  /// Creates a project, including project resources. This action creates a
  /// project based on a submitted project request. A set of source code files
  /// and a toolchain template file can be included with the project request. If
  /// these are not provided, an empty project is created.
  ///
  /// May throw [ProjectAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [ProjectCreationFailedException].
  /// May throw [InvalidServiceRoleException].
  /// May throw [ProjectConfigurationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [id] :
  /// The ID of the project to be created in AWS CodeStar.
  ///
  /// Parameter [name] :
  /// The display name for the project to be created in AWS CodeStar.
  ///
  /// Parameter [clientRequestToken] :
  /// A user- or system-generated token that identifies the entity that
  /// requested project creation. This token can be used to repeat the request.
  ///
  /// Parameter [description] :
  /// The description of the project, if any.
  ///
  /// Parameter [sourceCode] :
  /// A list of the Code objects submitted with the project request. If this
  /// parameter is specified, the request must also include the toolchain
  /// parameter.
  ///
  /// Parameter [tags] :
  /// The tags created for the project.
  ///
  /// Parameter [toolchain] :
  /// The name of the toolchain template file submitted with the project
  /// request. If this parameter is specified, the request must also include the
  /// sourceCode parameter.
  Future<CreateProjectResult> createProject({
    @_s.required String id,
    @_s.required String name,
    String clientRequestToken,
    String description,
    List<Code> sourceCode,
    Map<String, String> tags,
    Toolchain toolchain,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^\S(.*\S)?$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      256,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[\w:/-]+$''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^$|^\S(.*\S)?$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.CreateProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'name': name,
        if (clientRequestToken != null)
          'clientRequestToken': clientRequestToken,
        if (description != null) 'description': description,
        if (sourceCode != null) 'sourceCode': sourceCode,
        if (tags != null) 'tags': tags,
        if (toolchain != null) 'toolchain': toolchain,
      },
    );

    return CreateProjectResult.fromJson(jsonResponse.body);
  }

  /// Creates a profile for a user that includes user preferences, such as the
  /// display name and email address assocciated with the user, in AWS CodeStar.
  /// The user profile is not project-specific. Information in the user profile
  /// is displayed wherever the user's information appears to other users in AWS
  /// CodeStar.
  ///
  /// May throw [UserProfileAlreadyExistsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [displayName] :
  /// The name that will be displayed as the friendly name for the user in AWS
  /// CodeStar.
  ///
  /// Parameter [emailAddress] :
  /// The email address that will be displayed as part of the user's profile in
  /// AWS CodeStar.
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) of the user in IAM.
  ///
  /// Parameter [sshPublicKey] :
  /// The SSH public key associated with the user in AWS CodeStar. If a project
  /// owner allows the user remote access to project resources, this public key
  /// will be used along with the user's private key for SSH access.
  Future<CreateUserProfileResult> createUserProfile({
    @_s.required String displayName,
    @_s.required String emailAddress,
    @_s.required String userArn,
    String sshPublicKey,
  }) async {
    ArgumentError.checkNotNull(displayName, 'displayName');
    _s.validateStringLength(
      'displayName',
      displayName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'displayName',
      displayName,
      r'''^\S(.*\S)?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(emailAddress, 'emailAddress');
    _s.validateStringLength(
      'emailAddress',
      emailAddress,
      3,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'emailAddress',
      emailAddress,
      r'''^[\w-.+]+@[\w-.+]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userArn, 'userArn');
    _s.validateStringLength(
      'userArn',
      userArn,
      32,
      95,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''^arn:aws:iam::\d{12}:user(?:(\u002F)|(\u002F[\u0021-\u007E]+\u002F))[\w+=,.@-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'sshPublicKey',
      sshPublicKey,
      0,
      16384,
    );
    _s.validateStringPattern(
      'sshPublicKey',
      sshPublicKey,
      r'''^[\t\r\n\u0020-\u00FF]*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.CreateUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'displayName': displayName,
        'emailAddress': emailAddress,
        'userArn': userArn,
        if (sshPublicKey != null) 'sshPublicKey': sshPublicKey,
      },
    );

    return CreateUserProfileResult.fromJson(jsonResponse.body);
  }

  /// Deletes a project, including project resources. Does not delete users
  /// associated with the project, but does delete the IAM roles that allowed
  /// access to the project.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ValidationException].
  /// May throw [InvalidServiceRoleException].
  ///
  /// Parameter [id] :
  /// The ID of the project to be deleted in AWS CodeStar.
  ///
  /// Parameter [clientRequestToken] :
  /// A user- or system-generated token that identifies the entity that
  /// requested project deletion. This token can be used to repeat the request.
  ///
  /// Parameter [deleteStack] :
  /// Whether to send a delete request for the primary stack in AWS
  /// CloudFormation originally used to generate the project and its resources.
  /// This option will delete all AWS resources for the project (except for any
  /// buckets in Amazon S3) as well as deleting the project itself. Recommended
  /// for most use cases.
  Future<DeleteProjectResult> deleteProject({
    @_s.required String id,
    String clientRequestToken,
    bool deleteStack,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      256,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[\w:/-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.DeleteProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (clientRequestToken != null)
          'clientRequestToken': clientRequestToken,
        if (deleteStack != null) 'deleteStack': deleteStack,
      },
    );

    return DeleteProjectResult.fromJson(jsonResponse.body);
  }

  /// Deletes a user profile in AWS CodeStar, including all personal preference
  /// data associated with that profile, such as display name and email address.
  /// It does not delete the history of that user, for example the history of
  /// commits made by that user.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) of the user to delete from AWS CodeStar.
  Future<DeleteUserProfileResult> deleteUserProfile({
    @_s.required String userArn,
  }) async {
    ArgumentError.checkNotNull(userArn, 'userArn');
    _s.validateStringLength(
      'userArn',
      userArn,
      32,
      95,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''^arn:aws:iam::\d{12}:user(?:(\u002F)|(\u002F[\u0021-\u007E]+\u002F))[\w+=,.@-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.DeleteUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'userArn': userArn,
      },
    );

    return DeleteUserProfileResult.fromJson(jsonResponse.body);
  }

  /// Describes a project and its resources.
  ///
  /// May throw [ProjectNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InvalidServiceRoleException].
  /// May throw [ProjectConfigurationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [id] :
  /// The ID of the project.
  Future<DescribeProjectResult> describeProject({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.DescribeProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );

    return DescribeProjectResult.fromJson(jsonResponse.body);
  }

  /// Describes a user in AWS CodeStar and the user attributes across all
  /// projects.
  ///
  /// May throw [UserProfileNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) of the user.
  Future<DescribeUserProfileResult> describeUserProfile({
    @_s.required String userArn,
  }) async {
    ArgumentError.checkNotNull(userArn, 'userArn');
    _s.validateStringLength(
      'userArn',
      userArn,
      32,
      95,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''^arn:aws:iam::\d{12}:user(?:(\u002F)|(\u002F[\u0021-\u007E]+\u002F))[\w+=,.@-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.DescribeUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'userArn': userArn,
      },
    );

    return DescribeUserProfileResult.fromJson(jsonResponse.body);
  }

  /// Removes a user from a project. Removing a user from a project also removes
  /// the IAM policies from that user that allowed access to the project and its
  /// resources. Disassociating a team member does not remove that user's
  /// profile from AWS CodeStar. It does not remove the user from IAM.
  ///
  /// May throw [ProjectNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InvalidServiceRoleException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [projectId] :
  /// The ID of the AWS CodeStar project from which you want to remove a team
  /// member.
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) of the IAM user or group whom you want to
  /// remove from the project.
  Future<void> disassociateTeamMember({
    @_s.required String projectId,
    @_s.required String userArn,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userArn, 'userArn');
    _s.validateStringLength(
      'userArn',
      userArn,
      32,
      95,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''^arn:aws:iam::\d{12}:user(?:(\u002F)|(\u002F[\u0021-\u007E]+\u002F))[\w+=,.@-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.DisassociateTeamMember'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectId': projectId,
        'userArn': userArn,
      },
    );

    return DisassociateTeamMemberResult.fromJson(jsonResponse.body);
  }

  /// Lists all projects in AWS CodeStar associated with your AWS account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum amount of data that can be contained in a single set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The continuation token to be used to return the next set of results, if
  /// the results cannot be returned in one response.
  Future<ListProjectsResult> listProjects({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      512,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w/+=]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.ListProjects'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListProjectsResult.fromJson(jsonResponse.body);
  }

  /// Lists resources associated with a project in AWS CodeStar.
  ///
  /// May throw [ProjectNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ValidationException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  ///
  /// Parameter [maxResults] :
  /// The maximum amount of data that can be contained in a single set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The continuation token for the next set of results, if the results cannot
  /// be returned in one response.
  Future<ListResourcesResult> listResources({
    @_s.required String projectId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      512,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w/+=]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.ListResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectId': projectId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListResourcesResult.fromJson(jsonResponse.body);
  }

  /// Gets the tags for a project.
  ///
  /// May throw [ProjectNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [id] :
  /// The ID of the project to get tags for.
  ///
  /// Parameter [maxResults] :
  /// Reserved for future use.
  ///
  /// Parameter [nextToken] :
  /// Reserved for future use.
  Future<ListTagsForProjectResult> listTagsForProject({
    @_s.required String id,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      512,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w/+=]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.ListTagsForProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTagsForProjectResult.fromJson(jsonResponse.body);
  }

  /// Lists all team members associated with a project.
  ///
  /// May throw [ProjectNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ValidationException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project for which you want to list team members.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of team members you want returned in a response.
  ///
  /// Parameter [nextToken] :
  /// The continuation token for the next set of results, if the results cannot
  /// be returned in one response.
  Future<ListTeamMembersResult> listTeamMembers({
    @_s.required String projectId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      512,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w/+=]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.ListTeamMembers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectId': projectId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTeamMembersResult.fromJson(jsonResponse.body);
  }

  /// Lists all the user profiles configured for your AWS account in AWS
  /// CodeStar.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a response.
  ///
  /// Parameter [nextToken] :
  /// The continuation token for the next set of results, if the results cannot
  /// be returned in one response.
  Future<ListUserProfilesResult> listUserProfiles({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      512,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w/+=]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.ListUserProfiles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListUserProfilesResult.fromJson(jsonResponse.body);
  }

  /// Adds tags to a project.
  ///
  /// May throw [ProjectNotFoundException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [id] :
  /// The ID of the project you want to add a tag to.
  ///
  /// Parameter [tags] :
  /// The tags you want to add to the project.
  Future<TagProjectResult> tagProject({
    @_s.required String id,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.TagProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'tags': tags,
      },
    );

    return TagProjectResult.fromJson(jsonResponse.body);
  }

  /// Removes tags from a project.
  ///
  /// May throw [ProjectNotFoundException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [id] :
  /// The ID of the project to remove tags from.
  ///
  /// Parameter [tags] :
  /// The tags to remove from the project.
  Future<void> untagProject({
    @_s.required String id,
    @_s.required List<String> tags,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.UntagProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        'tags': tags,
      },
    );

    return UntagProjectResult.fromJson(jsonResponse.body);
  }

  /// Updates a project in AWS CodeStar.
  ///
  /// May throw [ProjectNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the project you want to update.
  ///
  /// Parameter [description] :
  /// The description of the project, if any.
  ///
  /// Parameter [name] :
  /// The name of the project you want to update.
  Future<void> updateProject({
    @_s.required String id,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^$|^\S(.*\S)?$''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^\S(.*\S)?$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.UpdateProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
      },
    );

    return UpdateProjectResult.fromJson(jsonResponse.body);
  }

  /// Updates a team member's attributes in an AWS CodeStar project. For
  /// example, you can change a team member's role in the project, or change
  /// whether they have remote access to project resources.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ProjectNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InvalidServiceRoleException].
  /// May throw [ProjectConfigurationException].
  /// May throw [ConcurrentModificationException].
  /// May throw [TeamMemberNotFoundException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) of the user for whom you want to change
  /// team membership attributes.
  ///
  /// Parameter [projectRole] :
  /// The role assigned to the user in the project. Project roles have different
  /// levels of access. For more information, see <a
  /// href="http://docs.aws.amazon.com/codestar/latest/userguide/working-with-teams.html">Working
  /// with Teams</a> in the <i>AWS CodeStar User Guide</i>.
  ///
  /// Parameter [remoteAccessAllowed] :
  /// Whether a team member is allowed to remotely access project resources
  /// using the SSH public key associated with the user's profile. Even if this
  /// is set to True, the user must associate a public key with their profile
  /// before the user can access resources.
  Future<UpdateTeamMemberResult> updateTeamMember({
    @_s.required String projectId,
    @_s.required String userArn,
    String projectRole,
    bool remoteAccessAllowed,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      2,
      15,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[a-z][a-z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userArn, 'userArn');
    _s.validateStringLength(
      'userArn',
      userArn,
      32,
      95,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''^arn:aws:iam::\d{12}:user(?:(\u002F)|(\u002F[\u0021-\u007E]+\u002F))[\w+=,.@-]+$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectRole',
      projectRole,
      r'''^(Owner|Viewer|Contributor)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.UpdateTeamMember'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectId': projectId,
        'userArn': userArn,
        if (projectRole != null) 'projectRole': projectRole,
        if (remoteAccessAllowed != null)
          'remoteAccessAllowed': remoteAccessAllowed,
      },
    );

    return UpdateTeamMemberResult.fromJson(jsonResponse.body);
  }

  /// Updates a user's profile in AWS CodeStar. The user profile is not
  /// project-specific. Information in the user profile is displayed wherever
  /// the user's information appears to other users in AWS CodeStar.
  ///
  /// May throw [UserProfileNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userArn] :
  /// The name that will be displayed as the friendly name for the user in AWS
  /// CodeStar.
  ///
  /// Parameter [displayName] :
  /// The name that is displayed as the friendly name for the user in AWS
  /// CodeStar.
  ///
  /// Parameter [emailAddress] :
  /// The email address that is displayed as part of the user's profile in AWS
  /// CodeStar.
  ///
  /// Parameter [sshPublicKey] :
  /// The SSH public key associated with the user in AWS CodeStar. If a project
  /// owner allows the user remote access to project resources, this public key
  /// will be used along with the user's private key for SSH access.
  Future<UpdateUserProfileResult> updateUserProfile({
    @_s.required String userArn,
    String displayName,
    String emailAddress,
    String sshPublicKey,
  }) async {
    ArgumentError.checkNotNull(userArn, 'userArn');
    _s.validateStringLength(
      'userArn',
      userArn,
      32,
      95,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''^arn:aws:iam::\d{12}:user(?:(\u002F)|(\u002F[\u0021-\u007E]+\u002F))[\w+=,.@-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      1,
      64,
    );
    _s.validateStringPattern(
      'displayName',
      displayName,
      r'''^\S(.*\S)?$''',
    );
    _s.validateStringLength(
      'emailAddress',
      emailAddress,
      3,
      128,
    );
    _s.validateStringPattern(
      'emailAddress',
      emailAddress,
      r'''^[\w-.+]+@[\w-.+]+$''',
    );
    _s.validateStringLength(
      'sshPublicKey',
      sshPublicKey,
      0,
      16384,
    );
    _s.validateStringPattern(
      'sshPublicKey',
      sshPublicKey,
      r'''^[\t\r\n\u0020-\u00FF]*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.UpdateUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'userArn': userArn,
        if (displayName != null) 'displayName': displayName,
        if (emailAddress != null) 'emailAddress': emailAddress,
        if (sshPublicKey != null) 'sshPublicKey': sshPublicKey,
      },
    );

    return UpdateUserProfileResult.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateTeamMemberResult {
  /// The user- or system-generated token from the initial request that can be
  /// used to repeat the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  AssociateTeamMemberResult({
    this.clientRequestToken,
  });
  factory AssociateTeamMemberResult.fromJson(Map<String, dynamic> json) =>
      _$AssociateTeamMemberResultFromJson(json);
}

/// Location and destination information about the source code files provided
/// with the project request. The source code is uploaded to the new project
/// source repository after project creation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Code {
  /// The repository to be created in AWS CodeStar. Valid values are AWS
  /// CodeCommit or GitHub. After AWS CodeStar provisions the new repository, the
  /// source code files provided with the project request are placed in the
  /// repository.
  @_s.JsonKey(name: 'destination')
  final CodeDestination destination;

  /// The location where the source code files provided with the project request
  /// are stored. AWS CodeStar retrieves the files during project creation.
  @_s.JsonKey(name: 'source')
  final CodeSource source;

  Code({
    @_s.required this.destination,
    @_s.required this.source,
  });
  Map<String, dynamic> toJson() => _$CodeToJson(this);
}

/// Information about the AWS CodeCommit repository to be created in AWS
/// CodeStar. This is where the source code files provided with the project
/// request will be uploaded after project creation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CodeCommitCodeDestination {
  /// The name of the AWS CodeCommit repository to be created in AWS CodeStar.
  @_s.JsonKey(name: 'name')
  final String name;

  CodeCommitCodeDestination({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$CodeCommitCodeDestinationToJson(this);
}

/// The repository to be created in AWS CodeStar. Valid values are AWS
/// CodeCommit or GitHub. After AWS CodeStar provisions the new repository, the
/// source code files provided with the project request are placed in the
/// repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CodeDestination {
  /// Information about the AWS CodeCommit repository to be created in AWS
  /// CodeStar. This is where the source code files provided with the project
  /// request will be uploaded after project creation.
  @_s.JsonKey(name: 'codeCommit')
  final CodeCommitCodeDestination codeCommit;

  /// Information about the GitHub repository to be created in AWS CodeStar. This
  /// is where the source code files provided with the project request will be
  /// uploaded after project creation.
  @_s.JsonKey(name: 'gitHub')
  final GitHubCodeDestination gitHub;

  CodeDestination({
    this.codeCommit,
    this.gitHub,
  });
  Map<String, dynamic> toJson() => _$CodeDestinationToJson(this);
}

/// The location where the source code files provided with the project request
/// are stored. AWS CodeStar retrieves the files during project creation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CodeSource {
  /// Information about the Amazon S3 location where the source code files
  /// provided with the project request are stored.
  @_s.JsonKey(name: 's3')
  final S3Location s3;

  CodeSource({
    @_s.required this.s3,
  });
  Map<String, dynamic> toJson() => _$CodeSourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectResult {
  /// The Amazon Resource Name (ARN) of the created project.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The ID of the project.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A user- or system-generated token that identifies the entity that requested
  /// project creation.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// Reserved for future use.
  @_s.JsonKey(name: 'projectTemplateId')
  final String projectTemplateId;

  CreateProjectResult({
    @_s.required this.arn,
    @_s.required this.id,
    this.clientRequestToken,
    this.projectTemplateId,
  });
  factory CreateProjectResult.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user in IAM.
  @_s.JsonKey(name: 'userArn')
  final String userArn;

  /// The date the user profile was created, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdTimestamp')
  final DateTime createdTimestamp;

  /// The name that is displayed as the friendly name for the user in AWS
  /// CodeStar.
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The email address that is displayed as part of the user's profile in AWS
  /// CodeStar.
  @_s.JsonKey(name: 'emailAddress')
  final String emailAddress;

  /// The date the user profile was last modified, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedTimestamp')
  final DateTime lastModifiedTimestamp;

  /// The SSH public key associated with the user in AWS CodeStar. This is the
  /// public portion of the public/private keypair the user can use to access
  /// project resources if a project owner allows the user remote access to those
  /// resources.
  @_s.JsonKey(name: 'sshPublicKey')
  final String sshPublicKey;

  CreateUserProfileResult({
    @_s.required this.userArn,
    this.createdTimestamp,
    this.displayName,
    this.emailAddress,
    this.lastModifiedTimestamp,
    this.sshPublicKey,
  });
  factory CreateUserProfileResult.fromJson(Map<String, dynamic> json) =>
      _$CreateUserProfileResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectResult {
  /// The Amazon Resource Name (ARN) of the deleted project.
  @_s.JsonKey(name: 'projectArn')
  final String projectArn;

  /// The ID of the primary stack in AWS CloudFormation that will be deleted as
  /// part of deleting the project and its resources.
  @_s.JsonKey(name: 'stackId')
  final String stackId;

  DeleteProjectResult({
    this.projectArn,
    this.stackId,
  });
  factory DeleteProjectResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user deleted from AWS CodeStar.
  @_s.JsonKey(name: 'userArn')
  final String userArn;

  DeleteUserProfileResult({
    @_s.required this.userArn,
  });
  factory DeleteUserProfileResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserProfileResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProjectResult {
  /// The Amazon Resource Name (ARN) for the project.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A user- or system-generated token that identifies the entity that requested
  /// project creation.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The date and time the project was created, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdTimeStamp')
  final DateTime createdTimeStamp;

  /// The description of the project, if any.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ID of the project.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The display name for the project.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ID for the AWS CodeStar project template used to create the project.
  @_s.JsonKey(name: 'projectTemplateId')
  final String projectTemplateId;

  /// The ID of the primary stack in AWS CloudFormation used to generate resources
  /// for the project.
  @_s.JsonKey(name: 'stackId')
  final String stackId;

  /// The project creation or deletion status.
  @_s.JsonKey(name: 'status')
  final ProjectStatus status;

  DescribeProjectResult({
    this.arn,
    this.clientRequestToken,
    this.createdTimeStamp,
    this.description,
    this.id,
    this.name,
    this.projectTemplateId,
    this.stackId,
    this.status,
  });
  factory DescribeProjectResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserProfileResult {
  /// The date and time when the user profile was created in AWS CodeStar, in
  /// timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdTimestamp')
  final DateTime createdTimestamp;

  /// The date and time when the user profile was last modified, in timestamp
  /// format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedTimestamp')
  final DateTime lastModifiedTimestamp;

  /// The Amazon Resource Name (ARN) of the user.
  @_s.JsonKey(name: 'userArn')
  final String userArn;

  /// The display name shown for the user in AWS CodeStar projects. For example,
  /// this could be set to both first and last name ("Mary Major") or a single
  /// name ("Mary"). The display name is also used to generate the initial icon
  /// associated with the user in AWS CodeStar projects. If spaces are included in
  /// the display name, the first character that appears after the space will be
  /// used as the second character in the user initial icon. The initial icon
  /// displays a maximum of two characters, so a display name with more than one
  /// space (for example "Mary Jane Major") would generate an initial icon using
  /// the first character and the first character after the space ("MJ", not
  /// "MM").
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The email address for the user. Optional.
  @_s.JsonKey(name: 'emailAddress')
  final String emailAddress;

  /// The SSH public key associated with the user. This SSH public key is
  /// associated with the user profile, and can be used in conjunction with the
  /// associated private key for access to project resources, such as Amazon EC2
  /// instances, if a project owner grants remote access to those resources.
  @_s.JsonKey(name: 'sshPublicKey')
  final String sshPublicKey;

  DescribeUserProfileResult({
    @_s.required this.createdTimestamp,
    @_s.required this.lastModifiedTimestamp,
    @_s.required this.userArn,
    this.displayName,
    this.emailAddress,
    this.sshPublicKey,
  });
  factory DescribeUserProfileResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserProfileResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateTeamMemberResult {
  DisassociateTeamMemberResult();
  factory DisassociateTeamMemberResult.fromJson(Map<String, dynamic> json) =>
      _$DisassociateTeamMemberResultFromJson(json);
}

/// Information about the GitHub repository to be created in AWS CodeStar. This
/// is where the source code files provided with the project request will be
/// uploaded after project creation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GitHubCodeDestination {
  /// Whether to enable issues for the GitHub repository.
  @_s.JsonKey(name: 'issuesEnabled')
  final bool issuesEnabled;

  /// Name of the GitHub repository to be created in AWS CodeStar.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The GitHub username for the owner of the GitHub repository to be created in
  /// AWS CodeStar. If this repository should be owned by a GitHub organization,
  /// provide its name.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// Whether the GitHub repository is to be a private repository.
  @_s.JsonKey(name: 'privateRepository')
  final bool privateRepository;

  /// The GitHub user's personal access token for the GitHub repository.
  @_s.JsonKey(name: 'token')
  final String token;

  /// The type of GitHub repository to be created in AWS CodeStar. Valid values
  /// are User or Organization.
  @_s.JsonKey(name: 'type')
  final String type;

  /// Description for the GitHub repository to be created in AWS CodeStar. This
  /// description displays in GitHub after the repository is created.
  @_s.JsonKey(name: 'description')
  final String description;

  GitHubCodeDestination({
    @_s.required this.issuesEnabled,
    @_s.required this.name,
    @_s.required this.owner,
    @_s.required this.privateRepository,
    @_s.required this.token,
    @_s.required this.type,
    this.description,
  });
  Map<String, dynamic> toJson() => _$GitHubCodeDestinationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProjectsResult {
  /// A list of projects.
  @_s.JsonKey(name: 'projects')
  final List<ProjectSummary> projects;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListProjectsResult({
    @_s.required this.projects,
    this.nextToken,
  });
  factory ListProjectsResult.fromJson(Map<String, dynamic> json) =>
      _$ListProjectsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourcesResult {
  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of resources associated with the project.
  @_s.JsonKey(name: 'resources')
  final List<Resource> resources;

  ListResourcesResult({
    this.nextToken,
    this.resources,
  });
  factory ListResourcesResult.fromJson(Map<String, dynamic> json) =>
      _$ListResourcesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForProjectResult {
  /// Reserved for future use.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The tags for the project.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForProjectResult({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForProjectResult.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTeamMembersResult {
  /// A list of team member objects for the project.
  @_s.JsonKey(name: 'teamMembers')
  final List<TeamMember> teamMembers;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListTeamMembersResult({
    @_s.required this.teamMembers,
    this.nextToken,
  });
  factory ListTeamMembersResult.fromJson(Map<String, dynamic> json) =>
      _$ListTeamMembersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUserProfilesResult {
  /// All the user profiles configured in AWS CodeStar for an AWS account.
  @_s.JsonKey(name: 'userProfiles')
  final List<UserProfileSummary> userProfiles;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListUserProfilesResult({
    @_s.required this.userProfiles,
    this.nextToken,
  });
  factory ListUserProfilesResult.fromJson(Map<String, dynamic> json) =>
      _$ListUserProfilesResultFromJson(json);
}

/// An indication of whether a project creation or deletion is failed or
/// successful.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectStatus {
  /// The phase of completion for a project creation or deletion.
  @_s.JsonKey(name: 'state')
  final String state;

  /// In the case of a project creation or deletion failure, a reason for the
  /// failure.
  @_s.JsonKey(name: 'reason')
  final String reason;

  ProjectStatus({
    @_s.required this.state,
    this.reason,
  });
  factory ProjectStatus.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatusFromJson(json);
}

/// Information about the metadata for a project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectSummary {
  /// The Amazon Resource Name (ARN) of the project.
  @_s.JsonKey(name: 'projectArn')
  final String projectArn;

  /// The ID of the project.
  @_s.JsonKey(name: 'projectId')
  final String projectId;

  ProjectSummary({
    this.projectArn,
    this.projectId,
  });
  factory ProjectSummary.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryFromJson(json);
}

/// Information about a resource for a project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resource {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'id')
  final String id;

  Resource({
    @_s.required this.id,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

/// The Amazon S3 location where the source code files provided with the project
/// request are stored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3Location {
  /// The Amazon S3 object key where the source code files provided with the
  /// project request are stored.
  @_s.JsonKey(name: 'bucketKey')
  final String bucketKey;

  /// The Amazon S3 bucket name where the source code files provided with the
  /// project request are stored.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  S3Location({
    this.bucketKey,
    this.bucketName,
  });
  Map<String, dynamic> toJson() => _$S3LocationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagProjectResult {
  /// The tags for the project.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  TagProjectResult({
    this.tags,
  });
  factory TagProjectResult.fromJson(Map<String, dynamic> json) =>
      _$TagProjectResultFromJson(json);
}

/// Information about a team member in a project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TeamMember {
  /// The role assigned to the user in the project. Project roles have different
  /// levels of access. For more information, see <a
  /// href="http://docs.aws.amazon.com/codestar/latest/userguide/working-with-teams.html">Working
  /// with Teams</a> in the <i>AWS CodeStar User Guide</i>.
  @_s.JsonKey(name: 'projectRole')
  final String projectRole;

  /// The Amazon Resource Name (ARN) of the user in IAM.
  @_s.JsonKey(name: 'userArn')
  final String userArn;

  /// Whether the user is allowed to remotely access project resources using an
  /// SSH public/private key pair.
  @_s.JsonKey(name: 'remoteAccessAllowed')
  final bool remoteAccessAllowed;

  TeamMember({
    @_s.required this.projectRole,
    @_s.required this.userArn,
    this.remoteAccessAllowed,
  });
  factory TeamMember.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberFromJson(json);
}

/// The toolchain template file provided with the project request. AWS CodeStar
/// uses the template to provision the toolchain stack in AWS CloudFormation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Toolchain {
  /// The Amazon S3 location where the toolchain template file provided with the
  /// project request is stored. AWS CodeStar retrieves the file during project
  /// creation.
  @_s.JsonKey(name: 'source')
  final ToolchainSource source;

  /// The service role ARN for AWS CodeStar to use for the toolchain template
  /// during stack provisioning.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The list of parameter overrides to be passed into the toolchain template
  /// during stack provisioning, if any.
  @_s.JsonKey(name: 'stackParameters')
  final Map<String, String> stackParameters;

  Toolchain({
    @_s.required this.source,
    this.roleArn,
    this.stackParameters,
  });
  Map<String, dynamic> toJson() => _$ToolchainToJson(this);
}

/// The Amazon S3 location where the toolchain template file provided with the
/// project request is stored. AWS CodeStar retrieves the file during project
/// creation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ToolchainSource {
  /// The Amazon S3 bucket where the toolchain template file provided with the
  /// project request is stored.
  @_s.JsonKey(name: 's3')
  final S3Location s3;

  ToolchainSource({
    @_s.required this.s3,
  });
  Map<String, dynamic> toJson() => _$ToolchainSourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagProjectResult {
  UntagProjectResult();
  factory UntagProjectResult.fromJson(Map<String, dynamic> json) =>
      _$UntagProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProjectResult {
  UpdateProjectResult();
  factory UpdateProjectResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTeamMemberResult {
  /// The project role granted to the user.
  @_s.JsonKey(name: 'projectRole')
  final String projectRole;

  /// Whether a team member is allowed to remotely access project resources using
  /// the SSH public key associated with the user's profile.
  @_s.JsonKey(name: 'remoteAccessAllowed')
  final bool remoteAccessAllowed;

  /// The Amazon Resource Name (ARN) of the user whose team membership attributes
  /// were updated.
  @_s.JsonKey(name: 'userArn')
  final String userArn;

  UpdateTeamMemberResult({
    this.projectRole,
    this.remoteAccessAllowed,
    this.userArn,
  });
  factory UpdateTeamMemberResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateTeamMemberResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user in IAM.
  @_s.JsonKey(name: 'userArn')
  final String userArn;

  /// The date the user profile was created, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdTimestamp')
  final DateTime createdTimestamp;

  /// The name that is displayed as the friendly name for the user in AWS
  /// CodeStar.
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The email address that is displayed as part of the user's profile in AWS
  /// CodeStar.
  @_s.JsonKey(name: 'emailAddress')
  final String emailAddress;

  /// The date the user profile was last modified, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedTimestamp')
  final DateTime lastModifiedTimestamp;

  /// The SSH public key associated with the user in AWS CodeStar. This is the
  /// public portion of the public/private keypair the user can use to access
  /// project resources if a project owner allows the user remote access to those
  /// resources.
  @_s.JsonKey(name: 'sshPublicKey')
  final String sshPublicKey;

  UpdateUserProfileResult({
    @_s.required this.userArn,
    this.createdTimestamp,
    this.displayName,
    this.emailAddress,
    this.lastModifiedTimestamp,
    this.sshPublicKey,
  });
  factory UpdateUserProfileResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserProfileResultFromJson(json);
}

/// Information about a user's profile in AWS CodeStar.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserProfileSummary {
  /// The display name of a user in AWS CodeStar. For example, this could be set
  /// to both first and last name ("Mary Major") or a single name ("Mary"). The
  /// display name is also used to generate the initial icon associated with the
  /// user in AWS CodeStar projects. If spaces are included in the display name,
  /// the first character that appears after the space will be used as the second
  /// character in the user initial icon. The initial icon displays a maximum of
  /// two characters, so a display name with more than one space (for example
  /// "Mary Jane Major") would generate an initial icon using the first character
  /// and the first character after the space ("MJ", not "MM").
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The email address associated with the user.
  @_s.JsonKey(name: 'emailAddress')
  final String emailAddress;

  /// The SSH public key associated with the user in AWS CodeStar. If a project
  /// owner allows the user remote access to project resources, this public key
  /// will be used along with the user's private key for SSH access.
  @_s.JsonKey(name: 'sshPublicKey')
  final String sshPublicKey;

  /// The Amazon Resource Name (ARN) of the user in IAM.
  @_s.JsonKey(name: 'userArn')
  final String userArn;

  UserProfileSummary({
    this.displayName,
    this.emailAddress,
    this.sshPublicKey,
    this.userArn,
  });
  factory UserProfileSummary.fromJson(Map<String, dynamic> json) =>
      _$UserProfileSummaryFromJson(json);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidServiceRoleException extends _s.GenericAwsException {
  InvalidServiceRoleException({String type, String message})
      : super(
            type: type, code: 'InvalidServiceRoleException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ProjectAlreadyExistsException extends _s.GenericAwsException {
  ProjectAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ProjectAlreadyExistsException',
            message: message);
}

class ProjectConfigurationException extends _s.GenericAwsException {
  ProjectConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'ProjectConfigurationException',
            message: message);
}

class ProjectCreationFailedException extends _s.GenericAwsException {
  ProjectCreationFailedException({String type, String message})
      : super(
            type: type,
            code: 'ProjectCreationFailedException',
            message: message);
}

class ProjectNotFoundException extends _s.GenericAwsException {
  ProjectNotFoundException({String type, String message})
      : super(type: type, code: 'ProjectNotFoundException', message: message);
}

class TeamMemberAlreadyAssociatedException extends _s.GenericAwsException {
  TeamMemberAlreadyAssociatedException({String type, String message})
      : super(
            type: type,
            code: 'TeamMemberAlreadyAssociatedException',
            message: message);
}

class TeamMemberNotFoundException extends _s.GenericAwsException {
  TeamMemberNotFoundException({String type, String message})
      : super(
            type: type, code: 'TeamMemberNotFoundException', message: message);
}

class UserProfileAlreadyExistsException extends _s.GenericAwsException {
  UserProfileAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'UserProfileAlreadyExistsException',
            message: message);
}

class UserProfileNotFoundException extends _s.GenericAwsException {
  UserProfileNotFoundException({String type, String message})
      : super(
            type: type, code: 'UserProfileNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidServiceRoleException': (type, message) =>
      InvalidServiceRoleException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ProjectAlreadyExistsException': (type, message) =>
      ProjectAlreadyExistsException(type: type, message: message),
  'ProjectConfigurationException': (type, message) =>
      ProjectConfigurationException(type: type, message: message),
  'ProjectCreationFailedException': (type, message) =>
      ProjectCreationFailedException(type: type, message: message),
  'ProjectNotFoundException': (type, message) =>
      ProjectNotFoundException(type: type, message: message),
  'TeamMemberAlreadyAssociatedException': (type, message) =>
      TeamMemberAlreadyAssociatedException(type: type, message: message),
  'TeamMemberNotFoundException': (type, message) =>
      TeamMemberNotFoundException(type: type, message: message),
  'UserProfileAlreadyExistsException': (type, message) =>
      UserProfileAlreadyExistsException(type: type, message: message),
  'UserProfileNotFoundException': (type, message) =>
      UserProfileNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
