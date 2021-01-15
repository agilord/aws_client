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

part '2017-07-25.g.dart';

/// Amplify enables developers to develop and deploy cloud-powered mobile and
/// web apps. The Amplify Console provides a continuous delivery and hosting
/// service for web applications. For more information, see the <a
/// href="https://docs.aws.amazon.com/amplify/latest/userguide/welcome.html">Amplify
/// Console User Guide</a>. The Amplify Framework is a comprehensive set of
/// SDKs, libraries, tools, and documentation for client app development. For
/// more information, see the <a href="https://docs.amplify.aws/">Amplify
/// Framework.</a>
class Amplify {
  final _s.RestJsonProtocol _protocol;
  Amplify({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'amplify',
            signingName: 'amplify',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name for an Amplify app.
  ///
  /// Parameter [accessToken] :
  /// The personal access token for a third-party source control system for an
  /// Amplify app. The personal access token is used to create a webhook and a
  /// read-only deploy key. The token is not stored.
  ///
  /// Parameter [autoBranchCreationConfig] :
  /// The automated branch creation configuration for an Amplify app.
  ///
  /// Parameter [autoBranchCreationPatterns] :
  /// The automated branch creation glob patterns for an Amplify app.
  ///
  /// Parameter [basicAuthCredentials] :
  /// The credentials for basic authorization for an Amplify app.
  ///
  /// Parameter [buildSpec] :
  /// The build specification (build spec) for an Amplify app.
  ///
  /// Parameter [customHeaders] :
  /// The custom HTTP headers for an Amplify app.
  ///
  /// Parameter [customRules] :
  /// The custom rewrite and redirect rules for an Amplify app.
  ///
  /// Parameter [description] :
  /// The description for an Amplify app.
  ///
  /// Parameter [enableAutoBranchCreation] :
  /// Enables automated branch creation for an Amplify app.
  ///
  /// Parameter [enableBasicAuth] :
  /// Enables basic authorization for an Amplify app. This will apply to all
  /// branches that are part of this app.
  ///
  /// Parameter [enableBranchAutoBuild] :
  /// Enables the auto building of branches for an Amplify app.
  ///
  /// Parameter [enableBranchAutoDeletion] :
  /// Automatically disconnects a branch in the Amplify Console when you delete
  /// a branch from your Git repository.
  ///
  /// Parameter [environmentVariables] :
  /// The environment variables map for an Amplify app.
  ///
  /// Parameter [iamServiceRoleArn] :
  /// The AWS Identity and Access Management (IAM) service role for an Amplify
  /// app.
  ///
  /// Parameter [oauthToken] :
  /// The OAuth token for a third-party source control system for an Amplify
  /// app. The OAuth token is used to create a webhook and a read-only deploy
  /// key. The OAuth token is not stored.
  ///
  /// Parameter [platform] :
  /// The platform or framework for an Amplify app.
  ///
  /// Parameter [repository] :
  /// The repository for an Amplify app.
  ///
  /// Parameter [tags] :
  /// The tag for an Amplify app.
  Future<CreateAppResult> createApp({
    @_s.required String name,
    String accessToken,
    AutoBranchCreationConfig autoBranchCreationConfig,
    List<String> autoBranchCreationPatterns,
    String basicAuthCredentials,
    String buildSpec,
    String customHeaders,
    List<CustomRule> customRules,
    String description,
    bool enableAutoBranchCreation,
    bool enableBasicAuth,
    bool enableBranchAutoBuild,
    bool enableBranchAutoDeletion,
    Map<String, String> environmentVariables,
    String iamServiceRoleArn,
    String oauthToken,
    Platform platform,
    String repository,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'accessToken',
      accessToken,
      1,
      255,
    );
    _s.validateStringLength(
      'basicAuthCredentials',
      basicAuthCredentials,
      0,
      2000,
    );
    _s.validateStringLength(
      'buildSpec',
      buildSpec,
      1,
      25000,
    );
    _s.validateStringLength(
      'customHeaders',
      customHeaders,
      1,
      25000,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'iamServiceRoleArn',
      iamServiceRoleArn,
      1,
      1000,
    );
    _s.validateStringLength(
      'oauthToken',
      oauthToken,
      0,
      1000,
    );
    _s.validateStringLength(
      'repository',
      repository,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      'name': name,
      if (accessToken != null) 'accessToken': accessToken,
      if (autoBranchCreationConfig != null)
        'autoBranchCreationConfig': autoBranchCreationConfig,
      if (autoBranchCreationPatterns != null)
        'autoBranchCreationPatterns': autoBranchCreationPatterns,
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (customHeaders != null) 'customHeaders': customHeaders,
      if (customRules != null) 'customRules': customRules,
      if (description != null) 'description': description,
      if (enableAutoBranchCreation != null)
        'enableAutoBranchCreation': enableAutoBranchCreation,
      if (enableBasicAuth != null) 'enableBasicAuth': enableBasicAuth,
      if (enableBranchAutoBuild != null)
        'enableBranchAutoBuild': enableBranchAutoBuild,
      if (enableBranchAutoDeletion != null)
        'enableBranchAutoDeletion': enableBranchAutoDeletion,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (iamServiceRoleArn != null) 'iamServiceRoleArn': iamServiceRoleArn,
      if (oauthToken != null) 'oauthToken': oauthToken,
      if (platform != null) 'platform': platform.toValue(),
      if (repository != null) 'repository': repository,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppResult.fromJson(response);
  }

  /// Creates a new backend environment for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name for the backend environment.
  ///
  /// Parameter [deploymentArtifacts] :
  /// The name of deployment artifacts.
  ///
  /// Parameter [stackName] :
  /// The AWS CloudFormation stack name of a backend environment.
  Future<CreateBackendEnvironmentResult> createBackendEnvironment({
    @_s.required String appId,
    @_s.required String environmentName,
    String deploymentArtifacts,
    String stackName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'deploymentArtifacts',
      deploymentArtifacts,
      1,
      1000,
    );
    _s.validateStringLength(
      'stackName',
      stackName,
      1,
      255,
    );
    final $payload = <String, dynamic>{
      'environmentName': environmentName,
      if (deploymentArtifacts != null)
        'deploymentArtifacts': deploymentArtifacts,
      if (stackName != null) 'stackName': stackName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps/${Uri.encodeComponent(appId)}/backendenvironments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackendEnvironmentResult.fromJson(response);
  }

  /// Creates a new branch for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for the branch.
  ///
  /// Parameter [backendEnvironmentArn] :
  /// The Amazon Resource Name (ARN) for a backend environment that is part of
  /// an Amplify app.
  ///
  /// Parameter [basicAuthCredentials] :
  /// The basic authorization credentials for the branch.
  ///
  /// Parameter [buildSpec] :
  /// The build specification (build spec) for the branch.
  ///
  /// Parameter [description] :
  /// The description for the branch.
  ///
  /// Parameter [displayName] :
  /// The display name for a branch. This is used as the default domain prefix.
  ///
  /// Parameter [enableAutoBuild] :
  /// Enables auto building for the branch.
  ///
  /// Parameter [enableBasicAuth] :
  /// Enables basic authorization for the branch.
  ///
  /// Parameter [enableNotification] :
  /// Enables notifications for the branch.
  ///
  /// Parameter [enablePerformanceMode] :
  /// Enables performance mode for the branch.
  ///
  /// Performance mode optimizes for faster hosting performance by keeping
  /// content cached at the edge for a longer interval. When performance mode is
  /// enabled, hosting configuration or code changes can take up to 10 minutes
  /// to roll out.
  ///
  /// Parameter [enablePullRequestPreview] :
  /// Enables pull request previews for this branch.
  ///
  /// Parameter [environmentVariables] :
  /// The environment variables for the branch.
  ///
  /// Parameter [framework] :
  /// The framework for the branch.
  ///
  /// Parameter [pullRequestEnvironmentName] :
  /// The Amplify environment name for the pull request.
  ///
  /// Parameter [stage] :
  /// Describes the current stage for the branch.
  ///
  /// Parameter [tags] :
  /// The tag for the branch.
  ///
  /// Parameter [ttl] :
  /// The content Time To Live (TTL) for the website in seconds.
  Future<CreateBranchResult> createBranch({
    @_s.required String appId,
    @_s.required String branchName,
    String backendEnvironmentArn,
    String basicAuthCredentials,
    String buildSpec,
    String description,
    String displayName,
    bool enableAutoBuild,
    bool enableBasicAuth,
    bool enableNotification,
    bool enablePerformanceMode,
    bool enablePullRequestPreview,
    Map<String, String> environmentVariables,
    String framework,
    String pullRequestEnvironmentName,
    Stage stage,
    Map<String, String> tags,
    String ttl,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'backendEnvironmentArn',
      backendEnvironmentArn,
      1,
      1000,
    );
    _s.validateStringLength(
      'basicAuthCredentials',
      basicAuthCredentials,
      0,
      2000,
    );
    _s.validateStringLength(
      'buildSpec',
      buildSpec,
      1,
      25000,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      255,
    );
    _s.validateStringLength(
      'framework',
      framework,
      0,
      255,
    );
    _s.validateStringLength(
      'pullRequestEnvironmentName',
      pullRequestEnvironmentName,
      0,
      20,
    );
    final $payload = <String, dynamic>{
      'branchName': branchName,
      if (backendEnvironmentArn != null)
        'backendEnvironmentArn': backendEnvironmentArn,
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (enableAutoBuild != null) 'enableAutoBuild': enableAutoBuild,
      if (enableBasicAuth != null) 'enableBasicAuth': enableBasicAuth,
      if (enableNotification != null) 'enableNotification': enableNotification,
      if (enablePerformanceMode != null)
        'enablePerformanceMode': enablePerformanceMode,
      if (enablePullRequestPreview != null)
        'enablePullRequestPreview': enablePullRequestPreview,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (framework != null) 'framework': framework,
      if (pullRequestEnvironmentName != null)
        'pullRequestEnvironmentName': pullRequestEnvironmentName,
      if (stage != null) 'stage': stage.toValue(),
      if (tags != null) 'tags': tags,
      if (ttl != null) 'ttl': ttl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps/${Uri.encodeComponent(appId)}/branches',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBranchResult.fromJson(response);
  }

  /// Creates a deployment for a manually deployed Amplify app. Manually
  /// deployed apps are not connected to a repository.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for the branch, for the job.
  ///
  /// Parameter [fileMap] :
  /// An optional file map that contains the file name as the key and the file
  /// content md5 hash as the value. If this argument is provided, the service
  /// will generate a unique upload URL per file. Otherwise, the service will
  /// only generate a single upload URL for the zipped files.
  Future<CreateDeploymentResult> createDeployment({
    @_s.required String appId,
    @_s.required String branchName,
    Map<String, String> fileMap,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (fileMap != null) 'fileMap': fileMap,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}/deployments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeploymentResult.fromJson(response);
  }

  /// Creates a new domain association for an Amplify app. This action
  /// associates a custom domain with the Amplify app
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [domainName] :
  /// The domain name for the domain association.
  ///
  /// Parameter [subDomainSettings] :
  /// The setting for the subdomain.
  ///
  /// Parameter [autoSubDomainCreationPatterns] :
  /// Sets the branch patterns for automatic subdomain creation.
  ///
  /// Parameter [autoSubDomainIAMRole] :
  /// The required AWS Identity and Access Management (IAM) service role for the
  /// Amazon Resource Name (ARN) for automatically creating subdomains.
  ///
  /// Parameter [enableAutoSubDomain] :
  /// Enables the automated creation of subdomains for branches.
  Future<CreateDomainAssociationResult> createDomainAssociation({
    @_s.required String appId,
    @_s.required String domainName,
    @_s.required List<SubDomainSetting> subDomainSettings,
    List<String> autoSubDomainCreationPatterns,
    String autoSubDomainIAMRole,
    bool enableAutoSubDomain,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(subDomainSettings, 'subDomainSettings');
    _s.validateStringLength(
      'autoSubDomainIAMRole',
      autoSubDomainIAMRole,
      0,
      1000,
    );
    _s.validateStringPattern(
      'autoSubDomainIAMRole',
      autoSubDomainIAMRole,
      r'''^$|^arn:aws:iam::\d{12}:role.+''',
    );
    final $payload = <String, dynamic>{
      'domainName': domainName,
      'subDomainSettings': subDomainSettings,
      if (autoSubDomainCreationPatterns != null)
        'autoSubDomainCreationPatterns': autoSubDomainCreationPatterns,
      if (autoSubDomainIAMRole != null)
        'autoSubDomainIAMRole': autoSubDomainIAMRole,
      if (enableAutoSubDomain != null)
        'enableAutoSubDomain': enableAutoSubDomain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps/${Uri.encodeComponent(appId)}/domains',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainAssociationResult.fromJson(response);
  }

  /// Creates a new webhook on an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for a branch that is part of an Amplify app.
  ///
  /// Parameter [description] :
  /// The description for a webhook.
  Future<CreateWebhookResult> createWebhook({
    @_s.required String appId,
    @_s.required String branchName,
    String description,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      'branchName': branchName,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps/${Uri.encodeComponent(appId)}/webhooks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWebhookResult.fromJson(response);
  }

  /// Deletes an existing Amplify app specified by an app ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  Future<DeleteAppResult> deleteApp({
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/apps/${Uri.encodeComponent(appId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAppResult.fromJson(response);
  }

  /// Deletes a backend environment for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID of an Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of a backend environment of an Amplify app.
  Future<DeleteBackendEnvironmentResult> deleteBackendEnvironment({
    @_s.required String appId,
    @_s.required String environmentName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/backendenvironments/${Uri.encodeComponent(environmentName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBackendEnvironmentResult.fromJson(response);
  }

  /// Deletes a branch for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for the branch.
  Future<DeleteBranchResult> deleteBranch({
    @_s.required String appId,
    @_s.required String branchName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBranchResult.fromJson(response);
  }

  /// Deletes a domain association for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// The unique id for an Amplify app.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  Future<DeleteDomainAssociationResult> deleteDomainAssociation({
    @_s.required String appId,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/domains/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainAssociationResult.fromJson(response);
  }

  /// Deletes a job for a branch of an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for the branch, for the job.
  ///
  /// Parameter [jobId] :
  /// The unique ID for the job.
  Future<DeleteJobResult> deleteJob({
    @_s.required String appId,
    @_s.required String branchName,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      0,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteJobResult.fromJson(response);
  }

  /// Deletes a webhook.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [webhookId] :
  /// The unique ID for a webhook.
  Future<DeleteWebhookResult> deleteWebhook({
    @_s.required String webhookId,
  }) async {
    ArgumentError.checkNotNull(webhookId, 'webhookId');
    _s.validateStringLength(
      'webhookId',
      webhookId,
      0,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/webhooks/${Uri.encodeComponent(webhookId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWebhookResult.fromJson(response);
  }

  /// Returns the website access logs for a specific time range using a
  /// presigned URL.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [endTime] :
  /// The time at which the logs should end. The time range specified is
  /// inclusive of the end time.
  ///
  /// Parameter [startTime] :
  /// The time at which the logs should start. The time range specified is
  /// inclusive of the start time.
  Future<GenerateAccessLogsResult> generateAccessLogs({
    @_s.required String appId,
    @_s.required String domainName,
    DateTime endTime,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'domainName': domainName,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps/${Uri.encodeComponent(appId)}/accesslogs',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateAccessLogsResult.fromJson(response);
  }

  /// Returns an existing Amplify app by appID.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  Future<GetAppResult> getApp({
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apps/${Uri.encodeComponent(appId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppResult.fromJson(response);
  }

  /// Returns the artifact info that corresponds to an artifact id.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [artifactId] :
  /// The unique ID for an artifact.
  Future<GetArtifactUrlResult> getArtifactUrl({
    @_s.required String artifactId,
  }) async {
    ArgumentError.checkNotNull(artifactId, 'artifactId');
    _s.validateStringLength(
      'artifactId',
      artifactId,
      0,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/artifacts/${Uri.encodeComponent(artifactId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetArtifactUrlResult.fromJson(response);
  }

  /// Returns a backend environment for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// The unique id for an Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name for the backend environment.
  Future<GetBackendEnvironmentResult> getBackendEnvironment({
    @_s.required String appId,
    @_s.required String environmentName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/backendenvironments/${Uri.encodeComponent(environmentName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackendEnvironmentResult.fromJson(response);
  }

  /// Returns a branch for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for the branch.
  Future<GetBranchResult> getBranch({
    @_s.required String appId,
    @_s.required String branchName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBranchResult.fromJson(response);
  }

  /// Returns the domain information for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// The unique id for an Amplify app.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  Future<GetDomainAssociationResult> getDomainAssociation({
    @_s.required String appId,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/domains/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainAssociationResult.fromJson(response);
  }

  /// Returns a job for a branch of an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The branch name for the job.
  ///
  /// Parameter [jobId] :
  /// The unique ID for the job.
  Future<GetJobResult> getJob({
    @_s.required String appId,
    @_s.required String branchName,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      0,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobResult.fromJson(response);
  }

  /// Returns the webhook information that corresponds to a specified webhook
  /// ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [webhookId] :
  /// The unique ID for a webhook.
  Future<GetWebhookResult> getWebhook({
    @_s.required String webhookId,
  }) async {
    ArgumentError.checkNotNull(webhookId, 'webhookId');
    _s.validateStringLength(
      'webhookId',
      webhookId,
      0,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/webhooks/${Uri.encodeComponent(webhookId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWebhookResult.fromJson(response);
  }

  /// Returns a list of the existing Amplify apps.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. If non-null, the pagination token is returned in a
  /// result. Pass its value in another request to retrieve more entries.
  Future<ListAppsResult> listApps({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppsResult.fromJson(response);
  }

  /// Returns a list of artifacts for a specified app, branch, and job.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of a branch that is part of an Amplify app.
  ///
  /// Parameter [jobId] :
  /// The unique ID for a job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. Set to null to start listing artifacts from start. If
  /// a non-null pagination token is returned in a result, pass its value in
  /// here to list more artifacts.
  Future<ListArtifactsResult> listArtifacts({
    @_s.required String appId,
    @_s.required String branchName,
    @_s.required String jobId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      0,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}/jobs/${Uri.encodeComponent(jobId)}/artifacts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListArtifactsResult.fromJson(response);
  }

  /// Lists the backend environments for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. Set to null to start listing backend environments from
  /// the start. If a non-null pagination token is returned in a result, pass
  /// its value in here to list more backend environments.
  Future<ListBackendEnvironmentsResult> listBackendEnvironments({
    @_s.required String appId,
    String environmentName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'environmentName',
      environmentName,
      1,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2000,
    );
    final $query = <String, List<String>>{
      if (environmentName != null) 'environmentName': [environmentName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apps/${Uri.encodeComponent(appId)}/backendenvironments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackendEnvironmentsResult.fromJson(response);
  }

  /// Lists the branches of an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. Set to null to start listing branches from the start.
  /// If a non-null pagination token is returned in a result, pass its value in
  /// here to list more branches.
  Future<ListBranchesResult> listBranches({
    @_s.required String appId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apps/${Uri.encodeComponent(appId)}/branches',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBranchesResult.fromJson(response);
  }

  /// Returns the domain associations for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. Set to null to start listing apps from the start. If
  /// non-null, a pagination token is returned in a result. Pass its value in
  /// here to list more projects.
  Future<ListDomainAssociationsResult> listDomainAssociations({
    @_s.required String appId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apps/${Uri.encodeComponent(appId)}/domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainAssociationsResult.fromJson(response);
  }

  /// Lists the jobs for a branch of an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for a branch.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. Set to null to start listing steps from the start. If
  /// a non-null pagination token is returned in a result, pass its value in
  /// here to list more steps.
  Future<ListJobsResult> listJobs({
    @_s.required String appId,
    @_s.required String branchName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResult.fromJson(response);
  }

  /// Returns a list of tags for a specified Amazon Resource Name (ARN).
  ///
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to use to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:amplify:.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Returns a list of webhooks for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. Set to null to start listing webhooks from the start.
  /// If non-null,the pagination token is returned in a result. Pass its value
  /// in here to list more webhooks.
  Future<ListWebhooksResult> listWebhooks({
    @_s.required String appId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apps/${Uri.encodeComponent(appId)}/webhooks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWebhooksResult.fromJson(response);
  }

  /// Starts a deployment for a manually deployed app. Manually deployed apps
  /// are not connected to a repository.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for the branch, for the job.
  ///
  /// Parameter [jobId] :
  /// The job ID for this deployment, generated by the create deployment
  /// request.
  ///
  /// Parameter [sourceUrl] :
  /// The source URL for this deployment, used when calling start deployment
  /// without create deployment. The source URL can be any HTTP GET URL that is
  /// publicly accessible and downloads a single .zip file.
  Future<StartDeploymentResult> startDeployment({
    @_s.required String appId,
    @_s.required String branchName,
    String jobId,
    String sourceUrl,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'jobId',
      jobId,
      0,
      255,
    );
    _s.validateStringLength(
      'sourceUrl',
      sourceUrl,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      if (jobId != null) 'jobId': jobId,
      if (sourceUrl != null) 'sourceUrl': sourceUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}/deployments/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartDeploymentResult.fromJson(response);
  }

  /// Starts a new job for a branch of an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The branch name for the job.
  ///
  /// Parameter [jobType] :
  /// Describes the type for the job. The job type <code>RELEASE</code> starts a
  /// new job with the latest change from the specified branch. This value is
  /// available only for apps that are connected to a repository. The job type
  /// <code>RETRY</code> retries an existing job. If the job type value is
  /// <code>RETRY</code>, the <code>jobId</code> is also required.
  ///
  /// Parameter [commitId] :
  /// The commit ID from a third-party repository provider for the job.
  ///
  /// Parameter [commitMessage] :
  /// The commit message from a third-party repository provider for the job.
  ///
  /// Parameter [commitTime] :
  /// The commit date and time for the job.
  ///
  /// Parameter [jobId] :
  /// The unique ID for an existing job. This is required if the value of
  /// <code>jobType</code> is <code>RETRY</code>.
  ///
  /// Parameter [jobReason] :
  /// A descriptive reason for starting this job.
  Future<StartJobResult> startJob({
    @_s.required String appId,
    @_s.required String branchName,
    @_s.required JobType jobType,
    String commitId,
    String commitMessage,
    DateTime commitTime,
    String jobId,
    String jobReason,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobType, 'jobType');
    _s.validateStringLength(
      'commitId',
      commitId,
      0,
      255,
    );
    _s.validateStringLength(
      'commitMessage',
      commitMessage,
      0,
      10000,
    );
    _s.validateStringLength(
      'jobId',
      jobId,
      0,
      255,
    );
    _s.validateStringLength(
      'jobReason',
      jobReason,
      0,
      255,
    );
    final $payload = <String, dynamic>{
      'jobType': jobType?.toValue() ?? '',
      if (commitId != null) 'commitId': commitId,
      if (commitMessage != null) 'commitMessage': commitMessage,
      if (commitTime != null) 'commitTime': unixTimestampToJson(commitTime),
      if (jobId != null) 'jobId': jobId,
      if (jobReason != null) 'jobReason': jobReason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartJobResult.fromJson(response);
  }

  /// Stops a job that is in progress for a branch of an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for the branch, for the job.
  ///
  /// Parameter [jobId] :
  /// The unique id for the job.
  Future<StopJobResult> stopJob({
    @_s.required String appId,
    @_s.required String branchName,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      0,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}/jobs/${Uri.encodeComponent(jobId)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopJobResult.fromJson(response);
  }

  /// Tags the resource with a tag key and value.
  ///
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to use to tag a resource.
  ///
  /// Parameter [tags] :
  /// The tags used to tag the resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:amplify:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Untags a resource with a specified Amazon Resource Name (ARN).
  ///
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to use to untag a resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to use to untag a resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:amplify:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates an existing Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [accessToken] :
  /// The personal access token for a third-party source control system for an
  /// Amplify app. The token is used to create webhook and a read-only deploy
  /// key. The token is not stored.
  ///
  /// Parameter [autoBranchCreationConfig] :
  /// The automated branch creation configuration for an Amplify app.
  ///
  /// Parameter [autoBranchCreationPatterns] :
  /// Describes the automated branch creation glob patterns for an Amplify app.
  ///
  /// Parameter [basicAuthCredentials] :
  /// The basic authorization credentials for an Amplify app.
  ///
  /// Parameter [buildSpec] :
  /// The build specification (build spec) for an Amplify app.
  ///
  /// Parameter [customHeaders] :
  /// The custom HTTP headers for an Amplify app.
  ///
  /// Parameter [customRules] :
  /// The custom redirect and rewrite rules for an Amplify app.
  ///
  /// Parameter [description] :
  /// The description for an Amplify app.
  ///
  /// Parameter [enableAutoBranchCreation] :
  /// Enables automated branch creation for an Amplify app.
  ///
  /// Parameter [enableBasicAuth] :
  /// Enables basic authorization for an Amplify app.
  ///
  /// Parameter [enableBranchAutoBuild] :
  /// Enables branch auto-building for an Amplify app.
  ///
  /// Parameter [enableBranchAutoDeletion] :
  /// Automatically disconnects a branch in the Amplify Console when you delete
  /// a branch from your Git repository.
  ///
  /// Parameter [environmentVariables] :
  /// The environment variables for an Amplify app.
  ///
  /// Parameter [iamServiceRoleArn] :
  /// The AWS Identity and Access Management (IAM) service role for an Amplify
  /// app.
  ///
  /// Parameter [name] :
  /// The name for an Amplify app.
  ///
  /// Parameter [oauthToken] :
  /// The OAuth token for a third-party source control system for an Amplify
  /// app. The token is used to create a webhook and a read-only deploy key. The
  /// OAuth token is not stored.
  ///
  /// Parameter [platform] :
  /// The platform for an Amplify app.
  ///
  /// Parameter [repository] :
  /// The name of the repository for an Amplify app
  Future<UpdateAppResult> updateApp({
    @_s.required String appId,
    String accessToken,
    AutoBranchCreationConfig autoBranchCreationConfig,
    List<String> autoBranchCreationPatterns,
    String basicAuthCredentials,
    String buildSpec,
    String customHeaders,
    List<CustomRule> customRules,
    String description,
    bool enableAutoBranchCreation,
    bool enableBasicAuth,
    bool enableBranchAutoBuild,
    bool enableBranchAutoDeletion,
    Map<String, String> environmentVariables,
    String iamServiceRoleArn,
    String name,
    String oauthToken,
    Platform platform,
    String repository,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'accessToken',
      accessToken,
      1,
      255,
    );
    _s.validateStringLength(
      'basicAuthCredentials',
      basicAuthCredentials,
      0,
      2000,
    );
    _s.validateStringLength(
      'buildSpec',
      buildSpec,
      1,
      25000,
    );
    _s.validateStringLength(
      'customHeaders',
      customHeaders,
      1,
      25000,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'iamServiceRoleArn',
      iamServiceRoleArn,
      1,
      1000,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
    );
    _s.validateStringLength(
      'oauthToken',
      oauthToken,
      0,
      1000,
    );
    _s.validateStringLength(
      'repository',
      repository,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      if (accessToken != null) 'accessToken': accessToken,
      if (autoBranchCreationConfig != null)
        'autoBranchCreationConfig': autoBranchCreationConfig,
      if (autoBranchCreationPatterns != null)
        'autoBranchCreationPatterns': autoBranchCreationPatterns,
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (customHeaders != null) 'customHeaders': customHeaders,
      if (customRules != null) 'customRules': customRules,
      if (description != null) 'description': description,
      if (enableAutoBranchCreation != null)
        'enableAutoBranchCreation': enableAutoBranchCreation,
      if (enableBasicAuth != null) 'enableBasicAuth': enableBasicAuth,
      if (enableBranchAutoBuild != null)
        'enableBranchAutoBuild': enableBranchAutoBuild,
      if (enableBranchAutoDeletion != null)
        'enableBranchAutoDeletion': enableBranchAutoDeletion,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (iamServiceRoleArn != null) 'iamServiceRoleArn': iamServiceRoleArn,
      if (name != null) 'name': name,
      if (oauthToken != null) 'oauthToken': oauthToken,
      if (platform != null) 'platform': platform.toValue(),
      if (repository != null) 'repository': repository,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apps/${Uri.encodeComponent(appId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppResult.fromJson(response);
  }

  /// Updates a branch for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for the branch.
  ///
  /// Parameter [backendEnvironmentArn] :
  /// The Amazon Resource Name (ARN) for a backend environment that is part of
  /// an Amplify app.
  ///
  /// Parameter [basicAuthCredentials] :
  /// The basic authorization credentials for the branch.
  ///
  /// Parameter [buildSpec] :
  /// The build specification (build spec) for the branch.
  ///
  /// Parameter [description] :
  /// The description for the branch.
  ///
  /// Parameter [displayName] :
  /// The display name for a branch. This is used as the default domain prefix.
  ///
  /// Parameter [enableAutoBuild] :
  /// Enables auto building for the branch.
  ///
  /// Parameter [enableBasicAuth] :
  /// Enables basic authorization for the branch.
  ///
  /// Parameter [enableNotification] :
  /// Enables notifications for the branch.
  ///
  /// Parameter [enablePerformanceMode] :
  /// Enables performance mode for the branch.
  ///
  /// Performance mode optimizes for faster hosting performance by keeping
  /// content cached at the edge for a longer interval. When performance mode is
  /// enabled, hosting configuration or code changes can take up to 10 minutes
  /// to roll out.
  ///
  /// Parameter [enablePullRequestPreview] :
  /// Enables pull request previews for this branch.
  ///
  /// Parameter [environmentVariables] :
  /// The environment variables for the branch.
  ///
  /// Parameter [framework] :
  /// The framework for the branch.
  ///
  /// Parameter [pullRequestEnvironmentName] :
  /// The Amplify environment name for the pull request.
  ///
  /// Parameter [stage] :
  /// Describes the current stage for the branch.
  ///
  /// Parameter [ttl] :
  /// The content Time to Live (TTL) for the website in seconds.
  Future<UpdateBranchResult> updateBranch({
    @_s.required String appId,
    @_s.required String branchName,
    String backendEnvironmentArn,
    String basicAuthCredentials,
    String buildSpec,
    String description,
    String displayName,
    bool enableAutoBuild,
    bool enableBasicAuth,
    bool enableNotification,
    bool enablePerformanceMode,
    bool enablePullRequestPreview,
    Map<String, String> environmentVariables,
    String framework,
    String pullRequestEnvironmentName,
    Stage stage,
    String ttl,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(branchName, 'branchName');
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'backendEnvironmentArn',
      backendEnvironmentArn,
      1,
      1000,
    );
    _s.validateStringLength(
      'basicAuthCredentials',
      basicAuthCredentials,
      0,
      2000,
    );
    _s.validateStringLength(
      'buildSpec',
      buildSpec,
      1,
      25000,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      255,
    );
    _s.validateStringLength(
      'framework',
      framework,
      0,
      255,
    );
    _s.validateStringLength(
      'pullRequestEnvironmentName',
      pullRequestEnvironmentName,
      0,
      20,
    );
    final $payload = <String, dynamic>{
      if (backendEnvironmentArn != null)
        'backendEnvironmentArn': backendEnvironmentArn,
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (enableAutoBuild != null) 'enableAutoBuild': enableAutoBuild,
      if (enableBasicAuth != null) 'enableBasicAuth': enableBasicAuth,
      if (enableNotification != null) 'enableNotification': enableNotification,
      if (enablePerformanceMode != null)
        'enablePerformanceMode': enablePerformanceMode,
      if (enablePullRequestPreview != null)
        'enablePullRequestPreview': enablePullRequestPreview,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (framework != null) 'framework': framework,
      if (pullRequestEnvironmentName != null)
        'pullRequestEnvironmentName': pullRequestEnvironmentName,
      if (stage != null) 'stage': stage.toValue(),
      if (ttl != null) 'ttl': ttl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/branches/${Uri.encodeComponent(branchName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBranchResult.fromJson(response);
  }

  /// Creates a new domain association for an Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [subDomainSettings] :
  /// Describes the settings for the subdomain.
  ///
  /// Parameter [autoSubDomainCreationPatterns] :
  /// Sets the branch patterns for automatic subdomain creation.
  ///
  /// Parameter [autoSubDomainIAMRole] :
  /// The required AWS Identity and Access Management (IAM) service role for the
  /// Amazon Resource Name (ARN) for automatically creating subdomains.
  ///
  /// Parameter [enableAutoSubDomain] :
  /// Enables the automated creation of subdomains for branches.
  Future<UpdateDomainAssociationResult> updateDomainAssociation({
    @_s.required String appId,
    @_s.required String domainName,
    @_s.required List<SubDomainSetting> subDomainSettings,
    List<String> autoSubDomainCreationPatterns,
    String autoSubDomainIAMRole,
    bool enableAutoSubDomain,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      20,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''d[a-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(subDomainSettings, 'subDomainSettings');
    _s.validateStringLength(
      'autoSubDomainIAMRole',
      autoSubDomainIAMRole,
      0,
      1000,
    );
    _s.validateStringPattern(
      'autoSubDomainIAMRole',
      autoSubDomainIAMRole,
      r'''^$|^arn:aws:iam::\d{12}:role.+''',
    );
    final $payload = <String, dynamic>{
      'subDomainSettings': subDomainSettings,
      if (autoSubDomainCreationPatterns != null)
        'autoSubDomainCreationPatterns': autoSubDomainCreationPatterns,
      if (autoSubDomainIAMRole != null)
        'autoSubDomainIAMRole': autoSubDomainIAMRole,
      if (enableAutoSubDomain != null)
        'enableAutoSubDomain': enableAutoSubDomain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/apps/${Uri.encodeComponent(appId)}/domains/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDomainAssociationResult.fromJson(response);
  }

  /// Updates a webhook.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [webhookId] :
  /// The unique ID for a webhook.
  ///
  /// Parameter [branchName] :
  /// The name for a branch that is part of an Amplify app.
  ///
  /// Parameter [description] :
  /// The description for a webhook.
  Future<UpdateWebhookResult> updateWebhook({
    @_s.required String webhookId,
    String branchName,
    String description,
  }) async {
    ArgumentError.checkNotNull(webhookId, 'webhookId');
    _s.validateStringLength(
      'webhookId',
      webhookId,
      0,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'branchName',
      branchName,
      1,
      255,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      if (branchName != null) 'branchName': branchName,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/webhooks/${Uri.encodeComponent(webhookId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWebhookResult.fromJson(response);
  }
}

/// Represents the different branches of a repository for building, deploying,
/// and hosting an Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class App {
  /// The Amazon Resource Name (ARN) of the Amplify app.
  @_s.JsonKey(name: 'appArn')
  final String appArn;

  /// The unique ID of the Amplify app.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// Creates a date and time for the Amplify app.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// The default domain for the Amplify app.
  @_s.JsonKey(name: 'defaultDomain')
  final String defaultDomain;

  /// The description for the Amplify app.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Enables basic authorization for the Amplify app's branches.
  @_s.JsonKey(name: 'enableBasicAuth')
  final bool enableBasicAuth;

  /// Enables the auto-building of branches for the Amplify app.
  @_s.JsonKey(name: 'enableBranchAutoBuild')
  final bool enableBranchAutoBuild;

  /// The environment variables for the Amplify app.
  @_s.JsonKey(name: 'environmentVariables')
  final Map<String, String> environmentVariables;

  /// The name for the Amplify app.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The platform for the Amplify app.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// The repository for the Amplify app.
  @_s.JsonKey(name: 'repository')
  final String repository;

  /// Updates the date and time for the Amplify app.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updateTime')
  final DateTime updateTime;

  /// Describes the automated branch creation configuration for the Amplify app.
  @_s.JsonKey(name: 'autoBranchCreationConfig')
  final AutoBranchCreationConfig autoBranchCreationConfig;

  /// Describes the automated branch creation glob patterns for the Amplify app.
  @_s.JsonKey(name: 'autoBranchCreationPatterns')
  final List<String> autoBranchCreationPatterns;

  /// The basic authorization credentials for branches for the Amplify app.
  @_s.JsonKey(name: 'basicAuthCredentials')
  final String basicAuthCredentials;

  /// Describes the content of the build specification (build spec) for the
  /// Amplify app.
  @_s.JsonKey(name: 'buildSpec')
  final String buildSpec;

  /// Describes the custom HTTP headers for the Amplify app.
  @_s.JsonKey(name: 'customHeaders')
  final String customHeaders;

  /// Describes the custom redirect and rewrite rules for the Amplify app.
  @_s.JsonKey(name: 'customRules')
  final List<CustomRule> customRules;

  /// Enables automated branch creation for the Amplify app.
  @_s.JsonKey(name: 'enableAutoBranchCreation')
  final bool enableAutoBranchCreation;

  /// Automatically disconnect a branch in the Amplify Console when you delete a
  /// branch from your Git repository.
  @_s.JsonKey(name: 'enableBranchAutoDeletion')
  final bool enableBranchAutoDeletion;

  /// The AWS Identity and Access Management (IAM) service role for the Amazon
  /// Resource Name (ARN) of the Amplify app.
  @_s.JsonKey(name: 'iamServiceRoleArn')
  final String iamServiceRoleArn;

  /// Describes the information about a production branch of the Amplify app.
  @_s.JsonKey(name: 'productionBranch')
  final ProductionBranch productionBranch;

  /// The tag for the Amplify app.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  App({
    @_s.required this.appArn,
    @_s.required this.appId,
    @_s.required this.createTime,
    @_s.required this.defaultDomain,
    @_s.required this.description,
    @_s.required this.enableBasicAuth,
    @_s.required this.enableBranchAutoBuild,
    @_s.required this.environmentVariables,
    @_s.required this.name,
    @_s.required this.platform,
    @_s.required this.repository,
    @_s.required this.updateTime,
    this.autoBranchCreationConfig,
    this.autoBranchCreationPatterns,
    this.basicAuthCredentials,
    this.buildSpec,
    this.customHeaders,
    this.customRules,
    this.enableAutoBranchCreation,
    this.enableBranchAutoDeletion,
    this.iamServiceRoleArn,
    this.productionBranch,
    this.tags,
  });
  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
}

/// Describes an artifact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Artifact {
  /// The file name for the artifact.
  @_s.JsonKey(name: 'artifactFileName')
  final String artifactFileName;

  /// The unique ID for the artifact.
  @_s.JsonKey(name: 'artifactId')
  final String artifactId;

  Artifact({
    @_s.required this.artifactFileName,
    @_s.required this.artifactId,
  });
  factory Artifact.fromJson(Map<String, dynamic> json) =>
      _$ArtifactFromJson(json);
}

/// Describes the automated branch creation configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoBranchCreationConfig {
  /// The basic authorization credentials for the autocreated branch.
  @_s.JsonKey(name: 'basicAuthCredentials')
  final String basicAuthCredentials;

  /// The build specification (build spec) for the autocreated branch.
  @_s.JsonKey(name: 'buildSpec')
  final String buildSpec;

  /// Enables auto building for the autocreated branch.
  @_s.JsonKey(name: 'enableAutoBuild')
  final bool enableAutoBuild;

  /// Enables basic authorization for the autocreated branch.
  @_s.JsonKey(name: 'enableBasicAuth')
  final bool enableBasicAuth;

  /// Enables performance mode for the branch.
  ///
  /// Performance mode optimizes for faster hosting performance by keeping content
  /// cached at the edge for a longer interval. When performance mode is enabled,
  /// hosting configuration or code changes can take up to 10 minutes to roll out.
  @_s.JsonKey(name: 'enablePerformanceMode')
  final bool enablePerformanceMode;

  /// Enables pull request previews for the autocreated branch.
  @_s.JsonKey(name: 'enablePullRequestPreview')
  final bool enablePullRequestPreview;

  /// The environment variables for the autocreated branch.
  @_s.JsonKey(name: 'environmentVariables')
  final Map<String, String> environmentVariables;

  /// The framework for the autocreated branch.
  @_s.JsonKey(name: 'framework')
  final String framework;

  /// The Amplify environment name for the pull request.
  @_s.JsonKey(name: 'pullRequestEnvironmentName')
  final String pullRequestEnvironmentName;

  /// Describes the current stage for the autocreated branch.
  @_s.JsonKey(name: 'stage')
  final Stage stage;

  AutoBranchCreationConfig({
    this.basicAuthCredentials,
    this.buildSpec,
    this.enableAutoBuild,
    this.enableBasicAuth,
    this.enablePerformanceMode,
    this.enablePullRequestPreview,
    this.environmentVariables,
    this.framework,
    this.pullRequestEnvironmentName,
    this.stage,
  });
  factory AutoBranchCreationConfig.fromJson(Map<String, dynamic> json) =>
      _$AutoBranchCreationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AutoBranchCreationConfigToJson(this);
}

/// Describes the backend environment for an Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackendEnvironment {
  /// The Amazon Resource Name (ARN) for a backend environment that is part of an
  /// Amplify app.
  @_s.JsonKey(name: 'backendEnvironmentArn')
  final String backendEnvironmentArn;

  /// The creation date and time for a backend environment that is part of an
  /// Amplify app.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// The name for a backend environment that is part of an Amplify app.
  @_s.JsonKey(name: 'environmentName')
  final String environmentName;

  /// The last updated date and time for a backend environment that is part of an
  /// Amplify app.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updateTime')
  final DateTime updateTime;

  /// The name of deployment artifacts.
  @_s.JsonKey(name: 'deploymentArtifacts')
  final String deploymentArtifacts;

  /// The AWS CloudFormation stack name of a backend environment.
  @_s.JsonKey(name: 'stackName')
  final String stackName;

  BackendEnvironment({
    @_s.required this.backendEnvironmentArn,
    @_s.required this.createTime,
    @_s.required this.environmentName,
    @_s.required this.updateTime,
    this.deploymentArtifacts,
    this.stackName,
  });
  factory BackendEnvironment.fromJson(Map<String, dynamic> json) =>
      _$BackendEnvironmentFromJson(json);
}

/// The branch for an Amplify app, which maps to a third-party repository
/// branch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Branch {
  /// The ID of the active job for a branch of an Amplify app.
  @_s.JsonKey(name: 'activeJobId')
  final String activeJobId;

  /// The Amazon Resource Name (ARN) for a branch that is part of an Amplify app.
  @_s.JsonKey(name: 'branchArn')
  final String branchArn;

  /// The name for the branch that is part of an Amplify app.
  @_s.JsonKey(name: 'branchName')
  final String branchName;

  /// The creation date and time for a branch that is part of an Amplify app.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// The custom domains for a branch of an Amplify app.
  @_s.JsonKey(name: 'customDomains')
  final List<String> customDomains;

  /// The description for the branch that is part of an Amplify app.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The display name for the branch. This is used as the default domain prefix.
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// Enables auto-building on push for a branch of an Amplify app.
  @_s.JsonKey(name: 'enableAutoBuild')
  final bool enableAutoBuild;

  /// Enables basic authorization for a branch of an Amplify app.
  @_s.JsonKey(name: 'enableBasicAuth')
  final bool enableBasicAuth;

  /// Enables notifications for a branch that is part of an Amplify app.
  @_s.JsonKey(name: 'enableNotification')
  final bool enableNotification;

  /// Enables pull request previews for the branch.
  @_s.JsonKey(name: 'enablePullRequestPreview')
  final bool enablePullRequestPreview;

  /// The environment variables specific to a branch of an Amplify app.
  @_s.JsonKey(name: 'environmentVariables')
  final Map<String, String> environmentVariables;

  /// The framework for a branch of an Amplify app.
  @_s.JsonKey(name: 'framework')
  final String framework;

  /// The current stage for the branch that is part of an Amplify app.
  @_s.JsonKey(name: 'stage')
  final Stage stage;

  /// The total number of jobs that are part of an Amplify app.
  @_s.JsonKey(name: 'totalNumberOfJobs')
  final String totalNumberOfJobs;

  /// The content Time to Live (TTL) for the website in seconds.
  @_s.JsonKey(name: 'ttl')
  final String ttl;

  /// The last updated date and time for a branch that is part of an Amplify app.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updateTime')
  final DateTime updateTime;

  /// A list of custom resources that are linked to this branch.
  @_s.JsonKey(name: 'associatedResources')
  final List<String> associatedResources;

  /// The Amazon Resource Name (ARN) for a backend environment that is part of an
  /// Amplify app.
  @_s.JsonKey(name: 'backendEnvironmentArn')
  final String backendEnvironmentArn;

  /// The basic authorization credentials for a branch of an Amplify app.
  @_s.JsonKey(name: 'basicAuthCredentials')
  final String basicAuthCredentials;

  /// The build specification (build spec) content for the branch of an Amplify
  /// app.
  @_s.JsonKey(name: 'buildSpec')
  final String buildSpec;

  /// The destination branch if the branch is a pull request branch.
  @_s.JsonKey(name: 'destinationBranch')
  final String destinationBranch;

  /// Enables performance mode for the branch.
  ///
  /// Performance mode optimizes for faster hosting performance by keeping content
  /// cached at the edge for a longer interval. When performance mode is enabled,
  /// hosting configuration or code changes can take up to 10 minutes to roll out.
  @_s.JsonKey(name: 'enablePerformanceMode')
  final bool enablePerformanceMode;

  /// The Amplify environment name for the pull request.
  @_s.JsonKey(name: 'pullRequestEnvironmentName')
  final String pullRequestEnvironmentName;

  /// The source branch if the branch is a pull request branch.
  @_s.JsonKey(name: 'sourceBranch')
  final String sourceBranch;

  /// The tag for the branch of an Amplify app.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The thumbnail URL for the branch of an Amplify app.
  @_s.JsonKey(name: 'thumbnailUrl')
  final String thumbnailUrl;

  Branch({
    @_s.required this.activeJobId,
    @_s.required this.branchArn,
    @_s.required this.branchName,
    @_s.required this.createTime,
    @_s.required this.customDomains,
    @_s.required this.description,
    @_s.required this.displayName,
    @_s.required this.enableAutoBuild,
    @_s.required this.enableBasicAuth,
    @_s.required this.enableNotification,
    @_s.required this.enablePullRequestPreview,
    @_s.required this.environmentVariables,
    @_s.required this.framework,
    @_s.required this.stage,
    @_s.required this.totalNumberOfJobs,
    @_s.required this.ttl,
    @_s.required this.updateTime,
    this.associatedResources,
    this.backendEnvironmentArn,
    this.basicAuthCredentials,
    this.buildSpec,
    this.destinationBranch,
    this.enablePerformanceMode,
    this.pullRequestEnvironmentName,
    this.sourceBranch,
    this.tags,
    this.thumbnailUrl,
  });
  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAppResult {
  @_s.JsonKey(name: 'app')
  final App app;

  CreateAppResult({
    @_s.required this.app,
  });
  factory CreateAppResult.fromJson(Map<String, dynamic> json) =>
      _$CreateAppResultFromJson(json);
}

/// The result structure for the create backend environment request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackendEnvironmentResult {
  /// Describes the backend environment for an Amplify app.
  @_s.JsonKey(name: 'backendEnvironment')
  final BackendEnvironment backendEnvironment;

  CreateBackendEnvironmentResult({
    @_s.required this.backendEnvironment,
  });
  factory CreateBackendEnvironmentResult.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendEnvironmentResultFromJson(json);
}

/// The result structure for create branch request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBranchResult {
  /// Describes the branch for an Amplify app, which maps to a third-party
  /// repository branch.
  @_s.JsonKey(name: 'branch')
  final Branch branch;

  CreateBranchResult({
    @_s.required this.branch,
  });
  factory CreateBranchResult.fromJson(Map<String, dynamic> json) =>
      _$CreateBranchResultFromJson(json);
}

/// The result structure for the create a new deployment request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentResult {
  /// When the <code>fileMap</code> argument is provided in the request,
  /// <code>fileUploadUrls</code> will contain a map of file names to upload URLs.
  @_s.JsonKey(name: 'fileUploadUrls')
  final Map<String, String> fileUploadUrls;

  /// When the <code>fileMap</code> argument is not provided in the request, this
  /// <code>zipUploadUrl</code> is returned.
  @_s.JsonKey(name: 'zipUploadUrl')
  final String zipUploadUrl;

  /// The job ID for this deployment. will supply to start deployment api.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  CreateDeploymentResult({
    @_s.required this.fileUploadUrls,
    @_s.required this.zipUploadUrl,
    this.jobId,
  });
  factory CreateDeploymentResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDeploymentResultFromJson(json);
}

/// The result structure for the create domain association request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDomainAssociationResult {
  /// Describes the structure of a domain association, which associates a custom
  /// domain with an Amplify app.
  @_s.JsonKey(name: 'domainAssociation')
  final DomainAssociation domainAssociation;

  CreateDomainAssociationResult({
    @_s.required this.domainAssociation,
  });
  factory CreateDomainAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDomainAssociationResultFromJson(json);
}

/// The result structure for the create webhook request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWebhookResult {
  /// Describes a webhook that connects repository events to an Amplify app.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  CreateWebhookResult({
    @_s.required this.webhook,
  });
  factory CreateWebhookResult.fromJson(Map<String, dynamic> json) =>
      _$CreateWebhookResultFromJson(json);
}

/// Describes a custom rewrite or redirect rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomRule {
  /// The source pattern for a URL rewrite or redirect rule.
  @_s.JsonKey(name: 'source')
  final String source;

  /// The target pattern for a URL rewrite or redirect rule.
  @_s.JsonKey(name: 'target')
  final String target;

  /// The condition for a URL rewrite or redirect rule, such as a country code.
  @_s.JsonKey(name: 'condition')
  final String condition;

  /// The status code for a URL rewrite or redirect rule.
  /// <dl> <dt>200</dt> <dd>
  /// Represents a 200 rewrite rule.
  /// </dd> <dt>301</dt> <dd>
  /// Represents a 301 (moved pemanently) redirect rule. This and all future
  /// requests should be directed to the target URL.
  /// </dd> <dt>302</dt> <dd>
  /// Represents a 302 temporary redirect rule.
  /// </dd> <dt>404</dt> <dd>
  /// Represents a 404 redirect rule.
  /// </dd> <dt>404-200</dt> <dd>
  /// Represents a 404 rewrite rule.
  /// </dd> </dl>
  @_s.JsonKey(name: 'status')
  final String status;

  CustomRule({
    @_s.required this.source,
    @_s.required this.target,
    this.condition,
    this.status,
  });
  factory CustomRule.fromJson(Map<String, dynamic> json) =>
      _$CustomRuleFromJson(json);

  Map<String, dynamic> toJson() => _$CustomRuleToJson(this);
}

/// The result structure for the delete app request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAppResult {
  @_s.JsonKey(name: 'app')
  final App app;

  DeleteAppResult({
    @_s.required this.app,
  });
  factory DeleteAppResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteAppResultFromJson(json);
}

/// The result structure of the delete backend environment result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBackendEnvironmentResult {
  /// Describes the backend environment for an Amplify app.
  @_s.JsonKey(name: 'backendEnvironment')
  final BackendEnvironment backendEnvironment;

  DeleteBackendEnvironmentResult({
    @_s.required this.backendEnvironment,
  });
  factory DeleteBackendEnvironmentResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackendEnvironmentResultFromJson(json);
}

/// The result structure for the delete branch request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBranchResult {
  /// The branch for an Amplify app, which maps to a third-party repository
  /// branch.
  @_s.JsonKey(name: 'branch')
  final Branch branch;

  DeleteBranchResult({
    @_s.required this.branch,
  });
  factory DeleteBranchResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteBranchResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDomainAssociationResult {
  @_s.JsonKey(name: 'domainAssociation')
  final DomainAssociation domainAssociation;

  DeleteDomainAssociationResult({
    @_s.required this.domainAssociation,
  });
  factory DeleteDomainAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDomainAssociationResultFromJson(json);
}

/// The result structure for the delete job request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteJobResult {
  @_s.JsonKey(name: 'jobSummary')
  final JobSummary jobSummary;

  DeleteJobResult({
    @_s.required this.jobSummary,
  });
  factory DeleteJobResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteJobResultFromJson(json);
}

/// The result structure for the delete webhook request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWebhookResult {
  /// Describes a webhook that connects repository events to an Amplify app.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  DeleteWebhookResult({
    @_s.required this.webhook,
  });
  factory DeleteWebhookResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteWebhookResultFromJson(json);
}

/// Describes a domain association that associates a custom domain with an
/// Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainAssociation {
  /// The Amazon Resource Name (ARN) for the domain association.
  @_s.JsonKey(name: 'domainAssociationArn')
  final String domainAssociationArn;

  /// The name of the domain.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The current status of the domain association.
  @_s.JsonKey(name: 'domainStatus')
  final DomainStatus domainStatus;

  /// Enables the automated creation of subdomains for branches.
  @_s.JsonKey(name: 'enableAutoSubDomain')
  final bool enableAutoSubDomain;

  /// The reason for the current status of the domain association.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// The subdomains for the domain association.
  @_s.JsonKey(name: 'subDomains')
  final List<SubDomain> subDomains;

  /// Sets branch patterns for automatic subdomain creation.
  @_s.JsonKey(name: 'autoSubDomainCreationPatterns')
  final List<String> autoSubDomainCreationPatterns;

  /// The required AWS Identity and Access Management (IAM) service role for the
  /// Amazon Resource Name (ARN) for automatically creating subdomains.
  @_s.JsonKey(name: 'autoSubDomainIAMRole')
  final String autoSubDomainIAMRole;

  /// The DNS record for certificate verification.
  @_s.JsonKey(name: 'certificateVerificationDNSRecord')
  final String certificateVerificationDNSRecord;

  DomainAssociation({
    @_s.required this.domainAssociationArn,
    @_s.required this.domainName,
    @_s.required this.domainStatus,
    @_s.required this.enableAutoSubDomain,
    @_s.required this.statusReason,
    @_s.required this.subDomains,
    this.autoSubDomainCreationPatterns,
    this.autoSubDomainIAMRole,
    this.certificateVerificationDNSRecord,
  });
  factory DomainAssociation.fromJson(Map<String, dynamic> json) =>
      _$DomainAssociationFromJson(json);
}

enum DomainStatus {
  @_s.JsonValue('PENDING_VERIFICATION')
  pendingVerification,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('PENDING_DEPLOYMENT')
  pendingDeployment,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('REQUESTING_CERTIFICATE')
  requestingCertificate,
  @_s.JsonValue('UPDATING')
  updating,
}

/// The result structure for the generate access logs request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateAccessLogsResult {
  /// The pre-signed URL for the requested access logs.
  @_s.JsonKey(name: 'logUrl')
  final String logUrl;

  GenerateAccessLogsResult({
    this.logUrl,
  });
  factory GenerateAccessLogsResult.fromJson(Map<String, dynamic> json) =>
      _$GenerateAccessLogsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppResult {
  @_s.JsonKey(name: 'app')
  final App app;

  GetAppResult({
    @_s.required this.app,
  });
  factory GetAppResult.fromJson(Map<String, dynamic> json) =>
      _$GetAppResultFromJson(json);
}

/// Returns the result structure for the get artifact request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetArtifactUrlResult {
  /// The unique ID for an artifact.
  @_s.JsonKey(name: 'artifactId')
  final String artifactId;

  /// The presigned URL for the artifact.
  @_s.JsonKey(name: 'artifactUrl')
  final String artifactUrl;

  GetArtifactUrlResult({
    @_s.required this.artifactId,
    @_s.required this.artifactUrl,
  });
  factory GetArtifactUrlResult.fromJson(Map<String, dynamic> json) =>
      _$GetArtifactUrlResultFromJson(json);
}

/// The result structure for the get backend environment result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackendEnvironmentResult {
  /// Describes the backend environment for an Amplify app.
  @_s.JsonKey(name: 'backendEnvironment')
  final BackendEnvironment backendEnvironment;

  GetBackendEnvironmentResult({
    @_s.required this.backendEnvironment,
  });
  factory GetBackendEnvironmentResult.fromJson(Map<String, dynamic> json) =>
      _$GetBackendEnvironmentResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBranchResult {
  @_s.JsonKey(name: 'branch')
  final Branch branch;

  GetBranchResult({
    @_s.required this.branch,
  });
  factory GetBranchResult.fromJson(Map<String, dynamic> json) =>
      _$GetBranchResultFromJson(json);
}

/// The result structure for the get domain association request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainAssociationResult {
  /// Describes the structure of a domain association, which associates a custom
  /// domain with an Amplify app.
  @_s.JsonKey(name: 'domainAssociation')
  final DomainAssociation domainAssociation;

  GetDomainAssociationResult({
    @_s.required this.domainAssociation,
  });
  factory GetDomainAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$GetDomainAssociationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobResult {
  @_s.JsonKey(name: 'job')
  final Job job;

  GetJobResult({
    @_s.required this.job,
  });
  factory GetJobResult.fromJson(Map<String, dynamic> json) =>
      _$GetJobResultFromJson(json);
}

/// The result structure for the get webhook request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWebhookResult {
  /// Describes the structure of a webhook.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  GetWebhookResult({
    @_s.required this.webhook,
  });
  factory GetWebhookResult.fromJson(Map<String, dynamic> json) =>
      _$GetWebhookResultFromJson(json);
}

/// Describes an execution job for an Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Job {
  /// The execution steps for an execution job, for an Amplify app.
  @_s.JsonKey(name: 'steps')
  final List<Step> steps;

  /// Describes the summary for an execution job for an Amplify app.
  @_s.JsonKey(name: 'summary')
  final JobSummary summary;

  Job({
    @_s.required this.steps,
    @_s.required this.summary,
  });
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

enum JobStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('PROVISIONING')
  provisioning,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SUCCEED')
  succeed,
  @_s.JsonValue('CANCELLING')
  cancelling,
  @_s.JsonValue('CANCELLED')
  cancelled,
}

/// Describes the summary for an execution job for an Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobSummary {
  /// The commit ID from a third-party repository provider for the job.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The commit message from a third-party repository provider for the job.
  @_s.JsonKey(name: 'commitMessage')
  final String commitMessage;

  /// The commit date and time for the job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'commitTime')
  final DateTime commitTime;

  /// The Amazon Resource Name (ARN) for the job.
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// The unique ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The type for the job. If the value is <code>RELEASE</code>, the job was
  /// manually released from its source by using the <code>StartJob</code> API. If
  /// the value is <code>RETRY</code>, the job was manually retried using the
  /// <code>StartJob</code> API. If the value is <code>WEB_HOOK</code>, the job
  /// was automatically triggered by webhooks.
  @_s.JsonKey(name: 'jobType')
  final JobType jobType;

  /// The start date and time for the job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The current status for the job.
  @_s.JsonKey(name: 'status')
  final JobStatus status;

  /// The end date and time for the job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  JobSummary({
    @_s.required this.commitId,
    @_s.required this.commitMessage,
    @_s.required this.commitTime,
    @_s.required this.jobArn,
    @_s.required this.jobId,
    @_s.required this.jobType,
    @_s.required this.startTime,
    @_s.required this.status,
    this.endTime,
  });
  factory JobSummary.fromJson(Map<String, dynamic> json) =>
      _$JobSummaryFromJson(json);
}

enum JobType {
  @_s.JsonValue('RELEASE')
  release,
  @_s.JsonValue('RETRY')
  retry,
  @_s.JsonValue('MANUAL')
  manual,
  @_s.JsonValue('WEB_HOOK')
  webHook,
}

extension on JobType {
  String toValue() {
    switch (this) {
      case JobType.release:
        return 'RELEASE';
      case JobType.retry:
        return 'RETRY';
      case JobType.manual:
        return 'MANUAL';
      case JobType.webHook:
        return 'WEB_HOOK';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The result structure for an Amplify app list request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAppsResult {
  /// A list of Amplify apps.
  @_s.JsonKey(name: 'apps')
  final List<App> apps;

  /// A pagination token. Set to null to start listing apps from start. If
  /// non-null, the pagination token is returned in a result. Pass its value in
  /// here to list more projects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAppsResult({
    @_s.required this.apps,
    this.nextToken,
  });
  factory ListAppsResult.fromJson(Map<String, dynamic> json) =>
      _$ListAppsResultFromJson(json);
}

/// The result structure for the list artifacts request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListArtifactsResult {
  /// A list of artifacts.
  @_s.JsonKey(name: 'artifacts')
  final List<Artifact> artifacts;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListArtifactsResult({
    @_s.required this.artifacts,
    this.nextToken,
  });
  factory ListArtifactsResult.fromJson(Map<String, dynamic> json) =>
      _$ListArtifactsResultFromJson(json);
}

/// The result structure for the list backend environments result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackendEnvironmentsResult {
  /// The list of backend environments for an Amplify app.
  @_s.JsonKey(name: 'backendEnvironments')
  final List<BackendEnvironment> backendEnvironments;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBackendEnvironmentsResult({
    @_s.required this.backendEnvironments,
    this.nextToken,
  });
  factory ListBackendEnvironmentsResult.fromJson(Map<String, dynamic> json) =>
      _$ListBackendEnvironmentsResultFromJson(json);
}

/// The result structure for the list branches request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBranchesResult {
  /// A list of branches for an Amplify app.
  @_s.JsonKey(name: 'branches')
  final List<Branch> branches;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBranchesResult({
    @_s.required this.branches,
    this.nextToken,
  });
  factory ListBranchesResult.fromJson(Map<String, dynamic> json) =>
      _$ListBranchesResultFromJson(json);
}

/// The result structure for the list domain association request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainAssociationsResult {
  /// A list of domain associations.
  @_s.JsonKey(name: 'domainAssociations')
  final List<DomainAssociation> domainAssociations;

  /// A pagination token. If non-null, a pagination token is returned in a result.
  /// Pass its value in another request to retrieve more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDomainAssociationsResult({
    @_s.required this.domainAssociations,
    this.nextToken,
  });
  factory ListDomainAssociationsResult.fromJson(Map<String, dynamic> json) =>
      _$ListDomainAssociationsResultFromJson(json);
}

/// The maximum number of records to list in a single response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResult {
  /// The result structure for the list job result request.
  @_s.JsonKey(name: 'jobSummaries')
  final List<JobSummary> jobSummaries;

  /// A pagination token. If non-null the pagination token is returned in a
  /// result. Pass its value in another request to retrieve more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobsResult({
    @_s.required this.jobSummaries,
    this.nextToken,
  });
  factory ListJobsResult.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResultFromJson(json);
}

/// The response for the list tags for resource request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A list of tags for the specified The Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// The result structure for the list webhooks request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWebhooksResult {
  /// A list of webhooks.
  @_s.JsonKey(name: 'webhooks')
  final List<Webhook> webhooks;

  /// A pagination token. If non-null, the pagination token is returned in a
  /// result. Pass its value in another request to retrieve more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListWebhooksResult({
    @_s.required this.webhooks,
    this.nextToken,
  });
  factory ListWebhooksResult.fromJson(Map<String, dynamic> json) =>
      _$ListWebhooksResultFromJson(json);
}

enum Platform {
  @_s.JsonValue('WEB')
  web,
}

extension on Platform {
  String toValue() {
    switch (this) {
      case Platform.web:
        return 'WEB';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the information about a production branch for an Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProductionBranch {
  /// The branch name for the production branch.
  @_s.JsonKey(name: 'branchName')
  final String branchName;

  /// The last deploy time of the production branch.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastDeployTime')
  final DateTime lastDeployTime;

  /// The status of the production branch.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The thumbnail URL for the production branch.
  @_s.JsonKey(name: 'thumbnailUrl')
  final String thumbnailUrl;

  ProductionBranch({
    this.branchName,
    this.lastDeployTime,
    this.status,
    this.thumbnailUrl,
  });
  factory ProductionBranch.fromJson(Map<String, dynamic> json) =>
      _$ProductionBranchFromJson(json);
}

enum Stage {
  @_s.JsonValue('PRODUCTION')
  production,
  @_s.JsonValue('BETA')
  beta,
  @_s.JsonValue('DEVELOPMENT')
  development,
  @_s.JsonValue('EXPERIMENTAL')
  experimental,
  @_s.JsonValue('PULL_REQUEST')
  pullRequest,
}

extension on Stage {
  String toValue() {
    switch (this) {
      case Stage.production:
        return 'PRODUCTION';
      case Stage.beta:
        return 'BETA';
      case Stage.development:
        return 'DEVELOPMENT';
      case Stage.experimental:
        return 'EXPERIMENTAL';
      case Stage.pullRequest:
        return 'PULL_REQUEST';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The result structure for the start a deployment request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartDeploymentResult {
  /// The summary for the job.
  @_s.JsonKey(name: 'jobSummary')
  final JobSummary jobSummary;

  StartDeploymentResult({
    @_s.required this.jobSummary,
  });
  factory StartDeploymentResult.fromJson(Map<String, dynamic> json) =>
      _$StartDeploymentResultFromJson(json);
}

/// The result structure for the run job request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartJobResult {
  /// The summary for the job.
  @_s.JsonKey(name: 'jobSummary')
  final JobSummary jobSummary;

  StartJobResult({
    @_s.required this.jobSummary,
  });
  factory StartJobResult.fromJson(Map<String, dynamic> json) =>
      _$StartJobResultFromJson(json);
}

/// Describes an execution step, for an execution job, for an Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Step {
  /// The end date and time of the execution step.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// The start date and time of the execution step.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The status of the execution step.
  @_s.JsonKey(name: 'status')
  final JobStatus status;

  /// The name of the execution step.
  @_s.JsonKey(name: 'stepName')
  final String stepName;

  /// The URL to the artifact for the execution step.
  @_s.JsonKey(name: 'artifactsUrl')
  final String artifactsUrl;

  /// The context for the current step. Includes a build image if the step is
  /// build.
  @_s.JsonKey(name: 'context')
  final String context;

  /// The URL to the logs for the execution step.
  @_s.JsonKey(name: 'logUrl')
  final String logUrl;

  /// The list of screenshot URLs for the execution step, if relevant.
  @_s.JsonKey(name: 'screenshots')
  final Map<String, String> screenshots;

  /// The reason for the current step status.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// The URL to the test artifact for the execution step.
  @_s.JsonKey(name: 'testArtifactsUrl')
  final String testArtifactsUrl;

  /// The URL to the test configuration for the execution step.
  @_s.JsonKey(name: 'testConfigUrl')
  final String testConfigUrl;

  Step({
    @_s.required this.endTime,
    @_s.required this.startTime,
    @_s.required this.status,
    @_s.required this.stepName,
    this.artifactsUrl,
    this.context,
    this.logUrl,
    this.screenshots,
    this.statusReason,
    this.testArtifactsUrl,
    this.testConfigUrl,
  });
  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}

/// The result structure for the stop job request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopJobResult {
  /// The summary for the job.
  @_s.JsonKey(name: 'jobSummary')
  final JobSummary jobSummary;

  StopJobResult({
    @_s.required this.jobSummary,
  });
  factory StopJobResult.fromJson(Map<String, dynamic> json) =>
      _$StopJobResultFromJson(json);
}

/// The subdomain for the domain association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubDomain {
  /// The DNS record for the subdomain.
  @_s.JsonKey(name: 'dnsRecord')
  final String dnsRecord;

  /// Describes the settings for the subdomain.
  @_s.JsonKey(name: 'subDomainSetting')
  final SubDomainSetting subDomainSetting;

  /// The verified status of the subdomain
  @_s.JsonKey(name: 'verified')
  final bool verified;

  SubDomain({
    @_s.required this.dnsRecord,
    @_s.required this.subDomainSetting,
    @_s.required this.verified,
  });
  factory SubDomain.fromJson(Map<String, dynamic> json) =>
      _$SubDomainFromJson(json);
}

/// Describes the settings for the subdomain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SubDomainSetting {
  /// The branch name setting for the subdomain.
  @_s.JsonKey(name: 'branchName')
  final String branchName;

  /// The prefix setting for the subdomain.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  SubDomainSetting({
    @_s.required this.branchName,
    @_s.required this.prefix,
  });
  factory SubDomainSetting.fromJson(Map<String, dynamic> json) =>
      _$SubDomainSettingFromJson(json);

  Map<String, dynamic> toJson() => _$SubDomainSettingToJson(this);
}

/// The response for the tag resource request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// The response for the untag resource request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// The result structure for an Amplify app update request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAppResult {
  /// Represents the updated Amplify app.
  @_s.JsonKey(name: 'app')
  final App app;

  UpdateAppResult({
    @_s.required this.app,
  });
  factory UpdateAppResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateAppResultFromJson(json);
}

/// The result structure for the update branch request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBranchResult {
  /// The branch for an Amplify app, which maps to a third-party repository
  /// branch.
  @_s.JsonKey(name: 'branch')
  final Branch branch;

  UpdateBranchResult({
    @_s.required this.branch,
  });
  factory UpdateBranchResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateBranchResultFromJson(json);
}

/// The result structure for the update domain association request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainAssociationResult {
  /// Describes a domain association, which associates a custom domain with an
  /// Amplify app.
  @_s.JsonKey(name: 'domainAssociation')
  final DomainAssociation domainAssociation;

  UpdateDomainAssociationResult({
    @_s.required this.domainAssociation,
  });
  factory UpdateDomainAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainAssociationResultFromJson(json);
}

/// The result structure for the update webhook request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWebhookResult {
  /// Describes a webhook that connects repository events to an Amplify app.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  UpdateWebhookResult({
    @_s.required this.webhook,
  });
  factory UpdateWebhookResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateWebhookResultFromJson(json);
}

