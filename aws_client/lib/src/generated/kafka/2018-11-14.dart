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

part '2018-11-14.g.dart';

///
/// The operations for managing an Amazon MSK cluster.
///
class Kafka {
  final _s.RestJsonProtocol _protocol;
  Kafka({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String clusterArn,
    @_s.required List<String> secretArnList,
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
    @_s.required BrokerNodeGroupInfo brokerNodeGroupInfo,
    @_s.required String clusterName,
    @_s.required String kafkaVersion,
    @_s.required int numberOfBrokerNodes,
    ClientAuthentication clientAuthentication,
    ConfigurationInfo configurationInfo,
    EncryptionInfo encryptionInfo,
    EnhancedMonitoring enhancedMonitoring,
    LoggingInfo loggingInfo,
    OpenMonitoringInfo openMonitoring,
    Map<String, String> tags,
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
    @_s.required String name,
    @_s.required Uint8List serverProperties,
    String description,
    List<String> kafkaVersions,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(serverProperties, 'serverProperties');
    final $payload = <String, dynamic>{
      'name': name,
      'serverProperties': serverProperties?.let(base64Encode),
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
    @_s.required String clusterArn,
    String currentVersion,
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
    @_s.required String arn,
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
    @_s.required String clusterArn,
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
    @_s.required String clusterOperationArn,
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
    @_s.required String arn,
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
    @_s.required String arn,
    @_s.required int revision,
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
    @_s.required String clusterArn,
    @_s.required List<String> secretArnList,
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
    @_s.required String clusterArn,
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
    String clusterArn,
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
    @_s.required String clusterArn,
    int maxResults,
    String nextToken,
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
    String clusterNameFilter,
    int maxResults,
    String nextToken,
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
    @_s.required String arn,
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    @_s.required String clusterArn,
    int maxResults,
    String nextToken,
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
    @_s.required String clusterArn,
    int maxResults,
    String nextToken,
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
    @_s.required String resourceArn,
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
    @_s.required List<String> brokerIds,
    @_s.required String clusterArn,
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
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
    @_s.required String clusterArn,
    @_s.required String currentVersion,
    @_s.required int targetNumberOfBrokerNodes,
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
    @_s.required String clusterArn,
    @_s.required String currentVersion,
    @_s.required List<BrokerEBSVolumeInfo> targetBrokerEBSVolumeInfo,
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
    @_s.required String arn,
    @_s.required Uint8List serverProperties,
    String description,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    ArgumentError.checkNotNull(serverProperties, 'serverProperties');
    final $payload = <String, dynamic>{
      'serverProperties': serverProperties?.let(base64Encode),
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
    @_s.required String clusterArn,
    @_s.required ConfigurationInfo configurationInfo,
    @_s.required String currentVersion,
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
    @_s.required String clusterArn,
    @_s.required String currentVersion,
    @_s.required String targetKafkaVersion,
    ConfigurationInfo configurationInfo,
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
    @_s.required String clusterArn,
    @_s.required String currentVersion,
    EnhancedMonitoring enhancedMonitoring,
    LoggingInfo loggingInfo,
    OpenMonitoringInfo openMonitoring,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAssociateScramSecretResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// List of errors when associating secrets to cluster.
  ///
  @_s.JsonKey(name: 'unprocessedScramSecrets')
  final List<UnprocessedScramSecret> unprocessedScramSecrets;

  BatchAssociateScramSecretResponse({
    this.clusterArn,
    this.unprocessedScramSecrets,
  });
  factory BatchAssociateScramSecretResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchAssociateScramSecretResponseFromJson(json);
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
  @_s.JsonValue('DEFAULT')
  $default,
}

///
/// Specifies the EBS volume upgrade information. The broker identifier must be
/// set to the keyword ALL. This means the changes apply to all the brokers in
/// the cluster.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BrokerEBSVolumeInfo {
  ///
  /// The ID of the broker to update.
  ///
  @_s.JsonKey(name: 'kafkaBrokerNodeId')
  final String kafkaBrokerNodeId;

  ///
  /// Size of the EBS volume to update.
  ///
  @_s.JsonKey(name: 'volumeSizeGB')
  final int volumeSizeGB;

  BrokerEBSVolumeInfo({
    @_s.required this.kafkaBrokerNodeId,
    @_s.required this.volumeSizeGB,
  });
  factory BrokerEBSVolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$BrokerEBSVolumeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerEBSVolumeInfoToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BrokerLogs {
  @_s.JsonKey(name: 'cloudWatchLogs')
  final CloudWatchLogs cloudWatchLogs;
  @_s.JsonKey(name: 'firehose')
  final Firehose firehose;
  @_s.JsonKey(name: 's3')
  final S3 s3;

  BrokerLogs({
    this.cloudWatchLogs,
    this.firehose,
    this.s3,
  });
  factory BrokerLogs.fromJson(Map<String, dynamic> json) =>
      _$BrokerLogsFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerLogsToJson(this);
}

///
/// Describes the setup to be used for Kafka broker nodes in the cluster.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BrokerNodeGroupInfo {
  ///
  /// The list of subnets to connect to in the client virtual private cloud (VPC).
  /// AWS creates elastic network interfaces inside these subnets. Client
  /// applications use elastic network interfaces to produce and consume data.
  /// Client subnets can't be in Availability Zone us-east-1e.
  ///
  @_s.JsonKey(name: 'clientSubnets')
  final List<String> clientSubnets;

  ///
  /// The type of Amazon EC2 instances to use for Kafka brokers. The following
  /// instance types are allowed: kafka.m5.large, kafka.m5.xlarge,
  /// kafka.m5.2xlarge,
  /// kafka.m5.4xlarge, kafka.m5.12xlarge, and kafka.m5.24xlarge.
  ///
  @_s.JsonKey(name: 'instanceType')
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
  @_s.JsonKey(name: 'brokerAZDistribution')
  final BrokerAZDistribution brokerAZDistribution;

  ///
  /// The AWS security groups to associate with the elastic network interfaces in
  /// order to specify who can connect to and communicate with the Amazon MSK
  /// cluster. If you don't specify a security group, Amazon MSK uses the default
  /// security group associated with the VPC.
  ///
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  ///
  /// Contains information about storage volumes attached to MSK broker nodes.
  ///
  @_s.JsonKey(name: 'storageInfo')
  final StorageInfo storageInfo;

  BrokerNodeGroupInfo({
    @_s.required this.clientSubnets,
    @_s.required this.instanceType,
    this.brokerAZDistribution,
    this.securityGroups,
    this.storageInfo,
  });
  factory BrokerNodeGroupInfo.fromJson(Map<String, dynamic> json) =>
      _$BrokerNodeGroupInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerNodeGroupInfoToJson(this);
}

///
/// BrokerNodeInfo
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BrokerNodeInfo {
  ///
  /// The attached elastic network interface of the broker.
  ///
  @_s.JsonKey(name: 'attachedENIId')
  final String attachedENIId;

  ///
  /// The ID of the broker.
  ///
  @_s.JsonKey(name: 'brokerId')
  final double brokerId;

  ///
  /// The client subnet to which this broker node belongs.
  ///
  @_s.JsonKey(name: 'clientSubnet')
  final String clientSubnet;

  ///
  /// The virtual private cloud (VPC) of the client.
  ///
  @_s.JsonKey(name: 'clientVpcIpAddress')
  final String clientVpcIpAddress;

  ///
  /// Information about the version of software currently deployed on the Kafka
  /// brokers in the cluster.
  ///
  @_s.JsonKey(name: 'currentBrokerSoftwareInfo')
  final BrokerSoftwareInfo currentBrokerSoftwareInfo;

  ///
  /// Endpoints for accessing the broker.
  ///
  @_s.JsonKey(name: 'endpoints')
  final List<String> endpoints;

  BrokerNodeInfo({
    this.attachedENIId,
    this.brokerId,
    this.clientSubnet,
    this.clientVpcIpAddress,
    this.currentBrokerSoftwareInfo,
    this.endpoints,
  });
  factory BrokerNodeInfo.fromJson(Map<String, dynamic> json) =>
      _$BrokerNodeInfoFromJson(json);
}

///
/// Information about the current software installed on the cluster.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BrokerSoftwareInfo {
  ///
  /// The Amazon Resource Name (ARN) of the configuration used for the cluster.
  /// This field isn't visible in this preview release.
  ///
  @_s.JsonKey(name: 'configurationArn')
  final String configurationArn;

  ///
  /// The revision of the configuration to use. This field isn't visible in this
  /// preview release.
  ///
  @_s.JsonKey(name: 'configurationRevision')
  final int configurationRevision;

  ///
  /// The version of Apache Kafka.
  ///
  @_s.JsonKey(name: 'kafkaVersion')
  final String kafkaVersion;

  BrokerSoftwareInfo({
    this.configurationArn,
    this.configurationRevision,
    this.kafkaVersion,
  });
  factory BrokerSoftwareInfo.fromJson(Map<String, dynamic> json) =>
      _$BrokerSoftwareInfoFromJson(json);
}

///
/// Includes all client authentication information.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ClientAuthentication {
  ///
  /// Details for ClientAuthentication using SASL.
  ///
  @_s.JsonKey(name: 'sasl')
  final Sasl sasl;

  ///
  /// Details for ClientAuthentication using TLS.
  ///
  @_s.JsonKey(name: 'tls')
  final Tls tls;

  ClientAuthentication({
    this.sasl,
    this.tls,
  });
  factory ClientAuthentication.fromJson(Map<String, dynamic> json) =>
      _$ClientAuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$ClientAuthenticationToJson(this);
}

///
/// Client-broker encryption in transit setting.
///
enum ClientBroker {
  @_s.JsonValue('TLS')
  tls,
  @_s.JsonValue('TLS_PLAINTEXT')
  tlsPlaintext,
  @_s.JsonValue('PLAINTEXT')
  plaintext,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchLogs {
  @_s.JsonKey(name: 'enabled')
  final bool enabled;
  @_s.JsonKey(name: 'logGroup')
  final String logGroup;

  CloudWatchLogs({
    @_s.required this.enabled,
    this.logGroup,
  });
  factory CloudWatchLogs.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchLogsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchLogsToJson(this);
}

///
/// Returns information about a cluster.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterInfo {
  ///
  /// Arn of active cluster operation.
  ///
  @_s.JsonKey(name: 'activeOperationArn')
  final String activeOperationArn;

