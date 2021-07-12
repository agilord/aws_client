// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Use AWS AppConfig, a capability of AWS Systems Manager, to create, manage,
/// and quickly deploy application configurations. AppConfig supports controlled
/// deployments to applications of any size and includes built-in validation
/// checks and monitoring. You can use AppConfig with applications hosted on
/// Amazon EC2 instances, AWS Lambda, containers, mobile applications, or IoT
/// devices.
class AppConfig {
  final _s.RestJsonProtocol _protocol;
  AppConfig({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// An application in AppConfig is a logical unit of code that provides
  /// capabilities for your customers. For example, an application can be a
  /// microservice that runs on Amazon EC2 instances, a mobile application
  /// installed by your users, a serverless application using Amazon API Gateway
  /// and AWS Lambda, or any system you run on behalf of others.
  ///
  /// May throw [BadRequestException].
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
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

  /// Information that enables AppConfig to access the configuration source.
  /// Valid configuration sources include Systems Manager (SSM) documents, SSM
  /// Parameter Store parameters, and Amazon S3 objects. A configuration profile
  /// includes the following information.
  ///
  /// <ul>
  /// <li>
  /// The Uri location of the configuration data.
  /// </li>
  /// <li>
  /// The AWS Identity and Access Management (IAM) role that provides access to
  /// the configuration data.
  /// </li>
  /// <li>
  /// A validator for the configuration data. Available validators include
  /// either a JSON Schema or an AWS Lambda function.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-creating-configuration-and-profile.html">Create
  /// a Configuration and a Configuration Profile</a> in the <i>AWS AppConfig
  /// User Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application ID.
  ///
  /// Parameter [locationUri] :
  /// A URI to locate the configuration. You can specify a Systems Manager (SSM)
  /// document, an SSM Parameter Store parameter, or an Amazon S3 object. For an
  /// SSM document, specify either the document name in the format
  /// <code>ssm-document://&lt;Document_name&gt;</code> or the Amazon Resource
  /// Name (ARN). For a parameter, specify either the parameter name in the
  /// format <code>ssm-parameter://&lt;Parameter_name&gt;</code> or the ARN. For
  /// an Amazon S3 object, specify the URI in the following format:
  /// <code>s3://&lt;bucket&gt;/&lt;objectKey&gt; </code>. Here is an example:
  /// s3://my-bucket/my-app/us-east-1/my-config.json
  ///
  /// Parameter [name] :
  /// A name for the configuration profile.
  ///
  /// Parameter [description] :
  /// A description of the configuration profile.
  ///
  /// Parameter [retrievalRoleArn] :
  /// The ARN of an IAM role with permission to access the configuration at the
  /// specified LocationUri.
  ///
  /// Parameter [tags] :
  /// Metadata to assign to the configuration profile. Tags help organize and
  /// categorize your AppConfig resources. Each tag consists of a key and an
  /// optional value, both of which you define.
  ///
  /// Parameter [validators] :
  /// A list of methods for validating the configuration.
  Future<ConfigurationProfile> createConfigurationProfile({
    required String applicationId,
    required String locationUri,
    required String name,
    String? description,
    String? retrievalRoleArn,
    Map<String, String>? tags,
    List<Validator>? validators,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(locationUri, 'locationUri');
    _s.validateStringLength(
      'locationUri',
      locationUri,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringLength(
      'retrievalRoleArn',
      retrievalRoleArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      'LocationUri': locationUri,
      'Name': name,
      if (description != null) 'Description': description,
      if (retrievalRoleArn != null) 'RetrievalRoleArn': retrievalRoleArn,
      if (tags != null) 'Tags': tags,
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

  /// A deployment strategy defines important criteria for rolling out your
  /// configuration to the designated targets. A deployment strategy includes:
  /// the overall duration required, a percentage of targets to receive the
  /// deployment during each interval, an algorithm that defines how percentage
  /// grows, and bake time.
  ///
  /// May throw [InternalServerException].
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
  /// Parameter [replicateTo] :
  /// Save the deployment strategy to a Systems Manager (SSM) document.
  ///
  /// Parameter [description] :
  /// A description of the deployment strategy.
  ///
  /// Parameter [finalBakeTimeInMinutes] :
  /// The amount of time AppConfig monitors for alarms before considering the
  /// deployment to be complete and no longer eligible for automatic roll back.
  ///
  /// Parameter [growthType] :
  /// The algorithm used to define how percentage grows over time. AWS AppConfig
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
  /// Parameter [tags] :
  /// Metadata to assign to the deployment strategy. Tags help organize and
  /// categorize your AppConfig resources. Each tag consists of a key and an
  /// optional value, both of which you define.
  Future<DeploymentStrategy> createDeploymentStrategy({
    required int deploymentDurationInMinutes,
    required double growthFactor,
    required String name,
    required ReplicateTo replicateTo,
    String? description,
    int? finalBakeTimeInMinutes,
    GrowthType? growthType,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(
        deploymentDurationInMinutes, 'deploymentDurationInMinutes');
    _s.validateNumRange(
      'deploymentDurationInMinutes',
      deploymentDurationInMinutes,
      0,
      1440,
      isRequired: true,
    );
    ArgumentError.checkNotNull(growthFactor, 'growthFactor');
    _s.validateNumRange(
      'growthFactor',
      growthFactor,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(replicateTo, 'replicateTo');
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
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
      'ReplicateTo': replicateTo.toValue(),
      if (description != null) 'Description': description,
      if (finalBakeTimeInMinutes != null)
        'FinalBakeTimeInMinutes': finalBakeTimeInMinutes,
      if (growthType != null) 'GrowthType': growthType.toValue(),
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

  /// For each application, you define one or more environments. An environment
  /// is a logical deployment group of AppConfig targets, such as applications
  /// in a <code>Beta</code> or <code>Production</code> environment. You can
  /// also define environments for application subcomponents such as the
  /// <code>Web</code>, <code>Mobile</code> and <code>Back-end</code> components
  /// for your application. You can configure Amazon CloudWatch alarms for each
  /// environment. The system monitors alarms during a configuration deployment.
  /// If an alarm is triggered, the system rolls back the configuration.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [BadRequestException].
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
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

  /// Create a new configuration in the AppConfig configuration store.
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
  /// href="https://docs.aws.amazon.com/https:/www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.
  ///
  /// Parameter [description] :
  /// A description of the configuration.
  ///
  /// Parameter [latestVersionNumber] :
  /// An optional locking token used to prevent race conditions from overwriting
  /// configuration updates when creating a new version. To ensure your data is
  /// not overwritten when creating multiple hosted configuration versions in
  /// rapid succession, specify the version of the latest hosted configuration
  /// version.
  Future<HostedConfigurationVersion> createHostedConfigurationVersion({
    required String applicationId,
    required String configurationProfileId,
    required Uint8List content,
    required String contentType,
    String? description,
    int? latestVersionNumber,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        configurationProfileId, 'configurationProfileId');
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(contentType, 'contentType');
    _s.validateStringLength(
      'contentType',
      contentType,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': contentType.toString(),
      if (description != null) 'Description': description.toString(),
      if (latestVersionNumber != null)
        'Latest-Version-Number': latestVersionNumber.toString(),
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
      versionNumber:
          _s.extractHeaderIntValue(response.headers, 'Version-Number'),
    );
  }

  /// Delete an application. Deleting an application does not delete a
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a configuration profile. Deleting a configuration profile does not
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        configurationProfileId, 'configurationProfileId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a deployment strategy. Deleting a deployment strategy does not
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
    ArgumentError.checkNotNull(deploymentStrategyId, 'deploymentStrategyId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/deployementstrategies/${Uri.encodeComponent(deploymentStrategyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete an environment. Deleting an environment does not delete a
  /// configuration from a host.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [applicationId] :
  /// The application ID that includes the environment you want to delete.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment you want to delete.
  Future<void> deleteEnvironment({
    required String applicationId,
    required String environmentId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(environmentId, 'environmentId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a version of a configuration from the AppConfig configuration
  /// store.
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        configurationProfileId, 'configurationProfileId');
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}/hostedconfigurationversions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieve information about an application.
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Receive information about a configuration.
  /// <important>
  /// AWS AppConfig uses the value of the
  /// <code>ClientConfigurationVersion</code> parameter to identify the
  /// configuration version on your clients. If you don’t send
  /// <code>ClientConfigurationVersion</code> with each call to
  /// <code>GetConfiguration</code>, your clients receive the current
  /// configuration. You are charged each time your clients receive a
  /// configuration.
  ///
  /// To avoid excess charges, we recommend that you include the
  /// <code>ClientConfigurationVersion</code> value with every call to
  /// <code>GetConfiguration</code>. This value must be saved on your client.
  /// Subsequent calls to <code>GetConfiguration</code> must pass this value by
  /// using the <code>ClientConfigurationVersion</code> parameter.
  /// </important>
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
  /// A unique ID to identify the client for the configuration. This ID enables
  /// AppConfig to deploy the configuration in intervals, as defined in the
  /// deployment strategy.
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
  /// AWS AppConfig uses the value of the
  /// <code>ClientConfigurationVersion</code> parameter to identify the
  /// configuration version on your clients. If you don’t send
  /// <code>ClientConfigurationVersion</code> with each call to
  /// <code>GetConfiguration</code>, your clients receive the current
  /// configuration. You are charged each time your clients receive a
  /// configuration.
  ///
  /// To avoid excess charges, we recommend that you include the
  /// <code>ClientConfigurationVersion</code> value with every call to
  /// <code>GetConfiguration</code>. This value must be saved on your client.
  /// Subsequent calls to <code>GetConfiguration</code> must pass this value by
  /// using the <code>ClientConfigurationVersion</code> parameter.
  /// </important>
  /// For more information about working with configurations, see <a
  /// href="https://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-retrieving-the-configuration.html">Retrieving
  /// the Configuration</a> in the <i>AWS AppConfig User Guide</i>.
  Future<Configuration> getConfiguration({
    required String application,
    required String clientId,
    required String configuration,
    required String environment,
    String? clientConfigurationVersion,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(configuration, 'configuration');
    _s.validateStringLength(
      'configuration',
      configuration,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(environment, 'environment');
    _s.validateStringLength(
      'environment',
      environment,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientConfigurationVersion',
      clientConfigurationVersion,
      1,
      1024,
    );
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

  /// Retrieve information about a configuration profile.
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
  /// The ID of the configuration profile you want to get.
  Future<ConfigurationProfile> getConfigurationProfile({
    required String applicationId,
    required String configurationProfileId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        configurationProfileId, 'configurationProfileId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/configurationprofiles/${Uri.encodeComponent(configurationProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigurationProfile.fromJson(response);
  }

  /// Retrieve information about a configuration deployment.
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(deploymentNumber, 'deploymentNumber');
    ArgumentError.checkNotNull(environmentId, 'environmentId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}/deployments/${Uri.encodeComponent(deploymentNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return Deployment.fromJson(response);
  }

  /// Retrieve information about a deployment strategy. A deployment strategy
  /// defines important criteria for rolling out your configuration to the
  /// designated targets. A deployment strategy includes: the overall duration
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
    ArgumentError.checkNotNull(deploymentStrategyId, 'deploymentStrategyId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/deploymentstrategies/${Uri.encodeComponent(deploymentStrategyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeploymentStrategy.fromJson(response);
  }

  /// Retrieve information about an environment. An environment is a logical
  /// deployment group of AppConfig applications, such as applications in a
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
  /// The ID of the environment you wnat to get.
  Future<Environment> getEnvironment({
    required String applicationId,
    required String environmentId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(environmentId, 'environmentId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Environment.fromJson(response);
  }

  /// Get information about a specific configuration version.
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        configurationProfileId, 'configurationProfileId');
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
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
      versionNumber:
          _s.extractHeaderIntValue(response.headers, 'Version-Number'),
    );
  }

  /// List all applications in your AWS account.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
  Future<ConfigurationProfiles> listConfigurationProfiles({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
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

  /// List deployment strategies.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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

  /// Lists the deployments for an environment.
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
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<Deployments> listDeployments({
    required String applicationId,
    required String environmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(environmentId, 'environmentId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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

  /// List the environments for an application.
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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

  /// View a list of configurations stored in the AppConfig configuration store
  /// by version.
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
  Future<HostedConfigurationVersions> listHostedConfigurationVersions({
    required String applicationId,
    required String configurationProfileId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        configurationProfileId, 'configurationProfileId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
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
  /// The configuration version to deploy.
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
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        configurationProfileId, 'configurationProfileId');
    ArgumentError.checkNotNull(configurationVersion, 'configurationVersion');
    _s.validateStringLength(
      'configurationVersion',
      configurationVersion,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(deploymentStrategyId, 'deploymentStrategyId');
    ArgumentError.checkNotNull(environmentId, 'environmentId');
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      'ConfigurationProfileId': configurationProfileId,
      'ConfigurationVersion': configurationVersion,
      'DeploymentStrategyId': deploymentStrategyId,
      if (description != null) 'Description': description,
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(deploymentNumber, 'deploymentNumber');
    ArgumentError.checkNotNull(environmentId, 'environmentId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environments/${Uri.encodeComponent(environmentId)}/deployments/${Uri.encodeComponent(deploymentNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return Deployment.fromJson(response);
  }

  /// Metadata to assign to an AppConfig resource. Tags help organize and
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
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
  /// Parameter [name] :
  /// The name of the configuration profile.
  ///
  /// Parameter [retrievalRoleArn] :
  /// The ARN of an IAM role with permission to access the configuration at the
  /// specified LocationUri.
  ///
  /// Parameter [validators] :
  /// A list of methods for validating the configuration.
  Future<ConfigurationProfile> updateConfigurationProfile({
    required String applicationId,
    required String configurationProfileId,
    String? description,
    String? name,
    String? retrievalRoleArn,
    List<Validator>? validators,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        configurationProfileId, 'configurationProfileId');
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringLength(
      'retrievalRoleArn',
      retrievalRoleArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
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
  /// The amount of time AppConfig monitors for alarms before considering the
  /// deployment to be complete and no longer eligible for automatic roll back.
  ///
  /// Parameter [growthFactor] :
  /// The percentage of targets to receive a deployed configuration during each
  /// interval.
  ///
  /// Parameter [growthType] :
  /// The algorithm used to define how percentage grows over time. AWS AppConfig
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
    ArgumentError.checkNotNull(deploymentStrategyId, 'deploymentStrategyId');
    _s.validateNumRange(
      'deploymentDurationInMinutes',
      deploymentDurationInMinutes,
      0,
      1440,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(environmentId, 'environmentId');
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
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
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        configurationProfileId, 'configurationProfileId');
    ArgumentError.checkNotNull(configurationVersion, 'configurationVersion');
    _s.validateStringLength(
      'configurationVersion',
      configurationVersion,
      1,
      1024,
      isRequired: true,
    );
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

class Configuration {
  /// The configuration version.
  final String? configurationVersion;

  /// The content of the configuration or the configuration data.
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

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      configurationVersion: json['Configuration-Version'] as String?,
      content: _s.decodeNullableUint8List(json['Content'] as String?),
      contentType: json['Content-Type'] as String?,
    );
  }

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

  /// The URI location of the configuration.
  final String? locationUri;

  /// The name of the configuration profile.
  final String? name;

  /// The ARN of an IAM role with permission to access the configuration at the
  /// specified LocationUri.
  final String? retrievalRoleArn;

  /// A list of methods for validating the configuration.
  final List<Validator>? validators;

  ConfigurationProfile({
    this.applicationId,
    this.description,
    this.id,
    this.locationUri,
    this.name,
    this.retrievalRoleArn,
    this.validators,
  });

  factory ConfigurationProfile.fromJson(Map<String, dynamic> json) {
    return ConfigurationProfile(
      applicationId: json['ApplicationId'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      locationUri: json['LocationUri'] as String?,
      name: json['Name'] as String?,
      retrievalRoleArn: json['RetrievalRoleArn'] as String?,
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
    final locationUri = this.locationUri;
    final name = this.name;
    final retrievalRoleArn = this.retrievalRoleArn;
    final validators = this.validators;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (locationUri != null) 'LocationUri': locationUri,
      if (name != null) 'Name': name,
      if (retrievalRoleArn != null) 'RetrievalRoleArn': retrievalRoleArn,
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

  /// The types of validators in the configuration profile.
  final List<ValidatorType>? validatorTypes;

  ConfigurationProfileSummary({
    this.applicationId,
    this.id,
    this.locationUri,
    this.name,
    this.validatorTypes,
  });

  factory ConfigurationProfileSummary.fromJson(Map<String, dynamic> json) {
    return ConfigurationProfileSummary(
      applicationId: json['ApplicationId'] as String?,
      id: json['Id'] as String?,
      locationUri: json['LocationUri'] as String?,
      name: json['Name'] as String?,
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
    final validatorTypes = this.validatorTypes;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (id != null) 'Id': id,
      if (locationUri != null) 'LocationUri': locationUri,
      if (name != null) 'Name': name,
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

  /// The amount of time AppConfig monitored for alarms before considering the
  /// deployment to be complete and no longer eligible for automatic roll back.
  final int? finalBakeTimeInMinutes;

  /// The percentage of targets to receive a deployed configuration during each
  /// interval.
  final double? growthFactor;

  /// The algorithm used to define how percentage grew over time.
  final GrowthType? growthType;

  /// The percentage of targets for which the deployment is available.
  final double? percentageComplete;

  /// The time the deployment started.
  final DateTime? startedAt;

  /// The state of the deployment.
  final DeploymentState? state;

  Deployment({
    this.applicationId,
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
    this.percentageComplete,
    this.startedAt,
    this.state,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      applicationId: json['ApplicationId'] as String?,
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
      percentageComplete: json['PercentageComplete'] as double?,
      startedAt: timeStampFromJson(json['StartedAt']),
      state: (json['State'] as String?)?.toDeploymentState(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
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
    final percentageComplete = this.percentageComplete;
    final startedAt = this.startedAt;
    final state = this.state;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
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
      if (percentageComplete != null) 'PercentageComplete': percentageComplete,
      if (startedAt != null) 'StartedAt': iso8601ToJson(startedAt),
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// An object that describes a deployment event.
class DeploymentEvent {
  /// A description of the deployment event. Descriptions include, but are not
  /// limited to, the user account or the CloudWatch alarm ARN that initiated a
  /// rollback, the percentage of hosts that received the deployment, or in the
  /// case of an internal error, a recommendation to attempt a new deployment.
  final String? description;

  /// The type of deployment event. Deployment event types include the start,
  /// stop, or completion of a deployment; a percentage update; the start or stop
  /// of a bake period; the start or completion of a rollback.
  final DeploymentEventType? eventType;

  /// The date and time the event occurred.
  final DateTime? occurredAt;

  /// The entity that triggered the deployment event. Events can be triggered by a
  /// user, AWS AppConfig, an Amazon CloudWatch alarm, or an internal error.
  final TriggeredBy? triggeredBy;

  DeploymentEvent({
    this.description,
    this.eventType,
    this.occurredAt,
    this.triggeredBy,
  });

  factory DeploymentEvent.fromJson(Map<String, dynamic> json) {
    return DeploymentEvent(
      description: json['Description'] as String?,
      eventType: (json['EventType'] as String?)?.toDeploymentEventType(),
      occurredAt: timeStampFromJson(json['OccurredAt']),
      triggeredBy: (json['TriggeredBy'] as String?)?.toTriggeredBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final eventType = this.eventType;
    final occurredAt = this.occurredAt;
    final triggeredBy = this.triggeredBy;
    return {
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

extension on DeploymentEventType {
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

extension on String {
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

extension on DeploymentState {
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

extension on String {
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

  /// The amount of time AppConfig monitored for alarms before considering the
  /// deployment to be complete and no longer eligible for automatic roll back.
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

  /// The amount of time AppConfig monitors for alarms before considering the
  /// deployment to be complete and no longer eligible for automatic roll back.
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

extension on EnvironmentState {
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

extension on String {
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

enum GrowthType {
  linear,
  exponential,
}

extension on GrowthType {
  String toValue() {
    switch (this) {
      case GrowthType.linear:
        return 'LINEAR';
      case GrowthType.exponential:
        return 'EXPONENTIAL';
    }
  }
}

extension on String {
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
  /// href="https://docs.aws.amazon.com/https:/www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.
  final String? contentType;

  /// A description of the configuration.
  final String? description;

  /// The configuration version.
  final int? versionNumber;

  HostedConfigurationVersion({
    this.applicationId,
    this.configurationProfileId,
    this.content,
    this.contentType,
    this.description,
    this.versionNumber,
  });

  factory HostedConfigurationVersion.fromJson(Map<String, dynamic> json) {
    return HostedConfigurationVersion(
      applicationId: json['Application-Id'] as String?,
      configurationProfileId: json['Configuration-Profile-Id'] as String?,
      content: _s.decodeNullableUint8List(json['Content'] as String?),
      contentType: json['Content-Type'] as String?,
      description: json['Description'] as String?,
      versionNumber: json['Version-Number'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final configurationProfileId = this.configurationProfileId;
    final content = this.content;
    final contentType = this.contentType;
    final description = this.description;
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
  /// href="https://docs.aws.amazon.com/https:/www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a>.
  final String? contentType;

  /// A description of the configuration.
  final String? description;

  /// The configuration version.
  final int? versionNumber;

  HostedConfigurationVersionSummary({
    this.applicationId,
    this.configurationProfileId,
    this.contentType,
    this.description,
    this.versionNumber,
  });

  factory HostedConfigurationVersionSummary.fromJson(
      Map<String, dynamic> json) {
    return HostedConfigurationVersionSummary(
      applicationId: json['ApplicationId'] as String?,
      configurationProfileId: json['ConfigurationProfileId'] as String?,
      contentType: json['ContentType'] as String?,
      description: json['Description'] as String?,
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final configurationProfileId = this.configurationProfileId;
    final contentType = this.contentType;
    final description = this.description;
    final versionNumber = this.versionNumber;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (configurationProfileId != null)
        'ConfigurationProfileId': configurationProfileId,
      if (contentType != null) 'ContentType': contentType,
      if (description != null) 'Description': description,
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
  /// ARN of the Amazon CloudWatch alarm.
  final String? alarmArn;

  /// ARN of an IAM role for AppConfig to monitor <code>AlarmArn</code>.
  final String? alarmRoleArn;

  Monitor({
    this.alarmArn,
    this.alarmRoleArn,
  });

  factory Monitor.fromJson(Map<String, dynamic> json) {
    return Monitor(
      alarmArn: json['AlarmArn'] as String?,
      alarmRoleArn: json['AlarmRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmArn = this.alarmArn;
    final alarmRoleArn = this.alarmRoleArn;
    return {
      if (alarmArn != null) 'AlarmArn': alarmArn,
      if (alarmRoleArn != null) 'AlarmRoleArn': alarmRoleArn,
    };
  }
}

enum ReplicateTo {
  none,
  ssmDocument,
}

extension on ReplicateTo {
  String toValue() {
    switch (this) {
      case ReplicateTo.none:
        return 'NONE';
      case ReplicateTo.ssmDocument:
        return 'SSM_DOCUMENT';
    }
  }
}

extension on String {
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

extension on TriggeredBy {
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

extension on String {
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
/// configuration you want to deploy functions as intended. To validate your
/// application configuration data, you provide a schema or a Lambda function
/// that runs against the configuration. The configuration deployment or update
/// can only proceed when the configuration data is valid.
class Validator {
  /// Either the JSON Schema content or the Amazon Resource Name (ARN) of an AWS
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

extension on ValidatorType {
  String toValue() {
    switch (this) {
      case ValidatorType.jsonSchema:
        return 'JSON_SCHEMA';
      case ValidatorType.lambda:
        return 'LAMBDA';
    }
  }
}

extension on String {
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
