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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon MQ is a managed message broker service for Apache ActiveMQ and
/// RabbitMQ that makes it easy to set up and operate message brokers in the
/// cloud. A message broker allows software applications and components to
/// communicate using various programming languages, operating systems, and
/// formal messaging protocols.
class MQ {
  final _s.RestJsonProtocol _protocol;
  MQ({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mq',
            signingName: 'mq',
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

  /// Creates a broker. Note: This API is asynchronous.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [authenticationStrategy] :
  /// The authentication strategy used to secure the broker.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// Required. Enables automatic upgrades to new minor versions for brokers, as
  /// Apache releases the versions. The automatic upgrades occur during the
  /// maintenance window of the broker or after a manual broker reboot.
  ///
  /// Parameter [brokerName] :
  /// Required. The name of the broker. This value must be unique in your AWS
  /// account, 1-50 characters long, must contain only letters, numbers, dashes,
  /// and underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  ///
  /// Parameter [configuration] :
  /// A list of information about the configuration.
  ///
  /// Parameter [creatorRequestId] :
  /// The unique ID that the requester receives for the created broker. Amazon
  /// MQ passes your ID with the API action. Note: We recommend using a
  /// Universally Unique Identifier (UUID) for the creatorRequestId. You may
  /// omit the creatorRequestId if your application doesn't require idempotency.
  ///
  /// Parameter [deploymentMode] :
  /// Required. The deployment mode of the broker.
  ///
  /// Parameter [encryptionOptions] :
  /// Encryption options for the broker.
  ///
  /// Parameter [engineType] :
  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// ACTIVEMQ and RABBITMQ.
  ///
  /// Parameter [engineVersion] :
  /// Required. The version of the broker engine. For a list of supported engine
  /// versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  ///
  /// Parameter [hostInstanceType] :
  /// Required. The broker's instance type.
  ///
  /// Parameter [ldapServerMetadata] :
  /// The metadata of the LDAP server used to authenticate and authorize
  /// connections to the broker.
  ///
  /// Parameter [logs] :
  /// Enables Amazon CloudWatch logging for brokers.
  ///
  /// Parameter [maintenanceWindowStartTime] :
  /// The parameters that determine the WeeklyStartTime.
  ///
  /// Parameter [publiclyAccessible] :
  /// Required. Enables connections from applications outside of the VPC that
  /// hosts the broker's subnets.
  ///
  /// Parameter [securityGroups] :
  /// The list of security groups (1 minimum, 5 maximum) that authorizes
  /// connections to brokers.
  ///
  /// Parameter [storageType] :
  /// The broker's storage type.
  ///
  /// Parameter [subnetIds] :
  /// The list of groups that define which subnets and IP ranges the broker can
  /// use from different Availability Zones. A SINGLE_INSTANCE deployment
  /// requires one subnet (for example, the default subnet). An
  /// ACTIVE_STANDBY_MULTI_AZ deployment (ACTIVEMQ) requires two subnets. A
  /// CLUSTER_MULTI_AZ deployment (RABBITMQ) has no subnet requirements when
  /// deployed with public accessibility, deployment without public
  /// accessibility requires at least one subnet.
  ///
  /// Parameter [tags] :
  /// Create tags when creating the broker.
  ///
  /// Parameter [users] :
  /// Required. The list of broker users (persons or applications) who can
  /// access queues and topics. For RabbitMQ brokers, one and only one
  /// administrative user is accepted and created when a broker is first
  /// provisioned. All subsequent broker users are created by making RabbitMQ
  /// API calls directly to brokers or via the RabbitMQ Web Console. This value
  /// can contain only alphanumeric characters, dashes, periods, underscores,
  /// and tildes (- . _ ~). This value must be 2-100 characters long.
  Future<CreateBrokerResponse> createBroker({
    AuthenticationStrategy? authenticationStrategy,
    bool? autoMinorVersionUpgrade,
    String? brokerName,
    ConfigurationId? configuration,
    String? creatorRequestId,
    DeploymentMode? deploymentMode,
    EncryptionOptions? encryptionOptions,
    EngineType? engineType,
    String? engineVersion,
    String? hostInstanceType,
    LdapServerMetadataInput? ldapServerMetadata,
    Logs? logs,
    WeeklyStartTime? maintenanceWindowStartTime,
    bool? publiclyAccessible,
    List<String>? securityGroups,
    BrokerStorageType? storageType,
    List<String>? subnetIds,
    Map<String, String>? tags,
    List<User>? users,
  }) async {
    final $payload = <String, dynamic>{
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
      if (autoMinorVersionUpgrade != null)
        'autoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (brokerName != null) 'brokerName': brokerName,
      if (configuration != null) 'configuration': configuration,
      'creatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
      if (deploymentMode != null) 'deploymentMode': deploymentMode.toValue(),
      if (encryptionOptions != null) 'encryptionOptions': encryptionOptions,
      if (engineType != null) 'engineType': engineType.toValue(),
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (hostInstanceType != null) 'hostInstanceType': hostInstanceType,
      if (ldapServerMetadata != null) 'ldapServerMetadata': ldapServerMetadata,
      if (logs != null) 'logs': logs,
      if (maintenanceWindowStartTime != null)
        'maintenanceWindowStartTime': maintenanceWindowStartTime,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (storageType != null) 'storageType': storageType.toValue(),
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
      if (users != null) 'users': users,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/brokers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBrokerResponse.fromJson(response);
  }

  /// Creates a new configuration for the specified configuration name. Amazon
  /// MQ uses the default configuration (the engine type and version).
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [authenticationStrategy] :
  /// The authentication strategy associated with the configuration.
  ///
  /// Parameter [engineType] :
  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// ACTIVEMQ and RABBITMQ.
  ///
  /// Parameter [engineVersion] :
  /// Required. The version of the broker engine. For a list of supported engine
  /// versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  ///
  /// Parameter [name] :
  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 1-150 characters long.
  ///
  /// Parameter [tags] :
  /// Create tags when creating the configuration.
  Future<CreateConfigurationResponse> createConfiguration({
    AuthenticationStrategy? authenticationStrategy,
    EngineType? engineType,
    String? engineVersion,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
      if (engineType != null) 'engineType': engineType.toValue(),
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfigurationResponse.fromJson(response);
  }

  /// Add a tag to a resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource tag.
  ///
  /// Parameter [tags] :
  /// The key-value pair for the resource tag.
  Future<void> createTags({
    required String resourceArn,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an ActiveMQ user.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The unique ID that Amazon MQ generates for the broker.
  ///
  /// Parameter [username] :
  /// The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  ///
  /// Parameter [consoleAccess] :
  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  ///
  /// Parameter [groups] :
  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters
  /// long.
  ///
  /// Parameter [password] :
  /// Required. The password of the user. This value must be at least 12
  /// characters long, must contain at least 4 unique characters, and must not
  /// contain commas.
  Future<void> createUser({
    required String brokerId,
    required String username,
    bool? consoleAccess,
    List<String>? groups,
    String? password,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    ArgumentError.checkNotNull(username, 'username');
    final $payload = <String, dynamic>{
      if (consoleAccess != null) 'consoleAccess': consoleAccess,
      if (groups != null) 'groups': groups,
      if (password != null) 'password': password,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/brokers/${Uri.encodeComponent(brokerId)}/users/${Uri.encodeComponent(username)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a broker. Note: This API is asynchronous.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The unique ID that Amazon MQ generates for the broker.
  Future<DeleteBrokerResponse> deleteBroker({
    required String brokerId,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/brokers/${Uri.encodeComponent(brokerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBrokerResponse.fromJson(response);
  }

  /// Removes a tag from a resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource tag.
  ///
  /// Parameter [tagKeys] :
  /// An array of tag keys to delete
  Future<void> deleteTags({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an ActiveMQ user.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The unique ID that Amazon MQ generates for the broker.
  ///
  /// Parameter [username] :
  /// The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  Future<void> deleteUser({
    required String brokerId,
    required String username,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    ArgumentError.checkNotNull(username, 'username');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/brokers/${Uri.encodeComponent(brokerId)}/users/${Uri.encodeComponent(username)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about the specified broker.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The name of the broker. This value must be unique in your AWS account,
  /// 1-50 characters long, must contain only letters, numbers, dashes, and
  /// underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  Future<DescribeBrokerResponse> describeBroker({
    required String brokerId,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/brokers/${Uri.encodeComponent(brokerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBrokerResponse.fromJson(response);
  }

  /// Describe available engine types and versions.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [engineType] :
  /// Filter response by engine type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of engine types that Amazon MQ can return per page (20
  /// by default). This value must be an integer from 5 to 100.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  Future<DescribeBrokerEngineTypesResponse> describeBrokerEngineTypes({
    String? engineType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (engineType != null) 'engineType': [engineType],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/broker-engine-types',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBrokerEngineTypesResponse.fromJson(response);
  }

  /// Describe available broker instance options.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [engineType] :
  /// Filter response by engine type.
  ///
  /// Parameter [hostInstanceType] :
  /// Filter response by host instance type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of instance options that Amazon MQ can return per page
  /// (20 by default). This value must be an integer from 5 to 100.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  ///
  /// Parameter [storageType] :
  /// Filter response by storage type.
  Future<DescribeBrokerInstanceOptionsResponse> describeBrokerInstanceOptions({
    String? engineType,
    String? hostInstanceType,
    int? maxResults,
    String? nextToken,
    String? storageType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (engineType != null) 'engineType': [engineType],
      if (hostInstanceType != null) 'hostInstanceType': [hostInstanceType],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (storageType != null) 'storageType': [storageType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/broker-instance-options',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBrokerInstanceOptionsResponse.fromJson(response);
  }

  /// Returns information about the specified configuration.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [configurationId] :
  /// The unique ID that Amazon MQ generates for the configuration.
  Future<DescribeConfigurationResponse> describeConfiguration({
    required String configurationId,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/configurations/${Uri.encodeComponent(configurationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConfigurationResponse.fromJson(response);
  }

  /// Returns the specified configuration revision for the specified
  /// configuration.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [configurationId] :
  /// The unique ID that Amazon MQ generates for the configuration.
  ///
  /// Parameter [configurationRevision] :
  /// The revision of the configuration.
  Future<DescribeConfigurationRevisionResponse> describeConfigurationRevision({
    required String configurationId,
    required String configurationRevision,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    ArgumentError.checkNotNull(configurationRevision, 'configurationRevision');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/${Uri.encodeComponent(configurationId)}/revisions/${Uri.encodeComponent(configurationRevision)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConfigurationRevisionResponse.fromJson(response);
  }

  /// Returns information about an ActiveMQ user.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The unique ID that Amazon MQ generates for the broker.
  ///
  /// Parameter [username] :
  /// The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  Future<DescribeUserResponse> describeUser({
    required String brokerId,
    required String username,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    ArgumentError.checkNotNull(username, 'username');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/brokers/${Uri.encodeComponent(brokerId)}/users/${Uri.encodeComponent(username)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserResponse.fromJson(response);
  }

  /// Returns a list of all brokers.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of brokers that Amazon MQ can return per page (20 by
  /// default). This value must be an integer from 5 to 100.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  Future<ListBrokersResponse> listBrokers({
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/brokers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBrokersResponse.fromJson(response);
  }

  /// Returns a list of all revisions for the specified configuration.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [configurationId] :
  /// The unique ID that Amazon MQ generates for the configuration.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of configurations that Amazon MQ can return per page
  /// (20 by default). This value must be an integer from 5 to 100.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  Future<ListConfigurationRevisionsResponse> listConfigurationRevisions({
    required String configurationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/${Uri.encodeComponent(configurationId)}/revisions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationRevisionsResponse.fromJson(response);
  }

  /// Returns a list of all configurations.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of configurations that Amazon MQ can return per page
  /// (20 by default). This value must be an integer from 5 to 100.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  Future<ListConfigurationsResponse> listConfigurations({
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationsResponse.fromJson(response);
  }

  /// Lists tags for a resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource tag.
  Future<ListTagsResponse> listTags({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsResponse.fromJson(response);
  }

  /// Returns a list of all ActiveMQ users.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The unique ID that Amazon MQ generates for the broker.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of ActiveMQ users that can be returned per page (20 by
  /// default). This value must be an integer from 5 to 100.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  Future<ListUsersResponse> listUsers({
    required String brokerId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/brokers/${Uri.encodeComponent(brokerId)}/users',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUsersResponse.fromJson(response);
  }

  /// Reboots a broker. Note: This API is asynchronous.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The unique ID that Amazon MQ generates for the broker.
  Future<void> rebootBroker({
    required String brokerId,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/brokers/${Uri.encodeComponent(brokerId)}/reboot',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds a pending configuration change to a broker.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The unique ID that Amazon MQ generates for the broker.
  ///
  /// Parameter [authenticationStrategy] :
  /// The authentication strategy used to secure the broker.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// Enables automatic upgrades to new minor versions for brokers, as Apache
  /// releases the versions. The automatic upgrades occur during the maintenance
  /// window of the broker or after a manual broker reboot.
  ///
  /// Parameter [configuration] :
  /// A list of information about the configuration.
  ///
  /// Parameter [engineVersion] :
  /// The version of the broker engine. For a list of supported engine versions,
  /// see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  ///
  /// Parameter [hostInstanceType] :
  /// The host instance type of the broker to upgrade to. For a list of
  /// supported instance types, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide//broker.html#broker-instance-types
  ///
  /// Parameter [ldapServerMetadata] :
  /// The metadata of the LDAP server used to authenticate and authorize
  /// connections to the broker.
  ///
  /// Parameter [logs] :
  /// Enables Amazon CloudWatch logging for brokers.
  ///
  /// Parameter [securityGroups] :
  /// The list of security groups (1 minimum, 5 maximum) that authorizes
  /// connections to brokers.
  Future<UpdateBrokerResponse> updateBroker({
    required String brokerId,
    AuthenticationStrategy? authenticationStrategy,
    bool? autoMinorVersionUpgrade,
    ConfigurationId? configuration,
    String? engineVersion,
    String? hostInstanceType,
    LdapServerMetadataInput? ldapServerMetadata,
    Logs? logs,
    List<String>? securityGroups,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    final $payload = <String, dynamic>{
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
      if (autoMinorVersionUpgrade != null)
        'autoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (configuration != null) 'configuration': configuration,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (hostInstanceType != null) 'hostInstanceType': hostInstanceType,
      if (ldapServerMetadata != null) 'ldapServerMetadata': ldapServerMetadata,
      if (logs != null) 'logs': logs,
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/brokers/${Uri.encodeComponent(brokerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBrokerResponse.fromJson(response);
  }

  /// Updates the specified configuration.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [configurationId] :
  /// The unique ID that Amazon MQ generates for the configuration.
  ///
  /// Parameter [data] :
  /// Required. The base64-encoded XML configuration.
  ///
  /// Parameter [description] :
  /// The description of the configuration.
  Future<UpdateConfigurationResponse> updateConfiguration({
    required String configurationId,
    String? data,
    String? description,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    final $payload = <String, dynamic>{
      if (data != null) 'data': data,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/configurations/${Uri.encodeComponent(configurationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfigurationResponse.fromJson(response);
  }

  /// Updates the information for an ActiveMQ user.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The unique ID that Amazon MQ generates for the broker.
  ///
  /// Parameter [username] :
  /// Required. The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  ///
  /// Parameter [consoleAccess] :
  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  ///
  /// Parameter [groups] :
  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters
  /// long.
  ///
  /// Parameter [password] :
  /// The password of the user. This value must be at least 12 characters long,
  /// must contain at least 4 unique characters, and must not contain commas.
  Future<void> updateUser({
    required String brokerId,
    required String username,
    bool? consoleAccess,
    List<String>? groups,
    String? password,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    ArgumentError.checkNotNull(username, 'username');
    final $payload = <String, dynamic>{
      if (consoleAccess != null) 'consoleAccess': consoleAccess,
      if (groups != null) 'groups': groups,
      if (password != null) 'password': password,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/brokers/${Uri.encodeComponent(brokerId)}/users/${Uri.encodeComponent(username)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// The authentication strategy used to secure the broker.
enum AuthenticationStrategy {
  simple,
  ldap,
}

extension AuthenticationStrategyValueExtension on AuthenticationStrategy {
  String toValue() {
    switch (this) {
      case AuthenticationStrategy.simple:
        return 'SIMPLE';
      case AuthenticationStrategy.ldap:
        return 'LDAP';
    }
  }
}

extension AuthenticationStrategyFromString on String {
  AuthenticationStrategy toAuthenticationStrategy() {
    switch (this) {
      case 'SIMPLE':
        return AuthenticationStrategy.simple;
      case 'LDAP':
        return AuthenticationStrategy.ldap;
    }
    throw Exception('$this is not known in enum AuthenticationStrategy');
  }
}

/// Name of the availability zone.
class AvailabilityZone {
  /// Id for the availability zone.
  final String? name;

  AvailabilityZone({
    this.name,
  });
  factory AvailabilityZone.fromJson(Map<String, dynamic> json) {
    return AvailabilityZone(
      name: json['name'] as String?,
    );
  }
}

/// Types of broker engines.
class BrokerEngineType {
  /// The type of broker engine.
  final EngineType? engineType;

  /// The list of engine versions.
  final List<EngineVersion>? engineVersions;

  BrokerEngineType({
    this.engineType,
    this.engineVersions,
  });
  factory BrokerEngineType.fromJson(Map<String, dynamic> json) {
    return BrokerEngineType(
      engineType: (json['engineType'] as String?)?.toEngineType(),
      engineVersions: (json['engineVersions'] as List?)
          ?.whereNotNull()
          .map((e) => EngineVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Returns information about all brokers.
class BrokerInstance {
  /// The URL of the broker's Web Console.
  final String? consoleURL;

  /// The broker's wire-level protocol endpoints.
  final List<String>? endpoints;

  /// The IP address of the Elastic Network Interface (ENI) attached to the
  /// broker. Does not apply to RabbitMQ brokers
  final String? ipAddress;

  BrokerInstance({
    this.consoleURL,
    this.endpoints,
    this.ipAddress,
  });
  factory BrokerInstance.fromJson(Map<String, dynamic> json) {
    return BrokerInstance(
      consoleURL: json['consoleURL'] as String?,
      endpoints: (json['endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ipAddress: json['ipAddress'] as String?,
    );
  }
}

/// Option for host instance type.
class BrokerInstanceOption {
  /// The list of available az.
  final List<AvailabilityZone>? availabilityZones;

  /// The type of broker engine.
  final EngineType? engineType;

  /// The type of broker instance.
  final String? hostInstanceType;

  /// The broker's storage type.
  final BrokerStorageType? storageType;

  /// The list of supported deployment modes.
  final List<DeploymentMode>? supportedDeploymentModes;

  /// The list of supported engine versions.
  final List<String>? supportedEngineVersions;

  BrokerInstanceOption({
    this.availabilityZones,
    this.engineType,
    this.hostInstanceType,
    this.storageType,
    this.supportedDeploymentModes,
    this.supportedEngineVersions,
  });
  factory BrokerInstanceOption.fromJson(Map<String, dynamic> json) {
    return BrokerInstanceOption(
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => AvailabilityZone.fromJson(e as Map<String, dynamic>))
          .toList(),
      engineType: (json['engineType'] as String?)?.toEngineType(),
      hostInstanceType: json['hostInstanceType'] as String?,
      storageType: (json['storageType'] as String?)?.toBrokerStorageType(),
      supportedDeploymentModes: (json['supportedDeploymentModes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toDeploymentMode())
          .toList(),
      supportedEngineVersions: (json['supportedEngineVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// The status of the broker.
enum BrokerState {
  creationInProgress,
  creationFailed,
  deletionInProgress,
  running,
  rebootInProgress,
}

extension BrokerStateValueExtension on BrokerState {
  String toValue() {
    switch (this) {
      case BrokerState.creationInProgress:
        return 'CREATION_IN_PROGRESS';
      case BrokerState.creationFailed:
        return 'CREATION_FAILED';
      case BrokerState.deletionInProgress:
        return 'DELETION_IN_PROGRESS';
      case BrokerState.running:
        return 'RUNNING';
      case BrokerState.rebootInProgress:
        return 'REBOOT_IN_PROGRESS';
    }
  }
}

extension BrokerStateFromString on String {
  BrokerState toBrokerState() {
    switch (this) {
      case 'CREATION_IN_PROGRESS':
        return BrokerState.creationInProgress;
      case 'CREATION_FAILED':
        return BrokerState.creationFailed;
      case 'DELETION_IN_PROGRESS':
        return BrokerState.deletionInProgress;
      case 'RUNNING':
        return BrokerState.running;
      case 'REBOOT_IN_PROGRESS':
        return BrokerState.rebootInProgress;
    }
    throw Exception('$this is not known in enum BrokerState');
  }
}

/// The broker's storage type. <important>EFS is currently not Supported for
/// RabbitMQ engine type.</important>
enum BrokerStorageType {
  ebs,
  efs,
}

extension BrokerStorageTypeValueExtension on BrokerStorageType {
  String toValue() {
    switch (this) {
      case BrokerStorageType.ebs:
        return 'EBS';
      case BrokerStorageType.efs:
        return 'EFS';
    }
  }
}

extension BrokerStorageTypeFromString on String {
  BrokerStorageType toBrokerStorageType() {
    switch (this) {
      case 'EBS':
        return BrokerStorageType.ebs;
      case 'EFS':
        return BrokerStorageType.efs;
    }
    throw Exception('$this is not known in enum BrokerStorageType');
  }
}

/// The Amazon Resource Name (ARN) of the broker.
class BrokerSummary {
  /// The Amazon Resource Name (ARN) of the broker.
  final String? brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  /// The name of the broker. This value must be unique in your AWS account, 1-50
  /// characters long, must contain only letters, numbers, dashes, and
  /// underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  final String? brokerName;

  /// The status of the broker.
  final BrokerState? brokerState;

  /// The time when the broker was created.
  final DateTime? created;

  /// Required. The deployment mode of the broker.
  final DeploymentMode? deploymentMode;

  /// Required. The type of broker engine.
  final EngineType? engineType;

  /// The broker's instance type.
  final String? hostInstanceType;

  BrokerSummary({
    this.brokerArn,
    this.brokerId,
    this.brokerName,
    this.brokerState,
    this.created,
    this.deploymentMode,
    this.engineType,
    this.hostInstanceType,
  });
  factory BrokerSummary.fromJson(Map<String, dynamic> json) {
    return BrokerSummary(
      brokerArn: json['brokerArn'] as String?,
      brokerId: json['brokerId'] as String?,
      brokerName: json['brokerName'] as String?,
      brokerState: (json['brokerState'] as String?)?.toBrokerState(),
      created: timeStampFromJson(json['created']),
      deploymentMode: (json['deploymentMode'] as String?)?.toDeploymentMode(),
      engineType: (json['engineType'] as String?)?.toEngineType(),
      hostInstanceType: json['hostInstanceType'] as String?,
    );
  }
}

/// The type of change pending for the ActiveMQ user.
enum ChangeType {
  create,
  update,
  delete,
}

extension ChangeTypeValueExtension on ChangeType {
  String toValue() {
    switch (this) {
      case ChangeType.create:
        return 'CREATE';
      case ChangeType.update:
        return 'UPDATE';
      case ChangeType.delete:
        return 'DELETE';
    }
  }
}

extension ChangeTypeFromString on String {
  ChangeType toChangeType() {
    switch (this) {
      case 'CREATE':
        return ChangeType.create;
      case 'UPDATE':
        return ChangeType.update;
      case 'DELETE':
        return ChangeType.delete;
    }
    throw Exception('$this is not known in enum ChangeType');
  }
}

/// Returns information about all configurations.
class Configuration {
  /// Required. The ARN of the configuration.
  final String? arn;

  /// The authentication strategy associated with the configuration.
  final AuthenticationStrategy? authenticationStrategy;

  /// Required. The date and time of the configuration revision.
  final DateTime? created;

  /// Required. The description of the configuration.
  final String? description;

  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// ACTIVEMQ and RABBITMQ.
  final EngineType? engineType;

  /// Required. The version of the broker engine. For a list of supported engine
  /// versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String? engineVersion;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String? id;

  /// Required. The latest revision of the configuration.
  final ConfigurationRevision? latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 1-150 characters long.
  final String? name;

  /// The list of all tags associated with this configuration.
  final Map<String, String>? tags;

  Configuration({
    this.arn,
    this.authenticationStrategy,
    this.created,
    this.description,
    this.engineType,
    this.engineVersion,
    this.id,
    this.latestRevision,
    this.name,
    this.tags,
  });
  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      arn: json['arn'] as String?,
      authenticationStrategy: (json['authenticationStrategy'] as String?)
          ?.toAuthenticationStrategy(),
      created: timeStampFromJson(json['created']),
      description: json['description'] as String?,
      engineType: (json['engineType'] as String?)?.toEngineType(),
      engineVersion: json['engineVersion'] as String?,
      id: json['id'] as String?,
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// A list of information about the configuration. <important>Does not apply to
/// RabbitMQ brokers.</important>
class ConfigurationId {
  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String? id;

  /// The revision number of the configuration.
  final int? revision;

  ConfigurationId({
    this.id,
    this.revision,
  });
  factory ConfigurationId.fromJson(Map<String, dynamic> json) {
    return ConfigurationId(
      id: json['id'] as String?,
      revision: json['revision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final revision = this.revision;
    return {
      if (id != null) 'id': id,
      if (revision != null) 'revision': revision,
    };
  }
}

/// Returns information about the specified configuration revision.
class ConfigurationRevision {
  /// Required. The date and time of the configuration revision.
  final DateTime? created;

  /// The description of the configuration revision.
  final String? description;

  /// Required. The revision number of the configuration.
  final int? revision;

  ConfigurationRevision({
    this.created,
    this.description,
    this.revision,
  });
  factory ConfigurationRevision.fromJson(Map<String, dynamic> json) {
    return ConfigurationRevision(
      created: timeStampFromJson(json['created']),
      description: json['description'] as String?,
      revision: json['revision'] as int?,
    );
  }
}

/// Broker configuration information
class Configurations {
  /// The current configuration of the broker.
  final ConfigurationId? current;

  /// The history of configurations applied to the broker.
  final List<ConfigurationId>? history;

  /// The pending configuration of the broker.
  final ConfigurationId? pending;

  Configurations({
    this.current,
    this.history,
    this.pending,
  });
  factory Configurations.fromJson(Map<String, dynamic> json) {
    return Configurations(
      current: json['current'] != null
          ? ConfigurationId.fromJson(json['current'] as Map<String, dynamic>)
          : null,
      history: (json['history'] as List?)
          ?.whereNotNull()
          .map((e) => ConfigurationId.fromJson(e as Map<String, dynamic>))
          .toList(),
      pending: json['pending'] != null
          ? ConfigurationId.fromJson(json['pending'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateBrokerResponse {
  /// The Amazon Resource Name (ARN) of the broker.
  final String? brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  CreateBrokerResponse({
    this.brokerArn,
    this.brokerId,
  });
  factory CreateBrokerResponse.fromJson(Map<String, dynamic> json) {
    return CreateBrokerResponse(
      brokerArn: json['brokerArn'] as String?,
      brokerId: json['brokerId'] as String?,
    );
  }
}

class CreateConfigurationResponse {
  /// Required. The Amazon Resource Name (ARN) of the configuration.
  final String? arn;

  /// The authentication strategy associated with the configuration.
  final AuthenticationStrategy? authenticationStrategy;

  /// Required. The date and time of the configuration.
  final DateTime? created;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String? id;

  /// The latest revision of the configuration.
  final ConfigurationRevision? latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 1-150 characters long.
  final String? name;

  CreateConfigurationResponse({
    this.arn,
    this.authenticationStrategy,
    this.created,
    this.id,
    this.latestRevision,
    this.name,
  });
  factory CreateConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return CreateConfigurationResponse(
      arn: json['arn'] as String?,
      authenticationStrategy: (json['authenticationStrategy'] as String?)
          ?.toAuthenticationStrategy(),
      created: timeStampFromJson(json['created']),
      id: json['id'] as String?,
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }
}

class CreateUserResponse {
  CreateUserResponse();
  factory CreateUserResponse.fromJson(Map<String, dynamic> _) {
    return CreateUserResponse();
  }
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension DayOfWeekValueExtension on DayOfWeek {
  String toValue() {
    switch (this) {
      case DayOfWeek.monday:
        return 'MONDAY';
      case DayOfWeek.tuesday:
        return 'TUESDAY';
      case DayOfWeek.wednesday:
        return 'WEDNESDAY';
      case DayOfWeek.thursday:
        return 'THURSDAY';
      case DayOfWeek.friday:
        return 'FRIDAY';
      case DayOfWeek.saturday:
        return 'SATURDAY';
      case DayOfWeek.sunday:
        return 'SUNDAY';
    }
  }
}

extension DayOfWeekFromString on String {
  DayOfWeek toDayOfWeek() {
    switch (this) {
      case 'MONDAY':
        return DayOfWeek.monday;
      case 'TUESDAY':
        return DayOfWeek.tuesday;
      case 'WEDNESDAY':
        return DayOfWeek.wednesday;
      case 'THURSDAY':
        return DayOfWeek.thursday;
      case 'FRIDAY':
        return DayOfWeek.friday;
      case 'SATURDAY':
        return DayOfWeek.saturday;
      case 'SUNDAY':
        return DayOfWeek.sunday;
    }
    throw Exception('$this is not known in enum DayOfWeek');
  }
}

class DeleteBrokerResponse {
  /// The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  DeleteBrokerResponse({
    this.brokerId,
  });
  factory DeleteBrokerResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBrokerResponse(
      brokerId: json['brokerId'] as String?,
    );
  }
}

class DeleteUserResponse {
  DeleteUserResponse();
  factory DeleteUserResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserResponse();
  }
}

/// The deployment mode of the broker.
enum DeploymentMode {
  singleInstance,
  activeStandbyMultiAz,
  clusterMultiAz,
}

extension DeploymentModeValueExtension on DeploymentMode {
  String toValue() {
    switch (this) {
      case DeploymentMode.singleInstance:
        return 'SINGLE_INSTANCE';
      case DeploymentMode.activeStandbyMultiAz:
        return 'ACTIVE_STANDBY_MULTI_AZ';
      case DeploymentMode.clusterMultiAz:
        return 'CLUSTER_MULTI_AZ';
    }
  }
}

extension DeploymentModeFromString on String {
  DeploymentMode toDeploymentMode() {
    switch (this) {
      case 'SINGLE_INSTANCE':
        return DeploymentMode.singleInstance;
      case 'ACTIVE_STANDBY_MULTI_AZ':
        return DeploymentMode.activeStandbyMultiAz;
      case 'CLUSTER_MULTI_AZ':
        return DeploymentMode.clusterMultiAz;
    }
    throw Exception('$this is not known in enum DeploymentMode');
  }
}

class DescribeBrokerEngineTypesResponse {
  /// List of available engine types and versions.
  final List<BrokerEngineType>? brokerEngineTypes;

  /// Required. The maximum number of engine types that can be returned per page
  /// (20 by default). This value must be an integer from 5 to 100.
  final int? maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String? nextToken;

  DescribeBrokerEngineTypesResponse({
    this.brokerEngineTypes,
    this.maxResults,
    this.nextToken,
  });
  factory DescribeBrokerEngineTypesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBrokerEngineTypesResponse(
      brokerEngineTypes: (json['brokerEngineTypes'] as List?)
          ?.whereNotNull()
          .map((e) => BrokerEngineType.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxResults: json['maxResults'] as int?,
      nextToken: json['nextToken'] as String?,
    );
  }
}

class DescribeBrokerInstanceOptionsResponse {
  /// List of available broker instance options.
  final List<BrokerInstanceOption>? brokerInstanceOptions;

  /// Required. The maximum number of instance options that can be returned per
  /// page (20 by default). This value must be an integer from 5 to 100.
  final int? maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String? nextToken;

  DescribeBrokerInstanceOptionsResponse({
    this.brokerInstanceOptions,
    this.maxResults,
    this.nextToken,
  });
  factory DescribeBrokerInstanceOptionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBrokerInstanceOptionsResponse(
      brokerInstanceOptions: (json['brokerInstanceOptions'] as List?)
          ?.whereNotNull()
          .map((e) => BrokerInstanceOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxResults: json['maxResults'] as int?,
      nextToken: json['nextToken'] as String?,
    );
  }
}

class DescribeBrokerResponse {
  /// The authentication strategy used to secure the broker.
  final AuthenticationStrategy? authenticationStrategy;

  /// Required. Enables automatic upgrades to new minor versions for brokers, as
  /// Apache releases the versions. The automatic upgrades occur during the
  /// maintenance window of the broker or after a manual broker reboot.
  final bool? autoMinorVersionUpgrade;

  /// The Amazon Resource Name (ARN) of the broker.
  final String? brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  /// A list of information about allocated brokers.
  final List<BrokerInstance>? brokerInstances;

  /// The name of the broker. This value must be unique in your AWS account, 1-50
  /// characters long, must contain only letters, numbers, dashes, and
  /// underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  final String? brokerName;

  /// The status of the broker.
  final BrokerState? brokerState;

  /// The list of all revisions for the specified configuration.
  final Configurations? configurations;

  /// The time when the broker was created.
  final DateTime? created;

  /// Required. The deployment mode of the broker.
  final DeploymentMode? deploymentMode;

  /// Encryption options for the broker.
  final EncryptionOptions? encryptionOptions;

  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// ACTIVEMQ and RABBITMQ.
  final EngineType? engineType;

  /// The version of the broker engine. For a list of supported engine versions,
  /// see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String? engineVersion;

  /// The broker's instance type.
  final String? hostInstanceType;

  /// The metadata of the LDAP server used to authenticate and authorize
  /// connections to the broker.
  final LdapServerMetadataOutput? ldapServerMetadata;

  /// The list of information about logs currently enabled and pending to be
  /// deployed for the specified broker.
  final LogsSummary? logs;

  /// The parameters that determine the WeeklyStartTime.
  final WeeklyStartTime? maintenanceWindowStartTime;

  /// The authentication strategy that will be applied when the broker is
  /// rebooted.
  final AuthenticationStrategy? pendingAuthenticationStrategy;

  /// The version of the broker engine to upgrade to. For a list of supported
  /// engine versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String? pendingEngineVersion;

  /// The host instance type of the broker to upgrade to. For a list of supported
  /// instance types, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide//broker.html#broker-instance-types
  final String? pendingHostInstanceType;

  /// The metadata of the LDAP server that will be used to authenticate and
  /// authorize connections to the broker once it is rebooted.
  final LdapServerMetadataOutput? pendingLdapServerMetadata;

  /// The list of pending security groups to authorize connections to brokers.
  final List<String>? pendingSecurityGroups;

  /// Required. Enables connections from applications outside of the VPC that
  /// hosts the broker's subnets.
  final bool? publiclyAccessible;

  /// The list of security groups (1 minimum, 5 maximum) that authorizes
  /// connections to brokers.
  final List<String>? securityGroups;

  /// The broker's storage type.
  final BrokerStorageType? storageType;

  /// The list of groups that define which subnets and IP ranges the broker can
  /// use from different Availability Zones. A SINGLE_INSTANCE deployment requires
  /// one subnet (for example, the default subnet). An ACTIVE_STANDBY_MULTI_AZ
  /// deployment (ACTIVEMQ) requires two subnets. A CLUSTER_MULTI_AZ deployment
  /// (RABBITMQ) has no subnet requirements when deployed with public
  /// accessibility, deployment without public accessibility requires at least one
  /// subnet.
  final List<String>? subnetIds;

  /// The list of all tags associated with this broker.
  final Map<String, String>? tags;

  /// The list of all broker usernames for the specified broker.
  final List<UserSummary>? users;

  DescribeBrokerResponse({
    this.authenticationStrategy,
    this.autoMinorVersionUpgrade,
    this.brokerArn,
    this.brokerId,
    this.brokerInstances,
    this.brokerName,
    this.brokerState,
    this.configurations,
    this.created,
    this.deploymentMode,
    this.encryptionOptions,
    this.engineType,
    this.engineVersion,
    this.hostInstanceType,
    this.ldapServerMetadata,
    this.logs,
    this.maintenanceWindowStartTime,
    this.pendingAuthenticationStrategy,
    this.pendingEngineVersion,
    this.pendingHostInstanceType,
    this.pendingLdapServerMetadata,
    this.pendingSecurityGroups,
    this.publiclyAccessible,
    this.securityGroups,
    this.storageType,
    this.subnetIds,
    this.tags,
    this.users,
  });
  factory DescribeBrokerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBrokerResponse(
      authenticationStrategy: (json['authenticationStrategy'] as String?)
          ?.toAuthenticationStrategy(),
      autoMinorVersionUpgrade: json['autoMinorVersionUpgrade'] as bool?,
      brokerArn: json['brokerArn'] as String?,
      brokerId: json['brokerId'] as String?,
      brokerInstances: (json['brokerInstances'] as List?)
          ?.whereNotNull()
          .map((e) => BrokerInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      brokerName: json['brokerName'] as String?,
      brokerState: (json['brokerState'] as String?)?.toBrokerState(),
      configurations: json['configurations'] != null
          ? Configurations.fromJson(
              json['configurations'] as Map<String, dynamic>)
          : null,
      created: timeStampFromJson(json['created']),
      deploymentMode: (json['deploymentMode'] as String?)?.toDeploymentMode(),
      encryptionOptions: json['encryptionOptions'] != null
          ? EncryptionOptions.fromJson(
              json['encryptionOptions'] as Map<String, dynamic>)
          : null,
      engineType: (json['engineType'] as String?)?.toEngineType(),
      engineVersion: json['engineVersion'] as String?,
      hostInstanceType: json['hostInstanceType'] as String?,
      ldapServerMetadata: json['ldapServerMetadata'] != null
          ? LdapServerMetadataOutput.fromJson(
              json['ldapServerMetadata'] as Map<String, dynamic>)
          : null,
      logs: json['logs'] != null
          ? LogsSummary.fromJson(json['logs'] as Map<String, dynamic>)
          : null,
      maintenanceWindowStartTime: json['maintenanceWindowStartTime'] != null
          ? WeeklyStartTime.fromJson(
              json['maintenanceWindowStartTime'] as Map<String, dynamic>)
          : null,
      pendingAuthenticationStrategy:
          (json['pendingAuthenticationStrategy'] as String?)
              ?.toAuthenticationStrategy(),
      pendingEngineVersion: json['pendingEngineVersion'] as String?,
      pendingHostInstanceType: json['pendingHostInstanceType'] as String?,
      pendingLdapServerMetadata: json['pendingLdapServerMetadata'] != null
          ? LdapServerMetadataOutput.fromJson(
              json['pendingLdapServerMetadata'] as Map<String, dynamic>)
          : null,
      pendingSecurityGroups: (json['pendingSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      storageType: (json['storageType'] as String?)?.toBrokerStorageType(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      users: (json['users'] as List?)
          ?.whereNotNull()
          .map((e) => UserSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeConfigurationResponse {
  /// Required. The ARN of the configuration.
  final String? arn;

  /// The authentication strategy associated with the configuration.
  final AuthenticationStrategy? authenticationStrategy;

  /// Required. The date and time of the configuration revision.
  final DateTime? created;

  /// Required. The description of the configuration.
  final String? description;

  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// ACTIVEMQ and RABBITMQ.
  final EngineType? engineType;

  /// Required. The version of the broker engine. For a list of supported engine
  /// versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String? engineVersion;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String? id;

  /// Required. The latest revision of the configuration.
  final ConfigurationRevision? latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 1-150 characters long.
  final String? name;

  /// The list of all tags associated with this configuration.
  final Map<String, String>? tags;

  DescribeConfigurationResponse({
    this.arn,
    this.authenticationStrategy,
    this.created,
    this.description,
    this.engineType,
    this.engineVersion,
    this.id,
    this.latestRevision,
    this.name,
    this.tags,
  });
  factory DescribeConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConfigurationResponse(
      arn: json['arn'] as String?,
      authenticationStrategy: (json['authenticationStrategy'] as String?)
          ?.toAuthenticationStrategy(),
      created: timeStampFromJson(json['created']),
      description: json['description'] as String?,
      engineType: (json['engineType'] as String?)?.toEngineType(),
      engineVersion: json['engineVersion'] as String?,
      id: json['id'] as String?,
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class DescribeConfigurationRevisionResponse {
  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String? configurationId;

  /// Required. The date and time of the configuration.
  final DateTime? created;

  /// Required. The base64-encoded XML configuration.
  final String? data;

  /// The description of the configuration.
  final String? description;

  DescribeConfigurationRevisionResponse({
    this.configurationId,
    this.created,
    this.data,
    this.description,
  });
  factory DescribeConfigurationRevisionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConfigurationRevisionResponse(
      configurationId: json['configurationId'] as String?,
      created: timeStampFromJson(json['created']),
      data: json['data'] as String?,
      description: json['description'] as String?,
    );
  }
}

class DescribeUserResponse {
  /// Required. The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  final bool? consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
  final List<String>? groups;

  /// The status of the changes pending for the ActiveMQ user.
  final UserPendingChanges? pending;

  /// Required. The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 2-100 characters long.
  final String? username;

  DescribeUserResponse({
    this.brokerId,
    this.consoleAccess,
    this.groups,
    this.pending,
    this.username,
  });
  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUserResponse(
      brokerId: json['brokerId'] as String?,
      consoleAccess: json['consoleAccess'] as bool?,
      groups: (json['groups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      pending: json['pending'] != null
          ? UserPendingChanges.fromJson(json['pending'] as Map<String, dynamic>)
          : null,
      username: json['username'] as String?,
    );
  }
}

/// Encryption options for the broker.
class EncryptionOptions {
  /// Enables the use of an AWS owned CMK using AWS Key Management Service (KMS).
  final bool useAwsOwnedKey;

  /// The symmetric customer master key (CMK) to use for the AWS Key Management
  /// Service (KMS). This key is used to encrypt your data at rest. If not
  /// provided, Amazon MQ will use a default CMK to encrypt your data.
  final String? kmsKeyId;

  EncryptionOptions({
    required this.useAwsOwnedKey,
    this.kmsKeyId,
  });
  factory EncryptionOptions.fromJson(Map<String, dynamic> json) {
    return EncryptionOptions(
      useAwsOwnedKey: json['useAwsOwnedKey'] as bool,
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final useAwsOwnedKey = this.useAwsOwnedKey;
    final kmsKeyId = this.kmsKeyId;
    return {
      'useAwsOwnedKey': useAwsOwnedKey,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

/// The type of broker engine. Note: Currently, Amazon MQ supports ActiveMQ and
/// RabbitMQ.
enum EngineType {
  activemq,
  rabbitmq,
}

extension EngineTypeValueExtension on EngineType {
  String toValue() {
    switch (this) {
      case EngineType.activemq:
        return 'ACTIVEMQ';
      case EngineType.rabbitmq:
        return 'RABBITMQ';
    }
  }
}

extension EngineTypeFromString on String {
  EngineType toEngineType() {
    switch (this) {
      case 'ACTIVEMQ':
        return EngineType.activemq;
      case 'RABBITMQ':
        return EngineType.rabbitmq;
    }
    throw Exception('$this is not known in enum EngineType');
  }
}

/// Id of the engine version.
class EngineVersion {
  /// Id for the version.
  final String? name;

  EngineVersion({
    this.name,
  });
  factory EngineVersion.fromJson(Map<String, dynamic> json) {
    return EngineVersion(
      name: json['name'] as String?,
    );
  }
}

/// The metadata of the LDAP server used to authenticate and authorize
/// connections to the broker.
class LdapServerMetadataInput {
  /// Fully qualified domain name of the LDAP server. Optional failover server.
  final List<String>? hosts;

  /// Fully qualified name of the directory to search for a user’s groups.
  final String? roleBase;

  /// Specifies the LDAP attribute that identifies the group name attribute in the
  /// object returned from the group membership query.
  final String? roleName;

  /// The search criteria for groups.
  final String? roleSearchMatching;

  /// The directory search scope for the role. If set to true, scope is to search
  /// the entire sub-tree.
  final bool? roleSearchSubtree;

  /// Service account password.
  final String? serviceAccountPassword;

  /// Service account username.
  final String? serviceAccountUsername;

  /// Fully qualified name of the directory where you want to search for users.
  final String? userBase;

  /// Specifies the name of the LDAP attribute for the user group membership.
  final String? userRoleName;

  /// The search criteria for users.
  final String? userSearchMatching;

  /// The directory search scope for the user. If set to true, scope is to search
  /// the entire sub-tree.
  final bool? userSearchSubtree;

  LdapServerMetadataInput({
    this.hosts,
    this.roleBase,
    this.roleName,
    this.roleSearchMatching,
    this.roleSearchSubtree,
    this.serviceAccountPassword,
    this.serviceAccountUsername,
    this.userBase,
    this.userRoleName,
    this.userSearchMatching,
    this.userSearchSubtree,
  });
  Map<String, dynamic> toJson() {
    final hosts = this.hosts;
    final roleBase = this.roleBase;
    final roleName = this.roleName;
    final roleSearchMatching = this.roleSearchMatching;
    final roleSearchSubtree = this.roleSearchSubtree;
    final serviceAccountPassword = this.serviceAccountPassword;
    final serviceAccountUsername = this.serviceAccountUsername;
    final userBase = this.userBase;
    final userRoleName = this.userRoleName;
    final userSearchMatching = this.userSearchMatching;
    final userSearchSubtree = this.userSearchSubtree;
    return {
      if (hosts != null) 'hosts': hosts,
      if (roleBase != null) 'roleBase': roleBase,
      if (roleName != null) 'roleName': roleName,
      if (roleSearchMatching != null) 'roleSearchMatching': roleSearchMatching,
      if (roleSearchSubtree != null) 'roleSearchSubtree': roleSearchSubtree,
      if (serviceAccountPassword != null)
        'serviceAccountPassword': serviceAccountPassword,
      if (serviceAccountUsername != null)
        'serviceAccountUsername': serviceAccountUsername,
      if (userBase != null) 'userBase': userBase,
      if (userRoleName != null) 'userRoleName': userRoleName,
      if (userSearchMatching != null) 'userSearchMatching': userSearchMatching,
      if (userSearchSubtree != null) 'userSearchSubtree': userSearchSubtree,
    };
  }
}

/// The metadata of the LDAP server used to authenticate and authorize
/// connections to the broker.
class LdapServerMetadataOutput {
  /// Fully qualified domain name of the LDAP server. Optional failover server.
  final List<String>? hosts;

  /// Fully qualified name of the directory to search for a user’s groups.
  final String? roleBase;

  /// Specifies the LDAP attribute that identifies the group name attribute in the
  /// object returned from the group membership query.
  final String? roleName;

  /// The search criteria for groups.
  final String? roleSearchMatching;

  /// The directory search scope for the role. If set to true, scope is to search
  /// the entire sub-tree.
  final bool? roleSearchSubtree;

  /// Service account username.
  final String? serviceAccountUsername;

  /// Fully qualified name of the directory where you want to search for users.
  final String? userBase;

  /// Specifies the name of the LDAP attribute for the user group membership.
  final String? userRoleName;

  /// The search criteria for users.
  final String? userSearchMatching;

  /// The directory search scope for the user. If set to true, scope is to search
  /// the entire sub-tree.
  final bool? userSearchSubtree;

  LdapServerMetadataOutput({
    this.hosts,
    this.roleBase,
    this.roleName,
    this.roleSearchMatching,
    this.roleSearchSubtree,
    this.serviceAccountUsername,
    this.userBase,
    this.userRoleName,
    this.userSearchMatching,
    this.userSearchSubtree,
  });
  factory LdapServerMetadataOutput.fromJson(Map<String, dynamic> json) {
    return LdapServerMetadataOutput(
      hosts: (json['hosts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      roleBase: json['roleBase'] as String?,
      roleName: json['roleName'] as String?,
      roleSearchMatching: json['roleSearchMatching'] as String?,
      roleSearchSubtree: json['roleSearchSubtree'] as bool?,
      serviceAccountUsername: json['serviceAccountUsername'] as String?,
      userBase: json['userBase'] as String?,
      userRoleName: json['userRoleName'] as String?,
      userSearchMatching: json['userSearchMatching'] as String?,
      userSearchSubtree: json['userSearchSubtree'] as bool?,
    );
  }
}

class ListBrokersResponse {
  /// A list of information about all brokers.
  final List<BrokerSummary>? brokerSummaries;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String? nextToken;

  ListBrokersResponse({
    this.brokerSummaries,
    this.nextToken,
  });
  factory ListBrokersResponse.fromJson(Map<String, dynamic> json) {
    return ListBrokersResponse(
      brokerSummaries: (json['brokerSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => BrokerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListConfigurationRevisionsResponse {
  /// The unique ID that Amazon MQ generates for the configuration.
  final String? configurationId;

  /// The maximum number of configuration revisions that can be returned per page
  /// (20 by default). This value must be an integer from 5 to 100.
  final int? maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String? nextToken;

  /// The list of all revisions for the specified configuration.
  final List<ConfigurationRevision>? revisions;

  ListConfigurationRevisionsResponse({
    this.configurationId,
    this.maxResults,
    this.nextToken,
    this.revisions,
  });
  factory ListConfigurationRevisionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConfigurationRevisionsResponse(
      configurationId: json['configurationId'] as String?,
      maxResults: json['maxResults'] as int?,
      nextToken: json['nextToken'] as String?,
      revisions: (json['revisions'] as List?)
          ?.whereNotNull()
          .map((e) => ConfigurationRevision.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListConfigurationsResponse {
  /// The list of all revisions for the specified configuration.
  final List<Configuration>? configurations;

  /// The maximum number of configurations that Amazon MQ can return per page (20
  /// by default). This value must be an integer from 5 to 100.
  final int? maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String? nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.maxResults,
    this.nextToken,
  });
  factory ListConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigurationsResponse(
      configurations: (json['configurations'] as List?)
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxResults: json['maxResults'] as int?,
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListTagsResponse {
  /// The key-value pair for the resource tag.
  final Map<String, String>? tags;

  ListTagsResponse({
    this.tags,
  });
  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class ListUsersResponse {
  /// Required. The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  /// Required. The maximum number of ActiveMQ users that can be returned per page
  /// (20 by default). This value must be an integer from 5 to 100.
  final int? maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String? nextToken;

  /// Required. The list of all ActiveMQ usernames for the specified broker.
  final List<UserSummary>? users;

  ListUsersResponse({
    this.brokerId,
    this.maxResults,
    this.nextToken,
    this.users,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      brokerId: json['brokerId'] as String?,
      maxResults: json['maxResults'] as int?,
      nextToken: json['nextToken'] as String?,
      users: (json['users'] as List?)
          ?.whereNotNull()
          .map((e) => UserSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The list of information about logs to be enabled for the specified broker.
class Logs {
  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged. Does not apply to RabbitMQ brokers.
  final bool? audit;

  /// Enables general logging.
  final bool? general;

  Logs({
    this.audit,
    this.general,
  });
  factory Logs.fromJson(Map<String, dynamic> json) {
    return Logs(
      audit: json['audit'] as bool?,
      general: json['general'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final audit = this.audit;
    final general = this.general;
    return {
      if (audit != null) 'audit': audit,
      if (general != null) 'general': general,
    };
  }
}

/// The list of information about logs currently enabled and pending to be
/// deployed for the specified broker.
class LogsSummary {
  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged.
  final bool? audit;

  /// The location of the CloudWatch Logs log group where audit logs are sent.
  final String? auditLogGroup;

  /// Enables general logging.
  final bool? general;

  /// The location of the CloudWatch Logs log group where general logs are sent.
  final String? generalLogGroup;

  /// The list of information about logs pending to be deployed for the specified
  /// broker.
  final PendingLogs? pending;

  LogsSummary({
    this.audit,
    this.auditLogGroup,
    this.general,
    this.generalLogGroup,
    this.pending,
  });
  factory LogsSummary.fromJson(Map<String, dynamic> json) {
    return LogsSummary(
      audit: json['audit'] as bool?,
      auditLogGroup: json['auditLogGroup'] as String?,
      general: json['general'] as bool?,
      generalLogGroup: json['generalLogGroup'] as String?,
      pending: json['pending'] != null
          ? PendingLogs.fromJson(json['pending'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The list of information about logs to be enabled for the specified broker.
class PendingLogs {
  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged.
  final bool? audit;

  /// Enables general logging.
  final bool? general;

  PendingLogs({
    this.audit,
    this.general,
  });
  factory PendingLogs.fromJson(Map<String, dynamic> json) {
    return PendingLogs(
      audit: json['audit'] as bool?,
      general: json['general'] as bool?,
    );
  }
}

class RebootBrokerResponse {
  RebootBrokerResponse();
  factory RebootBrokerResponse.fromJson(Map<String, dynamic> _) {
    return RebootBrokerResponse();
  }
}

/// Returns information about the XML element or attribute that was sanitized in
/// the configuration.
class SanitizationWarning {
  /// The name of the XML attribute that has been sanitized.
  final String? attributeName;

  /// The name of the XML element that has been sanitized.
  final String? elementName;

  /// Required. The reason for which the XML elements or attributes were
  /// sanitized.
  final SanitizationWarningReason? reason;

  SanitizationWarning({
    this.attributeName,
    this.elementName,
    this.reason,
  });
  factory SanitizationWarning.fromJson(Map<String, dynamic> json) {
    return SanitizationWarning(
      attributeName: json['attributeName'] as String?,
      elementName: json['elementName'] as String?,
      reason: (json['reason'] as String?)?.toSanitizationWarningReason(),
    );
  }
}

/// The reason for which the XML elements or attributes were sanitized.
enum SanitizationWarningReason {
  disallowedElementRemoved,
  disallowedAttributeRemoved,
  invalidAttributeValueRemoved,
}

extension SanitizationWarningReasonValueExtension on SanitizationWarningReason {
  String toValue() {
    switch (this) {
      case SanitizationWarningReason.disallowedElementRemoved:
        return 'DISALLOWED_ELEMENT_REMOVED';
      case SanitizationWarningReason.disallowedAttributeRemoved:
        return 'DISALLOWED_ATTRIBUTE_REMOVED';
      case SanitizationWarningReason.invalidAttributeValueRemoved:
        return 'INVALID_ATTRIBUTE_VALUE_REMOVED';
    }
  }
}

extension SanitizationWarningReasonFromString on String {
  SanitizationWarningReason toSanitizationWarningReason() {
    switch (this) {
      case 'DISALLOWED_ELEMENT_REMOVED':
        return SanitizationWarningReason.disallowedElementRemoved;
      case 'DISALLOWED_ATTRIBUTE_REMOVED':
        return SanitizationWarningReason.disallowedAttributeRemoved;
      case 'INVALID_ATTRIBUTE_VALUE_REMOVED':
        return SanitizationWarningReason.invalidAttributeValueRemoved;
    }
    throw Exception('$this is not known in enum SanitizationWarningReason');
  }
}

class UpdateBrokerResponse {
  /// The authentication strategy used to secure the broker.
  final AuthenticationStrategy? authenticationStrategy;

  /// The new value of automatic upgrades to new minor version for brokers.
  final bool? autoMinorVersionUpgrade;

  /// Required. The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  /// The ID of the updated configuration.
  final ConfigurationId? configuration;

  /// The version of the broker engine to upgrade to. For a list of supported
  /// engine versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String? engineVersion;

  /// The host instance type of the broker to upgrade to. For a list of supported
  /// instance types, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide//broker.html#broker-instance-types
  final String? hostInstanceType;

  /// The metadata of the LDAP server used to authenticate and authorize
  /// connections to the broker.
  final LdapServerMetadataOutput? ldapServerMetadata;

  /// The list of information about logs to be enabled for the specified broker.
  final Logs? logs;

  /// The list of security groups (1 minimum, 5 maximum) that authorizes
  /// connections to brokers.
  final List<String>? securityGroups;

  UpdateBrokerResponse({
    this.authenticationStrategy,
    this.autoMinorVersionUpgrade,
    this.brokerId,
    this.configuration,
    this.engineVersion,
    this.hostInstanceType,
    this.ldapServerMetadata,
    this.logs,
    this.securityGroups,
  });
  factory UpdateBrokerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrokerResponse(
      authenticationStrategy: (json['authenticationStrategy'] as String?)
          ?.toAuthenticationStrategy(),
      autoMinorVersionUpgrade: json['autoMinorVersionUpgrade'] as bool?,
      brokerId: json['brokerId'] as String?,
      configuration: json['configuration'] != null
          ? ConfigurationId.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      engineVersion: json['engineVersion'] as String?,
      hostInstanceType: json['hostInstanceType'] as String?,
      ldapServerMetadata: json['ldapServerMetadata'] != null
          ? LdapServerMetadataOutput.fromJson(
              json['ldapServerMetadata'] as Map<String, dynamic>)
          : null,
      logs: json['logs'] != null
          ? Logs.fromJson(json['logs'] as Map<String, dynamic>)
          : null,
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

class UpdateConfigurationResponse {
  /// Required. The Amazon Resource Name (ARN) of the configuration.
  final String? arn;

  /// Required. The date and time of the configuration.
  final DateTime? created;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String? id;

  /// The latest revision of the configuration.
  final ConfigurationRevision? latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 1-150 characters long.
  final String? name;

  /// The list of the first 20 warnings about the configuration XML elements or
  /// attributes that were sanitized.
  final List<SanitizationWarning>? warnings;

  UpdateConfigurationResponse({
    this.arn,
    this.created,
    this.id,
    this.latestRevision,
    this.name,
    this.warnings,
  });
  factory UpdateConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConfigurationResponse(
      arn: json['arn'] as String?,
      created: timeStampFromJson(json['created']),
      id: json['id'] as String?,
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      warnings: (json['warnings'] as List?)
          ?.whereNotNull()
          .map((e) => SanitizationWarning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class UpdateUserResponse {
  UpdateUserResponse();
  factory UpdateUserResponse.fromJson(Map<String, dynamic> _) {
    return UpdateUserResponse();
  }
}

/// A user associated with the broker.
class User {
  /// Enables access to the ActiveMQ Web Console for the ActiveMQ user (Does not
  /// apply to RabbitMQ brokers).
  final bool? consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
  final List<String>? groups;

  /// Required. The password of the broker user. This value must be at least 12
  /// characters long, must contain at least 4 unique characters, and must not
  /// contain commas.
  final String? password;

  /// Required. The username of the broker user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 2-100 characters long.
  final String? username;

  User({
    this.consoleAccess,
    this.groups,
    this.password,
    this.username,
  });
  Map<String, dynamic> toJson() {
    final consoleAccess = this.consoleAccess;
    final groups = this.groups;
    final password = this.password;
    final username = this.username;
    return {
      if (consoleAccess != null) 'consoleAccess': consoleAccess,
      if (groups != null) 'groups': groups,
      if (password != null) 'password': password,
      if (username != null) 'username': username,
    };
  }
}

/// Returns information about the status of the changes pending for the ActiveMQ
/// user.
class UserPendingChanges {
  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  final bool? consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
  final List<String>? groups;

  /// Required. The type of change pending for the ActiveMQ user.
  final ChangeType? pendingChange;

  UserPendingChanges({
    this.consoleAccess,
    this.groups,
    this.pendingChange,
  });
  factory UserPendingChanges.fromJson(Map<String, dynamic> json) {
    return UserPendingChanges(
      consoleAccess: json['consoleAccess'] as bool?,
      groups: (json['groups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      pendingChange: (json['pendingChange'] as String?)?.toChangeType(),
    );
  }
}

/// Returns a list of all broker users.
class UserSummary {
  /// The type of change pending for the broker user.
  final ChangeType? pendingChange;

  /// Required. The username of the broker user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 2-100 characters long.
  final String? username;

  UserSummary({
    this.pendingChange,
    this.username,
  });
  factory UserSummary.fromJson(Map<String, dynamic> json) {
    return UserSummary(
      pendingChange: (json['pendingChange'] as String?)?.toChangeType(),
      username: json['username'] as String?,
    );
  }
}

/// The scheduled time period relative to UTC during which Amazon MQ begins to
/// apply pending updates or patches to the broker.
class WeeklyStartTime {
  /// Required. The day of the week.
  final DayOfWeek? dayOfWeek;

  /// Required. The time, in 24-hour format.
  final String? timeOfDay;

  /// The time zone, UTC by default, in either the Country/City format, or the UTC
  /// offset format.
  final String? timeZone;

  WeeklyStartTime({
    this.dayOfWeek,
    this.timeOfDay,
    this.timeZone,
  });
  factory WeeklyStartTime.fromJson(Map<String, dynamic> json) {
    return WeeklyStartTime(
      dayOfWeek: (json['dayOfWeek'] as String?)?.toDayOfWeek(),
      timeOfDay: json['timeOfDay'] as String?,
      timeZone: json['timeZone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfWeek = this.dayOfWeek;
    final timeOfDay = this.timeOfDay;
    final timeZone = this.timeZone;
    return {
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek.toValue(),
      if (timeOfDay != null) 'timeOfDay': timeOfDay,
      if (timeZone != null) 'timeZone': timeZone,
    };
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

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