  ///
  /// Information about the broker nodes.
  ///
  @_s.JsonKey(name: 'brokerNodeGroupInfo')
  final BrokerNodeGroupInfo brokerNodeGroupInfo;

  ///
  /// Includes all client authentication information.
  ///
  @_s.JsonKey(name: 'clientAuthentication')
  final ClientAuthentication clientAuthentication;

  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The name of the cluster.
  ///
  @_s.JsonKey(name: 'clusterName')
  final String clusterName;

  ///
  /// The time when the cluster was created.
  ///
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  ///
  /// Information about the version of software currently deployed on the Kafka
  /// brokers in the cluster.
  ///
  @_s.JsonKey(name: 'currentBrokerSoftwareInfo')
  final BrokerSoftwareInfo currentBrokerSoftwareInfo;

  ///
  /// The current version of the MSK cluster.
  ///
  @_s.JsonKey(name: 'currentVersion')
  final String currentVersion;

  ///
  /// Includes all encryption-related information.
  ///
  @_s.JsonKey(name: 'encryptionInfo')
  final EncryptionInfo encryptionInfo;

  ///
  /// Specifies which metrics are gathered for the MSK cluster. This property has
  /// the following possible values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER,
  /// and PER_TOPIC_PER_PARTITION. For a list of the metrics associated with each
  /// of these levels of monitoring, see <a
  /// href="https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html">Monitoring</a>.
  ///
  @_s.JsonKey(name: 'enhancedMonitoring')
  final EnhancedMonitoring enhancedMonitoring;
  @_s.JsonKey(name: 'loggingInfo')
  final LoggingInfo loggingInfo;

