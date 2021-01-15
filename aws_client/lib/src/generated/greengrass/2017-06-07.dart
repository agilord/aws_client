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

part '2017-06-07.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'greengrass',
            signingName: 'greengrass',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String groupId,
    @_s.required String roleArn,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
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
    @_s.required String roleArn,
  }) async {
    ArgumentError.checkNotNull(roleArn, 'roleArn');
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
    String amznClientToken,
    ConnectorDefinitionVersion initialVersion,
    String name,
    Map<String, String> tags,
  }) async {
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String connectorDefinitionId,
    String amznClientToken,
    List<Connector> connectors,
  }) async {
    ArgumentError.checkNotNull(connectorDefinitionId, 'connectorDefinitionId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    String amznClientToken,
    CoreDefinitionVersion initialVersion,
    String name,
    Map<String, String> tags,
  }) async {
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String coreDefinitionId,
    String amznClientToken,
    List<Core> cores,
  }) async {
    ArgumentError.checkNotNull(coreDefinitionId, 'coreDefinitionId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required DeploymentType deploymentType,
    @_s.required String groupId,
    String amznClientToken,
    String deploymentId,
    String groupVersionId,
  }) async {
    ArgumentError.checkNotNull(deploymentType, 'deploymentType');
    ArgumentError.checkNotNull(groupId, 'groupId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
    final $payload = <String, dynamic>{
      'DeploymentType': deploymentType?.toValue() ?? '',
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
    String amznClientToken,
    DeviceDefinitionVersion initialVersion,
    String name,
    Map<String, String> tags,
  }) async {
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String deviceDefinitionId,
    String amznClientToken,
    List<Device> devices,
  }) async {
    ArgumentError.checkNotNull(deviceDefinitionId, 'deviceDefinitionId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    String amznClientToken,
    FunctionDefinitionVersion initialVersion,
    String name,
    Map<String, String> tags,
  }) async {
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String functionDefinitionId,
    String amznClientToken,
    FunctionDefaultConfig defaultConfig,
    List<$Function> functions,
  }) async {
    ArgumentError.checkNotNull(functionDefinitionId, 'functionDefinitionId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
  /// Parameter [amznClientToken] :
  /// A client token used to correlate requests and responses.
  ///
  /// Parameter [initialVersion] :
  /// Information about the initial version of the group.
  ///
  /// Parameter [name] :
  /// The name of the group.
  ///
  /// Parameter [tags] :
  /// Tag(s) to add to the new resource.
  Future<CreateGroupResponse> createGroup({
    String amznClientToken,
    GroupVersion initialVersion,
    String name,
    Map<String, String> tags,
  }) async {
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
    final $payload = <String, dynamic>{
      if (initialVersion != null) 'InitialVersion': initialVersion,
      if (name != null) 'Name': name,
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
    @_s.required String groupId,
    String amznClientToken,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String groupId,
    String amznClientToken,
    String connectorDefinitionVersionArn,
    String coreDefinitionVersionArn,
    String deviceDefinitionVersionArn,
    String functionDefinitionVersionArn,
    String loggerDefinitionVersionArn,
    String resourceDefinitionVersionArn,
    String subscriptionDefinitionVersionArn,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    String amznClientToken,
    LoggerDefinitionVersion initialVersion,
    String name,
    Map<String, String> tags,
  }) async {
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String loggerDefinitionId,
    String amznClientToken,
    List<Logger> loggers,
  }) async {
    ArgumentError.checkNotNull(loggerDefinitionId, 'loggerDefinitionId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    String amznClientToken,
    ResourceDefinitionVersion initialVersion,
    String name,
    Map<String, String> tags,
  }) async {
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String resourceDefinitionId,
    String amznClientToken,
    List<Resource> resources,
  }) async {
    ArgumentError.checkNotNull(resourceDefinitionId, 'resourceDefinitionId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String s3UrlSignerRole,
    @_s.required SoftwareToUpdate softwareToUpdate,
    @_s.required List<String> updateTargets,
    @_s.required UpdateTargetsArchitecture updateTargetsArchitecture,
    @_s.required UpdateTargetsOperatingSystem updateTargetsOperatingSystem,
    String amznClientToken,
    UpdateAgentLogLevel updateAgentLogLevel,
  }) async {
    ArgumentError.checkNotNull(s3UrlSignerRole, 's3UrlSignerRole');
    ArgumentError.checkNotNull(softwareToUpdate, 'softwareToUpdate');
    ArgumentError.checkNotNull(updateTargets, 'updateTargets');
    ArgumentError.checkNotNull(
        updateTargetsArchitecture, 'updateTargetsArchitecture');
    ArgumentError.checkNotNull(
        updateTargetsOperatingSystem, 'updateTargetsOperatingSystem');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
    final $payload = <String, dynamic>{
      'S3UrlSignerRole': s3UrlSignerRole,
      'SoftwareToUpdate': softwareToUpdate?.toValue() ?? '',
      'UpdateTargets': updateTargets,
      'UpdateTargetsArchitecture': updateTargetsArchitecture?.toValue() ?? '',
      'UpdateTargetsOperatingSystem':
          updateTargetsOperatingSystem?.toValue() ?? '',
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
    String amznClientToken,
    SubscriptionDefinitionVersion initialVersion,
    String name,
    Map<String, String> tags,
  }) async {
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String subscriptionDefinitionId,
    String amznClientToken,
    List<Subscription> subscriptions,
  }) async {
    ArgumentError.checkNotNull(
        subscriptionDefinitionId, 'subscriptionDefinitionId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String connectorDefinitionId,
  }) async {
    ArgumentError.checkNotNull(connectorDefinitionId, 'connectorDefinitionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/connectors/${Uri.encodeComponent(connectorDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConnectorDefinitionResponse.fromJson(response);
  }

  /// Deletes a core definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [coreDefinitionId] :
  /// The ID of the core definition.
  Future<void> deleteCoreDefinition({
    @_s.required String coreDefinitionId,
  }) async {
    ArgumentError.checkNotNull(coreDefinitionId, 'coreDefinitionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/cores/${Uri.encodeComponent(coreDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCoreDefinitionResponse.fromJson(response);
  }

  /// Deletes a device definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [deviceDefinitionId] :
  /// The ID of the device definition.
  Future<void> deleteDeviceDefinition({
    @_s.required String deviceDefinitionId,
  }) async {
    ArgumentError.checkNotNull(deviceDefinitionId, 'deviceDefinitionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/devices/${Uri.encodeComponent(deviceDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDeviceDefinitionResponse.fromJson(response);
  }

  /// Deletes a Lambda function definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [functionDefinitionId] :
  /// The ID of the Lambda function definition.
  Future<void> deleteFunctionDefinition({
    @_s.required String functionDefinitionId,
  }) async {
    ArgumentError.checkNotNull(functionDefinitionId, 'functionDefinitionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/functions/${Uri.encodeComponent(functionDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFunctionDefinitionResponse.fromJson(response);
  }

  /// Deletes a group.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<void> deleteGroup({
    @_s.required String groupId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGroupResponse.fromJson(response);
  }

  /// Deletes a logger definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [loggerDefinitionId] :
  /// The ID of the logger definition.
  Future<void> deleteLoggerDefinition({
    @_s.required String loggerDefinitionId,
  }) async {
    ArgumentError.checkNotNull(loggerDefinitionId, 'loggerDefinitionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/loggers/${Uri.encodeComponent(loggerDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLoggerDefinitionResponse.fromJson(response);
  }

  /// Deletes a resource definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceDefinitionId] :
  /// The ID of the resource definition.
  Future<void> deleteResourceDefinition({
    @_s.required String resourceDefinitionId,
  }) async {
    ArgumentError.checkNotNull(resourceDefinitionId, 'resourceDefinitionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/resources/${Uri.encodeComponent(resourceDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResourceDefinitionResponse.fromJson(response);
  }

  /// Deletes a subscription definition.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [subscriptionDefinitionId] :
  /// The ID of the subscription definition.
  Future<void> deleteSubscriptionDefinition({
    @_s.required String subscriptionDefinitionId,
  }) async {
    ArgumentError.checkNotNull(
        subscriptionDefinitionId, 'subscriptionDefinitionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/greengrass/definition/subscriptions/${Uri.encodeComponent(subscriptionDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSubscriptionDefinitionResponse.fromJson(response);
  }

  /// Disassociates the role from a group.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [groupId] :
  /// The ID of the Greengrass group.
  Future<DisassociateRoleFromGroupResponse> disassociateRoleFromGroup({
    @_s.required String groupId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    @_s.required String groupId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    @_s.required String bulkDeploymentId,
  }) async {
    ArgumentError.checkNotNull(bulkDeploymentId, 'bulkDeploymentId');
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
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
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
    @_s.required String connectorDefinitionId,
  }) async {
    ArgumentError.checkNotNull(connectorDefinitionId, 'connectorDefinitionId');
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
    @_s.required String connectorDefinitionId,
    @_s.required String connectorDefinitionVersionId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(connectorDefinitionId, 'connectorDefinitionId');
    ArgumentError.checkNotNull(
        connectorDefinitionVersionId, 'connectorDefinitionVersionId');
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
    @_s.required String coreDefinitionId,
  }) async {
    ArgumentError.checkNotNull(coreDefinitionId, 'coreDefinitionId');
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
    @_s.required String coreDefinitionId,
    @_s.required String coreDefinitionVersionId,
  }) async {
    ArgumentError.checkNotNull(coreDefinitionId, 'coreDefinitionId');
    ArgumentError.checkNotNull(
        coreDefinitionVersionId, 'coreDefinitionVersionId');
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
    @_s.required String deploymentId,
    @_s.required String groupId,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    @_s.required String deviceDefinitionId,
  }) async {
    ArgumentError.checkNotNull(deviceDefinitionId, 'deviceDefinitionId');
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
    @_s.required String deviceDefinitionId,
    @_s.required String deviceDefinitionVersionId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(deviceDefinitionId, 'deviceDefinitionId');
    ArgumentError.checkNotNull(
        deviceDefinitionVersionId, 'deviceDefinitionVersionId');
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
    @_s.required String functionDefinitionId,
  }) async {
    ArgumentError.checkNotNull(functionDefinitionId, 'functionDefinitionId');
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
    @_s.required String functionDefinitionId,
    @_s.required String functionDefinitionVersionId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(functionDefinitionId, 'functionDefinitionId');
    ArgumentError.checkNotNull(
        functionDefinitionVersionId, 'functionDefinitionVersionId');
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
    @_s.required String groupId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    @_s.required String certificateAuthorityId,
    @_s.required String groupId,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityId, 'certificateAuthorityId');
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    @_s.required String groupId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    @_s.required String groupId,
    @_s.required String groupVersionId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    ArgumentError.checkNotNull(groupVersionId, 'groupVersionId');
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
    @_s.required String loggerDefinitionId,
  }) async {
    ArgumentError.checkNotNull(loggerDefinitionId, 'loggerDefinitionId');
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
    @_s.required String loggerDefinitionId,
    @_s.required String loggerDefinitionVersionId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(loggerDefinitionId, 'loggerDefinitionId');
    ArgumentError.checkNotNull(
        loggerDefinitionVersionId, 'loggerDefinitionVersionId');
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
    @_s.required String resourceDefinitionId,
  }) async {
    ArgumentError.checkNotNull(resourceDefinitionId, 'resourceDefinitionId');
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
    @_s.required String resourceDefinitionId,
    @_s.required String resourceDefinitionVersionId,
  }) async {
    ArgumentError.checkNotNull(resourceDefinitionId, 'resourceDefinitionId');
    ArgumentError.checkNotNull(
        resourceDefinitionVersionId, 'resourceDefinitionVersionId');
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
    @_s.required String subscriptionDefinitionId,
  }) async {
    ArgumentError.checkNotNull(
        subscriptionDefinitionId, 'subscriptionDefinitionId');
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
    @_s.required String subscriptionDefinitionId,
    @_s.required String subscriptionDefinitionVersionId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        subscriptionDefinitionId, 'subscriptionDefinitionId');
    ArgumentError.checkNotNull(
        subscriptionDefinitionVersionId, 'subscriptionDefinitionVersionId');
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
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
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
    @_s.required String bulkDeploymentId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(bulkDeploymentId, 'bulkDeploymentId');
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
    String maxResults,
    String nextToken,
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
    @_s.required String connectorDefinitionId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(connectorDefinitionId, 'connectorDefinitionId');
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
    String maxResults,
    String nextToken,
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
    @_s.required String coreDefinitionId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(coreDefinitionId, 'coreDefinitionId');
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
    String maxResults,
    String nextToken,
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
    @_s.required String groupId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    @_s.required String deviceDefinitionId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(deviceDefinitionId, 'deviceDefinitionId');
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
    String maxResults,
    String nextToken,
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
    @_s.required String functionDefinitionId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(functionDefinitionId, 'functionDefinitionId');
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
    String maxResults,
    String nextToken,
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
    @_s.required String groupId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    @_s.required String groupId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    String maxResults,
    String nextToken,
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
    @_s.required String loggerDefinitionId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(loggerDefinitionId, 'loggerDefinitionId');
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
    String maxResults,
    String nextToken,
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
    @_s.required String resourceDefinitionId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceDefinitionId, 'resourceDefinitionId');
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
    String maxResults,
    String nextToken,
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
    @_s.required String subscriptionDefinitionId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        subscriptionDefinitionId, 'subscriptionDefinitionId');
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
    String maxResults,
    String nextToken,
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    @_s.required String groupId,
    String amznClientToken,
    bool force,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
    final $payload = <String, dynamic>{
      if (force != null) 'Force': force,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/greengrass/groups/${Uri.encodeComponent(groupId)}/deployments/\$reset',
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
    @_s.required String executionRoleArn,
    @_s.required String inputFileUri,
    String amznClientToken,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(executionRoleArn, 'executionRoleArn');
    ArgumentError.checkNotNull(inputFileUri, 'inputFileUri');
    final headers = <String, String>{};
    amznClientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String bulkDeploymentId,
  }) async {
    ArgumentError.checkNotNull(bulkDeploymentId, 'bulkDeploymentId');
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/greengrass/bulk/deployments/${Uri.encodeComponent(bulkDeploymentId)}/\$stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopBulkDeploymentResponse.fromJson(response);
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
    @_s.required String resourceArn,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
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
    @_s.required String thingName,
    List<ConnectivityInfo> connectivityInfo,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
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
    @_s.required String connectorDefinitionId,
    String name,
  }) async {
    ArgumentError.checkNotNull(connectorDefinitionId, 'connectorDefinitionId');
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
    return UpdateConnectorDefinitionResponse.fromJson(response);
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
    @_s.required String coreDefinitionId,
    String name,
  }) async {
    ArgumentError.checkNotNull(coreDefinitionId, 'coreDefinitionId');
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
    return UpdateCoreDefinitionResponse.fromJson(response);
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
    @_s.required String deviceDefinitionId,
    String name,
  }) async {
    ArgumentError.checkNotNull(deviceDefinitionId, 'deviceDefinitionId');
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
    return UpdateDeviceDefinitionResponse.fromJson(response);
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
    @_s.required String functionDefinitionId,
    String name,
  }) async {
    ArgumentError.checkNotNull(functionDefinitionId, 'functionDefinitionId');
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
    return UpdateFunctionDefinitionResponse.fromJson(response);
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
    @_s.required String groupId,
    String name,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/greengrass/groups/${Uri.encodeComponent(groupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGroupResponse.fromJson(response);
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
    @_s.required String groupId,
    String certificateExpiryInMilliseconds,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
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
    @_s.required String loggerDefinitionId,
    String name,
  }) async {
    ArgumentError.checkNotNull(loggerDefinitionId, 'loggerDefinitionId');
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
    return UpdateLoggerDefinitionResponse.fromJson(response);
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
    @_s.required String resourceDefinitionId,
    String name,
  }) async {
    ArgumentError.checkNotNull(resourceDefinitionId, 'resourceDefinitionId');
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
    return UpdateResourceDefinitionResponse.fromJson(response);
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
    @_s.required String subscriptionDefinitionId,
    String name,
  }) async {
    ArgumentError.checkNotNull(
        subscriptionDefinitionId, 'subscriptionDefinitionId');
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
    return UpdateSubscriptionDefinitionResponse.fromJson(response);
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
    @_s.required String thingName,
    TelemetryConfigurationUpdate telemetryConfiguration,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
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
    return UpdateThingRuntimeConfigurationResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateRoleToGroupResponse {
  /// The time, in milliseconds since the epoch, when the role ARN was associated
  /// with the group.
  @_s.JsonKey(name: 'AssociatedAt')
  final String associatedAt;

  AssociateRoleToGroupResponse({
    this.associatedAt,
  });
  factory AssociateRoleToGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateRoleToGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateServiceRoleToAccountResponse {
  /// The time when the service role was associated with the account.
  @_s.JsonKey(name: 'AssociatedAt')
  final String associatedAt;

  AssociateServiceRoleToAccountResponse({
    this.associatedAt,
  });
  factory AssociateServiceRoleToAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateServiceRoleToAccountResponseFromJson(json);
}

/// Information about a bulk deployment. You cannot start a new bulk deployment
/// while another one is still running or in a non-terminal state.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BulkDeployment {
  /// The ARN of the bulk deployment.
  @_s.JsonKey(name: 'BulkDeploymentArn')
  final String bulkDeploymentArn;

  /// The ID of the bulk deployment.
  @_s.JsonKey(name: 'BulkDeploymentId')
  final String bulkDeploymentId;

  /// The time, in ISO format, when the deployment was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  BulkDeployment({
    this.bulkDeploymentArn,
    this.bulkDeploymentId,
    this.createdAt,
  });
  factory BulkDeployment.fromJson(Map<String, dynamic> json) =>
      _$BulkDeploymentFromJson(json);
}

