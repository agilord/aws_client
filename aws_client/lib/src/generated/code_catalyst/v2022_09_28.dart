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

/// Welcome to the Amazon CodeCatalyst API reference. This reference provides
/// descriptions of operations and data types for Amazon CodeCatalyst. You can
/// use the Amazon CodeCatalyst API to work with the following objects.
///
/// Spaces, by calling the following:
///
/// <ul>
/// <li>
/// <a>DeleteSpace</a>, which deletes a space.
/// </li>
/// <li>
/// <a>GetSpace</a>, which returns information about a space.
/// </li>
/// <li>
/// <a>GetSubscription</a>, which returns information about the Amazon Web
/// Services account used for billing purposes and the billing plan for the
/// space.
/// </li>
/// <li>
/// <a>ListSpaces</a>, which retrieves a list of spaces.
/// </li>
/// <li>
/// <a>UpdateSpace</a>, which changes one or more values for a space.
/// </li>
/// </ul>
/// Projects, by calling the following:
///
/// <ul>
/// <li>
/// <a>CreateProject</a> which creates a project in a specified space.
/// </li>
/// <li>
/// <a>GetProject</a>, which returns information about a project.
/// </li>
/// <li>
/// <a>ListProjects</a>, which retrieves a list of projects in a space.
/// </li>
/// </ul>
/// Users, by calling the following:
///
/// <ul>
/// <li>
/// <a>GetUserDetails</a>, which returns information about a user in Amazon
/// CodeCatalyst.
/// </li>
/// </ul>
/// Source repositories, by calling the following:
///
/// <ul>
/// <li>
/// <a>CreateSourceRepository</a>, which creates an empty Git-based source
/// repository in a specified project.
/// </li>
/// <li>
/// <a>CreateSourceRepositoryBranch</a>, which creates a branch in a specified
/// repository where you can work on code.
/// </li>
/// <li>
/// <a>DeleteSourceRepository</a>, which deletes a source repository.
/// </li>
/// <li>
/// <a>GetSourceRepository</a>, which returns information about a source
/// repository.
/// </li>
/// <li>
/// <a>GetSourceRepositoryCloneUrls</a>, which returns information about the
/// URLs that can be used with a Git client to clone a source repository.
/// </li>
/// <li>
/// <a>ListSourceRepositories</a>, which retrieves a list of source repositories
/// in a project.
/// </li>
/// <li>
/// <a>ListSourceRepositoryBranches</a>, which retrieves a list of branches in a
/// source repository.
/// </li>
/// </ul>
/// Dev Environments and the Amazon Web Services Toolkits, by calling the
/// following:
///
/// <ul>
/// <li>
/// <a>CreateDevEnvironment</a>, which creates a Dev Environment, where you can
/// quickly work on the code stored in the source repositories of your project.
/// </li>
/// <li>
/// <a>DeleteDevEnvironment</a>, which deletes a Dev Environment.
/// </li>
/// <li>
/// <a>GetDevEnvironment</a>, which returns information about a Dev Environment.
/// </li>
/// <li>
/// <a>ListDevEnvironments</a>, which retrieves a list of Dev Environments in a
/// project.
/// </li>
/// <li>
/// <a>ListDevEnvironmentSessions</a>, which retrieves a list of active Dev
/// Environment sessions in a project.
/// </li>
/// <li>
/// <a>StartDevEnvironment</a>, which starts a specified Dev Environment and
/// puts it into an active state.
/// </li>
/// <li>
/// <a>StartDevEnvironmentSession</a>, which starts a session to a specified Dev
/// Environment.
/// </li>
/// <li>
/// <a>StopDevEnvironment</a>, which stops a specified Dev Environment and puts
/// it into an stopped state.
/// </li>
/// <li>
/// <a>StopDevEnvironmentSession</a>, which stops a session for a specified Dev
/// Environment.
/// </li>
/// <li>
/// <a>UpdateDevEnvironment</a>, which changes one or more values for a Dev
/// Environment.
/// </li>
/// </ul>
/// Workflows, by calling the following:
///
/// <ul>
/// <li>
/// <a>GetWorkflow</a>, which returns information about a workflow.
/// </li>
/// <li>
/// <a>GetWorkflowRun</a>, which returns information about a specified run of a
/// workflow.
/// </li>
/// <li>
/// <a>ListWorkflowRuns</a>, which retrieves a list of runs of a specified
/// workflow.
/// </li>
/// <li>
/// <a>ListWorkflows</a>, which retrieves a list of workflows in a specified
/// project.
/// </li>
/// <li>
/// <a>StartWorkflowRun</a>, which starts a run of a specified workflow.
/// </li>
/// </ul>
/// Security, activity, and resource management in Amazon CodeCatalyst, by
/// calling the following:
///
/// <ul>
/// <li>
/// <a>CreateAccessToken</a>, which creates a personal access token (PAT) for
/// the current user.
/// </li>
/// <li>
/// <a>DeleteAccessToken</a>, which deletes a specified personal access token
/// (PAT).
/// </li>
/// <li>
/// <a>ListAccessTokens</a>, which lists all personal access tokens (PATs)
/// associated with a user.
/// </li>
/// <li>
/// <a>ListEventLogs</a>, which retrieves a list of events that occurred during
/// a specified time period in a space.
/// </li>
/// <li>
/// <a>VerifySession</a>, which verifies whether the calling user has a valid
/// Amazon CodeCatalyst login and session.
/// </li>
/// </ul> <note>
/// If you are using the Amazon CodeCatalyst APIs with an SDK or the CLI, you
/// must configure your computer to work with Amazon CodeCatalyst and single
/// sign-on (SSO). For more information, see <a
/// href="https://docs.aws.amazon.com/codecatalyst/latest/userguide/set-up-cli.html">Setting
/// up to use the CLI with Amazon CodeCatalyst</a> and the SSO documentation for
/// your SDK.
/// </note>
class CodeCatalyst {
  final _s.RestJsonProtocol _protocol;
  CodeCatalyst({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codecatalyst',
            signingName: 'codecatalyst',
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

  /// Creates a personal access token (PAT) for the current user. A personal
  /// access token (PAT) is similar to a password. It is associated with your
  /// user identity for use across all spaces and projects in Amazon
  /// CodeCatalyst. You use PATs to access CodeCatalyst from resources that
  /// include integrated development environments (IDEs) and Git-based source
  /// repositories. PATs represent you in Amazon CodeCatalyst and you can manage
  /// them in your user settings.For more information, see <a
  /// href="https://docs.aws.amazon.com/codecatalyst/latest/userguide/ipa-tokens-keys.html">Managing
  /// personal access tokens in Amazon CodeCatalyst</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The friendly name of the personal access token.
  ///
  /// Parameter [expiresTime] :
  /// The date and time the personal access token expires, in coordinated
  /// universal time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  Future<CreateAccessTokenResponse> createAccessToken({
    required String name,
    DateTime? expiresTime,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (expiresTime != null) 'expiresTime': iso8601ToJson(expiresTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/accessTokens',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessTokenResponse.fromJson(response);
  }

  /// Creates a Dev Environment in Amazon CodeCatalyst, a cloud-based
  /// development environment that you can use to quickly work on the code
  /// stored in the source repositories of your project.
  /// <note>
  /// When created in the Amazon CodeCatalyst console, by default a Dev
  /// Environment is configured to have a 2 core processor, 4GB of RAM, and 16GB
  /// of persistent storage. None of these defaults apply to a Dev Environment
  /// created programmatically.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceType] :
  /// The Amazon EC2 instace type to use for the Dev Environment.
  ///
  /// Parameter [persistentStorage] :
  /// Information about the amount of storage allocated to the Dev Environment.
  /// <note>
  /// By default, a Dev Environment is configured to have 16GB of persistent
  /// storage when created from the Amazon CodeCatalyst console, but there is no
  /// default when programmatically creating a Dev Environment. Valid values for
  /// persistent storage are based on memory sizes in 16GB increments. Valid
  /// values are 16, 32, and 64.
  /// </note>
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [alias] :
  /// The user-defined alias for a Dev Environment.
  ///
  /// Parameter [clientToken] :
  /// A user-specified idempotency token. Idempotency ensures that an API
  /// request completes only once. With an idempotent request, if the original
  /// request completes successfully, the subsequent retries return the result
  /// from the original successful request and have no additional effect.
  ///
  /// Parameter [ides] :
  /// Information about the integrated development environment (IDE) configured
  /// for a Dev Environment.
  /// <note>
  /// An IDE is required to create a Dev Environment. For Dev Environment
  /// creation, this field contains configuration information and must be
  /// provided.
  /// </note>
  ///
  /// Parameter [inactivityTimeoutMinutes] :
  /// The amount of time the Dev Environment will run without any activity
  /// detected before stopping, in minutes. Only whole integers are allowed. Dev
  /// Environments consume compute minutes when running.
  ///
  /// Parameter [repositories] :
  /// The source repository that contains the branch to clone into the Dev
  /// Environment.
  ///
  /// Parameter [vpcConnectionName] :
  /// The name of the connection that will be used to connect to Amazon VPC, if
  /// any.
  Future<CreateDevEnvironmentResponse> createDevEnvironment({
    required InstanceType instanceType,
    required PersistentStorageConfiguration persistentStorage,
    required String projectName,
    required String spaceName,
    String? alias,
    String? clientToken,
    List<IdeConfiguration>? ides,
    int? inactivityTimeoutMinutes,
    List<RepositoryInput>? repositories,
    String? vpcConnectionName,
  }) async {
    _s.validateNumRange(
      'inactivityTimeoutMinutes',
      inactivityTimeoutMinutes,
      0,
      1200,
    );
    final $payload = <String, dynamic>{
      'instanceType': instanceType.toValue(),
      'persistentStorage': persistentStorage,
      if (alias != null) 'alias': alias,
      if (clientToken != null) 'clientToken': clientToken,
      if (ides != null) 'ides': ides,
      if (inactivityTimeoutMinutes != null)
        'inactivityTimeoutMinutes': inactivityTimeoutMinutes,
      if (repositories != null) 'repositories': repositories,
      if (vpcConnectionName != null) 'vpcConnectionName': vpcConnectionName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/devEnvironments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDevEnvironmentResponse.fromJson(response);
  }

  /// Creates a project in a specified space.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [displayName] :
  /// The friendly name of the project that will be displayed to users.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [description] :
  /// The description of the project. This description will be displayed to all
  /// users of the project. We recommend providing a brief description of the
  /// project and its intended purpose.
  Future<CreateProjectResponse> createProject({
    required String displayName,
    required String spaceName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'displayName': displayName,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProjectResponse.fromJson(response);
  }

  /// Creates an empty Git-based source repository in a specified project. The
  /// repository is created with an initial empty commit with a default branch
  /// named <code>main</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the source repository. For more information about name
  /// requirements, see <a
  /// href="https://docs.aws.amazon.com/codecatalyst/latest/userguide/source-quotas.html">Quotas
  /// for source repositories</a>.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [description] :
  /// The description of the source repository.
  Future<CreateSourceRepositoryResponse> createSourceRepository({
    required String name,
    required String projectName,
    required String spaceName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/sourceRepositories/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSourceRepositoryResponse.fromJson(response);
  }

  /// Creates a branch in a specified source repository in Amazon CodeCatalyst.
  /// <note>
  /// This API only creates a branch in a source repository hosted in Amazon
  /// CodeCatalyst. You cannot use this API to create a branch in a linked
  /// repository.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name for the branch you're creating.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [sourceRepositoryName] :
  /// The name of the repository where you want to create a branch.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [headCommitId] :
  /// The commit ID in an existing branch from which you want to create the new
  /// branch.
  Future<CreateSourceRepositoryBranchResponse> createSourceRepositoryBranch({
    required String name,
    required String projectName,
    required String sourceRepositoryName,
    required String spaceName,
    String? headCommitId,
  }) async {
    final $payload = <String, dynamic>{
      if (headCommitId != null) 'headCommitId': headCommitId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/sourceRepositories/${Uri.encodeComponent(sourceRepositoryName)}/branches/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSourceRepositoryBranchResponse.fromJson(response);
  }

  /// Deletes a specified personal access token (PAT). A personal access token
  /// can only be deleted by the user who created it.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The ID of the personal access token to delete. You can find the IDs of all
  /// PATs associated with your Amazon Web Services Builder ID in a space by
  /// calling <a>ListAccessTokens</a>.
  Future<void> deleteAccessToken({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/accessTokens/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Dev Environment.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The system-generated unique ID of the Dev Environment you want to delete.
  /// To retrieve a list of Dev Environment IDs, use <a>ListDevEnvironments</a>.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<DeleteDevEnvironmentResponse> deleteDevEnvironment({
    required String id,
    required String projectName,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/devEnvironments/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDevEnvironmentResponse.fromJson(response);
  }

  /// Deletes a project in a space.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the project in the space. To retrieve a list of project names,
  /// use <a>ListProjects</a>.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<DeleteProjectResponse> deleteProject({
    required String name,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProjectResponse.fromJson(response);
  }

  /// Deletes a source repository in Amazon CodeCatalyst. You cannot use this
  /// API to delete a linked repository. It can only be used to delete a Amazon
  /// CodeCatalyst source repository.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the source repository.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<DeleteSourceRepositoryResponse> deleteSourceRepository({
    required String name,
    required String projectName,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/sourceRepositories/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSourceRepositoryResponse.fromJson(response);
  }

  /// Deletes a space.
  /// <important>
  /// Deleting a space cannot be undone. Additionally, since space names must be
  /// unique across Amazon CodeCatalyst, you cannot reuse names of deleted
  /// spaces.
  /// </important>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the space. To retrieve a list of space names, use
  /// <a>ListSpaces</a>.
  Future<DeleteSpaceResponse> deleteSpace({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/spaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSpaceResponse.fromJson(response);
  }

  /// Returns information about a Dev Environment for a source repository in a
  /// project. Dev Environments are specific to the user who creates them.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The system-generated unique ID of the Dev Environment for which you want
  /// to view information. To retrieve a list of Dev Environment IDs, use
  /// <a>ListDevEnvironments</a>.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<GetDevEnvironmentResponse> getDevEnvironment({
    required String id,
    required String projectName,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/devEnvironments/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDevEnvironmentResponse.fromJson(response);
  }

  /// Returns information about a project.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<GetProjectResponse> getProject({
    required String name,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProjectResponse.fromJson(response);
  }

  /// Returns information about a source repository.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the source repository.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<GetSourceRepositoryResponse> getSourceRepository({
    required String name,
    required String projectName,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/sourceRepositories/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSourceRepositoryResponse.fromJson(response);
  }

  /// Returns information about the URLs that can be used with a Git client to
  /// clone a source repository.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [sourceRepositoryName] :
  /// The name of the source repository.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<GetSourceRepositoryCloneUrlsResponse> getSourceRepositoryCloneUrls({
    required String projectName,
    required String sourceRepositoryName,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/sourceRepositories/${Uri.encodeComponent(sourceRepositoryName)}/cloneUrls',
      exceptionFnMap: _exceptionFns,
    );
    return GetSourceRepositoryCloneUrlsResponse.fromJson(response);
  }

  /// Returns information about an space.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the space.
  Future<GetSpaceResponse> getSpace({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/spaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSpaceResponse.fromJson(response);
  }

  /// Returns information about the Amazon Web Services account used for billing
  /// purposes and the billing plan for the space.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<GetSubscriptionResponse> getSubscription({
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/spaces/${Uri.encodeComponent(spaceName)}/subscription',
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriptionResponse.fromJson(response);
  }

  /// Returns information about a user.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The system-generated unique ID of the user.
  ///
  /// Parameter [userName] :
  /// The name of the user as displayed in Amazon CodeCatalyst.
  Future<GetUserDetailsResponse> getUserDetails({
    String? id,
    String? userName,
  }) async {
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
      if (userName != null) 'userName': [userName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/userDetails',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetUserDetailsResponse.fromJson(response);
  }

  /// Returns information about a workflow.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The ID of the workflow. To rerieve a list of workflow IDs, use
  /// <a>ListWorkflows</a>.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<GetWorkflowResponse> getWorkflow({
    required String id,
    required String projectName,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/workflows/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowResponse.fromJson(response);
  }

  /// Returns information about a specified run of a workflow.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The ID of the workflow run. To retrieve a list of workflow run IDs, use
  /// <a>ListWorkflowRuns</a>.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<GetWorkflowRunResponse> getWorkflowRun({
    required String id,
    required String projectName,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/workflowRuns/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowRunResponse.fromJson(response);
  }