  ///
  /// The number of broker nodes in the cluster.
  ///
  @_s.JsonKey(name: 'numberOfBrokerNodes')
  final int numberOfBrokerNodes;

  ///
  /// Settings for open monitoring using Prometheus.
  ///
  @_s.JsonKey(name: 'openMonitoring')
  final OpenMonitoring openMonitoring;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  @_s.JsonKey(name: 'state')
  final ClusterState state;
  @_s.JsonKey(name: 'stateInfo')
  final StateInfo stateInfo;

  ///
  /// Tags attached to the cluster.
  ///
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ///
  /// The connection string to use to connect to the Apache ZooKeeper cluster.
  ///
  @_s.JsonKey(name: 'zookeeperConnectString')
  final String zookeeperConnectString;

  ///
  /// The connection string to use to connect to zookeeper cluster on Tls port.
  ///
  @_s.JsonKey(name: 'zookeeperConnectStringTls')
  final String zookeeperConnectStringTls;

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
  factory ClusterInfo.fromJson(Map<String, dynamic> json) =>
      _$ClusterInfoFromJson(json);
}

///
/// Returns information about a cluster operation.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterOperationInfo {
  ///
  /// The ID of the API request that triggered this operation.
  ///
  @_s.JsonKey(name: 'clientRequestId')
  final String clientRequestId;

  ///
  /// ARN of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The time that the operation was created.
  ///
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  ///
  /// The time at which the operation finished.
  ///
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  ///
  /// Describes the error if the operation fails.
  ///
  @_s.JsonKey(name: 'errorInfo')
  final ErrorInfo errorInfo;

  ///
  /// ARN of the cluster operation.
  ///
  @_s.JsonKey(name: 'operationArn')
  final String operationArn;

  ///
  /// State of the cluster operation.
  ///
  @_s.JsonKey(name: 'operationState')
  final String operationState;

  ///
  /// Steps completed during the operation.
  ///
  @_s.JsonKey(name: 'operationSteps')
  final List<ClusterOperationStep> operationSteps;

  ///
  /// Type of the cluster operation.
  ///
  @_s.JsonKey(name: 'operationType')
  final String operationType;

  ///
  /// Information about cluster attributes before a cluster is updated.
  ///
  @_s.JsonKey(name: 'sourceClusterInfo')
  final MutableClusterInfo sourceClusterInfo;

  ///
  /// Information about cluster attributes after a cluster is updated.
  ///
  @_s.JsonKey(name: 'targetClusterInfo')
  final MutableClusterInfo targetClusterInfo;

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
  factory ClusterOperationInfo.fromJson(Map<String, dynamic> json) =>
      _$ClusterOperationInfoFromJson(json);
}

///
/// Step taken during a cluster operation.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterOperationStep {
  ///
  /// Information about the step and its status.
  ///
  @_s.JsonKey(name: 'stepInfo')
  final ClusterOperationStepInfo stepInfo;

  ///
  /// The name of the step.
  ///
  @_s.JsonKey(name: 'stepName')
  final String stepName;

  ClusterOperationStep({
    this.stepInfo,
    this.stepName,
  });
  factory ClusterOperationStep.fromJson(Map<String, dynamic> json) =>
      _$ClusterOperationStepFromJson(json);
}

///
/// State information about the operation step.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterOperationStepInfo {
  ///
  /// The steps current status.
  ///
  @_s.JsonKey(name: 'stepStatus')
  final String stepStatus;

  ClusterOperationStepInfo({
    this.stepStatus,
  });
  factory ClusterOperationStepInfo.fromJson(Map<String, dynamic> json) =>
      _$ClusterOperationStepInfoFromJson(json);
}

///
/// The state of a Kafka cluster.
///
enum ClusterState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('HEALING')
  healing,
  @_s.JsonValue('MAINTENANCE')
  maintenance,
  @_s.JsonValue('REBOOTING_BROKER')
  rebootingBroker,
  @_s.JsonValue('UPDATING')
  updating,
}

///
/// Contains source Kafka versions and compatible target Kafka versions.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompatibleKafkaVersion {
  ///
  /// A Kafka version.
  ///
  @_s.JsonKey(name: 'sourceVersion')
  final String sourceVersion;

  ///
  /// A list of Kafka versions.
  ///
  @_s.JsonKey(name: 'targetVersions')
  final List<String> targetVersions;

  CompatibleKafkaVersion({
    this.sourceVersion,
    this.targetVersions,
  });
  factory CompatibleKafkaVersion.fromJson(Map<String, dynamic> json) =>
      _$CompatibleKafkaVersionFromJson(json);
}