/// Relevant metrics on input records processed during bulk deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BulkDeploymentMetrics {
  /// The total number of records that returned a non-retryable error. For
  /// example, this can occur if a group record from the input file uses an
  /// invalid format or specifies a nonexistent group version, or if the execution
  /// role doesn't grant permission to deploy a group or group version.
  @_s.JsonKey(name: 'InvalidInputRecords')
  final int invalidInputRecords;

  /// The total number of group records from the input file that have been
  /// processed so far, or attempted.
  @_s.JsonKey(name: 'RecordsProcessed')
  final int recordsProcessed;

  /// The total number of deployment attempts that returned a retryable error. For
  /// example, a retry is triggered if the attempt to deploy a group returns a
  /// throttling error. ''StartBulkDeployment'' retries a group deployment up to
  /// five times.
  @_s.JsonKey(name: 'RetryAttempts')
  final int retryAttempts;

  BulkDeploymentMetrics({
    this.invalidInputRecords,
    this.recordsProcessed,
    this.retryAttempts,
  });
  factory BulkDeploymentMetrics.fromJson(Map<String, dynamic> json) =>
      _$BulkDeploymentMetricsFromJson(json);
}

/// Information about an individual group deployment in a bulk deployment
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BulkDeploymentResult {
  /// The time, in ISO format, when the deployment was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The ARN of the group deployment.
  @_s.JsonKey(name: 'DeploymentArn')
  final String deploymentArn;

  /// The ID of the group deployment.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  /// The current status of the group deployment: ''InProgress'', ''Building'',
  /// ''Success'', or ''Failure''.
  @_s.JsonKey(name: 'DeploymentStatus')
  final String deploymentStatus;

  /// The type of the deployment.
  @_s.JsonKey(name: 'DeploymentType')
  final DeploymentType deploymentType;

  /// Details about the error.
  @_s.JsonKey(name: 'ErrorDetails')
  final List<ErrorDetail> errorDetails;

  /// The error message for a failed deployment
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The ARN of the Greengrass group.
  @_s.JsonKey(name: 'GroupArn')
  final String groupArn;

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
  factory BulkDeploymentResult.fromJson(Map<String, dynamic> json) =>
      _$BulkDeploymentResultFromJson(json);
}

