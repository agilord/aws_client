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

import 'v2010_12_01.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS Elastic Beanstalk makes it easy for you to create, deploy, and manage
/// scalable, fault-tolerant applications running on the Amazon Web Services
/// cloud.
class ElasticBeanstalk {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ElasticBeanstalk({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'elasticbeanstalk',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Cancels in-progress environment configuration update or application
  /// version deployment.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentId] :
  /// This specifies the ID of the environment with the in-progress update that
  /// you want to cancel.
  ///
  /// Parameter [environmentName] :
  /// This specifies the name of the environment with the in-progress update
  /// that you want to cancel.
  Future<void> abortEnvironmentUpdate({
    String? environmentId,
    String? environmentName,
  }) async {
    final $request = <String, dynamic>{};
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    await _protocol.send(
      $request,
      action: 'AbortEnvironmentUpdate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AbortEnvironmentUpdateMessage'],
      shapes: shapes,
    );
  }

  /// Applies a scheduled managed action immediately. A managed action can be
  /// applied only if its status is <code>Scheduled</code>. Get the status and
  /// action ID of a managed action with
  /// <a>DescribeEnvironmentManagedActions</a>.
  ///
  /// May throw [ElasticBeanstalkServiceException].
  /// May throw [ManagedActionInvalidStateException].
  ///
  /// Parameter [actionId] :
  /// The action ID of the scheduled managed action to execute.
  ///
  /// Parameter [environmentId] :
  /// The environment ID of the target environment.
  ///
  /// Parameter [environmentName] :
  /// The name of the target environment.
  Future<ApplyEnvironmentManagedActionResult> applyEnvironmentManagedAction({
    required String actionId,
    String? environmentId,
    String? environmentName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ActionId'] = actionId;
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ApplyEnvironmentManagedAction',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ApplyEnvironmentManagedActionRequest'],
      shapes: shapes,
      resultWrapper: 'ApplyEnvironmentManagedActionResult',
    );
    return ApplyEnvironmentManagedActionResult.fromXml($result);
  }

  /// Add or change the operations role used by an environment. After this call
  /// is made, Elastic Beanstalk uses the associated operations role for
  /// permissions to downstream services during subsequent calls acting on this
  /// environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations
  /// roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to which to set the operations role.
  ///
  /// Parameter [operationsRole] :
  /// The Amazon Resource Name (ARN) of an existing IAM role to be used as the
  /// environment's operations role.
  Future<void> associateEnvironmentOperationsRole({
    required String environmentName,
    required String operationsRole,
  }) async {
    final $request = <String, dynamic>{};
    $request['EnvironmentName'] = environmentName;
    $request['OperationsRole'] = operationsRole;
    await _protocol.send(
      $request,
      action: 'AssociateEnvironmentOperationsRole',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AssociateEnvironmentOperationsRoleMessage'],
      shapes: shapes,
    );
  }

  /// Checks if the specified CNAME is available.
  ///
  /// Parameter [cNAMEPrefix] :
  /// The prefix used when this CNAME is reserved.
  Future<CheckDNSAvailabilityResultMessage> checkDNSAvailability({
    required String cNAMEPrefix,
  }) async {
    final $request = <String, dynamic>{};
    $request['CNAMEPrefix'] = cNAMEPrefix;
    final $result = await _protocol.send(
      $request,
      action: 'CheckDNSAvailability',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CheckDNSAvailabilityMessage'],
      shapes: shapes,
      resultWrapper: 'CheckDNSAvailabilityResult',
    );
    return CheckDNSAvailabilityResultMessage.fromXml($result);
  }

  /// Create or update a group of environments that each run a separate
  /// component of a single application. Takes a list of version labels that
  /// specify application source bundles for each of the environments to create
  /// or update. The name of each environment and other required information
  /// must be included in the source bundles in an environment manifest named
  /// <code>env.yaml</code>. See <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-mgmt-compose.html">Compose
  /// Environments</a> for details.
  ///
  /// May throw [TooManyEnvironmentsException].
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to which the specified source bundles belong.
  ///
  /// Parameter [groupName] :
  /// The name of the group to which the target environments belong. Specify a
  /// group name only if the environment name defined in each target
  /// environment's manifest ends with a + (plus) character. See <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment
  /// Manifest (env.yaml)</a> for details.
  ///
  /// Parameter [versionLabels] :
  /// A list of version labels, specifying one or more application source
  /// bundles that belong to the target application. Each source bundle must
  /// include an environment manifest that specifies the name of the environment
  /// and the name of the solution stack to use, and optionally can specify
  /// environment links to create.
  Future<EnvironmentDescriptionsMessage> composeEnvironments({
    String? applicationName,
    String? groupName,
    List<String>? versionLabels,
  }) async {
    final $request = <String, dynamic>{};
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    groupName?.also((arg) => $request['GroupName'] = arg);
    versionLabels?.also((arg) => $request['VersionLabels'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ComposeEnvironments',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ComposeEnvironmentsMessage'],
      shapes: shapes,
      resultWrapper: 'ComposeEnvironmentsResult',
    );
    return EnvironmentDescriptionsMessage.fromXml($result);
  }