///
/// Represents an MSK Configuration.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Configuration {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  @_s.JsonKey(name: 'arn')
  final String arn;

  ///
  /// The time when the configuration was created.
  ///
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  ///
  /// The description of the configuration.
  ///
  @_s.JsonKey(name: 'description')
  final String description;

  ///
  /// An array of the versions of Apache Kafka with which you can use this MSK
  /// configuration. You can use this configuration for an MSK cluster only if the
  /// Apache Kafka version specified for the cluster appears in this array.
  ///
  @_s.JsonKey(name: 'kafkaVersions')
  final List<String> kafkaVersions;

  ///
  /// Latest revision of the configuration.
  ///
  @_s.JsonKey(name: 'latestRevision')
  final ConfigurationRevision latestRevision;

  ///
  /// The name of the configuration.
  ///
  @_s.JsonKey(name: 'name')
  final String name;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
  @_s.JsonKey(name: 'state')
  final ConfigurationState state;

  Configuration({
    @_s.required this.arn,
    @_s.required this.creationTime,
    @_s.required this.description,
    @_s.required this.kafkaVersions,
    @_s.required this.latestRevision,
    @_s.required this.name,
    @_s.required this.state,
  });
  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);
}

///
/// Specifies the configuration to use for the brokers.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfigurationInfo {
  ///
  /// ARN of the configuration to use.
  ///
  @_s.JsonKey(name: 'arn')
  final String arn;

  ///
  /// The revision of the configuration to use.
  ///
  @_s.JsonKey(name: 'revision')
  final int revision;

  ConfigurationInfo({
    @_s.required this.arn,
    @_s.required this.revision,
  });
  factory ConfigurationInfo.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationInfoToJson(this);
}

///
/// Describes a configuration revision.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigurationRevision {
  ///
  /// The time when the configuration revision was created.
  ///
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  ///
  /// The revision number.
  ///
  @_s.JsonKey(name: 'revision')
  final int revision;

  ///
  /// The description of the configuration revision.
  ///
  @_s.JsonKey(name: 'description')
  final String description;

  ConfigurationRevision({
    @_s.required this.creationTime,
    @_s.required this.revision,
    this.description,
  });
  factory ConfigurationRevision.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationRevisionFromJson(json);
}

///
/// The state of a configuration.
///
enum ConfigurationState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateClusterResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The name of the MSK cluster.
  ///
  @_s.JsonKey(name: 'clusterName')
  final String clusterName;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  @_s.JsonKey(name: 'state')
  final ClusterState state;

  CreateClusterResponse({
    this.clusterArn,
    this.clusterName,
    this.state,
  });
  factory CreateClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  @_s.JsonKey(name: 'arn')
  final String arn;

  ///
  /// The time when the configuration was created.
  ///
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  ///
  /// Latest revision of the configuration.
  ///
  @_s.JsonKey(name: 'latestRevision')
  final ConfigurationRevision latestRevision;

  ///
  /// The name of the configuration.
  ///
  @_s.JsonKey(name: 'name')
  final String name;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
  @_s.JsonKey(name: 'state')
  final ConfigurationState state;

  CreateConfigurationResponse({
    this.arn,
    this.creationTime,
    this.latestRevision,
    this.name,
    this.state,
  });
  factory CreateConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteClusterResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  @_s.JsonKey(name: 'state')
  final ClusterState state;

  DeleteClusterResponse({
    this.clusterArn,
    this.state,
  });
  factory DeleteClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration.
  ///
  @_s.JsonKey(name: 'arn')
  final String arn;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
  @_s.JsonKey(name: 'state')
  final ConfigurationState state;

  DeleteConfigurationResponse({
    this.arn,
    this.state,
  });
  factory DeleteConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeClusterOperationResponse {
  ///
  /// Cluster operation information
  ///
  @_s.JsonKey(name: 'clusterOperationInfo')
  final ClusterOperationInfo clusterOperationInfo;

  DescribeClusterOperationResponse({
    this.clusterOperationInfo,
  });
  factory DescribeClusterOperationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeClusterOperationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeClusterResponse {
  ///
  /// The cluster information.
  ///
  @_s.JsonKey(name: 'clusterInfo')
  final ClusterInfo clusterInfo;

  DescribeClusterResponse({
    this.clusterInfo,
  });
  factory DescribeClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  @_s.JsonKey(name: 'arn')
  final String arn;

  ///
  /// The time when the configuration was created.
  ///
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  ///
  /// The description of the configuration.
  ///
  @_s.JsonKey(name: 'description')
  final String description;

  ///
  /// The versions of Apache Kafka with which you can use this MSK configuration.
  ///
  @_s.JsonKey(name: 'kafkaVersions')
  final List<String> kafkaVersions;

  ///
  /// Latest revision of the configuration.
  ///
  @_s.JsonKey(name: 'latestRevision')
  final ConfigurationRevision latestRevision;

  ///
  /// The name of the configuration.
  ///
  @_s.JsonKey(name: 'name')
  final String name;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
  @_s.JsonKey(name: 'state')
  final ConfigurationState state;

  DescribeConfigurationResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.kafkaVersions,
    this.latestRevision,
    this.name,
    this.state,
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
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  @_s.JsonKey(name: 'arn')
  final String arn;

  ///
  /// The time when the configuration was created.
  ///
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  ///
  /// The description of the configuration.
  ///
  @_s.JsonKey(name: 'description')
  final String description;

  ///
  /// The revision number.
  ///
  @_s.JsonKey(name: 'revision')
  final int revision;

  ///
  /// Contents of the <filename>server.properties</filename> file. When using the
  /// API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the contents
  /// of <filename>server.properties</filename> can be in plaintext.
  ///
  @Uint8ListConverter()
  @_s.JsonKey(name: 'serverProperties')
  final Uint8List serverProperties;

  DescribeConfigurationRevisionResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.revision,
    this.serverProperties,
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
class BatchDisassociateScramSecretResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// List of errors when disassociating secrets to cluster.
  ///
  @_s.JsonKey(name: 'unprocessedScramSecrets')
  final List<UnprocessedScramSecret> unprocessedScramSecrets;

  BatchDisassociateScramSecretResponse({
    this.clusterArn,
    this.unprocessedScramSecrets,
  });
  factory BatchDisassociateScramSecretResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDisassociateScramSecretResponseFromJson(json);
}

///
/// Contains information about the EBS storage volumes attached to Kafka broker
/// nodes.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EBSStorageInfo {
  ///
  /// The size in GiB of the EBS volume for the data drive on each broker node.
  ///
  @_s.JsonKey(name: 'volumeSize')
  final int volumeSize;

  EBSStorageInfo({
    this.volumeSize,
  });
  factory EBSStorageInfo.fromJson(Map<String, dynamic> json) =>
      _$EBSStorageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EBSStorageInfoToJson(this);
}

