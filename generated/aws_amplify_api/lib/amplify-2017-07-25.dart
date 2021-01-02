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

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'amplify-2017-07-25.g.dart';

/// Amplify is a fully managed continuous deployment and hosting service for
/// modern web apps.
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

  /// Creates a new Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [name] :
  /// Name for the Amplify App
  ///
  /// Parameter [accessToken] :
  /// Personal Access token for 3rd party source control system for an Amplify
  /// App, used to create webhook and read-only deploy key. Token is not stored.
  ///
  /// Parameter [autoBranchCreationConfig] :
  /// Automated branch creation config for the Amplify App.
  ///
  /// Parameter [autoBranchCreationPatterns] :
  /// Automated branch creation glob patterns for the Amplify App.
  ///
  /// Parameter [basicAuthCredentials] :
  /// Credentials for Basic Authorization for an Amplify App.
  ///
  /// Parameter [buildSpec] :
  /// BuildSpec for an Amplify App
  ///
  /// Parameter [customRules] :
  /// Custom rewrite / redirect rules for an Amplify App.
  ///
  /// Parameter [description] :
  /// Description for an Amplify App
  ///
  /// Parameter [enableAutoBranchCreation] :
  /// Enables automated branch creation for the Amplify App.
  ///
  /// Parameter [enableBasicAuth] :
  /// Enable Basic Authorization for an Amplify App, this will apply to all
  /// branches part of this App.
  ///
  /// Parameter [enableBranchAutoBuild] :
  /// Enable the auto building of branches for an Amplify App.
  ///
  /// Parameter [environmentVariables] :
  /// Environment variables map for an Amplify App.
  ///
  /// Parameter [iamServiceRoleArn] :
  /// AWS IAM service role for an Amplify App
  ///
  /// Parameter [oauthToken] :
  /// OAuth token for 3rd party source control system for an Amplify App, used
  /// to create webhook and read-only deploy key. OAuth token is not stored.
  ///
  /// Parameter [platform] :
  /// Platform / framework for an Amplify App
  ///
  /// Parameter [repository] :
  /// Repository for an Amplify App
  ///
  /// Parameter [tags] :
  /// Tag for an Amplify App
  Future<CreateAppResult> createApp({
    @_s.required String name,
    String accessToken,
    AutoBranchCreationConfig autoBranchCreationConfig,
    List<String> autoBranchCreationPatterns,
    String basicAuthCredentials,
    String buildSpec,
    List<CustomRule> customRules,
    String description,
    bool enableAutoBranchCreation,
    bool enableBasicAuth,
    bool enableBranchAutoBuild,
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
      100,
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
      if (customRules != null) 'customRules': customRules,
      if (description != null) 'description': description,
      if (enableAutoBranchCreation != null)
        'enableAutoBranchCreation': enableAutoBranchCreation,
      if (enableBasicAuth != null) 'enableBasicAuth': enableBasicAuth,
      if (enableBranchAutoBuild != null)
        'enableBranchAutoBuild': enableBranchAutoBuild,
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

  /// Creates a new backend environment for an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [environmentName] :
  /// Name for the backend environment.
  ///
  /// Parameter [deploymentArtifacts] :
  /// Name of deployment artifacts.
  ///
  /// Parameter [stackName] :
  /// CloudFormation stack name of backend environment.
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
      255,
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

  /// Creates a new Branch for an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch.
  ///
  /// Parameter [backendEnvironmentArn] :
  /// ARN for a Backend Environment, part of an Amplify App.
  ///
  /// Parameter [basicAuthCredentials] :
  /// Basic Authorization credentials for the branch.
  ///
  /// Parameter [buildSpec] :
  /// BuildSpec for the branch.
  ///
  /// Parameter [description] :
  /// Description for the branch.
  ///
  /// Parameter [displayName] :
  /// Display name for a branch, will use as the default domain prefix.
  ///
  /// Parameter [enableAutoBuild] :
  /// Enables auto building for the branch.
  ///
  /// Parameter [enableBasicAuth] :
  /// Enables Basic Auth for the branch.
  ///
  /// Parameter [enableNotification] :
  /// Enables notifications for the branch.
  ///
  /// Parameter [enablePullRequestPreview] :
  /// Enables Pull Request Preview for this branch.
  ///
  /// Parameter [environmentVariables] :
  /// Environment Variables for the branch.
  ///
  /// Parameter [framework] :
  /// Framework for the branch.
  ///
  /// Parameter [pullRequestEnvironmentName] :
  /// The Amplify Environment name for the pull request.
  ///
  /// Parameter [stage] :
  /// Stage for the branch.
  ///
  /// Parameter [tags] :
  /// Tag for the branch.
  ///
  /// Parameter [ttl] :
  /// The content TTL for the website in seconds.
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
      255,
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

  /// Create a deployment for manual deploy apps. (Apps are not connected to
  /// repository)
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch, for the Job.
  ///
  /// Parameter [fileMap] :
  /// Optional file map that contains file name as the key and file content md5
  /// hash as the value. If this argument is provided, the service will generate
  /// different upload url per file. Otherwise, the service will only generate a
  /// single upload url for the zipped files.
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
      255,
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

  /// Create a new DomainAssociation on an App
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [domainName] :
  /// Domain name for the Domain Association.
  ///
  /// Parameter [subDomainSettings] :
  /// Setting structure for the Subdomain.
  ///
  /// Parameter [enableAutoSubDomain] :
  /// Enables automated creation of Subdomains for branches. (Currently not
  /// supported)
  Future<CreateDomainAssociationResult> createDomainAssociation({
    @_s.required String appId,
    @_s.required String domainName,
    @_s.required List<SubDomainSetting> subDomainSettings,
    bool enableAutoSubDomain,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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
    final $payload = <String, dynamic>{
      'domainName': domainName,
      'subDomainSettings': subDomainSettings,
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

  /// Create a new webhook on an App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for a branch, part of an Amplify App.
  ///
  /// Parameter [description] :
  /// Description for a webhook.
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
      255,
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

  /// Delete an existing Amplify App by appId.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  Future<DeleteAppResult> deleteApp({
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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

  /// Delete backend environment for an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id of an Amplify App.
  ///
  /// Parameter [environmentName] :
  /// Name of a backend environment of an Amplify App.
  Future<DeleteBackendEnvironmentResult> deleteBackendEnvironment({
    @_s.required String appId,
    @_s.required String environmentName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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

  /// Deletes a branch for an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch.
  Future<DeleteBranchResult> deleteBranch({
    @_s.required String appId,
    @_s.required String branchName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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

  /// Deletes a DomainAssociation.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [domainName] :
  /// Name of the domain.
  Future<DeleteDomainAssociationResult> deleteDomainAssociation({
    @_s.required String appId,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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

  /// Delete a job, for an Amplify branch, part of Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch, for the Job.
  ///
  /// Parameter [jobId] :
  /// Unique Id for the Job.
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
      255,
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
  /// Unique Id for a webhook.
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

  /// Retrieve website access logs for a specific time range via a pre-signed
  /// URL.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [domainName] :
  /// Name of the domain.
  ///
  /// Parameter [endTime] :
  /// The time at which the logs should end, inclusive.
  ///
  /// Parameter [startTime] :
  /// The time at which the logs should start, inclusive.
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
      255,
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

  /// Retrieves an existing Amplify App by appId.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  Future<GetAppResult> getApp({
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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

  /// Retrieves artifact info that corresponds to a artifactId.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [artifactId] :
  /// Unique Id for a artifact.
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

  /// Retrieves a backend environment for an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [environmentName] :
  /// Name for the backend environment.
  Future<GetBackendEnvironmentResult> getBackendEnvironment({
    @_s.required String appId,
    @_s.required String environmentName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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

  /// Retrieves a branch for an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch.
  Future<GetBranchResult> getBranch({
    @_s.required String appId,
    @_s.required String branchName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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

  /// Retrieves domain info that corresponds to an appId and domainName.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [domainName] :
  /// Name of the domain.
  Future<GetDomainAssociationResult> getDomainAssociation({
    @_s.required String appId,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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

  /// Get a job for a branch, part of an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch, for the Job.
  ///
  /// Parameter [jobId] :
  /// Unique Id for the Job.
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
      255,
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

  /// Retrieves webhook info that corresponds to a webhookId.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [webhookId] :
  /// Unique Id for a webhook.
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

  /// Lists existing Amplify Apps.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. If non-null pagination token is returned in a result,
  /// then pass its value in another request to fetch more entries.
  Future<ListAppsResult> listApps({
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

  /// List artifacts with an app, a branch, a job and an artifact type.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for a branch, part of an Amplify App.
  ///
  /// Parameter [jobId] :
  /// Unique Id for an Job.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. Set to null to start listing artifacts from start. If
  /// non-null pagination token is returned in a result, then pass its value in
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
      255,
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
      1,
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

  /// Lists backend environments for an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an amplify App.
  ///
  /// Parameter [environmentName] :
  /// Name of the backend environment
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. Set to null to start listing backen environments from
  /// start. If a non-null pagination token is returned in a result, then pass
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
      255,
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
      1,
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
      requestUri: '/apps/${Uri.encodeComponent(appId)}/backendenvironments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackendEnvironmentsResult.fromJson(response);
  }

  /// Lists branches for an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. Set to null to start listing branches from start. If a
  /// non-null pagination token is returned in a result, then pass its value in
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
      255,
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

  /// List domains with an app
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. Set to null to start listing Apps from start. If
  /// non-null pagination token is returned in a result, then pass its value in
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
      255,
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

  /// List Jobs for a branch, part of an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for a branch.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. Set to null to start listing steps from start. If a
  /// non-null pagination token is returned in a result, then pass its value in
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
      255,
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
      1,
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

  /// List tags for resource.
  ///
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// Resource arn used to list tags.
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

  /// List webhooks with an app.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. Set to null to start listing webhooks from start. If
  /// non-null pagination token is returned in a result, then pass its value in
  /// here to list more webhooks.
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
      255,
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

  /// Start a deployment for manual deploy apps. (Apps are not connected to
  /// repository)
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch, for the Job.
  ///
  /// Parameter [jobId] :
  /// The job id for this deployment, generated by create deployment request.
  ///
  /// Parameter [sourceUrl] :
  /// The sourceUrl for this deployment, used when calling start deployment
  /// without create deployment. SourceUrl can be any HTTP GET url that is
  /// public accessible and downloads a single zip.
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
      255,
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

  /// Starts a new job for a branch, part of an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch, for the Job.
  ///
  /// Parameter [jobType] :
  /// Type for the Job. Available JobTypes are: \n "RELEASE": Start a new job
  /// with the latest change from the specified branch. Only available for apps
  /// that have connected to a repository. "RETRY": Retry an existing job. JobId
  /// is required for this type of job.
  ///
  /// Parameter [commitId] :
  /// Commit Id from 3rd party repository provider for the Job.
  ///
  /// Parameter [commitMessage] :
  /// Commit message from 3rd party repository provider for the Job.
  ///
  /// Parameter [commitTime] :
  /// Commit date / time for the Job.
  ///
  /// Parameter [jobId] :
  /// Unique Id for an existing job. Required for "RETRY" JobType.
  ///
  /// Parameter [jobReason] :
  /// Descriptive reason for starting this job.
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
      255,
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

  /// Stop a job that is in progress, for an Amplify branch, part of Amplify
  /// App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch, for the Job.
  ///
  /// Parameter [jobId] :
  /// Unique Id for the Job.
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
      255,
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

  /// Tag resource with tag key and value.
  ///
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// Resource arn used to tag resource.
  ///
  /// Parameter [tags] :
  /// Tags used to tag resource.
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

  /// Untag resource with resourceArn.
  ///
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// Resource arn used to untag resource.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys used to untag resource.
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

  /// Updates an existing Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [accessToken] :
  /// Personal Access token for 3rd party source control system for an Amplify
  /// App, used to create webhook and read-only deploy key. Token is not stored.
  ///
  /// Parameter [autoBranchCreationConfig] :
  /// Automated branch creation branchConfig for the Amplify App.
  ///
  /// Parameter [autoBranchCreationPatterns] :
  /// Automated branch creation glob patterns for the Amplify App.
  ///
  /// Parameter [basicAuthCredentials] :
  /// Basic Authorization credentials for an Amplify App.
  ///
  /// Parameter [buildSpec] :
  /// BuildSpec for an Amplify App.
  ///
  /// Parameter [customRules] :
  /// Custom redirect / rewrite rules for an Amplify App.
  ///
  /// Parameter [description] :
  /// Description for an Amplify App.
  ///
  /// Parameter [enableAutoBranchCreation] :
  /// Enables automated branch creation for the Amplify App.
  ///
  /// Parameter [enableBasicAuth] :
  /// Enables Basic Authorization for an Amplify App.
  ///
  /// Parameter [enableBranchAutoBuild] :
  /// Enables branch auto-building for an Amplify App.
  ///
  /// Parameter [environmentVariables] :
  /// Environment Variables for an Amplify App.
  ///
  /// Parameter [iamServiceRoleArn] :
  /// IAM service role for an Amplify App.
  ///
  /// Parameter [name] :
  /// Name for an Amplify App.
  ///
  /// Parameter [oauthToken] :
  /// OAuth token for 3rd party source control system for an Amplify App, used
  /// to create webhook and read-only deploy key. OAuth token is not stored.
  ///
  /// Parameter [platform] :
  /// Platform for an Amplify App.
  ///
  /// Parameter [repository] :
  /// Repository for an Amplify App
  Future<UpdateAppResult> updateApp({
    @_s.required String appId,
    String accessToken,
    AutoBranchCreationConfig autoBranchCreationConfig,
    List<String> autoBranchCreationPatterns,
    String basicAuthCredentials,
    String buildSpec,
    List<CustomRule> customRules,
    String description,
    bool enableAutoBranchCreation,
    bool enableBasicAuth,
    bool enableBranchAutoBuild,
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
      100,
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
      if (customRules != null) 'customRules': customRules,
      if (description != null) 'description': description,
      if (enableAutoBranchCreation != null)
        'enableAutoBranchCreation': enableAutoBranchCreation,
      if (enableBasicAuth != null) 'enableBasicAuth': enableBasicAuth,
      if (enableBranchAutoBuild != null)
        'enableBranchAutoBuild': enableBranchAutoBuild,
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

  /// Updates a branch for an Amplify App.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [branchName] :
  /// Name for the branch.
  ///
  /// Parameter [backendEnvironmentArn] :
  /// ARN for a Backend Environment, part of an Amplify App.
  ///
  /// Parameter [basicAuthCredentials] :
  /// Basic Authorization credentials for the branch.
  ///
  /// Parameter [buildSpec] :
  /// BuildSpec for the branch.
  ///
  /// Parameter [description] :
  /// Description for the branch.
  ///
  /// Parameter [displayName] :
  /// Display name for a branch, will use as the default domain prefix.
  ///
  /// Parameter [enableAutoBuild] :
  /// Enables auto building for the branch.
  ///
  /// Parameter [enableBasicAuth] :
  /// Enables Basic Auth for the branch.
  ///
  /// Parameter [enableNotification] :
  /// Enables notifications for the branch.
  ///
  /// Parameter [enablePullRequestPreview] :
  /// Enables Pull Request Preview for this branch.
  ///
  /// Parameter [environmentVariables] :
  /// Environment Variables for the branch.
  ///
  /// Parameter [framework] :
  /// Framework for the branch.
  ///
  /// Parameter [pullRequestEnvironmentName] :
  /// The Amplify Environment name for the pull request.
  ///
  /// Parameter [stage] :
  /// Stage for the branch.
  ///
  /// Parameter [ttl] :
  /// The content TTL for the website in seconds.
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
      255,
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

  /// Create a new DomainAssociation on an App
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [appId] :
  /// Unique Id for an Amplify App.
  ///
  /// Parameter [domainName] :
  /// Name of the domain.
  ///
  /// Parameter [subDomainSettings] :
  /// Setting structure for the Subdomain.
  ///
  /// Parameter [enableAutoSubDomain] :
  /// Enables automated creation of Subdomains for branches. (Currently not
  /// supported)
  Future<UpdateDomainAssociationResult> updateDomainAssociation({
    @_s.required String appId,
    @_s.required String domainName,
    @_s.required List<SubDomainSetting> subDomainSettings,
    bool enableAutoSubDomain,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      1,
      255,
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
    final $payload = <String, dynamic>{
      'subDomainSettings': subDomainSettings,
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

  /// Update a webhook.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [DependentServiceFailureException].
  ///
  /// Parameter [webhookId] :
  /// Unique Id for a webhook.
  ///
  /// Parameter [branchName] :
  /// Name for a branch, part of an Amplify App.
  ///
  /// Parameter [description] :
  /// Description for a webhook.
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

/// Amplify App represents different branches of a repository for building,
/// deploying, and hosting.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class App {
  /// ARN for the Amplify App.
  @_s.JsonKey(name: 'appArn')
  final String appArn;

  /// Unique Id for the Amplify App.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// Create date / time for the Amplify App.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// Default domain for the Amplify App.
  @_s.JsonKey(name: 'defaultDomain')
  final String defaultDomain;

  /// Description for the Amplify App.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Enables Basic Authorization for branches for the Amplify App.
  @_s.JsonKey(name: 'enableBasicAuth')
  final bool enableBasicAuth;

  /// Enables auto-building of branches for the Amplify App.
  @_s.JsonKey(name: 'enableBranchAutoBuild')
  final bool enableBranchAutoBuild;

  /// Environment Variables for the Amplify App.
  @_s.JsonKey(name: 'environmentVariables')
  final Map<String, String> environmentVariables;

  /// Name for the Amplify App.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Platform for the Amplify App.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// Repository for the Amplify App.
  @_s.JsonKey(name: 'repository')
  final String repository;

  /// Update date / time for the Amplify App.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updateTime')
  final DateTime updateTime;

  /// Automated branch creation config for the Amplify App.
  @_s.JsonKey(name: 'autoBranchCreationConfig')
  final AutoBranchCreationConfig autoBranchCreationConfig;

  /// Automated branch creation glob patterns for the Amplify App.
  @_s.JsonKey(name: 'autoBranchCreationPatterns')
  final List<String> autoBranchCreationPatterns;

  /// Basic Authorization credentials for branches for the Amplify App.
  @_s.JsonKey(name: 'basicAuthCredentials')
  final String basicAuthCredentials;

  /// BuildSpec content for Amplify App.
  @_s.JsonKey(name: 'buildSpec')
  final String buildSpec;

  /// Custom redirect / rewrite rules for the Amplify App.
  @_s.JsonKey(name: 'customRules')
  final List<CustomRule> customRules;

  /// Enables automated branch creation for the Amplify App.
  @_s.JsonKey(name: 'enableAutoBranchCreation')
  final bool enableAutoBranchCreation;

  /// IAM service role ARN for the Amplify App.
  @_s.JsonKey(name: 'iamServiceRoleArn')
  final String iamServiceRoleArn;

  /// Structure with Production Branch information.
  @_s.JsonKey(name: 'productionBranch')
  final ProductionBranch productionBranch;

  /// Tag for Amplify App.
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
    this.customRules,
    this.enableAutoBranchCreation,
    this.iamServiceRoleArn,
    this.productionBranch,
    this.tags,
  });
  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
}

/// Structure for artifact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Artifact {
  /// File name for the artifact.
  @_s.JsonKey(name: 'artifactFileName')
  final String artifactFileName;

  /// Unique Id for a artifact.
  @_s.JsonKey(name: 'artifactId')
  final String artifactId;

  Artifact({
    @_s.required this.artifactFileName,
    @_s.required this.artifactId,
  });
  factory Artifact.fromJson(Map<String, dynamic> json) =>
      _$ArtifactFromJson(json);
}

/// Structure with auto branch creation config.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoBranchCreationConfig {
  /// Basic Authorization credentials for the auto created branch.
  @_s.JsonKey(name: 'basicAuthCredentials')
  final String basicAuthCredentials;

  /// BuildSpec for the auto created branch.
  @_s.JsonKey(name: 'buildSpec')
  final String buildSpec;

  /// Enables auto building for the auto created branch.
  @_s.JsonKey(name: 'enableAutoBuild')
  final bool enableAutoBuild;

  /// Enables Basic Auth for the auto created branch.
  @_s.JsonKey(name: 'enableBasicAuth')
  final bool enableBasicAuth;

  /// Enables Pull Request Preview for auto created branch.
  @_s.JsonKey(name: 'enablePullRequestPreview')
  final bool enablePullRequestPreview;

  /// Environment Variables for the auto created branch.
  @_s.JsonKey(name: 'environmentVariables')
  final Map<String, String> environmentVariables;

  /// Framework for the auto created branch.
  @_s.JsonKey(name: 'framework')
  final String framework;

  /// The Amplify Environment name for the pull request.
  @_s.JsonKey(name: 'pullRequestEnvironmentName')
  final String pullRequestEnvironmentName;

  /// Stage for the auto created branch.
  @_s.JsonKey(name: 'stage')
  final Stage stage;

  AutoBranchCreationConfig({
    this.basicAuthCredentials,
    this.buildSpec,
    this.enableAutoBuild,
    this.enableBasicAuth,
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

/// Backend environment for an Amplify App.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackendEnvironment {
  /// Arn for a backend environment, part of an Amplify App.
  @_s.JsonKey(name: 'backendEnvironmentArn')
  final String backendEnvironmentArn;

  /// Creation date and time for a backend environment, part of an Amplify App.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// Name for a backend environment, part of an Amplify App.
  @_s.JsonKey(name: 'environmentName')
  final String environmentName;

  /// Last updated date and time for a backend environment, part of an Amplify
  /// App.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updateTime')
  final DateTime updateTime;

  /// Name of deployment artifacts.
  @_s.JsonKey(name: 'deploymentArtifacts')
  final String deploymentArtifacts;

  /// CloudFormation stack name of backend environment.
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

/// Branch for an Amplify App, which maps to a 3rd party repository branch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Branch {
  /// Id of the active job for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'activeJobId')
  final String activeJobId;

  /// ARN for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'branchArn')
  final String branchArn;

  /// Name for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'branchName')
  final String branchName;

  /// Creation date and time for a branch, part of an Amplify App.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// Custom domains for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'customDomains')
  final List<String> customDomains;

  /// Description for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Display name for a branch, will use as the default domain prefix.
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// Enables auto-building on push for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'enableAutoBuild')
  final bool enableAutoBuild;

  /// Enables Basic Authorization for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'enableBasicAuth')
  final bool enableBasicAuth;

  /// Enables notifications for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'enableNotification')
  final bool enableNotification;

  /// Enables Pull Request Preview for this branch.
  @_s.JsonKey(name: 'enablePullRequestPreview')
  final bool enablePullRequestPreview;

  /// Environment Variables specific to a branch, part of an Amplify App.
  @_s.JsonKey(name: 'environmentVariables')
  final Map<String, String> environmentVariables;

  /// Framework for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'framework')
  final String framework;

  /// Stage for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'stage')
  final Stage stage;

  /// Total number of Jobs part of an Amplify App.
  @_s.JsonKey(name: 'totalNumberOfJobs')
  final String totalNumberOfJobs;

  /// The content TTL for the website in seconds.
  @_s.JsonKey(name: 'ttl')
  final String ttl;

  /// Last updated date and time for a branch, part of an Amplify App.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updateTime')
  final DateTime updateTime;

  /// List of custom resources that are linked to this branch.
  @_s.JsonKey(name: 'associatedResources')
  final List<String> associatedResources;

  /// ARN for a Backend Environment, part of an Amplify App.
  @_s.JsonKey(name: 'backendEnvironmentArn')
  final String backendEnvironmentArn;

  /// Basic Authorization credentials for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'basicAuthCredentials')
  final String basicAuthCredentials;

  /// BuildSpec content for branch for Amplify App.
  @_s.JsonKey(name: 'buildSpec')
  final String buildSpec;

  /// The destination branch if the branch is a pull request branch.
  @_s.JsonKey(name: 'destinationBranch')
  final String destinationBranch;

  /// The Amplify Environment name for the pull request.
  @_s.JsonKey(name: 'pullRequestEnvironmentName')
  final String pullRequestEnvironmentName;

  /// The source branch if the branch is a pull request branch.
  @_s.JsonKey(name: 'sourceBranch')
  final String sourceBranch;

  /// Tag for branch for Amplify App.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Thumbnail URL for the branch.
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

/// Result structure for create backend environment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackendEnvironmentResult {
  /// Backend environment structure for an amplify App.
  @_s.JsonKey(name: 'backendEnvironment')
  final BackendEnvironment backendEnvironment;

  CreateBackendEnvironmentResult({
    @_s.required this.backendEnvironment,
  });
  factory CreateBackendEnvironmentResult.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendEnvironmentResultFromJson(json);
}

/// Result structure for create branch request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBranchResult {
  /// Branch structure for an Amplify App.
  @_s.JsonKey(name: 'branch')
  final Branch branch;

  CreateBranchResult({
    @_s.required this.branch,
  });
  factory CreateBranchResult.fromJson(Map<String, dynamic> json) =>
      _$CreateBranchResultFromJson(json);
}

/// Result structure for create a new deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentResult {
  /// When the fileMap argument is provided in the request, the fileUploadUrls
  /// will contain a map of file names to upload url.
  @_s.JsonKey(name: 'fileUploadUrls')
  final Map<String, String> fileUploadUrls;

  /// When the fileMap argument is NOT provided. This zipUploadUrl will be
  /// returned.
  @_s.JsonKey(name: 'zipUploadUrl')
  final String zipUploadUrl;

  /// The jobId for this deployment, will supply to start deployment api.
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

/// Result structure for the create Domain Association request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDomainAssociationResult {
  /// Domain Association structure.
  @_s.JsonKey(name: 'domainAssociation')
  final DomainAssociation domainAssociation;

  CreateDomainAssociationResult({
    @_s.required this.domainAssociation,
  });
  factory CreateDomainAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDomainAssociationResultFromJson(json);
}

/// Result structure for the create webhook request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWebhookResult {
  /// Webhook structure.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  CreateWebhookResult({
    @_s.required this.webhook,
  });
  factory CreateWebhookResult.fromJson(Map<String, dynamic> json) =>
      _$CreateWebhookResultFromJson(json);
}

/// Custom rewrite / redirect rule.
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

  /// The condition for a URL rewrite or redirect rule, e.g. country code.
  @_s.JsonKey(name: 'condition')
  final String condition;

  /// The status code for a URL rewrite or redirect rule.
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

/// Result structure for an Amplify App delete request.
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

/// Result structure of a delete backend environment result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBackendEnvironmentResult {
  /// Backend environment structure for an Amplify App.
  @_s.JsonKey(name: 'backendEnvironment')
  final BackendEnvironment backendEnvironment;

  DeleteBackendEnvironmentResult({
    @_s.required this.backendEnvironment,
  });
  factory DeleteBackendEnvironmentResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackendEnvironmentResultFromJson(json);
}

/// Result structure for delete branch request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBranchResult {
  /// Branch structure for an Amplify App.
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

/// Result structure for the delete job request.
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

/// Result structure for the delete webhook request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWebhookResult {
  /// Webhook structure.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  DeleteWebhookResult({
    @_s.required this.webhook,
  });
  factory DeleteWebhookResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteWebhookResultFromJson(json);
}

/// Structure for Domain Association, which associates a custom domain with an
/// Amplify App.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainAssociation {
  /// ARN for the Domain Association.
  @_s.JsonKey(name: 'domainAssociationArn')
  final String domainAssociationArn;

  /// Name of the domain.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// Status fo the Domain Association.
  @_s.JsonKey(name: 'domainStatus')
  final DomainStatus domainStatus;

  /// Enables automated creation of Subdomains for branches. (Currently not
  /// supported)
  @_s.JsonKey(name: 'enableAutoSubDomain')
  final bool enableAutoSubDomain;

  /// Reason for the current status of the Domain Association.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// Subdomains for the Domain Association.
  @_s.JsonKey(name: 'subDomains')
  final List<SubDomain> subDomains;

  /// DNS Record for certificate verification.
  @_s.JsonKey(name: 'certificateVerificationDNSRecord')
  final String certificateVerificationDNSRecord;

  DomainAssociation({
    @_s.required this.domainAssociationArn,
    @_s.required this.domainName,
    @_s.required this.domainStatus,
    @_s.required this.enableAutoSubDomain,
    @_s.required this.statusReason,
    @_s.required this.subDomains,
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

/// Result structure for the generate access logs request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateAccessLogsResult {
  /// Pre-signed URL for the requested access logs.
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

/// Result structure for the get artifact request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetArtifactUrlResult {
  /// Unique Id for a artifact.
  @_s.JsonKey(name: 'artifactId')
  final String artifactId;

  /// Presigned url for the artifact.
  @_s.JsonKey(name: 'artifactUrl')
  final String artifactUrl;

  GetArtifactUrlResult({
    @_s.required this.artifactId,
    @_s.required this.artifactUrl,
  });
  factory GetArtifactUrlResult.fromJson(Map<String, dynamic> json) =>
      _$GetArtifactUrlResultFromJson(json);
}

/// Result structure for get backend environment result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackendEnvironmentResult {
  /// Backend environment structure for an an Amplify App.
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

/// Result structure for the get Domain Association request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainAssociationResult {
  /// Domain Association structure.
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

/// Result structure for the get webhook request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWebhookResult {
  /// Webhook structure.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  GetWebhookResult({
    @_s.required this.webhook,
  });
  factory GetWebhookResult.fromJson(Map<String, dynamic> json) =>
      _$GetWebhookResultFromJson(json);
}

/// Structure for an execution job for an Amplify App.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Job {
  /// Execution steps for an execution job, for an Amplify App.
  @_s.JsonKey(name: 'steps')
  final List<Step> steps;

  /// Summary for an execution job for an Amplify App.
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

/// Structure for the summary of a Job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobSummary {
  /// Commit Id from 3rd party repository provider for the Job.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// Commit message from 3rd party repository provider for the Job.
  @_s.JsonKey(name: 'commitMessage')
  final String commitMessage;

  /// Commit date / time for the Job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'commitTime')
  final DateTime commitTime;

  /// Arn for the Job.
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// Unique Id for the Job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// Type for the Job. \n "RELEASE": Manually released from source by using
  /// StartJob API. "RETRY": Manually retried by using StartJob API. "WEB_HOOK":
  /// Automatically triggered by WebHooks.
  @_s.JsonKey(name: 'jobType')
  final JobType jobType;

  /// Start date / time for the Job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// Status for the Job.
  @_s.JsonKey(name: 'status')
  final JobStatus status;

  /// End date / time for the Job.
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

/// Result structure for an Amplify App list request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAppsResult {
  /// List of Amplify Apps.
  @_s.JsonKey(name: 'apps')
  final List<App> apps;

  /// Pagination token. Set to null to start listing Apps from start. If non-null
  /// pagination token is returned in a result, then pass its value in here to
  /// list more projects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAppsResult({
    @_s.required this.apps,
    this.nextToken,
  });
  factory ListAppsResult.fromJson(Map<String, dynamic> json) =>
      _$ListAppsResultFromJson(json);
}

/// Result structure for the list artifacts request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListArtifactsResult {
  /// List of artifacts.
  @_s.JsonKey(name: 'artifacts')
  final List<Artifact> artifacts;

  /// Pagination token. If non-null pagination token is returned in a result, then
  /// pass its value in another request to fetch more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListArtifactsResult({
    @_s.required this.artifacts,
    this.nextToken,
  });
  factory ListArtifactsResult.fromJson(Map<String, dynamic> json) =>
      _$ListArtifactsResultFromJson(json);
}

/// Result structure for list backend environments result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackendEnvironmentsResult {
  /// List of backend environments for an Amplify App.
  @_s.JsonKey(name: 'backendEnvironments')
  final List<BackendEnvironment> backendEnvironments;

  /// Pagination token. If non-null pagination token is returned in a result, then
  /// pass its value in another request to fetch more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBackendEnvironmentsResult({
    @_s.required this.backendEnvironments,
    this.nextToken,
  });
  factory ListBackendEnvironmentsResult.fromJson(Map<String, dynamic> json) =>
      _$ListBackendEnvironmentsResultFromJson(json);
}

