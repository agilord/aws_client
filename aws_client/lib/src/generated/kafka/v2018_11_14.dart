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

import 'v2018_11_14.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// The operations for managing an Amazon MSK cluster.
class Kafka {
  final _s.RestJsonProtocol _protocol;
  factory Kafka({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'kafka',
    );
    return Kafka._(
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
  Kafka._({
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

  /// Associates one or more Scram Secrets with an Amazon MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  /// Parameter [secretArnList] :
  /// List of AWS Secrets Manager secret ARNs.
  Future<BatchAssociateScramSecretResponse> batchAssociateScramSecret({
    required String clusterArn,
    required List<String> secretArnList,
  }) async {
    final $payload = <String, dynamic>{
      'secretArnList': secretArnList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/scram-secrets',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAssociateScramSecretResponse.fromJson(response);
  }

  /// Disassociates one or more Scram Secrets from an Amazon MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  /// Parameter [secretArnList] :
  /// List of AWS Secrets Manager secret ARNs.
  Future<BatchDisassociateScramSecretResponse> batchDisassociateScramSecret({
    required String clusterArn,
    required List<String> secretArnList,
  }) async {
    final $payload = <String, dynamic>{
      'secretArnList': secretArnList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/scram-secrets',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisassociateScramSecretResponse.fromJson(response);
  }

  /// Creates a new MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [brokerNodeGroupInfo] :
  /// Information about the broker nodes in the cluster.
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster.
  ///
  /// Parameter [kafkaVersion] :
  /// The version of Apache Kafka.
  ///
  /// Parameter [numberOfBrokerNodes] :
  /// The number of broker nodes in the cluster.
  ///
  /// Parameter [clientAuthentication] :
  /// Includes all client authentication related information.
  ///
  /// Parameter [configurationInfo] :
  /// Represents the configuration that you want MSK to use for the brokers in a
  /// cluster.
  ///
  /// Parameter [encryptionInfo] :
  /// Includes all encryption-related information.
  ///
  /// Parameter [enhancedMonitoring] :
  /// Specifies the level of monitoring for the MSK cluster. The possible values
  /// are DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and
  /// PER_TOPIC_PER_PARTITION.
  ///
  /// Parameter [openMonitoring] :
  /// The settings for open monitoring.
  ///
  /// Parameter [rebalancing] :
  /// Specifies if intelligent rebalancing should be turned on for the new MSK
  /// Provisioned cluster with Express brokers. By default, intelligent
  /// rebalancing status is ACTIVE for all new clusters.
  ///
  /// Parameter [storageMode] :
  /// This controls storage mode for supported storage tiers.
  ///
  /// Parameter [tags] :
  /// Create tags when creating the cluster.
  Future<CreateClusterResponse> createCluster({
    required BrokerNodeGroupInfo brokerNodeGroupInfo,
    required String clusterName,
    required String kafkaVersion,
    required int numberOfBrokerNodes,
    ClientAuthentication? clientAuthentication,
    ConfigurationInfo? configurationInfo,
    EncryptionInfo? encryptionInfo,
    EnhancedMonitoring? enhancedMonitoring,
    LoggingInfo? loggingInfo,
    OpenMonitoringInfo? openMonitoring,
    Rebalancing? rebalancing,
    StorageMode? storageMode,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'numberOfBrokerNodes',
      numberOfBrokerNodes,
      1,
      15,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'brokerNodeGroupInfo': brokerNodeGroupInfo,
      'clusterName': clusterName,
      'kafkaVersion': kafkaVersion,
      'numberOfBrokerNodes': numberOfBrokerNodes,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (configurationInfo != null) 'configurationInfo': configurationInfo,
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.value,
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
      if (rebalancing != null) 'rebalancing': rebalancing,
      if (storageMode != null) 'storageMode': storageMode.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/clusters',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClusterResponse.fromJson(response);
  }

  /// Creates a new MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster.
  ///
  /// Parameter [provisioned] :
  /// Information about the provisioned cluster.
  ///
  /// Parameter [serverless] :
  /// Information about the serverless cluster.
  ///
  /// Parameter [tags] :
  /// A map of tags that you want the cluster to have.
  Future<CreateClusterV2Response> createClusterV2({
    required String clusterName,
    ProvisionedRequest? provisioned,
    ServerlessRequest? serverless,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clusterName': clusterName,
      if (provisioned != null) 'provisioned': provisioned,
      if (serverless != null) 'serverless': serverless,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/api/v2/clusters',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClusterV2Response.fromJson(response);
  }

  /// Creates a new MSK configuration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [name] :
  /// The name of the configuration.
  ///
  /// Parameter [serverProperties] :
  /// Contents of the <filename>server.properties</filename> file. When using
  /// the API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the
  /// contents of <filename>server.properties</filename> can be in plaintext.
  ///
  /// Parameter [description] :
  /// The description of the configuration.
  ///
  /// Parameter [kafkaVersions] :
  /// The versions of Apache Kafka with which you can use this MSK
  /// configuration.
  Future<CreateConfigurationResponse> createConfiguration({
    required String name,
    required Uint8List serverProperties,
    String? description,
    List<String>? kafkaVersions,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'serverProperties': base64Encode(serverProperties),
      if (description != null) 'description': description,
      if (kafkaVersions != null) 'kafkaVersions': kafkaVersions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfigurationResponse.fromJson(response);
  }

  /// Creates the replicator.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [kafkaClusters] :
  /// Kafka Clusters to use in setting up sources / targets for replication.
  ///
  /// Parameter [replicationInfoList] :
  /// A list of replication configurations, where each configuration targets a
  /// given source cluster to target cluster replication flow.
  ///
  /// Parameter [replicatorName] :
  /// The name of the replicator. Alpha-numeric characters with '-' are allowed.
  ///
  /// Parameter [serviceExecutionRoleArn] :
  /// The ARN of the IAM role used by the replicator to access resources in the
  /// customer's account (e.g source and target clusters)
  ///
  /// Parameter [description] :
  /// A summary description of the replicator.
  ///
  /// Parameter [logDelivery] :
  /// Configuration for delivering replicator logs to customer destinations.
  ///
  /// Parameter [tags] :
  /// List of tags to attach to created Replicator.
  Future<CreateReplicatorResponse> createReplicator({
    required List<KafkaCluster> kafkaClusters,
    required List<ReplicationInfo> replicationInfoList,
    required String replicatorName,
    required String serviceExecutionRoleArn,
    String? description,
    LogDelivery? logDelivery,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'kafkaClusters': kafkaClusters,
      'replicationInfoList': replicationInfoList,
      'replicatorName': replicatorName,
      'serviceExecutionRoleArn': serviceExecutionRoleArn,
      if (description != null) 'description': description,
      if (logDelivery != null) 'logDelivery': logDelivery,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/replication/v1/replicators',
      exceptionFnMap: _exceptionFns,
    );
    return CreateReplicatorResponse.fromJson(response);
  }

  /// Creates a topic in the specified MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ClusterConnectivityException].
  /// May throw [ConflictException].
  /// May throw [ControllerMovedException].
  /// May throw [ForbiddenException].
  /// May throw [GroupSubscribedToTopicException].
  /// May throw [InternalServerErrorException].
  /// May throw [KafkaRequestException].
  /// May throw [KafkaTimeoutException].
  /// May throw [NotControllerException].
  /// May throw [ReassignmentInProgressException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [TopicExistsException].
  /// May throw [UnauthorizedException].
  /// May throw [UnknownTopicOrPartitionException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [partitionCount] :
  /// The number of partitions for the topic.
  ///
  /// Parameter [replicationFactor] :
  /// The replication factor for the topic.
  ///
  /// Parameter [topicName] :
  /// The name of the topic to create.
  ///
  /// Parameter [configs] :
  /// Topic configurations encoded as a Base64 string.
  Future<CreateTopicResponse> createTopic({
    required String clusterArn,
    required int partitionCount,
    required int replicationFactor,
    required String topicName,
    String? configs,
  }) async {
    _s.validateNumRange(
      'partitionCount',
      partitionCount,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'replicationFactor',
      replicationFactor,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'partitionCount': partitionCount,
      'replicationFactor': replicationFactor,
      'topicName': topicName,
      if (configs != null) 'configs': configs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/topics',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTopicResponse.fromJson(response);
  }

  /// Creates a new MSK VPC connection.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [authentication] :
  /// The authentication type of VPC connection.
  ///
  /// Parameter [clientSubnets] :
  /// The list of client subnets.
  ///
  /// Parameter [securityGroups] :
  /// The list of security groups.
  ///
  /// Parameter [targetClusterArn] :
  /// The cluster Amazon Resource Name (ARN) for the VPC connection.
  ///
  /// Parameter [vpcId] :
  /// The VPC ID of VPC connection.
  ///
  /// Parameter [tags] :
  /// A map of tags for the VPC connection.
  Future<CreateVpcConnectionResponse> createVpcConnection({
    required String authentication,
    required List<String> clientSubnets,
    required List<String> securityGroups,
    required String targetClusterArn,
    required String vpcId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'authentication': authentication,
      'clientSubnets': clientSubnets,
      'securityGroups': securityGroups,
      'targetClusterArn': targetClusterArn,
      'vpcId': vpcId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/vpc-connection',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVpcConnectionResponse.fromJson(response);
  }

  /// Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the
  /// request.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [currentVersion] :
  /// The current version of the MSK cluster.
  Future<DeleteClusterResponse> deleteCluster({
    required String clusterArn,
    String? currentVersion,
  }) async {
    final $query = <String, List<String>>{
      if (currentVersion != null) 'currentVersion': [currentVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteClusterResponse.fromJson(response);
  }

  /// Deletes the MSK cluster policy specified by the Amazon Resource Name (ARN)
  /// in the request.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster.
  Future<void> deleteClusterPolicy({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an MSK Configuration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration.
  Future<DeleteConfigurationResponse> deleteConfiguration({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/configurations/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConfigurationResponse.fromJson(response);
  }

  /// Deletes a replicator.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [replicatorArn] :
  /// The Amazon Resource Name (ARN) of the replicator to be deleted.
  ///
  /// Parameter [currentVersion] :
  /// The current version of the replicator.
  Future<DeleteReplicatorResponse> deleteReplicator({
    required String replicatorArn,
    String? currentVersion,
  }) async {
    final $query = <String, List<String>>{
      if (currentVersion != null) 'currentVersion': [currentVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/replication/v1/replicators/${Uri.encodeComponent(replicatorArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteReplicatorResponse.fromJson(response);
  }

  /// Deletes a topic in the specified MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ClusterConnectivityException].
  /// May throw [ControllerMovedException].
  /// May throw [ForbiddenException].
  /// May throw [GroupSubscribedToTopicException].
  /// May throw [InternalServerErrorException].
  /// May throw [KafkaRequestException].
  /// May throw [KafkaTimeoutException].
  /// May throw [NotControllerException].
  /// May throw [NotFoundException].
  /// May throw [ReassignmentInProgressException].
  /// May throw [UnknownTopicOrPartitionException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [topicName] :
  /// The name of the topic to delete.
  Future<DeleteTopicResponse> deleteTopic({
    required String clusterArn,
    required String topicName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/topics/${Uri.encodeComponent(topicName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTopicResponse.fromJson(response);
  }

  /// Deletes a MSK VPC connection.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK VPC
  /// connection.
  Future<DeleteVpcConnectionResponse> deleteVpcConnection({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/vpc-connection/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteVpcConnectionResponse.fromJson(response);
  }

  /// Returns a description of the MSK cluster whose Amazon Resource Name (ARN)
  /// is specified in the request.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  Future<DescribeClusterResponse> describeCluster({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterResponse.fromJson(response);
  }

  /// Returns a description of the cluster operation specified by the ARN.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterOperationArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the MSK cluster
  /// operation.
  Future<DescribeClusterOperationResponse> describeClusterOperation({
    required String clusterOperationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/operations/${Uri.encodeComponent(clusterOperationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterOperationResponse.fromJson(response);
  }

  /// Returns a description of the cluster operation specified by the ARN.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterOperationArn] :
  /// ARN of the cluster operation to describe.
  Future<DescribeClusterOperationV2Response> describeClusterOperationV2({
    required String clusterOperationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/v2/operations/${Uri.encodeComponent(clusterOperationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterOperationV2Response.fromJson(response);
  }

  /// Returns a description of the MSK cluster whose Amazon Resource Name (ARN)
  /// is specified in the request.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  Future<DescribeClusterV2Response> describeClusterV2({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v2/clusters/${Uri.encodeComponent(clusterArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterV2Response.fromJson(response);
  }

  /// Returns a description of this MSK configuration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  Future<DescribeConfigurationResponse> describeConfiguration({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/configurations/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConfigurationResponse.fromJson(response);
  }

  /// Returns a description of this revision of the configuration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  /// Parameter [revision] :
  /// A string that uniquely identifies a revision of an MSK configuration.
  Future<DescribeConfigurationRevisionResponse> describeConfigurationRevision({
    required String arn,
    required int revision,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/${Uri.encodeComponent(arn)}/revisions/${Uri.encodeComponent(revision.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConfigurationRevisionResponse.fromJson(response);
  }

  /// Describes a replicator.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [replicatorArn] :
  /// The Amazon Resource Name (ARN) of the replicator to be described.
  Future<DescribeReplicatorResponse> describeReplicator({
    required String replicatorArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/replication/v1/replicators/${Uri.encodeComponent(replicatorArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReplicatorResponse.fromJson(response);
  }

  /// Returns topic details of this topic on a MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [topicName] :
  /// The Kafka topic name that uniquely identifies the topic.
  Future<DescribeTopicResponse> describeTopic({
    required String clusterArn,
    required String topicName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/topics/${Uri.encodeComponent(topicName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTopicResponse.fromJson(response);
  }

  /// Returns partition details of this topic on a MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [topicName] :
  /// The Kafka topic name that uniquely identifies the topic.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<DescribeTopicPartitionsResponse> describeTopicPartitions({
    required String clusterArn,
    required String topicName,
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
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/topics/${Uri.encodeComponent(topicName)}/partitions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTopicPartitionsResponse.fromJson(response);
  }

  /// Returns a description of this MSK VPC connection.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies a MSK VPC
  /// connection.
  Future<DescribeVpcConnectionResponse> describeVpcConnection({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/vpc-connection/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVpcConnectionResponse.fromJson(response);
  }

  /// A list of brokers that a client application can use to bootstrap. This
  /// list doesn't necessarily include all of the brokers in the cluster. The
  /// following Python 3.6 example shows how you can use the Amazon Resource
  /// Name (ARN) of a cluster to get its bootstrap brokers. If you don't know
  /// the ARN of your cluster, you can use the <code>ListClusters</code>
  /// operation to get the ARNs of all the clusters in this account and Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  Future<GetBootstrapBrokersResponse> getBootstrapBrokers({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/bootstrap-brokers',
      exceptionFnMap: _exceptionFns,
    );
    return GetBootstrapBrokersResponse.fromJson(response);
  }

  /// Get the MSK cluster policy specified by the Amazon Resource Name (ARN) in
  /// the request.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster.
  Future<GetClusterPolicyResponse> getClusterPolicy({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetClusterPolicyResponse.fromJson(response);
  }

  /// Gets the Apache Kafka versions to which you can update the MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster check.
  Future<GetCompatibleKafkaVersionsResponse> getCompatibleKafkaVersions({
    String? clusterArn,
  }) async {
    final $query = <String, List<String>>{
      if (clusterArn != null) 'clusterArn': [clusterArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/compatible-kafka-versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCompatibleKafkaVersionsResponse.fromJson(response);
  }

  /// Returns a list of all the VPC connections in this Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<ListClientVpcConnectionsResponse> listClientVpcConnections({
    required String clusterArn,
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
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/client-vpc-connections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClientVpcConnectionsResponse.fromJson(response);
  }

  /// Returns a list of all the operations that have been performed on the
  /// specified MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<ListClusterOperationsResponse> listClusterOperations({
    required String clusterArn,
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
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/operations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClusterOperationsResponse.fromJson(response);
  }

  /// Returns a list of all the operations that have been performed on the
  /// specified MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The arn of the cluster whose operations are being requested.
  ///
  /// Parameter [maxResults] :
  /// The maxResults of the query.
  ///
  /// Parameter [nextToken] :
  /// The nextToken of the query.
  Future<ListClusterOperationsV2Response> listClusterOperationsV2({
    required String clusterArn,
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
          '/api/v2/clusters/${Uri.encodeComponent(clusterArn)}/operations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClusterOperationsV2Response.fromJson(response);
  }

  /// Returns a list of all the MSK clusters in the current Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterNameFilter] :
  /// Specify a prefix of the name of the clusters that you want to list. The
  /// service lists all the clusters whose names start with this prefix.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<ListClustersResponse> listClusters({
    String? clusterNameFilter,
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
      if (clusterNameFilter != null) 'clusterNameFilter': [clusterNameFilter],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/clusters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClustersResponse.fromJson(response);
  }

  /// Returns a list of all the MSK clusters in the current Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterNameFilter] :
  /// Specify a prefix of the names of the clusters that you want to list. The
  /// service lists all the clusters whose names start with this prefix.
  ///
  /// Parameter [clusterTypeFilter] :
  /// Specify either PROVISIONED or SERVERLESS.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<ListClustersV2Response> listClustersV2({
    String? clusterNameFilter,
    String? clusterTypeFilter,
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
      if (clusterNameFilter != null) 'clusterNameFilter': [clusterNameFilter],
      if (clusterTypeFilter != null) 'clusterTypeFilter': [clusterTypeFilter],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v2/clusters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClustersV2Response.fromJson(response);
  }

  /// Returns a list of all the MSK configurations in this Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<ListConfigurationRevisionsResponse> listConfigurationRevisions({
    required String arn,
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
      requestUri: '/v1/configurations/${Uri.encodeComponent(arn)}/revisions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationRevisionsResponse.fromJson(response);
  }

  /// Returns a list of all the MSK configurations in this Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
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

  /// Returns a list of Apache Kafka versions.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<ListKafkaVersionsResponse> listKafkaVersions({
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
      requestUri: '/v1/kafka-versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKafkaVersionsResponse.fromJson(response);
  }

  /// Returns a list of the broker nodes in the cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<ListNodesResponse> listNodes({
    required String clusterArn,
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
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/nodes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNodesResponse.fromJson(response);
  }

  /// Lists the replicators.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// If the response of ListReplicators is truncated, it returns a NextToken in
  /// the response. This NextToken should be sent in the subsequent request to
  /// ListReplicators.
  ///
  /// Parameter [replicatorNameFilter] :
  /// Returns replicators starting with given name.
  Future<ListReplicatorsResponse> listReplicators({
    int? maxResults,
    String? nextToken,
    String? replicatorNameFilter,
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
      if (replicatorNameFilter != null)
        'replicatorNameFilter': [replicatorNameFilter],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/replication/v1/replicators',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReplicatorsResponse.fromJson(response);
  }

  /// Returns a list of the Scram Secrets associated with an Amazon MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The arn of the cluster.
  ///
  /// Parameter [maxResults] :
  /// The maxResults of the query.
  ///
  /// Parameter [nextToken] :
  /// The nextToken of the query.
  Future<ListScramSecretsResponse> listScramSecrets({
    required String clusterArn,
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
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/scram-secrets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScramSecretsResponse.fromJson(response);
  }

  /// Returns a list of the tags associated with the specified resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// that's associated with the tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// List topics in a MSK cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  ///
  /// Parameter [topicNameFilter] :
  /// Returns topics starting with given name.
  Future<ListTopicsResponse> listTopics({
    required String clusterArn,
    int? maxResults,
    String? nextToken,
    String? topicNameFilter,
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
      if (topicNameFilter != null) 'topicNameFilter': [topicNameFilter],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/topics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTopicsResponse.fromJson(response);
  }

  /// Returns a list of all the VPC connections in this Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<ListVpcConnectionsResponse> listVpcConnections({
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
      requestUri: '/v1/vpc-connections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVpcConnectionsResponse.fromJson(response);
  }

  /// Creates or updates the MSK cluster policy specified by the cluster Amazon
  /// Resource Name (ARN) in the request.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  /// Parameter [policy] :
  /// The policy.
  ///
  /// Parameter [currentVersion] :
  /// The policy version.
  Future<PutClusterPolicyResponse> putClusterPolicy({
    required String clusterArn,
    required String policy,
    String? currentVersion,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
      if (currentVersion != null) 'currentVersion': currentVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutClusterPolicyResponse.fromJson(response);
  }

  /// Reboots brokers.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [brokerIds] :
  /// The list of broker IDs to be rebooted. The reboot-broker operation
  /// supports rebooting one broker at a time.
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  Future<RebootBrokerResponse> rebootBroker({
    required List<String> brokerIds,
    required String clusterArn,
  }) async {
    final $payload = <String, dynamic>{
      'brokerIds': brokerIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/reboot-broker',
      exceptionFnMap: _exceptionFns,
    );
    return RebootBrokerResponse.fromJson(response);
  }

  /// Returns empty response.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  /// Parameter [vpcConnectionArn] :
  /// The VPC connection ARN.
  Future<void> rejectClientVpcConnection({
    required String clusterArn,
    required String vpcConnectionArn,
  }) async {
    final $payload = <String, dynamic>{
      'vpcConnectionArn': vpcConnectionArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/client-vpc-connection',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds tags to the specified MSK resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// that's associated with the tags.
  ///
  /// Parameter [tags] :
  /// The key-value pair for the resource tag.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the tags associated with the keys that are provided in the query.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// that's associated with the tags.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys must be unique for a given cluster. In addition, the following
  /// restrictions apply:
  ///
  /// <ul>
  /// <li>
  /// Each tag key must be unique. If you add a tag with a key that's already in
  /// use, your new tag overwrites the existing key-value pair.
  /// </li>
  /// <li>
  /// You can't start a tag key with aws: because this prefix is reserved for
  /// use by AWS. AWS creates tags that begin with this prefix on your behalf,
  /// but you can't edit or delete them.
  /// </li>
  /// <li>
  /// Tag keys must be between 1 and 128 Unicode characters in length.
  /// </li>
  /// <li>
  /// Tag keys must consist of the following characters: Unicode letters,
  /// digits, white space, and the following special characters: _ . / = + - @.
  /// </li>
  /// </ul>
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
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the number of broker nodes in the cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [currentVersion] :
  /// The version of cluster to update from. A successful operation will then
  /// generate a new version.
  ///
  /// Parameter [targetNumberOfBrokerNodes] :
  /// The number of broker nodes that you want the cluster to have after this
  /// operation completes successfully.
  Future<UpdateBrokerCountResponse> updateBrokerCount({
    required String clusterArn,
    required String currentVersion,
    required int targetNumberOfBrokerNodes,
  }) async {
    _s.validateNumRange(
      'targetNumberOfBrokerNodes',
      targetNumberOfBrokerNodes,
      1,
      15,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      'targetNumberOfBrokerNodes': targetNumberOfBrokerNodes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/nodes/count',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBrokerCountResponse.fromJson(response);
  }

  /// Updates the EBS storage associated with MSK brokers.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [currentVersion] :
  /// The version of cluster to update from. A successful operation will then
  /// generate a new version.
  ///
  /// Parameter [targetBrokerEBSVolumeInfo] :
  /// Describes the target volume size and the ID of the broker to apply the
  /// update to.
  Future<UpdateBrokerStorageResponse> updateBrokerStorage({
    required String clusterArn,
    required String currentVersion,
    required List<BrokerEBSVolumeInfo> targetBrokerEBSVolumeInfo,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      'targetBrokerEBSVolumeInfo': targetBrokerEBSVolumeInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/nodes/storage',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBrokerStorageResponse.fromJson(response);
  }

  /// Updates EC2 instance type.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [currentVersion] :
  /// The cluster version that you want to change. After this operation
  /// completes successfully, the cluster will have a new version.
  ///
  /// Parameter [targetInstanceType] :
  /// The Amazon MSK broker type that you want all of the brokers in this
  /// cluster to be.
  Future<UpdateBrokerTypeResponse> updateBrokerType({
    required String clusterArn,
    required String currentVersion,
    required String targetInstanceType,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      'targetInstanceType': targetInstanceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/nodes/type',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBrokerTypeResponse.fromJson(response);
  }

  /// Updates the cluster with the configuration that is specified in the
  /// request body.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [configurationInfo] :
  /// Represents the configuration that you want MSK to use for the brokers in a
  /// cluster.
  ///
  /// Parameter [currentVersion] :
  /// The version of the cluster that needs to be updated.
  Future<UpdateClusterConfigurationResponse> updateClusterConfiguration({
    required String clusterArn,
    required ConfigurationInfo configurationInfo,
    required String currentVersion,
  }) async {
    final $payload = <String, dynamic>{
      'configurationInfo': configurationInfo,
      'currentVersion': currentVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateClusterConfigurationResponse.fromJson(response);
  }

  /// Updates the Apache Kafka version for the cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  /// Parameter [currentVersion] :
  /// Current cluster version.
  ///
  /// Parameter [targetKafkaVersion] :
  /// Target Kafka version.
  ///
  /// Parameter [configurationInfo] :
  /// The custom configuration that should be applied on the new version of
  /// cluster.
  Future<UpdateClusterKafkaVersionResponse> updateClusterKafkaVersion({
    required String clusterArn,
    required String currentVersion,
    required String targetKafkaVersion,
    ConfigurationInfo? configurationInfo,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      'targetKafkaVersion': targetKafkaVersion,
      if (configurationInfo != null) 'configurationInfo': configurationInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/version',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateClusterKafkaVersionResponse.fromJson(response);
  }

  /// Updates an MSK configuration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  /// Parameter [serverProperties] :
  /// Contents of the <filename>server.properties</filename> file. When using
  /// the API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the
  /// contents of <filename>server.properties</filename> can be in plaintext.
  ///
  /// Parameter [description] :
  /// The description of the configuration revision.
  Future<UpdateConfigurationResponse> updateConfiguration({
    required String arn,
    required Uint8List serverProperties,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'serverProperties': base64Encode(serverProperties),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/configurations/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfigurationResponse.fromJson(response);
  }

  /// Updates the cluster's connectivity configuration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  /// Parameter [currentVersion] :
  /// The version of the MSK cluster to update. Cluster versions aren't simple
  /// numbers. You can describe an MSK cluster to find its version. When this
  /// update operation is successful, it generates a new cluster version.
  ///
  /// Parameter [connectivityInfo] :
  /// Information about the broker access configuration.
  ///
  /// Parameter [zookeeperAccess] :
  /// Access control settings for zookeeper
  Future<UpdateConnectivityResponse> updateConnectivity({
    required String clusterArn,
    required String currentVersion,
    ConnectivityInfo? connectivityInfo,
    ZookeeperAccess? zookeeperAccess,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      if (connectivityInfo != null) 'connectivityInfo': connectivityInfo,
      if (zookeeperAccess != null) 'zookeeperAccess': zookeeperAccess,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/connectivity',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectivityResponse.fromJson(response);
  }

  /// Updates the monitoring settings for the cluster. You can use this
  /// operation to specify which Apache Kafka metrics you want Amazon MSK to
  /// send to Amazon CloudWatch. You can also specify settings for open
  /// monitoring with Prometheus.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [currentVersion] :
  /// The version of the MSK cluster to update. Cluster versions aren't simple
  /// numbers. You can describe an MSK cluster to find its version. When this
  /// update operation is successful, it generates a new cluster version.
  ///
  /// Parameter [enhancedMonitoring] :
  /// Specifies which Apache Kafka metrics Amazon MSK gathers and sends to
  /// Amazon CloudWatch for this cluster.
  ///
  /// Parameter [openMonitoring] :
  /// The settings for open monitoring.
  Future<UpdateMonitoringResponse> updateMonitoring({
    required String clusterArn,
    required String currentVersion,
    EnhancedMonitoring? enhancedMonitoring,
    LoggingInfo? loggingInfo,
    OpenMonitoringInfo? openMonitoring,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.value,
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/monitoring',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMonitoringResponse.fromJson(response);
  }

  /// Use this resource to update the intelligent rebalancing status of an
  /// Amazon MSK Provisioned cluster with Express brokers.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  /// Parameter [currentVersion] :
  /// The current version of the cluster.
  ///
  /// Parameter [rebalancing] :
  /// Specifies if intelligent rebalancing should be turned on for your cluster.
  /// The default intelligent rebalancing status is ACTIVE for all new MSK
  /// Provisioned clusters that you create with Express brokers.
  Future<UpdateRebalancingResponse> updateRebalancing({
    required String clusterArn,
    required String currentVersion,
    required Rebalancing rebalancing,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      'rebalancing': rebalancing,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/rebalancing',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRebalancingResponse.fromJson(response);
  }

  /// Updates replication info of a replicator.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [currentVersion] :
  /// Current replicator version.
  ///
  /// Parameter [replicatorArn] :
  /// The Amazon Resource Name (ARN) of the replicator to be updated.
  ///
  /// Parameter [consumerGroupReplication] :
  /// Updated consumer group replication information.
  ///
  /// Parameter [logDelivery] :
  /// Configuration for delivering replicator logs to customer destinations.
  ///
  /// Parameter [sourceKafkaClusterArn] :
  /// The ARN of the source Kafka cluster.
  ///
  /// Parameter [sourceKafkaClusterId] :
  /// The ID of the source Kafka cluster.
  ///
  /// Parameter [targetKafkaClusterArn] :
  /// The ARN of the target Kafka cluster.
  ///
  /// Parameter [targetKafkaClusterId] :
  /// The ID of the target Kafka cluster.
  ///
  /// Parameter [topicReplication] :
  /// Updated topic replication information.
  Future<UpdateReplicationInfoResponse> updateReplicationInfo({
    required String currentVersion,
    required String replicatorArn,
    ConsumerGroupReplicationUpdate? consumerGroupReplication,
    LogDelivery? logDelivery,
    String? sourceKafkaClusterArn,
    String? sourceKafkaClusterId,
    String? targetKafkaClusterArn,
    String? targetKafkaClusterId,
    TopicReplicationUpdate? topicReplication,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      if (consumerGroupReplication != null)
        'consumerGroupReplication': consumerGroupReplication,
      if (logDelivery != null) 'logDelivery': logDelivery,
      if (sourceKafkaClusterArn != null)
        'sourceKafkaClusterArn': sourceKafkaClusterArn,
      if (sourceKafkaClusterId != null)
        'sourceKafkaClusterId': sourceKafkaClusterId,
      if (targetKafkaClusterArn != null)
        'targetKafkaClusterArn': targetKafkaClusterArn,
      if (targetKafkaClusterId != null)
        'targetKafkaClusterId': targetKafkaClusterId,
      if (topicReplication != null) 'topicReplication': topicReplication,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/replication/v1/replicators/${Uri.encodeComponent(replicatorArn)}/replication-info',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateReplicationInfoResponse.fromJson(response);
  }

  /// Updates the security settings for the cluster. You can use this operation
  /// to specify encryption and authentication on existing clusters.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [currentVersion] :
  /// The version of the MSK cluster to update. Cluster versions aren't simple
  /// numbers. You can describe an MSK cluster to find its version. When this
  /// update operation is successful, it generates a new cluster version.
  ///
  /// Parameter [clientAuthentication] :
  /// Includes all client authentication related information.
  ///
  /// Parameter [encryptionInfo] :
  /// Includes all encryption-related information.
  Future<UpdateSecurityResponse> updateSecurity({
    required String clusterArn,
    required String currentVersion,
    ClientAuthentication? clientAuthentication,
    EncryptionInfo? encryptionInfo,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/security',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSecurityResponse.fromJson(response);
  }

  /// Updates cluster broker volume size (or) sets cluster storage mode to
  /// TIERED.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  /// Parameter [currentVersion] :
  /// The version of cluster to update from. A successful operation will then
  /// generate a new version.
  ///
  /// Parameter [provisionedThroughput] :
  /// EBS volume provisioned throughput information.
  ///
  /// Parameter [storageMode] :
  /// Controls storage mode for supported storage tiers.
  ///
  /// Parameter [volumeSizeGB] :
  /// size of the EBS volume to update.
  Future<UpdateStorageResponse> updateStorage({
    required String clusterArn,
    required String currentVersion,
    ProvisionedThroughput? provisionedThroughput,
    StorageMode? storageMode,
    int? volumeSizeGB,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      if (provisionedThroughput != null)
        'provisionedThroughput': provisionedThroughput,
      if (storageMode != null) 'storageMode': storageMode.value,
      if (volumeSizeGB != null) 'volumeSizeGB': volumeSizeGB,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}/storage',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStorageResponse.fromJson(response);
  }

  /// Updates the configuration of the specified topic.
  ///
  /// May throw [BadRequestException].
  /// May throw [ClusterConnectivityException].
  /// May throw [ControllerMovedException].
  /// May throw [ForbiddenException].
  /// May throw [GroupSubscribedToTopicException].
  /// May throw [InternalServerErrorException].
  /// May throw [KafkaRequestException].
  /// May throw [KafkaTimeoutException].
  /// May throw [NotControllerException].
  /// May throw [NotFoundException].
  /// May throw [ReassignmentInProgressException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [UnknownTopicOrPartitionException].
  ///
  /// Parameter [clusterArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  /// Parameter [topicName] :
  /// The name of the topic to update configuration for.
  ///
  /// Parameter [configs] :
  /// The new topic configurations encoded as a Base64 string.
  ///
  /// Parameter [partitionCount] :
  /// The new total number of partitions for the topic.
  Future<UpdateTopicResponse> updateTopic({
    required String clusterArn,
    required String topicName,
    String? configs,
    int? partitionCount,
  }) async {
    final $payload = <String, dynamic>{
      if (configs != null) 'configs': configs,
      if (partitionCount != null) 'partitionCount': partitionCount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/topics/${Uri.encodeComponent(topicName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTopicResponse.fromJson(response);
  }
}

/// @nodoc
class BatchAssociateScramSecretResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// List of errors when associating secrets to cluster.
  final List<UnprocessedScramSecret>? unprocessedScramSecrets;

  BatchAssociateScramSecretResponse({
    this.clusterArn,
    this.unprocessedScramSecrets,
  });

  factory BatchAssociateScramSecretResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateScramSecretResponse(
      clusterArn: json['clusterArn'] as String?,
      unprocessedScramSecrets: (json['unprocessedScramSecrets'] as List?)
          ?.nonNulls
          .map(
              (e) => UnprocessedScramSecret.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final unprocessedScramSecrets = this.unprocessedScramSecrets;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (unprocessedScramSecrets != null)
        'unprocessedScramSecrets': unprocessedScramSecrets,
    };
  }
}

/// @nodoc
class BatchDisassociateScramSecretResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// List of errors when disassociating secrets to cluster.
  final List<UnprocessedScramSecret>? unprocessedScramSecrets;

  BatchDisassociateScramSecretResponse({
    this.clusterArn,
    this.unprocessedScramSecrets,
  });

  factory BatchDisassociateScramSecretResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateScramSecretResponse(
      clusterArn: json['clusterArn'] as String?,
      unprocessedScramSecrets: (json['unprocessedScramSecrets'] as List?)
          ?.nonNulls
          .map(
              (e) => UnprocessedScramSecret.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final unprocessedScramSecrets = this.unprocessedScramSecrets;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (unprocessedScramSecrets != null)
        'unprocessedScramSecrets': unprocessedScramSecrets,
    };
  }
}

/// @nodoc
class CreateClusterResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The name of the MSK cluster.
  final String? clusterName;

  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  final ClusterState? state;

  CreateClusterResponse({
    this.clusterArn,
    this.clusterName,
    this.state,
  });

  factory CreateClusterResponse.fromJson(Map<String, dynamic> json) {
    return CreateClusterResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterName: json['clusterName'] as String?,
      state: (json['state'] as String?)?.let(ClusterState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterName = this.clusterName;
    final state = this.state;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterName != null) 'clusterName': clusterName,
      if (state != null) 'state': state.value,
    };
  }
}

/// @nodoc
class CreateClusterV2Response {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The name of the MSK cluster.
  final String? clusterName;

  /// The type of the cluster. The possible states are PROVISIONED or SERVERLESS.
  final ClusterType? clusterType;

  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  final ClusterState? state;

  CreateClusterV2Response({
    this.clusterArn,
    this.clusterName,
    this.clusterType,
    this.state,
  });

  factory CreateClusterV2Response.fromJson(Map<String, dynamic> json) {
    return CreateClusterV2Response(
      clusterArn: json['clusterArn'] as String?,
      clusterName: json['clusterName'] as String?,
      clusterType:
          (json['clusterType'] as String?)?.let(ClusterType.fromString),
      state: (json['state'] as String?)?.let(ClusterState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterName = this.clusterName;
    final clusterType = this.clusterType;
    final state = this.state;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterName != null) 'clusterName': clusterName,
      if (clusterType != null) 'clusterType': clusterType.value,
      if (state != null) 'state': state.value,
    };
  }
}

/// @nodoc
class CreateConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String? arn;

  /// The time when the configuration was created.
  final DateTime? creationTime;

  /// Latest revision of the configuration.
  final ConfigurationRevision? latestRevision;

  /// The name of the configuration.
  final String? name;

  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  final ConfigurationState? state;

  CreateConfigurationResponse({
    this.arn,
    this.creationTime,
    this.latestRevision,
    this.name,
    this.state,
  });

  factory CreateConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return CreateConfigurationResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.let(ConfigurationState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final state = this.state;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
      if (state != null) 'state': state.value,
    };
  }
}

/// @nodoc
class CreateReplicatorResponse {
  /// The Amazon Resource Name (ARN) of the replicator.
  final String? replicatorArn;

  /// Name of the replicator provided by the customer.
  final String? replicatorName;

  /// State of the replicator.
  final ReplicatorState? replicatorState;

  CreateReplicatorResponse({
    this.replicatorArn,
    this.replicatorName,
    this.replicatorState,
  });

  factory CreateReplicatorResponse.fromJson(Map<String, dynamic> json) {
    return CreateReplicatorResponse(
      replicatorArn: json['replicatorArn'] as String?,
      replicatorName: json['replicatorName'] as String?,
      replicatorState:
          (json['replicatorState'] as String?)?.let(ReplicatorState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final replicatorArn = this.replicatorArn;
    final replicatorName = this.replicatorName;
    final replicatorState = this.replicatorState;
    return {
      if (replicatorArn != null) 'replicatorArn': replicatorArn,
      if (replicatorName != null) 'replicatorName': replicatorName,
      if (replicatorState != null) 'replicatorState': replicatorState.value,
    };
  }
}

/// @nodoc
class CreateTopicResponse {
  /// The status of the topic creation.
  final TopicState? status;

  /// The Amazon Resource Name (ARN) of the topic.
  final String? topicArn;

  /// The name of the topic that was created.
  final String? topicName;

  CreateTopicResponse({
    this.status,
    this.topicArn,
    this.topicName,
  });

  factory CreateTopicResponse.fromJson(Map<String, dynamic> json) {
    return CreateTopicResponse(
      status: (json['status'] as String?)?.let(TopicState.fromString),
      topicArn: json['topicArn'] as String?,
      topicName: json['topicName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final topicArn = this.topicArn;
    final topicName = this.topicName;
    return {
      if (status != null) 'status': status.value,
      if (topicArn != null) 'topicArn': topicArn,
      if (topicName != null) 'topicName': topicName,
    };
  }
}

/// @nodoc
class CreateVpcConnectionResponse {
  /// The authentication type of VPC connection.
  final String? authentication;

  /// The list of client subnets.
  final List<String>? clientSubnets;

  /// The creation time of VPC connection.
  final DateTime? creationTime;

  /// The list of security groups.
  final List<String>? securityGroups;

  /// The State of Vpc Connection.
  final VpcConnectionState? state;

  /// A map of tags for the VPC connection.
  final Map<String, String>? tags;

  /// The VPC connection ARN.
  final String? vpcConnectionArn;

  /// The VPC ID of the VPC connection.
  final String? vpcId;

  CreateVpcConnectionResponse({
    this.authentication,
    this.clientSubnets,
    this.creationTime,
    this.securityGroups,
    this.state,
    this.tags,
    this.vpcConnectionArn,
    this.vpcId,
  });

  factory CreateVpcConnectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateVpcConnectionResponse(
      authentication: json['authentication'] as String?,
      clientSubnets: (json['clientSubnets'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      creationTime: timeStampFromJson(json['creationTime']),
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      state: (json['state'] as String?)?.let(VpcConnectionState.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcConnectionArn: json['vpcConnectionArn'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authentication = this.authentication;
    final clientSubnets = this.clientSubnets;
    final creationTime = this.creationTime;
    final securityGroups = this.securityGroups;
    final state = this.state;
    final tags = this.tags;
    final vpcConnectionArn = this.vpcConnectionArn;
    final vpcId = this.vpcId;
    return {
      if (authentication != null) 'authentication': authentication,
      if (clientSubnets != null) 'clientSubnets': clientSubnets,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (state != null) 'state': state.value,
      if (tags != null) 'tags': tags,
      if (vpcConnectionArn != null) 'vpcConnectionArn': vpcConnectionArn,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// @nodoc
class DeleteClusterResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  final ClusterState? state;

  DeleteClusterResponse({
    this.clusterArn,
    this.state,
  });

  factory DeleteClusterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteClusterResponse(
      clusterArn: json['clusterArn'] as String?,
      state: (json['state'] as String?)?.let(ClusterState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final state = this.state;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (state != null) 'state': state.value,
    };
  }
}

/// @nodoc
class DeleteClusterPolicyResponse {
  DeleteClusterPolicyResponse();

  factory DeleteClusterPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteClusterPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteConfigurationResponse {
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration.
  final String? arn;

  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  final ConfigurationState? state;

  DeleteConfigurationResponse({
    this.arn,
    this.state,
  });

  factory DeleteConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConfigurationResponse(
      arn: json['arn'] as String?,
      state: (json['state'] as String?)?.let(ConfigurationState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final state = this.state;
    return {
      if (arn != null) 'arn': arn,
      if (state != null) 'state': state.value,
    };
  }
}

/// @nodoc
class DeleteReplicatorResponse {
  /// The Amazon Resource Name (ARN) of the replicator.
  final String? replicatorArn;

  /// The state of the replicator.
  final ReplicatorState? replicatorState;

  DeleteReplicatorResponse({
    this.replicatorArn,
    this.replicatorState,
  });

  factory DeleteReplicatorResponse.fromJson(Map<String, dynamic> json) {
    return DeleteReplicatorResponse(
      replicatorArn: json['replicatorArn'] as String?,
      replicatorState:
          (json['replicatorState'] as String?)?.let(ReplicatorState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final replicatorArn = this.replicatorArn;
    final replicatorState = this.replicatorState;
    return {
      if (replicatorArn != null) 'replicatorArn': replicatorArn,
      if (replicatorState != null) 'replicatorState': replicatorState.value,
    };
  }
}

/// @nodoc
class DeleteTopicResponse {
  /// The status of the topic deletion.
  final TopicState? status;

  /// The Amazon Resource Name (ARN) of the topic.
  final String? topicArn;

  /// The name of the topic that was deleted.
  final String? topicName;

  DeleteTopicResponse({
    this.status,
    this.topicArn,
    this.topicName,
  });

  factory DeleteTopicResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTopicResponse(
      status: (json['status'] as String?)?.let(TopicState.fromString),
      topicArn: json['topicArn'] as String?,
      topicName: json['topicName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final topicArn = this.topicArn;
    final topicName = this.topicName;
    return {
      if (status != null) 'status': status.value,
      if (topicArn != null) 'topicArn': topicArn,
      if (topicName != null) 'topicName': topicName,
    };
  }
}

/// @nodoc
class DeleteVpcConnectionResponse {
  /// The state of the VPC connection.
  final VpcConnectionState? state;

  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK VPC
  /// connection.
  final String? vpcConnectionArn;

  DeleteVpcConnectionResponse({
    this.state,
    this.vpcConnectionArn,
  });

  factory DeleteVpcConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVpcConnectionResponse(
      state: (json['state'] as String?)?.let(VpcConnectionState.fromString),
      vpcConnectionArn: json['vpcConnectionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final vpcConnectionArn = this.vpcConnectionArn;
    return {
      if (state != null) 'state': state.value,
      if (vpcConnectionArn != null) 'vpcConnectionArn': vpcConnectionArn,
    };
  }
}

/// @nodoc
class DescribeClusterResponse {
  /// The cluster information.
  final ClusterInfo? clusterInfo;

  DescribeClusterResponse({
    this.clusterInfo,
  });

  factory DescribeClusterResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClusterResponse(
      clusterInfo: json['clusterInfo'] != null
          ? ClusterInfo.fromJson(json['clusterInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterInfo = this.clusterInfo;
    return {
      if (clusterInfo != null) 'clusterInfo': clusterInfo,
    };
  }
}

/// @nodoc
class DescribeClusterOperationResponse {
  /// Cluster operation information
  final ClusterOperationInfo? clusterOperationInfo;

  DescribeClusterOperationResponse({
    this.clusterOperationInfo,
  });

  factory DescribeClusterOperationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClusterOperationResponse(
      clusterOperationInfo: json['clusterOperationInfo'] != null
          ? ClusterOperationInfo.fromJson(
              json['clusterOperationInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterOperationInfo = this.clusterOperationInfo;
    return {
      if (clusterOperationInfo != null)
        'clusterOperationInfo': clusterOperationInfo,
    };
  }
}

/// @nodoc
class DescribeClusterOperationV2Response {
  /// Cluster operation information
  final ClusterOperationV2? clusterOperationInfo;

  DescribeClusterOperationV2Response({
    this.clusterOperationInfo,
  });

  factory DescribeClusterOperationV2Response.fromJson(
      Map<String, dynamic> json) {
    return DescribeClusterOperationV2Response(
      clusterOperationInfo: json['clusterOperationInfo'] != null
          ? ClusterOperationV2.fromJson(
              json['clusterOperationInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterOperationInfo = this.clusterOperationInfo;
    return {
      if (clusterOperationInfo != null)
        'clusterOperationInfo': clusterOperationInfo,
    };
  }
}

/// @nodoc
class DescribeClusterV2Response {
  /// The cluster information.
  final Cluster? clusterInfo;

  DescribeClusterV2Response({
    this.clusterInfo,
  });

  factory DescribeClusterV2Response.fromJson(Map<String, dynamic> json) {
    return DescribeClusterV2Response(
      clusterInfo: json['clusterInfo'] != null
          ? Cluster.fromJson(json['clusterInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterInfo = this.clusterInfo;
    return {
      if (clusterInfo != null) 'clusterInfo': clusterInfo,
    };
  }
}

/// @nodoc
class DescribeConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String? arn;

  /// The time when the configuration was created.
  final DateTime? creationTime;

  /// The description of the configuration.
  final String? description;

  /// The versions of Apache Kafka with which you can use this MSK configuration.
  final List<String>? kafkaVersions;

  /// Latest revision of the configuration.
  final ConfigurationRevision? latestRevision;

  /// The name of the configuration.
  final String? name;

  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  final ConfigurationState? state;

  DescribeConfigurationResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.kafkaVersions,
    this.latestRevision,
    this.name,
    this.state,
  });

  factory DescribeConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConfigurationResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      kafkaVersions: (json['kafkaVersions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.let(ConfigurationState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final kafkaVersions = this.kafkaVersions;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final state = this.state;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (kafkaVersions != null) 'kafkaVersions': kafkaVersions,
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
      if (state != null) 'state': state.value,
    };
  }
}

/// @nodoc
class DescribeConfigurationRevisionResponse {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String? arn;

  /// The time when the configuration was created.
  final DateTime? creationTime;

  /// The description of the configuration.
  final String? description;

  /// The revision number.
  final int? revision;

  /// Contents of the <filename>server.properties</filename> file. When using the
  /// API, you must ensure that the contents of the file are base64 encoded. When
  /// using the AWS Management Console, the SDK, or the AWS CLI, the contents of
  /// <filename>server.properties</filename> can be in plaintext.
  final Uint8List? serverProperties;

  DescribeConfigurationRevisionResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.revision,
    this.serverProperties,
  });

  factory DescribeConfigurationRevisionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConfigurationRevisionResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      revision: json['revision'] as int?,
      serverProperties:
          _s.decodeNullableUint8List(json['serverProperties'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final revision = this.revision;
    final serverProperties = this.serverProperties;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (revision != null) 'revision': revision,
      if (serverProperties != null)
        'serverProperties': base64Encode(serverProperties),
    };
  }
}

/// @nodoc
class DescribeReplicatorResponse {
  /// The time when the replicator was created.
  final DateTime? creationTime;

  /// The current version number of the replicator.
  final String? currentVersion;

  /// Whether this resource is a replicator reference.
  final bool? isReplicatorReference;

  /// Kafka Clusters used in setting up sources / targets for replication.
  final List<KafkaClusterDescription>? kafkaClusters;

  /// Configuration for log delivery.
  final LogDelivery? logDelivery;

  /// A list of replication configurations, where each configuration targets a
  /// given source cluster to target cluster replication flow.
  final List<ReplicationInfoDescription>? replicationInfoList;

  /// The Amazon Resource Name (ARN) of the replicator.
  final String? replicatorArn;

  /// The description of the replicator.
  final String? replicatorDescription;

  /// The name of the replicator.
  final String? replicatorName;

  /// The Amazon Resource Name (ARN) of the replicator resource in the region
  /// where the replicator was created.
  final String? replicatorResourceArn;

  /// State of the replicator.
  final ReplicatorState? replicatorState;

  /// The Amazon Resource Name (ARN) of the IAM role used by the replicator to
  /// access resources in the customer's account (e.g source and target clusters)
  final String? serviceExecutionRoleArn;

  /// Details about the state of the replicator.
  final ReplicationStateInfo? stateInfo;

  /// List of tags attached to the Replicator.
  final Map<String, String>? tags;

  DescribeReplicatorResponse({
    this.creationTime,
    this.currentVersion,
    this.isReplicatorReference,
    this.kafkaClusters,
    this.logDelivery,
    this.replicationInfoList,
    this.replicatorArn,
    this.replicatorDescription,
    this.replicatorName,
    this.replicatorResourceArn,
    this.replicatorState,
    this.serviceExecutionRoleArn,
    this.stateInfo,
    this.tags,
  });

  factory DescribeReplicatorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeReplicatorResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      currentVersion: json['currentVersion'] as String?,
      isReplicatorReference: json['isReplicatorReference'] as bool?,
      kafkaClusters: (json['kafkaClusters'] as List?)
          ?.nonNulls
          .map((e) =>
              KafkaClusterDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      logDelivery: json['logDelivery'] != null
          ? LogDelivery.fromJson(json['logDelivery'] as Map<String, dynamic>)
          : null,
      replicationInfoList: (json['replicationInfoList'] as List?)
          ?.nonNulls
          .map((e) =>
              ReplicationInfoDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      replicatorArn: json['replicatorArn'] as String?,
      replicatorDescription: json['replicatorDescription'] as String?,
      replicatorName: json['replicatorName'] as String?,
      replicatorResourceArn: json['replicatorResourceArn'] as String?,
      replicatorState:
          (json['replicatorState'] as String?)?.let(ReplicatorState.fromString),
      serviceExecutionRoleArn: json['serviceExecutionRoleArn'] as String?,
      stateInfo: json['stateInfo'] != null
          ? ReplicationStateInfo.fromJson(
              json['stateInfo'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final currentVersion = this.currentVersion;
    final isReplicatorReference = this.isReplicatorReference;
    final kafkaClusters = this.kafkaClusters;
    final logDelivery = this.logDelivery;
    final replicationInfoList = this.replicationInfoList;
    final replicatorArn = this.replicatorArn;
    final replicatorDescription = this.replicatorDescription;
    final replicatorName = this.replicatorName;
    final replicatorResourceArn = this.replicatorResourceArn;
    final replicatorState = this.replicatorState;
    final serviceExecutionRoleArn = this.serviceExecutionRoleArn;
    final stateInfo = this.stateInfo;
    final tags = this.tags;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (currentVersion != null) 'currentVersion': currentVersion,
      if (isReplicatorReference != null)
        'isReplicatorReference': isReplicatorReference,
      if (kafkaClusters != null) 'kafkaClusters': kafkaClusters,
      if (logDelivery != null) 'logDelivery': logDelivery,
      if (replicationInfoList != null)
        'replicationInfoList': replicationInfoList,
      if (replicatorArn != null) 'replicatorArn': replicatorArn,
      if (replicatorDescription != null)
        'replicatorDescription': replicatorDescription,
      if (replicatorName != null) 'replicatorName': replicatorName,
      if (replicatorResourceArn != null)
        'replicatorResourceArn': replicatorResourceArn,
      if (replicatorState != null) 'replicatorState': replicatorState.value,
      if (serviceExecutionRoleArn != null)
        'serviceExecutionRoleArn': serviceExecutionRoleArn,
      if (stateInfo != null) 'stateInfo': stateInfo,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DescribeTopicResponse {
  /// Topic configurations encoded as a Base64 string.
  final String? configs;

  /// The partition count of the topic.
  final int? partitionCount;

  /// The replication factor of the topic.
  final int? replicationFactor;

  /// The status of the topic.
  final TopicState? status;

  /// The Amazon Resource Name (ARN) of the topic.
  final String? topicArn;

  /// The Kafka topic name of the topic.
  final String? topicName;

  DescribeTopicResponse({
    this.configs,
    this.partitionCount,
    this.replicationFactor,
    this.status,
    this.topicArn,
    this.topicName,
  });

  factory DescribeTopicResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTopicResponse(
      configs: json['configs'] as String?,
      partitionCount: json['partitionCount'] as int?,
      replicationFactor: json['replicationFactor'] as int?,
      status: (json['status'] as String?)?.let(TopicState.fromString),
      topicArn: json['topicArn'] as String?,
      topicName: json['topicName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configs = this.configs;
    final partitionCount = this.partitionCount;
    final replicationFactor = this.replicationFactor;
    final status = this.status;
    final topicArn = this.topicArn;
    final topicName = this.topicName;
    return {
      if (configs != null) 'configs': configs,
      if (partitionCount != null) 'partitionCount': partitionCount,
      if (replicationFactor != null) 'replicationFactor': replicationFactor,
      if (status != null) 'status': status.value,
      if (topicArn != null) 'topicArn': topicArn,
      if (topicName != null) 'topicName': topicName,
    };
  }
}

/// @nodoc
class DescribeTopicPartitionsResponse {
  /// The paginated results marker. When the result of a DescribeTopicPartitions
  /// operation is truncated, the call returns NextToken in the response. To get
  /// another batch of configurations, provide this token in your next request.
  final String? nextToken;

  /// The list of partition information for the topic.
  final List<TopicPartitionInfo>? partitions;

  DescribeTopicPartitionsResponse({
    this.nextToken,
    this.partitions,
  });

  factory DescribeTopicPartitionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTopicPartitionsResponse(
      nextToken: json['nextToken'] as String?,
      partitions: (json['partitions'] as List?)
          ?.nonNulls
          .map((e) => TopicPartitionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final partitions = this.partitions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (partitions != null) 'partitions': partitions,
    };
  }
}

/// @nodoc
class DescribeVpcConnectionResponse {
  /// The authentication type of VPC connection.
  final String? authentication;

  /// The creation time of the VPC connection.
  final DateTime? creationTime;

  /// The list of security groups for the VPC connection.
  final List<String>? securityGroups;

  /// The state of VPC connection.
  final VpcConnectionState? state;

  /// The list of subnets for the VPC connection.
  final List<String>? subnets;

  /// A map of tags for the VPC connection.
  final Map<String, String>? tags;

  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK cluster.
  final String? targetClusterArn;

  /// The Amazon Resource Name (ARN) that uniquely identifies a MSK VPC
  /// connection.
  final String? vpcConnectionArn;

  /// The VPC Id for the VPC connection.
  final String? vpcId;

  DescribeVpcConnectionResponse({
    this.authentication,
    this.creationTime,
    this.securityGroups,
    this.state,
    this.subnets,
    this.tags,
    this.targetClusterArn,
    this.vpcConnectionArn,
    this.vpcId,
  });

  factory DescribeVpcConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVpcConnectionResponse(
      authentication: json['authentication'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      state: (json['state'] as String?)?.let(VpcConnectionState.fromString),
      subnets:
          (json['subnets'] as List?)?.nonNulls.map((e) => e as String).toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetClusterArn: json['targetClusterArn'] as String?,
      vpcConnectionArn: json['vpcConnectionArn'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authentication = this.authentication;
    final creationTime = this.creationTime;
    final securityGroups = this.securityGroups;
    final state = this.state;
    final subnets = this.subnets;
    final tags = this.tags;
    final targetClusterArn = this.targetClusterArn;
    final vpcConnectionArn = this.vpcConnectionArn;
    final vpcId = this.vpcId;
    return {
      if (authentication != null) 'authentication': authentication,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (state != null) 'state': state.value,
      if (subnets != null) 'subnets': subnets,
      if (tags != null) 'tags': tags,
      if (targetClusterArn != null) 'targetClusterArn': targetClusterArn,
      if (vpcConnectionArn != null) 'vpcConnectionArn': vpcConnectionArn,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// @nodoc
class GetBootstrapBrokersResponse {
  /// A string containing one or more hostname:port pairs.
  final String? bootstrapBrokerString;

  /// A string that contains one or more DNS names (or IP) and port pairs for IPv6
  /// connectivity.
  final String? bootstrapBrokerStringIpv6;

  /// A string that contains one or more DNS names (or IP addresses) and SASL IAM
  /// port pairs.
  final String? bootstrapBrokerStringPublicSaslIam;

  /// A string containing one or more DNS names (or IP) and Sasl Scram port pairs.
  final String? bootstrapBrokerStringPublicSaslScram;

  /// A string containing one or more DNS names (or IP) and TLS port pairs.
  final String? bootstrapBrokerStringPublicTls;

  /// A string that contains one or more DNS names (or IP addresses) and SASL IAM
  /// port pairs.
  final String? bootstrapBrokerStringSaslIam;

  /// A string that contains one or more DNS names (or IP) and SASL IAM port pairs
  /// for IPv6 connectivity.
  final String? bootstrapBrokerStringSaslIamIpv6;

  /// A string containing one or more DNS names (or IP) and Sasl Scram port pairs.
  final String? bootstrapBrokerStringSaslScram;

  /// A string that contains one or more DNS names (or IP) and SASL SCRAM port
  /// pairs for IPv6 connectivity.
  final String? bootstrapBrokerStringSaslScramIpv6;

  /// A string containing one or more DNS names (or IP) and TLS port pairs.
  final String? bootstrapBrokerStringTls;

  /// A string that contains one or more DNS names (or IP) and TLS port pairs for
  /// IPv6 connectivity.
  final String? bootstrapBrokerStringTlsIpv6;

  /// A string containing one or more DNS names (or IP) and SASL/IAM port pairs
  /// for VPC connectivity.
  final String? bootstrapBrokerStringVpcConnectivitySaslIam;

  /// A string containing one or more DNS names (or IP) and SASL/SCRAM port pairs
  /// for VPC connectivity.
  final String? bootstrapBrokerStringVpcConnectivitySaslScram;

  /// A string containing one or more DNS names (or IP) and TLS port pairs for VPC
  /// connectivity.
  final String? bootstrapBrokerStringVpcConnectivityTls;

  GetBootstrapBrokersResponse({
    this.bootstrapBrokerString,
    this.bootstrapBrokerStringIpv6,
    this.bootstrapBrokerStringPublicSaslIam,
    this.bootstrapBrokerStringPublicSaslScram,
    this.bootstrapBrokerStringPublicTls,
    this.bootstrapBrokerStringSaslIam,
    this.bootstrapBrokerStringSaslIamIpv6,
    this.bootstrapBrokerStringSaslScram,
    this.bootstrapBrokerStringSaslScramIpv6,
    this.bootstrapBrokerStringTls,
    this.bootstrapBrokerStringTlsIpv6,
    this.bootstrapBrokerStringVpcConnectivitySaslIam,
    this.bootstrapBrokerStringVpcConnectivitySaslScram,
    this.bootstrapBrokerStringVpcConnectivityTls,
  });

  factory GetBootstrapBrokersResponse.fromJson(Map<String, dynamic> json) {
    return GetBootstrapBrokersResponse(
      bootstrapBrokerString: json['bootstrapBrokerString'] as String?,
      bootstrapBrokerStringIpv6: json['bootstrapBrokerStringIpv6'] as String?,
      bootstrapBrokerStringPublicSaslIam:
          json['bootstrapBrokerStringPublicSaslIam'] as String?,
      bootstrapBrokerStringPublicSaslScram:
          json['bootstrapBrokerStringPublicSaslScram'] as String?,
      bootstrapBrokerStringPublicTls:
          json['bootstrapBrokerStringPublicTls'] as String?,
      bootstrapBrokerStringSaslIam:
          json['bootstrapBrokerStringSaslIam'] as String?,
      bootstrapBrokerStringSaslIamIpv6:
          json['bootstrapBrokerStringSaslIamIpv6'] as String?,
      bootstrapBrokerStringSaslScram:
          json['bootstrapBrokerStringSaslScram'] as String?,
      bootstrapBrokerStringSaslScramIpv6:
          json['bootstrapBrokerStringSaslScramIpv6'] as String?,
      bootstrapBrokerStringTls: json['bootstrapBrokerStringTls'] as String?,
      bootstrapBrokerStringTlsIpv6:
          json['bootstrapBrokerStringTlsIpv6'] as String?,
      bootstrapBrokerStringVpcConnectivitySaslIam:
          json['bootstrapBrokerStringVpcConnectivitySaslIam'] as String?,
      bootstrapBrokerStringVpcConnectivitySaslScram:
          json['bootstrapBrokerStringVpcConnectivitySaslScram'] as String?,
      bootstrapBrokerStringVpcConnectivityTls:
          json['bootstrapBrokerStringVpcConnectivityTls'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bootstrapBrokerString = this.bootstrapBrokerString;
    final bootstrapBrokerStringIpv6 = this.bootstrapBrokerStringIpv6;
    final bootstrapBrokerStringPublicSaslIam =
        this.bootstrapBrokerStringPublicSaslIam;
    final bootstrapBrokerStringPublicSaslScram =
        this.bootstrapBrokerStringPublicSaslScram;
    final bootstrapBrokerStringPublicTls = this.bootstrapBrokerStringPublicTls;
    final bootstrapBrokerStringSaslIam = this.bootstrapBrokerStringSaslIam;
    final bootstrapBrokerStringSaslIamIpv6 =
        this.bootstrapBrokerStringSaslIamIpv6;
    final bootstrapBrokerStringSaslScram = this.bootstrapBrokerStringSaslScram;
    final bootstrapBrokerStringSaslScramIpv6 =
        this.bootstrapBrokerStringSaslScramIpv6;
    final bootstrapBrokerStringTls = this.bootstrapBrokerStringTls;
    final bootstrapBrokerStringTlsIpv6 = this.bootstrapBrokerStringTlsIpv6;
    final bootstrapBrokerStringVpcConnectivitySaslIam =
        this.bootstrapBrokerStringVpcConnectivitySaslIam;
    final bootstrapBrokerStringVpcConnectivitySaslScram =
        this.bootstrapBrokerStringVpcConnectivitySaslScram;
    final bootstrapBrokerStringVpcConnectivityTls =
        this.bootstrapBrokerStringVpcConnectivityTls;
    return {
      if (bootstrapBrokerString != null)
        'bootstrapBrokerString': bootstrapBrokerString,
      if (bootstrapBrokerStringIpv6 != null)
        'bootstrapBrokerStringIpv6': bootstrapBrokerStringIpv6,
      if (bootstrapBrokerStringPublicSaslIam != null)
        'bootstrapBrokerStringPublicSaslIam':
            bootstrapBrokerStringPublicSaslIam,
      if (bootstrapBrokerStringPublicSaslScram != null)
        'bootstrapBrokerStringPublicSaslScram':
            bootstrapBrokerStringPublicSaslScram,
      if (bootstrapBrokerStringPublicTls != null)
        'bootstrapBrokerStringPublicTls': bootstrapBrokerStringPublicTls,
      if (bootstrapBrokerStringSaslIam != null)
        'bootstrapBrokerStringSaslIam': bootstrapBrokerStringSaslIam,
      if (bootstrapBrokerStringSaslIamIpv6 != null)
        'bootstrapBrokerStringSaslIamIpv6': bootstrapBrokerStringSaslIamIpv6,
      if (bootstrapBrokerStringSaslScram != null)
        'bootstrapBrokerStringSaslScram': bootstrapBrokerStringSaslScram,
      if (bootstrapBrokerStringSaslScramIpv6 != null)
        'bootstrapBrokerStringSaslScramIpv6':
            bootstrapBrokerStringSaslScramIpv6,
      if (bootstrapBrokerStringTls != null)
        'bootstrapBrokerStringTls': bootstrapBrokerStringTls,
      if (bootstrapBrokerStringTlsIpv6 != null)
        'bootstrapBrokerStringTlsIpv6': bootstrapBrokerStringTlsIpv6,
      if (bootstrapBrokerStringVpcConnectivitySaslIam != null)
        'bootstrapBrokerStringVpcConnectivitySaslIam':
            bootstrapBrokerStringVpcConnectivitySaslIam,
      if (bootstrapBrokerStringVpcConnectivitySaslScram != null)
        'bootstrapBrokerStringVpcConnectivitySaslScram':
            bootstrapBrokerStringVpcConnectivitySaslScram,
      if (bootstrapBrokerStringVpcConnectivityTls != null)
        'bootstrapBrokerStringVpcConnectivityTls':
            bootstrapBrokerStringVpcConnectivityTls,
    };
  }
}

/// @nodoc
class GetClusterPolicyResponse {
  /// The version of cluster policy.
  final String? currentVersion;

  /// The cluster policy.
  final String? policy;

  GetClusterPolicyResponse({
    this.currentVersion,
    this.policy,
  });

  factory GetClusterPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetClusterPolicyResponse(
      currentVersion: json['currentVersion'] as String?,
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentVersion = this.currentVersion;
    final policy = this.policy;
    return {
      if (currentVersion != null) 'currentVersion': currentVersion,
      if (policy != null) 'policy': policy,
    };
  }
}

/// @nodoc
class GetCompatibleKafkaVersionsResponse {
  /// A list of CompatibleKafkaVersion objects.
  final List<CompatibleKafkaVersion>? compatibleKafkaVersions;

  GetCompatibleKafkaVersionsResponse({
    this.compatibleKafkaVersions,
  });

  factory GetCompatibleKafkaVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCompatibleKafkaVersionsResponse(
      compatibleKafkaVersions: (json['compatibleKafkaVersions'] as List?)
          ?.nonNulls
          .map(
              (e) => CompatibleKafkaVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleKafkaVersions = this.compatibleKafkaVersions;
    return {
      if (compatibleKafkaVersions != null)
        'compatibleKafkaVersions': compatibleKafkaVersions,
    };
  }
}

/// @nodoc
class ListClientVpcConnectionsResponse {
  /// List of client VPC connections.
  final List<ClientVpcConnection>? clientVpcConnections;

  /// The paginated results marker. When the result of a ListClientVpcConnections
  /// operation is truncated, the call returns NextToken in the response. To get
  /// another batch of configurations, provide this token in your next request.
  final String? nextToken;

  ListClientVpcConnectionsResponse({
    this.clientVpcConnections,
    this.nextToken,
  });

  factory ListClientVpcConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListClientVpcConnectionsResponse(
      clientVpcConnections: (json['clientVpcConnections'] as List?)
          ?.nonNulls
          .map((e) => ClientVpcConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientVpcConnections = this.clientVpcConnections;
    final nextToken = this.nextToken;
    return {
      if (clientVpcConnections != null)
        'clientVpcConnections': clientVpcConnections,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListClusterOperationsResponse {
  /// An array of cluster operation information objects.
  final List<ClusterOperationInfo>? clusterOperationInfoList;

  /// If the response of ListClusterOperations is truncated, it returns a
  /// NextToken in the response. This Nexttoken should be sent in the subsequent
  /// request to ListClusterOperations.
  final String? nextToken;

  ListClusterOperationsResponse({
    this.clusterOperationInfoList,
    this.nextToken,
  });

  factory ListClusterOperationsResponse.fromJson(Map<String, dynamic> json) {
    return ListClusterOperationsResponse(
      clusterOperationInfoList: (json['clusterOperationInfoList'] as List?)
          ?.nonNulls
          .map((e) => ClusterOperationInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterOperationInfoList = this.clusterOperationInfoList;
    final nextToken = this.nextToken;
    return {
      if (clusterOperationInfoList != null)
        'clusterOperationInfoList': clusterOperationInfoList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListClusterOperationsV2Response {
  /// An array of cluster operation information objects.
  final List<ClusterOperationV2Summary>? clusterOperationInfoList;

  /// If the response of ListClusterOperationsV2 is truncated, it returns a
  /// NextToken in the response. This NextToken should be sent in the subsequent
  /// request to ListClusterOperationsV2.
  final String? nextToken;

  ListClusterOperationsV2Response({
    this.clusterOperationInfoList,
    this.nextToken,
  });

  factory ListClusterOperationsV2Response.fromJson(Map<String, dynamic> json) {
    return ListClusterOperationsV2Response(
      clusterOperationInfoList: (json['clusterOperationInfoList'] as List?)
          ?.nonNulls
          .map((e) =>
              ClusterOperationV2Summary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterOperationInfoList = this.clusterOperationInfoList;
    final nextToken = this.nextToken;
    return {
      if (clusterOperationInfoList != null)
        'clusterOperationInfoList': clusterOperationInfoList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListClustersResponse {
  /// Information on each of the MSK clusters in the response.
  final List<ClusterInfo>? clusterInfoList;

  /// The paginated results marker. When the result of a ListClusters operation is
  /// truncated, the call returns NextToken in the response. To get another batch
  /// of clusters, provide this token in your next request.
  final String? nextToken;

  ListClustersResponse({
    this.clusterInfoList,
    this.nextToken,
  });

  factory ListClustersResponse.fromJson(Map<String, dynamic> json) {
    return ListClustersResponse(
      clusterInfoList: (json['clusterInfoList'] as List?)
          ?.nonNulls
          .map((e) => ClusterInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterInfoList = this.clusterInfoList;
    final nextToken = this.nextToken;
    return {
      if (clusterInfoList != null) 'clusterInfoList': clusterInfoList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListClustersV2Response {
  /// Information on each of the MSK clusters in the response.
  final List<Cluster>? clusterInfoList;

  /// The paginated results marker. When the result of a ListClusters operation is
  /// truncated, the call returns NextToken in the response. To get another batch
  /// of clusters, provide this token in your next request.
  final String? nextToken;

  ListClustersV2Response({
    this.clusterInfoList,
    this.nextToken,
  });

  factory ListClustersV2Response.fromJson(Map<String, dynamic> json) {
    return ListClustersV2Response(
      clusterInfoList: (json['clusterInfoList'] as List?)
          ?.nonNulls
          .map((e) => Cluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterInfoList = this.clusterInfoList;
    final nextToken = this.nextToken;
    return {
      if (clusterInfoList != null) 'clusterInfoList': clusterInfoList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListConfigurationRevisionsResponse {
  /// Paginated results marker.
  final String? nextToken;

  /// List of ConfigurationRevision objects.
  final List<ConfigurationRevision>? revisions;

  ListConfigurationRevisionsResponse({
    this.nextToken,
    this.revisions,
  });

  factory ListConfigurationRevisionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConfigurationRevisionsResponse(
      nextToken: json['nextToken'] as String?,
      revisions: (json['revisions'] as List?)
          ?.nonNulls
          .map((e) => ConfigurationRevision.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final revisions = this.revisions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (revisions != null) 'revisions': revisions,
    };
  }
}

/// @nodoc
class ListConfigurationsResponse {
  /// An array of MSK configurations.
  final List<Configuration>? configurations;

  /// The paginated results marker. When the result of a ListConfigurations
  /// operation is truncated, the call returns NextToken in the response. To get
  /// another batch of configurations, provide this token in your next request.
  final String? nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.nextToken,
  });

  factory ListConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigurationsResponse(
      configurations: (json['configurations'] as List?)
          ?.nonNulls
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurations = this.configurations;
    final nextToken = this.nextToken;
    return {
      if (configurations != null) 'configurations': configurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListKafkaVersionsResponse {
  final List<KafkaVersion>? kafkaVersions;
  final String? nextToken;

  ListKafkaVersionsResponse({
    this.kafkaVersions,
    this.nextToken,
  });

  factory ListKafkaVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListKafkaVersionsResponse(
      kafkaVersions: (json['kafkaVersions'] as List?)
          ?.nonNulls
          .map((e) => KafkaVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kafkaVersions = this.kafkaVersions;
    final nextToken = this.nextToken;
    return {
      if (kafkaVersions != null) 'kafkaVersions': kafkaVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListNodesResponse {
  /// The paginated results marker. When the result of a ListNodes operation is
  /// truncated, the call returns NextToken in the response. To get another batch
  /// of nodes, provide this token in your next request.
  final String? nextToken;

  /// List containing a NodeInfo object.
  final List<NodeInfo>? nodeInfoList;

  ListNodesResponse({
    this.nextToken,
    this.nodeInfoList,
  });

  factory ListNodesResponse.fromJson(Map<String, dynamic> json) {
    return ListNodesResponse(
      nextToken: json['nextToken'] as String?,
      nodeInfoList: (json['nodeInfoList'] as List?)
          ?.nonNulls
          .map((e) => NodeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final nodeInfoList = this.nodeInfoList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (nodeInfoList != null) 'nodeInfoList': nodeInfoList,
    };
  }
}

/// @nodoc
class ListReplicatorsResponse {
  /// If the response of ListReplicators is truncated, it returns a NextToken in
  /// the response. This NextToken should be sent in the subsequent request to
  /// ListReplicators.
  final String? nextToken;

  /// List containing information of each of the replicators in the account.
  final List<ReplicatorSummary>? replicators;

  ListReplicatorsResponse({
    this.nextToken,
    this.replicators,
  });

  factory ListReplicatorsResponse.fromJson(Map<String, dynamic> json) {
    return ListReplicatorsResponse(
      nextToken: json['nextToken'] as String?,
      replicators: (json['replicators'] as List?)
          ?.nonNulls
          .map((e) => ReplicatorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final replicators = this.replicators;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (replicators != null) 'replicators': replicators,
    };
  }
}

/// @nodoc
class ListScramSecretsResponse {
  /// Paginated results marker.
  final String? nextToken;

  /// The list of scram secrets associated with the cluster.
  final List<String>? secretArnList;

  ListScramSecretsResponse({
    this.nextToken,
    this.secretArnList,
  });

  factory ListScramSecretsResponse.fromJson(Map<String, dynamic> json) {
    return ListScramSecretsResponse(
      nextToken: json['nextToken'] as String?,
      secretArnList: (json['secretArnList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final secretArnList = this.secretArnList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (secretArnList != null) 'secretArnList': secretArnList,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The key-value pair for the resource tag.
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

/// @nodoc
class ListTopicsResponse {
  /// The paginated results marker. When the result of a ListTopics operation is
  /// truncated, the call returns NextToken in the response. To get another batch
  /// of configurations, provide this token in your next request.
  final String? nextToken;

  /// List containing topics info.
  final List<TopicInfo>? topics;

  ListTopicsResponse({
    this.nextToken,
    this.topics,
  });

  factory ListTopicsResponse.fromJson(Map<String, dynamic> json) {
    return ListTopicsResponse(
      nextToken: json['nextToken'] as String?,
      topics: (json['topics'] as List?)
          ?.nonNulls
          .map((e) => TopicInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final topics = this.topics;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (topics != null) 'topics': topics,
    };
  }
}

/// @nodoc
class ListVpcConnectionsResponse {
  /// The paginated results marker. When the result of a ListClientVpcConnections
  /// operation is truncated, the call returns NextToken in the response. To get
  /// another batch of configurations, provide this token in your next request.
  final String? nextToken;

  /// List of VPC connections.
  final List<VpcConnection>? vpcConnections;

  ListVpcConnectionsResponse({
    this.nextToken,
    this.vpcConnections,
  });

  factory ListVpcConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListVpcConnectionsResponse(
      nextToken: json['nextToken'] as String?,
      vpcConnections: (json['vpcConnections'] as List?)
          ?.nonNulls
          .map((e) => VpcConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final vpcConnections = this.vpcConnections;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (vpcConnections != null) 'vpcConnections': vpcConnections,
    };
  }
}

/// @nodoc
class PutClusterPolicyResponse {
  /// The policy version.
  final String? currentVersion;

  PutClusterPolicyResponse({
    this.currentVersion,
  });

  factory PutClusterPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutClusterPolicyResponse(
      currentVersion: json['currentVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentVersion = this.currentVersion;
    return {
      if (currentVersion != null) 'currentVersion': currentVersion,
    };
  }
}

/// @nodoc
class RebootBrokerResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  RebootBrokerResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory RebootBrokerResponse.fromJson(Map<String, dynamic> json) {
    return RebootBrokerResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class RejectClientVpcConnectionResponse {
  RejectClientVpcConnectionResponse();

  factory RejectClientVpcConnectionResponse.fromJson(Map<String, dynamic> _) {
    return RejectClientVpcConnectionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateBrokerCountResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateBrokerCountResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateBrokerCountResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrokerCountResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateBrokerStorageResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateBrokerStorageResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateBrokerStorageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrokerStorageResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateBrokerTypeResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateBrokerTypeResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateBrokerTypeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrokerTypeResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateClusterConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateClusterConfigurationResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateClusterConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateClusterConfigurationResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateClusterKafkaVersionResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateClusterKafkaVersionResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateClusterKafkaVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateClusterKafkaVersionResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String? arn;

  /// Latest revision of the configuration.
  final ConfigurationRevision? latestRevision;

  UpdateConfigurationResponse({
    this.arn,
    this.latestRevision,
  });

  factory UpdateConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConfigurationResponse(
      arn: json['arn'] as String?,
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final latestRevision = this.latestRevision;
    return {
      if (arn != null) 'arn': arn,
      if (latestRevision != null) 'latestRevision': latestRevision,
    };
  }
}

/// @nodoc
class UpdateConnectivityResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateConnectivityResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateConnectivityResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectivityResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateMonitoringResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateMonitoringResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateMonitoringResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMonitoringResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateRebalancingResponse {
  /// The Amazon Resource Name (ARN) of the cluster whose intelligent rebalancing
  /// status you've updated.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateRebalancingResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateRebalancingResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRebalancingResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateReplicationInfoResponse {
  /// The Amazon Resource Name (ARN) of the replicator.
  final String? replicatorArn;

  /// State of the replicator.
  final ReplicatorState? replicatorState;

  UpdateReplicationInfoResponse({
    this.replicatorArn,
    this.replicatorState,
  });

  factory UpdateReplicationInfoResponse.fromJson(Map<String, dynamic> json) {
    return UpdateReplicationInfoResponse(
      replicatorArn: json['replicatorArn'] as String?,
      replicatorState:
          (json['replicatorState'] as String?)?.let(ReplicatorState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final replicatorArn = this.replicatorArn;
    final replicatorState = this.replicatorState;
    return {
      if (replicatorArn != null) 'replicatorArn': replicatorArn,
      if (replicatorState != null) 'replicatorState': replicatorState.value,
    };
  }
}

/// @nodoc
class UpdateSecurityResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateSecurityResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateSecurityResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSecurityResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateStorageResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String? clusterOperationArn;

  UpdateStorageResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateStorageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateStorageResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterOperationArn = this.clusterOperationArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterOperationArn != null)
        'clusterOperationArn': clusterOperationArn,
    };
  }
}

/// @nodoc
class UpdateTopicResponse {
  /// The status of the topic update.
  final TopicState? status;

  /// The Amazon Resource Name (ARN) of the topic.
  final String? topicArn;

  /// The name of the topic whose configuration was updated.
  final String? topicName;

  UpdateTopicResponse({
    this.status,
    this.topicArn,
    this.topicName,
  });

  factory UpdateTopicResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTopicResponse(
      status: (json['status'] as String?)?.let(TopicState.fromString),
      topicArn: json['topicArn'] as String?,
      topicName: json['topicName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final topicArn = this.topicArn;
    final topicName = this.topicName;
    return {
      if (status != null) 'status': status.value,
      if (topicArn != null) 'topicArn': topicArn,
      if (topicName != null) 'topicName': topicName,
    };
  }
}

/// The state of a topic request.
///
/// @nodoc
class TopicState {
  static const creating = TopicState._('CREATING');
  static const updating = TopicState._('UPDATING');
  static const deleting = TopicState._('DELETING');
  static const active = TopicState._('ACTIVE');

  final String value;

  const TopicState._(this.value);

  static const values = [creating, updating, deleting, active];

  static TopicState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TopicState._(value));

  @override
  bool operator ==(other) => other is TopicState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about provisioned throughput for EBS storage volumes
/// attached to kafka broker nodes.
///
/// @nodoc
class ProvisionedThroughput {
  /// Provisioned throughput is enabled or not.
  final bool? enabled;

  /// Throughput value of the EBS volumes for the data drive on each kafka broker
  /// node in MiB per second.
  final int? volumeThroughput;

  ProvisionedThroughput({
    this.enabled,
    this.volumeThroughput,
  });

  factory ProvisionedThroughput.fromJson(Map<String, dynamic> json) {
    return ProvisionedThroughput(
      enabled: json['enabled'] as bool?,
      volumeThroughput: json['volumeThroughput'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final volumeThroughput = this.volumeThroughput;
    return {
      if (enabled != null) 'enabled': enabled,
      if (volumeThroughput != null) 'volumeThroughput': volumeThroughput,
    };
  }
}

/// Controls storage mode for various supported storage tiers.
///
/// @nodoc
class StorageMode {
  static const local = StorageMode._('LOCAL');
  static const tiered = StorageMode._('TIERED');

  final String value;

  const StorageMode._(this.value);

  static const values = [local, tiered];

  static StorageMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StorageMode._(value));

  @override
  bool operator ==(other) => other is StorageMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Includes all client authentication information.
///
/// @nodoc
class ClientAuthentication {
  /// Details for ClientAuthentication using SASL.
  final Sasl? sasl;

  /// Details for ClientAuthentication using TLS.
  final Tls? tls;

  /// Contains information about unauthenticated traffic to the cluster.
  final Unauthenticated? unauthenticated;

  ClientAuthentication({
    this.sasl,
    this.tls,
    this.unauthenticated,
  });

  factory ClientAuthentication.fromJson(Map<String, dynamic> json) {
    return ClientAuthentication(
      sasl: json['sasl'] != null
          ? Sasl.fromJson(json['sasl'] as Map<String, dynamic>)
          : null,
      tls: json['tls'] != null
          ? Tls.fromJson(json['tls'] as Map<String, dynamic>)
          : null,
      unauthenticated: json['unauthenticated'] != null
          ? Unauthenticated.fromJson(
              json['unauthenticated'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sasl = this.sasl;
    final tls = this.tls;
    final unauthenticated = this.unauthenticated;
    return {
      if (sasl != null) 'sasl': sasl,
      if (tls != null) 'tls': tls,
      if (unauthenticated != null) 'unauthenticated': unauthenticated,
    };
  }
}

/// Includes encryption-related information, such as the AWS KMS key used for
/// encrypting data at rest and whether you want MSK to encrypt your data in
/// transit.
///
/// @nodoc
class EncryptionInfo {
  /// The data-volume encryption details.
  final EncryptionAtRest? encryptionAtRest;

  /// The details for encryption in transit.
  final EncryptionInTransit? encryptionInTransit;

  EncryptionInfo({
    this.encryptionAtRest,
    this.encryptionInTransit,
  });

  factory EncryptionInfo.fromJson(Map<String, dynamic> json) {
    return EncryptionInfo(
      encryptionAtRest: json['encryptionAtRest'] != null
          ? EncryptionAtRest.fromJson(
              json['encryptionAtRest'] as Map<String, dynamic>)
          : null,
      encryptionInTransit: json['encryptionInTransit'] != null
          ? EncryptionInTransit.fromJson(
              json['encryptionInTransit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionAtRest = this.encryptionAtRest;
    final encryptionInTransit = this.encryptionInTransit;
    return {
      if (encryptionAtRest != null) 'encryptionAtRest': encryptionAtRest,
      if (encryptionInTransit != null)
        'encryptionInTransit': encryptionInTransit,
    };
  }
}

/// The data-volume encryption details.
///
/// @nodoc
class EncryptionAtRest {
  /// The ARN of the AWS KMS key for encrypting data at rest. If you don't specify
  /// a KMS key, MSK creates one for you and uses it.
  final String dataVolumeKMSKeyId;

  EncryptionAtRest({
    required this.dataVolumeKMSKeyId,
  });

  factory EncryptionAtRest.fromJson(Map<String, dynamic> json) {
    return EncryptionAtRest(
      dataVolumeKMSKeyId: (json['dataVolumeKMSKeyId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dataVolumeKMSKeyId = this.dataVolumeKMSKeyId;
    return {
      'dataVolumeKMSKeyId': dataVolumeKMSKeyId,
    };
  }
}

/// The settings for encrypting data in transit.
///
/// @nodoc
class EncryptionInTransit {
  /// Indicates the encryption setting for data in transit between clients and
  /// brokers. The following are the possible values.
  ///
  /// TLS means that client-broker communication is enabled with TLS only.
  ///
  /// TLS_PLAINTEXT means that client-broker communication is enabled for both
  /// TLS-encrypted, as well as plaintext data.
  ///
  /// PLAINTEXT means that client-broker communication is enabled in plaintext
  /// only.
  ///
  /// The default value is TLS_PLAINTEXT.
  final ClientBroker? clientBroker;

  /// When set to true, it indicates that data communication among the broker
  /// nodes of the cluster is encrypted. When set to false, the communication
  /// happens in plaintext.
  ///
  /// The default value is true.
  final bool? inCluster;

  EncryptionInTransit({
    this.clientBroker,
    this.inCluster,
  });

  factory EncryptionInTransit.fromJson(Map<String, dynamic> json) {
    return EncryptionInTransit(
      clientBroker:
          (json['clientBroker'] as String?)?.let(ClientBroker.fromString),
      inCluster: json['inCluster'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientBroker = this.clientBroker;
    final inCluster = this.inCluster;
    return {
      if (clientBroker != null) 'clientBroker': clientBroker.value,
      if (inCluster != null) 'inCluster': inCluster,
    };
  }
}

/// Client-broker encryption in transit setting.
///
/// @nodoc
class ClientBroker {
  static const tls = ClientBroker._('TLS');
  static const tlsPlaintext = ClientBroker._('TLS_PLAINTEXT');
  static const plaintext = ClientBroker._('PLAINTEXT');

  final String value;

  const ClientBroker._(this.value);

  static const values = [tls, tlsPlaintext, plaintext];

  static ClientBroker fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ClientBroker._(value));

  @override
  bool operator ==(other) => other is ClientBroker && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details for client authentication using SASL.
///
/// @nodoc
class Sasl {
  /// Indicates whether IAM access control is enabled.
  final Iam? iam;

  /// Details for SASL/SCRAM client authentication.
  final Scram? scram;

  Sasl({
    this.iam,
    this.scram,
  });

  factory Sasl.fromJson(Map<String, dynamic> json) {
    return Sasl(
      iam: json['iam'] != null
          ? Iam.fromJson(json['iam'] as Map<String, dynamic>)
          : null,
      scram: json['scram'] != null
          ? Scram.fromJson(json['scram'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iam = this.iam;
    final scram = this.scram;
    return {
      if (iam != null) 'iam': iam,
      if (scram != null) 'scram': scram,
    };
  }
}

/// Details for client authentication using TLS.
///
/// @nodoc
class Tls {
  /// List of ACM Certificate Authority ARNs.
  final List<String>? certificateAuthorityArnList;

  /// Specifies whether you want to turn on or turn off TLS authentication.
  final bool? enabled;

  Tls({
    this.certificateAuthorityArnList,
    this.enabled,
  });

  factory Tls.fromJson(Map<String, dynamic> json) {
    return Tls(
      certificateAuthorityArnList:
          (json['certificateAuthorityArnList'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArnList = this.certificateAuthorityArnList;
    final enabled = this.enabled;
    return {
      if (certificateAuthorityArnList != null)
        'certificateAuthorityArnList': certificateAuthorityArnList,
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// @nodoc
class Unauthenticated {
  /// Specifies whether you want to turn on or turn off unauthenticated traffic to
  /// your cluster.
  final bool? enabled;

  Unauthenticated({
    this.enabled,
  });

  factory Unauthenticated.fromJson(Map<String, dynamic> json) {
    return Unauthenticated(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// Details for SASL/SCRAM client authentication.
///
/// @nodoc
class Scram {
  /// SASL/SCRAM authentication is enabled or not.
  final bool? enabled;

  Scram({
    this.enabled,
  });

  factory Scram.fromJson(Map<String, dynamic> json) {
    return Scram(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// Details for IAM access control.
///
/// @nodoc
class Iam {
  /// Indicates whether IAM access control is enabled.
  final bool? enabled;

  Iam({
    this.enabled,
  });

  factory Iam.fromJson(Map<String, dynamic> json) {
    return Iam(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// The state of a replicator.
///
/// @nodoc
class ReplicatorState {
  static const running = ReplicatorState._('RUNNING');
  static const creating = ReplicatorState._('CREATING');
  static const updating = ReplicatorState._('UPDATING');
  static const deleting = ReplicatorState._('DELETING');
  static const failed = ReplicatorState._('FAILED');

  final String value;

  const ReplicatorState._(this.value);

  static const values = [running, creating, updating, deleting, failed];

  static ReplicatorState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicatorState._(value));

  @override
  bool operator ==(other) => other is ReplicatorState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about consumer group replication.
///
/// @nodoc
class ConsumerGroupReplicationUpdate {
  /// List of regular expression patterns indicating the consumer groups that
  /// should not be replicated.
  final List<String> consumerGroupsToExclude;

  /// List of regular expression patterns indicating the consumer groups to copy.
  final List<String> consumerGroupsToReplicate;

  /// Enables synchronization of consumer groups to target cluster.
  final bool detectAndCopyNewConsumerGroups;

  /// Enables synchronization of consumer group offsets to target cluster. The
  /// translated offsets will be written to topic __consumer_offsets.
  final bool synchroniseConsumerGroupOffsets;

  ConsumerGroupReplicationUpdate({
    required this.consumerGroupsToExclude,
    required this.consumerGroupsToReplicate,
    required this.detectAndCopyNewConsumerGroups,
    required this.synchroniseConsumerGroupOffsets,
  });

  Map<String, dynamic> toJson() {
    final consumerGroupsToExclude = this.consumerGroupsToExclude;
    final consumerGroupsToReplicate = this.consumerGroupsToReplicate;
    final detectAndCopyNewConsumerGroups = this.detectAndCopyNewConsumerGroups;
    final synchroniseConsumerGroupOffsets =
        this.synchroniseConsumerGroupOffsets;
    return {
      'consumerGroupsToExclude': consumerGroupsToExclude,
      'consumerGroupsToReplicate': consumerGroupsToReplicate,
      'detectAndCopyNewConsumerGroups': detectAndCopyNewConsumerGroups,
      'synchroniseConsumerGroupOffsets': synchroniseConsumerGroupOffsets,
    };
  }
}

/// Details for updating the topic replication of a replicator.
///
/// @nodoc
class TopicReplicationUpdate {
  /// Whether to periodically configure remote topic ACLs to match their
  /// corresponding upstream topics.
  final bool copyAccessControlListsForTopics;

  /// Whether to periodically configure remote topics to match their corresponding
  /// upstream topics.
  final bool copyTopicConfigurations;

  /// Whether to periodically check for new topics and partitions.
  final bool detectAndCopyNewTopics;

  /// List of regular expression patterns indicating the topics that should not be
  /// replicated.
  final List<String> topicsToExclude;

  /// List of regular expression patterns indicating the topics to copy.
  final List<String> topicsToReplicate;

  TopicReplicationUpdate({
    required this.copyAccessControlListsForTopics,
    required this.copyTopicConfigurations,
    required this.detectAndCopyNewTopics,
    required this.topicsToExclude,
    required this.topicsToReplicate,
  });

  Map<String, dynamic> toJson() {
    final copyAccessControlListsForTopics =
        this.copyAccessControlListsForTopics;
    final copyTopicConfigurations = this.copyTopicConfigurations;
    final detectAndCopyNewTopics = this.detectAndCopyNewTopics;
    final topicsToExclude = this.topicsToExclude;
    final topicsToReplicate = this.topicsToReplicate;
    return {
      'copyAccessControlListsForTopics': copyAccessControlListsForTopics,
      'copyTopicConfigurations': copyTopicConfigurations,
      'detectAndCopyNewTopics': detectAndCopyNewTopics,
      'topicsToExclude': topicsToExclude,
      'topicsToReplicate': topicsToReplicate,
    };
  }
}

/// Configuration for log delivery to customer destinations.
///
/// @nodoc
class LogDelivery {
  /// Configuration for replicator log delivery.
  final ReplicatorLogDelivery? replicatorLogDelivery;

  LogDelivery({
    this.replicatorLogDelivery,
  });

  factory LogDelivery.fromJson(Map<String, dynamic> json) {
    return LogDelivery(
      replicatorLogDelivery: json['replicatorLogDelivery'] != null
          ? ReplicatorLogDelivery.fromJson(
              json['replicatorLogDelivery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicatorLogDelivery = this.replicatorLogDelivery;
    return {
      if (replicatorLogDelivery != null)
        'replicatorLogDelivery': replicatorLogDelivery,
    };
  }
}

/// Configuration for replicator log delivery.
///
/// @nodoc
class ReplicatorLogDelivery {
  /// Configuration for CloudWatch Logs delivery.
  final ReplicatorCloudWatchLogs? cloudWatchLogs;

  /// Configuration for Firehose delivery.
  final ReplicatorFirehose? firehose;

  /// Configuration for S3 delivery.
  final ReplicatorS3? s3;

  ReplicatorLogDelivery({
    this.cloudWatchLogs,
    this.firehose,
    this.s3,
  });

  factory ReplicatorLogDelivery.fromJson(Map<String, dynamic> json) {
    return ReplicatorLogDelivery(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? ReplicatorCloudWatchLogs.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
      firehose: json['firehose'] != null
          ? ReplicatorFirehose.fromJson(
              json['firehose'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? ReplicatorS3.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    final firehose = this.firehose;
    final s3 = this.s3;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
      if (firehose != null) 'firehose': firehose,
      if (s3 != null) 's3': s3,
    };
  }
}

/// Details about delivering logs to CloudWatch Logs.
///
/// @nodoc
class ReplicatorCloudWatchLogs {
  /// Whether log delivery to CloudWatch Logs is enabled.
  final bool enabled;

  /// The CloudWatch log group that is the destination for log delivery.
  final String? logGroup;

  ReplicatorCloudWatchLogs({
    required this.enabled,
    this.logGroup,
  });

  factory ReplicatorCloudWatchLogs.fromJson(Map<String, dynamic> json) {
    return ReplicatorCloudWatchLogs(
      enabled: (json['enabled'] as bool?) ?? false,
      logGroup: json['logGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logGroup = this.logGroup;
    return {
      'enabled': enabled,
      if (logGroup != null) 'logGroup': logGroup,
    };
  }
}

/// Details about delivering logs to Firehose.
///
/// @nodoc
class ReplicatorFirehose {
  /// Whether log delivery to Firehose is enabled.
  final bool enabled;

  /// The Firehose delivery stream that is the destination for log delivery.
  final String? deliveryStream;

  ReplicatorFirehose({
    required this.enabled,
    this.deliveryStream,
  });

  factory ReplicatorFirehose.fromJson(Map<String, dynamic> json) {
    return ReplicatorFirehose(
      enabled: (json['enabled'] as bool?) ?? false,
      deliveryStream: json['deliveryStream'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final deliveryStream = this.deliveryStream;
    return {
      'enabled': enabled,
      if (deliveryStream != null) 'deliveryStream': deliveryStream,
    };
  }
}

/// Details about delivering logs to S3.
///
/// @nodoc
class ReplicatorS3 {
  /// Whether log delivery to S3 is enabled.
  final bool enabled;

  /// The S3 bucket that is the destination for log delivery.
  final String? bucket;

  /// The S3 prefix that is the destination for log delivery.
  final String? prefix;

  ReplicatorS3({
    required this.enabled,
    this.bucket,
    this.prefix,
  });

  factory ReplicatorS3.fromJson(Map<String, dynamic> json) {
    return ReplicatorS3(
      enabled: (json['enabled'] as bool?) ?? false,
      bucket: json['bucket'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'enabled': enabled,
      if (bucket != null) 'bucket': bucket,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Specifies whether or not intelligent rebalancing is turned on for a newly
/// created MSK Provisioned cluster with Express brokers. Intelligent
/// rebalancing performs automatic partition balancing operations when you scale
/// your clusters up or down. By default, intelligent rebalancing is ACTIVE for
/// all new Express-based clusters.
///
/// @nodoc
class Rebalancing {
  /// Intelligent rebalancing status. The default intelligent rebalancing status
  /// is ACTIVE for all new Express-based clusters.
  final RebalancingStatus? status;

  Rebalancing({
    this.status,
  });

  factory Rebalancing.fromJson(Map<String, dynamic> json) {
    return Rebalancing(
      status: (json['status'] as String?)?.let(RebalancingStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.value,
    };
  }
}

/// Intelligent rebalancing status. The default intelligent rebalancing status
/// is ACTIVE for all new Express-based clusters.
///
/// @nodoc
class RebalancingStatus {
  static const paused = RebalancingStatus._('PAUSED');
  static const active = RebalancingStatus._('ACTIVE');

  final String value;

  const RebalancingStatus._(this.value);

  static const values = [paused, active];

  static RebalancingStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RebalancingStatus._(value));

  @override
  bool operator ==(other) => other is RebalancingStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies which metrics are gathered for the MSK cluster. This property has
/// the following possible values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER,
/// and PER_TOPIC_PER_PARTITION. For a list of the metrics associated with each
/// of these levels of monitoring, see <a
/// href="https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html">Monitoring</a>.
///
/// @nodoc
class EnhancedMonitoring {
  static const $default = EnhancedMonitoring._('DEFAULT');
  static const perBroker = EnhancedMonitoring._('PER_BROKER');
  static const perTopicPerBroker = EnhancedMonitoring._('PER_TOPIC_PER_BROKER');
  static const perTopicPerPartition =
      EnhancedMonitoring._('PER_TOPIC_PER_PARTITION');

  final String value;

  const EnhancedMonitoring._(this.value);

  static const values = [
    $default,
    perBroker,
    perTopicPerBroker,
    perTopicPerPartition
  ];

  static EnhancedMonitoring fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EnhancedMonitoring._(value));

  @override
  bool operator ==(other) =>
      other is EnhancedMonitoring && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// JMX and Node monitoring for the MSK cluster.
///
/// @nodoc
class OpenMonitoringInfo {
  /// Prometheus settings.
  final PrometheusInfo prometheus;

  OpenMonitoringInfo({
    required this.prometheus,
  });

  factory OpenMonitoringInfo.fromJson(Map<String, dynamic> json) {
    return OpenMonitoringInfo(
      prometheus: PrometheusInfo.fromJson(
          (json['prometheus'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final prometheus = this.prometheus;
    return {
      'prometheus': prometheus,
    };
  }
}

/// @nodoc
class LoggingInfo {
  final BrokerLogs brokerLogs;

  LoggingInfo({
    required this.brokerLogs,
  });

  factory LoggingInfo.fromJson(Map<String, dynamic> json) {
    return LoggingInfo(
      brokerLogs: BrokerLogs.fromJson(
          (json['brokerLogs'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final brokerLogs = this.brokerLogs;
    return {
      'brokerLogs': brokerLogs,
    };
  }
}

/// @nodoc
class BrokerLogs {
  final CloudWatchLogs? cloudWatchLogs;
  final Firehose? firehose;
  final S3? s3;

  BrokerLogs({
    this.cloudWatchLogs,
    this.firehose,
    this.s3,
  });

  factory BrokerLogs.fromJson(Map<String, dynamic> json) {
    return BrokerLogs(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? CloudWatchLogs.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
      firehose: json['firehose'] != null
          ? Firehose.fromJson(json['firehose'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? S3.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    final firehose = this.firehose;
    final s3 = this.s3;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
      if (firehose != null) 'firehose': firehose,
      if (s3 != null) 's3': s3,
    };
  }
}

/// @nodoc
class CloudWatchLogs {
  final bool enabled;
  final String? logGroup;

  CloudWatchLogs({
    required this.enabled,
    this.logGroup,
  });

  factory CloudWatchLogs.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogs(
      enabled: (json['enabled'] as bool?) ?? false,
      logGroup: json['logGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logGroup = this.logGroup;
    return {
      'enabled': enabled,
      if (logGroup != null) 'logGroup': logGroup,
    };
  }
}

/// @nodoc
class Firehose {
  final bool enabled;
  final String? deliveryStream;

  Firehose({
    required this.enabled,
    this.deliveryStream,
  });

  factory Firehose.fromJson(Map<String, dynamic> json) {
    return Firehose(
      enabled: (json['enabled'] as bool?) ?? false,
      deliveryStream: json['deliveryStream'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final deliveryStream = this.deliveryStream;
    return {
      'enabled': enabled,
      if (deliveryStream != null) 'deliveryStream': deliveryStream,
    };
  }
}

/// @nodoc
class S3 {
  final bool enabled;
  final String? bucket;
  final String? prefix;

  S3({
    required this.enabled,
    this.bucket,
    this.prefix,
  });

  factory S3.fromJson(Map<String, dynamic> json) {
    return S3(
      enabled: (json['enabled'] as bool?) ?? false,
      bucket: json['bucket'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'enabled': enabled,
      if (bucket != null) 'bucket': bucket,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Prometheus settings.
///
/// @nodoc
class PrometheusInfo {
  /// Indicates whether you want to turn on or turn off the JMX Exporter.
  final JmxExporterInfo? jmxExporter;

  /// Indicates whether you want to turn on or turn off the Node Exporter.
  final NodeExporterInfo? nodeExporter;

  PrometheusInfo({
    this.jmxExporter,
    this.nodeExporter,
  });

  factory PrometheusInfo.fromJson(Map<String, dynamic> json) {
    return PrometheusInfo(
      jmxExporter: json['jmxExporter'] != null
          ? JmxExporterInfo.fromJson(
              json['jmxExporter'] as Map<String, dynamic>)
          : null,
      nodeExporter: json['nodeExporter'] != null
          ? NodeExporterInfo.fromJson(
              json['nodeExporter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jmxExporter = this.jmxExporter;
    final nodeExporter = this.nodeExporter;
    return {
      if (jmxExporter != null) 'jmxExporter': jmxExporter,
      if (nodeExporter != null) 'nodeExporter': nodeExporter,
    };
  }
}

/// Indicates whether you want to turn on or turn off the JMX Exporter.
///
/// @nodoc
class JmxExporterInfo {
  /// Indicates whether you want to turn on or turn off the JMX Exporter.
  final bool enabledInBroker;

  JmxExporterInfo({
    required this.enabledInBroker,
  });

  factory JmxExporterInfo.fromJson(Map<String, dynamic> json) {
    return JmxExporterInfo(
      enabledInBroker: (json['enabledInBroker'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

/// Indicates whether you want to turn on or turn off the Node Exporter.
///
/// @nodoc
class NodeExporterInfo {
  /// Indicates whether you want to turn on or turn off the Node Exporter.
  final bool enabledInBroker;

  NodeExporterInfo({
    required this.enabledInBroker,
  });

  factory NodeExporterInfo.fromJson(Map<String, dynamic> json) {
    return NodeExporterInfo(
      enabledInBroker: (json['enabledInBroker'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

/// Information about the broker access configuration.
///
/// @nodoc
class ConnectivityInfo {
  /// The network type of the cluster, which is IPv4 or DUAL. The DUAL network
  /// type uses both IPv4 and IPv6 addresses for your cluster and its resources.
  ///
  /// By default, a cluster uses the IPv4 network type.
  final NetworkType? networkType;

  /// Public access control for brokers.
  final PublicAccess? publicAccess;

  /// VPC connectivity access control for brokers.
  final VpcConnectivity? vpcConnectivity;

  ConnectivityInfo({
    this.networkType,
    this.publicAccess,
    this.vpcConnectivity,
  });

  factory ConnectivityInfo.fromJson(Map<String, dynamic> json) {
    return ConnectivityInfo(
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      publicAccess: json['publicAccess'] != null
          ? PublicAccess.fromJson(json['publicAccess'] as Map<String, dynamic>)
          : null,
      vpcConnectivity: json['vpcConnectivity'] != null
          ? VpcConnectivity.fromJson(
              json['vpcConnectivity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final networkType = this.networkType;
    final publicAccess = this.publicAccess;
    final vpcConnectivity = this.vpcConnectivity;
    return {
      if (networkType != null) 'networkType': networkType.value,
      if (publicAccess != null) 'publicAccess': publicAccess,
      if (vpcConnectivity != null) 'vpcConnectivity': vpcConnectivity,
    };
  }
}

/// Access control settings for zookeeper
///
/// @nodoc
class ZookeeperAccess {
  /// Zookeeper Access was on or off for the cluster
  final bool? enabled;

  ZookeeperAccess({
    this.enabled,
  });

  factory ZookeeperAccess.fromJson(Map<String, dynamic> json) {
    return ZookeeperAccess(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// Public access control for brokers.
///
/// @nodoc
class PublicAccess {
  /// The value DISABLED indicates that public access is turned off.
  /// SERVICE_PROVIDED_EIPS indicates that public access is turned on.
  final String? type;

  PublicAccess({
    this.type,
  });

  factory PublicAccess.fromJson(Map<String, dynamic> json) {
    return PublicAccess(
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type,
    };
  }
}

/// VPC connectivity access control for brokers.
///
/// @nodoc
class VpcConnectivity {
  /// Includes all client authentication information for VPC connectivity.
  final VpcConnectivityClientAuthentication? clientAuthentication;

  VpcConnectivity({
    this.clientAuthentication,
  });

  factory VpcConnectivity.fromJson(Map<String, dynamic> json) {
    return VpcConnectivity(
      clientAuthentication: json['clientAuthentication'] != null
          ? VpcConnectivityClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientAuthentication = this.clientAuthentication;
    return {
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
    };
  }
}

/// The network type of the cluster, which is IPv4 or DUAL. The DUAL network
/// type uses both IPv4 and IPv6 addresses for your cluster and its resources.
///
/// By default, a cluster uses the IPv4 network type.
///
/// @nodoc
class NetworkType {
  static const ipv4 = NetworkType._('IPV4');
  static const dual = NetworkType._('DUAL');

  final String value;

  const NetworkType._(this.value);

  static const values = [ipv4, dual];

  static NetworkType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NetworkType._(value));

  @override
  bool operator ==(other) => other is NetworkType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Includes all client authentication information for VPC connectivity.
///
/// @nodoc
class VpcConnectivityClientAuthentication {
  /// SASL authentication type details for VPC connectivity.
  final VpcConnectivitySasl? sasl;

  /// TLS authentication type details for VPC connectivity.
  final VpcConnectivityTls? tls;

  VpcConnectivityClientAuthentication({
    this.sasl,
    this.tls,
  });

  factory VpcConnectivityClientAuthentication.fromJson(
      Map<String, dynamic> json) {
    return VpcConnectivityClientAuthentication(
      sasl: json['sasl'] != null
          ? VpcConnectivitySasl.fromJson(json['sasl'] as Map<String, dynamic>)
          : null,
      tls: json['tls'] != null
          ? VpcConnectivityTls.fromJson(json['tls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sasl = this.sasl;
    final tls = this.tls;
    return {
      if (sasl != null) 'sasl': sasl,
      if (tls != null) 'tls': tls,
    };
  }
}

/// Details for SASL client authentication for VPC connectivity.
///
/// @nodoc
class VpcConnectivitySasl {
  /// Details for SASL/IAM client authentication for VPC connectivity.
  final VpcConnectivityIam? iam;

  /// Details for SASL/SCRAM client authentication for VPC connectivity.
  final VpcConnectivityScram? scram;

  VpcConnectivitySasl({
    this.iam,
    this.scram,
  });

  factory VpcConnectivitySasl.fromJson(Map<String, dynamic> json) {
    return VpcConnectivitySasl(
      iam: json['iam'] != null
          ? VpcConnectivityIam.fromJson(json['iam'] as Map<String, dynamic>)
          : null,
      scram: json['scram'] != null
          ? VpcConnectivityScram.fromJson(json['scram'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iam = this.iam;
    final scram = this.scram;
    return {
      if (iam != null) 'iam': iam,
      if (scram != null) 'scram': scram,
    };
  }
}

/// Details for TLS client authentication for VPC connectivity.
///
/// @nodoc
class VpcConnectivityTls {
  /// TLS authentication is on or off for VPC connectivity.
  final bool? enabled;

  VpcConnectivityTls({
    this.enabled,
  });

  factory VpcConnectivityTls.fromJson(Map<String, dynamic> json) {
    return VpcConnectivityTls(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// Details for SASL/SCRAM client authentication for VPC connectivity.
///
/// @nodoc
class VpcConnectivityScram {
  /// SASL/SCRAM authentication is on or off for VPC connectivity.
  final bool? enabled;

  VpcConnectivityScram({
    this.enabled,
  });

  factory VpcConnectivityScram.fromJson(Map<String, dynamic> json) {
    return VpcConnectivityScram(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// Details for IAM access control for VPC connectivity.
///
/// @nodoc
class VpcConnectivityIam {
  /// SASL/IAM authentication is on or off for VPC connectivity.
  final bool? enabled;

  VpcConnectivityIam({
    this.enabled,
  });

  factory VpcConnectivityIam.fromJson(Map<String, dynamic> json) {
    return VpcConnectivityIam(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// Describes a configuration revision.
///
/// @nodoc
class ConfigurationRevision {
  /// The time when the configuration revision was created.
  final DateTime creationTime;

  /// The revision number.
  final int revision;

  /// The description of the configuration revision.
  final String? description;

  ConfigurationRevision({
    required this.creationTime,
    required this.revision,
    this.description,
  });

  factory ConfigurationRevision.fromJson(Map<String, dynamic> json) {
    return ConfigurationRevision(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      revision: (json['revision'] as int?) ?? 0,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final revision = this.revision;
    final description = this.description;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'revision': revision,
      if (description != null) 'description': description,
    };
  }
}

/// Specifies the configuration to use for the brokers.
///
/// @nodoc
class ConfigurationInfo {
  /// ARN of the configuration to use.
  final String arn;

  /// The revision of the configuration to use.
  final int revision;

  ConfigurationInfo({
    required this.arn,
    required this.revision,
  });

  factory ConfigurationInfo.fromJson(Map<String, dynamic> json) {
    return ConfigurationInfo(
      arn: (json['arn'] as String?) ?? '',
      revision: (json['revision'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final revision = this.revision;
    return {
      'arn': arn,
      'revision': revision,
    };
  }
}

/// Specifies the EBS volume upgrade information. The broker identifier must be
/// set to the keyword ALL. This means the changes apply to all the brokers in
/// the cluster.
///
/// @nodoc
class BrokerEBSVolumeInfo {
  /// The ID of the broker to update.
  final String kafkaBrokerNodeId;

  /// EBS volume provisioned throughput information.
  final ProvisionedThroughput? provisionedThroughput;

  /// Size of the EBS volume to update.
  final int? volumeSizeGB;

  BrokerEBSVolumeInfo({
    required this.kafkaBrokerNodeId,
    this.provisionedThroughput,
    this.volumeSizeGB,
  });

  factory BrokerEBSVolumeInfo.fromJson(Map<String, dynamic> json) {
    return BrokerEBSVolumeInfo(
      kafkaBrokerNodeId: (json['kafkaBrokerNodeId'] as String?) ?? '',
      provisionedThroughput: json['provisionedThroughput'] != null
          ? ProvisionedThroughput.fromJson(
              json['provisionedThroughput'] as Map<String, dynamic>)
          : null,
      volumeSizeGB: json['volumeSizeGB'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final kafkaBrokerNodeId = this.kafkaBrokerNodeId;
    final provisionedThroughput = this.provisionedThroughput;
    final volumeSizeGB = this.volumeSizeGB;
    return {
      'kafkaBrokerNodeId': kafkaBrokerNodeId,
      if (provisionedThroughput != null)
        'provisionedThroughput': provisionedThroughput,
      if (volumeSizeGB != null) 'volumeSizeGB': volumeSizeGB,
    };
  }
}

/// The VPC connection object.
///
/// @nodoc
class VpcConnection {
  /// The ARN that identifies the Cluster which the Vpc Connection belongs to.
  final String targetClusterArn;

  /// The ARN that identifies the Vpc Connection.
  final String vpcConnectionArn;

  /// Information about the auth scheme of Vpc Connection.
  final String? authentication;

  /// Creation time of the Vpc Connection.
  final DateTime? creationTime;

  /// State of the Vpc Connection.
  final VpcConnectionState? state;

  /// The vpcId that belongs to the Vpc Connection.
  final String? vpcId;

  VpcConnection({
    required this.targetClusterArn,
    required this.vpcConnectionArn,
    this.authentication,
    this.creationTime,
    this.state,
    this.vpcId,
  });

  factory VpcConnection.fromJson(Map<String, dynamic> json) {
    return VpcConnection(
      targetClusterArn: (json['targetClusterArn'] as String?) ?? '',
      vpcConnectionArn: (json['vpcConnectionArn'] as String?) ?? '',
      authentication: json['authentication'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      state: (json['state'] as String?)?.let(VpcConnectionState.fromString),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetClusterArn = this.targetClusterArn;
    final vpcConnectionArn = this.vpcConnectionArn;
    final authentication = this.authentication;
    final creationTime = this.creationTime;
    final state = this.state;
    final vpcId = this.vpcId;
    return {
      'targetClusterArn': targetClusterArn,
      'vpcConnectionArn': vpcConnectionArn,
      if (authentication != null) 'authentication': authentication,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (state != null) 'state': state.value,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// The state of a VPC connection.
///
/// @nodoc
class VpcConnectionState {
  static const creating = VpcConnectionState._('CREATING');
  static const available = VpcConnectionState._('AVAILABLE');
  static const inactive = VpcConnectionState._('INACTIVE');
  static const deactivating = VpcConnectionState._('DEACTIVATING');
  static const deleting = VpcConnectionState._('DELETING');
  static const failed = VpcConnectionState._('FAILED');
  static const rejected = VpcConnectionState._('REJECTED');
  static const rejecting = VpcConnectionState._('REJECTING');

  final String value;

  const VpcConnectionState._(this.value);

  static const values = [
    creating,
    available,
    inactive,
    deactivating,
    deleting,
    failed,
    rejected,
    rejecting
  ];

  static VpcConnectionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VpcConnectionState._(value));

  @override
  bool operator ==(other) =>
      other is VpcConnectionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Includes identification info about the topic.
///
/// @nodoc
class TopicInfo {
  /// Number of out-of-sync replicas for a topic.
  final int? outOfSyncReplicaCount;

  /// Partition count for a topic.
  final int? partitionCount;

  /// Replication factor for a topic.
  final int? replicationFactor;

  /// The Amazon Resource Name (ARN) of the topic.
  final String? topicArn;

  /// Name for a topic.
  final String? topicName;

  TopicInfo({
    this.outOfSyncReplicaCount,
    this.partitionCount,
    this.replicationFactor,
    this.topicArn,
    this.topicName,
  });

  factory TopicInfo.fromJson(Map<String, dynamic> json) {
    return TopicInfo(
      outOfSyncReplicaCount: json['outOfSyncReplicaCount'] as int?,
      partitionCount: json['partitionCount'] as int?,
      replicationFactor: json['replicationFactor'] as int?,
      topicArn: json['topicArn'] as String?,
      topicName: json['topicName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outOfSyncReplicaCount = this.outOfSyncReplicaCount;
    final partitionCount = this.partitionCount;
    final replicationFactor = this.replicationFactor;
    final topicArn = this.topicArn;
    final topicName = this.topicName;
    return {
      if (outOfSyncReplicaCount != null)
        'outOfSyncReplicaCount': outOfSyncReplicaCount,
      if (partitionCount != null) 'partitionCount': partitionCount,
      if (replicationFactor != null) 'replicationFactor': replicationFactor,
      if (topicArn != null) 'topicArn': topicArn,
      if (topicName != null) 'topicName': topicName,
    };
  }
}

/// Information about a replicator.
///
/// @nodoc
class ReplicatorSummary {
  /// The time the replicator was created.
  final DateTime? creationTime;

  /// The current version of the replicator.
  final String? currentVersion;

  /// Whether this resource is a replicator reference.
  final bool? isReplicatorReference;

  /// Kafka Clusters used in setting up sources / targets for replication.
  final List<KafkaClusterSummary>? kafkaClustersSummary;

  /// A list of summarized information of replications between clusters.
  final List<ReplicationInfoSummary>? replicationInfoSummaryList;

  /// The Amazon Resource Name (ARN) of the replicator.
  final String? replicatorArn;

  /// The name of the replicator.
  final String? replicatorName;

  /// The Amazon Resource Name (ARN) of the replicator resource in the region
  /// where the replicator was created.
  final String? replicatorResourceArn;

  /// State of the replicator.
  final ReplicatorState? replicatorState;

  ReplicatorSummary({
    this.creationTime,
    this.currentVersion,
    this.isReplicatorReference,
    this.kafkaClustersSummary,
    this.replicationInfoSummaryList,
    this.replicatorArn,
    this.replicatorName,
    this.replicatorResourceArn,
    this.replicatorState,
  });

  factory ReplicatorSummary.fromJson(Map<String, dynamic> json) {
    return ReplicatorSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      currentVersion: json['currentVersion'] as String?,
      isReplicatorReference: json['isReplicatorReference'] as bool?,
      kafkaClustersSummary: (json['kafkaClustersSummary'] as List?)
          ?.nonNulls
          .map((e) => KafkaClusterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      replicationInfoSummaryList: (json['replicationInfoSummaryList'] as List?)
          ?.nonNulls
          .map(
              (e) => ReplicationInfoSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      replicatorArn: json['replicatorArn'] as String?,
      replicatorName: json['replicatorName'] as String?,
      replicatorResourceArn: json['replicatorResourceArn'] as String?,
      replicatorState:
          (json['replicatorState'] as String?)?.let(ReplicatorState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final currentVersion = this.currentVersion;
    final isReplicatorReference = this.isReplicatorReference;
    final kafkaClustersSummary = this.kafkaClustersSummary;
    final replicationInfoSummaryList = this.replicationInfoSummaryList;
    final replicatorArn = this.replicatorArn;
    final replicatorName = this.replicatorName;
    final replicatorResourceArn = this.replicatorResourceArn;
    final replicatorState = this.replicatorState;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (currentVersion != null) 'currentVersion': currentVersion,
      if (isReplicatorReference != null)
        'isReplicatorReference': isReplicatorReference,
      if (kafkaClustersSummary != null)
        'kafkaClustersSummary': kafkaClustersSummary,
      if (replicationInfoSummaryList != null)
        'replicationInfoSummaryList': replicationInfoSummaryList,
      if (replicatorArn != null) 'replicatorArn': replicatorArn,
      if (replicatorName != null) 'replicatorName': replicatorName,
      if (replicatorResourceArn != null)
        'replicatorResourceArn': replicatorResourceArn,
      if (replicatorState != null) 'replicatorState': replicatorState.value,
    };
  }
}

/// Summarized information of replication between clusters.
///
/// @nodoc
class ReplicationInfoSummary {
  /// The alias of the source Kafka cluster.
  final String? sourceKafkaClusterAlias;

  /// The alias of the target Kafka cluster.
  final String? targetKafkaClusterAlias;

  ReplicationInfoSummary({
    this.sourceKafkaClusterAlias,
    this.targetKafkaClusterAlias,
  });

  factory ReplicationInfoSummary.fromJson(Map<String, dynamic> json) {
    return ReplicationInfoSummary(
      sourceKafkaClusterAlias: json['sourceKafkaClusterAlias'] as String?,
      targetKafkaClusterAlias: json['targetKafkaClusterAlias'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceKafkaClusterAlias = this.sourceKafkaClusterAlias;
    final targetKafkaClusterAlias = this.targetKafkaClusterAlias;
    return {
      if (sourceKafkaClusterAlias != null)
        'sourceKafkaClusterAlias': sourceKafkaClusterAlias,
      if (targetKafkaClusterAlias != null)
        'targetKafkaClusterAlias': targetKafkaClusterAlias,
    };
  }
}

/// Summarized information about Kafka Cluster used as source / target for
/// replication.
///
/// @nodoc
class KafkaClusterSummary {
  /// Details of an Amazon MSK Cluster.
  final AmazonMskCluster? amazonMskCluster;

  /// Details of an Apache Kafka Cluster.
  final ApacheKafkaCluster? apacheKafkaCluster;

  /// The alias of the Kafka cluster. Used to prefix names of replicated topics.
  final String? kafkaClusterAlias;

  KafkaClusterSummary({
    this.amazonMskCluster,
    this.apacheKafkaCluster,
    this.kafkaClusterAlias,
  });

  factory KafkaClusterSummary.fromJson(Map<String, dynamic> json) {
    return KafkaClusterSummary(
      amazonMskCluster: json['amazonMskCluster'] != null
          ? AmazonMskCluster.fromJson(
              json['amazonMskCluster'] as Map<String, dynamic>)
          : null,
      apacheKafkaCluster: json['apacheKafkaCluster'] != null
          ? ApacheKafkaCluster.fromJson(
              json['apacheKafkaCluster'] as Map<String, dynamic>)
          : null,
      kafkaClusterAlias: json['kafkaClusterAlias'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonMskCluster = this.amazonMskCluster;
    final apacheKafkaCluster = this.apacheKafkaCluster;
    final kafkaClusterAlias = this.kafkaClusterAlias;
    return {
      if (amazonMskCluster != null) 'amazonMskCluster': amazonMskCluster,
      if (apacheKafkaCluster != null) 'apacheKafkaCluster': apacheKafkaCluster,
      if (kafkaClusterAlias != null) 'kafkaClusterAlias': kafkaClusterAlias,
    };
  }
}

/// Details of an Amazon MSK Cluster.
///
/// @nodoc
class AmazonMskCluster {
  /// The Amazon Resource Name (ARN) of an Amazon MSK cluster.
  final String mskClusterArn;

  AmazonMskCluster({
    required this.mskClusterArn,
  });

  factory AmazonMskCluster.fromJson(Map<String, dynamic> json) {
    return AmazonMskCluster(
      mskClusterArn: (json['mskClusterArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final mskClusterArn = this.mskClusterArn;
    return {
      'mskClusterArn': mskClusterArn,
    };
  }
}

/// Details of an Apache Kafka Cluster.
///
/// @nodoc
class ApacheKafkaCluster {
  /// The ID of the Apache Kafka cluster.
  final String apacheKafkaClusterId;

  /// The bootstrap broker string of the Apache Kafka cluster.
  final String bootstrapBrokerString;

  ApacheKafkaCluster({
    required this.apacheKafkaClusterId,
    required this.bootstrapBrokerString,
  });

  factory ApacheKafkaCluster.fromJson(Map<String, dynamic> json) {
    return ApacheKafkaCluster(
      apacheKafkaClusterId: (json['apacheKafkaClusterId'] as String?) ?? '',
      bootstrapBrokerString: (json['bootstrapBrokerString'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final apacheKafkaClusterId = this.apacheKafkaClusterId;
    final bootstrapBrokerString = this.bootstrapBrokerString;
    return {
      'apacheKafkaClusterId': apacheKafkaClusterId,
      'bootstrapBrokerString': bootstrapBrokerString,
    };
  }
}

/// The node information object.
///
/// @nodoc
class NodeInfo {
  /// The start time.
  final String? addedToClusterTime;

  /// The broker node info.
  final BrokerNodeInfo? brokerNodeInfo;

  /// The ControllerNodeInfo.
  final ControllerNodeInfo? controllerNodeInfo;

  /// The instance type.
  final String? instanceType;

  /// The Amazon Resource Name (ARN) of the node.
  final String? nodeARN;

  /// The node type.
  final NodeType? nodeType;

  /// The ZookeeperNodeInfo.
  final ZookeeperNodeInfo? zookeeperNodeInfo;

  NodeInfo({
    this.addedToClusterTime,
    this.brokerNodeInfo,
    this.controllerNodeInfo,
    this.instanceType,
    this.nodeARN,
    this.nodeType,
    this.zookeeperNodeInfo,
  });

  factory NodeInfo.fromJson(Map<String, dynamic> json) {
    return NodeInfo(
      addedToClusterTime: json['addedToClusterTime'] as String?,
      brokerNodeInfo: json['brokerNodeInfo'] != null
          ? BrokerNodeInfo.fromJson(
              json['brokerNodeInfo'] as Map<String, dynamic>)
          : null,
      controllerNodeInfo: json['controllerNodeInfo'] != null
          ? ControllerNodeInfo.fromJson(
              json['controllerNodeInfo'] as Map<String, dynamic>)
          : null,
      instanceType: json['instanceType'] as String?,
      nodeARN: json['nodeARN'] as String?,
      nodeType: (json['nodeType'] as String?)?.let(NodeType.fromString),
      zookeeperNodeInfo: json['zookeeperNodeInfo'] != null
          ? ZookeeperNodeInfo.fromJson(
              json['zookeeperNodeInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addedToClusterTime = this.addedToClusterTime;
    final brokerNodeInfo = this.brokerNodeInfo;
    final controllerNodeInfo = this.controllerNodeInfo;
    final instanceType = this.instanceType;
    final nodeARN = this.nodeARN;
    final nodeType = this.nodeType;
    final zookeeperNodeInfo = this.zookeeperNodeInfo;
    return {
      if (addedToClusterTime != null) 'addedToClusterTime': addedToClusterTime,
      if (brokerNodeInfo != null) 'brokerNodeInfo': brokerNodeInfo,
      if (controllerNodeInfo != null) 'controllerNodeInfo': controllerNodeInfo,
      if (instanceType != null) 'instanceType': instanceType,
      if (nodeARN != null) 'nodeARN': nodeARN,
      if (nodeType != null) 'nodeType': nodeType.value,
      if (zookeeperNodeInfo != null) 'zookeeperNodeInfo': zookeeperNodeInfo,
    };
  }
}

/// BrokerNodeInfo
///
/// @nodoc
class BrokerNodeInfo {
  /// The attached elastic network interface of the broker.
  final String? attachedENIId;

  /// The ID of the broker.
  final double? brokerId;

  /// The client subnet to which this broker node belongs.
  final String? clientSubnet;

  /// The virtual private cloud (VPC) of the client.
  final String? clientVpcIpAddress;

  /// Information about the version of software currently deployed on the Apache
  /// Kafka brokers in the cluster.
  final BrokerSoftwareInfo? currentBrokerSoftwareInfo;

  /// Endpoints for accessing the broker.
  final List<String>? endpoints;

  BrokerNodeInfo({
    this.attachedENIId,
    this.brokerId,
    this.clientSubnet,
    this.clientVpcIpAddress,
    this.currentBrokerSoftwareInfo,
    this.endpoints,
  });

  factory BrokerNodeInfo.fromJson(Map<String, dynamic> json) {
    return BrokerNodeInfo(
      attachedENIId: json['attachedENIId'] as String?,
      brokerId: _s.parseJsonDouble(json['brokerId']),
      clientSubnet: json['clientSubnet'] as String?,
      clientVpcIpAddress: json['clientVpcIpAddress'] as String?,
      currentBrokerSoftwareInfo: json['currentBrokerSoftwareInfo'] != null
          ? BrokerSoftwareInfo.fromJson(
              json['currentBrokerSoftwareInfo'] as Map<String, dynamic>)
          : null,
      endpoints: (json['endpoints'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attachedENIId = this.attachedENIId;
    final brokerId = this.brokerId;
    final clientSubnet = this.clientSubnet;
    final clientVpcIpAddress = this.clientVpcIpAddress;
    final currentBrokerSoftwareInfo = this.currentBrokerSoftwareInfo;
    final endpoints = this.endpoints;
    return {
      if (attachedENIId != null) 'attachedENIId': attachedENIId,
      if (brokerId != null) 'brokerId': _s.encodeJsonDouble(brokerId),
      if (clientSubnet != null) 'clientSubnet': clientSubnet,
      if (clientVpcIpAddress != null) 'clientVpcIpAddress': clientVpcIpAddress,
      if (currentBrokerSoftwareInfo != null)
        'currentBrokerSoftwareInfo': currentBrokerSoftwareInfo,
      if (endpoints != null) 'endpoints': endpoints,
    };
  }
}

/// Controller node information.
///
/// @nodoc
class ControllerNodeInfo {
  /// Endpoints for accessing the Controller.
  final List<String>? endpoints;

  ControllerNodeInfo({
    this.endpoints,
  });

  factory ControllerNodeInfo.fromJson(Map<String, dynamic> json) {
    return ControllerNodeInfo(
      endpoints: (json['endpoints'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    return {
      if (endpoints != null) 'endpoints': endpoints,
    };
  }
}

/// The broker or Zookeeper node.
///
/// @nodoc
class NodeType {
  static const broker = NodeType._('BROKER');

  final String value;

  const NodeType._(this.value);

  static const values = [broker];

  static NodeType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NodeType._(value));

  @override
  bool operator ==(other) => other is NodeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Zookeeper node information.
///
/// @nodoc
class ZookeeperNodeInfo {
  /// The attached elastic network interface of the broker.
  final String? attachedENIId;

  /// The virtual private cloud (VPC) IP address of the client.
  final String? clientVpcIpAddress;

  /// Endpoints for accessing the ZooKeeper.
  final List<String>? endpoints;

  /// The role-specific ID for Zookeeper.
  final double? zookeeperId;

  /// The version of Zookeeper.
  final String? zookeeperVersion;

  ZookeeperNodeInfo({
    this.attachedENIId,
    this.clientVpcIpAddress,
    this.endpoints,
    this.zookeeperId,
    this.zookeeperVersion,
  });

  factory ZookeeperNodeInfo.fromJson(Map<String, dynamic> json) {
    return ZookeeperNodeInfo(
      attachedENIId: json['attachedENIId'] as String?,
      clientVpcIpAddress: json['clientVpcIpAddress'] as String?,
      endpoints: (json['endpoints'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      zookeeperId: _s.parseJsonDouble(json['zookeeperId']),
      zookeeperVersion: json['zookeeperVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedENIId = this.attachedENIId;
    final clientVpcIpAddress = this.clientVpcIpAddress;
    final endpoints = this.endpoints;
    final zookeeperId = this.zookeeperId;
    final zookeeperVersion = this.zookeeperVersion;
    return {
      if (attachedENIId != null) 'attachedENIId': attachedENIId,
      if (clientVpcIpAddress != null) 'clientVpcIpAddress': clientVpcIpAddress,
      if (endpoints != null) 'endpoints': endpoints,
      if (zookeeperId != null) 'zookeeperId': _s.encodeJsonDouble(zookeeperId),
      if (zookeeperVersion != null) 'zookeeperVersion': zookeeperVersion,
    };
  }
}

/// Information about the current software installed on the cluster.
///
/// @nodoc
class BrokerSoftwareInfo {
  /// The Amazon Resource Name (ARN) of the configuration used for the cluster.
  /// This field isn't visible in this preview release.
  final String? configurationArn;

  /// The revision of the configuration to use. This field isn't visible in this
  /// preview release.
  final int? configurationRevision;

  /// The version of Apache Kafka.
  final String? kafkaVersion;

  BrokerSoftwareInfo({
    this.configurationArn,
    this.configurationRevision,
    this.kafkaVersion,
  });

  factory BrokerSoftwareInfo.fromJson(Map<String, dynamic> json) {
    return BrokerSoftwareInfo(
      configurationArn: json['configurationArn'] as String?,
      configurationRevision: json['configurationRevision'] as int?,
      kafkaVersion: json['kafkaVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationArn = this.configurationArn;
    final configurationRevision = this.configurationRevision;
    final kafkaVersion = this.kafkaVersion;
    return {
      if (configurationArn != null) 'configurationArn': configurationArn,
      if (configurationRevision != null)
        'configurationRevision': configurationRevision,
      if (kafkaVersion != null) 'kafkaVersion': kafkaVersion,
    };
  }
}

/// @nodoc
class KafkaVersion {
  final KafkaVersionStatus? status;
  final String? version;

  KafkaVersion({
    this.status,
    this.version,
  });

  factory KafkaVersion.fromJson(Map<String, dynamic> json) {
    return KafkaVersion(
      status: (json['status'] as String?)?.let(KafkaVersionStatus.fromString),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final version = this.version;
    return {
      if (status != null) 'status': status.value,
      if (version != null) 'version': version,
    };
  }
}

/// @nodoc
class KafkaVersionStatus {
  static const active = KafkaVersionStatus._('ACTIVE');
  static const deprecated = KafkaVersionStatus._('DEPRECATED');

  final String value;

  const KafkaVersionStatus._(this.value);

  static const values = [active, deprecated];

  static KafkaVersionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KafkaVersionStatus._(value));

  @override
  bool operator ==(other) =>
      other is KafkaVersionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an MSK Configuration.
///
/// @nodoc
class Configuration {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String arn;

  /// The time when the configuration was created.
  final DateTime creationTime;

  /// The description of the configuration.
  final String description;

  /// An array of the versions of Apache Kafka with which you can use this MSK
  /// configuration. You can use this configuration for an MSK cluster only if the
  /// Apache Kafka version specified for the cluster appears in this array.
  final List<String> kafkaVersions;

  /// Latest revision of the configuration.
  final ConfigurationRevision latestRevision;

  /// The name of the configuration.
  final String name;

  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  final ConfigurationState state;

  Configuration({
    required this.arn,
    required this.creationTime,
    required this.description,
    required this.kafkaVersions,
    required this.latestRevision,
    required this.name,
    required this.state,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      kafkaVersions: ((json['kafkaVersions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      latestRevision: ConfigurationRevision.fromJson(
          (json['latestRevision'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      state: ConfigurationState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final kafkaVersions = this.kafkaVersions;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'kafkaVersions': kafkaVersions,
      'latestRevision': latestRevision,
      'name': name,
      'state': state.value,
    };
  }
}

/// The state of a configuration.
///
/// @nodoc
class ConfigurationState {
  static const active = ConfigurationState._('ACTIVE');
  static const deleting = ConfigurationState._('DELETING');
  static const deleteFailed = ConfigurationState._('DELETE_FAILED');

  final String value;

  const ConfigurationState._(this.value);

  static const values = [active, deleting, deleteFailed];

  static ConfigurationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationState._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Returns information about a cluster.
///
/// @nodoc
class Cluster {
  /// The Amazon Resource Name (ARN) that uniquely identifies a cluster operation.
  final String? activeOperationArn;

  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  final String? clusterArn;

  /// The name of the cluster.
  final String? clusterName;

  /// Cluster Type.
  final ClusterType? clusterType;

  /// The time when the cluster was created.
  final DateTime? creationTime;

  /// The current version of the MSK cluster.
  final String? currentVersion;

  /// Information about the provisioned cluster.
  final Provisioned? provisioned;

  /// Information about the serverless cluster.
  final Serverless? serverless;

  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  final ClusterState? state;

  /// State Info for the Amazon MSK cluster.
  final StateInfo? stateInfo;

  /// Tags attached to the cluster.
  final Map<String, String>? tags;

  Cluster({
    this.activeOperationArn,
    this.clusterArn,
    this.clusterName,
    this.clusterType,
    this.creationTime,
    this.currentVersion,
    this.provisioned,
    this.serverless,
    this.state,
    this.stateInfo,
    this.tags,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      activeOperationArn: json['activeOperationArn'] as String?,
      clusterArn: json['clusterArn'] as String?,
      clusterName: json['clusterName'] as String?,
      clusterType:
          (json['clusterType'] as String?)?.let(ClusterType.fromString),
      creationTime: timeStampFromJson(json['creationTime']),
      currentVersion: json['currentVersion'] as String?,
      provisioned: json['provisioned'] != null
          ? Provisioned.fromJson(json['provisioned'] as Map<String, dynamic>)
          : null,
      serverless: json['serverless'] != null
          ? Serverless.fromJson(json['serverless'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.let(ClusterState.fromString),
      stateInfo: json['stateInfo'] != null
          ? StateInfo.fromJson(json['stateInfo'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final activeOperationArn = this.activeOperationArn;
    final clusterArn = this.clusterArn;
    final clusterName = this.clusterName;
    final clusterType = this.clusterType;
    final creationTime = this.creationTime;
    final currentVersion = this.currentVersion;
    final provisioned = this.provisioned;
    final serverless = this.serverless;
    final state = this.state;
    final stateInfo = this.stateInfo;
    final tags = this.tags;
    return {
      if (activeOperationArn != null) 'activeOperationArn': activeOperationArn,
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterName != null) 'clusterName': clusterName,
      if (clusterType != null) 'clusterType': clusterType.value,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (currentVersion != null) 'currentVersion': currentVersion,
      if (provisioned != null) 'provisioned': provisioned,
      if (serverless != null) 'serverless': serverless,
      if (state != null) 'state': state.value,
      if (stateInfo != null) 'stateInfo': stateInfo,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The type of cluster.
///
/// @nodoc
class ClusterType {
  static const provisioned = ClusterType._('PROVISIONED');
  static const serverless = ClusterType._('SERVERLESS');

  final String value;

  const ClusterType._(this.value);

  static const values = [provisioned, serverless];

  static ClusterType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ClusterType._(value));

  @override
  bool operator ==(other) => other is ClusterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The state of the Apache Kafka cluster.
///
/// @nodoc
class ClusterState {
  static const active = ClusterState._('ACTIVE');
  static const creating = ClusterState._('CREATING');
  static const deleting = ClusterState._('DELETING');
  static const failed = ClusterState._('FAILED');
  static const healing = ClusterState._('HEALING');
  static const maintenance = ClusterState._('MAINTENANCE');
  static const rebootingBroker = ClusterState._('REBOOTING_BROKER');
  static const updating = ClusterState._('UPDATING');

  final String value;

  const ClusterState._(this.value);

  static const values = [
    active,
    creating,
    deleting,
    failed,
    healing,
    maintenance,
    rebootingBroker,
    updating
  ];

  static ClusterState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ClusterState._(value));

  @override
  bool operator ==(other) => other is ClusterState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StateInfo {
  final String? code;
  final String? message;

  StateInfo({
    this.code,
    this.message,
  });

  factory StateInfo.fromJson(Map<String, dynamic> json) {
    return StateInfo(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

/// Provisioned cluster.
///
/// @nodoc
class Provisioned {
  /// Information about the brokers.
  final BrokerNodeGroupInfo brokerNodeGroupInfo;

  /// The number of broker nodes in the cluster.
  final int numberOfBrokerNodes;

  /// Includes all client authentication information.
  final ClientAuthentication? clientAuthentication;

  /// Information about the Apache Kafka version deployed on the brokers.
  final BrokerSoftwareInfo? currentBrokerSoftwareInfo;

  /// Determines if there is an action required from the customer.
  final CustomerActionStatus? customerActionStatus;

  /// Includes all encryption-related information.
  final EncryptionInfo? encryptionInfo;

  /// Specifies the level of monitoring for the MSK cluster. The possible values
  /// are DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and PER_TOPIC_PER_PARTITION.
  final EnhancedMonitoring? enhancedMonitoring;

  /// Log delivery information for the cluster.
  final LoggingInfo? loggingInfo;

  /// The settings for open monitoring.
  final OpenMonitoringInfo? openMonitoring;

  /// Specifies whether or not intelligent rebalancing is turned on for a newly
  /// created MSK Provisioned cluster with Express brokers. Intelligent
  /// rebalancing performs automatic partition balancing operations when you scale
  /// your clusters up or down. By default, intelligent rebalancing is ACTIVE for
  /// all new Express-based clusters.
  final Rebalancing? rebalancing;

  /// This controls storage mode for supported storage tiers.
  final StorageMode? storageMode;

  /// The connection string to use to connect to the Apache ZooKeeper cluster.
  final String? zookeeperConnectString;

  /// The connection string to use to connect to the Apache ZooKeeper cluster on a
  /// TLS port.
  final String? zookeeperConnectStringTls;

  Provisioned({
    required this.brokerNodeGroupInfo,
    required this.numberOfBrokerNodes,
    this.clientAuthentication,
    this.currentBrokerSoftwareInfo,
    this.customerActionStatus,
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.loggingInfo,
    this.openMonitoring,
    this.rebalancing,
    this.storageMode,
    this.zookeeperConnectString,
    this.zookeeperConnectStringTls,
  });

  factory Provisioned.fromJson(Map<String, dynamic> json) {
    return Provisioned(
      brokerNodeGroupInfo: BrokerNodeGroupInfo.fromJson(
          (json['brokerNodeGroupInfo'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      numberOfBrokerNodes: (json['numberOfBrokerNodes'] as int?) ?? 0,
      clientAuthentication: json['clientAuthentication'] != null
          ? ClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
      currentBrokerSoftwareInfo: json['currentBrokerSoftwareInfo'] != null
          ? BrokerSoftwareInfo.fromJson(
              json['currentBrokerSoftwareInfo'] as Map<String, dynamic>)
          : null,
      customerActionStatus: (json['customerActionStatus'] as String?)
          ?.let(CustomerActionStatus.fromString),
      encryptionInfo: json['encryptionInfo'] != null
          ? EncryptionInfo.fromJson(
              json['encryptionInfo'] as Map<String, dynamic>)
          : null,
      enhancedMonitoring: (json['enhancedMonitoring'] as String?)
          ?.let(EnhancedMonitoring.fromString),
      loggingInfo: json['loggingInfo'] != null
          ? LoggingInfo.fromJson(json['loggingInfo'] as Map<String, dynamic>)
          : null,
      openMonitoring: json['openMonitoring'] != null
          ? OpenMonitoringInfo.fromJson(
              json['openMonitoring'] as Map<String, dynamic>)
          : null,
      rebalancing: json['rebalancing'] != null
          ? Rebalancing.fromJson(json['rebalancing'] as Map<String, dynamic>)
          : null,
      storageMode:
          (json['storageMode'] as String?)?.let(StorageMode.fromString),
      zookeeperConnectString: json['zookeeperConnectString'] as String?,
      zookeeperConnectStringTls: json['zookeeperConnectStringTls'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final brokerNodeGroupInfo = this.brokerNodeGroupInfo;
    final numberOfBrokerNodes = this.numberOfBrokerNodes;
    final clientAuthentication = this.clientAuthentication;
    final currentBrokerSoftwareInfo = this.currentBrokerSoftwareInfo;
    final customerActionStatus = this.customerActionStatus;
    final encryptionInfo = this.encryptionInfo;
    final enhancedMonitoring = this.enhancedMonitoring;
    final loggingInfo = this.loggingInfo;
    final openMonitoring = this.openMonitoring;
    final rebalancing = this.rebalancing;
    final storageMode = this.storageMode;
    final zookeeperConnectString = this.zookeeperConnectString;
    final zookeeperConnectStringTls = this.zookeeperConnectStringTls;
    return {
      'brokerNodeGroupInfo': brokerNodeGroupInfo,
      'numberOfBrokerNodes': numberOfBrokerNodes,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (currentBrokerSoftwareInfo != null)
        'currentBrokerSoftwareInfo': currentBrokerSoftwareInfo,
      if (customerActionStatus != null)
        'customerActionStatus': customerActionStatus.value,
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.value,
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
      if (rebalancing != null) 'rebalancing': rebalancing,
      if (storageMode != null) 'storageMode': storageMode.value,
      if (zookeeperConnectString != null)
        'zookeeperConnectString': zookeeperConnectString,
      if (zookeeperConnectStringTls != null)
        'zookeeperConnectStringTls': zookeeperConnectStringTls,
    };
  }
}

/// Serverless cluster.
///
/// @nodoc
class Serverless {
  /// The configuration of the Amazon VPCs for the cluster.
  final List<VpcConfig> vpcConfigs;

  /// Includes all client authentication information.
  final ServerlessClientAuthentication? clientAuthentication;

  /// Describes the cluster's connectivity information, such as its network type,
  /// which is IPv4 or DUAL.
  final ServerlessConnectivityInfo? connectivityInfo;

  Serverless({
    required this.vpcConfigs,
    this.clientAuthentication,
    this.connectivityInfo,
  });

  factory Serverless.fromJson(Map<String, dynamic> json) {
    return Serverless(
      vpcConfigs: ((json['vpcConfigs'] as List?) ?? const [])
          .nonNulls
          .map((e) => VpcConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientAuthentication: json['clientAuthentication'] != null
          ? ServerlessClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
      connectivityInfo: json['connectivityInfo'] != null
          ? ServerlessConnectivityInfo.fromJson(
              json['connectivityInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcConfigs = this.vpcConfigs;
    final clientAuthentication = this.clientAuthentication;
    final connectivityInfo = this.connectivityInfo;
    return {
      'vpcConfigs': vpcConfigs,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (connectivityInfo != null) 'connectivityInfo': connectivityInfo,
    };
  }
}

/// Includes all client authentication information.
///
/// @nodoc
class ServerlessClientAuthentication {
  /// Details for ClientAuthentication using SASL.
  final ServerlessSasl? sasl;

  ServerlessClientAuthentication({
    this.sasl,
  });

  factory ServerlessClientAuthentication.fromJson(Map<String, dynamic> json) {
    return ServerlessClientAuthentication(
      sasl: json['sasl'] != null
          ? ServerlessSasl.fromJson(json['sasl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sasl = this.sasl;
    return {
      if (sasl != null) 'sasl': sasl,
    };
  }
}

/// Describes the cluster's connectivity information, such as its network type,
/// which is IPv4 or DUAL.
///
/// @nodoc
class ServerlessConnectivityInfo {
  /// The network type of the cluster, which is IPv4 or DUAL. The DUAL network
  /// type uses both IPv4 and IPv6 addresses for your cluster and its resources.
  ///
  /// By default, a cluster uses the IPv4 network type.
  final NetworkType? networkType;

  ServerlessConnectivityInfo({
    this.networkType,
  });

  factory ServerlessConnectivityInfo.fromJson(Map<String, dynamic> json) {
    return ServerlessConnectivityInfo(
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final networkType = this.networkType;
    return {
      if (networkType != null) 'networkType': networkType.value,
    };
  }
}

/// Details for client authentication using SASL.
///
/// @nodoc
class ServerlessSasl {
  /// Indicates whether IAM access control is enabled.
  final Iam? iam;

  ServerlessSasl({
    this.iam,
  });

  factory ServerlessSasl.fromJson(Map<String, dynamic> json) {
    return ServerlessSasl(
      iam: json['iam'] != null
          ? Iam.fromJson(json['iam'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iam = this.iam;
    return {
      if (iam != null) 'iam': iam,
    };
  }
}

/// The configuration of the Amazon VPCs for the cluster.
///
/// @nodoc
class VpcConfig {
  /// The IDs of the subnets associated with the cluster.
  final List<String> subnetIds;

  /// The IDs of the security groups associated with the cluster.
  final List<String>? securityGroupIds;

  VpcConfig({
    required this.subnetIds,
    this.securityGroupIds,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetIds = this.subnetIds;
    final securityGroupIds = this.securityGroupIds;
    return {
      'subnetIds': subnetIds,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
    };
  }
}

/// Describes the setup to be used for Apache Kafka broker nodes in the cluster.
///
/// @nodoc
class BrokerNodeGroupInfo {
  /// The list of subnets to connect to in the client virtual private cloud (VPC).
  /// AWS creates elastic network interfaces inside these subnets. Client
  /// applications use elastic network interfaces to produce and consume data.
  /// Client subnets can't occupy the Availability Zone with ID use use1-az3.
  final List<String> clientSubnets;

  /// The type of Amazon EC2 instances to use for Apache Kafka brokers. The
  /// following instance types are allowed: kafka.m5.large, kafka.m5.xlarge,
  /// kafka.m5.2xlarge, kafka.m5.4xlarge, kafka.m5.12xlarge, and
  /// kafka.m5.24xlarge.
  final String instanceType;

  /// The distribution of broker nodes across Availability Zones. This is an
  /// optional parameter. If you don't specify it, Amazon MSK gives it the value
  /// DEFAULT. You can also explicitly set this parameter to the value DEFAULT. No
  /// other values are currently allowed.
  ///
  /// Amazon MSK distributes the broker nodes evenly across the Availability Zones
  /// that correspond to the subnets you provide when you create the cluster.
  final BrokerAZDistribution? brokerAZDistribution;

  /// Information about the broker access configuration.
  final ConnectivityInfo? connectivityInfo;

  /// The AWS security groups to associate with the elastic network interfaces in
  /// order to specify who can connect to and communicate with the Amazon MSK
  /// cluster. If you don't specify a security group, Amazon MSK uses the default
  /// security group associated with the VPC.
  final List<String>? securityGroups;

  /// Contains information about storage volumes attached to MSK broker nodes.
  final StorageInfo? storageInfo;

  /// The list of zoneIds for the cluster in the virtual private cloud (VPC).
  final List<String>? zoneIds;

  BrokerNodeGroupInfo({
    required this.clientSubnets,
    required this.instanceType,
    this.brokerAZDistribution,
    this.connectivityInfo,
    this.securityGroups,
    this.storageInfo,
    this.zoneIds,
  });

  factory BrokerNodeGroupInfo.fromJson(Map<String, dynamic> json) {
    return BrokerNodeGroupInfo(
      clientSubnets: ((json['clientSubnets'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      instanceType: (json['instanceType'] as String?) ?? '',
      brokerAZDistribution: (json['brokerAZDistribution'] as String?)
          ?.let(BrokerAZDistribution.fromString),
      connectivityInfo: json['connectivityInfo'] != null
          ? ConnectivityInfo.fromJson(
              json['connectivityInfo'] as Map<String, dynamic>)
          : null,
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      storageInfo: json['storageInfo'] != null
          ? StorageInfo.fromJson(json['storageInfo'] as Map<String, dynamic>)
          : null,
      zoneIds:
          (json['zoneIds'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientSubnets = this.clientSubnets;
    final instanceType = this.instanceType;
    final brokerAZDistribution = this.brokerAZDistribution;
    final connectivityInfo = this.connectivityInfo;
    final securityGroups = this.securityGroups;
    final storageInfo = this.storageInfo;
    final zoneIds = this.zoneIds;
    return {
      'clientSubnets': clientSubnets,
      'instanceType': instanceType,
      if (brokerAZDistribution != null)
        'brokerAZDistribution': brokerAZDistribution.value,
      if (connectivityInfo != null) 'connectivityInfo': connectivityInfo,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (storageInfo != null) 'storageInfo': storageInfo,
      if (zoneIds != null) 'zoneIds': zoneIds,
    };
  }
}

/// A type of an action required from the customer.
///
/// @nodoc
class CustomerActionStatus {
  static const criticalActionRequired =
      CustomerActionStatus._('CRITICAL_ACTION_REQUIRED');
  static const actionRecommended = CustomerActionStatus._('ACTION_RECOMMENDED');
  static const none = CustomerActionStatus._('NONE');

  final String value;

  const CustomerActionStatus._(this.value);

  static const values = [criticalActionRequired, actionRecommended, none];

  static CustomerActionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomerActionStatus._(value));

  @override
  bool operator ==(other) =>
      other is CustomerActionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The distribution of broker nodes across Availability Zones. This is an
/// optional parameter. If you don't specify it, Amazon MSK gives it the value
/// DEFAULT. You can also explicitly set this parameter to the value DEFAULT. No
/// other values are currently allowed.
///
/// Amazon MSK distributes the broker nodes evenly across the Availability Zones
/// that correspond to the subnets you provide when you create the cluster.
///
/// @nodoc
class BrokerAZDistribution {
  static const $default = BrokerAZDistribution._('DEFAULT');

  final String value;

  const BrokerAZDistribution._(this.value);

  static const values = [$default];

  static BrokerAZDistribution fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BrokerAZDistribution._(value));

  @override
  bool operator ==(other) =>
      other is BrokerAZDistribution && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about storage volumes attached to MSK broker nodes.
///
/// @nodoc
class StorageInfo {
  /// EBS volume information.
  final EBSStorageInfo? ebsStorageInfo;

  StorageInfo({
    this.ebsStorageInfo,
  });

  factory StorageInfo.fromJson(Map<String, dynamic> json) {
    return StorageInfo(
      ebsStorageInfo: json['ebsStorageInfo'] != null
          ? EBSStorageInfo.fromJson(
              json['ebsStorageInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ebsStorageInfo = this.ebsStorageInfo;
    return {
      if (ebsStorageInfo != null) 'ebsStorageInfo': ebsStorageInfo,
    };
  }
}

/// Contains information about the EBS storage volumes attached to Apache Kafka
/// broker nodes.
///
/// @nodoc
class EBSStorageInfo {
  /// EBS volume provisioned throughput information.
  final ProvisionedThroughput? provisionedThroughput;

  /// The size in GiB of the EBS volume for the data drive on each broker node.
  final int? volumeSize;

  EBSStorageInfo({
    this.provisionedThroughput,
    this.volumeSize,
  });

  factory EBSStorageInfo.fromJson(Map<String, dynamic> json) {
    return EBSStorageInfo(
      provisionedThroughput: json['provisionedThroughput'] != null
          ? ProvisionedThroughput.fromJson(
              json['provisionedThroughput'] as Map<String, dynamic>)
          : null,
      volumeSize: json['volumeSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final provisionedThroughput = this.provisionedThroughput;
    final volumeSize = this.volumeSize;
    return {
      if (provisionedThroughput != null)
        'provisionedThroughput': provisionedThroughput,
      if (volumeSize != null) 'volumeSize': volumeSize,
    };
  }
}

/// Returns information about a cluster.
///
/// @nodoc
class ClusterInfo {
  /// Arn of active cluster operation.
  final String? activeOperationArn;

  /// Information about the broker nodes.
  final BrokerNodeGroupInfo? brokerNodeGroupInfo;

  /// Includes all client authentication information.
  final ClientAuthentication? clientAuthentication;

  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  final String? clusterArn;

  /// The name of the cluster.
  final String? clusterName;

  /// The time when the cluster was created.
  final DateTime? creationTime;

  /// Information about the version of software currently deployed on the Apache
  /// Kafka brokers in the cluster.
  final BrokerSoftwareInfo? currentBrokerSoftwareInfo;

  /// The current version of the MSK cluster.
  final String? currentVersion;

  /// Determines if there is an action required from the customer.
  final CustomerActionStatus? customerActionStatus;

  /// Includes all encryption-related information.
  final EncryptionInfo? encryptionInfo;

  /// Specifies which metrics are gathered for the MSK cluster. This property has
  /// the following possible values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER,
  /// and PER_TOPIC_PER_PARTITION. For a list of the metrics associated with each
  /// of these levels of monitoring, see <a
  /// href="https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html">Monitoring</a>.
  final EnhancedMonitoring? enhancedMonitoring;
  final LoggingInfo? loggingInfo;

  /// The number of broker nodes in the cluster.
  final int? numberOfBrokerNodes;

  /// Settings for open monitoring using Prometheus.
  final OpenMonitoring? openMonitoring;

  /// Contains information about intelligent rebalancing for new MSK Provisioned
  /// clusters with Express brokers. By default, intelligent rebalancing status is
  /// ACTIVE.
  final Rebalancing? rebalancing;

  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  final ClusterState? state;
  final StateInfo? stateInfo;

  /// This controls storage mode for supported storage tiers.
  final StorageMode? storageMode;

  /// Tags attached to the cluster.
  final Map<String, String>? tags;

  /// The connection string to use to connect to the Apache ZooKeeper cluster.
  final String? zookeeperConnectString;

  /// The connection string to use to connect to zookeeper cluster on Tls port.
  final String? zookeeperConnectStringTls;

  ClusterInfo({
    this.activeOperationArn,
    this.brokerNodeGroupInfo,
    this.clientAuthentication,
    this.clusterArn,
    this.clusterName,
    this.creationTime,
    this.currentBrokerSoftwareInfo,
    this.currentVersion,
    this.customerActionStatus,
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.loggingInfo,
    this.numberOfBrokerNodes,
    this.openMonitoring,
    this.rebalancing,
    this.state,
    this.stateInfo,
    this.storageMode,
    this.tags,
    this.zookeeperConnectString,
    this.zookeeperConnectStringTls,
  });

  factory ClusterInfo.fromJson(Map<String, dynamic> json) {
    return ClusterInfo(
      activeOperationArn: json['activeOperationArn'] as String?,
      brokerNodeGroupInfo: json['brokerNodeGroupInfo'] != null
          ? BrokerNodeGroupInfo.fromJson(
              json['brokerNodeGroupInfo'] as Map<String, dynamic>)
          : null,
      clientAuthentication: json['clientAuthentication'] != null
          ? ClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
      clusterArn: json['clusterArn'] as String?,
      clusterName: json['clusterName'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      currentBrokerSoftwareInfo: json['currentBrokerSoftwareInfo'] != null
          ? BrokerSoftwareInfo.fromJson(
              json['currentBrokerSoftwareInfo'] as Map<String, dynamic>)
          : null,
      currentVersion: json['currentVersion'] as String?,
      customerActionStatus: (json['customerActionStatus'] as String?)
          ?.let(CustomerActionStatus.fromString),
      encryptionInfo: json['encryptionInfo'] != null
          ? EncryptionInfo.fromJson(
              json['encryptionInfo'] as Map<String, dynamic>)
          : null,
      enhancedMonitoring: (json['enhancedMonitoring'] as String?)
          ?.let(EnhancedMonitoring.fromString),
      loggingInfo: json['loggingInfo'] != null
          ? LoggingInfo.fromJson(json['loggingInfo'] as Map<String, dynamic>)
          : null,
      numberOfBrokerNodes: json['numberOfBrokerNodes'] as int?,
      openMonitoring: json['openMonitoring'] != null
          ? OpenMonitoring.fromJson(
              json['openMonitoring'] as Map<String, dynamic>)
          : null,
      rebalancing: json['rebalancing'] != null
          ? Rebalancing.fromJson(json['rebalancing'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.let(ClusterState.fromString),
      stateInfo: json['stateInfo'] != null
          ? StateInfo.fromJson(json['stateInfo'] as Map<String, dynamic>)
          : null,
      storageMode:
          (json['storageMode'] as String?)?.let(StorageMode.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      zookeeperConnectString: json['zookeeperConnectString'] as String?,
      zookeeperConnectStringTls: json['zookeeperConnectStringTls'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeOperationArn = this.activeOperationArn;
    final brokerNodeGroupInfo = this.brokerNodeGroupInfo;
    final clientAuthentication = this.clientAuthentication;
    final clusterArn = this.clusterArn;
    final clusterName = this.clusterName;
    final creationTime = this.creationTime;
    final currentBrokerSoftwareInfo = this.currentBrokerSoftwareInfo;
    final currentVersion = this.currentVersion;
    final customerActionStatus = this.customerActionStatus;
    final encryptionInfo = this.encryptionInfo;
    final enhancedMonitoring = this.enhancedMonitoring;
    final loggingInfo = this.loggingInfo;
    final numberOfBrokerNodes = this.numberOfBrokerNodes;
    final openMonitoring = this.openMonitoring;
    final rebalancing = this.rebalancing;
    final state = this.state;
    final stateInfo = this.stateInfo;
    final storageMode = this.storageMode;
    final tags = this.tags;
    final zookeeperConnectString = this.zookeeperConnectString;
    final zookeeperConnectStringTls = this.zookeeperConnectStringTls;
    return {
      if (activeOperationArn != null) 'activeOperationArn': activeOperationArn,
      if (brokerNodeGroupInfo != null)
        'brokerNodeGroupInfo': brokerNodeGroupInfo,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterName != null) 'clusterName': clusterName,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (currentBrokerSoftwareInfo != null)
        'currentBrokerSoftwareInfo': currentBrokerSoftwareInfo,
      if (currentVersion != null) 'currentVersion': currentVersion,
      if (customerActionStatus != null)
        'customerActionStatus': customerActionStatus.value,
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.value,
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (numberOfBrokerNodes != null)
        'numberOfBrokerNodes': numberOfBrokerNodes,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
      if (rebalancing != null) 'rebalancing': rebalancing,
      if (state != null) 'state': state.value,
      if (stateInfo != null) 'stateInfo': stateInfo,
      if (storageMode != null) 'storageMode': storageMode.value,
      if (tags != null) 'tags': tags,
      if (zookeeperConnectString != null)
        'zookeeperConnectString': zookeeperConnectString,
      if (zookeeperConnectStringTls != null)
        'zookeeperConnectStringTls': zookeeperConnectStringTls,
    };
  }
}

/// JMX and Node monitoring for the MSK cluster.
///
/// @nodoc
class OpenMonitoring {
  /// Prometheus settings.
  final Prometheus prometheus;

  OpenMonitoring({
    required this.prometheus,
  });

  factory OpenMonitoring.fromJson(Map<String, dynamic> json) {
    return OpenMonitoring(
      prometheus: Prometheus.fromJson(
          (json['prometheus'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final prometheus = this.prometheus;
    return {
      'prometheus': prometheus,
    };
  }
}

/// Prometheus settings.
///
/// @nodoc
class Prometheus {
  /// Indicates whether you want to turn on or turn off the JMX Exporter.
  final JmxExporter? jmxExporter;

  /// Indicates whether you want to turn on or turn off the Node Exporter.
  final NodeExporter? nodeExporter;

  Prometheus({
    this.jmxExporter,
    this.nodeExporter,
  });

  factory Prometheus.fromJson(Map<String, dynamic> json) {
    return Prometheus(
      jmxExporter: json['jmxExporter'] != null
          ? JmxExporter.fromJson(json['jmxExporter'] as Map<String, dynamic>)
          : null,
      nodeExporter: json['nodeExporter'] != null
          ? NodeExporter.fromJson(json['nodeExporter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jmxExporter = this.jmxExporter;
    final nodeExporter = this.nodeExporter;
    return {
      if (jmxExporter != null) 'jmxExporter': jmxExporter,
      if (nodeExporter != null) 'nodeExporter': nodeExporter,
    };
  }
}

/// Indicates whether you want to turn on or turn off the JMX Exporter.
///
/// @nodoc
class JmxExporter {
  /// Indicates whether you want to turn on or turn off the JMX Exporter.
  final bool enabledInBroker;

  JmxExporter({
    required this.enabledInBroker,
  });

  factory JmxExporter.fromJson(Map<String, dynamic> json) {
    return JmxExporter(
      enabledInBroker: (json['enabledInBroker'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

/// Indicates whether you want to turn on or turn off the Node Exporter.
///
/// @nodoc
class NodeExporter {
  /// Indicates whether you want to turn on or turn off the Node Exporter.
  final bool enabledInBroker;

  NodeExporter({
    required this.enabledInBroker,
  });

  factory NodeExporter.fromJson(Map<String, dynamic> json) {
    return NodeExporter(
      enabledInBroker: (json['enabledInBroker'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

/// Returns information about a cluster operation.
///
/// @nodoc
class ClusterOperationV2Summary {
  /// ARN of the cluster.
  final String? clusterArn;

  /// Type of the backend cluster.
  final ClusterType? clusterType;

  /// The time at which the operation finished.
  final DateTime? endTime;

  /// ARN of the cluster operation.
  final String? operationArn;

  /// State of the cluster operation.
  final String? operationState;

  /// Type of the cluster operation.
  final String? operationType;

  /// The time at which operation was started.
  final DateTime? startTime;

  ClusterOperationV2Summary({
    this.clusterArn,
    this.clusterType,
    this.endTime,
    this.operationArn,
    this.operationState,
    this.operationType,
    this.startTime,
  });

  factory ClusterOperationV2Summary.fromJson(Map<String, dynamic> json) {
    return ClusterOperationV2Summary(
      clusterArn: json['clusterArn'] as String?,
      clusterType:
          (json['clusterType'] as String?)?.let(ClusterType.fromString),
      endTime: timeStampFromJson(json['endTime']),
      operationArn: json['operationArn'] as String?,
      operationState: json['operationState'] as String?,
      operationType: json['operationType'] as String?,
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterType = this.clusterType;
    final endTime = this.endTime;
    final operationArn = this.operationArn;
    final operationState = this.operationState;
    final operationType = this.operationType;
    final startTime = this.startTime;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterType != null) 'clusterType': clusterType.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (operationArn != null) 'operationArn': operationArn,
      if (operationState != null) 'operationState': operationState,
      if (operationType != null) 'operationType': operationType,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

/// Returns information about a cluster operation.
///
/// @nodoc
class ClusterOperationInfo {
  /// The ID of the API request that triggered this operation.
  final String? clientRequestId;

  /// ARN of the cluster.
  final String? clusterArn;

  /// The time that the operation was created.
  final DateTime? creationTime;

  /// The time at which the operation finished.
  final DateTime? endTime;

  /// Describes the error if the operation fails.
  final ErrorInfo? errorInfo;

  /// ARN of the cluster operation.
  final String? operationArn;

  /// State of the cluster operation.
  final String? operationState;

  /// Steps completed during the operation.
  final List<ClusterOperationStep>? operationSteps;

  /// Type of the cluster operation.
  final String? operationType;

  /// Information about cluster attributes before a cluster is updated.
  final MutableClusterInfo? sourceClusterInfo;

  /// Information about cluster attributes after a cluster is updated.
  final MutableClusterInfo? targetClusterInfo;

  /// Description of the VPC connection for CreateVpcConnection and
  /// DeleteVpcConnection operations.
  final VpcConnectionInfo? vpcConnectionInfo;

  ClusterOperationInfo({
    this.clientRequestId,
    this.clusterArn,
    this.creationTime,
    this.endTime,
    this.errorInfo,
    this.operationArn,
    this.operationState,
    this.operationSteps,
    this.operationType,
    this.sourceClusterInfo,
    this.targetClusterInfo,
    this.vpcConnectionInfo,
  });

  factory ClusterOperationInfo.fromJson(Map<String, dynamic> json) {
    return ClusterOperationInfo(
      clientRequestId: json['clientRequestId'] as String?,
      clusterArn: json['clusterArn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      endTime: timeStampFromJson(json['endTime']),
      errorInfo: json['errorInfo'] != null
          ? ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>)
          : null,
      operationArn: json['operationArn'] as String?,
      operationState: json['operationState'] as String?,
      operationSteps: (json['operationSteps'] as List?)
          ?.nonNulls
          .map((e) => ClusterOperationStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      operationType: json['operationType'] as String?,
      sourceClusterInfo: json['sourceClusterInfo'] != null
          ? MutableClusterInfo.fromJson(
              json['sourceClusterInfo'] as Map<String, dynamic>)
          : null,
      targetClusterInfo: json['targetClusterInfo'] != null
          ? MutableClusterInfo.fromJson(
              json['targetClusterInfo'] as Map<String, dynamic>)
          : null,
      vpcConnectionInfo: json['vpcConnectionInfo'] != null
          ? VpcConnectionInfo.fromJson(
              json['vpcConnectionInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientRequestId = this.clientRequestId;
    final clusterArn = this.clusterArn;
    final creationTime = this.creationTime;
    final endTime = this.endTime;
    final errorInfo = this.errorInfo;
    final operationArn = this.operationArn;
    final operationState = this.operationState;
    final operationSteps = this.operationSteps;
    final operationType = this.operationType;
    final sourceClusterInfo = this.sourceClusterInfo;
    final targetClusterInfo = this.targetClusterInfo;
    final vpcConnectionInfo = this.vpcConnectionInfo;
    return {
      if (clientRequestId != null) 'clientRequestId': clientRequestId,
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (operationArn != null) 'operationArn': operationArn,
      if (operationState != null) 'operationState': operationState,
      if (operationSteps != null) 'operationSteps': operationSteps,
      if (operationType != null) 'operationType': operationType,
      if (sourceClusterInfo != null) 'sourceClusterInfo': sourceClusterInfo,
      if (targetClusterInfo != null) 'targetClusterInfo': targetClusterInfo,
      if (vpcConnectionInfo != null) 'vpcConnectionInfo': vpcConnectionInfo,
    };
  }
}

/// Returns information about an error state of the cluster.
///
/// @nodoc
class ErrorInfo {
  /// A number describing the error programmatically.
  final String? errorCode;

  /// An optional field to provide more details about the error.
  final String? errorString;

  ErrorInfo({
    this.errorCode,
    this.errorString,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) {
    return ErrorInfo(
      errorCode: json['errorCode'] as String?,
      errorString: json['errorString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorString = this.errorString;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorString != null) 'errorString': errorString,
    };
  }
}

/// Information about cluster attributes that can be updated via update APIs.
///
/// @nodoc
class MutableClusterInfo {
  /// Describes brokers being changed during a broker count update.
  final BrokerCountUpdateInfo? brokerCountUpdateInfo;

  /// Specifies the size of the EBS volume and the ID of the associated broker.
  final List<BrokerEBSVolumeInfo>? brokerEBSVolumeInfo;

  /// Includes all client authentication information.
  final ClientAuthentication? clientAuthentication;

  /// Information about the changes in the configuration of the brokers.
  final ConfigurationInfo? configurationInfo;

  /// Information about the broker access configuration.
  final ConnectivityInfo? connectivityInfo;

  /// Includes all encryption-related information.
  final EncryptionInfo? encryptionInfo;

  /// Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon
  /// CloudWatch for this cluster.
  final EnhancedMonitoring? enhancedMonitoring;

  /// Information about the Amazon MSK broker type.
  final String? instanceType;

  /// The Apache Kafka version.
  final String? kafkaVersion;

  /// You can configure your MSK cluster to send broker logs to different
  /// destination types. This is a container for the configuration details related
  /// to broker logs.
  final LoggingInfo? loggingInfo;

  /// The number of broker nodes in the cluster.
  final int? numberOfBrokerNodes;

  /// The settings for open monitoring.
  final OpenMonitoring? openMonitoring;

  /// Describes the intelligent rebalancing configuration of an MSK Provisioned
  /// cluster with Express brokers.
  final Rebalancing? rebalancing;

  /// This controls storage mode for supported storage tiers.
  final StorageMode? storageMode;

  /// Access control settings for zookeeper
  final ZookeeperAccess? zookeeperAccess;

  MutableClusterInfo({
    this.brokerCountUpdateInfo,
    this.brokerEBSVolumeInfo,
    this.clientAuthentication,
    this.configurationInfo,
    this.connectivityInfo,
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.instanceType,
    this.kafkaVersion,
    this.loggingInfo,
    this.numberOfBrokerNodes,
    this.openMonitoring,
    this.rebalancing,
    this.storageMode,
    this.zookeeperAccess,
  });

  factory MutableClusterInfo.fromJson(Map<String, dynamic> json) {
    return MutableClusterInfo(
      brokerCountUpdateInfo: json['brokerCountUpdateInfo'] != null
          ? BrokerCountUpdateInfo.fromJson(
              json['brokerCountUpdateInfo'] as Map<String, dynamic>)
          : null,
      brokerEBSVolumeInfo: (json['brokerEBSVolumeInfo'] as List?)
          ?.nonNulls
          .map((e) => BrokerEBSVolumeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientAuthentication: json['clientAuthentication'] != null
          ? ClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
      configurationInfo: json['configurationInfo'] != null
          ? ConfigurationInfo.fromJson(
              json['configurationInfo'] as Map<String, dynamic>)
          : null,
      connectivityInfo: json['connectivityInfo'] != null
          ? ConnectivityInfo.fromJson(
              json['connectivityInfo'] as Map<String, dynamic>)
          : null,
      encryptionInfo: json['encryptionInfo'] != null
          ? EncryptionInfo.fromJson(
              json['encryptionInfo'] as Map<String, dynamic>)
          : null,
      enhancedMonitoring: (json['enhancedMonitoring'] as String?)
          ?.let(EnhancedMonitoring.fromString),
      instanceType: json['instanceType'] as String?,
      kafkaVersion: json['kafkaVersion'] as String?,
      loggingInfo: json['loggingInfo'] != null
          ? LoggingInfo.fromJson(json['loggingInfo'] as Map<String, dynamic>)
          : null,
      numberOfBrokerNodes: json['numberOfBrokerNodes'] as int?,
      openMonitoring: json['openMonitoring'] != null
          ? OpenMonitoring.fromJson(
              json['openMonitoring'] as Map<String, dynamic>)
          : null,
      rebalancing: json['rebalancing'] != null
          ? Rebalancing.fromJson(json['rebalancing'] as Map<String, dynamic>)
          : null,
      storageMode:
          (json['storageMode'] as String?)?.let(StorageMode.fromString),
      zookeeperAccess: json['zookeeperAccess'] != null
          ? ZookeeperAccess.fromJson(
              json['zookeeperAccess'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final brokerCountUpdateInfo = this.brokerCountUpdateInfo;
    final brokerEBSVolumeInfo = this.brokerEBSVolumeInfo;
    final clientAuthentication = this.clientAuthentication;
    final configurationInfo = this.configurationInfo;
    final connectivityInfo = this.connectivityInfo;
    final encryptionInfo = this.encryptionInfo;
    final enhancedMonitoring = this.enhancedMonitoring;
    final instanceType = this.instanceType;
    final kafkaVersion = this.kafkaVersion;
    final loggingInfo = this.loggingInfo;
    final numberOfBrokerNodes = this.numberOfBrokerNodes;
    final openMonitoring = this.openMonitoring;
    final rebalancing = this.rebalancing;
    final storageMode = this.storageMode;
    final zookeeperAccess = this.zookeeperAccess;
    return {
      if (brokerCountUpdateInfo != null)
        'brokerCountUpdateInfo': brokerCountUpdateInfo,
      if (brokerEBSVolumeInfo != null)
        'brokerEBSVolumeInfo': brokerEBSVolumeInfo,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (configurationInfo != null) 'configurationInfo': configurationInfo,
      if (connectivityInfo != null) 'connectivityInfo': connectivityInfo,
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.value,
      if (instanceType != null) 'instanceType': instanceType,
      if (kafkaVersion != null) 'kafkaVersion': kafkaVersion,
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (numberOfBrokerNodes != null)
        'numberOfBrokerNodes': numberOfBrokerNodes,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
      if (rebalancing != null) 'rebalancing': rebalancing,
      if (storageMode != null) 'storageMode': storageMode.value,
      if (zookeeperAccess != null) 'zookeeperAccess': zookeeperAccess,
    };
  }
}

/// Description of the VPC connection.
///
/// @nodoc
class VpcConnectionInfo {
  /// The time when Amazon MSK creates the VPC Connnection.
  final DateTime? creationTime;

  /// The owner of the VPC Connection.
  final String? owner;

  /// Description of the requester that calls the API operation.
  final UserIdentity? userIdentity;

  /// The Amazon Resource Name (ARN) of the VPC connection.
  final String? vpcConnectionArn;

  VpcConnectionInfo({
    this.creationTime,
    this.owner,
    this.userIdentity,
    this.vpcConnectionArn,
  });

  factory VpcConnectionInfo.fromJson(Map<String, dynamic> json) {
    return VpcConnectionInfo(
      creationTime: timeStampFromJson(json['creationTime']),
      owner: json['owner'] as String?,
      userIdentity: json['userIdentity'] != null
          ? UserIdentity.fromJson(json['userIdentity'] as Map<String, dynamic>)
          : null,
      vpcConnectionArn: json['vpcConnectionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final owner = this.owner;
    final userIdentity = this.userIdentity;
    final vpcConnectionArn = this.vpcConnectionArn;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (owner != null) 'owner': owner,
      if (userIdentity != null) 'userIdentity': userIdentity,
      if (vpcConnectionArn != null) 'vpcConnectionArn': vpcConnectionArn,
    };
  }
}

/// Description of the requester that calls the API operation.
///
/// @nodoc
class UserIdentity {
  /// A unique identifier for the requester that calls the API operation.
  final String? principalId;

  /// The identity type of the requester that calls the API operation.
  final UserIdentityType? type;

  UserIdentity({
    this.principalId,
    this.type,
  });

  factory UserIdentity.fromJson(Map<String, dynamic> json) {
    return UserIdentity(
      principalId: json['principalId'] as String?,
      type: (json['type'] as String?)?.let(UserIdentityType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final principalId = this.principalId;
    final type = this.type;
    return {
      if (principalId != null) 'principalId': principalId,
      if (type != null) 'type': type.value,
    };
  }
}

/// The identity type of the requester that calls the API operation.
///
/// @nodoc
class UserIdentityType {
  static const awsaccount = UserIdentityType._('AWSACCOUNT');
  static const awsservice = UserIdentityType._('AWSSERVICE');

  final String value;

  const UserIdentityType._(this.value);

  static const values = [awsaccount, awsservice];

  static UserIdentityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UserIdentityType._(value));

  @override
  bool operator ==(other) => other is UserIdentityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information regarding UpdateBrokerCount.
///
/// @nodoc
class BrokerCountUpdateInfo {
  /// Kafka Broker IDs of brokers being created.
  final List<double>? createdBrokerIds;

  /// Kafka Broker IDs of brokers being deleted.
  final List<double>? deletedBrokerIds;

  BrokerCountUpdateInfo({
    this.createdBrokerIds,
    this.deletedBrokerIds,
  });

  factory BrokerCountUpdateInfo.fromJson(Map<String, dynamic> json) {
    return BrokerCountUpdateInfo(
      createdBrokerIds: (json['createdBrokerIds'] as List?)
          ?.nonNulls
          .map((e) => _s.parseJsonDouble(e)!)
          .toList(),
      deletedBrokerIds: (json['deletedBrokerIds'] as List?)
          ?.nonNulls
          .map((e) => _s.parseJsonDouble(e)!)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBrokerIds = this.createdBrokerIds;
    final deletedBrokerIds = this.deletedBrokerIds;
    return {
      if (createdBrokerIds != null)
        'createdBrokerIds': createdBrokerIds.map(_s.encodeJsonDouble).toList(),
      if (deletedBrokerIds != null)
        'deletedBrokerIds': deletedBrokerIds.map(_s.encodeJsonDouble).toList(),
    };
  }
}

/// Step taken during a cluster operation.
///
/// @nodoc
class ClusterOperationStep {
  /// Information about the step and its status.
  final ClusterOperationStepInfo? stepInfo;

  /// The name of the step.
  final String? stepName;

  ClusterOperationStep({
    this.stepInfo,
    this.stepName,
  });

  factory ClusterOperationStep.fromJson(Map<String, dynamic> json) {
    return ClusterOperationStep(
      stepInfo: json['stepInfo'] != null
          ? ClusterOperationStepInfo.fromJson(
              json['stepInfo'] as Map<String, dynamic>)
          : null,
      stepName: json['stepName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepInfo = this.stepInfo;
    final stepName = this.stepName;
    return {
      if (stepInfo != null) 'stepInfo': stepInfo,
      if (stepName != null) 'stepName': stepName,
    };
  }
}

/// State information about the operation step.
///
/// @nodoc
class ClusterOperationStepInfo {
  /// The steps current status.
  final String? stepStatus;

  ClusterOperationStepInfo({
    this.stepStatus,
  });

  factory ClusterOperationStepInfo.fromJson(Map<String, dynamic> json) {
    return ClusterOperationStepInfo(
      stepStatus: json['stepStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepStatus = this.stepStatus;
    return {
      if (stepStatus != null) 'stepStatus': stepStatus,
    };
  }
}

/// The client VPC connection object.
///
/// @nodoc
class ClientVpcConnection {
  /// The ARN that identifies the Vpc Connection.
  final String vpcConnectionArn;

  /// Information about the auth scheme of Vpc Connection.
  final String? authentication;

  /// Creation time of the Vpc Connection.
  final DateTime? creationTime;

  /// The Owner of the Vpc Connection.
  final String? owner;

  /// State of the Vpc Connection.
  final VpcConnectionState? state;

  ClientVpcConnection({
    required this.vpcConnectionArn,
    this.authentication,
    this.creationTime,
    this.owner,
    this.state,
  });

  factory ClientVpcConnection.fromJson(Map<String, dynamic> json) {
    return ClientVpcConnection(
      vpcConnectionArn: (json['vpcConnectionArn'] as String?) ?? '',
      authentication: json['authentication'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      owner: json['owner'] as String?,
      state: (json['state'] as String?)?.let(VpcConnectionState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final vpcConnectionArn = this.vpcConnectionArn;
    final authentication = this.authentication;
    final creationTime = this.creationTime;
    final owner = this.owner;
    final state = this.state;
    return {
      'vpcConnectionArn': vpcConnectionArn,
      if (authentication != null) 'authentication': authentication,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (owner != null) 'owner': owner,
      if (state != null) 'state': state.value,
    };
  }
}

/// Contains source Apache Kafka versions and compatible target Apache Kafka
/// versions.
///
/// @nodoc
class CompatibleKafkaVersion {
  /// An Apache Kafka version.
  final String? sourceVersion;

  /// A list of Apache Kafka versions.
  final List<String>? targetVersions;

  CompatibleKafkaVersion({
    this.sourceVersion,
    this.targetVersions,
  });

  factory CompatibleKafkaVersion.fromJson(Map<String, dynamic> json) {
    return CompatibleKafkaVersion(
      sourceVersion: json['sourceVersion'] as String?,
      targetVersions: (json['targetVersions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceVersion = this.sourceVersion;
    final targetVersions = this.targetVersions;
    return {
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
      if (targetVersions != null) 'targetVersions': targetVersions,
    };
  }
}

/// Contains information about a topic partition.
///
/// @nodoc
class TopicPartitionInfo {
  /// The list of in-sync replica broker IDs for the partition.
  final List<int>? isr;

  /// The leader broker ID for the partition.
  final int? leader;

  /// The partition ID.
  final int? partition;

  /// The list of replica broker IDs for the partition.
  final List<int>? replicas;

  TopicPartitionInfo({
    this.isr,
    this.leader,
    this.partition,
    this.replicas,
  });

  factory TopicPartitionInfo.fromJson(Map<String, dynamic> json) {
    return TopicPartitionInfo(
      isr: (json['isr'] as List?)?.nonNulls.map((e) => e as int).toList(),
      leader: json['leader'] as int?,
      partition: json['partition'] as int?,
      replicas:
          (json['replicas'] as List?)?.nonNulls.map((e) => e as int).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final isr = this.isr;
    final leader = this.leader;
    final partition = this.partition;
    final replicas = this.replicas;
    return {
      if (isr != null) 'isr': isr,
      if (leader != null) 'leader': leader,
      if (partition != null) 'partition': partition,
      if (replicas != null) 'replicas': replicas,
    };
  }
}

/// Details about the state of a replicator
///
/// @nodoc
class ReplicationStateInfo {
  /// Code that describes the current state of the replicator.
  final String? code;

  /// Message that describes the state of the replicator.
  final String? message;

  ReplicationStateInfo({
    this.code,
    this.message,
  });

  factory ReplicationStateInfo.fromJson(Map<String, dynamic> json) {
    return ReplicationStateInfo(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

/// Specifies configuration for replication between a source and target Kafka
/// cluster (sourceKafkaClusterAlias -> targetKafkaClusterAlias)
///
/// @nodoc
class ReplicationInfoDescription {
  /// Configuration relating to consumer group replication.
  final ConsumerGroupReplication? consumerGroupReplication;

  /// The alias of the source Kafka cluster.
  final String? sourceKafkaClusterAlias;

  /// The compression type to use when producing records to target cluster.
  final TargetCompressionType? targetCompressionType;

  /// The alias of the target Kafka cluster.
  final String? targetKafkaClusterAlias;

  /// Configuration relating to topic replication.
  final TopicReplication? topicReplication;

  ReplicationInfoDescription({
    this.consumerGroupReplication,
    this.sourceKafkaClusterAlias,
    this.targetCompressionType,
    this.targetKafkaClusterAlias,
    this.topicReplication,
  });

  factory ReplicationInfoDescription.fromJson(Map<String, dynamic> json) {
    return ReplicationInfoDescription(
      consumerGroupReplication: json['consumerGroupReplication'] != null
          ? ConsumerGroupReplication.fromJson(
              json['consumerGroupReplication'] as Map<String, dynamic>)
          : null,
      sourceKafkaClusterAlias: json['sourceKafkaClusterAlias'] as String?,
      targetCompressionType: (json['targetCompressionType'] as String?)
          ?.let(TargetCompressionType.fromString),
      targetKafkaClusterAlias: json['targetKafkaClusterAlias'] as String?,
      topicReplication: json['topicReplication'] != null
          ? TopicReplication.fromJson(
              json['topicReplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final consumerGroupReplication = this.consumerGroupReplication;
    final sourceKafkaClusterAlias = this.sourceKafkaClusterAlias;
    final targetCompressionType = this.targetCompressionType;
    final targetKafkaClusterAlias = this.targetKafkaClusterAlias;
    final topicReplication = this.topicReplication;
    return {
      if (consumerGroupReplication != null)
        'consumerGroupReplication': consumerGroupReplication,
      if (sourceKafkaClusterAlias != null)
        'sourceKafkaClusterAlias': sourceKafkaClusterAlias,
      if (targetCompressionType != null)
        'targetCompressionType': targetCompressionType.value,
      if (targetKafkaClusterAlias != null)
        'targetKafkaClusterAlias': targetKafkaClusterAlias,
      if (topicReplication != null) 'topicReplication': topicReplication,
    };
  }
}

/// Details about consumer group replication.
///
/// @nodoc
class ConsumerGroupReplication {
  /// List of regular expression patterns indicating the consumer groups to copy.
  final List<String> consumerGroupsToReplicate;

  /// The consumer group offset synchronization mode. With LEGACY, offsets are
  /// synchronized when producers write to the source cluster. With ENHANCED,
  /// consumer offsets are synchronized regardless of producer location. ENHANCED
  /// requires a corresponding replicator that replicates data from the target
  /// cluster to the source cluster.
  final ConsumerGroupOffsetSyncMode? consumerGroupOffsetSyncMode;

  /// List of regular expression patterns indicating the consumer groups that
  /// should not be replicated.
  final List<String>? consumerGroupsToExclude;

  /// Enables synchronization of consumer groups to target cluster.
  final bool? detectAndCopyNewConsumerGroups;

  /// Enables synchronization of consumer group offsets to target cluster. The
  /// translated offsets will be written to topic __consumer_offsets.
  final bool? synchroniseConsumerGroupOffsets;

  ConsumerGroupReplication({
    required this.consumerGroupsToReplicate,
    this.consumerGroupOffsetSyncMode,
    this.consumerGroupsToExclude,
    this.detectAndCopyNewConsumerGroups,
    this.synchroniseConsumerGroupOffsets,
  });

  factory ConsumerGroupReplication.fromJson(Map<String, dynamic> json) {
    return ConsumerGroupReplication(
      consumerGroupsToReplicate:
          ((json['consumerGroupsToReplicate'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      consumerGroupOffsetSyncMode:
          (json['consumerGroupOffsetSyncMode'] as String?)
              ?.let(ConsumerGroupOffsetSyncMode.fromString),
      consumerGroupsToExclude: (json['consumerGroupsToExclude'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      detectAndCopyNewConsumerGroups:
          json['detectAndCopyNewConsumerGroups'] as bool?,
      synchroniseConsumerGroupOffsets:
          json['synchroniseConsumerGroupOffsets'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumerGroupsToReplicate = this.consumerGroupsToReplicate;
    final consumerGroupOffsetSyncMode = this.consumerGroupOffsetSyncMode;
    final consumerGroupsToExclude = this.consumerGroupsToExclude;
    final detectAndCopyNewConsumerGroups = this.detectAndCopyNewConsumerGroups;
    final synchroniseConsumerGroupOffsets =
        this.synchroniseConsumerGroupOffsets;
    return {
      'consumerGroupsToReplicate': consumerGroupsToReplicate,
      if (consumerGroupOffsetSyncMode != null)
        'consumerGroupOffsetSyncMode': consumerGroupOffsetSyncMode.value,
      if (consumerGroupsToExclude != null)
        'consumerGroupsToExclude': consumerGroupsToExclude,
      if (detectAndCopyNewConsumerGroups != null)
        'detectAndCopyNewConsumerGroups': detectAndCopyNewConsumerGroups,
      if (synchroniseConsumerGroupOffsets != null)
        'synchroniseConsumerGroupOffsets': synchroniseConsumerGroupOffsets,
    };
  }
}

/// The type of compression to use producing records to the target cluster.
///
/// @nodoc
class TargetCompressionType {
  static const none = TargetCompressionType._('NONE');
  static const gzip = TargetCompressionType._('GZIP');
  static const snappy = TargetCompressionType._('SNAPPY');
  static const lz4 = TargetCompressionType._('LZ4');
  static const zstd = TargetCompressionType._('ZSTD');

  final String value;

  const TargetCompressionType._(this.value);

  static const values = [none, gzip, snappy, lz4, zstd];

  static TargetCompressionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetCompressionType._(value));

  @override
  bool operator ==(other) =>
      other is TargetCompressionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about topic replication.
///
/// @nodoc
class TopicReplication {
  /// List of regular expression patterns indicating the topics to copy.
  final List<String> topicsToReplicate;

  /// Whether to periodically configure remote topic ACLs to match their
  /// corresponding upstream topics.
  final bool? copyAccessControlListsForTopics;

  /// Whether to periodically configure remote topics to match their corresponding
  /// upstream topics.
  final bool? copyTopicConfigurations;

  /// Whether to periodically check for new topics and partitions.
  final bool? detectAndCopyNewTopics;

  /// Configuration for specifying the position in the topics to start replicating
  /// from.
  final ReplicationStartingPosition? startingPosition;

  /// Configuration for specifying replicated topic names should be the same as
  /// their corresponding upstream topics or prefixed with source cluster alias.
  final ReplicationTopicNameConfiguration? topicNameConfiguration;

  /// List of regular expression patterns indicating the topics that should not be
  /// replicated.
  final List<String>? topicsToExclude;

  TopicReplication({
    required this.topicsToReplicate,
    this.copyAccessControlListsForTopics,
    this.copyTopicConfigurations,
    this.detectAndCopyNewTopics,
    this.startingPosition,
    this.topicNameConfiguration,
    this.topicsToExclude,
  });

  factory TopicReplication.fromJson(Map<String, dynamic> json) {
    return TopicReplication(
      topicsToReplicate: ((json['topicsToReplicate'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      copyAccessControlListsForTopics:
          json['copyAccessControlListsForTopics'] as bool?,
      copyTopicConfigurations: json['copyTopicConfigurations'] as bool?,
      detectAndCopyNewTopics: json['detectAndCopyNewTopics'] as bool?,
      startingPosition: json['startingPosition'] != null
          ? ReplicationStartingPosition.fromJson(
              json['startingPosition'] as Map<String, dynamic>)
          : null,
      topicNameConfiguration: json['topicNameConfiguration'] != null
          ? ReplicationTopicNameConfiguration.fromJson(
              json['topicNameConfiguration'] as Map<String, dynamic>)
          : null,
      topicsToExclude: (json['topicsToExclude'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final topicsToReplicate = this.topicsToReplicate;
    final copyAccessControlListsForTopics =
        this.copyAccessControlListsForTopics;
    final copyTopicConfigurations = this.copyTopicConfigurations;
    final detectAndCopyNewTopics = this.detectAndCopyNewTopics;
    final startingPosition = this.startingPosition;
    final topicNameConfiguration = this.topicNameConfiguration;
    final topicsToExclude = this.topicsToExclude;
    return {
      'topicsToReplicate': topicsToReplicate,
      if (copyAccessControlListsForTopics != null)
        'copyAccessControlListsForTopics': copyAccessControlListsForTopics,
      if (copyTopicConfigurations != null)
        'copyTopicConfigurations': copyTopicConfigurations,
      if (detectAndCopyNewTopics != null)
        'detectAndCopyNewTopics': detectAndCopyNewTopics,
      if (startingPosition != null) 'startingPosition': startingPosition,
      if (topicNameConfiguration != null)
        'topicNameConfiguration': topicNameConfiguration,
      if (topicsToExclude != null) 'topicsToExclude': topicsToExclude,
    };
  }
}

/// Configuration for specifying the position in the topics to start replicating
/// from.
///
/// @nodoc
class ReplicationStartingPosition {
  /// The type of replication starting position.
  final ReplicationStartingPositionType? type;

  ReplicationStartingPosition({
    this.type,
  });

  factory ReplicationStartingPosition.fromJson(Map<String, dynamic> json) {
    return ReplicationStartingPosition(
      type: (json['type'] as String?)
          ?.let(ReplicationStartingPositionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type.value,
    };
  }
}

/// Configuration for specifying replicated topic names should be the same as
/// their corresponding upstream topics or prefixed with source cluster alias.
///
/// @nodoc
class ReplicationTopicNameConfiguration {
  /// The type of replicated topic name.
  final ReplicationTopicNameConfigurationType? type;

  ReplicationTopicNameConfiguration({
    this.type,
  });

  factory ReplicationTopicNameConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ReplicationTopicNameConfiguration(
      type: (json['type'] as String?)
          ?.let(ReplicationTopicNameConfigurationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type.value,
    };
  }
}

/// The type of replicated topic name.
///
/// @nodoc
class ReplicationTopicNameConfigurationType {
  static const prefixedWithSourceClusterAlias =
      ReplicationTopicNameConfigurationType._(
          'PREFIXED_WITH_SOURCE_CLUSTER_ALIAS');
  static const identical = ReplicationTopicNameConfigurationType._('IDENTICAL');

  final String value;

  const ReplicationTopicNameConfigurationType._(this.value);

  static const values = [prefixedWithSourceClusterAlias, identical];

  static ReplicationTopicNameConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationTopicNameConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is ReplicationTopicNameConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The type of replication starting position.
///
/// @nodoc
class ReplicationStartingPositionType {
  static const latest = ReplicationStartingPositionType._('LATEST');
  static const earliest = ReplicationStartingPositionType._('EARLIEST');

  final String value;

  const ReplicationStartingPositionType._(this.value);

  static const values = [latest, earliest];

  static ReplicationStartingPositionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationStartingPositionType._(value));

  @override
  bool operator ==(other) =>
      other is ReplicationStartingPositionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The consumer group offset synchronization mode. With LEGACY, offsets are
/// synchronized when producers write to the source cluster. With ENHANCED,
/// consumer offsets are synchronized regardless of producer location. ENHANCED
/// requires a corresponding replicator that replicates data from the target
/// cluster to the source cluster.
///
/// @nodoc
class ConsumerGroupOffsetSyncMode {
  static const legacy = ConsumerGroupOffsetSyncMode._('LEGACY');
  static const enhanced = ConsumerGroupOffsetSyncMode._('ENHANCED');

  final String value;

  const ConsumerGroupOffsetSyncMode._(this.value);

  static const values = [legacy, enhanced];

  static ConsumerGroupOffsetSyncMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConsumerGroupOffsetSyncMode._(value));

  @override
  bool operator ==(other) =>
      other is ConsumerGroupOffsetSyncMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about Kafka Cluster used as source / target for replication.
///
/// @nodoc
class KafkaClusterDescription {
  /// Details of an Amazon MSK Cluster.
  final AmazonMskCluster? amazonMskCluster;

  /// Details of an Apache Kafka Cluster.
  final ApacheKafkaCluster? apacheKafkaCluster;

  /// Details of the client authentication used by the Apache Kafka cluster.
  final KafkaClusterClientAuthentication? clientAuthentication;

  /// Details of encryption in transit to the Apache Kafka cluster.
  final KafkaClusterEncryptionInTransit? encryptionInTransit;

  /// The alias of the Kafka cluster. Used to prefix names of replicated topics.
  final String? kafkaClusterAlias;

  /// Details of an Amazon VPC which has network connectivity to the Apache Kafka
  /// cluster.
  final KafkaClusterClientVpcConfig? vpcConfig;

  KafkaClusterDescription({
    this.amazonMskCluster,
    this.apacheKafkaCluster,
    this.clientAuthentication,
    this.encryptionInTransit,
    this.kafkaClusterAlias,
    this.vpcConfig,
  });

  factory KafkaClusterDescription.fromJson(Map<String, dynamic> json) {
    return KafkaClusterDescription(
      amazonMskCluster: json['amazonMskCluster'] != null
          ? AmazonMskCluster.fromJson(
              json['amazonMskCluster'] as Map<String, dynamic>)
          : null,
      apacheKafkaCluster: json['apacheKafkaCluster'] != null
          ? ApacheKafkaCluster.fromJson(
              json['apacheKafkaCluster'] as Map<String, dynamic>)
          : null,
      clientAuthentication: json['clientAuthentication'] != null
          ? KafkaClusterClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
      encryptionInTransit: json['encryptionInTransit'] != null
          ? KafkaClusterEncryptionInTransit.fromJson(
              json['encryptionInTransit'] as Map<String, dynamic>)
          : null,
      kafkaClusterAlias: json['kafkaClusterAlias'] as String?,
      vpcConfig: json['vpcConfig'] != null
          ? KafkaClusterClientVpcConfig.fromJson(
              json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonMskCluster = this.amazonMskCluster;
    final apacheKafkaCluster = this.apacheKafkaCluster;
    final clientAuthentication = this.clientAuthentication;
    final encryptionInTransit = this.encryptionInTransit;
    final kafkaClusterAlias = this.kafkaClusterAlias;
    final vpcConfig = this.vpcConfig;
    return {
      if (amazonMskCluster != null) 'amazonMskCluster': amazonMskCluster,
      if (apacheKafkaCluster != null) 'apacheKafkaCluster': apacheKafkaCluster,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (encryptionInTransit != null)
        'encryptionInTransit': encryptionInTransit,
      if (kafkaClusterAlias != null) 'kafkaClusterAlias': kafkaClusterAlias,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// Details of an Amazon VPC which has network connectivity to the Apache Kafka
/// cluster.
///
/// @nodoc
class KafkaClusterClientVpcConfig {
  /// The list of subnets in the client VPC to connect to.
  final List<String> subnetIds;

  /// The security groups to attach to the ENIs for the broker nodes.
  final List<String>? securityGroupIds;

  KafkaClusterClientVpcConfig({
    required this.subnetIds,
    this.securityGroupIds,
  });

  factory KafkaClusterClientVpcConfig.fromJson(Map<String, dynamic> json) {
    return KafkaClusterClientVpcConfig(
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetIds = this.subnetIds;
    final securityGroupIds = this.securityGroupIds;
    return {
      'subnetIds': subnetIds,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
    };
  }
}

/// Details of the client authentication used by the Apache Kafka cluster.
///
/// @nodoc
class KafkaClusterClientAuthentication {
  /// Details for SASL/SCRAM client authentication.
  final KafkaClusterSaslScramAuthentication saslScram;

  KafkaClusterClientAuthentication({
    required this.saslScram,
  });

  factory KafkaClusterClientAuthentication.fromJson(Map<String, dynamic> json) {
    return KafkaClusterClientAuthentication(
      saslScram: KafkaClusterSaslScramAuthentication.fromJson(
          (json['saslScram'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final saslScram = this.saslScram;
    return {
      'saslScram': saslScram,
    };
  }
}

/// Details of encryption in transit to the Apache Kafka cluster.
///
/// @nodoc
class KafkaClusterEncryptionInTransit {
  /// The type of encryption in transit to the Apache Kafka cluster.
  final KafkaClusterEncryptionInTransitType encryptionType;

  /// The root CA certificate.
  final String? rootCaCertificate;

  KafkaClusterEncryptionInTransit({
    required this.encryptionType,
    this.rootCaCertificate,
  });

  factory KafkaClusterEncryptionInTransit.fromJson(Map<String, dynamic> json) {
    return KafkaClusterEncryptionInTransit(
      encryptionType: KafkaClusterEncryptionInTransitType.fromString(
          (json['encryptionType'] as String?) ?? ''),
      rootCaCertificate: json['rootCaCertificate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    final rootCaCertificate = this.rootCaCertificate;
    return {
      'encryptionType': encryptionType.value,
      if (rootCaCertificate != null) 'rootCaCertificate': rootCaCertificate,
    };
  }
}

/// The type of encryption in transit to the Apache Kafka cluster.
///
/// @nodoc
class KafkaClusterEncryptionInTransitType {
  static const tls = KafkaClusterEncryptionInTransitType._('TLS');

  final String value;

  const KafkaClusterEncryptionInTransitType._(this.value);

  static const values = [tls];

  static KafkaClusterEncryptionInTransitType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KafkaClusterEncryptionInTransitType._(value));

  @override
  bool operator ==(other) =>
      other is KafkaClusterEncryptionInTransitType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details for SASL/SCRAM client authentication.
///
/// @nodoc
class KafkaClusterSaslScramAuthentication {
  /// The SASL/SCRAM authentication mechanism.
  final KafkaClusterSaslScramMechanism mechanism;

  /// The Amazon Resource Name (ARN) of the Secrets Manager secret.
  final String secretArn;

  KafkaClusterSaslScramAuthentication({
    required this.mechanism,
    required this.secretArn,
  });

  factory KafkaClusterSaslScramAuthentication.fromJson(
      Map<String, dynamic> json) {
    return KafkaClusterSaslScramAuthentication(
      mechanism: KafkaClusterSaslScramMechanism.fromString(
          (json['mechanism'] as String?) ?? ''),
      secretArn: (json['secretArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final mechanism = this.mechanism;
    final secretArn = this.secretArn;
    return {
      'mechanism': mechanism.value,
      'secretArn': secretArn,
    };
  }
}

/// The SASL/SCRAM authentication mechanism.
///
/// @nodoc
class KafkaClusterSaslScramMechanism {
  static const sha256 = KafkaClusterSaslScramMechanism._('SHA256');
  static const sha512 = KafkaClusterSaslScramMechanism._('SHA512');

  final String value;

  const KafkaClusterSaslScramMechanism._(this.value);

  static const values = [sha256, sha512];

  static KafkaClusterSaslScramMechanism fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KafkaClusterSaslScramMechanism._(value));

  @override
  bool operator ==(other) =>
      other is KafkaClusterSaslScramMechanism && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Returns information about a cluster operation.
///
/// @nodoc
class ClusterOperationV2 {
  /// ARN of the cluster.
  final String? clusterArn;

  /// Type of the backend cluster.
  final ClusterType? clusterType;

  /// The time at which the operation finished.
  final DateTime? endTime;

  /// If cluster operation failed from an error, it describes the error.
  final ErrorInfo? errorInfo;

  /// ARN of the cluster operation.
  final String? operationArn;

  /// State of the cluster operation.
  final String? operationState;

  /// Type of the cluster operation.
  final String? operationType;

  /// Properties of a provisioned cluster.
  final ClusterOperationV2Provisioned? provisioned;

  /// Properties of a serverless cluster.
  final ClusterOperationV2Serverless? serverless;

  /// The time at which operation was started.
  final DateTime? startTime;

  ClusterOperationV2({
    this.clusterArn,
    this.clusterType,
    this.endTime,
    this.errorInfo,
    this.operationArn,
    this.operationState,
    this.operationType,
    this.provisioned,
    this.serverless,
    this.startTime,
  });

  factory ClusterOperationV2.fromJson(Map<String, dynamic> json) {
    return ClusterOperationV2(
      clusterArn: json['clusterArn'] as String?,
      clusterType:
          (json['clusterType'] as String?)?.let(ClusterType.fromString),
      endTime: timeStampFromJson(json['endTime']),
      errorInfo: json['errorInfo'] != null
          ? ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>)
          : null,
      operationArn: json['operationArn'] as String?,
      operationState: json['operationState'] as String?,
      operationType: json['operationType'] as String?,
      provisioned: json['provisioned'] != null
          ? ClusterOperationV2Provisioned.fromJson(
              json['provisioned'] as Map<String, dynamic>)
          : null,
      serverless: json['serverless'] != null
          ? ClusterOperationV2Serverless.fromJson(
              json['serverless'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterType = this.clusterType;
    final endTime = this.endTime;
    final errorInfo = this.errorInfo;
    final operationArn = this.operationArn;
    final operationState = this.operationState;
    final operationType = this.operationType;
    final provisioned = this.provisioned;
    final serverless = this.serverless;
    final startTime = this.startTime;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterType != null) 'clusterType': clusterType.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (operationArn != null) 'operationArn': operationArn,
      if (operationState != null) 'operationState': operationState,
      if (operationType != null) 'operationType': operationType,
      if (provisioned != null) 'provisioned': provisioned,
      if (serverless != null) 'serverless': serverless,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

/// Returns information about a provisioned cluster operation.
///
/// @nodoc
class ClusterOperationV2Provisioned {
  /// Steps completed during the operation.
  final List<ClusterOperationStep>? operationSteps;

  /// Information about cluster attributes before a cluster is updated.
  final MutableClusterInfo? sourceClusterInfo;

  /// Information about cluster attributes after a cluster is updated.
  final MutableClusterInfo? targetClusterInfo;

  /// Description of the VPC connection for CreateVpcConnection and
  /// DeleteVpcConnection operations.
  final VpcConnectionInfo? vpcConnectionInfo;

  ClusterOperationV2Provisioned({
    this.operationSteps,
    this.sourceClusterInfo,
    this.targetClusterInfo,
    this.vpcConnectionInfo,
  });

  factory ClusterOperationV2Provisioned.fromJson(Map<String, dynamic> json) {
    return ClusterOperationV2Provisioned(
      operationSteps: (json['operationSteps'] as List?)
          ?.nonNulls
          .map((e) => ClusterOperationStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceClusterInfo: json['sourceClusterInfo'] != null
          ? MutableClusterInfo.fromJson(
              json['sourceClusterInfo'] as Map<String, dynamic>)
          : null,
      targetClusterInfo: json['targetClusterInfo'] != null
          ? MutableClusterInfo.fromJson(
              json['targetClusterInfo'] as Map<String, dynamic>)
          : null,
      vpcConnectionInfo: json['vpcConnectionInfo'] != null
          ? VpcConnectionInfo.fromJson(
              json['vpcConnectionInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operationSteps = this.operationSteps;
    final sourceClusterInfo = this.sourceClusterInfo;
    final targetClusterInfo = this.targetClusterInfo;
    final vpcConnectionInfo = this.vpcConnectionInfo;
    return {
      if (operationSteps != null) 'operationSteps': operationSteps,
      if (sourceClusterInfo != null) 'sourceClusterInfo': sourceClusterInfo,
      if (targetClusterInfo != null) 'targetClusterInfo': targetClusterInfo,
      if (vpcConnectionInfo != null) 'vpcConnectionInfo': vpcConnectionInfo,
    };
  }
}

/// Returns information about a serverless cluster operation.
///
/// @nodoc
class ClusterOperationV2Serverless {
  /// Describes the cluster's attributes before any updates are applied. For
  /// example, networkType, which can be either IPv4 or DUAL.
  final ServerlessConnectivityInfo? sourceClusterInfo;

  /// Describes the cluster's attributes after any updates are applied. For
  /// example, networkType, which can be either IPv4 or DUAL.
  final ServerlessConnectivityInfo? targetClusterInfo;

  /// Description of the VPC connection for CreateVpcConnection and
  /// DeleteVpcConnection operations.
  final VpcConnectionInfoServerless? vpcConnectionInfo;

  ClusterOperationV2Serverless({
    this.sourceClusterInfo,
    this.targetClusterInfo,
    this.vpcConnectionInfo,
  });

  factory ClusterOperationV2Serverless.fromJson(Map<String, dynamic> json) {
    return ClusterOperationV2Serverless(
      sourceClusterInfo: json['sourceClusterInfo'] != null
          ? ServerlessConnectivityInfo.fromJson(
              json['sourceClusterInfo'] as Map<String, dynamic>)
          : null,
      targetClusterInfo: json['targetClusterInfo'] != null
          ? ServerlessConnectivityInfo.fromJson(
              json['targetClusterInfo'] as Map<String, dynamic>)
          : null,
      vpcConnectionInfo: json['vpcConnectionInfo'] != null
          ? VpcConnectionInfoServerless.fromJson(
              json['vpcConnectionInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceClusterInfo = this.sourceClusterInfo;
    final targetClusterInfo = this.targetClusterInfo;
    final vpcConnectionInfo = this.vpcConnectionInfo;
    return {
      if (sourceClusterInfo != null) 'sourceClusterInfo': sourceClusterInfo,
      if (targetClusterInfo != null) 'targetClusterInfo': targetClusterInfo,
      if (vpcConnectionInfo != null) 'vpcConnectionInfo': vpcConnectionInfo,
    };
  }
}

/// Description of the VPC connection.
///
/// @nodoc
class VpcConnectionInfoServerless {
  /// The time when Amazon MSK creates the VPC Connnection.
  final DateTime? creationTime;

  /// The owner of the VPC Connection.
  final String? owner;

  /// Description of the requester that calls the API operation.
  final UserIdentity? userIdentity;

  /// The Amazon Resource Name (ARN) of the VPC connection.
  final String? vpcConnectionArn;

  VpcConnectionInfoServerless({
    this.creationTime,
    this.owner,
    this.userIdentity,
    this.vpcConnectionArn,
  });

  factory VpcConnectionInfoServerless.fromJson(Map<String, dynamic> json) {
    return VpcConnectionInfoServerless(
      creationTime: timeStampFromJson(json['creationTime']),
      owner: json['owner'] as String?,
      userIdentity: json['userIdentity'] != null
          ? UserIdentity.fromJson(json['userIdentity'] as Map<String, dynamic>)
          : null,
      vpcConnectionArn: json['vpcConnectionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final owner = this.owner;
    final userIdentity = this.userIdentity;
    final vpcConnectionArn = this.vpcConnectionArn;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (owner != null) 'owner': owner,
      if (userIdentity != null) 'userIdentity': userIdentity,
      if (vpcConnectionArn != null) 'vpcConnectionArn': vpcConnectionArn,
    };
  }
}

/// Specifies configuration for replication between a source and target Kafka
/// cluster.
///
/// @nodoc
class ReplicationInfo {
  /// Configuration relating to consumer group replication.
  final ConsumerGroupReplication consumerGroupReplication;

  /// The compression type to use when producing records to target cluster.
  final TargetCompressionType targetCompressionType;

  /// Configuration relating to topic replication.
  final TopicReplication topicReplication;

  /// The ARN of the source Kafka cluster.
  final String? sourceKafkaClusterArn;

  /// The ID of the source Kafka cluster.
  final String? sourceKafkaClusterId;

  /// The ARN of the target Kafka cluster.
  final String? targetKafkaClusterArn;

  /// The ID of the target Kafka cluster.
  final String? targetKafkaClusterId;

  ReplicationInfo({
    required this.consumerGroupReplication,
    required this.targetCompressionType,
    required this.topicReplication,
    this.sourceKafkaClusterArn,
    this.sourceKafkaClusterId,
    this.targetKafkaClusterArn,
    this.targetKafkaClusterId,
  });

  Map<String, dynamic> toJson() {
    final consumerGroupReplication = this.consumerGroupReplication;
    final targetCompressionType = this.targetCompressionType;
    final topicReplication = this.topicReplication;
    final sourceKafkaClusterArn = this.sourceKafkaClusterArn;
    final sourceKafkaClusterId = this.sourceKafkaClusterId;
    final targetKafkaClusterArn = this.targetKafkaClusterArn;
    final targetKafkaClusterId = this.targetKafkaClusterId;
    return {
      'consumerGroupReplication': consumerGroupReplication,
      'targetCompressionType': targetCompressionType.value,
      'topicReplication': topicReplication,
      if (sourceKafkaClusterArn != null)
        'sourceKafkaClusterArn': sourceKafkaClusterArn,
      if (sourceKafkaClusterId != null)
        'sourceKafkaClusterId': sourceKafkaClusterId,
      if (targetKafkaClusterArn != null)
        'targetKafkaClusterArn': targetKafkaClusterArn,
      if (targetKafkaClusterId != null)
        'targetKafkaClusterId': targetKafkaClusterId,
    };
  }
}

/// Information about Kafka Cluster to be used as source / target for
/// replication.
///
/// @nodoc
class KafkaCluster {
  /// Details of an Amazon MSK Cluster.
  final AmazonMskCluster? amazonMskCluster;

  /// Details of an Apache Kafka Cluster.
  final ApacheKafkaCluster? apacheKafkaCluster;

  /// Details of the client authentication used by the Apache Kafka cluster.
  final KafkaClusterClientAuthentication? clientAuthentication;

  /// Details of encryption in transit to the Apache Kafka cluster.
  final KafkaClusterEncryptionInTransit? encryptionInTransit;

  /// Details of an Amazon VPC which has network connectivity to the Apache Kafka
  /// cluster.
  final KafkaClusterClientVpcConfig? vpcConfig;

  KafkaCluster({
    this.amazonMskCluster,
    this.apacheKafkaCluster,
    this.clientAuthentication,
    this.encryptionInTransit,
    this.vpcConfig,
  });

  Map<String, dynamic> toJson() {
    final amazonMskCluster = this.amazonMskCluster;
    final apacheKafkaCluster = this.apacheKafkaCluster;
    final clientAuthentication = this.clientAuthentication;
    final encryptionInTransit = this.encryptionInTransit;
    final vpcConfig = this.vpcConfig;
    return {
      if (amazonMskCluster != null) 'amazonMskCluster': amazonMskCluster,
      if (apacheKafkaCluster != null) 'apacheKafkaCluster': apacheKafkaCluster,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (encryptionInTransit != null)
        'encryptionInTransit': encryptionInTransit,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// Provisioned cluster request.
///
/// @nodoc
class ProvisionedRequest {
  /// Information about the brokers.
  final BrokerNodeGroupInfo brokerNodeGroupInfo;

  /// The Apache Kafka version that you want for the cluster.
  final String kafkaVersion;

  /// The number of broker nodes in the cluster.
  final int numberOfBrokerNodes;

  /// Includes all client authentication information.
  final ClientAuthentication? clientAuthentication;

  /// Represents the configuration that you want Amazon MSK to use for the brokers
  /// in a cluster.
  final ConfigurationInfo? configurationInfo;

  /// Includes all encryption-related information.
  final EncryptionInfo? encryptionInfo;

  /// Specifies the level of monitoring for the MSK cluster. The possible values
  /// are DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and PER_TOPIC_PER_PARTITION.
  final EnhancedMonitoring? enhancedMonitoring;

  /// Log delivery information for the cluster.
  final LoggingInfo? loggingInfo;

  /// The settings for open monitoring.
  final OpenMonitoringInfo? openMonitoring;

  /// Specifies if intelligent rebalancing is turned on for your MSK Provisioned
  /// cluster with Express brokers. For all new Express-based clusters that you
  /// create, intelligent rebalancing is turned on by default.
  final Rebalancing? rebalancing;

  /// This controls storage mode for supported storage tiers.
  final StorageMode? storageMode;

  ProvisionedRequest({
    required this.brokerNodeGroupInfo,
    required this.kafkaVersion,
    required this.numberOfBrokerNodes,
    this.clientAuthentication,
    this.configurationInfo,
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.loggingInfo,
    this.openMonitoring,
    this.rebalancing,
    this.storageMode,
  });

  Map<String, dynamic> toJson() {
    final brokerNodeGroupInfo = this.brokerNodeGroupInfo;
    final kafkaVersion = this.kafkaVersion;
    final numberOfBrokerNodes = this.numberOfBrokerNodes;
    final clientAuthentication = this.clientAuthentication;
    final configurationInfo = this.configurationInfo;
    final encryptionInfo = this.encryptionInfo;
    final enhancedMonitoring = this.enhancedMonitoring;
    final loggingInfo = this.loggingInfo;
    final openMonitoring = this.openMonitoring;
    final rebalancing = this.rebalancing;
    final storageMode = this.storageMode;
    return {
      'brokerNodeGroupInfo': brokerNodeGroupInfo,
      'kafkaVersion': kafkaVersion,
      'numberOfBrokerNodes': numberOfBrokerNodes,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (configurationInfo != null) 'configurationInfo': configurationInfo,
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.value,
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
      if (rebalancing != null) 'rebalancing': rebalancing,
      if (storageMode != null) 'storageMode': storageMode.value,
    };
  }
}

/// Serverless cluster request.
///
/// @nodoc
class ServerlessRequest {
  /// The configuration of the Amazon VPCs for the cluster.
  final List<VpcConfig> vpcConfigs;

  /// Includes all client authentication information.
  final ServerlessClientAuthentication? clientAuthentication;

  ServerlessRequest({
    required this.vpcConfigs,
    this.clientAuthentication,
  });

  Map<String, dynamic> toJson() {
    final vpcConfigs = this.vpcConfigs;
    final clientAuthentication = this.clientAuthentication;
    return {
      'vpcConfigs': vpcConfigs,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
    };
  }
}

/// Error info for scram secret associate/disassociate failure.
///
/// @nodoc
class UnprocessedScramSecret {
  /// Error code for associate/disassociate failure.
  final String? errorCode;

  /// Error message for associate/disassociate failure.
  final String? errorMessage;

  /// AWS Secrets Manager secret ARN.
  final String? secretArn;

  UnprocessedScramSecret({
    this.errorCode,
    this.errorMessage,
    this.secretArn,
  });

  factory UnprocessedScramSecret.fromJson(Map<String, dynamic> json) {
    return UnprocessedScramSecret(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      secretArn: json['secretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final secretArn = this.secretArn;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (secretArn != null) 'secretArn': secretArn,
    };
  }
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

/// @nodoc
class ClusterConnectivityException extends _s.GenericAwsException {
  ClusterConnectivityException({String? type, String? message})
      : super(
            type: type, code: 'ClusterConnectivityException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class ControllerMovedException extends _s.GenericAwsException {
  ControllerMovedException({String? type, String? message})
      : super(type: type, code: 'ControllerMovedException', message: message);
}

/// @nodoc
class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

/// @nodoc
class GroupSubscribedToTopicException extends _s.GenericAwsException {
  GroupSubscribedToTopicException({String? type, String? message})
      : super(
            type: type,
            code: 'GroupSubscribedToTopicException',
            message: message);
}

/// @nodoc
class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

/// @nodoc
class KafkaRequestException extends _s.GenericAwsException {
  KafkaRequestException({String? type, String? message})
      : super(type: type, code: 'KafkaRequestException', message: message);
}

/// @nodoc
class KafkaTimeoutException extends _s.GenericAwsException {
  KafkaTimeoutException({String? type, String? message})
      : super(type: type, code: 'KafkaTimeoutException', message: message);
}

/// @nodoc
class NotControllerException extends _s.GenericAwsException {
  NotControllerException({String? type, String? message})
      : super(type: type, code: 'NotControllerException', message: message);
}

/// @nodoc
class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

/// @nodoc
class ReassignmentInProgressException extends _s.GenericAwsException {
  ReassignmentInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'ReassignmentInProgressException',
            message: message);
}

/// @nodoc
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

/// @nodoc
class TopicExistsException extends _s.GenericAwsException {
  TopicExistsException({String? type, String? message})
      : super(type: type, code: 'TopicExistsException', message: message);
}

/// @nodoc
class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

/// @nodoc
class UnknownTopicOrPartitionException extends _s.GenericAwsException {
  UnknownTopicOrPartitionException({String? type, String? message})
      : super(
            type: type,
            code: 'UnknownTopicOrPartitionException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ClusterConnectivityException': (type, message) =>
      ClusterConnectivityException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ControllerMovedException': (type, message) =>
      ControllerMovedException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'GroupSubscribedToTopicException': (type, message) =>
      GroupSubscribedToTopicException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'KafkaRequestException': (type, message) =>
      KafkaRequestException(type: type, message: message),
  'KafkaTimeoutException': (type, message) =>
      KafkaTimeoutException(type: type, message: message),
  'NotControllerException': (type, message) =>
      NotControllerException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ReassignmentInProgressException': (type, message) =>
      ReassignmentInProgressException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'TopicExistsException': (type, message) =>
      TopicExistsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'UnknownTopicOrPartitionException': (type, message) =>
      UnknownTopicOrPartitionException(type: type, message: message),
};
