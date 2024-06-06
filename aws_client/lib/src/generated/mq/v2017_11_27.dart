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
  /// To create a broker, you must either use the AmazonMQFullAccess IAM policy
  /// or include the following EC2 permissions in your IAM policy.
  ///
  /// <ul>
  /// <li>
  /// ec2:CreateNetworkInterface
  ///
  /// This permission is required to allow Amazon MQ to create an elastic
  /// network interface (ENI) on behalf of your account.
  /// </li>
  /// <li>
  /// ec2:CreateNetworkInterfacePermission
  ///
  /// This permission is required to attach the ENI to the broker instance.
  /// </li>
  /// <li>
  /// ec2:DeleteNetworkInterface
  /// </li>
  /// <li>
  /// ec2:DeleteNetworkInterfacePermission
  /// </li>
  /// <li>
  /// ec2:DetachNetworkInterface
  /// </li>
  /// <li>
  /// ec2:DescribeInternetGateways
  /// </li>
  /// <li>
  /// ec2:DescribeNetworkInterfaces
  /// </li>
  /// <li>
  /// ec2:DescribeNetworkInterfacePermissions
  /// </li>
  /// <li>
  /// ec2:DescribeRouteTables
  /// </li>
  /// <li>
  /// ec2:DescribeSecurityGroups
  /// </li>
  /// <li>
  /// ec2:DescribeSubnets
  /// </li>
  /// <li>
  /// ec2:DescribeVpcs
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/amazon-mq-setting-up.html#create-iam-user">Create
  /// an IAM User and Get Your Amazon Web Services Credentials</a> and <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/connecting-to-amazon-mq.html#never-modify-delete-elastic-network-interface">Never
  /// Modify or Delete the Amazon MQ Elastic Network Interface</a> in the
  /// <i>Amazon MQ Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// Enables automatic upgrades to new minor versions for brokers, as new
  /// versions are released and supported by Amazon MQ. Automatic upgrades occur
  /// during the scheduled maintenance window of the broker or after a manual
  /// broker reboot. Set to true by default, if no value is specified.
  ///
  /// Parameter [brokerName] :
  /// Required. The broker's name. This value must be unique in your Amazon Web
  /// Services account, 1-50 characters long, must contain only letters,
  /// numbers, dashes, and underscores, and must not contain white spaces,
  /// brackets, wildcard characters, or special characters.
  /// <important>
  /// Do not add personally identifiable information (PII) or other confidential
  /// or sensitive information in broker names. Broker names are accessible to
  /// other Amazon Web Services services, including CloudWatch Logs. Broker
  /// names are not intended to be used for private or sensitive data.
  /// </important>
  ///
  /// Parameter [deploymentMode] :
  /// Required. The broker's deployment mode.
  ///
  /// Parameter [engineType] :
  /// Required. The type of broker engine. Currently, Amazon MQ supports
  /// ACTIVEMQ and RABBITMQ.
  ///
  /// Parameter [engineVersion] :
  /// Required. The broker engine's version. For a list of supported engine
  /// versions, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html">Supported
  /// engines</a>.
  ///
  /// Parameter [hostInstanceType] :
  /// Required. The broker's instance type.
  ///
  /// Parameter [publiclyAccessible] :
  /// Enables connections from applications outside of the VPC that hosts the
  /// broker's subnets. Set to false by default, if no value is provided.
  ///
  /// Parameter [users] :
  /// The list of broker users (persons or applications) who can access queues
  /// and topics. For Amazon MQ for RabbitMQ brokers, one and only one
  /// administrative user is accepted and created when a broker is first
  /// provisioned. All subsequent broker users are created by making RabbitMQ
  /// API calls directly to brokers or via the RabbitMQ web console.
  ///
  /// Parameter [authenticationStrategy] :
  /// Optional. The authentication strategy used to secure the broker. The
  /// default is SIMPLE.
  ///
  /// Parameter [configuration] :
  /// A list of information about the configuration.
  ///
  /// Parameter [creatorRequestId] :
  /// The unique ID that the requester receives for the created broker. Amazon
  /// MQ passes your ID with the API action.
  /// <note>
  /// We recommend using a Universally Unique Identifier (UUID) for the
  /// creatorRequestId. You may omit the creatorRequestId if your application
  /// doesn't require idempotency.
  /// </note>
  ///
  /// Parameter [dataReplicationMode] :
  /// Defines whether this broker is a part of a data replication pair.
  ///
  /// Parameter [dataReplicationPrimaryBrokerArn] :
  /// The Amazon Resource Name (ARN) of the primary broker that is used to
  /// replicate data from in a data replication pair, and is applied to the
  /// replica broker. Must be set when dataReplicationMode is set to CRDR.
  ///
  /// Parameter [encryptionOptions] :
  /// Encryption options for the broker.
  ///
  /// Parameter [ldapServerMetadata] :
  /// Optional. The metadata of the LDAP server used to authenticate and
  /// authorize connections to the broker. Does not apply to RabbitMQ brokers.
  ///
  /// Parameter [logs] :
  /// Enables Amazon CloudWatch logging for brokers.
  ///
  /// Parameter [maintenanceWindowStartTime] :
  /// The parameters that determine the WeeklyStartTime.
  ///
  /// Parameter [securityGroups] :
  /// The list of rules (1 minimum, 125 maximum) that authorize connections to
  /// brokers.
  ///
  /// Parameter [storageType] :
  /// The broker's storage type.
  ///
  /// Parameter [subnetIds] :
  /// The list of groups that define which subnets and IP ranges the broker can
  /// use from different Availability Zones. If you specify more than one
  /// subnet, the subnets must be in different Availability Zones. Amazon MQ
  /// will not be able to create VPC endpoints for your broker with multiple
  /// subnets in the same Availability Zone. A SINGLE_INSTANCE deployment
  /// requires one subnet (for example, the default subnet). An
  /// ACTIVE_STANDBY_MULTI_AZ Amazon MQ for ActiveMQ deployment requires two
  /// subnets. A CLUSTER_MULTI_AZ Amazon MQ for RabbitMQ deployment has no
  /// subnet requirements when deployed with public accessibility. Deployment
  /// without public accessibility requires at least one subnet.
  /// <important>
  /// If you specify subnets in a <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-sharing.html">shared
  /// VPC</a> for a RabbitMQ broker, the associated VPC to which the specified
  /// subnets belong must be owned by your Amazon Web Services account. Amazon
  /// MQ will not be able to create VPC endpoints in VPCs that are not owned by
  /// your Amazon Web Services account.
  /// </important>
  ///
  /// Parameter [tags] :
  /// Create tags when creating the broker.
  Future<CreateBrokerResponse> createBroker({
    required bool autoMinorVersionUpgrade,
    required String brokerName,
    required DeploymentMode deploymentMode,
    required EngineType engineType,
    required String engineVersion,
    required String hostInstanceType,
    required bool publiclyAccessible,
    required List<User> users,
    AuthenticationStrategy? authenticationStrategy,
    ConfigurationId? configuration,
    String? creatorRequestId,
    DataReplicationMode? dataReplicationMode,
    String? dataReplicationPrimaryBrokerArn,
    EncryptionOptions? encryptionOptions,
    LdapServerMetadataInput? ldapServerMetadata,
    Logs? logs,
    WeeklyStartTime? maintenanceWindowStartTime,
    List<String>? securityGroups,
    BrokerStorageType? storageType,
    List<String>? subnetIds,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'autoMinorVersionUpgrade': autoMinorVersionUpgrade,
      'brokerName': brokerName,
      'deploymentMode': deploymentMode.toValue(),
      'engineType': engineType.toValue(),
      'engineVersion': engineVersion,
      'hostInstanceType': hostInstanceType,
      'publiclyAccessible': publiclyAccessible,
      'users': users,
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
      if (configuration != null) 'configuration': configuration,
      'creatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
      if (dataReplicationMode != null)
        'dataReplicationMode': dataReplicationMode.toValue(),
      if (dataReplicationPrimaryBrokerArn != null)
        'dataReplicationPrimaryBrokerArn': dataReplicationPrimaryBrokerArn,
      if (encryptionOptions != null) 'encryptionOptions': encryptionOptions,
      if (ldapServerMetadata != null) 'ldapServerMetadata': ldapServerMetadata,
      if (logs != null) 'logs': logs,
      if (maintenanceWindowStartTime != null)
        'maintenanceWindowStartTime': maintenanceWindowStartTime,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (storageType != null) 'storageType': storageType.toValue(),
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
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
  /// Required. The type of broker engine. Currently, Amazon MQ supports
  /// ACTIVEMQ and RABBITMQ.
  ///
  /// Parameter [engineVersion] :
  /// Required. The broker engine's version. For a list of supported engine
  /// versions, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html">Supported
  /// engines</a>.
  ///
  /// Parameter [name] :
  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 1-150 characters long.
  ///
  /// Parameter [authenticationStrategy] :
  /// Optional. The authentication strategy associated with the configuration.
  /// The default is SIMPLE.
  ///
  /// Parameter [tags] :
  /// Create tags when creating the configuration.
  Future<CreateConfigurationResponse> createConfiguration({
    required EngineType engineType,
    required String engineVersion,
    required String name,
    AuthenticationStrategy? authenticationStrategy,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'engineType': engineType.toValue(),
      'engineVersion': engineVersion,
      'name': name,
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
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
  /// <important>
  /// Do not add personally identifiable information (PII) or other confidential
  /// or sensitive information in broker usernames. Broker usernames are
  /// accessible to other Amazon Web Services services, including CloudWatch
  /// Logs. Broker usernames are not intended to be used for private or
  /// sensitive data.
  /// </important>
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
  /// Parameter [password] :
  /// Required. The password of the user. This value must be at least 12
  /// characters long, must contain at least 4 unique characters, and must not
  /// contain commas, colons, or equal signs (,:=).
  ///
  /// Parameter [username] :
  /// The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  ///
  /// Parameter [consoleAccess] :
  /// Enables access to the ActiveMQ Web Console for the ActiveMQ user.
  ///
  /// Parameter [groups] :
  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters
  /// long.
  ///
  /// Parameter [replicationUser] :
  /// Defines if this user is intended for CRDR replication purposes.
  Future<void> createUser({
    required String brokerId,
    required String password,
    required String username,
    bool? consoleAccess,
    List<String>? groups,
    bool? replicationUser,
  }) async {
    final $payload = <String, dynamic>{
      'password': password,
      if (consoleAccess != null) 'consoleAccess': consoleAccess,
      if (groups != null) 'groups': groups,
      if (replicationUser != null) 'replicationUser': replicationUser,
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
  /// The unique ID that Amazon MQ generates for the broker.
  Future<DescribeBrokerResponse> describeBroker({
    required String brokerId,
  }) async {
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
  /// The maximum number of brokers that Amazon MQ can return per page (20 by
  /// default). This value must be an integer from 5 to 100.
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
  /// The maximum number of brokers that Amazon MQ can return per page (20 by
  /// default). This value must be an integer from 5 to 100.
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
  /// The maximum number of brokers that Amazon MQ can return per page (20 by
  /// default). This value must be an integer from 5 to 100.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  Future<ListConfigurationRevisionsResponse> listConfigurationRevisions({
    required String configurationId,
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
  /// The maximum number of brokers that Amazon MQ can return per page (20 by
  /// default). This value must be an integer from 5 to 100.
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
  /// The maximum number of brokers that Amazon MQ can return per page (20 by
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

  /// Promotes a data replication replica broker to the primary broker role.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [brokerId] :
  /// The unique ID that Amazon MQ generates for the broker.
  ///
  /// Parameter [mode] :
  /// The Promote mode requested. Note: Valid values for the parameter are
  /// SWITCHOVER, FAILOVER.
  Future<PromoteResponse> promote({
    required String brokerId,
    required PromoteMode mode,
  }) async {
    final $payload = <String, dynamic>{
      'mode': mode.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/brokers/${Uri.encodeComponent(brokerId)}/promote',
      exceptionFnMap: _exceptionFns,
    );
    return PromoteResponse.fromJson(response);
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
  /// Optional. The authentication strategy used to secure the broker. The
  /// default is SIMPLE.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// Enables automatic upgrades to new minor versions for brokers, as new
  /// versions are released and supported by Amazon MQ. Automatic upgrades occur
  /// during the scheduled maintenance window of the broker or after a manual
  /// broker reboot.
  ///
  /// Parameter [configuration] :
  /// A list of information about the configuration.
  ///
  /// Parameter [dataReplicationMode] :
  /// Defines whether this broker is a part of a data replication pair.
  ///
  /// Parameter [engineVersion] :
  /// The broker engine version. For a list of supported engine versions, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html">Supported
  /// engines</a>.
  ///
  /// Parameter [hostInstanceType] :
  /// The broker's host instance type to upgrade to. For a list of supported
  /// instance types, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker.html#broker-instance-types">Broker
  /// instance types</a>.
  ///
  /// Parameter [ldapServerMetadata] :
  /// Optional. The metadata of the LDAP server used to authenticate and
  /// authorize connections to the broker. Does not apply to RabbitMQ brokers.
  ///
  /// Parameter [logs] :
  /// Enables Amazon CloudWatch logging for brokers.
  ///
  /// Parameter [maintenanceWindowStartTime] :
  /// The parameters that determine the WeeklyStartTime.
  ///
  /// Parameter [securityGroups] :
  /// The list of security groups (1 minimum, 5 maximum) that authorizes
  /// connections to brokers.
  Future<UpdateBrokerResponse> updateBroker({
    required String brokerId,
    AuthenticationStrategy? authenticationStrategy,
    bool? autoMinorVersionUpgrade,
    ConfigurationId? configuration,
    DataReplicationMode? dataReplicationMode,
    String? engineVersion,
    String? hostInstanceType,
    LdapServerMetadataInput? ldapServerMetadata,
    Logs? logs,
    WeeklyStartTime? maintenanceWindowStartTime,
    List<String>? securityGroups,
  }) async {
    final $payload = <String, dynamic>{
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
      if (autoMinorVersionUpgrade != null)
        'autoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (configuration != null) 'configuration': configuration,
      if (dataReplicationMode != null)
        'dataReplicationMode': dataReplicationMode.toValue(),
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (hostInstanceType != null) 'hostInstanceType': hostInstanceType,
      if (ldapServerMetadata != null) 'ldapServerMetadata': ldapServerMetadata,
      if (logs != null) 'logs': logs,
      if (maintenanceWindowStartTime != null)
        'maintenanceWindowStartTime': maintenanceWindowStartTime,
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
  /// Amazon MQ for Active MQ: The base64-encoded XML configuration. Amazon MQ
  /// for RabbitMQ: the base64-encoded Cuttlefish configuration.
  ///
  /// Parameter [description] :
  /// The description of the configuration.
  Future<UpdateConfigurationResponse> updateConfiguration({
    required String configurationId,
    required String data,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'data': data,
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
  /// The password of the user. This value must be at least 12 characters long,
  /// must contain at least 4 unique characters, and must not contain commas,
  /// colons, or equal signs (,:=).
  ///
  /// Parameter [replicationUser] :
  /// Defines whether the user is intended for data replication.
  Future<void> updateUser({
    required String brokerId,
    required String username,
    bool? consoleAccess,
    List<String>? groups,
    String? password,
    bool? replicationUser,
  }) async {
    final $payload = <String, dynamic>{
      if (consoleAccess != null) 'consoleAccess': consoleAccess,
      if (groups != null) 'groups': groups,
      if (password != null) 'password': password,
      if (replicationUser != null) 'replicationUser': replicationUser,
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

/// Action required for a broker.
class ActionRequired {
  /// The code you can use to find instructions on the action required to resolve
  /// your broker issue.
  final String? actionRequiredCode;

  /// Information about the action required to resolve your broker issue.
  final String? actionRequiredInfo;

  ActionRequired({
    this.actionRequiredCode,
    this.actionRequiredInfo,
  });

  factory ActionRequired.fromJson(Map<String, dynamic> json) {
    return ActionRequired(
      actionRequiredCode: json['actionRequiredCode'] as String?,
      actionRequiredInfo: json['actionRequiredInfo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionRequiredCode = this.actionRequiredCode;
    final actionRequiredInfo = this.actionRequiredInfo;
    return {
      if (actionRequiredCode != null) 'actionRequiredCode': actionRequiredCode,
      if (actionRequiredInfo != null) 'actionRequiredInfo': actionRequiredInfo,
    };
  }
}

/// Optional. The authentication strategy used to secure the broker. The default
/// is SIMPLE.
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

/// Types of broker engines.
class BrokerEngineType {
  /// The broker's engine type.
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

  Map<String, dynamic> toJson() {
    final engineType = this.engineType;
    final engineVersions = this.engineVersions;
    return {
      if (engineType != null) 'engineType': engineType.toValue(),
      if (engineVersions != null) 'engineVersions': engineVersions,
    };
  }
}

/// Returns information about all brokers.
class BrokerInstance {
  /// The brokers web console URL.
  final String? consoleURL;

  /// The broker's wire-level protocol endpoints.
  final List<String>? endpoints;

  /// The IP address of the Elastic Network Interface (ENI) attached to the
  /// broker. Does not apply to RabbitMQ brokers.
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

  Map<String, dynamic> toJson() {
    final consoleURL = this.consoleURL;
    final endpoints = this.endpoints;
    final ipAddress = this.ipAddress;
    return {
      if (consoleURL != null) 'consoleURL': consoleURL,
      if (endpoints != null) 'endpoints': endpoints,
      if (ipAddress != null) 'ipAddress': ipAddress,
    };
  }
}

/// Option for host instance type.
class BrokerInstanceOption {
  /// The list of available az.
  final List<AvailabilityZone>? availabilityZones;

  /// The broker's engine type.
  final EngineType? engineType;

  /// The broker's instance type.
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

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final engineType = this.engineType;
    final hostInstanceType = this.hostInstanceType;
    final storageType = this.storageType;
    final supportedDeploymentModes = this.supportedDeploymentModes;
    final supportedEngineVersions = this.supportedEngineVersions;
    return {
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (engineType != null) 'engineType': engineType.toValue(),
      if (hostInstanceType != null) 'hostInstanceType': hostInstanceType,
      if (storageType != null) 'storageType': storageType.toValue(),
      if (supportedDeploymentModes != null)
        'supportedDeploymentModes':
            supportedDeploymentModes.map((e) => e.toValue()).toList(),
      if (supportedEngineVersions != null)
        'supportedEngineVersions': supportedEngineVersions,
    };
  }
}

/// The broker's status.
enum BrokerState {
  creationInProgress,
  creationFailed,
  deletionInProgress,
  running,
  rebootInProgress,
  criticalActionRequired,
  replica,
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
      case BrokerState.criticalActionRequired:
        return 'CRITICAL_ACTION_REQUIRED';
      case BrokerState.replica:
        return 'REPLICA';
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
      case 'CRITICAL_ACTION_REQUIRED':
        return BrokerState.criticalActionRequired;
      case 'REPLICA':
        return BrokerState.replica;
    }
    throw Exception('$this is not known in enum BrokerState');
  }
}

/// The broker's storage type.
/// <important>
/// EFS is not supported for RabbitMQ engine type.
/// </important>
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

/// Returns information about all brokers.
class BrokerSummary {
  /// The broker's deployment mode.
  final DeploymentMode deploymentMode;

  /// The type of broker engine.
  final EngineType engineType;

  /// The broker's Amazon Resource Name (ARN).
  final String? brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  /// The broker's name. This value is unique in your Amazon Web Services account,
  /// 1-50 characters long, and containing only letters, numbers, dashes, and
  /// underscores, and must not contain white spaces, brackets, wildcard
  /// characters, or special characters.
  final String? brokerName;

  /// The broker's status.
  final BrokerState? brokerState;

  /// The time when the broker was created.
  final DateTime? created;

  /// The broker's instance type.
  final String? hostInstanceType;

  BrokerSummary({
    required this.deploymentMode,
    required this.engineType,
    this.brokerArn,
    this.brokerId,
    this.brokerName,
    this.brokerState,
    this.created,
    this.hostInstanceType,
  });

  factory BrokerSummary.fromJson(Map<String, dynamic> json) {
    return BrokerSummary(
      deploymentMode: (json['deploymentMode'] as String).toDeploymentMode(),
      engineType: (json['engineType'] as String).toEngineType(),
      brokerArn: json['brokerArn'] as String?,
      brokerId: json['brokerId'] as String?,
      brokerName: json['brokerName'] as String?,
      brokerState: (json['brokerState'] as String?)?.toBrokerState(),
      created: timeStampFromJson(json['created']),
      hostInstanceType: json['hostInstanceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentMode = this.deploymentMode;
    final engineType = this.engineType;
    final brokerArn = this.brokerArn;
    final brokerId = this.brokerId;
    final brokerName = this.brokerName;
    final brokerState = this.brokerState;
    final created = this.created;
    final hostInstanceType = this.hostInstanceType;
    return {
      'deploymentMode': deploymentMode.toValue(),
      'engineType': engineType.toValue(),
      if (brokerArn != null) 'brokerArn': brokerArn,
      if (brokerId != null) 'brokerId': brokerId,
      if (brokerName != null) 'brokerName': brokerName,
      if (brokerState != null) 'brokerState': brokerState.toValue(),
      if (created != null) 'created': iso8601ToJson(created),
      if (hostInstanceType != null) 'hostInstanceType': hostInstanceType,
    };
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
  final String arn;

  /// Optional. The authentication strategy associated with the configuration. The
  /// default is SIMPLE.
  final AuthenticationStrategy authenticationStrategy;

  /// Required. The date and time of the configuration revision.
  final DateTime created;

  /// Required. The description of the configuration.
  final String description;

  /// Required. The type of broker engine. Currently, Amazon MQ supports ACTIVEMQ
  /// and RABBITMQ.
  final EngineType engineType;

  /// Required. The broker engine's version. For a list of supported engine
  /// versions, see, <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html">Supported
  /// engines</a>.
  final String engineVersion;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String id;

  /// Required. The latest revision of the configuration.
  final ConfigurationRevision latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 1-150 characters long.
  final String name;

  /// The list of all tags associated with this configuration.
  final Map<String, String>? tags;

  Configuration({
    required this.arn,
    required this.authenticationStrategy,
    required this.created,
    required this.description,
    required this.engineType,
    required this.engineVersion,
    required this.id,
    required this.latestRevision,
    required this.name,
    this.tags,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      arn: json['arn'] as String,
      authenticationStrategy:
          (json['authenticationStrategy'] as String).toAuthenticationStrategy(),
      created: nonNullableTimeStampFromJson(json['created'] as Object),
      description: json['description'] as String,
      engineType: (json['engineType'] as String).toEngineType(),
      engineVersion: json['engineVersion'] as String,
      id: json['id'] as String,
      latestRevision: ConfigurationRevision.fromJson(
          json['latestRevision'] as Map<String, dynamic>),
      name: json['name'] as String,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authenticationStrategy = this.authenticationStrategy;
    final created = this.created;
    final description = this.description;
    final engineType = this.engineType;
    final engineVersion = this.engineVersion;
    final id = this.id;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final tags = this.tags;
    return {
      'arn': arn,
      'authenticationStrategy': authenticationStrategy.toValue(),
      'created': iso8601ToJson(created),
      'description': description,
      'engineType': engineType.toValue(),
      'engineVersion': engineVersion,
      'id': id,
      'latestRevision': latestRevision,
      'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A list of information about the configuration.
class ConfigurationId {
  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String id;

  /// The revision number of the configuration.
  final int? revision;

  ConfigurationId({
    required this.id,
    this.revision,
  });

  factory ConfigurationId.fromJson(Map<String, dynamic> json) {
    return ConfigurationId(
      id: json['id'] as String,
      revision: json['revision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final revision = this.revision;
    return {
      'id': id,
      if (revision != null) 'revision': revision,
    };
  }
}

/// Returns information about the specified configuration revision.
class ConfigurationRevision {
  /// Required. The date and time of the configuration revision.
  final DateTime created;

  /// Required. The revision number of the configuration.
  final int revision;

  /// The description of the configuration revision.
  final String? description;

  ConfigurationRevision({
    required this.created,
    required this.revision,
    this.description,
  });

  factory ConfigurationRevision.fromJson(Map<String, dynamic> json) {
    return ConfigurationRevision(
      created: nonNullableTimeStampFromJson(json['created'] as Object),
      revision: json['revision'] as int,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final revision = this.revision;
    final description = this.description;
    return {
      'created': iso8601ToJson(created),
      'revision': revision,
      if (description != null) 'description': description,
    };
  }
}

/// Broker configuration information
class Configurations {
  /// The broker's current configuration.
  final ConfigurationId? current;

  /// The history of configurations applied to the broker.
  final List<ConfigurationId>? history;

  /// The broker's pending configuration.
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

  Map<String, dynamic> toJson() {
    final current = this.current;
    final history = this.history;
    final pending = this.pending;
    return {
      if (current != null) 'current': current,
      if (history != null) 'history': history,
      if (pending != null) 'pending': pending,
    };
  }
}

class CreateBrokerResponse {
  /// The broker's Amazon Resource Name (ARN).
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

  Map<String, dynamic> toJson() {
    final brokerArn = this.brokerArn;
    final brokerId = this.brokerId;
    return {
      if (brokerArn != null) 'brokerArn': brokerArn,
      if (brokerId != null) 'brokerId': brokerId,
    };
  }
}

class CreateConfigurationResponse {
  /// Required. The Amazon Resource Name (ARN) of the configuration.
  final String? arn;

  /// Optional. The authentication strategy associated with the configuration. The
  /// default is SIMPLE.
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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authenticationStrategy = this.authenticationStrategy;
    final created = this.created;
    final id = this.id;
    final latestRevision = this.latestRevision;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
      if (created != null) 'created': iso8601ToJson(created),
      if (id != null) 'id': id,
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
    };
  }
}

class CreateUserResponse {
  CreateUserResponse();

  factory CreateUserResponse.fromJson(Map<String, dynamic> _) {
    return CreateUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies a broker in a data replication pair.
class DataReplicationCounterpart {
  /// Required. The unique broker id generated by Amazon MQ.
  final String brokerId;

  /// Required. The region of the broker.
  final String region;

  DataReplicationCounterpart({
    required this.brokerId,
    required this.region,
  });

  factory DataReplicationCounterpart.fromJson(Map<String, dynamic> json) {
    return DataReplicationCounterpart(
      brokerId: json['brokerId'] as String,
      region: json['region'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final brokerId = this.brokerId;
    final region = this.region;
    return {
      'brokerId': brokerId,
      'region': region,
    };
  }
}

/// The replication details of the data replication-enabled broker. Only
/// returned if dataReplicationMode or pendingDataReplicationMode is set to
/// CRDR.
class DataReplicationMetadataOutput {
  /// Defines the role of this broker in a data replication pair. When a replica
  /// broker is promoted to primary, this role is interchanged.
  final String dataReplicationRole;

  /// Describes the replica/primary broker. Only returned if this broker is
  /// currently set as a primary or replica in the broker's dataReplicationRole
  /// property.
  final DataReplicationCounterpart? dataReplicationCounterpart;

  DataReplicationMetadataOutput({
    required this.dataReplicationRole,
    this.dataReplicationCounterpart,
  });

  factory DataReplicationMetadataOutput.fromJson(Map<String, dynamic> json) {
    return DataReplicationMetadataOutput(
      dataReplicationRole: json['dataReplicationRole'] as String,
      dataReplicationCounterpart: json['dataReplicationCounterpart'] != null
          ? DataReplicationCounterpart.fromJson(
              json['dataReplicationCounterpart'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataReplicationRole = this.dataReplicationRole;
    final dataReplicationCounterpart = this.dataReplicationCounterpart;
    return {
      'dataReplicationRole': dataReplicationRole,
      if (dataReplicationCounterpart != null)
        'dataReplicationCounterpart': dataReplicationCounterpart,
    };
  }
}

/// Specifies whether a broker is a part of a data replication pair.
enum DataReplicationMode {
  none,
  crdr,
}

extension DataReplicationModeValueExtension on DataReplicationMode {
  String toValue() {
    switch (this) {
      case DataReplicationMode.none:
        return 'NONE';
      case DataReplicationMode.crdr:
        return 'CRDR';
    }
  }
}

extension DataReplicationModeFromString on String {
  DataReplicationMode toDataReplicationMode() {
    switch (this) {
      case 'NONE':
        return DataReplicationMode.none;
      case 'CRDR':
        return DataReplicationMode.crdr;
    }
    throw Exception('$this is not known in enum DataReplicationMode');
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

  Map<String, dynamic> toJson() {
    final brokerId = this.brokerId;
    return {
      if (brokerId != null) 'brokerId': brokerId,
    };
  }
}

class DeleteUserResponse {
  DeleteUserResponse();

  factory DeleteUserResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The broker's deployment mode.
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

  Map<String, dynamic> toJson() {
    final brokerEngineTypes = this.brokerEngineTypes;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      if (brokerEngineTypes != null) 'brokerEngineTypes': brokerEngineTypes,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final brokerInstanceOptions = this.brokerInstanceOptions;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      if (brokerInstanceOptions != null)
        'brokerInstanceOptions': brokerInstanceOptions,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeBrokerResponse {
  /// Actions required for a broker.
  final List<ActionRequired>? actionsRequired;

  /// The authentication strategy used to secure the broker. The default is
  /// SIMPLE.
  final AuthenticationStrategy? authenticationStrategy;

  /// Enables automatic upgrades to new minor versions for brokers, as new
  /// versions are released and supported by Amazon MQ. Automatic upgrades occur
  /// during the scheduled maintenance window of the broker or after a manual
  /// broker reboot.
  final bool? autoMinorVersionUpgrade;

  /// The broker's Amazon Resource Name (ARN).
  final String? brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  /// A list of information about allocated brokers.
  final List<BrokerInstance>? brokerInstances;

  /// The broker's name. This value must be unique in your Amazon Web Services
  /// account account, 1-50 characters long, must contain only letters, numbers,
  /// dashes, and underscores, and must not contain white spaces, brackets,
  /// wildcard characters, or special characters.
  final String? brokerName;

  /// The broker's status.
  final BrokerState? brokerState;

  /// The list of all revisions for the specified configuration.
  final Configurations? configurations;

  /// The time when the broker was created.
  final DateTime? created;

  /// The replication details of the data replication-enabled broker. Only
  /// returned if dataReplicationMode is set to CRDR.
  final DataReplicationMetadataOutput? dataReplicationMetadata;

  /// Describes whether this broker is a part of a data replication pair.
  final DataReplicationMode? dataReplicationMode;

  /// The broker's deployment mode.
  final DeploymentMode? deploymentMode;

  /// Encryption options for the broker.
  final EncryptionOptions? encryptionOptions;

  /// The type of broker engine. Currently, Amazon MQ supports ACTIVEMQ and
  /// RABBITMQ.
  final EngineType? engineType;

  /// The broker engine's version. For a list of supported engine versions, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html">Supported
  /// engines</a>.
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
  /// rebooted. The default is SIMPLE.
  final AuthenticationStrategy? pendingAuthenticationStrategy;

  /// The pending replication details of the data replication-enabled broker. Only
  /// returned if pendingDataReplicationMode is set to CRDR.
  final DataReplicationMetadataOutput? pendingDataReplicationMetadata;

  /// Describes whether this broker will be a part of a data replication pair
  /// after reboot.
  final DataReplicationMode? pendingDataReplicationMode;

  /// The broker engine version to upgrade to. For a list of supported engine
  /// versions, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html">Supported
  /// engines</a>.
  final String? pendingEngineVersion;

  /// The broker's host instance type to upgrade to. For a list of supported
  /// instance types, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker.html#broker-instance-types">Broker
  /// instance types</a>.
  final String? pendingHostInstanceType;

  /// The metadata of the LDAP server that will be used to authenticate and
  /// authorize connections to the broker after it is rebooted.
  final LdapServerMetadataOutput? pendingLdapServerMetadata;

  /// The list of pending security groups to authorize connections to brokers.
  final List<String>? pendingSecurityGroups;

  /// Enables connections from applications outside of the VPC that hosts the
  /// broker's subnets.
  final bool? publiclyAccessible;

  /// The list of rules (1 minimum, 125 maximum) that authorize connections to
  /// brokers.
  final List<String>? securityGroups;

  /// The broker's storage type.
  final BrokerStorageType? storageType;

  /// The list of groups that define which subnets and IP ranges the broker can
  /// use from different Availability Zones.
  final List<String>? subnetIds;

  /// The list of all tags associated with this broker.
  final Map<String, String>? tags;

  /// The list of all broker usernames for the specified broker.
  final List<UserSummary>? users;

  DescribeBrokerResponse({
    this.actionsRequired,
    this.authenticationStrategy,
    this.autoMinorVersionUpgrade,
    this.brokerArn,
    this.brokerId,
    this.brokerInstances,
    this.brokerName,
    this.brokerState,
    this.configurations,
    this.created,
    this.dataReplicationMetadata,
    this.dataReplicationMode,
    this.deploymentMode,
    this.encryptionOptions,
    this.engineType,
    this.engineVersion,
    this.hostInstanceType,
    this.ldapServerMetadata,
    this.logs,
    this.maintenanceWindowStartTime,
    this.pendingAuthenticationStrategy,
    this.pendingDataReplicationMetadata,
    this.pendingDataReplicationMode,
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
      actionsRequired: (json['actionsRequired'] as List?)
          ?.whereNotNull()
          .map((e) => ActionRequired.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      dataReplicationMetadata: json['dataReplicationMetadata'] != null
          ? DataReplicationMetadataOutput.fromJson(
              json['dataReplicationMetadata'] as Map<String, dynamic>)
          : null,
      dataReplicationMode:
          (json['dataReplicationMode'] as String?)?.toDataReplicationMode(),
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
      pendingDataReplicationMetadata: json['pendingDataReplicationMetadata'] !=
              null
          ? DataReplicationMetadataOutput.fromJson(
              json['pendingDataReplicationMetadata'] as Map<String, dynamic>)
          : null,
      pendingDataReplicationMode:
          (json['pendingDataReplicationMode'] as String?)
              ?.toDataReplicationMode(),
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

  Map<String, dynamic> toJson() {
    final actionsRequired = this.actionsRequired;
    final authenticationStrategy = this.authenticationStrategy;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final brokerArn = this.brokerArn;
    final brokerId = this.brokerId;
    final brokerInstances = this.brokerInstances;
    final brokerName = this.brokerName;
    final brokerState = this.brokerState;
    final configurations = this.configurations;
    final created = this.created;
    final dataReplicationMetadata = this.dataReplicationMetadata;
    final dataReplicationMode = this.dataReplicationMode;
    final deploymentMode = this.deploymentMode;
    final encryptionOptions = this.encryptionOptions;
    final engineType = this.engineType;
    final engineVersion = this.engineVersion;
    final hostInstanceType = this.hostInstanceType;
    final ldapServerMetadata = this.ldapServerMetadata;
    final logs = this.logs;
    final maintenanceWindowStartTime = this.maintenanceWindowStartTime;
    final pendingAuthenticationStrategy = this.pendingAuthenticationStrategy;
    final pendingDataReplicationMetadata = this.pendingDataReplicationMetadata;
    final pendingDataReplicationMode = this.pendingDataReplicationMode;
    final pendingEngineVersion = this.pendingEngineVersion;
    final pendingHostInstanceType = this.pendingHostInstanceType;
    final pendingLdapServerMetadata = this.pendingLdapServerMetadata;
    final pendingSecurityGroups = this.pendingSecurityGroups;
    final publiclyAccessible = this.publiclyAccessible;
    final securityGroups = this.securityGroups;
    final storageType = this.storageType;
    final subnetIds = this.subnetIds;
    final tags = this.tags;
    final users = this.users;
    return {
      if (actionsRequired != null) 'actionsRequired': actionsRequired,
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
      if (autoMinorVersionUpgrade != null)
        'autoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (brokerArn != null) 'brokerArn': brokerArn,
      if (brokerId != null) 'brokerId': brokerId,
      if (brokerInstances != null) 'brokerInstances': brokerInstances,
      if (brokerName != null) 'brokerName': brokerName,
      if (brokerState != null) 'brokerState': brokerState.toValue(),
      if (configurations != null) 'configurations': configurations,
      if (created != null) 'created': iso8601ToJson(created),
      if (dataReplicationMetadata != null)
        'dataReplicationMetadata': dataReplicationMetadata,
      if (dataReplicationMode != null)
        'dataReplicationMode': dataReplicationMode.toValue(),
      if (deploymentMode != null) 'deploymentMode': deploymentMode.toValue(),
      if (encryptionOptions != null) 'encryptionOptions': encryptionOptions,
      if (engineType != null) 'engineType': engineType.toValue(),
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (hostInstanceType != null) 'hostInstanceType': hostInstanceType,
      if (ldapServerMetadata != null) 'ldapServerMetadata': ldapServerMetadata,
      if (logs != null) 'logs': logs,
      if (maintenanceWindowStartTime != null)
        'maintenanceWindowStartTime': maintenanceWindowStartTime,
      if (pendingAuthenticationStrategy != null)
        'pendingAuthenticationStrategy':
            pendingAuthenticationStrategy.toValue(),
      if (pendingDataReplicationMetadata != null)
        'pendingDataReplicationMetadata': pendingDataReplicationMetadata,
      if (pendingDataReplicationMode != null)
        'pendingDataReplicationMode': pendingDataReplicationMode.toValue(),
      if (pendingEngineVersion != null)
        'pendingEngineVersion': pendingEngineVersion,
      if (pendingHostInstanceType != null)
        'pendingHostInstanceType': pendingHostInstanceType,
      if (pendingLdapServerMetadata != null)
        'pendingLdapServerMetadata': pendingLdapServerMetadata,
      if (pendingSecurityGroups != null)
        'pendingSecurityGroups': pendingSecurityGroups,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (storageType != null) 'storageType': storageType.toValue(),
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
      if (users != null) 'users': users,
    };
  }
}

class DescribeConfigurationResponse {
  /// Required. The ARN of the configuration.
  final String? arn;

  /// Optional. The authentication strategy associated with the configuration. The
  /// default is SIMPLE.
  final AuthenticationStrategy? authenticationStrategy;

  /// Required. The date and time of the configuration revision.
  final DateTime? created;

  /// Required. The description of the configuration.
  final String? description;

  /// Required. The type of broker engine. Currently, Amazon MQ supports ACTIVEMQ
  /// and RABBITMQ.
  final EngineType? engineType;

  /// Required. The broker engine's version. For a list of supported engine
  /// versions, see, <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html">Supported
  /// engines</a>.
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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authenticationStrategy = this.authenticationStrategy;
    final created = this.created;
    final description = this.description;
    final engineType = this.engineType;
    final engineVersion = this.engineVersion;
    final id = this.id;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
      if (created != null) 'created': iso8601ToJson(created),
      if (description != null) 'description': description,
      if (engineType != null) 'engineType': engineType.toValue(),
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (id != null) 'id': id,
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class DescribeConfigurationRevisionResponse {
  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String? configurationId;

  /// Required. The date and time of the configuration.
  final DateTime? created;

  /// Amazon MQ for ActiveMQ: the base64-encoded XML configuration. Amazon MQ for
  /// RabbitMQ: base64-encoded Cuttlefish.
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

  Map<String, dynamic> toJson() {
    final configurationId = this.configurationId;
    final created = this.created;
    final data = this.data;
    final description = this.description;
    return {
      if (configurationId != null) 'configurationId': configurationId,
      if (created != null) 'created': iso8601ToJson(created),
      if (data != null) 'data': data,
      if (description != null) 'description': description,
    };
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

  /// Describes whether the user is intended for data replication
  final bool? replicationUser;

  /// Required. The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 2-100 characters long.
  final String? username;

  DescribeUserResponse({
    this.brokerId,
    this.consoleAccess,
    this.groups,
    this.pending,
    this.replicationUser,
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
      replicationUser: json['replicationUser'] as bool?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final brokerId = this.brokerId;
    final consoleAccess = this.consoleAccess;
    final groups = this.groups;
    final pending = this.pending;
    final replicationUser = this.replicationUser;
    final username = this.username;
    return {
      if (brokerId != null) 'brokerId': brokerId,
      if (consoleAccess != null) 'consoleAccess': consoleAccess,
      if (groups != null) 'groups': groups,
      if (pending != null) 'pending': pending,
      if (replicationUser != null) 'replicationUser': replicationUser,
      if (username != null) 'username': username,
    };
  }
}

/// Encryption options for the broker.
class EncryptionOptions {
  /// Enables the use of an Amazon Web Services owned CMK using KMS (KMS). Set to
  /// true by default, if no value is provided, for example, for RabbitMQ brokers.
  final bool useAwsOwnedKey;

  /// The customer master key (CMK) to use for the A KMS (KMS). This key is used
  /// to encrypt your data at rest. If not provided, Amazon MQ will use a default
  /// CMK to encrypt your data.
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

/// The type of broker engine. Amazon MQ supports ActiveMQ and RabbitMQ.
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

/// Optional. The metadata of the LDAP server used to authenticate and authorize
/// connections to the broker.
/// <important>
/// Does not apply to RabbitMQ brokers.
/// </important>
class LdapServerMetadataInput {
  /// Specifies the location of the LDAP server such as Directory Service for
  /// Microsoft Active Directory. Optional failover server.
  final List<String> hosts;

  /// The distinguished name of the node in the directory information tree (DIT)
  /// to search for roles or groups. For example, ou=group, ou=corp, dc=corp,
  /// dc=example, dc=com.
  final String roleBase;

  /// The LDAP search filter used to find roles within the roleBase. The
  /// distinguished name of the user matched by userSearchMatching is substituted
  /// into the {0} placeholder in the search filter. The client's username is
  /// substituted into the {1} placeholder. For example, if you set this option to
  /// (member=uid={1})for the user janedoe, the search filter becomes
  /// (member=uid=janedoe) after string substitution. It matches all role entries
  /// that have a member attribute equal to uid=janedoe under the subtree selected
  /// by the roleBase.
  final String roleSearchMatching;

  /// Service account password. A service account is an account in your LDAP
  /// server that has access to initiate a connection. For example,
  /// cn=admin,dc=corp, dc=example,
  /// dc=com.
  final String serviceAccountPassword;

  /// Service account username. A service account is an account in your LDAP
  /// server that has access to initiate a connection. For example,
  /// cn=admin,dc=corp, dc=example,
  /// dc=com.
  final String serviceAccountUsername;

  /// Select a particular subtree of the directory information tree (DIT) to
  /// search for user entries. The subtree is specified by a DN, which specifies
  /// the base node of the subtree. For example, by setting this option to
  /// ou=Users,ou=corp, dc=corp,
  /// dc=example, dc=com, the search for user entries is restricted to the subtree
  /// beneath ou=Users, ou=corp, dc=corp, dc=example, dc=com.
  final String userBase;

  /// The LDAP search filter used to find users within the userBase. The client's
  /// username is substituted into the {0} placeholder in the search filter. For
  /// example, if this option is set to (uid={0}) and the received username is
  /// janedoe, the search filter becomes (uid=janedoe) after string substitution.
  /// It will result in matching an entry like uid=janedoe, ou=Users,ou=corp,
  /// dc=corp, dc=example,
  /// dc=com.
  final String userSearchMatching;

  /// Specifies the LDAP attribute that identifies the group name attribute in the
  /// object returned from the group membership query.
  final String? roleName;

  /// The directory search scope for the role. If set to true, scope is to search
  /// the entire subtree.
  final bool? roleSearchSubtree;

  /// Specifies the name of the LDAP attribute for the user group membership.
  final String? userRoleName;

  /// The directory search scope for the user. If set to true, scope is to search
  /// the entire subtree.
  final bool? userSearchSubtree;

  LdapServerMetadataInput({
    required this.hosts,
    required this.roleBase,
    required this.roleSearchMatching,
    required this.serviceAccountPassword,
    required this.serviceAccountUsername,
    required this.userBase,
    required this.userSearchMatching,
    this.roleName,
    this.roleSearchSubtree,
    this.userRoleName,
    this.userSearchSubtree,
  });

  Map<String, dynamic> toJson() {
    final hosts = this.hosts;
    final roleBase = this.roleBase;
    final roleSearchMatching = this.roleSearchMatching;
    final serviceAccountPassword = this.serviceAccountPassword;
    final serviceAccountUsername = this.serviceAccountUsername;
    final userBase = this.userBase;
    final userSearchMatching = this.userSearchMatching;
    final roleName = this.roleName;
    final roleSearchSubtree = this.roleSearchSubtree;
    final userRoleName = this.userRoleName;
    final userSearchSubtree = this.userSearchSubtree;
    return {
      'hosts': hosts,
      'roleBase': roleBase,
      'roleSearchMatching': roleSearchMatching,
      'serviceAccountPassword': serviceAccountPassword,
      'serviceAccountUsername': serviceAccountUsername,
      'userBase': userBase,
      'userSearchMatching': userSearchMatching,
      if (roleName != null) 'roleName': roleName,
      if (roleSearchSubtree != null) 'roleSearchSubtree': roleSearchSubtree,
      if (userRoleName != null) 'userRoleName': userRoleName,
      if (userSearchSubtree != null) 'userSearchSubtree': userSearchSubtree,
    };
  }
}

/// Optional. The metadata of the LDAP server used to authenticate and authorize
/// connections to the broker.
class LdapServerMetadataOutput {
  /// Specifies the location of the LDAP server such as Directory Service for
  /// Microsoft Active Directory. Optional failover server.
  final List<String> hosts;

  /// The distinguished name of the node in the directory information tree (DIT)
  /// to search for roles or groups. For example, ou=group, ou=corp, dc=corp,
  /// dc=example, dc=com.
  final String roleBase;

  /// The LDAP search filter used to find roles within the roleBase. The
  /// distinguished name of the user matched by userSearchMatching is substituted
  /// into the {0} placeholder in the search filter. The client's username is
  /// substituted into the {1} placeholder. For example, if you set this option to
  /// (member=uid={1})for the user janedoe, the search filter becomes
  /// (member=uid=janedoe) after string substitution. It matches all role entries
  /// that have a member attribute equal to uid=janedoe under the subtree selected
  /// by the roleBase.
  final String roleSearchMatching;

  /// Service account username. A service account is an account in your LDAP
  /// server that has access to initiate a connection. For example,
  /// cn=admin,dc=corp, dc=example,
  /// dc=com.
  final String serviceAccountUsername;

  /// Select a particular subtree of the directory information tree (DIT) to
  /// search for user entries. The subtree is specified by a DN, which specifies
  /// the base node of the subtree. For example, by setting this option to
  /// ou=Users,ou=corp, dc=corp,
  /// dc=example, dc=com, the search for user entries is restricted to the subtree
  /// beneath ou=Users, ou=corp, dc=corp, dc=example, dc=com.
  final String userBase;

  /// The LDAP search filter used to find users within the userBase. The client's
  /// username is substituted into the {0} placeholder in the search filter. For
  /// example, if this option is set to (uid={0}) and the received username is
  /// janedoe, the search filter becomes (uid=janedoe) after string substitution.
  /// It will result in matching an entry like uid=janedoe, ou=Users,ou=corp,
  /// dc=corp, dc=example,
  /// dc=com.
  final String userSearchMatching;

  /// Specifies the LDAP attribute that identifies the group name attribute in the
  /// object returned from the group membership query.
  final String? roleName;

  /// The directory search scope for the role. If set to true, scope is to search
  /// the entire subtree.
  final bool? roleSearchSubtree;

  /// Specifies the name of the LDAP attribute for the user group membership.
  final String? userRoleName;

  /// The directory search scope for the user. If set to true, scope is to search
  /// the entire subtree.
  final bool? userSearchSubtree;

  LdapServerMetadataOutput({
    required this.hosts,
    required this.roleBase,
    required this.roleSearchMatching,
    required this.serviceAccountUsername,
    required this.userBase,
    required this.userSearchMatching,
    this.roleName,
    this.roleSearchSubtree,
    this.userRoleName,
    this.userSearchSubtree,
  });

  factory LdapServerMetadataOutput.fromJson(Map<String, dynamic> json) {
    return LdapServerMetadataOutput(
      hosts: (json['hosts'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      roleBase: json['roleBase'] as String,
      roleSearchMatching: json['roleSearchMatching'] as String,
      serviceAccountUsername: json['serviceAccountUsername'] as String,
      userBase: json['userBase'] as String,
      userSearchMatching: json['userSearchMatching'] as String,
      roleName: json['roleName'] as String?,
      roleSearchSubtree: json['roleSearchSubtree'] as bool?,
      userRoleName: json['userRoleName'] as String?,
      userSearchSubtree: json['userSearchSubtree'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final hosts = this.hosts;
    final roleBase = this.roleBase;
    final roleSearchMatching = this.roleSearchMatching;
    final serviceAccountUsername = this.serviceAccountUsername;
    final userBase = this.userBase;
    final userSearchMatching = this.userSearchMatching;
    final roleName = this.roleName;
    final roleSearchSubtree = this.roleSearchSubtree;
    final userRoleName = this.userRoleName;
    final userSearchSubtree = this.userSearchSubtree;
    return {
      'hosts': hosts,
      'roleBase': roleBase,
      'roleSearchMatching': roleSearchMatching,
      'serviceAccountUsername': serviceAccountUsername,
      'userBase': userBase,
      'userSearchMatching': userSearchMatching,
      if (roleName != null) 'roleName': roleName,
      if (roleSearchSubtree != null) 'roleSearchSubtree': roleSearchSubtree,
      if (userRoleName != null) 'userRoleName': userRoleName,
      if (userSearchSubtree != null) 'userSearchSubtree': userSearchSubtree,
    };
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

  Map<String, dynamic> toJson() {
    final brokerSummaries = this.brokerSummaries;
    final nextToken = this.nextToken;
    return {
      if (brokerSummaries != null) 'brokerSummaries': brokerSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final configurationId = this.configurationId;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    final revisions = this.revisions;
    return {
      if (configurationId != null) 'configurationId': configurationId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (revisions != null) 'revisions': revisions,
    };
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

  Map<String, dynamic> toJson() {
    final configurations = this.configurations;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      if (configurations != null) 'configurations': configurations,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
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

  /// Required. The list of all ActiveMQ usernames for the specified broker. Does
  /// not apply to RabbitMQ brokers.
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

  Map<String, dynamic> toJson() {
    final brokerId = this.brokerId;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (brokerId != null) 'brokerId': brokerId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (users != null) 'users': users,
    };
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
  /// Enables general logging.
  final bool general;

  /// The location of the CloudWatch Logs log group where general logs are sent.
  final String generalLogGroup;

  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged.
  final bool? audit;

  /// The location of the CloudWatch Logs log group where audit logs are sent.
  final String? auditLogGroup;

  /// The list of information about logs pending to be deployed for the specified
  /// broker.
  final PendingLogs? pending;

  LogsSummary({
    required this.general,
    required this.generalLogGroup,
    this.audit,
    this.auditLogGroup,
    this.pending,
  });

  factory LogsSummary.fromJson(Map<String, dynamic> json) {
    return LogsSummary(
      general: json['general'] as bool,
      generalLogGroup: json['generalLogGroup'] as String,
      audit: json['audit'] as bool?,
      auditLogGroup: json['auditLogGroup'] as String?,
      pending: json['pending'] != null
          ? PendingLogs.fromJson(json['pending'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final general = this.general;
    final generalLogGroup = this.generalLogGroup;
    final audit = this.audit;
    final auditLogGroup = this.auditLogGroup;
    final pending = this.pending;
    return {
      'general': general,
      'generalLogGroup': generalLogGroup,
      if (audit != null) 'audit': audit,
      if (auditLogGroup != null) 'auditLogGroup': auditLogGroup,
      if (pending != null) 'pending': pending,
    };
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

  Map<String, dynamic> toJson() {
    final audit = this.audit;
    final general = this.general;
    return {
      if (audit != null) 'audit': audit,
      if (general != null) 'general': general,
    };
  }
}

/// The Promote mode requested.
enum PromoteMode {
  switchover,
  failover,
}

extension PromoteModeValueExtension on PromoteMode {
  String toValue() {
    switch (this) {
      case PromoteMode.switchover:
        return 'SWITCHOVER';
      case PromoteMode.failover:
        return 'FAILOVER';
    }
  }
}

extension PromoteModeFromString on String {
  PromoteMode toPromoteMode() {
    switch (this) {
      case 'SWITCHOVER':
        return PromoteMode.switchover;
      case 'FAILOVER':
        return PromoteMode.failover;
    }
    throw Exception('$this is not known in enum PromoteMode');
  }
}

class PromoteResponse {
  /// The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  PromoteResponse({
    this.brokerId,
  });

  factory PromoteResponse.fromJson(Map<String, dynamic> json) {
    return PromoteResponse(
      brokerId: json['brokerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final brokerId = this.brokerId;
    return {
      if (brokerId != null) 'brokerId': brokerId,
    };
  }
}

class RebootBrokerResponse {
  RebootBrokerResponse();

  factory RebootBrokerResponse.fromJson(Map<String, dynamic> _) {
    return RebootBrokerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Returns information about the configuration element or attribute that was
/// sanitized in the configuration.
class SanitizationWarning {
  /// The reason for which the configuration elements or attributes were
  /// sanitized.
  final SanitizationWarningReason reason;

  /// The name of the configuration attribute that has been sanitized.
  final String? attributeName;

  /// The name of the configuration element that has been sanitized.
  final String? elementName;

  SanitizationWarning({
    required this.reason,
    this.attributeName,
    this.elementName,
  });

  factory SanitizationWarning.fromJson(Map<String, dynamic> json) {
    return SanitizationWarning(
      reason: (json['reason'] as String).toSanitizationWarningReason(),
      attributeName: json['attributeName'] as String?,
      elementName: json['elementName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final attributeName = this.attributeName;
    final elementName = this.elementName;
    return {
      'reason': reason.toValue(),
      if (attributeName != null) 'attributeName': attributeName,
      if (elementName != null) 'elementName': elementName,
    };
  }
}

/// The reason for which the configuration elements or attributes were
/// sanitized.
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
  /// Optional. The authentication strategy used to secure the broker. The default
  /// is SIMPLE.
  final AuthenticationStrategy? authenticationStrategy;

  /// The new boolean value that specifies whether broker engines automatically
  /// upgrade to new minor versions as new versions are released and supported by
  /// Amazon MQ.
  final bool? autoMinorVersionUpgrade;

  /// Required. The unique ID that Amazon MQ generates for the broker.
  final String? brokerId;

  /// The ID of the updated configuration.
  final ConfigurationId? configuration;

  /// The replication details of the data replication-enabled broker. Only
  /// returned if dataReplicationMode is set to CRDR.
  final DataReplicationMetadataOutput? dataReplicationMetadata;

  /// Describes whether this broker is a part of a data replication pair.
  final DataReplicationMode? dataReplicationMode;

  /// The broker engine version to upgrade to. For a list of supported engine
  /// versions, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker-engine.html">Supported
  /// engines</a>.
  final String? engineVersion;

  /// The broker's host instance type to upgrade to. For a list of supported
  /// instance types, see <a
  /// href="https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/broker.html#broker-instance-types">Broker
  /// instance types</a>.
  final String? hostInstanceType;

  /// Optional. The metadata of the LDAP server used to authenticate and authorize
  /// connections to the broker. Does not apply to RabbitMQ brokers.
  final LdapServerMetadataOutput? ldapServerMetadata;

  /// The list of information about logs to be enabled for the specified broker.
  final Logs? logs;

  /// The parameters that determine the WeeklyStartTime.
  final WeeklyStartTime? maintenanceWindowStartTime;

  /// The pending replication details of the data replication-enabled broker. Only
  /// returned if pendingDataReplicationMode is set to CRDR.
  final DataReplicationMetadataOutput? pendingDataReplicationMetadata;

  /// Describes whether this broker will be a part of a data replication pair
  /// after reboot.
  final DataReplicationMode? pendingDataReplicationMode;

  /// The list of security groups (1 minimum, 5 maximum) that authorizes
  /// connections to brokers.
  final List<String>? securityGroups;

  UpdateBrokerResponse({
    this.authenticationStrategy,
    this.autoMinorVersionUpgrade,
    this.brokerId,
    this.configuration,
    this.dataReplicationMetadata,
    this.dataReplicationMode,
    this.engineVersion,
    this.hostInstanceType,
    this.ldapServerMetadata,
    this.logs,
    this.maintenanceWindowStartTime,
    this.pendingDataReplicationMetadata,
    this.pendingDataReplicationMode,
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
      dataReplicationMetadata: json['dataReplicationMetadata'] != null
          ? DataReplicationMetadataOutput.fromJson(
              json['dataReplicationMetadata'] as Map<String, dynamic>)
          : null,
      dataReplicationMode:
          (json['dataReplicationMode'] as String?)?.toDataReplicationMode(),
      engineVersion: json['engineVersion'] as String?,
      hostInstanceType: json['hostInstanceType'] as String?,
      ldapServerMetadata: json['ldapServerMetadata'] != null
          ? LdapServerMetadataOutput.fromJson(
              json['ldapServerMetadata'] as Map<String, dynamic>)
          : null,
      logs: json['logs'] != null
          ? Logs.fromJson(json['logs'] as Map<String, dynamic>)
          : null,
      maintenanceWindowStartTime: json['maintenanceWindowStartTime'] != null
          ? WeeklyStartTime.fromJson(
              json['maintenanceWindowStartTime'] as Map<String, dynamic>)
          : null,
      pendingDataReplicationMetadata: json['pendingDataReplicationMetadata'] !=
              null
          ? DataReplicationMetadataOutput.fromJson(
              json['pendingDataReplicationMetadata'] as Map<String, dynamic>)
          : null,
      pendingDataReplicationMode:
          (json['pendingDataReplicationMode'] as String?)
              ?.toDataReplicationMode(),
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationStrategy = this.authenticationStrategy;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final brokerId = this.brokerId;
    final configuration = this.configuration;
    final dataReplicationMetadata = this.dataReplicationMetadata;
    final dataReplicationMode = this.dataReplicationMode;
    final engineVersion = this.engineVersion;
    final hostInstanceType = this.hostInstanceType;
    final ldapServerMetadata = this.ldapServerMetadata;
    final logs = this.logs;
    final maintenanceWindowStartTime = this.maintenanceWindowStartTime;
    final pendingDataReplicationMetadata = this.pendingDataReplicationMetadata;
    final pendingDataReplicationMode = this.pendingDataReplicationMode;
    final securityGroups = this.securityGroups;
    return {
      if (authenticationStrategy != null)
        'authenticationStrategy': authenticationStrategy.toValue(),
      if (autoMinorVersionUpgrade != null)
        'autoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (brokerId != null) 'brokerId': brokerId,
      if (configuration != null) 'configuration': configuration,
      if (dataReplicationMetadata != null)
        'dataReplicationMetadata': dataReplicationMetadata,
      if (dataReplicationMode != null)
        'dataReplicationMode': dataReplicationMode.toValue(),
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (hostInstanceType != null) 'hostInstanceType': hostInstanceType,
      if (ldapServerMetadata != null) 'ldapServerMetadata': ldapServerMetadata,
      if (logs != null) 'logs': logs,
      if (maintenanceWindowStartTime != null)
        'maintenanceWindowStartTime': maintenanceWindowStartTime,
      if (pendingDataReplicationMetadata != null)
        'pendingDataReplicationMetadata': pendingDataReplicationMetadata,
      if (pendingDataReplicationMode != null)
        'pendingDataReplicationMode': pendingDataReplicationMode.toValue(),
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
  }
}

class UpdateConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String? arn;

  /// Required. The date and time of the configuration.
  final DateTime? created;

  /// The unique ID that Amazon MQ generates for the configuration.
  final String? id;

  /// The latest revision of the configuration.
  final ConfigurationRevision? latestRevision;

  /// The name of the configuration. This value can contain only alphanumeric
  /// characters, dashes, periods, underscores, and tildes (- . _ ~). This value
  /// must be 1-150 characters long.
  final String? name;

  /// The list of the first 20 warnings about the configuration elements or
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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final created = this.created;
    final id = this.id;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final warnings = this.warnings;
    return {
      if (arn != null) 'arn': arn,
      if (created != null) 'created': iso8601ToJson(created),
      if (id != null) 'id': id,
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

class UpdateUserResponse {
  UpdateUserResponse();

  factory UpdateUserResponse.fromJson(Map<String, dynamic> _) {
    return UpdateUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A user associated with the broker. For Amazon MQ for RabbitMQ brokers, one
/// and only one administrative user is accepted and created when a broker is
/// first provisioned. All subsequent broker users are created by making
/// RabbitMQ API calls directly to brokers or via the RabbitMQ web console.
class User {
  /// Required. The password of the user. This value must be at least 12
  /// characters long, must contain at least 4 unique characters, and must not
  /// contain commas, colons, or equal signs (,:=).
  final String password;

  /// The username of the broker user. The following restrictions apply to broker
  /// usernames:
  ///
  /// <ul>
  /// <li>
  /// For Amazon MQ for ActiveMQ brokers, this value can contain only alphanumeric
  /// characters, dashes, periods, underscores, and tildes (- . _ ~). This value
  /// must be 2-100 characters long.
  /// </li>
  /// <li>
  /// para>For Amazon MQ for RabbitMQ brokers, this value can contain only
  /// alphanumeric characters, dashes, periods, underscores (- . _). This value
  /// must not contain a tilde (~) character. Amazon MQ prohibts using guest as a
  /// valid usename. This value must be 2-100 characters long.
  /// </para></li>
  /// </ul> <important>
  /// Do not add personally identifiable information (PII) or other confidential
  /// or sensitive information in broker usernames. Broker usernames are
  /// accessible to other Amazon Web Services services, including CloudWatch Logs.
  /// Broker usernames are not intended to be used for private or sensitive data.
  /// </important>
  final String username;

  /// Enables access to the ActiveMQ Web Console for the ActiveMQ user. Does not
  /// apply to RabbitMQ brokers.
  final bool? consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
  /// Does not apply to RabbitMQ brokers.
  final List<String>? groups;

  /// Defines if this user is intended for CRDR replication purposes.
  final bool? replicationUser;

  User({
    required this.password,
    required this.username,
    this.consoleAccess,
    this.groups,
    this.replicationUser,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    final consoleAccess = this.consoleAccess;
    final groups = this.groups;
    final replicationUser = this.replicationUser;
    return {
      'password': password,
      'username': username,
      if (consoleAccess != null) 'consoleAccess': consoleAccess,
      if (groups != null) 'groups': groups,
      if (replicationUser != null) 'replicationUser': replicationUser,
    };
  }
}

/// Returns information about the status of the changes pending for the ActiveMQ
/// user.
class UserPendingChanges {
  /// Required. The type of change pending for the ActiveMQ user.
  final ChangeType pendingChange;

  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  final bool? consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
  final List<String>? groups;

  UserPendingChanges({
    required this.pendingChange,
    this.consoleAccess,
    this.groups,
  });

  factory UserPendingChanges.fromJson(Map<String, dynamic> json) {
    return UserPendingChanges(
      pendingChange: (json['pendingChange'] as String).toChangeType(),
      consoleAccess: json['consoleAccess'] as bool?,
      groups: (json['groups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pendingChange = this.pendingChange;
    final consoleAccess = this.consoleAccess;
    final groups = this.groups;
    return {
      'pendingChange': pendingChange.toValue(),
      if (consoleAccess != null) 'consoleAccess': consoleAccess,
      if (groups != null) 'groups': groups,
    };
  }
}

/// Returns a list of all broker users. Does not apply to RabbitMQ brokers.
class UserSummary {
  /// Required. The username of the broker user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
  /// This value must be 2-100 characters long.
  final String username;

  /// The type of change pending for the broker user.
  final ChangeType? pendingChange;

  UserSummary({
    required this.username,
    this.pendingChange,
  });

  factory UserSummary.fromJson(Map<String, dynamic> json) {
    return UserSummary(
      username: json['username'] as String,
      pendingChange: (json['pendingChange'] as String?)?.toChangeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final username = this.username;
    final pendingChange = this.pendingChange;
    return {
      'username': username,
      if (pendingChange != null) 'pendingChange': pendingChange.toValue(),
    };
  }
}

/// The scheduled time period relative to UTC during which Amazon MQ begins to
/// apply pending updates or patches to the broker.
class WeeklyStartTime {
  /// Required. The day of the week.
  final DayOfWeek dayOfWeek;

  /// Required. The time, in 24-hour format.
  final String timeOfDay;

  /// The time zone, UTC by default, in either the Country/City format, or the UTC
  /// offset format.
  final String? timeZone;

  WeeklyStartTime({
    required this.dayOfWeek,
    required this.timeOfDay,
    this.timeZone,
  });

  factory WeeklyStartTime.fromJson(Map<String, dynamic> json) {
    return WeeklyStartTime(
      dayOfWeek: (json['dayOfWeek'] as String).toDayOfWeek(),
      timeOfDay: json['timeOfDay'] as String,
      timeZone: json['timeZone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfWeek = this.dayOfWeek;
    final timeOfDay = this.timeOfDay;
    final timeZone = this.timeZone;
    return {
      'dayOfWeek': dayOfWeek.toValue(),
      'timeOfDay': timeOfDay,
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