/// The current status of the bulk deployment.
enum BulkDeploymentStatus {
  @_s.JsonValue('Initializing')
  initializing,
  @_s.JsonValue('Running')
  running,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('Failed')
  failed,
}

enum ConfigurationSyncStatus {
  @_s.JsonValue('InSync')
  inSync,
  @_s.JsonValue('OutOfSync')
  outOfSync,
}

/// Information about a Greengrass core's connectivity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConnectivityInfo {
  /// The endpoint for the Greengrass core. Can be an IP address or DNS.
  @_s.JsonKey(name: 'HostAddress')
  final String hostAddress;

  /// The ID of the connectivity information.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Metadata for this endpoint.
  @_s.JsonKey(name: 'Metadata')
  final String metadata;

  /// The port of the Greengrass core. Usually 8883.
  @_s.JsonKey(name: 'PortNumber')
  final int portNumber;

  ConnectivityInfo({
    this.hostAddress,
    this.id,
    this.metadata,
    this.portNumber,
  });
  factory ConnectivityInfo.fromJson(Map<String, dynamic> json) =>
      _$ConnectivityInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectivityInfoToJson(this);
}

/// Information about a connector. Connectors run on the Greengrass core and
/// contain built-in integration with local infrastructure, device protocols,
/// AWS, and other cloud services.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Connector {
  /// The ARN of the connector.
  @_s.JsonKey(name: 'ConnectorArn')
  final String connectorArn;

  /// A descriptive or arbitrary ID for the connector. This value must be unique
  /// within the connector definition version. Max length is 128 characters with
  /// pattern [a-zA-Z0-9:_-]+.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The parameters or configuration that the connector uses.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  Connector({
    @_s.required this.connectorArn,
    @_s.required this.id,
    this.parameters,
  });
  factory Connector.fromJson(Map<String, dynamic> json) =>
      _$ConnectorFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectorToJson(this);
}

/// Information about the connector definition version, which is a container for
/// connectors.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConnectorDefinitionVersion {
  /// A list of references to connectors in this version, with their corresponding
  /// configuration settings.
  @_s.JsonKey(name: 'Connectors')
  final List<Connector> connectors;

  ConnectorDefinitionVersion({
    this.connectors,
  });
  factory ConnectorDefinitionVersion.fromJson(Map<String, dynamic> json) =>
      _$ConnectorDefinitionVersionFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectorDefinitionVersionToJson(this);
}

/// Information about a core.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Core {
  /// The ARN of the certificate associated with the core.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  /// A descriptive or arbitrary ID for the core. This value must be unique within
  /// the core definition version. Max length is 128 characters with pattern
  /// ''[a-zA-Z0-9:_-]+''.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ARN of the thing which is the core.
  @_s.JsonKey(name: 'ThingArn')
  final String thingArn;

  /// If true, the core's local shadow is automatically synced with the cloud.
  @_s.JsonKey(name: 'SyncShadow')
  final bool syncShadow;

  Core({
    @_s.required this.certificateArn,
    @_s.required this.id,
    @_s.required this.thingArn,
    this.syncShadow,
  });
  factory Core.fromJson(Map<String, dynamic> json) => _$CoreFromJson(json);

  Map<String, dynamic> toJson() => _$CoreToJson(this);
}

