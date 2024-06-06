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

/// <p/>
class KafkaConnect {
  final _s.RestJsonProtocol _protocol;
  KafkaConnect({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kafkaconnect',
            signingName: 'kafkaconnect',
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

  /// Creates a connector using the specified properties.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [capacity] :
  /// Information about the capacity allocated to the connector. Exactly one of
  /// the two properties must be specified.
  ///
  /// Parameter [connectorConfiguration] :
  /// A map of keys to values that represent the configuration for the
  /// connector.
  ///
  /// Parameter [connectorName] :
  /// The name of the connector.
  ///
  /// Parameter [kafkaCluster] :
  /// Specifies which Apache Kafka cluster to connect to.
  ///
  /// Parameter [kafkaClusterClientAuthentication] :
  /// Details of the client authentication used by the Apache Kafka cluster.
  ///
  /// Parameter [kafkaClusterEncryptionInTransit] :
  /// Details of encryption in transit to the Apache Kafka cluster.
  ///
  /// Parameter [kafkaConnectVersion] :
  /// The version of Kafka Connect. It has to be compatible with both the Apache
  /// Kafka cluster's version and the plugins.
  ///
  /// Parameter [plugins] :
  /// <important>
  /// Amazon MSK Connect does not currently support specifying multiple plugins
  /// as a list. To use more than one plugin for your connector, you can create
  /// a single custom plugin using a ZIP file that bundles multiple plugins
  /// together.
  /// </important>
  /// Specifies which plugin to use for the connector. You must specify a
  /// single-element list containing one <code>customPlugin</code> object.
  ///
  /// Parameter [serviceExecutionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role used by the connector to
  /// access the Amazon Web Services resources that it needs. The types of
  /// resources depends on the logic of the connector. For example, a connector
  /// that has Amazon S3 as a destination must have permissions that allow it to
  /// write to the S3 destination bucket.
  ///
  /// Parameter [connectorDescription] :
  /// A summary description of the connector.
  ///
  /// Parameter [logDelivery] :
  /// Details about log delivery.
  ///
  /// Parameter [tags] :
  /// The tags you want to attach to the connector.
  ///
  /// Parameter [workerConfiguration] :
  /// Specifies which worker configuration to use with the connector.
  Future<CreateConnectorResponse> createConnector({
    required Capacity capacity,
    required Map<String, String> connectorConfiguration,
    required String connectorName,
    required KafkaCluster kafkaCluster,
    required KafkaClusterClientAuthentication kafkaClusterClientAuthentication,
    required KafkaClusterEncryptionInTransit kafkaClusterEncryptionInTransit,
    required String kafkaConnectVersion,
    required List<Plugin> plugins,
    required String serviceExecutionRoleArn,
    String? connectorDescription,
    LogDelivery? logDelivery,
    Map<String, String>? tags,
    WorkerConfiguration? workerConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'capacity': capacity,
      'connectorConfiguration': connectorConfiguration,
      'connectorName': connectorName,
      'kafkaCluster': kafkaCluster,
      'kafkaClusterClientAuthentication': kafkaClusterClientAuthentication,
      'kafkaClusterEncryptionInTransit': kafkaClusterEncryptionInTransit,
      'kafkaConnectVersion': kafkaConnectVersion,
      'plugins': plugins,
      'serviceExecutionRoleArn': serviceExecutionRoleArn,
      if (connectorDescription != null)
        'connectorDescription': connectorDescription,
      if (logDelivery != null) 'logDelivery': logDelivery,
      if (tags != null) 'tags': tags,
      if (workerConfiguration != null)
        'workerConfiguration': workerConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/connectors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConnectorResponse.fromJson(response);
  }

  /// Creates a custom plugin using the specified properties.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [contentType] :
  /// The type of the plugin file.
  ///
  /// Parameter [location] :
  /// Information about the location of a custom plugin.
  ///
  /// Parameter [name] :
  /// The name of the custom plugin.
  ///
  /// Parameter [description] :
  /// A summary description of the custom plugin.
  ///
  /// Parameter [tags] :
  /// The tags you want to attach to the custom plugin.
  Future<CreateCustomPluginResponse> createCustomPlugin({
    required CustomPluginContentType contentType,
    required CustomPluginLocation location,
    required String name,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'contentType': contentType.toValue(),
      'location': location,
      'name': name,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/custom-plugins',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCustomPluginResponse.fromJson(response);
  }

  /// Creates a worker configuration using the specified properties.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [name] :
  /// The name of the worker configuration.
  ///
  /// Parameter [propertiesFileContent] :
  /// Base64 encoded contents of connect-distributed.properties file.
  ///
  /// Parameter [description] :
  /// A summary description of the worker configuration.
  ///
  /// Parameter [tags] :
  /// The tags you want to attach to the worker configuration.
  Future<CreateWorkerConfigurationResponse> createWorkerConfiguration({
    required String name,
    required String propertiesFileContent,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'propertiesFileContent': propertiesFileContent,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/worker-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkerConfigurationResponse.fromJson(response);
  }

  /// Deletes the specified connector.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) of the connector that you want to delete.
  ///
  /// Parameter [currentVersion] :
  /// The current version of the connector that you want to delete.
  Future<DeleteConnectorResponse> deleteConnector({
    required String connectorArn,
    String? currentVersion,
  }) async {
    final $query = <String, List<String>>{
      if (currentVersion != null) 'currentVersion': [currentVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/connectors/${Uri.encodeComponent(connectorArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConnectorResponse.fromJson(response);
  }

  /// Deletes a custom plugin.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [customPluginArn] :
  /// The Amazon Resource Name (ARN) of the custom plugin that you want to
  /// delete.
  Future<DeleteCustomPluginResponse> deleteCustomPlugin({
    required String customPluginArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/custom-plugins/${Uri.encodeComponent(customPluginArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCustomPluginResponse.fromJson(response);
  }

  /// Deletes the specified worker configuration.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [workerConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the worker configuration that you want
  /// to delete.
  Future<DeleteWorkerConfigurationResponse> deleteWorkerConfiguration({
    required String workerConfigurationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/worker-configurations/${Uri.encodeComponent(workerConfigurationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorkerConfigurationResponse.fromJson(response);
  }

  /// Returns summary information about the connector.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) of the connector that you want to describe.
  Future<DescribeConnectorResponse> describeConnector({
    required String connectorArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/connectors/${Uri.encodeComponent(connectorArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConnectorResponse.fromJson(response);
  }

  /// A summary description of the custom plugin.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [customPluginArn] :
  /// Returns information about a custom plugin.
  Future<DescribeCustomPluginResponse> describeCustomPlugin({
    required String customPluginArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/custom-plugins/${Uri.encodeComponent(customPluginArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCustomPluginResponse.fromJson(response);
  }

  /// Returns information about a worker configuration.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [workerConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the worker configuration that you want
  /// to get information about.
  Future<DescribeWorkerConfigurationResponse> describeWorkerConfiguration({
    required String workerConfigurationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/worker-configurations/${Uri.encodeComponent(workerConfigurationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorkerConfigurationResponse.fromJson(response);
  }

  /// Returns a list of all the connectors in this account and Region. The list
  /// is limited to connectors whose name starts with the specified prefix. The
  /// response also includes a description of each of the listed connectors.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [connectorNamePrefix] :
  /// The name prefix that you want to use to search for and list connectors.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of connectors to list in one response.
  ///
  /// Parameter [nextToken] :
  /// If the response of a ListConnectors operation is truncated, it will
  /// include a NextToken. Send this NextToken in a subsequent request to
  /// continue listing from where the previous operation left off.
  Future<ListConnectorsResponse> listConnectors({
    String? connectorNamePrefix,
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
      if (connectorNamePrefix != null)
        'connectorNamePrefix': [connectorNamePrefix],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/connectors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorsResponse.fromJson(response);
  }

  /// Returns a list of all of the custom plugins in this account and Region.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of custom plugins to list in one response.
  ///
  /// Parameter [namePrefix] :
  /// Lists custom plugin names that start with the specified text string.
  ///
  /// Parameter [nextToken] :
  /// If the response of a ListCustomPlugins operation is truncated, it will
  /// include a NextToken. Send this NextToken in a subsequent request to
  /// continue listing from where the previous operation left off.
  Future<ListCustomPluginsResponse> listCustomPlugins({
    int? maxResults,
    String? namePrefix,
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
      if (namePrefix != null) 'namePrefix': [namePrefix],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/custom-plugins',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomPluginsResponse.fromJson(response);
  }

  /// Lists all the tags attached to the specified resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to list
  /// all attached tags.
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

  /// Returns a list of all of the worker configurations in this account and
  /// Region.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of worker configurations to list in one response.
  ///
  /// Parameter [namePrefix] :
  /// Lists worker configuration names that start with the specified text
  /// string.
  ///
  /// Parameter [nextToken] :
  /// If the response of a ListWorkerConfigurations operation is truncated, it
  /// will include a NextToken. Send this NextToken in a subsequent request to
  /// continue listing from where the previous operation left off.
  Future<ListWorkerConfigurationsResponse> listWorkerConfigurations({
    int? maxResults,
    String? namePrefix,
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
      if (namePrefix != null) 'namePrefix': [namePrefix],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/worker-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkerConfigurationsResponse.fromJson(response);
  }

  /// Attaches tags to the specified resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which you want to attach
  /// tags.
  ///
  /// Parameter [tags] :
  /// The tags that you want to attach to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from the specified resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which you want to
  /// remove tags.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags that you want to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified connector.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [capacity] :
  /// The target capacity.
  ///
  /// Parameter [connectorArn] :
  /// The Amazon Resource Name (ARN) of the connector that you want to update.
  ///
  /// Parameter [currentVersion] :
  /// The current version of the connector that you want to update.
  Future<UpdateConnectorResponse> updateConnector({
    required CapacityUpdate capacity,
    required String connectorArn,
    required String currentVersion,
  }) async {
    final $query = <String, List<String>>{
      'currentVersion': [currentVersion],
    };
    final $payload = <String, dynamic>{
      'capacity': capacity,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/connectors/${Uri.encodeComponent(connectorArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectorResponse.fromJson(response);
  }
}

/// The details of the Apache Kafka cluster to which the connector is connected.
class ApacheKafkaCluster {
  /// The bootstrap servers of the cluster.
  final String bootstrapServers;

  /// Details of an Amazon VPC which has network connectivity to the Apache Kafka
  /// cluster.
  final Vpc vpc;

  ApacheKafkaCluster({
    required this.bootstrapServers,
    required this.vpc,
  });

  Map<String, dynamic> toJson() {
    final bootstrapServers = this.bootstrapServers;
    final vpc = this.vpc;
    return {
      'bootstrapServers': bootstrapServers,
      'vpc': vpc,
    };
  }
}

/// The description of the Apache Kafka cluster to which the connector is
/// connected.
class ApacheKafkaClusterDescription {
  /// The bootstrap servers of the cluster.
  final String? bootstrapServers;

  /// Details of an Amazon VPC which has network connectivity to the Apache Kafka
  /// cluster.
  final VpcDescription? vpc;

  ApacheKafkaClusterDescription({
    this.bootstrapServers,
    this.vpc,
  });

  factory ApacheKafkaClusterDescription.fromJson(Map<String, dynamic> json) {
    return ApacheKafkaClusterDescription(
      bootstrapServers: json['bootstrapServers'] as String?,
      vpc: json['vpc'] != null
          ? VpcDescription.fromJson(json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bootstrapServers = this.bootstrapServers;
    final vpc = this.vpc;
    return {
      if (bootstrapServers != null) 'bootstrapServers': bootstrapServers,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// Specifies how the connector scales.
class AutoScaling {
  /// The maximum number of workers allocated to the connector.
  final int maxWorkerCount;

  /// The number of microcontroller units (MCUs) allocated to each connector
  /// worker. The valid values are 1,2,4,8.
  final int mcuCount;

  /// The minimum number of workers allocated to the connector.
  final int minWorkerCount;

  /// The sacle-in policy for the connector.
  final ScaleInPolicy? scaleInPolicy;

  /// The sacle-out policy for the connector.
  final ScaleOutPolicy? scaleOutPolicy;

  AutoScaling({
    required this.maxWorkerCount,
    required this.mcuCount,
    required this.minWorkerCount,
    this.scaleInPolicy,
    this.scaleOutPolicy,
  });

  Map<String, dynamic> toJson() {
    final maxWorkerCount = this.maxWorkerCount;
    final mcuCount = this.mcuCount;
    final minWorkerCount = this.minWorkerCount;
    final scaleInPolicy = this.scaleInPolicy;
    final scaleOutPolicy = this.scaleOutPolicy;
    return {
      'maxWorkerCount': maxWorkerCount,
      'mcuCount': mcuCount,
      'minWorkerCount': minWorkerCount,
      if (scaleInPolicy != null) 'scaleInPolicy': scaleInPolicy,
      if (scaleOutPolicy != null) 'scaleOutPolicy': scaleOutPolicy,
    };
  }
}

/// Information about the auto scaling parameters for the connector.
class AutoScalingDescription {
  /// The maximum number of workers allocated to the connector.
  final int? maxWorkerCount;

  /// The number of microcontroller units (MCUs) allocated to each connector
  /// worker. The valid values are 1,2,4,8.
  final int? mcuCount;

  /// The minimum number of workers allocated to the connector.
  final int? minWorkerCount;

  /// The sacle-in policy for the connector.
  final ScaleInPolicyDescription? scaleInPolicy;

  /// The sacle-out policy for the connector.&gt;
  final ScaleOutPolicyDescription? scaleOutPolicy;

  AutoScalingDescription({
    this.maxWorkerCount,
    this.mcuCount,
    this.minWorkerCount,
    this.scaleInPolicy,
    this.scaleOutPolicy,
  });

  factory AutoScalingDescription.fromJson(Map<String, dynamic> json) {
    return AutoScalingDescription(
      maxWorkerCount: json['maxWorkerCount'] as int?,
      mcuCount: json['mcuCount'] as int?,
      minWorkerCount: json['minWorkerCount'] as int?,
      scaleInPolicy: json['scaleInPolicy'] != null
          ? ScaleInPolicyDescription.fromJson(
              json['scaleInPolicy'] as Map<String, dynamic>)
          : null,
      scaleOutPolicy: json['scaleOutPolicy'] != null
          ? ScaleOutPolicyDescription.fromJson(
              json['scaleOutPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final maxWorkerCount = this.maxWorkerCount;
    final mcuCount = this.mcuCount;
    final minWorkerCount = this.minWorkerCount;
    final scaleInPolicy = this.scaleInPolicy;
    final scaleOutPolicy = this.scaleOutPolicy;
    return {
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (mcuCount != null) 'mcuCount': mcuCount,
      if (minWorkerCount != null) 'minWorkerCount': minWorkerCount,
      if (scaleInPolicy != null) 'scaleInPolicy': scaleInPolicy,
      if (scaleOutPolicy != null) 'scaleOutPolicy': scaleOutPolicy,
    };
  }
}

/// The updates to the auto scaling parameters for the connector.
class AutoScalingUpdate {
  /// The target maximum number of workers allocated to the connector.
  final int maxWorkerCount;

  /// The target number of microcontroller units (MCUs) allocated to each
  /// connector worker. The valid values are 1,2,4,8.
  final int mcuCount;

  /// The target minimum number of workers allocated to the connector.
  final int minWorkerCount;

  /// The target sacle-in policy for the connector.
  final ScaleInPolicyUpdate scaleInPolicy;

  /// The target sacle-out policy for the connector.
  final ScaleOutPolicyUpdate scaleOutPolicy;

  AutoScalingUpdate({
    required this.maxWorkerCount,
    required this.mcuCount,
    required this.minWorkerCount,
    required this.scaleInPolicy,
    required this.scaleOutPolicy,
  });

  Map<String, dynamic> toJson() {
    final maxWorkerCount = this.maxWorkerCount;
    final mcuCount = this.mcuCount;
    final minWorkerCount = this.minWorkerCount;
    final scaleInPolicy = this.scaleInPolicy;
    final scaleOutPolicy = this.scaleOutPolicy;
    return {
      'maxWorkerCount': maxWorkerCount,
      'mcuCount': mcuCount,
      'minWorkerCount': minWorkerCount,
      'scaleInPolicy': scaleInPolicy,
      'scaleOutPolicy': scaleOutPolicy,
    };
  }
}

/// Information about the capacity of the connector, whether it is auto scaled
/// or provisioned.
class Capacity {
  /// Information about the auto scaling parameters for the connector.
  final AutoScaling? autoScaling;

  /// Details about a fixed capacity allocated to a connector.
  final ProvisionedCapacity? provisionedCapacity;

  Capacity({
    this.autoScaling,
    this.provisionedCapacity,
  });

  Map<String, dynamic> toJson() {
    final autoScaling = this.autoScaling;
    final provisionedCapacity = this.provisionedCapacity;
    return {
      if (autoScaling != null) 'autoScaling': autoScaling,
      if (provisionedCapacity != null)
        'provisionedCapacity': provisionedCapacity,
    };
  }
}

/// A description of the connector's capacity.
class CapacityDescription {
  /// Describes the connector's auto scaling capacity.
  final AutoScalingDescription? autoScaling;

  /// Describes a connector's provisioned capacity.
  final ProvisionedCapacityDescription? provisionedCapacity;

  CapacityDescription({
    this.autoScaling,
    this.provisionedCapacity,
  });

  factory CapacityDescription.fromJson(Map<String, dynamic> json) {
    return CapacityDescription(
      autoScaling: json['autoScaling'] != null
          ? AutoScalingDescription.fromJson(
              json['autoScaling'] as Map<String, dynamic>)
          : null,
      provisionedCapacity: json['provisionedCapacity'] != null
          ? ProvisionedCapacityDescription.fromJson(
              json['provisionedCapacity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScaling = this.autoScaling;
    final provisionedCapacity = this.provisionedCapacity;
    return {
      if (autoScaling != null) 'autoScaling': autoScaling,
      if (provisionedCapacity != null)
        'provisionedCapacity': provisionedCapacity,
    };
  }
}

/// The target capacity for the connector. The capacity can be auto scaled or
/// provisioned.
class CapacityUpdate {
  /// The target auto scaling setting.
  final AutoScalingUpdate? autoScaling;

  /// The target settings for provisioned capacity.
  final ProvisionedCapacityUpdate? provisionedCapacity;

  CapacityUpdate({
    this.autoScaling,
    this.provisionedCapacity,
  });

  Map<String, dynamic> toJson() {
    final autoScaling = this.autoScaling;
    final provisionedCapacity = this.provisionedCapacity;
    return {
      if (autoScaling != null) 'autoScaling': autoScaling,
      if (provisionedCapacity != null)
        'provisionedCapacity': provisionedCapacity,
    };
  }
}

/// The settings for delivering connector logs to Amazon CloudWatch Logs.
class CloudWatchLogsLogDelivery {
  /// Whether log delivery to Amazon CloudWatch Logs is enabled.
  final bool enabled;

  /// The name of the CloudWatch log group that is the destination for log
  /// delivery.
  final String? logGroup;

  CloudWatchLogsLogDelivery({
    required this.enabled,
    this.logGroup,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logGroup = this.logGroup;
    return {
      'enabled': enabled,
      if (logGroup != null) 'logGroup': logGroup,
    };
  }
}

/// A description of the log delivery settings.
class CloudWatchLogsLogDeliveryDescription {
  /// Whether log delivery to Amazon CloudWatch Logs is enabled.
  final bool? enabled;

  /// The name of the CloudWatch log group that is the destination for log
  /// delivery.
  final String? logGroup;

  CloudWatchLogsLogDeliveryDescription({
    this.enabled,
    this.logGroup,
  });

  factory CloudWatchLogsLogDeliveryDescription.fromJson(
      Map<String, dynamic> json) {
    return CloudWatchLogsLogDeliveryDescription(
      enabled: json['enabled'] as bool?,
      logGroup: json['logGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logGroup = this.logGroup;
    return {
      if (enabled != null) 'enabled': enabled,
      if (logGroup != null) 'logGroup': logGroup,
    };
  }
}

enum ConnectorState {
  running,
  creating,
  updating,
  deleting,
  failed,
}

extension ConnectorStateValueExtension on ConnectorState {
  String toValue() {
    switch (this) {
      case ConnectorState.running:
        return 'RUNNING';
      case ConnectorState.creating:
        return 'CREATING';
      case ConnectorState.updating:
        return 'UPDATING';
      case ConnectorState.deleting:
        return 'DELETING';
      case ConnectorState.failed:
        return 'FAILED';
    }
  }
}

extension ConnectorStateFromString on String {
  ConnectorState toConnectorState() {
    switch (this) {
      case 'RUNNING':
        return ConnectorState.running;
      case 'CREATING':
        return ConnectorState.creating;
      case 'UPDATING':
        return ConnectorState.updating;
      case 'DELETING':
        return ConnectorState.deleting;
      case 'FAILED':
        return ConnectorState.failed;
    }
    throw Exception('$this is not known in enum ConnectorState');
  }
}

/// Summary of a connector.
class ConnectorSummary {
  /// The connector's compute capacity settings.
  final CapacityDescription? capacity;

  /// The Amazon Resource Name (ARN) of the connector.
  final String? connectorArn;

  /// The description of the connector.
  final String? connectorDescription;

  /// The name of the connector.
  final String? connectorName;

  /// The state of the connector.
  final ConnectorState? connectorState;

  /// The time that the connector was created.
  final DateTime? creationTime;

  /// The current version of the connector.
  final String? currentVersion;

  /// The details of the Apache Kafka cluster to which the connector is connected.
  final KafkaClusterDescription? kafkaCluster;

  /// The type of client authentication used to connect to the Apache Kafka
  /// cluster. The value is NONE when no client authentication is used.
  final KafkaClusterClientAuthenticationDescription?
      kafkaClusterClientAuthentication;

  /// Details of encryption in transit to the Apache Kafka cluster.
  final KafkaClusterEncryptionInTransitDescription?
      kafkaClusterEncryptionInTransit;

  /// The version of Kafka Connect. It has to be compatible with both the Apache
  /// Kafka cluster's version and the plugins.
  final String? kafkaConnectVersion;

  /// The settings for delivering connector logs to Amazon CloudWatch Logs.
  final LogDeliveryDescription? logDelivery;

  /// Specifies which plugins were used for this connector.
  final List<PluginDescription>? plugins;

  /// The Amazon Resource Name (ARN) of the IAM role used by the connector to
  /// access Amazon Web Services resources.
  final String? serviceExecutionRoleArn;

  /// The worker configurations that are in use with the connector.
  final WorkerConfigurationDescription? workerConfiguration;

  ConnectorSummary({
    this.capacity,
    this.connectorArn,
    this.connectorDescription,
    this.connectorName,
    this.connectorState,
    this.creationTime,
    this.currentVersion,
    this.kafkaCluster,
    this.kafkaClusterClientAuthentication,
    this.kafkaClusterEncryptionInTransit,
    this.kafkaConnectVersion,
    this.logDelivery,
    this.plugins,
    this.serviceExecutionRoleArn,
    this.workerConfiguration,
  });

  factory ConnectorSummary.fromJson(Map<String, dynamic> json) {
    return ConnectorSummary(
      capacity: json['capacity'] != null
          ? CapacityDescription.fromJson(
              json['capacity'] as Map<String, dynamic>)
          : null,
      connectorArn: json['connectorArn'] as String?,
      connectorDescription: json['connectorDescription'] as String?,
      connectorName: json['connectorName'] as String?,
      connectorState: (json['connectorState'] as String?)?.toConnectorState(),
      creationTime: timeStampFromJson(json['creationTime']),
      currentVersion: json['currentVersion'] as String?,
      kafkaCluster: json['kafkaCluster'] != null
          ? KafkaClusterDescription.fromJson(
              json['kafkaCluster'] as Map<String, dynamic>)
          : null,
      kafkaClusterClientAuthentication:
          json['kafkaClusterClientAuthentication'] != null
              ? KafkaClusterClientAuthenticationDescription.fromJson(
                  json['kafkaClusterClientAuthentication']
                      as Map<String, dynamic>)
              : null,
      kafkaClusterEncryptionInTransit:
          json['kafkaClusterEncryptionInTransit'] != null
              ? KafkaClusterEncryptionInTransitDescription.fromJson(
                  json['kafkaClusterEncryptionInTransit']
                      as Map<String, dynamic>)
              : null,
      kafkaConnectVersion: json['kafkaConnectVersion'] as String?,
      logDelivery: json['logDelivery'] != null
          ? LogDeliveryDescription.fromJson(
              json['logDelivery'] as Map<String, dynamic>)
          : null,
      plugins: (json['plugins'] as List?)
          ?.whereNotNull()
          .map((e) => PluginDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceExecutionRoleArn: json['serviceExecutionRoleArn'] as String?,
      workerConfiguration: json['workerConfiguration'] != null
          ? WorkerConfigurationDescription.fromJson(
              json['workerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capacity = this.capacity;
    final connectorArn = this.connectorArn;
    final connectorDescription = this.connectorDescription;
    final connectorName = this.connectorName;
    final connectorState = this.connectorState;
    final creationTime = this.creationTime;
    final currentVersion = this.currentVersion;
    final kafkaCluster = this.kafkaCluster;
    final kafkaClusterClientAuthentication =
        this.kafkaClusterClientAuthentication;
    final kafkaClusterEncryptionInTransit =
        this.kafkaClusterEncryptionInTransit;
    final kafkaConnectVersion = this.kafkaConnectVersion;
    final logDelivery = this.logDelivery;
    final plugins = this.plugins;
    final serviceExecutionRoleArn = this.serviceExecutionRoleArn;
    final workerConfiguration = this.workerConfiguration;
    return {
      if (capacity != null) 'capacity': capacity,
      if (connectorArn != null) 'connectorArn': connectorArn,
      if (connectorDescription != null)
        'connectorDescription': connectorDescription,
      if (connectorName != null) 'connectorName': connectorName,
      if (connectorState != null) 'connectorState': connectorState.toValue(),
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (currentVersion != null) 'currentVersion': currentVersion,
      if (kafkaCluster != null) 'kafkaCluster': kafkaCluster,
      if (kafkaClusterClientAuthentication != null)
        'kafkaClusterClientAuthentication': kafkaClusterClientAuthentication,
      if (kafkaClusterEncryptionInTransit != null)
        'kafkaClusterEncryptionInTransit': kafkaClusterEncryptionInTransit,
      if (kafkaConnectVersion != null)
        'kafkaConnectVersion': kafkaConnectVersion,
      if (logDelivery != null) 'logDelivery': logDelivery,
      if (plugins != null) 'plugins': plugins,
      if (serviceExecutionRoleArn != null)
        'serviceExecutionRoleArn': serviceExecutionRoleArn,
      if (workerConfiguration != null)
        'workerConfiguration': workerConfiguration,
    };
  }
}

class CreateConnectorResponse {
  /// The Amazon Resource Name (ARN) that Amazon assigned to the connector.
  final String? connectorArn;

  /// The name of the connector.
  final String? connectorName;

  /// The state of the connector.
  final ConnectorState? connectorState;

  CreateConnectorResponse({
    this.connectorArn,
    this.connectorName,
    this.connectorState,
  });

  factory CreateConnectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectorResponse(
      connectorArn: json['connectorArn'] as String?,
      connectorName: json['connectorName'] as String?,
      connectorState: (json['connectorState'] as String?)?.toConnectorState(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    final connectorName = this.connectorName;
    final connectorState = this.connectorState;
    return {
      if (connectorArn != null) 'connectorArn': connectorArn,
      if (connectorName != null) 'connectorName': connectorName,
      if (connectorState != null) 'connectorState': connectorState.toValue(),
    };
  }
}

class CreateCustomPluginResponse {
  /// The Amazon Resource Name (ARN) that Amazon assigned to the custom plugin.
  final String? customPluginArn;

  /// The state of the custom plugin.
  final CustomPluginState? customPluginState;

  /// The name of the custom plugin.
  final String? name;

  /// The revision of the custom plugin.
  final int? revision;

  CreateCustomPluginResponse({
    this.customPluginArn,
    this.customPluginState,
    this.name,
    this.revision,
  });

  factory CreateCustomPluginResponse.fromJson(Map<String, dynamic> json) {
    return CreateCustomPluginResponse(
      customPluginArn: json['customPluginArn'] as String?,
      customPluginState:
          (json['customPluginState'] as String?)?.toCustomPluginState(),
      name: json['name'] as String?,
      revision: json['revision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final customPluginArn = this.customPluginArn;
    final customPluginState = this.customPluginState;
    final name = this.name;
    final revision = this.revision;
    return {
      if (customPluginArn != null) 'customPluginArn': customPluginArn,
      if (customPluginState != null)
        'customPluginState': customPluginState.toValue(),
      if (name != null) 'name': name,
      if (revision != null) 'revision': revision,
    };
  }
}

class CreateWorkerConfigurationResponse {
  /// The time that the worker configuration was created.
  final DateTime? creationTime;

  /// The latest revision of the worker configuration.
  final WorkerConfigurationRevisionSummary? latestRevision;

  /// The name of the worker configuration.
  final String? name;

  /// The Amazon Resource Name (ARN) that Amazon assigned to the worker
  /// configuration.
  final String? workerConfigurationArn;

  /// The state of the worker configuration.
  final WorkerConfigurationState? workerConfigurationState;

  CreateWorkerConfigurationResponse({
    this.creationTime,
    this.latestRevision,
    this.name,
    this.workerConfigurationArn,
    this.workerConfigurationState,
  });

  factory CreateWorkerConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateWorkerConfigurationResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      latestRevision: json['latestRevision'] != null
          ? WorkerConfigurationRevisionSummary.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      workerConfigurationArn: json['workerConfigurationArn'] as String?,
      workerConfigurationState: (json['workerConfigurationState'] as String?)
          ?.toWorkerConfigurationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final workerConfigurationArn = this.workerConfigurationArn;
    final workerConfigurationState = this.workerConfigurationState;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
      if (workerConfigurationArn != null)
        'workerConfigurationArn': workerConfigurationArn,
      if (workerConfigurationState != null)
        'workerConfigurationState': workerConfigurationState.toValue(),
    };
  }
}

/// A plugin is an Amazon Web Services resource that contains the code that
/// defines a connector's logic.
class CustomPlugin {
  /// The Amazon Resource Name (ARN) of the custom plugin.
  final String customPluginArn;

  /// The revision of the custom plugin.
  final int revision;

  CustomPlugin({
    required this.customPluginArn,
    required this.revision,
  });

  Map<String, dynamic> toJson() {
    final customPluginArn = this.customPluginArn;
    final revision = this.revision;
    return {
      'customPluginArn': customPluginArn,
      'revision': revision,
    };
  }
}

enum CustomPluginContentType {
  jar,
  zip,
}

extension CustomPluginContentTypeValueExtension on CustomPluginContentType {
  String toValue() {
    switch (this) {
      case CustomPluginContentType.jar:
        return 'JAR';
      case CustomPluginContentType.zip:
        return 'ZIP';
    }
  }
}

extension CustomPluginContentTypeFromString on String {
  CustomPluginContentType toCustomPluginContentType() {
    switch (this) {
      case 'JAR':
        return CustomPluginContentType.jar;
      case 'ZIP':
        return CustomPluginContentType.zip;
    }
    throw Exception('$this is not known in enum CustomPluginContentType');
  }
}

/// Details about a custom plugin.
class CustomPluginDescription {
  /// The Amazon Resource Name (ARN) of the custom plugin.
  final String? customPluginArn;

  /// The revision of the custom plugin.
  final int? revision;

  CustomPluginDescription({
    this.customPluginArn,
    this.revision,
  });

  factory CustomPluginDescription.fromJson(Map<String, dynamic> json) {
    return CustomPluginDescription(
      customPluginArn: json['customPluginArn'] as String?,
      revision: json['revision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final customPluginArn = this.customPluginArn;
    final revision = this.revision;
    return {
      if (customPluginArn != null) 'customPluginArn': customPluginArn,
      if (revision != null) 'revision': revision,
    };
  }
}

/// Details about a custom plugin file.
class CustomPluginFileDescription {
  /// The hex-encoded MD5 checksum of the custom plugin file. You can use it to
  /// validate the file.
  final String? fileMd5;

  /// The size in bytes of the custom plugin file. You can use it to validate the
  /// file.
  final int? fileSize;

  CustomPluginFileDescription({
    this.fileMd5,
    this.fileSize,
  });

  factory CustomPluginFileDescription.fromJson(Map<String, dynamic> json) {
    return CustomPluginFileDescription(
      fileMd5: json['fileMd5'] as String?,
      fileSize: json['fileSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileMd5 = this.fileMd5;
    final fileSize = this.fileSize;
    return {
      if (fileMd5 != null) 'fileMd5': fileMd5,
      if (fileSize != null) 'fileSize': fileSize,
    };
  }
}

/// Information about the location of a custom plugin.
class CustomPluginLocation {
  /// The S3 bucket Amazon Resource Name (ARN), file key, and object version of
  /// the plugin file stored in Amazon S3.
  final S3Location s3Location;

  CustomPluginLocation({
    required this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      's3Location': s3Location,
    };
  }
}

/// Information about the location of a custom plugin.
class CustomPluginLocationDescription {
  /// The S3 bucket Amazon Resource Name (ARN), file key, and object version of
  /// the plugin file stored in Amazon S3.
  final S3LocationDescription? s3Location;

  CustomPluginLocationDescription({
    this.s3Location,
  });

  factory CustomPluginLocationDescription.fromJson(Map<String, dynamic> json) {
    return CustomPluginLocationDescription(
      s3Location: json['s3Location'] != null
          ? S3LocationDescription.fromJson(
              json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Details about the revision of a custom plugin.
class CustomPluginRevisionSummary {
  /// The format of the plugin file.
  final CustomPluginContentType? contentType;

  /// The time that the custom plugin was created.
  final DateTime? creationTime;

  /// The description of the custom plugin.
  final String? description;

  /// Details about the custom plugin file.
  final CustomPluginFileDescription? fileDescription;

  /// Information about the location of the custom plugin.
  final CustomPluginLocationDescription? location;

  /// The revision of the custom plugin.
  final int? revision;

  CustomPluginRevisionSummary({
    this.contentType,
    this.creationTime,
    this.description,
    this.fileDescription,
    this.location,
    this.revision,
  });

  factory CustomPluginRevisionSummary.fromJson(Map<String, dynamic> json) {
    return CustomPluginRevisionSummary(
      contentType:
          (json['contentType'] as String?)?.toCustomPluginContentType(),
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      fileDescription: json['fileDescription'] != null
          ? CustomPluginFileDescription.fromJson(
              json['fileDescription'] as Map<String, dynamic>)
          : null,
      location: json['location'] != null
          ? CustomPluginLocationDescription.fromJson(
              json['location'] as Map<String, dynamic>)
          : null,
      revision: json['revision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final creationTime = this.creationTime;
    final description = this.description;
    final fileDescription = this.fileDescription;
    final location = this.location;
    final revision = this.revision;
    return {
      if (contentType != null) 'contentType': contentType.toValue(),
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (fileDescription != null) 'fileDescription': fileDescription,
      if (location != null) 'location': location,
      if (revision != null) 'revision': revision,
    };
  }
}

enum CustomPluginState {
  creating,
  createFailed,
  active,
  updating,
  updateFailed,
  deleting,
}

extension CustomPluginStateValueExtension on CustomPluginState {
  String toValue() {
    switch (this) {
      case CustomPluginState.creating:
        return 'CREATING';
      case CustomPluginState.createFailed:
        return 'CREATE_FAILED';
      case CustomPluginState.active:
        return 'ACTIVE';
      case CustomPluginState.updating:
        return 'UPDATING';
      case CustomPluginState.updateFailed:
        return 'UPDATE_FAILED';
      case CustomPluginState.deleting:
        return 'DELETING';
    }
  }
}

extension CustomPluginStateFromString on String {
  CustomPluginState toCustomPluginState() {
    switch (this) {
      case 'CREATING':
        return CustomPluginState.creating;
      case 'CREATE_FAILED':
        return CustomPluginState.createFailed;
      case 'ACTIVE':
        return CustomPluginState.active;
      case 'UPDATING':
        return CustomPluginState.updating;
      case 'UPDATE_FAILED':
        return CustomPluginState.updateFailed;
      case 'DELETING':
        return CustomPluginState.deleting;
    }
    throw Exception('$this is not known in enum CustomPluginState');
  }
}

/// A summary of the custom plugin.
class CustomPluginSummary {
  /// The time that the custom plugin was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the custom plugin.
  final String? customPluginArn;

  /// The state of the custom plugin.
  final CustomPluginState? customPluginState;

  /// A description of the custom plugin.
  final String? description;

  /// The latest revision of the custom plugin.
  final CustomPluginRevisionSummary? latestRevision;

  /// The name of the custom plugin.
  final String? name;

  CustomPluginSummary({
    this.creationTime,
    this.customPluginArn,
    this.customPluginState,
    this.description,
    this.latestRevision,
    this.name,
  });

  factory CustomPluginSummary.fromJson(Map<String, dynamic> json) {
    return CustomPluginSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      customPluginArn: json['customPluginArn'] as String?,
      customPluginState:
          (json['customPluginState'] as String?)?.toCustomPluginState(),
      description: json['description'] as String?,
      latestRevision: json['latestRevision'] != null
          ? CustomPluginRevisionSummary.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final customPluginArn = this.customPluginArn;
    final customPluginState = this.customPluginState;
    final description = this.description;
    final latestRevision = this.latestRevision;
    final name = this.name;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (customPluginArn != null) 'customPluginArn': customPluginArn,
      if (customPluginState != null)
        'customPluginState': customPluginState.toValue(),
      if (description != null) 'description': description,
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
    };
  }
}

class DeleteConnectorResponse {
  /// The Amazon Resource Name (ARN) of the connector that you requested to
  /// delete.
  final String? connectorArn;

  /// The state of the connector that you requested to delete.
  final ConnectorState? connectorState;

  DeleteConnectorResponse({
    this.connectorArn,
    this.connectorState,
  });

  factory DeleteConnectorResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConnectorResponse(
      connectorArn: json['connectorArn'] as String?,
      connectorState: (json['connectorState'] as String?)?.toConnectorState(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    final connectorState = this.connectorState;
    return {
      if (connectorArn != null) 'connectorArn': connectorArn,
      if (connectorState != null) 'connectorState': connectorState.toValue(),
    };
  }
}

class DeleteCustomPluginResponse {
  /// The Amazon Resource Name (ARN) of the custom plugin that you requested to
  /// delete.
  final String? customPluginArn;

  /// The state of the custom plugin.
  final CustomPluginState? customPluginState;

  DeleteCustomPluginResponse({
    this.customPluginArn,
    this.customPluginState,
  });

  factory DeleteCustomPluginResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCustomPluginResponse(
      customPluginArn: json['customPluginArn'] as String?,
      customPluginState:
          (json['customPluginState'] as String?)?.toCustomPluginState(),
    );
  }

  Map<String, dynamic> toJson() {
    final customPluginArn = this.customPluginArn;
    final customPluginState = this.customPluginState;
    return {
      if (customPluginArn != null) 'customPluginArn': customPluginArn,
      if (customPluginState != null)
        'customPluginState': customPluginState.toValue(),
    };
  }
}

class DeleteWorkerConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the worker configuration that you
  /// requested to delete.
  final String? workerConfigurationArn;

  /// The state of the worker configuration.
  final WorkerConfigurationState? workerConfigurationState;

  DeleteWorkerConfigurationResponse({
    this.workerConfigurationArn,
    this.workerConfigurationState,
  });

  factory DeleteWorkerConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteWorkerConfigurationResponse(
      workerConfigurationArn: json['workerConfigurationArn'] as String?,
      workerConfigurationState: (json['workerConfigurationState'] as String?)
          ?.toWorkerConfigurationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final workerConfigurationArn = this.workerConfigurationArn;
    final workerConfigurationState = this.workerConfigurationState;
    return {
      if (workerConfigurationArn != null)
        'workerConfigurationArn': workerConfigurationArn,
      if (workerConfigurationState != null)
        'workerConfigurationState': workerConfigurationState.toValue(),
    };
  }
}

class DescribeConnectorResponse {
  /// Information about the capacity of the connector, whether it is auto scaled
  /// or provisioned.
  final CapacityDescription? capacity;

  /// The Amazon Resource Name (ARN) of the connector.
  final String? connectorArn;

  /// A map of keys to values that represent the configuration for the connector.
  final Map<String, String>? connectorConfiguration;

  /// A summary description of the connector.
  final String? connectorDescription;

  /// The name of the connector.
  final String? connectorName;

  /// The state of the connector.
  final ConnectorState? connectorState;

  /// The time the connector was created.
  final DateTime? creationTime;

  /// The current version of the connector.
  final String? currentVersion;

  /// The Apache Kafka cluster that the connector is connected to.
  final KafkaClusterDescription? kafkaCluster;

  /// The type of client authentication used to connect to the Apache Kafka
  /// cluster. The value is NONE when no client authentication is used.
  final KafkaClusterClientAuthenticationDescription?
      kafkaClusterClientAuthentication;

  /// Details of encryption in transit to the Apache Kafka cluster.
  final KafkaClusterEncryptionInTransitDescription?
      kafkaClusterEncryptionInTransit;

  /// The version of Kafka Connect. It has to be compatible with both the Apache
  /// Kafka cluster's version and the plugins.
  final String? kafkaConnectVersion;

  /// Details about delivering logs to Amazon CloudWatch Logs.
  final LogDeliveryDescription? logDelivery;

  /// Specifies which plugins were used for this connector.
  final List<PluginDescription>? plugins;

  /// The Amazon Resource Name (ARN) of the IAM role used by the connector to
  /// access Amazon Web Services resources.
  final String? serviceExecutionRoleArn;

  /// Details about the state of a connector.
  final StateDescription? stateDescription;

  /// Specifies which worker configuration was used for the connector.
  final WorkerConfigurationDescription? workerConfiguration;

  DescribeConnectorResponse({
    this.capacity,
    this.connectorArn,
    this.connectorConfiguration,
    this.connectorDescription,
    this.connectorName,
    this.connectorState,
    this.creationTime,
    this.currentVersion,
    this.kafkaCluster,
    this.kafkaClusterClientAuthentication,
    this.kafkaClusterEncryptionInTransit,
    this.kafkaConnectVersion,
    this.logDelivery,
    this.plugins,
    this.serviceExecutionRoleArn,
    this.stateDescription,
    this.workerConfiguration,
  });

  factory DescribeConnectorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConnectorResponse(
      capacity: json['capacity'] != null
          ? CapacityDescription.fromJson(
              json['capacity'] as Map<String, dynamic>)
          : null,
      connectorArn: json['connectorArn'] as String?,
      connectorConfiguration:
          (json['connectorConfiguration'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      connectorDescription: json['connectorDescription'] as String?,
      connectorName: json['connectorName'] as String?,
      connectorState: (json['connectorState'] as String?)?.toConnectorState(),
      creationTime: timeStampFromJson(json['creationTime']),
      currentVersion: json['currentVersion'] as String?,
      kafkaCluster: json['kafkaCluster'] != null
          ? KafkaClusterDescription.fromJson(
              json['kafkaCluster'] as Map<String, dynamic>)
          : null,
      kafkaClusterClientAuthentication:
          json['kafkaClusterClientAuthentication'] != null
              ? KafkaClusterClientAuthenticationDescription.fromJson(
                  json['kafkaClusterClientAuthentication']
                      as Map<String, dynamic>)
              : null,
      kafkaClusterEncryptionInTransit:
          json['kafkaClusterEncryptionInTransit'] != null
              ? KafkaClusterEncryptionInTransitDescription.fromJson(
                  json['kafkaClusterEncryptionInTransit']
                      as Map<String, dynamic>)
              : null,
      kafkaConnectVersion: json['kafkaConnectVersion'] as String?,
      logDelivery: json['logDelivery'] != null
          ? LogDeliveryDescription.fromJson(
              json['logDelivery'] as Map<String, dynamic>)
          : null,
      plugins: (json['plugins'] as List?)
          ?.whereNotNull()
          .map((e) => PluginDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceExecutionRoleArn: json['serviceExecutionRoleArn'] as String?,
      stateDescription: json['stateDescription'] != null
          ? StateDescription.fromJson(
              json['stateDescription'] as Map<String, dynamic>)
          : null,
      workerConfiguration: json['workerConfiguration'] != null
          ? WorkerConfigurationDescription.fromJson(
              json['workerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capacity = this.capacity;
    final connectorArn = this.connectorArn;
    final connectorConfiguration = this.connectorConfiguration;
    final connectorDescription = this.connectorDescription;
    final connectorName = this.connectorName;
    final connectorState = this.connectorState;
    final creationTime = this.creationTime;
    final currentVersion = this.currentVersion;
    final kafkaCluster = this.kafkaCluster;
    final kafkaClusterClientAuthentication =
        this.kafkaClusterClientAuthentication;
    final kafkaClusterEncryptionInTransit =
        this.kafkaClusterEncryptionInTransit;
    final kafkaConnectVersion = this.kafkaConnectVersion;
    final logDelivery = this.logDelivery;
    final plugins = this.plugins;
    final serviceExecutionRoleArn = this.serviceExecutionRoleArn;
    final stateDescription = this.stateDescription;
    final workerConfiguration = this.workerConfiguration;
    return {
      if (capacity != null) 'capacity': capacity,
      if (connectorArn != null) 'connectorArn': connectorArn,
      if (connectorConfiguration != null)
        'connectorConfiguration': connectorConfiguration,
      if (connectorDescription != null)
        'connectorDescription': connectorDescription,
      if (connectorName != null) 'connectorName': connectorName,
      if (connectorState != null) 'connectorState': connectorState.toValue(),
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (currentVersion != null) 'currentVersion': currentVersion,
      if (kafkaCluster != null) 'kafkaCluster': kafkaCluster,
      if (kafkaClusterClientAuthentication != null)
        'kafkaClusterClientAuthentication': kafkaClusterClientAuthentication,
      if (kafkaClusterEncryptionInTransit != null)
        'kafkaClusterEncryptionInTransit': kafkaClusterEncryptionInTransit,
      if (kafkaConnectVersion != null)
        'kafkaConnectVersion': kafkaConnectVersion,
      if (logDelivery != null) 'logDelivery': logDelivery,
      if (plugins != null) 'plugins': plugins,
      if (serviceExecutionRoleArn != null)
        'serviceExecutionRoleArn': serviceExecutionRoleArn,
      if (stateDescription != null) 'stateDescription': stateDescription,
      if (workerConfiguration != null)
        'workerConfiguration': workerConfiguration,
    };
  }
}

class DescribeCustomPluginResponse {
  /// The time that the custom plugin was created.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the custom plugin.
  final String? customPluginArn;

  /// The state of the custom plugin.
  final CustomPluginState? customPluginState;

  /// The description of the custom plugin.
  final String? description;

  /// The latest successfully created revision of the custom plugin. If there are
  /// no successfully created revisions, this field will be absent.
  final CustomPluginRevisionSummary? latestRevision;

  /// The name of the custom plugin.
  final String? name;

  /// Details about the state of a custom plugin.
  final StateDescription? stateDescription;

  DescribeCustomPluginResponse({
    this.creationTime,
    this.customPluginArn,
    this.customPluginState,
    this.description,
    this.latestRevision,
    this.name,
    this.stateDescription,
  });

  factory DescribeCustomPluginResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCustomPluginResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      customPluginArn: json['customPluginArn'] as String?,
      customPluginState:
          (json['customPluginState'] as String?)?.toCustomPluginState(),
      description: json['description'] as String?,
      latestRevision: json['latestRevision'] != null
          ? CustomPluginRevisionSummary.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      stateDescription: json['stateDescription'] != null
          ? StateDescription.fromJson(
              json['stateDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final customPluginArn = this.customPluginArn;
    final customPluginState = this.customPluginState;
    final description = this.description;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final stateDescription = this.stateDescription;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (customPluginArn != null) 'customPluginArn': customPluginArn,
      if (customPluginState != null)
        'customPluginState': customPluginState.toValue(),
      if (description != null) 'description': description,
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
      if (stateDescription != null) 'stateDescription': stateDescription,
    };
  }
}

class DescribeWorkerConfigurationResponse {
  /// The time that the worker configuration was created.
  final DateTime? creationTime;

  /// The description of the worker configuration.
  final String? description;

  /// The latest revision of the custom configuration.
  final WorkerConfigurationRevisionDescription? latestRevision;

  /// The name of the worker configuration.
  final String? name;

  /// The Amazon Resource Name (ARN) of the custom configuration.
  final String? workerConfigurationArn;

  /// The state of the worker configuration.
  final WorkerConfigurationState? workerConfigurationState;

  DescribeWorkerConfigurationResponse({
    this.creationTime,
    this.description,
    this.latestRevision,
    this.name,
    this.workerConfigurationArn,
    this.workerConfigurationState,
  });

  factory DescribeWorkerConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeWorkerConfigurationResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      latestRevision: json['latestRevision'] != null
          ? WorkerConfigurationRevisionDescription.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      workerConfigurationArn: json['workerConfigurationArn'] as String?,
      workerConfigurationState: (json['workerConfigurationState'] as String?)
          ?.toWorkerConfigurationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final workerConfigurationArn = this.workerConfigurationArn;
    final workerConfigurationState = this.workerConfigurationState;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
      if (workerConfigurationArn != null)
        'workerConfigurationArn': workerConfigurationArn,
      if (workerConfigurationState != null)
        'workerConfigurationState': workerConfigurationState.toValue(),
    };
  }
}

/// The settings for delivering logs to Amazon Kinesis Data Firehose.
class FirehoseLogDelivery {
  /// Specifies whether connector logs get delivered to Amazon Kinesis Data
  /// Firehose.
  final bool enabled;

  /// The name of the Kinesis Data Firehose delivery stream that is the
  /// destination for log delivery.
  final String? deliveryStream;

  FirehoseLogDelivery({
    required this.enabled,
    this.deliveryStream,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final deliveryStream = this.deliveryStream;
    return {
      'enabled': enabled,
      if (deliveryStream != null) 'deliveryStream': deliveryStream,
    };
  }
}

/// A description of the settings for delivering logs to Amazon Kinesis Data
/// Firehose.
class FirehoseLogDeliveryDescription {
  /// The name of the Kinesis Data Firehose delivery stream that is the
  /// destination for log delivery.
  final String? deliveryStream;

  /// Specifies whether connector logs get delivered to Amazon Kinesis Data
  /// Firehose.
  final bool? enabled;

  FirehoseLogDeliveryDescription({
    this.deliveryStream,
    this.enabled,
  });

  factory FirehoseLogDeliveryDescription.fromJson(Map<String, dynamic> json) {
    return FirehoseLogDeliveryDescription(
      deliveryStream: json['deliveryStream'] as String?,
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStream = this.deliveryStream;
    final enabled = this.enabled;
    return {
      if (deliveryStream != null) 'deliveryStream': deliveryStream,
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// The details of the Apache Kafka cluster to which the connector is connected.
class KafkaCluster {
  /// The Apache Kafka cluster to which the connector is connected.
  final ApacheKafkaCluster apacheKafkaCluster;

  KafkaCluster({
    required this.apacheKafkaCluster,
  });

  Map<String, dynamic> toJson() {
    final apacheKafkaCluster = this.apacheKafkaCluster;
    return {
      'apacheKafkaCluster': apacheKafkaCluster,
    };
  }
}

/// The client authentication information used in order to authenticate with the
/// Apache Kafka cluster.
class KafkaClusterClientAuthentication {
  /// The type of client authentication used to connect to the Apache Kafka
  /// cluster. Value NONE means that no client authentication is used.
  final KafkaClusterClientAuthenticationType authenticationType;

  KafkaClusterClientAuthentication({
    required this.authenticationType,
  });

  Map<String, dynamic> toJson() {
    final authenticationType = this.authenticationType;
    return {
      'authenticationType': authenticationType.toValue(),
    };
  }
}

/// The client authentication information used in order to authenticate with the
/// Apache Kafka cluster.
class KafkaClusterClientAuthenticationDescription {
  /// The type of client authentication used to connect to the Apache Kafka
  /// cluster. Value NONE means that no client authentication is used.
  final KafkaClusterClientAuthenticationType? authenticationType;

  KafkaClusterClientAuthenticationDescription({
    this.authenticationType,
  });

  factory KafkaClusterClientAuthenticationDescription.fromJson(
      Map<String, dynamic> json) {
    return KafkaClusterClientAuthenticationDescription(
      authenticationType: (json['authenticationType'] as String?)
          ?.toKafkaClusterClientAuthenticationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationType = this.authenticationType;
    return {
      if (authenticationType != null)
        'authenticationType': authenticationType.toValue(),
    };
  }
}

enum KafkaClusterClientAuthenticationType {
  none,
  iam,
}

extension KafkaClusterClientAuthenticationTypeValueExtension
    on KafkaClusterClientAuthenticationType {
  String toValue() {
    switch (this) {
      case KafkaClusterClientAuthenticationType.none:
        return 'NONE';
      case KafkaClusterClientAuthenticationType.iam:
        return 'IAM';
    }
  }
}

extension KafkaClusterClientAuthenticationTypeFromString on String {
  KafkaClusterClientAuthenticationType
      toKafkaClusterClientAuthenticationType() {
    switch (this) {
      case 'NONE':
        return KafkaClusterClientAuthenticationType.none;
      case 'IAM':
        return KafkaClusterClientAuthenticationType.iam;
    }
    throw Exception(
        '$this is not known in enum KafkaClusterClientAuthenticationType');
  }
}

/// Details of how to connect to the Apache Kafka cluster.
class KafkaClusterDescription {
  /// The Apache Kafka cluster to which the connector is connected.
  final ApacheKafkaClusterDescription? apacheKafkaCluster;

  KafkaClusterDescription({
    this.apacheKafkaCluster,
  });

  factory KafkaClusterDescription.fromJson(Map<String, dynamic> json) {
    return KafkaClusterDescription(
      apacheKafkaCluster: json['apacheKafkaCluster'] != null
          ? ApacheKafkaClusterDescription.fromJson(
              json['apacheKafkaCluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apacheKafkaCluster = this.apacheKafkaCluster;
    return {
      if (apacheKafkaCluster != null) 'apacheKafkaCluster': apacheKafkaCluster,
    };
  }
}

/// Details of encryption in transit to the Apache Kafka cluster.
class KafkaClusterEncryptionInTransit {
  /// The type of encryption in transit to the Apache Kafka cluster.
  final KafkaClusterEncryptionInTransitType encryptionType;

  KafkaClusterEncryptionInTransit({
    required this.encryptionType,
  });

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    return {
      'encryptionType': encryptionType.toValue(),
    };
  }
}

/// The description of the encryption in transit to the Apache Kafka cluster.
class KafkaClusterEncryptionInTransitDescription {
  /// The type of encryption in transit to the Apache Kafka cluster.
  final KafkaClusterEncryptionInTransitType? encryptionType;

  KafkaClusterEncryptionInTransitDescription({
    this.encryptionType,
  });

  factory KafkaClusterEncryptionInTransitDescription.fromJson(
      Map<String, dynamic> json) {
    return KafkaClusterEncryptionInTransitDescription(
      encryptionType: (json['encryptionType'] as String?)
          ?.toKafkaClusterEncryptionInTransitType(),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    return {
      if (encryptionType != null) 'encryptionType': encryptionType.toValue(),
    };
  }
}

enum KafkaClusterEncryptionInTransitType {
  plaintext,
  tls,
}

extension KafkaClusterEncryptionInTransitTypeValueExtension
    on KafkaClusterEncryptionInTransitType {
  String toValue() {
    switch (this) {
      case KafkaClusterEncryptionInTransitType.plaintext:
        return 'PLAINTEXT';
      case KafkaClusterEncryptionInTransitType.tls:
        return 'TLS';
    }
  }
}

extension KafkaClusterEncryptionInTransitTypeFromString on String {
  KafkaClusterEncryptionInTransitType toKafkaClusterEncryptionInTransitType() {
    switch (this) {
      case 'PLAINTEXT':
        return KafkaClusterEncryptionInTransitType.plaintext;
      case 'TLS':
        return KafkaClusterEncryptionInTransitType.tls;
    }
    throw Exception(
        '$this is not known in enum KafkaClusterEncryptionInTransitType');
  }
}

class ListConnectorsResponse {
  /// An array of connector descriptions.
  final List<ConnectorSummary>? connectors;

  /// If the response of a ListConnectors operation is truncated, it will include
  /// a NextToken. Send this NextToken in a subsequent request to continue listing
  /// from where it left off.
  final String? nextToken;

  ListConnectorsResponse({
    this.connectors,
    this.nextToken,
  });

  factory ListConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorsResponse(
      connectors: (json['connectors'] as List?)
          ?.whereNotNull()
          .map((e) => ConnectorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectors = this.connectors;
    final nextToken = this.nextToken;
    return {
      if (connectors != null) 'connectors': connectors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListCustomPluginsResponse {
  /// An array of custom plugin descriptions.
  final List<CustomPluginSummary>? customPlugins;

  /// If the response of a ListCustomPlugins operation is truncated, it will
  /// include a NextToken. Send this NextToken in a subsequent request to continue
  /// listing from where the previous operation left off.
  final String? nextToken;

  ListCustomPluginsResponse({
    this.customPlugins,
    this.nextToken,
  });

  factory ListCustomPluginsResponse.fromJson(Map<String, dynamic> json) {
    return ListCustomPluginsResponse(
      customPlugins: (json['customPlugins'] as List?)
          ?.whereNotNull()
          .map((e) => CustomPluginSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customPlugins = this.customPlugins;
    final nextToken = this.nextToken;
    return {
      if (customPlugins != null) 'customPlugins': customPlugins,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Lists the tags attached to the specified resource in the corresponding
  /// request.
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

class ListWorkerConfigurationsResponse {
  /// If the response of a ListWorkerConfigurations operation is truncated, it
  /// will include a NextToken. Send this NextToken in a subsequent request to
  /// continue listing from where the previous operation left off.
  final String? nextToken;

  /// An array of worker configuration descriptions.
  final List<WorkerConfigurationSummary>? workerConfigurations;

  ListWorkerConfigurationsResponse({
    this.nextToken,
    this.workerConfigurations,
  });

  factory ListWorkerConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkerConfigurationsResponse(
      nextToken: json['nextToken'] as String?,
      workerConfigurations: (json['workerConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WorkerConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workerConfigurations = this.workerConfigurations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workerConfigurations != null)
        'workerConfigurations': workerConfigurations,
    };
  }
}

/// Details about log delivery.
class LogDelivery {
  /// The workers can send worker logs to different destination types. This
  /// configuration specifies the details of these destinations.
  final WorkerLogDelivery workerLogDelivery;

  LogDelivery({
    required this.workerLogDelivery,
  });

  Map<String, dynamic> toJson() {
    final workerLogDelivery = this.workerLogDelivery;
    return {
      'workerLogDelivery': workerLogDelivery,
    };
  }
}

/// The description of the log delivery settings.
class LogDeliveryDescription {
  /// The workers can send worker logs to different destination types. This
  /// configuration specifies the details of these destinations.
  final WorkerLogDeliveryDescription? workerLogDelivery;

  LogDeliveryDescription({
    this.workerLogDelivery,
  });

  factory LogDeliveryDescription.fromJson(Map<String, dynamic> json) {
    return LogDeliveryDescription(
      workerLogDelivery: json['workerLogDelivery'] != null
          ? WorkerLogDeliveryDescription.fromJson(
              json['workerLogDelivery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workerLogDelivery = this.workerLogDelivery;
    return {
      if (workerLogDelivery != null) 'workerLogDelivery': workerLogDelivery,
    };
  }
}

/// A plugin is an Amazon Web Services resource that contains the code that
/// defines your connector logic.
class Plugin {
  /// Details about a custom plugin.
  final CustomPlugin customPlugin;

  Plugin({
    required this.customPlugin,
  });

  Map<String, dynamic> toJson() {
    final customPlugin = this.customPlugin;
    return {
      'customPlugin': customPlugin,
    };
  }
}

/// The description of the plugin.
class PluginDescription {
  /// Details about a custom plugin.
  final CustomPluginDescription? customPlugin;

  PluginDescription({
    this.customPlugin,
  });

  factory PluginDescription.fromJson(Map<String, dynamic> json) {
    return PluginDescription(
      customPlugin: json['customPlugin'] != null
          ? CustomPluginDescription.fromJson(
              json['customPlugin'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customPlugin = this.customPlugin;
    return {
      if (customPlugin != null) 'customPlugin': customPlugin,
    };
  }
}

/// Details about a connector's provisioned capacity.
class ProvisionedCapacity {
  /// The number of microcontroller units (MCUs) allocated to each connector
  /// worker. The valid values are 1,2,4,8.
  final int mcuCount;

  /// The number of workers that are allocated to the connector.
  final int workerCount;

  ProvisionedCapacity({
    required this.mcuCount,
    required this.workerCount,
  });

  Map<String, dynamic> toJson() {
    final mcuCount = this.mcuCount;
    final workerCount = this.workerCount;
    return {
      'mcuCount': mcuCount,
      'workerCount': workerCount,
    };
  }
}

/// The description of a connector's provisioned capacity.
class ProvisionedCapacityDescription {
  /// The number of microcontroller units (MCUs) allocated to each connector
  /// worker. The valid values are 1,2,4,8.
  final int? mcuCount;

  /// The number of workers that are allocated to the connector.
  final int? workerCount;

  ProvisionedCapacityDescription({
    this.mcuCount,
    this.workerCount,
  });

  factory ProvisionedCapacityDescription.fromJson(Map<String, dynamic> json) {
    return ProvisionedCapacityDescription(
      mcuCount: json['mcuCount'] as int?,
      workerCount: json['workerCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final mcuCount = this.mcuCount;
    final workerCount = this.workerCount;
    return {
      if (mcuCount != null) 'mcuCount': mcuCount,
      if (workerCount != null) 'workerCount': workerCount,
    };
  }
}

/// An update to a connector's fixed capacity.
class ProvisionedCapacityUpdate {
  /// The number of microcontroller units (MCUs) allocated to each connector
  /// worker. The valid values are 1,2,4,8.
  final int mcuCount;

  /// The number of workers that are allocated to the connector.
  final int workerCount;

  ProvisionedCapacityUpdate({
    required this.mcuCount,
    required this.workerCount,
  });

  Map<String, dynamic> toJson() {
    final mcuCount = this.mcuCount;
    final workerCount = this.workerCount;
    return {
      'mcuCount': mcuCount,
      'workerCount': workerCount,
    };
  }
}

/// The location of an object in Amazon S3.
class S3Location {
  /// The Amazon Resource Name (ARN) of an S3 bucket.
  final String bucketArn;

  /// The file key for an object in an S3 bucket.
  final String fileKey;

  /// The version of an object in an S3 bucket.
  final String? objectVersion;

  S3Location({
    required this.bucketArn,
    required this.fileKey,
    this.objectVersion,
  });

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final fileKey = this.fileKey;
    final objectVersion = this.objectVersion;
    return {
      'bucketArn': bucketArn,
      'fileKey': fileKey,
      if (objectVersion != null) 'objectVersion': objectVersion,
    };
  }
}

/// The description of the location of an object in Amazon S3.
class S3LocationDescription {
  /// The Amazon Resource Name (ARN) of an S3 bucket.
  final String? bucketArn;

  /// The file key for an object in an S3 bucket.
  final String? fileKey;

  /// The version of an object in an S3 bucket.
  final String? objectVersion;

  S3LocationDescription({
    this.bucketArn,
    this.fileKey,
    this.objectVersion,
  });

  factory S3LocationDescription.fromJson(Map<String, dynamic> json) {
    return S3LocationDescription(
      bucketArn: json['bucketArn'] as String?,
      fileKey: json['fileKey'] as String?,
      objectVersion: json['objectVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final fileKey = this.fileKey;
    final objectVersion = this.objectVersion;
    return {
      if (bucketArn != null) 'bucketArn': bucketArn,
      if (fileKey != null) 'fileKey': fileKey,
      if (objectVersion != null) 'objectVersion': objectVersion,
    };
  }
}

/// Details about delivering logs to Amazon S3.
class S3LogDelivery {
  /// Specifies whether connector logs get sent to the specified Amazon S3
  /// destination.
  final bool enabled;

  /// The name of the S3 bucket that is the destination for log delivery.
  final String? bucket;

  /// The S3 prefix that is the destination for log delivery.
  final String? prefix;

  S3LogDelivery({
    required this.enabled,
    this.bucket,
    this.prefix,
  });

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

/// The description of the details about delivering logs to Amazon S3.
class S3LogDeliveryDescription {
  /// The name of the S3 bucket that is the destination for log delivery.
  final String? bucket;

  /// Specifies whether connector logs get sent to the specified Amazon S3
  /// destination.
  final bool? enabled;

  /// The S3 prefix that is the destination for log delivery.
  final String? prefix;

  S3LogDeliveryDescription({
    this.bucket,
    this.enabled,
    this.prefix,
  });

  factory S3LogDeliveryDescription.fromJson(Map<String, dynamic> json) {
    return S3LogDeliveryDescription(
      bucket: json['bucket'] as String?,
      enabled: json['enabled'] as bool?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final enabled = this.enabled;
    final prefix = this.prefix;
    return {
      if (bucket != null) 'bucket': bucket,
      if (enabled != null) 'enabled': enabled,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// The scale-in policy for the connector.
class ScaleInPolicy {
  /// Specifies the CPU utilization percentage threshold at which you want
  /// connector scale in to be triggered.
  final int cpuUtilizationPercentage;

  ScaleInPolicy({
    required this.cpuUtilizationPercentage,
  });

  Map<String, dynamic> toJson() {
    final cpuUtilizationPercentage = this.cpuUtilizationPercentage;
    return {
      'cpuUtilizationPercentage': cpuUtilizationPercentage,
    };
  }
}

/// The description of the scale-in policy for the connector.
class ScaleInPolicyDescription {
  /// Specifies the CPU utilization percentage threshold at which you want
  /// connector scale in to be triggered.
  final int? cpuUtilizationPercentage;

  ScaleInPolicyDescription({
    this.cpuUtilizationPercentage,
  });

  factory ScaleInPolicyDescription.fromJson(Map<String, dynamic> json) {
    return ScaleInPolicyDescription(
      cpuUtilizationPercentage: json['cpuUtilizationPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpuUtilizationPercentage = this.cpuUtilizationPercentage;
    return {
      if (cpuUtilizationPercentage != null)
        'cpuUtilizationPercentage': cpuUtilizationPercentage,
    };
  }
}

/// An update to the connector's scale-in policy.
class ScaleInPolicyUpdate {
  /// The target CPU utilization percentage threshold at which you want connector
  /// scale in to be triggered.
  final int cpuUtilizationPercentage;

  ScaleInPolicyUpdate({
    required this.cpuUtilizationPercentage,
  });

  Map<String, dynamic> toJson() {
    final cpuUtilizationPercentage = this.cpuUtilizationPercentage;
    return {
      'cpuUtilizationPercentage': cpuUtilizationPercentage,
    };
  }
}

/// The scale-out policy for the connector.
class ScaleOutPolicy {
  /// The CPU utilization percentage threshold at which you want connector scale
  /// out to be triggered.
  final int cpuUtilizationPercentage;

  ScaleOutPolicy({
    required this.cpuUtilizationPercentage,
  });

  Map<String, dynamic> toJson() {
    final cpuUtilizationPercentage = this.cpuUtilizationPercentage;
    return {
      'cpuUtilizationPercentage': cpuUtilizationPercentage,
    };
  }
}

/// The description of the scale-out policy for the connector.
class ScaleOutPolicyDescription {
  /// The CPU utilization percentage threshold at which you want connector scale
  /// out to be triggered.
  final int? cpuUtilizationPercentage;

  ScaleOutPolicyDescription({
    this.cpuUtilizationPercentage,
  });

  factory ScaleOutPolicyDescription.fromJson(Map<String, dynamic> json) {
    return ScaleOutPolicyDescription(
      cpuUtilizationPercentage: json['cpuUtilizationPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpuUtilizationPercentage = this.cpuUtilizationPercentage;
    return {
      if (cpuUtilizationPercentage != null)
        'cpuUtilizationPercentage': cpuUtilizationPercentage,
    };
  }
}

/// An update to the connector's scale-out policy.
class ScaleOutPolicyUpdate {
  /// The target CPU utilization percentage threshold at which you want connector
  /// scale out to be triggered.
  final int cpuUtilizationPercentage;

  ScaleOutPolicyUpdate({
    required this.cpuUtilizationPercentage,
  });

  Map<String, dynamic> toJson() {
    final cpuUtilizationPercentage = this.cpuUtilizationPercentage;
    return {
      'cpuUtilizationPercentage': cpuUtilizationPercentage,
    };
  }
}

/// Details about the state of a resource.
class StateDescription {
  /// A code that describes the state of a resource.
  final String? code;

  /// A message that describes the state of a resource.
  final String? message;

  StateDescription({
    this.code,
    this.message,
  });

  factory StateDescription.fromJson(Map<String, dynamic> json) {
    return StateDescription(
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateConnectorResponse {
  /// The Amazon Resource Name (ARN) of the connector.
  final String? connectorArn;

  /// The state of the connector.
  final ConnectorState? connectorState;

  UpdateConnectorResponse({
    this.connectorArn,
    this.connectorState,
  });

  factory UpdateConnectorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectorResponse(
      connectorArn: json['connectorArn'] as String?,
      connectorState: (json['connectorState'] as String?)?.toConnectorState(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    final connectorState = this.connectorState;
    return {
      if (connectorArn != null) 'connectorArn': connectorArn,
      if (connectorState != null) 'connectorState': connectorState.toValue(),
    };
  }
}

/// Information about the VPC in which the connector resides.
class Vpc {
  /// The subnets for the connector.
  final List<String> subnets;

  /// The security groups for the connector.
  final List<String>? securityGroups;

  Vpc({
    required this.subnets,
    this.securityGroups,
  });

  Map<String, dynamic> toJson() {
    final subnets = this.subnets;
    final securityGroups = this.securityGroups;
    return {
      'subnets': subnets,
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
  }
}

/// The description of the VPC in which the connector resides.
class VpcDescription {
  /// The security groups for the connector.
  final List<String>? securityGroups;

  /// The subnets for the connector.
  final List<String>? subnets;

  VpcDescription({
    this.securityGroups,
    this.subnets,
  });

  factory VpcDescription.fromJson(Map<String, dynamic> json) {
    return VpcDescription(
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnets: (json['subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroups = this.securityGroups;
    final subnets = this.subnets;
    return {
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (subnets != null) 'subnets': subnets,
    };
  }
}

/// The configuration of the workers, which are the processes that run the
/// connector logic.
class WorkerConfiguration {
  /// The revision of the worker configuration.
  final int revision;

  /// The Amazon Resource Name (ARN) of the worker configuration.
  final String workerConfigurationArn;

  WorkerConfiguration({
    required this.revision,
    required this.workerConfigurationArn,
  });

  Map<String, dynamic> toJson() {
    final revision = this.revision;
    final workerConfigurationArn = this.workerConfigurationArn;
    return {
      'revision': revision,
      'workerConfigurationArn': workerConfigurationArn,
    };
  }
}

/// The description of the worker configuration.
class WorkerConfigurationDescription {
  /// The revision of the worker configuration.
  final int? revision;

  /// The Amazon Resource Name (ARN) of the worker configuration.
  final String? workerConfigurationArn;

  WorkerConfigurationDescription({
    this.revision,
    this.workerConfigurationArn,
  });

  factory WorkerConfigurationDescription.fromJson(Map<String, dynamic> json) {
    return WorkerConfigurationDescription(
      revision: json['revision'] as int?,
      workerConfigurationArn: json['workerConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final revision = this.revision;
    final workerConfigurationArn = this.workerConfigurationArn;
    return {
      if (revision != null) 'revision': revision,
      if (workerConfigurationArn != null)
        'workerConfigurationArn': workerConfigurationArn,
    };
  }
}

/// The description of the worker configuration revision.
class WorkerConfigurationRevisionDescription {
  /// The time that the worker configuration was created.
  final DateTime? creationTime;

  /// The description of the worker configuration revision.
  final String? description;

  /// Base64 encoded contents of the connect-distributed.properties file.
  final String? propertiesFileContent;

  /// The description of a revision of the worker configuration.
  final int? revision;

  WorkerConfigurationRevisionDescription({
    this.creationTime,
    this.description,
    this.propertiesFileContent,
    this.revision,
  });

  factory WorkerConfigurationRevisionDescription.fromJson(
      Map<String, dynamic> json) {
    return WorkerConfigurationRevisionDescription(
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      propertiesFileContent: json['propertiesFileContent'] as String?,
      revision: json['revision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final propertiesFileContent = this.propertiesFileContent;
    final revision = this.revision;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (propertiesFileContent != null)
        'propertiesFileContent': propertiesFileContent,
      if (revision != null) 'revision': revision,
    };
  }
}

/// The summary of a worker configuration revision.
class WorkerConfigurationRevisionSummary {
  /// The time that a worker configuration revision was created.
  final DateTime? creationTime;

  /// The description of a worker configuration revision.
  final String? description;

  /// The revision of a worker configuration.
  final int? revision;

  WorkerConfigurationRevisionSummary({
    this.creationTime,
    this.description,
    this.revision,
  });

  factory WorkerConfigurationRevisionSummary.fromJson(
      Map<String, dynamic> json) {
    return WorkerConfigurationRevisionSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      revision: json['revision'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final revision = this.revision;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (revision != null) 'revision': revision,
    };
  }
}

enum WorkerConfigurationState {
  active,
  deleting,
}

extension WorkerConfigurationStateValueExtension on WorkerConfigurationState {
  String toValue() {
    switch (this) {
      case WorkerConfigurationState.active:
        return 'ACTIVE';
      case WorkerConfigurationState.deleting:
        return 'DELETING';
    }
  }
}

extension WorkerConfigurationStateFromString on String {
  WorkerConfigurationState toWorkerConfigurationState() {
    switch (this) {
      case 'ACTIVE':
        return WorkerConfigurationState.active;
      case 'DELETING':
        return WorkerConfigurationState.deleting;
    }
    throw Exception('$this is not known in enum WorkerConfigurationState');
  }
}

/// The summary of a worker configuration.
class WorkerConfigurationSummary {
  /// The time that a worker configuration was created.
  final DateTime? creationTime;

  /// The description of a worker configuration.
  final String? description;

  /// The latest revision of a worker configuration.
  final WorkerConfigurationRevisionSummary? latestRevision;

  /// The name of the worker configuration.
  final String? name;

  /// The Amazon Resource Name (ARN) of the worker configuration.
  final String? workerConfigurationArn;

  /// The state of the worker configuration.
  final WorkerConfigurationState? workerConfigurationState;

  WorkerConfigurationSummary({
    this.creationTime,
    this.description,
    this.latestRevision,
    this.name,
    this.workerConfigurationArn,
    this.workerConfigurationState,
  });

  factory WorkerConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return WorkerConfigurationSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      latestRevision: json['latestRevision'] != null
          ? WorkerConfigurationRevisionSummary.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      workerConfigurationArn: json['workerConfigurationArn'] as String?,
      workerConfigurationState: (json['workerConfigurationState'] as String?)
          ?.toWorkerConfigurationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final latestRevision = this.latestRevision;
    final name = this.name;
    final workerConfigurationArn = this.workerConfigurationArn;
    final workerConfigurationState = this.workerConfigurationState;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (latestRevision != null) 'latestRevision': latestRevision,
      if (name != null) 'name': name,
      if (workerConfigurationArn != null)
        'workerConfigurationArn': workerConfigurationArn,
      if (workerConfigurationState != null)
        'workerConfigurationState': workerConfigurationState.toValue(),
    };
  }
}

/// Workers can send worker logs to different destination types. This
/// configuration specifies the details of these destinations.
class WorkerLogDelivery {
  /// Details about delivering logs to Amazon CloudWatch Logs.
  final CloudWatchLogsLogDelivery? cloudWatchLogs;

  /// Details about delivering logs to Amazon Kinesis Data Firehose.
  final FirehoseLogDelivery? firehose;

  /// Details about delivering logs to Amazon S3.
  final S3LogDelivery? s3;

  WorkerLogDelivery({
    this.cloudWatchLogs,
    this.firehose,
    this.s3,
  });

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

/// Workers can send worker logs to different destination types. This
/// configuration specifies the details of these destinations.
class WorkerLogDeliveryDescription {
  /// Details about delivering logs to Amazon CloudWatch Logs.
  final CloudWatchLogsLogDeliveryDescription? cloudWatchLogs;

  /// Details about delivering logs to Amazon Kinesis Data Firehose.
  final FirehoseLogDeliveryDescription? firehose;

  /// Details about delivering logs to Amazon S3.
  final S3LogDeliveryDescription? s3;

  WorkerLogDeliveryDescription({
    this.cloudWatchLogs,
    this.firehose,
    this.s3,
  });

  factory WorkerLogDeliveryDescription.fromJson(Map<String, dynamic> json) {
    return WorkerLogDeliveryDescription(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? CloudWatchLogsLogDeliveryDescription.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
      firehose: json['firehose'] != null
          ? FirehoseLogDeliveryDescription.fromJson(
              json['firehose'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? S3LogDeliveryDescription.fromJson(
              json['s3'] as Map<String, dynamic>)
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