  /// Creates an application that has one configuration template named
  /// <code>default</code> and no application versions.
  ///
  /// May throw [TooManyApplicationsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application. Must be unique within your account.
  ///
  /// Parameter [description] :
  /// Your description of the application.
  ///
  /// Parameter [resourceLifecycleConfig] :
  /// Specifies an application resource lifecycle configuration to prevent your
  /// application from accumulating too many versions.
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to the application.
  ///
  /// Elastic Beanstalk applies these tags only to the application. Environments
  /// that you create in the application don't inherit the tags.
  Future<ApplicationDescriptionMessage> createApplication({
    required String applicationName,
    String? description,
    ApplicationResourceLifecycleConfig? resourceLifecycleConfig,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    description?.also((arg) => $request['Description'] = arg);
    resourceLifecycleConfig
        ?.also((arg) => $request['ResourceLifecycleConfig'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateApplication',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateApplicationMessage'],
      shapes: shapes,
      resultWrapper: 'CreateApplicationResult',
    );
    return ApplicationDescriptionMessage.fromXml($result);
  }

  /// Creates an application version for the specified application. You can
  /// create an application version from a source bundle in Amazon S3, a commit
  /// in AWS CodeCommit, or the output of an AWS CodeBuild build as follows:
  ///
  /// Specify a commit in an AWS CodeCommit repository with
  /// <code>SourceBuildInformation</code>.
  ///
  /// Specify a build in an AWS CodeBuild with
  /// <code>SourceBuildInformation</code> and <code>BuildConfiguration</code>.
  ///
  /// Specify a source bundle in S3 with <code>SourceBundle</code>
  ///
  /// Omit both <code>SourceBuildInformation</code> and
  /// <code>SourceBundle</code> to use the default sample application.
  /// <note>
  /// After you create an application version with a specified Amazon S3 bucket
  /// and key location, you can't change that Amazon S3 location. If you change
  /// the Amazon S3 location, you receive an exception when you attempt to
  /// launch an environment from the application version.
  /// </note>
  ///
  /// May throw [TooManyApplicationsException].
  /// May throw [TooManyApplicationVersionsException].
  /// May throw [InsufficientPrivilegesException].
  /// May throw [S3LocationNotInServiceRegionException].
  /// May throw [CodeBuildNotInServiceRegionException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application. If no application is found with this name,
  /// and <code>AutoCreateApplication</code> is <code>false</code>, returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [versionLabel] :
  /// A label identifying this version.
  ///
  /// Constraint: Must be unique per application. If an application version
  /// already exists with this label for the specified application, AWS Elastic
  /// Beanstalk returns an <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [autoCreateApplication] :
  /// Set to <code>true</code> to create an application with the specified name
  /// if it doesn't already exist.
  ///
  /// Parameter [buildConfiguration] :
  /// Settings for an AWS CodeBuild build.
  ///
  /// Parameter [description] :
  /// A description of this application version.
  ///
  /// Parameter [process] :
  /// Pre-processes and validates the environment manifest
  /// (<code>env.yaml</code>) and configuration files (<code>*.config</code>
  /// files in the <code>.ebextensions</code> folder) in the source bundle.
  /// Validating configuration files can identify issues prior to deploying the
  /// application version to an environment.
  ///
  /// You must turn processing on for application versions that you create using
  /// AWS CodeBuild or AWS CodeCommit. For application versions built from a
  /// source bundle in Amazon S3, processing is optional.
  /// <note>
  /// The <code>Process</code> option validates Elastic Beanstalk configuration
  /// files. It doesn't validate your application's configuration files, like
  /// proxy server or Docker configuration.
  /// </note>
  ///
  /// Parameter [sourceBuildInformation] :
  /// Specify a commit in an AWS CodeCommit Git repository to use as the source
  /// code for the application version.
  ///
  /// Parameter [sourceBundle] :
  /// The Amazon S3 bucket and key that identify the location of the source
  /// bundle for this version.
  /// <note>
  /// The Amazon S3 bucket must be in the same region as the environment.
  /// </note>
  /// Specify a source bundle in S3 or a commit in an AWS CodeCommit repository
  /// (with <code>SourceBuildInformation</code>), but not both. If neither
  /// <code>SourceBundle</code> nor <code>SourceBuildInformation</code> are
  /// provided, Elastic Beanstalk uses a sample application.
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to the application version.
  ///
  /// Elastic Beanstalk applies these tags only to the application version.
  /// Environments that use the application version don't inherit the tags.
  Future<ApplicationVersionDescriptionMessage> createApplicationVersion({
    required String applicationName,
    required String versionLabel,
    bool? autoCreateApplication,
    BuildConfiguration? buildConfiguration,
    String? description,
    bool? process,
    SourceBuildInformation? sourceBuildInformation,
    S3Location? sourceBundle,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    $request['VersionLabel'] = versionLabel;
    autoCreateApplication
        ?.also((arg) => $request['AutoCreateApplication'] = arg);
    buildConfiguration?.also((arg) => $request['BuildConfiguration'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    process?.also((arg) => $request['Process'] = arg);
    sourceBuildInformation
        ?.also((arg) => $request['SourceBuildInformation'] = arg);
    sourceBundle?.also((arg) => $request['SourceBundle'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateApplicationVersion',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateApplicationVersionMessage'],
      shapes: shapes,
      resultWrapper: 'CreateApplicationVersionResult',
    );
    return ApplicationVersionDescriptionMessage.fromXml($result);
  }

  /// Creates an AWS Elastic Beanstalk configuration template, associated with a
  /// specific Elastic Beanstalk application. You define application
  /// configuration settings in a configuration template. You can then use the
  /// configuration template to deploy different versions of the application
  /// with the same configuration settings.
  ///
  /// Templates aren't associated with any environment. The
  /// <code>EnvironmentName</code> response element is always <code>null</code>.
  ///
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeConfigurationOptions</a>
  /// </li>
  /// <li>
  /// <a>DescribeConfigurationSettings</a>
  /// </li>
  /// <li>
  /// <a>ListAvailableSolutionStacks</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [TooManyBucketsException].
  /// May throw [TooManyConfigurationTemplatesException].
  ///
  /// Parameter [applicationName] :
  /// The name of the Elastic Beanstalk application to associate with this
  /// configuration template.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template.
  ///
  /// Constraint: This name must be unique per application.
  ///
  /// Parameter [description] :
  /// An optional description for this configuration.
  ///
  /// Parameter [environmentId] :
  /// The ID of an environment whose settings you want to use to create the
  /// configuration template. You must specify <code>EnvironmentId</code> if you
  /// don't specify <code>PlatformArn</code>, <code>SolutionStackName</code>, or
  /// <code>SourceConfiguration</code>.
  ///
  /// Parameter [optionSettings] :
  /// Option values for the Elastic Beanstalk configuration, such as the
  /// instance type. If specified, these values override the values obtained
  /// from the solution stack or the source configuration template. For a
  /// complete list of Elastic Beanstalk configuration options, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html">Option
  /// Values</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
  ///
  /// Parameter [platformArn] :
  /// The Amazon Resource Name (ARN) of the custom platform. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/custom-platforms.html">
  /// Custom Platforms</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
  /// <note>
  /// If you specify <code>PlatformArn</code>, then don't specify
  /// <code>SolutionStackName</code>.
  /// </note>
  ///
  /// Parameter [solutionStackName] :
  /// The name of an Elastic Beanstalk solution stack (platform version) that
  /// this configuration uses. For example, <code>64bit Amazon Linux 2013.09
  /// running Tomcat 7 Java 7</code>. A solution stack specifies the operating
  /// system, runtime, and application server for a configuration template. It
  /// also determines the set of configuration options as well as the possible
  /// and default values. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html">Supported
  /// Platforms</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
  ///
  /// You must specify <code>SolutionStackName</code> if you don't specify
  /// <code>PlatformArn</code>, <code>EnvironmentId</code>, or
  /// <code>SourceConfiguration</code>.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/api/API_ListAvailableSolutionStacks.html">
  /// <code>ListAvailableSolutionStacks</code> </a> API to obtain a list of
  /// available solution stacks.
  ///
  /// Parameter [sourceConfiguration] :
  /// An Elastic Beanstalk configuration template to base this one on. If
  /// specified, Elastic Beanstalk uses the configuration values from the
  /// specified configuration template to create a new configuration.
  ///
  /// Values specified in <code>OptionSettings</code> override any values
  /// obtained from the <code>SourceConfiguration</code>.
  ///
  /// You must specify <code>SourceConfiguration</code> if you don't specify
  /// <code>PlatformArn</code>, <code>EnvironmentId</code>, or
  /// <code>SolutionStackName</code>.
  ///
  /// Constraint: If both solution stack name and source configuration are
  /// specified, the solution stack of the source configuration template must
  /// match the specified solution stack name.
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to the configuration template.
  Future<ConfigurationSettingsDescription> createConfigurationTemplate({
    required String applicationName,
    required String templateName,
    String? description,
    String? environmentId,
    List<ConfigurationOptionSetting>? optionSettings,
    String? platformArn,
    String? solutionStackName,
    SourceConfiguration? sourceConfiguration,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    $request['TemplateName'] = templateName;
    description?.also((arg) => $request['Description'] = arg);
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    solutionStackName?.also((arg) => $request['SolutionStackName'] = arg);
    sourceConfiguration?.also((arg) => $request['SourceConfiguration'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateConfigurationTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateConfigurationTemplateMessage'],
      shapes: shapes,
      resultWrapper: 'CreateConfigurationTemplateResult',
    );
    return ConfigurationSettingsDescription.fromXml($result);
  }

  /// Launches an AWS Elastic Beanstalk environment for the specified
  /// application using the specified configuration.
  ///
  /// May throw [TooManyEnvironmentsException].
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application that is associated with this environment.
  ///
  /// Parameter [cNAMEPrefix] :
  /// If specified, the environment attempts to use this value as the prefix for
  /// the CNAME in your Elastic Beanstalk environment URL. If not specified, the
  /// CNAME is generated automatically by appending a random alphanumeric string
  /// to the environment name.
  ///
  /// Parameter [description] :
  /// Your description for this environment.
  ///
  /// Parameter [environmentName] :
  /// A unique name for the environment.
  ///
  /// Constraint: Must be from 4 to 40 characters in length. The name can
  /// contain only letters, numbers, and hyphens. It can't start or end with a
  /// hyphen. This name must be unique within a region in your account. If the
  /// specified name already exists in the region, Elastic Beanstalk returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// If you don't specify the <code>CNAMEPrefix</code> parameter, the
  /// environment name becomes part of the CNAME, and therefore part of the
  /// visible URL for your application.
  ///
  /// Parameter [groupName] :
  /// The name of the group to which the target environment belongs. Specify a
  /// group name only if the environment's name is specified in an environment
  /// manifest and not with the environment name parameter. See <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment
  /// Manifest (env.yaml)</a> for details.
  ///
  /// Parameter [operationsRole] :
  /// The Amazon Resource Name (ARN) of an existing IAM role to be used as the
  /// environment's operations role. If specified, Elastic Beanstalk uses the
  /// operations role for permissions to downstream services during this call
  /// and during subsequent calls acting on this environment. To specify an
  /// operations role, you must have the <code>iam:PassRole</code> permission
  /// for the role. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations
  /// roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
  ///
  /// Parameter [optionSettings] :
  /// If specified, AWS Elastic Beanstalk sets the specified configuration
  /// options to the requested value in the configuration set for the new
  /// environment. These override the values obtained from the solution stack or
  /// the configuration template.
  ///
  /// Parameter [optionsToRemove] :
  /// A list of custom user-defined configuration options to remove from the
  /// configuration set for this new environment.
  ///
  /// Parameter [platformArn] :
  /// The Amazon Resource Name (ARN) of the custom platform to use with the
  /// environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/custom-platforms.html">Custom
  /// Platforms</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
  /// <note>
  /// If you specify <code>PlatformArn</code>, don't specify
  /// <code>SolutionStackName</code>.
  /// </note>
  ///
  /// Parameter [solutionStackName] :
  /// The name of an Elastic Beanstalk solution stack (platform version) to use
  /// with the environment. If specified, Elastic Beanstalk sets the
  /// configuration values to the default values associated with the specified
  /// solution stack. For a list of current solution stacks, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html">Elastic
  /// Beanstalk Supported Platforms</a> in the <i>AWS Elastic Beanstalk
  /// Platforms</i> guide.
  /// <note>
  /// If you specify <code>SolutionStackName</code>, don't specify
  /// <code>PlatformArn</code> or <code>TemplateName</code>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to resources in the environment.
  ///
  /// Parameter [templateName] :
  /// The name of the Elastic Beanstalk configuration template to use with the
  /// environment.
  /// <note>
  /// If you specify <code>TemplateName</code>, then don't specify
  /// <code>SolutionStackName</code>.
  /// </note>
  ///
  /// Parameter [tier] :
  /// Specifies the tier to use in creating this environment. The environment
  /// tier that you choose determines whether Elastic Beanstalk provisions
  /// resources to support a web application that handles HTTP(S) requests or a
  /// web application that handles background-processing tasks.
  ///
  /// Parameter [versionLabel] :
  /// The name of the application version to deploy.
  ///
  /// Default: If not specified, Elastic Beanstalk attempts to deploy the sample
  /// application.
  Future<EnvironmentDescription> createEnvironment({
    required String applicationName,
    String? cNAMEPrefix,
    String? description,
    String? environmentName,
    String? groupName,
    String? operationsRole,
    List<ConfigurationOptionSetting>? optionSettings,
    List<OptionSpecification>? optionsToRemove,
    String? platformArn,
    String? solutionStackName,
    List<Tag>? tags,
    String? templateName,
    EnvironmentTier? tier,
    String? versionLabel,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    cNAMEPrefix?.also((arg) => $request['CNAMEPrefix'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    groupName?.also((arg) => $request['GroupName'] = arg);
    operationsRole?.also((arg) => $request['OperationsRole'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    optionsToRemove?.also((arg) => $request['OptionsToRemove'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    solutionStackName?.also((arg) => $request['SolutionStackName'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    tier?.also((arg) => $request['Tier'] = arg);
    versionLabel?.also((arg) => $request['VersionLabel'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateEnvironment',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateEnvironmentMessage'],
      shapes: shapes,
      resultWrapper: 'CreateEnvironmentResult',
    );
    return EnvironmentDescription.fromXml($result);
  }

  /// Create a new version of your custom platform.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ElasticBeanstalkServiceException].
  /// May throw [TooManyPlatformsException].
  ///
  /// Parameter [platformDefinitionBundle] :
  /// The location of the platform definition archive in Amazon S3.
  ///
  /// Parameter [platformName] :
  /// The name of your custom platform.
  ///
  /// Parameter [platformVersion] :
  /// The number, such as 1.0.2, for the new platform version.
  ///
  /// Parameter [environmentName] :
  /// The name of the builder environment.
  ///
  /// Parameter [optionSettings] :
  /// The configuration option settings to apply to the builder environment.
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to the new platform version.
  ///
  /// Elastic Beanstalk applies these tags only to the platform version.
  /// Environments that you create using the platform version don't inherit the
  /// tags.
  Future<CreatePlatformVersionResult> createPlatformVersion({
    required S3Location platformDefinitionBundle,
    required String platformName,
    required String platformVersion,
    String? environmentName,
    List<ConfigurationOptionSetting>? optionSettings,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['PlatformDefinitionBundle'] = platformDefinitionBundle;
    $request['PlatformName'] = platformName;
    $request['PlatformVersion'] = platformVersion;
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreatePlatformVersion',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreatePlatformVersionRequest'],
      shapes: shapes,
      resultWrapper: 'CreatePlatformVersionResult',
    );
    return CreatePlatformVersionResult.fromXml($result);
  }

  /// Creates a bucket in Amazon S3 to store application versions, logs, and
  /// other files used by Elastic Beanstalk environments. The Elastic Beanstalk
  /// console and EB CLI call this API the first time you create an environment
  /// in a region. If the storage location already exists,
  /// <code>CreateStorageLocation</code> still returns the bucket name but does
  /// not create a new bucket.
  ///
  /// May throw [TooManyBucketsException].
  /// May throw [S3SubscriptionRequiredException].
  /// May throw [InsufficientPrivilegesException].
  Future<CreateStorageLocationResultMessage> createStorageLocation() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'CreateStorageLocation',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'CreateStorageLocationResult',
    );
    return CreateStorageLocationResultMessage.fromXml($result);
  }

  /// Deletes the specified application along with all associated versions and
  /// configurations. The application versions will not be deleted from your
  /// Amazon S3 bucket.
  /// <note>
  /// You cannot delete an application that has a running environment.
  /// </note>
  ///
  /// May throw [OperationInProgressException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to delete.
  ///
  /// Parameter [terminateEnvByForce] :
  /// When set to true, running environments will be terminated before deleting
  /// the application.
  Future<void> deleteApplication({
    required String applicationName,
    bool? terminateEnvByForce,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    terminateEnvByForce?.also((arg) => $request['TerminateEnvByForce'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteApplication',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteApplicationMessage'],
      shapes: shapes,
    );
  }

  /// Deletes the specified version from the specified application.
  /// <note>
  /// You cannot delete an application version that is associated with a running
  /// environment.
  /// </note>
  ///
  /// May throw [SourceBundleDeletionException].
  /// May throw [InsufficientPrivilegesException].
  /// May throw [OperationInProgressException].
  /// May throw [S3LocationNotInServiceRegionException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to which the version belongs.
  ///
  /// Parameter [versionLabel] :
  /// The label of the version to delete.
  ///
  /// Parameter [deleteSourceBundle] :
  /// Set to <code>true</code> to delete the source bundle from your storage
  /// bucket. Otherwise, the application version is deleted only from Elastic
  /// Beanstalk and the source bundle remains in Amazon S3.
  Future<void> deleteApplicationVersion({
    required String applicationName,
    required String versionLabel,
    bool? deleteSourceBundle,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    $request['VersionLabel'] = versionLabel;
    deleteSourceBundle?.also((arg) => $request['DeleteSourceBundle'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteApplicationVersion',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteApplicationVersionMessage'],
      shapes: shapes,
    );
  }

  /// Deletes the specified configuration template.
  /// <note>
  /// When you launch an environment using a configuration template, the
  /// environment gets a copy of the template. You can delete or modify the
  /// environment's copy of the template without affecting the running
  /// environment.
  /// </note>
  ///
  /// May throw [OperationInProgressException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to delete the configuration template from.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template to delete.
  Future<void> deleteConfigurationTemplate({
    required String applicationName,
    required String templateName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    $request['TemplateName'] = templateName;
    await _protocol.send(
      $request,
      action: 'DeleteConfigurationTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteConfigurationTemplateMessage'],
      shapes: shapes,
    );
  }

  /// Deletes the draft configuration associated with the running environment.
  ///
  /// Updating a running environment with any configuration changes creates a
  /// draft configuration set. You can get the draft configuration using
  /// <a>DescribeConfigurationSettings</a> while the update is in progress or if
  /// the update fails. The <code>DeploymentStatus</code> for the draft
  /// configuration indicates whether the deployment is in process or has
  /// failed. The draft configuration remains in existence until it is deleted
  /// with this action.
  ///
  /// Parameter [applicationName] :
  /// The name of the application the environment is associated with.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to delete the draft configuration from.
  Future<void> deleteEnvironmentConfiguration({
    required String applicationName,
    required String environmentName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    $request['EnvironmentName'] = environmentName;
    await _protocol.send(
      $request,
      action: 'DeleteEnvironmentConfiguration',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteEnvironmentConfigurationMessage'],
      shapes: shapes,
    );
  }

  /// Deletes the specified version of a custom platform.
  ///
  /// May throw [OperationInProgressException].
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ElasticBeanstalkServiceException].
  /// May throw [PlatformVersionStillReferencedException].
  ///
  /// Parameter [platformArn] :
  /// The ARN of the version of the custom platform.
  Future<DeletePlatformVersionResult> deletePlatformVersion({
    String? platformArn,
  }) async {
    final $request = <String, dynamic>{};
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeletePlatformVersion',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeletePlatformVersionRequest'],
      shapes: shapes,
      resultWrapper: 'DeletePlatformVersionResult',
    );
    return DeletePlatformVersionResult.fromXml($result);
  }

  /// Returns attributes related to AWS Elastic Beanstalk that are associated
  /// with the calling AWS account.
  ///
  /// The result currently has one set of attributes—resource quotas.
  ///
  /// May throw [InsufficientPrivilegesException].
  Future<DescribeAccountAttributesResult> describeAccountAttributes() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAccountAttributes',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'DescribeAccountAttributesResult',
    );
    return DescribeAccountAttributesResult.fromXml($result);
  }

  /// Retrieve a list of application versions.
  ///
  /// Parameter [applicationName] :
  /// Specify an application name to show only application versions for that
  /// application.
  ///
  /// Parameter [maxRecords] :
  /// For a paginated request. Specify a maximum number of application versions
  /// to include in each response.
  ///
  /// If no <code>MaxRecords</code> is specified, all available application
  /// versions are retrieved in a single response.
  ///
  /// Parameter [nextToken] :
  /// For a paginated request. Specify a token from a previous response page to
  /// retrieve the next response page. All other parameter values must be
  /// identical to the ones specified in the initial request.
  ///
  /// If no <code>NextToken</code> is specified, the first page is retrieved.
  ///
  /// Parameter [versionLabels] :
  /// Specify a version label to show a specific application version.
  Future<ApplicationVersionDescriptionsMessage> describeApplicationVersions({
    String? applicationName,
    int? maxRecords,
    String? nextToken,
    List<String>? versionLabels,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    versionLabels?.also((arg) => $request['VersionLabels'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeApplicationVersions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeApplicationVersionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeApplicationVersionsResult',
    );
    return ApplicationVersionDescriptionsMessage.fromXml($result);
  }

  /// Returns the descriptions of existing applications.
  ///
  /// Parameter [applicationNames] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// only include those with the specified names.
  Future<ApplicationDescriptionsMessage> describeApplications({
    List<String>? applicationNames,
  }) async {
    final $request = <String, dynamic>{};
    applicationNames?.also((arg) => $request['ApplicationNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeApplications',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeApplicationsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeApplicationsResult',
    );
    return ApplicationDescriptionsMessage.fromXml($result);
  }

  /// Describes the configuration options that are used in a particular
  /// configuration template or environment, or that a specified solution stack
  /// defines. The description includes the values the options, their default
  /// values, and an indication of the required action on a running environment
  /// if an option value is changed.
  ///
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application associated with the configuration template or
  /// environment. Only needed if you want to describe the configuration options
  /// associated with either the configuration template or environment.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment whose configuration options you want to
  /// describe.
  ///
  /// Parameter [options] :
  /// If specified, restricts the descriptions to only the specified options.
  ///
  /// Parameter [platformArn] :
  /// The ARN of the custom platform.
  ///
  /// Parameter [solutionStackName] :
  /// The name of the solution stack whose configuration options you want to
  /// describe.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template whose configuration options you
  /// want to describe.
  Future<ConfigurationOptionsDescription> describeConfigurationOptions({
    String? applicationName,
    String? environmentName,
    List<OptionSpecification>? options,
    String? platformArn,
    String? solutionStackName,
    String? templateName,
  }) async {
    final $request = <String, dynamic>{};
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    options?.also((arg) => $request['Options'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    solutionStackName?.also((arg) => $request['SolutionStackName'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeConfigurationOptions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeConfigurationOptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeConfigurationOptionsResult',
    );
    return ConfigurationOptionsDescription.fromXml($result);
  }

  /// Returns a description of the settings for the specified configuration set,
  /// that is, either a configuration template or the configuration set
  /// associated with a running environment.
  ///
  /// When describing the settings for the configuration set associated with a
  /// running environment, it is possible to receive two sets of setting
  /// descriptions. One is the deployed configuration set, and the other is a
  /// draft configuration of an environment that is either in the process of
  /// deployment or that failed to deploy.
  ///
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>DeleteEnvironmentConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The application for the environment or configuration template.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to describe.
  ///
  /// Condition: You must specify either this or a TemplateName, but not both.
  /// If you specify both, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterCombination</code> error. If you do not specify
  /// either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template to describe.
  ///
  /// Conditional: You must specify either this parameter or an EnvironmentName,
  /// but not both. If you specify both, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterCombination</code> error. If you do not specify
  /// either, AWS Elastic Beanstalk returns a
  /// <code>MissingRequiredParameter</code> error.
  Future<ConfigurationSettingsDescriptions> describeConfigurationSettings({
    required String applicationName,
    String? environmentName,
    String? templateName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeConfigurationSettings',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeConfigurationSettingsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeConfigurationSettingsResult',
    );
    return ConfigurationSettingsDescriptions.fromXml($result);
  }

  /// Returns information about the overall health of the specified environment.
  /// The <b>DescribeEnvironmentHealth</b> operation is only available with AWS
  /// Elastic Beanstalk Enhanced Health.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [attributeNames] :
  /// Specify the response elements to return. To retrieve all attributes, set
  /// to <code>All</code>. If no attribute names are specified, returns the name
  /// of the environment.
  ///
  /// Parameter [environmentId] :
  /// Specify the environment by ID.
  ///
  /// You must specify either this or an EnvironmentName, or both.
  ///
  /// Parameter [environmentName] :
  /// Specify the environment by name.
  ///
  /// You must specify either this or an EnvironmentName, or both.
  Future<DescribeEnvironmentHealthResult> describeEnvironmentHealth({
    List<EnvironmentHealthAttribute>? attributeNames,
    String? environmentId,
    String? environmentName,
  }) async {
    final $request = <String, dynamic>{};
    attributeNames?.also((arg) =>
        $request['AttributeNames'] = arg.map((e) => e.toValue()).toList());
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEnvironmentHealth',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEnvironmentHealthRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeEnvironmentHealthResult',
    );
    return DescribeEnvironmentHealthResult.fromXml($result);
  }

  /// Lists an environment's completed and failed managed actions.
  ///
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [environmentId] :
  /// The environment ID of the target environment.
  ///
  /// Parameter [environmentName] :
  /// The name of the target environment.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of items to return for a single request.
  ///
  /// Parameter [nextToken] :
  /// The pagination token returned by a previous request.
  Future<DescribeEnvironmentManagedActionHistoryResult>
      describeEnvironmentManagedActionHistory({
    String? environmentId,
    String? environmentName,
    int? maxItems,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEnvironmentManagedActionHistory',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEnvironmentManagedActionHistoryRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeEnvironmentManagedActionHistoryResult',
    );
    return DescribeEnvironmentManagedActionHistoryResult.fromXml($result);
  }

  /// Lists an environment's upcoming and in-progress managed actions.
  ///
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [environmentId] :
  /// The environment ID of the target environment.
  ///
  /// Parameter [environmentName] :
  /// The name of the target environment.
  ///
  /// Parameter [status] :
  /// To show only actions with a particular status, specify a status.
  Future<DescribeEnvironmentManagedActionsResult>
      describeEnvironmentManagedActions({
    String? environmentId,
    String? environmentName,
    ActionStatus? status,
  }) async {
    final $request = <String, dynamic>{};
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    status?.also((arg) => $request['Status'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEnvironmentManagedActions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEnvironmentManagedActionsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeEnvironmentManagedActionsResult',
    );
    return DescribeEnvironmentManagedActionsResult.fromXml($result);
  }

  /// Returns AWS resources for this environment.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to retrieve AWS resource usage data.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to retrieve AWS resource usage data.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<EnvironmentResourceDescriptionsMessage> describeEnvironmentResources({
    String? environmentId,
    String? environmentName,
  }) async {
    final $request = <String, dynamic>{};
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEnvironmentResources',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEnvironmentResourcesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEnvironmentResourcesResult',
    );
    return EnvironmentResourceDescriptionsMessage.fromXml($result);
  }

  /// Returns descriptions for existing environments.
  ///
  /// Parameter [applicationName] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those that are associated with this application.
  ///
  /// Parameter [environmentIds] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those that have the specified IDs.
  ///
  /// Parameter [environmentNames] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those that have the specified names.
  ///
  /// Parameter [includeDeleted] :
  /// Indicates whether to include deleted environments:
  ///
  /// <code>true</code>: Environments that have been deleted after
  /// <code>IncludedDeletedBackTo</code> are displayed.
  ///
  /// <code>false</code>: Do not include deleted environments.
  ///
  /// Parameter [includedDeletedBackTo] :
  /// If specified when <code>IncludeDeleted</code> is set to <code>true</code>,
  /// then environments deleted after this date are displayed.
  ///
  /// Parameter [maxRecords] :
  /// For a paginated request. Specify a maximum number of environments to
  /// include in each response.
  ///
  /// If no <code>MaxRecords</code> is specified, all available environments are
  /// retrieved in a single response.
  ///
  /// Parameter [nextToken] :
  /// For a paginated request. Specify a token from a previous response page to
  /// retrieve the next response page. All other parameter values must be
  /// identical to the ones specified in the initial request.
  ///
  /// If no <code>NextToken</code> is specified, the first page is retrieved.
  ///
  /// Parameter [versionLabel] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those that are associated with this application version.
  Future<EnvironmentDescriptionsMessage> describeEnvironments({
    String? applicationName,
    List<String>? environmentIds,
    List<String>? environmentNames,
    bool? includeDeleted,
    DateTime? includedDeletedBackTo,
    int? maxRecords,
    String? nextToken,
    String? versionLabel,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    environmentIds?.also((arg) => $request['EnvironmentIds'] = arg);
    environmentNames?.also((arg) => $request['EnvironmentNames'] = arg);
    includeDeleted?.also((arg) => $request['IncludeDeleted'] = arg);
    includedDeletedBackTo?.also(
        (arg) => $request['IncludedDeletedBackTo'] = _s.iso8601ToJson(arg));
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    versionLabel?.also((arg) => $request['VersionLabel'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEnvironments',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEnvironmentsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEnvironmentsResult',
    );
    return EnvironmentDescriptionsMessage.fromXml($result);
  }

  /// Returns list of event descriptions matching criteria up to the last 6
  /// weeks.
  /// <note>
  /// This action returns the most recent 1,000 events from the specified
  /// <code>NextToken</code>.
  /// </note>
  ///
  /// Parameter [applicationName] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those associated with this application.
  ///
  /// Parameter [endTime] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those that occur up to, but not including, the <code>EndTime</code>.
  ///
  /// Parameter [environmentId] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those associated with this environment.
  ///
  /// Parameter [environmentName] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those associated with this environment.
  ///
  /// Parameter [maxRecords] :
  /// Specifies the maximum number of events that can be returned, beginning
  /// with the most recent event.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. If specified, the events return the next batch of
  /// results.
  ///
  /// Parameter [platformArn] :
  /// The ARN of a custom platform version. If specified, AWS Elastic Beanstalk
  /// restricts the returned descriptions to those associated with this custom
  /// platform version.
  ///
  /// Parameter [requestId] :
  /// If specified, AWS Elastic Beanstalk restricts the described events to
  /// include only those associated with this request ID.
  ///
  /// Parameter [severity] :
  /// If specified, limits the events returned from this call to include only
  /// those with the specified severity or higher.
  ///
  /// Parameter [startTime] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those that occur on or after this time.
  ///
  /// Parameter [templateName] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those that are associated with this environment configuration.
  ///
  /// Parameter [versionLabel] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those associated with this application version.
  Future<EventDescriptionsMessage> describeEvents({
    String? applicationName,
    DateTime? endTime,
    String? environmentId,
    String? environmentName,
    int? maxRecords,
    String? nextToken,
    String? platformArn,
    String? requestId,
    EventSeverity? severity,
    DateTime? startTime,
    String? templateName,
    String? versionLabel,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    requestId?.also((arg) => $request['RequestId'] = arg);
    severity?.also((arg) => $request['Severity'] = arg.toValue());
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    templateName?.also((arg) => $request['TemplateName'] = arg);
    versionLabel?.also((arg) => $request['VersionLabel'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEvents',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventsResult',
    );
    return EventDescriptionsMessage.fromXml($result);
  }

  /// Retrieves detailed information about the health of instances in your AWS
  /// Elastic Beanstalk. This operation requires <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced.html">enhanced
  /// health reporting</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [attributeNames] :
  /// Specifies the response elements you wish to receive. To retrieve all
  /// attributes, set to <code>All</code>. If no attribute names are specified,
  /// returns a list of instances.
  ///
  /// Parameter [environmentId] :
  /// Specify the AWS Elastic Beanstalk environment by ID.
  ///
  /// Parameter [environmentName] :
  /// Specify the AWS Elastic Beanstalk environment by name.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token returned by a previous call.
  Future<DescribeInstancesHealthResult> describeInstancesHealth({
    List<InstancesHealthAttribute>? attributeNames,
    String? environmentId,
    String? environmentName,
    String? nextToken,
  }) async {
    final $request = <String, dynamic>{};
    attributeNames?.also((arg) =>
        $request['AttributeNames'] = arg.map((e) => e.toValue()).toList());
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeInstancesHealth',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeInstancesHealthRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeInstancesHealthResult',
    );
    return DescribeInstancesHealthResult.fromXml($result);
  }

  /// Describes a platform version. Provides full details. Compare to
  /// <a>ListPlatformVersions</a>, which provides summary information about a
  /// list of platform versions.
  ///
  /// For definitions of platform version and other platform-related terms, see
  /// <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html">AWS
  /// Elastic Beanstalk Platforms Glossary</a>.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [platformArn] :
  /// The ARN of the platform version.
  Future<DescribePlatformVersionResult> describePlatformVersion({
    String? platformArn,
  }) async {
    final $request = <String, dynamic>{};
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribePlatformVersion',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribePlatformVersionRequest'],
      shapes: shapes,
      resultWrapper: 'DescribePlatformVersionResult',
    );
    return DescribePlatformVersionResult.fromXml($result);
  }

  /// Disassociate the operations role from an environment. After this call is
  /// made, Elastic Beanstalk uses the caller's permissions for permissions to
  /// downstream services during subsequent calls acting on this environment.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations
  /// roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentName] :
  /// The name of the environment from which to disassociate the operations
  /// role.
  Future<void> disassociateEnvironmentOperationsRole({
    required String environmentName,
  }) async {
    final $request = <String, dynamic>{};
    $request['EnvironmentName'] = environmentName;
    await _protocol.send(
      $request,
      action: 'DisassociateEnvironmentOperationsRole',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DisassociateEnvironmentOperationsRoleMessage'],
      shapes: shapes,
    );
  }

  /// Returns a list of the available solution stack names, with the public
  /// version first and then in reverse chronological order.
  Future<ListAvailableSolutionStacksResultMessage>
      listAvailableSolutionStacks() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'ListAvailableSolutionStacks',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'ListAvailableSolutionStacksResult',
    );
    return ListAvailableSolutionStacksResultMessage.fromXml($result);
  }

  /// Lists the platform branches available for your account in an AWS Region.
  /// Provides summary information about each platform branch.
  ///
  /// For definitions of platform branch and other platform-related terms, see
  /// <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html">AWS
  /// Elastic Beanstalk Platforms Glossary</a>.
  ///
  /// Parameter [filters] :
  /// Criteria for restricting the resulting list of platform branches. The
  /// filter is evaluated as a logical conjunction (AND) of the separate
  /// <code>SearchFilter</code> terms.
  ///
  /// The following list shows valid attribute values for each of the
  /// <code>SearchFilter</code> terms. Most operators take a single value. The
  /// <code>in</code> and <code>not_in</code> operators can take multiple
  /// values.
  ///
  /// <ul>
  /// <li>
  /// <code>Attribute = BranchName</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>Operator</code>: <code>=</code> | <code>!=</code> |
  /// <code>begins_with</code> | <code>ends_with</code> | <code>contains</code>
  /// | <code>in</code> | <code>not_in</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>Attribute = LifecycleState</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>Operator</code>: <code>=</code> | <code>!=</code> | <code>in</code>
  /// | <code>not_in</code>
  /// </li>
  /// <li>
  /// <code>Values</code>: <code>beta</code> | <code>supported</code> |
  /// <code>deprecated</code> | <code>retired</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>Attribute = PlatformName</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>Operator</code>: <code>=</code> | <code>!=</code> |
  /// <code>begins_with</code> | <code>ends_with</code> | <code>contains</code>
  /// | <code>in</code> | <code>not_in</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>Attribute = TierType</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>Operator</code>: <code>=</code> | <code>!=</code>
  /// </li>
  /// <li>
  /// <code>Values</code>: <code>WebServer/Standard</code> |
  /// <code>Worker/SQS/HTTP</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// Array size: limited to 10 <code>SearchFilter</code> objects.
  ///
  /// Within each <code>SearchFilter</code> item, the <code>Values</code> array
  /// is limited to 10 items.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of platform branch values returned in one call.
  ///
  /// Parameter [nextToken] :
  /// For a paginated request. Specify a token from a previous response page to
  /// retrieve the next response page. All other parameter values must be
  /// identical to the ones specified in the initial request.
  ///
  /// If no <code>NextToken</code> is specified, the first page is retrieved.
  Future<ListPlatformBranchesResult> listPlatformBranches({
    List<SearchFilter>? filters,
    int? maxRecords,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      1152921504606846976,
    );
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListPlatformBranches',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListPlatformBranchesRequest'],
      shapes: shapes,
      resultWrapper: 'ListPlatformBranchesResult',
    );
    return ListPlatformBranchesResult.fromXml($result);
  }

  /// Lists the platform versions available for your account in an AWS Region.
  /// Provides summary information about each platform version. Compare to
  /// <a>DescribePlatformVersion</a>, which provides full details about a single
  /// platform version.
  ///
  /// For definitions of platform version and other platform-related terms, see
  /// <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html">AWS
  /// Elastic Beanstalk Platforms Glossary</a>.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [filters] :
  /// Criteria for restricting the resulting list of platform versions. The
  /// filter is interpreted as a logical conjunction (AND) of the separate
  /// <code>PlatformFilter</code> terms.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of platform version values returned in one call.
  ///
  /// Parameter [nextToken] :
  /// For a paginated request. Specify a token from a previous response page to
  /// retrieve the next response page. All other parameter values must be
  /// identical to the ones specified in the initial request.
  ///
  /// If no <code>NextToken</code> is specified, the first page is retrieved.
  Future<ListPlatformVersionsResult> listPlatformVersions({
    List<PlatformFilter>? filters,
    int? maxRecords,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      1152921504606846976,
    );
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListPlatformVersions',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListPlatformVersionsRequest'],
      shapes: shapes,
      resultWrapper: 'ListPlatformVersionsResult',
    );
    return ListPlatformVersionsResult.fromXml($result);
  }

  /// Return the tags applied to an AWS Elastic Beanstalk resource. The response
  /// contains a list of tag key-value pairs.
  ///
  /// Elastic Beanstalk supports tagging of all of its resources. For details
  /// about resource tagging, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-tagging-resources.html">Tagging
  /// Application Resources</a>.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceTypeNotSupportedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resouce for which a tag list is
  /// requested.
  ///
  /// Must be the ARN of an Elastic Beanstalk resource.
  Future<ResourceTagsDescriptionMessage> listTagsForResource({
    required String resourceArn,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceArn'] = resourceArn;
    final $result = await _protocol.send(
      $request,
      action: 'ListTagsForResource',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTagsForResourceMessage'],
      shapes: shapes,
      resultWrapper: 'ListTagsForResourceResult',
    );
    return ResourceTagsDescriptionMessage.fromXml($result);
  }

  /// Deletes and recreates all of the AWS resources (for example: the Auto
  /// Scaling group, load balancer, etc.) for a specified environment and forces
  /// a restart.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to rebuild.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to rebuild.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<void> rebuildEnvironment({
    String? environmentId,
    String? environmentName,
  }) async {
    final $request = <String, dynamic>{};
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    await _protocol.send(
      $request,
      action: 'RebuildEnvironment',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RebuildEnvironmentMessage'],
      shapes: shapes,
    );
  }

  /// Initiates a request to compile the specified type of information of the
  /// deployed environment.
  ///
  /// Setting the <code>InfoType</code> to <code>tail</code> compiles the last
  /// lines from the application server log files of every Amazon EC2 instance
  /// in your environment.
  ///
  /// Setting the <code>InfoType</code> to <code>bundle</code> compresses the
  /// application server log files for every Amazon EC2 instance into a
  /// <code>.zip</code> file. Legacy and .NET containers do not support bundle
  /// logs.
  ///
  /// Use <a>RetrieveEnvironmentInfo</a> to obtain the set of logs.
  ///
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>RetrieveEnvironmentInfo</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [infoType] :
  /// The type of information to request.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment of the requested data.
  ///
  /// If no such environment is found, <code>RequestEnvironmentInfo</code>
  /// returns an <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment of the requested data.
  ///
  /// If no such environment is found, <code>RequestEnvironmentInfo</code>
  /// returns an <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<void> requestEnvironmentInfo({
    required EnvironmentInfoType infoType,
    String? environmentId,
    String? environmentName,
  }) async {
    final $request = <String, dynamic>{};
    $request['InfoType'] = infoType.toValue();
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    await _protocol.send(
      $request,
      action: 'RequestEnvironmentInfo',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RequestEnvironmentInfoMessage'],
      shapes: shapes,
    );
  }

  /// Causes the environment to restart the application container server running
  /// on each Amazon EC2 instance.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to restart the server for.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to restart the server for.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<void> restartAppServer({
    String? environmentId,
    String? environmentName,
  }) async {
    final $request = <String, dynamic>{};
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    await _protocol.send(
      $request,
      action: 'RestartAppServer',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestartAppServerMessage'],
      shapes: shapes,
    );
  }

  /// Retrieves the compiled information from a <a>RequestEnvironmentInfo</a>
  /// request.
  ///
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>RequestEnvironmentInfo</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [infoType] :
  /// The type of information to retrieve.
  ///
  /// Parameter [environmentId] :
  /// The ID of the data's environment.
  ///
  /// If no such environment is found, returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the data's environment.
  ///
  /// If no such environment is found, returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<RetrieveEnvironmentInfoResultMessage> retrieveEnvironmentInfo({
    required EnvironmentInfoType infoType,
    String? environmentId,
    String? environmentName,
  }) async {
    final $request = <String, dynamic>{};
    $request['InfoType'] = infoType.toValue();
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RetrieveEnvironmentInfo',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RetrieveEnvironmentInfoMessage'],
      shapes: shapes,
      resultWrapper: 'RetrieveEnvironmentInfoResult',
    );
    return RetrieveEnvironmentInfoResultMessage.fromXml($result);
  }

  /// Swaps the CNAMEs of two environments.
  ///
  /// Parameter [destinationEnvironmentId] :
  /// The ID of the destination environment.
  ///
  /// Condition: You must specify at least the
  /// <code>DestinationEnvironmentID</code> or the
  /// <code>DestinationEnvironmentName</code>. You may also specify both. You
  /// must specify the <code>SourceEnvironmentId</code> with the
  /// <code>DestinationEnvironmentId</code>.
  ///
  /// Parameter [destinationEnvironmentName] :
  /// The name of the destination environment.
  ///
  /// Condition: You must specify at least the
  /// <code>DestinationEnvironmentID</code> or the
  /// <code>DestinationEnvironmentName</code>. You may also specify both. You
  /// must specify the <code>SourceEnvironmentName</code> with the
  /// <code>DestinationEnvironmentName</code>.
  ///
  /// Parameter [sourceEnvironmentId] :
  /// The ID of the source environment.
  ///
  /// Condition: You must specify at least the <code>SourceEnvironmentID</code>
  /// or the <code>SourceEnvironmentName</code>. You may also specify both. If
  /// you specify the <code>SourceEnvironmentId</code>, you must specify the
  /// <code>DestinationEnvironmentId</code>.
  ///
  /// Parameter [sourceEnvironmentName] :
  /// The name of the source environment.
  ///
  /// Condition: You must specify at least the <code>SourceEnvironmentID</code>
  /// or the <code>SourceEnvironmentName</code>. You may also specify both. If
  /// you specify the <code>SourceEnvironmentName</code>, you must specify the
  /// <code>DestinationEnvironmentName</code>.
  Future<void> swapEnvironmentCNAMEs({
    String? destinationEnvironmentId,
    String? destinationEnvironmentName,
    String? sourceEnvironmentId,
    String? sourceEnvironmentName,
  }) async {
    final $request = <String, dynamic>{};
    destinationEnvironmentId
        ?.also((arg) => $request['DestinationEnvironmentId'] = arg);
    destinationEnvironmentName
        ?.also((arg) => $request['DestinationEnvironmentName'] = arg);
    sourceEnvironmentId?.also((arg) => $request['SourceEnvironmentId'] = arg);
    sourceEnvironmentName
        ?.also((arg) => $request['SourceEnvironmentName'] = arg);
    await _protocol.send(
      $request,
      action: 'SwapEnvironmentCNAMEs',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SwapEnvironmentCNAMEsMessage'],
      shapes: shapes,
    );
  }

  /// Terminates the specified environment.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to terminate.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to terminate.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [forceTerminate] :
  /// Terminates the target environment even if another environment in the same
  /// group is dependent on it.
  ///
  /// Parameter [terminateResources] :
  /// Indicates whether the associated AWS resources should shut down when the
  /// environment is terminated:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code>: The specified environment as well as the associated AWS
  /// resources, such as Auto Scaling group and LoadBalancer, are terminated.
  /// </li>
  /// <li>
  /// <code>false</code>: AWS Elastic Beanstalk resource management is removed
  /// from the environment, but the AWS resources continue to operate.
  /// </li>
  /// </ul>
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/ug/"> AWS
  /// Elastic Beanstalk User Guide. </a>
  ///
  /// Default: <code>true</code>
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  Future<EnvironmentDescription> terminateEnvironment({
    String? environmentId,
    String? environmentName,
    bool? forceTerminate,
    bool? terminateResources,
  }) async {
    final $request = <String, dynamic>{};
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    forceTerminate?.also((arg) => $request['ForceTerminate'] = arg);
    terminateResources?.also((arg) => $request['TerminateResources'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'TerminateEnvironment',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TerminateEnvironmentMessage'],
      shapes: shapes,
      resultWrapper: 'TerminateEnvironmentResult',
    );
    return EnvironmentDescription.fromXml($result);
  }

  /// Updates the specified application to have the specified properties.
  /// <note>
  /// If a property (for example, <code>description</code>) is not provided, the
  /// value remains unchanged. To clear these properties, specify an empty
  /// string.
  /// </note>
  ///
  /// Parameter [applicationName] :
  /// The name of the application to update. If no such application is found,
  /// <code>UpdateApplication</code> returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [description] :
  /// A new description for the application.
  ///
  /// Default: If not specified, AWS Elastic Beanstalk does not update the
  /// description.
  Future<ApplicationDescriptionMessage> updateApplication({
    required String applicationName,
    String? description,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    description?.also((arg) => $request['Description'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UpdateApplication',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateApplicationMessage'],
      shapes: shapes,
      resultWrapper: 'UpdateApplicationResult',
    );
    return ApplicationDescriptionMessage.fromXml($result);
  }

  /// Modifies lifecycle settings for an application.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application.
  ///
  /// Parameter [resourceLifecycleConfig] :
  /// The lifecycle configuration.
  Future<ApplicationResourceLifecycleDescriptionMessage>
      updateApplicationResourceLifecycle({
    required String applicationName,
    required ApplicationResourceLifecycleConfig resourceLifecycleConfig,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    $request['ResourceLifecycleConfig'] = resourceLifecycleConfig;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateApplicationResourceLifecycle',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateApplicationResourceLifecycleMessage'],
      shapes: shapes,
      resultWrapper: 'UpdateApplicationResourceLifecycleResult',
    );
    return ApplicationResourceLifecycleDescriptionMessage.fromXml($result);
  }

  /// Updates the specified application version to have the specified
  /// properties.
  /// <note>
  /// If a property (for example, <code>description</code>) is not provided, the
  /// value remains unchanged. To clear properties, specify an empty string.
  /// </note>
  ///
  /// Parameter [applicationName] :
  /// The name of the application associated with this version.
  ///
  /// If no application is found with this name, <code>UpdateApplication</code>
  /// returns an <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [versionLabel] :
  /// The name of the version to update.
  ///
  /// If no application version is found with this label,
  /// <code>UpdateApplication</code> returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [description] :
  /// A new description for this version.
  Future<ApplicationVersionDescriptionMessage> updateApplicationVersion({
    required String applicationName,
    required String versionLabel,
    String? description,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    $request['VersionLabel'] = versionLabel;
    description?.also((arg) => $request['Description'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UpdateApplicationVersion',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateApplicationVersionMessage'],
      shapes: shapes,
      resultWrapper: 'UpdateApplicationVersionResult',
    );
    return ApplicationVersionDescriptionMessage.fromXml($result);
  }

  /// Updates the specified configuration template to have the specified
  /// properties or configuration option values.
  /// <note>
  /// If a property (for example, <code>ApplicationName</code>) is not provided,
  /// its value remains unchanged. To clear such properties, specify an empty
  /// string.
  /// </note>
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeConfigurationOptions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application associated with the configuration template to
  /// update.
  ///
  /// If no application is found with this name,
  /// <code>UpdateConfigurationTemplate</code> returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template to update.
  ///
  /// If no configuration template is found with this name,
  /// <code>UpdateConfigurationTemplate</code> returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [description] :
  /// A new description for the configuration.
  ///
  /// Parameter [optionSettings] :
  /// A list of configuration option settings to update with the new specified
  /// option value.
  ///
  /// Parameter [optionsToRemove] :
  /// A list of configuration options to remove from the configuration set.
  ///
  /// Constraint: You can remove only <code>UserDefined</code> configuration
  /// options.
  Future<ConfigurationSettingsDescription> updateConfigurationTemplate({
    required String applicationName,
    required String templateName,
    String? description,
    List<ConfigurationOptionSetting>? optionSettings,
    List<OptionSpecification>? optionsToRemove,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    $request['TemplateName'] = templateName;
    description?.also((arg) => $request['Description'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    optionsToRemove?.also((arg) => $request['OptionsToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UpdateConfigurationTemplate',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateConfigurationTemplateMessage'],
      shapes: shapes,
      resultWrapper: 'UpdateConfigurationTemplateResult',
    );
    return ConfigurationSettingsDescription.fromXml($result);
  }

  /// Updates the environment description, deploys a new application version,
  /// updates the configuration settings to an entirely new configuration
  /// template, or updates select configuration option values in the running
  /// environment.
  ///
  /// Attempting to update both the release and configuration is not allowed and
  /// AWS Elastic Beanstalk returns an <code>InvalidParameterCombination</code>
  /// error.
  ///
  /// When updating the configuration settings to a new template or individual
  /// settings, a draft configuration is created and
  /// <a>DescribeConfigurationSettings</a> for this environment returns two
  /// setting descriptions with different <code>DeploymentStatus</code> values.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application with which the environment is associated.
  ///
  /// Parameter [description] :
  /// If this parameter is specified, AWS Elastic Beanstalk updates the
  /// description of this environment.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to update.
  ///
  /// If no environment with this ID exists, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to update. If no environment with this name
  /// exists, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [groupName] :
  /// The name of the group to which the target environment belongs. Specify a
  /// group name only if the environment's name is specified in an environment
  /// manifest and not with the environment name or environment ID parameters.
  /// See <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment
  /// Manifest (env.yaml)</a> for details.
  ///
  /// Parameter [optionSettings] :
  /// If specified, AWS Elastic Beanstalk updates the configuration set
  /// associated with the running environment and sets the specified
  /// configuration options to the requested value.
  ///
  /// Parameter [optionsToRemove] :
  /// A list of custom user-defined configuration options to remove from the
  /// configuration set for this environment.
  ///
  /// Parameter [platformArn] :
  /// The ARN of the platform, if used.
  ///
  /// Parameter [solutionStackName] :
  /// This specifies the platform version that the environment will run after
  /// the environment is updated.
  ///
  /// Parameter [templateName] :
  /// If this parameter is specified, AWS Elastic Beanstalk deploys this
  /// configuration template to the environment. If no such configuration
  /// template is found, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [tier] :
  /// This specifies the tier to use to update the environment.
  ///
  /// Condition: At this time, if you change the tier version, name, or type,
  /// AWS Elastic Beanstalk returns <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [versionLabel] :
  /// If this parameter is specified, AWS Elastic Beanstalk deploys the named
  /// application version to the environment. If no such application version is
  /// found, returns an <code>InvalidParameterValue</code> error.
  Future<EnvironmentDescription> updateEnvironment({
    String? applicationName,
    String? description,
    String? environmentId,
    String? environmentName,
    String? groupName,
    List<ConfigurationOptionSetting>? optionSettings,
    List<OptionSpecification>? optionsToRemove,
    String? platformArn,
    String? solutionStackName,
    String? templateName,
    EnvironmentTier? tier,
    String? versionLabel,
  }) async {
    final $request = <String, dynamic>{};
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    groupName?.also((arg) => $request['GroupName'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    optionsToRemove?.also((arg) => $request['OptionsToRemove'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    solutionStackName?.also((arg) => $request['SolutionStackName'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    tier?.also((arg) => $request['Tier'] = arg);
    versionLabel?.also((arg) => $request['VersionLabel'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UpdateEnvironment',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateEnvironmentMessage'],
      shapes: shapes,
      resultWrapper: 'UpdateEnvironmentResult',
    );
    return EnvironmentDescription.fromXml($result);
  }

  /// Update the list of tags applied to an AWS Elastic Beanstalk resource. Two
  /// lists can be passed: <code>TagsToAdd</code> for tags to add or update, and
  /// <code>TagsToRemove</code>.
  ///
  /// Elastic Beanstalk supports tagging of all of its resources. For details
  /// about resource tagging, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-tagging-resources.html">Tagging
  /// Application Resources</a>.
  ///
  /// If you create a custom IAM user policy to control permission to this
  /// operation, specify one of the following two virtual actions (or both)
  /// instead of the API operation name:
  /// <dl> <dt>elasticbeanstalk:AddTags</dt> <dd>
  /// Controls permission to call <code>UpdateTagsForResource</code> and pass a
  /// list of tags to add in the <code>TagsToAdd</code> parameter.
  /// </dd> <dt>elasticbeanstalk:RemoveTags</dt> <dd>
  /// Controls permission to call <code>UpdateTagsForResource</code> and pass a
  /// list of tag keys to remove in the <code>TagsToRemove</code> parameter.
  /// </dd> </dl>
  /// For details about creating a custom user policy, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/AWSHowTo.iam.managed-policies.html#AWSHowTo.iam.policies">Creating
  /// a Custom User Policy</a>.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [OperationInProgressException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceTypeNotSupportedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resouce to be updated.
  ///
  /// Must be the ARN of an Elastic Beanstalk resource.
  ///
  /// Parameter [tagsToAdd] :
  /// A list of tags to add or update. If a key of an existing tag is added, the
  /// tag's value is updated.
  ///
  /// Specify at least one of these parameters: <code>TagsToAdd</code>,
  /// <code>TagsToRemove</code>.
  ///
  /// Parameter [tagsToRemove] :
  /// A list of tag keys to remove. If a tag key doesn't exist, it is silently
  /// ignored.
  ///
  /// Specify at least one of these parameters: <code>TagsToAdd</code>,
  /// <code>TagsToRemove</code>.
  Future<void> updateTagsForResource({
    required String resourceArn,
    List<Tag>? tagsToAdd,
    List<String>? tagsToRemove,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceArn'] = resourceArn;
    tagsToAdd?.also((arg) => $request['TagsToAdd'] = arg);
    tagsToRemove?.also((arg) => $request['TagsToRemove'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateTagsForResource',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateTagsForResourceMessage'],
      shapes: shapes,
    );
  }

  /// Takes a set of configuration settings and either a configuration template
  /// or environment, and determines whether those values are valid.
  ///
  /// This action returns a list of messages indicating any errors or warnings
  /// associated with the selection of option values.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application that the configuration template or environment
  /// belongs to.
  ///
  /// Parameter [optionSettings] :
  /// A list of the options and desired values to evaluate.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to validate the settings against.
  ///
  /// Condition: You cannot specify both this and a configuration template name.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template to validate the settings against.
  ///
  /// Condition: You cannot specify both this and an environment name.
  Future<ConfigurationSettingsValidationMessages>
      validateConfigurationSettings({
    required String applicationName,
    required List<ConfigurationOptionSetting> optionSettings,
    String? environmentName,
    String? templateName,
  }) async {
    final $request = <String, dynamic>{};
    $request['ApplicationName'] = applicationName;
    $request['OptionSettings'] = optionSettings;
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ValidateConfigurationSettings',
      version: '2010-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ValidateConfigurationSettingsMessage'],
      shapes: shapes,
      resultWrapper: 'ValidateConfigurationSettingsResult',
    );
    return ConfigurationSettingsValidationMessages.fromXml($result);
  }
}

enum ActionHistoryStatus {
  completed,
  failed,
  unknown,
}

extension ActionHistoryStatusValueExtension on ActionHistoryStatus {
  String toValue() {
    switch (this) {
      case ActionHistoryStatus.completed:
        return 'Completed';
      case ActionHistoryStatus.failed:
        return 'Failed';
      case ActionHistoryStatus.unknown:
        return 'Unknown';
    }
  }
}

extension ActionHistoryStatusFromString on String {
  ActionHistoryStatus toActionHistoryStatus() {
    switch (this) {
      case 'Completed':
        return ActionHistoryStatus.completed;
      case 'Failed':
        return ActionHistoryStatus.failed;
      case 'Unknown':
        return ActionHistoryStatus.unknown;
    }
    throw Exception('$this is not known in enum ActionHistoryStatus');
  }
}

enum ActionStatus {
  scheduled,
  pending,
  running,
  unknown,
}

extension ActionStatusValueExtension on ActionStatus {
  String toValue() {
    switch (this) {
      case ActionStatus.scheduled:
        return 'Scheduled';
      case ActionStatus.pending:
        return 'Pending';
      case ActionStatus.running:
        return 'Running';
      case ActionStatus.unknown:
        return 'Unknown';
    }
  }
}

extension ActionStatusFromString on String {
  ActionStatus toActionStatus() {
    switch (this) {
      case 'Scheduled':
        return ActionStatus.scheduled;
      case 'Pending':
        return ActionStatus.pending;
      case 'Running':
        return ActionStatus.running;
      case 'Unknown':
        return ActionStatus.unknown;
    }
    throw Exception('$this is not known in enum ActionStatus');
  }
}

enum ActionType {
  instanceRefresh,
  platformUpdate,
  unknown,
}

extension ActionTypeValueExtension on ActionType {
  String toValue() {
    switch (this) {
      case ActionType.instanceRefresh:
        return 'InstanceRefresh';
      case ActionType.platformUpdate:
        return 'PlatformUpdate';
      case ActionType.unknown:
        return 'Unknown';
    }
  }
}

extension ActionTypeFromString on String {
  ActionType toActionType() {
    switch (this) {
      case 'InstanceRefresh':
        return ActionType.instanceRefresh;
      case 'PlatformUpdate':
        return ActionType.platformUpdate;
      case 'Unknown':
        return ActionType.unknown;
    }
    throw Exception('$this is not known in enum ActionType');
  }
}

/// Describes the properties of an application.
class ApplicationDescription {
  /// The Amazon Resource Name (ARN) of the application.
  final String? applicationArn;

  /// The name of the application.
  final String? applicationName;

  /// The names of the configuration templates associated with this application.
  final List<String>? configurationTemplates;

  /// The date when the application was created.
  final DateTime? dateCreated;

  /// The date when the application was last modified.
  final DateTime? dateUpdated;

  /// User-defined description of the application.
  final String? description;

  /// The lifecycle settings for the application.
  final ApplicationResourceLifecycleConfig? resourceLifecycleConfig;

  /// The names of the versions for this application.
  final List<String>? versions;

  ApplicationDescription({
    this.applicationArn,
    this.applicationName,
    this.configurationTemplates,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.resourceLifecycleConfig,
    this.versions,
  });
  factory ApplicationDescription.fromXml(_s.XmlElement elem) {
    return ApplicationDescription(
      applicationArn: _s.extractXmlStringValue(elem, 'ApplicationArn'),
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      configurationTemplates: _s
          .extractXmlChild(elem, 'ConfigurationTemplates')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      resourceLifecycleConfig: _s
          .extractXmlChild(elem, 'ResourceLifecycleConfig')
          ?.let(ApplicationResourceLifecycleConfig.fromXml),
      versions: _s
          .extractXmlChild(elem, 'Versions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationName = this.applicationName;
    final configurationTemplates = this.configurationTemplates;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final resourceLifecycleConfig = this.resourceLifecycleConfig;
    final versions = this.versions;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (applicationName != null) 'ApplicationName': applicationName,
      if (configurationTemplates != null)
        'ConfigurationTemplates': configurationTemplates,
      if (dateCreated != null) 'DateCreated': iso8601ToJson(dateCreated),
      if (dateUpdated != null) 'DateUpdated': iso8601ToJson(dateUpdated),
      if (description != null) 'Description': description,
      if (resourceLifecycleConfig != null)
        'ResourceLifecycleConfig': resourceLifecycleConfig,
      if (versions != null) 'Versions': versions,
    };
  }
}

/// Result message containing a single description of an application.
class ApplicationDescriptionMessage {
  /// The <a>ApplicationDescription</a> of the application.
  final ApplicationDescription? application;

  ApplicationDescriptionMessage({
    this.application,
  });
  factory ApplicationDescriptionMessage.fromXml(_s.XmlElement elem) {
    return ApplicationDescriptionMessage(
      application: _s
          .extractXmlChild(elem, 'Application')
          ?.let(ApplicationDescription.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    return {
      if (application != null) 'Application': application,
    };
  }
}

/// Result message containing a list of application descriptions.
class ApplicationDescriptionsMessage {
  /// This parameter contains a list of <a>ApplicationDescription</a>.
  final List<ApplicationDescription>? applications;

  ApplicationDescriptionsMessage({
    this.applications,
  });
  factory ApplicationDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return ApplicationDescriptionsMessage(
      applications: _s.extractXmlChild(elem, 'Applications')?.let((elem) => elem
          .findElements('member')
          .map(ApplicationDescription.fromXml)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    return {
      if (applications != null) 'Applications': applications,
    };
  }
}

/// Application request metrics for an AWS Elastic Beanstalk environment.
class ApplicationMetrics {
  /// The amount of time that the metrics cover (usually 10 seconds). For example,
  /// you might have 5 requests (<code>request_count</code>) within the most
  /// recent time slice of 10 seconds (<code>duration</code>).
  final int? duration;

  /// Represents the average latency for the slowest X percent of requests over
  /// the last 10 seconds. Latencies are in seconds with one millisecond
  /// resolution.
  final Latency? latency;

  /// Average number of requests handled by the web server per second over the
  /// last 10 seconds.
  final int? requestCount;

  /// Represents the percentage of requests over the last 10 seconds that resulted
  /// in each type of status code response.
  final StatusCodes? statusCodes;

  ApplicationMetrics({
    this.duration,
    this.latency,
    this.requestCount,
    this.statusCodes,
  });
  factory ApplicationMetrics.fromXml(_s.XmlElement elem) {
    return ApplicationMetrics(
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      latency: _s.extractXmlChild(elem, 'Latency')?.let(Latency.fromXml),
      requestCount: _s.extractXmlIntValue(elem, 'RequestCount'),
      statusCodes:
          _s.extractXmlChild(elem, 'StatusCodes')?.let(StatusCodes.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final latency = this.latency;
    final requestCount = this.requestCount;
    final statusCodes = this.statusCodes;
    return {
      if (duration != null) 'Duration': duration,
      if (latency != null) 'Latency': latency,
      if (requestCount != null) 'RequestCount': requestCount,
      if (statusCodes != null) 'StatusCodes': statusCodes,
    };
  }
}

/// The resource lifecycle configuration for an application. Defines lifecycle
/// settings for resources that belong to the application, and the service role
/// that AWS Elastic Beanstalk assumes in order to apply lifecycle settings. The
/// version lifecycle configuration defines lifecycle settings for application
/// versions.
class ApplicationResourceLifecycleConfig {
  /// The ARN of an IAM service role that Elastic Beanstalk has permission to
  /// assume.
  ///
  /// The <code>ServiceRole</code> property is required the first time that you
  /// provide a <code>VersionLifecycleConfig</code> for the application in one of
  /// the supporting calls (<code>CreateApplication</code> or
  /// <code>UpdateApplicationResourceLifecycle</code>). After you provide it once,
  /// in either one of the calls, Elastic Beanstalk persists the Service Role with
  /// the application, and you don't need to specify it again in subsequent
  /// <code>UpdateApplicationResourceLifecycle</code> calls. You can, however,
  /// specify it in subsequent calls to change the Service Role to another value.
  final String? serviceRole;

  /// Defines lifecycle settings for application versions.
  final ApplicationVersionLifecycleConfig? versionLifecycleConfig;

  ApplicationResourceLifecycleConfig({
    this.serviceRole,
    this.versionLifecycleConfig,
  });
  factory ApplicationResourceLifecycleConfig.fromXml(_s.XmlElement elem) {
    return ApplicationResourceLifecycleConfig(
      serviceRole: _s.extractXmlStringValue(elem, 'ServiceRole'),
      versionLifecycleConfig: _s
          .extractXmlChild(elem, 'VersionLifecycleConfig')
          ?.let(ApplicationVersionLifecycleConfig.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceRole = this.serviceRole;
    final versionLifecycleConfig = this.versionLifecycleConfig;
    return {
      if (serviceRole != null) 'ServiceRole': serviceRole,
      if (versionLifecycleConfig != null)
        'VersionLifecycleConfig': versionLifecycleConfig,
    };
  }
}

class ApplicationResourceLifecycleDescriptionMessage {
  /// The name of the application.
  final String? applicationName;

  /// The lifecycle configuration.
  final ApplicationResourceLifecycleConfig? resourceLifecycleConfig;

  ApplicationResourceLifecycleDescriptionMessage({
    this.applicationName,
    this.resourceLifecycleConfig,
  });
  factory ApplicationResourceLifecycleDescriptionMessage.fromXml(
      _s.XmlElement elem) {
    return ApplicationResourceLifecycleDescriptionMessage(
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      resourceLifecycleConfig: _s
          .extractXmlChild(elem, 'ResourceLifecycleConfig')
          ?.let(ApplicationResourceLifecycleConfig.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationName = this.applicationName;
    final resourceLifecycleConfig = this.resourceLifecycleConfig;
    return {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (resourceLifecycleConfig != null)
        'ResourceLifecycleConfig': resourceLifecycleConfig,
    };
  }
}

/// Describes the properties of an application version.
class ApplicationVersionDescription {
  /// The name of the application to which the application version belongs.
  final String? applicationName;

  /// The Amazon Resource Name (ARN) of the application version.
  final String? applicationVersionArn;

  /// Reference to the artifact from the AWS CodeBuild build.
  final String? buildArn;

  /// The creation date of the application version.
  final DateTime? dateCreated;

  /// The last modified date of the application version.
  final DateTime? dateUpdated;

  /// The description of the application version.
  final String? description;

  /// If the version's source code was retrieved from AWS CodeCommit, the location
  /// of the source code for the application version.
  final SourceBuildInformation? sourceBuildInformation;

  /// The storage location of the application version's source bundle in Amazon
  /// S3.
  final S3Location? sourceBundle;

  /// The processing status of the application version. Reflects the state of the
  /// application version during its creation. Many of the values are only
  /// applicable if you specified <code>True</code> for the <code>Process</code>
  /// parameter of the <code>CreateApplicationVersion</code> action. The following
  /// list describes the possible values.
  ///
  /// <ul>
  /// <li>
  /// <code>Unprocessed</code> – Application version wasn't pre-processed or
  /// validated. Elastic Beanstalk will validate configuration files during
  /// deployment of the application version to an environment.
  /// </li>
  /// <li>
  /// <code>Processing</code> – Elastic Beanstalk is currently processing the
  /// application version.
  /// </li>
  /// <li>
  /// <code>Building</code> – Application version is currently undergoing an AWS
  /// CodeBuild build.
  /// </li>
  /// <li>
  /// <code>Processed</code> – Elastic Beanstalk was successfully pre-processed
  /// and validated.
  /// </li>
  /// <li>
  /// <code>Failed</code> – Either the AWS CodeBuild build failed or configuration
  /// files didn't pass validation. This application version isn't usable.
  /// </li>
  /// </ul>
  final ApplicationVersionStatus? status;

  /// A unique identifier for the application version.
  final String? versionLabel;

  ApplicationVersionDescription({
    this.applicationName,
    this.applicationVersionArn,
    this.buildArn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.sourceBuildInformation,
    this.sourceBundle,
    this.status,
    this.versionLabel,
  });
  factory ApplicationVersionDescription.fromXml(_s.XmlElement elem) {
    return ApplicationVersionDescription(
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      applicationVersionArn:
          _s.extractXmlStringValue(elem, 'ApplicationVersionArn'),
      buildArn: _s.extractXmlStringValue(elem, 'BuildArn'),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      sourceBuildInformation: _s
          .extractXmlChild(elem, 'SourceBuildInformation')
          ?.let(SourceBuildInformation.fromXml),
      sourceBundle:
          _s.extractXmlChild(elem, 'SourceBundle')?.let(S3Location.fromXml),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toApplicationVersionStatus(),
      versionLabel: _s.extractXmlStringValue(elem, 'VersionLabel'),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationName = this.applicationName;
    final applicationVersionArn = this.applicationVersionArn;
    final buildArn = this.buildArn;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final sourceBuildInformation = this.sourceBuildInformation;
    final sourceBundle = this.sourceBundle;
    final status = this.status;
    final versionLabel = this.versionLabel;
    return {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (applicationVersionArn != null)
        'ApplicationVersionArn': applicationVersionArn,
      if (buildArn != null) 'BuildArn': buildArn,
      if (dateCreated != null) 'DateCreated': iso8601ToJson(dateCreated),
      if (dateUpdated != null) 'DateUpdated': iso8601ToJson(dateUpdated),
      if (description != null) 'Description': description,
      if (sourceBuildInformation != null)
        'SourceBuildInformation': sourceBuildInformation,
      if (sourceBundle != null) 'SourceBundle': sourceBundle,
      if (status != null) 'Status': status.toValue(),
      if (versionLabel != null) 'VersionLabel': versionLabel,
    };
  }
}

/// Result message wrapping a single description of an application version.
class ApplicationVersionDescriptionMessage {
  /// The <a>ApplicationVersionDescription</a> of the application version.
  final ApplicationVersionDescription? applicationVersion;

  ApplicationVersionDescriptionMessage({
    this.applicationVersion,
  });
  factory ApplicationVersionDescriptionMessage.fromXml(_s.XmlElement elem) {
    return ApplicationVersionDescriptionMessage(
      applicationVersion: _s
          .extractXmlChild(elem, 'ApplicationVersion')
          ?.let(ApplicationVersionDescription.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersion = this.applicationVersion;
    return {
      if (applicationVersion != null) 'ApplicationVersion': applicationVersion,
    };
  }
}

/// Result message wrapping a list of application version descriptions.
class ApplicationVersionDescriptionsMessage {
  /// List of <code>ApplicationVersionDescription</code> objects sorted in order
  /// of creation.
  final List<ApplicationVersionDescription>? applicationVersions;

  /// In a paginated request, the token that you can pass in a subsequent request
  /// to get the next response page.
  final String? nextToken;

  ApplicationVersionDescriptionsMessage({
    this.applicationVersions,
    this.nextToken,
  });
  factory ApplicationVersionDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return ApplicationVersionDescriptionsMessage(
      applicationVersions: _s.extractXmlChild(elem, 'ApplicationVersions')?.let(
          (elem) => elem
              .findElements('member')
              .map(ApplicationVersionDescription.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersions = this.applicationVersions;
    final nextToken = this.nextToken;
    return {
      if (applicationVersions != null)
        'ApplicationVersions': applicationVersions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The application version lifecycle settings for an application. Defines the
/// rules that Elastic Beanstalk applies to an application's versions in order
/// to avoid hitting the per-region limit for application versions.
///
/// When Elastic Beanstalk deletes an application version from its database, you
/// can no longer deploy that version to an environment. The source bundle
/// remains in S3 unless you configure the rule to delete it.
class ApplicationVersionLifecycleConfig {
  /// Specify a max age rule to restrict the length of time that application
  /// versions are retained for an application.
  final MaxAgeRule? maxAgeRule;

  /// Specify a max count rule to restrict the number of application versions that
  /// are retained for an application.
  final MaxCountRule? maxCountRule;

  ApplicationVersionLifecycleConfig({
    this.maxAgeRule,
    this.maxCountRule,
  });
  factory ApplicationVersionLifecycleConfig.fromXml(_s.XmlElement elem) {
    return ApplicationVersionLifecycleConfig(
      maxAgeRule:
          _s.extractXmlChild(elem, 'MaxAgeRule')?.let(MaxAgeRule.fromXml),
      maxCountRule:
          _s.extractXmlChild(elem, 'MaxCountRule')?.let(MaxCountRule.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final maxAgeRule = this.maxAgeRule;
    final maxCountRule = this.maxCountRule;
    return {
      if (maxAgeRule != null) 'MaxAgeRule': maxAgeRule,
      if (maxCountRule != null) 'MaxCountRule': maxCountRule,
    };
  }
}

enum ApplicationVersionStatus {
  processed,
  unprocessed,
  failed,
  processing,
  building,
}

extension ApplicationVersionStatusValueExtension on ApplicationVersionStatus {
  String toValue() {
    switch (this) {
      case ApplicationVersionStatus.processed:
        return 'Processed';
      case ApplicationVersionStatus.unprocessed:
        return 'Unprocessed';
      case ApplicationVersionStatus.failed:
        return 'Failed';
      case ApplicationVersionStatus.processing:
        return 'Processing';
      case ApplicationVersionStatus.building:
        return 'Building';
    }
  }
}

extension ApplicationVersionStatusFromString on String {
  ApplicationVersionStatus toApplicationVersionStatus() {
    switch (this) {
      case 'Processed':
        return ApplicationVersionStatus.processed;
      case 'Unprocessed':
        return ApplicationVersionStatus.unprocessed;
      case 'Failed':
        return ApplicationVersionStatus.failed;
      case 'Processing':
        return ApplicationVersionStatus.processing;
      case 'Building':
        return ApplicationVersionStatus.building;
    }
    throw Exception('$this is not known in enum ApplicationVersionStatus');
  }
}

/// The result message containing information about the managed action.
class ApplyEnvironmentManagedActionResult {
  /// A description of the managed action.
  final String? actionDescription;

  /// The action ID of the managed action.
  final String? actionId;

  /// The type of managed action.
  final ActionType? actionType;

  /// The status of the managed action.
  final String? status;

  ApplyEnvironmentManagedActionResult({
    this.actionDescription,
    this.actionId,
    this.actionType,
    this.status,
  });
  factory ApplyEnvironmentManagedActionResult.fromXml(_s.XmlElement elem) {
    return ApplyEnvironmentManagedActionResult(
      actionDescription: _s.extractXmlStringValue(elem, 'ActionDescription'),
      actionId: _s.extractXmlStringValue(elem, 'ActionId'),
      actionType: _s.extractXmlStringValue(elem, 'ActionType')?.toActionType(),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final actionDescription = this.actionDescription;
    final actionId = this.actionId;
    final actionType = this.actionType;
    final status = this.status;
    return {
      if (actionDescription != null) 'ActionDescription': actionDescription,
      if (actionId != null) 'ActionId': actionId,
      if (actionType != null) 'ActionType': actionType.toValue(),
      if (status != null) 'Status': status,
    };
  }
}

/// Describes an Auto Scaling launch configuration.
class AutoScalingGroup {
  /// The name of the <code>AutoScalingGroup</code> .
  final String? name;

  AutoScalingGroup({
    this.name,
  });
  factory AutoScalingGroup.fromXml(_s.XmlElement elem) {
    return AutoScalingGroup(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Settings for an AWS CodeBuild build.
class BuildConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that enables AWS CodeBuild to interact with dependent AWS
  /// services on behalf of the AWS account.
  final String codeBuildServiceRole;

  /// The ID of the Docker image to use for this build project.
  final String image;

  /// The name of the artifact of the CodeBuild build. If provided, Elastic
  /// Beanstalk stores the build artifact in the S3 location
  /// <i>S3-bucket</i>/resources/<i>application-name</i>/codebuild/codebuild-<i>version-label</i>-<i>artifact-name</i>.zip.
  /// If not provided, Elastic Beanstalk stores the build artifact in the S3
  /// location
  /// <i>S3-bucket</i>/resources/<i>application-name</i>/codebuild/codebuild-<i>version-label</i>.zip.
  final String? artifactName;

  /// Information about the compute resources the build project will use.
  ///
  /// <ul>
  /// <li>
  /// <code>BUILD_GENERAL1_SMALL: Use up to 3 GB memory and 2 vCPUs for
  /// builds</code>
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_MEDIUM: Use up to 7 GB memory and 4 vCPUs for
  /// builds</code>
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_LARGE: Use up to 15 GB memory and 8 vCPUs for
  /// builds</code>
  /// </li>
  /// </ul>
  final ComputeType? computeType;

  /// How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait
  /// until timing out any related build that does not get marked as completed.
  /// The default is 60 minutes.
  final int? timeoutInMinutes;

  BuildConfiguration({
    required this.codeBuildServiceRole,
    required this.image,
    this.artifactName,
    this.computeType,
    this.timeoutInMinutes,
  });

  Map<String, dynamic> toJson() {
    final codeBuildServiceRole = this.codeBuildServiceRole;
    final image = this.image;
    final artifactName = this.artifactName;
    final computeType = this.computeType;
    final timeoutInMinutes = this.timeoutInMinutes;
    return {
      'CodeBuildServiceRole': codeBuildServiceRole,
      'Image': image,
      if (artifactName != null) 'ArtifactName': artifactName,
      if (computeType != null) 'ComputeType': computeType.toValue(),
      if (timeoutInMinutes != null) 'TimeoutInMinutes': timeoutInMinutes,
    };
  }
}

/// The builder used to build the custom platform.
class Builder {
  /// The ARN of the builder.
  final String? arn;

  Builder({
    this.arn,
  });
  factory Builder.fromXml(_s.XmlElement elem) {
    return Builder(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'ARN': arn,
    };
  }
}

/// CPU utilization metrics for an instance.
class CPUUtilization {
  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>I/O Wait</code> state
  /// over the last 10 seconds.
  final double? iOWait;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>IRQ</code> state over
  /// the last 10 seconds.
  final double? irq;

  /// Percentage of time that the CPU has spent in the <code>Idle</code> state
  /// over the last 10 seconds.
  final double? idle;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>Nice</code> state
  /// over the last 10 seconds.
  final double? nice;

  /// Available on Windows environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>Privileged</code>
  /// state over the last 10 seconds.
  final double? privileged;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>SoftIRQ</code> state
  /// over the last 10 seconds.
  final double? softIRQ;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>System</code> state
  /// over the last 10 seconds.
  final double? system;

  /// Percentage of time that the CPU has spent in the <code>User</code> state
  /// over the last 10 seconds.
  final double? user;

  CPUUtilization({
    this.iOWait,
    this.irq,
    this.idle,
    this.nice,
    this.privileged,
    this.softIRQ,
    this.system,
    this.user,
  });
  factory CPUUtilization.fromXml(_s.XmlElement elem) {
    return CPUUtilization(
      iOWait: _s.extractXmlDoubleValue(elem, 'IOWait'),
      irq: _s.extractXmlDoubleValue(elem, 'IRQ'),
      idle: _s.extractXmlDoubleValue(elem, 'Idle'),
      nice: _s.extractXmlDoubleValue(elem, 'Nice'),
      privileged: _s.extractXmlDoubleValue(elem, 'Privileged'),
      softIRQ: _s.extractXmlDoubleValue(elem, 'SoftIRQ'),
      system: _s.extractXmlDoubleValue(elem, 'System'),
      user: _s.extractXmlDoubleValue(elem, 'User'),
    );
  }

  Map<String, dynamic> toJson() {
    final iOWait = this.iOWait;
    final irq = this.irq;
    final idle = this.idle;
    final nice = this.nice;
    final privileged = this.privileged;
    final softIRQ = this.softIRQ;
    final system = this.system;
    final user = this.user;
    return {
      if (iOWait != null) 'IOWait': iOWait,
      if (irq != null) 'IRQ': irq,
      if (idle != null) 'Idle': idle,
      if (nice != null) 'Nice': nice,
      if (privileged != null) 'Privileged': privileged,
      if (softIRQ != null) 'SoftIRQ': softIRQ,
      if (system != null) 'System': system,
      if (user != null) 'User': user,
    };
  }
}

/// Indicates if the specified CNAME is available.
class CheckDNSAvailabilityResultMessage {
  /// Indicates if the specified CNAME is available:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code> : The CNAME is available.
  /// </li>
  /// <li>
  /// <code>false</code> : The CNAME is not available.
  /// </li>
  /// </ul>
  final bool? available;

  /// The fully qualified CNAME to reserve when <a>CreateEnvironment</a> is called
  /// with the provided prefix.
  final String? fullyQualifiedCNAME;

  CheckDNSAvailabilityResultMessage({
    this.available,
    this.fullyQualifiedCNAME,
  });
  factory CheckDNSAvailabilityResultMessage.fromXml(_s.XmlElement elem) {
    return CheckDNSAvailabilityResultMessage(
      available: _s.extractXmlBoolValue(elem, 'Available'),
      fullyQualifiedCNAME:
          _s.extractXmlStringValue(elem, 'FullyQualifiedCNAME'),
    );
  }

  Map<String, dynamic> toJson() {
    final available = this.available;
    final fullyQualifiedCNAME = this.fullyQualifiedCNAME;
    return {
      if (available != null) 'Available': available,
      if (fullyQualifiedCNAME != null)
        'FullyQualifiedCNAME': fullyQualifiedCNAME,
    };
  }
}

enum ComputeType {
  buildGeneral1Small,
  buildGeneral1Medium,
  buildGeneral1Large,
}

extension ComputeTypeValueExtension on ComputeType {
  String toValue() {
    switch (this) {
      case ComputeType.buildGeneral1Small:
        return 'BUILD_GENERAL1_SMALL';
      case ComputeType.buildGeneral1Medium:
        return 'BUILD_GENERAL1_MEDIUM';
      case ComputeType.buildGeneral1Large:
        return 'BUILD_GENERAL1_LARGE';
    }
  }
}

extension ComputeTypeFromString on String {
  ComputeType toComputeType() {
    switch (this) {
      case 'BUILD_GENERAL1_SMALL':
        return ComputeType.buildGeneral1Small;
      case 'BUILD_GENERAL1_MEDIUM':
        return ComputeType.buildGeneral1Medium;
      case 'BUILD_GENERAL1_LARGE':
        return ComputeType.buildGeneral1Large;
    }
    throw Exception('$this is not known in enum ComputeType');
  }
}

enum ConfigurationDeploymentStatus {
  deployed,
  pending,
  failed,
}

extension ConfigurationDeploymentStatusValueExtension
    on ConfigurationDeploymentStatus {
  String toValue() {
    switch (this) {
      case ConfigurationDeploymentStatus.deployed:
        return 'deployed';
      case ConfigurationDeploymentStatus.pending:
        return 'pending';
      case ConfigurationDeploymentStatus.failed:
        return 'failed';
    }
  }
}

extension ConfigurationDeploymentStatusFromString on String {
  ConfigurationDeploymentStatus toConfigurationDeploymentStatus() {
    switch (this) {
      case 'deployed':
        return ConfigurationDeploymentStatus.deployed;
      case 'pending':
        return ConfigurationDeploymentStatus.pending;
      case 'failed':
        return ConfigurationDeploymentStatus.failed;
    }
    throw Exception('$this is not known in enum ConfigurationDeploymentStatus');
  }
}

/// Describes the possible values for a configuration option.
class ConfigurationOptionDescription {
  /// An indication of which action is required if the value for this
  /// configuration option changes:
  ///
  /// <ul>
  /// <li>
  /// <code>NoInterruption</code> : There is no interruption to the environment or
  /// application availability.
  /// </li>
  /// <li>
  /// <code>RestartEnvironment</code> : The environment is entirely restarted, all
  /// AWS resources are deleted and recreated, and the environment is unavailable
  /// during the process.
  /// </li>
  /// <li>
  /// <code>RestartApplicationServer</code> : The environment is available the
  /// entire time. However, a short application outage occurs when the application
  /// servers on the running Amazon EC2 instances are restarted.
  /// </li>
  /// </ul>
  final String? changeSeverity;

  /// The default value for this configuration option.
  final String? defaultValue;

  /// If specified, the configuration option must be a string value no longer than
  /// this value.
  final int? maxLength;

  /// If specified, the configuration option must be a numeric value less than
  /// this value.
  final int? maxValue;

  /// If specified, the configuration option must be a numeric value greater than
  /// this value.
  final int? minValue;

  /// The name of the configuration option.
  final String? name;

  /// A unique namespace identifying the option's associated AWS resource.
  final String? namespace;

  /// If specified, the configuration option must be a string value that satisfies
  /// this regular expression.
  final OptionRestrictionRegex? regex;

  /// An indication of whether the user defined this configuration option:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code> : This configuration option was defined by the user. It is
  /// a valid choice for specifying if this as an <code>Option to Remove</code>
  /// when updating configuration settings.
  /// </li>
  /// <li>
  /// <code>false</code> : This configuration was not defined by the user.
  /// </li>
  /// </ul>
  /// Constraint: You can remove only <code>UserDefined</code> options from a
  /// configuration.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool? userDefined;

  /// If specified, values for the configuration option are selected from this
  /// list.
  final List<String>? valueOptions;

  /// An indication of which type of values this option has and whether it is
  /// allowable to select one or more than one of the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>Scalar</code> : Values for this option are a single selection from the
  /// possible values, or an unformatted string, or numeric value governed by the
  /// <code>MIN/MAX/Regex</code> constraints.
  /// </li>
  /// <li>
  /// <code>List</code> : Values for this option are multiple selections from the
  /// possible values.
  /// </li>
  /// <li>
  /// <code>Boolean</code> : Values for this option are either <code>true</code>
  /// or <code>false</code> .
  /// </li>
  /// <li>
  /// <code>Json</code> : Values for this option are a JSON representation of a
  /// <code>ConfigDocument</code>.
  /// </li>
  /// </ul>
  final ConfigurationOptionValueType? valueType;

  ConfigurationOptionDescription({
    this.changeSeverity,
    this.defaultValue,
    this.maxLength,
    this.maxValue,
    this.minValue,
    this.name,
    this.namespace,
    this.regex,
    this.userDefined,
    this.valueOptions,
    this.valueType,
  });
  factory ConfigurationOptionDescription.fromXml(_s.XmlElement elem) {
    return ConfigurationOptionDescription(
      changeSeverity: _s.extractXmlStringValue(elem, 'ChangeSeverity'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      maxLength: _s.extractXmlIntValue(elem, 'MaxLength'),
      maxValue: _s.extractXmlIntValue(elem, 'MaxValue'),
      minValue: _s.extractXmlIntValue(elem, 'MinValue'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      regex: _s
          .extractXmlChild(elem, 'Regex')
          ?.let(OptionRestrictionRegex.fromXml),
      userDefined: _s.extractXmlBoolValue(elem, 'UserDefined'),
      valueOptions: _s
          .extractXmlChild(elem, 'ValueOptions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      valueType: _s
          .extractXmlStringValue(elem, 'ValueType')
          ?.toConfigurationOptionValueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeSeverity = this.changeSeverity;
    final defaultValue = this.defaultValue;
    final maxLength = this.maxLength;
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final name = this.name;
    final namespace = this.namespace;
    final regex = this.regex;
    final userDefined = this.userDefined;
    final valueOptions = this.valueOptions;
    final valueType = this.valueType;
    return {
      if (changeSeverity != null) 'ChangeSeverity': changeSeverity,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (maxLength != null) 'MaxLength': maxLength,
      if (maxValue != null) 'MaxValue': maxValue,
      if (minValue != null) 'MinValue': minValue,
      if (name != null) 'Name': name,
      if (namespace != null) 'Namespace': namespace,
      if (regex != null) 'Regex': regex,
      if (userDefined != null) 'UserDefined': userDefined,
      if (valueOptions != null) 'ValueOptions': valueOptions,
      if (valueType != null) 'ValueType': valueType.toValue(),
    };
  }
}

/// A specification identifying an individual configuration option along with
/// its current value. For a list of possible namespaces and option values, see
/// <a
/// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html">Option
/// Values</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
class ConfigurationOptionSetting {
  /// A unique namespace that identifies the option's associated AWS resource.
  final String? namespace;

  /// The name of the configuration option.
  final String? optionName;

  /// A unique resource name for the option setting. Use it for a time–based
  /// scaling configuration option.
  final String? resourceName;

  /// The current value for the configuration option.
  final String? value;

  ConfigurationOptionSetting({
    this.namespace,
    this.optionName,
    this.resourceName,
    this.value,
  });
  factory ConfigurationOptionSetting.fromXml(_s.XmlElement elem) {
    return ConfigurationOptionSetting(
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      optionName: _s.extractXmlStringValue(elem, 'OptionName'),
      resourceName: _s.extractXmlStringValue(elem, 'ResourceName'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final optionName = this.optionName;
    final resourceName = this.resourceName;
    final value = this.value;
    return {
      if (namespace != null) 'Namespace': namespace,
      if (optionName != null) 'OptionName': optionName,
      if (resourceName != null) 'ResourceName': resourceName,
      if (value != null) 'Value': value,
    };
  }
}

enum ConfigurationOptionValueType {
  scalar,
  list,
}

extension ConfigurationOptionValueTypeValueExtension
    on ConfigurationOptionValueType {
  String toValue() {
    switch (this) {
      case ConfigurationOptionValueType.scalar:
        return 'Scalar';
      case ConfigurationOptionValueType.list:
        return 'List';
    }
  }
}

extension ConfigurationOptionValueTypeFromString on String {
  ConfigurationOptionValueType toConfigurationOptionValueType() {
    switch (this) {
      case 'Scalar':
        return ConfigurationOptionValueType.scalar;
      case 'List':
        return ConfigurationOptionValueType.list;
    }
    throw Exception('$this is not known in enum ConfigurationOptionValueType');
  }
}

/// Describes the settings for a specified configuration set.
class ConfigurationOptionsDescription {
  /// A list of <a>ConfigurationOptionDescription</a>.
  final List<ConfigurationOptionDescription>? options;

  /// The ARN of the platform version.
  final String? platformArn;

  /// The name of the solution stack these configuration options belong to.
  final String? solutionStackName;

  ConfigurationOptionsDescription({
    this.options,
    this.platformArn,
    this.solutionStackName,
  });
  factory ConfigurationOptionsDescription.fromXml(_s.XmlElement elem) {
    return ConfigurationOptionsDescription(
      options: _s.extractXmlChild(elem, 'Options')?.let((elem) => elem
          .findElements('member')
          .map(ConfigurationOptionDescription.fromXml)
          .toList()),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final platformArn = this.platformArn;
    final solutionStackName = this.solutionStackName;
    return {
      if (options != null) 'Options': options,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
    };
  }
}

/// Describes the settings for a configuration set.
class ConfigurationSettingsDescription {
  /// The name of the application associated with this configuration set.
  final String? applicationName;

  /// The date (in UTC time) when this configuration set was created.
  final DateTime? dateCreated;

  /// The date (in UTC time) when this configuration set was last modified.
  final DateTime? dateUpdated;

  /// If this configuration set is associated with an environment, the
  /// <code>DeploymentStatus</code> parameter indicates the deployment status of
  /// this configuration set:
  ///
  /// <ul>
  /// <li>
  /// <code>null</code>: This configuration is not associated with a running
  /// environment.
  /// </li>
  /// <li>
  /// <code>pending</code>: This is a draft configuration that is not deployed to
  /// the associated environment but is in the process of deploying.
  /// </li>
  /// <li>
  /// <code>deployed</code>: This is the configuration that is currently deployed
  /// to the associated running environment.
  /// </li>
  /// <li>
  /// <code>failed</code>: This is a draft configuration that failed to
  /// successfully deploy.
  /// </li>
  /// </ul>
  final ConfigurationDeploymentStatus? deploymentStatus;

  /// Describes this configuration set.
  final String? description;

  /// If not <code>null</code>, the name of the environment for this configuration
  /// set.
  final String? environmentName;

  /// A list of the configuration options and their values in this configuration
  /// set.
  final List<ConfigurationOptionSetting>? optionSettings;

  /// The ARN of the platform version.
  final String? platformArn;

  /// The name of the solution stack this configuration set uses.
  final String? solutionStackName;

  /// If not <code>null</code>, the name of the configuration template for this
  /// configuration set.
  final String? templateName;

  ConfigurationSettingsDescription({
    this.applicationName,
    this.dateCreated,
    this.dateUpdated,
    this.deploymentStatus,
    this.description,
    this.environmentName,
    this.optionSettings,
    this.platformArn,
    this.solutionStackName,
    this.templateName,
  });
  factory ConfigurationSettingsDescription.fromXml(_s.XmlElement elem) {
    return ConfigurationSettingsDescription(
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      deploymentStatus: _s
          .extractXmlStringValue(elem, 'DeploymentStatus')
          ?.toConfigurationDeploymentStatus(),
      description: _s.extractXmlStringValue(elem, 'Description'),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      optionSettings: _s.extractXmlChild(elem, 'OptionSettings')?.let((elem) =>
          elem
              .findElements('member')
              .map(ConfigurationOptionSetting.fromXml)
              .toList()),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationName = this.applicationName;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final deploymentStatus = this.deploymentStatus;
    final description = this.description;
    final environmentName = this.environmentName;
    final optionSettings = this.optionSettings;
    final platformArn = this.platformArn;
    final solutionStackName = this.solutionStackName;
    final templateName = this.templateName;
    return {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (dateCreated != null) 'DateCreated': iso8601ToJson(dateCreated),
      if (dateUpdated != null) 'DateUpdated': iso8601ToJson(dateUpdated),
      if (deploymentStatus != null)
        'DeploymentStatus': deploymentStatus.toValue(),
      if (description != null) 'Description': description,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (optionSettings != null) 'OptionSettings': optionSettings,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
      if (templateName != null) 'TemplateName': templateName,
    };
  }
}

/// The results from a request to change the configuration settings of an
/// environment.
class ConfigurationSettingsDescriptions {
  /// A list of <a>ConfigurationSettingsDescription</a>.
  final List<ConfigurationSettingsDescription>? configurationSettings;

  ConfigurationSettingsDescriptions({
    this.configurationSettings,
  });
  factory ConfigurationSettingsDescriptions.fromXml(_s.XmlElement elem) {
    return ConfigurationSettingsDescriptions(
      configurationSettings: _s
          .extractXmlChild(elem, 'ConfigurationSettings')
          ?.let((elem) => elem
              .findElements('member')
              .map(ConfigurationSettingsDescription.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSettings = this.configurationSettings;
    return {
      if (configurationSettings != null)
        'ConfigurationSettings': configurationSettings,
    };
  }
}

/// Provides a list of validation messages.
class ConfigurationSettingsValidationMessages {
  /// A list of <a>ValidationMessage</a>.
  final List<ValidationMessage>? messages;

  ConfigurationSettingsValidationMessages({
    this.messages,
  });
  factory ConfigurationSettingsValidationMessages.fromXml(_s.XmlElement elem) {
    return ConfigurationSettingsValidationMessages(
      messages: _s.extractXmlChild(elem, 'Messages')?.let((elem) =>
          elem.findElements('member').map(ValidationMessage.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    return {
      if (messages != null) 'Messages': messages,
    };
  }
}

class CreatePlatformVersionResult {
  /// The builder used to create the custom platform.
  final Builder? builder;

  /// Detailed information about the new version of the custom platform.
  final PlatformSummary? platformSummary;

  CreatePlatformVersionResult({
    this.builder,
    this.platformSummary,
  });
  factory CreatePlatformVersionResult.fromXml(_s.XmlElement elem) {
    return CreatePlatformVersionResult(
      builder: _s.extractXmlChild(elem, 'Builder')?.let(Builder.fromXml),
      platformSummary: _s
          .extractXmlChild(elem, 'PlatformSummary')
          ?.let(PlatformSummary.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final builder = this.builder;
    final platformSummary = this.platformSummary;
    return {
      if (builder != null) 'Builder': builder,
      if (platformSummary != null) 'PlatformSummary': platformSummary,
    };
  }
}

/// Results of a <a>CreateStorageLocationResult</a> call.
class CreateStorageLocationResultMessage {
  /// The name of the Amazon S3 bucket created.
  final String? s3Bucket;

  CreateStorageLocationResultMessage({
    this.s3Bucket,
  });
  factory CreateStorageLocationResultMessage.fromXml(_s.XmlElement elem) {
    return CreateStorageLocationResultMessage(
      s3Bucket: _s.extractXmlStringValue(elem, 'S3Bucket'),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    return {
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
    };
  }
}

/// A custom AMI available to platforms.
class CustomAmi {
  /// THe ID of the image used to create the custom AMI.
  final String? imageId;

  /// The type of virtualization used to create the custom AMI.
  final String? virtualizationType;

  CustomAmi({
    this.imageId,
    this.virtualizationType,
  });
  factory CustomAmi.fromXml(_s.XmlElement elem) {
    return CustomAmi(
      imageId: _s.extractXmlStringValue(elem, 'ImageId'),
      virtualizationType: _s.extractXmlStringValue(elem, 'VirtualizationType'),
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    final virtualizationType = this.virtualizationType;
    return {
      if (imageId != null) 'ImageId': imageId,
      if (virtualizationType != null) 'VirtualizationType': virtualizationType,
    };
  }
}

class DeletePlatformVersionResult {
  /// Detailed information about the version of the custom platform.
  final PlatformSummary? platformSummary;

  DeletePlatformVersionResult({
    this.platformSummary,
  });
  factory DeletePlatformVersionResult.fromXml(_s.XmlElement elem) {
    return DeletePlatformVersionResult(
      platformSummary: _s
          .extractXmlChild(elem, 'PlatformSummary')
          ?.let(PlatformSummary.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final platformSummary = this.platformSummary;
    return {
      if (platformSummary != null) 'PlatformSummary': platformSummary,
    };
  }
}

/// Information about an application version deployment.
class Deployment {
  /// The ID of the deployment. This number increases by one each time that you
  /// deploy source code or change instance configuration settings.
  final int? deploymentId;

  /// For in-progress deployments, the time that the deployment started.
  ///
  /// For completed deployments, the time that the deployment ended.
  final DateTime? deploymentTime;

  /// The status of the deployment:
  ///
  /// <ul>
  /// <li>
  /// <code>In Progress</code> : The deployment is in progress.
  /// </li>
  /// <li>
  /// <code>Deployed</code> : The deployment succeeded.
  /// </li>
  /// <li>
  /// <code>Failed</code> : The deployment failed.
  /// </li>
  /// </ul>
  final String? status;

  /// The version label of the application version in the deployment.
  final String? versionLabel;

  Deployment({
    this.deploymentId,
    this.deploymentTime,
    this.status,
    this.versionLabel,
  });
  factory Deployment.fromXml(_s.XmlElement elem) {
    return Deployment(
      deploymentId: _s.extractXmlIntValue(elem, 'DeploymentId'),
      deploymentTime: _s.extractXmlDateTimeValue(elem, 'DeploymentTime'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      versionLabel: _s.extractXmlStringValue(elem, 'VersionLabel'),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final deploymentTime = this.deploymentTime;
    final status = this.status;
    final versionLabel = this.versionLabel;
    return {
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (deploymentTime != null)
        'DeploymentTime': iso8601ToJson(deploymentTime),
      if (status != null) 'Status': status,
      if (versionLabel != null) 'VersionLabel': versionLabel,
    };
  }
}

class DescribeAccountAttributesResult {
  /// The Elastic Beanstalk resource quotas associated with the calling AWS
  /// account.
  final ResourceQuotas? resourceQuotas;

  DescribeAccountAttributesResult({
    this.resourceQuotas,
  });
  factory DescribeAccountAttributesResult.fromXml(_s.XmlElement elem) {
    return DescribeAccountAttributesResult(
      resourceQuotas: _s
          .extractXmlChild(elem, 'ResourceQuotas')
          ?.let(ResourceQuotas.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceQuotas = this.resourceQuotas;
    return {
      if (resourceQuotas != null) 'ResourceQuotas': resourceQuotas,
    };
  }
}

/// Health details for an AWS Elastic Beanstalk environment.
class DescribeEnvironmentHealthResult {
  /// Application request metrics for the environment.
  final ApplicationMetrics? applicationMetrics;

  /// Descriptions of the data that contributed to the environment's current
  /// health status.
  final List<String>? causes;

  /// The <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">health
  /// color</a> of the environment.
  final String? color;

  /// The environment's name.
  final String? environmentName;

  /// The <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">health
  /// status</a> of the environment. For example, <code>Ok</code>.
  final String? healthStatus;

  /// Summary health information for the instances in the environment.
  final InstanceHealthSummary? instancesHealth;

  /// The date and time that the health information was retrieved.
  final DateTime? refreshedAt;

  /// The environment's operational status. <code>Ready</code>,
  /// <code>Launching</code>, <code>Updating</code>, <code>Terminating</code>, or
  /// <code>Terminated</code>.
  final EnvironmentHealth? status;

  DescribeEnvironmentHealthResult({
    this.applicationMetrics,
    this.causes,
    this.color,
    this.environmentName,
    this.healthStatus,
    this.instancesHealth,
    this.refreshedAt,
    this.status,
  });
  factory DescribeEnvironmentHealthResult.fromXml(_s.XmlElement elem) {
    return DescribeEnvironmentHealthResult(
      applicationMetrics: _s
          .extractXmlChild(elem, 'ApplicationMetrics')
          ?.let(ApplicationMetrics.fromXml),
      causes: _s
          .extractXmlChild(elem, 'Causes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      color: _s.extractXmlStringValue(elem, 'Color'),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      healthStatus: _s.extractXmlStringValue(elem, 'HealthStatus'),
      instancesHealth: _s
          .extractXmlChild(elem, 'InstancesHealth')
          ?.let(InstanceHealthSummary.fromXml),
      refreshedAt: _s.extractXmlDateTimeValue(elem, 'RefreshedAt'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toEnvironmentHealth(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationMetrics = this.applicationMetrics;
    final causes = this.causes;
    final color = this.color;
    final environmentName = this.environmentName;
    final healthStatus = this.healthStatus;
    final instancesHealth = this.instancesHealth;
    final refreshedAt = this.refreshedAt;
    final status = this.status;
    return {
      if (applicationMetrics != null) 'ApplicationMetrics': applicationMetrics,
      if (causes != null) 'Causes': causes,
      if (color != null) 'Color': color,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (healthStatus != null) 'HealthStatus': healthStatus,
      if (instancesHealth != null) 'InstancesHealth': instancesHealth,
      if (refreshedAt != null) 'RefreshedAt': iso8601ToJson(refreshedAt),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A result message containing a list of completed and failed managed actions.
class DescribeEnvironmentManagedActionHistoryResult {
  /// A list of completed and failed managed actions.
  final List<ManagedActionHistoryItem>? managedActionHistoryItems;

  /// A pagination token that you pass to
  /// <a>DescribeEnvironmentManagedActionHistory</a> to get the next page of
  /// results.
  final String? nextToken;

  DescribeEnvironmentManagedActionHistoryResult({
    this.managedActionHistoryItems,
    this.nextToken,
  });
  factory DescribeEnvironmentManagedActionHistoryResult.fromXml(
      _s.XmlElement elem) {
    return DescribeEnvironmentManagedActionHistoryResult(
      managedActionHistoryItems: _s
          .extractXmlChild(elem, 'ManagedActionHistoryItems')
          ?.let((elem) => elem
              .findElements('member')
              .map(ManagedActionHistoryItem.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final managedActionHistoryItems = this.managedActionHistoryItems;
    final nextToken = this.nextToken;
    return {
      if (managedActionHistoryItems != null)
        'ManagedActionHistoryItems': managedActionHistoryItems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The result message containing a list of managed actions.
class DescribeEnvironmentManagedActionsResult {
  /// A list of upcoming and in-progress managed actions.
  final List<ManagedAction>? managedActions;

  DescribeEnvironmentManagedActionsResult({
    this.managedActions,
  });
  factory DescribeEnvironmentManagedActionsResult.fromXml(_s.XmlElement elem) {
    return DescribeEnvironmentManagedActionsResult(
      managedActions: _s.extractXmlChild(elem, 'ManagedActions')?.let((elem) =>
          elem.findElements('member').map(ManagedAction.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final managedActions = this.managedActions;
    return {
      if (managedActions != null) 'ManagedActions': managedActions,
    };
  }
}

/// Detailed health information about the Amazon EC2 instances in an AWS Elastic
/// Beanstalk environment.
class DescribeInstancesHealthResult {
  /// Detailed health information about each instance.
  ///
  /// The output differs slightly between Linux and Windows environments. There is
  /// a difference in the members that are supported under the
  /// <code>&lt;CPUUtilization&gt;</code> type.
  final List<SingleInstanceHealth>? instanceHealthList;

  /// Pagination token for the next page of results, if available.
  final String? nextToken;

  /// The date and time that the health information was retrieved.
  final DateTime? refreshedAt;

  DescribeInstancesHealthResult({
    this.instanceHealthList,
    this.nextToken,
    this.refreshedAt,
  });
  factory DescribeInstancesHealthResult.fromXml(_s.XmlElement elem) {
    return DescribeInstancesHealthResult(
      instanceHealthList: _s.extractXmlChild(elem, 'InstanceHealthList')?.let(
          (elem) => elem
              .findElements('member')
              .map(SingleInstanceHealth.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      refreshedAt: _s.extractXmlDateTimeValue(elem, 'RefreshedAt'),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceHealthList = this.instanceHealthList;
    final nextToken = this.nextToken;
    final refreshedAt = this.refreshedAt;
    return {
      if (instanceHealthList != null) 'InstanceHealthList': instanceHealthList,
      if (nextToken != null) 'NextToken': nextToken,
      if (refreshedAt != null) 'RefreshedAt': iso8601ToJson(refreshedAt),
    };
  }
}

class DescribePlatformVersionResult {
  /// Detailed information about the platform version.
  final PlatformDescription? platformDescription;

  DescribePlatformVersionResult({
    this.platformDescription,
  });
  factory DescribePlatformVersionResult.fromXml(_s.XmlElement elem) {
    return DescribePlatformVersionResult(
      platformDescription: _s
          .extractXmlChild(elem, 'PlatformDescription')
          ?.let(PlatformDescription.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final platformDescription = this.platformDescription;
    return {
      if (platformDescription != null)
        'PlatformDescription': platformDescription,
    };
  }
}

/// Describes the properties of an environment.
class EnvironmentDescription {
  /// Indicates if there is an in-progress environment configuration update or
  /// application version deployment that you can cancel.
  ///
  /// <code>true:</code> There is an update in progress.
  ///
  /// <code>false:</code> There are no updates currently in progress.
  final bool? abortableOperationInProgress;

  /// The name of the application associated with this environment.
  final String? applicationName;

  /// The URL to the CNAME for this environment.
  final String? cname;

  /// The creation date for this environment.
  final DateTime? dateCreated;

  /// The last modified date for this environment.
  final DateTime? dateUpdated;

  /// Describes this environment.
  final String? description;

  /// For load-balanced, autoscaling environments, the URL to the LoadBalancer.
  /// For single-instance environments, the IP address of the instance.
  final String? endpointURL;

  /// The environment's Amazon Resource Name (ARN), which can be used in other API
  /// requests that require an ARN.
  final String? environmentArn;

  /// The ID of this environment.
  final String? environmentId;

  /// A list of links to other environments in the same group.
  final List<EnvironmentLink>? environmentLinks;

  /// The name of this environment.
  final String? environmentName;

  /// Describes the health status of the environment. AWS Elastic Beanstalk
  /// indicates the failure levels for a running environment:
  ///
  /// <ul>
  /// <li>
  /// <code>Red</code>: Indicates the environment is not responsive. Occurs when
  /// three or more consecutive failures occur for an environment.
  /// </li>
  /// <li>
  /// <code>Yellow</code>: Indicates that something is wrong. Occurs when two
  /// consecutive failures occur for an environment.
  /// </li>
  /// <li>
  /// <code>Green</code>: Indicates the environment is healthy and fully
  /// functional.
  /// </li>
  /// <li>
  /// <code>Grey</code>: Default health for a new environment. The environment is
  /// not fully launched and health checks have not started or health checks are
  /// suspended during an <code>UpdateEnvironment</code> or
  /// <code>RestartEnvironment</code> request.
  /// </li>
  /// </ul>
  /// Default: <code>Grey</code>
  final EnvironmentHealth? health;

  /// Returns the health status of the application running in your environment.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health
  /// Colors and Statuses</a>.
  final EnvironmentHealthStatus? healthStatus;

  /// The Amazon Resource Name (ARN) of the environment's operations role. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html">Operations
  /// roles</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
  final String? operationsRole;

  /// The ARN of the platform version.
  final String? platformArn;

  /// The description of the AWS resources used by this environment.
  final EnvironmentResourcesDescription? resources;

  /// The name of the <code>SolutionStack</code> deployed with this environment.
  final String? solutionStackName;

  /// The current operational status of the environment:
  ///
  /// <ul>
  /// <li>
  /// <code>Launching</code>: Environment is in the process of initial deployment.
  /// </li>
  /// <li>
  /// <code>Updating</code>: Environment is in the process of updating its
  /// configuration settings or application version.
  /// </li>
  /// <li>
  /// <code>Ready</code>: Environment is available to have an action performed on
  /// it, such as update or terminate.
  /// </li>
  /// <li>
  /// <code>Terminating</code>: Environment is in the shut-down process.
  /// </li>
  /// <li>
  /// <code>Terminated</code>: Environment is not running.
  /// </li>
  /// </ul>
  final EnvironmentStatus? status;

  /// The name of the configuration template used to originally launch this
  /// environment.
  final String? templateName;

  /// Describes the current tier of this environment.
  final EnvironmentTier? tier;

  /// The application version deployed in this environment.
  final String? versionLabel;

  EnvironmentDescription({
    this.abortableOperationInProgress,
    this.applicationName,
    this.cname,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.endpointURL,
    this.environmentArn,
    this.environmentId,
    this.environmentLinks,
    this.environmentName,
    this.health,
    this.healthStatus,
    this.operationsRole,
    this.platformArn,
    this.resources,
    this.solutionStackName,
    this.status,
    this.templateName,
    this.tier,
    this.versionLabel,
  });
  factory EnvironmentDescription.fromXml(_s.XmlElement elem) {
    return EnvironmentDescription(
      abortableOperationInProgress:
          _s.extractXmlBoolValue(elem, 'AbortableOperationInProgress'),
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      cname: _s.extractXmlStringValue(elem, 'CNAME'),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      endpointURL: _s.extractXmlStringValue(elem, 'EndpointURL'),
      environmentArn: _s.extractXmlStringValue(elem, 'EnvironmentArn'),
      environmentId: _s.extractXmlStringValue(elem, 'EnvironmentId'),
      environmentLinks: _s.extractXmlChild(elem, 'EnvironmentLinks')?.let(
          (elem) => elem
              .findElements('member')
              .map(EnvironmentLink.fromXml)
              .toList()),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      health: _s.extractXmlStringValue(elem, 'Health')?.toEnvironmentHealth(),
      healthStatus: _s
          .extractXmlStringValue(elem, 'HealthStatus')
          ?.toEnvironmentHealthStatus(),
      operationsRole: _s.extractXmlStringValue(elem, 'OperationsRole'),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      resources: _s
          .extractXmlChild(elem, 'Resources')
          ?.let(EnvironmentResourcesDescription.fromXml),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toEnvironmentStatus(),
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
      tier: _s.extractXmlChild(elem, 'Tier')?.let(EnvironmentTier.fromXml),
      versionLabel: _s.extractXmlStringValue(elem, 'VersionLabel'),
    );
  }

  Map<String, dynamic> toJson() {
    final abortableOperationInProgress = this.abortableOperationInProgress;
    final applicationName = this.applicationName;
    final cname = this.cname;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final endpointURL = this.endpointURL;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final environmentLinks = this.environmentLinks;
    final environmentName = this.environmentName;
    final health = this.health;
    final healthStatus = this.healthStatus;
    final operationsRole = this.operationsRole;
    final platformArn = this.platformArn;
    final resources = this.resources;
    final solutionStackName = this.solutionStackName;
    final status = this.status;
    final templateName = this.templateName;
    final tier = this.tier;
    final versionLabel = this.versionLabel;
    return {
      if (abortableOperationInProgress != null)
        'AbortableOperationInProgress': abortableOperationInProgress,
      if (applicationName != null) 'ApplicationName': applicationName,
      if (cname != null) 'CNAME': cname,
      if (dateCreated != null) 'DateCreated': iso8601ToJson(dateCreated),
      if (dateUpdated != null) 'DateUpdated': iso8601ToJson(dateUpdated),
      if (description != null) 'Description': description,
      if (endpointURL != null) 'EndpointURL': endpointURL,
      if (environmentArn != null) 'EnvironmentArn': environmentArn,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentLinks != null) 'EnvironmentLinks': environmentLinks,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (health != null) 'Health': health.toValue(),
      if (healthStatus != null) 'HealthStatus': healthStatus.toValue(),
      if (operationsRole != null) 'OperationsRole': operationsRole,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (resources != null) 'Resources': resources,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
      if (status != null) 'Status': status.toValue(),
      if (templateName != null) 'TemplateName': templateName,
      if (tier != null) 'Tier': tier,
      if (versionLabel != null) 'VersionLabel': versionLabel,
    };
  }
}

/// Result message containing a list of environment descriptions.
class EnvironmentDescriptionsMessage {
  /// Returns an <a>EnvironmentDescription</a> list.
  final List<EnvironmentDescription>? environments;

  /// In a paginated request, the token that you can pass in a subsequent request
  /// to get the next response page.
  final String? nextToken;

  EnvironmentDescriptionsMessage({
    this.environments,
    this.nextToken,
  });
  factory EnvironmentDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return EnvironmentDescriptionsMessage(
      environments: _s.extractXmlChild(elem, 'Environments')?.let((elem) => elem
          .findElements('member')
          .map(EnvironmentDescription.fromXml)
          .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      if (environments != null) 'Environments': environments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum EnvironmentHealth {
  green,
  yellow,
  red,
  grey,
}

extension EnvironmentHealthValueExtension on EnvironmentHealth {
  String toValue() {
    switch (this) {
      case EnvironmentHealth.green:
        return 'Green';
      case EnvironmentHealth.yellow:
        return 'Yellow';
      case EnvironmentHealth.red:
        return 'Red';
      case EnvironmentHealth.grey:
        return 'Grey';
    }
  }
}

extension EnvironmentHealthFromString on String {
  EnvironmentHealth toEnvironmentHealth() {
    switch (this) {
      case 'Green':
        return EnvironmentHealth.green;
      case 'Yellow':
        return EnvironmentHealth.yellow;
      case 'Red':
        return EnvironmentHealth.red;
      case 'Grey':
        return EnvironmentHealth.grey;
    }
    throw Exception('$this is not known in enum EnvironmentHealth');
  }
}

enum EnvironmentHealthAttribute {
  status,
  color,
  causes,
  applicationMetrics,
  instancesHealth,
  all,
  healthStatus,
  refreshedAt,
}

extension EnvironmentHealthAttributeValueExtension
    on EnvironmentHealthAttribute {
  String toValue() {
    switch (this) {
      case EnvironmentHealthAttribute.status:
        return 'Status';
      case EnvironmentHealthAttribute.color:
        return 'Color';
      case EnvironmentHealthAttribute.causes:
        return 'Causes';
      case EnvironmentHealthAttribute.applicationMetrics:
        return 'ApplicationMetrics';
      case EnvironmentHealthAttribute.instancesHealth:
        return 'InstancesHealth';
      case EnvironmentHealthAttribute.all:
        return 'All';
      case EnvironmentHealthAttribute.healthStatus:
        return 'HealthStatus';
      case EnvironmentHealthAttribute.refreshedAt:
        return 'RefreshedAt';
    }
  }
}

extension EnvironmentHealthAttributeFromString on String {
  EnvironmentHealthAttribute toEnvironmentHealthAttribute() {
    switch (this) {
      case 'Status':
        return EnvironmentHealthAttribute.status;
      case 'Color':
        return EnvironmentHealthAttribute.color;
      case 'Causes':
        return EnvironmentHealthAttribute.causes;
      case 'ApplicationMetrics':
        return EnvironmentHealthAttribute.applicationMetrics;
      case 'InstancesHealth':
        return EnvironmentHealthAttribute.instancesHealth;
      case 'All':
        return EnvironmentHealthAttribute.all;
      case 'HealthStatus':
        return EnvironmentHealthAttribute.healthStatus;
      case 'RefreshedAt':
        return EnvironmentHealthAttribute.refreshedAt;
    }
    throw Exception('$this is not known in enum EnvironmentHealthAttribute');
  }
}

enum EnvironmentHealthStatus {
  noData,
  unknown,
  pending,
  ok,
  info,
  warning,
  degraded,
  severe,
  suspended,
}

extension EnvironmentHealthStatusValueExtension on EnvironmentHealthStatus {
  String toValue() {
    switch (this) {
      case EnvironmentHealthStatus.noData:
        return 'NoData';
      case EnvironmentHealthStatus.unknown:
        return 'Unknown';
      case EnvironmentHealthStatus.pending:
        return 'Pending';
      case EnvironmentHealthStatus.ok:
        return 'Ok';
      case EnvironmentHealthStatus.info:
        return 'Info';
      case EnvironmentHealthStatus.warning:
        return 'Warning';
      case EnvironmentHealthStatus.degraded:
        return 'Degraded';
      case EnvironmentHealthStatus.severe:
        return 'Severe';
      case EnvironmentHealthStatus.suspended:
        return 'Suspended';
    }
  }
}

extension EnvironmentHealthStatusFromString on String {
  EnvironmentHealthStatus toEnvironmentHealthStatus() {
    switch (this) {
      case 'NoData':
        return EnvironmentHealthStatus.noData;
      case 'Unknown':
        return EnvironmentHealthStatus.unknown;
      case 'Pending':
        return EnvironmentHealthStatus.pending;
      case 'Ok':
        return EnvironmentHealthStatus.ok;
      case 'Info':
        return EnvironmentHealthStatus.info;
      case 'Warning':
        return EnvironmentHealthStatus.warning;
      case 'Degraded':
        return EnvironmentHealthStatus.degraded;
      case 'Severe':
        return EnvironmentHealthStatus.severe;
      case 'Suspended':
        return EnvironmentHealthStatus.suspended;
    }
    throw Exception('$this is not known in enum EnvironmentHealthStatus');
  }
}

/// The information retrieved from the Amazon EC2 instances.
class EnvironmentInfoDescription {
  /// The Amazon EC2 Instance ID for this information.
  final String? ec2InstanceId;

  /// The type of information retrieved.
  final EnvironmentInfoType? infoType;

  /// The retrieved information. Currently contains a presigned Amazon S3 URL. The
  /// files are deleted after 15 minutes.
  ///
  /// Anyone in possession of this URL can access the files before they are
  /// deleted. Make the URL available only to trusted parties.
  final String? message;

  /// The time stamp when this information was retrieved.
  final DateTime? sampleTimestamp;

  EnvironmentInfoDescription({
    this.ec2InstanceId,
    this.infoType,
    this.message,
    this.sampleTimestamp,
  });
  factory EnvironmentInfoDescription.fromXml(_s.XmlElement elem) {
    return EnvironmentInfoDescription(
      ec2InstanceId: _s.extractXmlStringValue(elem, 'Ec2InstanceId'),
      infoType:
          _s.extractXmlStringValue(elem, 'InfoType')?.toEnvironmentInfoType(),
      message: _s.extractXmlStringValue(elem, 'Message'),
      sampleTimestamp: _s.extractXmlDateTimeValue(elem, 'SampleTimestamp'),
    );
  }

  Map<String, dynamic> toJson() {
    final ec2InstanceId = this.ec2InstanceId;
    final infoType = this.infoType;
    final message = this.message;
    final sampleTimestamp = this.sampleTimestamp;
    return {
      if (ec2InstanceId != null) 'Ec2InstanceId': ec2InstanceId,
      if (infoType != null) 'InfoType': infoType.toValue(),
      if (message != null) 'Message': message,
      if (sampleTimestamp != null)
        'SampleTimestamp': iso8601ToJson(sampleTimestamp),
    };
  }
}

enum EnvironmentInfoType {
  tail,
  bundle,
}

extension EnvironmentInfoTypeValueExtension on EnvironmentInfoType {
  String toValue() {
    switch (this) {
      case EnvironmentInfoType.tail:
        return 'tail';
      case EnvironmentInfoType.bundle:
        return 'bundle';
    }
  }
}

extension EnvironmentInfoTypeFromString on String {
  EnvironmentInfoType toEnvironmentInfoType() {
    switch (this) {
      case 'tail':
        return EnvironmentInfoType.tail;
      case 'bundle':
        return EnvironmentInfoType.bundle;
    }
    throw Exception('$this is not known in enum EnvironmentInfoType');
  }
}

/// A link to another environment, defined in the environment's manifest. Links
/// provide connection information in system properties that can be used to
/// connect to another environment in the same group. See <a
/// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment
/// Manifest (env.yaml)</a> for details.
class EnvironmentLink {
  /// The name of the linked environment (the dependency).
  final String? environmentName;

  /// The name of the link.
  final String? linkName;

  EnvironmentLink({
    this.environmentName,
    this.linkName,
  });
  factory EnvironmentLink.fromXml(_s.XmlElement elem) {
    return EnvironmentLink(
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      linkName: _s.extractXmlStringValue(elem, 'LinkName'),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentName = this.environmentName;
    final linkName = this.linkName;
    return {
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (linkName != null) 'LinkName': linkName,
    };
  }
}

/// Describes the AWS resources in use by this environment. This data is live.
class EnvironmentResourceDescription {
  /// The <code>AutoScalingGroups</code> used by this environment.
  final List<AutoScalingGroup>? autoScalingGroups;

  /// The name of the environment.
  final String? environmentName;

  /// The Amazon EC2 instances used by this environment.
  final List<Instance>? instances;

  /// The Auto Scaling launch configurations in use by this environment.
  final List<LaunchConfiguration>? launchConfigurations;

  /// The Amazon EC2 launch templates in use by this environment.
  final List<LaunchTemplate>? launchTemplates;

  /// The LoadBalancers in use by this environment.
  final List<LoadBalancer>? loadBalancers;

  /// The queues used by this environment.
  final List<Queue>? queues;

  /// The <code>AutoScaling</code> triggers in use by this environment.
  final List<Trigger>? triggers;

  EnvironmentResourceDescription({
    this.autoScalingGroups,
    this.environmentName,
    this.instances,
    this.launchConfigurations,
    this.launchTemplates,
    this.loadBalancers,
    this.queues,
    this.triggers,
  });
  factory EnvironmentResourceDescription.fromXml(_s.XmlElement elem) {
    return EnvironmentResourceDescription(
      autoScalingGroups: _s.extractXmlChild(elem, 'AutoScalingGroups')?.let(
          (elem) => elem
              .findElements('member')
              .map(AutoScalingGroup.fromXml)
              .toList()),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      instances: _s.extractXmlChild(elem, 'Instances')?.let(
          (elem) => elem.findElements('member').map(Instance.fromXml).toList()),
      launchConfigurations: _s
          .extractXmlChild(elem, 'LaunchConfigurations')
          ?.let((elem) => elem
              .findElements('member')
              .map(LaunchConfiguration.fromXml)
              .toList()),
      launchTemplates: _s.extractXmlChild(elem, 'LaunchTemplates')?.let(
          (elem) =>
              elem.findElements('member').map(LaunchTemplate.fromXml).toList()),
      loadBalancers: _s.extractXmlChild(elem, 'LoadBalancers')?.let((elem) =>
          elem.findElements('member').map(LoadBalancer.fromXml).toList()),
      queues: _s.extractXmlChild(elem, 'Queues')?.let(
          (elem) => elem.findElements('member').map(Queue.fromXml).toList()),
      triggers: _s.extractXmlChild(elem, 'Triggers')?.let(
          (elem) => elem.findElements('member').map(Trigger.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingGroups = this.autoScalingGroups;
    final environmentName = this.environmentName;
    final instances = this.instances;
    final launchConfigurations = this.launchConfigurations;
    final launchTemplates = this.launchTemplates;
    final loadBalancers = this.loadBalancers;
    final queues = this.queues;
    final triggers = this.triggers;
    return {
      if (autoScalingGroups != null) 'AutoScalingGroups': autoScalingGroups,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (instances != null) 'Instances': instances,
      if (launchConfigurations != null)
        'LaunchConfigurations': launchConfigurations,
      if (launchTemplates != null) 'LaunchTemplates': launchTemplates,
      if (loadBalancers != null) 'LoadBalancers': loadBalancers,
      if (queues != null) 'Queues': queues,
      if (triggers != null) 'Triggers': triggers,
    };
  }
}

/// Result message containing a list of environment resource descriptions.
class EnvironmentResourceDescriptionsMessage {
  /// A list of <a>EnvironmentResourceDescription</a>.
  final EnvironmentResourceDescription? environmentResources;

  EnvironmentResourceDescriptionsMessage({
    this.environmentResources,
  });
  factory EnvironmentResourceDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return EnvironmentResourceDescriptionsMessage(
      environmentResources: _s
          .extractXmlChild(elem, 'EnvironmentResources')
          ?.let(EnvironmentResourceDescription.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentResources = this.environmentResources;
    return {
      if (environmentResources != null)
        'EnvironmentResources': environmentResources,
    };
  }
}

/// Describes the AWS resources in use by this environment. This data is not
/// live data.
class EnvironmentResourcesDescription {
  /// Describes the LoadBalancer.
  final LoadBalancerDescription? loadBalancer;

  EnvironmentResourcesDescription({
    this.loadBalancer,
  });
  factory EnvironmentResourcesDescription.fromXml(_s.XmlElement elem) {
    return EnvironmentResourcesDescription(
      loadBalancer: _s
          .extractXmlChild(elem, 'LoadBalancer')
          ?.let(LoadBalancerDescription.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancer = this.loadBalancer;
    return {
      if (loadBalancer != null) 'LoadBalancer': loadBalancer,
    };
  }
}

enum EnvironmentStatus {
  aborting,
  launching,
  updating,
  linkingFrom,
  linkingTo,
  ready,
  terminating,
  terminated,
}

extension EnvironmentStatusValueExtension on EnvironmentStatus {
  String toValue() {
    switch (this) {
      case EnvironmentStatus.aborting:
        return 'Aborting';
      case EnvironmentStatus.launching:
        return 'Launching';
      case EnvironmentStatus.updating:
        return 'Updating';
      case EnvironmentStatus.linkingFrom:
        return 'LinkingFrom';
      case EnvironmentStatus.linkingTo:
        return 'LinkingTo';
      case EnvironmentStatus.ready:
        return 'Ready';
      case EnvironmentStatus.terminating:
        return 'Terminating';
      case EnvironmentStatus.terminated:
        return 'Terminated';
    }
  }
}

extension EnvironmentStatusFromString on String {
  EnvironmentStatus toEnvironmentStatus() {
    switch (this) {
      case 'Aborting':
        return EnvironmentStatus.aborting;
      case 'Launching':
        return EnvironmentStatus.launching;
      case 'Updating':
        return EnvironmentStatus.updating;
      case 'LinkingFrom':
        return EnvironmentStatus.linkingFrom;
      case 'LinkingTo':
        return EnvironmentStatus.linkingTo;
      case 'Ready':
        return EnvironmentStatus.ready;
      case 'Terminating':
        return EnvironmentStatus.terminating;
      case 'Terminated':
        return EnvironmentStatus.terminated;
    }
    throw Exception('$this is not known in enum EnvironmentStatus');
  }
}

/// Describes the properties of an environment tier
class EnvironmentTier {
  /// The name of this environment tier.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// For <i>Web server tier</i> – <code>WebServer</code>
  /// </li>
  /// <li>
  /// For <i>Worker tier</i> – <code>Worker</code>
  /// </li>
  /// </ul>
  final String? name;

  /// The type of this environment tier.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// For <i>Web server tier</i> – <code>Standard</code>
  /// </li>
  /// <li>
  /// For <i>Worker tier</i> – <code>SQS/HTTP</code>
  /// </li>
  /// </ul>
  final String? type;

  /// The version of this environment tier. When you don't set a value to it,
  /// Elastic Beanstalk uses the latest compatible worker tier version.
  /// <note>
  /// This member is deprecated. Any specific version that you set may become out
  /// of date. We recommend leaving it unspecified.
  /// </note>
  final String? version;

  EnvironmentTier({
    this.name,
    this.type,
    this.version,
  });
  factory EnvironmentTier.fromXml(_s.XmlElement elem) {
    return EnvironmentTier(
      name: _s.extractXmlStringValue(elem, 'Name'),
      type: _s.extractXmlStringValue(elem, 'Type'),
      version: _s.extractXmlStringValue(elem, 'Version'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final version = this.version;
    return {
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
      if (version != null) 'Version': version,
    };
  }
}

/// Describes an event.
class EventDescription {
  /// The application associated with the event.
  final String? applicationName;

  /// The name of the environment associated with this event.
  final String? environmentName;

  /// The date when the event occurred.
  final DateTime? eventDate;

  /// The event message.
  final String? message;

  /// The ARN of the platform version.
  final String? platformArn;

  /// The web service request ID for the activity of this event.
  final String? requestId;

  /// The severity level of this event.
  final EventSeverity? severity;

  /// The name of the configuration associated with this event.
  final String? templateName;

  /// The release label for the application version associated with this event.
  final String? versionLabel;

  EventDescription({
    this.applicationName,
    this.environmentName,
    this.eventDate,
    this.message,
    this.platformArn,
    this.requestId,
    this.severity,
    this.templateName,
    this.versionLabel,
  });
  factory EventDescription.fromXml(_s.XmlElement elem) {
    return EventDescription(
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      eventDate: _s.extractXmlDateTimeValue(elem, 'EventDate'),
      message: _s.extractXmlStringValue(elem, 'Message'),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      requestId: _s.extractXmlStringValue(elem, 'RequestId'),
      severity: _s.extractXmlStringValue(elem, 'Severity')?.toEventSeverity(),
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
      versionLabel: _s.extractXmlStringValue(elem, 'VersionLabel'),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationName = this.applicationName;
    final environmentName = this.environmentName;
    final eventDate = this.eventDate;
    final message = this.message;
    final platformArn = this.platformArn;
    final requestId = this.requestId;
    final severity = this.severity;
    final templateName = this.templateName;
    final versionLabel = this.versionLabel;
    return {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (eventDate != null) 'EventDate': iso8601ToJson(eventDate),
      if (message != null) 'Message': message,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (requestId != null) 'RequestId': requestId,
      if (severity != null) 'Severity': severity.toValue(),
      if (templateName != null) 'TemplateName': templateName,
      if (versionLabel != null) 'VersionLabel': versionLabel,
    };
  }
}

/// Result message wrapping a list of event descriptions.
class EventDescriptionsMessage {
  /// A list of <a>EventDescription</a>.
  final List<EventDescription>? events;

  /// If returned, this indicates that there are more results to obtain. Use this
  /// token in the next <a>DescribeEvents</a> call to get the next batch of
  /// events.
  final String? nextToken;

  EventDescriptionsMessage({
    this.events,
    this.nextToken,
  });
  factory EventDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return EventDescriptionsMessage(
      events: _s.extractXmlChild(elem, 'Events')?.let((elem) =>
          elem.findElements('member').map(EventDescription.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'Events': events,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum EventSeverity {
  trace,
  debug,
  info,
  warn,
  error,
  fatal,
}

extension EventSeverityValueExtension on EventSeverity {
  String toValue() {
    switch (this) {
      case EventSeverity.trace:
        return 'TRACE';
      case EventSeverity.debug:
        return 'DEBUG';
      case EventSeverity.info:
        return 'INFO';
      case EventSeverity.warn:
        return 'WARN';
      case EventSeverity.error:
        return 'ERROR';
      case EventSeverity.fatal:
        return 'FATAL';
    }
  }
}

extension EventSeverityFromString on String {
  EventSeverity toEventSeverity() {
    switch (this) {
      case 'TRACE':
        return EventSeverity.trace;
      case 'DEBUG':
        return EventSeverity.debug;
      case 'INFO':
        return EventSeverity.info;
      case 'WARN':
        return EventSeverity.warn;
      case 'ERROR':
        return EventSeverity.error;
      case 'FATAL':
        return EventSeverity.fatal;
    }
    throw Exception('$this is not known in enum EventSeverity');
  }
}

enum FailureType {
  updateCancelled,
  cancellationFailed,
  rollbackFailed,
  rollbackSuccessful,
  internalFailure,
  invalidEnvironmentState,
  permissionsError,
}

extension FailureTypeValueExtension on FailureType {
  String toValue() {
    switch (this) {
      case FailureType.updateCancelled:
        return 'UpdateCancelled';
      case FailureType.cancellationFailed:
        return 'CancellationFailed';
      case FailureType.rollbackFailed:
        return 'RollbackFailed';
      case FailureType.rollbackSuccessful:
        return 'RollbackSuccessful';
      case FailureType.internalFailure:
        return 'InternalFailure';
      case FailureType.invalidEnvironmentState:
        return 'InvalidEnvironmentState';
      case FailureType.permissionsError:
        return 'PermissionsError';
    }
  }
}

extension FailureTypeFromString on String {
  FailureType toFailureType() {
    switch (this) {
      case 'UpdateCancelled':
        return FailureType.updateCancelled;
      case 'CancellationFailed':
        return FailureType.cancellationFailed;
      case 'RollbackFailed':
        return FailureType.rollbackFailed;
      case 'RollbackSuccessful':
        return FailureType.rollbackSuccessful;
      case 'InternalFailure':
        return FailureType.internalFailure;
      case 'InvalidEnvironmentState':
        return FailureType.invalidEnvironmentState;
      case 'PermissionsError':
        return FailureType.permissionsError;
    }
    throw Exception('$this is not known in enum FailureType');
  }
}

/// The description of an Amazon EC2 instance.
class Instance {
  /// The ID of the Amazon EC2 instance.
  final String? id;

  Instance({
    this.id,
  });
  factory Instance.fromXml(_s.XmlElement elem) {
    return Instance(
      id: _s.extractXmlStringValue(elem, 'Id'),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

/// Represents summary information about the health of an instance. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health
/// Colors and Statuses</a>.
class InstanceHealthSummary {
  /// <b>Red.</b> The health agent is reporting a high number of request failures
  /// or other issues for an instance or environment.
  final int? degraded;

  /// <b>Green.</b> An operation is in progress on an instance.
  final int? info;

  /// <b>Grey.</b> AWS Elastic Beanstalk and the health agent are reporting no
  /// data on an instance.
  final int? noData;

  /// <b>Green.</b> An instance is passing health checks and the health agent is
  /// not reporting any problems.
  final int? ok;

  /// <b>Grey.</b> An operation is in progress on an instance within the command
  /// timeout.
  final int? pending;

  /// <b>Red.</b> The health agent is reporting a very high number of request
  /// failures or other issues for an instance or environment.
  final int? severe;

  /// <b>Grey.</b> AWS Elastic Beanstalk and the health agent are reporting an
  /// insufficient amount of data on an instance.
  final int? unknown;

  /// <b>Yellow.</b> The health agent is reporting a moderate number of request
  /// failures or other issues for an instance or environment.
  final int? warning;

  InstanceHealthSummary({
    this.degraded,
    this.info,
    this.noData,
    this.ok,
    this.pending,
    this.severe,
    this.unknown,
    this.warning,
  });
  factory InstanceHealthSummary.fromXml(_s.XmlElement elem) {
    return InstanceHealthSummary(
      degraded: _s.extractXmlIntValue(elem, 'Degraded'),
      info: _s.extractXmlIntValue(elem, 'Info'),
      noData: _s.extractXmlIntValue(elem, 'NoData'),
      ok: _s.extractXmlIntValue(elem, 'Ok'),
      pending: _s.extractXmlIntValue(elem, 'Pending'),
      severe: _s.extractXmlIntValue(elem, 'Severe'),
      unknown: _s.extractXmlIntValue(elem, 'Unknown'),
      warning: _s.extractXmlIntValue(elem, 'Warning'),
    );
  }

  Map<String, dynamic> toJson() {
    final degraded = this.degraded;
    final info = this.info;
    final noData = this.noData;
    final ok = this.ok;
    final pending = this.pending;
    final severe = this.severe;
    final unknown = this.unknown;
    final warning = this.warning;
    return {
      if (degraded != null) 'Degraded': degraded,
      if (info != null) 'Info': info,
      if (noData != null) 'NoData': noData,
      if (ok != null) 'Ok': ok,
      if (pending != null) 'Pending': pending,
      if (severe != null) 'Severe': severe,
      if (unknown != null) 'Unknown': unknown,
      if (warning != null) 'Warning': warning,
    };
  }
}

enum InstancesHealthAttribute {
  healthStatus,
  color,
  causes,
  applicationMetrics,
  refreshedAt,
  launchedAt,
  system,
  deployment,
  availabilityZone,
  instanceType,
  all,
}

extension InstancesHealthAttributeValueExtension on InstancesHealthAttribute {
  String toValue() {
    switch (this) {
      case InstancesHealthAttribute.healthStatus:
        return 'HealthStatus';
      case InstancesHealthAttribute.color:
        return 'Color';
      case InstancesHealthAttribute.causes:
        return 'Causes';
      case InstancesHealthAttribute.applicationMetrics:
        return 'ApplicationMetrics';
      case InstancesHealthAttribute.refreshedAt:
        return 'RefreshedAt';
      case InstancesHealthAttribute.launchedAt:
        return 'LaunchedAt';
      case InstancesHealthAttribute.system:
        return 'System';
      case InstancesHealthAttribute.deployment:
        return 'Deployment';
      case InstancesHealthAttribute.availabilityZone:
        return 'AvailabilityZone';
      case InstancesHealthAttribute.instanceType:
        return 'InstanceType';
      case InstancesHealthAttribute.all:
        return 'All';
    }
  }
}

extension InstancesHealthAttributeFromString on String {
  InstancesHealthAttribute toInstancesHealthAttribute() {
    switch (this) {
      case 'HealthStatus':
        return InstancesHealthAttribute.healthStatus;
      case 'Color':
        return InstancesHealthAttribute.color;
      case 'Causes':
        return InstancesHealthAttribute.causes;
      case 'ApplicationMetrics':
        return InstancesHealthAttribute.applicationMetrics;
      case 'RefreshedAt':
        return InstancesHealthAttribute.refreshedAt;
      case 'LaunchedAt':
        return InstancesHealthAttribute.launchedAt;
      case 'System':
        return InstancesHealthAttribute.system;
      case 'Deployment':
        return InstancesHealthAttribute.deployment;
      case 'AvailabilityZone':
        return InstancesHealthAttribute.availabilityZone;
      case 'InstanceType':
        return InstancesHealthAttribute.instanceType;
      case 'All':
        return InstancesHealthAttribute.all;
    }
    throw Exception('$this is not known in enum InstancesHealthAttribute');
  }
}

/// Represents the average latency for the slowest X percent of requests over
/// the last 10 seconds.
class Latency {
  /// The average latency for the slowest 90 percent of requests over the last 10
  /// seconds.
  final double? p10;

  /// The average latency for the slowest 50 percent of requests over the last 10
  /// seconds.
  final double? p50;

  /// The average latency for the slowest 25 percent of requests over the last 10
  /// seconds.
  final double? p75;

  /// The average latency for the slowest 15 percent of requests over the last 10
  /// seconds.
  final double? p85;

  /// The average latency for the slowest 10 percent of requests over the last 10
  /// seconds.
  final double? p90;

  /// The average latency for the slowest 5 percent of requests over the last 10
  /// seconds.
  final double? p95;

  /// The average latency for the slowest 1 percent of requests over the last 10
  /// seconds.
  final double? p99;

  /// The average latency for the slowest 0.1 percent of requests over the last 10
  /// seconds.
  final double? p999;

  Latency({
    this.p10,
    this.p50,
    this.p75,
    this.p85,
    this.p90,
    this.p95,
    this.p99,
    this.p999,
  });
  factory Latency.fromXml(_s.XmlElement elem) {
    return Latency(
      p10: _s.extractXmlDoubleValue(elem, 'P10'),
      p50: _s.extractXmlDoubleValue(elem, 'P50'),
      p75: _s.extractXmlDoubleValue(elem, 'P75'),
      p85: _s.extractXmlDoubleValue(elem, 'P85'),
      p90: _s.extractXmlDoubleValue(elem, 'P90'),
      p95: _s.extractXmlDoubleValue(elem, 'P95'),
      p99: _s.extractXmlDoubleValue(elem, 'P99'),
      p999: _s.extractXmlDoubleValue(elem, 'P999'),
    );
  }

  Map<String, dynamic> toJson() {
    final p10 = this.p10;
    final p50 = this.p50;
    final p75 = this.p75;
    final p85 = this.p85;
    final p90 = this.p90;
    final p95 = this.p95;
    final p99 = this.p99;
    final p999 = this.p999;
    return {
      if (p10 != null) 'P10': p10,
      if (p50 != null) 'P50': p50,
      if (p75 != null) 'P75': p75,
      if (p85 != null) 'P85': p85,
      if (p90 != null) 'P90': p90,
      if (p95 != null) 'P95': p95,
      if (p99 != null) 'P99': p99,
      if (p999 != null) 'P999': p999,
    };
  }
}

/// Describes an Auto Scaling launch configuration.
class LaunchConfiguration {
  /// The name of the launch configuration.
  final String? name;

  LaunchConfiguration({
    this.name,
  });
  factory LaunchConfiguration.fromXml(_s.XmlElement elem) {
    return LaunchConfiguration(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Describes an Amazon EC2 launch template.
class LaunchTemplate {
  /// The ID of the launch template.
  final String? id;

  LaunchTemplate({
    this.id,
  });
  factory LaunchTemplate.fromXml(_s.XmlElement elem) {
    return LaunchTemplate(
      id: _s.extractXmlStringValue(elem, 'Id'),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

/// A list of available AWS Elastic Beanstalk solution stacks.
class ListAvailableSolutionStacksResultMessage {
  /// A list of available solution stacks and their
  /// <a>SolutionStackDescription</a>.
  final List<SolutionStackDescription>? solutionStackDetails;

  /// A list of available solution stacks.
  final List<String>? solutionStacks;

  ListAvailableSolutionStacksResultMessage({
    this.solutionStackDetails,
    this.solutionStacks,
  });
  factory ListAvailableSolutionStacksResultMessage.fromXml(_s.XmlElement elem) {
    return ListAvailableSolutionStacksResultMessage(
      solutionStackDetails: _s
          .extractXmlChild(elem, 'SolutionStackDetails')
          ?.let((elem) => elem
              .findElements('member')
              .map(SolutionStackDescription.fromXml)
              .toList()),
      solutionStacks: _s
          .extractXmlChild(elem, 'SolutionStacks')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final solutionStackDetails = this.solutionStackDetails;
    final solutionStacks = this.solutionStacks;
    return {
      if (solutionStackDetails != null)
        'SolutionStackDetails': solutionStackDetails,
      if (solutionStacks != null) 'SolutionStacks': solutionStacks,
    };
  }
}

class ListPlatformBranchesResult {
  /// In a paginated request, if this value isn't <code>null</code>, it's the
  /// token that you can pass in a subsequent request to get the next response
  /// page.
  final String? nextToken;

  /// Summary information about the platform branches.
  final List<PlatformBranchSummary>? platformBranchSummaryList;

  ListPlatformBranchesResult({
    this.nextToken,
    this.platformBranchSummaryList,
  });
  factory ListPlatformBranchesResult.fromXml(_s.XmlElement elem) {
    return ListPlatformBranchesResult(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      platformBranchSummaryList: _s
          .extractXmlChild(elem, 'PlatformBranchSummaryList')
          ?.let((elem) => elem
              .findElements('member')
              .map(PlatformBranchSummary.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final platformBranchSummaryList = this.platformBranchSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (platformBranchSummaryList != null)
        'PlatformBranchSummaryList': platformBranchSummaryList,
    };
  }
}

class ListPlatformVersionsResult {
  /// In a paginated request, if this value isn't <code>null</code>, it's the
  /// token that you can pass in a subsequent request to get the next response
  /// page.
  final String? nextToken;

  /// Summary information about the platform versions.
  final List<PlatformSummary>? platformSummaryList;

  ListPlatformVersionsResult({
    this.nextToken,
    this.platformSummaryList,
  });
  factory ListPlatformVersionsResult.fromXml(_s.XmlElement elem) {
    return ListPlatformVersionsResult(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      platformSummaryList: _s.extractXmlChild(elem, 'PlatformSummaryList')?.let(
          (elem) => elem
              .findElements('member')
              .map(PlatformSummary.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final platformSummaryList = this.platformSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (platformSummaryList != null)
        'PlatformSummaryList': platformSummaryList,
    };
  }
}

/// Describes the properties of a Listener for the LoadBalancer.
class Listener {
  /// The port that is used by the Listener.
  final int? port;

  /// The protocol that is used by the Listener.
  final String? protocol;

  Listener({
    this.port,
    this.protocol,
  });
  factory Listener.fromXml(_s.XmlElement elem) {
    return Listener(
      port: _s.extractXmlIntValue(elem, 'Port'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol'),
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final protocol = this.protocol;
    return {
      if (port != null) 'Port': port,
      if (protocol != null) 'Protocol': protocol,
    };
  }
}

/// Describes a LoadBalancer.
class LoadBalancer {
  /// The name of the LoadBalancer.
  final String? name;

  LoadBalancer({
    this.name,
  });
  factory LoadBalancer.fromXml(_s.XmlElement elem) {
    return LoadBalancer(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Describes the details of a LoadBalancer.
class LoadBalancerDescription {
  /// The domain name of the LoadBalancer.
  final String? domain;

  /// A list of Listeners used by the LoadBalancer.
  final List<Listener>? listeners;

  /// The name of the LoadBalancer.
  final String? loadBalancerName;

  LoadBalancerDescription({
    this.domain,
    this.listeners,
    this.loadBalancerName,
  });
  factory LoadBalancerDescription.fromXml(_s.XmlElement elem) {
    return LoadBalancerDescription(
      domain: _s.extractXmlStringValue(elem, 'Domain'),
      listeners: _s.extractXmlChild(elem, 'Listeners')?.let(
          (elem) => elem.findElements('member').map(Listener.fromXml).toList()),
      loadBalancerName: _s.extractXmlStringValue(elem, 'LoadBalancerName'),
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final listeners = this.listeners;
    final loadBalancerName = this.loadBalancerName;
    return {
      if (domain != null) 'Domain': domain,
      if (listeners != null) 'Listeners': listeners,
      if (loadBalancerName != null) 'LoadBalancerName': loadBalancerName,
    };
  }
}

/// The record of an upcoming or in-progress managed action.
class ManagedAction {
  /// A description of the managed action.
  final String? actionDescription;

  /// A unique identifier for the managed action.
  final String? actionId;

  /// The type of managed action.
  final ActionType? actionType;

  /// The status of the managed action. If the action is <code>Scheduled</code>,
  /// you can apply it immediately with <a>ApplyEnvironmentManagedAction</a>.
  final ActionStatus? status;

  /// The start time of the maintenance window in which the managed action will
  /// execute.
  final DateTime? windowStartTime;

  ManagedAction({
    this.actionDescription,
    this.actionId,
    this.actionType,
    this.status,
    this.windowStartTime,
  });
  factory ManagedAction.fromXml(_s.XmlElement elem) {
    return ManagedAction(
      actionDescription: _s.extractXmlStringValue(elem, 'ActionDescription'),
      actionId: _s.extractXmlStringValue(elem, 'ActionId'),
      actionType: _s.extractXmlStringValue(elem, 'ActionType')?.toActionType(),
      status: _s.extractXmlStringValue(elem, 'Status')?.toActionStatus(),
      windowStartTime: _s.extractXmlDateTimeValue(elem, 'WindowStartTime'),
    );
  }

  Map<String, dynamic> toJson() {
    final actionDescription = this.actionDescription;
    final actionId = this.actionId;
    final actionType = this.actionType;
    final status = this.status;
    final windowStartTime = this.windowStartTime;
    return {
      if (actionDescription != null) 'ActionDescription': actionDescription,
      if (actionId != null) 'ActionId': actionId,
      if (actionType != null) 'ActionType': actionType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (windowStartTime != null)
        'WindowStartTime': iso8601ToJson(windowStartTime),
    };
  }
}

/// The record of a completed or failed managed action.
class ManagedActionHistoryItem {
  /// A description of the managed action.
  final String? actionDescription;

  /// A unique identifier for the managed action.
  final String? actionId;

  /// The type of the managed action.
  final ActionType? actionType;

  /// The date and time that the action started executing.
  final DateTime? executedTime;

  /// If the action failed, a description of the failure.
  final String? failureDescription;

  /// If the action failed, the type of failure.
  final FailureType? failureType;

  /// The date and time that the action finished executing.
  final DateTime? finishedTime;

  /// The status of the action.
  final ActionHistoryStatus? status;

  ManagedActionHistoryItem({
    this.actionDescription,
    this.actionId,
    this.actionType,
    this.executedTime,
    this.failureDescription,
    this.failureType,
    this.finishedTime,
    this.status,
  });
  factory ManagedActionHistoryItem.fromXml(_s.XmlElement elem) {
    return ManagedActionHistoryItem(
      actionDescription: _s.extractXmlStringValue(elem, 'ActionDescription'),
      actionId: _s.extractXmlStringValue(elem, 'ActionId'),
      actionType: _s.extractXmlStringValue(elem, 'ActionType')?.toActionType(),
      executedTime: _s.extractXmlDateTimeValue(elem, 'ExecutedTime'),
      failureDescription: _s.extractXmlStringValue(elem, 'FailureDescription'),
      failureType:
          _s.extractXmlStringValue(elem, 'FailureType')?.toFailureType(),
      finishedTime: _s.extractXmlDateTimeValue(elem, 'FinishedTime'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toActionHistoryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionDescription = this.actionDescription;
    final actionId = this.actionId;
    final actionType = this.actionType;
    final executedTime = this.executedTime;
    final failureDescription = this.failureDescription;
    final failureType = this.failureType;
    final finishedTime = this.finishedTime;
    final status = this.status;
    return {
      if (actionDescription != null) 'ActionDescription': actionDescription,
      if (actionId != null) 'ActionId': actionId,
      if (actionType != null) 'ActionType': actionType.toValue(),
      if (executedTime != null) 'ExecutedTime': iso8601ToJson(executedTime),
      if (failureDescription != null) 'FailureDescription': failureDescription,
      if (failureType != null) 'FailureType': failureType.toValue(),
      if (finishedTime != null) 'FinishedTime': iso8601ToJson(finishedTime),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A lifecycle rule that deletes application versions after the specified
/// number of days.
class MaxAgeRule {
  /// Specify <code>true</code> to apply the rule, or <code>false</code> to
  /// disable it.
  final bool enabled;

  /// Set to <code>true</code> to delete a version's source bundle from Amazon S3
  /// when Elastic Beanstalk deletes the application version.
  final bool? deleteSourceFromS3;

  /// Specify the number of days to retain an application versions.
  final int? maxAgeInDays;

  MaxAgeRule({
    required this.enabled,
    this.deleteSourceFromS3,
    this.maxAgeInDays,
  });
  factory MaxAgeRule.fromXml(_s.XmlElement elem) {
    return MaxAgeRule(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      deleteSourceFromS3: _s.extractXmlBoolValue(elem, 'DeleteSourceFromS3'),
      maxAgeInDays: _s.extractXmlIntValue(elem, 'MaxAgeInDays'),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final deleteSourceFromS3 = this.deleteSourceFromS3;
    final maxAgeInDays = this.maxAgeInDays;
    return {
      'Enabled': enabled,
      if (deleteSourceFromS3 != null) 'DeleteSourceFromS3': deleteSourceFromS3,
      if (maxAgeInDays != null) 'MaxAgeInDays': maxAgeInDays,
    };
  }
}

/// A lifecycle rule that deletes the oldest application version when the
/// maximum count is exceeded.
class MaxCountRule {
  /// Specify <code>true</code> to apply the rule, or <code>false</code> to
  /// disable it.
  final bool enabled;

  /// Set to <code>true</code> to delete a version's source bundle from Amazon S3
  /// when Elastic Beanstalk deletes the application version.
  final bool? deleteSourceFromS3;

  /// Specify the maximum number of application versions to retain.
  final int? maxCount;

  MaxCountRule({
    required this.enabled,
    this.deleteSourceFromS3,
    this.maxCount,
  });
  factory MaxCountRule.fromXml(_s.XmlElement elem) {
    return MaxCountRule(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      deleteSourceFromS3: _s.extractXmlBoolValue(elem, 'DeleteSourceFromS3'),
      maxCount: _s.extractXmlIntValue(elem, 'MaxCount'),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final deleteSourceFromS3 = this.deleteSourceFromS3;
    final maxCount = this.maxCount;
    return {
      'Enabled': enabled,
      if (deleteSourceFromS3 != null) 'DeleteSourceFromS3': deleteSourceFromS3,
      if (maxCount != null) 'MaxCount': maxCount,
    };
  }
}

/// A regular expression representing a restriction on a string configuration
/// option value.
class OptionRestrictionRegex {
  /// A unique name representing this regular expression.
  final String? label;

  /// The regular expression pattern that a string configuration option value with
  /// this restriction must match.
  final String? pattern;

  OptionRestrictionRegex({
    this.label,
    this.pattern,
  });
  factory OptionRestrictionRegex.fromXml(_s.XmlElement elem) {
    return OptionRestrictionRegex(
      label: _s.extractXmlStringValue(elem, 'Label'),
      pattern: _s.extractXmlStringValue(elem, 'Pattern'),
    );
  }

  Map<String, dynamic> toJson() {
    final label = this.label;
    final pattern = this.pattern;
    return {
      if (label != null) 'Label': label,
      if (pattern != null) 'Pattern': pattern,
    };
  }
}

/// A specification identifying an individual configuration option.
class OptionSpecification {
  /// A unique namespace identifying the option's associated AWS resource.
  final String? namespace;

  /// The name of the configuration option.
  final String? optionName;

  /// A unique resource name for a time-based scaling configuration option.
  final String? resourceName;

  OptionSpecification({
    this.namespace,
    this.optionName,
    this.resourceName,
  });

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final optionName = this.optionName;
    final resourceName = this.resourceName;
    return {
      if (namespace != null) 'Namespace': namespace,
      if (optionName != null) 'OptionName': optionName,
      if (resourceName != null) 'ResourceName': resourceName,
    };
  }
}

/// Summary information about a platform branch.
class PlatformBranchSummary {
  /// The name of the platform branch.
  final String? branchName;

  /// An ordinal number that designates the order in which platform branches have
  /// been added to a platform. This can be helpful, for example, if your code
  /// calls the <code>ListPlatformBranches</code> action and then displays a list
  /// of platform branches.
  ///
  /// A larger <code>BranchOrder</code> value designates a newer platform branch
  /// within the platform.
  final int? branchOrder;

  /// The support life cycle state of the platform branch.
  ///
  /// Possible values: <code>beta</code> | <code>supported</code> |
  /// <code>deprecated</code> | <code>retired</code>
  final String? lifecycleState;

  /// The name of the platform to which this platform branch belongs.
  final String? platformName;

  /// The environment tiers that platform versions in this branch support.
  ///
  /// Possible values: <code>WebServer/Standard</code> |
  /// <code>Worker/SQS/HTTP</code>
  final List<String>? supportedTierList;

  PlatformBranchSummary({
    this.branchName,
    this.branchOrder,
    this.lifecycleState,
    this.platformName,
    this.supportedTierList,
  });
  factory PlatformBranchSummary.fromXml(_s.XmlElement elem) {
    return PlatformBranchSummary(
      branchName: _s.extractXmlStringValue(elem, 'BranchName'),
      branchOrder: _s.extractXmlIntValue(elem, 'BranchOrder'),
      lifecycleState: _s.extractXmlStringValue(elem, 'LifecycleState'),
      platformName: _s.extractXmlStringValue(elem, 'PlatformName'),
      supportedTierList: _s
          .extractXmlChild(elem, 'SupportedTierList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final branchName = this.branchName;
    final branchOrder = this.branchOrder;
    final lifecycleState = this.lifecycleState;
    final platformName = this.platformName;
    final supportedTierList = this.supportedTierList;
    return {
      if (branchName != null) 'BranchName': branchName,
      if (branchOrder != null) 'BranchOrder': branchOrder,
      if (lifecycleState != null) 'LifecycleState': lifecycleState,
      if (platformName != null) 'PlatformName': platformName,
      if (supportedTierList != null) 'SupportedTierList': supportedTierList,
    };
  }
}

/// Detailed information about a platform version.
class PlatformDescription {
  /// The custom AMIs supported by the platform version.
  final List<CustomAmi>? customAmiList;

  /// The date when the platform version was created.
  final DateTime? dateCreated;

  /// The date when the platform version was last updated.
  final DateTime? dateUpdated;

  /// The description of the platform version.
  final String? description;

  /// The frameworks supported by the platform version.
  final List<PlatformFramework>? frameworks;

  /// Information about the maintainer of the platform version.
  final String? maintainer;

  /// The operating system used by the platform version.
  final String? operatingSystemName;

  /// The version of the operating system used by the platform version.
  final String? operatingSystemVersion;

  /// The ARN of the platform version.
  final String? platformArn;

  /// The state of the platform version's branch in its lifecycle.
  ///
  /// Possible values: <code>Beta</code> | <code>Supported</code> |
  /// <code>Deprecated</code> | <code>Retired</code>
  final String? platformBranchLifecycleState;

  /// The platform branch to which the platform version belongs.
  final String? platformBranchName;

  /// The category of the platform version.
  final String? platformCategory;

  /// The state of the platform version in its lifecycle.
  ///
  /// Possible values: <code>Recommended</code> | <code>null</code>
  ///
  /// If a null value is returned, the platform version isn't the recommended one
  /// for its branch. Each platform branch has a single recommended platform
  /// version, typically the most recent one.
  final String? platformLifecycleState;

  /// The name of the platform version.
  final String? platformName;

  /// The AWS account ID of the person who created the platform version.
  final String? platformOwner;

  /// The status of the platform version.
  final PlatformStatus? platformStatus;

  /// The version of the platform version.
  final String? platformVersion;

  /// The programming languages supported by the platform version.
  final List<PlatformProgrammingLanguage>? programmingLanguages;

  /// The name of the solution stack used by the platform version.
  final String? solutionStackName;

  /// The additions supported by the platform version.
  final List<String>? supportedAddonList;

  /// The tiers supported by the platform version.
  final List<String>? supportedTierList;

  PlatformDescription({
    this.customAmiList,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.frameworks,
    this.maintainer,
    this.operatingSystemName,
    this.operatingSystemVersion,
    this.platformArn,
    this.platformBranchLifecycleState,
    this.platformBranchName,
    this.platformCategory,
    this.platformLifecycleState,
    this.platformName,
    this.platformOwner,
    this.platformStatus,
    this.platformVersion,
    this.programmingLanguages,
    this.solutionStackName,
    this.supportedAddonList,
    this.supportedTierList,
  });
  factory PlatformDescription.fromXml(_s.XmlElement elem) {
    return PlatformDescription(
      customAmiList: _s.extractXmlChild(elem, 'CustomAmiList')?.let((elem) =>
          elem.findElements('member').map(CustomAmi.fromXml).toList()),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      frameworks: _s.extractXmlChild(elem, 'Frameworks')?.let((elem) =>
          elem.findElements('member').map(PlatformFramework.fromXml).toList()),
      maintainer: _s.extractXmlStringValue(elem, 'Maintainer'),
      operatingSystemName:
          _s.extractXmlStringValue(elem, 'OperatingSystemName'),
      operatingSystemVersion:
          _s.extractXmlStringValue(elem, 'OperatingSystemVersion'),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      platformBranchLifecycleState:
          _s.extractXmlStringValue(elem, 'PlatformBranchLifecycleState'),
      platformBranchName: _s.extractXmlStringValue(elem, 'PlatformBranchName'),
      platformCategory: _s.extractXmlStringValue(elem, 'PlatformCategory'),
      platformLifecycleState:
          _s.extractXmlStringValue(elem, 'PlatformLifecycleState'),
      platformName: _s.extractXmlStringValue(elem, 'PlatformName'),
      platformOwner: _s.extractXmlStringValue(elem, 'PlatformOwner'),
      platformStatus:
          _s.extractXmlStringValue(elem, 'PlatformStatus')?.toPlatformStatus(),
      platformVersion: _s.extractXmlStringValue(elem, 'PlatformVersion'),
      programmingLanguages: _s
          .extractXmlChild(elem, 'ProgrammingLanguages')
          ?.let((elem) => elem
              .findElements('member')
              .map(PlatformProgrammingLanguage.fromXml)
              .toList()),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
      supportedAddonList: _s
          .extractXmlChild(elem, 'SupportedAddonList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      supportedTierList: _s
          .extractXmlChild(elem, 'SupportedTierList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final customAmiList = this.customAmiList;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final frameworks = this.frameworks;
    final maintainer = this.maintainer;
    final operatingSystemName = this.operatingSystemName;
    final operatingSystemVersion = this.operatingSystemVersion;
    final platformArn = this.platformArn;
    final platformBranchLifecycleState = this.platformBranchLifecycleState;
    final platformBranchName = this.platformBranchName;
    final platformCategory = this.platformCategory;
    final platformLifecycleState = this.platformLifecycleState;
    final platformName = this.platformName;
    final platformOwner = this.platformOwner;
    final platformStatus = this.platformStatus;
    final platformVersion = this.platformVersion;
    final programmingLanguages = this.programmingLanguages;
    final solutionStackName = this.solutionStackName;
    final supportedAddonList = this.supportedAddonList;
    final supportedTierList = this.supportedTierList;
    return {
      if (customAmiList != null) 'CustomAmiList': customAmiList,
      if (dateCreated != null) 'DateCreated': iso8601ToJson(dateCreated),
      if (dateUpdated != null) 'DateUpdated': iso8601ToJson(dateUpdated),
      if (description != null) 'Description': description,
      if (frameworks != null) 'Frameworks': frameworks,
      if (maintainer != null) 'Maintainer': maintainer,
      if (operatingSystemName != null)
        'OperatingSystemName': operatingSystemName,
      if (operatingSystemVersion != null)
        'OperatingSystemVersion': operatingSystemVersion,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (platformBranchLifecycleState != null)
        'PlatformBranchLifecycleState': platformBranchLifecycleState,
      if (platformBranchName != null) 'PlatformBranchName': platformBranchName,
      if (platformCategory != null) 'PlatformCategory': platformCategory,
      if (platformLifecycleState != null)
        'PlatformLifecycleState': platformLifecycleState,
      if (platformName != null) 'PlatformName': platformName,
      if (platformOwner != null) 'PlatformOwner': platformOwner,
      if (platformStatus != null) 'PlatformStatus': platformStatus.toValue(),
      if (platformVersion != null) 'PlatformVersion': platformVersion,
      if (programmingLanguages != null)
        'ProgrammingLanguages': programmingLanguages,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
      if (supportedAddonList != null) 'SupportedAddonList': supportedAddonList,
      if (supportedTierList != null) 'SupportedTierList': supportedTierList,
    };
  }
}

/// Describes criteria to restrict the results when listing platform versions.
///
/// The filter is evaluated as follows: <code>Type Operator Values[1]</code>
class PlatformFilter {
  /// The operator to apply to the <code>Type</code> with each of the
  /// <code>Values</code>.
  ///
  /// Valid values: <code>=</code> | <code>!=</code> | <code>&lt;</code> |
  /// <code>&lt;=</code> | <code>&gt;</code> | <code>&gt;=</code> |
  /// <code>contains</code> | <code>begins_with</code> | <code>ends_with</code>
  final String? operator;

  /// The platform version attribute to which the filter values are applied.
  ///
  /// Valid values: <code>PlatformName</code> | <code>PlatformVersion</code> |
  /// <code>PlatformStatus</code> | <code>PlatformBranchName</code> |
  /// <code>PlatformLifecycleState</code> | <code>PlatformOwner</code> |
  /// <code>SupportedTier</code> | <code>SupportedAddon</code> |
  /// <code>ProgrammingLanguageName</code> | <code>OperatingSystemName</code>
  final String? type;

  /// The list of values applied to the filtering platform version attribute. Only
  /// one value is supported for all current operators.
  ///
  /// The following list shows valid filter values for some filter attributes.
  ///
  /// <ul>
  /// <li>
  /// <code>PlatformStatus</code>: <code>Creating</code> | <code>Failed</code> |
  /// <code>Ready</code> | <code>Deleting</code> | <code>Deleted</code>
  /// </li>
  /// <li>
  /// <code>PlatformLifecycleState</code>: <code>recommended</code>
  /// </li>
  /// <li>
  /// <code>SupportedTier</code>: <code>WebServer/Standard</code> |
  /// <code>Worker/SQS/HTTP</code>
  /// </li>
  /// <li>
  /// <code>SupportedAddon</code>: <code>Log/S3</code> |
  /// <code>Monitoring/Healthd</code> | <code>WorkerDaemon/SQSD</code>
  /// </li>
  /// </ul>
  final List<String>? values;

  PlatformFilter({
    this.operator,
    this.type,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final operator = this.operator;
    final type = this.type;
    final values = this.values;
    return {
      if (operator != null) 'Operator': operator,
      if (type != null) 'Type': type,
      if (values != null) 'Values': values,
    };
  }
}

/// A framework supported by the platform.
class PlatformFramework {
  /// The name of the framework.
  final String? name;

  /// The version of the framework.
  final String? version;

  PlatformFramework({
    this.name,
    this.version,
  });
  factory PlatformFramework.fromXml(_s.XmlElement elem) {
    return PlatformFramework(
      name: _s.extractXmlStringValue(elem, 'Name'),
      version: _s.extractXmlStringValue(elem, 'Version'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

/// A programming language supported by the platform.
class PlatformProgrammingLanguage {
  /// The name of the programming language.
  final String? name;

  /// The version of the programming language.
  final String? version;

  PlatformProgrammingLanguage({
    this.name,
    this.version,
  });
  factory PlatformProgrammingLanguage.fromXml(_s.XmlElement elem) {
    return PlatformProgrammingLanguage(
      name: _s.extractXmlStringValue(elem, 'Name'),
      version: _s.extractXmlStringValue(elem, 'Version'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

enum PlatformStatus {
  creating,
  failed,
  ready,
  deleting,
  deleted,
}

extension PlatformStatusValueExtension on PlatformStatus {
  String toValue() {
    switch (this) {
      case PlatformStatus.creating:
        return 'Creating';
      case PlatformStatus.failed:
        return 'Failed';
      case PlatformStatus.ready:
        return 'Ready';
      case PlatformStatus.deleting:
        return 'Deleting';
      case PlatformStatus.deleted:
        return 'Deleted';
    }
  }
}

extension PlatformStatusFromString on String {
  PlatformStatus toPlatformStatus() {
    switch (this) {
      case 'Creating':
        return PlatformStatus.creating;
      case 'Failed':
        return PlatformStatus.failed;
      case 'Ready':
        return PlatformStatus.ready;
      case 'Deleting':
        return PlatformStatus.deleting;
      case 'Deleted':
        return PlatformStatus.deleted;
    }
    throw Exception('$this is not known in enum PlatformStatus');
  }
}

/// Summary information about a platform version.
class PlatformSummary {
  /// The operating system used by the platform version.
  final String? operatingSystemName;

  /// The version of the operating system used by the platform version.
  final String? operatingSystemVersion;

  /// The ARN of the platform version.
  final String? platformArn;

  /// The state of the platform version's branch in its lifecycle.
  ///
  /// Possible values: <code>beta</code> | <code>supported</code> |
  /// <code>deprecated</code> | <code>retired</code>
  final String? platformBranchLifecycleState;

  /// The platform branch to which the platform version belongs.
  final String? platformBranchName;

  /// The category of platform version.
  final String? platformCategory;

  /// The state of the platform version in its lifecycle.
  ///
  /// Possible values: <code>recommended</code> | empty
  ///
  /// If an empty value is returned, the platform version is supported but isn't
  /// the recommended one for its branch.
  final String? platformLifecycleState;

  /// The AWS account ID of the person who created the platform version.
  final String? platformOwner;

  /// The status of the platform version. You can create an environment from the
  /// platform version once it is ready.
  final PlatformStatus? platformStatus;

  /// The version string of the platform version.
  final String? platformVersion;

  /// The additions associated with the platform version.
  final List<String>? supportedAddonList;

  /// The tiers in which the platform version runs.
  final List<String>? supportedTierList;

  PlatformSummary({
    this.operatingSystemName,
    this.operatingSystemVersion,
    this.platformArn,
    this.platformBranchLifecycleState,
    this.platformBranchName,
    this.platformCategory,
    this.platformLifecycleState,
    this.platformOwner,
    this.platformStatus,
    this.platformVersion,
    this.supportedAddonList,
    this.supportedTierList,
  });
  factory PlatformSummary.fromXml(_s.XmlElement elem) {
    return PlatformSummary(
      operatingSystemName:
          _s.extractXmlStringValue(elem, 'OperatingSystemName'),
      operatingSystemVersion:
          _s.extractXmlStringValue(elem, 'OperatingSystemVersion'),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      platformBranchLifecycleState:
          _s.extractXmlStringValue(elem, 'PlatformBranchLifecycleState'),
      platformBranchName: _s.extractXmlStringValue(elem, 'PlatformBranchName'),
      platformCategory: _s.extractXmlStringValue(elem, 'PlatformCategory'),
      platformLifecycleState:
          _s.extractXmlStringValue(elem, 'PlatformLifecycleState'),
      platformOwner: _s.extractXmlStringValue(elem, 'PlatformOwner'),
      platformStatus:
          _s.extractXmlStringValue(elem, 'PlatformStatus')?.toPlatformStatus(),
      platformVersion: _s.extractXmlStringValue(elem, 'PlatformVersion'),
      supportedAddonList: _s
          .extractXmlChild(elem, 'SupportedAddonList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      supportedTierList: _s
          .extractXmlChild(elem, 'SupportedTierList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final operatingSystemName = this.operatingSystemName;
    final operatingSystemVersion = this.operatingSystemVersion;
    final platformArn = this.platformArn;
    final platformBranchLifecycleState = this.platformBranchLifecycleState;
    final platformBranchName = this.platformBranchName;
    final platformCategory = this.platformCategory;
    final platformLifecycleState = this.platformLifecycleState;
    final platformOwner = this.platformOwner;
    final platformStatus = this.platformStatus;
    final platformVersion = this.platformVersion;
    final supportedAddonList = this.supportedAddonList;
    final supportedTierList = this.supportedTierList;
    return {
      if (operatingSystemName != null)
        'OperatingSystemName': operatingSystemName,
      if (operatingSystemVersion != null)
        'OperatingSystemVersion': operatingSystemVersion,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (platformBranchLifecycleState != null)
        'PlatformBranchLifecycleState': platformBranchLifecycleState,
      if (platformBranchName != null) 'PlatformBranchName': platformBranchName,
      if (platformCategory != null) 'PlatformCategory': platformCategory,
      if (platformLifecycleState != null)
        'PlatformLifecycleState': platformLifecycleState,
      if (platformOwner != null) 'PlatformOwner': platformOwner,
      if (platformStatus != null) 'PlatformStatus': platformStatus.toValue(),
      if (platformVersion != null) 'PlatformVersion': platformVersion,
      if (supportedAddonList != null) 'SupportedAddonList': supportedAddonList,
      if (supportedTierList != null) 'SupportedTierList': supportedTierList,
    };
  }
}

/// Describes a queue.
class Queue {
  /// The name of the queue.
  final String? name;

  /// The URL of the queue.
  final String? url;

  Queue({
    this.name,
    this.url,
  });
  factory Queue.fromXml(_s.XmlElement elem) {
    return Queue(
      name: _s.extractXmlStringValue(elem, 'Name'),
      url: _s.extractXmlStringValue(elem, 'URL'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final url = this.url;
    return {
      if (name != null) 'Name': name,
      if (url != null) 'URL': url,
    };
  }
}

/// The AWS Elastic Beanstalk quota information for a single resource type in an
/// AWS account. It reflects the resource's limits for this account.
class ResourceQuota {
  /// The maximum number of instances of this Elastic Beanstalk resource type that
  /// an AWS account can use.
  final int? maximum;

  ResourceQuota({
    this.maximum,
  });
  factory ResourceQuota.fromXml(_s.XmlElement elem) {
    return ResourceQuota(
      maximum: _s.extractXmlIntValue(elem, 'Maximum'),
    );
  }

  Map<String, dynamic> toJson() {
    final maximum = this.maximum;
    return {
      if (maximum != null) 'Maximum': maximum,
    };
  }
}

/// A set of per-resource AWS Elastic Beanstalk quotas associated with an AWS
/// account. They reflect Elastic Beanstalk resource limits for this account.
class ResourceQuotas {
  /// The quota for applications in the AWS account.
  final ResourceQuota? applicationQuota;

  /// The quota for application versions in the AWS account.
  final ResourceQuota? applicationVersionQuota;

  /// The quota for configuration templates in the AWS account.
  final ResourceQuota? configurationTemplateQuota;

  /// The quota for custom platforms in the AWS account.
  final ResourceQuota? customPlatformQuota;

  /// The quota for environments in the AWS account.
  final ResourceQuota? environmentQuota;

  ResourceQuotas({
    this.applicationQuota,
    this.applicationVersionQuota,
    this.configurationTemplateQuota,
    this.customPlatformQuota,
    this.environmentQuota,
  });
  factory ResourceQuotas.fromXml(_s.XmlElement elem) {
    return ResourceQuotas(
      applicationQuota: _s
          .extractXmlChild(elem, 'ApplicationQuota')
          ?.let(ResourceQuota.fromXml),
      applicationVersionQuota: _s
          .extractXmlChild(elem, 'ApplicationVersionQuota')
          ?.let(ResourceQuota.fromXml),
      configurationTemplateQuota: _s
          .extractXmlChild(elem, 'ConfigurationTemplateQuota')
          ?.let(ResourceQuota.fromXml),
      customPlatformQuota: _s
          .extractXmlChild(elem, 'CustomPlatformQuota')
          ?.let(ResourceQuota.fromXml),
      environmentQuota: _s
          .extractXmlChild(elem, 'EnvironmentQuota')
          ?.let(ResourceQuota.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationQuota = this.applicationQuota;
    final applicationVersionQuota = this.applicationVersionQuota;
    final configurationTemplateQuota = this.configurationTemplateQuota;
    final customPlatformQuota = this.customPlatformQuota;
    final environmentQuota = this.environmentQuota;
    return {
      if (applicationQuota != null) 'ApplicationQuota': applicationQuota,
      if (applicationVersionQuota != null)
        'ApplicationVersionQuota': applicationVersionQuota,
      if (configurationTemplateQuota != null)
        'ConfigurationTemplateQuota': configurationTemplateQuota,
      if (customPlatformQuota != null)
        'CustomPlatformQuota': customPlatformQuota,
      if (environmentQuota != null) 'EnvironmentQuota': environmentQuota,
    };
  }
}

class ResourceTagsDescriptionMessage {
  /// The Amazon Resource Name (ARN) of the resource for which a tag list was
  /// requested.
  final String? resourceArn;

  /// A list of tag key-value pairs.
  final List<Tag>? resourceTags;

  ResourceTagsDescriptionMessage({
    this.resourceArn,
    this.resourceTags,
  });
  factory ResourceTagsDescriptionMessage.fromXml(_s.XmlElement elem) {
    return ResourceTagsDescriptionMessage(
      resourceArn: _s.extractXmlStringValue(elem, 'ResourceArn'),
      resourceTags: _s.extractXmlChild(elem, 'ResourceTags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final resourceTags = this.resourceTags;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceTags != null) 'ResourceTags': resourceTags,
    };
  }
}

/// Result message containing a description of the requested environment info.
class RetrieveEnvironmentInfoResultMessage {
  /// The <a>EnvironmentInfoDescription</a> of the environment.
  final List<EnvironmentInfoDescription>? environmentInfo;

  RetrieveEnvironmentInfoResultMessage({
    this.environmentInfo,
  });
  factory RetrieveEnvironmentInfoResultMessage.fromXml(_s.XmlElement elem) {
    return RetrieveEnvironmentInfoResultMessage(
      environmentInfo: _s.extractXmlChild(elem, 'EnvironmentInfo')?.let(
          (elem) => elem
              .findElements('member')
              .map(EnvironmentInfoDescription.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentInfo = this.environmentInfo;
    return {
      if (environmentInfo != null) 'EnvironmentInfo': environmentInfo,
    };
  }
}

/// The bucket and key of an item stored in Amazon S3.
class S3Location {
  /// The Amazon S3 bucket where the data is located.
  final String? s3Bucket;

  /// The Amazon S3 key where the data is located.
  final String? s3Key;

  S3Location({
    this.s3Bucket,
    this.s3Key,
  });
  factory S3Location.fromXml(_s.XmlElement elem) {
    return S3Location(
      s3Bucket: _s.extractXmlStringValue(elem, 'S3Bucket'),
      s3Key: _s.extractXmlStringValue(elem, 'S3Key'),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    return {
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
    };
  }
}

/// Describes criteria to restrict a list of results.
///
/// For operators that apply a single value to the attribute, the filter is
/// evaluated as follows: <code>Attribute Operator Values[1]</code>
///
/// Some operators, e.g. <code>in</code>, can apply multiple values. In this
/// case, the filter is evaluated as a logical union (OR) of applications of the
/// operator to the attribute with each one of the values: <code>(Attribute
/// Operator Values[1]) OR (Attribute Operator Values[2]) OR ...</code>
///
/// The valid values for attributes of <code>SearchFilter</code> depend on the
/// API action. For valid values, see the reference page for the API action
/// you're calling that takes a <code>SearchFilter</code> parameter.
class SearchFilter {
  /// The result attribute to which the filter values are applied. Valid values
  /// vary by API action.
  final String? attribute;

  /// The operator to apply to the <code>Attribute</code> with each of the
  /// <code>Values</code>. Valid values vary by <code>Attribute</code>.
  final String? operator;

  /// The list of values applied to the <code>Attribute</code> and
  /// <code>Operator</code> attributes. Number of values and valid values vary by
  /// <code>Attribute</code>.
  final List<String>? values;

  SearchFilter({
    this.attribute,
    this.operator,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final operator = this.operator;
    final values = this.values;
    return {
      if (attribute != null) 'Attribute': attribute,
      if (operator != null) 'Operator': operator,
      if (values != null) 'Values': values,
    };
  }
}

/// Detailed health information about an Amazon EC2 instance in your Elastic
/// Beanstalk environment.
class SingleInstanceHealth {
  /// Request metrics from your application.
  final ApplicationMetrics? applicationMetrics;

  /// The availability zone in which the instance runs.
  final String? availabilityZone;

  /// Represents the causes, which provide more information about the current
  /// health status.
  final List<String>? causes;

  /// Represents the color indicator that gives you information about the health
  /// of the EC2 instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health
  /// Colors and Statuses</a>.
  final String? color;

  /// Information about the most recent deployment to an instance.
  final Deployment? deployment;

  /// Returns the health status of the specified instance. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health
  /// Colors and Statuses</a>.
  final String? healthStatus;

  /// The ID of the Amazon EC2 instance.
  final String? instanceId;

  /// The instance's type.
  final String? instanceType;

  /// The time at which the EC2 instance was launched.
  final DateTime? launchedAt;

  /// Operating system metrics from the instance.
  final SystemStatus? system;

  SingleInstanceHealth({
    this.applicationMetrics,
    this.availabilityZone,
    this.causes,
    this.color,
    this.deployment,
    this.healthStatus,
    this.instanceId,
    this.instanceType,
    this.launchedAt,
    this.system,
  });
  factory SingleInstanceHealth.fromXml(_s.XmlElement elem) {
    return SingleInstanceHealth(
      applicationMetrics: _s
          .extractXmlChild(elem, 'ApplicationMetrics')
          ?.let(ApplicationMetrics.fromXml),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      causes: _s
          .extractXmlChild(elem, 'Causes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      color: _s.extractXmlStringValue(elem, 'Color'),
      deployment:
          _s.extractXmlChild(elem, 'Deployment')?.let(Deployment.fromXml),
      healthStatus: _s.extractXmlStringValue(elem, 'HealthStatus'),
      instanceId: _s.extractXmlStringValue(elem, 'InstanceId'),
      instanceType: _s.extractXmlStringValue(elem, 'InstanceType'),
      launchedAt: _s.extractXmlDateTimeValue(elem, 'LaunchedAt'),
      system: _s.extractXmlChild(elem, 'System')?.let(SystemStatus.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationMetrics = this.applicationMetrics;
    final availabilityZone = this.availabilityZone;
    final causes = this.causes;
    final color = this.color;
    final deployment = this.deployment;
    final healthStatus = this.healthStatus;
    final instanceId = this.instanceId;
    final instanceType = this.instanceType;
    final launchedAt = this.launchedAt;
    final system = this.system;
    return {
      if (applicationMetrics != null) 'ApplicationMetrics': applicationMetrics,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (causes != null) 'Causes': causes,
      if (color != null) 'Color': color,
      if (deployment != null) 'Deployment': deployment,
      if (healthStatus != null) 'HealthStatus': healthStatus,
      if (instanceId != null) 'InstanceId': instanceId,
      if (instanceType != null) 'InstanceType': instanceType,
      if (launchedAt != null) 'LaunchedAt': iso8601ToJson(launchedAt),
      if (system != null) 'System': system,
    };
  }
}

/// Describes the solution stack.
class SolutionStackDescription {
  /// The permitted file types allowed for a solution stack.
  final List<String>? permittedFileTypes;

  /// The name of the solution stack.
  final String? solutionStackName;

  SolutionStackDescription({
    this.permittedFileTypes,
    this.solutionStackName,
  });
  factory SolutionStackDescription.fromXml(_s.XmlElement elem) {
    return SolutionStackDescription(
      permittedFileTypes: _s
          .extractXmlChild(elem, 'PermittedFileTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
    );
  }

  Map<String, dynamic> toJson() {
    final permittedFileTypes = this.permittedFileTypes;
    final solutionStackName = this.solutionStackName;
    return {
      if (permittedFileTypes != null) 'PermittedFileTypes': permittedFileTypes,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
    };
  }
}

/// Location of the source code for an application version.
class SourceBuildInformation {
  /// The location of the source code, as a formatted string, depending on the
  /// value of <code>SourceRepository</code>
  ///
  /// <ul>
  /// <li>
  /// For <code>CodeCommit</code>, the format is the repository name and commit
  /// ID, separated by a forward slash. For example,
  /// <code>my-git-repo/265cfa0cf6af46153527f55d6503ec030551f57a</code>.
  /// </li>
  /// <li>
  /// For <code>S3</code>, the format is the S3 bucket name and object key,
  /// separated by a forward slash. For example,
  /// <code>my-s3-bucket/Folders/my-source-file</code>.
  /// </li>
  /// </ul>
  final String sourceLocation;

  /// Location where the repository is stored.
  ///
  /// <ul>
  /// <li>
  /// <code>CodeCommit</code>
  /// </li>
  /// <li>
  /// <code>S3</code>
  /// </li>
  /// </ul>
  final SourceRepository sourceRepository;

  /// The type of repository.
  ///
  /// <ul>
  /// <li>
  /// <code>Git</code>
  /// </li>
  /// <li>
  /// <code>Zip</code>
  /// </li>
  /// </ul>
  final SourceType sourceType;

  SourceBuildInformation({
    required this.sourceLocation,
    required this.sourceRepository,
    required this.sourceType,
  });
  factory SourceBuildInformation.fromXml(_s.XmlElement elem) {
    return SourceBuildInformation(
      sourceLocation: _s.extractXmlStringValue(elem, 'SourceLocation')!,
      sourceRepository: _s
          .extractXmlStringValue(elem, 'SourceRepository')!
          .toSourceRepository(),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType')!.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceLocation = this.sourceLocation;
    final sourceRepository = this.sourceRepository;
    final sourceType = this.sourceType;
    return {
      'SourceLocation': sourceLocation,
      'SourceRepository': sourceRepository.toValue(),
      'SourceType': sourceType.toValue(),
    };
  }
}

/// A specification for an environment configuration.
class SourceConfiguration {
  /// The name of the application associated with the configuration.
  final String? applicationName;

  /// The name of the configuration template.
  final String? templateName;

  SourceConfiguration({
    this.applicationName,
    this.templateName,
  });

  Map<String, dynamic> toJson() {
    final applicationName = this.applicationName;
    final templateName = this.templateName;
    return {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (templateName != null) 'TemplateName': templateName,
    };
  }
}

enum SourceRepository {
  codeCommit,
  s3,
}

extension SourceRepositoryValueExtension on SourceRepository {
  String toValue() {
    switch (this) {
      case SourceRepository.codeCommit:
        return 'CodeCommit';
      case SourceRepository.s3:
        return 'S3';
    }
  }
}

extension SourceRepositoryFromString on String {
  SourceRepository toSourceRepository() {
    switch (this) {
      case 'CodeCommit':
        return SourceRepository.codeCommit;
      case 'S3':
        return SourceRepository.s3;
    }
    throw Exception('$this is not known in enum SourceRepository');
  }
}

enum SourceType {
  git,
  zip,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.git:
        return 'Git';
      case SourceType.zip:
        return 'Zip';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'Git':
        return SourceType.git;
      case 'Zip':
        return SourceType.zip;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

/// Represents the percentage of requests over the last 10 seconds that resulted
/// in each type of status code response. For more information, see <a
/// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html">Status Code
/// Definitions</a>.
class StatusCodes {
  /// The percentage of requests over the last 10 seconds that resulted in a 2xx
  /// (200, 201, etc.) status code.
  final int? status2xx;

  /// The percentage of requests over the last 10 seconds that resulted in a 3xx
  /// (300, 301, etc.) status code.
  final int? status3xx;

  /// The percentage of requests over the last 10 seconds that resulted in a 4xx
  /// (400, 401, etc.) status code.
  final int? status4xx;

  /// The percentage of requests over the last 10 seconds that resulted in a 5xx
  /// (500, 501, etc.) status code.
  final int? status5xx;

  StatusCodes({
    this.status2xx,
    this.status3xx,
    this.status4xx,
    this.status5xx,
  });
  factory StatusCodes.fromXml(_s.XmlElement elem) {
    return StatusCodes(
      status2xx: _s.extractXmlIntValue(elem, 'Status2xx'),
      status3xx: _s.extractXmlIntValue(elem, 'Status3xx'),
      status4xx: _s.extractXmlIntValue(elem, 'Status4xx'),
      status5xx: _s.extractXmlIntValue(elem, 'Status5xx'),
    );
  }

  Map<String, dynamic> toJson() {
    final status2xx = this.status2xx;
    final status3xx = this.status3xx;
    final status4xx = this.status4xx;
    final status5xx = this.status5xx;
    return {
      if (status2xx != null) 'Status2xx': status2xx,
      if (status3xx != null) 'Status3xx': status3xx,
      if (status4xx != null) 'Status4xx': status4xx,
      if (status5xx != null) 'Status5xx': status5xx,
    };
  }
}

/// CPU utilization and load average metrics for an Amazon EC2 instance.
class SystemStatus {
  /// CPU utilization metrics for the instance.
  final CPUUtilization? cPUUtilization;

  /// Load average in the last 1-minute, 5-minute, and 15-minute periods. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-metrics.html#health-enhanced-metrics-os">Operating
  /// System Metrics</a>.
  final List<double>? loadAverage;

  SystemStatus({
    this.cPUUtilization,
    this.loadAverage,
  });
  factory SystemStatus.fromXml(_s.XmlElement elem) {
    return SystemStatus(
      cPUUtilization: _s
          .extractXmlChild(elem, 'CPUUtilization')
          ?.let(CPUUtilization.fromXml),
      loadAverage: _s
          .extractXmlChild(elem, 'LoadAverage')
          ?.let((elem) => _s.extractXmlDoubleListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final cPUUtilization = this.cPUUtilization;
    final loadAverage = this.loadAverage;
    return {
      if (cPUUtilization != null) 'CPUUtilization': cPUUtilization,
      if (loadAverage != null) 'LoadAverage': loadAverage,
    };
  }
}

/// Describes a tag applied to a resource in an environment.
class Tag {
  /// The key of the tag.
  final String? key;

  /// The value of the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// Describes a trigger.
class Trigger {
  /// The name of the trigger.
  final String? name;

  Trigger({
    this.name,
  });
  factory Trigger.fromXml(_s.XmlElement elem) {
    return Trigger(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// An error or warning for a desired configuration option value.
class ValidationMessage {
  /// A message describing the error or warning.
  final String? message;

  /// The namespace to which the option belongs.
  final String? namespace;

  /// The name of the option.
  final String? optionName;

  /// An indication of the severity of this message:
  ///
  /// <ul>
  /// <li>
  /// <code>error</code>: This message indicates that this is not a valid setting
  /// for an option.
  /// </li>
  /// <li>
  /// <code>warning</code>: This message is providing information you should take
  /// into account.
  /// </li>
  /// </ul>
  final ValidationSeverity? severity;

  ValidationMessage({
    this.message,
    this.namespace,
    this.optionName,
    this.severity,
  });
  factory ValidationMessage.fromXml(_s.XmlElement elem) {
    return ValidationMessage(
      message: _s.extractXmlStringValue(elem, 'Message'),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      optionName: _s.extractXmlStringValue(elem, 'OptionName'),
      severity:
          _s.extractXmlStringValue(elem, 'Severity')?.toValidationSeverity(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final namespace = this.namespace;
    final optionName = this.optionName;
    final severity = this.severity;
    return {
      if (message != null) 'Message': message,
      if (namespace != null) 'Namespace': namespace,
      if (optionName != null) 'OptionName': optionName,
      if (severity != null) 'Severity': severity.toValue(),
    };
  }
}

enum ValidationSeverity {
  error,
  warning,
}

extension ValidationSeverityValueExtension on ValidationSeverity {
  String toValue() {
    switch (this) {
      case ValidationSeverity.error:
        return 'error';
      case ValidationSeverity.warning:
        return 'warning';
    }
  }
}

extension ValidationSeverityFromString on String {
  ValidationSeverity toValidationSeverity() {
    switch (this) {
      case 'error':
        return ValidationSeverity.error;
      case 'warning':
        return ValidationSeverity.warning;
    }
    throw Exception('$this is not known in enum ValidationSeverity');
  }
}

class CodeBuildNotInServiceRegionException extends _s.GenericAwsException {
  CodeBuildNotInServiceRegionException({String? type, String? message})
      : super(
            type: type,
            code: 'CodeBuildNotInServiceRegionException',
            message: message);
}

class ElasticBeanstalkServiceException extends _s.GenericAwsException {
  ElasticBeanstalkServiceException({String? type, String? message})
      : super(
            type: type,
            code: 'ElasticBeanstalkServiceException',
            message: message);
}

class InsufficientPrivilegesException extends _s.GenericAwsException {
  InsufficientPrivilegesException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientPrivilegesException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ManagedActionInvalidStateException extends _s.GenericAwsException {
  ManagedActionInvalidStateException({String? type, String? message})
      : super(
            type: type,
            code: 'ManagedActionInvalidStateException',
            message: message);
}

class OperationInProgressException extends _s.GenericAwsException {
  OperationInProgressException({String? type, String? message})
      : super(
            type: type, code: 'OperationInProgressException', message: message);
}

class PlatformVersionStillReferencedException extends _s.GenericAwsException {
  PlatformVersionStillReferencedException({String? type, String? message})
      : super(
            type: type,
            code: 'PlatformVersionStillReferencedException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceTypeNotSupportedException extends _s.GenericAwsException {
  ResourceTypeNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceTypeNotSupportedException',
            message: message);
}

class S3LocationNotInServiceRegionException extends _s.GenericAwsException {
  S3LocationNotInServiceRegionException({String? type, String? message})
      : super(
            type: type,
            code: 'S3LocationNotInServiceRegionException',
            message: message);
}

class S3SubscriptionRequiredException extends _s.GenericAwsException {
  S3SubscriptionRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'S3SubscriptionRequiredException',
            message: message);
}

class SourceBundleDeletionException extends _s.GenericAwsException {
  SourceBundleDeletionException({String? type, String? message})
      : super(
            type: type,
            code: 'SourceBundleDeletionException',
            message: message);
}

class TooManyApplicationVersionsException extends _s.GenericAwsException {
  TooManyApplicationVersionsException({String? type, String? message})
      : super(
            type: type,
            code: 'TooManyApplicationVersionsException',
            message: message);
}

class TooManyApplicationsException extends _s.GenericAwsException {
  TooManyApplicationsException({String? type, String? message})
      : super(
            type: type, code: 'TooManyApplicationsException', message: message);
}

class TooManyBucketsException extends _s.GenericAwsException {
  TooManyBucketsException({String? type, String? message})
      : super(type: type, code: 'TooManyBucketsException', message: message);
}

class TooManyConfigurationTemplatesException extends _s.GenericAwsException {
  TooManyConfigurationTemplatesException({String? type, String? message})
      : super(
            type: type,
            code: 'TooManyConfigurationTemplatesException',
            message: message);
}

class TooManyEnvironmentsException extends _s.GenericAwsException {
  TooManyEnvironmentsException({String? type, String? message})
      : super(
            type: type, code: 'TooManyEnvironmentsException', message: message);
}

class TooManyPlatformsException extends _s.GenericAwsException {
  TooManyPlatformsException({String? type, String? message})
      : super(type: type, code: 'TooManyPlatformsException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CodeBuildNotInServiceRegionException': (type, message) =>
      CodeBuildNotInServiceRegionException(type: type, message: message),
  'ElasticBeanstalkServiceException': (type, message) =>
      ElasticBeanstalkServiceException(type: type, message: message),
  'InsufficientPrivilegesException': (type, message) =>
      InsufficientPrivilegesException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ManagedActionInvalidStateException': (type, message) =>
      ManagedActionInvalidStateException(type: type, message: message),
  'OperationInProgressException': (type, message) =>
      OperationInProgressException(type: type, message: message),
  'PlatformVersionStillReferencedException': (type, message) =>
      PlatformVersionStillReferencedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceTypeNotSupportedException': (type, message) =>
      ResourceTypeNotSupportedException(type: type, message: message),
  'S3LocationNotInServiceRegionException': (type, message) =>
      S3LocationNotInServiceRegionException(type: type, message: message),
  'S3SubscriptionRequiredException': (type, message) =>
      S3SubscriptionRequiredException(type: type, message: message),
  'SourceBundleDeletionException': (type, message) =>
      SourceBundleDeletionException(type: type, message: message),
  'TooManyApplicationVersionsException': (type, message) =>
      TooManyApplicationVersionsException(type: type, message: message),
  'TooManyApplicationsException': (type, message) =>
      TooManyApplicationsException(type: type, message: message),
  'TooManyBucketsException': (type, message) =>
      TooManyBucketsException(type: type, message: message),
  'TooManyConfigurationTemplatesException': (type, message) =>
      TooManyConfigurationTemplatesException(type: type, message: message),
  'TooManyEnvironmentsException': (type, message) =>
      TooManyEnvironmentsException(type: type, message: message),
  'TooManyPlatformsException': (type, message) =>
      TooManyPlatformsException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