  /// Lists all personal access tokens (PATs) associated with the user who calls
  /// the API. You can only list PATs associated with your Amazon Web Services
  /// Builder ID.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to show in a single call to this API. If the
  /// number of results is larger than the number you specified, the response
  /// will include a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  Future<ListAccessTokensResponse> listAccessTokens({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      10,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/accessTokens',
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessTokensResponse.fromJson(response);
  }

  /// Retrieves a list of active sessions for a Dev Environment in a project.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [devEnvironmentId] :
  /// The system-generated unique ID of the Dev Environment.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to show in a single call to this API. If the
  /// number of results is larger than the number you specified, the response
  /// will include a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  Future<ListDevEnvironmentSessionsResponse> listDevEnvironmentSessions({
    required String devEnvironmentId,
    required String projectName,
    required String spaceName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/devEnvironments/${Uri.encodeComponent(devEnvironmentId)}/sessions',
      exceptionFnMap: _exceptionFns,
    );
    return ListDevEnvironmentSessionsResponse.fromJson(response);
  }

  /// Retrieves a list of Dev Environments in a project.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [filters] :
  /// Information about filters to apply to narrow the results returned in the
  /// list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to show in a single call to this API. If the
  /// number of results is larger than the number you specified, the response
  /// will include a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  Future<ListDevEnvironmentsResponse> listDevEnvironments({
    required String spaceName,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    String? projectName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (projectName != null) 'projectName': projectName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/devEnvironments',
      exceptionFnMap: _exceptionFns,
    );
    return ListDevEnvironmentsResponse.fromJson(response);
  }

  /// Retrieves a list of events that occurred during a specific time in a
  /// space. You can use these events to audit user and system activity in a
  /// space. For more information, see <a
  /// href="https://docs.aws.amazon.com/codecatalyst/latest/userguide/ipa-monitoring.html">Monitoring</a>
  /// in the <i>Amazon CodeCatalyst User Guide</i>.
  /// <note>
  /// ListEventLogs guarantees events for the last 30 days in a given space. You
  /// can also view and retrieve a list of management events over the last 90
  /// days for Amazon CodeCatalyst in the CloudTrail console by viewing Event
  /// history, or by creating a trail to create and maintain a record of events
  /// that extends past 90 days. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/view-cloudtrail-events.html">Working
  /// with CloudTrail Event History</a> and <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-getting-started.html">Working
  /// with CloudTrail trails</a>.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [endTime] :
  /// The time after which you do not want any events retrieved, in coordinated
  /// universal time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [startTime] :
  /// The date and time when you want to start retrieving events, in coordinated
  /// universal time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  ///
  /// Parameter [eventName] :
  /// The name of the event.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to show in a single call to this API. If the
  /// number of results is larger than the number you specified, the response
  /// will include a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  Future<ListEventLogsResponse> listEventLogs({
    required DateTime endTime,
    required String spaceName,
    required DateTime startTime,
    String? eventName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      'endTime': iso8601ToJson(endTime),
      'startTime': iso8601ToJson(startTime),
      if (eventName != null) 'eventName': eventName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/spaces/${Uri.encodeComponent(spaceName)}/eventLogs',
      exceptionFnMap: _exceptionFns,
    );
    return ListEventLogsResponse.fromJson(response);
  }

  /// Retrieves a list of projects.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [filters] :
  /// Information about filters to apply to narrow the results returned in the
  /// list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to show in a single call to this API. If the
  /// number of results is larger than the number you specified, the response
  /// will include a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  Future<ListProjectsResponse> listProjects({
    required String spaceName,
    List<ProjectListFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects',
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectsResponse.fromJson(response);
  }

  /// Retrieves a list of source repositories in a project.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to show in a single call to this API. If the
  /// number of results is larger than the number you specified, the response
  /// will include a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  Future<ListSourceRepositoriesResponse> listSourceRepositories({
    required String projectName,
    required String spaceName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/sourceRepositories',
      exceptionFnMap: _exceptionFns,
    );
    return ListSourceRepositoriesResponse.fromJson(response);
  }

  /// Retrieves a list of branches in a specified source repository.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [sourceRepositoryName] :
  /// The name of the source repository.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to show in a single call to this API. If the
  /// number of results is larger than the number you specified, the response
  /// will include a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  Future<ListSourceRepositoryBranchesResponse> listSourceRepositoryBranches({
    required String projectName,
    required String sourceRepositoryName,
    required String spaceName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/sourceRepositories/${Uri.encodeComponent(sourceRepositoryName)}/branches',
      exceptionFnMap: _exceptionFns,
    );
    return ListSourceRepositoryBranchesResponse.fromJson(response);
  }

  /// Retrieves a list of spaces.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  Future<ListSpacesResponse> listSpaces({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/spaces',
      exceptionFnMap: _exceptionFns,
    );
    return ListSpacesResponse.fromJson(response);
  }

  /// Retrieves a list of workflow runs of a specified workflow.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to show in a single call to this API. If the
  /// number of results is larger than the number you specified, the response
  /// will include a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  ///
  /// Parameter [sortBy] :
  /// Information used to sort the items in the returned list.
  ///
  /// Parameter [workflowId] :
  /// The ID of the workflow. To retrieve a list of workflow IDs, use
  /// <a>ListWorkflows</a>.
  Future<ListWorkflowRunsResponse> listWorkflowRuns({
    required String projectName,
    required String spaceName,
    int? maxResults,
    String? nextToken,
    List<WorkflowRunSortCriteria>? sortBy,
    String? workflowId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (workflowId != null) 'workflowId': [workflowId],
    };
    final $payload = <String, dynamic>{
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/workflowRuns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowRunsResponse.fromJson(response);
  }

  /// Retrieves a list of workflows in a specified project.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to show in a single call to this API. If the
  /// number of results is larger than the number you specified, the response
  /// will include a <code>NextToken</code> element, which you can use to obtain
  /// additional results.
  ///
  /// Parameter [nextToken] :
  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  ///
  /// Parameter [sortBy] :
  /// Information used to sort the items in the returned list.
  Future<ListWorkflowsResponse> listWorkflows({
    required String projectName,
    required String spaceName,
    int? maxResults,
    String? nextToken,
    List<WorkflowSortCriteria>? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/workflows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowsResponse.fromJson(response);
  }

  /// Starts a specified Dev Environment and puts it into an active state.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The system-generated unique ID of the Dev Environment.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [ides] :
  /// Information about the integrated development environment (IDE) configured
  /// for a Dev Environment.
  ///
  /// Parameter [inactivityTimeoutMinutes] :
  /// The amount of time the Dev Environment will run without any activity
  /// detected before stopping, in minutes. Only whole integers are allowed. Dev
  /// Environments consume compute minutes when running.
  ///
  /// Parameter [instanceType] :
  /// The Amazon EC2 instace type to use for the Dev Environment.
  Future<StartDevEnvironmentResponse> startDevEnvironment({
    required String id,
    required String projectName,
    required String spaceName,
    List<IdeConfiguration>? ides,
    int? inactivityTimeoutMinutes,
    InstanceType? instanceType,
  }) async {
    _s.validateNumRange(
      'inactivityTimeoutMinutes',
      inactivityTimeoutMinutes,
      0,
      1200,
    );
    final $payload = <String, dynamic>{
      if (ides != null) 'ides': ides,
      if (inactivityTimeoutMinutes != null)
        'inactivityTimeoutMinutes': inactivityTimeoutMinutes,
      if (instanceType != null) 'instanceType': instanceType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/devEnvironments/${Uri.encodeComponent(id)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartDevEnvironmentResponse.fromJson(response);
  }

  /// Starts a session for a specified Dev Environment.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The system-generated unique ID of the Dev Environment.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<StartDevEnvironmentSessionResponse> startDevEnvironmentSession({
    required String id,
    required String projectName,
    required DevEnvironmentSessionConfiguration sessionConfiguration,
    required String spaceName,
  }) async {
    final $payload = <String, dynamic>{
      'sessionConfiguration': sessionConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/devEnvironments/${Uri.encodeComponent(id)}/session',
      exceptionFnMap: _exceptionFns,
    );
    return StartDevEnvironmentSessionResponse.fromJson(response);
  }

  /// Begins a run of a specified workflow.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [workflowId] :
  /// The system-generated unique ID of the workflow. To retrieve a list of
  /// workflow IDs, use <a>ListWorkflows</a>.
  ///
  /// Parameter [clientToken] :
  /// A user-specified idempotency token. Idempotency ensures that an API
  /// request completes only once. With an idempotent request, if the original
  /// request completes successfully, the subsequent retries return the result
  /// from the original successful request and have no additional effect.
  Future<StartWorkflowRunResponse> startWorkflowRun({
    required String projectName,
    required String spaceName,
    required String workflowId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'workflowId': [workflowId],
    };
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/workflowRuns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return StartWorkflowRunResponse.fromJson(response);
  }

  /// Pauses a specified Dev Environment and places it in a non-running state.
  /// Stopped Dev Environments do not consume compute minutes.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The system-generated unique ID of the Dev Environment.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<StopDevEnvironmentResponse> stopDevEnvironment({
    required String id,
    required String projectName,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/devEnvironments/${Uri.encodeComponent(id)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopDevEnvironmentResponse.fromJson(response);
  }

  /// Stops a session for a specified Dev Environment.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The system-generated unique ID of the Dev Environment. To obtain this ID,
  /// use <a>ListDevEnvironments</a>.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [sessionId] :
  /// The system-generated unique ID of the Dev Environment session. This ID is
  /// returned by <a>StartDevEnvironmentSession</a>.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  Future<StopDevEnvironmentSessionResponse> stopDevEnvironmentSession({
    required String id,
    required String projectName,
    required String sessionId,
    required String spaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/devEnvironments/${Uri.encodeComponent(id)}/session/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return StopDevEnvironmentSessionResponse.fromJson(response);
  }

  /// Changes one or more values for a Dev Environment. Updating certain values
  /// of the Dev Environment will cause a restart.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The system-generated unique ID of the Dev Environment.
  ///
  /// Parameter [projectName] :
  /// The name of the project in the space.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [alias] :
  /// The user-specified alias for the Dev Environment. Changing this value will
  /// not cause a restart.
  ///
  /// Parameter [clientToken] :
  /// A user-specified idempotency token. Idempotency ensures that an API
  /// request completes only once. With an idempotent request, if the original
  /// request completes successfully, the subsequent retries return the result
  /// from the original successful request and have no additional effect.
  ///
  /// Parameter [ides] :
  /// Information about the integrated development environment (IDE) configured
  /// for a Dev Environment.
  ///
  /// Parameter [inactivityTimeoutMinutes] :
  /// The amount of time the Dev Environment will run without any activity
  /// detected before stopping, in minutes. Only whole integers are allowed. Dev
  /// Environments consume compute minutes when running.
  /// <note>
  /// Changing this value will cause a restart of the Dev Environment if it is
  /// running.
  /// </note>
  ///
  /// Parameter [instanceType] :
  /// The Amazon EC2 instace type to use for the Dev Environment.
  /// <note>
  /// Changing this value will cause a restart of the Dev Environment if it is
  /// running.
  /// </note>
  Future<UpdateDevEnvironmentResponse> updateDevEnvironment({
    required String id,
    required String projectName,
    required String spaceName,
    String? alias,
    String? clientToken,
    List<IdeConfiguration>? ides,
    int? inactivityTimeoutMinutes,
    InstanceType? instanceType,
  }) async {
    _s.validateNumRange(
      'inactivityTimeoutMinutes',
      inactivityTimeoutMinutes,
      0,
      1200,
    );
    final $payload = <String, dynamic>{
      if (alias != null) 'alias': alias,
      if (clientToken != null) 'clientToken': clientToken,
      if (ides != null) 'ides': ides,
      if (inactivityTimeoutMinutes != null)
        'inactivityTimeoutMinutes': inactivityTimeoutMinutes,
      if (instanceType != null) 'instanceType': instanceType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(projectName)}/devEnvironments/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDevEnvironmentResponse.fromJson(response);
  }

  /// Changes one or more values for a project.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the project.
  ///
  /// Parameter [spaceName] :
  /// The name of the space.
  ///
  /// Parameter [description] :
  /// The description of the project.
  Future<UpdateProjectResponse> updateProject({
    required String name,
    required String spaceName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v1/spaces/${Uri.encodeComponent(spaceName)}/projects/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProjectResponse.fromJson(response);
  }

  /// Changes one or more values for a space.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the space.
  ///
  /// Parameter [description] :
  /// The description of the space.
  Future<UpdateSpaceResponse> updateSpace({
    required String name,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v1/spaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSpaceResponse.fromJson(response);
  }

  /// Verifies whether the calling user has a valid Amazon CodeCatalyst login
  /// and session. If successful, this returns the ID of the user in Amazon
  /// CodeCatalyst.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  Future<VerifySessionResponse> verifySession() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/session',
      exceptionFnMap: _exceptionFns,
    );
    return VerifySessionResponse.fromJson(response);
  }
}