/// Result structure for list branches request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBranchesResult {
  /// List of branches for an Amplify App.
  @_s.JsonKey(name: 'branches')
  final List<Branch> branches;

  /// Pagination token. If non-null pagination token is returned in a result, then
  /// pass its value in another request to fetch more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBranchesResult({
    @_s.required this.branches,
    this.nextToken,
  });
  factory ListBranchesResult.fromJson(Map<String, dynamic> json) =>
      _$ListBranchesResultFromJson(json);
}

/// Result structure for the list Domain Association request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainAssociationsResult {
  /// List of Domain Associations.
  @_s.JsonKey(name: 'domainAssociations')
  final List<DomainAssociation> domainAssociations;

  /// Pagination token. If non-null pagination token is returned in a result, then
  /// pass its value in another request to fetch more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDomainAssociationsResult({
    @_s.required this.domainAssociations,
    this.nextToken,
  });
  factory ListDomainAssociationsResult.fromJson(Map<String, dynamic> json) =>
      _$ListDomainAssociationsResultFromJson(json);
}

/// Maximum number of records to list in a single response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResult {
  /// Result structure for list job result request.
  @_s.JsonKey(name: 'jobSummaries')
  final List<JobSummary> jobSummaries;

  /// Pagination token. If non-null pagination token is returned in a result, then
  /// pass its value in another request to fetch more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobsResult({
    @_s.required this.jobSummaries,
    this.nextToken,
  });
  factory ListJobsResult.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResultFromJson(json);
}