///
/// The data-volume encryption details.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionAtRest {
  ///
  /// The ARN of the AWS KMS key for encrypting data at rest. If you don't specify
  /// a KMS key, MSK creates one for you and uses it.
  ///
  @_s.JsonKey(name: 'dataVolumeKMSKeyId')
  final String dataVolumeKMSKeyId;

  EncryptionAtRest({
    @_s.required this.dataVolumeKMSKeyId,
  });
  factory EncryptionAtRest.fromJson(Map<String, dynamic> json) =>
      _$EncryptionAtRestFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionAtRestToJson(this);
}

///
/// The settings for encrypting data in transit.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'clientBroker')
  final ClientBroker clientBroker;

  ///
  /// When set to true, it indicates that data communication among the broker
  /// nodes of the cluster is encrypted. When set to false, the communication
  /// happens in plaintext.
  ///
  ///
  /// The default value is true.
  ///
  @_s.JsonKey(name: 'inCluster')
  final bool inCluster;

  EncryptionInTransit({
    this.clientBroker,
    this.inCluster,
  });
  factory EncryptionInTransit.fromJson(Map<String, dynamic> json) =>
      _$EncryptionInTransitFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionInTransitToJson(this);
}

///
/// Includes encryption-related information, such as the AWS KMS key used for
/// encrypting data at rest and whether you want MSK to encrypt your data in
/// transit.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionInfo {
  ///
  /// The data-volume encryption details.
  ///
  @_s.JsonKey(name: 'encryptionAtRest')
  final EncryptionAtRest encryptionAtRest;

  ///
  /// The details for encryption in transit.
  ///
  @_s.JsonKey(name: 'encryptionInTransit')
  final EncryptionInTransit encryptionInTransit;

  EncryptionInfo({
    this.encryptionAtRest,
    this.encryptionInTransit,
  });
  factory EncryptionInfo.fromJson(Map<String, dynamic> json) =>
      _$EncryptionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionInfoToJson(this);
}

///
/// Specifies which metrics are gathered for the MSK cluster. This property has
/// the following possible values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER,
/// and PER_TOPIC_PER_PARTITION. For a list of the metrics associated with each
/// of these levels of monitoring, see <a
/// href="https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html">Monitoring</a>.
///
enum EnhancedMonitoring {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('PER_BROKER')
  perBroker,
  @_s.JsonValue('PER_TOPIC_PER_BROKER')
  perTopicPerBroker,
  @_s.JsonValue('PER_TOPIC_PER_PARTITION')
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
    throw Exception('Unknown enum value: $this');
  }
}