/// Information about a core definition version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CoreDefinitionVersion {
  /// A list of cores in the core definition version.
  @_s.JsonKey(name: 'Cores')
  final List<Core> cores;

  CoreDefinitionVersion({
    this.cores,
  });
  factory CoreDefinitionVersion.fromJson(Map<String, dynamic> json) =>
      _$CoreDefinitionVersionFromJson(json);

  Map<String, dynamic> toJson() => _$CoreDefinitionVersionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConnectorDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

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
          Map<String, dynamic> json) =>
      _$CreateConnectorDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConnectorDefinitionVersionResponse {
  /// The ARN of the version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateConnectorDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  factory CreateConnectorDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateConnectorDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCoreDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateCoreDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  factory CreateCoreDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCoreDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCoreDefinitionVersionResponse {
  /// The ARN of the version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateCoreDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  factory CreateCoreDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCoreDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentResponse {
  /// The ARN of the deployment.
  @_s.JsonKey(name: 'DeploymentArn')
  final String deploymentArn;

  /// The ID of the deployment.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  CreateDeploymentResponse({
    this.deploymentArn,
    this.deploymentId,
  });
  factory CreateDeploymentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDeploymentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeviceDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateDeviceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  factory CreateDeviceDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDeviceDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeviceDefinitionVersionResponse {
  /// The ARN of the version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateDeviceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  factory CreateDeviceDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateDeviceDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFunctionDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateFunctionDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  factory CreateFunctionDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateFunctionDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFunctionDefinitionVersionResponse {
  /// The ARN of the version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateFunctionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  factory CreateFunctionDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateFunctionDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupCertificateAuthorityResponse {
  /// The ARN of the group certificate authority.
  @_s.JsonKey(name: 'GroupCertificateAuthorityArn')
  final String groupCertificateAuthorityArn;

  CreateGroupCertificateAuthorityResponse({
    this.groupCertificateAuthorityArn,
  });
  factory CreateGroupCertificateAuthorityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateGroupCertificateAuthorityResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateGroupResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupVersionResponse {
  /// The ARN of the version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateGroupVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  factory CreateGroupVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLoggerDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateLoggerDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  factory CreateLoggerDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLoggerDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLoggerDefinitionVersionResponse {
  /// The ARN of the version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateLoggerDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  factory CreateLoggerDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateLoggerDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateResourceDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateResourceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  factory CreateResourceDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateResourceDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateResourceDefinitionVersionResponse {
  /// The ARN of the version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateResourceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  factory CreateResourceDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateResourceDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSoftwareUpdateJobResponse {
  /// The IoT Job ARN corresponding to this update.
  @_s.JsonKey(name: 'IotJobArn')
  final String iotJobArn;

  /// The IoT Job Id corresponding to this update.
  @_s.JsonKey(name: 'IotJobId')
  final String iotJobId;

  /// The software version installed on the device or devices after the update.
  @_s.JsonKey(name: 'PlatformSoftwareVersion')
  final String platformSoftwareVersion;

  CreateSoftwareUpdateJobResponse({
    this.iotJobArn,
    this.iotJobId,
    this.platformSoftwareVersion,
  });
  factory CreateSoftwareUpdateJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSoftwareUpdateJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSubscriptionDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

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
          Map<String, dynamic> json) =>
      _$CreateSubscriptionDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSubscriptionDefinitionVersionResponse {
  /// The ARN of the version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the version.
  @_s.JsonKey(name: 'Version')
  final String version;

  CreateSubscriptionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  factory CreateSubscriptionDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSubscriptionDefinitionVersionResponseFromJson(json);
}

/// Information about a definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DefinitionInformation {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory DefinitionInformation.fromJson(Map<String, dynamic> json) =>
      _$DefinitionInformationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConnectorDefinitionResponse {
  DeleteConnectorDefinitionResponse();
  factory DeleteConnectorDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteConnectorDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCoreDefinitionResponse {
  DeleteCoreDefinitionResponse();
  factory DeleteCoreDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCoreDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDeviceDefinitionResponse {
  DeleteDeviceDefinitionResponse();
  factory DeleteDeviceDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDeviceDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFunctionDefinitionResponse {
  DeleteFunctionDefinitionResponse();
  factory DeleteFunctionDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteFunctionDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGroupResponse {
  DeleteGroupResponse();
  factory DeleteGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLoggerDefinitionResponse {
  DeleteLoggerDefinitionResponse();
  factory DeleteLoggerDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteLoggerDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResourceDefinitionResponse {
  DeleteResourceDefinitionResponse();
  factory DeleteResourceDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteResourceDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSubscriptionDefinitionResponse {
  DeleteSubscriptionDefinitionResponse();
  factory DeleteSubscriptionDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteSubscriptionDefinitionResponseFromJson(json);
}

/// Information about a deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Deployment {
  /// The time, in milliseconds since the epoch, when the deployment was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The ARN of the deployment.
  @_s.JsonKey(name: 'DeploymentArn')
  final String deploymentArn;

  /// The ID of the deployment.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  /// The type of the deployment.
  @_s.JsonKey(name: 'DeploymentType')
  final DeploymentType deploymentType;

  /// The ARN of the group for this deployment.
  @_s.JsonKey(name: 'GroupArn')
  final String groupArn;

  Deployment({
    this.createdAt,
    this.deploymentArn,
    this.deploymentId,
    this.deploymentType,
    this.groupArn,
  });
  factory Deployment.fromJson(Map<String, dynamic> json) =>
      _$DeploymentFromJson(json);
}

/// The type of deployment. When used for ''CreateDeployment'', only
/// ''NewDeployment'' and ''Redeployment'' are valid.
enum DeploymentType {
  @_s.JsonValue('NewDeployment')
  newDeployment,
  @_s.JsonValue('Redeployment')
  redeployment,
  @_s.JsonValue('ResetDeployment')
  resetDeployment,
  @_s.JsonValue('ForceResetDeployment')
  forceResetDeployment,
}

extension on DeploymentType {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Device {
  /// The ARN of the certificate associated with the device.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  /// A descriptive or arbitrary ID for the device. This value must be unique
  /// within the device definition version. Max length is 128 characters with
  /// pattern ''[a-zA-Z0-9:_-]+''.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The thing ARN of the device.
  @_s.JsonKey(name: 'ThingArn')
  final String thingArn;

  /// If true, the device's local shadow will be automatically synced with the
  /// cloud.
  @_s.JsonKey(name: 'SyncShadow')
  final bool syncShadow;

  Device({
    @_s.required this.certificateArn,
    @_s.required this.id,
    @_s.required this.thingArn,
    this.syncShadow,
  });
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

/// Information about a device definition version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeviceDefinitionVersion {
  /// A list of devices in the definition version.
  @_s.JsonKey(name: 'Devices')
  final List<Device> devices;

  DeviceDefinitionVersion({
    this.devices,
  });
  factory DeviceDefinitionVersion.fromJson(Map<String, dynamic> json) =>
      _$DeviceDefinitionVersionFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDefinitionVersionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateRoleFromGroupResponse {
  /// The time, in milliseconds since the epoch, when the role was disassociated
  /// from the group.
  @_s.JsonKey(name: 'DisassociatedAt')
  final String disassociatedAt;

  DisassociateRoleFromGroupResponse({
    this.disassociatedAt,
  });
  factory DisassociateRoleFromGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateRoleFromGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateServiceRoleFromAccountResponse {
  /// The time when the service role was disassociated from the account.
  @_s.JsonKey(name: 'DisassociatedAt')
  final String disassociatedAt;

  DisassociateServiceRoleFromAccountResponse({
    this.disassociatedAt,
  });
  factory DisassociateServiceRoleFromAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateServiceRoleFromAccountResponseFromJson(json);
}

enum EncodingType {
  @_s.JsonValue('binary')
  binary,
  @_s.JsonValue('json')
  json,
}

/// Details about the error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorDetail {
  /// A detailed error code.
  @_s.JsonKey(name: 'DetailedErrorCode')
  final String detailedErrorCode;

  /// A detailed error message.
  @_s.JsonKey(name: 'DetailedErrorMessage')
  final String detailedErrorMessage;

  ErrorDetail({
    this.detailedErrorCode,
    this.detailedErrorMessage,
  });
  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);
}

/// Information about a Lambda function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class $Function {
  /// A descriptive or arbitrary ID for the function. This value must be unique
  /// within the function definition version. Max length is 128 characters with
  /// pattern ''[a-zA-Z0-9:_-]+''.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ARN of the Lambda function.
  @_s.JsonKey(name: 'FunctionArn')
  final String functionArn;

  /// The configuration of the Lambda function.
  @_s.JsonKey(name: 'FunctionConfiguration')
  final FunctionConfiguration functionConfiguration;

  $Function({
    @_s.required this.id,
    this.functionArn,
    this.functionConfiguration,
  });
  factory $Function.fromJson(Map<String, dynamic> json) =>
      _$$FunctionFromJson(json);

  Map<String, dynamic> toJson() => _$$FunctionToJson(this);
}

/// The configuration of the Lambda function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FunctionConfiguration {
  /// The expected encoding type of the input payload for the function. The
  /// default is ''json''.
  @_s.JsonKey(name: 'EncodingType')
  final EncodingType encodingType;

  /// The environment configuration of the function.
  @_s.JsonKey(name: 'Environment')
  final FunctionConfigurationEnvironment environment;

  /// The execution arguments.
  @_s.JsonKey(name: 'ExecArgs')
  final String execArgs;

  /// The name of the function executable.
  @_s.JsonKey(name: 'Executable')
  final String executable;

  /// The memory size, in KB, which the function requires. This setting is not
  /// applicable and should be cleared when you run the Lambda function without
  /// containerization.
  @_s.JsonKey(name: 'MemorySize')
  final int memorySize;

  /// True if the function is pinned. Pinned means the function is long-lived and
  /// starts when the core starts.
  @_s.JsonKey(name: 'Pinned')
  final bool pinned;

  /// The allowed function execution time, after which Lambda should terminate the
  /// function. This timeout still applies to pinned Lambda functions for each
  /// request.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  FunctionConfiguration({
    this.encodingType,
    this.environment,
    this.execArgs,
    this.executable,
    this.memorySize,
    this.pinned,
    this.timeout,
  });
  factory FunctionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$FunctionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionConfigurationToJson(this);
}

/// The environment configuration of the function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FunctionConfigurationEnvironment {
  /// If true, the Lambda function is allowed to access the host's /sys folder.
  /// Use this when the Lambda function needs to read device information from
  /// /sys. This setting applies only when you run the Lambda function in a
  /// Greengrass container.
  @_s.JsonKey(name: 'AccessSysfs')
  final bool accessSysfs;

  /// Configuration related to executing the Lambda function
  @_s.JsonKey(name: 'Execution')
  final FunctionExecutionConfig execution;

  /// A list of the resources, with their permissions, to which the Lambda
  /// function will be granted access. A Lambda function can have at most 10
  /// resources. ResourceAccessPolicies apply only when you run the Lambda
  /// function in a Greengrass container.
  @_s.JsonKey(name: 'ResourceAccessPolicies')
  final List<ResourceAccessPolicy> resourceAccessPolicies;

  /// Environment variables for the Lambda function's configuration.
  @_s.JsonKey(name: 'Variables')
  final Map<String, String> variables;

  FunctionConfigurationEnvironment({
    this.accessSysfs,
    this.execution,
    this.resourceAccessPolicies,
    this.variables,
  });
  factory FunctionConfigurationEnvironment.fromJson(
          Map<String, dynamic> json) =>
      _$FunctionConfigurationEnvironmentFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FunctionConfigurationEnvironmentToJson(this);
}

/// The default configuration that applies to all Lambda functions in the group.
/// Individual Lambda functions can override these settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FunctionDefaultConfig {
  @_s.JsonKey(name: 'Execution')
  final FunctionDefaultExecutionConfig execution;

  FunctionDefaultConfig({
    this.execution,
  });
  factory FunctionDefaultConfig.fromJson(Map<String, dynamic> json) =>
      _$FunctionDefaultConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionDefaultConfigToJson(this);
}

/// Configuration information that specifies how a Lambda function runs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FunctionDefaultExecutionConfig {
  @_s.JsonKey(name: 'IsolationMode')
  final FunctionIsolationMode isolationMode;
  @_s.JsonKey(name: 'RunAs')
  final FunctionRunAsConfig runAs;

  FunctionDefaultExecutionConfig({
    this.isolationMode,
    this.runAs,
  });
  factory FunctionDefaultExecutionConfig.fromJson(Map<String, dynamic> json) =>
      _$FunctionDefaultExecutionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionDefaultExecutionConfigToJson(this);
}

/// Information about a function definition version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FunctionDefinitionVersion {
  /// The default configuration that applies to all Lambda functions in this
  /// function definition version. Individual Lambda functions can override these
  /// settings.
  @_s.JsonKey(name: 'DefaultConfig')
  final FunctionDefaultConfig defaultConfig;

  /// A list of Lambda functions in this function definition version.
  @_s.JsonKey(name: 'Functions')
  final List<$Function> functions;

  FunctionDefinitionVersion({
    this.defaultConfig,
    this.functions,
  });
  factory FunctionDefinitionVersion.fromJson(Map<String, dynamic> json) =>
      _$FunctionDefinitionVersionFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionDefinitionVersionToJson(this);
}

/// Configuration information that specifies how a Lambda function runs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FunctionExecutionConfig {
  @_s.JsonKey(name: 'IsolationMode')
  final FunctionIsolationMode isolationMode;
  @_s.JsonKey(name: 'RunAs')
  final FunctionRunAsConfig runAs;

  FunctionExecutionConfig({
    this.isolationMode,
    this.runAs,
  });
  factory FunctionExecutionConfig.fromJson(Map<String, dynamic> json) =>
      _$FunctionExecutionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionExecutionConfigToJson(this);
}