/// Response for list tags.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Tags result for response.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Result structure for the list webhooks request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWebhooksResult {
  /// List of webhooks.
  @_s.JsonKey(name: 'webhooks')
  final List<Webhook> webhooks;

  /// Pagination token. If non-null pagination token is returned in a result, then
  /// pass its value in another request to fetch more entries.
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

/// Structure with Production Branch information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProductionBranch {
  /// Branch Name for Production Branch.
  @_s.JsonKey(name: 'branchName')
  final String branchName;

  /// Last Deploy Time of Production Branch.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastDeployTime')
  final DateTime lastDeployTime;

  /// Status of Production Branch.
  @_s.JsonKey(name: 'status')
  final String status;

  /// Thumbnail URL for Production Branch.
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

/// Result structure for start a deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartDeploymentResult {
  /// Summary for the Job.
  @_s.JsonKey(name: 'jobSummary')
  final JobSummary jobSummary;

  StartDeploymentResult({
    @_s.required this.jobSummary,
  });
  factory StartDeploymentResult.fromJson(Map<String, dynamic> json) =>
      _$StartDeploymentResultFromJson(json);
}

/// Result structure for run job request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartJobResult {
  /// Summary for the Job.
  @_s.JsonKey(name: 'jobSummary')
  final JobSummary jobSummary;

  StartJobResult({
    @_s.required this.jobSummary,
  });
  factory StartJobResult.fromJson(Map<String, dynamic> json) =>
      _$StartJobResultFromJson(json);
}

