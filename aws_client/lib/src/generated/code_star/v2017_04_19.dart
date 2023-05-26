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

/// This is the API reference for AWS CodeStar. This reference provides
/// descriptions of the operations and data types for the AWS CodeStar API along
/// with usage examples.
class CodeStar {
  final _s.JsonProtocol _protocol;
  CodeStar({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codestar',
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
    required String projectId,
    required String projectRole,
    required String userArn,
    String? clientRequestToken,
    bool? remoteAccessAllowed,
  }) async {
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
    required String id,
    required String name,
    String? clientRequestToken,
    String? description,
    List<Code>? sourceCode,
    Map<String, String>? tags,
    Toolchain? toolchain,
  }) async {
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
    required String displayName,
    required String emailAddress,
    required String userArn,
    String? sshPublicKey,
  }) async {
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
    required String id,
    String? clientRequestToken,
    bool? deleteStack,
  }) async {
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
    required String userArn,
  }) async {
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
    required String id,
  }) async {
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
    required String userArn,
  }) async {
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
    required String projectId,
    required String userArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.DisassociateTeamMember'
    };
    await _protocol.send(
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
    required String projectId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
    required String id,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
    required String projectId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
    required String id,
    required Map<String, String> tags,
  }) async {
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
    required String id,
    required List<String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.UntagProject'
    };
    await _protocol.send(
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
    required String id,
    String? description,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeStar_20170419.UpdateProject'
    };
    await _protocol.send(
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
    required String projectId,
    required String userArn,
    String? projectRole,
    bool? remoteAccessAllowed,
  }) async {
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
    required String userArn,
    String? displayName,
    String? emailAddress,
    String? sshPublicKey,
  }) async {
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

class AssociateTeamMemberResult {
  /// The user- or system-generated token from the initial request that can be
  /// used to repeat the request.
  final String? clientRequestToken;

  AssociateTeamMemberResult({
    this.clientRequestToken,
  });

  factory AssociateTeamMemberResult.fromJson(Map<String, dynamic> json) {
    return AssociateTeamMemberResult(
      clientRequestToken: json['clientRequestToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientRequestToken = this.clientRequestToken;
    return {
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    };
  }
}

/// Location and destination information about the source code files provided
/// with the project request. The source code is uploaded to the new project
/// source repository after project creation.
class Code {
  /// The repository to be created in AWS CodeStar. Valid values are AWS
  /// CodeCommit or GitHub. After AWS CodeStar provisions the new repository, the
  /// source code files provided with the project request are placed in the
  /// repository.
  final CodeDestination destination;

  /// The location where the source code files provided with the project request
  /// are stored. AWS CodeStar retrieves the files during project creation.
  final CodeSource source;

  Code({
    required this.destination,
    required this.source,
  });

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final source = this.source;
    return {
      'destination': destination,
      'source': source,
    };
  }
}

/// Information about the AWS CodeCommit repository to be created in AWS
/// CodeStar. This is where the source code files provided with the project
/// request will be uploaded after project creation.
class CodeCommitCodeDestination {
  /// The name of the AWS CodeCommit repository to be created in AWS CodeStar.
  final String name;

  CodeCommitCodeDestination({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// The repository to be created in AWS CodeStar. Valid values are AWS
/// CodeCommit or GitHub. After AWS CodeStar provisions the new repository, the
/// source code files provided with the project request are placed in the
/// repository.
class CodeDestination {
  /// Information about the AWS CodeCommit repository to be created in AWS
  /// CodeStar. This is where the source code files provided with the project
  /// request will be uploaded after project creation.
  final CodeCommitCodeDestination? codeCommit;

  /// Information about the GitHub repository to be created in AWS CodeStar. This
  /// is where the source code files provided with the project request will be
  /// uploaded after project creation.
  final GitHubCodeDestination? gitHub;

  CodeDestination({
    this.codeCommit,
    this.gitHub,
  });

  Map<String, dynamic> toJson() {
    final codeCommit = this.codeCommit;
    final gitHub = this.gitHub;
    return {
      if (codeCommit != null) 'codeCommit': codeCommit,
      if (gitHub != null) 'gitHub': gitHub,
    };
  }
}

/// The location where the source code files provided with the project request
/// are stored. AWS CodeStar retrieves the files during project creation.
class CodeSource {
  /// Information about the Amazon S3 location where the source code files
  /// provided with the project request are stored.
  final S3Location s3;

  CodeSource({
    required this.s3,
  });

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      's3': s3,
    };
  }
}

class CreateProjectResult {
  /// The Amazon Resource Name (ARN) of the created project.
  final String arn;

  /// The ID of the project.
  final String id;

  /// A user- or system-generated token that identifies the entity that requested
  /// project creation.
  final String? clientRequestToken;

  /// Reserved for future use.
  final String? projectTemplateId;

  CreateProjectResult({
    required this.arn,
    required this.id,
    this.clientRequestToken,
    this.projectTemplateId,
  });

  factory CreateProjectResult.fromJson(Map<String, dynamic> json) {
    return CreateProjectResult(
      arn: json['arn'] as String,
      id: json['id'] as String,
      clientRequestToken: json['clientRequestToken'] as String?,
      projectTemplateId: json['projectTemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final clientRequestToken = this.clientRequestToken;
    final projectTemplateId = this.projectTemplateId;
    return {
      'arn': arn,
      'id': id,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (projectTemplateId != null) 'projectTemplateId': projectTemplateId,
    };
  }
}

class CreateUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user in IAM.
  final String userArn;

  /// The date the user profile was created, in timestamp format.
  final DateTime? createdTimestamp;

  /// The name that is displayed as the friendly name for the user in AWS
  /// CodeStar.
  final String? displayName;

  /// The email address that is displayed as part of the user's profile in AWS
  /// CodeStar.
  final String? emailAddress;

  /// The date the user profile was last modified, in timestamp format.
  final DateTime? lastModifiedTimestamp;

  /// The SSH public key associated with the user in AWS CodeStar. This is the
  /// public portion of the public/private keypair the user can use to access
  /// project resources if a project owner allows the user remote access to those
  /// resources.
  final String? sshPublicKey;

  CreateUserProfileResult({
    required this.userArn,
    this.createdTimestamp,
    this.displayName,
    this.emailAddress,
    this.lastModifiedTimestamp,
    this.sshPublicKey,
  });

  factory CreateUserProfileResult.fromJson(Map<String, dynamic> json) {
    return CreateUserProfileResult(
      userArn: json['userArn'] as String,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      displayName: json['displayName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      sshPublicKey: json['sshPublicKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userArn = this.userArn;
    final createdTimestamp = this.createdTimestamp;
    final displayName = this.displayName;
    final emailAddress = this.emailAddress;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final sshPublicKey = this.sshPublicKey;
    return {
      'userArn': userArn,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (displayName != null) 'displayName': displayName,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (sshPublicKey != null) 'sshPublicKey': sshPublicKey,
    };
  }
}

class DeleteProjectResult {
  /// The Amazon Resource Name (ARN) of the deleted project.
  final String? projectArn;

  /// The ID of the primary stack in AWS CloudFormation that will be deleted as
  /// part of deleting the project and its resources.
  final String? stackId;

  DeleteProjectResult({
    this.projectArn,
    this.stackId,
  });

  factory DeleteProjectResult.fromJson(Map<String, dynamic> json) {
    return DeleteProjectResult(
      projectArn: json['projectArn'] as String?,
      stackId: json['stackId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectArn = this.projectArn;
    final stackId = this.stackId;
    return {
      if (projectArn != null) 'projectArn': projectArn,
      if (stackId != null) 'stackId': stackId,
    };
  }
}

class DeleteUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user deleted from AWS CodeStar.
  final String userArn;

  DeleteUserProfileResult({
    required this.userArn,
  });

  factory DeleteUserProfileResult.fromJson(Map<String, dynamic> json) {
    return DeleteUserProfileResult(
      userArn: json['userArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final userArn = this.userArn;
    return {
      'userArn': userArn,
    };
  }
}

class DescribeProjectResult {
  /// The Amazon Resource Name (ARN) for the project.
  final String? arn;

  /// A user- or system-generated token that identifies the entity that requested
  /// project creation.
  final String? clientRequestToken;

  /// The date and time the project was created, in timestamp format.
  final DateTime? createdTimeStamp;

  /// The description of the project, if any.
  final String? description;

  /// The ID of the project.
  final String? id;

  /// The display name for the project.
  final String? name;

  /// The ID for the AWS CodeStar project template used to create the project.
  final String? projectTemplateId;

  /// The ID of the primary stack in AWS CloudFormation used to generate resources
  /// for the project.
  final String? stackId;

  /// The project creation or deletion status.
  final ProjectStatus? status;

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

  factory DescribeProjectResult.fromJson(Map<String, dynamic> json) {
    return DescribeProjectResult(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdTimeStamp: timeStampFromJson(json['createdTimeStamp']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      projectTemplateId: json['projectTemplateId'] as String?,
      stackId: json['stackId'] as String?,
      status: json['status'] != null
          ? ProjectStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final createdTimeStamp = this.createdTimeStamp;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final projectTemplateId = this.projectTemplateId;
    final stackId = this.stackId;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdTimeStamp != null)
        'createdTimeStamp': unixTimestampToJson(createdTimeStamp),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (projectTemplateId != null) 'projectTemplateId': projectTemplateId,
      if (stackId != null) 'stackId': stackId,
      if (status != null) 'status': status,
    };
  }
}

class DescribeUserProfileResult {
  /// The date and time when the user profile was created in AWS CodeStar, in
  /// timestamp format.
  final DateTime createdTimestamp;

  /// The date and time when the user profile was last modified, in timestamp
  /// format.
  final DateTime lastModifiedTimestamp;

  /// The Amazon Resource Name (ARN) of the user.
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
  final String? displayName;

  /// The email address for the user. Optional.
  final String? emailAddress;

  /// The SSH public key associated with the user. This SSH public key is
  /// associated with the user profile, and can be used in conjunction with the
  /// associated private key for access to project resources, such as Amazon EC2
  /// instances, if a project owner grants remote access to those resources.
  final String? sshPublicKey;

  DescribeUserProfileResult({
    required this.createdTimestamp,
    required this.lastModifiedTimestamp,
    required this.userArn,
    this.displayName,
    this.emailAddress,
    this.sshPublicKey,
  });

  factory DescribeUserProfileResult.fromJson(Map<String, dynamic> json) {
    return DescribeUserProfileResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['createdTimestamp'] as Object),
      lastModifiedTimestamp:
          nonNullableTimeStampFromJson(json['lastModifiedTimestamp'] as Object),
      userArn: json['userArn'] as String,
      displayName: json['displayName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      sshPublicKey: json['sshPublicKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final userArn = this.userArn;
    final displayName = this.displayName;
    final emailAddress = this.emailAddress;
    final sshPublicKey = this.sshPublicKey;
    return {
      'createdTimestamp': unixTimestampToJson(createdTimestamp),
      'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      'userArn': userArn,
      if (displayName != null) 'displayName': displayName,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (sshPublicKey != null) 'sshPublicKey': sshPublicKey,
    };
  }
}

class DisassociateTeamMemberResult {
  DisassociateTeamMemberResult();

  factory DisassociateTeamMemberResult.fromJson(Map<String, dynamic> _) {
    return DisassociateTeamMemberResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about the GitHub repository to be created in AWS CodeStar. This
/// is where the source code files provided with the project request will be
/// uploaded after project creation.
class GitHubCodeDestination {
  /// Whether to enable issues for the GitHub repository.
  final bool issuesEnabled;

  /// Name of the GitHub repository to be created in AWS CodeStar.
  final String name;

  /// The GitHub username for the owner of the GitHub repository to be created in
  /// AWS CodeStar. If this repository should be owned by a GitHub organization,
  /// provide its name.
  final String owner;

  /// Whether the GitHub repository is to be a private repository.
  final bool privateRepository;

  /// The GitHub user's personal access token for the GitHub repository.
  final String token;

  /// The type of GitHub repository to be created in AWS CodeStar. Valid values
  /// are User or Organization.
  final String type;

  /// Description for the GitHub repository to be created in AWS CodeStar. This
  /// description displays in GitHub after the repository is created.
  final String? description;

  GitHubCodeDestination({
    required this.issuesEnabled,
    required this.name,
    required this.owner,
    required this.privateRepository,
    required this.token,
    required this.type,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final issuesEnabled = this.issuesEnabled;
    final name = this.name;
    final owner = this.owner;
    final privateRepository = this.privateRepository;
    final token = this.token;
    final type = this.type;
    final description = this.description;
    return {
      'issuesEnabled': issuesEnabled,
      'name': name,
      'owner': owner,
      'privateRepository': privateRepository,
      'token': token,
      'type': type,
      if (description != null) 'description': description,
    };
  }
}

class ListProjectsResult {
  /// A list of projects.
  final List<ProjectSummary> projects;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  final String? nextToken;

  ListProjectsResult({
    required this.projects,
    this.nextToken,
  });

  factory ListProjectsResult.fromJson(Map<String, dynamic> json) {
    return ListProjectsResult(
      projects: (json['projects'] as List)
          .whereNotNull()
          .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projects = this.projects;
    final nextToken = this.nextToken;
    return {
      'projects': projects,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListResourcesResult {
  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  final String? nextToken;

  /// An array of resources associated with the project.
  final List<Resource>? resources;

  ListResourcesResult({
    this.nextToken,
    this.resources,
  });

  factory ListResourcesResult.fromJson(Map<String, dynamic> json) {
    return ListResourcesResult(
      nextToken: json['nextToken'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resources != null) 'resources': resources,
    };
  }
}

class ListTagsForProjectResult {
  /// Reserved for future use.
  final String? nextToken;

  /// The tags for the project.
  final Map<String, String>? tags;

  ListTagsForProjectResult({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForProjectResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForProjectResult(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
    };
  }
}

class ListTeamMembersResult {
  /// A list of team member objects for the project.
  final List<TeamMember> teamMembers;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  final String? nextToken;

  ListTeamMembersResult({
    required this.teamMembers,
    this.nextToken,
  });

  factory ListTeamMembersResult.fromJson(Map<String, dynamic> json) {
    return ListTeamMembersResult(
      teamMembers: (json['teamMembers'] as List)
          .whereNotNull()
          .map((e) => TeamMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final teamMembers = this.teamMembers;
    final nextToken = this.nextToken;
    return {
      'teamMembers': teamMembers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListUserProfilesResult {
  /// All the user profiles configured in AWS CodeStar for an AWS account.
  final List<UserProfileSummary> userProfiles;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  final String? nextToken;

  ListUserProfilesResult({
    required this.userProfiles,
    this.nextToken,
  });

  factory ListUserProfilesResult.fromJson(Map<String, dynamic> json) {
    return ListUserProfilesResult(
      userProfiles: (json['userProfiles'] as List)
          .whereNotNull()
          .map((e) => UserProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userProfiles = this.userProfiles;
    final nextToken = this.nextToken;
    return {
      'userProfiles': userProfiles,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// An indication of whether a project creation or deletion is failed or
/// successful.
class ProjectStatus {
  /// The phase of completion for a project creation or deletion.
  final String state;

  /// In the case of a project creation or deletion failure, a reason for the
  /// failure.
  final String? reason;

  ProjectStatus({
    required this.state,
    this.reason,
  });

  factory ProjectStatus.fromJson(Map<String, dynamic> json) {
    return ProjectStatus(
      state: json['state'] as String,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final reason = this.reason;
    return {
      'state': state,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Information about the metadata for a project.
class ProjectSummary {
  /// The Amazon Resource Name (ARN) of the project.
  final String? projectArn;

  /// The ID of the project.
  final String? projectId;

  ProjectSummary({
    this.projectArn,
    this.projectId,
  });

  factory ProjectSummary.fromJson(Map<String, dynamic> json) {
    return ProjectSummary(
      projectArn: json['projectArn'] as String?,
      projectId: json['projectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectArn = this.projectArn;
    final projectId = this.projectId;
    return {
      if (projectArn != null) 'projectArn': projectArn,
      if (projectId != null) 'projectId': projectId,
    };
  }
}

/// Information about a resource for a project.
class Resource {
  /// The Amazon Resource Name (ARN) of the resource.
  final String id;

  Resource({
    required this.id,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// The Amazon S3 location where the source code files provided with the project
/// request are stored.
class S3Location {
  /// The Amazon S3 object key where the source code files provided with the
  /// project request are stored.
  final String? bucketKey;

  /// The Amazon S3 bucket name where the source code files provided with the
  /// project request are stored.
  final String? bucketName;

  S3Location({
    this.bucketKey,
    this.bucketName,
  });

  Map<String, dynamic> toJson() {
    final bucketKey = this.bucketKey;
    final bucketName = this.bucketName;
    return {
      if (bucketKey != null) 'bucketKey': bucketKey,
      if (bucketName != null) 'bucketName': bucketName,
    };
  }
}

class TagProjectResult {
  /// The tags for the project.
  final Map<String, String>? tags;

  TagProjectResult({
    this.tags,
  });

  factory TagProjectResult.fromJson(Map<String, dynamic> json) {
    return TagProjectResult(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about a team member in a project.
class TeamMember {
  /// The role assigned to the user in the project. Project roles have different
  /// levels of access. For more information, see <a
  /// href="http://docs.aws.amazon.com/codestar/latest/userguide/working-with-teams.html">Working
  /// with Teams</a> in the <i>AWS CodeStar User Guide</i>.
  final String projectRole;

  /// The Amazon Resource Name (ARN) of the user in IAM.
  final String userArn;

  /// Whether the user is allowed to remotely access project resources using an
  /// SSH public/private key pair.
  final bool? remoteAccessAllowed;

  TeamMember({
    required this.projectRole,
    required this.userArn,
    this.remoteAccessAllowed,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      projectRole: json['projectRole'] as String,
      userArn: json['userArn'] as String,
      remoteAccessAllowed: json['remoteAccessAllowed'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectRole = this.projectRole;
    final userArn = this.userArn;
    final remoteAccessAllowed = this.remoteAccessAllowed;
    return {
      'projectRole': projectRole,
      'userArn': userArn,
      if (remoteAccessAllowed != null)
        'remoteAccessAllowed': remoteAccessAllowed,
    };
  }
}

/// The toolchain template file provided with the project request. AWS CodeStar
/// uses the template to provision the toolchain stack in AWS CloudFormation.
class Toolchain {
  /// The Amazon S3 location where the toolchain template file provided with the
  /// project request is stored. AWS CodeStar retrieves the file during project
  /// creation.
  final ToolchainSource source;

  /// The service role ARN for AWS CodeStar to use for the toolchain template
  /// during stack provisioning.
  final String? roleArn;

  /// The list of parameter overrides to be passed into the toolchain template
  /// during stack provisioning, if any.
  final Map<String, String>? stackParameters;

  Toolchain({
    required this.source,
    this.roleArn,
    this.stackParameters,
  });

  Map<String, dynamic> toJson() {
    final source = this.source;
    final roleArn = this.roleArn;
    final stackParameters = this.stackParameters;
    return {
      'source': source,
      if (roleArn != null) 'roleArn': roleArn,
      if (stackParameters != null) 'stackParameters': stackParameters,
    };
  }
}

/// The Amazon S3 location where the toolchain template file provided with the
/// project request is stored. AWS CodeStar retrieves the file during project
/// creation.
class ToolchainSource {
  /// The Amazon S3 bucket where the toolchain template file provided with the
  /// project request is stored.
  final S3Location s3;

  ToolchainSource({
    required this.s3,
  });

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      's3': s3,
    };
  }
}

class UntagProjectResult {
  UntagProjectResult();

  factory UntagProjectResult.fromJson(Map<String, dynamic> _) {
    return UntagProjectResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateProjectResult {
  UpdateProjectResult();

  factory UpdateProjectResult.fromJson(Map<String, dynamic> _) {
    return UpdateProjectResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTeamMemberResult {
  /// The project role granted to the user.
  final String? projectRole;

  /// Whether a team member is allowed to remotely access project resources using
  /// the SSH public key associated with the user's profile.
  final bool? remoteAccessAllowed;

  /// The Amazon Resource Name (ARN) of the user whose team membership attributes
  /// were updated.
  final String? userArn;

  UpdateTeamMemberResult({
    this.projectRole,
    this.remoteAccessAllowed,
    this.userArn,
  });

  factory UpdateTeamMemberResult.fromJson(Map<String, dynamic> json) {
    return UpdateTeamMemberResult(
      projectRole: json['projectRole'] as String?,
      remoteAccessAllowed: json['remoteAccessAllowed'] as bool?,
      userArn: json['userArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectRole = this.projectRole;
    final remoteAccessAllowed = this.remoteAccessAllowed;
    final userArn = this.userArn;
    return {
      if (projectRole != null) 'projectRole': projectRole,
      if (remoteAccessAllowed != null)
        'remoteAccessAllowed': remoteAccessAllowed,
      if (userArn != null) 'userArn': userArn,
    };
  }
}

class UpdateUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user in IAM.
  final String userArn;

  /// The date the user profile was created, in timestamp format.
  final DateTime? createdTimestamp;

  /// The name that is displayed as the friendly name for the user in AWS
  /// CodeStar.
  final String? displayName;

  /// The email address that is displayed as part of the user's profile in AWS
  /// CodeStar.
  final String? emailAddress;

  /// The date the user profile was last modified, in timestamp format.
  final DateTime? lastModifiedTimestamp;

  /// The SSH public key associated with the user in AWS CodeStar. This is the
  /// public portion of the public/private keypair the user can use to access
  /// project resources if a project owner allows the user remote access to those
  /// resources.
  final String? sshPublicKey;

  UpdateUserProfileResult({
    required this.userArn,
    this.createdTimestamp,
    this.displayName,
    this.emailAddress,
    this.lastModifiedTimestamp,
    this.sshPublicKey,
  });

  factory UpdateUserProfileResult.fromJson(Map<String, dynamic> json) {
    return UpdateUserProfileResult(
      userArn: json['userArn'] as String,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      displayName: json['displayName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['lastModifiedTimestamp']),
      sshPublicKey: json['sshPublicKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userArn = this.userArn;
    final createdTimestamp = this.createdTimestamp;
    final displayName = this.displayName;
    final emailAddress = this.emailAddress;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final sshPublicKey = this.sshPublicKey;
    return {
      'userArn': userArn,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (displayName != null) 'displayName': displayName,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (lastModifiedTimestamp != null)
        'lastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (sshPublicKey != null) 'sshPublicKey': sshPublicKey,
    };
  }
}

/// Information about a user's profile in AWS CodeStar.
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
  final String? displayName;

  /// The email address associated with the user.
  final String? emailAddress;

  /// The SSH public key associated with the user in AWS CodeStar. If a project
  /// owner allows the user remote access to project resources, this public key
  /// will be used along with the user's private key for SSH access.
  final String? sshPublicKey;

  /// The Amazon Resource Name (ARN) of the user in IAM.
  final String? userArn;

  UserProfileSummary({
    this.displayName,
    this.emailAddress,
    this.sshPublicKey,
    this.userArn,
  });

  factory UserProfileSummary.fromJson(Map<String, dynamic> json) {
    return UserProfileSummary(
      displayName: json['displayName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      sshPublicKey: json['sshPublicKey'] as String?,
      userArn: json['userArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final emailAddress = this.emailAddress;
    final sshPublicKey = this.sshPublicKey;
    final userArn = this.userArn;
    return {
      if (displayName != null) 'displayName': displayName,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (sshPublicKey != null) 'sshPublicKey': sshPublicKey,
      if (userArn != null) 'userArn': userArn,
    };
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidServiceRoleException extends _s.GenericAwsException {
  InvalidServiceRoleException({String? type, String? message})
      : super(
            type: type, code: 'InvalidServiceRoleException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ProjectAlreadyExistsException extends _s.GenericAwsException {
  ProjectAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ProjectAlreadyExistsException',
            message: message);
}

class ProjectConfigurationException extends _s.GenericAwsException {
  ProjectConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'ProjectConfigurationException',
            message: message);
}

class ProjectCreationFailedException extends _s.GenericAwsException {
  ProjectCreationFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'ProjectCreationFailedException',
            message: message);
}

class ProjectNotFoundException extends _s.GenericAwsException {
  ProjectNotFoundException({String? type, String? message})
      : super(type: type, code: 'ProjectNotFoundException', message: message);
}

class TeamMemberAlreadyAssociatedException extends _s.GenericAwsException {
  TeamMemberAlreadyAssociatedException({String? type, String? message})
      : super(
            type: type,
            code: 'TeamMemberAlreadyAssociatedException',
            message: message);
}

class TeamMemberNotFoundException extends _s.GenericAwsException {
  TeamMemberNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'TeamMemberNotFoundException', message: message);
}

class UserProfileAlreadyExistsException extends _s.GenericAwsException {
  UserProfileAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'UserProfileAlreadyExistsException',
            message: message);
}

class UserProfileNotFoundException extends _s.GenericAwsException {
  UserProfileNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'UserProfileNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
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