/// Specifies whether the Lambda function runs in a Greengrass container
/// (default) or without containerization. Unless your scenario requires that
/// you run without containerization, we recommend that you run in a Greengrass
/// container. Omit this value to run the Lambda function with the default
/// containerization for the group.
enum FunctionIsolationMode {
  @_s.JsonValue('GreengrassContainer')
  greengrassContainer,
  @_s.JsonValue('NoContainer')
  noContainer,
}

/// Specifies the user and group whose permissions are used when running the
/// Lambda function. You can specify one or both values to override the default
/// values. We recommend that you avoid running as root unless absolutely
/// necessary to minimize the risk of unintended changes or malicious attacks.
/// To run as root, you must set ''IsolationMode'' to ''NoContainer'' and update
/// config.json in ''greengrass-root/config'' to set
/// ''allowFunctionsToRunAsRoot'' to ''yes''.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FunctionRunAsConfig {
  /// The group ID whose permissions are used to run a Lambda function.
  @_s.JsonKey(name: 'Gid')
  final int gid;

  /// The user ID whose permissions are used to run a Lambda function.
  @_s.JsonKey(name: 'Uid')
  final int uid;

  FunctionRunAsConfig({
    this.gid,
    this.uid,
  });
  factory FunctionRunAsConfig.fromJson(Map<String, dynamic> json) =>
      _$FunctionRunAsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionRunAsConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAssociatedRoleResponse {
  /// The time when the role was associated with the group.
  @_s.JsonKey(name: 'AssociatedAt')
  final String associatedAt;

  /// The ARN of the role that is associated with the group.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  GetAssociatedRoleResponse({
    this.associatedAt,
    this.roleArn,
  });
  factory GetAssociatedRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAssociatedRoleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBulkDeploymentStatusResponse {
  /// Relevant metrics on input records processed during bulk deployment.
  @_s.JsonKey(name: 'BulkDeploymentMetrics')
  final BulkDeploymentMetrics bulkDeploymentMetrics;

  /// The status of the bulk deployment.
  @_s.JsonKey(name: 'BulkDeploymentStatus')
  final BulkDeploymentStatus bulkDeploymentStatus;

  /// The time, in ISO format, when the deployment was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// Error details
  @_s.JsonKey(name: 'ErrorDetails')
  final List<ErrorDetail> errorDetails;

  /// Error message
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetBulkDeploymentStatusResponse({
    this.bulkDeploymentMetrics,
    this.bulkDeploymentStatus,
    this.createdAt,
    this.errorDetails,
    this.errorMessage,
    this.tags,
  });
  factory GetBulkDeploymentStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBulkDeploymentStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectivityInfoResponse {
  /// Connectivity info list.
  @_s.JsonKey(name: 'ConnectivityInfo')
  final List<ConnectivityInfo> connectivityInfo;

  /// A message about the connectivity info request.
  @_s.JsonKey(name: 'message')
  final String message;

  GetConnectivityInfoResponse({
    this.connectivityInfo,
    this.message,
  });
  factory GetConnectivityInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConnectivityInfoResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectorDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory GetConnectorDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConnectorDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectorDefinitionVersionResponse {
  /// The ARN of the connector definition version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the connector definition
  /// version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// Information about the connector definition version.
  @_s.JsonKey(name: 'Definition')
  final ConnectorDefinitionVersion definition;

  /// The ID of the connector definition version.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The version of the connector definition version.
  @_s.JsonKey(name: 'Version')
  final String version;

  GetConnectorDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  factory GetConnectorDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetConnectorDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCoreDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory GetCoreDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCoreDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCoreDefinitionVersionResponse {
  /// The ARN of the core definition version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the core definition version
  /// was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// Information about the core definition version.
  @_s.JsonKey(name: 'Definition')
  final CoreDefinitionVersion definition;

  /// The ID of the core definition version.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The version of the core definition version.
  @_s.JsonKey(name: 'Version')
  final String version;

  GetCoreDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  factory GetCoreDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCoreDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeploymentStatusResponse {
  /// The status of the deployment: ''InProgress'', ''Building'', ''Success'', or
  /// ''Failure''.
  @_s.JsonKey(name: 'DeploymentStatus')
  final String deploymentStatus;

  /// The type of the deployment.
  @_s.JsonKey(name: 'DeploymentType')
  final DeploymentType deploymentType;

  /// Error details
  @_s.JsonKey(name: 'ErrorDetails')
  final List<ErrorDetail> errorDetails;

  /// Error message
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The time, in milliseconds since the epoch, when the deployment status was
  /// updated.
  @_s.JsonKey(name: 'UpdatedAt')
  final String updatedAt;

  GetDeploymentStatusResponse({
    this.deploymentStatus,
    this.deploymentType,
    this.errorDetails,
    this.errorMessage,
    this.updatedAt,
  });
  factory GetDeploymentStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeploymentStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeviceDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory GetDeviceDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeviceDefinitionVersionResponse {
  /// The ARN of the device definition version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the device definition
  /// version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// Information about the device definition version.
  @_s.JsonKey(name: 'Definition')
  final DeviceDefinitionVersion definition;

  /// The ID of the device definition version.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The version of the device definition version.
  @_s.JsonKey(name: 'Version')
  final String version;

  GetDeviceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  factory GetDeviceDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDeviceDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFunctionDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory GetFunctionDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFunctionDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFunctionDefinitionVersionResponse {
  /// The ARN of the function definition version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the function definition
  /// version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// Information on the definition.
  @_s.JsonKey(name: 'Definition')
  final FunctionDefinitionVersion definition;

  /// The ID of the function definition version.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The version of the function definition version.
  @_s.JsonKey(name: 'Version')
  final String version;

  GetFunctionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  factory GetFunctionDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetFunctionDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupCertificateAuthorityResponse {
  /// The ARN of the certificate authority for the group.
  @_s.JsonKey(name: 'GroupCertificateAuthorityArn')
  final String groupCertificateAuthorityArn;

  /// The ID of the certificate authority for the group.
  @_s.JsonKey(name: 'GroupCertificateAuthorityId')
  final String groupCertificateAuthorityId;

  /// The PEM encoded certificate for the group.
  @_s.JsonKey(name: 'PemEncodedCertificate')
  final String pemEncodedCertificate;

  GetGroupCertificateAuthorityResponse({
    this.groupCertificateAuthorityArn,
    this.groupCertificateAuthorityId,
    this.pemEncodedCertificate,
  });
  factory GetGroupCertificateAuthorityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetGroupCertificateAuthorityResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupCertificateConfigurationResponse {
  /// The amount of time remaining before the certificate authority expires, in
  /// milliseconds.
  @_s.JsonKey(name: 'CertificateAuthorityExpiryInMilliseconds')
  final String certificateAuthorityExpiryInMilliseconds;

  /// The amount of time remaining before the certificate expires, in
  /// milliseconds.
  @_s.JsonKey(name: 'CertificateExpiryInMilliseconds')
  final String certificateExpiryInMilliseconds;

  /// The ID of the group certificate configuration.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  GetGroupCertificateConfigurationResponse({
    this.certificateAuthorityExpiryInMilliseconds,
    this.certificateExpiryInMilliseconds,
    this.groupId,
  });
  factory GetGroupCertificateConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetGroupCertificateConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory GetGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupVersionResponse {
  /// The ARN of the group version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the group version was
  /// created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// Information about the group version definition.
  @_s.JsonKey(name: 'Definition')
  final GroupVersion definition;

  /// The ID of the group that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the group version.
  @_s.JsonKey(name: 'Version')
  final String version;

  GetGroupVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.version,
  });
  factory GetGroupVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGroupVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLoggerDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory GetLoggerDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLoggerDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLoggerDefinitionVersionResponse {
  /// The ARN of the logger definition version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the logger definition
  /// version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// Information about the logger definition version.
  @_s.JsonKey(name: 'Definition')
  final LoggerDefinitionVersion definition;

  /// The ID of the logger definition version.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The version of the logger definition version.
  @_s.JsonKey(name: 'Version')
  final String version;

  GetLoggerDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.version,
  });
  factory GetLoggerDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetLoggerDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourceDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory GetResourceDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourceDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourceDefinitionVersionResponse {
  /// Arn of the resource definition version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the resource definition
  /// version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// Information about the definition.
  @_s.JsonKey(name: 'Definition')
  final ResourceDefinitionVersion definition;

  /// The ID of the resource definition version.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The version of the resource definition version.
  @_s.JsonKey(name: 'Version')
  final String version;

  GetResourceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.version,
  });
  factory GetResourceDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetResourceDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceRoleForAccountResponse {
  /// The time when the service role was associated with the account.
  @_s.JsonKey(name: 'AssociatedAt')
  final String associatedAt;

  /// The ARN of the role which is associated with the account.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  GetServiceRoleForAccountResponse({
    this.associatedAt,
    this.roleArn,
  });
  factory GetServiceRoleForAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetServiceRoleForAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSubscriptionDefinitionResponse {
  /// The ARN of the definition.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Tag(s) attached to the resource arn.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
          Map<String, dynamic> json) =>
      _$GetSubscriptionDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSubscriptionDefinitionVersionResponse {
  /// The ARN of the subscription definition version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the subscription definition
  /// version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// Information about the subscription definition version.
  @_s.JsonKey(name: 'Definition')
  final SubscriptionDefinitionVersion definition;

  /// The ID of the subscription definition version.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The version of the subscription definition version.
  @_s.JsonKey(name: 'Version')
  final String version;

  GetSubscriptionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  factory GetSubscriptionDefinitionVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSubscriptionDefinitionVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetThingRuntimeConfigurationResponse {
  /// Runtime configuration for a thing.
  @_s.JsonKey(name: 'RuntimeConfiguration')
  final RuntimeConfiguration runtimeConfiguration;

  GetThingRuntimeConfigurationResponse({
    this.runtimeConfiguration,
  });
  factory GetThingRuntimeConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetThingRuntimeConfigurationResponseFromJson(json);
}

/// Information about a certificate authority for a group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupCertificateAuthorityProperties {
  /// The ARN of the certificate authority for the group.
  @_s.JsonKey(name: 'GroupCertificateAuthorityArn')
  final String groupCertificateAuthorityArn;

  /// The ID of the certificate authority for the group.
  @_s.JsonKey(name: 'GroupCertificateAuthorityId')
  final String groupCertificateAuthorityId;

  GroupCertificateAuthorityProperties({
    this.groupCertificateAuthorityArn,
    this.groupCertificateAuthorityId,
  });
  factory GroupCertificateAuthorityProperties.fromJson(
          Map<String, dynamic> json) =>
      _$GroupCertificateAuthorityPropertiesFromJson(json);
}

/// Information about a group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupInformation {
  /// The ARN of the group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the group was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The time, in milliseconds since the epoch, when the group was last updated.
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the group.
  @_s.JsonKey(name: 'LatestVersion')
  final String latestVersion;

  /// The ARN of the latest version associated with the group.
  @_s.JsonKey(name: 'LatestVersionArn')
  final String latestVersionArn;

  /// The name of the group.
  @_s.JsonKey(name: 'Name')
  final String name;

  GroupInformation({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  factory GroupInformation.fromJson(Map<String, dynamic> json) =>
      _$GroupInformationFromJson(json);
}

/// Group owner related settings for local resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GroupOwnerSetting {
  /// If true, AWS IoT Greengrass automatically adds the specified Linux OS group
  /// owner of the resource to the Lambda process privileges. Thus the Lambda
  /// process will have the file access permissions of the added Linux group.
  @_s.JsonKey(name: 'AutoAddGroupOwner')
  final bool autoAddGroupOwner;

  /// The name of the Linux OS group whose privileges will be added to the Lambda
  /// process. This field is optional.
  @_s.JsonKey(name: 'GroupOwner')
  final String groupOwner;

  GroupOwnerSetting({
    this.autoAddGroupOwner,
    this.groupOwner,
  });
  factory GroupOwnerSetting.fromJson(Map<String, dynamic> json) =>
      _$GroupOwnerSettingFromJson(json);

  Map<String, dynamic> toJson() => _$GroupOwnerSettingToJson(this);
}

/// Information about a group version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GroupVersion {
  /// The ARN of the connector definition version for this group.
  @_s.JsonKey(name: 'ConnectorDefinitionVersionArn')
  final String connectorDefinitionVersionArn;

  /// The ARN of the core definition version for this group.
  @_s.JsonKey(name: 'CoreDefinitionVersionArn')
  final String coreDefinitionVersionArn;

  /// The ARN of the device definition version for this group.
  @_s.JsonKey(name: 'DeviceDefinitionVersionArn')
  final String deviceDefinitionVersionArn;

  /// The ARN of the function definition version for this group.
  @_s.JsonKey(name: 'FunctionDefinitionVersionArn')
  final String functionDefinitionVersionArn;

  /// The ARN of the logger definition version for this group.
  @_s.JsonKey(name: 'LoggerDefinitionVersionArn')
  final String loggerDefinitionVersionArn;

  /// The ARN of the resource definition version for this group.
  @_s.JsonKey(name: 'ResourceDefinitionVersionArn')
  final String resourceDefinitionVersionArn;

  /// The ARN of the subscription definition version for this group.
  @_s.JsonKey(name: 'SubscriptionDefinitionVersionArn')
  final String subscriptionDefinitionVersionArn;

  GroupVersion({
    this.connectorDefinitionVersionArn,
    this.coreDefinitionVersionArn,
    this.deviceDefinitionVersionArn,
    this.functionDefinitionVersionArn,
    this.loggerDefinitionVersionArn,
    this.resourceDefinitionVersionArn,
    this.subscriptionDefinitionVersionArn,
  });
  factory GroupVersion.fromJson(Map<String, dynamic> json) =>
      _$GroupVersionFromJson(json);

  Map<String, dynamic> toJson() => _$GroupVersionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBulkDeploymentDetailedReportsResponse {
  /// A list of the individual group deployments in the bulk deployment operation.
  @_s.JsonKey(name: 'Deployments')
  final List<BulkDeploymentResult> deployments;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBulkDeploymentDetailedReportsResponse({
    this.deployments,
    this.nextToken,
  });
  factory ListBulkDeploymentDetailedReportsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListBulkDeploymentDetailedReportsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBulkDeploymentsResponse {
  /// A list of bulk deployments.
  @_s.JsonKey(name: 'BulkDeployments')
  final List<BulkDeployment> bulkDeployments;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBulkDeploymentsResponse({
    this.bulkDeployments,
    this.nextToken,
  });
  factory ListBulkDeploymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBulkDeploymentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConnectorDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about a version.
  @_s.JsonKey(name: 'Versions')
  final List<VersionInformation> versions;

  ListConnectorDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  factory ListConnectorDefinitionVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListConnectorDefinitionVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConnectorDefinitionsResponse {
  /// Information about a definition.
  @_s.JsonKey(name: 'Definitions')
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListConnectorDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  factory ListConnectorDefinitionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListConnectorDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCoreDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about a version.
  @_s.JsonKey(name: 'Versions')
  final List<VersionInformation> versions;

  ListCoreDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  factory ListCoreDefinitionVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCoreDefinitionVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCoreDefinitionsResponse {
  /// Information about a definition.
  @_s.JsonKey(name: 'Definitions')
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCoreDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  factory ListCoreDefinitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCoreDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeploymentsResponse {
  /// A list of deployments for the requested groups.
  @_s.JsonKey(name: 'Deployments')
  final List<Deployment> deployments;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDeploymentsResponse({
    this.deployments,
    this.nextToken,
  });
  factory ListDeploymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDeploymentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeviceDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about a version.
  @_s.JsonKey(name: 'Versions')
  final List<VersionInformation> versions;

  ListDeviceDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  factory ListDeviceDefinitionVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDeviceDefinitionVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeviceDefinitionsResponse {
  /// Information about a definition.
  @_s.JsonKey(name: 'Definitions')
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDeviceDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  factory ListDeviceDefinitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDeviceDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFunctionDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about a version.
  @_s.JsonKey(name: 'Versions')
  final List<VersionInformation> versions;

  ListFunctionDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  factory ListFunctionDefinitionVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListFunctionDefinitionVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFunctionDefinitionsResponse {
  /// Information about a definition.
  @_s.JsonKey(name: 'Definitions')
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFunctionDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  factory ListFunctionDefinitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFunctionDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupCertificateAuthoritiesResponse {
  /// A list of certificate authorities associated with the group.
  @_s.JsonKey(name: 'GroupCertificateAuthorities')
  final List<GroupCertificateAuthorityProperties> groupCertificateAuthorities;

  ListGroupCertificateAuthoritiesResponse({
    this.groupCertificateAuthorities,
  });
  factory ListGroupCertificateAuthoritiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListGroupCertificateAuthoritiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about a version.
  @_s.JsonKey(name: 'Versions')
  final List<VersionInformation> versions;

  ListGroupVersionsResponse({
    this.nextToken,
    this.versions,
  });
  factory ListGroupVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroupVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupsResponse {
  /// Information about a group.
  @_s.JsonKey(name: 'Groups')
  final List<GroupInformation> groups;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGroupsResponse({
    this.groups,
    this.nextToken,
  });
  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLoggerDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about a version.
  @_s.JsonKey(name: 'Versions')
  final List<VersionInformation> versions;

  ListLoggerDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  factory ListLoggerDefinitionVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListLoggerDefinitionVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLoggerDefinitionsResponse {
  /// Information about a definition.
  @_s.JsonKey(name: 'Definitions')
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLoggerDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  factory ListLoggerDefinitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLoggerDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about a version.
  @_s.JsonKey(name: 'Versions')
  final List<VersionInformation> versions;

  ListResourceDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  factory ListResourceDefinitionVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListResourceDefinitionVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceDefinitionsResponse {
  /// Information about a definition.
  @_s.JsonKey(name: 'Definitions')
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListResourceDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  factory ListResourceDefinitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourceDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSubscriptionDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about a version.
  @_s.JsonKey(name: 'Versions')
  final List<VersionInformation> versions;

  ListSubscriptionDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  factory ListSubscriptionDefinitionVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSubscriptionDefinitionVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSubscriptionDefinitionsResponse {
  /// Information about a definition.
  @_s.JsonKey(name: 'Definitions')
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListSubscriptionDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  factory ListSubscriptionDefinitionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSubscriptionDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Attributes that define a local device resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LocalDeviceResourceData {
  /// Group/owner related settings for local resources.
  @_s.JsonKey(name: 'GroupOwnerSetting')
  final GroupOwnerSetting groupOwnerSetting;

  /// The local absolute path of the device resource. The source path for a device
  /// resource can refer only to a character device or block device under
  /// ''/dev''.
  @_s.JsonKey(name: 'SourcePath')
  final String sourcePath;

  LocalDeviceResourceData({
    this.groupOwnerSetting,
    this.sourcePath,
  });
  factory LocalDeviceResourceData.fromJson(Map<String, dynamic> json) =>
      _$LocalDeviceResourceDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocalDeviceResourceDataToJson(this);
}

/// Attributes that define a local volume resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LocalVolumeResourceData {
  /// The absolute local path of the resource inside the Lambda environment.
  @_s.JsonKey(name: 'DestinationPath')
  final String destinationPath;

  /// Allows you to configure additional group privileges for the Lambda process.
  /// This field is optional.
  @_s.JsonKey(name: 'GroupOwnerSetting')
  final GroupOwnerSetting groupOwnerSetting;

  /// The local absolute path of the volume resource on the host. The source path
  /// for a volume resource type cannot start with ''/sys''.
  @_s.JsonKey(name: 'SourcePath')
  final String sourcePath;

  LocalVolumeResourceData({
    this.destinationPath,
    this.groupOwnerSetting,
    this.sourcePath,
  });
  factory LocalVolumeResourceData.fromJson(Map<String, dynamic> json) =>
      _$LocalVolumeResourceDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocalVolumeResourceDataToJson(this);
}

/// Information about a logger
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Logger {
  /// The component that will be subject to logging.
  @_s.JsonKey(name: 'Component')
  final LoggerComponent component;

  /// A descriptive or arbitrary ID for the logger. This value must be unique
  /// within the logger definition version. Max length is 128 characters with
  /// pattern ''[a-zA-Z0-9:_-]+''.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The level of the logs.
  @_s.JsonKey(name: 'Level')
  final LoggerLevel level;

  /// The type of log output which will be used.
  @_s.JsonKey(name: 'Type')
  final LoggerType type;

  /// The amount of file space, in KB, to use if the local file system is used for
  /// logging purposes.
  @_s.JsonKey(name: 'Space')
  final int space;

  Logger({
    @_s.required this.component,
    @_s.required this.id,
    @_s.required this.level,
    @_s.required this.type,
    this.space,
  });
  factory Logger.fromJson(Map<String, dynamic> json) => _$LoggerFromJson(json);

  Map<String, dynamic> toJson() => _$LoggerToJson(this);
}

enum LoggerComponent {
  @_s.JsonValue('GreengrassSystem')
  greengrassSystem,
  @_s.JsonValue('Lambda')
  lambda,
}

/// Information about a logger definition version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggerDefinitionVersion {
  /// A list of loggers.
  @_s.JsonKey(name: 'Loggers')
  final List<Logger> loggers;

  LoggerDefinitionVersion({
    this.loggers,
  });
  factory LoggerDefinitionVersion.fromJson(Map<String, dynamic> json) =>
      _$LoggerDefinitionVersionFromJson(json);

  Map<String, dynamic> toJson() => _$LoggerDefinitionVersionToJson(this);
}

enum LoggerLevel {
  @_s.JsonValue('DEBUG')
  debug,
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('WARN')
  warn,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('FATAL')
  fatal,
}

enum LoggerType {
  @_s.JsonValue('FileSystem')
  fileSystem,
  @_s.JsonValue('AWSCloudWatch')
  awsCloudWatch,
}

/// The type of permission a function has to access a resource.
enum Permission {
  @_s.JsonValue('ro')
  ro,
  @_s.JsonValue('rw')
  rw,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResetDeploymentsResponse {
  /// The ARN of the deployment.
  @_s.JsonKey(name: 'DeploymentArn')
  final String deploymentArn;

  /// The ID of the deployment.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  ResetDeploymentsResponse({
    this.deploymentArn,
    this.deploymentId,
  });
  factory ResetDeploymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetDeploymentsResponseFromJson(json);
}

/// Information about a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Resource {
  /// The resource ID, used to refer to a resource in the Lambda function
  /// configuration. Max length is 128 characters with pattern
  /// ''[a-zA-Z0-9:_-]+''. This must be unique within a Greengrass group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The descriptive resource name, which is displayed on the AWS IoT Greengrass
  /// console. Max length 128 characters with pattern ''[a-zA-Z0-9:_-]+''. This
  /// must be unique within a Greengrass group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A container of data for all resource types.
  @_s.JsonKey(name: 'ResourceDataContainer')
  final ResourceDataContainer resourceDataContainer;

  Resource({
    @_s.required this.id,
    @_s.required this.name,
    @_s.required this.resourceDataContainer,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}

/// A policy used by the function to access a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceAccessPolicy {
  /// The ID of the resource. (This ID is assigned to the resource when you create
  /// the resource definiton.)
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The permissions that the Lambda function has to the resource. Can be one of
  /// ''rw'' (read/write) or ''ro'' (read-only).
  @_s.JsonKey(name: 'Permission')
  final Permission permission;

  ResourceAccessPolicy({
    @_s.required this.resourceId,
    this.permission,
  });
  factory ResourceAccessPolicy.fromJson(Map<String, dynamic> json) =>
      _$ResourceAccessPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceAccessPolicyToJson(this);
}

/// A container for resource data. The container takes only one of the following
/// supported resource data types: ''LocalDeviceResourceData'',
/// ''LocalVolumeResourceData'', ''SageMakerMachineLearningModelResourceData'',
/// ''S3MachineLearningModelResourceData'',
/// ''SecretsManagerSecretResourceData''.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceDataContainer {
  /// Attributes that define the local device resource.
  @_s.JsonKey(name: 'LocalDeviceResourceData')
  final LocalDeviceResourceData localDeviceResourceData;

  /// Attributes that define the local volume resource.
  @_s.JsonKey(name: 'LocalVolumeResourceData')
  final LocalVolumeResourceData localVolumeResourceData;

  /// Attributes that define an Amazon S3 machine learning resource.
  @_s.JsonKey(name: 'S3MachineLearningModelResourceData')
  final S3MachineLearningModelResourceData s3MachineLearningModelResourceData;

  /// Attributes that define an Amazon SageMaker machine learning resource.
  @_s.JsonKey(name: 'SageMakerMachineLearningModelResourceData')
  final SageMakerMachineLearningModelResourceData
      sageMakerMachineLearningModelResourceData;

  /// Attributes that define a secret resource, which references a secret from AWS
  /// Secrets Manager.
  @_s.JsonKey(name: 'SecretsManagerSecretResourceData')
  final SecretsManagerSecretResourceData secretsManagerSecretResourceData;

  ResourceDataContainer({
    this.localDeviceResourceData,
    this.localVolumeResourceData,
    this.s3MachineLearningModelResourceData,
    this.sageMakerMachineLearningModelResourceData,
    this.secretsManagerSecretResourceData,
  });
  factory ResourceDataContainer.fromJson(Map<String, dynamic> json) =>
      _$ResourceDataContainerFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDataContainerToJson(this);
}

/// Information about a resource definition version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceDefinitionVersion {
  /// A list of resources.
  @_s.JsonKey(name: 'Resources')
  final List<Resource> resources;

  ResourceDefinitionVersion({
    this.resources,
  });
  factory ResourceDefinitionVersion.fromJson(Map<String, dynamic> json) =>
      _$ResourceDefinitionVersionFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDefinitionVersionToJson(this);
}

/// The owner setting for downloaded machine learning resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceDownloadOwnerSetting {
  /// The group owner of the resource. This is the name of an existing Linux OS
  /// group on the system or a GID. The group's permissions are added to the
  /// Lambda process.
  @_s.JsonKey(name: 'GroupOwner')
  final String groupOwner;

  /// The permissions that the group owner has to the resource. Valid values are
  /// ''rw'' (read/write) or ''ro'' (read-only).
  @_s.JsonKey(name: 'GroupPermission')
  final Permission groupPermission;

  ResourceDownloadOwnerSetting({
    @_s.required this.groupOwner,
    @_s.required this.groupPermission,
  });
  factory ResourceDownloadOwnerSetting.fromJson(Map<String, dynamic> json) =>
      _$ResourceDownloadOwnerSettingFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDownloadOwnerSettingToJson(this);
}

/// Runtime configuration for a thing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RuntimeConfiguration {
  /// Configuration for telemetry service.
  @_s.JsonKey(name: 'TelemetryConfiguration')
  final TelemetryConfiguration telemetryConfiguration;

  RuntimeConfiguration({
    this.telemetryConfiguration,
  });
  factory RuntimeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RuntimeConfigurationFromJson(json);
}

/// Attributes that define an Amazon S3 machine learning resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3MachineLearningModelResourceData {
  /// The absolute local path of the resource inside the Lambda environment.
  @_s.JsonKey(name: 'DestinationPath')
  final String destinationPath;
  @_s.JsonKey(name: 'OwnerSetting')
  final ResourceDownloadOwnerSetting ownerSetting;

  /// The URI of the source model in an S3 bucket. The model package must be in
  /// tar.gz or .zip format.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  S3MachineLearningModelResourceData({
    this.destinationPath,
    this.ownerSetting,
    this.s3Uri,
  });
  factory S3MachineLearningModelResourceData.fromJson(
          Map<String, dynamic> json) =>
      _$S3MachineLearningModelResourceDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$S3MachineLearningModelResourceDataToJson(this);
}

/// Attributes that define an Amazon SageMaker machine learning resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SageMakerMachineLearningModelResourceData {
  /// The absolute local path of the resource inside the Lambda environment.
  @_s.JsonKey(name: 'DestinationPath')
  final String destinationPath;
  @_s.JsonKey(name: 'OwnerSetting')
  final ResourceDownloadOwnerSetting ownerSetting;

  /// The ARN of the Amazon SageMaker training job that represents the source
  /// model.
  @_s.JsonKey(name: 'SageMakerJobArn')
  final String sageMakerJobArn;

  SageMakerMachineLearningModelResourceData({
    this.destinationPath,
    this.ownerSetting,
    this.sageMakerJobArn,
  });
  factory SageMakerMachineLearningModelResourceData.fromJson(
          Map<String, dynamic> json) =>
      _$SageMakerMachineLearningModelResourceDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SageMakerMachineLearningModelResourceDataToJson(this);
}

/// Attributes that define a secret resource, which references a secret from AWS
/// Secrets Manager. AWS IoT Greengrass stores a local, encrypted copy of the
/// secret on the Greengrass core, where it can be securely accessed by
/// connectors and Lambda functions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SecretsManagerSecretResourceData {
  /// The ARN of the Secrets Manager secret to make available on the core. The
  /// value of the secret's latest version (represented by the ''AWSCURRENT''
  /// staging label) is included by default.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// Optional. The staging labels whose values you want to make available on the
  /// core, in addition to ''AWSCURRENT''.
  @_s.JsonKey(name: 'AdditionalStagingLabelsToDownload')
  final List<String> additionalStagingLabelsToDownload;

  SecretsManagerSecretResourceData({
    this.arn,
    this.additionalStagingLabelsToDownload,
  });
  factory SecretsManagerSecretResourceData.fromJson(
          Map<String, dynamic> json) =>
      _$SecretsManagerSecretResourceDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SecretsManagerSecretResourceDataToJson(this);
}

/// The piece of software on the Greengrass core that will be updated.
enum SoftwareToUpdate {
  @_s.JsonValue('core')
  core,
  @_s.JsonValue('ota_agent')
  otaAgent,
}

extension on SoftwareToUpdate {
  String toValue() {
    switch (this) {
      case SoftwareToUpdate.core:
        return 'core';
      case SoftwareToUpdate.otaAgent:
        return 'ota_agent';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartBulkDeploymentResponse {
  /// The ARN of the bulk deployment.
  @_s.JsonKey(name: 'BulkDeploymentArn')
  final String bulkDeploymentArn;

  /// The ID of the bulk deployment.
  @_s.JsonKey(name: 'BulkDeploymentId')
  final String bulkDeploymentId;

  StartBulkDeploymentResponse({
    this.bulkDeploymentArn,
    this.bulkDeploymentId,
  });
  factory StartBulkDeploymentResponse.fromJson(Map<String, dynamic> json) =>
      _$StartBulkDeploymentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopBulkDeploymentResponse {
  StopBulkDeploymentResponse();
  factory StopBulkDeploymentResponse.fromJson(Map<String, dynamic> json) =>
      _$StopBulkDeploymentResponseFromJson(json);
}

/// Information about a subscription.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Subscription {
  /// A descriptive or arbitrary ID for the subscription. This value must be
  /// unique within the subscription definition version. Max length is 128
  /// characters with pattern ''[a-zA-Z0-9:_-]+''.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The source of the subscription. Can be a thing ARN, a Lambda function ARN, a
  /// connector ARN, 'cloud' (which represents the AWS IoT cloud), or
  /// 'GGShadowService'.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The MQTT topic used to route the message.
  @_s.JsonKey(name: 'Subject')
  final String subject;

  /// Where the message is sent to. Can be a thing ARN, a Lambda function ARN, a
  /// connector ARN, 'cloud' (which represents the AWS IoT cloud), or
  /// 'GGShadowService'.
  @_s.JsonKey(name: 'Target')
  final String target;

  Subscription({
    @_s.required this.id,
    @_s.required this.source,
    @_s.required this.subject,
    @_s.required this.target,
  });
  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}

/// Information about a subscription definition version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SubscriptionDefinitionVersion {
  /// A list of subscriptions.
  @_s.JsonKey(name: 'Subscriptions')
  final List<Subscription> subscriptions;

  SubscriptionDefinitionVersion({
    this.subscriptions,
  });
  factory SubscriptionDefinitionVersion.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDefinitionVersionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionDefinitionVersionToJson(this);
}

enum Telemetry {
  @_s.JsonValue('On')
  on,
  @_s.JsonValue('Off')
  off,
}

/// Configuration settings for running telemetry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TelemetryConfiguration {
  /// Configure telemetry to be on or off.
  @_s.JsonKey(name: 'Telemetry')
  final Telemetry telemetry;

  /// Synchronization status of the device reported configuration with the desired
  /// configuration.
  @_s.JsonKey(name: 'ConfigurationSyncStatus')
  final ConfigurationSyncStatus configurationSyncStatus;

  TelemetryConfiguration({
    @_s.required this.telemetry,
    this.configurationSyncStatus,
  });
  factory TelemetryConfiguration.fromJson(Map<String, dynamic> json) =>
      _$TelemetryConfigurationFromJson(json);
}

/// Configuration settings for running telemetry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TelemetryConfigurationUpdate {
  /// Configure telemetry to be on or off.
  @_s.JsonKey(name: 'Telemetry')
  final Telemetry telemetry;

  TelemetryConfigurationUpdate({
    @_s.required this.telemetry,
  });
  Map<String, dynamic> toJson() => _$TelemetryConfigurationUpdateToJson(this);
}

/// The minimum level of log statements that should be logged by the OTA Agent
/// during an update.
enum UpdateAgentLogLevel {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('TRACE')
  trace,
  @_s.JsonValue('DEBUG')
  debug,
  @_s.JsonValue('VERBOSE')
  verbose,
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('WARN')
  warn,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('FATAL')
  fatal,
}

extension on UpdateAgentLogLevel {
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConnectivityInfoResponse {
  /// A message about the connectivity info update request.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The new version of the connectivity info.
  @_s.JsonKey(name: 'Version')
  final String version;

  UpdateConnectivityInfoResponse({
    this.message,
    this.version,
  });
  factory UpdateConnectivityInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateConnectivityInfoResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConnectorDefinitionResponse {
  UpdateConnectorDefinitionResponse();
  factory UpdateConnectorDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateConnectorDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCoreDefinitionResponse {
  UpdateCoreDefinitionResponse();
  factory UpdateCoreDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCoreDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDeviceDefinitionResponse {
  UpdateDeviceDefinitionResponse();
  factory UpdateDeviceDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeviceDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFunctionDefinitionResponse {
  UpdateFunctionDefinitionResponse();
  factory UpdateFunctionDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateFunctionDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGroupCertificateConfigurationResponse {
  /// The amount of time remaining before the certificate authority expires, in
  /// milliseconds.
  @_s.JsonKey(name: 'CertificateAuthorityExpiryInMilliseconds')
  final String certificateAuthorityExpiryInMilliseconds;

  /// The amount of time remaining before the certificate expires, in
  /// milliseconds.
  @_s.JsonKey(name: 'CertificateExpiryInMilliseconds')
  final String certificateExpiryInMilliseconds;

  /// The ID of the group certificate configuration.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  UpdateGroupCertificateConfigurationResponse({
    this.certificateAuthorityExpiryInMilliseconds,
    this.certificateExpiryInMilliseconds,
    this.groupId,
  });
  factory UpdateGroupCertificateConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateGroupCertificateConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGroupResponse {
  UpdateGroupResponse();
  factory UpdateGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLoggerDefinitionResponse {
  UpdateLoggerDefinitionResponse();
  factory UpdateLoggerDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateLoggerDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResourceDefinitionResponse {
  UpdateResourceDefinitionResponse();
  factory UpdateResourceDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateResourceDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSubscriptionDefinitionResponse {
  UpdateSubscriptionDefinitionResponse();
  factory UpdateSubscriptionDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateSubscriptionDefinitionResponseFromJson(json);
}

/// The architecture of the cores which are the targets of an update.
enum UpdateTargetsArchitecture {
  @_s.JsonValue('armv6l')
  armv6l,
  @_s.JsonValue('armv7l')
  armv7l,
  @_s.JsonValue('x86_64')
  x86_64,
  @_s.JsonValue('aarch64')
  aarch64,
}

extension on UpdateTargetsArchitecture {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The operating system of the cores which are the targets of an update.
enum UpdateTargetsOperatingSystem {
  @_s.JsonValue('ubuntu')
  ubuntu,
  @_s.JsonValue('raspbian')
  raspbian,
  @_s.JsonValue('amazon_linux')
  amazonLinux,
  @_s.JsonValue('openwrt')
  openwrt,
}

extension on UpdateTargetsOperatingSystem {
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateThingRuntimeConfigurationResponse {
  UpdateThingRuntimeConfigurationResponse();
  factory UpdateThingRuntimeConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateThingRuntimeConfigurationResponseFromJson(json);
}

/// Information about a version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VersionInformation {
  /// The ARN of the version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  @_s.JsonKey(name: 'CreationTimestamp')
  final String creationTimestamp;

  /// The ID of the parent definition that the version is associated with.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the version.
  @_s.JsonKey(name: 'Version')
  final String version;

  VersionInformation({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  factory VersionInformation.fromJson(Map<String, dynamic> json) =>
      _$VersionInformationFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
};