/// Information about a specified personal access token (PAT).
class AccessTokenSummary {
  /// The system-generated ID of the personal access token.
  final String id;

  /// The friendly name of the personal access token.
  final String name;

  /// The date and time when the personal access token will expire, in coordinated
  /// universal time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime? expiresTime;

  AccessTokenSummary({
    required this.id,
    required this.name,
    this.expiresTime,
  });

  factory AccessTokenSummary.fromJson(Map<String, dynamic> json) {
    return AccessTokenSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      expiresTime: timeStampFromJson(json['expiresTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final expiresTime = this.expiresTime;
    return {
      'id': id,
      'name': name,
      if (expiresTime != null) 'expiresTime': iso8601ToJson(expiresTime),
    };
  }
}

enum ComparisonOperator {
  eq,
  gt,
  ge,
  lt,
  le,
  beginsWith,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.eq:
        return 'EQ';
      case ComparisonOperator.gt:
        return 'GT';
      case ComparisonOperator.ge:
        return 'GE';
      case ComparisonOperator.lt:
        return 'LT';
      case ComparisonOperator.le:
        return 'LE';
      case ComparisonOperator.beginsWith:
        return 'BEGINS_WITH';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'EQ':
        return ComparisonOperator.eq;
      case 'GT':
        return ComparisonOperator.gt;
      case 'GE':
        return ComparisonOperator.ge;
      case 'LT':
        return ComparisonOperator.lt;
      case 'LE':
        return ComparisonOperator.le;
      case 'BEGINS_WITH':
        return ComparisonOperator.beginsWith;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

class CreateAccessTokenResponse {
  /// The system-generated unique ID of the access token.
  final String accessTokenId;

  /// The date and time the personal access token expires, in coordinated
  /// universal time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>. If
  /// not specified, the default is one year from creation.
  final DateTime expiresTime;

  /// The friendly name of the personal access token.
  final String name;

  /// The secret value of the personal access token.
  final String secret;

  CreateAccessTokenResponse({
    required this.accessTokenId,
    required this.expiresTime,
    required this.name,
    required this.secret,
  });

  factory CreateAccessTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccessTokenResponse(
      accessTokenId: json['accessTokenId'] as String,
      expiresTime: nonNullableTimeStampFromJson(json['expiresTime'] as Object),
      name: json['name'] as String,
      secret: json['secret'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accessTokenId = this.accessTokenId;
    final expiresTime = this.expiresTime;
    final name = this.name;
    final secret = this.secret;
    return {
      'accessTokenId': accessTokenId,
      'expiresTime': iso8601ToJson(expiresTime),
      'name': name,
      'secret': secret,
    };
  }
}

class CreateDevEnvironmentResponse {
  /// The system-generated unique ID of the Dev Environment.
  final String id;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The name of the connection used to connect to Amazon VPC used when the Dev
  /// Environment was created, if any.
  final String? vpcConnectionName;

  CreateDevEnvironmentResponse({
    required this.id,
    required this.projectName,
    required this.spaceName,
    this.vpcConnectionName,
  });

  factory CreateDevEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateDevEnvironmentResponse(
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      vpcConnectionName: json['vpcConnectionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final vpcConnectionName = this.vpcConnectionName;
    return {
      'id': id,
      'projectName': projectName,
      'spaceName': spaceName,
      if (vpcConnectionName != null) 'vpcConnectionName': vpcConnectionName,
    };
  }
}

class CreateProjectResponse {
  /// The name of the project in the space.
  final String name;

  /// The description of the project.
  final String? description;

  /// The friendly name of the project.
  final String? displayName;

  /// The name of the space.
  final String? spaceName;

  CreateProjectResponse({
    required this.name,
    this.description,
    this.displayName,
    this.spaceName,
  });

  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) {
    return CreateProjectResponse(
      name: json['name'] as String,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      spaceName: json['spaceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    final displayName = this.displayName;
    final spaceName = this.spaceName;
    return {
      'name': name,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (spaceName != null) 'spaceName': spaceName,
    };
  }
}

class CreateSourceRepositoryBranchResponse {
  /// The commit ID of the tip of the newly created branch.
  final String? headCommitId;

  /// The time the branch was last updated, in coordinated universal time (UTC)
  /// timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime? lastUpdatedTime;

  /// The name of the newly created branch.
  final String? name;

  /// The Git reference name of the branch.
  final String? ref;

  CreateSourceRepositoryBranchResponse({
    this.headCommitId,
    this.lastUpdatedTime,
    this.name,
    this.ref,
  });

  factory CreateSourceRepositoryBranchResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSourceRepositoryBranchResponse(
      headCommitId: json['headCommitId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      name: json['name'] as String?,
      ref: json['ref'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final headCommitId = this.headCommitId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final ref = this.ref;
    return {
      if (headCommitId != null) 'headCommitId': headCommitId,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      if (name != null) 'name': name,
      if (ref != null) 'ref': ref,
    };
  }
}

class CreateSourceRepositoryResponse {
  /// The name of the source repository.
  final String name;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The description of the source repository.
  final String? description;

  CreateSourceRepositoryResponse({
    required this.name,
    required this.projectName,
    required this.spaceName,
    this.description,
  });

  factory CreateSourceRepositoryResponse.fromJson(Map<String, dynamic> json) {
    return CreateSourceRepositoryResponse(
      name: json['name'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final description = this.description;
    return {
      'name': name,
      'projectName': projectName,
      'spaceName': spaceName,
      if (description != null) 'description': description,
    };
  }
}

class DeleteAccessTokenResponse {
  DeleteAccessTokenResponse();

  factory DeleteAccessTokenResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccessTokenResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDevEnvironmentResponse {
  /// The system-generated unique ID of the deleted Dev Environment.
  final String id;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  DeleteDevEnvironmentResponse({
    required this.id,
    required this.projectName,
    required this.spaceName,
  });

  factory DeleteDevEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDevEnvironmentResponse(
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    return {
      'id': id,
      'projectName': projectName,
      'spaceName': spaceName,
    };
  }
}

class DeleteProjectResponse {
  /// The name of the project in the space.
  final String name;

  /// The name of the space.
  final String spaceName;

  /// The friendly name displayed to users of the project in Amazon CodeCatalyst.
  final String? displayName;

  DeleteProjectResponse({
    required this.name,
    required this.spaceName,
    this.displayName,
  });

  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProjectResponse(
      name: json['name'] as String,
      spaceName: json['spaceName'] as String,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final spaceName = this.spaceName;
    final displayName = this.displayName;
    return {
      'name': name,
      'spaceName': spaceName,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

class DeleteSourceRepositoryResponse {
  /// The name of the repository.
  final String name;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  DeleteSourceRepositoryResponse({
    required this.name,
    required this.projectName,
    required this.spaceName,
  });

  factory DeleteSourceRepositoryResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSourceRepositoryResponse(
      name: json['name'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    return {
      'name': name,
      'projectName': projectName,
      'spaceName': spaceName,
    };
  }
}

class DeleteSpaceResponse {
  /// The name of the space.
  final String name;

  /// The friendly name of the space displayed to users of the space in Amazon
  /// CodeCatalyst.
  final String? displayName;

  DeleteSpaceResponse({
    required this.name,
    this.displayName,
  });

  factory DeleteSpaceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSpaceResponse(
      name: json['name'] as String,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final displayName = this.displayName;
    return {
      'name': name,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

/// Information about connection details for a Dev Environment.
class DevEnvironmentAccessDetails {
  /// The URL used to send commands to and from the Dev Environment.
  final String streamUrl;

  /// An encrypted token value that contains session and caller information used
  /// to authenticate the connection.
  final String tokenValue;

  DevEnvironmentAccessDetails({
    required this.streamUrl,
    required this.tokenValue,
  });

  factory DevEnvironmentAccessDetails.fromJson(Map<String, dynamic> json) {
    return DevEnvironmentAccessDetails(
      streamUrl: json['streamUrl'] as String,
      tokenValue: json['tokenValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final streamUrl = this.streamUrl;
    final tokenValue = this.tokenValue;
    return {
      'streamUrl': streamUrl,
      'tokenValue': tokenValue,
    };
  }
}

/// Information about the source repsitory for a Dev Environment.
class DevEnvironmentRepositorySummary {
  /// The name of the source repository.
  final String repositoryName;

  /// The name of the branch in a source repository cloned into the Dev
  /// Environment.
  final String? branchName;

  DevEnvironmentRepositorySummary({
    required this.repositoryName,
    this.branchName,
  });

  factory DevEnvironmentRepositorySummary.fromJson(Map<String, dynamic> json) {
    return DevEnvironmentRepositorySummary(
      repositoryName: json['repositoryName'] as String,
      branchName: json['branchName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryName = this.repositoryName;
    final branchName = this.branchName;
    return {
      'repositoryName': repositoryName,
      if (branchName != null) 'branchName': branchName,
    };
  }
}

/// Information about the configuration of a Dev Environment session.
class DevEnvironmentSessionConfiguration {
  /// The type of the session.
  final DevEnvironmentSessionType sessionType;

  /// Information about optional commands that will be run on the Dev Environment
  /// when the SSH session begins.
  final ExecuteCommandSessionConfiguration? executeCommandSessionConfiguration;

  DevEnvironmentSessionConfiguration({
    required this.sessionType,
    this.executeCommandSessionConfiguration,
  });

  Map<String, dynamic> toJson() {
    final sessionType = this.sessionType;
    final executeCommandSessionConfiguration =
        this.executeCommandSessionConfiguration;
    return {
      'sessionType': sessionType.toValue(),
      if (executeCommandSessionConfiguration != null)
        'executeCommandSessionConfiguration':
            executeCommandSessionConfiguration,
    };
  }
}

/// Information about active sessions for a Dev Environment.
class DevEnvironmentSessionSummary {
  /// The system-generated unique ID of the Dev Environment.
  final String devEnvironmentId;

  /// The system-generated unique ID of the Dev Environment session.
  final String id;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The date and time the session started, in coordinated universal time (UTC)
  /// timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>
  final DateTime startedTime;

  DevEnvironmentSessionSummary({
    required this.devEnvironmentId,
    required this.id,
    required this.projectName,
    required this.spaceName,
    required this.startedTime,
  });

  factory DevEnvironmentSessionSummary.fromJson(Map<String, dynamic> json) {
    return DevEnvironmentSessionSummary(
      devEnvironmentId: json['devEnvironmentId'] as String,
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      startedTime: nonNullableTimeStampFromJson(json['startedTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final devEnvironmentId = this.devEnvironmentId;
    final id = this.id;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final startedTime = this.startedTime;
    return {
      'devEnvironmentId': devEnvironmentId,
      'id': id,
      'projectName': projectName,
      'spaceName': spaceName,
      'startedTime': iso8601ToJson(startedTime),
    };
  }
}

enum DevEnvironmentSessionType {
  ssm,
  ssh,
}

extension DevEnvironmentSessionTypeValueExtension on DevEnvironmentSessionType {
  String toValue() {
    switch (this) {
      case DevEnvironmentSessionType.ssm:
        return 'SSM';
      case DevEnvironmentSessionType.ssh:
        return 'SSH';
    }
  }
}

extension DevEnvironmentSessionTypeFromString on String {
  DevEnvironmentSessionType toDevEnvironmentSessionType() {
    switch (this) {
      case 'SSM':
        return DevEnvironmentSessionType.ssm;
      case 'SSH':
        return DevEnvironmentSessionType.ssh;
    }
    throw Exception('$this is not known in enum DevEnvironmentSessionType');
  }
}

enum DevEnvironmentStatus {
  pending,
  running,
  starting,
  stopping,
  stopped,
  failed,
  deleting,
  deleted,
}

extension DevEnvironmentStatusValueExtension on DevEnvironmentStatus {
  String toValue() {
    switch (this) {
      case DevEnvironmentStatus.pending:
        return 'PENDING';
      case DevEnvironmentStatus.running:
        return 'RUNNING';
      case DevEnvironmentStatus.starting:
        return 'STARTING';
      case DevEnvironmentStatus.stopping:
        return 'STOPPING';
      case DevEnvironmentStatus.stopped:
        return 'STOPPED';
      case DevEnvironmentStatus.failed:
        return 'FAILED';
      case DevEnvironmentStatus.deleting:
        return 'DELETING';
      case DevEnvironmentStatus.deleted:
        return 'DELETED';
    }
  }
}

extension DevEnvironmentStatusFromString on String {
  DevEnvironmentStatus toDevEnvironmentStatus() {
    switch (this) {
      case 'PENDING':
        return DevEnvironmentStatus.pending;
      case 'RUNNING':
        return DevEnvironmentStatus.running;
      case 'STARTING':
        return DevEnvironmentStatus.starting;
      case 'STOPPING':
        return DevEnvironmentStatus.stopping;
      case 'STOPPED':
        return DevEnvironmentStatus.stopped;
      case 'FAILED':
        return DevEnvironmentStatus.failed;
      case 'DELETING':
        return DevEnvironmentStatus.deleting;
      case 'DELETED':
        return DevEnvironmentStatus.deleted;
    }
    throw Exception('$this is not known in enum DevEnvironmentStatus');
  }
}

/// Information about a Dev Environment.
class DevEnvironmentSummary {
  /// The system-generated unique ID of the user who created the Dev Environment.
  final String creatorId;

  /// The system-generated unique ID for the Dev Environment.
  final String id;

  /// The amount of time the Dev Environment will run without any activity
  /// detected before stopping, in minutes. Dev Environments consume compute
  /// minutes when running.
  final int inactivityTimeoutMinutes;

  /// The Amazon EC2 instace type used for the Dev Environment.
  final InstanceType instanceType;

  /// The time when the Dev Environment was last updated, in coordinated universal
  /// time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime lastUpdatedTime;

  /// Information about the configuration of persistent storage for the Dev
  /// Environment.
  final PersistentStorage persistentStorage;

  /// Information about the repositories that will be cloned into the Dev
  /// Environment. If no rvalue is specified, no repository is cloned.
  final List<DevEnvironmentRepositorySummary> repositories;

  /// The status of the Dev Environment.
  final DevEnvironmentStatus status;

  /// The user-specified alias for the Dev Environment.
  final String? alias;

  /// Information about the integrated development environment (IDE) configured
  /// for a Dev Environment.
  final List<Ide>? ides;

  /// The name of the project in the space.
  final String? projectName;

  /// The name of the space.
  final String? spaceName;

  /// The reason for the status.
  final String? statusReason;

  /// The name of the connection used to connect to Amazon VPC used when the Dev
  /// Environment was created, if any.
  final String? vpcConnectionName;

  DevEnvironmentSummary({
    required this.creatorId,
    required this.id,
    required this.inactivityTimeoutMinutes,
    required this.instanceType,
    required this.lastUpdatedTime,
    required this.persistentStorage,
    required this.repositories,
    required this.status,
    this.alias,
    this.ides,
    this.projectName,
    this.spaceName,
    this.statusReason,
    this.vpcConnectionName,
  });

  factory DevEnvironmentSummary.fromJson(Map<String, dynamic> json) {
    return DevEnvironmentSummary(
      creatorId: json['creatorId'] as String,
      id: json['id'] as String,
      inactivityTimeoutMinutes: json['inactivityTimeoutMinutes'] as int,
      instanceType: (json['instanceType'] as String).toInstanceType(),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      persistentStorage: PersistentStorage.fromJson(
          json['persistentStorage'] as Map<String, dynamic>),
      repositories: (json['repositories'] as List)
          .whereNotNull()
          .map((e) => DevEnvironmentRepositorySummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String).toDevEnvironmentStatus(),
      alias: json['alias'] as String?,
      ides: (json['ides'] as List?)
          ?.whereNotNull()
          .map((e) => Ide.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectName: json['projectName'] as String?,
      spaceName: json['spaceName'] as String?,
      statusReason: json['statusReason'] as String?,
      vpcConnectionName: json['vpcConnectionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creatorId = this.creatorId;
    final id = this.id;
    final inactivityTimeoutMinutes = this.inactivityTimeoutMinutes;
    final instanceType = this.instanceType;
    final lastUpdatedTime = this.lastUpdatedTime;
    final persistentStorage = this.persistentStorage;
    final repositories = this.repositories;
    final status = this.status;
    final alias = this.alias;
    final ides = this.ides;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final statusReason = this.statusReason;
    final vpcConnectionName = this.vpcConnectionName;
    return {
      'creatorId': creatorId,
      'id': id,
      'inactivityTimeoutMinutes': inactivityTimeoutMinutes,
      'instanceType': instanceType.toValue(),
      'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'persistentStorage': persistentStorage,
      'repositories': repositories,
      'status': status.toValue(),
      if (alias != null) 'alias': alias,
      if (ides != null) 'ides': ides,
      if (projectName != null) 'projectName': projectName,
      if (spaceName != null) 'spaceName': spaceName,
      if (statusReason != null) 'statusReason': statusReason,
      if (vpcConnectionName != null) 'vpcConnectionName': vpcConnectionName,
    };
  }
}

/// Information about an email address.
class EmailAddress {
  /// The email address.
  final String? email;

  /// Whether the email address has been verified.
  final bool? verified;

  EmailAddress({
    this.email,
    this.verified,
  });

  factory EmailAddress.fromJson(Map<String, dynamic> json) {
    return EmailAddress(
      email: json['email'] as String?,
      verified: json['verified'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final verified = this.verified;
    return {
      if (email != null) 'email': email,
      if (verified != null) 'verified': verified,
    };
  }
}

/// Information about an entry in an event log of Amazon CodeCatalyst activity.
class EventLogEntry {
  /// The category for the event.
  final String eventCategory;

  /// The name of the event.
  final String eventName;

  /// The source of the event.
  final String eventSource;

  /// The time the event took place, in coordinated universal time (UTC) timestamp
  /// format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime eventTime;

  /// The type of the event.
  final String eventType;

  /// The system-generated unique ID of the event.
  final String id;

  /// The type of the event.
  final OperationType operationType;

  /// The system-generated unique ID of the user whose actions are recorded in the
  /// event.
  final UserIdentity userIdentity;

  /// The code of the error, if any.
  final String? errorCode;

  /// Information about the project where the event occurred.
  final ProjectInformation? projectInformation;

  /// The system-generated unique ID of the request.
  final String? requestId;

  /// Information about the payload of the request.
  final EventPayload? requestPayload;

  /// Information about the payload of the response, if any.
  final EventPayload? responsePayload;

  /// The IP address of the user whose actions are recorded in the event.
  final String? sourceIpAddress;

  /// The user agent whose actions are recorded in the event.
  final String? userAgent;

  EventLogEntry({
    required this.eventCategory,
    required this.eventName,
    required this.eventSource,
    required this.eventTime,
    required this.eventType,
    required this.id,
    required this.operationType,
    required this.userIdentity,
    this.errorCode,
    this.projectInformation,
    this.requestId,
    this.requestPayload,
    this.responsePayload,
    this.sourceIpAddress,
    this.userAgent,
  });

  factory EventLogEntry.fromJson(Map<String, dynamic> json) {
    return EventLogEntry(
      eventCategory: json['eventCategory'] as String,
      eventName: json['eventName'] as String,
      eventSource: json['eventSource'] as String,
      eventTime: nonNullableTimeStampFromJson(json['eventTime'] as Object),
      eventType: json['eventType'] as String,
      id: json['id'] as String,
      operationType: (json['operationType'] as String).toOperationType(),
      userIdentity:
          UserIdentity.fromJson(json['userIdentity'] as Map<String, dynamic>),
      errorCode: json['errorCode'] as String?,
      projectInformation: json['projectInformation'] != null
          ? ProjectInformation.fromJson(
              json['projectInformation'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
      requestPayload: json['requestPayload'] != null
          ? EventPayload.fromJson(
              json['requestPayload'] as Map<String, dynamic>)
          : null,
      responsePayload: json['responsePayload'] != null
          ? EventPayload.fromJson(
              json['responsePayload'] as Map<String, dynamic>)
          : null,
      sourceIpAddress: json['sourceIpAddress'] as String?,
      userAgent: json['userAgent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventCategory = this.eventCategory;
    final eventName = this.eventName;
    final eventSource = this.eventSource;
    final eventTime = this.eventTime;
    final eventType = this.eventType;
    final id = this.id;
    final operationType = this.operationType;
    final userIdentity = this.userIdentity;
    final errorCode = this.errorCode;
    final projectInformation = this.projectInformation;
    final requestId = this.requestId;
    final requestPayload = this.requestPayload;
    final responsePayload = this.responsePayload;
    final sourceIpAddress = this.sourceIpAddress;
    final userAgent = this.userAgent;
    return {
      'eventCategory': eventCategory,
      'eventName': eventName,
      'eventSource': eventSource,
      'eventTime': iso8601ToJson(eventTime),
      'eventType': eventType,
      'id': id,
      'operationType': operationType.toValue(),
      'userIdentity': userIdentity,
      if (errorCode != null) 'errorCode': errorCode,
      if (projectInformation != null) 'projectInformation': projectInformation,
      if (requestId != null) 'requestId': requestId,
      if (requestPayload != null) 'requestPayload': requestPayload,
      if (responsePayload != null) 'responsePayload': responsePayload,
      if (sourceIpAddress != null) 'sourceIpAddress': sourceIpAddress,
      if (userAgent != null) 'userAgent': userAgent,
    };
  }
}

/// Information about the payload of an event recording Amazon CodeCatalyst
/// activity.
class EventPayload {
  /// The type of content in the event payload.
  final String? contentType;

  /// The data included in the event payload.
  final String? data;

  EventPayload({
    this.contentType,
    this.data,
  });

  factory EventPayload.fromJson(Map<String, dynamic> json) {
    return EventPayload(
      contentType: json['contentType'] as String?,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final data = this.data;
    return {
      if (contentType != null) 'contentType': contentType,
      if (data != null) 'data': data,
    };
  }
}

/// Information about the commands that will be run on a Dev Environment when an
/// SSH session begins.
class ExecuteCommandSessionConfiguration {
  /// The command used at the beginning of the SSH session to a Dev Environment.
  final String command;

  /// An array of arguments containing arguments and members.
  final List<String>? arguments;

  ExecuteCommandSessionConfiguration({
    required this.command,
    this.arguments,
  });

  Map<String, dynamic> toJson() {
    final command = this.command;
    final arguments = this.arguments;
    return {
      'command': command,
      if (arguments != null) 'arguments': arguments,
    };
  }
}

/// Information about a filter used to limit results of a query.
class Filter {
  /// A key that can be used to sort results.
  final String key;

  /// The values of the key.
  final List<String> values;

  /// The operator used to compare the fields.
  final String? comparisonOperator;

  Filter({
    required this.key,
    required this.values,
    this.comparisonOperator,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    final comparisonOperator = this.comparisonOperator;
    return {
      'key': key,
      'values': values,
      if (comparisonOperator != null) 'comparisonOperator': comparisonOperator,
    };
  }
}

enum FilterKey {
  hasAccessTo,
  name,
}

extension FilterKeyValueExtension on FilterKey {
  String toValue() {
    switch (this) {
      case FilterKey.hasAccessTo:
        return 'hasAccessTo';
      case FilterKey.name:
        return 'name';
    }
  }
}

extension FilterKeyFromString on String {
  FilterKey toFilterKey() {
    switch (this) {
      case 'hasAccessTo':
        return FilterKey.hasAccessTo;
      case 'name':
        return FilterKey.name;
    }
    throw Exception('$this is not known in enum FilterKey');
  }
}

class GetDevEnvironmentResponse {
  /// The system-generated unique ID of the user who created the Dev Environment.
  final String creatorId;

  /// The system-generated unique ID of the Dev Environment.
  final String id;

  /// The amount of time the Dev Environment will run without any activity
  /// detected before stopping, in minutes.
  final int inactivityTimeoutMinutes;

  /// The Amazon EC2 instace type to use for the Dev Environment.
  final InstanceType instanceType;

  /// The time when the Dev Environment was last updated, in coordinated universal
  /// time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime lastUpdatedTime;

  /// Information about the amount of storage allocated to the Dev Environment. By
  /// default, a Dev Environment is configured to have 16GB of persistent storage.
  final PersistentStorage persistentStorage;

  /// The name of the project in the space.
  final String projectName;

  /// The source repository that contains the branch cloned into the Dev
  /// Environment.
  final List<DevEnvironmentRepositorySummary> repositories;

  /// The name of the space.
  final String spaceName;

  /// The current status of the Dev Environment.
  final DevEnvironmentStatus status;

  /// The user-specified alias for the Dev Environment.
  final String? alias;

  /// Information about the integrated development environment (IDE) configured
  /// for the Dev Environment.
  final List<Ide>? ides;

  /// The reason for the status.
  final String? statusReason;

  /// The name of the connection used to connect to Amazon VPC used when the Dev
  /// Environment was created, if any.
  final String? vpcConnectionName;

  GetDevEnvironmentResponse({
    required this.creatorId,
    required this.id,
    required this.inactivityTimeoutMinutes,
    required this.instanceType,
    required this.lastUpdatedTime,
    required this.persistentStorage,
    required this.projectName,
    required this.repositories,
    required this.spaceName,
    required this.status,
    this.alias,
    this.ides,
    this.statusReason,
    this.vpcConnectionName,
  });

  factory GetDevEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetDevEnvironmentResponse(
      creatorId: json['creatorId'] as String,
      id: json['id'] as String,
      inactivityTimeoutMinutes: json['inactivityTimeoutMinutes'] as int,
      instanceType: (json['instanceType'] as String).toInstanceType(),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      persistentStorage: PersistentStorage.fromJson(
          json['persistentStorage'] as Map<String, dynamic>),
      projectName: json['projectName'] as String,
      repositories: (json['repositories'] as List)
          .whereNotNull()
          .map((e) => DevEnvironmentRepositorySummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      spaceName: json['spaceName'] as String,
      status: (json['status'] as String).toDevEnvironmentStatus(),
      alias: json['alias'] as String?,
      ides: (json['ides'] as List?)
          ?.whereNotNull()
          .map((e) => Ide.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusReason: json['statusReason'] as String?,
      vpcConnectionName: json['vpcConnectionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creatorId = this.creatorId;
    final id = this.id;
    final inactivityTimeoutMinutes = this.inactivityTimeoutMinutes;
    final instanceType = this.instanceType;
    final lastUpdatedTime = this.lastUpdatedTime;
    final persistentStorage = this.persistentStorage;
    final projectName = this.projectName;
    final repositories = this.repositories;
    final spaceName = this.spaceName;
    final status = this.status;
    final alias = this.alias;
    final ides = this.ides;
    final statusReason = this.statusReason;
    final vpcConnectionName = this.vpcConnectionName;
    return {
      'creatorId': creatorId,
      'id': id,
      'inactivityTimeoutMinutes': inactivityTimeoutMinutes,
      'instanceType': instanceType.toValue(),
      'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'persistentStorage': persistentStorage,
      'projectName': projectName,
      'repositories': repositories,
      'spaceName': spaceName,
      'status': status.toValue(),
      if (alias != null) 'alias': alias,
      if (ides != null) 'ides': ides,
      if (statusReason != null) 'statusReason': statusReason,
      if (vpcConnectionName != null) 'vpcConnectionName': vpcConnectionName,
    };
  }
}

class GetProjectResponse {
  /// The name of the project in the space.
  final String name;

  /// The description of the project.
  final String? description;

  /// The friendly name of the project displayed to users in Amazon CodeCatalyst.
  final String? displayName;

  /// The name of the space.
  final String? spaceName;

  GetProjectResponse({
    required this.name,
    this.description,
    this.displayName,
    this.spaceName,
  });

  factory GetProjectResponse.fromJson(Map<String, dynamic> json) {
    return GetProjectResponse(
      name: json['name'] as String,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      spaceName: json['spaceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    final displayName = this.displayName;
    final spaceName = this.spaceName;
    return {
      'name': name,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (spaceName != null) 'spaceName': spaceName,
    };
  }
}

class GetSourceRepositoryCloneUrlsResponse {
  /// The HTTPS URL to use when cloning the source repository.
  final String https;

  GetSourceRepositoryCloneUrlsResponse({
    required this.https,
  });

  factory GetSourceRepositoryCloneUrlsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSourceRepositoryCloneUrlsResponse(
      https: json['https'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final https = this.https;
    return {
      'https': https,
    };
  }
}

class GetSourceRepositoryResponse {
  /// The time the source repository was created, in coordinated universal time
  /// (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime createdTime;

  /// The time the source repository was last updated, in coordinated universal
  /// time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime lastUpdatedTime;

  /// The name of the source repository.
  final String name;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The description of the source repository.
  final String? description;

  GetSourceRepositoryResponse({
    required this.createdTime,
    required this.lastUpdatedTime,
    required this.name,
    required this.projectName,
    required this.spaceName,
    this.description,
  });

  factory GetSourceRepositoryResponse.fromJson(Map<String, dynamic> json) {
    return GetSourceRepositoryResponse(
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final description = this.description;
    return {
      'createdTime': iso8601ToJson(createdTime),
      'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'name': name,
      'projectName': projectName,
      'spaceName': spaceName,
      if (description != null) 'description': description,
    };
  }
}

class GetSpaceResponse {
  /// The name of the space.
  final String name;

  /// The Amazon Web Services Region where the space exists.
  final String regionName;

  /// The description of the space.
  final String? description;

  /// The friendly name of the space displayed to users.
  final String? displayName;

  GetSpaceResponse({
    required this.name,
    required this.regionName,
    this.description,
    this.displayName,
  });

  factory GetSpaceResponse.fromJson(Map<String, dynamic> json) {
    return GetSpaceResponse(
      name: json['name'] as String,
      regionName: json['regionName'] as String,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final regionName = this.regionName;
    final description = this.description;
    final displayName = this.displayName;
    return {
      'name': name,
      'regionName': regionName,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

class GetSubscriptionResponse {
  /// The display name of the Amazon Web Services account used for billing for the
  /// space.
  final String? awsAccountName;

  /// The day and time the pending change will be applied to the space, in
  /// coordinated universal time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime? pendingSubscriptionStartTime;

  /// The type of the billing plan that the space will be changed to at the start
  /// of the next billing cycle. This applies only to changes that reduce the
  /// functionality available for the space. Billing plan changes that increase
  /// functionality are applied immediately. For more information, see <a
  /// href="https://codecatalyst.aws/explore/pricing">Pricing</a>.
  final String? pendingSubscriptionType;

  /// The type of the billing plan for the space.
  final String? subscriptionType;

  GetSubscriptionResponse({
    this.awsAccountName,
    this.pendingSubscriptionStartTime,
    this.pendingSubscriptionType,
    this.subscriptionType,
  });

  factory GetSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return GetSubscriptionResponse(
      awsAccountName: json['awsAccountName'] as String?,
      pendingSubscriptionStartTime:
          timeStampFromJson(json['pendingSubscriptionStartTime']),
      pendingSubscriptionType: json['pendingSubscriptionType'] as String?,
      subscriptionType: json['subscriptionType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountName = this.awsAccountName;
    final pendingSubscriptionStartTime = this.pendingSubscriptionStartTime;
    final pendingSubscriptionType = this.pendingSubscriptionType;
    final subscriptionType = this.subscriptionType;
    return {
      if (awsAccountName != null) 'awsAccountName': awsAccountName,
      if (pendingSubscriptionStartTime != null)
        'pendingSubscriptionStartTime':
            iso8601ToJson(pendingSubscriptionStartTime),
      if (pendingSubscriptionType != null)
        'pendingSubscriptionType': pendingSubscriptionType,
      if (subscriptionType != null) 'subscriptionType': subscriptionType,
    };
  }
}

class GetUserDetailsResponse {
  /// The friendly name displayed for the user in Amazon CodeCatalyst.
  final String? displayName;

  /// The email address provided by the user when they signed up.
  final EmailAddress? primaryEmail;

  /// The system-generated unique ID of the user.
  final String? userId;

  /// The name of the user as displayed in Amazon CodeCatalyst.
  final String? userName;

  /// <p/>
  final String? version;

  GetUserDetailsResponse({
    this.displayName,
    this.primaryEmail,
    this.userId,
    this.userName,
    this.version,
  });

  factory GetUserDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetUserDetailsResponse(
      displayName: json['displayName'] as String?,
      primaryEmail: json['primaryEmail'] != null
          ? EmailAddress.fromJson(json['primaryEmail'] as Map<String, dynamic>)
          : null,
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final primaryEmail = this.primaryEmail;
    final userId = this.userId;
    final userName = this.userName;
    final version = this.version;
    return {
      if (displayName != null) 'displayName': displayName,
      if (primaryEmail != null) 'primaryEmail': primaryEmail,
      if (userId != null) 'userId': userId,
      if (userName != null) 'userName': userName,
      if (version != null) 'version': version,
    };
  }
}

class GetWorkflowResponse {
  /// The date and time the workflow was created, in coordinated universal time
  /// (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>
  final DateTime createdTime;

  /// Information about the workflow definition file for the workflow.
  final WorkflowDefinition definition;

  /// The ID of the workflow.
  final String id;

  /// The date and time the workflow was last updated, in coordinated universal
  /// time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>
  final DateTime lastUpdatedTime;

  /// The name of the workflow.
  final String name;

  /// The name of the project in the space.
  final String projectName;

  /// The behavior to use when multiple workflows occur at the same time. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codecatalyst/latest/userguide/workflows-configure-runs.html">https://docs.aws.amazon.com/codecatalyst/latest/userguide/workflows-configure-runs.html</a>
  /// in the Amazon CodeCatalyst User Guide.
  final WorkflowRunMode runMode;

  /// The name of the space.
  final String spaceName;

  /// The status of the workflow.
  final WorkflowStatus status;

  /// The name of the branch that contains the workflow YAML.
  final String? sourceBranchName;

  /// The name of the source repository where the workflow YAML is stored.
  final String? sourceRepositoryName;

  GetWorkflowResponse({
    required this.createdTime,
    required this.definition,
    required this.id,
    required this.lastUpdatedTime,
    required this.name,
    required this.projectName,
    required this.runMode,
    required this.spaceName,
    required this.status,
    this.sourceBranchName,
    this.sourceRepositoryName,
  });

  factory GetWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowResponse(
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      definition: WorkflowDefinition.fromJson(
          json['definition'] as Map<String, dynamic>),
      id: json['id'] as String,
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      projectName: json['projectName'] as String,
      runMode: (json['runMode'] as String).toWorkflowRunMode(),
      spaceName: json['spaceName'] as String,
      status: (json['status'] as String).toWorkflowStatus(),
      sourceBranchName: json['sourceBranchName'] as String?,
      sourceRepositoryName: json['sourceRepositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final definition = this.definition;
    final id = this.id;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final projectName = this.projectName;
    final runMode = this.runMode;
    final spaceName = this.spaceName;
    final status = this.status;
    final sourceBranchName = this.sourceBranchName;
    final sourceRepositoryName = this.sourceRepositoryName;
    return {
      'createdTime': iso8601ToJson(createdTime),
      'definition': definition,
      'id': id,
      'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'name': name,
      'projectName': projectName,
      'runMode': runMode.toValue(),
      'spaceName': spaceName,
      'status': status.toValue(),
      if (sourceBranchName != null) 'sourceBranchName': sourceBranchName,
      if (sourceRepositoryName != null)
        'sourceRepositoryName': sourceRepositoryName,
    };
  }
}

class GetWorkflowRunResponse {
  /// The ID of the workflow run.
  final String id;

  /// The date and time the workflow run status was last updated, in coordinated
  /// universal time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>
  final DateTime lastUpdatedTime;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The date and time the workflow run began, in coordinated universal time
  /// (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>
  final DateTime startTime;

  /// The status of the workflow run.
  final WorkflowRunStatus status;

  /// The ID of the workflow.
  final String workflowId;

  /// The date and time the workflow run ended, in coordinated universal time
  /// (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime? endTime;

  /// Information about the reasons for the status of the workflow run.
  final List<WorkflowRunStatusReason>? statusReasons;

  GetWorkflowRunResponse({
    required this.id,
    required this.lastUpdatedTime,
    required this.projectName,
    required this.spaceName,
    required this.startTime,
    required this.status,
    required this.workflowId,
    this.endTime,
    this.statusReasons,
  });

  factory GetWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowRunResponse(
      id: json['id'] as String,
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toWorkflowRunStatus(),
      workflowId: json['workflowId'] as String,
      endTime: timeStampFromJson(json['endTime']),
      statusReasons: (json['statusReasons'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WorkflowRunStatusReason.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final lastUpdatedTime = this.lastUpdatedTime;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final startTime = this.startTime;
    final status = this.status;
    final workflowId = this.workflowId;
    final endTime = this.endTime;
    final statusReasons = this.statusReasons;
    return {
      'id': id,
      'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'projectName': projectName,
      'spaceName': spaceName,
      'startTime': iso8601ToJson(startTime),
      'status': status.toValue(),
      'workflowId': workflowId,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (statusReasons != null) 'statusReasons': statusReasons,
    };
  }
}

/// Information about an integrated development environment (IDE) used in a Dev
/// Environment.
class Ide {
  /// The name of the IDE.
  final String? name;

  /// A link to the IDE runtime image.
  final String? runtime;

  Ide({
    this.name,
    this.runtime,
  });

  factory Ide.fromJson(Map<String, dynamic> json) {
    return Ide(
      name: json['name'] as String?,
      runtime: json['runtime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final runtime = this.runtime;
    return {
      if (name != null) 'name': name,
      if (runtime != null) 'runtime': runtime,
    };
  }
}

/// Information about the configuration of an integrated development environment
/// (IDE) for a Dev Environment.
class IdeConfiguration {
  /// The name of the IDE. Valid values include <code>Cloud9</code>,
  /// <code>IntelliJ</code>, <code>PyCharm</code>, <code>GoLand</code>, and
  /// <code>VSCode</code>.
  final String? name;

  /// A link to the IDE runtime image.
  /// <note>
  /// This parameter is not required for <code>VSCode</code>.
  /// </note>
  final String? runtime;

  IdeConfiguration({
    this.name,
    this.runtime,
  });

  factory IdeConfiguration.fromJson(Map<String, dynamic> json) {
    return IdeConfiguration(
      name: json['name'] as String?,
      runtime: json['runtime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final runtime = this.runtime;
    return {
      if (name != null) 'name': name,
      if (runtime != null) 'runtime': runtime,
    };
  }
}

enum InstanceType {
  devStandard1Small,
  devStandard1Medium,
  devStandard1Large,
  devStandard1Xlarge,
}

extension InstanceTypeValueExtension on InstanceType {
  String toValue() {
    switch (this) {
      case InstanceType.devStandard1Small:
        return 'dev.standard1.small';
      case InstanceType.devStandard1Medium:
        return 'dev.standard1.medium';
      case InstanceType.devStandard1Large:
        return 'dev.standard1.large';
      case InstanceType.devStandard1Xlarge:
        return 'dev.standard1.xlarge';
    }
  }
}

extension InstanceTypeFromString on String {
  InstanceType toInstanceType() {
    switch (this) {
      case 'dev.standard1.small':
        return InstanceType.devStandard1Small;
      case 'dev.standard1.medium':
        return InstanceType.devStandard1Medium;
      case 'dev.standard1.large':
        return InstanceType.devStandard1Large;
      case 'dev.standard1.xlarge':
        return InstanceType.devStandard1Xlarge;
    }
    throw Exception('$this is not known in enum InstanceType');
  }
}

class ListAccessTokensResponse {
  /// A list of personal access tokens (PATs) associated with the calling user
  /// identity.
  final List<AccessTokenSummary> items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListAccessTokensResponse({
    required this.items,
    this.nextToken,
  });

  factory ListAccessTokensResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessTokensResponse(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => AccessTokenSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDevEnvironmentSessionsResponse {
  /// Information about each session retrieved in the list.
  final List<DevEnvironmentSessionSummary> items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListDevEnvironmentSessionsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListDevEnvironmentSessionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDevEnvironmentSessionsResponse(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) =>
              DevEnvironmentSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDevEnvironmentsResponse {
  /// Information about the Dev Environments in a project.
  final List<DevEnvironmentSummary> items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListDevEnvironmentsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListDevEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListDevEnvironmentsResponse(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => DevEnvironmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEventLogsResponse {
  /// Information about each event retrieved in the list.
  final List<EventLogEntry> items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListEventLogsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListEventLogsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventLogsResponse(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => EventLogEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListProjectsResponse {
  /// Information about the projects.
  final List<ProjectSummary>? items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListProjectsResponse({
    this.items,
    this.nextToken,
  });

  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Information about a source repository returned in a list of source
/// repositories.
class ListSourceRepositoriesItem {
  /// The time the source repository was created, in coordinated universal time
  /// (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime createdTime;

  /// The system-generated unique ID of the source repository.
  final String id;

  /// The time the source repository was last updated, in coordinated universal
  /// time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime lastUpdatedTime;

  /// The name of the source repository.
  final String name;

  /// The description of the repository, if any.
  final String? description;

  ListSourceRepositoriesItem({
    required this.createdTime,
    required this.id,
    required this.lastUpdatedTime,
    required this.name,
    this.description,
  });

  factory ListSourceRepositoriesItem.fromJson(Map<String, dynamic> json) {
    return ListSourceRepositoriesItem(
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      id: json['id'] as String,
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final id = this.id;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final description = this.description;
    return {
      'createdTime': iso8601ToJson(createdTime),
      'id': id,
      'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

class ListSourceRepositoriesResponse {
  /// Information about the source repositories.
  final List<ListSourceRepositoriesItem>? items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListSourceRepositoriesResponse({
    this.items,
    this.nextToken,
  });

  factory ListSourceRepositoriesResponse.fromJson(Map<String, dynamic> json) {
    return ListSourceRepositoriesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ListSourceRepositoriesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Information about a branch of a source repository returned in a list of
/// branches.
class ListSourceRepositoryBranchesItem {
  /// The commit ID of the tip of the branch at the time of the request, also
  /// known as the head commit.
  final String? headCommitId;

  /// The time the branch was last updated, in coordinated universal time (UTC)
  /// timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime? lastUpdatedTime;

  /// The name of the branch.
  final String? name;

  /// The Git reference name of the branch.
  final String? ref;

  ListSourceRepositoryBranchesItem({
    this.headCommitId,
    this.lastUpdatedTime,
    this.name,
    this.ref,
  });

  factory ListSourceRepositoryBranchesItem.fromJson(Map<String, dynamic> json) {
    return ListSourceRepositoryBranchesItem(
      headCommitId: json['headCommitId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      name: json['name'] as String?,
      ref: json['ref'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final headCommitId = this.headCommitId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final ref = this.ref;
    return {
      if (headCommitId != null) 'headCommitId': headCommitId,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      if (name != null) 'name': name,
      if (ref != null) 'ref': ref,
    };
  }
}

class ListSourceRepositoryBranchesResponse {
  /// Information about the source branches.
  final List<ListSourceRepositoryBranchesItem> items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListSourceRepositoryBranchesResponse({
    required this.items,
    this.nextToken,
  });

  factory ListSourceRepositoryBranchesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSourceRepositoryBranchesResponse(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => ListSourceRepositoryBranchesItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSpacesResponse {
  /// Information about the spaces.
  final List<SpaceSummary>? items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListSpacesResponse({
    this.items,
    this.nextToken,
  });

  factory ListSpacesResponse.fromJson(Map<String, dynamic> json) {
    return ListSpacesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => SpaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWorkflowRunsResponse {
  /// Information about the runs of a workflow.
  final List<WorkflowRunSummary>? items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListWorkflowRunsResponse({
    this.items,
    this.nextToken,
  });

  factory ListWorkflowRunsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowRunsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowRunSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWorkflowsResponse {
  /// Information about the workflows in a project.
  final List<WorkflowSummary>? items;

  /// A token returned from a call to this API to indicate the next batch of
  /// results to return, if any.
  final String? nextToken;

  ListWorkflowsResponse({
    this.items,
    this.nextToken,
  });

  factory ListWorkflowsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum OperationType {
  readonly,
  mutation,
}

extension OperationTypeValueExtension on OperationType {
  String toValue() {
    switch (this) {
      case OperationType.readonly:
        return 'READONLY';
      case OperationType.mutation:
        return 'MUTATION';
    }
  }
}

extension OperationTypeFromString on String {
  OperationType toOperationType() {
    switch (this) {
      case 'READONLY':
        return OperationType.readonly;
      case 'MUTATION':
        return OperationType.mutation;
    }
    throw Exception('$this is not known in enum OperationType');
  }
}

/// Information about the persistent storage for a Dev Environment.
class PersistentStorage {
  /// The size of the persistent storage in gigabytes (specifically GiB).
  /// <note>
  /// Valid values for storage are based on memory sizes in 16GB increments. Valid
  /// values are 16, 32, and 64.
  /// </note>
  final int sizeInGiB;

  PersistentStorage({
    required this.sizeInGiB,
  });

  factory PersistentStorage.fromJson(Map<String, dynamic> json) {
    return PersistentStorage(
      sizeInGiB: json['sizeInGiB'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final sizeInGiB = this.sizeInGiB;
    return {
      'sizeInGiB': sizeInGiB,
    };
  }
}

/// Information about the configuration of persistent storage for a Dev
/// Environment.
class PersistentStorageConfiguration {
  /// The size of the persistent storage in gigabytes (specifically GiB).
  /// <note>
  /// Valid values for storage are based on memory sizes in 16GB increments. Valid
  /// values are 16, 32, and 64.
  /// </note>
  final int sizeInGiB;

  PersistentStorageConfiguration({
    required this.sizeInGiB,
  });

  Map<String, dynamic> toJson() {
    final sizeInGiB = this.sizeInGiB;
    return {
      'sizeInGiB': sizeInGiB,
    };
  }
}

/// Information about a project in a space.
class ProjectInformation {
  /// The name of the project in the space.
  final String? name;

  /// The system-generated unique ID of the project.
  final String? projectId;

  ProjectInformation({
    this.name,
    this.projectId,
  });

  factory ProjectInformation.fromJson(Map<String, dynamic> json) {
    return ProjectInformation(
      name: json['name'] as String?,
      projectId: json['projectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final projectId = this.projectId;
    return {
      if (name != null) 'name': name,
      if (projectId != null) 'projectId': projectId,
    };
  }
}

/// nformation about the filter used to narrow the results returned in a list of
/// projects.
class ProjectListFilter {
  /// A key that can be used to sort results.
  final FilterKey key;

  /// The values of the key.
  final List<String> values;

  /// The operator used to compare the fields.
  final ComparisonOperator? comparisonOperator;

  ProjectListFilter({
    required this.key,
    required this.values,
    this.comparisonOperator,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    final comparisonOperator = this.comparisonOperator;
    return {
      'key': key.toValue(),
      'values': values,
      if (comparisonOperator != null)
        'comparisonOperator': comparisonOperator.toValue(),
    };
  }
}

/// Information about a project.
class ProjectSummary {
  /// The name of the project in the space.
  final String name;

  /// The description of the project.
  final String? description;

  /// The friendly name displayed to users of the project in Amazon CodeCatalyst.
  final String? displayName;

  ProjectSummary({
    required this.name,
    this.description,
    this.displayName,
  });

  factory ProjectSummary.fromJson(Map<String, dynamic> json) {
    return ProjectSummary(
      name: json['name'] as String,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    final displayName = this.displayName;
    return {
      'name': name,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

/// Information about a repository that will be cloned to a Dev Environment.
class RepositoryInput {
  /// The name of the source repository.
  final String repositoryName;

  /// The name of the branch in a source repository.
  final String? branchName;

  RepositoryInput({
    required this.repositoryName,
    this.branchName,
  });

  Map<String, dynamic> toJson() {
    final repositoryName = this.repositoryName;
    final branchName = this.branchName;
    return {
      'repositoryName': repositoryName,
      if (branchName != null) 'branchName': branchName,
    };
  }
}

/// Information about an space.
class SpaceSummary {
  /// The name of the space.
  final String name;

  /// The Amazon Web Services Region where the space exists.
  final String regionName;

  /// The description of the space.
  final String? description;

  /// The friendly name of the space displayed to users.
  final String? displayName;

  SpaceSummary({
    required this.name,
    required this.regionName,
    this.description,
    this.displayName,
  });

  factory SpaceSummary.fromJson(Map<String, dynamic> json) {
    return SpaceSummary(
      name: json['name'] as String,
      regionName: json['regionName'] as String,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final regionName = this.regionName;
    final description = this.description;
    final displayName = this.displayName;
    return {
      'name': name,
      'regionName': regionName,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

class StartDevEnvironmentResponse {
  /// The system-generated unique ID of the Dev Environment.
  final String id;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The status of the Dev Environment.
  final DevEnvironmentStatus status;

  StartDevEnvironmentResponse({
    required this.id,
    required this.projectName,
    required this.spaceName,
    required this.status,
  });

  factory StartDevEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return StartDevEnvironmentResponse(
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      status: (json['status'] as String).toDevEnvironmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final status = this.status;
    return {
      'id': id,
      'projectName': projectName,
      'spaceName': spaceName,
      'status': status.toValue(),
    };
  }
}

class StartDevEnvironmentSessionResponse {
  final DevEnvironmentAccessDetails accessDetails;

  /// The system-generated unique ID of the Dev Environment.
  final String id;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The system-generated unique ID of the Dev Environment session.
  final String? sessionId;

  StartDevEnvironmentSessionResponse({
    required this.accessDetails,
    required this.id,
    required this.projectName,
    required this.spaceName,
    this.sessionId,
  });

  factory StartDevEnvironmentSessionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDevEnvironmentSessionResponse(
      accessDetails: DevEnvironmentAccessDetails.fromJson(
          json['accessDetails'] as Map<String, dynamic>),
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      sessionId: json['sessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDetails = this.accessDetails;
    final id = this.id;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final sessionId = this.sessionId;
    return {
      'accessDetails': accessDetails,
      'id': id,
      'projectName': projectName,
      'spaceName': spaceName,
      if (sessionId != null) 'sessionId': sessionId,
    };
  }
}

class StartWorkflowRunResponse {
  /// The system-generated unique ID of the workflow run.
  final String id;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The system-generated unique ID of the workflow.
  final String workflowId;

  StartWorkflowRunResponse({
    required this.id,
    required this.projectName,
    required this.spaceName,
    required this.workflowId,
  });

  factory StartWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return StartWorkflowRunResponse(
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      workflowId: json['workflowId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final workflowId = this.workflowId;
    return {
      'id': id,
      'projectName': projectName,
      'spaceName': spaceName,
      'workflowId': workflowId,
    };
  }
}

class StopDevEnvironmentResponse {
  /// The system-generated unique ID of the Dev Environment.
  final String id;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The status of the Dev Environment.
  final DevEnvironmentStatus status;

  StopDevEnvironmentResponse({
    required this.id,
    required this.projectName,
    required this.spaceName,
    required this.status,
  });

  factory StopDevEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return StopDevEnvironmentResponse(
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      status: (json['status'] as String).toDevEnvironmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final status = this.status;
    return {
      'id': id,
      'projectName': projectName,
      'spaceName': spaceName,
      'status': status.toValue(),
    };
  }
}

class StopDevEnvironmentSessionResponse {
  /// The system-generated unique ID of the Dev Environment.
  final String id;

  /// The name of the project in the space.
  final String projectName;

  /// The system-generated unique ID of the Dev Environment session.
  final String sessionId;

  /// The name of the space.
  final String spaceName;

  StopDevEnvironmentSessionResponse({
    required this.id,
    required this.projectName,
    required this.sessionId,
    required this.spaceName,
  });

  factory StopDevEnvironmentSessionResponse.fromJson(
      Map<String, dynamic> json) {
    return StopDevEnvironmentSessionResponse(
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      sessionId: json['sessionId'] as String,
      spaceName: json['spaceName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final projectName = this.projectName;
    final sessionId = this.sessionId;
    final spaceName = this.spaceName;
    return {
      'id': id,
      'projectName': projectName,
      'sessionId': sessionId,
      'spaceName': spaceName,
    };
  }
}

class UpdateDevEnvironmentResponse {
  /// The system-generated unique ID of the Dev Environment.
  final String id;

  /// The name of the project in the space.
  final String projectName;

  /// The name of the space.
  final String spaceName;

  /// The user-specified alias for the Dev Environment.
  final String? alias;

  /// A user-specified idempotency token. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries return the result from the
  /// original successful request and have no additional effect.
  final String? clientToken;

  /// Information about the integrated development environment (IDE) configured
  /// for the Dev Environment.
  final List<IdeConfiguration>? ides;

  /// The amount of time the Dev Environment will run without any activity
  /// detected before stopping, in minutes.
  final int? inactivityTimeoutMinutes;

  /// The Amazon EC2 instace type to use for the Dev Environment.
  final InstanceType? instanceType;

  UpdateDevEnvironmentResponse({
    required this.id,
    required this.projectName,
    required this.spaceName,
    this.alias,
    this.clientToken,
    this.ides,
    this.inactivityTimeoutMinutes,
    this.instanceType,
  });

  factory UpdateDevEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDevEnvironmentResponse(
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      spaceName: json['spaceName'] as String,
      alias: json['alias'] as String?,
      clientToken: json['clientToken'] as String?,
      ides: (json['ides'] as List?)
          ?.whereNotNull()
          .map((e) => IdeConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      inactivityTimeoutMinutes: json['inactivityTimeoutMinutes'] as int?,
      instanceType: (json['instanceType'] as String?)?.toInstanceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final projectName = this.projectName;
    final spaceName = this.spaceName;
    final alias = this.alias;
    final clientToken = this.clientToken;
    final ides = this.ides;
    final inactivityTimeoutMinutes = this.inactivityTimeoutMinutes;
    final instanceType = this.instanceType;
    return {
      'id': id,
      'projectName': projectName,
      'spaceName': spaceName,
      if (alias != null) 'alias': alias,
      if (clientToken != null) 'clientToken': clientToken,
      if (ides != null) 'ides': ides,
      if (inactivityTimeoutMinutes != null)
        'inactivityTimeoutMinutes': inactivityTimeoutMinutes,
      if (instanceType != null) 'instanceType': instanceType.toValue(),
    };
  }
}

class UpdateProjectResponse {
  /// The description of the project.
  final String? description;

  /// The friendly name of the project displayed to users in Amazon CodeCatalyst.
  final String? displayName;

  /// The name of the project.
  final String? name;

  /// The name of the space.
  final String? spaceName;

  UpdateProjectResponse({
    this.description,
    this.displayName,
    this.name,
    this.spaceName,
  });

  factory UpdateProjectResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProjectResponse(
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      name: json['name'] as String?,
      spaceName: json['spaceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final name = this.name;
    final spaceName = this.spaceName;
    return {
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (name != null) 'name': name,
      if (spaceName != null) 'spaceName': spaceName,
    };
  }
}

class UpdateSpaceResponse {
  /// The description of the space.
  final String? description;

  /// The friendly name of the space displayed to users in Amazon CodeCatalyst.
  final String? displayName;

  /// The name of the space.
  final String? name;

  UpdateSpaceResponse({
    this.description,
    this.displayName,
    this.name,
  });

  factory UpdateSpaceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSpaceResponse(
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final name = this.name;
    return {
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (name != null) 'name': name,
    };
  }
}

/// Information about a user whose activity is recorded in an event for a space.
class UserIdentity {
  /// The ID of the Amazon CodeCatalyst service principal.
  final String principalId;

  /// The role assigned to the user in a Amazon CodeCatalyst space or project when
  /// the event occurred.
  final UserType userType;

  /// The Amazon Web Services account number of the user in Amazon Web Services,
  /// if any.
  final String? awsAccountId;

  /// The display name of the user in Amazon CodeCatalyst.
  final String? userName;

  UserIdentity({
    required this.principalId,
    required this.userType,
    this.awsAccountId,
    this.userName,
  });

  factory UserIdentity.fromJson(Map<String, dynamic> json) {
    return UserIdentity(
      principalId: json['principalId'] as String,
      userType: (json['userType'] as String).toUserType(),
      awsAccountId: json['awsAccountId'] as String?,
      userName: json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final principalId = this.principalId;
    final userType = this.userType;
    final awsAccountId = this.awsAccountId;
    final userName = this.userName;
    return {
      'principalId': principalId,
      'userType': userType.toValue(),
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (userName != null) 'userName': userName,
    };
  }
}

enum UserType {
  user,
  awsAccount,
  unknown,
}

extension UserTypeValueExtension on UserType {
  String toValue() {
    switch (this) {
      case UserType.user:
        return 'USER';
      case UserType.awsAccount:
        return 'AWS_ACCOUNT';
      case UserType.unknown:
        return 'UNKNOWN';
    }
  }
}

extension UserTypeFromString on String {
  UserType toUserType() {
    switch (this) {
      case 'USER':
        return UserType.user;
      case 'AWS_ACCOUNT':
        return UserType.awsAccount;
      case 'UNKNOWN':
        return UserType.unknown;
    }
    throw Exception('$this is not known in enum UserType');
  }
}

class VerifySessionResponse {
  /// The system-generated unique ID of the user in Amazon CodeCatalyst.
  final String? identity;

  VerifySessionResponse({
    this.identity,
  });

  factory VerifySessionResponse.fromJson(Map<String, dynamic> json) {
    return VerifySessionResponse(
      identity: json['identity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identity = this.identity;
    return {
      if (identity != null) 'identity': identity,
    };
  }
}

/// Information about a workflow definition file.
class WorkflowDefinition {
  /// The path to the workflow definition file stored in the source repository for
  /// the project, including the file name.
  final String path;

  WorkflowDefinition({
    required this.path,
  });

  factory WorkflowDefinition.fromJson(Map<String, dynamic> json) {
    return WorkflowDefinition(
      path: json['path'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    return {
      'path': path,
    };
  }
}

/// Information about a workflow definition.
class WorkflowDefinitionSummary {
  /// The path to the workflow definition file stored in the source repository for
  /// the project, including the file name.
  final String path;

  WorkflowDefinitionSummary({
    required this.path,
  });

  factory WorkflowDefinitionSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowDefinitionSummary(
      path: json['path'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    return {
      'path': path,
    };
  }
}

enum WorkflowRunMode {
  queued,
  parallel,
  superseded,
}

extension WorkflowRunModeValueExtension on WorkflowRunMode {
  String toValue() {
    switch (this) {
      case WorkflowRunMode.queued:
        return 'QUEUED';
      case WorkflowRunMode.parallel:
        return 'PARALLEL';
      case WorkflowRunMode.superseded:
        return 'SUPERSEDED';
    }
  }
}

extension WorkflowRunModeFromString on String {
  WorkflowRunMode toWorkflowRunMode() {
    switch (this) {
      case 'QUEUED':
        return WorkflowRunMode.queued;
      case 'PARALLEL':
        return WorkflowRunMode.parallel;
      case 'SUPERSEDED':
        return WorkflowRunMode.superseded;
    }
    throw Exception('$this is not known in enum WorkflowRunMode');
  }
}

/// Information used to sort workflow runs in the returned list.
class WorkflowRunSortCriteria {
  WorkflowRunSortCriteria();

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum WorkflowRunStatus {
  succeeded,
  failed,
  stopped,
  superseded,
  cancelled,
  notRun,
  validating,
  provisioning,
  inProgress,
  stopping,
  abandoned,
}

extension WorkflowRunStatusValueExtension on WorkflowRunStatus {
  String toValue() {
    switch (this) {
      case WorkflowRunStatus.succeeded:
        return 'SUCCEEDED';
      case WorkflowRunStatus.failed:
        return 'FAILED';
      case WorkflowRunStatus.stopped:
        return 'STOPPED';
      case WorkflowRunStatus.superseded:
        return 'SUPERSEDED';
      case WorkflowRunStatus.cancelled:
        return 'CANCELLED';
      case WorkflowRunStatus.notRun:
        return 'NOT_RUN';
      case WorkflowRunStatus.validating:
        return 'VALIDATING';
      case WorkflowRunStatus.provisioning:
        return 'PROVISIONING';
      case WorkflowRunStatus.inProgress:
        return 'IN_PROGRESS';
      case WorkflowRunStatus.stopping:
        return 'STOPPING';
      case WorkflowRunStatus.abandoned:
        return 'ABANDONED';
    }
  }
}

extension WorkflowRunStatusFromString on String {
  WorkflowRunStatus toWorkflowRunStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return WorkflowRunStatus.succeeded;
      case 'FAILED':
        return WorkflowRunStatus.failed;
      case 'STOPPED':
        return WorkflowRunStatus.stopped;
      case 'SUPERSEDED':
        return WorkflowRunStatus.superseded;
      case 'CANCELLED':
        return WorkflowRunStatus.cancelled;
      case 'NOT_RUN':
        return WorkflowRunStatus.notRun;
      case 'VALIDATING':
        return WorkflowRunStatus.validating;
      case 'PROVISIONING':
        return WorkflowRunStatus.provisioning;
      case 'IN_PROGRESS':
        return WorkflowRunStatus.inProgress;
      case 'STOPPING':
        return WorkflowRunStatus.stopping;
      case 'ABANDONED':
        return WorkflowRunStatus.abandoned;
    }
    throw Exception('$this is not known in enum WorkflowRunStatus');
  }
}

/// Information about the status of a workflow run.
class WorkflowRunStatusReason {
  WorkflowRunStatusReason();

  factory WorkflowRunStatusReason.fromJson(Map<String, dynamic> _) {
    return WorkflowRunStatusReason();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a workflow run.
class WorkflowRunSummary {
  /// The system-generated unique ID of the workflow run.
  final String id;

  /// The date and time the workflow was last updated, in coordinated universal
  /// time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>
  final DateTime lastUpdatedTime;

  /// The date and time the workflow run began, in coordinated universal time
  /// (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>.
  final DateTime startTime;

  /// The status of the workflow run.
  final WorkflowRunStatus status;

  /// The system-generated unique ID of the workflow.
  final String workflowId;

  /// The name of the workflow.
  final String workflowName;

  /// The date and time the workflow run ended, in coordinated universal time
  /// (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>
  final DateTime? endTime;

  /// The reasons for the workflow run status.
  final List<WorkflowRunStatusReason>? statusReasons;

  WorkflowRunSummary({
    required this.id,
    required this.lastUpdatedTime,
    required this.startTime,
    required this.status,
    required this.workflowId,
    required this.workflowName,
    this.endTime,
    this.statusReasons,
  });

  factory WorkflowRunSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowRunSummary(
      id: json['id'] as String,
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toWorkflowRunStatus(),
      workflowId: json['workflowId'] as String,
      workflowName: json['workflowName'] as String,
      endTime: timeStampFromJson(json['endTime']),
      statusReasons: (json['statusReasons'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WorkflowRunStatusReason.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final lastUpdatedTime = this.lastUpdatedTime;
    final startTime = this.startTime;
    final status = this.status;
    final workflowId = this.workflowId;
    final workflowName = this.workflowName;
    final endTime = this.endTime;
    final statusReasons = this.statusReasons;
    return {
      'id': id,
      'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'startTime': iso8601ToJson(startTime),
      'status': status.toValue(),
      'workflowId': workflowId,
      'workflowName': workflowName,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (statusReasons != null) 'statusReasons': statusReasons,
    };
  }
}

/// Information used to sort workflows in the returned list.
class WorkflowSortCriteria {
  WorkflowSortCriteria();

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum WorkflowStatus {
  invalid,
  active,
}

extension WorkflowStatusValueExtension on WorkflowStatus {
  String toValue() {
    switch (this) {
      case WorkflowStatus.invalid:
        return 'INVALID';
      case WorkflowStatus.active:
        return 'ACTIVE';
    }
  }
}

extension WorkflowStatusFromString on String {
  WorkflowStatus toWorkflowStatus() {
    switch (this) {
      case 'INVALID':
        return WorkflowStatus.invalid;
      case 'ACTIVE':
        return WorkflowStatus.active;
    }
    throw Exception('$this is not known in enum WorkflowStatus');
  }
}

/// Information about a workflow.
class WorkflowSummary {
  /// The date and time the workflow was created, in coordinated universal time
  /// (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>
  final DateTime createdTime;

  /// Information about the workflow definition file.
  final WorkflowDefinitionSummary definition;

  /// The system-generated unique ID of a workflow.
  final String id;

  /// The date and time the workflow was last updated, in coordinated universal
  /// time (UTC) timestamp format as specified in <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339#section-5.6">RFC 3339</a>
  final DateTime lastUpdatedTime;

  /// The name of the workflow.
  final String name;

  /// The run mode of the workflow.
  final WorkflowRunMode runMode;

  /// The name of the branch of the source repository where the workflow
  /// definition file is stored.
  final String sourceBranchName;

  /// The name of the source repository where the workflow definition file is
  /// stored.
  final String sourceRepositoryName;

  /// The status of the workflow.
  final WorkflowStatus status;

  WorkflowSummary({
    required this.createdTime,
    required this.definition,
    required this.id,
    required this.lastUpdatedTime,
    required this.name,
    required this.runMode,
    required this.sourceBranchName,
    required this.sourceRepositoryName,
    required this.status,
  });

  factory WorkflowSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowSummary(
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      definition: WorkflowDefinitionSummary.fromJson(
          json['definition'] as Map<String, dynamic>),
      id: json['id'] as String,
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      runMode: (json['runMode'] as String).toWorkflowRunMode(),
      sourceBranchName: json['sourceBranchName'] as String,
      sourceRepositoryName: json['sourceRepositoryName'] as String,
      status: (json['status'] as String).toWorkflowStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final definition = this.definition;
    final id = this.id;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final runMode = this.runMode;
    final sourceBranchName = this.sourceBranchName;
    final sourceRepositoryName = this.sourceRepositoryName;
    final status = this.status;
    return {
      'createdTime': iso8601ToJson(createdTime),
      'definition': definition,
      'id': id,
      'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'name': name,
      'runMode': runMode.toValue(),
      'sourceBranchName': sourceBranchName,
      'sourceRepositoryName': sourceRepositoryName,
      'status': status.toValue(),
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

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