/// Structure for an execution step for an execution job, for an Amplify App.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Step {
  /// End date/ time of the execution step.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// Start date/ time of the execution step.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// Status of the execution step.
  @_s.JsonKey(name: 'status')
  final JobStatus status;

  /// Name of the execution step.
  @_s.JsonKey(name: 'stepName')
  final String stepName;

  /// URL to the artifact for the execution step.
  @_s.JsonKey(name: 'artifactsUrl')
  final String artifactsUrl;

  /// The context for current step, will include build image if step is build.
  @_s.JsonKey(name: 'context')
  final String context;

  /// URL to the logs for the execution step.
  @_s.JsonKey(name: 'logUrl')
  final String logUrl;

  /// List of screenshot URLs for the execution step, if relevant.
  @_s.JsonKey(name: 'screenshots')
  final Map<String, String> screenshots;

  /// The reason for current step status.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// URL to the test artifact for the execution step.
  @_s.JsonKey(name: 'testArtifactsUrl')
  final String testArtifactsUrl;

  /// URL to the test config for the execution step.
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

/// Result structure for the stop job request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopJobResult {
  /// Summary for the Job.
  @_s.JsonKey(name: 'jobSummary')
  final JobSummary jobSummary;

  StopJobResult({
    @_s.required this.jobSummary,
  });
  factory StopJobResult.fromJson(Map<String, dynamic> json) =>
      _$StopJobResultFromJson(json);
}

