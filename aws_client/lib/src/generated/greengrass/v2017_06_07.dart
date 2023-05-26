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

/// AWS IoT Greengrass seamlessly extends AWS onto physical devices so they can
/// act locally on the data they generate, while still using the cloud for
/// management, analytics, and durable storage. AWS IoT Greengrass ensures your
/// devices can respond quickly to local events and operate with intermittent
/// connectivity. AWS IoT Greengrass minimizes the cost of transmitting data to
/// the cloud by allowing you to author AWS Lambda functions that execute
/// locally.
class Greengrass {
  final _s.RestJsonProtocol _protocol;
  Greengrass({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'greengrass',
            signingName: 'greengrass',
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

  /// Associates a role with a group. Your Greengrass core will use the role to
  /// access AWS cloud services. The role's permissions should allow Greengrass
  /// core Lambda functions to perform actions against the cloud.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role you wish to associate with this group. The existence
  /// of the role is not validated.
  Future<AssociateRoleToGroupResponse> associateRoleToGroup({
    required String groupId,
    required String roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'RoleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}/role',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateRoleToGroupResponse.fromJson(response);
  }

  /// Associates a role with your account. AWS IoT Greengrass will use the role
  /// to access your Lambda functions and AWS IoT resources. This is necessary
  /// for deployments to succeed. The role must have at least minimum
  /// permissions in the policy ''AWSGreengrassResourceAccessRolePolicy''.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [roleArn] :
  /// The ARN of the service role you wish to associate with your account.
  Future<AssociateServiceRoleToAccountResponse> associateServiceRoleToAccount({
    required String roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'RoleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/greengrass/servicerole',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateServiceRoleToAccountResponse.fromJson(response);
  }

  /// Creates a connector definition. You may provide the initial version of the
  /// connector definition now or use ''CreateConnectorDefinitionVersion'' at a
  /// later time.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [initialVersion] :
  /// Information about the initial version of the connector definition.
  ///
  /// Parameter [name] :
  /// The name of the connector definition.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<CreateConnectorDefinitionResponse> createConnectorDefinition({
    String? amznClientToken,
    ConnectorDefinitionVersion? initialVersion,
    String? name,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (initialVersion != null) 'InitialVersion': initialVersion,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/definition/connectors',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateConnectorDefinitionResponse.fromJson(response);
  }

  /// Creates a version of a connector definition which has already been
  /// defined.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [connectorDefinitionId] :
  /// The ID of the connector definition.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [connectors] :
  /// A list of references to connectors in this version, with their
  /// corresponding configuration settings.
  Future<CreateConnectorDefinitionVersionResponse>
      createConnectorDefinitionVersion({
    required String connectorDefinitionId,
    String? amznClientToken,
    List<Connector>? connectors,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (connectors != null) 'Connectors': connectors,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/definition/connectors/${Uri.encodeComponent(connectorDefinitionId)}/versions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateConnectorDefinitionVersionResponse.fromJson(response);
  }

  /// Creates a core definition. You may provide the initial version of the core
  /// definition now or use ''CreateCoreDefinitionVersion'' at a later time.
  /// Greengrass groups must each contain exactly one Greengrass core.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [initialVersion] :
  /// Information about the initial version of the core definition.
  ///
  /// Parameter [name] :
  /// The name of the core definition.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<CreateCoreDefinitionResponse> createCoreDefinition({
    String? amznClientToken,
    CoreDefinitionVersion? initialVersion,
    String? name,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (initialVersion != null) 'InitialVersion': initialVersion,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/definition/cores',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateCoreDefinitionResponse.fromJson(response);
  }

  /// Creates a version of a core definition that has already been defined.
  /// Greengrass groups must each contain exactly one Greengrass core.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [coreDefinitionId] :
  /// The ID of the core definition.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [cores] :
  /// A list of cores in the core definition version.
  Future<CreateCoreDefinitionVersionResponse> createCoreDefinitionVersion({
    required String coreDefinitionId,
    String? amznClientToken,
    List<Core>? cores,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (cores != null) 'Cores': cores,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/definition/cores/${Uri.encodeComponent(coreDefinitionId)}/versions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateCoreDefinitionVersionResponse.fromJson(response);
  }

  /// Creates a deployment. ''CreateDeployment'' requests are idempotent with
  /// respect to the ''X-Amzn-Client-Token'' token and the request parameters.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [deploymentType] :
  /// The type of deployment. When used for ''CreateDeployment'', only
  /// ''NewDeployment'' and ''Redeployment'' are valid.
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment if you wish to redeploy a previous deployment.
  ///
  /// Parameter [groupVersionId] :
  /// The ID of the group version to be deployed.
  Future<CreateDeploymentResponse> createDeployment({
    required DeploymentType deploymentType,
    required String groupId,
    String? amznClientToken,
    String? deploymentId,
    String? groupVersionId,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'DeploymentType': deploymentType.toValue(),
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (groupVersionId != null) 'GroupVersionId': groupVersionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/deployments',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeploymentResponse.fromJson(response);
  }

  /// Creates a device definition. You may provide the initial version of the
  /// device definition now or use ''CreateDeviceDefinitionVersion'' at a later
  /// time.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [initialVersion] :
  /// Information about the initial version of the device definition.
  ///
  /// Parameter [name] :
  /// The name of the device definition.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<CreateDeviceDefinitionResponse> createDeviceDefinition({
    String? amznClientToken,
    DeviceDefinitionVersion? initialVersion,
    String? name,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (initialVersion != null) 'InitialVersion': initialVersion,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/definition/devices',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeviceDefinitionResponse.fromJson(response);
  }

  /// Creates a version of a device definition that has already been defined.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [deviceDefinitionId] :
  /// The ID of the device definition.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [devices] :
  /// A list of devices in the definition version.
  Future<CreateDeviceDefinitionVersionResponse> createDeviceDefinitionVersion({
    required String deviceDefinitionId,
    String? amznClientToken,
    List<Device>? devices,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (devices != null) 'Devices': devices,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/definition/devices/${Uri.encodeComponent(deviceDefinitionId)}/versions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeviceDefinitionVersionResponse.fromJson(response);
  }

  /// Creates a Lambda function definition which contains a list of Lambda
  /// functions and their configurations to be used in a group. You can create
  /// an initial version of the definition by providing a list of Lambda
  /// functions and their configurations now, or use
  /// ''CreateFunctionDefinitionVersion'' later.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [initialVersion] :
  /// Information about the initial version of the function definition.
  ///
  /// Parameter [name] :
  /// The name of the function definition.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<CreateFunctionDefinitionResponse> createFunctionDefinition({
    String? amznClientToken,
    FunctionDefinitionVersion? initialVersion,
    String? name,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (initialVersion != null) 'InitialVersion': initialVersion,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/definition/functions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateFunctionDefinitionResponse.fromJson(response);
  }

  /// Creates a version of a Lambda function definition that has already been
  /// defined.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [functionDefinitionId] :
  /// The ID of the Lambda function definition.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [defaultConfig] :
  /// The default configuration that applies to all Lambda functions in this
  /// function definition version. Individual Lambda functions can override
  /// these settings.
  ///
  /// Parameter [functions] :
  /// A list of Lambda functions in this function definition version.
  Future<CreateFunctionDefinitionVersionResponse>
      createFunctionDefinitionVersion({
    required String functionDefinitionId,
    String? amznClientToken,
    FunctionDefaultConfig? defaultConfig,
    List<$Function>? functions,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (defaultConfig != null) 'DefaultConfig': defaultConfig,
      if (functions != null) 'Functions': functions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/definition/functions/${Uri.encodeComponent(functionDefinitionId)}/versions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateFunctionDefinitionVersionResponse.fromJson(response);
  }

  /// Creates a group. You may provide the initial version of the group or use
  /// ''CreateGroupVersion'' at a later time. Tip: You can use the
  /// ''gg_group_setup'' package
  /// (https://github.com/awslabs/aws-greengrass-group-setup) as a library or
  /// command-line application to create and deploy Greengrass groups.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [name] :
  /// The name of the group.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [initialVersion] :
  /// Information about the initial version of the group.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<CreateGroupResponse> createGroup({
    required String name,
    String? amznClientToken,
    GroupVersion? initialVersion,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
      if (initialVersion != null) 'InitialVersion': initialVersion,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/groups',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupResponse.fromJson(response);
  }

  /// Creates a CA for the group. If a CA already exists, it will rotate the
  /// existing CA.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  Future<CreateGroupCertificateAuthorityResponse>
      createGroupCertificateAuthority({
    required String groupId,
    String? amznClientToken,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/certificateauthorities',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupCertificateAuthorityResponse.fromJson(response);
  }

  /// Creates a version of a group which has already been defined.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [connectorDefinitionVersionArn] :
  /// The ARN of the connector definition version for this group.
  ///
  /// Parameter [coreDefinitionVersionArn] :
  /// The ARN of the core definition version for this group.
  ///
  /// Parameter [deviceDefinitionVersionArn] :
  /// The ARN of the device definition version for this group.
  ///
  /// Parameter [functionDefinitionVersionArn] :
  /// The ARN of the function definition version for this group.
  ///
  /// Parameter [loggerDefinitionVersionArn] :
  /// The ARN of the logger definition version for this group.
  ///
  /// Parameter [resourceDefinitionVersionArn] :
  /// The ARN of the resource definition version for this group.
  ///
  /// Parameter [subscriptionDefinitionVersionArn] :
  /// The ARN of the subscription definition version for this group.
  Future<CreateGroupVersionResponse> createGroupVersion({
    required String groupId,
    String? amznClientToken,
    String? connectorDefinitionVersionArn,
    String? coreDefinitionVersionArn,
    String? deviceDefinitionVersionArn,
    String? functionDefinitionVersionArn,
    String? loggerDefinitionVersionArn,
    String? resourceDefinitionVersionArn,
    String? subscriptionDefinitionVersionArn,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (connectorDefinitionVersionArn != null)
        'ConnectorDefinitionVersionArn': connectorDefinitionVersionArn,
      if (coreDefinitionVersionArn != null)
        'CoreDefinitionVersionArn': coreDefinitionVersionArn,
      if (deviceDefinitionVersionArn != null)
        'DeviceDefinitionVersionArn': deviceDefinitionVersionArn,
      if (functionDefinitionVersionArn != null)
        'FunctionDefinitionVersionArn': functionDefinitionVersionArn,
      if (loggerDefinitionVersionArn != null)
        'LoggerDefinitionVersionArn': loggerDefinitionVersionArn,
      if (resourceDefinitionVersionArn != null)
        'ResourceDefinitionVersionArn': resourceDefinitionVersionArn,
      if (subscriptionDefinitionVersionArn != null)
        'SubscriptionDefinitionVersionArn': subscriptionDefinitionVersionArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}/versions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupVersionResponse.fromJson(response);
  }

  /// Creates a logger definition. You may provide the initial version of the
  /// logger definition now or use ''CreateLoggerDefinitionVersion'' at a later
  /// time.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [initialVersion] :
  /// Information about the initial version of the logger definition.
  ///
  /// Parameter [name] :
  /// The name of the logger definition.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<CreateLoggerDefinitionResponse> createLoggerDefinition({
    String? amznClientToken,
    LoggerDefinitionVersion? initialVersion,
    String? name,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (initialVersion != null) 'InitialVersion': initialVersion,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/definition/loggers',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateLoggerDefinitionResponse.fromJson(response);
  }

  /// Creates a version of a logger definition that has already been defined.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [loggerDefinitionId] :
  /// The ID of the logger definition.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [loggers] :
  /// A list of loggers.
  Future<CreateLoggerDefinitionVersionResponse> createLoggerDefinitionVersion({
    required String loggerDefinitionId,
    String? amznClientToken,
    List<Logger>? loggers,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (loggers != null) 'Loggers': loggers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/definition/loggers/${Uri.encodeComponent(loggerDefinitionId)}/versions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateLoggerDefinitionVersionResponse.fromJson(response);
  }

  /// Creates a resource definition which contains a list of resources to be
  /// used in a group. You can create an initial version of the definition by
  /// providing a list of resources now, or use
  /// ''CreateResourceDefinitionVersion'' later.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [initialVersion] :
  /// Information about the initial version of the resource definition.
  ///
  /// Parameter [name] :
  /// The name of the resource definition.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<CreateResourceDefinitionResponse> createResourceDefinition({
    String? amznClientToken,
    ResourceDefinitionVersion? initialVersion,
    String? name,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (initialVersion != null) 'InitialVersion': initialVersion,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/definition/resources',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateResourceDefinitionResponse.fromJson(response);
  }

  /// Creates a version of a resource definition that has already been defined.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceDefinitionId] :
  /// The ID of the resource definition.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [resources] :
  /// A list of resources.
  Future<CreateResourceDefinitionVersionResponse>
      createResourceDefinitionVersion({
    required String resourceDefinitionId,
    String? amznClientToken,
    List<Resource>? resources,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (resources != null) 'Resources': resources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/definition/resources/${Uri.encodeComponent(resourceDefinitionId)}/versions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateResourceDefinitionVersionResponse.fromJson(response);
  }

  /// Creates a software update for a core or group of cores (specified as an
  /// IoT thing group.) Use this to update the OTA Agent as well as the
  /// Greengrass core software. It makes use of the IoT Jobs feature which
  /// provides additional commands to manage a Greengrass core software update
  /// job.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  Future<CreateSoftwareUpdateJobResponse> createSoftwareUpdateJob({
    required String s3UrlSignerRole,
    required SoftwareToUpdate softwareToUpdate,
    required List<String> updateTargets,
    required UpdateTargetsArchitecture updateTargetsArchitecture,
    required UpdateTargetsOperatingSystem updateTargetsOperatingSystem,
    String? amznClientToken,
    UpdateAgentLogLevel? updateAgentLogLevel,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'S3UrlSignerRole': s3UrlSignerRole,
      'SoftwareToUpdate': softwareToUpdate.toValue(),
      'UpdateTargets': updateTargets,
      'UpdateTargetsArchitecture': updateTargetsArchitecture.toValue(),
      'UpdateTargetsOperatingSystem': updateTargetsOperatingSystem.toValue(),
      if (updateAgentLogLevel != null)
        'UpdateAgentLogLevel': updateAgentLogLevel.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/updates',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateSoftwareUpdateJobResponse.fromJson(response);
  }

  /// Creates a subscription definition. You may provide the initial version of
  /// the subscription definition now or use
  /// ''CreateSubscriptionDefinitionVersion'' at a later time.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [initialVersion] :
  /// Information about the initial version of the subscription definition.
  ///
  /// Parameter [name] :
  /// The name of the subscription definition.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<CreateSubscriptionDefinitionResponse> createSubscriptionDefinition({
    String? amznClientToken,
    SubscriptionDefinitionVersion? initialVersion,
    String? name,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (initialVersion != null) 'InitialVersion': initialVersion,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/definition/subscriptions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriptionDefinitionResponse.fromJson(response);
  }

  /// Creates a version of a subscription definition which has already been
  /// defined.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [subscriptionDefinitionId] :
  /// The ID of the subscription definition.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [subscriptions] :
  /// A list of subscriptions.
  Future<CreateSubscriptionDefinitionVersionResponse>
      createSubscriptionDefinitionVersion({
    required String subscriptionDefinitionId,
    String? amznClientToken,
    List<Subscription>? subscriptions,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (subscriptions != null) 'Subscriptions': subscriptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/definition/subscriptions/${Uri.encodeComponent(subscriptionDefinitionId)}/versions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriptionDefinitionVersionResponse.fromJson(response);
  }

  /// Deletes a connector definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [connectorDefinitionId] :
  /// The ID of the connector definition.
  Future<void> deleteConnectorDefinition({
    required String connectorDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/connectors/${Uri.encodeComponent(connectorDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a core definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [coreDefinitionId] :
  /// The ID of the core definition.
  Future<void> deleteCoreDefinition({
    required String coreDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/cores/${Uri.encodeComponent(coreDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a device definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [deviceDefinitionId] :
  /// The ID of the device definition.
  Future<void> deleteDeviceDefinition({
    required String deviceDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/devices/${Uri.encodeComponent(deviceDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Lambda function definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [functionDefinitionId] :
  /// The ID of the Lambda function definition.
  Future<void> deleteFunctionDefinition({
    required String functionDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/functions/${Uri.encodeComponent(functionDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a group.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<void> deleteGroup({
    required String groupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a logger definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [loggerDefinitionId] :
  /// The ID of the logger definition.
  Future<void> deleteLoggerDefinition({
    required String loggerDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/loggers/${Uri.encodeComponent(loggerDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a resource definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceDefinitionId] :
  /// The ID of the resource definition.
  Future<void> deleteResourceDefinition({
    required String resourceDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/resources/${Uri.encodeComponent(resourceDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a subscription definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [subscriptionDefinitionId] :
  /// The ID of the subscription definition.
  Future<void> deleteSubscriptionDefinition({
    required String subscriptionDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/subscriptions/${Uri.encodeComponent(subscriptionDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates the role from a group.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<DisassociateRoleFromGroupResponse> disassociateRoleFromGroup({
    required String groupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}/role',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateRoleFromGroupResponse.fromJson(response);
  }

  /// Disassociates the service role from your account. Without a service role,
  /// deployments will not work.
  ///
  /// May throw [InternalServerErrorException].
  Future<DisassociateServiceRoleFromAccountResponse>
      disassociateServiceRoleFromAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/greengrass/servicerole',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateServiceRoleFromAccountResponse.fromJson(response);
  }

  /// Retrieves the role associated with a particular group.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<GetAssociatedRoleResponse> getAssociatedRole({
    required String groupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}/role',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssociatedRoleResponse.fromJson(response);
  }

  /// Returns the status of a bulk deployment.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [bulkDeploymentId] :
  /// The ID of the bulk deployment.
  Future<GetBulkDeploymentStatusResponse> getBulkDeploymentStatus({
    required String bulkDeploymentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/bulk/deployments/${Uri.encodeComponent(bulkDeploymentId)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetBulkDeploymentStatusResponse.fromJson(response);
  }

  /// Retrieves the connectivity information for a core.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [thingName] :
  /// The thing name.
  Future<GetConnectivityInfoResponse> getConnectivityInfo({
    required String thingName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/things/${Uri.encodeComponent(thingName)}/connectivityInfo',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectivityInfoResponse.fromJson(response);
  }

  /// Retrieves information about a connector definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [connectorDefinitionId] :
  /// The ID of the connector definition.
  Future<GetConnectorDefinitionResponse> getConnectorDefinition({
    required String connectorDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/connectors/${Uri.encodeComponent(connectorDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectorDefinitionResponse.fromJson(response);
  }

  /// Retrieves information about a connector definition version, including the
  /// connectors that the version contains. Connectors are prebuilt modules that
  /// interact with local infrastructure, device protocols, AWS, and other cloud
  /// services.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [connectorDefinitionId] :
  /// The ID of the connector definition.
  ///
  /// Parameter [connectorDefinitionVersionId] :
  /// The ID of the connector definition version. This value maps to the
  /// ''Version'' property of the corresponding ''VersionInformation'' object,
  /// which is returned by ''ListConnectorDefinitionVersions'' requests. If the
  /// version is the last one that was associated with a connector definition,
  /// the value also maps to the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<GetConnectorDefinitionVersionResponse> getConnectorDefinitionVersion({
    required String connectorDefinitionId,
    required String connectorDefinitionVersionId,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/connectors/${Uri.encodeComponent(connectorDefinitionId)}/versions/${Uri.encodeComponent(connectorDefinitionVersionId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectorDefinitionVersionResponse.fromJson(response);
  }

  /// Retrieves information about a core definition version.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [coreDefinitionId] :
  /// The ID of the core definition.
  Future<GetCoreDefinitionResponse> getCoreDefinition({
    required String coreDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/cores/${Uri.encodeComponent(coreDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCoreDefinitionResponse.fromJson(response);
  }

  /// Retrieves information about a core definition version.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [coreDefinitionId] :
  /// The ID of the core definition.
  ///
  /// Parameter [coreDefinitionVersionId] :
  /// The ID of the core definition version. This value maps to the ''Version''
  /// property of the corresponding ''VersionInformation'' object, which is
  /// returned by ''ListCoreDefinitionVersions'' requests. If the version is the
  /// last one that was associated with a core definition, the value also maps
  /// to the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  Future<GetCoreDefinitionVersionResponse> getCoreDefinitionVersion({
    required String coreDefinitionId,
    required String coreDefinitionVersionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/cores/${Uri.encodeComponent(coreDefinitionId)}/versions/${Uri.encodeComponent(coreDefinitionVersionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCoreDefinitionVersionResponse.fromJson(response);
  }

  /// Returns the status of a deployment.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment.
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<GetDeploymentStatusResponse> getDeploymentStatus({
    required String deploymentId,
    required String groupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/deployments/${Uri.encodeComponent(deploymentId)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeploymentStatusResponse.fromJson(response);
  }

  /// Retrieves information about a device definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [deviceDefinitionId] :
  /// The ID of the device definition.
  Future<GetDeviceDefinitionResponse> getDeviceDefinition({
    required String deviceDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/devices/${Uri.encodeComponent(deviceDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceDefinitionResponse.fromJson(response);
  }

  /// Retrieves information about a device definition version.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [deviceDefinitionId] :
  /// The ID of the device definition.
  ///
  /// Parameter [deviceDefinitionVersionId] :
  /// The ID of the device definition version. This value maps to the
  /// ''Version'' property of the corresponding ''VersionInformation'' object,
  /// which is returned by ''ListDeviceDefinitionVersions'' requests. If the
  /// version is the last one that was associated with a device definition, the
  /// value also maps to the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<GetDeviceDefinitionVersionResponse> getDeviceDefinitionVersion({
    required String deviceDefinitionId,
    required String deviceDefinitionVersionId,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/devices/${Uri.encodeComponent(deviceDefinitionId)}/versions/${Uri.encodeComponent(deviceDefinitionVersionId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceDefinitionVersionResponse.fromJson(response);
  }

  /// Retrieves information about a Lambda function definition, including its
  /// creation time and latest version.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [functionDefinitionId] :
  /// The ID of the Lambda function definition.
  Future<GetFunctionDefinitionResponse> getFunctionDefinition({
    required String functionDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/functions/${Uri.encodeComponent(functionDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionDefinitionResponse.fromJson(response);
  }

  /// Retrieves information about a Lambda function definition version,
  /// including which Lambda functions are included in the version and their
  /// configurations.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [functionDefinitionId] :
  /// The ID of the Lambda function definition.
  ///
  /// Parameter [functionDefinitionVersionId] :
  /// The ID of the function definition version. This value maps to the
  /// ''Version'' property of the corresponding ''VersionInformation'' object,
  /// which is returned by ''ListFunctionDefinitionVersions'' requests. If the
  /// version is the last one that was associated with a function definition,
  /// the value also maps to the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<GetFunctionDefinitionVersionResponse> getFunctionDefinitionVersion({
    required String functionDefinitionId,
    required String functionDefinitionVersionId,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/functions/${Uri.encodeComponent(functionDefinitionId)}/versions/${Uri.encodeComponent(functionDefinitionVersionId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionDefinitionVersionResponse.fromJson(response);
  }

  /// Retrieves information about a group.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<GetGroupResponse> getGroup({
    required String groupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupResponse.fromJson(response);
  }

  /// Retreives the CA associated with a group. Returns the public key of the
  /// CA.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [certificateAuthorityId] :
  /// The ID of the certificate authority.
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<GetGroupCertificateAuthorityResponse> getGroupCertificateAuthority({
    required String certificateAuthorityId,
    required String groupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/certificateauthorities/${Uri.encodeComponent(certificateAuthorityId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupCertificateAuthorityResponse.fromJson(response);
  }

  /// Retrieves the current configuration for the CA used by the group.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<GetGroupCertificateConfigurationResponse>
      getGroupCertificateConfiguration({
    required String groupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/certificateauthorities/configuration/expiry',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupCertificateConfigurationResponse.fromJson(response);
  }

  /// Retrieves information about a group version.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [groupVersionId] :
  /// The ID of the group version. This value maps to the ''Version'' property
  /// of the corresponding ''VersionInformation'' object, which is returned by
  /// ''ListGroupVersions'' requests. If the version is the last one that was
  /// associated with a group, the value also maps to the ''LatestVersion''
  /// property of the corresponding ''GroupInformation'' object.
  Future<GetGroupVersionResponse> getGroupVersion({
    required String groupId,
    required String groupVersionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/versions/${Uri.encodeComponent(groupVersionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupVersionResponse.fromJson(response);
  }

  /// Retrieves information about a logger definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [loggerDefinitionId] :
  /// The ID of the logger definition.
  Future<GetLoggerDefinitionResponse> getLoggerDefinition({
    required String loggerDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/loggers/${Uri.encodeComponent(loggerDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLoggerDefinitionResponse.fromJson(response);
  }

  /// Retrieves information about a logger definition version.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [loggerDefinitionId] :
  /// The ID of the logger definition.
  ///
  /// Parameter [loggerDefinitionVersionId] :
  /// The ID of the logger definition version. This value maps to the
  /// ''Version'' property of the corresponding ''VersionInformation'' object,
  /// which is returned by ''ListLoggerDefinitionVersions'' requests. If the
  /// version is the last one that was associated with a logger definition, the
  /// value also maps to the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<GetLoggerDefinitionVersionResponse> getLoggerDefinitionVersion({
    required String loggerDefinitionId,
    required String loggerDefinitionVersionId,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/loggers/${Uri.encodeComponent(loggerDefinitionId)}/versions/${Uri.encodeComponent(loggerDefinitionVersionId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLoggerDefinitionVersionResponse.fromJson(response);
  }

  /// Retrieves information about a resource definition, including its creation
  /// time and latest version.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceDefinitionId] :
  /// The ID of the resource definition.
  Future<GetResourceDefinitionResponse> getResourceDefinition({
    required String resourceDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/resources/${Uri.encodeComponent(resourceDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceDefinitionResponse.fromJson(response);
  }

  /// Retrieves information about a resource definition version, including which
  /// resources are included in the version.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceDefinitionId] :
  /// The ID of the resource definition.
  ///
  /// Parameter [resourceDefinitionVersionId] :
  /// The ID of the resource definition version. This value maps to the
  /// ''Version'' property of the corresponding ''VersionInformation'' object,
  /// which is returned by ''ListResourceDefinitionVersions'' requests. If the
  /// version is the last one that was associated with a resource definition,
  /// the value also maps to the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  Future<GetResourceDefinitionVersionResponse> getResourceDefinitionVersion({
    required String resourceDefinitionId,
    required String resourceDefinitionVersionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/resources/${Uri.encodeComponent(resourceDefinitionId)}/versions/${Uri.encodeComponent(resourceDefinitionVersionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceDefinitionVersionResponse.fromJson(response);
  }

  /// Retrieves the service role that is attached to your account.
  ///
  /// May throw [InternalServerErrorException].
  Future<GetServiceRoleForAccountResponse> getServiceRoleForAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/servicerole',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceRoleForAccountResponse.fromJson(response);
  }

  /// Retrieves information about a subscription definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [subscriptionDefinitionId] :
  /// The ID of the subscription definition.
  Future<GetSubscriptionDefinitionResponse> getSubscriptionDefinition({
    required String subscriptionDefinitionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/subscriptions/${Uri.encodeComponent(subscriptionDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriptionDefinitionResponse.fromJson(response);
  }

  /// Retrieves information about a subscription definition version.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [subscriptionDefinitionId] :
  /// The ID of the subscription definition.
  ///
  /// Parameter [subscriptionDefinitionVersionId] :
  /// The ID of the subscription definition version. This value maps to the
  /// ''Version'' property of the corresponding ''VersionInformation'' object,
  /// which is returned by ''ListSubscriptionDefinitionVersions'' requests. If
  /// the version is the last one that was associated with a subscription
  /// definition, the value also maps to the ''LatestVersion'' property of the
  /// corresponding ''DefinitionInformation'' object.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<GetSubscriptionDefinitionVersionResponse>
      getSubscriptionDefinitionVersion({
    required String subscriptionDefinitionId,
    required String subscriptionDefinitionVersionId,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/subscriptions/${Uri.encodeComponent(subscriptionDefinitionId)}/versions/${Uri.encodeComponent(subscriptionDefinitionVersionId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriptionDefinitionVersionResponse.fromJson(response);
  }

  /// Get the runtime configuration of a thing.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [thingName] :
  /// The thing name.
  Future<GetThingRuntimeConfigurationResponse> getThingRuntimeConfiguration({
    required String thingName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/things/${Uri.encodeComponent(thingName)}/runtimeconfig',
      exceptionFnMap: _exceptionFns,
    );
    return GetThingRuntimeConfigurationResponse.fromJson(response);
  }

  /// Gets a paginated list of the deployments that have been started in a bulk
  /// deployment operation, and their current deployment status.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [bulkDeploymentId] :
  /// The ID of the bulk deployment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListBulkDeploymentDetailedReportsResponse>
      listBulkDeploymentDetailedReports({
    required String bulkDeploymentId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/bulk/deployments/${Uri.encodeComponent(bulkDeploymentId)}/detailed-reports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBulkDeploymentDetailedReportsResponse.fromJson(response);
  }

  /// Returns a list of bulk deployments.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListBulkDeploymentsResponse> listBulkDeployments({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/bulk/deployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBulkDeploymentsResponse.fromJson(response);
  }

  /// Lists the versions of a connector definition, which are containers for
  /// connectors. Connectors run on the Greengrass core and contain built-in
  /// integration with local infrastructure, device protocols, AWS, and other
  /// cloud services.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [connectorDefinitionId] :
  /// The ID of the connector definition.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListConnectorDefinitionVersionsResponse>
      listConnectorDefinitionVersions({
    required String connectorDefinitionId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/connectors/${Uri.encodeComponent(connectorDefinitionId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorDefinitionVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of connector definitions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListConnectorDefinitionsResponse> listConnectorDefinitions({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/definition/connectors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorDefinitionsResponse.fromJson(response);
  }

  /// Lists the versions of a core definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [coreDefinitionId] :
  /// The ID of the core definition.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListCoreDefinitionVersionsResponse> listCoreDefinitionVersions({
    required String coreDefinitionId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/cores/${Uri.encodeComponent(coreDefinitionId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCoreDefinitionVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of core definitions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListCoreDefinitionsResponse> listCoreDefinitions({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/definition/cores',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCoreDefinitionsResponse.fromJson(response);
  }

  /// Returns a history of deployments for the group.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListDeploymentsResponse> listDeployments({
    required String groupId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/deployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeploymentsResponse.fromJson(response);
  }

  /// Lists the versions of a device definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [deviceDefinitionId] :
  /// The ID of the device definition.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListDeviceDefinitionVersionsResponse> listDeviceDefinitionVersions({
    required String deviceDefinitionId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/devices/${Uri.encodeComponent(deviceDefinitionId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeviceDefinitionVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of device definitions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListDeviceDefinitionsResponse> listDeviceDefinitions({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/definition/devices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeviceDefinitionsResponse.fromJson(response);
  }

  /// Lists the versions of a Lambda function definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [functionDefinitionId] :
  /// The ID of the Lambda function definition.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListFunctionDefinitionVersionsResponse>
      listFunctionDefinitionVersions({
    required String functionDefinitionId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/functions/${Uri.encodeComponent(functionDefinitionId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionDefinitionVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of Lambda function definitions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListFunctionDefinitionsResponse> listFunctionDefinitions({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/definition/functions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionDefinitionsResponse.fromJson(response);
  }

  /// Retrieves the current CAs for a group.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<ListGroupCertificateAuthoritiesResponse>
      listGroupCertificateAuthorities({
    required String groupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/certificateauthorities',
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupCertificateAuthoritiesResponse.fromJson(response);
  }

  /// Lists the versions of a group.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListGroupVersionsResponse> listGroupVersions({
    required String groupId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of groups.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListGroupsResponse> listGroups({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupsResponse.fromJson(response);
  }

  /// Lists the versions of a logger definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [loggerDefinitionId] :
  /// The ID of the logger definition.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListLoggerDefinitionVersionsResponse> listLoggerDefinitionVersions({
    required String loggerDefinitionId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/loggers/${Uri.encodeComponent(loggerDefinitionId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLoggerDefinitionVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of logger definitions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListLoggerDefinitionsResponse> listLoggerDefinitions({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/definition/loggers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLoggerDefinitionsResponse.fromJson(response);
  }

  /// Lists the versions of a resource definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceDefinitionId] :
  /// The ID of the resource definition.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListResourceDefinitionVersionsResponse>
      listResourceDefinitionVersions({
    required String resourceDefinitionId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/resources/${Uri.encodeComponent(resourceDefinitionId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceDefinitionVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of resource definitions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListResourceDefinitionsResponse> listResourceDefinitions({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/definition/resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceDefinitionsResponse.fromJson(response);
  }

  /// Lists the versions of a subscription definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [subscriptionDefinitionId] :
  /// The ID of the subscription definition.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListSubscriptionDefinitionVersionsResponse>
      listSubscriptionDefinitionVersions({
    required String subscriptionDefinitionId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/greengrass/definition/subscriptions/${Uri.encodeComponent(subscriptionDefinitionId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionDefinitionVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of subscription definitions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  Future<ListSubscriptionDefinitionsResponse> listSubscriptionDefinitions({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/greengrass/definition/subscriptions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionDefinitionsResponse.fromJson(response);
  }

  /// Retrieves a list of resource tags for a resource arn.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Resets a group's deployments.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [force] :
  /// If true, performs a best-effort only core reset.
  Future<ResetDeploymentsResponse> resetDeployments({
    required String groupId,
    String? amznClientToken,
    bool? force,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (force != null) 'Force': force,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/deployments/%24reset',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ResetDeploymentsResponse.fromJson(response);
  }

  /// Deploys multiple groups in one operation. This action starts the bulk
  /// deployment of a specified set of group versions. Each group version
  /// deployment will be triggered with an adaptive rate that has a fixed upper
  /// limit. We recommend that you include an ''X-Amzn-Client-Token'' token in
  /// every ''StartBulkDeployment'' request. These requests are idempotent with
  /// respect to the token and the request parameters.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [executionRoleArn] :
  /// The ARN of the execution role to associate with the bulk deployment
  /// operation. This IAM role must allow the ''greengrass:CreateDeployment''
  /// action for all group versions that are listed in the input file. This IAM
  /// role must have access to the S3 bucket containing the input file.
  ///
  /// Parameter [inputFileUri] :
  /// The URI of the input file contained in the S3 bucket. The execution role
  /// must have ''getObject'' permissions on this bucket to access the input
  /// file. The input file is a JSON-serialized, line delimited file with UTF-8
  /// encoding that provides a list of group and version IDs and the deployment
  /// type. This file must be less than 100 MB. Currently, AWS IoT Greengrass
  /// supports only ''NewDeployment'' deployment types.
  ///
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<StartBulkDeploymentResponse> startBulkDeployment({
    required String executionRoleArn,
    required String inputFileUri,
    String? amznClientToken,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (amznClientToken != null)
        'X-Amzn-Client-Token': amznClientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ExecutionRoleArn': executionRoleArn,
      'InputFileUri': inputFileUri,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/greengrass/bulk/deployments',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StartBulkDeploymentResponse.fromJson(response);
  }

  /// Stops the execution of a bulk deployment. This action returns a status of
  /// ''Stopping'' until the deployment is stopped. You cannot start a new bulk
  /// deployment while a previous deployment is in the ''Stopping'' state. This
  /// action doesn't rollback completed deployments or cancel pending
  /// deployments.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [bulkDeploymentId] :
  /// The ID of the bulk deployment.
  Future<void> stopBulkDeployment({
    required String bulkDeploymentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/greengrass/bulk/deployments/${Uri.encodeComponent(bulkDeploymentId)}/%24stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds tags to a Greengrass resource. Valid resources are 'Group',
  /// 'ConnectorDefinition', 'CoreDefinition', 'DeviceDefinition',
  /// 'FunctionDefinition', 'LoggerDefinition', 'SubscriptionDefinition',
  /// 'ResourceDefinition', and 'BulkDeployment'.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<void> tagResource({
    required String resourceArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove resource tags from a Greengrass Resource.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// An array of tag keys to delete
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

  /// Updates the connectivity information for the core. Any devices that belong
  /// to the group which has this core will receive this information in order to
  /// find the location of the core and connect to it.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [thingName] :
  /// The thing name.
  ///
  /// Parameter [connectivityInfo] :
  /// A list of connectivity info.
  Future<UpdateConnectivityInfoResponse> updateConnectivityInfo({
    required String thingName,
    List<ConnectivityInfo>? connectivityInfo,
  }) async {
    final $payload = <String, dynamic>{
      if (connectivityInfo != null) 'ConnectivityInfo': connectivityInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/things/${Uri.encodeComponent(thingName)}/connectivityInfo',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectivityInfoResponse.fromJson(response);
  }

  /// Updates a connector definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [connectorDefinitionId] :
  /// The ID of the connector definition.
  ///
  /// Parameter [name] :
  /// The name of the definition.
  Future<void> updateConnectorDefinition({
    required String connectorDefinitionId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/definition/connectors/${Uri.encodeComponent(connectorDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a core definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [coreDefinitionId] :
  /// The ID of the core definition.
  ///
  /// Parameter [name] :
  /// The name of the definition.
  Future<void> updateCoreDefinition({
    required String coreDefinitionId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/definition/cores/${Uri.encodeComponent(coreDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a device definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [deviceDefinitionId] :
  /// The ID of the device definition.
  ///
  /// Parameter [name] :
  /// The name of the definition.
  Future<void> updateDeviceDefinition({
    required String deviceDefinitionId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/definition/devices/${Uri.encodeComponent(deviceDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a Lambda function definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [functionDefinitionId] :
  /// The ID of the Lambda function definition.
  ///
  /// Parameter [name] :
  /// The name of the definition.
  Future<void> updateFunctionDefinition({
    required String functionDefinitionId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/definition/functions/${Uri.encodeComponent(functionDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a group.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [name] :
  /// The name of the definition.
  Future<void> updateGroup({
    required String groupId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the Certificate expiry time for a group.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  ///
  /// Parameter [certificateExpiryInMilliseconds] :
  /// The amount of time remaining before the certificate expires, in
  /// milliseconds.
  Future<UpdateGroupCertificateConfigurationResponse>
      updateGroupCertificateConfiguration({
    required String groupId,
    String? certificateExpiryInMilliseconds,
  }) async {
    final $payload = <String, dynamic>{
      if (certificateExpiryInMilliseconds != null)
        'CertificateExpiryInMilliseconds': certificateExpiryInMilliseconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/certificateauthorities/configuration/expiry',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGroupCertificateConfigurationResponse.fromJson(response);
  }

  /// Updates a logger definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [loggerDefinitionId] :
  /// The ID of the logger definition.
  ///
  /// Parameter [name] :
  /// The name of the definition.
  Future<void> updateLoggerDefinition({
    required String loggerDefinitionId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/definition/loggers/${Uri.encodeComponent(loggerDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a resource definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceDefinitionId] :
  /// The ID of the resource definition.
  ///
  /// Parameter [name] :
  /// The name of the definition.
  Future<void> updateResourceDefinition({
    required String resourceDefinitionId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/definition/resources/${Uri.encodeComponent(resourceDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a subscription definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [subscriptionDefinitionId] :
  /// The ID of the subscription definition.
  ///
  /// Parameter [name] :
  /// The name of the definition.
  Future<void> updateSubscriptionDefinition({
    required String subscriptionDefinitionId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/definition/subscriptions/${Uri.encodeComponent(subscriptionDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the runtime configuration of a thing.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [thingName] :
  /// The thing name.
  ///
  /// Parameter [telemetryConfiguration] :
  /// Configuration for telemetry service.
  Future<void> updateThingRuntimeConfiguration({
    required String thingName,
    TelemetryConfigurationUpdate? telemetryConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (telemetryConfiguration != null)
        'TelemetryConfiguration': telemetryConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/greengrass/things/${Uri.encodeComponent(thingName)}/runtimeconfig',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class AssociateRoleToGroupResponse {
  /// The time, in milliseconds since the epoch, when the role ARN was associated
  /// with the group.
  final String? associatedAt;

  AssociateRoleToGroupResponse({
    this.associatedAt,
  });

  factory AssociateRoleToGroupResponse.fromJson(Map<String, dynamic> json) {
    return AssociateRoleToGroupResponse(
      associatedAt: json['AssociatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAt = this.associatedAt;
    return {
      if (associatedAt != null) 'AssociatedAt': associatedAt,
    };
  }
}

class AssociateServiceRoleToAccountResponse {
  /// The time when the service role was associated with the account.
  final String? associatedAt;

  AssociateServiceRoleToAccountResponse({
    this.associatedAt,
  });

  factory AssociateServiceRoleToAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateServiceRoleToAccountResponse(
      associatedAt: json['AssociatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAt = this.associatedAt;
    return {
      if (associatedAt != null) 'AssociatedAt': associatedAt,
    };
  }
}

/// Information about a bulk deployment. You cannot start a new bulk deployment
/// while another one is still running or in a non-terminal state.
class BulkDeployment {
  /// The ARN of the bulk deployment.
  final String? bulkDeploymentArn;

  /// The ID of the bulk deployment.
  final String? bulkDeploymentId;

  /// The time, in ISO format, when the deployment was created.
  final String? createdAt;

  BulkDeployment({
    this.bulkDeploymentArn,
    this.bulkDeploymentId,
    this.createdAt,
  });

  factory BulkDeployment.fromJson(Map<String, dynamic> json) {
    return BulkDeployment(
      bulkDeploymentArn: json['BulkDeploymentArn'] as String?,
      bulkDeploymentId: json['BulkDeploymentId'] as String?,
      createdAt: json['CreatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bulkDeploymentArn = this.bulkDeploymentArn;
    final bulkDeploymentId = this.bulkDeploymentId;
    final createdAt = this.createdAt;
    return {
      if (bulkDeploymentArn != null) 'BulkDeploymentArn': bulkDeploymentArn,
      if (bulkDeploymentId != null) 'BulkDeploymentId': bulkDeploymentId,
      if (createdAt != null) 'CreatedAt': createdAt,
    };
  }
}

/// Relevant metrics on input records processed during bulk deployment.
class BulkDeploymentMetrics {
  /// The total number of records that returned a non-retryable error. For
  /// example, this can occur if a group record from the input file uses an
  /// invalid format or specifies a nonexistent group version, or if the execution
  /// role doesn't grant permission to deploy a group or group version.
  final int? invalidInputRecords;

  /// The total number of group records from the input file that have been
  /// processed so far, or attempted.
  final int? recordsProcessed;

  /// The total number of deployment attempts that returned a retryable error. For
  /// example, a retry is triggered if the attempt to deploy a group returns a
  /// throttling error. ''StartBulkDeployment'' retries a group deployment up to
  /// five times.
  final int? retryAttempts;

  BulkDeploymentMetrics({
    this.invalidInputRecords,
    this.recordsProcessed,
    this.retryAttempts,
  });

  factory BulkDeploymentMetrics.fromJson(Map<String, dynamic> json) {
    return BulkDeploymentMetrics(
      invalidInputRecords: json['InvalidInputRecords'] as int?,
      recordsProcessed: json['RecordsProcessed'] as int?,
      retryAttempts: json['RetryAttempts'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final invalidInputRecords = this.invalidInputRecords;
    final recordsProcessed = this.recordsProcessed;
    final retryAttempts = this.retryAttempts;
    return {
      if (invalidInputRecords != null)
        'InvalidInputRecords': invalidInputRecords,
      if (recordsProcessed != null) 'RecordsProcessed': recordsProcessed,
      if (retryAttempts != null) 'RetryAttempts': retryAttempts,
    };
  }
}

/// Information about an individual group deployment in a bulk deployment
/// operation.
class BulkDeploymentResult {
  /// The time, in ISO format, when the deployment was created.
  final String? createdAt;

  /// The ARN of the group deployment.
  final String? deploymentArn;

  /// The ID of the group deployment.
  final String? deploymentId;

  /// The current status of the group deployment: ''InProgress'', ''Building'',
  /// ''Success'', or ''Failure''.
  final String? deploymentStatus;

  /// The type of the deployment.
  final DeploymentType? deploymentType;

  /// Details about the error.
  final List<ErrorDetail>? errorDetails;

  /// The error message for a failed deployment
  final String? errorMessage;

  /// The ARN of the Greengrass group.
  final String? groupArn;

  BulkDeploymentResult({
    this.createdAt,
    this.deploymentArn,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentType,
    this.errorDetails,
    this.errorMessage,
    this.groupArn,
  });

  factory BulkDeploymentResult.fromJson(Map<String, dynamic> json) {
    return BulkDeploymentResult(
      createdAt: json['CreatedAt'] as String?,
      deploymentArn: json['DeploymentArn'] as String?,
      deploymentId: json['DeploymentId'] as String?,
      deploymentStatus: json['DeploymentStatus'] as String?,
      deploymentType: (json['DeploymentType'] as String?)?.toDeploymentType(),
      errorDetails: (json['ErrorDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['ErrorMessage'] as String?,
      groupArn: json['GroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deploymentArn = this.deploymentArn;
    final deploymentId = this.deploymentId;
    final deploymentStatus = this.deploymentStatus;
    final deploymentType = this.deploymentType;
    final errorDetails = this.errorDetails;
    final errorMessage = this.errorMessage;
    final groupArn = this.groupArn;
    return {
      if (createdAt != null) 'CreatedAt': createdAt,
      if (deploymentArn != null) 'DeploymentArn': deploymentArn,
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (deploymentStatus != null) 'DeploymentStatus': deploymentStatus,
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (groupArn != null) 'GroupArn': groupArn,
    };
  }
}

/// The current status of the bulk deployment.
enum BulkDeploymentStatus {
  initializing,
  running,
  completed,
  stopping,
  stopped,
  failed,
}

extension BulkDeploymentStatusValueExtension on BulkDeploymentStatus {
  String toValue() {
    switch (this) {
      case BulkDeploymentStatus.initializing:
        return 'Initializing';
      case BulkDeploymentStatus.running:
        return 'Running';
      case BulkDeploymentStatus.completed:
        return 'Completed';
      case BulkDeploymentStatus.stopping:
        return 'Stopping';
      case BulkDeploymentStatus.stopped:
        return 'Stopped';
      case BulkDeploymentStatus.failed:
        return 'Failed';
    }
  }
}

extension BulkDeploymentStatusFromString on String {
  BulkDeploymentStatus toBulkDeploymentStatus() {
    switch (this) {
      case 'Initializing':
        return BulkDeploymentStatus.initializing;
      case 'Running':
        return BulkDeploymentStatus.running;
      case 'Completed':
        return BulkDeploymentStatus.completed;
      case 'Stopping':
        return BulkDeploymentStatus.stopping;
      case 'Stopped':
        return BulkDeploymentStatus.stopped;
      case 'Failed':
        return BulkDeploymentStatus.failed;
    }
    throw Exception('$this is not known in enum BulkDeploymentStatus');
  }
}

enum ConfigurationSyncStatus {
  inSync,
  outOfSync,
}

extension ConfigurationSyncStatusValueExtension on ConfigurationSyncStatus {
  String toValue() {
    switch (this) {
      case ConfigurationSyncStatus.inSync:
        return 'InSync';
      case ConfigurationSyncStatus.outOfSync:
        return 'OutOfSync';
    }
  }
}

extension ConfigurationSyncStatusFromString on String {
  ConfigurationSyncStatus toConfigurationSyncStatus() {
    switch (this) {
      case 'InSync':
        return ConfigurationSyncStatus.inSync;
      case 'OutOfSync':
        return ConfigurationSyncStatus.outOfSync;
    }
    throw Exception('$this is not known in enum ConfigurationSyncStatus');
  }
}

/// Information about a Greengrass core's connectivity.
class ConnectivityInfo {
  /// The endpoint for the Greengrass core. Can be an IP address or DNS.
  final String? hostAddress;

  /// The ID of the connectivity information.
  final String? id;

  /// Metadata for this endpoint.
  final String? metadata;

  /// The port of the Greengrass core. Usually 8883.
  final int? portNumber;

  ConnectivityInfo({
    this.hostAddress,
    this.id,
    this.metadata,
    this.portNumber,
  });

  factory ConnectivityInfo.fromJson(Map<String, dynamic> json) {
    return ConnectivityInfo(
      hostAddress: json['HostAddress'] as String?,
      id: json['Id'] as String?,
      metadata: json['Metadata'] as String?,
      portNumber: json['PortNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostAddress = this.hostAddress;
    final id = this.id;
    final metadata = this.metadata;
    final portNumber = this.portNumber;
    return {
      if (hostAddress != null) 'HostAddress': hostAddress,
      if (id != null) 'Id': id,
      if (metadata != null) 'Metadata': metadata,
      if (portNumber != null) 'PortNumber': portNumber,
    };
  }
}

/// Information about a connector. Connectors run on the Greengrass core and
/// contain built-in integration with local infrastructure, device protocols,
/// AWS, and other cloud services.
class Connector {
  /// The ARN of the connector.
  final String connectorArn;

  /// A descriptive or arbitrary ID for the connector. This value must be unique
  /// within the connector definition version. Max length is 128 characters with
  /// pattern [a-zA-Z0-9:_-]+.
  final String id;

  /// The parameters or configuration that the connector uses.
  final Map<String, String>? parameters;

  Connector({
    required this.connectorArn,
    required this.id,
    this.parameters,
  });

  factory Connector.fromJson(Map<String, dynamic> json) {
    return Connector(
      connectorArn: json['ConnectorArn'] as String,
      id: json['Id'] as String,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    final id = this.id;
    final parameters = this.parameters;
    return {
      'ConnectorArn': connectorArn,
      'Id': id,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// Information about the connector definition version, which is a container for
/// connectors.
class ConnectorDefinitionVersion {
  /// A list of references to connectors in this version, with their corresponding
  /// configuration settings.
  final List<Connector>? connectors;

  ConnectorDefinitionVersion({
    this.connectors,
  });

  factory ConnectorDefinitionVersion.fromJson(Map<String, dynamic> json) {
    return ConnectorDefinitionVersion(
      connectors: (json['Connectors'] as List?)
          ?.whereNotNull()
          .map((e) => Connector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectors = this.connectors;
    return {
      if (connectors != null) 'Connectors': connectors,
    };
  }
}

/// Information about a core.
class Core {
  /// The ARN of the certificate associated with the core.
  final String certificateArn;

  /// A descriptive or arbitrary ID for the core. This value must be unique within
  /// the core definition version. Max length is 128 characters with pattern
  /// ''[a-zA-Z0-9:_-]+''.
  final String id;

  /// The ARN of the thing which is the core.
  final String thingArn;

  /// If true, the core's local shadow is automatically synced with the cloud.
  final bool? syncShadow;

  Core({
    required this.certificateArn,
    required this.id,
    required this.thingArn,
    this.syncShadow,
  });

  factory Core.fromJson(Map<String, dynamic> json) {
    return Core(
      certificateArn: json['CertificateArn'] as String,
      id: json['Id'] as String,
      thingArn: json['ThingArn'] as String,
      syncShadow: json['SyncShadow'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final id = this.id;
    final thingArn = this.thingArn;
    final syncShadow = this.syncShadow;
    return {
      'CertificateArn': certificateArn,
      'Id': id,
      'ThingArn': thingArn,
      if (syncShadow != null) 'SyncShadow': syncShadow,
    };
  }
}

/// Information about a core definition version.
class CoreDefinitionVersion {
  /// A list of cores in the core definition version.
  final List<Core>? cores;

  CoreDefinitionVersion({
    this.cores,
  });

  factory CoreDefinitionVersion.fromJson(Map<String, dynamic> json) {
    return CoreDefinitionVersion(
      cores: (json['Cores'] as List?)
          ?.whereNotNull()
          .map((e) => Core.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cores = this.cores;
    return {
      if (cores != null) 'Cores': cores,
    };
  }
}

class CreateConnectorDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  CreateConnectorDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });

  factory CreateConnectorDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateConnectorDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateConnectorDefinitionVersionResponse {
  /// The ARN of the version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String? creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  final String? id;

  /// The ID of the version.
  final String? version;

  CreateConnectorDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });

  factory CreateConnectorDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateConnectorDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class CreateCoreDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  CreateCoreDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });

  factory CreateCoreDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return CreateCoreDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateCoreDefinitionVersionResponse {
  /// The ARN of the version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String? creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  final String? id;

  /// The ID of the version.
  final String? version;

  CreateCoreDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });

  factory CreateCoreDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCoreDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class CreateDeploymentResponse {
  /// The ARN of the deployment.
  final String? deploymentArn;

  /// The ID of the deployment.
  final String? deploymentId;

  CreateDeploymentResponse({
    this.deploymentArn,
    this.deploymentId,
  });

  factory CreateDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentResponse(
      deploymentArn: json['DeploymentArn'] as String?,
      deploymentId: json['DeploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentArn = this.deploymentArn;
    final deploymentId = this.deploymentId;
    return {
      if (deploymentArn != null) 'DeploymentArn': deploymentArn,
      if (deploymentId != null) 'DeploymentId': deploymentId,
    };
  }
}

class CreateDeviceDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  CreateDeviceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });

  factory CreateDeviceDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeviceDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateDeviceDefinitionVersionResponse {
  /// The ARN of the version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String? creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  final String? id;

  /// The ID of the version.
  final String? version;

  CreateDeviceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });

  factory CreateDeviceDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDeviceDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class CreateFunctionDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  CreateFunctionDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });

  factory CreateFunctionDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return CreateFunctionDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateFunctionDefinitionVersionResponse {
  /// The ARN of the version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String? creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  final String? id;

  /// The ID of the version.
  final String? version;

  CreateFunctionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });

  factory CreateFunctionDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateFunctionDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class CreateGroupCertificateAuthorityResponse {
  /// The ARN of the group certificate authority.
  final String? groupCertificateAuthorityArn;

  CreateGroupCertificateAuthorityResponse({
    this.groupCertificateAuthorityArn,
  });

  factory CreateGroupCertificateAuthorityResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateGroupCertificateAuthorityResponse(
      groupCertificateAuthorityArn:
          json['GroupCertificateAuthorityArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupCertificateAuthorityArn = this.groupCertificateAuthorityArn;
    return {
      if (groupCertificateAuthorityArn != null)
        'GroupCertificateAuthorityArn': groupCertificateAuthorityArn,
    };
  }
}

class CreateGroupResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  CreateGroupResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });

  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateGroupResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateGroupVersionResponse {
  /// The ARN of the version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String? creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  final String? id;

  /// The ID of the version.
  final String? version;

  CreateGroupVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });

  factory CreateGroupVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateGroupVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class CreateLoggerDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  CreateLoggerDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });

  factory CreateLoggerDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return CreateLoggerDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateLoggerDefinitionVersionResponse {
  /// The ARN of the version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String? creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  final String? id;

  /// The ID of the version.
  final String? version;

  CreateLoggerDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });

  factory CreateLoggerDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLoggerDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class CreateResourceDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  CreateResourceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });

  factory CreateResourceDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return CreateResourceDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateResourceDefinitionVersionResponse {
  /// The ARN of the version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String? creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  final String? id;

  /// The ID of the version.
  final String? version;

  CreateResourceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });

  factory CreateResourceDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateResourceDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class CreateSoftwareUpdateJobResponse {
  /// The IoT Job ARN corresponding to this update.
  final String? iotJobArn;

  /// The IoT Job Id corresponding to this update.
  final String? iotJobId;

  /// The software version installed on the device or devices after the update.
  final String? platformSoftwareVersion;

  CreateSoftwareUpdateJobResponse({
    this.iotJobArn,
    this.iotJobId,
    this.platformSoftwareVersion,
  });

  factory CreateSoftwareUpdateJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateSoftwareUpdateJobResponse(
      iotJobArn: json['IotJobArn'] as String?,
      iotJobId: json['IotJobId'] as String?,
      platformSoftwareVersion: json['PlatformSoftwareVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iotJobArn = this.iotJobArn;
    final iotJobId = this.iotJobId;
    final platformSoftwareVersion = this.platformSoftwareVersion;
    return {
      if (iotJobArn != null) 'IotJobArn': iotJobArn,
      if (iotJobId != null) 'IotJobId': iotJobId,
      if (platformSoftwareVersion != null)
        'PlatformSoftwareVersion': platformSoftwareVersion,
    };
  }
}

class CreateSubscriptionDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  CreateSubscriptionDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });

  factory CreateSubscriptionDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSubscriptionDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateSubscriptionDefinitionVersionResponse {
  /// The ARN of the version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String? creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  final String? id;

  /// The ID of the version.
  final String? version;

  CreateSubscriptionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });

  factory CreateSubscriptionDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSubscriptionDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

/// Information about a definition.
class DefinitionInformation {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  DefinitionInformation({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });

  factory DefinitionInformation.fromJson(Map<String, dynamic> json) {
    return DefinitionInformation(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class DeleteConnectorDefinitionResponse {
  DeleteConnectorDefinitionResponse();

  factory DeleteConnectorDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteConnectorDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteCoreDefinitionResponse {
  DeleteCoreDefinitionResponse();

  factory DeleteCoreDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCoreDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDeviceDefinitionResponse {
  DeleteDeviceDefinitionResponse();

  factory DeleteDeviceDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDeviceDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFunctionDefinitionResponse {
  DeleteFunctionDefinitionResponse();

  factory DeleteFunctionDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFunctionDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteGroupResponse {
  DeleteGroupResponse();

  factory DeleteGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLoggerDefinitionResponse {
  DeleteLoggerDefinitionResponse();

  factory DeleteLoggerDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLoggerDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResourceDefinitionResponse {
  DeleteResourceDefinitionResponse();

  factory DeleteResourceDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourceDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSubscriptionDefinitionResponse {
  DeleteSubscriptionDefinitionResponse();

  factory DeleteSubscriptionDefinitionResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteSubscriptionDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a deployment.
class Deployment {
  /// The time, in milliseconds since the epoch, when the deployment was created.
  final String? createdAt;

  /// The ARN of the deployment.
  final String? deploymentArn;

  /// The ID of the deployment.
  final String? deploymentId;

  /// The type of the deployment.
  final DeploymentType? deploymentType;

  /// The ARN of the group for this deployment.
  final String? groupArn;

  Deployment({
    this.createdAt,
    this.deploymentArn,
    this.deploymentId,
    this.deploymentType,
    this.groupArn,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      createdAt: json['CreatedAt'] as String?,
      deploymentArn: json['DeploymentArn'] as String?,
      deploymentId: json['DeploymentId'] as String?,
      deploymentType: (json['DeploymentType'] as String?)?.toDeploymentType(),
      groupArn: json['GroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deploymentArn = this.deploymentArn;
    final deploymentId = this.deploymentId;
    final deploymentType = this.deploymentType;
    final groupArn = this.groupArn;
    return {
      if (createdAt != null) 'CreatedAt': createdAt,
      if (deploymentArn != null) 'DeploymentArn': deploymentArn,
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (groupArn != null) 'GroupArn': groupArn,
    };
  }
}

/// The type of deployment. When used for ''CreateDeployment'', only
/// ''NewDeployment'' and ''Redeployment'' are valid.
enum DeploymentType {
  newDeployment,
  redeployment,
  resetDeployment,
  forceResetDeployment,
}

extension DeploymentTypeValueExtension on DeploymentType {
  String toValue() {
    switch (this) {
      case DeploymentType.newDeployment:
        return 'NewDeployment';
      case DeploymentType.redeployment:
        return 'Redeployment';
      case DeploymentType.resetDeployment:
        return 'ResetDeployment';
      case DeploymentType.forceResetDeployment:
        return 'ForceResetDeployment';
    }
  }
}

extension DeploymentTypeFromString on String {
  DeploymentType toDeploymentType() {
    switch (this) {
      case 'NewDeployment':
        return DeploymentType.newDeployment;
      case 'Redeployment':
        return DeploymentType.redeployment;
      case 'ResetDeployment':
        return DeploymentType.resetDeployment;
      case 'ForceResetDeployment':
        return DeploymentType.forceResetDeployment;
    }
    throw Exception('$this is not known in enum DeploymentType');
  }
}

/// Information about a device.
class Device {
  /// The ARN of the certificate associated with the device.
  final String certificateArn;

  /// A descriptive or arbitrary ID for the device. This value must be unique
  /// within the device definition version. Max length is 128 characters with
  /// pattern ''[a-zA-Z0-9:_-]+''.
  final String id;

  /// The thing ARN of the device.
  final String thingArn;

  /// If true, the device's local shadow will be automatically synced with the
  /// cloud.
  final bool? syncShadow;

  Device({
    required this.certificateArn,
    required this.id,
    required this.thingArn,
    this.syncShadow,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      certificateArn: json['CertificateArn'] as String,
      id: json['Id'] as String,
      thingArn: json['ThingArn'] as String,
      syncShadow: json['SyncShadow'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final id = this.id;
    final thingArn = this.thingArn;
    final syncShadow = this.syncShadow;
    return {
      'CertificateArn': certificateArn,
      'Id': id,
      'ThingArn': thingArn,
      if (syncShadow != null) 'SyncShadow': syncShadow,
    };
  }
}

/// Information about a device definition version.
class DeviceDefinitionVersion {
  /// A list of devices in the definition version.
  final List<Device>? devices;

  DeviceDefinitionVersion({
    this.devices,
  });

  factory DeviceDefinitionVersion.fromJson(Map<String, dynamic> json) {
    return DeviceDefinitionVersion(
      devices: (json['Devices'] as List?)
          ?.whereNotNull()
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    return {
      if (devices != null) 'Devices': devices,
    };
  }
}

class DisassociateRoleFromGroupResponse {
  /// The time, in milliseconds since the epoch, when the role was disassociated
  /// from the group.
  final String? disassociatedAt;

  DisassociateRoleFromGroupResponse({
    this.disassociatedAt,
  });

  factory DisassociateRoleFromGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateRoleFromGroupResponse(
      disassociatedAt: json['DisassociatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final disassociatedAt = this.disassociatedAt;
    return {
      if (disassociatedAt != null) 'DisassociatedAt': disassociatedAt,
    };
  }
}

class DisassociateServiceRoleFromAccountResponse {
  /// The time when the service role was disassociated from the account.
  final String? disassociatedAt;

  DisassociateServiceRoleFromAccountResponse({
    this.disassociatedAt,
  });

  factory DisassociateServiceRoleFromAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateServiceRoleFromAccountResponse(
      disassociatedAt: json['DisassociatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final disassociatedAt = this.disassociatedAt;
    return {
      if (disassociatedAt != null) 'DisassociatedAt': disassociatedAt,
    };
  }
}

enum EncodingType {
  binary,
  json,
}

extension EncodingTypeValueExtension on EncodingType {
  String toValue() {
    switch (this) {
      case EncodingType.binary:
        return 'binary';
      case EncodingType.json:
        return 'json';
    }
  }
}

extension EncodingTypeFromString on String {
  EncodingType toEncodingType() {
    switch (this) {
      case 'binary':
        return EncodingType.binary;
      case 'json':
        return EncodingType.json;
    }
    throw Exception('$this is not known in enum EncodingType');
  }
}

/// Details about the error.
class ErrorDetail {
  /// A detailed error code.
  final String? detailedErrorCode;

  /// A detailed error message.
  final String? detailedErrorMessage;

  ErrorDetail({
    this.detailedErrorCode,
    this.detailedErrorMessage,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      detailedErrorCode: json['DetailedErrorCode'] as String?,
      detailedErrorMessage: json['DetailedErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detailedErrorCode = this.detailedErrorCode;
    final detailedErrorMessage = this.detailedErrorMessage;
    return {
      if (detailedErrorCode != null) 'DetailedErrorCode': detailedErrorCode,
      if (detailedErrorMessage != null)
        'DetailedErrorMessage': detailedErrorMessage,
    };
  }
}

/// Information about a Lambda function.
class $Function {
  /// A descriptive or arbitrary ID for the function. This value must be unique
  /// within the function definition version. Max length is 128 characters with
  /// pattern ''[a-zA-Z0-9:_-]+''.
  final String id;

  /// The ARN of the Lambda function.
  final String? functionArn;

  /// The configuration of the Lambda function.
  final FunctionConfiguration? functionConfiguration;

  $Function({
    required this.id,
    this.functionArn,
    this.functionConfiguration,
  });

  factory $Function.fromJson(Map<String, dynamic> json) {
    return $Function(
      id: json['Id'] as String,
      functionArn: json['FunctionArn'] as String?,
      functionConfiguration: json['FunctionConfiguration'] != null
          ? FunctionConfiguration.fromJson(
              json['FunctionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final functionArn = this.functionArn;
    final functionConfiguration = this.functionConfiguration;
    return {
      'Id': id,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (functionConfiguration != null)
        'FunctionConfiguration': functionConfiguration,
    };
  }
}

/// The configuration of the Lambda function.
class FunctionConfiguration {
  /// The expected encoding type of the input payload for the function. The
  /// default is ''json''.
  final EncodingType? encodingType;

  /// The environment configuration of the function.
  final FunctionConfigurationEnvironment? environment;

  /// The execution arguments.
  final String? execArgs;

  /// The name of the function executable.
  final String? executable;

  /// The Lambda runtime supported by Greengrass which is to be used instead of
  /// the one specified in the Lambda function.
  final String? functionRuntimeOverride;

  /// The memory size, in KB, which the function requires. This setting is not
  /// applicable and should be cleared when you run the Lambda function without
  /// containerization.
  final int? memorySize;

  /// True if the function is pinned. Pinned means the function is long-lived and
  /// starts when the core starts.
  final bool? pinned;

  /// The allowed function execution time, after which Lambda should terminate the
  /// function. This timeout still applies to pinned Lambda functions for each
  /// request.
  final int? timeout;

  FunctionConfiguration({
    this.encodingType,
    this.environment,
    this.execArgs,
    this.executable,
    this.functionRuntimeOverride,
    this.memorySize,
    this.pinned,
    this.timeout,
  });

  factory FunctionConfiguration.fromJson(Map<String, dynamic> json) {
    return FunctionConfiguration(
      encodingType: (json['EncodingType'] as String?)?.toEncodingType(),
      environment: json['Environment'] != null
          ? FunctionConfigurationEnvironment.fromJson(
              json['Environment'] as Map<String, dynamic>)
          : null,
      execArgs: json['ExecArgs'] as String?,
      executable: json['Executable'] as String?,
      functionRuntimeOverride: json['FunctionRuntimeOverride'] as String?,
      memorySize: json['MemorySize'] as int?,
      pinned: json['Pinned'] as bool?,
      timeout: json['Timeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final encodingType = this.encodingType;
    final environment = this.environment;
    final execArgs = this.execArgs;
    final executable = this.executable;
    final functionRuntimeOverride = this.functionRuntimeOverride;
    final memorySize = this.memorySize;
    final pinned = this.pinned;
    final timeout = this.timeout;
    return {
      if (encodingType != null) 'EncodingType': encodingType.toValue(),
      if (environment != null) 'Environment': environment,
      if (execArgs != null) 'ExecArgs': execArgs,
      if (executable != null) 'Executable': executable,
      if (functionRuntimeOverride != null)
        'FunctionRuntimeOverride': functionRuntimeOverride,
      if (memorySize != null) 'MemorySize': memorySize,
      if (pinned != null) 'Pinned': pinned,
      if (timeout != null) 'Timeout': timeout,
    };
  }
}

/// The environment configuration of the function.
class FunctionConfigurationEnvironment {
  /// If true, the Lambda function is allowed to access the host's /sys folder.
  /// Use this when the Lambda function needs to read device information from
  /// /sys. This setting applies only when you run the Lambda function in a
  /// Greengrass container.
  final bool? accessSysfs;

  /// Configuration related to executing the Lambda function
  final FunctionExecutionConfig? execution;

  /// A list of the resources, with their permissions, to which the Lambda
  /// function will be granted access. A Lambda function can have at most 10
  /// resources. ResourceAccessPolicies apply only when you run the Lambda
  /// function in a Greengrass container.
  final List<ResourceAccessPolicy>? resourceAccessPolicies;

  /// Environment variables for the Lambda function's configuration.
  final Map<String, String>? variables;

  FunctionConfigurationEnvironment({
    this.accessSysfs,
    this.execution,
    this.resourceAccessPolicies,
    this.variables,
  });

  factory FunctionConfigurationEnvironment.fromJson(Map<String, dynamic> json) {
    return FunctionConfigurationEnvironment(
      accessSysfs: json['AccessSysfs'] as bool?,
      execution: json['Execution'] != null
          ? FunctionExecutionConfig.fromJson(
              json['Execution'] as Map<String, dynamic>)
          : null,
      resourceAccessPolicies: (json['ResourceAccessPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceAccessPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      variables: (json['Variables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessSysfs = this.accessSysfs;
    final execution = this.execution;
    final resourceAccessPolicies = this.resourceAccessPolicies;
    final variables = this.variables;
    return {
      if (accessSysfs != null) 'AccessSysfs': accessSysfs,
      if (execution != null) 'Execution': execution,
      if (resourceAccessPolicies != null)
        'ResourceAccessPolicies': resourceAccessPolicies,
      if (variables != null) 'Variables': variables,
    };
  }
}

/// The default configuration that applies to all Lambda functions in the group.
/// Individual Lambda functions can override these settings.
class FunctionDefaultConfig {
  final FunctionDefaultExecutionConfig? execution;

  FunctionDefaultConfig({
    this.execution,
  });

  factory FunctionDefaultConfig.fromJson(Map<String, dynamic> json) {
    return FunctionDefaultConfig(
      execution: json['Execution'] != null
          ? FunctionDefaultExecutionConfig.fromJson(
              json['Execution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final execution = this.execution;
    return {
      if (execution != null) 'Execution': execution,
    };
  }
}

/// Configuration information that specifies how a Lambda function runs.
class FunctionDefaultExecutionConfig {
  final FunctionIsolationMode? isolationMode;
  final FunctionRunAsConfig? runAs;

  FunctionDefaultExecutionConfig({
    this.isolationMode,
    this.runAs,
  });

  factory FunctionDefaultExecutionConfig.fromJson(Map<String, dynamic> json) {
    return FunctionDefaultExecutionConfig(
      isolationMode:
          (json['IsolationMode'] as String?)?.toFunctionIsolationMode(),
      runAs: json['RunAs'] != null
          ? FunctionRunAsConfig.fromJson(json['RunAs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final isolationMode = this.isolationMode;
    final runAs = this.runAs;
    return {
      if (isolationMode != null) 'IsolationMode': isolationMode.toValue(),
      if (runAs != null) 'RunAs': runAs,
    };
  }
}

/// Information about a function definition version.
class FunctionDefinitionVersion {
  /// The default configuration that applies to all Lambda functions in this
  /// function definition version. Individual Lambda functions can override these
  /// settings.
  final FunctionDefaultConfig? defaultConfig;

  /// A list of Lambda functions in this function definition version.
  final List<$Function>? functions;

  FunctionDefinitionVersion({
    this.defaultConfig,
    this.functions,
  });

  factory FunctionDefinitionVersion.fromJson(Map<String, dynamic> json) {
    return FunctionDefinitionVersion(
      defaultConfig: json['DefaultConfig'] != null
          ? FunctionDefaultConfig.fromJson(
              json['DefaultConfig'] as Map<String, dynamic>)
          : null,
      functions: (json['Functions'] as List?)
          ?.whereNotNull()
          .map((e) => $Function.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultConfig = this.defaultConfig;
    final functions = this.functions;
    return {
      if (defaultConfig != null) 'DefaultConfig': defaultConfig,
      if (functions != null) 'Functions': functions,
    };
  }
}

/// Configuration information that specifies how a Lambda function runs.
class FunctionExecutionConfig {
  final FunctionIsolationMode? isolationMode;
  final FunctionRunAsConfig? runAs;

  FunctionExecutionConfig({
    this.isolationMode,
    this.runAs,
  });

  factory FunctionExecutionConfig.fromJson(Map<String, dynamic> json) {
    return FunctionExecutionConfig(
      isolationMode:
          (json['IsolationMode'] as String?)?.toFunctionIsolationMode(),
      runAs: json['RunAs'] != null
          ? FunctionRunAsConfig.fromJson(json['RunAs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final isolationMode = this.isolationMode;
    final runAs = this.runAs;
    return {
      if (isolationMode != null) 'IsolationMode': isolationMode.toValue(),
      if (runAs != null) 'RunAs': runAs,
    };
  }
}

/// Specifies whether the Lambda function runs in a Greengrass container
/// (default) or without containerization. Unless your scenario requires that
/// you run without containerization, we recommend that you run in a Greengrass
/// container. Omit this value to run the Lambda function with the default
/// containerization for the group.
enum FunctionIsolationMode {
  greengrassContainer,
  noContainer,
}

extension FunctionIsolationModeValueExtension on FunctionIsolationMode {
  String toValue() {
    switch (this) {
      case FunctionIsolationMode.greengrassContainer:
        return 'GreengrassContainer';
      case FunctionIsolationMode.noContainer:
        return 'NoContainer';
    }
  }
}

extension FunctionIsolationModeFromString on String {
  FunctionIsolationMode toFunctionIsolationMode() {
    switch (this) {
      case 'GreengrassContainer':
        return FunctionIsolationMode.greengrassContainer;
      case 'NoContainer':
        return FunctionIsolationMode.noContainer;
    }
    throw Exception('$this is not known in enum FunctionIsolationMode');
  }
}

/// Specifies the user and group whose permissions are used when running the
/// Lambda function. You can specify one or both values to override the default
/// values. We recommend that you avoid running as root unless absolutely
/// necessary to minimize the risk of unintended changes or malicious attacks.
/// To run as root, you must set ''IsolationMode'' to ''NoContainer'' and update
/// config.json in ''greengrass-root/config'' to set
/// ''allowFunctionsToRunAsRoot'' to ''yes''.
class FunctionRunAsConfig {
  /// The group ID whose permissions are used to run a Lambda function.
  final int? gid;

  /// The user ID whose permissions are used to run a Lambda function.
  final int? uid;

  FunctionRunAsConfig({
    this.gid,
    this.uid,
  });

  factory FunctionRunAsConfig.fromJson(Map<String, dynamic> json) {
    return FunctionRunAsConfig(
      gid: json['Gid'] as int?,
      uid: json['Uid'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final gid = this.gid;
    final uid = this.uid;
    return {
      if (gid != null) 'Gid': gid,
      if (uid != null) 'Uid': uid,
    };
  }
}

class GetAssociatedRoleResponse {
  /// The time when the role was associated with the group.
  final String? associatedAt;

  /// The ARN of the role that is associated with the group.
  final String? roleArn;

  GetAssociatedRoleResponse({
    this.associatedAt,
    this.roleArn,
  });

  factory GetAssociatedRoleResponse.fromJson(Map<String, dynamic> json) {
    return GetAssociatedRoleResponse(
      associatedAt: json['AssociatedAt'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAt = this.associatedAt;
    final roleArn = this.roleArn;
    return {
      if (associatedAt != null) 'AssociatedAt': associatedAt,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

class GetBulkDeploymentStatusResponse {
  /// Relevant metrics on input records processed during bulk deployment.
  final BulkDeploymentMetrics? bulkDeploymentMetrics;

  /// The status of the bulk deployment.
  final BulkDeploymentStatus? bulkDeploymentStatus;

  /// The time, in ISO format, when the deployment was created.
  final String? createdAt;

  /// Error details
  final List<ErrorDetail>? errorDetails;

  /// Error message
  final String? errorMessage;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  GetBulkDeploymentStatusResponse({
    this.bulkDeploymentMetrics,
    this.bulkDeploymentStatus,
    this.createdAt,
    this.errorDetails,
    this.errorMessage,
    this.tags,
  });

  factory GetBulkDeploymentStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetBulkDeploymentStatusResponse(
      bulkDeploymentMetrics: json['BulkDeploymentMetrics'] != null
          ? BulkDeploymentMetrics.fromJson(
              json['BulkDeploymentMetrics'] as Map<String, dynamic>)
          : null,
      bulkDeploymentStatus:
          (json['BulkDeploymentStatus'] as String?)?.toBulkDeploymentStatus(),
      createdAt: json['CreatedAt'] as String?,
      errorDetails: (json['ErrorDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['ErrorMessage'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final bulkDeploymentMetrics = this.bulkDeploymentMetrics;
    final bulkDeploymentStatus = this.bulkDeploymentStatus;
    final createdAt = this.createdAt;
    final errorDetails = this.errorDetails;
    final errorMessage = this.errorMessage;
    final tags = this.tags;
    return {
      if (bulkDeploymentMetrics != null)
        'BulkDeploymentMetrics': bulkDeploymentMetrics,
      if (bulkDeploymentStatus != null)
        'BulkDeploymentStatus': bulkDeploymentStatus.toValue(),
      if (createdAt != null) 'CreatedAt': createdAt,
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetConnectivityInfoResponse {
  /// Connectivity info list.
  final List<ConnectivityInfo>? connectivityInfo;

  /// A message about the connectivity info request.
  final String? message;

  GetConnectivityInfoResponse({
    this.connectivityInfo,
    this.message,
  });

  factory GetConnectivityInfoResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectivityInfoResponse(
      connectivityInfo: (json['ConnectivityInfo'] as List?)
          ?.whereNotNull()
          .map((e) => ConnectivityInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectivityInfo = this.connectivityInfo;
    final message = this.message;
    return {
      if (connectivityInfo != null) 'ConnectivityInfo': connectivityInfo,
      if (message != null) 'message': message,
    };
  }
}

class GetConnectorDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  GetConnectorDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });

  factory GetConnectorDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectorDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetConnectorDefinitionVersionResponse {
  /// The ARN of the connector definition version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the connector definition
  /// version was created.
  final String? creationTimestamp;

  /// Information about the connector definition version.
  final ConnectorDefinitionVersion? definition;

  /// The ID of the connector definition version.
  final String? id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// The version of the connector definition version.
  final String? version;

  GetConnectorDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });

  factory GetConnectorDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConnectorDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      definition: json['Definition'] != null
          ? ConnectorDefinitionVersion.fromJson(
              json['Definition'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      nextToken: json['NextToken'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final definition = this.definition;
    final id = this.id;
    final nextToken = this.nextToken;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (definition != null) 'Definition': definition,
      if (id != null) 'Id': id,
      if (nextToken != null) 'NextToken': nextToken,
      if (version != null) 'Version': version,
    };
  }
}

class GetCoreDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  GetCoreDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });

  factory GetCoreDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetCoreDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetCoreDefinitionVersionResponse {
  /// The ARN of the core definition version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the core definition version
  /// was created.
  final String? creationTimestamp;

  /// Information about the core definition version.
  final CoreDefinitionVersion? definition;

  /// The ID of the core definition version.
  final String? id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// The version of the core definition version.
  final String? version;

  GetCoreDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });

  factory GetCoreDefinitionVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetCoreDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      definition: json['Definition'] != null
          ? CoreDefinitionVersion.fromJson(
              json['Definition'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      nextToken: json['NextToken'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final definition = this.definition;
    final id = this.id;
    final nextToken = this.nextToken;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (definition != null) 'Definition': definition,
      if (id != null) 'Id': id,
      if (nextToken != null) 'NextToken': nextToken,
      if (version != null) 'Version': version,
    };
  }
}

class GetDeploymentStatusResponse {
  /// The status of the deployment: ''InProgress'', ''Building'', ''Success'', or
  /// ''Failure''.
  final String? deploymentStatus;

  /// The type of the deployment.
  final DeploymentType? deploymentType;

  /// Error details
  final List<ErrorDetail>? errorDetails;

  /// Error message
  final String? errorMessage;

  /// The time, in milliseconds since the epoch, when the deployment status was
  /// updated.
  final String? updatedAt;

  GetDeploymentStatusResponse({
    this.deploymentStatus,
    this.deploymentType,
    this.errorDetails,
    this.errorMessage,
    this.updatedAt,
  });

  factory GetDeploymentStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetDeploymentStatusResponse(
      deploymentStatus: json['DeploymentStatus'] as String?,
      deploymentType: (json['DeploymentType'] as String?)?.toDeploymentType(),
      errorDetails: (json['ErrorDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['ErrorMessage'] as String?,
      updatedAt: json['UpdatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentStatus = this.deploymentStatus;
    final deploymentType = this.deploymentType;
    final errorDetails = this.errorDetails;
    final errorMessage = this.errorMessage;
    final updatedAt = this.updatedAt;
    return {
      if (deploymentStatus != null) 'DeploymentStatus': deploymentStatus,
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (updatedAt != null) 'UpdatedAt': updatedAt,
    };
  }
}

class GetDeviceDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  GetDeviceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });

  factory GetDeviceDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetDeviceDefinitionVersionResponse {
  /// The ARN of the device definition version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the device definition
  /// version was created.
  final String? creationTimestamp;

  /// Information about the device definition version.
  final DeviceDefinitionVersion? definition;

  /// The ID of the device definition version.
  final String? id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// The version of the device definition version.
  final String? version;

  GetDeviceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });

  factory GetDeviceDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDeviceDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      definition: json['Definition'] != null
          ? DeviceDefinitionVersion.fromJson(
              json['Definition'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      nextToken: json['NextToken'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final definition = this.definition;
    final id = this.id;
    final nextToken = this.nextToken;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (definition != null) 'Definition': definition,
      if (id != null) 'Id': id,
      if (nextToken != null) 'NextToken': nextToken,
      if (version != null) 'Version': version,
    };
  }
}

class GetFunctionDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  GetFunctionDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });

  factory GetFunctionDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetFunctionDefinitionVersionResponse {
  /// The ARN of the function definition version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the function definition
  /// version was created.
  final String? creationTimestamp;

  /// Information on the definition.
  final FunctionDefinitionVersion? definition;

  /// The ID of the function definition version.
  final String? id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// The version of the function definition version.
  final String? version;

  GetFunctionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });

  factory GetFunctionDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFunctionDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      definition: json['Definition'] != null
          ? FunctionDefinitionVersion.fromJson(
              json['Definition'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      nextToken: json['NextToken'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final definition = this.definition;
    final id = this.id;
    final nextToken = this.nextToken;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (definition != null) 'Definition': definition,
      if (id != null) 'Id': id,
      if (nextToken != null) 'NextToken': nextToken,
      if (version != null) 'Version': version,
    };
  }
}

class GetGroupCertificateAuthorityResponse {
  /// The ARN of the certificate authority for the group.
  final String? groupCertificateAuthorityArn;

  /// The ID of the certificate authority for the group.
  final String? groupCertificateAuthorityId;

  /// The PEM encoded certificate for the group.
  final String? pemEncodedCertificate;

  GetGroupCertificateAuthorityResponse({
    this.groupCertificateAuthorityArn,
    this.groupCertificateAuthorityId,
    this.pemEncodedCertificate,
  });

  factory GetGroupCertificateAuthorityResponse.fromJson(
      Map<String, dynamic> json) {
    return GetGroupCertificateAuthorityResponse(
      groupCertificateAuthorityArn:
          json['GroupCertificateAuthorityArn'] as String?,
      groupCertificateAuthorityId:
          json['GroupCertificateAuthorityId'] as String?,
      pemEncodedCertificate: json['PemEncodedCertificate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupCertificateAuthorityArn = this.groupCertificateAuthorityArn;
    final groupCertificateAuthorityId = this.groupCertificateAuthorityId;
    final pemEncodedCertificate = this.pemEncodedCertificate;
    return {
      if (groupCertificateAuthorityArn != null)
        'GroupCertificateAuthorityArn': groupCertificateAuthorityArn,
      if (groupCertificateAuthorityId != null)
        'GroupCertificateAuthorityId': groupCertificateAuthorityId,
      if (pemEncodedCertificate != null)
        'PemEncodedCertificate': pemEncodedCertificate,
    };
  }
}

class GetGroupCertificateConfigurationResponse {
  /// The amount of time remaining before the certificate authority expires, in
  /// milliseconds.
  final String? certificateAuthorityExpiryInMilliseconds;

  /// The amount of time remaining before the certificate expires, in
  /// milliseconds.
  final String? certificateExpiryInMilliseconds;

  /// The ID of the group certificate configuration.
  final String? groupId;

  GetGroupCertificateConfigurationResponse({
    this.certificateAuthorityExpiryInMilliseconds,
    this.certificateExpiryInMilliseconds,
    this.groupId,
  });

  factory GetGroupCertificateConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetGroupCertificateConfigurationResponse(
      certificateAuthorityExpiryInMilliseconds:
          json['CertificateAuthorityExpiryInMilliseconds'] as String?,
      certificateExpiryInMilliseconds:
          json['CertificateExpiryInMilliseconds'] as String?,
      groupId: json['GroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityExpiryInMilliseconds =
        this.certificateAuthorityExpiryInMilliseconds;
    final certificateExpiryInMilliseconds =
        this.certificateExpiryInMilliseconds;
    final groupId = this.groupId;
    return {
      if (certificateAuthorityExpiryInMilliseconds != null)
        'CertificateAuthorityExpiryInMilliseconds':
            certificateAuthorityExpiryInMilliseconds,
      if (certificateExpiryInMilliseconds != null)
        'CertificateExpiryInMilliseconds': certificateExpiryInMilliseconds,
      if (groupId != null) 'GroupId': groupId,
    };
  }
}

class GetGroupResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  GetGroupResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });

  factory GetGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetGroupResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetGroupVersionResponse {
  /// The ARN of the group version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the group version was
  /// created.
  final String? creationTimestamp;

  /// Information about the group version definition.
  final GroupVersion? definition;

  /// The ID of the group that the version is associated with.
  final String? id;

  /// The ID of the group version.
  final String? version;

  GetGroupVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.version,
  });

  factory GetGroupVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetGroupVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      definition: json['Definition'] != null
          ? GroupVersion.fromJson(json['Definition'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final definition = this.definition;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (definition != null) 'Definition': definition,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class GetLoggerDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  GetLoggerDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });

  factory GetLoggerDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetLoggerDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetLoggerDefinitionVersionResponse {
  /// The ARN of the logger definition version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the logger definition
  /// version was created.
  final String? creationTimestamp;

  /// Information about the logger definition version.
  final LoggerDefinitionVersion? definition;

  /// The ID of the logger definition version.
  final String? id;

  /// The version of the logger definition version.
  final String? version;

  GetLoggerDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.version,
  });

  factory GetLoggerDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetLoggerDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      definition: json['Definition'] != null
          ? LoggerDefinitionVersion.fromJson(
              json['Definition'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final definition = this.definition;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (definition != null) 'Definition': definition,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class GetResourceDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  GetResourceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });

  factory GetResourceDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetResourceDefinitionVersionResponse {
  /// Arn of the resource definition version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the resource definition
  /// version was created.
  final String? creationTimestamp;

  /// Information about the definition.
  final ResourceDefinitionVersion? definition;

  /// The ID of the resource definition version.
  final String? id;

  /// The version of the resource definition version.
  final String? version;

  GetResourceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.version,
  });

  factory GetResourceDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResourceDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      definition: json['Definition'] != null
          ? ResourceDefinitionVersion.fromJson(
              json['Definition'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final definition = this.definition;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (definition != null) 'Definition': definition,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class GetServiceRoleForAccountResponse {
  /// The time when the service role was associated with the account.
  final String? associatedAt;

  /// The ARN of the role which is associated with the account.
  final String? roleArn;

  GetServiceRoleForAccountResponse({
    this.associatedAt,
    this.roleArn,
  });

  factory GetServiceRoleForAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceRoleForAccountResponse(
      associatedAt: json['AssociatedAt'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAt = this.associatedAt;
    final roleArn = this.roleArn;
    return {
      if (associatedAt != null) 'AssociatedAt': associatedAt,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

class GetSubscriptionDefinitionResponse {
  /// The ARN of the definition.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  final String? creationTimestamp;

  /// The ID of the definition.
  final String? id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String? latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String? latestVersionArn;

  /// The name of the definition.
  final String? name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String>? tags;

  GetSubscriptionDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });

  factory GetSubscriptionDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSubscriptionDefinitionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetSubscriptionDefinitionVersionResponse {
  /// The ARN of the subscription definition version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the subscription definition
  /// version was created.
  final String? creationTimestamp;

  /// Information about the subscription definition version.
  final SubscriptionDefinitionVersion? definition;

  /// The ID of the subscription definition version.
  final String? id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// The version of the subscription definition version.
  final String? version;

  GetSubscriptionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });

  factory GetSubscriptionDefinitionVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSubscriptionDefinitionVersionResponse(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      definition: json['Definition'] != null
          ? SubscriptionDefinitionVersion.fromJson(
              json['Definition'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      nextToken: json['NextToken'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final definition = this.definition;
    final id = this.id;
    final nextToken = this.nextToken;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (definition != null) 'Definition': definition,
      if (id != null) 'Id': id,
      if (nextToken != null) 'NextToken': nextToken,
      if (version != null) 'Version': version,
    };
  }
}

class GetThingRuntimeConfigurationResponse {
  /// Runtime configuration for a thing.
  final RuntimeConfiguration? runtimeConfiguration;

  GetThingRuntimeConfigurationResponse({
    this.runtimeConfiguration,
  });

  factory GetThingRuntimeConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetThingRuntimeConfigurationResponse(
      runtimeConfiguration: json['RuntimeConfiguration'] != null
          ? RuntimeConfiguration.fromJson(
              json['RuntimeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final runtimeConfiguration = this.runtimeConfiguration;
    return {
      if (runtimeConfiguration != null)
        'RuntimeConfiguration': runtimeConfiguration,
    };
  }
}

/// Information about a certificate authority for a group.
class GroupCertificateAuthorityProperties {
  /// The ARN of the certificate authority for the group.
  final String? groupCertificateAuthorityArn;

  /// The ID of the certificate authority for the group.
  final String? groupCertificateAuthorityId;

  GroupCertificateAuthorityProperties({
    this.groupCertificateAuthorityArn,
    this.groupCertificateAuthorityId,
  });

  factory GroupCertificateAuthorityProperties.fromJson(
      Map<String, dynamic> json) {
    return GroupCertificateAuthorityProperties(
      groupCertificateAuthorityArn:
          json['GroupCertificateAuthorityArn'] as String?,
      groupCertificateAuthorityId:
          json['GroupCertificateAuthorityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupCertificateAuthorityArn = this.groupCertificateAuthorityArn;
    final groupCertificateAuthorityId = this.groupCertificateAuthorityId;
    return {
      if (groupCertificateAuthorityArn != null)
        'GroupCertificateAuthorityArn': groupCertificateAuthorityArn,
      if (groupCertificateAuthorityId != null)
        'GroupCertificateAuthorityId': groupCertificateAuthorityId,
    };
  }
}

/// Information about a group.
class GroupInformation {
  /// The ARN of the group.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the group was created.
  final String? creationTimestamp;

  /// The ID of the group.
  final String? id;

  /// The time, in milliseconds since the epoch, when the group was last updated.
  final String? lastUpdatedTimestamp;

  /// The ID of the latest version associated with the group.
  final String? latestVersion;

  /// The ARN of the latest version associated with the group.
  final String? latestVersionArn;

  /// The name of the group.
  final String? name;

  GroupInformation({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });

  factory GroupInformation.fromJson(Map<String, dynamic> json) {
    return GroupInformation(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as String?,
      latestVersion: json['LatestVersion'] as String?,
      latestVersionArn: json['LatestVersionArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final latestVersion = this.latestVersion;
    final latestVersionArn = this.latestVersionArn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (latestVersionArn != null) 'LatestVersionArn': latestVersionArn,
      if (name != null) 'Name': name,
    };
  }
}

/// Group owner related settings for local resources.
class GroupOwnerSetting {
  /// If true, AWS IoT Greengrass automatically adds the specified Linux OS group
  /// owner of the resource to the Lambda process privileges. Thus the Lambda
  /// process will have the file access permissions of the added Linux group.
  final bool? autoAddGroupOwner;

  /// The name of the Linux OS group whose privileges will be added to the Lambda
  /// process. This field is optional.
  final String? groupOwner;

  GroupOwnerSetting({
    this.autoAddGroupOwner,
    this.groupOwner,
  });

  factory GroupOwnerSetting.fromJson(Map<String, dynamic> json) {
    return GroupOwnerSetting(
      autoAddGroupOwner: json['AutoAddGroupOwner'] as bool?,
      groupOwner: json['GroupOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoAddGroupOwner = this.autoAddGroupOwner;
    final groupOwner = this.groupOwner;
    return {
      if (autoAddGroupOwner != null) 'AutoAddGroupOwner': autoAddGroupOwner,
      if (groupOwner != null) 'GroupOwner': groupOwner,
    };
  }
}

/// Information about a group version.
class GroupVersion {
  /// The ARN of the connector definition version for this group.
  final String? connectorDefinitionVersionArn;

  /// The ARN of the core definition version for this group.
  final String? coreDefinitionVersionArn;

  /// The ARN of the device definition version for this group.
  final String? deviceDefinitionVersionArn;

  /// The ARN of the function definition version for this group.
  final String? functionDefinitionVersionArn;

  /// The ARN of the logger definition version for this group.
  final String? loggerDefinitionVersionArn;

  /// The ARN of the resource definition version for this group.
  final String? resourceDefinitionVersionArn;

  /// The ARN of the subscription definition version for this group.
  final String? subscriptionDefinitionVersionArn;

  GroupVersion({
    this.connectorDefinitionVersionArn,
    this.coreDefinitionVersionArn,
    this.deviceDefinitionVersionArn,
    this.functionDefinitionVersionArn,
    this.loggerDefinitionVersionArn,
    this.resourceDefinitionVersionArn,
    this.subscriptionDefinitionVersionArn,
  });

  factory GroupVersion.fromJson(Map<String, dynamic> json) {
    return GroupVersion(
      connectorDefinitionVersionArn:
          json['ConnectorDefinitionVersionArn'] as String?,
      coreDefinitionVersionArn: json['CoreDefinitionVersionArn'] as String?,
      deviceDefinitionVersionArn: json['DeviceDefinitionVersionArn'] as String?,
      functionDefinitionVersionArn:
          json['FunctionDefinitionVersionArn'] as String?,
      loggerDefinitionVersionArn: json['LoggerDefinitionVersionArn'] as String?,
      resourceDefinitionVersionArn:
          json['ResourceDefinitionVersionArn'] as String?,
      subscriptionDefinitionVersionArn:
          json['SubscriptionDefinitionVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorDefinitionVersionArn = this.connectorDefinitionVersionArn;
    final coreDefinitionVersionArn = this.coreDefinitionVersionArn;
    final deviceDefinitionVersionArn = this.deviceDefinitionVersionArn;
    final functionDefinitionVersionArn = this.functionDefinitionVersionArn;
    final loggerDefinitionVersionArn = this.loggerDefinitionVersionArn;
    final resourceDefinitionVersionArn = this.resourceDefinitionVersionArn;
    final subscriptionDefinitionVersionArn =
        this.subscriptionDefinitionVersionArn;
    return {
      if (connectorDefinitionVersionArn != null)
        'ConnectorDefinitionVersionArn': connectorDefinitionVersionArn,
      if (coreDefinitionVersionArn != null)
        'CoreDefinitionVersionArn': coreDefinitionVersionArn,
      if (deviceDefinitionVersionArn != null)
        'DeviceDefinitionVersionArn': deviceDefinitionVersionArn,
      if (functionDefinitionVersionArn != null)
        'FunctionDefinitionVersionArn': functionDefinitionVersionArn,
      if (loggerDefinitionVersionArn != null)
        'LoggerDefinitionVersionArn': loggerDefinitionVersionArn,
      if (resourceDefinitionVersionArn != null)
        'ResourceDefinitionVersionArn': resourceDefinitionVersionArn,
      if (subscriptionDefinitionVersionArn != null)
        'SubscriptionDefinitionVersionArn': subscriptionDefinitionVersionArn,
    };
  }
}

class ListBulkDeploymentDetailedReportsResponse {
  /// A list of the individual group deployments in the bulk deployment operation.
  final List<BulkDeploymentResult>? deployments;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListBulkDeploymentDetailedReportsResponse({
    this.deployments,
    this.nextToken,
  });

  factory ListBulkDeploymentDetailedReportsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBulkDeploymentDetailedReportsResponse(
      deployments: (json['Deployments'] as List?)
          ?.whereNotNull()
          .map((e) => BulkDeploymentResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    final nextToken = this.nextToken;
    return {
      if (deployments != null) 'Deployments': deployments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBulkDeploymentsResponse {
  /// A list of bulk deployments.
  final List<BulkDeployment>? bulkDeployments;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListBulkDeploymentsResponse({
    this.bulkDeployments,
    this.nextToken,
  });

  factory ListBulkDeploymentsResponse.fromJson(Map<String, dynamic> json) {
    return ListBulkDeploymentsResponse(
      bulkDeployments: (json['BulkDeployments'] as List?)
          ?.whereNotNull()
          .map((e) => BulkDeployment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bulkDeployments = this.bulkDeployments;
    final nextToken = this.nextToken;
    return {
      if (bulkDeployments != null) 'BulkDeployments': bulkDeployments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListConnectorDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// Information about a version.
  final List<VersionInformation>? versions;

  ListConnectorDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListConnectorDefinitionVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConnectorDefinitionVersionsResponse(
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => VersionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListConnectorDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation>? definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListConnectorDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });

  factory ListConnectorDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorDefinitionsResponse(
      definitions: (json['Definitions'] as List?)
          ?.whereNotNull()
          .map((e) => DefinitionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definitions = this.definitions;
    final nextToken = this.nextToken;
    return {
      if (definitions != null) 'Definitions': definitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCoreDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// Information about a version.
  final List<VersionInformation>? versions;

  ListCoreDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListCoreDefinitionVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCoreDefinitionVersionsResponse(
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => VersionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListCoreDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation>? definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListCoreDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });

  factory ListCoreDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListCoreDefinitionsResponse(
      definitions: (json['Definitions'] as List?)
          ?.whereNotNull()
          .map((e) => DefinitionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definitions = this.definitions;
    final nextToken = this.nextToken;
    return {
      if (definitions != null) 'Definitions': definitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDeploymentsResponse {
  /// A list of deployments for the requested groups.
  final List<Deployment>? deployments;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListDeploymentsResponse({
    this.deployments,
    this.nextToken,
  });

  factory ListDeploymentsResponse.fromJson(Map<String, dynamic> json) {
    return ListDeploymentsResponse(
      deployments: (json['Deployments'] as List?)
          ?.whereNotNull()
          .map((e) => Deployment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    final nextToken = this.nextToken;
    return {
      if (deployments != null) 'Deployments': deployments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDeviceDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// Information about a version.
  final List<VersionInformation>? versions;

  ListDeviceDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListDeviceDefinitionVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDeviceDefinitionVersionsResponse(
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => VersionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListDeviceDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation>? definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListDeviceDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });

  factory ListDeviceDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListDeviceDefinitionsResponse(
      definitions: (json['Definitions'] as List?)
          ?.whereNotNull()
          .map((e) => DefinitionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definitions = this.definitions;
    final nextToken = this.nextToken;
    return {
      if (definitions != null) 'Definitions': definitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFunctionDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// Information about a version.
  final List<VersionInformation>? versions;

  ListFunctionDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListFunctionDefinitionVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFunctionDefinitionVersionsResponse(
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => VersionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListFunctionDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation>? definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListFunctionDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });

  factory ListFunctionDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListFunctionDefinitionsResponse(
      definitions: (json['Definitions'] as List?)
          ?.whereNotNull()
          .map((e) => DefinitionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definitions = this.definitions;
    final nextToken = this.nextToken;
    return {
      if (definitions != null) 'Definitions': definitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGroupCertificateAuthoritiesResponse {
  /// A list of certificate authorities associated with the group.
  final List<GroupCertificateAuthorityProperties>? groupCertificateAuthorities;

  ListGroupCertificateAuthoritiesResponse({
    this.groupCertificateAuthorities,
  });

  factory ListGroupCertificateAuthoritiesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListGroupCertificateAuthoritiesResponse(
      groupCertificateAuthorities:
          (json['GroupCertificateAuthorities'] as List?)
              ?.whereNotNull()
              .map((e) => GroupCertificateAuthorityProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupCertificateAuthorities = this.groupCertificateAuthorities;
    return {
      if (groupCertificateAuthorities != null)
        'GroupCertificateAuthorities': groupCertificateAuthorities,
    };
  }
}

class ListGroupVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// Information about a version.
  final List<VersionInformation>? versions;

  ListGroupVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListGroupVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupVersionsResponse(
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => VersionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListGroupsResponse {
  /// Information about a group.
  final List<GroupInformation>? groups;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListGroupsResponse({
    this.groups,
    this.nextToken,
  });

  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupsResponse(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => GroupInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final nextToken = this.nextToken;
    return {
      if (groups != null) 'Groups': groups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLoggerDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// Information about a version.
  final List<VersionInformation>? versions;

  ListLoggerDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListLoggerDefinitionVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLoggerDefinitionVersionsResponse(
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => VersionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListLoggerDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation>? definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListLoggerDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });

  factory ListLoggerDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListLoggerDefinitionsResponse(
      definitions: (json['Definitions'] as List?)
          ?.whereNotNull()
          .map((e) => DefinitionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definitions = this.definitions;
    final nextToken = this.nextToken;
    return {
      if (definitions != null) 'Definitions': definitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListResourceDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// Information about a version.
  final List<VersionInformation>? versions;

  ListResourceDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListResourceDefinitionVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResourceDefinitionVersionsResponse(
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => VersionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListResourceDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation>? definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListResourceDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });

  factory ListResourceDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceDefinitionsResponse(
      definitions: (json['Definitions'] as List?)
          ?.whereNotNull()
          .map((e) => DefinitionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definitions = this.definitions;
    final nextToken = this.nextToken;
    return {
      if (definitions != null) 'Definitions': definitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSubscriptionDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  /// Information about a version.
  final List<VersionInformation>? versions;

  ListSubscriptionDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListSubscriptionDefinitionVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSubscriptionDefinitionVersionsResponse(
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => VersionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListSubscriptionDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation>? definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String? nextToken;

  ListSubscriptionDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });

  factory ListSubscriptionDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSubscriptionDefinitionsResponse(
      definitions: (json['Definitions'] as List?)
          ?.whereNotNull()
          .map((e) => DefinitionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definitions = this.definitions;
    final nextToken = this.nextToken;
    return {
      if (definitions != null) 'Definitions': definitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
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

/// Attributes that define a local device resource.
class LocalDeviceResourceData {
  /// Group/owner related settings for local resources.
  final GroupOwnerSetting? groupOwnerSetting;

  /// The local absolute path of the device resource. The source path for a device
  /// resource can refer only to a character device or block device under
  /// ''/dev''.
  final String? sourcePath;

  LocalDeviceResourceData({
    this.groupOwnerSetting,
    this.sourcePath,
  });

  factory LocalDeviceResourceData.fromJson(Map<String, dynamic> json) {
    return LocalDeviceResourceData(
      groupOwnerSetting: json['GroupOwnerSetting'] != null
          ? GroupOwnerSetting.fromJson(
              json['GroupOwnerSetting'] as Map<String, dynamic>)
          : null,
      sourcePath: json['SourcePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupOwnerSetting = this.groupOwnerSetting;
    final sourcePath = this.sourcePath;
    return {
      if (groupOwnerSetting != null) 'GroupOwnerSetting': groupOwnerSetting,
      if (sourcePath != null) 'SourcePath': sourcePath,
    };
  }
}

/// Attributes that define a local volume resource.
class LocalVolumeResourceData {
  /// The absolute local path of the resource inside the Lambda environment.
  final String? destinationPath;

  /// Allows you to configure additional group privileges for the Lambda process.
  /// This field is optional.
  final GroupOwnerSetting? groupOwnerSetting;

  /// The local absolute path of the volume resource on the host. The source path
  /// for a volume resource type cannot start with ''/sys''.
  final String? sourcePath;

  LocalVolumeResourceData({
    this.destinationPath,
    this.groupOwnerSetting,
    this.sourcePath,
  });

  factory LocalVolumeResourceData.fromJson(Map<String, dynamic> json) {
    return LocalVolumeResourceData(
      destinationPath: json['DestinationPath'] as String?,
      groupOwnerSetting: json['GroupOwnerSetting'] != null
          ? GroupOwnerSetting.fromJson(
              json['GroupOwnerSetting'] as Map<String, dynamic>)
          : null,
      sourcePath: json['SourcePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationPath = this.destinationPath;
    final groupOwnerSetting = this.groupOwnerSetting;
    final sourcePath = this.sourcePath;
    return {
      if (destinationPath != null) 'DestinationPath': destinationPath,
      if (groupOwnerSetting != null) 'GroupOwnerSetting': groupOwnerSetting,
      if (sourcePath != null) 'SourcePath': sourcePath,
    };
  }
}

/// Information about a logger
class Logger {
  /// The component that will be subject to logging.
  final LoggerComponent component;

  /// A descriptive or arbitrary ID for the logger. This value must be unique
  /// within the logger definition version. Max length is 128 characters with
  /// pattern ''[a-zA-Z0-9:_-]+''.
  final String id;

  /// The level of the logs.
  final LoggerLevel level;

  /// The type of log output which will be used.
  final LoggerType type;

  /// The amount of file space, in KB, to use if the local file system is used for
  /// logging purposes.
  final int? space;

  Logger({
    required this.component,
    required this.id,
    required this.level,
    required this.type,
    this.space,
  });

  factory Logger.fromJson(Map<String, dynamic> json) {
    return Logger(
      component: (json['Component'] as String).toLoggerComponent(),
      id: json['Id'] as String,
      level: (json['Level'] as String).toLoggerLevel(),
      type: (json['Type'] as String).toLoggerType(),
      space: json['Space'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    final id = this.id;
    final level = this.level;
    final type = this.type;
    final space = this.space;
    return {
      'Component': component.toValue(),
      'Id': id,
      'Level': level.toValue(),
      'Type': type.toValue(),
      if (space != null) 'Space': space,
    };
  }
}

enum LoggerComponent {
  greengrassSystem,
  lambda,
}

extension LoggerComponentValueExtension on LoggerComponent {
  String toValue() {
    switch (this) {
      case LoggerComponent.greengrassSystem:
        return 'GreengrassSystem';
      case LoggerComponent.lambda:
        return 'Lambda';
    }
  }
}

extension LoggerComponentFromString on String {
  LoggerComponent toLoggerComponent() {
    switch (this) {
      case 'GreengrassSystem':
        return LoggerComponent.greengrassSystem;
      case 'Lambda':
        return LoggerComponent.lambda;
    }
    throw Exception('$this is not known in enum LoggerComponent');
  }
}

/// Information about a logger definition version.
class LoggerDefinitionVersion {
  /// A list of loggers.
  final List<Logger>? loggers;

  LoggerDefinitionVersion({
    this.loggers,
  });

  factory LoggerDefinitionVersion.fromJson(Map<String, dynamic> json) {
    return LoggerDefinitionVersion(
      loggers: (json['Loggers'] as List?)
          ?.whereNotNull()
          .map((e) => Logger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final loggers = this.loggers;
    return {
      if (loggers != null) 'Loggers': loggers,
    };
  }
}

enum LoggerLevel {
  debug,
  info,
  warn,
  error,
  fatal,
}

extension LoggerLevelValueExtension on LoggerLevel {
  String toValue() {
    switch (this) {
      case LoggerLevel.debug:
        return 'DEBUG';
      case LoggerLevel.info:
        return 'INFO';
      case LoggerLevel.warn:
        return 'WARN';
      case LoggerLevel.error:
        return 'ERROR';
      case LoggerLevel.fatal:
        return 'FATAL';
    }
  }
}

extension LoggerLevelFromString on String {
  LoggerLevel toLoggerLevel() {
    switch (this) {
      case 'DEBUG':
        return LoggerLevel.debug;
      case 'INFO':
        return LoggerLevel.info;
      case 'WARN':
        return LoggerLevel.warn;
      case 'ERROR':
        return LoggerLevel.error;
      case 'FATAL':
        return LoggerLevel.fatal;
    }
    throw Exception('$this is not known in enum LoggerLevel');
  }
}

enum LoggerType {
  fileSystem,
  awsCloudWatch,
}

extension LoggerTypeValueExtension on LoggerType {
  String toValue() {
    switch (this) {
      case LoggerType.fileSystem:
        return 'FileSystem';
      case LoggerType.awsCloudWatch:
        return 'AWSCloudWatch';
    }
  }
}

extension LoggerTypeFromString on String {
  LoggerType toLoggerType() {
    switch (this) {
      case 'FileSystem':
        return LoggerType.fileSystem;
      case 'AWSCloudWatch':
        return LoggerType.awsCloudWatch;
    }
    throw Exception('$this is not known in enum LoggerType');
  }
}

/// The type of permission a function has to access a resource.
enum Permission {
  ro,
  rw,
}

extension PermissionValueExtension on Permission {
  String toValue() {
    switch (this) {
      case Permission.ro:
        return 'ro';
      case Permission.rw:
        return 'rw';
    }
  }
}

extension PermissionFromString on String {
  Permission toPermission() {
    switch (this) {
      case 'ro':
        return Permission.ro;
      case 'rw':
        return Permission.rw;
    }
    throw Exception('$this is not known in enum Permission');
  }
}

class ResetDeploymentsResponse {
  /// The ARN of the deployment.
  final String? deploymentArn;

  /// The ID of the deployment.
  final String? deploymentId;

  ResetDeploymentsResponse({
    this.deploymentArn,
    this.deploymentId,
  });

  factory ResetDeploymentsResponse.fromJson(Map<String, dynamic> json) {
    return ResetDeploymentsResponse(
      deploymentArn: json['DeploymentArn'] as String?,
      deploymentId: json['DeploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentArn = this.deploymentArn;
    final deploymentId = this.deploymentId;
    return {
      if (deploymentArn != null) 'DeploymentArn': deploymentArn,
      if (deploymentId != null) 'DeploymentId': deploymentId,
    };
  }
}

/// Information about a resource.
class Resource {
  /// The resource ID, used to refer to a resource in the Lambda function
  /// configuration. Max length is 128 characters with pattern
  /// ''[a-zA-Z0-9:_-]+''. This must be unique within a Greengrass group.
  final String id;

  /// The descriptive resource name, which is displayed on the AWS IoT Greengrass
  /// console. Max length 128 characters with pattern ''[a-zA-Z0-9:_-]+''. This
  /// must be unique within a Greengrass group.
  final String name;

  /// A container of data for all resource types.
  final ResourceDataContainer resourceDataContainer;

  Resource({
    required this.id,
    required this.name,
    required this.resourceDataContainer,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['Id'] as String,
      name: json['Name'] as String,
      resourceDataContainer: ResourceDataContainer.fromJson(
          json['ResourceDataContainer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final resourceDataContainer = this.resourceDataContainer;
    return {
      'Id': id,
      'Name': name,
      'ResourceDataContainer': resourceDataContainer,
    };
  }
}

/// A policy used by the function to access a resource.
class ResourceAccessPolicy {
  /// The ID of the resource. (This ID is assigned to the resource when you create
  /// the resource definiton.)
  final String resourceId;

  /// The permissions that the Lambda function has to the resource. Can be one of
  /// ''rw'' (read/write) or ''ro'' (read-only).
  final Permission? permission;

  ResourceAccessPolicy({
    required this.resourceId,
    this.permission,
  });

  factory ResourceAccessPolicy.fromJson(Map<String, dynamic> json) {
    return ResourceAccessPolicy(
      resourceId: json['ResourceId'] as String,
      permission: (json['Permission'] as String?)?.toPermission(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final permission = this.permission;
    return {
      'ResourceId': resourceId,
      if (permission != null) 'Permission': permission.toValue(),
    };
  }
}

/// A container for resource data. The container takes only one of the following
/// supported resource data types: ''LocalDeviceResourceData'',
/// ''LocalVolumeResourceData'', ''SageMakerMachineLearningModelResourceData'',
/// ''S3MachineLearningModelResourceData'',
/// ''SecretsManagerSecretResourceData''.
class ResourceDataContainer {
  /// Attributes that define the local device resource.
  final LocalDeviceResourceData? localDeviceResourceData;

  /// Attributes that define the local volume resource.
  final LocalVolumeResourceData? localVolumeResourceData;

  /// Attributes that define an Amazon S3 machine learning resource.
  final S3MachineLearningModelResourceData? s3MachineLearningModelResourceData;

  /// Attributes that define an Amazon SageMaker machine learning resource.
  final SageMakerMachineLearningModelResourceData?
      sageMakerMachineLearningModelResourceData;

  /// Attributes that define a secret resource, which references a secret from AWS
  /// Secrets Manager.
  final SecretsManagerSecretResourceData? secretsManagerSecretResourceData;

  ResourceDataContainer({
    this.localDeviceResourceData,
    this.localVolumeResourceData,
    this.s3MachineLearningModelResourceData,
    this.sageMakerMachineLearningModelResourceData,
    this.secretsManagerSecretResourceData,
  });

  factory ResourceDataContainer.fromJson(Map<String, dynamic> json) {
    return ResourceDataContainer(
      localDeviceResourceData: json['LocalDeviceResourceData'] != null
          ? LocalDeviceResourceData.fromJson(
              json['LocalDeviceResourceData'] as Map<String, dynamic>)
          : null,
      localVolumeResourceData: json['LocalVolumeResourceData'] != null
          ? LocalVolumeResourceData.fromJson(
              json['LocalVolumeResourceData'] as Map<String, dynamic>)
          : null,
      s3MachineLearningModelResourceData:
          json['S3MachineLearningModelResourceData'] != null
              ? S3MachineLearningModelResourceData.fromJson(
                  json['S3MachineLearningModelResourceData']
                      as Map<String, dynamic>)
              : null,
      sageMakerMachineLearningModelResourceData:
          json['SageMakerMachineLearningModelResourceData'] != null
              ? SageMakerMachineLearningModelResourceData.fromJson(
                  json['SageMakerMachineLearningModelResourceData']
                      as Map<String, dynamic>)
              : null,
      secretsManagerSecretResourceData:
          json['SecretsManagerSecretResourceData'] != null
              ? SecretsManagerSecretResourceData.fromJson(
                  json['SecretsManagerSecretResourceData']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final localDeviceResourceData = this.localDeviceResourceData;
    final localVolumeResourceData = this.localVolumeResourceData;
    final s3MachineLearningModelResourceData =
        this.s3MachineLearningModelResourceData;
    final sageMakerMachineLearningModelResourceData =
        this.sageMakerMachineLearningModelResourceData;
    final secretsManagerSecretResourceData =
        this.secretsManagerSecretResourceData;
    return {
      if (localDeviceResourceData != null)
        'LocalDeviceResourceData': localDeviceResourceData,
      if (localVolumeResourceData != null)
        'LocalVolumeResourceData': localVolumeResourceData,
      if (s3MachineLearningModelResourceData != null)
        'S3MachineLearningModelResourceData':
            s3MachineLearningModelResourceData,
      if (sageMakerMachineLearningModelResourceData != null)
        'SageMakerMachineLearningModelResourceData':
            sageMakerMachineLearningModelResourceData,
      if (secretsManagerSecretResourceData != null)
        'SecretsManagerSecretResourceData': secretsManagerSecretResourceData,
    };
  }
}

/// Information about a resource definition version.
class ResourceDefinitionVersion {
  /// A list of resources.
  final List<Resource>? resources;

  ResourceDefinitionVersion({
    this.resources,
  });

  factory ResourceDefinitionVersion.fromJson(Map<String, dynamic> json) {
    return ResourceDefinitionVersion(
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resources = this.resources;
    return {
      if (resources != null) 'Resources': resources,
    };
  }
}

/// The owner setting for downloaded machine learning resources.
class ResourceDownloadOwnerSetting {
  /// The group owner of the resource. This is the name of an existing Linux OS
  /// group on the system or a GID. The group's permissions are added to the
  /// Lambda process.
  final String groupOwner;

  /// The permissions that the group owner has to the resource. Valid values are
  /// ''rw'' (read/write) or ''ro'' (read-only).
  final Permission groupPermission;

  ResourceDownloadOwnerSetting({
    required this.groupOwner,
    required this.groupPermission,
  });

  factory ResourceDownloadOwnerSetting.fromJson(Map<String, dynamic> json) {
    return ResourceDownloadOwnerSetting(
      groupOwner: json['GroupOwner'] as String,
      groupPermission: (json['GroupPermission'] as String).toPermission(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupOwner = this.groupOwner;
    final groupPermission = this.groupPermission;
    return {
      'GroupOwner': groupOwner,
      'GroupPermission': groupPermission.toValue(),
    };
  }
}

/// Runtime configuration for a thing.
class RuntimeConfiguration {
  /// Configuration for telemetry service.
  final TelemetryConfiguration? telemetryConfiguration;

  RuntimeConfiguration({
    this.telemetryConfiguration,
  });

  factory RuntimeConfiguration.fromJson(Map<String, dynamic> json) {
    return RuntimeConfiguration(
      telemetryConfiguration: json['TelemetryConfiguration'] != null
          ? TelemetryConfiguration.fromJson(
              json['TelemetryConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final telemetryConfiguration = this.telemetryConfiguration;
    return {
      if (telemetryConfiguration != null)
        'TelemetryConfiguration': telemetryConfiguration,
    };
  }
}

/// Attributes that define an Amazon S3 machine learning resource.
class S3MachineLearningModelResourceData {
  /// The absolute local path of the resource inside the Lambda environment.
  final String? destinationPath;
  final ResourceDownloadOwnerSetting? ownerSetting;

  /// The URI of the source model in an S3 bucket. The model package must be in
  /// tar.gz or .zip format.
  final String? s3Uri;

  S3MachineLearningModelResourceData({
    this.destinationPath,
    this.ownerSetting,
    this.s3Uri,
  });

  factory S3MachineLearningModelResourceData.fromJson(
      Map<String, dynamic> json) {
    return S3MachineLearningModelResourceData(
      destinationPath: json['DestinationPath'] as String?,
      ownerSetting: json['OwnerSetting'] != null
          ? ResourceDownloadOwnerSetting.fromJson(
              json['OwnerSetting'] as Map<String, dynamic>)
          : null,
      s3Uri: json['S3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationPath = this.destinationPath;
    final ownerSetting = this.ownerSetting;
    final s3Uri = this.s3Uri;
    return {
      if (destinationPath != null) 'DestinationPath': destinationPath,
      if (ownerSetting != null) 'OwnerSetting': ownerSetting,
      if (s3Uri != null) 'S3Uri': s3Uri,
    };
  }
}

/// Attributes that define an Amazon SageMaker machine learning resource.
class SageMakerMachineLearningModelResourceData {
  /// The absolute local path of the resource inside the Lambda environment.
  final String? destinationPath;
  final ResourceDownloadOwnerSetting? ownerSetting;

  /// The ARN of the Amazon SageMaker training job that represents the source
  /// model.
  final String? sageMakerJobArn;

  SageMakerMachineLearningModelResourceData({
    this.destinationPath,
    this.ownerSetting,
    this.sageMakerJobArn,
  });

  factory SageMakerMachineLearningModelResourceData.fromJson(
      Map<String, dynamic> json) {
    return SageMakerMachineLearningModelResourceData(
      destinationPath: json['DestinationPath'] as String?,
      ownerSetting: json['OwnerSetting'] != null
          ? ResourceDownloadOwnerSetting.fromJson(
              json['OwnerSetting'] as Map<String, dynamic>)
          : null,
      sageMakerJobArn: json['SageMakerJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationPath = this.destinationPath;
    final ownerSetting = this.ownerSetting;
    final sageMakerJobArn = this.sageMakerJobArn;
    return {
      if (destinationPath != null) 'DestinationPath': destinationPath,
      if (ownerSetting != null) 'OwnerSetting': ownerSetting,
      if (sageMakerJobArn != null) 'SageMakerJobArn': sageMakerJobArn,
    };
  }
}

/// Attributes that define a secret resource, which references a secret from AWS
/// Secrets Manager. AWS IoT Greengrass stores a local, encrypted copy of the
/// secret on the Greengrass core, where it can be securely accessed by
/// connectors and Lambda functions.
class SecretsManagerSecretResourceData {
  /// The ARN of the Secrets Manager secret to make available on the core. The
  /// value of the secret's latest version (represented by the ''AWSCURRENT''
  /// staging label) is included by default.
  final String? arn;

  /// Optional. The staging labels whose values you want to make available on the
  /// core, in addition to ''AWSCURRENT''.
  final List<String>? additionalStagingLabelsToDownload;

  SecretsManagerSecretResourceData({
    this.arn,
    this.additionalStagingLabelsToDownload,
  });

  factory SecretsManagerSecretResourceData.fromJson(Map<String, dynamic> json) {
    return SecretsManagerSecretResourceData(
      arn: json['ARN'] as String?,
      additionalStagingLabelsToDownload:
          (json['AdditionalStagingLabelsToDownload'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final additionalStagingLabelsToDownload =
        this.additionalStagingLabelsToDownload;
    return {
      if (arn != null) 'ARN': arn,
      if (additionalStagingLabelsToDownload != null)
        'AdditionalStagingLabelsToDownload': additionalStagingLabelsToDownload,
    };
  }
}

/// The piece of software on the Greengrass core that will be updated.
enum SoftwareToUpdate {
  core,
  otaAgent,
}

extension SoftwareToUpdateValueExtension on SoftwareToUpdate {
  String toValue() {
    switch (this) {
      case SoftwareToUpdate.core:
        return 'core';
      case SoftwareToUpdate.otaAgent:
        return 'ota_agent';
    }
  }
}

extension SoftwareToUpdateFromString on String {
  SoftwareToUpdate toSoftwareToUpdate() {
    switch (this) {
      case 'core':
        return SoftwareToUpdate.core;
      case 'ota_agent':
        return SoftwareToUpdate.otaAgent;
    }
    throw Exception('$this is not known in enum SoftwareToUpdate');
  }
}

class StartBulkDeploymentResponse {
  /// The ARN of the bulk deployment.
  final String? bulkDeploymentArn;

  /// The ID of the bulk deployment.
  final String? bulkDeploymentId;

  StartBulkDeploymentResponse({
    this.bulkDeploymentArn,
    this.bulkDeploymentId,
  });

  factory StartBulkDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return StartBulkDeploymentResponse(
      bulkDeploymentArn: json['BulkDeploymentArn'] as String?,
      bulkDeploymentId: json['BulkDeploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bulkDeploymentArn = this.bulkDeploymentArn;
    final bulkDeploymentId = this.bulkDeploymentId;
    return {
      if (bulkDeploymentArn != null) 'BulkDeploymentArn': bulkDeploymentArn,
      if (bulkDeploymentId != null) 'BulkDeploymentId': bulkDeploymentId,
    };
  }
}

class StopBulkDeploymentResponse {
  StopBulkDeploymentResponse();

  factory StopBulkDeploymentResponse.fromJson(Map<String, dynamic> _) {
    return StopBulkDeploymentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a subscription.
class Subscription {
  /// A descriptive or arbitrary ID for the subscription. This value must be
  /// unique within the subscription definition version. Max length is 128
  /// characters with pattern ''[a-zA-Z0-9:_-]+''.
  final String id;

  /// The source of the subscription. Can be a thing ARN, a Lambda function ARN, a
  /// connector ARN, 'cloud' (which represents the AWS IoT cloud), or
  /// 'GGShadowService'.
  final String source;

  /// The MQTT topic used to route the message.
  final String subject;

  /// Where the message is sent to. Can be a thing ARN, a Lambda function ARN, a
  /// connector ARN, 'cloud' (which represents the AWS IoT cloud), or
  /// 'GGShadowService'.
  final String target;

  Subscription({
    required this.id,
    required this.source,
    required this.subject,
    required this.target,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['Id'] as String,
      source: json['Source'] as String,
      subject: json['Subject'] as String,
      target: json['Target'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final source = this.source;
    final subject = this.subject;
    final target = this.target;
    return {
      'Id': id,
      'Source': source,
      'Subject': subject,
      'Target': target,
    };
  }
}

/// Information about a subscription definition version.
class SubscriptionDefinitionVersion {
  /// A list of subscriptions.
  final List<Subscription>? subscriptions;

  SubscriptionDefinitionVersion({
    this.subscriptions,
  });

  factory SubscriptionDefinitionVersion.fromJson(Map<String, dynamic> json) {
    return SubscriptionDefinitionVersion(
      subscriptions: (json['Subscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptions = this.subscriptions;
    return {
      if (subscriptions != null) 'Subscriptions': subscriptions,
    };
  }
}

enum Telemetry {
  on,
  off,
}

extension TelemetryValueExtension on Telemetry {
  String toValue() {
    switch (this) {
      case Telemetry.on:
        return 'On';
      case Telemetry.off:
        return 'Off';
    }
  }
}

extension TelemetryFromString on String {
  Telemetry toTelemetry() {
    switch (this) {
      case 'On':
        return Telemetry.on;
      case 'Off':
        return Telemetry.off;
    }
    throw Exception('$this is not known in enum Telemetry');
  }
}

/// Configuration settings for running telemetry.
class TelemetryConfiguration {
  /// Configure telemetry to be on or off.
  final Telemetry telemetry;

  /// Synchronization status of the device reported configuration with the desired
  /// configuration.
  final ConfigurationSyncStatus? configurationSyncStatus;

  TelemetryConfiguration({
    required this.telemetry,
    this.configurationSyncStatus,
  });

  factory TelemetryConfiguration.fromJson(Map<String, dynamic> json) {
    return TelemetryConfiguration(
      telemetry: (json['Telemetry'] as String).toTelemetry(),
      configurationSyncStatus: (json['ConfigurationSyncStatus'] as String?)
          ?.toConfigurationSyncStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final telemetry = this.telemetry;
    final configurationSyncStatus = this.configurationSyncStatus;
    return {
      'Telemetry': telemetry.toValue(),
      if (configurationSyncStatus != null)
        'ConfigurationSyncStatus': configurationSyncStatus.toValue(),
    };
  }
}

/// Configuration settings for running telemetry.
class TelemetryConfigurationUpdate {
  /// Configure telemetry to be on or off.
  final Telemetry telemetry;

  TelemetryConfigurationUpdate({
    required this.telemetry,
  });

  Map<String, dynamic> toJson() {
    final telemetry = this.telemetry;
    return {
      'Telemetry': telemetry.toValue(),
    };
  }
}

/// The minimum level of log statements that should be logged by the OTA Agent
/// during an update.
enum UpdateAgentLogLevel {
  none,
  trace,
  debug,
  verbose,
  info,
  warn,
  error,
  fatal,
}

extension UpdateAgentLogLevelValueExtension on UpdateAgentLogLevel {
  String toValue() {
    switch (this) {
      case UpdateAgentLogLevel.none:
        return 'NONE';
      case UpdateAgentLogLevel.trace:
        return 'TRACE';
      case UpdateAgentLogLevel.debug:
        return 'DEBUG';
      case UpdateAgentLogLevel.verbose:
        return 'VERBOSE';
      case UpdateAgentLogLevel.info:
        return 'INFO';
      case UpdateAgentLogLevel.warn:
        return 'WARN';
      case UpdateAgentLogLevel.error:
        return 'ERROR';
      case UpdateAgentLogLevel.fatal:
        return 'FATAL';
    }
  }
}

extension UpdateAgentLogLevelFromString on String {
  UpdateAgentLogLevel toUpdateAgentLogLevel() {
    switch (this) {
      case 'NONE':
        return UpdateAgentLogLevel.none;
      case 'TRACE':
        return UpdateAgentLogLevel.trace;
      case 'DEBUG':
        return UpdateAgentLogLevel.debug;
      case 'VERBOSE':
        return UpdateAgentLogLevel.verbose;
      case 'INFO':
        return UpdateAgentLogLevel.info;
      case 'WARN':
        return UpdateAgentLogLevel.warn;
      case 'ERROR':
        return UpdateAgentLogLevel.error;
      case 'FATAL':
        return UpdateAgentLogLevel.fatal;
    }
    throw Exception('$this is not known in enum UpdateAgentLogLevel');
  }
}

class UpdateConnectivityInfoResponse {
  /// A message about the connectivity info update request.
  final String? message;

  /// The new version of the connectivity info.
  final String? version;

  UpdateConnectivityInfoResponse({
    this.message,
    this.version,
  });

  factory UpdateConnectivityInfoResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectivityInfoResponse(
      message: json['message'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final version = this.version;
    return {
      if (message != null) 'message': message,
      if (version != null) 'Version': version,
    };
  }
}

class UpdateConnectorDefinitionResponse {
  UpdateConnectorDefinitionResponse();

  factory UpdateConnectorDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateConnectorDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateCoreDefinitionResponse {
  UpdateCoreDefinitionResponse();

  factory UpdateCoreDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateCoreDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDeviceDefinitionResponse {
  UpdateDeviceDefinitionResponse();

  factory UpdateDeviceDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDeviceDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateFunctionDefinitionResponse {
  UpdateFunctionDefinitionResponse();

  factory UpdateFunctionDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFunctionDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateGroupCertificateConfigurationResponse {
  /// The amount of time remaining before the certificate authority expires, in
  /// milliseconds.
  final String? certificateAuthorityExpiryInMilliseconds;

  /// The amount of time remaining before the certificate expires, in
  /// milliseconds.
  final String? certificateExpiryInMilliseconds;

  /// The ID of the group certificate configuration.
  final String? groupId;

  UpdateGroupCertificateConfigurationResponse({
    this.certificateAuthorityExpiryInMilliseconds,
    this.certificateExpiryInMilliseconds,
    this.groupId,
  });

  factory UpdateGroupCertificateConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateGroupCertificateConfigurationResponse(
      certificateAuthorityExpiryInMilliseconds:
          json['CertificateAuthorityExpiryInMilliseconds'] as String?,
      certificateExpiryInMilliseconds:
          json['CertificateExpiryInMilliseconds'] as String?,
      groupId: json['GroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityExpiryInMilliseconds =
        this.certificateAuthorityExpiryInMilliseconds;
    final certificateExpiryInMilliseconds =
        this.certificateExpiryInMilliseconds;
    final groupId = this.groupId;
    return {
      if (certificateAuthorityExpiryInMilliseconds != null)
        'CertificateAuthorityExpiryInMilliseconds':
            certificateAuthorityExpiryInMilliseconds,
      if (certificateExpiryInMilliseconds != null)
        'CertificateExpiryInMilliseconds': certificateExpiryInMilliseconds,
      if (groupId != null) 'GroupId': groupId,
    };
  }
}

class UpdateGroupResponse {
  UpdateGroupResponse();

  factory UpdateGroupResponse.fromJson(Map<String, dynamic> _) {
    return UpdateGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLoggerDefinitionResponse {
  UpdateLoggerDefinitionResponse();

  factory UpdateLoggerDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLoggerDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateResourceDefinitionResponse {
  UpdateResourceDefinitionResponse();

  factory UpdateResourceDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateResourceDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateSubscriptionDefinitionResponse {
  UpdateSubscriptionDefinitionResponse();

  factory UpdateSubscriptionDefinitionResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateSubscriptionDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The architecture of the cores which are the targets of an update.
enum UpdateTargetsArchitecture {
  armv6l,
  armv7l,
  x86_64,
  aarch64,
}

extension UpdateTargetsArchitectureValueExtension on UpdateTargetsArchitecture {
  String toValue() {
    switch (this) {
      case UpdateTargetsArchitecture.armv6l:
        return 'armv6l';
      case UpdateTargetsArchitecture.armv7l:
        return 'armv7l';
      case UpdateTargetsArchitecture.x86_64:
        return 'x86_64';
      case UpdateTargetsArchitecture.aarch64:
        return 'aarch64';
    }
  }
}

extension UpdateTargetsArchitectureFromString on String {
  UpdateTargetsArchitecture toUpdateTargetsArchitecture() {
    switch (this) {
      case 'armv6l':
        return UpdateTargetsArchitecture.armv6l;
      case 'armv7l':
        return UpdateTargetsArchitecture.armv7l;
      case 'x86_64':
        return UpdateTargetsArchitecture.x86_64;
      case 'aarch64':
        return UpdateTargetsArchitecture.aarch64;
    }
    throw Exception('$this is not known in enum UpdateTargetsArchitecture');
  }
}

/// The operating system of the cores which are the targets of an update.
enum UpdateTargetsOperatingSystem {
  ubuntu,
  raspbian,
  amazonLinux,
  openwrt,
}

extension UpdateTargetsOperatingSystemValueExtension
    on UpdateTargetsOperatingSystem {
  String toValue() {
    switch (this) {
      case UpdateTargetsOperatingSystem.ubuntu:
        return 'ubuntu';
      case UpdateTargetsOperatingSystem.raspbian:
        return 'raspbian';
      case UpdateTargetsOperatingSystem.amazonLinux:
        return 'amazon_linux';
      case UpdateTargetsOperatingSystem.openwrt:
        return 'openwrt';
    }
  }
}

extension UpdateTargetsOperatingSystemFromString on String {
  UpdateTargetsOperatingSystem toUpdateTargetsOperatingSystem() {
    switch (this) {
      case 'ubuntu':
        return UpdateTargetsOperatingSystem.ubuntu;
      case 'raspbian':
        return UpdateTargetsOperatingSystem.raspbian;
      case 'amazon_linux':
        return UpdateTargetsOperatingSystem.amazonLinux;
      case 'openwrt':
        return UpdateTargetsOperatingSystem.openwrt;
    }
    throw Exception('$this is not known in enum UpdateTargetsOperatingSystem');
  }
}

class UpdateThingRuntimeConfigurationResponse {
  UpdateThingRuntimeConfigurationResponse();

  factory UpdateThingRuntimeConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateThingRuntimeConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a version.
class VersionInformation {
  /// The ARN of the version.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String? creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  final String? id;

  /// The ID of the version.
  final String? version;

  VersionInformation({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });

  factory VersionInformation.fromJson(Map<String, dynamic> json) {
    return VersionInformation(
      arn: json['Arn'] as String?,
      creationTimestamp: json['CreationTimestamp'] as String?,
      id: json['Id'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimestamp = this.creationTimestamp;
    final id = this.id;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (id != null) 'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
};
