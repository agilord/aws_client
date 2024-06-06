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

/// AppConfig feature flags and dynamic configurations help software builders
/// quickly and securely adjust application behavior in production environments
/// without full code deployments. AppConfig speeds up software release
/// frequency, improves application resiliency, and helps you address emergent
/// issues more quickly. With feature flags, you can gradually release new
/// capabilities to users and measure the impact of those changes before fully
/// deploying the new capabilities to all users. With operational flags and
/// dynamic configurations, you can update block lists, allow lists, throttling
/// limits, logging verbosity, and perform other operational tuning to quickly
/// respond to issues in production environments.
/// <note>
/// AppConfig is a capability of Amazon Web Services Systems Manager.
/// </note>
/// Despite the fact that application configuration content can vary greatly
/// from application to application, AppConfig supports the following use cases,
/// which cover a broad spectrum of customer needs:
///
/// <ul>
/// <li>
/// <b>Feature flags and toggles</b> - Safely release new capabilities to your
/// customers in a controlled environment. Instantly roll back changes if you
/// experience a problem.
/// </li>
/// <li>
/// <b>Application tuning</b> - Carefully introduce application changes while
/// testing the impact of those changes with users in production environments.
/// </li>
/// <li>
/// <b>Allow list or block list</b> - Control access to premium features or
/// instantly block specific users without deploying new code.
/// </li>
/// <li>
/// <b>Centralized configuration storage</b> - Keep your configuration data
/// organized and consistent across all of your workloads. You can use AppConfig
/// to deploy configuration data stored in the AppConfig hosted configuration
/// store, Secrets Manager, Systems Manager, Parameter Store, or Amazon S3.
/// </li>
/// </ul>
/// <b>How AppConfig works</b>
///
/// This section provides a high-level description of how AppConfig works and
/// how you get started.
/// <dl> <dt>1. Identify configuration values in code you want to manage in the
/// cloud</dt> <dd>
/// Before you start creating AppConfig artifacts, we recommend you identify
/// configuration data in your code that you want to dynamically manage using
/// AppConfig. Good examples include feature flags or toggles, allow and block
/// lists, logging verbosity, service limits, and throttling rules, to name a
/// few.
///
/// If your configuration data already exists in the cloud, you can take
/// advantage of AppConfig validation, deployment, and extension features to
/// further streamline configuration data management.
/// </dd> <dt>2. Create an application namespace</dt> <dd>
/// To create a namespace, you create an AppConfig artifact called an
/// application. An application is simply an organizational construct like a
/// folder.
/// </dd> <dt>3. Create environments</dt> <dd>
/// For each AppConfig application, you define one or more environments. An
/// environment is a logical grouping of targets, such as applications in a
/// <code>Beta</code> or <code>Production</code> environment, Lambda functions,
/// or containers. You can also define environments for application
/// subcomponents, such as the <code>Web</code>, <code>Mobile</code>, and
/// <code>Back-end</code>.
///
/// You can configure Amazon CloudWatch alarms for each environment. The system
/// monitors alarms during a configuration deployment. If an alarm is triggered,
/// the system rolls back the configuration.
/// </dd> <dt>4. Create a configuration profile</dt> <dd>
/// A configuration profile includes, among other things, a URI that enables
/// AppConfig to locate your configuration data in its stored location and a
/// profile type. AppConfig supports two configuration profile types: feature
/// flags and freeform configurations. Feature flag configuration profiles store
/// their data in the AppConfig hosted configuration store and the URI is simply
/// <code>hosted</code>. For freeform configuration profiles, you can store your
/// data in the AppConfig hosted configuration store or any Amazon Web Services
/// service that integrates with AppConfig, as described in <a
/// href="http://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-free-form-configurations-creating.html">Creating
/// a free form configuration profile</a> in the the <i>AppConfig User
/// Guide</i>.
///
/// A configuration profile can also include optional validators to ensure your
/// configuration data is syntactically and semantically correct. AppConfig
/// performs a check using the validators when you start a deployment. If any
/// errors are detected, the deployment rolls back to the previous configuration
/// data.
/// </dd> <dt>5. Deploy configuration data</dt> <dd>
/// When you create a new deployment, you specify the following:
///
/// <ul>
/// <li>
/// An application ID
/// </li>
/// <li>
/// A configuration profile ID
/// </li>
/// <li>
/// A configuration version
/// </li>
/// <li>
/// An environment ID where you want to deploy the configuration data
/// </li>
/// <li>
/// A deployment strategy ID that defines how fast you want the changes to take
/// effect
/// </li>
/// </ul>
/// When you call the <a
/// href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_StartDeployment.html">StartDeployment</a>
/// API action, AppConfig performs the following tasks:
/// <ol>
/// <li>
/// Retrieves the configuration data from the underlying data store by using the
/// location URI in the configuration profile.
/// </li>
/// <li>
/// Verifies the configuration data is syntactically and semantically correct by
/// using the validators you specified when you created your configuration
/// profile.
/// </li>
/// <li>
/// Caches a copy of the data so it is ready to be retrieved by your
/// application. This cached copy is called the <i>deployed data</i>.
/// </li> </ol> </dd> <dt>6. Retrieve the configuration</dt> <dd>
/// You can configure AppConfig Agent as a local host and have the agent poll
/// AppConfig for configuration updates. The agent calls the <a
/// href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_StartConfigurationSession.html">StartConfigurationSession</a>
/// and <a
/// href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_GetLatestConfiguration.html">GetLatestConfiguration</a>
/// API actions and caches your configuration data locally. To retrieve the
/// data, your application makes an HTTP call to the localhost server. AppConfig
/// Agent supports several use cases, as described in <a
/// href="http://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-retrieving-simplified-methods.html">Simplified
/// retrieval methods</a> in the the <i>AppConfig User Guide</i>.
///
/// If AppConfig Agent isn't supported for your use case, you can configure your
/// application to poll AppConfig for configuration updates by directly calling
/// the <a
/// href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_StartConfigurationSession.html">StartConfigurationSession</a>
/// and <a
/// href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_GetLatestConfiguration.html">GetLatestConfiguration</a>
/// API actions.
/// </dd> </dl>
/// This reference is intended to be used with the <a
/// href="http://docs.aws.amazon.com/appconfig/latest/userguide/what-is-appconfig.html">AppConfig
/// User Guide</a>.
class AppConfig {
  final _s.RestJsonProtocol _protocol;
  AppConfig({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'appconfig',
            signingName: 'appconfig',
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

  /// Creates an application. In AppConfig, an application is simply an
  /// organizational construct like a folder. This organizational construct has
  /// a relationship with some unit of executable code. For example, you could
  /// create an application called MyMobileApp to organize and manage
  /// configuration data for a mobile application installed by your users.
  ///
  /// May throw [BadRequestException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// A name for the application.
  ///
  /// Parameter [description] :
  /// A description of the application.
  ///
  /// Parameter [tags] :
  /// Metadata to assign to the application. Tags help organize and categorize
  /// your AppConfig resources. Each tag consists of a key and an optional
  /// value, both of which you define.
  Future<Application> createApplication({
    required String name,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Creates a configuration profile, which is information that enables
  /// AppConfig to access the configuration source. Valid configuration sources
  /// include the following:
  ///
  /// <ul>
  /// <li>
  /// Configuration data in YAML, JSON, and other formats stored in the
  /// AppConfig hosted configuration store
  /// </li>
  /// <li>
  /// Configuration data stored as objects in an Amazon Simple Storage Service
  /// (Amazon S3) bucket
  /// </li>
  /// <li>
  /// Pipelines stored in CodePipeline
  /// </li>
  /// <li>
  /// Secrets stored in Secrets Manager
  /// </li>
  /// <li>
  /// Standard and secure string parameters stored in Amazon Web Services
  /// Systems Manager Parameter Store
  /// </li>
  /// <li>
  /// Configuration data in SSM documents stored in the Systems Manager document
  /// store
  /// </li>
  /// </ul>
  /// A configuration profile includes the following information:
  ///
  /// <ul>
  /// <li>
  /// The URI location of the configuration data.
  /// </li>
  /// <li>
  /// The Identity and Access Management (IAM) role that provides access to the
  /// configuration data.
  /// </li>
  /// <li>
  /// A validator for the configuration data. Available validators include
  /// either a JSON Schema or an Amazon Web Services Lambda function.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-creating-configuration-and-profile.html">Create
  /// a Configuration and a Configuration Profile</a> in the <i>AppConfig User
  /// Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [locationUri] :
  /// A URI to locate the configuration. You can specify the following:
  ///
  /// <ul>
  /// <li>
  /// For the AppConfig hosted configuration store and for feature flags,
  /// specify <code>hosted</code>.
  /// </li>
  /// <li>
  /// For an Amazon Web Services Systems Manager Parameter Store parameter,
  /// specify either the parameter name in the format
  /// <code>ssm-parameter://&lt;parameter name&gt;</code> or the ARN.
  /// </li>
  /// <li>
  /// For an Amazon Web Services CodePipeline pipeline, specify the URI in the
  /// following format: <code>codepipeline</code>://&lt;pipeline name&gt;.
  /// </li>
  /// <li>
  /// For an Secrets Manager secret, specify the URI in the following format:
  /// <code>secretsmanager</code>://&lt;secret name&gt;.
  /// </li>
  /// <li>
  /// For an Amazon S3 object, specify the URI in the following format:
  /// <code>s3://&lt;bucket&gt;/&lt;objectKey&gt; </code>. Here is an example:
  /// <code>s3://my-bucket/my-app/us-east-1/my-config.json</code>
  /// </li>
  /// <li>
  /// For an SSM document, specify either the document name in the format
  /// <code>ssm-document://&lt;document name&gt;</code> or the Amazon Resource
  /// Name (ARN).
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// A name for the configuration profile.
  ///
  /// Parameter [description] :
  /// A description of the configuration profile.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The identifier for an Key Management Service key to encrypt new
  /// configuration data versions in the AppConfig hosted configuration store.
  /// This attribute is only used for <code>hosted</code> configuration types.
  /// The identifier can be an KMS key ID, alias, or the Amazon Resource Name
  /// (ARN) of the key ID or alias. To encrypt data managed in other
  /// configuration stores, see the documentation for how to specify an KMS key
  /// for that particular service.
  ///
  /// Parameter [retrievalRoleArn] :
  /// The ARN of an IAM role with permission to access the configuration at the
  /// specified <code>LocationUri</code>.
  /// <important>
  /// A retrieval role ARN is not required for configurations stored in the
  /// AppConfig hosted configuration store. It is required for all other sources
  /// that store your configuration.
  /// </important>
  ///
  /// Parameter [tags] :
  /// Metadata to assign to the configuration profile. Tags help organize and
  /// categorize your AppConfig resources. Each tag consists of a key and an
  /// optional value, both of which you define.
  ///
  /// Parameter [type] :
  /// The type of configurations contained in the profile. AppConfig supports
  /// <code>feature flags</code> and <code>freeform</code> configurations. We
  /// recommend you create feature flag configurations to enable or disable new
  /// features and freeform configurations to distribute configurations to an
  /// application. When calling this API, enter one of the following values for
  /// <code>Type</code>:
  ///
  /// <code>AWS.AppConfig.FeatureFlags</code>
  ///
  /// <code>AWS.Freeform</code>
  ///
  /// Parameter [validators] :
  /// A list of methods for validating the configuration.
  Future<ConfigurationProfile> createConfigurationProfile({
    required String applicationId,
    required String locationUri,
    required String name,
    String? description,
    String? kmsKeyIdentifier,
    String? retrievalRoleArn,
    Map<String, String>? tags,
    String? type,
    List<Validator>? validators,
  }) async {
    final $payload = <String, dynamic>{
      'LocationUri': locationUri,
      'Name': name,
      if (description != null) 'Description': description,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (retrievalRoleArn != null) 'RetrievalRoleArn': retrievalRoleArn,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type,
      if (validators != null) 'Validators': validators,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigurationProfile.fromJson(response);
  }

  /// Creates a deployment strategy that defines important criteria for rolling
  /// out your configuration to the designated targets. A deployment strategy
  /// includes the overall duration required, a percentage of targets to receive
  /// the deployment during each interval, an algorithm that defines how
  /// percentage grows, and bake time.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [deploymentDurationInMinutes] :
  /// Total amount of time for a deployment to last.
  ///
  /// Parameter [growthFactor] :
  /// The percentage of targets to receive a deployed configuration during each
  /// interval.
  ///
  /// Parameter [name] :
  /// A name for the deployment strategy.
  ///
  /// Parameter [description] :
  /// A description of the deployment strategy.
  ///
  /// Parameter [finalBakeTimeInMinutes] :
  /// Specifies the amount of time AppConfig monitors for Amazon CloudWatch
  /// alarms after the configuration has been deployed to 100% of its targets,
  /// before considering the deployment to be complete. If an alarm is triggered
  /// during this time, AppConfig rolls back the deployment. You must configure
  /// permissions for AppConfig to roll back based on CloudWatch alarms. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/appconfig/latest/userguide/getting-started-with-appconfig-cloudwatch-alarms-permissions.html">Configuring
  /// permissions for rollback based on Amazon CloudWatch alarms</a> in the
  /// <i>AppConfig User Guide</i>.
  ///
  /// Parameter [growthType] :
  /// The algorithm used to define how percentage grows over time. AppConfig
  /// supports the following growth types:
  ///
  /// <b>Linear</b>: For this type, AppConfig processes the deployment by
  /// dividing the total number of targets by the value specified for <code>Step
  /// percentage</code>. For example, a linear deployment that uses a <code>Step
  /// percentage</code> of 10 deploys the configuration to 10 percent of the
  /// hosts. After those deployments are complete, the system deploys the
  /// configuration to the next 10 percent. This continues until 100% of the
  /// targets have successfully received the configuration.
  ///
  /// <b>Exponential</b>: For this type, AppConfig processes the deployment
  /// exponentially using the following formula: <code>G*(2^N)</code>. In this
  /// formula, <code>G</code> is the growth factor specified by the user and
  /// <code>N</code> is the number of steps until the configuration is deployed
  /// to all targets. For example, if you specify a growth factor of 2, then the
  /// system rolls out the configuration as follows:
  ///
  /// <code>2*(2^0)</code>
  ///
  /// <code>2*(2^1)</code>
  ///
  /// <code>2*(2^2)</code>
  ///
  /// Expressed numerically, the deployment rolls out as follows: 2% of the
  /// targets, 4% of the targets, 8% of the targets, and continues until the
  /// configuration has been deployed to all targets.
  ///
  /// Parameter [replicateTo] :
  /// Save the deployment strategy to a Systems Manager (SSM) document.
  ///
  /// Parameter [tags] :
  /// Metadata to assign to the deployment strategy. Tags help organize and
  /// categorize your AppConfig resources. Each tag consists of a key and an
  /// optional value, both of which you define.
  Future<DeploymentStrategy> createDeploymentStrategy({
    required int deploymentDurationInMinutes,
    required double growthFactor,
    required String name,
    String? description,
    int? finalBakeTimeInMinutes,
    GrowthType? growthType,
    ReplicateTo? replicateTo,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'deploymentDurationInMinutes',
      deploymentDurationInMinutes,
      0,
      1440,
      isRequired: true,
    );
    _s.validateNumRange(
      'growthFactor',
      growthFactor,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'finalBakeTimeInMinutes',
      finalBakeTimeInMinutes,
      0,
      1440,
    );
    final $payload = <String, dynamic>{
      'DeploymentDurationInMinutes': deploymentDurationInMinutes,
      'GrowthFactor': growthFactor,
      'Name': name,
      if (description != null) 'Description': description,
      if (finalBakeTimeInMinutes != null)
        'FinalBakeTimeInMinutes': finalBakeTimeInMinutes,
      if (growthType != null) 'GrowthType': growthType.toValue(),
      if (replicateTo != null) 'ReplicateTo': replicateTo.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deploymentstrategies',
      exceptionFnMap: _exceptionFns,
    );
    return DeploymentStrategy.fromJson(response);
  }

  /// Creates an environment. For each application, you define one or more
  /// environments. An environment is a deployment group of AppConfig targets,
  /// such as applications in a <code>Beta</code> or <code>Production</code>
  /// environment. You can also define environments for application
  /// subcomponents such as the <code>Web</code>, <code>Mobile</code> and
  /// <code>Back-end</code> components for your application. You can configure
  /// Amazon CloudWatch alarms for each environment. The system monitors alarms
  /// during a configuration deployment. If an alarm is triggered, the system
  /// rolls back the configuration.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [name] :
  /// A name for the environment.
  ///
  /// Parameter [description] :
  /// A description of the environment.
  ///
  /// Parameter [monitors] :
  /// Amazon CloudWatch alarms to monitor during the deployment process.
  ///
  /// Parameter [tags] :
  /// Metadata to assign to the environment. Tags help organize and categorize
  /// your AppConfig resources. Each tag consists of a key and an optional
  /// value, both of which you define.
  Future<Environment> createEnvironment({
    required String applicationId,
    required String name,
    String? description,
    List<Monitor>? monitors,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (description != null) 'Description': description,
      if (monitors != null) 'Monitors': monitors,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments',
      exceptionFnMap: _exceptionFns,
    );
    return Environment.fromJson(response);
  }

  /// Creates an AppConfig extension. An extension augments your ability to
  /// inject logic or behavior at different points during the AppConfig workflow
  /// of creating or deploying a configuration.
  ///
  /// You can create your own extensions or use the Amazon Web Services authored
  /// extensions provided by AppConfig. For an AppConfig extension that uses
  /// Lambda, you must create a Lambda function to perform any computation and
  /// processing defined in the extension. If you plan to create custom versions
  /// of the Amazon Web Services authored notification extensions, you only need
  /// to specify an Amazon Resource Name (ARN) in the <code>Uri</code> field for
  /// the new extension version.
  ///
  /// <ul>
  /// <li>
  /// For a custom EventBridge notification extension, enter the ARN of the
  /// EventBridge default events in the <code>Uri</code> field.
  /// </li>
  /// <li>
  /// For a custom Amazon SNS notification extension, enter the ARN of an Amazon
  /// SNS topic in the <code>Uri</code> field.
  /// </li>
  /// <li>
  /// For a custom Amazon SQS notification extension, enter the ARN of an Amazon
  /// SQS message queue in the <code>Uri</code> field.
  /// </li>
  /// </ul>
  /// For more information about extensions, see <a
  /// href="https://docs.aws.amazon.com/appconfig/latest/userguide/working-with-appconfig-extensions.html">Extending
  /// workflows</a> in the <i>AppConfig User Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [actions] :
  /// The actions defined in the extension.
  ///
  /// Parameter [name] :
  /// A name for the extension. Each extension name in your account must be
  /// unique. Extension versions use the same name.
  ///
  /// Parameter [description] :
  /// Information about the extension.
  ///
  /// Parameter [latestVersionNumber] :
  /// You can omit this field when you create an extension. When you create a
  /// new version, specify the most recent current version number. For example,
  /// you create version 3, enter 2 for this field.
  ///
  /// Parameter [parameters] :
  /// The parameters accepted by the extension. You specify parameter values
  /// when you associate the extension to an AppConfig resource by using the
  /// <code>CreateExtensionAssociation</code> API action. For Lambda extension
  /// actions, these parameters are included in the Lambda request object.
  ///
  /// Parameter [tags] :
  /// Adds one or more tags for the specified extension. Tags are metadata that
  /// help you categorize resources in different ways, for example, by purpose,
  /// owner, or environment. Each tag consists of a key and an optional value,
  /// both of which you define.
  Future<Extension> createExtension({
    required Map<ActionPoint, List<Action>> actions,
    required String name,
    String? description,
    int? latestVersionNumber,
    Map<String, Parameter>? parameters,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (latestVersionNumber != null)
        'Latest-Version-Number': latestVersionNumber.toString(),
    };
    final $payload = <String, dynamic>{
      'Actions': actions.map((k, e) => MapEntry(k.toValue(), e)),
      'Name': name,
      if (description != null) 'Description': description,
      if (parameters != null) 'Parameters': parameters,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/extensions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return Extension.fromJson(response);
  }

  /// When you create an extension or configure an Amazon Web Services authored
  /// extension, you associate the extension with an AppConfig application,
  /// environment, or configuration profile. For example, you can choose to run
  /// the <code>AppConfig deployment events to Amazon SNS</code> Amazon Web
  /// Services authored extension and receive notifications on an Amazon SNS
  /// topic anytime a configuration deployment is started for a specific
  /// application. Defining which extension to associate with an AppConfig
  /// resource is called an <i>extension association</i>. An extension
  /// association is a specified relationship between an extension and an
  /// AppConfig resource, such as an application or a configuration profile. For
  /// more information about extensions and associations, see <a
  /// href="https://docs.aws.amazon.com/appconfig/latest/userguide/working-with-appconfig-extensions.html">Extending
  /// workflows</a> in the <i>AppConfig User Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [extensionIdentifier] :
  /// The name, the ID, or the Amazon Resource Name (ARN) of the extension.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ARN of an application, configuration profile, or environment.
  ///
  /// Parameter [extensionVersionNumber] :
  /// The version number of the extension. If not specified, AppConfig uses the
  /// maximum version of the extension.
  ///
  /// Parameter [parameters] :
  /// The parameter names and values defined in the extensions. Extension
  /// parameters marked <code>Required</code> must be entered for this field.
  ///
  /// Parameter [tags] :
  /// Adds one or more tags for the specified extension association. Tags are
  /// metadata that help you categorize resources in different ways, for
  /// example, by purpose, owner, or environment. Each tag consists of a key and
  /// an optional value, both of which you define.
  Future<ExtensionAssociation> createExtensionAssociation({
    required String extensionIdentifier,
    required String resourceIdentifier,
    int? extensionVersionNumber,
    Map<String, String>? parameters,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ExtensionIdentifier': extensionIdentifier,
      'ResourceIdentifier': resourceIdentifier,
      if (extensionVersionNumber != null)
        'ExtensionVersionNumber': extensionVersionNumber,
      if (parameters != null) 'Parameters': parameters,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/extensionassociations',
      exceptionFnMap: _exceptionFns,
    );
    return ExtensionAssociation.fromJson(response);
  }

  /// Creates a new configuration in the AppConfig hosted configuration store.
  ///
  /// May throw [BadRequestException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [PayloadTooLargeException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [configurationProfileId] :
  /// The configuration profile ID.
  ///
  /// Parameter [content] :
  /// The content of the configuration or the configuration data.
  ///
  /// Parameter [contentType] :
  /// A standard MIME type describing the format of the configuration content.
  /// For more information, see <a
  /// href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.
  ///
  /// Parameter [description] :
  /// A description of the configuration.
  ///
  /// Parameter [latestVersionNumber] :
  /// An optional locking token used to prevent race conditions from overwriting
  /// configuration updates when creating a new version. To ensure your data is
  /// not overwritten when creating multiple hosted configuration versions in
  /// rapid succession, specify the version number of the latest hosted
  /// configuration version.
  ///
  /// Parameter [versionLabel] :
  /// An optional, user-defined label for the AppConfig hosted configuration
  /// version. This value must contain at least one non-numeric character. For
  /// example, "v2.2.0".
  Future<HostedConfigurationVersion> createHostedConfigurationVersion({
    required String applicationId,
    required String configurationProfileId,
    required Uint8List content,
    required String contentType,
    String? description,
    int? latestVersionNumber,
    String? versionLabel,
  }) async {
    final headers = <String, String>{
      'Content-Type': contentType.toString(),
      if (description != null) 'Description': description.toString(),
      if (latestVersionNumber != null)
        'Latest-Version-Number': latestVersionNumber.toString(),
      if (versionLabel != null) 'VersionLabel': versionLabel.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: content,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}/hostedconfigurationversions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return HostedConfigurationVersion(
      content: await response.stream.toBytes(),
      applicationId:
          _s.extractHeaderStringValue(response.headers, 'Application-Id'),
      configurationProfileId: _s.extractHeaderStringValue(
          response.headers, 'Configuration-Profile-Id'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      description: _s.extractHeaderStringValue(response.headers, 'Description'),
      kmsKeyArn: _s.extractHeaderStringValue(response.headers, 'KmsKeyArn'),
      versionLabel:
          _s.extractHeaderStringValue(response.headers, 'VersionLabel'),
      versionNumber:
          _s.extractHeaderIntValue(response.headers, 'Version-Number'),
    );
  }

  /// Deletes an application. Deleting an application does not delete a
  /// configuration from a host.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application to delete.
  Future<void> deleteApplication({
    required String applicationId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a configuration profile. Deleting a configuration profile does not
  /// delete a configuration from a host.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The application ID that includes the configuration profile you want to
  /// delete.
  ///
  /// Parameter [configurationProfileId] :
  /// The ID of the configuration profile you want to delete.
  Future<void> deleteConfigurationProfile({
    required String applicationId,
    required String configurationProfileId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a deployment strategy. Deleting a deployment strategy does not
  /// delete a configuration from a host.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [deploymentStrategyId] :
  /// The ID of the deployment strategy you want to delete.
  Future<void> deleteDeploymentStrategy({
    required String deploymentStrategyId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/deployementstrategies/${Uri.encodeComponent(deploymentStrategyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an environment. Deleting an environment does not delete a
  /// configuration from a host.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The application ID that includes the environment that you want to delete.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment that you want to delete.
  Future<void> deleteEnvironment({
    required String applicationId,
    required String environmentId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an AppConfig extension. You must delete all associations to an
  /// extension before you delete the extension.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [extensionIdentifier] :
  /// The name, ID, or Amazon Resource Name (ARN) of the extension you want to
  /// delete.
  ///
  /// Parameter [versionNumber] :
  /// A specific version of an extension to delete. If omitted, the highest
  /// version is deleted.
  Future<void> deleteExtension({
    required String extensionIdentifier,
    int? versionNumber,
  }) async {
    final $query = <String, List<String>>{
      if (versionNumber != null) 'version': [versionNumber.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/extensions/${Uri.encodeComponent(extensionIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an extension association. This action doesn't delete extensions
  /// defined in the association.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [extensionAssociationId] :
  /// The ID of the extension association to delete.
  Future<void> deleteExtensionAssociation({
    required String extensionAssociationId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/extensionassociations/${Uri.encodeComponent(extensionAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a version of a configuration from the AppConfig hosted
  /// configuration store.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [configurationProfileId] :
  /// The configuration profile ID.
  ///
  /// Parameter [versionNumber] :
  /// The versions number to delete.
  Future<void> deleteHostedConfigurationVersion({
    required String applicationId,
    required String configurationProfileId,
    required int versionNumber,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}/hostedconfigurationversions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about an application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application you want to get.
  Future<Application> getApplication({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// (Deprecated) Retrieves the latest deployed configuration.
  /// <important>
  /// Note the following important information.
  ///
  /// <ul>
  /// <li>
  /// This API action is deprecated. Calls to receive configuration data should
  /// use the <a
  /// href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_StartConfigurationSession.html">StartConfigurationSession</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_GetLatestConfiguration.html">GetLatestConfiguration</a>
  /// APIs instead.
  /// </li>
  /// <li>
  /// <code>GetConfiguration</code> is a priced call. For more information, see
  /// <a href="https://aws.amazon.com/systems-manager/pricing/">Pricing</a>.
  /// </li>
  /// </ul> </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [application] :
  /// The application to get. Specify either the application name or the
  /// application ID.
  ///
  /// Parameter [clientId] :
  /// The clientId parameter in the following command is a unique,
  /// user-specified ID to identify the client for the configuration. This ID
  /// enables AppConfig to deploy the configuration in intervals, as defined in
  /// the deployment strategy.
  ///
  /// Parameter [configuration] :
  /// The configuration to get. Specify either the configuration name or the
  /// configuration ID.
  ///
  /// Parameter [environment] :
  /// The environment to get. Specify either the environment name or the
  /// environment ID.
  ///
  /// Parameter [clientConfigurationVersion] :
  /// The configuration version returned in the most recent
  /// <code>GetConfiguration</code> response.
  /// <important>
  /// AppConfig uses the value of the <code>ClientConfigurationVersion</code>
  /// parameter to identify the configuration version on your clients. If you
  /// don’t send <code>ClientConfigurationVersion</code> with each call to
  /// <code>GetConfiguration</code>, your clients receive the current
  /// configuration. You are charged each time your clients receive a
  /// configuration.
  ///
  /// To avoid excess charges, we recommend you use the <a
  /// href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/StartConfigurationSession.html">StartConfigurationSession</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/GetLatestConfiguration.html">GetLatestConfiguration</a>
  /// APIs, which track the client configuration version on your behalf. If you
  /// choose to continue using <code>GetConfiguration</code>, we recommend that
  /// you include the <code>ClientConfigurationVersion</code> value with every
  /// call to <code>GetConfiguration</code>. The value to use for
  /// <code>ClientConfigurationVersion</code> comes from the
  /// <code>ConfigurationVersion</code> attribute returned by
  /// <code>GetConfiguration</code> when there is new or updated data, and
  /// should be saved for subsequent calls to <code>GetConfiguration</code>.
  /// </important>
  /// For more information about working with configurations, see <a
  /// href="http://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-retrieving-the-configuration.html">Retrieving
  /// the Configuration</a> in the <i>AppConfig User Guide</i>.
  @Deprecated(
      'This API has been deprecated in favor of the GetLatestConfiguration API used in conjunction with StartConfigurationSession.')
  Future<Configuration> getConfiguration({
    required String application,
    required String clientId,
    required String configuration,
    required String environment,
    String? clientConfigurationVersion,
  }) async {
    final $query = <String, List<String>>{
      'client_id': [clientId],
      if (clientConfigurationVersion != null)
        'client_configuration_version': [clientConfigurationVersion],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(application)}/environments/${Uri.encodeComponent(environment)}/configurations/${Uri.encodeComponent(configuration)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Configuration(
      content: await response.stream.toBytes(),
      configurationVersion: _s.extractHeaderStringValue(
          response.headers, 'Configuration-Version'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Retrieves information about a configuration profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application that includes the configuration profile you want
  /// to get.
  ///
  /// Parameter [configurationProfileId] :
  /// The ID of the configuration profile that you want to get.
  Future<ConfigurationProfile> getConfigurationProfile({
    required String applicationId,
    required String configurationProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigurationProfile.fromJson(response);
  }

  /// Retrieves information about a configuration deployment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application that includes the deployment you want to get.
  ///
  /// Parameter [deploymentNumber] :
  /// The sequence number of the deployment.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment that includes the deployment you want to get.
  Future<Deployment> getDeployment({
    required String applicationId,
    required int deploymentNumber,
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}/deployments/${Uri.encodeComponent(deploymentNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return Deployment.fromJson(response);
  }

  /// Retrieves information about a deployment strategy. A deployment strategy
  /// defines important criteria for rolling out your configuration to the
  /// designated targets. A deployment strategy includes the overall duration
  /// required, a percentage of targets to receive the deployment during each
  /// interval, an algorithm that defines how percentage grows, and bake time.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [deploymentStrategyId] :
  /// The ID of the deployment strategy to get.
  Future<DeploymentStrategy> getDeploymentStrategy({
    required String deploymentStrategyId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/deploymentstrategies/${Uri.encodeComponent(deploymentStrategyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeploymentStrategy.fromJson(response);
  }

  /// Retrieves information about an environment. An environment is a deployment
  /// group of AppConfig applications, such as applications in a
  /// <code>Production</code> environment or in an <code>EU_Region</code>
  /// environment. Each configuration deployment targets an environment. You can
  /// enable one or more Amazon CloudWatch alarms for an environment. If an
  /// alarm is triggered during a deployment, AppConfig roles back the
  /// configuration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application that includes the environment you want to get.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment that you want to get.
  Future<Environment> getEnvironment({
    required String applicationId,
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Environment.fromJson(response);
  }

  /// Returns information about an AppConfig extension.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [extensionIdentifier] :
  /// The name, the ID, or the Amazon Resource Name (ARN) of the extension.
  ///
  /// Parameter [versionNumber] :
  /// The extension version number. If no version number was defined, AppConfig
  /// uses the highest version.
  Future<Extension> getExtension({
    required String extensionIdentifier,
    int? versionNumber,
  }) async {
    final $query = <String, List<String>>{
      if (versionNumber != null) 'version_number': [versionNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/extensions/${Uri.encodeComponent(extensionIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Extension.fromJson(response);
  }

  /// Returns information about an AppConfig extension association. For more
  /// information about extensions and associations, see <a
  /// href="https://docs.aws.amazon.com/appconfig/latest/userguide/working-with-appconfig-extensions.html">Extending
  /// workflows</a> in the <i>AppConfig User Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [extensionAssociationId] :
  /// The extension association ID to get.
  Future<ExtensionAssociation> getExtensionAssociation({
    required String extensionAssociationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/extensionassociations/${Uri.encodeComponent(extensionAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ExtensionAssociation.fromJson(response);
  }

  /// Retrieves information about a specific configuration version.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [configurationProfileId] :
  /// The configuration profile ID.
  ///
  /// Parameter [versionNumber] :
  /// The version.
  Future<HostedConfigurationVersion> getHostedConfigurationVersion({
    required String applicationId,
    required String configurationProfileId,
    required int versionNumber,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}/hostedconfigurationversions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return HostedConfigurationVersion(
      content: await response.stream.toBytes(),
      applicationId:
          _s.extractHeaderStringValue(response.headers, 'Application-Id'),
      configurationProfileId: _s.extractHeaderStringValue(
          response.headers, 'Configuration-Profile-Id'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      description: _s.extractHeaderStringValue(response.headers, 'Description'),
      kmsKeyArn: _s.extractHeaderStringValue(response.headers, 'KmsKeyArn'),
      versionLabel:
          _s.extractHeaderStringValue(response.headers, 'VersionLabel'),
      versionNumber:
          _s.extractHeaderIntValue(response.headers, 'Version-Number'),
    );
  }

  /// Lists all applications in your Amazon Web Services account.
  ///
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Next token is a pagination token generated by
  /// AppConfig to describe what page the previous List call ended on. For the
  /// first List request, the nextToken should not be set. On subsequent calls,
  /// the nextToken parameter should be set to the previous responses nextToken
  /// value. Use this token to get the next set of results.
  Future<Applications> listApplications({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Applications.fromJson(response);
  }

  /// Lists the configuration profiles for an application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  ///
  /// Parameter [type] :
  /// A filter based on the type of configurations that the configuration
  /// profile contains. A configuration can be a feature flag or a freeform
  /// configuration.
  Future<ConfigurationProfiles> listConfigurationProfiles({
    required String applicationId,
    int? maxResults,
    String? nextToken,
    String? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
      if (type != null) 'type': [type],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ConfigurationProfiles.fromJson(response);
  }

  /// Lists deployment strategies.
  ///
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<DeploymentStrategies> listDeploymentStrategies({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/deploymentstrategies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeploymentStrategies.fromJson(response);
  }

  /// Lists the deployments for an environment in descending deployment number
  /// order.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [environmentId] :
  /// The environment ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items that may be returned for this call. If there
  /// are items that have not yet been returned, the response will include a
  /// non-null <code>NextToken</code> that you can provide in a subsequent call
  /// to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a prior call to this operation indicating the next
  /// set of results to be returned. If not specified, the operation will return
  /// the first set of results.
  Future<Deployments> listDeployments({
    required String applicationId,
    required String environmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}/deployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Deployments.fromJson(response);
  }

  /// Lists the environments for an application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<Environments> listEnvironments({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Environments.fromJson(response);
  }

  /// Lists all AppConfig extension associations in the account. For more
  /// information about extensions and associations, see <a
  /// href="https://docs.aws.amazon.com/appconfig/latest/userguide/working-with-appconfig-extensions.html">Extending
  /// workflows</a> in the <i>AppConfig User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [extensionIdentifier] :
  /// The name, the ID, or the Amazon Resource Name (ARN) of the extension.
  ///
  /// Parameter [extensionVersionNumber] :
  /// The version number for the extension defined in the association.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results
  /// or pass null to get the first set of results.
  ///
  /// Parameter [resourceIdentifier] :
  /// The ARN of an application, configuration profile, or environment.
  Future<ExtensionAssociations> listExtensionAssociations({
    String? extensionIdentifier,
    int? extensionVersionNumber,
    int? maxResults,
    String? nextToken,
    String? resourceIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (extensionIdentifier != null)
        'extension_identifier': [extensionIdentifier],
      if (extensionVersionNumber != null)
        'extension_version_number': [extensionVersionNumber.toString()],
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
      if (resourceIdentifier != null)
        'resource_identifier': [resourceIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/extensionassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ExtensionAssociations.fromJson(response);
  }

  /// Lists all custom and Amazon Web Services authored AppConfig extensions in
  /// the account. For more information about extensions, see <a
  /// href="https://docs.aws.amazon.com/appconfig/latest/userguide/working-with-appconfig-extensions.html">Extending
  /// workflows</a> in the <i>AppConfig User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [name] :
  /// The extension name.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<Extensions> listExtensions({
    int? maxResults,
    String? name,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/extensions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Extensions.fromJson(response);
  }

  /// Lists configurations stored in the AppConfig hosted configuration store by
  /// version.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [configurationProfileId] :
  /// The configuration profile ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  ///
  /// Parameter [versionLabel] :
  /// An optional filter that can be used to specify the version label of an
  /// AppConfig hosted configuration version. This parameter supports filtering
  /// by prefix using a wildcard, for example "v2*". If you don't specify an
  /// asterisk at the end of the value, only an exact match is returned.
  Future<HostedConfigurationVersions> listHostedConfigurationVersions({
    required String applicationId,
    required String configurationProfileId,
    int? maxResults,
    String? nextToken,
    String? versionLabel,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
      if (versionLabel != null) 'version_label': [versionLabel],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}/hostedconfigurationversions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return HostedConfigurationVersions.fromJson(response);
  }

  /// Retrieves the list of key-value tags assigned to the resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN.
  Future<ResourceTags> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ResourceTags.fromJson(response);
  }

  /// Starts a deployment.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [configurationProfileId] :
  /// The configuration profile ID.
  ///
  /// Parameter [configurationVersion] :
  /// The configuration version to deploy. If deploying an AppConfig hosted
  /// configuration version, you can specify either the version number or
  /// version label. For all other configurations, you must specify the version
  /// number.
  ///
  /// Parameter [deploymentStrategyId] :
  /// The deployment strategy ID.
  ///
  /// Parameter [environmentId] :
  /// The environment ID.
  ///
  /// Parameter [description] :
  /// A description of the deployment.
  ///
  /// Parameter [dynamicExtensionParameters] :
  /// A map of dynamic extension parameter names to values to pass to associated
  /// extensions with <code>PRE_START_DEPLOYMENT</code> actions.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The KMS key identifier (key ID, key alias, or key ARN). AppConfig uses
  /// this ID to encrypt the configuration data using a customer managed key.
  ///
  /// Parameter [tags] :
  /// Metadata to assign to the deployment. Tags help organize and categorize
  /// your AppConfig resources. Each tag consists of a key and an optional
  /// value, both of which you define.
  Future<Deployment> startDeployment({
    required String applicationId,
    required String configurationProfileId,
    required String configurationVersion,
    required String deploymentStrategyId,
    required String environmentId,
    String? description,
    Map<String, String>? dynamicExtensionParameters,
    String? kmsKeyIdentifier,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ConfigurationProfileId': configurationProfileId,
      'ConfigurationVersion': configurationVersion,
      'DeploymentStrategyId': deploymentStrategyId,
      if (description != null) 'Description': description,
      if (dynamicExtensionParameters != null)
        'DynamicExtensionParameters': dynamicExtensionParameters,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}/deployments',
      exceptionFnMap: _exceptionFns,
    );
    return Deployment.fromJson(response);
  }

  /// Stops a deployment. This API action works only on deployments that have a
  /// status of <code>DEPLOYING</code>. This action moves the deployment to a
  /// status of <code>ROLLED_BACK</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [deploymentNumber] :
  /// The sequence number of the deployment.
  ///
  /// Parameter [environmentId] :
  /// The environment ID.
  Future<Deployment> stopDeployment({
    required String applicationId,
    required int deploymentNumber,
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}/deployments/${Uri.encodeComponent(deploymentNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return Deployment.fromJson(response);
  }

  /// Assigns metadata to an AppConfig resource. Tags help organize and
  /// categorize your AppConfig resources. Each tag consists of a key and an
  /// optional value, both of which you define. You can specify a maximum of 50
  /// tags for a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource for which to retrieve tags.
  ///
  /// Parameter [tags] :
  /// The key-value string map. The valid character set is [a-zA-Z+-=._:/]. The
  /// tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a tag key and value from an AppConfig resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource for which to remove tags.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to delete.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [description] :
  /// A description of the application.
  ///
  /// Parameter [name] :
  /// The name of the application.
  Future<Application> updateApplication({
    required String applicationId,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Updates a configuration profile.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [configurationProfileId] :
  /// The ID of the configuration profile.
  ///
  /// Parameter [description] :
  /// A description of the configuration profile.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The identifier for a Key Management Service key to encrypt new
  /// configuration data versions in the AppConfig hosted configuration store.
  /// This attribute is only used for <code>hosted</code> configuration types.
  /// The identifier can be an KMS key ID, alias, or the Amazon Resource Name
  /// (ARN) of the key ID or alias. To encrypt data managed in other
  /// configuration stores, see the documentation for how to specify an KMS key
  /// for that particular service.
  ///
  /// Parameter [name] :
  /// The name of the configuration profile.
  ///
  /// Parameter [retrievalRoleArn] :
  /// The ARN of an IAM role with permission to access the configuration at the
  /// specified <code>LocationUri</code>.
  ///
  /// Parameter [validators] :
  /// A list of methods for validating the configuration.
  Future<ConfigurationProfile> updateConfigurationProfile({
    required String applicationId,
    required String configurationProfileId,
    String? description,
    String? kmsKeyIdentifier,
    String? name,
    String? retrievalRoleArn,
    List<Validator>? validators,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (name != null) 'Name': name,
      if (retrievalRoleArn != null) 'RetrievalRoleArn': retrievalRoleArn,
      if (validators != null) 'Validators': validators,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigurationProfile.fromJson(response);
  }

  /// Updates a deployment strategy.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deploymentStrategyId] :
  /// The deployment strategy ID.
  ///
  /// Parameter [deploymentDurationInMinutes] :
  /// Total amount of time for a deployment to last.
  ///
  /// Parameter [description] :
  /// A description of the deployment strategy.
  ///
  /// Parameter [finalBakeTimeInMinutes] :
  /// The amount of time that AppConfig monitors for alarms before considering
  /// the deployment to be complete and no longer eligible for automatic
  /// rollback.
  ///
  /// Parameter [growthFactor] :
  /// The percentage of targets to receive a deployed configuration during each
  /// interval.
  ///
  /// Parameter [growthType] :
  /// The algorithm used to define how percentage grows over time. AppConfig
  /// supports the following growth types:
  ///
  /// <b>Linear</b>: For this type, AppConfig processes the deployment by
  /// increments of the growth factor evenly distributed over the deployment
  /// time. For example, a linear deployment that uses a growth factor of 20
  /// initially makes the configuration available to 20 percent of the targets.
  /// After 1/5th of the deployment time has passed, the system updates the
  /// percentage to 40 percent. This continues until 100% of the targets are set
  /// to receive the deployed configuration.
  ///
  /// <b>Exponential</b>: For this type, AppConfig processes the deployment
  /// exponentially using the following formula: <code>G*(2^N)</code>. In this
  /// formula, <code>G</code> is the growth factor specified by the user and
  /// <code>N</code> is the number of steps until the configuration is deployed
  /// to all targets. For example, if you specify a growth factor of 2, then the
  /// system rolls out the configuration as follows:
  ///
  /// <code>2*(2^0)</code>
  ///
  /// <code>2*(2^1)</code>
  ///
  /// <code>2*(2^2)</code>
  ///
  /// Expressed numerically, the deployment rolls out as follows: 2% of the
  /// targets, 4% of the targets, 8% of the targets, and continues until the
  /// configuration has been deployed to all targets.
  Future<DeploymentStrategy> updateDeploymentStrategy({
    required String deploymentStrategyId,
    int? deploymentDurationInMinutes,
    String? description,
    int? finalBakeTimeInMinutes,
    double? growthFactor,
    GrowthType? growthType,
  }) async {
    _s.validateNumRange(
      'deploymentDurationInMinutes',
      deploymentDurationInMinutes,
      0,
      1440,
    );
    _s.validateNumRange(
      'finalBakeTimeInMinutes',
      finalBakeTimeInMinutes,
      0,
      1440,
    );
    _s.validateNumRange(
      'growthFactor',
      growthFactor,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (deploymentDurationInMinutes != null)
        'DeploymentDurationInMinutes': deploymentDurationInMinutes,
      if (description != null) 'Description': description,
      if (finalBakeTimeInMinutes != null)
        'FinalBakeTimeInMinutes': finalBakeTimeInMinutes,
      if (growthFactor != null) 'GrowthFactor': growthFactor,
      if (growthType != null) 'GrowthType': growthType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/deploymentstrategies/${Uri.encodeComponent(deploymentStrategyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeploymentStrategy.fromJson(response);
  }

  /// Updates an environment.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [environmentId] :
  /// The environment ID.
  ///
  /// Parameter [description] :
  /// A description of the environment.
  ///
  /// Parameter [monitors] :
  /// Amazon CloudWatch alarms to monitor during the deployment process.
  ///
  /// Parameter [name] :
  /// The name of the environment.
  Future<Environment> updateEnvironment({
    required String applicationId,
    required String environmentId,
    String? description,
    List<Monitor>? monitors,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (monitors != null) 'Monitors': monitors,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Environment.fromJson(response);
  }

  /// Updates an AppConfig extension. For more information about extensions, see
  /// <a
  /// href="https://docs.aws.amazon.com/appconfig/latest/userguide/working-with-appconfig-extensions.html">Extending
  /// workflows</a> in the <i>AppConfig User Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [extensionIdentifier] :
  /// The name, the ID, or the Amazon Resource Name (ARN) of the extension.
  ///
  /// Parameter [actions] :
  /// The actions defined in the extension.
  ///
  /// Parameter [description] :
  /// Information about the extension.
  ///
  /// Parameter [parameters] :
  /// One or more parameters for the actions called by the extension.
  ///
  /// Parameter [versionNumber] :
  /// The extension version number.
  Future<Extension> updateExtension({
    required String extensionIdentifier,
    Map<ActionPoint, List<Action>>? actions,
    String? description,
    Map<String, Parameter>? parameters,
    int? versionNumber,
  }) async {
    final $payload = <String, dynamic>{
      if (actions != null)
        'Actions': actions.map((k, e) => MapEntry(k.toValue(), e)),
      if (description != null) 'Description': description,
      if (parameters != null) 'Parameters': parameters,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/extensions/${Uri.encodeComponent(extensionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return Extension.fromJson(response);
  }

  /// Updates an association. For more information about extensions and
  /// associations, see <a
  /// href="https://docs.aws.amazon.com/appconfig/latest/userguide/working-with-appconfig-extensions.html">Extending
  /// workflows</a> in the <i>AppConfig User Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [extensionAssociationId] :
  /// The system-generated ID for the association.
  ///
  /// Parameter [parameters] :
  /// The parameter names and values defined in the extension.
  Future<ExtensionAssociation> updateExtensionAssociation({
    required String extensionAssociationId,
    Map<String, String>? parameters,
  }) async {
    final $payload = <String, dynamic>{
      if (parameters != null) 'Parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/extensionassociations/${Uri.encodeComponent(extensionAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ExtensionAssociation.fromJson(response);
  }

  /// Uses the validators in a configuration profile to validate a
  /// configuration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [configurationProfileId] :
  /// The configuration profile ID.
  ///
  /// Parameter [configurationVersion] :
  /// The version of the configuration to validate.
  Future<void> validateConfiguration({
    required String applicationId,
    required String configurationProfileId,
    required String configurationVersion,
  }) async {
    final $query = <String, List<String>>{
      'configuration_version': [configurationVersion],
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}/validators',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// An action defines the tasks that the extension performs during the AppConfig
/// workflow. Each action includes an action point such as
/// <code>ON_CREATE_HOSTED_CONFIGURATION</code>, <code>PRE_DEPLOYMENT</code>, or
/// <code>ON_DEPLOYMENT</code>. Each action also includes a name, a URI to an
/// Lambda function, and an Amazon Resource Name (ARN) for an Identity and
/// Access Management assume role. You specify the name, URI, and ARN for each
/// <i>action point</i> defined in the extension. You can specify the following
/// actions for an extension:
///
/// <ul>
/// <li>
/// <code>PRE_CREATE_HOSTED_CONFIGURATION_VERSION</code>
/// </li>
/// <li>
/// <code>PRE_START_DEPLOYMENT</code>
/// </li>
/// <li>
/// <code>ON_DEPLOYMENT_START</code>
/// </li>
/// <li>
/// <code>ON_DEPLOYMENT_STEP</code>
/// </li>
/// <li>
/// <code>ON_DEPLOYMENT_BAKING</code>
/// </li>
/// <li>
/// <code>ON_DEPLOYMENT_COMPLETE</code>
/// </li>
/// <li>
/// <code>ON_DEPLOYMENT_ROLLED_BACK</code>
/// </li>
/// </ul>
class Action {
  /// Information about the action.
  final String? description;

  /// The action name.
  final String? name;

  /// An Amazon Resource Name (ARN) for an Identity and Access Management assume
  /// role.
  final String? roleArn;

  /// The extension URI associated to the action point in the extension
  /// definition. The URI can be an Amazon Resource Name (ARN) for one of the
  /// following: an Lambda function, an Amazon Simple Queue Service queue, an
  /// Amazon Simple Notification Service topic, or the Amazon EventBridge default
  /// event bus.
  final String? uri;

  Action({
    this.description,
    this.name,
    this.roleArn,
    this.uri,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      uri: json['Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final roleArn = this.roleArn;
    final uri = this.uri;
    return {
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (uri != null) 'Uri': uri,
    };
  }
}

/// An extension that was invoked as part of a deployment event.
class ActionInvocation {
  /// The name of the action.
  final String? actionName;

  /// The error code when an extension invocation fails.
  final String? errorCode;

  /// The error message when an extension invocation fails.
  final String? errorMessage;

  /// The name, the ID, or the Amazon Resource Name (ARN) of the extension.
  final String? extensionIdentifier;

  /// A system-generated ID for this invocation.
  final String? invocationId;

  /// An Amazon Resource Name (ARN) for an Identity and Access Management assume
  /// role.
  final String? roleArn;

  /// The extension URI associated to the action point in the extension
  /// definition. The URI can be an Amazon Resource Name (ARN) for one of the
  /// following: an Lambda function, an Amazon Simple Queue Service queue, an
  /// Amazon Simple Notification Service topic, or the Amazon EventBridge default
  /// event bus.
  final String? uri;

  ActionInvocation({
    this.actionName,
    this.errorCode,
    this.errorMessage,
    this.extensionIdentifier,
    this.invocationId,
    this.roleArn,
    this.uri,
  });

  factory ActionInvocation.fromJson(Map<String, dynamic> json) {
    return ActionInvocation(
      actionName: json['ActionName'] as String?,
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      extensionIdentifier: json['ExtensionIdentifier'] as String?,
      invocationId: json['InvocationId'] as String?,
      roleArn: json['RoleArn'] as String?,
      uri: json['Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final extensionIdentifier = this.extensionIdentifier;
    final invocationId = this.invocationId;
    final roleArn = this.roleArn;
    final uri = this.uri;
    return {
      if (actionName != null) 'ActionName': actionName,
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (extensionIdentifier != null)
        'ExtensionIdentifier': extensionIdentifier,
      if (invocationId != null) 'InvocationId': invocationId,
      if (roleArn != null) 'RoleArn': roleArn,
      if (uri != null) 'Uri': uri,
    };
  }
}

enum ActionPoint {
  preCreateHostedConfigurationVersion,
  preStartDeployment,
  onDeploymentStart,
  onDeploymentStep,
  onDeploymentBaking,
  onDeploymentComplete,
  onDeploymentRolledBack,
}

extension ActionPointValueExtension on ActionPoint {
  String toValue() {
    switch (this) {
      case ActionPoint.preCreateHostedConfigurationVersion:
        return 'PRE_CREATE_HOSTED_CONFIGURATION_VERSION';
      case ActionPoint.preStartDeployment:
        return 'PRE_START_DEPLOYMENT';
      case ActionPoint.onDeploymentStart:
        return 'ON_DEPLOYMENT_START';
      case ActionPoint.onDeploymentStep:
        return 'ON_DEPLOYMENT_STEP';
      case ActionPoint.onDeploymentBaking:
        return 'ON_DEPLOYMENT_BAKING';
      case ActionPoint.onDeploymentComplete:
        return 'ON_DEPLOYMENT_COMPLETE';
      case ActionPoint.onDeploymentRolledBack:
        return 'ON_DEPLOYMENT_ROLLED_BACK';
    }
  }
}

extension ActionPointFromString on String {
  ActionPoint toActionPoint() {
    switch (this) {
      case 'PRE_CREATE_HOSTED_CONFIGURATION_VERSION':
        return ActionPoint.preCreateHostedConfigurationVersion;
      case 'PRE_START_DEPLOYMENT':
        return ActionPoint.preStartDeployment;
      case 'ON_DEPLOYMENT_START':
        return ActionPoint.onDeploymentStart;
      case 'ON_DEPLOYMENT_STEP':
        return ActionPoint.onDeploymentStep;
      case 'ON_DEPLOYMENT_BAKING':
        return ActionPoint.onDeploymentBaking;
      case 'ON_DEPLOYMENT_COMPLETE':
        return ActionPoint.onDeploymentComplete;
      case 'ON_DEPLOYMENT_ROLLED_BACK':
        return ActionPoint.onDeploymentRolledBack;
    }
    throw Exception('$this is not known in enum ActionPoint');
  }
}

class Application {
  /// The description of the application.
  final String? description;

  /// The application ID.
  final String? id;

  /// The application name.
  final String? name;

  Application({
    this.description,
    this.id,
    this.name,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final id = this.id;
    final name = this.name;
    return {
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

class Applications {
  /// The elements from this collection.
  final List<Application>? items;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  Applications({
    this.items,
    this.nextToken,
  });

  factory Applications.fromJson(Map<String, dynamic> json) {
    return Applications(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An extension that was invoked during a deployment.
class AppliedExtension {
  /// The system-generated ID for the association.
  final String? extensionAssociationId;

  /// The system-generated ID of the extension.
  final String? extensionId;

  /// One or more parameters for the actions called by the extension.
  final Map<String, String>? parameters;

  /// The extension version number.
  final int? versionNumber;

  AppliedExtension({
    this.extensionAssociationId,
    this.extensionId,
    this.parameters,
    this.versionNumber,
  });

  factory AppliedExtension.fromJson(Map<String, dynamic> json) {
    return AppliedExtension(
      extensionAssociationId: json['ExtensionAssociationId'] as String?,
      extensionId: json['ExtensionId'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final extensionAssociationId = this.extensionAssociationId;
    final extensionId = this.extensionId;
    final parameters = this.parameters;
    final versionNumber = this.versionNumber;
    return {
      if (extensionAssociationId != null)
        'ExtensionAssociationId': extensionAssociationId,
      if (extensionId != null) 'ExtensionId': extensionId,
      if (parameters != null) 'Parameters': parameters,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

class Configuration {
  /// The configuration version.
  final String? configurationVersion;

  /// The content of the configuration or the configuration data.
  /// <important>
  /// The <code>Content</code> attribute only contains data if the system finds
  /// new or updated configuration data. If there is no new or updated data and
  /// <code>ClientConfigurationVersion</code> matches the version of the current
  /// configuration, AppConfig returns a <code>204 No Content</code> HTTP response
  /// code and the <code>Content</code> value will be empty.
  /// </important>
  final Uint8List? content;

  /// A standard MIME type describing the format of the configuration content. For
  /// more information, see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.
  final String? contentType;

  Configuration({
    this.configurationVersion,
    this.content,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final configurationVersion = this.configurationVersion;
    final content = this.content;
    final contentType = this.contentType;
    return {
      if (content != null) 'Content': base64Encode(content),
    };
  }
}

class ConfigurationProfile {
  /// The application ID.
  final String? applicationId;

  /// The configuration profile description.
  final String? description;

  /// The configuration profile ID.
  final String? id;

  /// The Amazon Resource Name of the Key Management Service key to encrypt new
  /// configuration data versions in the AppConfig hosted configuration store.
  /// This attribute is only used for <code>hosted</code> configuration types. To
  /// encrypt data managed in other configuration stores, see the documentation
  /// for how to specify an KMS key for that particular service.
  final String? kmsKeyArn;

  /// The Key Management Service key identifier (key ID, key alias, or key ARN)
  /// provided when the resource was created or updated.
  final String? kmsKeyIdentifier;

  /// The URI location of the configuration.
  final String? locationUri;

  /// The name of the configuration profile.
  final String? name;

  /// The ARN of an IAM role with permission to access the configuration at the
  /// specified <code>LocationUri</code>.
  final String? retrievalRoleArn;

  /// The type of configurations contained in the profile. AppConfig supports
  /// <code>feature flags</code> and <code>freeform</code> configurations. We
  /// recommend you create feature flag configurations to enable or disable new
  /// features and freeform configurations to distribute configurations to an
  /// application. When calling this API, enter one of the following values for
  /// <code>Type</code>:
  ///
  /// <code>AWS.AppConfig.FeatureFlags</code>
  ///
  /// <code>AWS.Freeform</code>
  final String? type;

  /// A list of methods for validating the configuration.
  final List<Validator>? validators;

  ConfigurationProfile({
    this.applicationId,
    this.description,
    this.id,
    this.kmsKeyArn,
    this.kmsKeyIdentifier,
    this.locationUri,
    this.name,
    this.retrievalRoleArn,
    this.type,
    this.validators,
  });

  factory ConfigurationProfile.fromJson(Map<String, dynamic> json) {
    return ConfigurationProfile(
      applicationId: json['ApplicationId'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      kmsKeyIdentifier: json['KmsKeyIdentifier'] as String?,
      locationUri: json['LocationUri'] as String?,
      name: json['Name'] as String?,
      retrievalRoleArn: json['RetrievalRoleArn'] as String?,
      type: json['Type'] as String?,
      validators: (json['Validators'] as List?)
          ?.whereNotNull()
          .map((e) => Validator.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final description = this.description;
    final id = this.id;
    final kmsKeyArn = this.kmsKeyArn;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final locationUri = this.locationUri;
    final name = this.name;
    final retrievalRoleArn = this.retrievalRoleArn;
    final type = this.type;
    final validators = this.validators;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (locationUri != null) 'LocationUri': locationUri,
      if (name != null) 'Name': name,
      if (retrievalRoleArn != null) 'RetrievalRoleArn': retrievalRoleArn,
      if (type != null) 'Type': type,
      if (validators != null) 'Validators': validators,
    };
  }
}

/// A summary of a configuration profile.
class ConfigurationProfileSummary {
  /// The application ID.
  final String? applicationId;

  /// The ID of the configuration profile.
  final String? id;

  /// The URI location of the configuration.
  final String? locationUri;

  /// The name of the configuration profile.
  final String? name;

  /// The type of configurations contained in the profile. AppConfig supports
  /// <code>feature flags</code> and <code>freeform</code> configurations. We
  /// recommend you create feature flag configurations to enable or disable new
  /// features and freeform configurations to distribute configurations to an
  /// application. When calling this API, enter one of the following values for
  /// <code>Type</code>:
  ///
  /// <code>AWS.AppConfig.FeatureFlags</code>
  ///
  /// <code>AWS.Freeform</code>
  final String? type;

  /// The types of validators in the configuration profile.
  final List<ValidatorType>? validatorTypes;

  ConfigurationProfileSummary({
    this.applicationId,
    this.id,
    this.locationUri,
    this.name,
    this.type,
    this.validatorTypes,
  });

  factory ConfigurationProfileSummary.fromJson(Map<String, dynamic> json) {
    return ConfigurationProfileSummary(
      applicationId: json['ApplicationId'] as String?,
      id: json['Id'] as String?,
      locationUri: json['LocationUri'] as String?,
      name: json['Name'] as String?,
      type: json['Type'] as String?,
      validatorTypes: (json['ValidatorTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toValidatorType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final id = this.id;
    final locationUri = this.locationUri;
    final name = this.name;
    final type = this.type;
    final validatorTypes = this.validatorTypes;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (id != null) 'Id': id,
      if (locationUri != null) 'LocationUri': locationUri,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
      if (validatorTypes != null)
        'ValidatorTypes': validatorTypes.map((e) => e.toValue()).toList(),
    };
  }
}

class ConfigurationProfiles {
  /// The elements from this collection.
  final List<ConfigurationProfileSummary>? items;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  ConfigurationProfiles({
    this.items,
    this.nextToken,
  });

  factory ConfigurationProfiles.fromJson(Map<String, dynamic> json) {
    return ConfigurationProfiles(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConfigurationProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class Deployment {
  /// The ID of the application that was deployed.
  final String? applicationId;

  /// A list of extensions that were processed as part of the deployment. The
  /// extensions that were previously associated to the configuration profile,
  /// environment, or the application when <code>StartDeployment</code> was
  /// called.
  final List<AppliedExtension>? appliedExtensions;

  /// The time the deployment completed.
  final DateTime? completedAt;

  /// Information about the source location of the configuration.
  final String? configurationLocationUri;

  /// The name of the configuration.
  final String? configurationName;

  /// The ID of the configuration profile that was deployed.
  final String? configurationProfileId;

  /// The configuration version that was deployed.
  final String? configurationVersion;

  /// Total amount of time the deployment lasted.
  final int? deploymentDurationInMinutes;

  /// The sequence number of the deployment.
  final int? deploymentNumber;

  /// The ID of the deployment strategy that was deployed.
  final String? deploymentStrategyId;

  /// The description of the deployment.
  final String? description;

  /// The ID of the environment that was deployed.
  final String? environmentId;

  /// A list containing all events related to a deployment. The most recent events
  /// are displayed first.
  final List<DeploymentEvent>? eventLog;

  /// The amount of time that AppConfig monitored for alarms before considering
  /// the deployment to be complete and no longer eligible for automatic rollback.
  final int? finalBakeTimeInMinutes;

  /// The percentage of targets to receive a deployed configuration during each
  /// interval.
  final double? growthFactor;

  /// The algorithm used to define how percentage grew over time.
  final GrowthType? growthType;

  /// The Amazon Resource Name of the Key Management Service key used to encrypt
  /// configuration data. You can encrypt secrets stored in Secrets Manager,
  /// Amazon Simple Storage Service (Amazon S3) objects encrypted with SSE-KMS, or
  /// secure string parameters stored in Amazon Web Services Systems Manager
  /// Parameter Store.
  final String? kmsKeyArn;

  /// The Key Management Service key identifier (key ID, key alias, or key ARN)
  /// provided when the resource was created or updated.
  final String? kmsKeyIdentifier;

  /// The percentage of targets for which the deployment is available.
  final double? percentageComplete;

  /// The time the deployment started.
  final DateTime? startedAt;

  /// The state of the deployment.
  final DeploymentState? state;

  /// A user-defined label for an AppConfig hosted configuration version.
  final String? versionLabel;

  Deployment({
    this.applicationId,
    this.appliedExtensions,
    this.completedAt,
    this.configurationLocationUri,
    this.configurationName,
    this.configurationProfileId,
    this.configurationVersion,
    this.deploymentDurationInMinutes,
    this.deploymentNumber,
    this.deploymentStrategyId,
    this.description,
    this.environmentId,
    this.eventLog,
    this.finalBakeTimeInMinutes,
    this.growthFactor,
    this.growthType,
    this.kmsKeyArn,
    this.kmsKeyIdentifier,
    this.percentageComplete,
    this.startedAt,
    this.state,
    this.versionLabel,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      applicationId: json['ApplicationId'] as String?,
      appliedExtensions: (json['AppliedExtensions'] as List?)
          ?.whereNotNull()
          .map((e) => AppliedExtension.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedAt: timeStampFromJson(json['CompletedAt']),
      configurationLocationUri: json['ConfigurationLocationUri'] as String?,
      configurationName: json['ConfigurationName'] as String?,
      configurationProfileId: json['ConfigurationProfileId'] as String?,
      configurationVersion: json['ConfigurationVersion'] as String?,
      deploymentDurationInMinutes: json['DeploymentDurationInMinutes'] as int?,
      deploymentNumber: json['DeploymentNumber'] as int?,
      deploymentStrategyId: json['DeploymentStrategyId'] as String?,
      description: json['Description'] as String?,
      environmentId: json['EnvironmentId'] as String?,
      eventLog: (json['EventLog'] as List?)
          ?.whereNotNull()
          .map((e) => DeploymentEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      finalBakeTimeInMinutes: json['FinalBakeTimeInMinutes'] as int?,
      growthFactor: json['GrowthFactor'] as double?,
      growthType: (json['GrowthType'] as String?)?.toGrowthType(),
      kmsKeyArn: json['KmsKeyArn'] as String?,
      kmsKeyIdentifier: json['KmsKeyIdentifier'] as String?,
      percentageComplete: json['PercentageComplete'] as double?,
      startedAt: timeStampFromJson(json['StartedAt']),
      state: (json['State'] as String?)?.toDeploymentState(),
      versionLabel: json['VersionLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final appliedExtensions = this.appliedExtensions;
    final completedAt = this.completedAt;
    final configurationLocationUri = this.configurationLocationUri;
    final configurationName = this.configurationName;
    final configurationProfileId = this.configurationProfileId;
    final configurationVersion = this.configurationVersion;
    final deploymentDurationInMinutes = this.deploymentDurationInMinutes;
    final deploymentNumber = this.deploymentNumber;
    final deploymentStrategyId = this.deploymentStrategyId;
    final description = this.description;
    final environmentId = this.environmentId;
    final eventLog = this.eventLog;
    final finalBakeTimeInMinutes = this.finalBakeTimeInMinutes;
    final growthFactor = this.growthFactor;
    final growthType = this.growthType;
    final kmsKeyArn = this.kmsKeyArn;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final percentageComplete = this.percentageComplete;
    final startedAt = this.startedAt;
    final state = this.state;
    final versionLabel = this.versionLabel;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (appliedExtensions != null) 'AppliedExtensions': appliedExtensions,
      if (completedAt != null) 'CompletedAt': iso8601ToJson(completedAt),
      if (configurationLocationUri != null)
        'ConfigurationLocationUri': configurationLocationUri,
      if (configurationName != null) 'ConfigurationName': configurationName,
      if (configurationProfileId != null)
        'ConfigurationProfileId': configurationProfileId,
      if (configurationVersion != null)
        'ConfigurationVersion': configurationVersion,
      if (deploymentDurationInMinutes != null)
        'DeploymentDurationInMinutes': deploymentDurationInMinutes,
      if (deploymentNumber != null) 'DeploymentNumber': deploymentNumber,
      if (deploymentStrategyId != null)
        'DeploymentStrategyId': deploymentStrategyId,
      if (description != null) 'Description': description,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (eventLog != null) 'EventLog': eventLog,
      if (finalBakeTimeInMinutes != null)
        'FinalBakeTimeInMinutes': finalBakeTimeInMinutes,
      if (growthFactor != null) 'GrowthFactor': growthFactor,
      if (growthType != null) 'GrowthType': growthType.toValue(),
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (percentageComplete != null) 'PercentageComplete': percentageComplete,
      if (startedAt != null) 'StartedAt': iso8601ToJson(startedAt),
      if (state != null) 'State': state.toValue(),
      if (versionLabel != null) 'VersionLabel': versionLabel,
    };
  }
}

/// An object that describes a deployment event.
class DeploymentEvent {
  /// The list of extensions that were invoked as part of the deployment.
  final List<ActionInvocation>? actionInvocations;

  /// A description of the deployment event. Descriptions include, but are not
  /// limited to, the following:
  ///
  /// <ul>
  /// <li>
  /// The Amazon Web Services account or the Amazon CloudWatch alarm ARN that
  /// initiated a rollback.
  /// </li>
  /// <li>
  /// The percentage of hosts that received the deployment.
  /// </li>
  /// <li>
  /// A recommendation to attempt a new deployment (in the case of an internal
  /// error).
  /// </li>
  /// </ul>
  final String? description;

  /// The type of deployment event. Deployment event types include the start,
  /// stop, or completion of a deployment; a percentage update; the start or stop
  /// of a bake period; and the start or completion of a rollback.
  final DeploymentEventType? eventType;

  /// The date and time the event occurred.
  final DateTime? occurredAt;

  /// The entity that triggered the deployment event. Events can be triggered by a
  /// user, AppConfig, an Amazon CloudWatch alarm, or an internal error.
  final TriggeredBy? triggeredBy;

  DeploymentEvent({
    this.actionInvocations,
    this.description,
    this.eventType,
    this.occurredAt,
    this.triggeredBy,
  });

  factory DeploymentEvent.fromJson(Map<String, dynamic> json) {
    return DeploymentEvent(
      actionInvocations: (json['ActionInvocations'] as List?)
          ?.whereNotNull()
          .map((e) => ActionInvocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      eventType: (json['EventType'] as String?)?.toDeploymentEventType(),
      occurredAt: timeStampFromJson(json['OccurredAt']),
      triggeredBy: (json['TriggeredBy'] as String?)?.toTriggeredBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionInvocations = this.actionInvocations;
    final description = this.description;
    final eventType = this.eventType;
    final occurredAt = this.occurredAt;
    final triggeredBy = this.triggeredBy;
    return {
      if (actionInvocations != null) 'ActionInvocations': actionInvocations,
      if (description != null) 'Description': description,
      if (eventType != null) 'EventType': eventType.toValue(),
      if (occurredAt != null) 'OccurredAt': iso8601ToJson(occurredAt),
      if (triggeredBy != null) 'TriggeredBy': triggeredBy.toValue(),
    };
  }
}

enum DeploymentEventType {
  percentageUpdated,
  rollbackStarted,
  rollbackCompleted,
  bakeTimeStarted,
  deploymentStarted,
  deploymentCompleted,
}

extension DeploymentEventTypeValueExtension on DeploymentEventType {
  String toValue() {
    switch (this) {
      case DeploymentEventType.percentageUpdated:
        return 'PERCENTAGE_UPDATED';
      case DeploymentEventType.rollbackStarted:
        return 'ROLLBACK_STARTED';
      case DeploymentEventType.rollbackCompleted:
        return 'ROLLBACK_COMPLETED';
      case DeploymentEventType.bakeTimeStarted:
        return 'BAKE_TIME_STARTED';
      case DeploymentEventType.deploymentStarted:
        return 'DEPLOYMENT_STARTED';
      case DeploymentEventType.deploymentCompleted:
        return 'DEPLOYMENT_COMPLETED';
    }
  }
}

extension DeploymentEventTypeFromString on String {
  DeploymentEventType toDeploymentEventType() {
    switch (this) {
      case 'PERCENTAGE_UPDATED':
        return DeploymentEventType.percentageUpdated;
      case 'ROLLBACK_STARTED':
        return DeploymentEventType.rollbackStarted;
      case 'ROLLBACK_COMPLETED':
        return DeploymentEventType.rollbackCompleted;
      case 'BAKE_TIME_STARTED':
        return DeploymentEventType.bakeTimeStarted;
      case 'DEPLOYMENT_STARTED':
        return DeploymentEventType.deploymentStarted;
      case 'DEPLOYMENT_COMPLETED':
        return DeploymentEventType.deploymentCompleted;
    }
    throw Exception('$this is not known in enum DeploymentEventType');
  }
}

enum DeploymentState {
  baking,
  validating,
  deploying,
  complete,
  rollingBack,
  rolledBack,
}

extension DeploymentStateValueExtension on DeploymentState {
  String toValue() {
    switch (this) {
      case DeploymentState.baking:
        return 'BAKING';
      case DeploymentState.validating:
        return 'VALIDATING';
      case DeploymentState.deploying:
        return 'DEPLOYING';
      case DeploymentState.complete:
        return 'COMPLETE';
      case DeploymentState.rollingBack:
        return 'ROLLING_BACK';
      case DeploymentState.rolledBack:
        return 'ROLLED_BACK';
    }
  }
}

extension DeploymentStateFromString on String {
  DeploymentState toDeploymentState() {
    switch (this) {
      case 'BAKING':
        return DeploymentState.baking;
      case 'VALIDATING':
        return DeploymentState.validating;
      case 'DEPLOYING':
        return DeploymentState.deploying;
      case 'COMPLETE':
        return DeploymentState.complete;
      case 'ROLLING_BACK':
        return DeploymentState.rollingBack;
      case 'ROLLED_BACK':
        return DeploymentState.rolledBack;
    }
    throw Exception('$this is not known in enum DeploymentState');
  }
}

class DeploymentStrategies {
  /// The elements from this collection.
  final List<DeploymentStrategy>? items;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  DeploymentStrategies({
    this.items,
    this.nextToken,
  });

  factory DeploymentStrategies.fromJson(Map<String, dynamic> json) {
    return DeploymentStrategies(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => DeploymentStrategy.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DeploymentStrategy {
  /// Total amount of time the deployment lasted.
  final int? deploymentDurationInMinutes;

  /// The description of the deployment strategy.
  final String? description;

  /// The amount of time that AppConfig monitored for alarms before considering
  /// the deployment to be complete and no longer eligible for automatic rollback.
  final int? finalBakeTimeInMinutes;

  /// The percentage of targets that received a deployed configuration during each
  /// interval.
  final double? growthFactor;

  /// The algorithm used to define how percentage grew over time.
  final GrowthType? growthType;

  /// The deployment strategy ID.
  final String? id;

  /// The name of the deployment strategy.
  final String? name;

  /// Save the deployment strategy to a Systems Manager (SSM) document.
  final ReplicateTo? replicateTo;

  DeploymentStrategy({
    this.deploymentDurationInMinutes,
    this.description,
    this.finalBakeTimeInMinutes,
    this.growthFactor,
    this.growthType,
    this.id,
    this.name,
    this.replicateTo,
  });

  factory DeploymentStrategy.fromJson(Map<String, dynamic> json) {
    return DeploymentStrategy(
      deploymentDurationInMinutes: json['DeploymentDurationInMinutes'] as int?,
      description: json['Description'] as String?,
      finalBakeTimeInMinutes: json['FinalBakeTimeInMinutes'] as int?,
      growthFactor: json['GrowthFactor'] as double?,
      growthType: (json['GrowthType'] as String?)?.toGrowthType(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      replicateTo: (json['ReplicateTo'] as String?)?.toReplicateTo(),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentDurationInMinutes = this.deploymentDurationInMinutes;
    final description = this.description;
    final finalBakeTimeInMinutes = this.finalBakeTimeInMinutes;
    final growthFactor = this.growthFactor;
    final growthType = this.growthType;
    final id = this.id;
    final name = this.name;
    final replicateTo = this.replicateTo;
    return {
      if (deploymentDurationInMinutes != null)
        'DeploymentDurationInMinutes': deploymentDurationInMinutes,
      if (description != null) 'Description': description,
      if (finalBakeTimeInMinutes != null)
        'FinalBakeTimeInMinutes': finalBakeTimeInMinutes,
      if (growthFactor != null) 'GrowthFactor': growthFactor,
      if (growthType != null) 'GrowthType': growthType.toValue(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (replicateTo != null) 'ReplicateTo': replicateTo.toValue(),
    };
  }
}

/// Information about the deployment.
class DeploymentSummary {
  /// Time the deployment completed.
  final DateTime? completedAt;

  /// The name of the configuration.
  final String? configurationName;

  /// The version of the configuration.
  final String? configurationVersion;

  /// Total amount of time the deployment lasted.
  final int? deploymentDurationInMinutes;

  /// The sequence number of the deployment.
  final int? deploymentNumber;

  /// The amount of time that AppConfig monitors for alarms before considering the
  /// deployment to be complete and no longer eligible for automatic rollback.
  final int? finalBakeTimeInMinutes;

  /// The percentage of targets to receive a deployed configuration during each
  /// interval.
  final double? growthFactor;

  /// The algorithm used to define how percentage grows over time.
  final GrowthType? growthType;

  /// The percentage of targets for which the deployment is available.
  final double? percentageComplete;

  /// Time the deployment started.
  final DateTime? startedAt;

  /// The state of the deployment.
  final DeploymentState? state;

  /// A user-defined label for an AppConfig hosted configuration version.
  final String? versionLabel;

  DeploymentSummary({
    this.completedAt,
    this.configurationName,
    this.configurationVersion,
    this.deploymentDurationInMinutes,
    this.deploymentNumber,
    this.finalBakeTimeInMinutes,
    this.growthFactor,
    this.growthType,
    this.percentageComplete,
    this.startedAt,
    this.state,
    this.versionLabel,
  });

  factory DeploymentSummary.fromJson(Map<String, dynamic> json) {
    return DeploymentSummary(
      completedAt: timeStampFromJson(json['CompletedAt']),
      configurationName: json['ConfigurationName'] as String?,
      configurationVersion: json['ConfigurationVersion'] as String?,
      deploymentDurationInMinutes: json['DeploymentDurationInMinutes'] as int?,
      deploymentNumber: json['DeploymentNumber'] as int?,
      finalBakeTimeInMinutes: json['FinalBakeTimeInMinutes'] as int?,
      growthFactor: json['GrowthFactor'] as double?,
      growthType: (json['GrowthType'] as String?)?.toGrowthType(),
      percentageComplete: json['PercentageComplete'] as double?,
      startedAt: timeStampFromJson(json['StartedAt']),
      state: (json['State'] as String?)?.toDeploymentState(),
      versionLabel: json['VersionLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completedAt = this.completedAt;
    final configurationName = this.configurationName;
    final configurationVersion = this.configurationVersion;
    final deploymentDurationInMinutes = this.deploymentDurationInMinutes;
    final deploymentNumber = this.deploymentNumber;
    final finalBakeTimeInMinutes = this.finalBakeTimeInMinutes;
    final growthFactor = this.growthFactor;
    final growthType = this.growthType;
    final percentageComplete = this.percentageComplete;
    final startedAt = this.startedAt;
    final state = this.state;
    final versionLabel = this.versionLabel;
    return {
      if (completedAt != null) 'CompletedAt': iso8601ToJson(completedAt),
      if (configurationName != null) 'ConfigurationName': configurationName,
      if (configurationVersion != null)
        'ConfigurationVersion': configurationVersion,
      if (deploymentDurationInMinutes != null)
        'DeploymentDurationInMinutes': deploymentDurationInMinutes,
      if (deploymentNumber != null) 'DeploymentNumber': deploymentNumber,
      if (finalBakeTimeInMinutes != null)
        'FinalBakeTimeInMinutes': finalBakeTimeInMinutes,
      if (growthFactor != null) 'GrowthFactor': growthFactor,
      if (growthType != null) 'GrowthType': growthType.toValue(),
      if (percentageComplete != null) 'PercentageComplete': percentageComplete,
      if (startedAt != null) 'StartedAt': iso8601ToJson(startedAt),
      if (state != null) 'State': state.toValue(),
      if (versionLabel != null) 'VersionLabel': versionLabel,
    };
  }
}

class Deployments {
  /// The elements from this collection.
  final List<DeploymentSummary>? items;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  Deployments({
    this.items,
    this.nextToken,
  });

  factory Deployments.fromJson(Map<String, dynamic> json) {
    return Deployments(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => DeploymentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class Environment {
  /// The application ID.
  final String? applicationId;

  /// The description of the environment.
  final String? description;

  /// The environment ID.
  final String? id;

  /// Amazon CloudWatch alarms monitored during the deployment.
  final List<Monitor>? monitors;

  /// The name of the environment.
  final String? name;

  /// The state of the environment. An environment can be in one of the following
  /// states: <code>READY_FOR_DEPLOYMENT</code>, <code>DEPLOYING</code>,
  /// <code>ROLLING_BACK</code>, or <code>ROLLED_BACK</code>
  final EnvironmentState? state;

  Environment({
    this.applicationId,
    this.description,
    this.id,
    this.monitors,
    this.name,
    this.state,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      applicationId: json['ApplicationId'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      monitors: (json['Monitors'] as List?)
          ?.whereNotNull()
          .map((e) => Monitor.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toEnvironmentState(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final description = this.description;
    final id = this.id;
    final monitors = this.monitors;
    final name = this.name;
    final state = this.state;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (monitors != null) 'Monitors': monitors,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum EnvironmentState {
  readyForDeployment,
  deploying,
  rollingBack,
  rolledBack,
}

extension EnvironmentStateValueExtension on EnvironmentState {
  String toValue() {
    switch (this) {
      case EnvironmentState.readyForDeployment:
        return 'READY_FOR_DEPLOYMENT';
      case EnvironmentState.deploying:
        return 'DEPLOYING';
      case EnvironmentState.rollingBack:
        return 'ROLLING_BACK';
      case EnvironmentState.rolledBack:
        return 'ROLLED_BACK';
    }
  }
}

extension EnvironmentStateFromString on String {
  EnvironmentState toEnvironmentState() {
    switch (this) {
      case 'READY_FOR_DEPLOYMENT':
        return EnvironmentState.readyForDeployment;
      case 'DEPLOYING':
        return EnvironmentState.deploying;
      case 'ROLLING_BACK':
        return EnvironmentState.rollingBack;
      case 'ROLLED_BACK':
        return EnvironmentState.rolledBack;
    }
    throw Exception('$this is not known in enum EnvironmentState');
  }
}

class Environments {
  /// The elements from this collection.
  final List<Environment>? items;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  Environments({
    this.items,
    this.nextToken,
  });

  factory Environments.fromJson(Map<String, dynamic> json) {
    return Environments(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => Environment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class Extension {
  /// The actions defined in the extension.
  final Map<ActionPoint, List<Action>>? actions;

  /// The system-generated Amazon Resource Name (ARN) for the extension.
  final String? arn;

  /// Information about the extension.
  final String? description;

  /// The system-generated ID of the extension.
  final String? id;

  /// The extension name.
  final String? name;

  /// The parameters accepted by the extension. You specify parameter values when
  /// you associate the extension to an AppConfig resource by using the
  /// <code>CreateExtensionAssociation</code> API action. For Lambda extension
  /// actions, these parameters are included in the Lambda request object.
  final Map<String, Parameter>? parameters;

  /// The extension version number.
  final int? versionNumber;

  Extension({
    this.actions,
    this.arn,
    this.description,
    this.id,
    this.name,
    this.parameters,
    this.versionNumber,
  });

  factory Extension.fromJson(Map<String, dynamic> json) {
    return Extension(
      actions: (json['Actions'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k.toActionPoint(),
              (e as List)
                  .whereNotNull()
                  .map((e) => Action.fromJson(e as Map<String, dynamic>))
                  .toList())),
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Parameter.fromJson(e as Map<String, dynamic>))),
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final parameters = this.parameters;
    final versionNumber = this.versionNumber;
    return {
      if (actions != null)
        'Actions': actions.map((k, e) => MapEntry(k.toValue(), e)),
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (parameters != null) 'Parameters': parameters,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

class ExtensionAssociation {
  /// The system-generated Amazon Resource Name (ARN) for the extension.
  final String? arn;

  /// The ARN of the extension defined in the association.
  final String? extensionArn;

  /// The version number for the extension defined in the association.
  final int? extensionVersionNumber;

  /// The system-generated ID for the association.
  final String? id;

  /// The parameter names and values defined in the association.
  final Map<String, String>? parameters;

  /// The ARNs of applications, configuration profiles, or environments defined in
  /// the association.
  final String? resourceArn;

  ExtensionAssociation({
    this.arn,
    this.extensionArn,
    this.extensionVersionNumber,
    this.id,
    this.parameters,
    this.resourceArn,
  });

  factory ExtensionAssociation.fromJson(Map<String, dynamic> json) {
    return ExtensionAssociation(
      arn: json['Arn'] as String?,
      extensionArn: json['ExtensionArn'] as String?,
      extensionVersionNumber: json['ExtensionVersionNumber'] as int?,
      id: json['Id'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final extensionArn = this.extensionArn;
    final extensionVersionNumber = this.extensionVersionNumber;
    final id = this.id;
    final parameters = this.parameters;
    final resourceArn = this.resourceArn;
    return {
      if (arn != null) 'Arn': arn,
      if (extensionArn != null) 'ExtensionArn': extensionArn,
      if (extensionVersionNumber != null)
        'ExtensionVersionNumber': extensionVersionNumber,
      if (id != null) 'Id': id,
      if (parameters != null) 'Parameters': parameters,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

/// Information about an association between an extension and an AppConfig
/// resource such as an application, environment, or configuration profile. Call
/// <code>GetExtensionAssociation</code> to get more information about an
/// association.
class ExtensionAssociationSummary {
  /// The system-generated Amazon Resource Name (ARN) for the extension.
  final String? extensionArn;

  /// The extension association ID. This ID is used to call other
  /// <code>ExtensionAssociation</code> API actions such as
  /// <code>GetExtensionAssociation</code> or
  /// <code>DeleteExtensionAssociation</code>.
  final String? id;

  /// The ARNs of applications, configuration profiles, or environments defined in
  /// the association.
  final String? resourceArn;

  ExtensionAssociationSummary({
    this.extensionArn,
    this.id,
    this.resourceArn,
  });

  factory ExtensionAssociationSummary.fromJson(Map<String, dynamic> json) {
    return ExtensionAssociationSummary(
      extensionArn: json['ExtensionArn'] as String?,
      id: json['Id'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final extensionArn = this.extensionArn;
    final id = this.id;
    final resourceArn = this.resourceArn;
    return {
      if (extensionArn != null) 'ExtensionArn': extensionArn,
      if (id != null) 'Id': id,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

class ExtensionAssociations {
  /// The list of extension associations. Each item represents an extension
  /// association to an application, environment, or configuration profile.
  final List<ExtensionAssociationSummary>? items;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  ExtensionAssociations({
    this.items,
    this.nextToken,
  });

  factory ExtensionAssociations.fromJson(Map<String, dynamic> json) {
    return ExtensionAssociations(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ExtensionAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Information about an extension. Call <code>GetExtension</code> to get more
/// information about an extension.
class ExtensionSummary {
  /// The system-generated Amazon Resource Name (ARN) for the extension.
  final String? arn;

  /// Information about the extension.
  final String? description;

  /// The system-generated ID of the extension.
  final String? id;

  /// The extension name.
  final String? name;

  /// The extension version number.
  final int? versionNumber;

  ExtensionSummary({
    this.arn,
    this.description,
    this.id,
    this.name,
    this.versionNumber,
  });

  factory ExtensionSummary.fromJson(Map<String, dynamic> json) {
    return ExtensionSummary(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final versionNumber = this.versionNumber;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

class Extensions {
  /// The list of available extensions. The list includes Amazon Web Services
  /// authored and user-created extensions.
  final List<ExtensionSummary>? items;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  Extensions({
    this.items,
    this.nextToken,
  });

  factory Extensions.fromJson(Map<String, dynamic> json) {
    return Extensions(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => ExtensionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum GrowthType {
  linear,
  exponential,
}

extension GrowthTypeValueExtension on GrowthType {
  String toValue() {
    switch (this) {
      case GrowthType.linear:
        return 'LINEAR';
      case GrowthType.exponential:
        return 'EXPONENTIAL';
    }
  }
}

extension GrowthTypeFromString on String {
  GrowthType toGrowthType() {
    switch (this) {
      case 'LINEAR':
        return GrowthType.linear;
      case 'EXPONENTIAL':
        return GrowthType.exponential;
    }
    throw Exception('$this is not known in enum GrowthType');
  }
}

class HostedConfigurationVersion {
  /// The application ID.
  final String? applicationId;

  /// The configuration profile ID.
  final String? configurationProfileId;

  /// The content of the configuration or the configuration data.
  final Uint8List? content;

  /// A standard MIME type describing the format of the configuration content. For
  /// more information, see <a
  /// href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.
  final String? contentType;

  /// A description of the configuration.
  final String? description;

  /// The Amazon Resource Name of the Key Management Service key that was used to
  /// encrypt this specific version of the configuration data in the AppConfig
  /// hosted configuration store.
  final String? kmsKeyArn;

  /// A user-defined label for an AppConfig hosted configuration version.
  final String? versionLabel;

  /// The configuration version.
  final int? versionNumber;

  HostedConfigurationVersion({
    this.applicationId,
    this.configurationProfileId,
    this.content,
    this.contentType,
    this.description,
    this.kmsKeyArn,
    this.versionLabel,
    this.versionNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final configurationProfileId = this.configurationProfileId;
    final content = this.content;
    final contentType = this.contentType;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    final versionLabel = this.versionLabel;
    final versionNumber = this.versionNumber;
    return {
      if (content != null) 'Content': base64Encode(content),
    };
  }
}

/// Information about the configuration.
class HostedConfigurationVersionSummary {
  /// The application ID.
  final String? applicationId;

  /// The configuration profile ID.
  final String? configurationProfileId;

  /// A standard MIME type describing the format of the configuration content. For
  /// more information, see <a
  /// href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.
  final String? contentType;

  /// A description of the configuration.
  final String? description;

  /// The Amazon Resource Name of the Key Management Service key that was used to
  /// encrypt this specific version of the configuration data in the AppConfig
  /// hosted configuration store.
  final String? kmsKeyArn;

  /// A user-defined label for an AppConfig hosted configuration version.
  final String? versionLabel;

  /// The configuration version.
  final int? versionNumber;

  HostedConfigurationVersionSummary({
    this.applicationId,
    this.configurationProfileId,
    this.contentType,
    this.description,
    this.kmsKeyArn,
    this.versionLabel,
    this.versionNumber,
  });

  factory HostedConfigurationVersionSummary.fromJson(
      Map<String, dynamic> json) {
    return HostedConfigurationVersionSummary(
      applicationId: json['ApplicationId'] as String?,
      configurationProfileId: json['ConfigurationProfileId'] as String?,
      contentType: json['ContentType'] as String?,
      description: json['Description'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      versionLabel: json['VersionLabel'] as String?,
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final configurationProfileId = this.configurationProfileId;
    final contentType = this.contentType;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    final versionLabel = this.versionLabel;
    final versionNumber = this.versionNumber;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (configurationProfileId != null)
        'ConfigurationProfileId': configurationProfileId,
      if (contentType != null) 'ContentType': contentType,
      if (description != null) 'Description': description,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (versionLabel != null) 'VersionLabel': versionLabel,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

class HostedConfigurationVersions {
  /// The elements from this collection.
  final List<HostedConfigurationVersionSummary>? items;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  HostedConfigurationVersions({
    this.items,
    this.nextToken,
  });

  factory HostedConfigurationVersions.fromJson(Map<String, dynamic> json) {
    return HostedConfigurationVersions(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => HostedConfigurationVersionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Amazon CloudWatch alarms to monitor during the deployment process.
class Monitor {
  /// Amazon Resource Name (ARN) of the Amazon CloudWatch alarm.
  final String alarmArn;

  /// ARN of an Identity and Access Management (IAM) role for AppConfig to monitor
  /// <code>AlarmArn</code>.
  final String? alarmRoleArn;

  Monitor({
    required this.alarmArn,
    this.alarmRoleArn,
  });

  factory Monitor.fromJson(Map<String, dynamic> json) {
    return Monitor(
      alarmArn: json['AlarmArn'] as String,
      alarmRoleArn: json['AlarmRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmArn = this.alarmArn;
    final alarmRoleArn = this.alarmRoleArn;
    return {
      'AlarmArn': alarmArn,
      if (alarmRoleArn != null) 'AlarmRoleArn': alarmRoleArn,
    };
  }
}

/// A value such as an Amazon Resource Name (ARN) or an Amazon Simple
/// Notification Service topic entered in an extension when invoked. Parameter
/// values are specified in an extension association. For more information about
/// extensions, see <a
/// href="https://docs.aws.amazon.com/appconfig/latest/userguide/working-with-appconfig-extensions.html">Extending
/// workflows</a> in the <i>AppConfig User Guide</i>.
class Parameter {
  /// Information about the parameter.
  final String? description;

  /// Indicates whether this parameter's value can be supplied at the extension's
  /// action point instead of during extension association. Dynamic parameters
  /// can't be marked <code>Required</code>.
  final bool? dynamicValue;

  /// A parameter value must be specified in the extension association.
  final bool? required;

  Parameter({
    this.description,
    this.dynamicValue,
    this.required,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(
      description: json['Description'] as String?,
      dynamicValue: json['Dynamic'] as bool?,
      required: json['Required'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final dynamicValue = this.dynamicValue;
    final required = this.required;
    return {
      if (description != null) 'Description': description,
      if (dynamicValue != null) 'Dynamic': dynamicValue,
      if (required != null) 'Required': required,
    };
  }
}

enum ReplicateTo {
  none,
  ssmDocument,
}

extension ReplicateToValueExtension on ReplicateTo {
  String toValue() {
    switch (this) {
      case ReplicateTo.none:
        return 'NONE';
      case ReplicateTo.ssmDocument:
        return 'SSM_DOCUMENT';
    }
  }
}

extension ReplicateToFromString on String {
  ReplicateTo toReplicateTo() {
    switch (this) {
      case 'NONE':
        return ReplicateTo.none;
      case 'SSM_DOCUMENT':
        return ReplicateTo.ssmDocument;
    }
    throw Exception('$this is not known in enum ReplicateTo');
  }
}

class ResourceTags {
  /// Metadata to assign to AppConfig resources. Tags help organize and categorize
  /// your AppConfig resources. Each tag consists of a key and an optional value,
  /// both of which you define.
  final Map<String, String>? tags;

  ResourceTags({
    this.tags,
  });

  factory ResourceTags.fromJson(Map<String, dynamic> json) {
    return ResourceTags(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum TriggeredBy {
  user,
  appconfig,
  cloudwatchAlarm,
  internalError,
}

extension TriggeredByValueExtension on TriggeredBy {
  String toValue() {
    switch (this) {
      case TriggeredBy.user:
        return 'USER';
      case TriggeredBy.appconfig:
        return 'APPCONFIG';
      case TriggeredBy.cloudwatchAlarm:
        return 'CLOUDWATCH_ALARM';
      case TriggeredBy.internalError:
        return 'INTERNAL_ERROR';
    }
  }
}

extension TriggeredByFromString on String {
  TriggeredBy toTriggeredBy() {
    switch (this) {
      case 'USER':
        return TriggeredBy.user;
      case 'APPCONFIG':
        return TriggeredBy.appconfig;
      case 'CLOUDWATCH_ALARM':
        return TriggeredBy.cloudwatchAlarm;
      case 'INTERNAL_ERROR':
        return TriggeredBy.internalError;
    }
    throw Exception('$this is not known in enum TriggeredBy');
  }
}

/// A validator provides a syntactic or semantic check to ensure the
/// configuration that you want to deploy functions as intended. To validate
/// your application configuration data, you provide a schema or an Amazon Web
/// Services Lambda function that runs against the configuration. The
/// configuration deployment or update can only proceed when the configuration
/// data is valid.
class Validator {
  /// Either the JSON Schema content or the Amazon Resource Name (ARN) of an
  /// Lambda function.
  final String content;

  /// AppConfig supports validators of type <code>JSON_SCHEMA</code> and
  /// <code>LAMBDA</code>
  final ValidatorType type;

  Validator({
    required this.content,
    required this.type,
  });

  factory Validator.fromJson(Map<String, dynamic> json) {
    return Validator(
      content: json['Content'] as String,
      type: (json['Type'] as String).toValidatorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final type = this.type;
    return {
      'Content': content,
      'Type': type.toValue(),
    };
  }
}

enum ValidatorType {
  jsonSchema,
  lambda,
}

extension ValidatorTypeValueExtension on ValidatorType {
  String toValue() {
    switch (this) {
      case ValidatorType.jsonSchema:
        return 'JSON_SCHEMA';
      case ValidatorType.lambda:
        return 'LAMBDA';
    }
  }
}

extension ValidatorTypeFromString on String {
  ValidatorType toValidatorType() {
    switch (this) {
      case 'JSON_SCHEMA':
        return ValidatorType.jsonSchema;
      case 'LAMBDA':
        return ValidatorType.lambda;
    }
    throw Exception('$this is not known in enum ValidatorType');
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class PayloadTooLargeException extends _s.GenericAwsException {
  PayloadTooLargeException({String? type, String? message})
      : super(type: type, code: 'PayloadTooLargeException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'PayloadTooLargeException': (type, message) =>
      PayloadTooLargeException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
};
