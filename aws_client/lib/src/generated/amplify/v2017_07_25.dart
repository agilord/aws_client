// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2017_07_25.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amplify enables developers to develop and deploy cloud-powered mobile and
/// web apps. Amplify Hosting provides a continuous delivery and hosting service
/// for web applications. For more information, see the <a
/// href="https://docs.aws.amazon.com/amplify/latest/userguide/welcome.html">Amplify
/// Hosting User Guide</a>. The Amplify Framework is a comprehensive set of
/// SDKs, libraries, tools, and documentation for client app development. For
/// more information, see the <a href="https://docs.amplify.aws/">Amplify
/// Framework.</a>
class Amplify {
  final _s.RestJsonProtocol _protocol;
  factory Amplify({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'amplify',
    );
    return Amplify._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Amplify._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates a new Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [name] :
  /// The name of the Amplify app.
  ///
  /// Parameter [accessToken] :
  /// The personal access token for a GitHub repository for an Amplify app. The
  /// personal access token is used to authorize access to a GitHub repository
  /// using the Amplify GitHub App. The token is not stored.
  ///
  /// Use <code>accessToken</code> for GitHub repositories only. To authorize
  /// access to a repository provider such as Bitbucket or CodeCommit, use
  /// <code>oauthToken</code>.
  ///
  /// You must specify either <code>accessToken</code> or
  /// <code>oauthToken</code> when you create a new app.
  ///
  /// Existing Amplify apps deployed from a GitHub repository using OAuth
  /// continue to work with CI/CD. However, we strongly recommend that you
  /// migrate these apps to use the GitHub App. For more information, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/setting-up-GitHub-access.html#migrating-to-github-app-auth">Migrating
  /// an existing OAuth app to the Amplify GitHub App</a> in the <i>Amplify User
  /// Guide</i> .
  ///
  /// Parameter [autoBranchCreationConfig] :
  /// The automated branch creation configuration for an Amplify app.
  ///
  /// Parameter [autoBranchCreationPatterns] :
  /// The automated branch creation glob patterns for an Amplify app.
  ///
  /// Parameter [basicAuthCredentials] :
  /// The credentials for basic authorization for an Amplify app. You must
  /// base64-encode the authorization credentials and provide them in the format
  /// <code>user:password</code>.
  ///
  /// Parameter [buildSpec] :
  /// The build specification (build spec) for an Amplify app.
  ///
  /// Parameter [cacheConfig] :
  /// The cache configuration for the Amplify app.
  ///
  /// Parameter [computeRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to assign to an SSR app.
  /// The SSR Compute role allows the Amplify Hosting compute service to
  /// securely access specific Amazon Web Services resources based on the role's
  /// permissions. For more information about the SSR Compute role, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/amplify-SSR-compute-role.html">Adding
  /// an SSR Compute role</a> in the <i>Amplify User Guide</i>.
  ///
  /// Parameter [customHeaders] :
  /// The custom HTTP headers for an Amplify app.
  ///
  /// Parameter [customRules] :
  /// The custom rewrite and redirect rules for an Amplify app.
  ///
  /// Parameter [description] :
  /// The description of the Amplify app.
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
  /// Automatically disconnects a branch in the Amplify console when you delete
  /// a branch from your Git repository.
  ///
  /// Parameter [environmentVariables] :
  /// The environment variables map for an Amplify app.
  ///
  /// For a list of the environment variables that are accessible to Amplify by
  /// default, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/amplify-console-environment-variables.html">Amplify
  /// Environment variables</a> in the <i>Amplify Hosting User Guide</i>.
  ///
  /// Parameter [iamServiceRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role for the Amplify
  /// app.
  ///
  /// Parameter [jobConfig] :
  /// Describes the configuration details that apply to the jobs for an Amplify
  /// app.
  ///
  /// Parameter [oauthToken] :
  /// The OAuth token for a third-party source control system for an Amplify
  /// app. The OAuth token is used to create a webhook and a read-only deploy
  /// key using SSH cloning. The OAuth token is not stored.
  ///
  /// Use <code>oauthToken</code> for repository providers other than GitHub,
  /// such as Bitbucket or CodeCommit. To authorize access to GitHub as your
  /// repository provider, use <code>accessToken</code>.
  ///
  /// You must specify either <code>oauthToken</code> or
  /// <code>accessToken</code> when you create a new app.
  ///
  /// Existing Amplify apps deployed from a GitHub repository using OAuth
  /// continue to work with CI/CD. However, we strongly recommend that you
  /// migrate these apps to use the GitHub App. For more information, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/setting-up-GitHub-access.html#migrating-to-github-app-auth">Migrating
  /// an existing OAuth app to the Amplify GitHub App</a> in the <i>Amplify User
  /// Guide</i> .
  ///
  /// Parameter [platform] :
  /// The platform for the Amplify app. For a static app, set the platform type
  /// to <code>WEB</code>. For a dynamic server-side rendered (SSR) app, set the
  /// platform type to <code>WEB_COMPUTE</code>. For an app requiring Amplify
  /// Hosting's original SSR support only, set the platform type to
  /// <code>WEB_DYNAMIC</code>.
  ///
  /// If you are deploying an SSG only app with Next.js version 14 or later, you
  /// must set the platform type to <code>WEB_COMPUTE</code> and set the
  /// artifacts <code>baseDirectory</code> to <code>.next</code> in the
  /// application's build settings. For an example of the build specification
  /// settings, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/deploy-nextjs-app.html#build-setting-detection-ssg-14">Amplify
  /// build settings for a Next.js 14 SSG application</a> in the <i>Amplify
  /// Hosting User Guide</i>.
  ///
  /// Parameter [repository] :
  /// The Git repository for the Amplify app.
  ///
  /// Parameter [tags] :
  /// The tag for an Amplify app.
  Future<CreateAppResult> createApp({
    required String name,
    String? accessToken,
    AutoBranchCreationConfig? autoBranchCreationConfig,
    List<String>? autoBranchCreationPatterns,
    String? basicAuthCredentials,
    String? buildSpec,
    CacheConfig? cacheConfig,
    String? computeRoleArn,
    String? customHeaders,
    List<CustomRule>? customRules,
    String? description,
    bool? enableAutoBranchCreation,
    bool? enableBasicAuth,
    bool? enableBranchAutoBuild,
    bool? enableBranchAutoDeletion,
    Map<String, String>? environmentVariables,
    String? iamServiceRoleArn,
    JobConfig? jobConfig,
    String? oauthToken,
    Platform? platform,
    String? repository,
    Map<String, String>? tags,
  }) async {
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
      if (cacheConfig != null) 'cacheConfig': cacheConfig,
      if (computeRoleArn != null) 'computeRoleArn': computeRoleArn,
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
      if (jobConfig != null) 'jobConfig': jobConfig,
      if (oauthToken != null) 'oauthToken': oauthToken,
      if (platform != null) 'platform': platform.value,
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
  /// This API is available only to Amplify Gen 1 applications where the backend
  /// is created using Amplify Studio or the Amplify command line interface
  /// (CLI). This API isn’t available to Amplify Gen 2 applications. When you
  /// deploy an application with Amplify Gen 2, you provision the app's backend
  /// infrastructure using Typescript code.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
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
    required String appId,
    required String environmentName,
    String? deploymentArtifacts,
    String? stackName,
  }) async {
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
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name for the branch.
  ///
  /// Parameter [backend] :
  /// The backend for a <code>Branch</code> of an Amplify app. Use for a backend
  /// created from an CloudFormation stack.
  ///
  /// This field is available to Amplify Gen 2 apps only. When you deploy an
  /// application with Amplify Gen 2, you provision the app's backend
  /// infrastructure using Typescript code.
  ///
  /// Parameter [backendEnvironmentArn] :
  /// The Amazon Resource Name (ARN) for a backend environment that is part of a
  /// Gen 1 Amplify app.
  ///
  /// This field is available to Amplify Gen 1 apps only where the backend is
  /// created using Amplify Studio or the Amplify command line interface (CLI).
  ///
  /// Parameter [basicAuthCredentials] :
  /// The basic authorization credentials for the branch. You must base64-encode
  /// the authorization credentials and provide them in the format
  /// <code>user:password</code>.
  ///
  /// Parameter [buildSpec] :
  /// The build specification (build spec) for the branch.
  ///
  /// Parameter [computeRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to assign to a branch of an
  /// SSR app. The SSR Compute role allows the Amplify Hosting compute service
  /// to securely access specific Amazon Web Services resources based on the
  /// role's permissions. For more information about the SSR Compute role, see
  /// <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/amplify-SSR-compute-role.html">Adding
  /// an SSR Compute role</a> in the <i>Amplify User Guide</i>.
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
  /// Parameter [enableSkewProtection] :
  /// Specifies whether the skew protection feature is enabled for the branch.
  ///
  /// Deployment skew protection is available to Amplify applications to
  /// eliminate version skew issues between client and servers in web
  /// applications. When you apply skew protection to a branch, you can ensure
  /// that your clients always interact with the correct version of server-side
  /// assets, regardless of when a deployment occurs. For more information about
  /// skew protection, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/skew-protection.html">Skew
  /// protection for Amplify deployments</a> in the <i>Amplify User Guide</i>.
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
    required String appId,
    required String branchName,
    Backend? backend,
    String? backendEnvironmentArn,
    String? basicAuthCredentials,
    String? buildSpec,
    String? computeRoleArn,
    String? description,
    String? displayName,
    bool? enableAutoBuild,
    bool? enableBasicAuth,
    bool? enableNotification,
    bool? enablePerformanceMode,
    bool? enablePullRequestPreview,
    bool? enableSkewProtection,
    Map<String, String>? environmentVariables,
    String? framework,
    String? pullRequestEnvironmentName,
    Stage? stage,
    Map<String, String>? tags,
    String? ttl,
  }) async {
    final $payload = <String, dynamic>{
      'branchName': branchName,
      if (backend != null) 'backend': backend,
      if (backendEnvironmentArn != null)
        'backendEnvironmentArn': backendEnvironmentArn,
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (computeRoleArn != null) 'computeRoleArn': computeRoleArn,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (enableAutoBuild != null) 'enableAutoBuild': enableAutoBuild,
      if (enableBasicAuth != null) 'enableBasicAuth': enableBasicAuth,
      if (enableNotification != null) 'enableNotification': enableNotification,
      if (enablePerformanceMode != null)
        'enablePerformanceMode': enablePerformanceMode,
      if (enablePullRequestPreview != null)
        'enablePullRequestPreview': enablePullRequestPreview,
      if (enableSkewProtection != null)
        'enableSkewProtection': enableSkewProtection,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (framework != null) 'framework': framework,
      if (pullRequestEnvironmentName != null)
        'pullRequestEnvironmentName': pullRequestEnvironmentName,
      if (stage != null) 'stage': stage.value,
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
  /// deployed apps are not connected to a Git repository.
  ///
  /// The maximum duration between the <code>CreateDeployment</code> call and
  /// the <code>StartDeployment</code> call cannot exceed 8 hours. If the
  /// duration exceeds 8 hours, the <code>StartDeployment</code> call and the
  /// associated <code>Job</code> will fail.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch to use for the job.
  ///
  /// Parameter [fileMap] :
  /// An optional file map that contains the file name as the key and the file
  /// content md5 hash as the value. If this argument is provided, the service
  /// will generate a unique upload URL per file. Otherwise, the service will
  /// only generate a single upload URL for the zipped files.
  Future<CreateDeploymentResult> createDeployment({
    required String appId,
    required String branchName,
    Map<String, String>? fileMap,
  }) async {
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
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
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
  /// Parameter [certificateSettings] :
  /// The type of SSL/TLS certificate to use for your custom domain. If you
  /// don't specify a certificate type, Amplify uses the default certificate
  /// that it provisions and manages for you.
  ///
  /// Parameter [enableAutoSubDomain] :
  /// Enables the automated creation of subdomains for branches.
  Future<CreateDomainAssociationResult> createDomainAssociation({
    required String appId,
    required String domainName,
    required List<SubDomainSetting> subDomainSettings,
    List<String>? autoSubDomainCreationPatterns,
    String? autoSubDomainIAMRole,
    CertificateSettings? certificateSettings,
    bool? enableAutoSubDomain,
  }) async {
    final $payload = <String, dynamic>{
      'domainName': domainName,
      'subDomainSettings': subDomainSettings,
      if (autoSubDomainCreationPatterns != null)
        'autoSubDomainCreationPatterns': autoSubDomainCreationPatterns,
      if (autoSubDomainIAMRole != null)
        'autoSubDomainIAMRole': autoSubDomainIAMRole,
      if (certificateSettings != null)
        'certificateSettings': certificateSettings,
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
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
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
    required String appId,
    required String branchName,
    String? description,
  }) async {
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
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  Future<DeleteAppResult> deleteApp({
    required String appId,
  }) async {
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
  /// This API is available only to Amplify Gen 1 applications where the backend
  /// is created using Amplify Studio or the Amplify command line interface
  /// (CLI). This API isn’t available to Amplify Gen 2 applications. When you
  /// deploy an application with Amplify Gen 2, you provision the app's backend
  /// infrastructure using Typescript code.
  ///
  /// May throw [BadRequestException].
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID of an Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of a backend environment of an Amplify app.
  Future<DeleteBackendEnvironmentResult> deleteBackendEnvironment({
    required String appId,
    required String environmentName,
  }) async {
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
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch.
  Future<DeleteBranchResult> deleteBranch({
    required String appId,
    required String branchName,
  }) async {
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
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique id for an Amplify app.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  Future<DeleteDomainAssociationResult> deleteDomainAssociation({
    required String appId,
    required String domainName,
  }) async {
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
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch to use for the job.
  ///
  /// Parameter [jobId] :
  /// The unique ID for the job.
  Future<DeleteJobResult> deleteJob({
    required String appId,
    required String branchName,
    required String jobId,
  }) async {
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
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [webhookId] :
  /// The unique ID for a webhook.
  Future<DeleteWebhookResult> deleteWebhook({
    required String webhookId,
  }) async {
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
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
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
    required String appId,
    required String domainName,
    DateTime? endTime,
    DateTime? startTime,
  }) async {
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

  /// Returns an existing Amplify app specified by an app ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  Future<GetAppResult> getApp({
    required String appId,
  }) async {
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
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [artifactId] :
  /// The unique ID for an artifact.
  Future<GetArtifactUrlResult> getArtifactUrl({
    required String artifactId,
  }) async {
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
  /// This API is available only to Amplify Gen 1 applications where the backend
  /// is created using Amplify Studio or the Amplify command line interface
  /// (CLI). This API isn’t available to Amplify Gen 2 applications. When you
  /// deploy an application with Amplify Gen 2, you provision the app's backend
  /// infrastructure using Typescript code.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique id for an Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name for the backend environment.
  Future<GetBackendEnvironmentResult> getBackendEnvironment({
    required String appId,
    required String environmentName,
  }) async {
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
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch.
  Future<GetBranchResult> getBranch({
    required String appId,
    required String branchName,
  }) async {
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
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique id for an Amplify app.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  Future<GetDomainAssociationResult> getDomainAssociation({
    required String appId,
    required String domainName,
  }) async {
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
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch to use for the job.
  ///
  /// Parameter [jobId] :
  /// The unique ID for the job.
  Future<GetJobResult> getJob({
    required String appId,
    required String branchName,
    required String jobId,
  }) async {
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
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [webhookId] :
  /// The unique ID for a webhook.
  Future<GetWebhookResult> getWebhook({
    required String webhookId,
  }) async {
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
  /// May throw [InternalFailureException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. If non-null, the pagination token is returned in a
  /// result. Pass its value in another request to retrieve more entries.
  Future<ListAppsResult> listApps({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
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

  /// Returns a list of end-to-end testing artifacts for a specified app,
  /// branch, and job.
  ///
  /// To return the build artifacts, use the <a
  /// href="https://docs.aws.amazon.com/amplify/latest/APIReference/API_GetJob.html">GetJob</a>
  /// API.
  ///
  /// For more information about Amplify testing support, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/running-tests.html">Setting
  /// up end-to-end Cypress tests for your Amplify application</a> in the
  /// <i>Amplify Hosting User Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
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
    required String appId,
    required String branchName,
    required String jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      50,
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
  /// This API is available only to Amplify Gen 1 applications where the backend
  /// is created using Amplify Studio or the Amplify command line interface
  /// (CLI). This API isn’t available to Amplify Gen 2 applications. When you
  /// deploy an application with Amplify Gen 2, you provision the app's backend
  /// infrastructure using Typescript code.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [UnauthorizedException].
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
    required String appId,
    String? environmentName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      50,
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
  /// May throw [InternalFailureException].
  /// May throw [UnauthorizedException].
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
    required String appId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      50,
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
  /// May throw [InternalFailureException].
  /// May throw [UnauthorizedException].
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
    required String appId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      50,
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
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch to use for the request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. Set to null to start listing steps from the start. If
  /// a non-null pagination token is returned in a result, pass its value in
  /// here to list more steps.
  Future<ListJobsResult> listJobs({
    required String appId,
    required String branchName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      50,
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
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to use to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
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
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
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
    required String appId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      50,
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
  /// are not connected to a Git repository.
  ///
  /// The maximum duration between the <code>CreateDeployment</code> call and
  /// the <code>StartDeployment</code> call cannot exceed 8 hours. If the
  /// duration exceeds 8 hours, the <code>StartDeployment</code> call and the
  /// associated <code>Job</code> will fail.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch to use for the deployment job.
  ///
  /// Parameter [jobId] :
  /// The job ID for this deployment that is generated by the
  /// <code>CreateDeployment</code> request.
  ///
  /// Parameter [sourceUrl] :
  /// The source URL for the deployment that is used when calling
  /// <code>StartDeployment</code> without <code>CreateDeployment</code>. The
  /// source URL can be either an HTTP GET URL that is publicly accessible and
  /// downloads a single .zip file, or an Amazon S3 bucket and prefix.
  ///
  /// Parameter [sourceUrlType] :
  /// The type of source specified by the <code>sourceURL</code>. If the value
  /// is <code>ZIP</code>, the source is a .zip file. If the value is
  /// <code>BUCKET_PREFIX</code>, the source is an Amazon S3 bucket and prefix.
  /// If no value is specified, the default is <code>ZIP</code>.
  Future<StartDeploymentResult> startDeployment({
    required String appId,
    required String branchName,
    String? jobId,
    String? sourceUrl,
    SourceUrlType? sourceUrlType,
  }) async {
    final $payload = <String, dynamic>{
      if (jobId != null) 'jobId': jobId,
      if (sourceUrl != null) 'sourceUrl': sourceUrl,
      if (sourceUrlType != null) 'sourceUrlType': sourceUrlType.value,
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
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch to use for the job.
  ///
  /// Parameter [jobType] :
  /// Describes the type for the job. The job type <code>RELEASE</code> starts a
  /// new job with the latest change from the specified branch. This value is
  /// available only for apps that are connected to a repository.
  ///
  /// The job type <code>RETRY</code> retries an existing job. If the job type
  /// value is <code>RETRY</code>, the <code>jobId</code> is also required.
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
  /// A descriptive reason for starting the job.
  Future<StartJobResult> startJob({
    required String appId,
    required String branchName,
    required JobType jobType,
    String? commitId,
    String? commitMessage,
    DateTime? commitTime,
    String? jobId,
    String? jobReason,
  }) async {
    final $payload = <String, dynamic>{
      'jobType': jobType.value,
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
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch to use for the stop job request.
  ///
  /// Parameter [jobId] :
  /// The unique id for the job.
  Future<StopJobResult> stopJob({
    required String appId,
    required String branchName,
    required String jobId,
  }) async {
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
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to use to tag a resource.
  ///
  /// Parameter [tags] :
  /// The tags used to tag the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Untags a resource with a specified Amazon Resource Name (ARN).
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to use to untag a resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to use to untag a resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing Amplify app.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [accessToken] :
  /// The personal access token for a GitHub repository for an Amplify app. The
  /// personal access token is used to authorize access to a GitHub repository
  /// using the Amplify GitHub App. The token is not stored.
  ///
  /// Use <code>accessToken</code> for GitHub repositories only. To authorize
  /// access to a repository provider such as Bitbucket or CodeCommit, use
  /// <code>oauthToken</code>.
  ///
  /// You must specify either <code>accessToken</code> or
  /// <code>oauthToken</code> when you update an app.
  ///
  /// Existing Amplify apps deployed from a GitHub repository using OAuth
  /// continue to work with CI/CD. However, we strongly recommend that you
  /// migrate these apps to use the GitHub App. For more information, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/setting-up-GitHub-access.html#migrating-to-github-app-auth">Migrating
  /// an existing OAuth app to the Amplify GitHub App</a> in the <i>Amplify User
  /// Guide</i> .
  ///
  /// Parameter [autoBranchCreationConfig] :
  /// The automated branch creation configuration for an Amplify app.
  ///
  /// Parameter [autoBranchCreationPatterns] :
  /// Describes the automated branch creation glob patterns for an Amplify app.
  ///
  /// Parameter [basicAuthCredentials] :
  /// The basic authorization credentials for an Amplify app. You must
  /// base64-encode the authorization credentials and provide them in the format
  /// <code>user:password</code>.
  ///
  /// Parameter [buildSpec] :
  /// The build specification (build spec) for an Amplify app.
  ///
  /// Parameter [cacheConfig] :
  /// The cache configuration for the Amplify app.
  ///
  /// Parameter [computeRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to assign to an SSR app.
  /// The SSR Compute role allows the Amplify Hosting compute service to
  /// securely access specific Amazon Web Services resources based on the role's
  /// permissions. For more information about the SSR Compute role, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/amplify-SSR-compute-role.html">Adding
  /// an SSR Compute role</a> in the <i>Amplify User Guide</i>.
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
  /// Automatically disconnects a branch in the Amplify console when you delete
  /// a branch from your Git repository.
  ///
  /// Parameter [environmentVariables] :
  /// The environment variables for an Amplify app.
  ///
  /// Parameter [iamServiceRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM service role for the Amplify
  /// app.
  ///
  /// Parameter [jobConfig] :
  /// Describes the configuration details that apply to the jobs for an Amplify
  /// app.
  ///
  /// Parameter [name] :
  /// The name for an Amplify app.
  ///
  /// Parameter [oauthToken] :
  /// The OAuth token for a third-party source control system for an Amplify
  /// app. The OAuth token is used to create a webhook and a read-only deploy
  /// key using SSH cloning. The OAuth token is not stored.
  ///
  /// Use <code>oauthToken</code> for repository providers other than GitHub,
  /// such as Bitbucket or CodeCommit.
  ///
  /// To authorize access to GitHub as your repository provider, use
  /// <code>accessToken</code>.
  ///
  /// You must specify either <code>oauthToken</code> or
  /// <code>accessToken</code> when you update an app.
  ///
  /// Existing Amplify apps deployed from a GitHub repository using OAuth
  /// continue to work with CI/CD. However, we strongly recommend that you
  /// migrate these apps to use the GitHub App. For more information, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/setting-up-GitHub-access.html#migrating-to-github-app-auth">Migrating
  /// an existing OAuth app to the Amplify GitHub App</a> in the <i>Amplify User
  /// Guide</i> .
  ///
  /// Parameter [platform] :
  /// The platform for the Amplify app. For a static app, set the platform type
  /// to <code>WEB</code>. For a dynamic server-side rendered (SSR) app, set the
  /// platform type to <code>WEB_COMPUTE</code>. For an app requiring Amplify
  /// Hosting's original SSR support only, set the platform type to
  /// <code>WEB_DYNAMIC</code>.
  ///
  /// If you are deploying an SSG only app with Next.js version 14 or later, you
  /// must set the platform type to <code>WEB_COMPUTE</code>.
  ///
  /// Parameter [repository] :
  /// The name of the Git repository for an Amplify app.
  Future<UpdateAppResult> updateApp({
    required String appId,
    String? accessToken,
    AutoBranchCreationConfig? autoBranchCreationConfig,
    List<String>? autoBranchCreationPatterns,
    String? basicAuthCredentials,
    String? buildSpec,
    CacheConfig? cacheConfig,
    String? computeRoleArn,
    String? customHeaders,
    List<CustomRule>? customRules,
    String? description,
    bool? enableAutoBranchCreation,
    bool? enableBasicAuth,
    bool? enableBranchAutoBuild,
    bool? enableBranchAutoDeletion,
    Map<String, String>? environmentVariables,
    String? iamServiceRoleArn,
    JobConfig? jobConfig,
    String? name,
    String? oauthToken,
    Platform? platform,
    String? repository,
  }) async {
    final $payload = <String, dynamic>{
      if (accessToken != null) 'accessToken': accessToken,
      if (autoBranchCreationConfig != null)
        'autoBranchCreationConfig': autoBranchCreationConfig,
      if (autoBranchCreationPatterns != null)
        'autoBranchCreationPatterns': autoBranchCreationPatterns,
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (cacheConfig != null) 'cacheConfig': cacheConfig,
      if (computeRoleArn != null) 'computeRoleArn': computeRoleArn,
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
      if (jobConfig != null) 'jobConfig': jobConfig,
      if (name != null) 'name': name,
      if (oauthToken != null) 'oauthToken': oauthToken,
      if (platform != null) 'platform': platform.value,
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
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [branchName] :
  /// The name of the branch.
  ///
  /// Parameter [backend] :
  /// The backend for a <code>Branch</code> of an Amplify app. Use for a backend
  /// created from an CloudFormation stack.
  ///
  /// This field is available to Amplify Gen 2 apps only. When you deploy an
  /// application with Amplify Gen 2, you provision the app's backend
  /// infrastructure using Typescript code.
  ///
  /// Parameter [backendEnvironmentArn] :
  /// The Amazon Resource Name (ARN) for a backend environment that is part of a
  /// Gen 1 Amplify app.
  ///
  /// This field is available to Amplify Gen 1 apps only where the backend is
  /// created using Amplify Studio or the Amplify command line interface (CLI).
  ///
  /// Parameter [basicAuthCredentials] :
  /// The basic authorization credentials for the branch. You must base64-encode
  /// the authorization credentials and provide them in the format
  /// <code>user:password</code>.
  ///
  /// Parameter [buildSpec] :
  /// The build specification (build spec) for the branch.
  ///
  /// Parameter [computeRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to assign to a branch of an
  /// SSR app. The SSR Compute role allows the Amplify Hosting compute service
  /// to securely access specific Amazon Web Services resources based on the
  /// role's permissions. For more information about the SSR Compute role, see
  /// <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/amplify-SSR-compute-role.html">Adding
  /// an SSR Compute role</a> in the <i>Amplify User Guide</i>.
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
  /// Parameter [enableSkewProtection] :
  /// Specifies whether the skew protection feature is enabled for the branch.
  ///
  /// Deployment skew protection is available to Amplify applications to
  /// eliminate version skew issues between client and servers in web
  /// applications. When you apply skew protection to a branch, you can ensure
  /// that your clients always interact with the correct version of server-side
  /// assets, regardless of when a deployment occurs. For more information about
  /// skew protection, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/skew-protection.html">Skew
  /// protection for Amplify deployments</a> in the <i>Amplify User Guide</i>.
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
    required String appId,
    required String branchName,
    Backend? backend,
    String? backendEnvironmentArn,
    String? basicAuthCredentials,
    String? buildSpec,
    String? computeRoleArn,
    String? description,
    String? displayName,
    bool? enableAutoBuild,
    bool? enableBasicAuth,
    bool? enableNotification,
    bool? enablePerformanceMode,
    bool? enablePullRequestPreview,
    bool? enableSkewProtection,
    Map<String, String>? environmentVariables,
    String? framework,
    String? pullRequestEnvironmentName,
    Stage? stage,
    String? ttl,
  }) async {
    final $payload = <String, dynamic>{
      if (backend != null) 'backend': backend,
      if (backendEnvironmentArn != null)
        'backendEnvironmentArn': backendEnvironmentArn,
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (computeRoleArn != null) 'computeRoleArn': computeRoleArn,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (enableAutoBuild != null) 'enableAutoBuild': enableAutoBuild,
      if (enableBasicAuth != null) 'enableBasicAuth': enableBasicAuth,
      if (enableNotification != null) 'enableNotification': enableNotification,
      if (enablePerformanceMode != null)
        'enablePerformanceMode': enablePerformanceMode,
      if (enablePullRequestPreview != null)
        'enablePullRequestPreview': enablePullRequestPreview,
      if (enableSkewProtection != null)
        'enableSkewProtection': enableSkewProtection,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (framework != null) 'framework': framework,
      if (pullRequestEnvironmentName != null)
        'pullRequestEnvironmentName': pullRequestEnvironmentName,
      if (stage != null) 'stage': stage.value,
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
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [appId] :
  /// The unique ID for an Amplify app.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [autoSubDomainCreationPatterns] :
  /// Sets the branch patterns for automatic subdomain creation.
  ///
  /// Parameter [autoSubDomainIAMRole] :
  /// The required AWS Identity and Access Management (IAM) service role for the
  /// Amazon Resource Name (ARN) for automatically creating subdomains.
  ///
  /// Parameter [certificateSettings] :
  /// The type of SSL/TLS certificate to use for your custom domain.
  ///
  /// Parameter [enableAutoSubDomain] :
  /// Enables the automated creation of subdomains for branches.
  ///
  /// Parameter [subDomainSettings] :
  /// Describes the settings for the subdomain.
  Future<UpdateDomainAssociationResult> updateDomainAssociation({
    required String appId,
    required String domainName,
    List<String>? autoSubDomainCreationPatterns,
    String? autoSubDomainIAMRole,
    CertificateSettings? certificateSettings,
    bool? enableAutoSubDomain,
    List<SubDomainSetting>? subDomainSettings,
  }) async {
    final $payload = <String, dynamic>{
      if (autoSubDomainCreationPatterns != null)
        'autoSubDomainCreationPatterns': autoSubDomainCreationPatterns,
      if (autoSubDomainIAMRole != null)
        'autoSubDomainIAMRole': autoSubDomainIAMRole,
      if (certificateSettings != null)
        'certificateSettings': certificateSettings,
      if (enableAutoSubDomain != null)
        'enableAutoSubDomain': enableAutoSubDomain,
      if (subDomainSettings != null) 'subDomainSettings': subDomainSettings,
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
  /// May throw [DependentServiceFailureException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
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
    required String webhookId,
    String? branchName,
    String? description,
  }) async {
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

/// @nodoc
class CreateAppResult {
  final App app;

  CreateAppResult({
    required this.app,
  });

  factory CreateAppResult.fromJson(Map<String, dynamic> json) {
    return CreateAppResult(
      app: App.fromJson(
          (json['app'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    return {
      'app': app,
    };
  }
}

/// The result structure for the create backend environment request.
///
/// @nodoc
class CreateBackendEnvironmentResult {
  /// Describes the backend environment for an Amplify app.
  final BackendEnvironment backendEnvironment;

  CreateBackendEnvironmentResult({
    required this.backendEnvironment,
  });

  factory CreateBackendEnvironmentResult.fromJson(Map<String, dynamic> json) {
    return CreateBackendEnvironmentResult(
      backendEnvironment: BackendEnvironment.fromJson(
          (json['backendEnvironment'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final backendEnvironment = this.backendEnvironment;
    return {
      'backendEnvironment': backendEnvironment,
    };
  }
}

/// The result structure for create branch request.
///
/// @nodoc
class CreateBranchResult {
  /// Describes the branch for an Amplify app, which maps to a third-party
  /// repository branch.
  final Branch branch;

  CreateBranchResult({
    required this.branch,
  });

  factory CreateBranchResult.fromJson(Map<String, dynamic> json) {
    return CreateBranchResult(
      branch: Branch.fromJson((json['branch'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    return {
      'branch': branch,
    };
  }
}

/// The result structure for the create a new deployment request.
///
/// @nodoc
class CreateDeploymentResult {
  /// When the <code>fileMap</code> argument is provided in the request,
  /// <code>fileUploadUrls</code> will contain a map of file names to upload URLs.
  final Map<String, String> fileUploadUrls;

  /// When the <code>fileMap</code> argument is not provided in the request, this
  /// <code>zipUploadUrl</code> is returned.
  final String zipUploadUrl;

  /// The job ID for this deployment. will supply to start deployment api.
  final String? jobId;

  CreateDeploymentResult({
    required this.fileUploadUrls,
    required this.zipUploadUrl,
    this.jobId,
  });

  factory CreateDeploymentResult.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentResult(
      fileUploadUrls: ((json['fileUploadUrls'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      zipUploadUrl: (json['zipUploadUrl'] as String?) ?? '',
      jobId: json['jobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileUploadUrls = this.fileUploadUrls;
    final zipUploadUrl = this.zipUploadUrl;
    final jobId = this.jobId;
    return {
      'fileUploadUrls': fileUploadUrls,
      'zipUploadUrl': zipUploadUrl,
      if (jobId != null) 'jobId': jobId,
    };
  }
}

/// The result structure for the create domain association request.
///
/// @nodoc
class CreateDomainAssociationResult {
  /// Describes the structure of a domain association, which associates a custom
  /// domain with an Amplify app.
  final DomainAssociation domainAssociation;

  CreateDomainAssociationResult({
    required this.domainAssociation,
  });

  factory CreateDomainAssociationResult.fromJson(Map<String, dynamic> json) {
    return CreateDomainAssociationResult(
      domainAssociation: DomainAssociation.fromJson(
          (json['domainAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final domainAssociation = this.domainAssociation;
    return {
      'domainAssociation': domainAssociation,
    };
  }
}

/// The result structure for the create webhook request.
///
/// @nodoc
class CreateWebhookResult {
  /// Describes a webhook that connects repository events to an Amplify app.
  final Webhook webhook;

  CreateWebhookResult({
    required this.webhook,
  });

  factory CreateWebhookResult.fromJson(Map<String, dynamic> json) {
    return CreateWebhookResult(
      webhook: Webhook.fromJson((json['webhook'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final webhook = this.webhook;
    return {
      'webhook': webhook,
    };
  }
}

/// The result structure for the delete app request.
///
/// @nodoc
class DeleteAppResult {
  final App app;

  DeleteAppResult({
    required this.app,
  });

  factory DeleteAppResult.fromJson(Map<String, dynamic> json) {
    return DeleteAppResult(
      app: App.fromJson(
          (json['app'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    return {
      'app': app,
    };
  }
}

/// The result structure of the delete backend environment result.
///
/// @nodoc
class DeleteBackendEnvironmentResult {
  /// Describes the backend environment for an Amplify app.
  final BackendEnvironment backendEnvironment;

  DeleteBackendEnvironmentResult({
    required this.backendEnvironment,
  });

  factory DeleteBackendEnvironmentResult.fromJson(Map<String, dynamic> json) {
    return DeleteBackendEnvironmentResult(
      backendEnvironment: BackendEnvironment.fromJson(
          (json['backendEnvironment'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final backendEnvironment = this.backendEnvironment;
    return {
      'backendEnvironment': backendEnvironment,
    };
  }
}

/// The result structure for the delete branch request.
///
/// @nodoc
class DeleteBranchResult {
  /// The branch for an Amplify app, which maps to a third-party repository
  /// branch.
  final Branch branch;

  DeleteBranchResult({
    required this.branch,
  });

  factory DeleteBranchResult.fromJson(Map<String, dynamic> json) {
    return DeleteBranchResult(
      branch: Branch.fromJson((json['branch'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    return {
      'branch': branch,
    };
  }
}

/// @nodoc
class DeleteDomainAssociationResult {
  final DomainAssociation domainAssociation;

  DeleteDomainAssociationResult({
    required this.domainAssociation,
  });

  factory DeleteDomainAssociationResult.fromJson(Map<String, dynamic> json) {
    return DeleteDomainAssociationResult(
      domainAssociation: DomainAssociation.fromJson(
          (json['domainAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final domainAssociation = this.domainAssociation;
    return {
      'domainAssociation': domainAssociation,
    };
  }
}

/// The result structure for the delete job request.
///
/// @nodoc
class DeleteJobResult {
  final JobSummary jobSummary;

  DeleteJobResult({
    required this.jobSummary,
  });

  factory DeleteJobResult.fromJson(Map<String, dynamic> json) {
    return DeleteJobResult(
      jobSummary: JobSummary.fromJson(
          (json['jobSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummary = this.jobSummary;
    return {
      'jobSummary': jobSummary,
    };
  }
}

/// The result structure for the delete webhook request.
///
/// @nodoc
class DeleteWebhookResult {
  /// Describes a webhook that connects repository events to an Amplify app.
  final Webhook webhook;

  DeleteWebhookResult({
    required this.webhook,
  });

  factory DeleteWebhookResult.fromJson(Map<String, dynamic> json) {
    return DeleteWebhookResult(
      webhook: Webhook.fromJson((json['webhook'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final webhook = this.webhook;
    return {
      'webhook': webhook,
    };
  }
}

/// The result structure for the generate access logs request.
///
/// @nodoc
class GenerateAccessLogsResult {
  /// The pre-signed URL for the requested access logs.
  final String? logUrl;

  GenerateAccessLogsResult({
    this.logUrl,
  });

  factory GenerateAccessLogsResult.fromJson(Map<String, dynamic> json) {
    return GenerateAccessLogsResult(
      logUrl: json['logUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logUrl = this.logUrl;
    return {
      if (logUrl != null) 'logUrl': logUrl,
    };
  }
}

/// @nodoc
class GetAppResult {
  final App app;

  GetAppResult({
    required this.app,
  });

  factory GetAppResult.fromJson(Map<String, dynamic> json) {
    return GetAppResult(
      app: App.fromJson(
          (json['app'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    return {
      'app': app,
    };
  }
}

/// Returns the result structure for the get artifact request.
///
/// @nodoc
class GetArtifactUrlResult {
  /// The unique ID for an artifact.
  final String artifactId;

  /// The presigned URL for the artifact.
  final String artifactUrl;

  GetArtifactUrlResult({
    required this.artifactId,
    required this.artifactUrl,
  });

  factory GetArtifactUrlResult.fromJson(Map<String, dynamic> json) {
    return GetArtifactUrlResult(
      artifactId: (json['artifactId'] as String?) ?? '',
      artifactUrl: (json['artifactUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final artifactId = this.artifactId;
    final artifactUrl = this.artifactUrl;
    return {
      'artifactId': artifactId,
      'artifactUrl': artifactUrl,
    };
  }
}

/// The result structure for the get backend environment result.
///
/// @nodoc
class GetBackendEnvironmentResult {
  /// Describes the backend environment for an Amplify app.
  final BackendEnvironment backendEnvironment;

  GetBackendEnvironmentResult({
    required this.backendEnvironment,
  });

  factory GetBackendEnvironmentResult.fromJson(Map<String, dynamic> json) {
    return GetBackendEnvironmentResult(
      backendEnvironment: BackendEnvironment.fromJson(
          (json['backendEnvironment'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final backendEnvironment = this.backendEnvironment;
    return {
      'backendEnvironment': backendEnvironment,
    };
  }
}

/// @nodoc
class GetBranchResult {
  final Branch branch;

  GetBranchResult({
    required this.branch,
  });

  factory GetBranchResult.fromJson(Map<String, dynamic> json) {
    return GetBranchResult(
      branch: Branch.fromJson((json['branch'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    return {
      'branch': branch,
    };
  }
}

/// The result structure for the get domain association request.
///
/// @nodoc
class GetDomainAssociationResult {
  /// Describes the structure of a domain association, which associates a custom
  /// domain with an Amplify app.
  final DomainAssociation domainAssociation;

  GetDomainAssociationResult({
    required this.domainAssociation,
  });

  factory GetDomainAssociationResult.fromJson(Map<String, dynamic> json) {
    return GetDomainAssociationResult(
      domainAssociation: DomainAssociation.fromJson(
          (json['domainAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final domainAssociation = this.domainAssociation;
    return {
      'domainAssociation': domainAssociation,
    };
  }
}

/// @nodoc
class GetJobResult {
  final Job job;

  GetJobResult({
    required this.job,
  });

  factory GetJobResult.fromJson(Map<String, dynamic> json) {
    return GetJobResult(
      job: Job.fromJson(
          (json['job'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      'job': job,
    };
  }
}

/// The result structure for the get webhook request.
///
/// @nodoc
class GetWebhookResult {
  /// Describes the structure of a webhook.
  final Webhook webhook;

  GetWebhookResult({
    required this.webhook,
  });

  factory GetWebhookResult.fromJson(Map<String, dynamic> json) {
    return GetWebhookResult(
      webhook: Webhook.fromJson((json['webhook'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final webhook = this.webhook;
    return {
      'webhook': webhook,
    };
  }
}

/// The result structure for an Amplify app list request.
///
/// @nodoc
class ListAppsResult {
  /// A list of Amplify apps.
  final List<App> apps;

  /// A pagination token. Set to null to start listing apps from start. If
  /// non-null, the pagination token is returned in a result. Pass its value in
  /// here to list more projects.
  final String? nextToken;

  ListAppsResult({
    required this.apps,
    this.nextToken,
  });

  factory ListAppsResult.fromJson(Map<String, dynamic> json) {
    return ListAppsResult(
      apps: ((json['apps'] as List?) ?? const [])
          .nonNulls
          .map((e) => App.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apps = this.apps;
    final nextToken = this.nextToken;
    return {
      'apps': apps,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The result structure for the list artifacts request.
///
/// @nodoc
class ListArtifactsResult {
  /// A list of artifacts.
  final List<Artifact> artifacts;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListArtifactsResult({
    required this.artifacts,
    this.nextToken,
  });

  factory ListArtifactsResult.fromJson(Map<String, dynamic> json) {
    return ListArtifactsResult(
      artifacts: ((json['artifacts'] as List?) ?? const [])
          .nonNulls
          .map((e) => Artifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifacts = this.artifacts;
    final nextToken = this.nextToken;
    return {
      'artifacts': artifacts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The result structure for the list backend environments result.
///
/// @nodoc
class ListBackendEnvironmentsResult {
  /// The list of backend environments for an Amplify app.
  final List<BackendEnvironment> backendEnvironments;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListBackendEnvironmentsResult({
    required this.backendEnvironments,
    this.nextToken,
  });

  factory ListBackendEnvironmentsResult.fromJson(Map<String, dynamic> json) {
    return ListBackendEnvironmentsResult(
      backendEnvironments: ((json['backendEnvironments'] as List?) ?? const [])
          .nonNulls
          .map((e) => BackendEnvironment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backendEnvironments = this.backendEnvironments;
    final nextToken = this.nextToken;
    return {
      'backendEnvironments': backendEnvironments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The result structure for the list branches request.
///
/// @nodoc
class ListBranchesResult {
  /// A list of branches for an Amplify app.
  final List<Branch> branches;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListBranchesResult({
    required this.branches,
    this.nextToken,
  });

  factory ListBranchesResult.fromJson(Map<String, dynamic> json) {
    return ListBranchesResult(
      branches: ((json['branches'] as List?) ?? const [])
          .nonNulls
          .map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branches = this.branches;
    final nextToken = this.nextToken;
    return {
      'branches': branches,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The result structure for the list domain association request.
///
/// @nodoc
class ListDomainAssociationsResult {
  /// A list of domain associations.
  final List<DomainAssociation> domainAssociations;

  /// A pagination token. If non-null, a pagination token is returned in a result.
  /// Pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListDomainAssociationsResult({
    required this.domainAssociations,
    this.nextToken,
  });

  factory ListDomainAssociationsResult.fromJson(Map<String, dynamic> json) {
    return ListDomainAssociationsResult(
      domainAssociations: ((json['domainAssociations'] as List?) ?? const [])
          .nonNulls
          .map((e) => DomainAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainAssociations = this.domainAssociations;
    final nextToken = this.nextToken;
    return {
      'domainAssociations': domainAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The maximum number of records to list in a single response.
///
/// @nodoc
class ListJobsResult {
  /// The result structure for the list job result request.
  final List<JobSummary> jobSummaries;

  /// A pagination token. If non-null the pagination token is returned in a
  /// result. Pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListJobsResult({
    required this.jobSummaries,
    this.nextToken,
  });

  factory ListJobsResult.fromJson(Map<String, dynamic> json) {
    return ListJobsResult(
      jobSummaries: ((json['jobSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummaries = this.jobSummaries;
    final nextToken = this.nextToken;
    return {
      'jobSummaries': jobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response for the list tags for resource request.
///
/// @nodoc
class ListTagsForResourceResponse {
  /// A list of tags for the specified The Amazon Resource Name (ARN).
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
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

/// The result structure for the list webhooks request.
///
/// @nodoc
class ListWebhooksResult {
  /// A list of webhooks.
  final List<Webhook> webhooks;

  /// A pagination token. If non-null, the pagination token is returned in a
  /// result. Pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListWebhooksResult({
    required this.webhooks,
    this.nextToken,
  });

  factory ListWebhooksResult.fromJson(Map<String, dynamic> json) {
    return ListWebhooksResult(
      webhooks: ((json['webhooks'] as List?) ?? const [])
          .nonNulls
          .map((e) => Webhook.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final webhooks = this.webhooks;
    final nextToken = this.nextToken;
    return {
      'webhooks': webhooks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The result structure for the start a deployment request.
///
/// @nodoc
class StartDeploymentResult {
  /// The summary for the job.
  final JobSummary jobSummary;

  StartDeploymentResult({
    required this.jobSummary,
  });

  factory StartDeploymentResult.fromJson(Map<String, dynamic> json) {
    return StartDeploymentResult(
      jobSummary: JobSummary.fromJson(
          (json['jobSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummary = this.jobSummary;
    return {
      'jobSummary': jobSummary,
    };
  }
}

/// The result structure for the run job request.
///
/// @nodoc
class StartJobResult {
  /// The summary for the job.
  final JobSummary jobSummary;

  StartJobResult({
    required this.jobSummary,
  });

  factory StartJobResult.fromJson(Map<String, dynamic> json) {
    return StartJobResult(
      jobSummary: JobSummary.fromJson(
          (json['jobSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummary = this.jobSummary;
    return {
      'jobSummary': jobSummary,
    };
  }
}

/// The result structure for the stop job request.
///
/// @nodoc
class StopJobResult {
  /// The summary for the job.
  final JobSummary jobSummary;

  StopJobResult({
    required this.jobSummary,
  });

  factory StopJobResult.fromJson(Map<String, dynamic> json) {
    return StopJobResult(
      jobSummary: JobSummary.fromJson(
          (json['jobSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummary = this.jobSummary;
    return {
      'jobSummary': jobSummary,
    };
  }
}

/// The response for the tag resource request.
///
/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response for the untag resource request.
///
/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result structure for an Amplify app update request.
///
/// @nodoc
class UpdateAppResult {
  /// Represents the updated Amplify app.
  final App app;

  UpdateAppResult({
    required this.app,
  });

  factory UpdateAppResult.fromJson(Map<String, dynamic> json) {
    return UpdateAppResult(
      app: App.fromJson(
          (json['app'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    return {
      'app': app,
    };
  }
}

/// The result structure for the update branch request.
///
/// @nodoc
class UpdateBranchResult {
  /// The branch for an Amplify app, which maps to a third-party repository
  /// branch.
  final Branch branch;

  UpdateBranchResult({
    required this.branch,
  });

  factory UpdateBranchResult.fromJson(Map<String, dynamic> json) {
    return UpdateBranchResult(
      branch: Branch.fromJson((json['branch'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    return {
      'branch': branch,
    };
  }
}

/// The result structure for the update domain association request.
///
/// @nodoc
class UpdateDomainAssociationResult {
  /// Describes a domain association, which associates a custom domain with an
  /// Amplify app.
  final DomainAssociation domainAssociation;

  UpdateDomainAssociationResult({
    required this.domainAssociation,
  });

  factory UpdateDomainAssociationResult.fromJson(Map<String, dynamic> json) {
    return UpdateDomainAssociationResult(
      domainAssociation: DomainAssociation.fromJson(
          (json['domainAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final domainAssociation = this.domainAssociation;
    return {
      'domainAssociation': domainAssociation,
    };
  }
}

/// The result structure for the update webhook request.
///
/// @nodoc
class UpdateWebhookResult {
  /// Describes a webhook that connects repository events to an Amplify app.
  final Webhook webhook;

  UpdateWebhookResult({
    required this.webhook,
  });

  factory UpdateWebhookResult.fromJson(Map<String, dynamic> json) {
    return UpdateWebhookResult(
      webhook: Webhook.fromJson((json['webhook'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final webhook = this.webhook;
    return {
      'webhook': webhook,
    };
  }
}

/// Describes a webhook that connects repository events to an Amplify app.
///
/// @nodoc
class Webhook {
  /// The name for a branch that is part of an Amplify app.
  final String branchName;

  /// A timestamp of when Amplify created the webhook in your Git repository.
  final DateTime createTime;

  /// The description for a webhook.
  final String description;

  /// A timestamp of when Amplify updated the webhook in your Git repository.
  final DateTime updateTime;

  /// The Amazon Resource Name (ARN) for the webhook.
  final String webhookArn;

  /// The ID of the webhook.
  final String webhookId;

  /// The URL of the webhook.
  final String webhookUrl;

  /// The unique ID of an Amplify app.
  final String? appId;

  Webhook({
    required this.branchName,
    required this.createTime,
    required this.description,
    required this.updateTime,
    required this.webhookArn,
    required this.webhookId,
    required this.webhookUrl,
    this.appId,
  });

  factory Webhook.fromJson(Map<String, dynamic> json) {
    return Webhook(
      branchName: (json['branchName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      webhookArn: (json['webhookArn'] as String?) ?? '',
      webhookId: (json['webhookId'] as String?) ?? '',
      webhookUrl: (json['webhookUrl'] as String?) ?? '',
      appId: json['appId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branchName = this.branchName;
    final createTime = this.createTime;
    final description = this.description;
    final updateTime = this.updateTime;
    final webhookArn = this.webhookArn;
    final webhookId = this.webhookId;
    final webhookUrl = this.webhookUrl;
    final appId = this.appId;
    return {
      'branchName': branchName,
      'createTime': unixTimestampToJson(createTime),
      'description': description,
      'updateTime': unixTimestampToJson(updateTime),
      'webhookArn': webhookArn,
      'webhookId': webhookId,
      'webhookUrl': webhookUrl,
      if (appId != null) 'appId': appId,
    };
  }
}

/// Describes the association between a custom domain and an Amplify app.
///
/// @nodoc
class DomainAssociation {
  /// The Amazon Resource Name (ARN) for the domain association.
  final String domainAssociationArn;

  /// The name of the domain.
  final String domainName;

  /// The current status of the domain association.
  final DomainStatus domainStatus;

  /// Enables the automated creation of subdomains for branches.
  final bool enableAutoSubDomain;

  /// Additional information that describes why the domain association is in the
  /// current state.
  final String statusReason;

  /// The subdomains for the domain association.
  final List<SubDomain> subDomains;

  /// Sets branch patterns for automatic subdomain creation.
  final List<String>? autoSubDomainCreationPatterns;

  /// The required AWS Identity and Access Management (IAM) service role for the
  /// Amazon Resource Name (ARN) for automatically creating subdomains.
  final String? autoSubDomainIAMRole;

  /// Describes the SSL/TLS certificate for the domain association. This can be
  /// your own custom certificate or the default certificate that Amplify
  /// provisions for you.
  ///
  /// If you are updating your domain to use a different certificate,
  /// <code>certificate</code> points to the new certificate that is being created
  /// instead of the current active certificate. Otherwise,
  /// <code>certificate</code> points to the current active certificate.
  final Certificate? certificate;

  /// The DNS record for certificate verification.
  final String? certificateVerificationDNSRecord;

  /// The status of the domain update operation that is currently in progress. The
  /// following list describes the valid update states.
  /// <dl> <dt>REQUESTING_CERTIFICATE</dt> <dd>
  /// The certificate is in the process of being updated.
  /// </dd> <dt>PENDING_VERIFICATION</dt> <dd>
  /// Indicates that an Amplify managed certificate is in the process of being
  /// verified. This occurs during the creation of a custom domain or when a
  /// custom domain is updated to use a managed certificate.
  /// </dd> <dt>IMPORTING_CUSTOM_CERTIFICATE</dt> <dd>
  /// Indicates that an Amplify custom certificate is in the process of being
  /// imported. This occurs during the creation of a custom domain or when a
  /// custom domain is updated to use a custom certificate.
  /// </dd> <dt>PENDING_DEPLOYMENT</dt> <dd>
  /// Indicates that the subdomain or certificate changes are being propagated.
  /// </dd> <dt>AWAITING_APP_CNAME</dt> <dd>
  /// Amplify is waiting for CNAME records corresponding to subdomains to be
  /// propagated. If your custom domain is on Route 53, Amplify handles this for
  /// you automatically. For more information about custom domains, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/custom-domains.html">Setting
  /// up custom domains</a> in the <i>Amplify Hosting User Guide</i>.
  /// </dd> <dt>UPDATE_COMPLETE</dt> <dd>
  /// The certificate has been associated with a domain.
  /// </dd> <dt>UPDATE_FAILED</dt> <dd>
  /// The certificate has failed to be provisioned or associated, and there is no
  /// existing active certificate to roll back to.
  /// </dd> </dl>
  final UpdateStatus? updateStatus;

  DomainAssociation({
    required this.domainAssociationArn,
    required this.domainName,
    required this.domainStatus,
    required this.enableAutoSubDomain,
    required this.statusReason,
    required this.subDomains,
    this.autoSubDomainCreationPatterns,
    this.autoSubDomainIAMRole,
    this.certificate,
    this.certificateVerificationDNSRecord,
    this.updateStatus,
  });

  factory DomainAssociation.fromJson(Map<String, dynamic> json) {
    return DomainAssociation(
      domainAssociationArn: (json['domainAssociationArn'] as String?) ?? '',
      domainName: (json['domainName'] as String?) ?? '',
      domainStatus:
          DomainStatus.fromString((json['domainStatus'] as String?) ?? ''),
      enableAutoSubDomain: (json['enableAutoSubDomain'] as bool?) ?? false,
      statusReason: (json['statusReason'] as String?) ?? '',
      subDomains: ((json['subDomains'] as List?) ?? const [])
          .nonNulls
          .map((e) => SubDomain.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoSubDomainCreationPatterns:
          (json['autoSubDomainCreationPatterns'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      autoSubDomainIAMRole: json['autoSubDomainIAMRole'] as String?,
      certificate: json['certificate'] != null
          ? Certificate.fromJson(json['certificate'] as Map<String, dynamic>)
          : null,
      certificateVerificationDNSRecord:
          json['certificateVerificationDNSRecord'] as String?,
      updateStatus:
          (json['updateStatus'] as String?)?.let(UpdateStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final domainAssociationArn = this.domainAssociationArn;
    final domainName = this.domainName;
    final domainStatus = this.domainStatus;
    final enableAutoSubDomain = this.enableAutoSubDomain;
    final statusReason = this.statusReason;
    final subDomains = this.subDomains;
    final autoSubDomainCreationPatterns = this.autoSubDomainCreationPatterns;
    final autoSubDomainIAMRole = this.autoSubDomainIAMRole;
    final certificate = this.certificate;
    final certificateVerificationDNSRecord =
        this.certificateVerificationDNSRecord;
    final updateStatus = this.updateStatus;
    return {
      'domainAssociationArn': domainAssociationArn,
      'domainName': domainName,
      'domainStatus': domainStatus.value,
      'enableAutoSubDomain': enableAutoSubDomain,
      'statusReason': statusReason,
      'subDomains': subDomains,
      if (autoSubDomainCreationPatterns != null)
        'autoSubDomainCreationPatterns': autoSubDomainCreationPatterns,
      if (autoSubDomainIAMRole != null)
        'autoSubDomainIAMRole': autoSubDomainIAMRole,
      if (certificate != null) 'certificate': certificate,
      if (certificateVerificationDNSRecord != null)
        'certificateVerificationDNSRecord': certificateVerificationDNSRecord,
      if (updateStatus != null) 'updateStatus': updateStatus.value,
    };
  }
}

/// @nodoc
class DomainStatus {
  static const pendingVerification = DomainStatus._('PENDING_VERIFICATION');
  static const inProgress = DomainStatus._('IN_PROGRESS');
  static const available = DomainStatus._('AVAILABLE');
  static const importingCustomCertificate =
      DomainStatus._('IMPORTING_CUSTOM_CERTIFICATE');
  static const pendingDeployment = DomainStatus._('PENDING_DEPLOYMENT');
  static const awaitingAppCname = DomainStatus._('AWAITING_APP_CNAME');
  static const failed = DomainStatus._('FAILED');
  static const creating = DomainStatus._('CREATING');
  static const requestingCertificate = DomainStatus._('REQUESTING_CERTIFICATE');
  static const updating = DomainStatus._('UPDATING');

  final String value;

  const DomainStatus._(this.value);

  static const values = [
    pendingVerification,
    inProgress,
    available,
    importingCustomCertificate,
    pendingDeployment,
    awaitingAppCname,
    failed,
    creating,
    requestingCertificate,
    updating
  ];

  static DomainStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DomainStatus._(value));

  @override
  bool operator ==(other) => other is DomainStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class UpdateStatus {
  static const requestingCertificate = UpdateStatus._('REQUESTING_CERTIFICATE');
  static const pendingVerification = UpdateStatus._('PENDING_VERIFICATION');
  static const importingCustomCertificate =
      UpdateStatus._('IMPORTING_CUSTOM_CERTIFICATE');
  static const pendingDeployment = UpdateStatus._('PENDING_DEPLOYMENT');
  static const awaitingAppCname = UpdateStatus._('AWAITING_APP_CNAME');
  static const updateComplete = UpdateStatus._('UPDATE_COMPLETE');
  static const updateFailed = UpdateStatus._('UPDATE_FAILED');

  final String value;

  const UpdateStatus._(this.value);

  static const values = [
    requestingCertificate,
    pendingVerification,
    importingCustomCertificate,
    pendingDeployment,
    awaitingAppCname,
    updateComplete,
    updateFailed
  ];

  static UpdateStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UpdateStatus._(value));

  @override
  bool operator ==(other) => other is UpdateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the current SSL/TLS certificate that is in use for the domain. If
/// you are using <code>CreateDomainAssociation</code> to create a new domain
/// association, <code>Certificate</code> describes the new certificate that you
/// are creating.
///
/// @nodoc
class Certificate {
  /// The type of SSL/TLS certificate that you want to use.
  ///
  /// Specify <code>AMPLIFY_MANAGED</code> to use the default certificate that
  /// Amplify provisions for you.
  ///
  /// Specify <code>CUSTOM</code> to use your own certificate that you have
  /// already added to Certificate Manager in your Amazon Web Services account.
  /// Make sure you request (or import) the certificate in the US East (N.
  /// Virginia) Region (us-east-1). For more information about using ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// certificates into Certificate Manager</a> in the <i>ACM User guide</i>.
  final CertificateType type;

  /// The DNS record for certificate verification.
  final String? certificateVerificationDNSRecord;

  /// The Amazon resource name (ARN) for a custom certificate that you have
  /// already added to Certificate Manager in your Amazon Web Services account.
  ///
  /// This field is required only when the certificate type is
  /// <code>CUSTOM</code>.
  final String? customCertificateArn;

  Certificate({
    required this.type,
    this.certificateVerificationDNSRecord,
    this.customCertificateArn,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      type: CertificateType.fromString((json['type'] as String?) ?? ''),
      certificateVerificationDNSRecord:
          json['certificateVerificationDNSRecord'] as String?,
      customCertificateArn: json['customCertificateArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final certificateVerificationDNSRecord =
        this.certificateVerificationDNSRecord;
    final customCertificateArn = this.customCertificateArn;
    return {
      'type': type.value,
      if (certificateVerificationDNSRecord != null)
        'certificateVerificationDNSRecord': certificateVerificationDNSRecord,
      if (customCertificateArn != null)
        'customCertificateArn': customCertificateArn,
    };
  }
}

/// @nodoc
class CertificateType {
  static const amplifyManaged = CertificateType._('AMPLIFY_MANAGED');
  static const custom = CertificateType._('CUSTOM');

  final String value;

  const CertificateType._(this.value);

  static const values = [amplifyManaged, custom];

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

/// The subdomain for the domain association.
///
/// @nodoc
class SubDomain {
  /// The DNS record for the subdomain.
  final String dnsRecord;

  /// Describes the settings for the subdomain.
  final SubDomainSetting subDomainSetting;

  /// The verified status of the subdomain
  final bool verified;

  SubDomain({
    required this.dnsRecord,
    required this.subDomainSetting,
    required this.verified,
  });

  factory SubDomain.fromJson(Map<String, dynamic> json) {
    return SubDomain(
      dnsRecord: (json['dnsRecord'] as String?) ?? '',
      subDomainSetting: SubDomainSetting.fromJson(
          (json['subDomainSetting'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      verified: (json['verified'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final dnsRecord = this.dnsRecord;
    final subDomainSetting = this.subDomainSetting;
    final verified = this.verified;
    return {
      'dnsRecord': dnsRecord,
      'subDomainSetting': subDomainSetting,
      'verified': verified,
    };
  }
}

/// Describes the settings for the subdomain.
///
/// @nodoc
class SubDomainSetting {
  /// The branch name setting for the subdomain.
  final String branchName;

  /// The prefix setting for the subdomain.
  final String prefix;

  SubDomainSetting({
    required this.branchName,
    required this.prefix,
  });

  factory SubDomainSetting.fromJson(Map<String, dynamic> json) {
    return SubDomainSetting(
      branchName: (json['branchName'] as String?) ?? '',
      prefix: (json['prefix'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final branchName = this.branchName;
    final prefix = this.prefix;
    return {
      'branchName': branchName,
      'prefix': prefix,
    };
  }
}

/// The type of SSL/TLS certificate to use for your custom domain. If a
/// certificate type isn't specified, Amplify uses the default
/// <code>AMPLIFY_MANAGED</code> certificate.
///
/// @nodoc
class CertificateSettings {
  /// The certificate type.
  ///
  /// Specify <code>AMPLIFY_MANAGED</code> to use the default certificate that
  /// Amplify provisions for you.
  ///
  /// Specify <code>CUSTOM</code> to use your own certificate that you have
  /// already added to Certificate Manager in your Amazon Web Services account.
  /// Make sure you request (or import) the certificate in the US East (N.
  /// Virginia) Region (us-east-1). For more information about using ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// certificates into Certificate Manager</a> in the <i>ACM User guide</i>.
  final CertificateType type;

  /// The Amazon resource name (ARN) for the custom certificate that you have
  /// already added to Certificate Manager in your Amazon Web Services account.
  ///
  /// This field is required only when the certificate type is
  /// <code>CUSTOM</code>.
  final String? customCertificateArn;

  CertificateSettings({
    required this.type,
    this.customCertificateArn,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final customCertificateArn = this.customCertificateArn;
    return {
      'type': type.value,
      if (customCertificateArn != null)
        'customCertificateArn': customCertificateArn,
    };
  }
}

/// The branch for an Amplify app, which maps to a third-party repository
/// branch.
///
/// @nodoc
class Branch {
  /// The ID of the active job for a branch of an Amplify app.
  final String activeJobId;

  /// The Amazon Resource Name (ARN) for a branch that is part of an Amplify app.
  final String branchArn;

  /// The name for the branch that is part of an Amplify app.
  final String branchName;

  /// A timestamp of when Amplify created the branch.
  final DateTime createTime;

  /// The custom domains for a branch of an Amplify app.
  final List<String> customDomains;

  /// The description for the branch that is part of an Amplify app.
  final String description;

  /// The display name for the branch. This is used as the default domain prefix.
  final String displayName;

  /// Enables auto-building on push for a branch of an Amplify app.
  final bool enableAutoBuild;

  /// Enables basic authorization for a branch of an Amplify app.
  final bool enableBasicAuth;

  /// Enables notifications for a branch that is part of an Amplify app.
  final bool enableNotification;

  /// Enables pull request previews for the branch.
  final bool enablePullRequestPreview;

  /// The environment variables specific to a branch of an Amplify app.
  final Map<String, String> environmentVariables;

  /// The framework for a branch of an Amplify app.
  final String framework;

  /// The current stage for the branch that is part of an Amplify app.
  final Stage stage;

  /// The total number of jobs that are part of an Amplify app.
  final String totalNumberOfJobs;

  /// The content Time to Live (TTL) for the website in seconds.
  final String ttl;

  /// A timestamp for the last updated time for a branch.
  final DateTime updateTime;

  /// A list of custom resources that are linked to this branch.
  final List<String>? associatedResources;
  final Backend? backend;

  /// The Amazon Resource Name (ARN) for a backend environment that is part of an
  /// Amplify app.
  ///
  /// This property is available to Amplify Gen 1 apps only. When you deploy an
  /// application with Amplify Gen 2, you provision the app's backend
  /// infrastructure using Typescript code.
  final String? backendEnvironmentArn;

  /// The basic authorization credentials for a branch of an Amplify app. You must
  /// base64-encode the authorization credentials and provide them in the format
  /// <code>user:password</code>.
  final String? basicAuthCredentials;

  /// The build specification (build spec) content for the branch of an Amplify
  /// app.
  final String? buildSpec;

  /// The Amazon Resource Name (ARN) of the IAM role for a branch of an SSR app.
  /// The Compute role allows the Amplify Hosting compute service to securely
  /// access specific Amazon Web Services resources based on the role's
  /// permissions. For more information about the SSR Compute role, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/amplify-SSR-compute-role.html">Adding
  /// an SSR Compute role</a> in the <i>Amplify User Guide</i>.
  final String? computeRoleArn;

  /// The destination branch if the branch is a pull request branch.
  final String? destinationBranch;

  /// Enables performance mode for the branch.
  ///
  /// Performance mode optimizes for faster hosting performance by keeping content
  /// cached at the edge for a longer interval. When performance mode is enabled,
  /// hosting configuration or code changes can take up to 10 minutes to roll out.
  final bool? enablePerformanceMode;

  /// Specifies whether the skew protection feature is enabled for the branch.
  ///
  /// Deployment skew protection is available to Amplify applications to eliminate
  /// version skew issues between client and servers in web applications. When you
  /// apply skew protection to a branch, you can ensure that your clients always
  /// interact with the correct version of server-side assets, regardless of when
  /// a deployment occurs. For more information about skew protection, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/skew-protection.html">Skew
  /// protection for Amplify deployments</a> in the <i>Amplify User Guide</i>.
  final bool? enableSkewProtection;

  /// The Amplify environment name for the pull request.
  final String? pullRequestEnvironmentName;

  /// The source branch if the branch is a pull request branch.
  final String? sourceBranch;

  /// The tag for the branch of an Amplify app.
  final Map<String, String>? tags;

  /// The thumbnail URL for the branch of an Amplify app.
  final String? thumbnailUrl;

  Branch({
    required this.activeJobId,
    required this.branchArn,
    required this.branchName,
    required this.createTime,
    required this.customDomains,
    required this.description,
    required this.displayName,
    required this.enableAutoBuild,
    required this.enableBasicAuth,
    required this.enableNotification,
    required this.enablePullRequestPreview,
    required this.environmentVariables,
    required this.framework,
    required this.stage,
    required this.totalNumberOfJobs,
    required this.ttl,
    required this.updateTime,
    this.associatedResources,
    this.backend,
    this.backendEnvironmentArn,
    this.basicAuthCredentials,
    this.buildSpec,
    this.computeRoleArn,
    this.destinationBranch,
    this.enablePerformanceMode,
    this.enableSkewProtection,
    this.pullRequestEnvironmentName,
    this.sourceBranch,
    this.tags,
    this.thumbnailUrl,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      activeJobId: (json['activeJobId'] as String?) ?? '',
      branchArn: (json['branchArn'] as String?) ?? '',
      branchName: (json['branchName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      customDomains: ((json['customDomains'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      description: (json['description'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      enableAutoBuild: (json['enableAutoBuild'] as bool?) ?? false,
      enableBasicAuth: (json['enableBasicAuth'] as bool?) ?? false,
      enableNotification: (json['enableNotification'] as bool?) ?? false,
      enablePullRequestPreview:
          (json['enablePullRequestPreview'] as bool?) ?? false,
      environmentVariables:
          ((json['environmentVariables'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      framework: (json['framework'] as String?) ?? '',
      stage: Stage.fromString((json['stage'] as String?) ?? ''),
      totalNumberOfJobs: (json['totalNumberOfJobs'] as String?) ?? '',
      ttl: (json['ttl'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      associatedResources: (json['associatedResources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      backend: json['backend'] != null
          ? Backend.fromJson(json['backend'] as Map<String, dynamic>)
          : null,
      backendEnvironmentArn: json['backendEnvironmentArn'] as String?,
      basicAuthCredentials: json['basicAuthCredentials'] as String?,
      buildSpec: json['buildSpec'] as String?,
      computeRoleArn: json['computeRoleArn'] as String?,
      destinationBranch: json['destinationBranch'] as String?,
      enablePerformanceMode: json['enablePerformanceMode'] as bool?,
      enableSkewProtection: json['enableSkewProtection'] as bool?,
      pullRequestEnvironmentName: json['pullRequestEnvironmentName'] as String?,
      sourceBranch: json['sourceBranch'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeJobId = this.activeJobId;
    final branchArn = this.branchArn;
    final branchName = this.branchName;
    final createTime = this.createTime;
    final customDomains = this.customDomains;
    final description = this.description;
    final displayName = this.displayName;
    final enableAutoBuild = this.enableAutoBuild;
    final enableBasicAuth = this.enableBasicAuth;
    final enableNotification = this.enableNotification;
    final enablePullRequestPreview = this.enablePullRequestPreview;
    final environmentVariables = this.environmentVariables;
    final framework = this.framework;
    final stage = this.stage;
    final totalNumberOfJobs = this.totalNumberOfJobs;
    final ttl = this.ttl;
    final updateTime = this.updateTime;
    final associatedResources = this.associatedResources;
    final backend = this.backend;
    final backendEnvironmentArn = this.backendEnvironmentArn;
    final basicAuthCredentials = this.basicAuthCredentials;
    final buildSpec = this.buildSpec;
    final computeRoleArn = this.computeRoleArn;
    final destinationBranch = this.destinationBranch;
    final enablePerformanceMode = this.enablePerformanceMode;
    final enableSkewProtection = this.enableSkewProtection;
    final pullRequestEnvironmentName = this.pullRequestEnvironmentName;
    final sourceBranch = this.sourceBranch;
    final tags = this.tags;
    final thumbnailUrl = this.thumbnailUrl;
    return {
      'activeJobId': activeJobId,
      'branchArn': branchArn,
      'branchName': branchName,
      'createTime': unixTimestampToJson(createTime),
      'customDomains': customDomains,
      'description': description,
      'displayName': displayName,
      'enableAutoBuild': enableAutoBuild,
      'enableBasicAuth': enableBasicAuth,
      'enableNotification': enableNotification,
      'enablePullRequestPreview': enablePullRequestPreview,
      'environmentVariables': environmentVariables,
      'framework': framework,
      'stage': stage.value,
      'totalNumberOfJobs': totalNumberOfJobs,
      'ttl': ttl,
      'updateTime': unixTimestampToJson(updateTime),
      if (associatedResources != null)
        'associatedResources': associatedResources,
      if (backend != null) 'backend': backend,
      if (backendEnvironmentArn != null)
        'backendEnvironmentArn': backendEnvironmentArn,
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (computeRoleArn != null) 'computeRoleArn': computeRoleArn,
      if (destinationBranch != null) 'destinationBranch': destinationBranch,
      if (enablePerformanceMode != null)
        'enablePerformanceMode': enablePerformanceMode,
      if (enableSkewProtection != null)
        'enableSkewProtection': enableSkewProtection,
      if (pullRequestEnvironmentName != null)
        'pullRequestEnvironmentName': pullRequestEnvironmentName,
      if (sourceBranch != null) 'sourceBranch': sourceBranch,
      if (tags != null) 'tags': tags,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
    };
  }
}

/// @nodoc
class Stage {
  static const production = Stage._('PRODUCTION');
  static const beta = Stage._('BETA');
  static const development = Stage._('DEVELOPMENT');
  static const experimental = Stage._('EXPERIMENTAL');
  static const pullRequest = Stage._('PULL_REQUEST');

  final String value;

  const Stage._(this.value);

  static const values = [
    production,
    beta,
    development,
    experimental,
    pullRequest
  ];

  static Stage fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Stage._(value));

  @override
  bool operator ==(other) => other is Stage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the backend associated with an Amplify <code>Branch</code>.
///
/// This property is available to Amplify Gen 2 apps only. When you deploy an
/// application with Amplify Gen 2, you provision the app's backend
/// infrastructure using Typescript code.
///
/// @nodoc
class Backend {
  /// The Amazon Resource Name (ARN) for the CloudFormation stack.
  final String? stackArn;

  Backend({
    this.stackArn,
  });

  factory Backend.fromJson(Map<String, dynamic> json) {
    return Backend(
      stackArn: json['stackArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stackArn = this.stackArn;
    return {
      if (stackArn != null) 'stackArn': stackArn,
    };
  }
}

/// Represents the different branches of a repository for building, deploying,
/// and hosting an Amplify app.
///
/// @nodoc
class App {
  /// The Amazon Resource Name (ARN) of the Amplify app.
  final String appArn;

  /// The unique ID of the Amplify app.
  final String appId;

  /// A timestamp of when Amplify created the application.
  final DateTime createTime;

  /// The default domain for the Amplify app.
  final String defaultDomain;

  /// The description for the Amplify app.
  final String description;

  /// Enables basic authorization for the Amplify app's branches.
  final bool enableBasicAuth;

  /// Enables the auto-building of branches for the Amplify app.
  final bool enableBranchAutoBuild;

  /// The environment variables for the Amplify app.
  ///
  /// For a list of the environment variables that are accessible to Amplify by
  /// default, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/amplify-console-environment-variables.html">Amplify
  /// Environment variables</a> in the <i>Amplify Hosting User Guide</i>.
  final Map<String, String> environmentVariables;

  /// The name for the Amplify app.
  final String name;

  /// The platform for the Amplify app. For a static app, set the platform type to
  /// <code>WEB</code>. For a dynamic server-side rendered (SSR) app, set the
  /// platform type to <code>WEB_COMPUTE</code>. For an app requiring Amplify
  /// Hosting's original SSR support only, set the platform type to
  /// <code>WEB_DYNAMIC</code>.
  ///
  /// If you are deploying an SSG only app with Next.js 14 or later, you must use
  /// the platform type <code>WEB_COMPUTE</code>.
  final Platform platform;

  /// The Git repository for the Amplify app.
  final String repository;

  /// A timestamp of when Amplify updated the application.
  final DateTime updateTime;

  /// Describes the automated branch creation configuration for the Amplify app.
  final AutoBranchCreationConfig? autoBranchCreationConfig;

  /// Describes the automated branch creation glob patterns for the Amplify app.
  final List<String>? autoBranchCreationPatterns;

  /// The basic authorization credentials for branches for the Amplify app. You
  /// must base64-encode the authorization credentials and provide them in the
  /// format <code>user:password</code>.
  final String? basicAuthCredentials;

  /// Describes the content of the build specification (build spec) for the
  /// Amplify app.
  final String? buildSpec;

  /// The cache configuration for the Amplify app. If you don't specify the cache
  /// configuration <code>type</code>, Amplify uses the default
  /// <code>AMPLIFY_MANAGED</code> setting.
  final CacheConfig? cacheConfig;

  /// The Amazon Resource Name (ARN) of the IAM role for an SSR app. The Compute
  /// role allows the Amplify Hosting compute service to securely access specific
  /// Amazon Web Services resources based on the role's permissions. For more
  /// information about the SSR Compute role, see <a
  /// href="https://docs.aws.amazon.com/amplify/latest/userguide/amplify-SSR-compute-role.html">Adding
  /// an SSR Compute role</a> in the <i>Amplify User Guide</i>.
  final String? computeRoleArn;

  /// Describes the custom HTTP headers for the Amplify app.
  final String? customHeaders;

  /// Describes the custom redirect and rewrite rules for the Amplify app.
  final List<CustomRule>? customRules;

  /// Enables automated branch creation for the Amplify app.
  final bool? enableAutoBranchCreation;

  /// Automatically disconnect a branch in the Amplify console when you delete a
  /// branch from your Git repository.
  final bool? enableBranchAutoDeletion;

  /// The Amazon Resource Name (ARN) of the IAM service role for the Amplify app.
  final String? iamServiceRoleArn;

  /// The configuration details that apply to the jobs for an Amplify app.
  final JobConfig? jobConfig;

  /// Describes the information about a production branch of the Amplify app.
  final ProductionBranch? productionBranch;

  /// <note>
  /// This is for internal use.
  /// </note>
  /// The Amplify service uses this parameter to specify the authentication
  /// protocol to use to access the Git repository for an Amplify app. Amplify
  /// specifies <code>TOKEN</code> for a GitHub repository, <code>SIGV4</code> for
  /// an Amazon Web Services CodeCommit repository, and <code>SSH</code> for
  /// GitLab and Bitbucket repositories.
  final RepositoryCloneMethod? repositoryCloneMethod;

  /// The tag for the Amplify app.
  final Map<String, String>? tags;

  /// Describes the Firewall configuration for the Amplify app. Firewall support
  /// enables you to protect your hosted applications with a direct integration
  /// with WAF.
  final WafConfiguration? wafConfiguration;

  /// A timestamp of when Amplify created the webhook in your Git repository.
  final DateTime? webhookCreateTime;

  App({
    required this.appArn,
    required this.appId,
    required this.createTime,
    required this.defaultDomain,
    required this.description,
    required this.enableBasicAuth,
    required this.enableBranchAutoBuild,
    required this.environmentVariables,
    required this.name,
    required this.platform,
    required this.repository,
    required this.updateTime,
    this.autoBranchCreationConfig,
    this.autoBranchCreationPatterns,
    this.basicAuthCredentials,
    this.buildSpec,
    this.cacheConfig,
    this.computeRoleArn,
    this.customHeaders,
    this.customRules,
    this.enableAutoBranchCreation,
    this.enableBranchAutoDeletion,
    this.iamServiceRoleArn,
    this.jobConfig,
    this.productionBranch,
    this.repositoryCloneMethod,
    this.tags,
    this.wafConfiguration,
    this.webhookCreateTime,
  });

  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      appArn: (json['appArn'] as String?) ?? '',
      appId: (json['appId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      defaultDomain: (json['defaultDomain'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      enableBasicAuth: (json['enableBasicAuth'] as bool?) ?? false,
      enableBranchAutoBuild: (json['enableBranchAutoBuild'] as bool?) ?? false,
      environmentVariables:
          ((json['environmentVariables'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      name: (json['name'] as String?) ?? '',
      platform: Platform.fromString((json['platform'] as String?) ?? ''),
      repository: (json['repository'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      autoBranchCreationConfig: json['autoBranchCreationConfig'] != null
          ? AutoBranchCreationConfig.fromJson(
              json['autoBranchCreationConfig'] as Map<String, dynamic>)
          : null,
      autoBranchCreationPatterns: (json['autoBranchCreationPatterns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      basicAuthCredentials: json['basicAuthCredentials'] as String?,
      buildSpec: json['buildSpec'] as String?,
      cacheConfig: json['cacheConfig'] != null
          ? CacheConfig.fromJson(json['cacheConfig'] as Map<String, dynamic>)
          : null,
      computeRoleArn: json['computeRoleArn'] as String?,
      customHeaders: json['customHeaders'] as String?,
      customRules: (json['customRules'] as List?)
          ?.nonNulls
          .map((e) => CustomRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      enableAutoBranchCreation: json['enableAutoBranchCreation'] as bool?,
      enableBranchAutoDeletion: json['enableBranchAutoDeletion'] as bool?,
      iamServiceRoleArn: json['iamServiceRoleArn'] as String?,
      jobConfig: json['jobConfig'] != null
          ? JobConfig.fromJson(json['jobConfig'] as Map<String, dynamic>)
          : null,
      productionBranch: json['productionBranch'] != null
          ? ProductionBranch.fromJson(
              json['productionBranch'] as Map<String, dynamic>)
          : null,
      repositoryCloneMethod: (json['repositoryCloneMethod'] as String?)
          ?.let(RepositoryCloneMethod.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      wafConfiguration: json['wafConfiguration'] != null
          ? WafConfiguration.fromJson(
              json['wafConfiguration'] as Map<String, dynamic>)
          : null,
      webhookCreateTime: timeStampFromJson(json['webhookCreateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appId = this.appId;
    final createTime = this.createTime;
    final defaultDomain = this.defaultDomain;
    final description = this.description;
    final enableBasicAuth = this.enableBasicAuth;
    final enableBranchAutoBuild = this.enableBranchAutoBuild;
    final environmentVariables = this.environmentVariables;
    final name = this.name;
    final platform = this.platform;
    final repository = this.repository;
    final updateTime = this.updateTime;
    final autoBranchCreationConfig = this.autoBranchCreationConfig;
    final autoBranchCreationPatterns = this.autoBranchCreationPatterns;
    final basicAuthCredentials = this.basicAuthCredentials;
    final buildSpec = this.buildSpec;
    final cacheConfig = this.cacheConfig;
    final computeRoleArn = this.computeRoleArn;
    final customHeaders = this.customHeaders;
    final customRules = this.customRules;
    final enableAutoBranchCreation = this.enableAutoBranchCreation;
    final enableBranchAutoDeletion = this.enableBranchAutoDeletion;
    final iamServiceRoleArn = this.iamServiceRoleArn;
    final jobConfig = this.jobConfig;
    final productionBranch = this.productionBranch;
    final repositoryCloneMethod = this.repositoryCloneMethod;
    final tags = this.tags;
    final wafConfiguration = this.wafConfiguration;
    final webhookCreateTime = this.webhookCreateTime;
    return {
      'appArn': appArn,
      'appId': appId,
      'createTime': unixTimestampToJson(createTime),
      'defaultDomain': defaultDomain,
      'description': description,
      'enableBasicAuth': enableBasicAuth,
      'enableBranchAutoBuild': enableBranchAutoBuild,
      'environmentVariables': environmentVariables,
      'name': name,
      'platform': platform.value,
      'repository': repository,
      'updateTime': unixTimestampToJson(updateTime),
      if (autoBranchCreationConfig != null)
        'autoBranchCreationConfig': autoBranchCreationConfig,
      if (autoBranchCreationPatterns != null)
        'autoBranchCreationPatterns': autoBranchCreationPatterns,
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (cacheConfig != null) 'cacheConfig': cacheConfig,
      if (computeRoleArn != null) 'computeRoleArn': computeRoleArn,
      if (customHeaders != null) 'customHeaders': customHeaders,
      if (customRules != null) 'customRules': customRules,
      if (enableAutoBranchCreation != null)
        'enableAutoBranchCreation': enableAutoBranchCreation,
      if (enableBranchAutoDeletion != null)
        'enableBranchAutoDeletion': enableBranchAutoDeletion,
      if (iamServiceRoleArn != null) 'iamServiceRoleArn': iamServiceRoleArn,
      if (jobConfig != null) 'jobConfig': jobConfig,
      if (productionBranch != null) 'productionBranch': productionBranch,
      if (repositoryCloneMethod != null)
        'repositoryCloneMethod': repositoryCloneMethod.value,
      if (tags != null) 'tags': tags,
      if (wafConfiguration != null) 'wafConfiguration': wafConfiguration,
      if (webhookCreateTime != null)
        'webhookCreateTime': unixTimestampToJson(webhookCreateTime),
    };
  }
}

/// @nodoc
class Platform {
  static const web = Platform._('WEB');
  static const webDynamic = Platform._('WEB_DYNAMIC');
  static const webCompute = Platform._('WEB_COMPUTE');

  final String value;

  const Platform._(this.value);

  static const values = [web, webDynamic, webCompute];

  static Platform fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Platform._(value));

  @override
  bool operator ==(other) => other is Platform && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the information about a production branch for an Amplify app.
///
/// @nodoc
class ProductionBranch {
  /// The branch name for the production branch.
  final String? branchName;

  /// The last deploy time of the production branch.
  final DateTime? lastDeployTime;

  /// The status of the production branch.
  final String? status;

  /// The thumbnail URL for the production branch.
  final String? thumbnailUrl;

  ProductionBranch({
    this.branchName,
    this.lastDeployTime,
    this.status,
    this.thumbnailUrl,
  });

  factory ProductionBranch.fromJson(Map<String, dynamic> json) {
    return ProductionBranch(
      branchName: json['branchName'] as String?,
      lastDeployTime: timeStampFromJson(json['lastDeployTime']),
      status: json['status'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branchName = this.branchName;
    final lastDeployTime = this.lastDeployTime;
    final status = this.status;
    final thumbnailUrl = this.thumbnailUrl;
    return {
      if (branchName != null) 'branchName': branchName,
      if (lastDeployTime != null)
        'lastDeployTime': unixTimestampToJson(lastDeployTime),
      if (status != null) 'status': status,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
    };
  }
}

/// Describes the automated branch creation configuration.
///
/// @nodoc
class AutoBranchCreationConfig {
  /// The basic authorization credentials for the autocreated branch. You must
  /// base64-encode the authorization credentials and provide them in the format
  /// <code>user:password</code>.
  final String? basicAuthCredentials;

  /// The build specification (build spec) for the autocreated branch.
  final String? buildSpec;

  /// Enables auto building for the autocreated branch.
  final bool? enableAutoBuild;

  /// Enables basic authorization for the autocreated branch.
  final bool? enableBasicAuth;

  /// Enables performance mode for the branch.
  ///
  /// Performance mode optimizes for faster hosting performance by keeping content
  /// cached at the edge for a longer interval. When performance mode is enabled,
  /// hosting configuration or code changes can take up to 10 minutes to roll out.
  final bool? enablePerformanceMode;

  /// Enables pull request previews for the autocreated branch.
  final bool? enablePullRequestPreview;

  /// The environment variables for the autocreated branch.
  final Map<String, String>? environmentVariables;

  /// The framework for the autocreated branch.
  final String? framework;

  /// The Amplify environment name for the pull request.
  final String? pullRequestEnvironmentName;

  /// Describes the current stage for the autocreated branch.
  final Stage? stage;

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

  factory AutoBranchCreationConfig.fromJson(Map<String, dynamic> json) {
    return AutoBranchCreationConfig(
      basicAuthCredentials: json['basicAuthCredentials'] as String?,
      buildSpec: json['buildSpec'] as String?,
      enableAutoBuild: json['enableAutoBuild'] as bool?,
      enableBasicAuth: json['enableBasicAuth'] as bool?,
      enablePerformanceMode: json['enablePerformanceMode'] as bool?,
      enablePullRequestPreview: json['enablePullRequestPreview'] as bool?,
      environmentVariables:
          (json['environmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      framework: json['framework'] as String?,
      pullRequestEnvironmentName: json['pullRequestEnvironmentName'] as String?,
      stage: (json['stage'] as String?)?.let(Stage.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final basicAuthCredentials = this.basicAuthCredentials;
    final buildSpec = this.buildSpec;
    final enableAutoBuild = this.enableAutoBuild;
    final enableBasicAuth = this.enableBasicAuth;
    final enablePerformanceMode = this.enablePerformanceMode;
    final enablePullRequestPreview = this.enablePullRequestPreview;
    final environmentVariables = this.environmentVariables;
    final framework = this.framework;
    final pullRequestEnvironmentName = this.pullRequestEnvironmentName;
    final stage = this.stage;
    return {
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (buildSpec != null) 'buildSpec': buildSpec,
      if (enableAutoBuild != null) 'enableAutoBuild': enableAutoBuild,
      if (enableBasicAuth != null) 'enableBasicAuth': enableBasicAuth,
      if (enablePerformanceMode != null)
        'enablePerformanceMode': enablePerformanceMode,
      if (enablePullRequestPreview != null)
        'enablePullRequestPreview': enablePullRequestPreview,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (framework != null) 'framework': framework,
      if (pullRequestEnvironmentName != null)
        'pullRequestEnvironmentName': pullRequestEnvironmentName,
      if (stage != null) 'stage': stage.value,
    };
  }
}

/// @nodoc
class RepositoryCloneMethod {
  static const ssh = RepositoryCloneMethod._('SSH');
  static const token = RepositoryCloneMethod._('TOKEN');
  static const sigv4 = RepositoryCloneMethod._('SIGV4');

  final String value;

  const RepositoryCloneMethod._(this.value);

  static const values = [ssh, token, sigv4];

  static RepositoryCloneMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RepositoryCloneMethod._(value));

  @override
  bool operator ==(other) =>
      other is RepositoryCloneMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the cache configuration for an Amplify app.
///
/// For more information about how Amplify applies an optimal cache
/// configuration for your app based on the type of content that is being
/// served, see <a
/// href="https://docs.aws.amazon.com/amplify/latest/userguide/managing-cache-configuration">Managing
/// cache configuration</a> in the <i>Amplify User guide</i>.
///
/// @nodoc
class CacheConfig {
  /// The type of cache configuration to use for an Amplify app.
  ///
  /// The <code>AMPLIFY_MANAGED</code> cache configuration automatically applies
  /// an optimized cache configuration for your app based on its platform, routing
  /// rules, and rewrite rules.
  ///
  /// The <code>AMPLIFY_MANAGED_NO_COOKIES</code> cache configuration type is the
  /// same as <code>AMPLIFY_MANAGED</code>, except that it excludes all cookies
  /// from the cache key. This is the default setting.
  final CacheConfigType type;

  CacheConfig({
    required this.type,
  });

  factory CacheConfig.fromJson(Map<String, dynamic> json) {
    return CacheConfig(
      type: CacheConfigType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
    };
  }
}

/// Describes the Firewall configuration for a hosted Amplify application.
/// Firewall support enables you to protect your web applications with a direct
/// integration with WAF. For more information about using WAF protections for
/// an Amplify application, see <a
/// href="https://docs.aws.amazon.com/amplify/latest/userguide/WAF-integration.html">Firewall
/// support for hosted sites</a> in the <i>Amplify User Guide</i>.
///
/// @nodoc
class WafConfiguration {
  /// The reason for the current status of the Firewall configuration.
  final String? statusReason;

  /// The status of the process to associate or disassociate a web ACL to an
  /// Amplify app.
  final WafStatus? wafStatus;

  /// The Amazon Resource Name (ARN) for the web ACL associated with an Amplify
  /// app.
  final String? webAclArn;

  WafConfiguration({
    this.statusReason,
    this.wafStatus,
    this.webAclArn,
  });

  factory WafConfiguration.fromJson(Map<String, dynamic> json) {
    return WafConfiguration(
      statusReason: json['statusReason'] as String?,
      wafStatus: (json['wafStatus'] as String?)?.let(WafStatus.fromString),
      webAclArn: json['webAclArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusReason = this.statusReason;
    final wafStatus = this.wafStatus;
    final webAclArn = this.webAclArn;
    return {
      if (statusReason != null) 'statusReason': statusReason,
      if (wafStatus != null) 'wafStatus': wafStatus.value,
      if (webAclArn != null) 'webAclArn': webAclArn,
    };
  }
}

/// Describes the configuration details that apply to the jobs for an Amplify
/// app.
///
/// Use <code>JobConfig</code> to apply configuration to jobs, such as
/// customizing the build instance size when you create or update an Amplify
/// app. For more information about customizable build instances, see <a
/// href="https://docs.aws.amazon.com/amplify/latest/userguide/custom-build-instance.html">Custom
/// build instances</a> in the <i>Amplify User Guide</i>.
///
/// @nodoc
class JobConfig {
  /// Specifies the size of the build instance. Amplify supports three instance
  /// sizes: <code>STANDARD_8GB</code>, <code>LARGE_16GB</code>, and
  /// <code>XLARGE_72GB</code>. If you don't specify a value, Amplify uses the
  /// <code>STANDARD_8GB</code> default.
  ///
  /// The following list describes the CPU, memory, and storage capacity for each
  /// build instance type:
  /// <dl> <dt>STANDARD_8GB</dt> <dd>
  /// <ul>
  /// <li>
  /// vCPUs: 4
  /// </li>
  /// <li>
  /// Memory: 8 GiB
  /// </li>
  /// <li>
  /// Disk space: 128 GB
  /// </li>
  /// </ul> </dd> <dt>LARGE_16GB</dt> <dd>
  /// <ul>
  /// <li>
  /// vCPUs: 8
  /// </li>
  /// <li>
  /// Memory: 16 GiB
  /// </li>
  /// <li>
  /// Disk space: 128 GB
  /// </li>
  /// </ul> </dd> <dt>XLARGE_72GB</dt> <dd>
  /// <ul>
  /// <li>
  /// vCPUs: 36
  /// </li>
  /// <li>
  /// Memory: 72 GiB
  /// </li>
  /// <li>
  /// Disk space: 256 GB
  /// </li>
  /// </ul> </dd> </dl>
  final BuildComputeType buildComputeType;

  JobConfig({
    required this.buildComputeType,
  });

  factory JobConfig.fromJson(Map<String, dynamic> json) {
    return JobConfig(
      buildComputeType: BuildComputeType.fromString(
          (json['buildComputeType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final buildComputeType = this.buildComputeType;
    return {
      'buildComputeType': buildComputeType.value,
    };
  }
}

/// @nodoc
class BuildComputeType {
  static const standard_8gb = BuildComputeType._('STANDARD_8GB');
  static const large_16gb = BuildComputeType._('LARGE_16GB');
  static const xlarge_72gb = BuildComputeType._('XLARGE_72GB');

  final String value;

  const BuildComputeType._(this.value);

  static const values = [standard_8gb, large_16gb, xlarge_72gb];

  static BuildComputeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BuildComputeType._(value));

  @override
  bool operator ==(other) => other is BuildComputeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class WafStatus {
  static const associating = WafStatus._('ASSOCIATING');
  static const associationFailed = WafStatus._('ASSOCIATION_FAILED');
  static const associationSuccess = WafStatus._('ASSOCIATION_SUCCESS');
  static const disassociating = WafStatus._('DISASSOCIATING');
  static const disassociationFailed = WafStatus._('DISASSOCIATION_FAILED');

  final String value;

  const WafStatus._(this.value);

  static const values = [
    associating,
    associationFailed,
    associationSuccess,
    disassociating,
    disassociationFailed
  ];

  static WafStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => WafStatus._(value));

  @override
  bool operator ==(other) => other is WafStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CacheConfigType {
  static const amplifyManaged = CacheConfigType._('AMPLIFY_MANAGED');
  static const amplifyManagedNoCookies =
      CacheConfigType._('AMPLIFY_MANAGED_NO_COOKIES');

  final String value;

  const CacheConfigType._(this.value);

  static const values = [amplifyManaged, amplifyManagedNoCookies];

  static CacheConfigType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CacheConfigType._(value));

  @override
  bool operator ==(other) => other is CacheConfigType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a custom rewrite or redirect rule.
///
/// @nodoc
class CustomRule {
  /// The source pattern for a URL rewrite or redirect rule.
  final String source;

  /// The target pattern for a URL rewrite or redirect rule.
  final String target;

  /// The condition for a URL rewrite or redirect rule, such as a country code.
  final String? condition;

  /// The status code for a URL rewrite or redirect rule.
  /// <dl> <dt>200</dt> <dd>
  /// Represents a 200 rewrite rule.
  /// </dd> <dt>301</dt> <dd>
  /// Represents a 301 (moved permanently) redirect rule. This and all future
  /// requests should be directed to the target URL.
  /// </dd> <dt>302</dt> <dd>
  /// Represents a 302 temporary redirect rule.
  /// </dd> <dt>404</dt> <dd>
  /// Represents a 404 redirect rule.
  /// </dd> <dt>404-200</dt> <dd>
  /// Represents a 404 rewrite rule.
  /// </dd> </dl>
  final String? status;

  CustomRule({
    required this.source,
    required this.target,
    this.condition,
    this.status,
  });

  factory CustomRule.fromJson(Map<String, dynamic> json) {
    return CustomRule(
      source: (json['source'] as String?) ?? '',
      target: (json['target'] as String?) ?? '',
      condition: json['condition'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final target = this.target;
    final condition = this.condition;
    final status = this.status;
    return {
      'source': source,
      'target': target,
      if (condition != null) 'condition': condition,
      if (status != null) 'status': status,
    };
  }
}

/// Describes the summary for an execution job for an Amplify app.
///
/// @nodoc
class JobSummary {
  /// The commit ID from a third-party repository provider for the job.
  final String commitId;

  /// The commit message from a third-party repository provider for the job.
  final String commitMessage;

  /// The commit date and time for the job.
  final DateTime commitTime;

  /// The Amazon Resource Name (ARN) for the job.
  final String jobArn;

  /// The unique ID for the job.
  final String jobId;

  /// The type for the job. If the value is <code>RELEASE</code>, the job was
  /// manually released from its source by using the <code>StartJob</code> API.
  /// This value is available only for apps that are connected to a repository.
  ///
  /// If the value is <code>RETRY</code>, the job was manually retried using the
  /// <code>StartJob</code> API. If the value is <code>WEB_HOOK</code>, the job
  /// was automatically triggered by webhooks. If the value is
  /// <code>MANUAL</code>, the job is for a manually deployed app. Manually
  /// deployed apps are not connected to a Git repository.
  final JobType jobType;

  /// The start date and time for the job.
  final DateTime startTime;

  /// The current status for the job.
  final JobStatus status;

  /// The end date and time for the job.
  final DateTime? endTime;

  /// The source URL for the files to deploy. The source URL can be either an HTTP
  /// GET URL that is publicly accessible and downloads a single .zip file, or an
  /// Amazon S3 bucket and prefix.
  final String? sourceUrl;

  /// The type of source specified by the <code>sourceURL</code>. If the value is
  /// <code>ZIP</code>, the source is a .zip file. If the value is
  /// <code>BUCKET_PREFIX</code>, the source is an Amazon S3 bucket and prefix. If
  /// no value is specified, the default is <code>ZIP</code>.
  final SourceUrlType? sourceUrlType;

  JobSummary({
    required this.commitId,
    required this.commitMessage,
    required this.commitTime,
    required this.jobArn,
    required this.jobId,
    required this.jobType,
    required this.startTime,
    required this.status,
    this.endTime,
    this.sourceUrl,
    this.sourceUrlType,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      commitId: (json['commitId'] as String?) ?? '',
      commitMessage: (json['commitMessage'] as String?) ?? '',
      commitTime: nonNullableTimeStampFromJson(json['commitTime'] ?? 0),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      jobType: JobType.fromString((json['jobType'] as String?) ?? ''),
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      endTime: timeStampFromJson(json['endTime']),
      sourceUrl: json['sourceUrl'] as String?,
      sourceUrlType:
          (json['sourceUrlType'] as String?)?.let(SourceUrlType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final commitId = this.commitId;
    final commitMessage = this.commitMessage;
    final commitTime = this.commitTime;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobType = this.jobType;
    final startTime = this.startTime;
    final status = this.status;
    final endTime = this.endTime;
    final sourceUrl = this.sourceUrl;
    final sourceUrlType = this.sourceUrlType;
    return {
      'commitId': commitId,
      'commitMessage': commitMessage,
      'commitTime': unixTimestampToJson(commitTime),
      'jobArn': jobArn,
      'jobId': jobId,
      'jobType': jobType.value,
      'startTime': unixTimestampToJson(startTime),
      'status': status.value,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (sourceUrl != null) 'sourceUrl': sourceUrl,
      if (sourceUrlType != null) 'sourceUrlType': sourceUrlType.value,
    };
  }
}

/// @nodoc
class JobStatus {
  static const created = JobStatus._('CREATED');
  static const pending = JobStatus._('PENDING');
  static const provisioning = JobStatus._('PROVISIONING');
  static const running = JobStatus._('RUNNING');
  static const failed = JobStatus._('FAILED');
  static const succeed = JobStatus._('SUCCEED');
  static const cancelling = JobStatus._('CANCELLING');
  static const cancelled = JobStatus._('CANCELLED');

  final String value;

  const JobStatus._(this.value);

  static const values = [
    created,
    pending,
    provisioning,
    running,
    failed,
    succeed,
    cancelling,
    cancelled
  ];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class JobType {
  static const release = JobType._('RELEASE');
  static const retry = JobType._('RETRY');
  static const manual = JobType._('MANUAL');
  static const webHook = JobType._('WEB_HOOK');

  final String value;

  const JobType._(this.value);

  static const values = [release, retry, manual, webHook];

  static JobType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobType._(value));

  @override
  bool operator ==(other) => other is JobType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SourceUrlType {
  static const zip = SourceUrlType._('ZIP');
  static const bucketPrefix = SourceUrlType._('BUCKET_PREFIX');

  final String value;

  const SourceUrlType._(this.value);

  static const values = [zip, bucketPrefix];

  static SourceUrlType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SourceUrlType._(value));

  @override
  bool operator ==(other) => other is SourceUrlType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the backend environment associated with a <code>Branch</code> of a
/// Gen 1 Amplify app. Amplify Gen 1 applications are created using Amplify
/// Studio or the Amplify command line interface (CLI).
///
/// @nodoc
class BackendEnvironment {
  /// The Amazon Resource Name (ARN) for a backend environment that is part of an
  /// Amplify app.
  final String backendEnvironmentArn;

  /// The creation date and time for a backend environment that is part of an
  /// Amplify app.
  final DateTime createTime;

  /// The name for a backend environment that is part of an Amplify app.
  final String environmentName;

  /// The last updated date and time for a backend environment that is part of an
  /// Amplify app.
  final DateTime updateTime;

  /// The name of deployment artifacts.
  final String? deploymentArtifacts;

  /// The AWS CloudFormation stack name of a backend environment.
  final String? stackName;

  BackendEnvironment({
    required this.backendEnvironmentArn,
    required this.createTime,
    required this.environmentName,
    required this.updateTime,
    this.deploymentArtifacts,
    this.stackName,
  });

  factory BackendEnvironment.fromJson(Map<String, dynamic> json) {
    return BackendEnvironment(
      backendEnvironmentArn: (json['backendEnvironmentArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      environmentName: (json['environmentName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      deploymentArtifacts: json['deploymentArtifacts'] as String?,
      stackName: json['stackName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backendEnvironmentArn = this.backendEnvironmentArn;
    final createTime = this.createTime;
    final environmentName = this.environmentName;
    final updateTime = this.updateTime;
    final deploymentArtifacts = this.deploymentArtifacts;
    final stackName = this.stackName;
    return {
      'backendEnvironmentArn': backendEnvironmentArn,
      'createTime': unixTimestampToJson(createTime),
      'environmentName': environmentName,
      'updateTime': unixTimestampToJson(updateTime),
      if (deploymentArtifacts != null)
        'deploymentArtifacts': deploymentArtifacts,
      if (stackName != null) 'stackName': stackName,
    };
  }
}

/// Describes an artifact.
///
/// @nodoc
class Artifact {
  /// The file name for the artifact.
  final String artifactFileName;

  /// The unique ID for the artifact.
  final String artifactId;

  Artifact({
    required this.artifactFileName,
    required this.artifactId,
  });

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      artifactFileName: (json['artifactFileName'] as String?) ?? '',
      artifactId: (json['artifactId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final artifactFileName = this.artifactFileName;
    final artifactId = this.artifactId;
    return {
      'artifactFileName': artifactFileName,
      'artifactId': artifactId,
    };
  }
}

/// Describes an execution job for an Amplify app.
///
/// @nodoc
class Job {
  /// The execution steps for an execution job, for an Amplify app.
  final List<Step> steps;

  /// Describes the summary for an execution job for an Amplify app.
  final JobSummary summary;

  Job({
    required this.steps,
    required this.summary,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      steps: ((json['steps'] as List?) ?? const [])
          .nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: JobSummary.fromJson((json['summary'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final steps = this.steps;
    final summary = this.summary;
    return {
      'steps': steps,
      'summary': summary,
    };
  }
}

/// Describes an execution step, for an execution job, for an Amplify app.
///
/// @nodoc
class Step {
  /// The end date and time of the execution step.
  final DateTime endTime;

  /// The start date and time of the execution step.
  final DateTime startTime;

  /// The status of the execution step.
  final JobStatus status;

  /// The name of the execution step.
  final String stepName;

  /// The URL to the build artifact for the execution step.
  final String? artifactsUrl;

  /// The context for the current step. Includes a build image if the step is
  /// build.
  final String? context;

  /// The URL to the logs for the execution step.
  final String? logUrl;

  /// The list of screenshot URLs for the execution step, if relevant.
  final Map<String, String>? screenshots;

  /// The reason for the current step status.
  final String? statusReason;

  /// The URL to the test artifact for the execution step.
  final String? testArtifactsUrl;

  /// The URL to the test configuration for the execution step.
  final String? testConfigUrl;

  Step({
    required this.endTime,
    required this.startTime,
    required this.status,
    required this.stepName,
    this.artifactsUrl,
    this.context,
    this.logUrl,
    this.screenshots,
    this.statusReason,
    this.testArtifactsUrl,
    this.testConfigUrl,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      endTime: nonNullableTimeStampFromJson(json['endTime'] ?? 0),
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      stepName: (json['stepName'] as String?) ?? '',
      artifactsUrl: json['artifactsUrl'] as String?,
      context: json['context'] as String?,
      logUrl: json['logUrl'] as String?,
      screenshots: (json['screenshots'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      statusReason: json['statusReason'] as String?,
      testArtifactsUrl: json['testArtifactsUrl'] as String?,
      testConfigUrl: json['testConfigUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    final status = this.status;
    final stepName = this.stepName;
    final artifactsUrl = this.artifactsUrl;
    final context = this.context;
    final logUrl = this.logUrl;
    final screenshots = this.screenshots;
    final statusReason = this.statusReason;
    final testArtifactsUrl = this.testArtifactsUrl;
    final testConfigUrl = this.testConfigUrl;
    return {
      'endTime': unixTimestampToJson(endTime),
      'startTime': unixTimestampToJson(startTime),
      'status': status.value,
      'stepName': stepName,
      if (artifactsUrl != null) 'artifactsUrl': artifactsUrl,
      if (context != null) 'context': context,
      if (logUrl != null) 'logUrl': logUrl,
      if (screenshots != null) 'screenshots': screenshots,
      if (statusReason != null) 'statusReason': statusReason,
      if (testArtifactsUrl != null) 'testArtifactsUrl': testArtifactsUrl,
      if (testConfigUrl != null) 'testConfigUrl': testConfigUrl,
    };
  }
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

/// @nodoc
class DependentServiceFailureException extends _s.GenericAwsException {
  DependentServiceFailureException({String? type, String? message})
      : super(
            type: type,
            code: 'DependentServiceFailureException',
            message: message);
}

/// @nodoc
class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

/// @nodoc
class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

/// @nodoc
class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
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