///
/// Returns information about an error state of the cluster.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorInfo {
  ///
  /// A number describing the error programmatically.
  ///
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  ///
  /// An optional field to provide more details about the error.
  ///
  @_s.JsonKey(name: 'errorString')
  final String errorString;

  ErrorInfo({
    this.errorCode,
    this.errorString,
  });
  factory ErrorInfo.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Firehose {
  @_s.JsonKey(name: 'enabled')
  final bool enabled;
  @_s.JsonKey(name: 'deliveryStream')
  final String deliveryStream;

  Firehose({
    @_s.required this.enabled,
    this.deliveryStream,
  });
  factory Firehose.fromJson(Map<String, dynamic> json) =>
      _$FirehoseFromJson(json);

  Map<String, dynamic> toJson() => _$FirehoseToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBootstrapBrokersResponse {
  ///
  /// A string containing one or more hostname:port pairs.
  ///
  @_s.JsonKey(name: 'bootstrapBrokerString')
  final String bootstrapBrokerString;

  ///
  /// A string containing one or more DNS names (or IP) and Sasl Scram port pairs.
  ///
  @_s.JsonKey(name: 'bootstrapBrokerStringSaslScram')
  final String bootstrapBrokerStringSaslScram;

  ///
  /// A string containing one or more DNS names (or IP) and TLS port pairs.
  ///
  @_s.JsonKey(name: 'bootstrapBrokerStringTls')
  final String bootstrapBrokerStringTls;

  GetBootstrapBrokersResponse({
    this.bootstrapBrokerString,
    this.bootstrapBrokerStringSaslScram,
    this.bootstrapBrokerStringTls,
  });
  factory GetBootstrapBrokersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBootstrapBrokersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCompatibleKafkaVersionsResponse {
  ///
  /// A list of CompatibleKafkaVersion objects.
  ///
  @_s.JsonKey(name: 'compatibleKafkaVersions')
  final List<CompatibleKafkaVersion> compatibleKafkaVersions;

  GetCompatibleKafkaVersionsResponse({
    this.compatibleKafkaVersions,
  });
  factory GetCompatibleKafkaVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCompatibleKafkaVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KafkaVersion {
  @_s.JsonKey(name: 'status')
  final KafkaVersionStatus status;
  @_s.JsonKey(name: 'version')
  final String version;

  KafkaVersion({
    this.status,
    this.version,
  });
  factory KafkaVersion.fromJson(Map<String, dynamic> json) =>
      _$KafkaVersionFromJson(json);
}

enum KafkaVersionStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DEPRECATED')
  deprecated,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListClusterOperationsResponse {
  ///
  /// An array of cluster operation information objects.
  ///
  @_s.JsonKey(name: 'clusterOperationInfoList')
  final List<ClusterOperationInfo> clusterOperationInfoList;

  ///
  /// If the response of ListClusterOperations is truncated, it returns a
  /// NextToken in the response. This Nexttoken should be sent in the subsequent
  /// request to ListClusterOperations.
  ///
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListClusterOperationsResponse({
    this.clusterOperationInfoList,
    this.nextToken,
  });
  factory ListClusterOperationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListClusterOperationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListClustersResponse {
  ///
  /// Information on each of the MSK clusters in the response.
  ///
  @_s.JsonKey(name: 'clusterInfoList')
  final List<ClusterInfo> clusterInfoList;

  ///
  /// The paginated results marker. When the result of a ListClusters operation is
  /// truncated, the call returns NextToken in the response.
  /// To get another batch of clusters, provide this token in your next request.
  ///
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListClustersResponse({
    this.clusterInfoList,
    this.nextToken,
  });
  factory ListClustersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListClustersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConfigurationRevisionsResponse {
  ///
  /// Paginated results marker.
  ///
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ///
  /// List of ConfigurationRevision objects.
  ///
  @_s.JsonKey(name: 'revisions')
  final List<ConfigurationRevision> revisions;

  ListConfigurationRevisionsResponse({
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
  ///
  /// An array of MSK configurations.
  ///
  @_s.JsonKey(name: 'configurations')
  final List<Configuration> configurations;

  ///
  /// The paginated results marker. When the result of a ListConfigurations
  /// operation is truncated, the call returns NextToken in the response.
  /// To get another batch of configurations, provide this token in your next
  /// request.
  ///
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListConfigurationsResponse({
    this.configurations,
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
class ListKafkaVersionsResponse {
  @_s.JsonKey(name: 'kafkaVersions')
  final List<KafkaVersion> kafkaVersions;
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListKafkaVersionsResponse({
    this.kafkaVersions,
    this.nextToken,
  });
  factory ListKafkaVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListKafkaVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNodesResponse {
  ///
  /// The paginated results marker. When the result of a ListNodes operation is
  /// truncated, the call returns NextToken in the response.
  /// To get another batch of nodes, provide this token in your next request.
  ///
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ///
  /// List containing a NodeInfo object.
  ///
  @_s.JsonKey(name: 'nodeInfoList')
  final List<NodeInfo> nodeInfoList;

  ListNodesResponse({
    this.nextToken,
    this.nodeInfoList,
  });
  factory ListNodesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNodesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListScramSecretsResponse {
  ///
  /// Paginated results marker.
  ///
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ///
  /// The list of scram secrets associated with the cluster.
  ///
  @_s.JsonKey(name: 'secretArnList')
  final List<String> secretArnList;

  ListScramSecretsResponse({
    this.nextToken,
    this.secretArnList,
  });
  factory ListScramSecretsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListScramSecretsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  ///
  /// The key-value pair for the resource tag.
  ///
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggingInfo {
  @_s.JsonKey(name: 'brokerLogs')
  final BrokerLogs brokerLogs;

  LoggingInfo({
    @_s.required this.brokerLogs,
  });
  factory LoggingInfo.fromJson(Map<String, dynamic> json) =>
      _$LoggingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingInfoToJson(this);
}

///
/// Information about cluster attributes that can be updated via update APIs.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MutableClusterInfo {
  ///
  /// Specifies the size of the EBS volume and the ID of the associated broker.
  ///
  @_s.JsonKey(name: 'brokerEBSVolumeInfo')
  final List<BrokerEBSVolumeInfo> brokerEBSVolumeInfo;

  ///
  /// Information about the changes in the configuration of the brokers.
  ///
  @_s.JsonKey(name: 'configurationInfo')
  final ConfigurationInfo configurationInfo;

  ///
  /// Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon
  /// CloudWatch for this cluster.
  ///
  @_s.JsonKey(name: 'enhancedMonitoring')
  final EnhancedMonitoring enhancedMonitoring;

  ///
  /// The Kafka version.
  ///
  @_s.JsonKey(name: 'kafkaVersion')
  final String kafkaVersion;
  @_s.JsonKey(name: 'loggingInfo')
  final LoggingInfo loggingInfo;

  ///
  /// The number of broker nodes in the cluster.
  ///
  @_s.JsonKey(name: 'numberOfBrokerNodes')
  final int numberOfBrokerNodes;

  ///
  /// The settings for open monitoring.
  ///
  @_s.JsonKey(name: 'openMonitoring')
  final OpenMonitoring openMonitoring;

  MutableClusterInfo({
    this.brokerEBSVolumeInfo,
    this.configurationInfo,
    this.enhancedMonitoring,
    this.kafkaVersion,
    this.loggingInfo,
    this.numberOfBrokerNodes,
    this.openMonitoring,
  });
  factory MutableClusterInfo.fromJson(Map<String, dynamic> json) =>
      _$MutableClusterInfoFromJson(json);
}

///
/// Indicates whether you want to enable or disable the Node Exporter.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodeExporter {
  ///
  /// Indicates whether you want to enable or disable the Node Exporter.
  ///
  @_s.JsonKey(name: 'enabledInBroker')
  final bool enabledInBroker;

  NodeExporter({
    @_s.required this.enabledInBroker,
  });
  factory NodeExporter.fromJson(Map<String, dynamic> json) =>
      _$NodeExporterFromJson(json);
}

///
/// Indicates whether you want to enable or disable the Node Exporter.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NodeExporterInfo {
  ///
  /// Indicates whether you want to enable or disable the Node Exporter.
  ///
  @_s.JsonKey(name: 'enabledInBroker')
  final bool enabledInBroker;

  NodeExporterInfo({
    @_s.required this.enabledInBroker,
  });
  Map<String, dynamic> toJson() => _$NodeExporterInfoToJson(this);
}

///
/// Indicates whether you want to enable or disable the JMX Exporter.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JmxExporter {
  ///
  /// Indicates whether you want to enable or disable the JMX Exporter.
  ///
  @_s.JsonKey(name: 'enabledInBroker')
  final bool enabledInBroker;

  JmxExporter({
    @_s.required this.enabledInBroker,
  });
  factory JmxExporter.fromJson(Map<String, dynamic> json) =>
      _$JmxExporterFromJson(json);
}

///
/// Indicates whether you want to enable or disable the JMX Exporter.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class JmxExporterInfo {
  ///
  /// Indicates whether you want to enable or disable the JMX Exporter.
  ///
  @_s.JsonKey(name: 'enabledInBroker')
  final bool enabledInBroker;

  JmxExporterInfo({
    @_s.required this.enabledInBroker,
  });
  Map<String, dynamic> toJson() => _$JmxExporterInfoToJson(this);
}

///
/// JMX and Node monitoring for the MSK cluster.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpenMonitoring {
  ///
  /// Prometheus settings.
  ///
  @_s.JsonKey(name: 'prometheus')
  final Prometheus prometheus;

  OpenMonitoring({
    @_s.required this.prometheus,
  });
  factory OpenMonitoring.fromJson(Map<String, dynamic> json) =>
      _$OpenMonitoringFromJson(json);
}

///
/// JMX and Node monitoring for the MSK cluster.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OpenMonitoringInfo {
  ///
  /// Prometheus settings.
  ///
  @_s.JsonKey(name: 'prometheus')
  final PrometheusInfo prometheus;

  OpenMonitoringInfo({
    @_s.required this.prometheus,
  });
  Map<String, dynamic> toJson() => _$OpenMonitoringInfoToJson(this);
}

///
/// Prometheus settings.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Prometheus {
  ///
  /// Indicates whether you want to enable or disable the JMX Exporter.
  ///
  @_s.JsonKey(name: 'jmxExporter')
  final JmxExporter jmxExporter;

  ///
  /// Indicates whether you want to enable or disable the Node Exporter.
  ///
  @_s.JsonKey(name: 'nodeExporter')
  final NodeExporter nodeExporter;

  Prometheus({
    this.jmxExporter,
    this.nodeExporter,
  });
  factory Prometheus.fromJson(Map<String, dynamic> json) =>
      _$PrometheusFromJson(json);
}

///
/// Prometheus settings.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PrometheusInfo {
  ///
  /// Indicates whether you want to enable or disable the JMX Exporter.
  ///
  @_s.JsonKey(name: 'jmxExporter')
  final JmxExporterInfo jmxExporter;

  ///
  /// Indicates whether you want to enable or disable the Node Exporter.
  ///
  @_s.JsonKey(name: 'nodeExporter')
  final NodeExporterInfo nodeExporter;

  PrometheusInfo({
    this.jmxExporter,
    this.nodeExporter,
  });
  Map<String, dynamic> toJson() => _$PrometheusInfoToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RebootBrokerResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  @_s.JsonKey(name: 'clusterOperationArn')
  final String clusterOperationArn;

  RebootBrokerResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });
  factory RebootBrokerResponse.fromJson(Map<String, dynamic> json) =>
      _$RebootBrokerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3 {
  @_s.JsonKey(name: 'enabled')
  final bool enabled;
  @_s.JsonKey(name: 'bucket')
  final String bucket;
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  S3({
    @_s.required this.enabled,
    this.bucket,
    this.prefix,
  });
  factory S3.fromJson(Map<String, dynamic> json) => _$S3FromJson(json);

  Map<String, dynamic> toJson() => _$S3ToJson(this);
}

///
/// Details for client authentication using SASL.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Sasl {
  ///
  /// Details for SASL/SCRAM client authentication.
  ///
  @_s.JsonKey(name: 'scram')
  final Scram scram;

  Sasl({
    this.scram,
  });
  factory Sasl.fromJson(Map<String, dynamic> json) => _$SaslFromJson(json);

  Map<String, dynamic> toJson() => _$SaslToJson(this);
}

///
/// Details for SASL/SCRAM client authentication.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scram {
  ///
  /// SASL/SCRAM authentication is enabled or not.
  ///
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  Scram({
    this.enabled,
  });
  factory Scram.fromJson(Map<String, dynamic> json) => _$ScramFromJson(json);

  Map<String, dynamic> toJson() => _$ScramToJson(this);
}

///
/// The node information object.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodeInfo {
  ///
  /// The start time.
  ///
  @_s.JsonKey(name: 'addedToClusterTime')
  final String addedToClusterTime;

  ///
  /// The broker node info.
  ///
  @_s.JsonKey(name: 'brokerNodeInfo')
  final BrokerNodeInfo brokerNodeInfo;

  ///
  /// The instance type.
  ///
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  ///
  /// The Amazon Resource Name (ARN) of the node.
  ///
  @_s.JsonKey(name: 'nodeARN')
  final String nodeARN;

  ///
  /// The node type.
  ///
  @_s.JsonKey(name: 'nodeType')
  final NodeType nodeType;

  ///
  /// The ZookeeperNodeInfo.
  ///
  @_s.JsonKey(name: 'zookeeperNodeInfo')
  final ZookeeperNodeInfo zookeeperNodeInfo;

  NodeInfo({
    this.addedToClusterTime,
    this.brokerNodeInfo,
    this.instanceType,
    this.nodeARN,
    this.nodeType,
    this.zookeeperNodeInfo,
  });
  factory NodeInfo.fromJson(Map<String, dynamic> json) =>
      _$NodeInfoFromJson(json);
}

