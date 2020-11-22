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
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'mq-2017-11-27.g.dart';

/// Amazon MQ is a managed message broker service for Apache ActiveMQ that makes
/// it easy to set up and operate message brokers in the cloud. A message broker
/// allows software applications and components to communicate using various
/// programming languages, operating systems, and formal messaging protocols.
class MQ {
  final _s.RestJsonProtocol _protocol;
  MQ({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mq',
            signingName: 'mq',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a broker. Note: This API is asynchronous.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
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
  /// only ACTIVEMQ.
  ///
  /// Parameter [engineVersion] :
  /// Required. The version of the broker engine. For a list of supported engine
  /// versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  ///
  /// Parameter [hostInstanceType] :
  /// Required. The broker's instance type.
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
  /// The list of groups (2 maximum) that define which subnets and IP ranges the
  /// broker can use from different Availability Zones. A SINGLE_INSTANCE
  /// deployment requires one subnet (for example, the default subnet). An
  /// ACTIVE_STANDBY_MULTI_AZ deployment requires two subnets.
  ///
  /// Parameter [tags] :
  /// Create tags when creating the broker.
  ///
  /// Parameter [users] :
  /// Required. The list of ActiveMQ users (persons or applications) who can
  /// access queues and topics. This value can contain only alphanumeric
  /// characters, dashes, periods, underscores, and tildes (- . _ ~). This value
  /// must be 2-100 characters long.
  Future<CreateBrokerResponse> createBroker({
    bool autoMinorVersionUpgrade,
    String brokerName,
    ConfigurationId configuration,
    String creatorRequestId,
    DeploymentMode deploymentMode,
    EncryptionOptions encryptionOptions,
    EngineType engineType,
    String engineVersion,
    String hostInstanceType,
    Logs logs,
    WeeklyStartTime maintenanceWindowStartTime,
    bool publiclyAccessible,
    List<String> securityGroups,
    BrokerStorageType storageType,
    List<String> subnetIds,
    Map<String, String> tags,
    List<User> users,
  }) async {
    final $payload = <String, dynamic>{
      if (autoMinorVersionUpgrade != null)
        'autoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (brokerName != null) 'brokerName': brokerName,
      if (configuration != null) 'configuration': configuration,
      if (creatorRequestId != null) 'creatorRequestId': creatorRequestId,
      if (deploymentMode != null) 'deploymentMode': deploymentMode.toValue(),
      if (encryptionOptions != null) 'encryptionOptions': encryptionOptions,
      if (engineType != null) 'engineType': engineType.toValue(),
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (hostInstanceType != null) 'hostInstanceType': hostInstanceType,
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
  /// Parameter [engineType] :
  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// only ACTIVEMQ.
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
    EngineType engineType,
    String engineVersion,
    String name,
    Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
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
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn.toString())}',
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
    @_s.required String brokerId,
    @_s.required String username,
    bool consoleAccess,
    List<String> groups,
    String password,
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
          '/v1/brokers/${Uri.encodeComponent(brokerId.toString())}/users/${Uri.encodeComponent(username.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserResponse.fromJson(response);
  }

  /// Deletes a broker. Note: This API is asynchronous.
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
  Future<DeleteBrokerResponse> deleteBroker({
    @_s.required String brokerId,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/v1/brokers/${Uri.encodeComponent(brokerId.toString())}',
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    var _query = '';
    _query = '?${[
      if (tagKeys != null) _s.toQueryParam('tagKeys', tagKeys),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/tags/${Uri.encodeComponent(resourceArn.toString())}$_query',
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
    @_s.required String brokerId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    ArgumentError.checkNotNull(username, 'username');
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/brokers/${Uri.encodeComponent(brokerId.toString())}/users/${Uri.encodeComponent(username.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteUserResponse.fromJson(response);
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
    @_s.required String brokerId,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/brokers/${Uri.encodeComponent(brokerId.toString())}',
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
    String engineType,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (engineType != null) _s.toQueryParam('engineType', engineType),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/broker-engine-types$_query',
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
    String engineType,
    String hostInstanceType,
    int maxResults,
    String nextToken,
    String storageType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (engineType != null) _s.toQueryParam('engineType', engineType),
      if (hostInstanceType != null)
        _s.toQueryParam('hostInstanceType', hostInstanceType),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (storageType != null) _s.toQueryParam('storageType', storageType),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/broker-instance-options$_query',
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
    @_s.required String configurationId,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/${Uri.encodeComponent(configurationId.toString())}',
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
    @_s.required String configurationId,
    @_s.required String configurationRevision,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    ArgumentError.checkNotNull(configurationRevision, 'configurationRevision');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/${Uri.encodeComponent(configurationId.toString())}/revisions/${Uri.encodeComponent(configurationRevision.toString())}',
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
    @_s.required String brokerId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    ArgumentError.checkNotNull(username, 'username');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/brokers/${Uri.encodeComponent(brokerId.toString())}/users/${Uri.encodeComponent(username.toString())}',
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/brokers$_query',
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
    @_s.required String configurationId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/${Uri.encodeComponent(configurationId.toString())}/revisions$_query',
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/configurations$_query',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn.toString())}',
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
    @_s.required String brokerId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/brokers/${Uri.encodeComponent(brokerId.toString())}/users$_query',
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
    @_s.required String brokerId,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/brokers/${Uri.encodeComponent(brokerId.toString())}/reboot',
      exceptionFnMap: _exceptionFns,
    );
    return RebootBrokerResponse.fromJson(response);
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
  /// The name of the broker. This value must be unique in your AWS account,
  /// 1-50 characters long, must contain only letters, numbers, dashes, and
  /// underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
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
  /// Parameter [logs] :
  /// Enables Amazon CloudWatch logging for brokers.
  ///
  /// Parameter [securityGroups] :
  /// The list of security groups (1 minimum, 5 maximum) that authorizes
  /// connections to brokers.
  Future<UpdateBrokerResponse> updateBroker({
    @_s.required String brokerId,
    bool autoMinorVersionUpgrade,
    ConfigurationId configuration,
    String engineVersion,
    String hostInstanceType,
    Logs logs,
    List<String> securityGroups,
  }) async {
    ArgumentError.checkNotNull(brokerId, 'brokerId');
    final $payload = <String, dynamic>{
      if (autoMinorVersionUpgrade != null)
        'autoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (configuration != null) 'configuration': configuration,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (hostInstanceType != null) 'hostInstanceType': hostInstanceType,
      if (logs != null) 'logs': logs,
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/brokers/${Uri.encodeComponent(brokerId.toString())}',
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
    @_s.required String configurationId,
    String data,
    String description,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    final $payload = <String, dynamic>{
      if (data != null) 'data': data,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/configurations/${Uri.encodeComponent(configurationId.toString())}',
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
    @_s.required String brokerId,
    @_s.required String username,
    bool consoleAccess,
    List<String> groups,
    String password,
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
          '/v1/brokers/${Uri.encodeComponent(brokerId.toString())}/users/${Uri.encodeComponent(username.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserResponse.fromJson(response);
  }
}

/// Name of the availability zone.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AvailabilityZone {
  /// Id for the availability zone.
  @_s.JsonKey(name: 'name')
  final String name;

  AvailabilityZone({
    this.name,
  });
  factory AvailabilityZone.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityZoneFromJson(json);
}

/// Types of broker engines.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BrokerEngineType {
  /// The type of broker engine.
  @_s.JsonKey(name: 'engineType')
  final EngineType engineType;

  /// The list of engine versions.
  @_s.JsonKey(name: 'engineVersions')
  final List<EngineVersion> engineVersions;

  BrokerEngineType({
    this.engineType,
    this.engineVersions,
  });
  factory BrokerEngineType.fromJson(Map<String, dynamic> json) =>
      _$BrokerEngineTypeFromJson(json);
}

/// Returns information about all brokers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BrokerInstance {
  /// The URL of the broker's ActiveMQ Web Console.
  @_s.JsonKey(name: 'consoleURL')
  final String consoleURL;

  /// The broker's wire-level protocol endpoints.
  @_s.JsonKey(name: 'endpoints')
  final List<String> endpoints;

  /// The IP address of the Elastic Network Interface (ENI) attached to the
  /// broker.
  @_s.JsonKey(name: 'ipAddress')
  final String ipAddress;

  BrokerInstance({
    this.consoleURL,
    this.endpoints,
    this.ipAddress,
  });
  factory BrokerInstance.fromJson(Map<String, dynamic> json) =>
      _$BrokerInstanceFromJson(json);
}

/// Option for host instance type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BrokerInstanceOption {
  /// The list of available az.
  @_s.JsonKey(name: 'availabilityZones')
  final List<AvailabilityZone> availabilityZones;

  /// The type of broker engine.
  @_s.JsonKey(name: 'engineType')
  final EngineType engineType;

  /// The type of broker instance.
  @_s.JsonKey(name: 'hostInstanceType')
  final String hostInstanceType;

  /// The broker's storage type.
  @_s.JsonKey(name: 'storageType')
  final BrokerStorageType storageType;

  /// The list of supported deployment modes.
  @_s.JsonKey(name: 'supportedDeploymentModes')
  final List<DeploymentMode> supportedDeploymentModes;

  /// The list of supported engine versions.
  @_s.JsonKey(name: 'supportedEngineVersions')
  final List<String> supportedEngineVersions;

  BrokerInstanceOption({
    this.availabilityZones,
    this.engineType,
    this.hostInstanceType,
    this.storageType,
    this.supportedDeploymentModes,
    this.supportedEngineVersions,
  });
  factory BrokerInstanceOption.fromJson(Map<String, dynamic> json) =>
      _$BrokerInstanceOptionFromJson(json);
}

/// The status of the broker.
enum BrokerState {
  @_s.JsonValue('CREATION_IN_PROGRESS')
  creationInProgress,
  @_s.JsonValue('CREATION_FAILED')
  creationFailed,
  @_s.JsonValue('DELETION_IN_PROGRESS')
  deletionInProgress,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('REBOOT_IN_PROGRESS')
  rebootInProgress,
}

/// The storage type of the broker.
enum BrokerStorageType {
  @_s.JsonValue('EBS')
  ebs,
  @_s.JsonValue('EFS')
  efs,
}

extension on BrokerStorageType {
  String toValue() {
    switch (this) {
      case BrokerStorageType.ebs:
        return 'EBS';
      case BrokerStorageType.efs:
        return 'EFS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The Amazon Resource Name (ARN) of the broker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BrokerSummary {
  /// The Amazon Resource Name (ARN) of the broker.
  @_s.JsonKey(name: 'brokerArn')
  final String brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  @_s.JsonKey(name: 'brokerId')
  final String brokerId;

  /// The name of the broker. This value must be unique in your AWS account, 1-50
  /// characters long, must contain only letters, numbers, dashes, and
  /// underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  @_s.JsonKey(name: 'brokerName')
  final String brokerName;

  /// The status of the broker.
  @_s.JsonKey(name: 'brokerState')
  final BrokerState brokerState;

  /// The time when the broker was created.
  @_s.JsonKey(name: 'created', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime created;

  /// Required. The deployment mode of the broker.
  @_s.JsonKey(name: 'deploymentMode')
  final DeploymentMode deploymentMode;

  /// The broker's instance type.
  @_s.JsonKey(name: 'hostInstanceType')
  final String hostInstanceType;

  BrokerSummary({
    this.brokerArn,
    this.brokerId,
    this.brokerName,
    this.brokerState,
    this.created,
    this.deploymentMode,
    this.hostInstanceType,
  });
  factory BrokerSummary.fromJson(Map<String, dynamic> json) =>
      _$BrokerSummaryFromJson(json);
}

/// The type of change pending for the ActiveMQ user.
enum ChangeType {
  @_s.JsonValue('CREATE')
  create,
  @_s.JsonValue('UPDATE')
  update,
  @_s.JsonValue('DELETE')
  delete,
}

/// Returns information about all configurations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Configuration {
  /// Required. The ARN of the configuration.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Required. The date and time of the configuration revision.
  @_s.JsonKey(name: 'created', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime created;

  /// Required. The description of the configuration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// only ACTIVEMQ.
  @_s.JsonKey(name: 'engineType')
  final EngineType engineType;

  /// Required. The version of the broker engine. For a list of supported engine
  /// versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  @_s.JsonKey(name: 'engineVersion')
  final String engineVersion;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Required. The latest revision of the configuration.
  @_s.JsonKey(name: 'latestRevision')
  final ConfigurationRevision latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 1-150 characters long.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The list of all tags associated with this configuration.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  Configuration({
    this.arn,
    this.created,
    this.description,
    this.engineType,
    this.engineVersion,
    this.id,
    this.latestRevision,
    this.name,
    this.tags,
  });
  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);
}

/// A list of information about the configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfigurationId {
  /// Required. The unique ID that Amazon MQ generates for the configuration.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The revision number of the configuration.
  @_s.JsonKey(name: 'revision')
  final int revision;

  ConfigurationId({
    this.id,
    this.revision,
  });
  factory ConfigurationId.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationIdFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationIdToJson(this);
}

/// Returns information about the specified configuration revision.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigurationRevision {
  /// Required. The date and time of the configuration revision.
  @_s.JsonKey(name: 'created', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime created;

  /// The description of the configuration revision.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Required. The revision number of the configuration.
  @_s.JsonKey(name: 'revision')
  final int revision;

  ConfigurationRevision({
    this.created,
    this.description,
    this.revision,
  });
  factory ConfigurationRevision.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationRevisionFromJson(json);
}

/// Broker configuration information
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Configurations {
  /// The current configuration of the broker.
  @_s.JsonKey(name: 'current')
  final ConfigurationId current;

  /// The history of configurations applied to the broker.
  @_s.JsonKey(name: 'history')
  final List<ConfigurationId> history;

  /// The pending configuration of the broker.
  @_s.JsonKey(name: 'pending')
  final ConfigurationId pending;

  Configurations({
    this.current,
    this.history,
    this.pending,
  });
  factory Configurations.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBrokerResponse {
  /// The Amazon Resource Name (ARN) of the broker.
  @_s.JsonKey(name: 'brokerArn')
  final String brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  @_s.JsonKey(name: 'brokerId')
  final String brokerId;

  CreateBrokerResponse({
    this.brokerArn,
    this.brokerId,
  });
  factory CreateBrokerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBrokerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConfigurationResponse {
  /// Required. The Amazon Resource Name (ARN) of the configuration.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Required. The date and time of the configuration.
  @_s.JsonKey(name: 'created', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime created;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The latest revision of the configuration.
  @_s.JsonKey(name: 'latestRevision')
  final ConfigurationRevision latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 1-150 characters long.
  @_s.JsonKey(name: 'name')
  final String name;

  CreateConfigurationResponse({
    this.arn,
    this.created,
    this.id,
    this.latestRevision,
    this.name,
  });
  factory CreateConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserResponse {
  CreateUserResponse();
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}

enum DayOfWeek {
  @_s.JsonValue('MONDAY')
  monday,
  @_s.JsonValue('TUESDAY')
  tuesday,
  @_s.JsonValue('WEDNESDAY')
  wednesday,
  @_s.JsonValue('THURSDAY')
  thursday,
  @_s.JsonValue('FRIDAY')
  friday,
  @_s.JsonValue('SATURDAY')
  saturday,
  @_s.JsonValue('SUNDAY')
  sunday,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBrokerResponse {
  /// The unique ID that Amazon MQ generates for the broker.
  @_s.JsonKey(name: 'brokerId')
  final String brokerId;

  DeleteBrokerResponse({
    this.brokerId,
  });
  factory DeleteBrokerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBrokerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserResponse {
  DeleteUserResponse();
  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);
}

/// The deployment mode of the broker.
enum DeploymentMode {
  @_s.JsonValue('SINGLE_INSTANCE')
  singleInstance,
  @_s.JsonValue('ACTIVE_STANDBY_MULTI_AZ')
  activeStandbyMultiAz,
}

extension on DeploymentMode {
  String toValue() {
    switch (this) {
      case DeploymentMode.singleInstance:
        return 'SINGLE_INSTANCE';
      case DeploymentMode.activeStandbyMultiAz:
        return 'ACTIVE_STANDBY_MULTI_AZ';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBrokerEngineTypesResponse {
  /// List of available engine types and versions.
  @_s.JsonKey(name: 'brokerEngineTypes')
  final List<BrokerEngineType> brokerEngineTypes;

  /// Required. The maximum number of engine types that can be returned per page
  /// (20 by default). This value must be an integer from 5 to 100.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeBrokerEngineTypesResponse({
    this.brokerEngineTypes,
    this.maxResults,
    this.nextToken,
  });
  factory DescribeBrokerEngineTypesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeBrokerEngineTypesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBrokerInstanceOptionsResponse {
  /// List of available broker instance options.
  @_s.JsonKey(name: 'brokerInstanceOptions')
  final List<BrokerInstanceOption> brokerInstanceOptions;

  /// Required. The maximum number of instance options that can be returned per
  /// page (20 by default). This value must be an integer from 5 to 100.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeBrokerInstanceOptionsResponse({
    this.brokerInstanceOptions,
    this.maxResults,
    this.nextToken,
  });
  factory DescribeBrokerInstanceOptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeBrokerInstanceOptionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBrokerResponse {
  /// Required. Enables automatic upgrades to new minor versions for brokers, as
  /// Apache releases the versions. The automatic upgrades occur during the
  /// maintenance window of the broker or after a manual broker reboot.
  @_s.JsonKey(name: 'autoMinorVersionUpgrade')
  final bool autoMinorVersionUpgrade;

  /// The Amazon Resource Name (ARN) of the broker.
  @_s.JsonKey(name: 'brokerArn')
  final String brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  @_s.JsonKey(name: 'brokerId')
  final String brokerId;

  /// A list of information about allocated brokers.
  @_s.JsonKey(name: 'brokerInstances')
  final List<BrokerInstance> brokerInstances;

  /// The name of the broker. This value must be unique in your AWS account, 1-50
  /// characters long, must contain only letters, numbers, dashes, and
  /// underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  @_s.JsonKey(name: 'brokerName')
  final String brokerName;

  /// The status of the broker.
  @_s.JsonKey(name: 'brokerState')
  final BrokerState brokerState;

  /// The list of all revisions for the specified configuration.
  @_s.JsonKey(name: 'configurations')
  final Configurations configurations;

  /// The time when the broker was created.
  @_s.JsonKey(name: 'created', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime created;

  /// Required. The deployment mode of the broker.
  @_s.JsonKey(name: 'deploymentMode')
  final DeploymentMode deploymentMode;

  /// Encryption options for the broker.
  @_s.JsonKey(name: 'encryptionOptions')
  final EncryptionOptions encryptionOptions;

  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// only ACTIVEMQ.
  @_s.JsonKey(name: 'engineType')
  final EngineType engineType;

  /// The version of the broker engine. For a list of supported engine versions,
  /// see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  @_s.JsonKey(name: 'engineVersion')
  final String engineVersion;

  /// The broker's instance type.
  @_s.JsonKey(name: 'hostInstanceType')
  final String hostInstanceType;

  /// The list of information about logs currently enabled and pending to be
  /// deployed for the specified broker.
  @_s.JsonKey(name: 'logs')
  final LogsSummary logs;

  /// The parameters that determine the WeeklyStartTime.
  @_s.JsonKey(name: 'maintenanceWindowStartTime')
  final WeeklyStartTime maintenanceWindowStartTime;

  /// The version of the broker engine to upgrade to. For a list of supported
  /// engine versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  @_s.JsonKey(name: 'pendingEngineVersion')
  final String pendingEngineVersion;

  /// The host instance type of the broker to upgrade to. For a list of supported
  /// instance types, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide//broker.html#broker-instance-types
  @_s.JsonKey(name: 'pendingHostInstanceType')
  final String pendingHostInstanceType;

  /// The list of pending security groups to authorize connections to brokers.
  @_s.JsonKey(name: 'pendingSecurityGroups')
  final List<String> pendingSecurityGroups;

  /// Required. Enables connections from applications outside of the VPC that
  /// hosts the broker's subnets.
  @_s.JsonKey(name: 'publiclyAccessible')
  final bool publiclyAccessible;

  /// The list of security groups (1 minimum, 5 maximum) that authorizes
  /// connections to brokers.
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  /// The broker's storage type.
  @_s.JsonKey(name: 'storageType')
  final BrokerStorageType storageType;

  /// The list of groups (2 maximum) that define which subnets and IP ranges the
  /// broker can use from different Availability Zones. A SINGLE_INSTANCE
  /// deployment requires one subnet (for example, the default subnet). An
  /// ACTIVE_STANDBY_MULTI_AZ deployment requires two subnets.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// The list of all tags associated with this broker.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The list of all ActiveMQ usernames for the specified broker.
  @_s.JsonKey(name: 'users')
  final List<UserSummary> users;

  DescribeBrokerResponse({
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
    this.logs,
    this.maintenanceWindowStartTime,
    this.pendingEngineVersion,
    this.pendingHostInstanceType,
    this.pendingSecurityGroups,
    this.publiclyAccessible,
    this.securityGroups,
    this.storageType,
    this.subnetIds,
    this.tags,
    this.users,
  });
  factory DescribeBrokerResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeBrokerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigurationResponse {
  /// Required. The ARN of the configuration.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Required. The date and time of the configuration revision.
  @_s.JsonKey(name: 'created', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime created;

  /// Required. The description of the configuration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// only ACTIVEMQ.
  @_s.JsonKey(name: 'engineType')
  final EngineType engineType;

  /// Required. The version of the broker engine. For a list of supported engine
  /// versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  @_s.JsonKey(name: 'engineVersion')
  final String engineVersion;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Required. The latest revision of the configuration.
  @_s.JsonKey(name: 'latestRevision')
  final ConfigurationRevision latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 1-150 characters long.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The list of all tags associated with this configuration.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribeConfigurationResponse({
    this.arn,
    this.created,
    this.description,
    this.engineType,
    this.engineVersion,
    this.id,
    this.latestRevision,
    this.name,
    this.tags,
  });
  factory DescribeConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigurationRevisionResponse {
  /// Required. The unique ID that Amazon MQ generates for the configuration.
  @_s.JsonKey(name: 'configurationId')
  final String configurationId;

  /// Required. The date and time of the configuration.
  @_s.JsonKey(name: 'created', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime created;

  /// Required. The base64-encoded XML configuration.
  @_s.JsonKey(name: 'data')
  final String data;

  /// The description of the configuration.
  @_s.JsonKey(name: 'description')
  final String description;

  DescribeConfigurationRevisionResponse({
    this.configurationId,
    this.created,
    this.data,
    this.description,
  });
  factory DescribeConfigurationRevisionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConfigurationRevisionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserResponse {
  /// Required. The unique ID that Amazon MQ generates for the broker.
  @_s.JsonKey(name: 'brokerId')
  final String brokerId;

  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  @_s.JsonKey(name: 'consoleAccess')
  final bool consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
  @_s.JsonKey(name: 'groups')
  final List<String> groups;

  /// The status of the changes pending for the ActiveMQ user.
  @_s.JsonKey(name: 'pending')
  final UserPendingChanges pending;

  /// Required. The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 2-100 characters long.
  @_s.JsonKey(name: 'username')
  final String username;

  DescribeUserResponse({
    this.brokerId,
    this.consoleAccess,
    this.groups,
    this.pending,
    this.username,
  });
  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserResponseFromJson(json);
}

/// Encryption options for the broker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionOptions {
  /// Enables the use of an AWS owned CMK using AWS Key Management Service (KMS).
  @_s.JsonKey(name: 'useAwsOwnedKey')
  final bool useAwsOwnedKey;

  /// The customer master key (CMK) to use for the AWS Key Management Service
  /// (KMS). This key is used to encrypt your data at rest. If not provided,
  /// Amazon MQ will use a default CMK to encrypt your data.
  @_s.JsonKey(name: 'kmsKeyId')
  final String kmsKeyId;

  EncryptionOptions({
    @_s.required this.useAwsOwnedKey,
    this.kmsKeyId,
  });
  factory EncryptionOptions.fromJson(Map<String, dynamic> json) =>
      _$EncryptionOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionOptionsToJson(this);
}

/// The type of broker engine. Note: Currently, Amazon MQ supports only
/// ActiveMQ.
enum EngineType {
  @_s.JsonValue('ACTIVEMQ')
  activemq,
}

extension on EngineType {
  String toValue() {
    switch (this) {
      case EngineType.activemq:
        return 'ACTIVEMQ';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Id of the engine version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EngineVersion {
  /// Id for the version.
  @_s.JsonKey(name: 'name')
  final String name;

  EngineVersion({
    this.name,
  });
  factory EngineVersion.fromJson(Map<String, dynamic> json) =>
      _$EngineVersionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBrokersResponse {
  /// A list of information about all brokers.
  @_s.JsonKey(name: 'brokerSummaries')
  final List<BrokerSummary> brokerSummaries;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBrokersResponse({
    this.brokerSummaries,
    this.nextToken,
  });
  factory ListBrokersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBrokersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConfigurationRevisionsResponse {
  /// The unique ID that Amazon MQ generates for the configuration.
  @_s.JsonKey(name: 'configurationId')
  final String configurationId;

  /// The maximum number of configuration revisions that can be returned per page
  /// (20 by default). This value must be an integer from 5 to 100.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of all revisions for the specified configuration.
  @_s.JsonKey(name: 'revisions')
  final List<ConfigurationRevision> revisions;

  ListConfigurationRevisionsResponse({
    this.configurationId,
    this.maxResults,
    this.nextToken,
    this.revisions,
  });
  factory ListConfigurationRevisionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListConfigurationRevisionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConfigurationsResponse {
  /// The list of all revisions for the specified configuration.
  @_s.JsonKey(name: 'configurations')
  final List<Configuration> configurations;

  /// The maximum number of configurations that Amazon MQ can return per page (20
  /// by default). This value must be an integer from 5 to 100.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.maxResults,
    this.nextToken,
  });
  factory ListConfigurationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsResponse {
  /// The key-value pair for the resource tag.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsResponse({
    this.tags,
  });
  factory ListTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersResponse {
  /// Required. The unique ID that Amazon MQ generates for the broker.
  @_s.JsonKey(name: 'brokerId')
  final String brokerId;

  /// Required. The maximum number of ActiveMQ users that can be returned per page
  /// (20 by default). This value must be an integer from 5 to 100.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Required. The list of all ActiveMQ usernames for the specified broker.
  @_s.JsonKey(name: 'users')
  final List<UserSummary> users;

  ListUsersResponse({
    this.brokerId,
    this.maxResults,
    this.nextToken,
    this.users,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersResponseFromJson(json);
}

/// The list of information about logs to be enabled for the specified broker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Logs {
  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged.
  @_s.JsonKey(name: 'audit')
  final bool audit;

  /// Enables general logging.
  @_s.JsonKey(name: 'general')
  final bool general;

  Logs({
    this.audit,
    this.general,
  });
  factory Logs.fromJson(Map<String, dynamic> json) => _$LogsFromJson(json);

  Map<String, dynamic> toJson() => _$LogsToJson(this);
}

/// The list of information about logs currently enabled and pending to be
/// deployed for the specified broker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogsSummary {
  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged.
  @_s.JsonKey(name: 'audit')
  final bool audit;

  /// The location of the CloudWatch Logs log group where audit logs are sent.
  @_s.JsonKey(name: 'auditLogGroup')
  final String auditLogGroup;

  /// Enables general logging.
  @_s.JsonKey(name: 'general')
  final bool general;

  /// The location of the CloudWatch Logs log group where general logs are sent.
  @_s.JsonKey(name: 'generalLogGroup')
  final String generalLogGroup;

  /// The list of information about logs pending to be deployed for the specified
  /// broker.
  @_s.JsonKey(name: 'pending')
  final PendingLogs pending;

  LogsSummary({
    this.audit,
    this.auditLogGroup,
    this.general,
    this.generalLogGroup,
    this.pending,
  });
  factory LogsSummary.fromJson(Map<String, dynamic> json) =>
      _$LogsSummaryFromJson(json);
}

/// The list of information about logs to be enabled for the specified broker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PendingLogs {
  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged.
  @_s.JsonKey(name: 'audit')
  final bool audit;

  /// Enables general logging.
  @_s.JsonKey(name: 'general')
  final bool general;

  PendingLogs({
    this.audit,
    this.general,
  });
  factory PendingLogs.fromJson(Map<String, dynamic> json) =>
      _$PendingLogsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RebootBrokerResponse {
  RebootBrokerResponse();
  factory RebootBrokerResponse.fromJson(Map<String, dynamic> json) =>
      _$RebootBrokerResponseFromJson(json);
}

/// Returns information about the XML element or attribute that was sanitized in
/// the configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SanitizationWarning {
  /// The name of the XML attribute that has been sanitized.
  @_s.JsonKey(name: 'attributeName')
  final String attributeName;

  /// The name of the XML element that has been sanitized.
  @_s.JsonKey(name: 'elementName')
  final String elementName;

  /// Required. The reason for which the XML elements or attributes were
  /// sanitized.
  @_s.JsonKey(name: 'reason')
  final SanitizationWarningReason reason;

  SanitizationWarning({
    this.attributeName,
    this.elementName,
    this.reason,
  });
  factory SanitizationWarning.fromJson(Map<String, dynamic> json) =>
      _$SanitizationWarningFromJson(json);
}

/// The reason for which the XML elements or attributes were sanitized.
enum SanitizationWarningReason {
  @_s.JsonValue('DISALLOWED_ELEMENT_REMOVED')
  disallowedElementRemoved,
  @_s.JsonValue('DISALLOWED_ATTRIBUTE_REMOVED')
  disallowedAttributeRemoved,
  @_s.JsonValue('INVALID_ATTRIBUTE_VALUE_REMOVED')
  invalidAttributeValueRemoved,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBrokerResponse {
  /// The new value of automatic upgrades to new minor version for brokers.
  @_s.JsonKey(name: 'autoMinorVersionUpgrade')
  final bool autoMinorVersionUpgrade;

  /// Required. The unique ID that Amazon MQ generates for the broker.
  @_s.JsonKey(name: 'brokerId')
  final String brokerId;

  /// The ID of the updated configuration.
  @_s.JsonKey(name: 'configuration')
  final ConfigurationId configuration;

  /// The version of the broker engine to upgrade to. For a list of supported
  /// engine versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  @_s.JsonKey(name: 'engineVersion')
  final String engineVersion;

  /// The host instance type of the broker to upgrade to. For a list of supported
  /// instance types, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide//broker.html#broker-instance-types
  @_s.JsonKey(name: 'hostInstanceType')
  final String hostInstanceType;

  /// The list of information about logs to be enabled for the specified broker.
  @_s.JsonKey(name: 'logs')
  final Logs logs;

  /// The list of security groups (1 minimum, 5 maximum) that authorizes
  /// connections to brokers.
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  UpdateBrokerResponse({
    this.autoMinorVersionUpgrade,
    this.brokerId,
    this.configuration,
    this.engineVersion,
    this.hostInstanceType,
    this.logs,
    this.securityGroups,
  });
  factory UpdateBrokerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBrokerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConfigurationResponse {
  /// Required. The Amazon Resource Name (ARN) of the configuration.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Required. The date and time of the configuration.
  @_s.JsonKey(name: 'created', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime created;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The latest revision of the configuration.
  @_s.JsonKey(name: 'latestRevision')
  final ConfigurationRevision latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 1-150 characters long.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The list of the first 20 warnings about the configuration XML elements or
  /// attributes that were sanitized.
  @_s.JsonKey(name: 'warnings')
  final List<SanitizationWarning> warnings;

  UpdateConfigurationResponse({
    this.arn,
    this.created,
    this.id,
    this.latestRevision,
    this.name,
    this.warnings,
  });
  factory UpdateConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserResponse {
  UpdateUserResponse();
  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);
}

/// An ActiveMQ user associated with the broker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class User {
  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  @_s.JsonKey(name: 'consoleAccess')
  final bool consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
  @_s.JsonKey(name: 'groups')
  final List<String> groups;

  /// Required. The password of the ActiveMQ user. This value must be at least 12
  /// characters long, must contain at least 4 unique characters, and must not
  /// contain commas.
  @_s.JsonKey(name: 'password')
  final String password;

  /// Required. The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 2-100 characters long.
  @_s.JsonKey(name: 'username')
  final String username;

  User({
    this.consoleAccess,
    this.groups,
    this.password,
    this.username,
  });
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

/// Returns information about the status of the changes pending for the ActiveMQ
/// user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserPendingChanges {
  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  @_s.JsonKey(name: 'consoleAccess')
  final bool consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
  @_s.JsonKey(name: 'groups')
  final List<String> groups;

  /// Required. The type of change pending for the ActiveMQ user.
  @_s.JsonKey(name: 'pendingChange')
  final ChangeType pendingChange;

  UserPendingChanges({
    this.consoleAccess,
    this.groups,
    this.pendingChange,
  });
  factory UserPendingChanges.fromJson(Map<String, dynamic> json) =>
      _$UserPendingChangesFromJson(json);
}

/// Returns a list of all ActiveMQ users.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserSummary {
  /// The type of change pending for the ActiveMQ user.
  @_s.JsonKey(name: 'pendingChange')
  final ChangeType pendingChange;

  /// Required. The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 2-100 characters long.
  @_s.JsonKey(name: 'username')
  final String username;

  UserSummary({
    this.pendingChange,
    this.username,
  });
  factory UserSummary.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryFromJson(json);
}

/// The scheduled time period relative to UTC during which Amazon MQ begins to
/// apply pending updates or patches to the broker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WeeklyStartTime {
  /// Required. The day of the week.
  @_s.JsonKey(name: 'dayOfWeek')
  final DayOfWeek dayOfWeek;

  /// Required. The time, in 24-hour format.
  @_s.JsonKey(name: 'timeOfDay')
  final String timeOfDay;

  /// The time zone, UTC by default, in either the Country/City format, or the UTC
  /// offset format.
  @_s.JsonKey(name: 'timeZone')
  final String timeZone;

  WeeklyStartTime({
    this.dayOfWeek,
    this.timeOfDay,
    this.timeZone,
  });
  factory WeeklyStartTime.fromJson(Map<String, dynamic> json) =>
      _$WeeklyStartTimeFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyStartTimeToJson(this);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
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