/// Subdomain for the Domain Association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubDomain {
  /// DNS record for the Subdomain.
  @_s.JsonKey(name: 'dnsRecord')
  final String dnsRecord;

  /// Setting structure for the Subdomain.
  @_s.JsonKey(name: 'subDomainSetting')
  final SubDomainSetting subDomainSetting;

  /// Verified status of the Subdomain
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

/// Setting for the Subdomain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SubDomainSetting {
  /// Branch name setting for the Subdomain.
  @_s.JsonKey(name: 'branchName')
  final String branchName;

  /// Prefix setting for the Subdomain.
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

/// Response for tag resource.
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

/// Response for untag resource.
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

/// Result structure for an Amplify App update request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAppResult {
  /// App structure for the updated App.
  @_s.JsonKey(name: 'app')
  final App app;

  UpdateAppResult({
    @_s.required this.app,
  });
  factory UpdateAppResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateAppResultFromJson(json);
}

/// Result structure for update branch request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBranchResult {
  /// Branch structure for an Amplify App.
  @_s.JsonKey(name: 'branch')
  final Branch branch;

  UpdateBranchResult({
    @_s.required this.branch,
  });
  factory UpdateBranchResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateBranchResultFromJson(json);
}

/// Result structure for the update Domain Association request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainAssociationResult {
  /// Domain Association structure.
  @_s.JsonKey(name: 'domainAssociation')
  final DomainAssociation domainAssociation;

  UpdateDomainAssociationResult({
    @_s.required this.domainAssociation,
  });
  factory UpdateDomainAssociationResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainAssociationResultFromJson(json);
}

/// Result structure for the update webhook request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWebhookResult {
  /// Webhook structure.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  UpdateWebhookResult({
    @_s.required this.webhook,
  });
  factory UpdateWebhookResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateWebhookResultFromJson(json);
}

/// Structure for webhook, which associates a webhook with an Amplify App.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Webhook {
  /// Name for a branch, part of an Amplify App.
  @_s.JsonKey(name: 'branchName')
  final String branchName;

  /// Create date / time for a webhook.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// Description for a webhook.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Update date / time for a webhook.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updateTime')
  final DateTime updateTime;

  /// ARN for the webhook.
  @_s.JsonKey(name: 'webhookArn')
  final String webhookArn;

  /// Id of the webhook.
  @_s.JsonKey(name: 'webhookId')
  final String webhookId;

  /// Url of the webhook.
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