///
/// The broker or Zookeeper node.
///
enum NodeType {
  @_s.JsonValue('BROKER')
  broker,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StateInfo {
  @_s.JsonKey(name: 'code')
  final String code;
  @_s.JsonKey(name: 'message')
  final String message;

  StateInfo({
    this.code,
    this.message,
  });
  factory StateInfo.fromJson(Map<String, dynamic> json) =>
      _$StateInfoFromJson(json);
}

///
/// Contains information about storage volumes attached to MSK broker nodes.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StorageInfo {
  ///
  /// EBS volume information.
  ///
  @_s.JsonKey(name: 'ebsStorageInfo')
  final EBSStorageInfo ebsStorageInfo;

  StorageInfo({
    this.ebsStorageInfo,
  });
  factory StorageInfo.fromJson(Map<String, dynamic> json) =>
      _$StorageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StorageInfoToJson(this);
}

///
/// Details for client authentication using TLS.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tls {
  ///
  /// List of ACM Certificate Authority ARNs.
  ///
  @_s.JsonKey(name: 'certificateAuthorityArnList')
  final List<String> certificateAuthorityArnList;

  Tls({
    this.certificateAuthorityArnList,
  });
  factory Tls.fromJson(Map<String, dynamic> json) => _$TlsFromJson(json);

  Map<String, dynamic> toJson() => _$TlsToJson(this);
}