/// Describes a webhook that connects repository events to an Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Webhook {
  /// The name for a branch that is part of an Amplify app.
  @_s.JsonKey(name: 'branchName')
  final String branchName;

  /// The create date and time for a webhook.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// The description for a webhook.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Updates the date and time for a webhook.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updateTime')
  final DateTime updateTime;

  /// The Amazon Resource Name (ARN) for the webhook.
  @_s.JsonKey(name: 'webhookArn')
  final String webhookArn;

  /// The ID of the webhook.
  @_s.JsonKey(name: 'webhookId')
  final String webhookId;

  /// The URL of the webhook.
  @_s.JsonKey(name: 'webhookUrl')
  final String webhookUrl;

  Webhook({
    @_s.required this.branchName,
    @_s.required this.createTime,
    @_s.required this.description,
    @_s.required this.updateTime,
    @_s.required this.webhookArn,
    @_s.required this.webhookId,
    @_s.required this.webhookUrl,
  });
  factory Webhook.fromJson(Map<String, dynamic> json) =>
      _$WebhookFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class DependentServiceFailureException extends _s.GenericAwsException {
  DependentServiceFailureException({String type, String message})
      : super(
            type: type,
            code: 'DependentServiceFailureException',
            message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'DependentServiceFailureException': (type, message) =>
      DependentServiceFailureException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
