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

///
/// The operations for managing an Amazon MSK cluster.
///
class Kafka {
  final _s.RestJsonProtocol _protocol;
  Kafka({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kafka',
            signingName: 'kafka',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  ///
  /// Associates one or more Scram Secrets with an Amazon MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  ///
  /// Parameter [secretArnList] :
  ///
  /// List of AWS Secrets Manager secret ARNs.
  ///
  Future<BatchAssociateScramSecretResponse> batchAssociateScramSecret({
    required String clusterArn,
    required List<String> secretArnList,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    ArgumentError.checkNotNull(secretArnList, 'secretArnList');
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

  ///
  /// Creates a new MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [brokerNodeGroupInfo] :
  ///
  /// Information about the broker nodes in the cluster.
  ///
  ///
  /// Parameter [clusterName] :
  ///
  /// The name of the cluster.
  ///
  ///
  /// Parameter [kafkaVersion] :
  ///
  /// The version of Apache Kafka.
  ///
  ///
  /// Parameter [numberOfBrokerNodes] :
  ///
  /// The number of broker nodes in the cluster.
  ///
  ///
  /// Parameter [clientAuthentication] :
  ///
  /// Includes all client authentication related information.
  ///
  ///
  /// Parameter [configurationInfo] :
  ///
  /// Represents the configuration that you want MSK to use for the brokers in a
  /// cluster.
  ///
  ///
  /// Parameter [encryptionInfo] :
  ///
  /// Includes all encryption-related information.
  ///
  ///
  /// Parameter [enhancedMonitoring] :
  ///
  /// Specifies the level of monitoring for the MSK cluster. The possible values
  /// are DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and
  /// PER_TOPIC_PER_PARTITION.
  ///
  ///
  /// Parameter [openMonitoring] :
  ///
  /// The settings for open monitoring.
  ///
  ///
  /// Parameter [tags] :
  ///
  /// Create tags when creating the cluster.
  ///
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
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(brokerNodeGroupInfo, 'brokerNodeGroupInfo');
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    _s.validateStringLength(
      'clusterName',
      clusterName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(kafkaVersion, 'kafkaVersion');
    _s.validateStringLength(
      'kafkaVersion',
      kafkaVersion,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(numberOfBrokerNodes, 'numberOfBrokerNodes');
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
        'enhancedMonitoring': enhancedMonitoring.toValue(),
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
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

  ///
  /// Creates a new MSK configuration.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  ///
  /// The name of the configuration.
  ///
  ///
  /// Parameter [serverProperties] :
  ///
  /// Contents of the <filename>server.properties</filename> file. When using
  /// the API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the
  /// contents of <filename>server.properties</filename> can be in plaintext.
  ///
  ///
  /// Parameter [description] :
  ///
  /// The description of the configuration.
  ///
  ///
  /// Parameter [kafkaVersions] :
  ///
  /// The versions of Apache Kafka with which you can use this MSK
  /// configuration.
  ///
  Future<CreateConfigurationResponse> createConfiguration({
    required String name,
    required Uint8List serverProperties,
    String? description,
    List<String>? kafkaVersions,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(serverProperties, 'serverProperties');
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

  ///
  /// Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the
  /// request.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The current version of the MSK cluster.
  ///
  Future<DeleteClusterResponse> deleteCluster({
    required String clusterArn,
    String? currentVersion,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
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

  ///
  /// Deletes an MSK Configuration.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration.
  ///
  Future<DeleteConfigurationResponse> deleteConfiguration({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/configurations/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConfigurationResponse.fromJson(response);
  }

  ///
  /// Returns a description of the MSK cluster whose Amazon Resource Name (ARN)
  /// is specified in the request.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  Future<DescribeClusterResponse> describeCluster({
    required String clusterArn,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/clusters/${Uri.encodeComponent(clusterArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterResponse.fromJson(response);
  }

  ///
  /// Returns a description of the cluster operation specified by the ARN.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterOperationArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the MSK cluster
  /// operation.
  ///
  Future<DescribeClusterOperationResponse> describeClusterOperation({
    required String clusterOperationArn,
  }) async {
    ArgumentError.checkNotNull(clusterOperationArn, 'clusterOperationArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/operations/${Uri.encodeComponent(clusterOperationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterOperationResponse.fromJson(response);
  }

  ///
  /// Returns a description of this MSK configuration.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  Future<DescribeConfigurationResponse> describeConfiguration({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/configurations/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConfigurationResponse.fromJson(response);
  }

  ///
  /// Returns a description of this revision of the configuration.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  ///
  /// Parameter [revision] :
  ///
  /// A string that uniquely identifies a revision of an MSK configuration.
  ///
  Future<DescribeConfigurationRevisionResponse> describeConfigurationRevision({
    required String arn,
    required int revision,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    ArgumentError.checkNotNull(revision, 'revision');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/${Uri.encodeComponent(arn)}/revisions/${Uri.encodeComponent(revision.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConfigurationRevisionResponse.fromJson(response);
  }

  ///
  /// Disassociates one or more Scram Secrets from an Amazon MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  ///
  /// Parameter [secretArnList] :
  ///
  /// List of AWS Secrets Manager secret ARNs.
  ///
  Future<BatchDisassociateScramSecretResponse> batchDisassociateScramSecret({
    required String clusterArn,
    required List<String> secretArnList,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    ArgumentError.checkNotNull(secretArnList, 'secretArnList');
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

  ///
  /// A list of brokers that a client application can use to bootstrap.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  Future<GetBootstrapBrokersResponse> getBootstrapBrokers({
    required String clusterArn,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeComponent(clusterArn)}/bootstrap-brokers',
      exceptionFnMap: _exceptionFns,
    );
    return GetBootstrapBrokersResponse.fromJson(response);
  }

  ///
  /// Gets the Apache Kafka versions to which you can update the MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster check.
  ///
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

  ///
  /// Returns a list of all the operations that have been performed on the
  /// specified MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListClusterOperationsResponse> listClusterOperations({
    required String clusterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
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

  ///
  /// Returns a list of all the MSK clusters in the current Region.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterNameFilter] :
  ///
  /// Specify a prefix of the name of the clusters that you want to list. The
  /// service lists all the clusters whose names start with this prefix.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
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

  ///
  /// Returns a list of all the MSK configurations in this Region.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListConfigurationRevisionsResponse> listConfigurationRevisions({
    required String arn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
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

  ///
  /// Returns a list of all the MSK configurations in this Region.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
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

  ///
  /// Returns a list of Kafka versions.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  ///
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

  ///
  /// Returns a list of the broker nodes in the cluster.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListNodesResponse> listNodes({
    required String clusterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
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

  ///
  /// Returns a list of the Scram Secrets associated with an Amazon MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The arn of the cluster.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maxResults of the query.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The nextToken of the query.
  ///
  Future<ListScramSecretsResponse> listScramSecrets({
    required String clusterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
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

  ///
  /// Returns a list of the tags associated with the specified resource.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// that's associated with the tags.
  ///
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Reboots brokers.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [brokerIds] :
  ///
  /// The list of broker IDs to be rebooted. The reboot-broker operation
  /// supports rebooting one broker at a time.
  ///
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  Future<RebootBrokerResponse> rebootBroker({
    required List<String> brokerIds,
    required String clusterArn,
  }) async {
    ArgumentError.checkNotNull(brokerIds, 'brokerIds');
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
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

  ///
  /// Adds tags to the specified MSK resource.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// that's associated with the tags.
  ///
  ///
  /// Parameter [tags] :
  ///
  /// The key-value pair for the resource tag.
  ///
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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

  ///
  /// Removes the tags associated with the keys that are provided in the query.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// that's associated with the tags.
  ///
  ///
  /// Parameter [tagKeys] :
  ///
  /// Tag keys must be unique for a given cluster. In addition, the following
  /// restrictions apply:
  ///
  ///
  /// <ul>
  ///
  /// <li>
  ///
  /// Each tag key must be unique. If you add a tag with a key that's already in
  /// use, your new tag overwrites the existing key-value pair.
  ///
  /// </li>
  ///
  /// <li>
  ///
  /// You can't start a tag key with aws: because this prefix is reserved for
  /// use
  /// by  AWS.  AWS creates tags that begin with this prefix on your behalf, but
  /// you can't edit or delete them.
  ///
  /// </li>
  ///
  /// <li>
  ///
  /// Tag keys must be between 1 and 128 Unicode characters in length.
  ///
  /// </li>
  ///
  /// <li>
  ///
  /// Tag keys must consist of the following characters: Unicode letters,
  /// digits,
  /// white space, and the following special characters: _ . / = + -
  /// @.
  ///
  /// </li>
  ///
  /// </ul>
  Future<void> untagResource({
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

  ///
  /// Updates the number of broker nodes in the cluster.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of cluster to update from. A successful operation will then
  /// generate a new version.
  ///
  ///
  /// Parameter [targetNumberOfBrokerNodes] :
  ///
  /// The number of broker nodes that you want the cluster to have after this
  /// operation completes successfully.
  ///
  Future<UpdateBrokerCountResponse> updateBrokerCount({
    required String clusterArn,
    required String currentVersion,
    required int targetNumberOfBrokerNodes,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    ArgumentError.checkNotNull(currentVersion, 'currentVersion');
    ArgumentError.checkNotNull(
        targetNumberOfBrokerNodes, 'targetNumberOfBrokerNodes');
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

  ///
  /// Updates EC2 instance type.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The cluster version that you want to change. After this operation
  /// completes successfully, the cluster will have a new version.
  ///
  ///
  /// Parameter [targetInstanceType] :
  ///
  /// The Amazon MSK broker type that you want all of the brokers in this
  /// cluster to be.
  ///
  Future<UpdateBrokerTypeResponse> updateBrokerType({
    required String clusterArn,
    required String currentVersion,
    required String targetInstanceType,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    ArgumentError.checkNotNull(currentVersion, 'currentVersion');
    ArgumentError.checkNotNull(targetInstanceType, 'targetInstanceType');
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

  ///
  /// Updates the EBS storage associated with MSK brokers.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of cluster to update from. A successful operation will then
  /// generate a new version.
  ///
  ///
  /// Parameter [targetBrokerEBSVolumeInfo] :
  ///
  /// Describes the target volume size and the ID of the broker to apply the
  /// update to.
  ///
  Future<UpdateBrokerStorageResponse> updateBrokerStorage({
    required String clusterArn,
    required String currentVersion,
    required List<BrokerEBSVolumeInfo> targetBrokerEBSVolumeInfo,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    ArgumentError.checkNotNull(currentVersion, 'currentVersion');
    ArgumentError.checkNotNull(
        targetBrokerEBSVolumeInfo, 'targetBrokerEBSVolumeInfo');
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

  ///
  /// Updates an MSK configuration.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  ///
  /// Parameter [serverProperties] :
  ///
  /// Contents of the <filename>server.properties</filename> file. When using
  /// the API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the
  /// contents of <filename>server.properties</filename> can be in plaintext.
  ///
  ///
  /// Parameter [description] :
  ///
  /// The description of the configuration revision.
  ///
  Future<UpdateConfigurationResponse> updateConfiguration({
    required String arn,
    required Uint8List serverProperties,
    String? description,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    ArgumentError.checkNotNull(serverProperties, 'serverProperties');
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

  ///
  /// Updates the cluster with the configuration that is specified in the
  /// request body.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [configurationInfo] :
  ///
  /// Represents the configuration that you want MSK to use for the brokers in a
  /// cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of the cluster that needs to be updated.
  ///
  Future<UpdateClusterConfigurationResponse> updateClusterConfiguration({
    required String clusterArn,
    required ConfigurationInfo configurationInfo,
    required String currentVersion,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    ArgumentError.checkNotNull(configurationInfo, 'configurationInfo');
    ArgumentError.checkNotNull(currentVersion, 'currentVersion');
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

  ///
  /// Updates the Apache Kafka version for the cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// Current cluster version.
  ///
  ///
  /// Parameter [targetKafkaVersion] :
  ///
  /// Target Kafka version.
  ///
  ///
  /// Parameter [configurationInfo] :
  ///
  /// The custom configuration that should be applied on the new version of
  /// cluster.
  ///
  Future<UpdateClusterKafkaVersionResponse> updateClusterKafkaVersion({
    required String clusterArn,
    required String currentVersion,
    required String targetKafkaVersion,
    ConfigurationInfo? configurationInfo,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    ArgumentError.checkNotNull(currentVersion, 'currentVersion');
    ArgumentError.checkNotNull(targetKafkaVersion, 'targetKafkaVersion');
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

  ///
  /// Updates the monitoring settings for the cluster. You can use this
  /// operation to specify which Apache Kafka metrics you want Amazon MSK to
  /// send to Amazon CloudWatch. You can also specify settings for open
  /// monitoring with Prometheus.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of the MSK cluster to update. Cluster versions aren't simple
  /// numbers. You can describe an MSK cluster to find its version. When this
  /// update operation is successful, it generates a new cluster version.
  ///
  ///
  /// Parameter [enhancedMonitoring] :
  ///
  /// Specifies which Apache Kafka metrics Amazon MSK gathers and sends to
  /// Amazon CloudWatch for this cluster.
  ///
  ///
  /// Parameter [openMonitoring] :
  ///
  /// The settings for open monitoring.
  ///
  Future<UpdateMonitoringResponse> updateMonitoring({
    required String clusterArn,
    required String currentVersion,
    EnhancedMonitoring? enhancedMonitoring,
    LoggingInfo? loggingInfo,
    OpenMonitoringInfo? openMonitoring,
  }) async {
    ArgumentError.checkNotNull(clusterArn, 'clusterArn');
    ArgumentError.checkNotNull(currentVersion, 'currentVersion');
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.toValue(),
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
}

class BatchAssociateScramSecretResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// List of errors when associating secrets to cluster.
  ///
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
          ?.whereNotNull()
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

///
/// The distribution of broker nodes across Availability Zones. This is an
/// optional parameter. If you don't specify it, Amazon MSK gives it the value
/// DEFAULT. You can also explicitly set this parameter to the value DEFAULT. No
/// other values are currently allowed.
///
///
/// Amazon MSK distributes the broker nodes evenly across the Availability Zones
/// that correspond to the subnets you provide when you create the cluster.
///
enum BrokerAZDistribution {
  $default,
}

extension on BrokerAZDistribution {
  String toValue() {
    switch (this) {
      case BrokerAZDistribution.$default:
        return 'DEFAULT';
    }
  }
}

extension on String {
  BrokerAZDistribution toBrokerAZDistribution() {
    switch (this) {
      case 'DEFAULT':
        return BrokerAZDistribution.$default;
    }
    throw Exception('$this is not known in enum BrokerAZDistribution');
  }
}

///
/// Specifies the EBS volume upgrade information. The broker identifier must be
/// set to the keyword ALL. This means the changes apply to all the brokers in
/// the cluster.
///
class BrokerEBSVolumeInfo {
  ///
  /// The ID of the broker to update.
  ///
  final String kafkaBrokerNodeId;

  ///
  /// Size of the EBS volume to update.
  ///
  final int volumeSizeGB;

  BrokerEBSVolumeInfo({
    required this.kafkaBrokerNodeId,
    required this.volumeSizeGB,
  });

  factory BrokerEBSVolumeInfo.fromJson(Map<String, dynamic> json) {
    return BrokerEBSVolumeInfo(
      kafkaBrokerNodeId: json['kafkaBrokerNodeId'] as String,
      volumeSizeGB: json['volumeSizeGB'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final kafkaBrokerNodeId = this.kafkaBrokerNodeId;
    final volumeSizeGB = this.volumeSizeGB;
    return {
      'kafkaBrokerNodeId': kafkaBrokerNodeId,
      'volumeSizeGB': volumeSizeGB,
    };
  }
}

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

///
/// Describes the setup to be used for Kafka broker nodes in the cluster.
///
class BrokerNodeGroupInfo {
  ///
  /// The list of subnets to connect to in the client virtual private cloud (VPC).
  /// AWS creates elastic network interfaces inside these subnets. Client
  /// applications use elastic network interfaces to produce and consume data.
  /// Client subnets can't be in Availability Zone us-east-1e.
  ///
  final List<String> clientSubnets;

  ///
  /// The type of Amazon EC2 instances to use for Kafka brokers. The following
  /// instance types are allowed: kafka.m5.large, kafka.m5.xlarge,
  /// kafka.m5.2xlarge,
  /// kafka.m5.4xlarge, kafka.m5.12xlarge, and kafka.m5.24xlarge.
  ///
  final String instanceType;

  ///
  /// The distribution of broker nodes across Availability Zones. This is an
  /// optional parameter. If you don't specify it, Amazon MSK gives it the value
  /// DEFAULT. You can also explicitly set this parameter to the value DEFAULT. No
  /// other values are currently allowed.
  ///
  ///
  /// Amazon MSK distributes the broker nodes evenly across the Availability Zones
  /// that correspond to the subnets you provide when you create the cluster.
  ///
  final BrokerAZDistribution? brokerAZDistribution;

  ///
  /// The AWS security groups to associate with the elastic network interfaces in
  /// order to specify who can connect to and communicate with the Amazon MSK
  /// cluster. If you don't specify a security group, Amazon MSK uses the default
  /// security group associated with the VPC.
  ///
  final List<String>? securityGroups;

  ///
  /// Contains information about storage volumes attached to MSK broker nodes.
  ///
  final StorageInfo? storageInfo;

  BrokerNodeGroupInfo({
    required this.clientSubnets,
    required this.instanceType,
    this.brokerAZDistribution,
    this.securityGroups,
    this.storageInfo,
  });

  factory BrokerNodeGroupInfo.fromJson(Map<String, dynamic> json) {
    return BrokerNodeGroupInfo(
      clientSubnets: (json['clientSubnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      instanceType: json['instanceType'] as String,
      brokerAZDistribution:
          (json['brokerAZDistribution'] as String?)?.toBrokerAZDistribution(),
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      storageInfo: json['storageInfo'] != null
          ? StorageInfo.fromJson(json['storageInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientSubnets = this.clientSubnets;
    final instanceType = this.instanceType;
    final brokerAZDistribution = this.brokerAZDistribution;
    final securityGroups = this.securityGroups;
    final storageInfo = this.storageInfo;
    return {
      'clientSubnets': clientSubnets,
      'instanceType': instanceType,
      if (brokerAZDistribution != null)
        'brokerAZDistribution': brokerAZDistribution.toValue(),
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (storageInfo != null) 'storageInfo': storageInfo,
    };
  }
}

///
/// BrokerNodeInfo
///
class BrokerNodeInfo {
  ///
  /// The attached elastic network interface of the broker.
  ///
  final String? attachedENIId;

  ///
  /// The ID of the broker.
  ///
  final double? brokerId;

  ///
  /// The client subnet to which this broker node belongs.
  ///
  final String? clientSubnet;

  ///
  /// The virtual private cloud (VPC) of the client.
  ///
  final String? clientVpcIpAddress;

  ///
  /// Information about the version of software currently deployed on the Kafka
  /// brokers in the cluster.
  ///
  final BrokerSoftwareInfo? currentBrokerSoftwareInfo;

  ///
  /// Endpoints for accessing the broker.
  ///
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
      brokerId: json['brokerId'] as double?,
      clientSubnet: json['clientSubnet'] as String?,
      clientVpcIpAddress: json['clientVpcIpAddress'] as String?,
      currentBrokerSoftwareInfo: json['currentBrokerSoftwareInfo'] != null
          ? BrokerSoftwareInfo.fromJson(
              json['currentBrokerSoftwareInfo'] as Map<String, dynamic>)
          : null,
      endpoints: (json['endpoints'] as List?)
          ?.whereNotNull()
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
      if (brokerId != null) 'brokerId': brokerId,
      if (clientSubnet != null) 'clientSubnet': clientSubnet,
      if (clientVpcIpAddress != null) 'clientVpcIpAddress': clientVpcIpAddress,
      if (currentBrokerSoftwareInfo != null)
        'currentBrokerSoftwareInfo': currentBrokerSoftwareInfo,
      if (endpoints != null) 'endpoints': endpoints,
    };
  }
}

///
/// Information about the current software installed on the cluster.
///
class BrokerSoftwareInfo {
  ///
  /// The Amazon Resource Name (ARN) of the configuration used for the cluster.
  /// This field isn't visible in this preview release.
  ///
  final String? configurationArn;

  ///
  /// The revision of the configuration to use. This field isn't visible in this
  /// preview release.
  ///
  final int? configurationRevision;

  ///
  /// The version of Apache Kafka.
  ///
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

///
/// Includes all client authentication information.
///
class ClientAuthentication {
  ///
  /// Details for ClientAuthentication using SASL.
  ///
  final Sasl? sasl;

  ///
  /// Details for ClientAuthentication using TLS.
  ///
  final Tls? tls;

  ClientAuthentication({
    this.sasl,
    this.tls,
  });

  factory ClientAuthentication.fromJson(Map<String, dynamic> json) {
    return ClientAuthentication(
      sasl: json['sasl'] != null
          ? Sasl.fromJson(json['sasl'] as Map<String, dynamic>)
          : null,
      tls: json['tls'] != null
          ? Tls.fromJson(json['tls'] as Map<String, dynamic>)
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

///
/// Client-broker encryption in transit setting.
///
enum ClientBroker {
  tls,
  tlsPlaintext,
  plaintext,
}

extension on ClientBroker {
  String toValue() {
    switch (this) {
      case ClientBroker.tls:
        return 'TLS';
      case ClientBroker.tlsPlaintext:
        return 'TLS_PLAINTEXT';
      case ClientBroker.plaintext:
        return 'PLAINTEXT';
    }
  }
}

extension on String {
  ClientBroker toClientBroker() {
    switch (this) {
      case 'TLS':
        return ClientBroker.tls;
      case 'TLS_PLAINTEXT':
        return ClientBroker.tlsPlaintext;
      case 'PLAINTEXT':
        return ClientBroker.plaintext;
    }
    throw Exception('$this is not known in enum ClientBroker');
  }
}

class CloudWatchLogs {
  final bool enabled;
  final String? logGroup;

  CloudWatchLogs({
    required this.enabled,
    this.logGroup,
  });

  factory CloudWatchLogs.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogs(
      enabled: json['enabled'] as bool,
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

///
/// Returns information about a cluster.
///
class ClusterInfo {
  ///
  /// Arn of active cluster operation.
  ///
  final String? activeOperationArn;

  ///
  /// Information about the broker nodes.
  ///
  final BrokerNodeGroupInfo? brokerNodeGroupInfo;

  ///
  /// Includes all client authentication information.
  ///
  final ClientAuthentication? clientAuthentication;

  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  final String? clusterArn;

  ///
  /// The name of the cluster.
  ///
  final String? clusterName;

  ///
  /// The time when the cluster was created.
  ///
  final DateTime? creationTime;

  ///
  /// Information about the version of software currently deployed on the Kafka
  /// brokers in the cluster.
  ///
  final BrokerSoftwareInfo? currentBrokerSoftwareInfo;

  ///
  /// The current version of the MSK cluster.
  ///
  final String? currentVersion;

  ///
  /// Includes all encryption-related information.
  ///
  final EncryptionInfo? encryptionInfo;

  ///
  /// Specifies which metrics are gathered for the MSK cluster. This property has
  /// the following possible values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER,
  /// and PER_TOPIC_PER_PARTITION. For a list of the metrics associated with each
  /// of these levels of monitoring, see <a
  /// href="https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html">Monitoring</a>.
  ///
  final EnhancedMonitoring? enhancedMonitoring;
  final LoggingInfo? loggingInfo;

  ///
  /// The number of broker nodes in the cluster.
  ///
  final int? numberOfBrokerNodes;

  ///
  /// Settings for open monitoring using Prometheus.
  ///
  final OpenMonitoring? openMonitoring;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  final ClusterState? state;
  final StateInfo? stateInfo;

  ///
  /// Tags attached to the cluster.
  ///
  final Map<String, String>? tags;

  ///
  /// The connection string to use to connect to the Apache ZooKeeper cluster.
  ///
  final String? zookeeperConnectString;

  ///
  /// The connection string to use to connect to zookeeper cluster on Tls port.
  ///
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
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.loggingInfo,
    this.numberOfBrokerNodes,
    this.openMonitoring,
    this.state,
    this.stateInfo,
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
      encryptionInfo: json['encryptionInfo'] != null
          ? EncryptionInfo.fromJson(
              json['encryptionInfo'] as Map<String, dynamic>)
          : null,
      enhancedMonitoring:
          (json['enhancedMonitoring'] as String?)?.toEnhancedMonitoring(),
      loggingInfo: json['loggingInfo'] != null
          ? LoggingInfo.fromJson(json['loggingInfo'] as Map<String, dynamic>)
          : null,
      numberOfBrokerNodes: json['numberOfBrokerNodes'] as int?,
      openMonitoring: json['openMonitoring'] != null
          ? OpenMonitoring.fromJson(
              json['openMonitoring'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toClusterState(),
      stateInfo: json['stateInfo'] != null
          ? StateInfo.fromJson(json['stateInfo'] as Map<String, dynamic>)
          : null,
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
    final encryptionInfo = this.encryptionInfo;
    final enhancedMonitoring = this.enhancedMonitoring;
    final loggingInfo = this.loggingInfo;
    final numberOfBrokerNodes = this.numberOfBrokerNodes;
    final openMonitoring = this.openMonitoring;
    final state = this.state;
    final stateInfo = this.stateInfo;
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
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.toValue(),
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (numberOfBrokerNodes != null)
        'numberOfBrokerNodes': numberOfBrokerNodes,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
      if (state != null) 'state': state.toValue(),
      if (stateInfo != null) 'stateInfo': stateInfo,
      if (tags != null) 'tags': tags,
      if (zookeeperConnectString != null)
        'zookeeperConnectString': zookeeperConnectString,
      if (zookeeperConnectStringTls != null)
        'zookeeperConnectStringTls': zookeeperConnectStringTls,
    };
  }
}

///
/// Returns information about a cluster operation.
///
class ClusterOperationInfo {
  ///
  /// The ID of the API request that triggered this operation.
  ///
  final String? clientRequestId;

  ///
  /// ARN of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The time that the operation was created.
  ///
  final DateTime? creationTime;

  ///
  /// The time at which the operation finished.
  ///
  final DateTime? endTime;

  ///
  /// Describes the error if the operation fails.
  ///
  final ErrorInfo? errorInfo;

  ///
  /// ARN of the cluster operation.
  ///
  final String? operationArn;

  ///
  /// State of the cluster operation.
  ///
  final String? operationState;

  ///
  /// Steps completed during the operation.
  ///
  final List<ClusterOperationStep>? operationSteps;

  ///
  /// Type of the cluster operation.
  ///
  final String? operationType;

  ///
  /// Information about cluster attributes before a cluster is updated.
  ///
  final MutableClusterInfo? sourceClusterInfo;

  ///
  /// Information about cluster attributes after a cluster is updated.
  ///
  final MutableClusterInfo? targetClusterInfo;

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
          ?.whereNotNull()
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
    };
  }
}

///
/// Step taken during a cluster operation.
///
class ClusterOperationStep {
  ///
  /// Information about the step and its status.
  ///
  final ClusterOperationStepInfo? stepInfo;

  ///
  /// The name of the step.
  ///
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

///
/// State information about the operation step.
///
class ClusterOperationStepInfo {
  ///
  /// The steps current status.
  ///
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

///
/// The state of a Kafka cluster.
///
enum ClusterState {
  active,
  creating,
  deleting,
  failed,
  healing,
  maintenance,
  rebootingBroker,
  updating,
}

extension on ClusterState {
  String toValue() {
    switch (this) {
      case ClusterState.active:
        return 'ACTIVE';
      case ClusterState.creating:
        return 'CREATING';
      case ClusterState.deleting:
        return 'DELETING';
      case ClusterState.failed:
        return 'FAILED';
      case ClusterState.healing:
        return 'HEALING';
      case ClusterState.maintenance:
        return 'MAINTENANCE';
      case ClusterState.rebootingBroker:
        return 'REBOOTING_BROKER';
      case ClusterState.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  ClusterState toClusterState() {
    switch (this) {
      case 'ACTIVE':
        return ClusterState.active;
      case 'CREATING':
        return ClusterState.creating;
      case 'DELETING':
        return ClusterState.deleting;
      case 'FAILED':
        return ClusterState.failed;
      case 'HEALING':
        return ClusterState.healing;
      case 'MAINTENANCE':
        return ClusterState.maintenance;
      case 'REBOOTING_BROKER':
        return ClusterState.rebootingBroker;
      case 'UPDATING':
        return ClusterState.updating;
    }
    throw Exception('$this is not known in enum ClusterState');
  }
}

///
/// Contains source Kafka versions and compatible target Kafka versions.
///
class CompatibleKafkaVersion {
  ///
  /// A Kafka version.
  ///
  final String? sourceVersion;

  ///
  /// A list of Kafka versions.
  ///
  final List<String>? targetVersions;

  CompatibleKafkaVersion({
    this.sourceVersion,
    this.targetVersions,
  });

  factory CompatibleKafkaVersion.fromJson(Map<String, dynamic> json) {
    return CompatibleKafkaVersion(
      sourceVersion: json['sourceVersion'] as String?,
      targetVersions: (json['targetVersions'] as List?)
          ?.whereNotNull()
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

///
/// Represents an MSK Configuration.
///
class Configuration {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String arn;

  ///
  /// The time when the configuration was created.
  ///
  final DateTime creationTime;

  ///
  /// The description of the configuration.
  ///
  final String description;

  ///
  /// An array of the versions of Apache Kafka with which you can use this MSK
  /// configuration. You can use this configuration for an MSK cluster only if the
  /// Apache Kafka version specified for the cluster appears in this array.
  ///
  final List<String> kafkaVersions;

  ///
  /// Latest revision of the configuration.
  ///
  final ConfigurationRevision latestRevision;

  ///
  /// The name of the configuration.
  ///
  final String name;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
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
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      kafkaVersions: (json['kafkaVersions'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      latestRevision: ConfigurationRevision.fromJson(
          json['latestRevision'] as Map<String, dynamic>),
      name: json['name'] as String,
      state: (json['state'] as String).toConfigurationState(),
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
      'state': state.toValue(),
    };
  }
}

///
/// Specifies the configuration to use for the brokers.
///
class ConfigurationInfo {
  ///
  /// ARN of the configuration to use.
  ///
  final String arn;

  ///
  /// The revision of the configuration to use.
  ///
  final int revision;

  ConfigurationInfo({
    required this.arn,
    required this.revision,
  });

  factory ConfigurationInfo.fromJson(Map<String, dynamic> json) {
    return ConfigurationInfo(
      arn: json['arn'] as String,
      revision: json['revision'] as int,
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

///
/// Describes a configuration revision.
///
class ConfigurationRevision {
  ///
  /// The time when the configuration revision was created.
  ///
  final DateTime creationTime;

  ///
  /// The revision number.
  ///
  final int revision;

  ///
  /// The description of the configuration revision.
  ///
  final String? description;

  ConfigurationRevision({
    required this.creationTime,
    required this.revision,
    this.description,
  });

  factory ConfigurationRevision.fromJson(Map<String, dynamic> json) {
    return ConfigurationRevision(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      revision: json['revision'] as int,
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

///
/// The state of a configuration.
///
enum ConfigurationState {
  active,
  deleting,
  deleteFailed,
}

extension on ConfigurationState {
  String toValue() {
    switch (this) {
      case ConfigurationState.active:
        return 'ACTIVE';
      case ConfigurationState.deleting:
        return 'DELETING';
      case ConfigurationState.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension on String {
  ConfigurationState toConfigurationState() {
    switch (this) {
      case 'ACTIVE':
        return ConfigurationState.active;
      case 'DELETING':
        return ConfigurationState.deleting;
      case 'DELETE_FAILED':
        return ConfigurationState.deleteFailed;
    }
    throw Exception('$this is not known in enum ConfigurationState');
  }
}

class CreateClusterResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The name of the MSK cluster.
  ///
  final String? clusterName;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
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
      state: (json['state'] as String?)?.toClusterState(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterName = this.clusterName;
    final state = this.state;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterName != null) 'clusterName': clusterName,
      if (state != null) 'state': state.toValue(),
    };
  }
}

class CreateConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String? arn;

  ///
  /// The time when the configuration was created.
  ///
  final DateTime? creationTime;

  ///
  /// Latest revision of the configuration.
  ///
  final ConfigurationRevision? latestRevision;

  ///
  /// The name of the configuration.
  ///
  final String? name;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
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
      state: (json['state'] as String?)?.toConfigurationState(),
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
      if (state != null) 'state': state.toValue(),
    };
  }
}

class DeleteClusterResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  final ClusterState? state;

  DeleteClusterResponse({
    this.clusterArn,
    this.state,
  });

  factory DeleteClusterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteClusterResponse(
      clusterArn: json['clusterArn'] as String?,
      state: (json['state'] as String?)?.toClusterState(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final state = this.state;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (state != null) 'state': state.toValue(),
    };
  }
}

class DeleteConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration.
  ///
  final String? arn;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
  final ConfigurationState? state;

  DeleteConfigurationResponse({
    this.arn,
    this.state,
  });

  factory DeleteConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConfigurationResponse(
      arn: json['arn'] as String?,
      state: (json['state'] as String?)?.toConfigurationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final state = this.state;
    return {
      if (arn != null) 'arn': arn,
      if (state != null) 'state': state.toValue(),
    };
  }
}

class DescribeClusterOperationResponse {
  ///
  /// Cluster operation information
  ///
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

class DescribeClusterResponse {
  ///
  /// The cluster information.
  ///
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

class DescribeConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String? arn;

  ///
  /// The time when the configuration was created.
  ///
  final DateTime? creationTime;

  ///
  /// The description of the configuration.
  ///
  final String? description;

  ///
  /// The versions of Apache Kafka with which you can use this MSK configuration.
  ///
  final List<String>? kafkaVersions;

  ///
  /// Latest revision of the configuration.
  ///
  final ConfigurationRevision? latestRevision;

  ///
  /// The name of the configuration.
  ///
  final String? name;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.toConfigurationState(),
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
      if (state != null) 'state': state.toValue(),
    };
  }
}

class DescribeConfigurationRevisionResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String? arn;

  ///
  /// The time when the configuration was created.
  ///
  final DateTime? creationTime;

  ///
  /// The description of the configuration.
  ///
  final String? description;

  ///
  /// The revision number.
  ///
  final int? revision;

  ///
  /// Contents of the <filename>server.properties</filename> file. When using the
  /// API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the contents
  /// of <filename>server.properties</filename> can be in plaintext.
  ///
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

class BatchDisassociateScramSecretResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// List of errors when disassociating secrets to cluster.
  ///
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
          ?.whereNotNull()
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

///
/// Contains information about the EBS storage volumes attached to Kafka broker
/// nodes.
///
class EBSStorageInfo {
  ///
  /// The size in GiB of the EBS volume for the data drive on each broker node.
  ///
  final int? volumeSize;

  EBSStorageInfo({
    this.volumeSize,
  });

  factory EBSStorageInfo.fromJson(Map<String, dynamic> json) {
    return EBSStorageInfo(
      volumeSize: json['volumeSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final volumeSize = this.volumeSize;
    return {
      if (volumeSize != null) 'volumeSize': volumeSize,
    };
  }
}

///
/// The data-volume encryption details.
///
class EncryptionAtRest {
  ///
  /// The ARN of the AWS KMS key for encrypting data at rest. If you don't specify
  /// a KMS key, MSK creates one for you and uses it.
  ///
  final String dataVolumeKMSKeyId;

  EncryptionAtRest({
    required this.dataVolumeKMSKeyId,
  });

  factory EncryptionAtRest.fromJson(Map<String, dynamic> json) {
    return EncryptionAtRest(
      dataVolumeKMSKeyId: json['dataVolumeKMSKeyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataVolumeKMSKeyId = this.dataVolumeKMSKeyId;
    return {
      'dataVolumeKMSKeyId': dataVolumeKMSKeyId,
    };
  }
}

///
/// The settings for encrypting data in transit.
///
class EncryptionInTransit {
  ///
  /// Indicates the encryption setting for data in transit between clients and
  /// brokers. The following are the possible values.
  ///
  ///
  ///
  /// TLS means that client-broker communication is enabled with TLS only.
  ///
  ///
  ///
  /// TLS_PLAINTEXT means that client-broker communication is enabled for both
  /// TLS-encrypted, as well as plaintext data.
  ///
  ///
  ///
  /// PLAINTEXT means that client-broker communication is enabled in plaintext
  /// only.
  ///
  ///
  /// The default value is TLS_PLAINTEXT.
  ///
  final ClientBroker? clientBroker;

  ///
  /// When set to true, it indicates that data communication among the broker
  /// nodes of the cluster is encrypted. When set to false, the communication
  /// happens in plaintext.
  ///
  ///
  /// The default value is true.
  ///
  final bool? inCluster;

  EncryptionInTransit({
    this.clientBroker,
    this.inCluster,
  });

  factory EncryptionInTransit.fromJson(Map<String, dynamic> json) {
    return EncryptionInTransit(
      clientBroker: (json['clientBroker'] as String?)?.toClientBroker(),
      inCluster: json['inCluster'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientBroker = this.clientBroker;
    final inCluster = this.inCluster;
    return {
      if (clientBroker != null) 'clientBroker': clientBroker.toValue(),
      if (inCluster != null) 'inCluster': inCluster,
    };
  }
}

///
/// Includes encryption-related information, such as the AWS KMS key used for
/// encrypting data at rest and whether you want MSK to encrypt your data in
/// transit.
///
class EncryptionInfo {
  ///
  /// The data-volume encryption details.
  ///
  final EncryptionAtRest? encryptionAtRest;

  ///
  /// The details for encryption in transit.
  ///
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

///
/// Specifies which metrics are gathered for the MSK cluster. This property has
/// the following possible values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER,
/// and PER_TOPIC_PER_PARTITION. For a list of the metrics associated with each
/// of these levels of monitoring, see <a
/// href="https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html">Monitoring</a>.
///
enum EnhancedMonitoring {
  $default,
  perBroker,
  perTopicPerBroker,
  perTopicPerPartition,
}

extension on EnhancedMonitoring {
  String toValue() {
    switch (this) {
      case EnhancedMonitoring.$default:
        return 'DEFAULT';
      case EnhancedMonitoring.perBroker:
        return 'PER_BROKER';
      case EnhancedMonitoring.perTopicPerBroker:
        return 'PER_TOPIC_PER_BROKER';
      case EnhancedMonitoring.perTopicPerPartition:
        return 'PER_TOPIC_PER_PARTITION';
    }
  }
}

extension on String {
  EnhancedMonitoring toEnhancedMonitoring() {
    switch (this) {
      case 'DEFAULT':
        return EnhancedMonitoring.$default;
      case 'PER_BROKER':
        return EnhancedMonitoring.perBroker;
      case 'PER_TOPIC_PER_BROKER':
        return EnhancedMonitoring.perTopicPerBroker;
      case 'PER_TOPIC_PER_PARTITION':
        return EnhancedMonitoring.perTopicPerPartition;
    }
    throw Exception('$this is not known in enum EnhancedMonitoring');
  }
}

///
/// Returns information about an error state of the cluster.
///
class ErrorInfo {
  ///
  /// A number describing the error programmatically.
  ///
  final String? errorCode;

  ///
  /// An optional field to provide more details about the error.
  ///
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

class Firehose {
  final bool enabled;
  final String? deliveryStream;

  Firehose({
    required this.enabled,
    this.deliveryStream,
  });

  factory Firehose.fromJson(Map<String, dynamic> json) {
    return Firehose(
      enabled: json['enabled'] as bool,
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

class GetBootstrapBrokersResponse {
  ///
  /// A string containing one or more hostname:port pairs.
  ///
  final String? bootstrapBrokerString;

  ///
  /// A string that contains one or more DNS names (or IP addresses) and SASL IAM
  /// port pairs.
  ///
  final String? bootstrapBrokerStringSaslIam;

  ///
  /// A string containing one or more DNS names (or IP) and Sasl Scram port pairs.
  ///
  final String? bootstrapBrokerStringSaslScram;

  ///
  /// A string containing one or more DNS names (or IP) and TLS port pairs.
  ///
  final String? bootstrapBrokerStringTls;

  GetBootstrapBrokersResponse({
    this.bootstrapBrokerString,
    this.bootstrapBrokerStringSaslIam,
    this.bootstrapBrokerStringSaslScram,
    this.bootstrapBrokerStringTls,
  });

  factory GetBootstrapBrokersResponse.fromJson(Map<String, dynamic> json) {
    return GetBootstrapBrokersResponse(
      bootstrapBrokerString: json['bootstrapBrokerString'] as String?,
      bootstrapBrokerStringSaslIam:
          json['bootstrapBrokerStringSaslIam'] as String?,
      bootstrapBrokerStringSaslScram:
          json['bootstrapBrokerStringSaslScram'] as String?,
      bootstrapBrokerStringTls: json['bootstrapBrokerStringTls'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bootstrapBrokerString = this.bootstrapBrokerString;
    final bootstrapBrokerStringSaslIam = this.bootstrapBrokerStringSaslIam;
    final bootstrapBrokerStringSaslScram = this.bootstrapBrokerStringSaslScram;
    final bootstrapBrokerStringTls = this.bootstrapBrokerStringTls;
    return {
      if (bootstrapBrokerString != null)
        'bootstrapBrokerString': bootstrapBrokerString,
      if (bootstrapBrokerStringSaslIam != null)
        'bootstrapBrokerStringSaslIam': bootstrapBrokerStringSaslIam,
      if (bootstrapBrokerStringSaslScram != null)
        'bootstrapBrokerStringSaslScram': bootstrapBrokerStringSaslScram,
      if (bootstrapBrokerStringTls != null)
        'bootstrapBrokerStringTls': bootstrapBrokerStringTls,
    };
  }
}

class GetCompatibleKafkaVersionsResponse {
  ///
  /// A list of CompatibleKafkaVersion objects.
  ///
  final List<CompatibleKafkaVersion>? compatibleKafkaVersions;

  GetCompatibleKafkaVersionsResponse({
    this.compatibleKafkaVersions,
  });

  factory GetCompatibleKafkaVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCompatibleKafkaVersionsResponse(
      compatibleKafkaVersions: (json['compatibleKafkaVersions'] as List?)
          ?.whereNotNull()
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

class KafkaVersion {
  final KafkaVersionStatus? status;
  final String? version;

  KafkaVersion({
    this.status,
    this.version,
  });

  factory KafkaVersion.fromJson(Map<String, dynamic> json) {
    return KafkaVersion(
      status: (json['status'] as String?)?.toKafkaVersionStatus(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final version = this.version;
    return {
      if (status != null) 'status': status.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum KafkaVersionStatus {
  active,
  deprecated,
}

extension on KafkaVersionStatus {
  String toValue() {
    switch (this) {
      case KafkaVersionStatus.active:
        return 'ACTIVE';
      case KafkaVersionStatus.deprecated:
        return 'DEPRECATED';
    }
  }
}

extension on String {
  KafkaVersionStatus toKafkaVersionStatus() {
    switch (this) {
      case 'ACTIVE':
        return KafkaVersionStatus.active;
      case 'DEPRECATED':
        return KafkaVersionStatus.deprecated;
    }
    throw Exception('$this is not known in enum KafkaVersionStatus');
  }
}

class ListClusterOperationsResponse {
  ///
  /// An array of cluster operation information objects.
  ///
  final List<ClusterOperationInfo>? clusterOperationInfoList;

  ///
  /// If the response of ListClusterOperations is truncated, it returns a
  /// NextToken in the response. This Nexttoken should be sent in the subsequent
  /// request to ListClusterOperations.
  ///
  final String? nextToken;

  ListClusterOperationsResponse({
    this.clusterOperationInfoList,
    this.nextToken,
  });

  factory ListClusterOperationsResponse.fromJson(Map<String, dynamic> json) {
    return ListClusterOperationsResponse(
      clusterOperationInfoList: (json['clusterOperationInfoList'] as List?)
          ?.whereNotNull()
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

class ListClustersResponse {
  ///
  /// Information on each of the MSK clusters in the response.
  ///
  final List<ClusterInfo>? clusterInfoList;

  ///
  /// The paginated results marker. When the result of a ListClusters operation is
  /// truncated, the call returns NextToken in the response.
  /// To get another batch of clusters, provide this token in your next request.
  ///
  final String? nextToken;

  ListClustersResponse({
    this.clusterInfoList,
    this.nextToken,
  });

  factory ListClustersResponse.fromJson(Map<String, dynamic> json) {
    return ListClustersResponse(
      clusterInfoList: (json['clusterInfoList'] as List?)
          ?.whereNotNull()
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

class ListConfigurationRevisionsResponse {
  ///
  /// Paginated results marker.
  ///
  final String? nextToken;

  ///
  /// List of ConfigurationRevision objects.
  ///
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
          ?.whereNotNull()
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

class ListConfigurationsResponse {
  ///
  /// An array of MSK configurations.
  ///
  final List<Configuration>? configurations;

  ///
  /// The paginated results marker. When the result of a ListConfigurations
  /// operation is truncated, the call returns NextToken in the response.
  /// To get another batch of configurations, provide this token in your next
  /// request.
  ///
  final String? nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.nextToken,
  });

  factory ListConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigurationsResponse(
      configurations: (json['configurations'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class ListNodesResponse {
  ///
  /// The paginated results marker. When the result of a ListNodes operation is
  /// truncated, the call returns NextToken in the response.
  /// To get another batch of nodes, provide this token in your next request.
  ///
  final String? nextToken;

  ///
  /// List containing a NodeInfo object.
  ///
  final List<NodeInfo>? nodeInfoList;

  ListNodesResponse({
    this.nextToken,
    this.nodeInfoList,
  });

  factory ListNodesResponse.fromJson(Map<String, dynamic> json) {
    return ListNodesResponse(
      nextToken: json['nextToken'] as String?,
      nodeInfoList: (json['nodeInfoList'] as List?)
          ?.whereNotNull()
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

class ListScramSecretsResponse {
  ///
  /// Paginated results marker.
  ///
  final String? nextToken;

  ///
  /// The list of scram secrets associated with the cluster.
  ///
  final List<String>? secretArnList;

  ListScramSecretsResponse({
    this.nextToken,
    this.secretArnList,
  });

  factory ListScramSecretsResponse.fromJson(Map<String, dynamic> json) {
    return ListScramSecretsResponse(
      nextToken: json['nextToken'] as String?,
      secretArnList: (json['secretArnList'] as List?)
          ?.whereNotNull()
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

class ListTagsForResourceResponse {
  ///
  /// The key-value pair for the resource tag.
  ///
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

class LoggingInfo {
  final BrokerLogs brokerLogs;

  LoggingInfo({
    required this.brokerLogs,
  });

  factory LoggingInfo.fromJson(Map<String, dynamic> json) {
    return LoggingInfo(
      brokerLogs:
          BrokerLogs.fromJson(json['brokerLogs'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final brokerLogs = this.brokerLogs;
    return {
      'brokerLogs': brokerLogs,
    };
  }
}

///
/// Information about cluster attributes that can be updated via update APIs.
///
class MutableClusterInfo {
  ///
  /// Specifies the size of the EBS volume and the ID of the associated broker.
  ///
  final List<BrokerEBSVolumeInfo>? brokerEBSVolumeInfo;

  ///
  /// Information about the changes in the configuration of the brokers.
  ///
  final ConfigurationInfo? configurationInfo;

  ///
  /// Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon
  /// CloudWatch for this cluster.
  ///
  final EnhancedMonitoring? enhancedMonitoring;

  ///
  /// Information about the Amazon MSK broker type.
  ///
  final String? instanceType;

  ///
  /// The Kafka version.
  ///
  final String? kafkaVersion;
  final LoggingInfo? loggingInfo;

  ///
  /// The number of broker nodes in the cluster.
  ///
  final int? numberOfBrokerNodes;

  ///
  /// The settings for open monitoring.
  ///
  final OpenMonitoring? openMonitoring;

  MutableClusterInfo({
    this.brokerEBSVolumeInfo,
    this.configurationInfo,
    this.enhancedMonitoring,
    this.instanceType,
    this.kafkaVersion,
    this.loggingInfo,
    this.numberOfBrokerNodes,
    this.openMonitoring,
  });

  factory MutableClusterInfo.fromJson(Map<String, dynamic> json) {
    return MutableClusterInfo(
      brokerEBSVolumeInfo: (json['brokerEBSVolumeInfo'] as List?)
          ?.whereNotNull()
          .map((e) => BrokerEBSVolumeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      configurationInfo: json['configurationInfo'] != null
          ? ConfigurationInfo.fromJson(
              json['configurationInfo'] as Map<String, dynamic>)
          : null,
      enhancedMonitoring:
          (json['enhancedMonitoring'] as String?)?.toEnhancedMonitoring(),
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
    );
  }

  Map<String, dynamic> toJson() {
    final brokerEBSVolumeInfo = this.brokerEBSVolumeInfo;
    final configurationInfo = this.configurationInfo;
    final enhancedMonitoring = this.enhancedMonitoring;
    final instanceType = this.instanceType;
    final kafkaVersion = this.kafkaVersion;
    final loggingInfo = this.loggingInfo;
    final numberOfBrokerNodes = this.numberOfBrokerNodes;
    final openMonitoring = this.openMonitoring;
    return {
      if (brokerEBSVolumeInfo != null)
        'brokerEBSVolumeInfo': brokerEBSVolumeInfo,
      if (configurationInfo != null) 'configurationInfo': configurationInfo,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.toValue(),
      if (instanceType != null) 'instanceType': instanceType,
      if (kafkaVersion != null) 'kafkaVersion': kafkaVersion,
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (numberOfBrokerNodes != null)
        'numberOfBrokerNodes': numberOfBrokerNodes,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
    };
  }
}

///
/// Indicates whether you want to enable or disable the Node Exporter.
///
class NodeExporter {
  ///
  /// Indicates whether you want to enable or disable the Node Exporter.
  ///
  final bool enabledInBroker;

  NodeExporter({
    required this.enabledInBroker,
  });

  factory NodeExporter.fromJson(Map<String, dynamic> json) {
    return NodeExporter(
      enabledInBroker: json['enabledInBroker'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

///
/// Indicates whether you want to enable or disable the Node Exporter.
///
class NodeExporterInfo {
  ///
  /// Indicates whether you want to enable or disable the Node Exporter.
  ///
  final bool enabledInBroker;

  NodeExporterInfo({
    required this.enabledInBroker,
  });

  factory NodeExporterInfo.fromJson(Map<String, dynamic> json) {
    return NodeExporterInfo(
      enabledInBroker: json['enabledInBroker'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

///
/// Indicates whether you want to enable or disable the JMX Exporter.
///
class JmxExporter {
  ///
  /// Indicates whether you want to enable or disable the JMX Exporter.
  ///
  final bool enabledInBroker;

  JmxExporter({
    required this.enabledInBroker,
  });

  factory JmxExporter.fromJson(Map<String, dynamic> json) {
    return JmxExporter(
      enabledInBroker: json['enabledInBroker'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

///
/// Indicates whether you want to enable or disable the JMX Exporter.
///
class JmxExporterInfo {
  ///
  /// Indicates whether you want to enable or disable the JMX Exporter.
  ///
  final bool enabledInBroker;

  JmxExporterInfo({
    required this.enabledInBroker,
  });

  factory JmxExporterInfo.fromJson(Map<String, dynamic> json) {
    return JmxExporterInfo(
      enabledInBroker: json['enabledInBroker'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

///
/// JMX and Node monitoring for the MSK cluster.
///
class OpenMonitoring {
  ///
  /// Prometheus settings.
  ///
  final Prometheus prometheus;

  OpenMonitoring({
    required this.prometheus,
  });

  factory OpenMonitoring.fromJson(Map<String, dynamic> json) {
    return OpenMonitoring(
      prometheus:
          Prometheus.fromJson(json['prometheus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final prometheus = this.prometheus;
    return {
      'prometheus': prometheus,
    };
  }
}

///
/// JMX and Node monitoring for the MSK cluster.
///
class OpenMonitoringInfo {
  ///
  /// Prometheus settings.
  ///
  final PrometheusInfo prometheus;

  OpenMonitoringInfo({
    required this.prometheus,
  });

  factory OpenMonitoringInfo.fromJson(Map<String, dynamic> json) {
    return OpenMonitoringInfo(
      prometheus:
          PrometheusInfo.fromJson(json['prometheus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final prometheus = this.prometheus;
    return {
      'prometheus': prometheus,
    };
  }
}

///
/// Prometheus settings.
///
class Prometheus {
  ///
  /// Indicates whether you want to enable or disable the JMX Exporter.
  ///
  final JmxExporter? jmxExporter;

  ///
  /// Indicates whether you want to enable or disable the Node Exporter.
  ///
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

///
/// Prometheus settings.
///
class PrometheusInfo {
  ///
  /// Indicates whether you want to enable or disable the JMX Exporter.
  ///
  final JmxExporterInfo? jmxExporter;

  ///
  /// Indicates whether you want to enable or disable the Node Exporter.
  ///
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

class RebootBrokerResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
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
      enabled: json['enabled'] as bool,
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

///
/// Details for client authentication using SASL.
///
class Sasl {
  ///
  /// Indicates whether IAM access control is enabled.
  ///
  final Iam? iam;

  ///
  /// Details for SASL/SCRAM client authentication.
  ///
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

///
/// Details for SASL/SCRAM client authentication.
///
class Scram {
  ///
  /// SASL/SCRAM authentication is enabled or not.
  ///
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

///
/// Details for IAM access control.
///
class Iam {
  ///
  /// Indicates whether IAM access control is enabled.
  ///
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

///
/// The node information object.
///
class NodeInfo {
  ///
  /// The start time.
  ///
  final String? addedToClusterTime;

  ///
  /// The broker node info.
  ///
  final BrokerNodeInfo? brokerNodeInfo;

  ///
  /// The instance type.
  ///
  final String? instanceType;

  ///
  /// The Amazon Resource Name (ARN) of the node.
  ///
  final String? nodeARN;

  ///
  /// The node type.
  ///
  final NodeType? nodeType;

  ///
  /// The ZookeeperNodeInfo.
  ///
  final ZookeeperNodeInfo? zookeeperNodeInfo;

  NodeInfo({
    this.addedToClusterTime,
    this.brokerNodeInfo,
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
      instanceType: json['instanceType'] as String?,
      nodeARN: json['nodeARN'] as String?,
      nodeType: (json['nodeType'] as String?)?.toNodeType(),
      zookeeperNodeInfo: json['zookeeperNodeInfo'] != null
          ? ZookeeperNodeInfo.fromJson(
              json['zookeeperNodeInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addedToClusterTime = this.addedToClusterTime;
    final brokerNodeInfo = this.brokerNodeInfo;
    final instanceType = this.instanceType;
    final nodeARN = this.nodeARN;
    final nodeType = this.nodeType;
    final zookeeperNodeInfo = this.zookeeperNodeInfo;
    return {
      if (addedToClusterTime != null) 'addedToClusterTime': addedToClusterTime,
      if (brokerNodeInfo != null) 'brokerNodeInfo': brokerNodeInfo,
      if (instanceType != null) 'instanceType': instanceType,
      if (nodeARN != null) 'nodeARN': nodeARN,
      if (nodeType != null) 'nodeType': nodeType.toValue(),
      if (zookeeperNodeInfo != null) 'zookeeperNodeInfo': zookeeperNodeInfo,
    };
  }
}

///
/// The broker or Zookeeper node.
///
enum NodeType {
  broker,
}

extension on NodeType {
  String toValue() {
    switch (this) {
      case NodeType.broker:
        return 'BROKER';
    }
  }
}

extension on String {
  NodeType toNodeType() {
    switch (this) {
      case 'BROKER':
        return NodeType.broker;
    }
    throw Exception('$this is not known in enum NodeType');
  }
}

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

///
/// Contains information about storage volumes attached to MSK broker nodes.
///
class StorageInfo {
  ///
  /// EBS volume information.
  ///
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

///
/// Details for client authentication using TLS.
///
class Tls {
  ///
  /// List of ACM Certificate Authority ARNs.
  ///
  final List<String>? certificateAuthorityArnList;

  Tls({
    this.certificateAuthorityArnList,
  });

  factory Tls.fromJson(Map<String, dynamic> json) {
    return Tls(
      certificateAuthorityArnList:
          (json['certificateAuthorityArnList'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArnList = this.certificateAuthorityArnList;
    return {
      if (certificateAuthorityArnList != null)
        'certificateAuthorityArnList': certificateAuthorityArnList,
    };
  }
}

///
/// Error info for scram secret associate/disassociate failure.
///
class UnprocessedScramSecret {
  ///
  /// Error code for associate/disassociate failure.
  ///
  final String? errorCode;

  ///
  /// Error message for associate/disassociate failure.
  ///
  final String? errorMessage;

  ///
  /// AWS Secrets Manager secret ARN.
  ///
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

class UpdateBrokerCountResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
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

class UpdateBrokerTypeResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
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

class UpdateBrokerStorageResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
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

class UpdateClusterConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
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

class UpdateClusterKafkaVersionResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
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

class UpdateMonitoringResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
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

class UpdateConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String? arn;

  ///
  /// Latest revision of the configuration.
  ///
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

///
/// Zookeeper node information.
///
class ZookeeperNodeInfo {
  ///
  /// The attached elastic network interface of the broker.
  ///
  final String? attachedENIId;

  ///
  /// The virtual private cloud (VPC) IP address of the client.
  ///
  final String? clientVpcIpAddress;

  ///
  /// Endpoints for accessing the ZooKeeper.
  ///
  final List<String>? endpoints;

  ///
  /// The role-specific ID for Zookeeper.
  ///
  final double? zookeeperId;

  ///
  /// The version of Zookeeper.
  ///
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      zookeeperId: json['zookeeperId'] as double?,
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
      if (zookeeperId != null) 'zookeeperId': zookeeperId,
      if (zookeeperVersion != null) 'zookeeperVersion': zookeeperVersion,
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

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
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
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