///
/// Error info for scram secret associate/disassociate failure.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnprocessedScramSecret {
  ///
  /// Error code for associate/disassociate failure.
  ///
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  ///
  /// Error message for associate/disassociate failure.
  ///
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  ///
  /// AWS Secrets Manager secret ARN.
  ///
  @_s.JsonKey(name: 'secretArn')
  final String secretArn;

  UnprocessedScramSecret({
    this.errorCode,
    this.errorMessage,
    this.secretArn,
  });
  factory UnprocessedScramSecret.fromJson(Map<String, dynamic> json) =>
      _$UnprocessedScramSecretFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBrokerCountResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  @_s.JsonKey(name: 'clusterOperationArn')
  final String clusterOperationArn;

  UpdateBrokerCountResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });
  factory UpdateBrokerCountResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBrokerCountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBrokerStorageResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  @_s.JsonKey(name: 'clusterOperationArn')
  final String clusterOperationArn;

  UpdateBrokerStorageResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });
  factory UpdateBrokerStorageResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBrokerStorageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateClusterConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  @_s.JsonKey(name: 'clusterOperationArn')
  final String clusterOperationArn;

  UpdateClusterConfigurationResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });
  factory UpdateClusterConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateClusterConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateClusterKafkaVersionResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  @_s.JsonKey(name: 'clusterOperationArn')
  final String clusterOperationArn;

  UpdateClusterKafkaVersionResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });
  factory UpdateClusterKafkaVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateClusterKafkaVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMonitoringResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  @_s.JsonKey(name: 'clusterArn')
  final String clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  @_s.JsonKey(name: 'clusterOperationArn')
  final String clusterOperationArn;

  UpdateMonitoringResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });
  factory UpdateMonitoringResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMonitoringResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  @_s.JsonKey(name: 'arn')
  final String arn;

  ///
  /// Latest revision of the configuration.
  ///
  @_s.JsonKey(name: 'latestRevision')
  final ConfigurationRevision latestRevision;

  UpdateConfigurationResponse({
    this.arn,
    this.latestRevision,
  });
  factory UpdateConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateConfigurationResponseFromJson(json);
}

///
/// Zookeeper node information.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ZookeeperNodeInfo {
  ///
  /// The attached elastic network interface of the broker.
  ///
  @_s.JsonKey(name: 'attachedENIId')
  final String attachedENIId;

  ///
  /// The virtual private cloud (VPC) IP address of the client.
  ///
  @_s.JsonKey(name: 'clientVpcIpAddress')
  final String clientVpcIpAddress;

  ///
  /// Endpoints for accessing the ZooKeeper.
  ///
  @_s.JsonKey(name: 'endpoints')
  final List<String> endpoints;

  ///
  /// The role-specific ID for Zookeeper.
  ///
  @_s.JsonKey(name: 'zookeeperId')
  final double zookeeperId;

  ///
  /// The version of Zookeeper.
  ///
  @_s.JsonKey(name: 'zookeeperVersion')
  final String zookeeperVersion;

  ZookeeperNodeInfo({
    this.attachedENIId,
    this.clientVpcIpAddress,
    this.endpoints,
    this.zookeeperId,
    this.zookeeperVersion,
  });
  factory ZookeeperNodeInfo.fromJson(Map<String, dynamic> json) =>
      _$ZookeeperNodeInfoFromJson(json);
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

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
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
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
