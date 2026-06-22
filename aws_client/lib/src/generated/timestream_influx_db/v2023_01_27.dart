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

import 'v2023_01_27.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Timestream for InfluxDB is a managed time-series database engine that
/// makes it easy for application developers and DevOps teams to run InfluxDB
/// databases on Amazon Web Services for near real-time time-series applications
/// using open-source APIs. With Amazon Timestream for InfluxDB, it is easy to
/// set up, operate, and scale time-series workloads that can answer queries
/// with single-digit millisecond query response time.
class TimestreamInfluxDB {
  final _s.JsonProtocol _protocol;
  factory TimestreamInfluxDB({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'timestream-influxdb',
    );
    return TimestreamInfluxDB._(
      protocol: _s.JsonProtocol(
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
  TimestreamInfluxDB._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// A list of tags applied to the resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the tagged resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Tags are composed of a Key/Value pairs. You can use tags to categorize and
  /// track your Timestream for InfluxDB resources.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the tagged resource.
  ///
  /// Parameter [tags] :
  /// A list of tags used to categorize and track resources.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Removes the tag from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the tagged resource.
  ///
  /// Parameter [tagKeys] :
  /// The keys used to identify the tags.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Creates a new Timestream for InfluxDB cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dbInstanceType] :
  /// The Timestream for InfluxDB DB instance type to run InfluxDB on.
  ///
  /// Parameter [name] :
  /// The name that uniquely identifies the DB cluster when interacting with the
  /// Amazon Timestream for InfluxDB API and CLI commands. This name will also
  /// be a prefix included in the endpoint. DB cluster names must be unique per
  /// customer and per region.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security group IDs to associate with the Timestream for
  /// InfluxDB cluster.
  ///
  /// Parameter [vpcSubnetIds] :
  /// A list of VPC subnet IDs to associate with the DB cluster. Provide at
  /// least two VPC subnet IDs in different Availability Zones when deploying
  /// with a Multi-AZ standby.
  ///
  /// Parameter [allocatedStorage] :
  /// The amount of storage to allocate for your DB storage type in GiB
  /// (gibibytes).
  ///
  /// Parameter [bucket] :
  /// The name of the initial InfluxDB bucket. All InfluxDB data is stored in a
  /// bucket. A bucket combines the concept of a database and a retention period
  /// (the duration of time that each data point persists). A bucket belongs to
  /// an organization.
  ///
  /// Parameter [dbParameterGroupIdentifier] :
  /// The ID of the DB parameter group to assign to your DB cluster. DB
  /// parameter groups specify how the database is configured. For example, DB
  /// parameter groups can specify the limit for query concurrency.
  ///
  /// Parameter [dbStorageType] :
  /// The Timestream for InfluxDB DB storage type to read and write InfluxDB
  /// data.
  ///
  /// You can choose between three different types of provisioned Influx IOPS
  /// Included storage according to your workload requirements:
  ///
  /// <ul>
  /// <li>
  /// Influx I/O Included 3000 IOPS
  /// </li>
  /// <li>
  /// Influx I/O Included 12000 IOPS
  /// </li>
  /// <li>
  /// Influx I/O Included 16000 IOPS
  /// </li>
  /// </ul>
  ///
  /// Parameter [deploymentType] :
  /// Specifies the type of cluster to create.
  ///
  /// Parameter [failoverMode] :
  /// Specifies the behavior of failure recovery when the primary node of the
  /// cluster fails.
  ///
  /// Parameter [logDeliveryConfiguration] :
  /// Configuration for sending InfluxDB engine logs to a specified S3 bucket.
  ///
  /// Parameter [maintenanceSchedule] :
  /// Specifies the maintenance schedule for the DB cluster, including the
  /// preferred maintenance window and timezone.
  ///
  /// Parameter [networkType] :
  /// Specifies whether the network type of the Timestream for InfluxDB cluster
  /// is IPv4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  ///
  /// Parameter [organization] :
  /// The name of the initial organization for the initial admin user in
  /// InfluxDB. An InfluxDB organization is a workspace for a group of users.
  ///
  /// Parameter [password] :
  /// The password of the initial admin user created in InfluxDB. This password
  /// will allow you to access the InfluxDB UI to perform various administrative
  /// tasks and also use the InfluxDB CLI to create an operator token. These
  /// attributes will be stored in a secret created in Secrets Manager in your
  /// account.
  ///
  /// Parameter [port] :
  /// The port number on which InfluxDB accepts connections.
  ///
  /// Valid Values: 1024-65535
  ///
  /// Default: 8086 for InfluxDB v2, 8181 for InfluxDB v3
  ///
  /// Constraints: The value can't be 2375-2376, 7788-7799, 8090, or 51678-51680
  ///
  /// Parameter [publiclyAccessible] :
  /// Configures the Timestream for InfluxDB cluster with a public IP to
  /// facilitate access from outside the VPC.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the DB instance.
  ///
  /// Parameter [username] :
  /// The username of the initial admin user created in InfluxDB. Must start
  /// with a letter and can't end with a hyphen or contain two consecutive
  /// hyphens. For example, my-user1. This username will allow you to access the
  /// InfluxDB UI to perform various administrative tasks and also use the
  /// InfluxDB CLI to create an operator token. These attributes will be stored
  /// in a secret created in Secrets Manager in your account.
  Future<CreateDbClusterOutput> createDbCluster({
    required DbInstanceType dbInstanceType,
    required String name,
    required List<String> vpcSecurityGroupIds,
    required List<String> vpcSubnetIds,
    int? allocatedStorage,
    String? bucket,
    String? dbParameterGroupIdentifier,
    DbStorageType? dbStorageType,
    ClusterDeploymentType? deploymentType,
    FailoverMode? failoverMode,
    LogDeliveryConfiguration? logDeliveryConfiguration,
    MaintenanceSchedule? maintenanceSchedule,
    NetworkType? networkType,
    String? organization,
    String? password,
    int? port,
    bool? publiclyAccessible,
    Map<String, String>? tags,
    String? username,
  }) async {
    _s.validateNumRange(
      'allocatedStorage',
      allocatedStorage,
      20,
      15360,
    );
    _s.validateNumRange(
      'port',
      port,
      1024,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.CreateDbCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dbInstanceType': dbInstanceType.value,
        'name': name,
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
        'vpcSubnetIds': vpcSubnetIds,
        if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
        if (bucket != null) 'bucket': bucket,
        if (dbParameterGroupIdentifier != null)
          'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
        if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
        if (deploymentType != null) 'deploymentType': deploymentType.value,
        if (failoverMode != null) 'failoverMode': failoverMode.value,
        if (logDeliveryConfiguration != null)
          'logDeliveryConfiguration': logDeliveryConfiguration,
        if (maintenanceSchedule != null)
          'maintenanceSchedule': maintenanceSchedule,
        if (networkType != null) 'networkType': networkType.value,
        if (organization != null) 'organization': organization,
        if (password != null) 'password': password,
        if (port != null) 'port': port,
        if (publiclyAccessible != null)
          'publiclyAccessible': publiclyAccessible,
        if (tags != null) 'tags': tags,
        if (username != null) 'username': username,
      },
    );

    return CreateDbClusterOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a Timestream for InfluxDB cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dbClusterId] :
  /// Service-generated unique identifier of the DB cluster to retrieve.
  Future<GetDbClusterOutput> getDbCluster({
    required String dbClusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.GetDbCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dbClusterId': dbClusterId,
      },
    );

    return GetDbClusterOutput.fromJson(jsonResponse.body);
  }

  /// Updates a Timestream for InfluxDB cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dbClusterId] :
  /// Service-generated unique identifier of the DB cluster to update.
  ///
  /// Parameter [dbInstanceType] :
  /// Update the DB cluster to use the specified DB instance Type.
  ///
  /// Parameter [dbParameterGroupIdentifier] :
  /// Update the DB cluster to use the specified DB parameter group.
  ///
  /// Parameter [failoverMode] :
  /// Update the DB cluster's failover behavior.
  ///
  /// Parameter [logDeliveryConfiguration] :
  /// The log delivery configuration to apply to the DB cluster.
  ///
  /// Parameter [maintenanceSchedule] :
  /// Specifies the maintenance schedule for the DB cluster, including the
  /// preferred maintenance window and timezone.
  ///
  /// Parameter [port] :
  /// Update the DB cluster to use the specified port.
  Future<UpdateDbClusterOutput> updateDbCluster({
    required String dbClusterId,
    DbInstanceType? dbInstanceType,
    String? dbParameterGroupIdentifier,
    FailoverMode? failoverMode,
    LogDeliveryConfiguration? logDeliveryConfiguration,
    MaintenanceSchedule? maintenanceSchedule,
    int? port,
  }) async {
    _s.validateNumRange(
      'port',
      port,
      1024,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.UpdateDbCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dbClusterId': dbClusterId,
        if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
        if (dbParameterGroupIdentifier != null)
          'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
        if (failoverMode != null) 'failoverMode': failoverMode.value,
        if (logDeliveryConfiguration != null)
          'logDeliveryConfiguration': logDeliveryConfiguration,
        if (maintenanceSchedule != null)
          'maintenanceSchedule': maintenanceSchedule,
        if (port != null) 'port': port,
      },
    );

    return UpdateDbClusterOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a Timestream for InfluxDB cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dbClusterId] :
  /// Service-generated unique identifier of the DB cluster.
  Future<DeleteDbClusterOutput> deleteDbCluster({
    required String dbClusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.DeleteDbCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dbClusterId': dbClusterId,
      },
    );

    return DeleteDbClusterOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of Timestream for InfluxDB DB clusters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the output. If the total number
  /// of items available is more than the value specified, a nextToken is
  /// provided in the output. To resume pagination, provide the nextToken value
  /// as an argument of a subsequent API invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the nextToken value as
  /// an argument of a subsequent API invocation.
  Future<ListDbClustersOutput> listDbClusters({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.ListDbClusters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDbClustersOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of Timestream for InfluxDB clusters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dbClusterId] :
  /// Service-generated unique identifier of the DB cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the output. If the total number
  /// of items available is more than the value specified, a nextToken is
  /// provided in the output. To resume pagination, provide the nextToken value
  /// as an argument of a subsequent API invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the nextToken value as
  /// an argument of a subsequent API invocation.
  Future<ListDbInstancesForClusterOutput> listDbInstancesForCluster({
    required String dbClusterId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.ListDbInstancesForCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dbClusterId': dbClusterId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDbInstancesForClusterOutput.fromJson(jsonResponse.body);
  }

  /// Reboots a Timestream for InfluxDB cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dbClusterId] :
  /// Service-generated unique identifier of the DB cluster to reboot.
  ///
  /// Parameter [instanceIds] :
  /// A list of service-generated unique DB Instance Ids belonging to the DB
  /// Cluster to reboot.
  Future<RebootDbClusterOutput> rebootDbCluster({
    required String dbClusterId,
    List<String>? instanceIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.RebootDbCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dbClusterId': dbClusterId,
        if (instanceIds != null) 'instanceIds': instanceIds,
      },
    );

    return RebootDbClusterOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new Timestream for InfluxDB DB instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allocatedStorage] :
  /// The amount of storage to allocate for your DB storage type in GiB
  /// (gibibytes).
  ///
  /// Parameter [dbInstanceType] :
  /// The Timestream for InfluxDB DB instance type to run InfluxDB on.
  ///
  /// Parameter [name] :
  /// The name that uniquely identifies the DB instance when interacting with
  /// the Amazon Timestream for InfluxDB API and CLI commands. This name will
  /// also be a prefix included in the endpoint. DB instance names must be
  /// unique per customer and per region.
  ///
  /// Parameter [password] :
  /// The password of the initial admin user created in InfluxDB v2. This
  /// password will allow you to access the InfluxDB UI to perform various
  /// administrative tasks and also use the InfluxDB CLI to create an operator
  /// token. These attributes will be stored in a Secret created in Secrets
  /// Manager in your account.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// A list of VPC security group IDs to associate with the DB instance.
  ///
  /// Parameter [vpcSubnetIds] :
  /// A list of VPC subnet IDs to associate with the DB instance. Provide at
  /// least two VPC subnet IDs in different availability zones when deploying
  /// with a Multi-AZ standby.
  ///
  /// Parameter [bucket] :
  /// The name of the initial InfluxDB bucket. All InfluxDB data is stored in a
  /// bucket. A bucket combines the concept of a database and a retention period
  /// (the duration of time that each data point persists). A bucket belongs to
  /// an organization.
  ///
  /// Parameter [dbParameterGroupIdentifier] :
  /// The id of the DB parameter group to assign to your DB instance. DB
  /// parameter groups specify how the database is configured. For example, DB
  /// parameter groups can specify the limit for query concurrency.
  ///
  /// Parameter [dbStorageType] :
  /// The Timestream for InfluxDB DB storage type to read and write InfluxDB
  /// data.
  ///
  /// You can choose between 3 different types of provisioned Influx IOPS
  /// included storage according to your workloads requirements:
  ///
  /// <ul>
  /// <li>
  /// Influx IO Included 3000 IOPS
  /// </li>
  /// <li>
  /// Influx IO Included 12000 IOPS
  /// </li>
  /// <li>
  /// Influx IO Included 16000 IOPS
  /// </li>
  /// </ul>
  ///
  /// Parameter [deploymentType] :
  /// Specifies whether the DB instance will be deployed as a standalone
  /// instance or with a Multi-AZ standby for high availability.
  ///
  /// Parameter [logDeliveryConfiguration] :
  /// Configuration for sending InfluxDB engine logs to a specified S3 bucket.
  ///
  /// Parameter [maintenanceSchedule] :
  /// Specifies the maintenance schedule for the DB instance, including the
  /// preferred maintenance window and timezone.
  ///
  /// Parameter [networkType] :
  /// Specifies whether the networkType of the Timestream for InfluxDB instance
  /// is IPV4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  ///
  /// Parameter [organization] :
  /// The name of the initial organization for the initial admin user in
  /// InfluxDB. An InfluxDB organization is a workspace for a group of users.
  ///
  /// Parameter [port] :
  /// The port number on which InfluxDB accepts connections.
  ///
  /// Valid Values: 1024-65535
  ///
  /// Default: 8086
  ///
  /// Constraints: The value can't be 2375-2376, 7788-7799, 8090, or 51678-51680
  ///
  /// Parameter [publiclyAccessible] :
  /// Configures the DB instance with a public IP to facilitate access.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the DB instance.
  ///
  /// Parameter [username] :
  /// The username of the initial admin user created in InfluxDB. Must start
  /// with a letter and can't end with a hyphen or contain two consecutive
  /// hyphens. For example, my-user1. This username will allow you to access the
  /// InfluxDB UI to perform various administrative tasks and also use the
  /// InfluxDB CLI to create an operator token. These attributes will be stored
  /// in a Secret created in Amazon Secrets Manager in your account.
  Future<CreateDbInstanceOutput> createDbInstance({
    required int allocatedStorage,
    required DbInstanceType dbInstanceType,
    required String name,
    required String password,
    required List<String> vpcSecurityGroupIds,
    required List<String> vpcSubnetIds,
    String? bucket,
    String? dbParameterGroupIdentifier,
    DbStorageType? dbStorageType,
    DeploymentType? deploymentType,
    LogDeliveryConfiguration? logDeliveryConfiguration,
    MaintenanceSchedule? maintenanceSchedule,
    NetworkType? networkType,
    String? organization,
    int? port,
    bool? publiclyAccessible,
    Map<String, String>? tags,
    String? username,
  }) async {
    _s.validateNumRange(
      'allocatedStorage',
      allocatedStorage,
      20,
      15360,
      isRequired: true,
    );
    _s.validateNumRange(
      'port',
      port,
      1024,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.CreateDbInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'allocatedStorage': allocatedStorage,
        'dbInstanceType': dbInstanceType.value,
        'name': name,
        'password': password,
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
        'vpcSubnetIds': vpcSubnetIds,
        if (bucket != null) 'bucket': bucket,
        if (dbParameterGroupIdentifier != null)
          'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
        if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
        if (deploymentType != null) 'deploymentType': deploymentType.value,
        if (logDeliveryConfiguration != null)
          'logDeliveryConfiguration': logDeliveryConfiguration,
        if (maintenanceSchedule != null)
          'maintenanceSchedule': maintenanceSchedule,
        if (networkType != null) 'networkType': networkType.value,
        if (organization != null) 'organization': organization,
        if (port != null) 'port': port,
        if (publiclyAccessible != null)
          'publiclyAccessible': publiclyAccessible,
        if (tags != null) 'tags': tags,
        if (username != null) 'username': username,
      },
    );

    return CreateDbInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Returns a Timestream for InfluxDB DB instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the DB instance.
  Future<GetDbInstanceOutput> getDbInstance({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.GetDbInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );

    return GetDbInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Updates a Timestream for InfluxDB DB instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the DB instance.
  ///
  /// Parameter [allocatedStorage] :
  /// The amount of storage to allocate for your DB storage type (in gibibytes).
  ///
  /// Parameter [dbInstanceType] :
  /// The Timestream for InfluxDB DB instance type to run InfluxDB on.
  ///
  /// Parameter [dbParameterGroupIdentifier] :
  /// The id of the DB parameter group to assign to your DB instance. DB
  /// parameter groups specify how the database is configured. For example, DB
  /// parameter groups can specify the limit for query concurrency.
  ///
  /// Parameter [dbStorageType] :
  /// The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
  ///
  /// Parameter [deploymentType] :
  /// Specifies whether the DB instance will be deployed as a standalone
  /// instance or with a Multi-AZ standby for high availability.
  ///
  /// Parameter [logDeliveryConfiguration] :
  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  ///
  /// Parameter [maintenanceSchedule] :
  /// Specifies the maintenance schedule for the DB instance, including the
  /// preferred maintenance window and timezone.
  ///
  /// Parameter [port] :
  /// The port number on which InfluxDB accepts connections.
  ///
  /// If you change the Port value, your database restarts immediately.
  ///
  /// Valid Values: 1024-65535
  ///
  /// Default: 8086
  ///
  /// Constraints: The value can't be 2375-2376, 7788-7799, 8090, or 51678-51680
  Future<UpdateDbInstanceOutput> updateDbInstance({
    required String identifier,
    int? allocatedStorage,
    DbInstanceType? dbInstanceType,
    String? dbParameterGroupIdentifier,
    DbStorageType? dbStorageType,
    DeploymentType? deploymentType,
    LogDeliveryConfiguration? logDeliveryConfiguration,
    MaintenanceSchedule? maintenanceSchedule,
    int? port,
  }) async {
    _s.validateNumRange(
      'allocatedStorage',
      allocatedStorage,
      20,
      15360,
    );
    _s.validateNumRange(
      'port',
      port,
      1024,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.UpdateDbInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
        if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
        if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
        if (dbParameterGroupIdentifier != null)
          'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
        if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
        if (deploymentType != null) 'deploymentType': deploymentType.value,
        if (logDeliveryConfiguration != null)
          'logDeliveryConfiguration': logDeliveryConfiguration,
        if (maintenanceSchedule != null)
          'maintenanceSchedule': maintenanceSchedule,
        if (port != null) 'port': port,
      },
    );

    return UpdateDbInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a Timestream for InfluxDB DB instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the DB instance.
  Future<DeleteDbInstanceOutput> deleteDbInstance({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.DeleteDbInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );

    return DeleteDbInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of Timestream for InfluxDB DB instances.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the output. If the total number
  /// of items available is more than the value specified, a NextToken is
  /// provided in the output. To resume pagination, provide the NextToken value
  /// as argument of a subsequent API invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the NextToken value as
  /// argument of a subsequent API invocation.
  Future<ListDbInstancesOutput> listDbInstances({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.ListDbInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDbInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Reboots a Timestream for InfluxDB instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the DB instance to reboot.
  Future<RebootDbInstanceOutput> rebootDbInstance({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.RebootDbInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );

    return RebootDbInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new Timestream for InfluxDB DB parameter group to associate with
  /// DB instances.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the DB parameter group. The name must be unique per customer
  /// and per region.
  ///
  /// Parameter [description] :
  /// A description of the DB parameter group.
  ///
  /// Parameter [parameters] :
  /// A list of the parameters that comprise the DB parameter group.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the DB parameter group.
  Future<CreateDbParameterGroupOutput> createDbParameterGroup({
    required String name,
    String? description,
    Parameters? parameters,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.CreateDbParameterGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (parameters != null) 'parameters': parameters,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDbParameterGroupOutput.fromJson(jsonResponse.body);
  }

  /// Returns a Timestream for InfluxDB DB parameter group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the DB parameter group.
  Future<GetDbParameterGroupOutput> getDbParameterGroup({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.GetDbParameterGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );

    return GetDbParameterGroupOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of Timestream for InfluxDB DB parameter groups.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the output. If the total number
  /// of items available is more than the value specified, a NextToken is
  /// provided in the output. To resume pagination, provide the NextToken value
  /// as argument of a subsequent API invocation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. To resume pagination, provide the NextToken value as
  /// argument of a subsequent API invocation.
  Future<ListDbParameterGroupsOutput> listDbParameterGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonTimestreamInfluxDB.ListDbParameterGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDbParameterGroupsOutput.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// A list of tags used to categorize and track resources.
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
class CreateDbClusterOutput {
  /// A service-generated unique identifier.
  final String? dbClusterId;

  /// The status of the DB cluster.
  final ClusterStatus? dbClusterStatus;

  CreateDbClusterOutput({
    this.dbClusterId,
    this.dbClusterStatus,
  });

  factory CreateDbClusterOutput.fromJson(Map<String, dynamic> json) {
    return CreateDbClusterOutput(
      dbClusterId: json['dbClusterId'] as String?,
      dbClusterStatus:
          (json['dbClusterStatus'] as String?)?.let(ClusterStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dbClusterId = this.dbClusterId;
    final dbClusterStatus = this.dbClusterStatus;
    return {
      if (dbClusterId != null) 'dbClusterId': dbClusterId,
      if (dbClusterStatus != null) 'dbClusterStatus': dbClusterStatus.value,
    };
  }
}

/// @nodoc
class GetDbClusterOutput {
  /// The Amazon Resource Name (ARN) of the DB cluster.
  final String arn;

  /// Service-generated unique identifier of the DB cluster to retrieve.
  final String id;

  /// Customer-supplied name of the Timestream for InfluxDB cluster.
  final String name;

  /// The amount of storage allocated for your DB storage type (in gibibytes).
  final int? allocatedStorage;

  /// Configuration for node modes in the DbCluster.
  final ClusterConfiguration? clusterConfiguration;

  /// The Timestream for InfluxDB instance type that InfluxDB runs on.
  final DbInstanceType? dbInstanceType;

  /// The ID of the DB parameter group assigned to your DB cluster.
  final String? dbParameterGroupIdentifier;

  /// The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
  final DbStorageType? dbStorageType;

  /// Deployment type of the DB cluster.
  final ClusterDeploymentType? deploymentType;

  /// The endpoint used to connect to the Timestream for InfluxDB cluster for
  /// write and read operations.
  final String? endpoint;

  /// The engine type of your DB cluster.
  final EngineType? engineType;

  /// The configured failover mode for the DB cluster.
  final FailoverMode? failoverMode;

  /// The Amazon Resource Name (ARN) of the Secrets Manager secret containing the
  /// initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// The timestamp of the last completed maintenance operation on the DB cluster.
  final DateTime? lastMaintenanceTime;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

  /// The maintenance schedule for the DB cluster.
  final MaintenanceSchedule? maintenanceSchedule;

  /// Specifies whether the network type of the Timestream for InfluxDB cluster is
  /// IPv4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  final NetworkType? networkType;

  /// The timestamp of the next scheduled maintenance operation on the DB cluster.
  final DateTime? nextMaintenanceTime;

  /// The port number on which InfluxDB accepts connections.
  final int? port;

  /// Indicates if the DB cluster has a public IP to facilitate access from
  /// outside the VPC.
  final bool? publiclyAccessible;

  /// The endpoint used to connect to the Timestream for InfluxDB cluster for
  /// read-only operations.
  final String? readerEndpoint;

  /// The status of the DB cluster.
  final ClusterStatus? status;

  /// A list of VPC security group IDs associated with the DB cluster.
  final List<String>? vpcSecurityGroupIds;

  /// A list of VPC subnet IDs associated with the DB cluster.
  final List<String>? vpcSubnetIds;

  GetDbClusterOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.allocatedStorage,
    this.clusterConfiguration,
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.engineType,
    this.failoverMode,
    this.influxAuthParametersSecretArn,
    this.lastMaintenanceTime,
    this.logDeliveryConfiguration,
    this.maintenanceSchedule,
    this.networkType,
    this.nextMaintenanceTime,
    this.port,
    this.publiclyAccessible,
    this.readerEndpoint,
    this.status,
    this.vpcSecurityGroupIds,
    this.vpcSubnetIds,
  });

  factory GetDbClusterOutput.fromJson(Map<String, dynamic> json) {
    return GetDbClusterOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      allocatedStorage: json['allocatedStorage'] as int?,
      clusterConfiguration: json['clusterConfiguration'] != null
          ? ClusterConfiguration.fromJson(
              json['clusterConfiguration'] as Map<String, dynamic>)
          : null,
      dbInstanceType:
          (json['dbInstanceType'] as String?)?.let(DbInstanceType.fromString),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType:
          (json['dbStorageType'] as String?)?.let(DbStorageType.fromString),
      deploymentType: (json['deploymentType'] as String?)
          ?.let(ClusterDeploymentType.fromString),
      endpoint: json['endpoint'] as String?,
      engineType: (json['engineType'] as String?)?.let(EngineType.fromString),
      failoverMode:
          (json['failoverMode'] as String?)?.let(FailoverMode.fromString),
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      lastMaintenanceTime: timeStampFromJson(json['lastMaintenanceTime']),
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      nextMaintenanceTime: timeStampFromJson(json['nextMaintenanceTime']),
      port: json['port'] as int?,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      readerEndpoint: json['readerEndpoint'] as String?,
      status: (json['status'] as String?)?.let(ClusterStatus.fromString),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcSubnetIds: (json['vpcSubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final allocatedStorage = this.allocatedStorage;
    final clusterConfiguration = this.clusterConfiguration;
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final engineType = this.engineType;
    final failoverMode = this.failoverMode;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final lastMaintenanceTime = this.lastMaintenanceTime;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
    final maintenanceSchedule = this.maintenanceSchedule;
    final networkType = this.networkType;
    final nextMaintenanceTime = this.nextMaintenanceTime;
    final port = this.port;
    final publiclyAccessible = this.publiclyAccessible;
    final readerEndpoint = this.readerEndpoint;
    final status = this.status;
    final vpcSecurityGroupIds = this.vpcSecurityGroupIds;
    final vpcSubnetIds = this.vpcSubnetIds;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (clusterConfiguration != null)
        'clusterConfiguration': clusterConfiguration,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
      if (deploymentType != null) 'deploymentType': deploymentType.value,
      if (endpoint != null) 'endpoint': endpoint,
      if (engineType != null) 'engineType': engineType.value,
      if (failoverMode != null) 'failoverMode': failoverMode.value,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (lastMaintenanceTime != null)
        'lastMaintenanceTime': iso8601ToJson(lastMaintenanceTime),
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (networkType != null) 'networkType': networkType.value,
      if (nextMaintenanceTime != null)
        'nextMaintenanceTime': iso8601ToJson(nextMaintenanceTime),
      if (port != null) 'port': port,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (readerEndpoint != null) 'readerEndpoint': readerEndpoint,
      if (status != null) 'status': status.value,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
      if (vpcSubnetIds != null) 'vpcSubnetIds': vpcSubnetIds,
    };
  }
}

/// @nodoc
class UpdateDbClusterOutput {
  /// The status of the DB cluster.
  final ClusterStatus? dbClusterStatus;

  UpdateDbClusterOutput({
    this.dbClusterStatus,
  });

  factory UpdateDbClusterOutput.fromJson(Map<String, dynamic> json) {
    return UpdateDbClusterOutput(
      dbClusterStatus:
          (json['dbClusterStatus'] as String?)?.let(ClusterStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dbClusterStatus = this.dbClusterStatus;
    return {
      if (dbClusterStatus != null) 'dbClusterStatus': dbClusterStatus.value,
    };
  }
}

/// @nodoc
class DeleteDbClusterOutput {
  /// The status of the DB cluster.
  final ClusterStatus? dbClusterStatus;

  DeleteDbClusterOutput({
    this.dbClusterStatus,
  });

  factory DeleteDbClusterOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDbClusterOutput(
      dbClusterStatus:
          (json['dbClusterStatus'] as String?)?.let(ClusterStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dbClusterStatus = this.dbClusterStatus;
    return {
      if (dbClusterStatus != null) 'dbClusterStatus': dbClusterStatus.value,
    };
  }
}

/// @nodoc
class ListDbClustersOutput {
  /// A list of Timestream for InfluxDB cluster summaries.
  final List<DbClusterSummary> items;

  /// Token from a previous call of the operation. When this value is provided,
  /// the service returns results from where the previous response left off.
  final String? nextToken;

  ListDbClustersOutput({
    required this.items,
    this.nextToken,
  });

  factory ListDbClustersOutput.fromJson(Map<String, dynamic> json) {
    return ListDbClustersOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => DbClusterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListDbInstancesForClusterOutput {
  /// A list of Timestream for InfluxDB instance summaries belonging to the
  /// cluster.
  final List<DbInstanceForClusterSummary> items;

  /// Token from a previous call of the operation. When this value is provided,
  /// the service returns results from where the previous response left off.
  final String? nextToken;

  ListDbInstancesForClusterOutput({
    required this.items,
    this.nextToken,
  });

  factory ListDbInstancesForClusterOutput.fromJson(Map<String, dynamic> json) {
    return ListDbInstancesForClusterOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              DbInstanceForClusterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class RebootDbClusterOutput {
  /// The status of the DB Cluster.
  final ClusterStatus? dbClusterStatus;

  RebootDbClusterOutput({
    this.dbClusterStatus,
  });

  factory RebootDbClusterOutput.fromJson(Map<String, dynamic> json) {
    return RebootDbClusterOutput(
      dbClusterStatus:
          (json['dbClusterStatus'] as String?)?.let(ClusterStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dbClusterStatus = this.dbClusterStatus;
    return {
      if (dbClusterStatus != null) 'dbClusterStatus': dbClusterStatus.value,
    };
  }
}

/// @nodoc
class CreateDbInstanceOutput {
  /// The Amazon Resource Name (ARN) of the DB instance.
  final String arn;

  /// A service-generated unique identifier.
  final String id;

  /// The customer-supplied name that uniquely identifies the DB instance when
  /// interacting with the Amazon Timestream for InfluxDB API and CLI commands.
  final String name;

  /// A list of VPC subnet IDs associated with the DB instance.
  final List<String> vpcSubnetIds;

  /// The amount of storage allocated for your DB storage type (in gibibytes).
  final int? allocatedStorage;

  /// The Availability Zone in which the DB instance resides.
  final String? availabilityZone;

  /// Specifies the DbCluster to which this DbInstance belongs to.
  final String? dbClusterId;

  /// The Timestream for InfluxDB instance type that InfluxDB runs on.
  final DbInstanceType? dbInstanceType;

  /// The id of the DB parameter group assigned to your DB instance.
  final String? dbParameterGroupIdentifier;

  /// The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
  final DbStorageType? dbStorageType;

  /// Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or
  /// with a MultiAZ Standby for High availability.
  final DeploymentType? deploymentType;

  /// The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
  final String? endpoint;

  /// The Amazon Resource Name (ARN) of the Secrets Manager secret containing the
  /// initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// Specifies the DbInstance's role in the cluster.
  final InstanceMode? instanceMode;

  /// Specifies the DbInstance's roles in the cluster.
  final List<InstanceMode>? instanceModes;

  /// The timestamp of the last completed maintenance operation on the DB
  /// instance.
  final DateTime? lastMaintenanceTime;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

  /// The maintenance schedule for the DB instance.
  final MaintenanceSchedule? maintenanceSchedule;

  /// Specifies whether the networkType of the Timestream for InfluxDB instance is
  /// IPV4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  final NetworkType? networkType;

  /// The timestamp of the next scheduled maintenance operation on the DB
  /// instance.
  final DateTime? nextMaintenanceTime;

  /// The port number on which InfluxDB accepts connections. The default value is
  /// 8086.
  final int? port;

  /// Indicates if the DB instance has a public IP to facilitate access.
  final bool? publiclyAccessible;

  /// The Availability Zone in which the standby instance is located when
  /// deploying with a MultiAZ standby instance.
  final String? secondaryAvailabilityZone;

  /// The status of the DB instance.
  final Status? status;

  /// A list of VPC security group IDs associated with the DB instance.
  final List<String>? vpcSecurityGroupIds;

  CreateDbInstanceOutput({
    required this.arn,
    required this.id,
    required this.name,
    required this.vpcSubnetIds,
    this.allocatedStorage,
    this.availabilityZone,
    this.dbClusterId,
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.influxAuthParametersSecretArn,
    this.instanceMode,
    this.instanceModes,
    this.lastMaintenanceTime,
    this.logDeliveryConfiguration,
    this.maintenanceSchedule,
    this.networkType,
    this.nextMaintenanceTime,
    this.port,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.status,
    this.vpcSecurityGroupIds,
  });

  factory CreateDbInstanceOutput.fromJson(Map<String, dynamic> json) {
    return CreateDbInstanceOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      vpcSubnetIds: ((json['vpcSubnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allocatedStorage: json['allocatedStorage'] as int?,
      availabilityZone: json['availabilityZone'] as String?,
      dbClusterId: json['dbClusterId'] as String?,
      dbInstanceType:
          (json['dbInstanceType'] as String?)?.let(DbInstanceType.fromString),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType:
          (json['dbStorageType'] as String?)?.let(DbStorageType.fromString),
      deploymentType:
          (json['deploymentType'] as String?)?.let(DeploymentType.fromString),
      endpoint: json['endpoint'] as String?,
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      instanceMode:
          (json['instanceMode'] as String?)?.let(InstanceMode.fromString),
      instanceModes: (json['instanceModes'] as List?)
          ?.nonNulls
          .map((e) => InstanceMode.fromString((e as String)))
          .toList(),
      lastMaintenanceTime: timeStampFromJson(json['lastMaintenanceTime']),
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      nextMaintenanceTime: timeStampFromJson(json['nextMaintenanceTime']),
      port: json['port'] as int?,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final vpcSubnetIds = this.vpcSubnetIds;
    final allocatedStorage = this.allocatedStorage;
    final availabilityZone = this.availabilityZone;
    final dbClusterId = this.dbClusterId;
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final instanceMode = this.instanceMode;
    final instanceModes = this.instanceModes;
    final lastMaintenanceTime = this.lastMaintenanceTime;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
    final maintenanceSchedule = this.maintenanceSchedule;
    final networkType = this.networkType;
    final nextMaintenanceTime = this.nextMaintenanceTime;
    final port = this.port;
    final publiclyAccessible = this.publiclyAccessible;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final status = this.status;
    final vpcSecurityGroupIds = this.vpcSecurityGroupIds;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'vpcSubnetIds': vpcSubnetIds,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (dbClusterId != null) 'dbClusterId': dbClusterId,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
      if (deploymentType != null) 'deploymentType': deploymentType.value,
      if (endpoint != null) 'endpoint': endpoint,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (instanceMode != null) 'instanceMode': instanceMode.value,
      if (instanceModes != null)
        'instanceModes': instanceModes.map((e) => e.value).toList(),
      if (lastMaintenanceTime != null)
        'lastMaintenanceTime': iso8601ToJson(lastMaintenanceTime),
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (networkType != null) 'networkType': networkType.value,
      if (nextMaintenanceTime != null)
        'nextMaintenanceTime': iso8601ToJson(nextMaintenanceTime),
      if (port != null) 'port': port,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (status != null) 'status': status.value,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
  }
}

/// @nodoc
class GetDbInstanceOutput {
  /// The Amazon Resource Name (ARN) of the DB instance.
  final String arn;

  /// A service-generated unique identifier.
  final String id;

  /// The customer-supplied name that uniquely identifies the DB instance when
  /// interacting with the Amazon Timestream for InfluxDB API and CLI commands.
  final String name;

  /// A list of VPC subnet IDs associated with the DB instance.
  final List<String> vpcSubnetIds;

  /// The amount of storage allocated for your DB storage type (in gibibytes).
  final int? allocatedStorage;

  /// The Availability Zone in which the DB instance resides.
  final String? availabilityZone;

  /// Specifies the DbCluster to which this DbInstance belongs to.
  final String? dbClusterId;

  /// The Timestream for InfluxDB instance type that InfluxDB runs on.
  final DbInstanceType? dbInstanceType;

  /// The id of the DB parameter group assigned to your DB instance.
  final String? dbParameterGroupIdentifier;

  /// The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
  final DbStorageType? dbStorageType;

  /// Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or
  /// with a MultiAZ Standby for High availability.
  final DeploymentType? deploymentType;

  /// The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
  final String? endpoint;

  /// The Amazon Resource Name (ARN) of the Secrets Manager secret containing the
  /// initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// Specifies the DbInstance's role in the cluster.
  final InstanceMode? instanceMode;

  /// Specifies the DbInstance's roles in the cluster.
  final List<InstanceMode>? instanceModes;

  /// The timestamp of the last completed maintenance operation on the DB
  /// instance.
  final DateTime? lastMaintenanceTime;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

  /// The maintenance schedule for the DB instance.
  final MaintenanceSchedule? maintenanceSchedule;

  /// Specifies whether the networkType of the Timestream for InfluxDB instance is
  /// IPV4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  final NetworkType? networkType;

  /// The timestamp of the next scheduled maintenance operation on the DB
  /// instance.
  final DateTime? nextMaintenanceTime;

  /// The port number on which InfluxDB accepts connections.
  final int? port;

  /// Indicates if the DB instance has a public IP to facilitate access.
  final bool? publiclyAccessible;

  /// The Availability Zone in which the standby instance is located when
  /// deploying with a MultiAZ standby instance.
  final String? secondaryAvailabilityZone;

  /// The status of the DB instance.
  final Status? status;

  /// A list of VPC security group IDs associated with the DB instance.
  final List<String>? vpcSecurityGroupIds;

  GetDbInstanceOutput({
    required this.arn,
    required this.id,
    required this.name,
    required this.vpcSubnetIds,
    this.allocatedStorage,
    this.availabilityZone,
    this.dbClusterId,
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.influxAuthParametersSecretArn,
    this.instanceMode,
    this.instanceModes,
    this.lastMaintenanceTime,
    this.logDeliveryConfiguration,
    this.maintenanceSchedule,
    this.networkType,
    this.nextMaintenanceTime,
    this.port,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.status,
    this.vpcSecurityGroupIds,
  });

  factory GetDbInstanceOutput.fromJson(Map<String, dynamic> json) {
    return GetDbInstanceOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      vpcSubnetIds: ((json['vpcSubnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allocatedStorage: json['allocatedStorage'] as int?,
      availabilityZone: json['availabilityZone'] as String?,
      dbClusterId: json['dbClusterId'] as String?,
      dbInstanceType:
          (json['dbInstanceType'] as String?)?.let(DbInstanceType.fromString),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType:
          (json['dbStorageType'] as String?)?.let(DbStorageType.fromString),
      deploymentType:
          (json['deploymentType'] as String?)?.let(DeploymentType.fromString),
      endpoint: json['endpoint'] as String?,
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      instanceMode:
          (json['instanceMode'] as String?)?.let(InstanceMode.fromString),
      instanceModes: (json['instanceModes'] as List?)
          ?.nonNulls
          .map((e) => InstanceMode.fromString((e as String)))
          .toList(),
      lastMaintenanceTime: timeStampFromJson(json['lastMaintenanceTime']),
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      nextMaintenanceTime: timeStampFromJson(json['nextMaintenanceTime']),
      port: json['port'] as int?,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final vpcSubnetIds = this.vpcSubnetIds;
    final allocatedStorage = this.allocatedStorage;
    final availabilityZone = this.availabilityZone;
    final dbClusterId = this.dbClusterId;
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final instanceMode = this.instanceMode;
    final instanceModes = this.instanceModes;
    final lastMaintenanceTime = this.lastMaintenanceTime;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
    final maintenanceSchedule = this.maintenanceSchedule;
    final networkType = this.networkType;
    final nextMaintenanceTime = this.nextMaintenanceTime;
    final port = this.port;
    final publiclyAccessible = this.publiclyAccessible;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final status = this.status;
    final vpcSecurityGroupIds = this.vpcSecurityGroupIds;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'vpcSubnetIds': vpcSubnetIds,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (dbClusterId != null) 'dbClusterId': dbClusterId,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
      if (deploymentType != null) 'deploymentType': deploymentType.value,
      if (endpoint != null) 'endpoint': endpoint,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (instanceMode != null) 'instanceMode': instanceMode.value,
      if (instanceModes != null)
        'instanceModes': instanceModes.map((e) => e.value).toList(),
      if (lastMaintenanceTime != null)
        'lastMaintenanceTime': iso8601ToJson(lastMaintenanceTime),
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (networkType != null) 'networkType': networkType.value,
      if (nextMaintenanceTime != null)
        'nextMaintenanceTime': iso8601ToJson(nextMaintenanceTime),
      if (port != null) 'port': port,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (status != null) 'status': status.value,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
  }
}

/// @nodoc
class UpdateDbInstanceOutput {
  /// The Amazon Resource Name (ARN) of the DB instance.
  final String arn;

  /// A service-generated unique identifier.
  final String id;

  /// This customer-supplied name uniquely identifies the DB instance when
  /// interacting with the Amazon Timestream for InfluxDB API and CLI commands.
  final String name;

  /// A list of VPC subnet IDs associated with the DB instance.
  final List<String> vpcSubnetIds;

  /// The amount of storage allocated for your DB storage type (in gibibytes).
  final int? allocatedStorage;

  /// The Availability Zone in which the DB instance resides.
  final String? availabilityZone;

  /// Specifies the DbCluster to which this DbInstance belongs to.
  final String? dbClusterId;

  /// The Timestream for InfluxDB instance type that InfluxDB runs on.
  final DbInstanceType? dbInstanceType;

  /// The id of the DB parameter group assigned to your DB instance.
  final String? dbParameterGroupIdentifier;

  /// The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
  final DbStorageType? dbStorageType;

  /// Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or
  /// with a MultiAZ Standby for High availability.
  final DeploymentType? deploymentType;

  /// The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
  final String? endpoint;

  /// The Amazon Resource Name (ARN) of the Secrets Manager secret containing the
  /// initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// Specifies the DbInstance's role in the cluster.
  final InstanceMode? instanceMode;

  /// Specifies the DbInstance's roles in the cluster.
  final List<InstanceMode>? instanceModes;

  /// The timestamp of the last completed maintenance operation on the DB
  /// instance.
  final DateTime? lastMaintenanceTime;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

  /// The maintenance schedule for the DB instance.
  final MaintenanceSchedule? maintenanceSchedule;

  /// Specifies whether the networkType of the Timestream for InfluxDB instance is
  /// IPV4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  final NetworkType? networkType;

  /// The timestamp of the next scheduled maintenance operation on the DB
  /// instance.
  final DateTime? nextMaintenanceTime;

  /// The port number on which InfluxDB accepts connections.
  final int? port;

  /// Indicates if the DB instance has a public IP to facilitate access.
  final bool? publiclyAccessible;

  /// The Availability Zone in which the standby instance is located when
  /// deploying with a MultiAZ standby instance.
  final String? secondaryAvailabilityZone;

  /// The status of the DB instance.
  final Status? status;

  /// A list of VPC security group IDs associated with the DB instance.
  final List<String>? vpcSecurityGroupIds;

  UpdateDbInstanceOutput({
    required this.arn,
    required this.id,
    required this.name,
    required this.vpcSubnetIds,
    this.allocatedStorage,
    this.availabilityZone,
    this.dbClusterId,
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.influxAuthParametersSecretArn,
    this.instanceMode,
    this.instanceModes,
    this.lastMaintenanceTime,
    this.logDeliveryConfiguration,
    this.maintenanceSchedule,
    this.networkType,
    this.nextMaintenanceTime,
    this.port,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.status,
    this.vpcSecurityGroupIds,
  });

  factory UpdateDbInstanceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateDbInstanceOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      vpcSubnetIds: ((json['vpcSubnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allocatedStorage: json['allocatedStorage'] as int?,
      availabilityZone: json['availabilityZone'] as String?,
      dbClusterId: json['dbClusterId'] as String?,
      dbInstanceType:
          (json['dbInstanceType'] as String?)?.let(DbInstanceType.fromString),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType:
          (json['dbStorageType'] as String?)?.let(DbStorageType.fromString),
      deploymentType:
          (json['deploymentType'] as String?)?.let(DeploymentType.fromString),
      endpoint: json['endpoint'] as String?,
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      instanceMode:
          (json['instanceMode'] as String?)?.let(InstanceMode.fromString),
      instanceModes: (json['instanceModes'] as List?)
          ?.nonNulls
          .map((e) => InstanceMode.fromString((e as String)))
          .toList(),
      lastMaintenanceTime: timeStampFromJson(json['lastMaintenanceTime']),
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      nextMaintenanceTime: timeStampFromJson(json['nextMaintenanceTime']),
      port: json['port'] as int?,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final vpcSubnetIds = this.vpcSubnetIds;
    final allocatedStorage = this.allocatedStorage;
    final availabilityZone = this.availabilityZone;
    final dbClusterId = this.dbClusterId;
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final instanceMode = this.instanceMode;
    final instanceModes = this.instanceModes;
    final lastMaintenanceTime = this.lastMaintenanceTime;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
    final maintenanceSchedule = this.maintenanceSchedule;
    final networkType = this.networkType;
    final nextMaintenanceTime = this.nextMaintenanceTime;
    final port = this.port;
    final publiclyAccessible = this.publiclyAccessible;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final status = this.status;
    final vpcSecurityGroupIds = this.vpcSecurityGroupIds;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'vpcSubnetIds': vpcSubnetIds,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (dbClusterId != null) 'dbClusterId': dbClusterId,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
      if (deploymentType != null) 'deploymentType': deploymentType.value,
      if (endpoint != null) 'endpoint': endpoint,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (instanceMode != null) 'instanceMode': instanceMode.value,
      if (instanceModes != null)
        'instanceModes': instanceModes.map((e) => e.value).toList(),
      if (lastMaintenanceTime != null)
        'lastMaintenanceTime': iso8601ToJson(lastMaintenanceTime),
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (networkType != null) 'networkType': networkType.value,
      if (nextMaintenanceTime != null)
        'nextMaintenanceTime': iso8601ToJson(nextMaintenanceTime),
      if (port != null) 'port': port,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (status != null) 'status': status.value,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
  }
}

/// @nodoc
class DeleteDbInstanceOutput {
  /// The Amazon Resource Name (ARN) of the DB instance.
  final String arn;

  /// A service-generated unique identifier.
  final String id;

  /// The customer-supplied name that uniquely identifies the DB instance when
  /// interacting with the Amazon Timestream for InfluxDB API and CLI commands.
  final String name;

  /// A list of VPC subnet IDs associated with the DB instance.
  final List<String> vpcSubnetIds;

  /// The amount of storage allocated for your DB storage type (in gibibytes).
  final int? allocatedStorage;

  /// The Availability Zone in which the DB instance resides.
  final String? availabilityZone;

  /// Specifies the DbCluster to which this DbInstance belongs to.
  final String? dbClusterId;

  /// The Timestream for InfluxDB instance type that InfluxDB runs on.
  final DbInstanceType? dbInstanceType;

  /// The id of the DB parameter group assigned to your DB instance.
  final String? dbParameterGroupIdentifier;

  /// The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
  final DbStorageType? dbStorageType;

  /// Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or
  /// with a MultiAZ Standby for High availability.
  final DeploymentType? deploymentType;

  /// The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
  final String? endpoint;

  /// The Amazon Resource Name (ARN) of the Secrets Manager secret containing the
  /// initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// Specifies the DbInstance's role in the cluster.
  final InstanceMode? instanceMode;

  /// Specifies the DbInstance's roles in the cluster.
  final List<InstanceMode>? instanceModes;

  /// The timestamp of the last completed maintenance operation on the DB
  /// instance.
  final DateTime? lastMaintenanceTime;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

  /// The maintenance schedule for the DB instance.
  final MaintenanceSchedule? maintenanceSchedule;

  /// Specifies whether the networkType of the Timestream for InfluxDB instance is
  /// IPV4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  final NetworkType? networkType;

  /// The timestamp of the next scheduled maintenance operation on the DB
  /// instance.
  final DateTime? nextMaintenanceTime;

  /// The port number on which InfluxDB accepts connections.
  final int? port;

  /// Indicates if the DB instance has a public IP to facilitate access.
  final bool? publiclyAccessible;

  /// The Availability Zone in which the standby instance is located when
  /// deploying with a MultiAZ standby instance.
  final String? secondaryAvailabilityZone;

  /// The status of the DB instance.
  final Status? status;

  /// A list of VPC security group IDs associated with the DB instance.
  final List<String>? vpcSecurityGroupIds;

  DeleteDbInstanceOutput({
    required this.arn,
    required this.id,
    required this.name,
    required this.vpcSubnetIds,
    this.allocatedStorage,
    this.availabilityZone,
    this.dbClusterId,
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.influxAuthParametersSecretArn,
    this.instanceMode,
    this.instanceModes,
    this.lastMaintenanceTime,
    this.logDeliveryConfiguration,
    this.maintenanceSchedule,
    this.networkType,
    this.nextMaintenanceTime,
    this.port,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.status,
    this.vpcSecurityGroupIds,
  });

  factory DeleteDbInstanceOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDbInstanceOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      vpcSubnetIds: ((json['vpcSubnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allocatedStorage: json['allocatedStorage'] as int?,
      availabilityZone: json['availabilityZone'] as String?,
      dbClusterId: json['dbClusterId'] as String?,
      dbInstanceType:
          (json['dbInstanceType'] as String?)?.let(DbInstanceType.fromString),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType:
          (json['dbStorageType'] as String?)?.let(DbStorageType.fromString),
      deploymentType:
          (json['deploymentType'] as String?)?.let(DeploymentType.fromString),
      endpoint: json['endpoint'] as String?,
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      instanceMode:
          (json['instanceMode'] as String?)?.let(InstanceMode.fromString),
      instanceModes: (json['instanceModes'] as List?)
          ?.nonNulls
          .map((e) => InstanceMode.fromString((e as String)))
          .toList(),
      lastMaintenanceTime: timeStampFromJson(json['lastMaintenanceTime']),
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      nextMaintenanceTime: timeStampFromJson(json['nextMaintenanceTime']),
      port: json['port'] as int?,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final vpcSubnetIds = this.vpcSubnetIds;
    final allocatedStorage = this.allocatedStorage;
    final availabilityZone = this.availabilityZone;
    final dbClusterId = this.dbClusterId;
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final instanceMode = this.instanceMode;
    final instanceModes = this.instanceModes;
    final lastMaintenanceTime = this.lastMaintenanceTime;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
    final maintenanceSchedule = this.maintenanceSchedule;
    final networkType = this.networkType;
    final nextMaintenanceTime = this.nextMaintenanceTime;
    final port = this.port;
    final publiclyAccessible = this.publiclyAccessible;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final status = this.status;
    final vpcSecurityGroupIds = this.vpcSecurityGroupIds;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'vpcSubnetIds': vpcSubnetIds,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (dbClusterId != null) 'dbClusterId': dbClusterId,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
      if (deploymentType != null) 'deploymentType': deploymentType.value,
      if (endpoint != null) 'endpoint': endpoint,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (instanceMode != null) 'instanceMode': instanceMode.value,
      if (instanceModes != null)
        'instanceModes': instanceModes.map((e) => e.value).toList(),
      if (lastMaintenanceTime != null)
        'lastMaintenanceTime': iso8601ToJson(lastMaintenanceTime),
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (networkType != null) 'networkType': networkType.value,
      if (nextMaintenanceTime != null)
        'nextMaintenanceTime': iso8601ToJson(nextMaintenanceTime),
      if (port != null) 'port': port,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (status != null) 'status': status.value,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
  }
}

/// @nodoc
class ListDbInstancesOutput {
  /// A list of Timestream for InfluxDB DB instance summaries.
  final List<DbInstanceSummary> items;

  /// Token from a previous call of the operation. When this value is provided,
  /// the service returns results from where the previous response left off.
  final String? nextToken;

  ListDbInstancesOutput({
    required this.items,
    this.nextToken,
  });

  factory ListDbInstancesOutput.fromJson(Map<String, dynamic> json) {
    return ListDbInstancesOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => DbInstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class RebootDbInstanceOutput {
  /// The Amazon Resource Name (ARN) of the DB instance.
  final String arn;

  /// A service-generated unique identifier.
  final String id;

  /// The customer-supplied name that uniquely identifies the DB instance when
  /// interacting with the Amazon Timestream for InfluxDB API and CLI commands.
  final String name;

  /// A list of VPC subnet IDs associated with the DB instance.
  final List<String> vpcSubnetIds;

  /// The amount of storage allocated for your DB storage type (in gibibytes).
  final int? allocatedStorage;

  /// The Availability Zone in which the DB instance resides.
  final String? availabilityZone;

  /// Specifies the DbCluster to which this DbInstance belongs to.
  final String? dbClusterId;

  /// The Timestream for InfluxDB instance type that InfluxDB runs on.
  final DbInstanceType? dbInstanceType;

  /// The id of the DB parameter group assigned to your DB instance.
  final String? dbParameterGroupIdentifier;

  /// The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
  final DbStorageType? dbStorageType;

  /// Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or
  /// with a MultiAZ Standby for High availability.
  final DeploymentType? deploymentType;

  /// The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
  final String? endpoint;

  /// The Amazon Resource Name (ARN) of the Secrets Manager secret containing the
  /// initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// Specifies the DbInstance's role in the cluster.
  final InstanceMode? instanceMode;

  /// Specifies the DbInstance's roles in the cluster.
  final List<InstanceMode>? instanceModes;

  /// The timestamp of the last completed maintenance operation on the DB
  /// instance.
  final DateTime? lastMaintenanceTime;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

  /// The maintenance schedule for the DB instance.
  final MaintenanceSchedule? maintenanceSchedule;

  /// Specifies whether the networkType of the Timestream for InfluxDB instance is
  /// IPV4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  final NetworkType? networkType;

  /// The timestamp of the next scheduled maintenance operation on the DB
  /// instance.
  final DateTime? nextMaintenanceTime;

  /// The port number on which InfluxDB accepts connections.
  final int? port;

  /// Indicates if the DB instance has a public IP to facilitate access.
  final bool? publiclyAccessible;

  /// The Availability Zone in which the standby instance is located when
  /// deploying with a MultiAZ standby instance.
  final String? secondaryAvailabilityZone;

  /// The status of the DB instance.
  final Status? status;

  /// A list of VPC security group IDs associated with the DB instance.
  final List<String>? vpcSecurityGroupIds;

  RebootDbInstanceOutput({
    required this.arn,
    required this.id,
    required this.name,
    required this.vpcSubnetIds,
    this.allocatedStorage,
    this.availabilityZone,
    this.dbClusterId,
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.influxAuthParametersSecretArn,
    this.instanceMode,
    this.instanceModes,
    this.lastMaintenanceTime,
    this.logDeliveryConfiguration,
    this.maintenanceSchedule,
    this.networkType,
    this.nextMaintenanceTime,
    this.port,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.status,
    this.vpcSecurityGroupIds,
  });

  factory RebootDbInstanceOutput.fromJson(Map<String, dynamic> json) {
    return RebootDbInstanceOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      vpcSubnetIds: ((json['vpcSubnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allocatedStorage: json['allocatedStorage'] as int?,
      availabilityZone: json['availabilityZone'] as String?,
      dbClusterId: json['dbClusterId'] as String?,
      dbInstanceType:
          (json['dbInstanceType'] as String?)?.let(DbInstanceType.fromString),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType:
          (json['dbStorageType'] as String?)?.let(DbStorageType.fromString),
      deploymentType:
          (json['deploymentType'] as String?)?.let(DeploymentType.fromString),
      endpoint: json['endpoint'] as String?,
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      instanceMode:
          (json['instanceMode'] as String?)?.let(InstanceMode.fromString),
      instanceModes: (json['instanceModes'] as List?)
          ?.nonNulls
          .map((e) => InstanceMode.fromString((e as String)))
          .toList(),
      lastMaintenanceTime: timeStampFromJson(json['lastMaintenanceTime']),
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      nextMaintenanceTime: timeStampFromJson(json['nextMaintenanceTime']),
      port: json['port'] as int?,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final vpcSubnetIds = this.vpcSubnetIds;
    final allocatedStorage = this.allocatedStorage;
    final availabilityZone = this.availabilityZone;
    final dbClusterId = this.dbClusterId;
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final instanceMode = this.instanceMode;
    final instanceModes = this.instanceModes;
    final lastMaintenanceTime = this.lastMaintenanceTime;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
    final maintenanceSchedule = this.maintenanceSchedule;
    final networkType = this.networkType;
    final nextMaintenanceTime = this.nextMaintenanceTime;
    final port = this.port;
    final publiclyAccessible = this.publiclyAccessible;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final status = this.status;
    final vpcSecurityGroupIds = this.vpcSecurityGroupIds;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'vpcSubnetIds': vpcSubnetIds,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (dbClusterId != null) 'dbClusterId': dbClusterId,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
      if (deploymentType != null) 'deploymentType': deploymentType.value,
      if (endpoint != null) 'endpoint': endpoint,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (instanceMode != null) 'instanceMode': instanceMode.value,
      if (instanceModes != null)
        'instanceModes': instanceModes.map((e) => e.value).toList(),
      if (lastMaintenanceTime != null)
        'lastMaintenanceTime': iso8601ToJson(lastMaintenanceTime),
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (networkType != null) 'networkType': networkType.value,
      if (nextMaintenanceTime != null)
        'nextMaintenanceTime': iso8601ToJson(nextMaintenanceTime),
      if (port != null) 'port': port,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (status != null) 'status': status.value,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
  }
}

/// @nodoc
class CreateDbParameterGroupOutput {
  /// The Amazon Resource Name (ARM) of the DB parameter group.
  final String arn;

  /// A service-generated unique identifier.
  final String id;

  /// The customer-supplied name that uniquely identifies the DB parameter group
  /// when interacting with the Amazon Timestream for InfluxDB API and CLI
  /// commands.
  final String name;

  /// The description of the DB parameter group.
  final String? description;

  /// A list of the parameters that comprise the DB parameter group.
  final Parameters? parameters;

  CreateDbParameterGroupOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.description,
    this.parameters,
  });

  factory CreateDbParameterGroupOutput.fromJson(Map<String, dynamic> json) {
    return CreateDbParameterGroupOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      description: json['description'] as String?,
      parameters: json['parameters'] != null
          ? Parameters.fromJson(json['parameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final description = this.description;
    final parameters = this.parameters;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (description != null) 'description': description,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// @nodoc
class GetDbParameterGroupOutput {
  /// The Amazon Resource Name (ARN) of the DB parameter group.
  final String arn;

  /// A service-generated unique identifier.
  final String id;

  /// The customer-supplied name that uniquely identifies the DB parameter group
  /// when interacting with the Amazon Timestream for InfluxDB API and CLI
  /// commands.
  final String name;

  /// A description of the DB parameter group.
  final String? description;

  /// The parameters that comprise the DB parameter group.
  final Parameters? parameters;

  GetDbParameterGroupOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.description,
    this.parameters,
  });

  factory GetDbParameterGroupOutput.fromJson(Map<String, dynamic> json) {
    return GetDbParameterGroupOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      description: json['description'] as String?,
      parameters: json['parameters'] != null
          ? Parameters.fromJson(json['parameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final description = this.description;
    final parameters = this.parameters;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (description != null) 'description': description,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// @nodoc
class ListDbParameterGroupsOutput {
  /// A list of Timestream for InfluxDB DB parameter group summaries.
  final List<DbParameterGroupSummary> items;

  /// Token from a previous call of the operation. When this value is provided,
  /// the service returns results from where the previous response left off.
  final String? nextToken;

  ListDbParameterGroupsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListDbParameterGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListDbParameterGroupsOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              DbParameterGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Contains a summary of a DB parameter group.
///
/// @nodoc
class DbParameterGroupSummary {
  /// The Amazon Resource Name (ARN) of the DB parameter group.
  final String arn;

  /// A service-generated unique identifier.
  final String id;

  /// This customer-supplied name uniquely identifies the parameter group.
  final String name;

  /// A description of the DB parameter group.
  final String? description;

  DbParameterGroupSummary({
    required this.arn,
    required this.id,
    required this.name,
    this.description,
  });

  factory DbParameterGroupSummary.fromJson(Map<String, dynamic> json) {
    return DbParameterGroupSummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final description = this.description;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// The parameters that comprise the parameter group.
///
/// @nodoc
class Parameters {
  /// All the customer-modifiable InfluxDB v2 parameters in Timestream for
  /// InfluxDB.
  final InfluxDBv2Parameters? influxDBv2;

  /// All the customer-modifiable InfluxDB v3 Core parameters in Timestream for
  /// InfluxDB.
  final InfluxDBv3CoreParameters? influxDBv3Core;

  /// All the customer-modifiable InfluxDB v3 Enterprise parameters in Timestream
  /// for InfluxDB.
  final InfluxDBv3EnterpriseParameters? influxDBv3Enterprise;

  Parameters({
    this.influxDBv2,
    this.influxDBv3Core,
    this.influxDBv3Enterprise,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      influxDBv2: json['InfluxDBv2'] != null
          ? InfluxDBv2Parameters.fromJson(
              json['InfluxDBv2'] as Map<String, dynamic>)
          : null,
      influxDBv3Core: json['InfluxDBv3Core'] != null
          ? InfluxDBv3CoreParameters.fromJson(
              json['InfluxDBv3Core'] as Map<String, dynamic>)
          : null,
      influxDBv3Enterprise: json['InfluxDBv3Enterprise'] != null
          ? InfluxDBv3EnterpriseParameters.fromJson(
              json['InfluxDBv3Enterprise'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final influxDBv2 = this.influxDBv2;
    final influxDBv3Core = this.influxDBv3Core;
    final influxDBv3Enterprise = this.influxDBv3Enterprise;
    return {
      if (influxDBv2 != null) 'InfluxDBv2': influxDBv2,
      if (influxDBv3Core != null) 'InfluxDBv3Core': influxDBv3Core,
      if (influxDBv3Enterprise != null)
        'InfluxDBv3Enterprise': influxDBv3Enterprise,
    };
  }
}

/// All the customer-modifiable InfluxDB v2 parameters in Timestream for
/// InfluxDB.
///
/// @nodoc
class InfluxDBv2Parameters {
  /// Include option to show detailed logs for Flux queries.
  ///
  /// Default: false
  final bool? fluxLogEnabled;

  /// Maximum duration the server should keep established connections alive while
  /// waiting for new requests. Set to 0 for no timeout.
  ///
  /// Default: 3 minutes
  final Duration? httpIdleTimeout;

  /// Maximum duration the server should try to read HTTP headers for new
  /// requests. Set to 0 for no timeout.
  ///
  /// Default: 10 seconds
  final Duration? httpReadHeaderTimeout;

  /// Maximum duration the server should try to read the entirety of new requests.
  /// Set to 0 for no timeout.
  ///
  /// Default: 0
  final Duration? httpReadTimeout;

  /// Maximum duration the server should spend processing and responding to write
  /// requests. Set to 0 for no timeout.
  ///
  /// Default: 0
  final Duration? httpWriteTimeout;

  /// Maximum number of group by time buckets a SELECT statement can create. 0
  /// allows an unlimited number of buckets.
  ///
  /// Default: 0
  final int? influxqlMaxSelectBuckets;

  /// Maximum number of points a SELECT statement can process. 0 allows an
  /// unlimited number of points. InfluxDB checks the point count every second (so
  /// queries exceeding the maximum aren’t immediately aborted).
  ///
  /// Default: 0
  final int? influxqlMaxSelectPoint;

  /// Maximum number of series a SELECT statement can return. 0 allows an
  /// unlimited number of series.
  ///
  /// Default: 0
  final int? influxqlMaxSelectSeries;

  /// Log output level. InfluxDB outputs log entries with severity levels greater
  /// than or equal to the level specified.
  ///
  /// Default: info
  final LogLevel? logLevel;

  /// Disable the HTTP /metrics endpoint which exposes <a
  /// href="https://docs.influxdata.com/influxdb/v2/reference/internals/metrics/">internal
  /// InfluxDB metrics</a>.
  ///
  /// Default: false
  final bool? metricsDisabled;

  /// Disable the task scheduler. If problematic tasks prevent InfluxDB from
  /// starting, use this option to start InfluxDB without scheduling or executing
  /// tasks.
  ///
  /// Default: false
  final bool? noTasks;

  /// Disable the /debug/pprof HTTP endpoint. This endpoint provides runtime
  /// profiling data and can be helpful when debugging.
  ///
  /// Default: true
  final bool? pprofDisabled;

  /// Number of queries allowed to execute concurrently. Setting to 0 allows an
  /// unlimited number of concurrent queries.
  ///
  /// Default: 0
  final int? queryConcurrency;

  /// Initial bytes of memory allocated for a query.
  ///
  /// Default: 0
  final int? queryInitialMemoryBytes;

  /// Maximum number of queries allowed in execution queue. When queue limit is
  /// reached, new queries are rejected. Setting to 0 allows an unlimited number
  /// of queries in the queue.
  ///
  /// Default: 0
  final int? queryMaxMemoryBytes;

  /// Maximum bytes of memory allowed for a single query. Must be greater or equal
  /// to queryInitialMemoryBytes.
  ///
  /// Default: 0
  final int? queryMemoryBytes;

  /// Maximum number of queries allowed in execution queue. When queue limit is
  /// reached, new queries are rejected. Setting to 0 allows an unlimited number
  /// of queries in the queue.
  ///
  /// Default: 0
  final int? queryQueueSize;

  /// Specifies the Time to Live (TTL) in minutes for newly created user sessions.
  ///
  /// Default: 60
  final int? sessionLength;

  /// Disables automatically extending a user’s session TTL on each request. By
  /// default, every request sets the session’s expiration time to five minutes
  /// from now. When disabled, sessions expire after the specified <a
  /// href="https://docs.influxdata.com/influxdb/v2/reference/config-options/#session-length">session
  /// length</a> and the user is redirected to the login page, even if recently
  /// active.
  ///
  /// Default: false
  final bool? sessionRenewDisabled;

  /// Maximum size (in bytes) a shard’s cache can reach before it starts rejecting
  /// writes. Must be greater than storageCacheSnapShotMemorySize and lower than
  /// instance’s total memory capacity. We recommend setting it to below 15% of
  /// the total memory capacity.
  ///
  /// Default: 1073741824
  final int? storageCacheMaxMemorySize;

  /// Size (in bytes) at which the storage engine will snapshot the cache and
  /// write it to a TSM file to make more memory available. Must not be greater
  /// than storageCacheMaxMemorySize.
  ///
  /// Default: 26214400
  final int? storageCacheSnapshotMemorySize;

  /// Duration at which the storage engine will snapshot the cache and write it to
  /// a new TSM file if the shard hasn’t received writes or deletes.
  ///
  /// Default: 10 minutes
  final Duration? storageCacheSnapshotWriteColdDuration;

  /// Duration at which the storage engine will compact all TSM files in a shard
  /// if it hasn't received writes or deletes.
  ///
  /// Default: 4 hours
  final Duration? storageCompactFullWriteColdDuration;

  /// Rate limit (in bytes per second) that TSM compactions can write to disk.
  ///
  /// Default: 50331648
  final int? storageCompactThroughputBurst;

  /// Maximum number of full and level compactions that can run concurrently. A
  /// value of 0 results in 50% of runtime.GOMAXPROCS(0) used at runtime. Any
  /// number greater than zero limits compactions to that value. This setting does
  /// not apply to cache snapshotting.
  ///
  /// Default: 0
  final int? storageMaxConcurrentCompactions;

  /// Size (in bytes) at which an index write-ahead log (WAL) file will compact
  /// into an index file. Lower sizes will cause log files to be compacted more
  /// quickly and result in lower heap usage at the expense of write throughput.
  ///
  /// Default: 1048576
  final int? storageMaxIndexLogFileSize;

  /// Skip field size validation on incoming write requests.
  ///
  /// Default: false
  final bool? storageNoValidateFieldSize;

  /// Interval of retention policy enforcement checks. Must be greater than 0.
  ///
  /// Default: 30 minutes
  final Duration? storageRetentionCheckInterval;

  /// Maximum number of snapshot compactions that can run concurrently across all
  /// series partitions in a database.
  ///
  /// Default: 0
  final int? storageSeriesFileMaxConcurrentSnapshotCompactions;

  /// Size of the internal cache used in the TSI index to store previously
  /// calculated series results. Cached results are returned quickly rather than
  /// needing to be recalculated when a subsequent query with the same tag
  /// key/value predicate is executed. Setting this value to 0 will disable the
  /// cache and may decrease query performance.
  ///
  /// Default: 100
  final int? storageSeriesIdSetCacheSize;

  /// Maximum number writes to the WAL directory to attempt at the same time.
  /// Setting this value to 0 results in number of processing units available x2.
  ///
  /// Default: 0
  final int? storageWalMaxConcurrentWrites;

  /// Maximum amount of time a write request to the WAL directory will wait when
  /// the <a
  /// href="https://docs.influxdata.com/influxdb/v2/reference/config-options/#storage-wal-max-concurrent-writes">maximum
  /// number of concurrent active writes to the WAL directory has been met</a>.
  /// Set to 0 to disable the timeout.
  ///
  /// Default: 10 minutes
  final Duration? storageWalMaxWriteDelay;

  /// Enable tracing in InfluxDB and specifies the tracing type. Tracing is
  /// disabled by default.
  final TracingType? tracingType;

  /// Disable the InfluxDB user interface (UI). The UI is enabled by default.
  ///
  /// Default: false
  final bool? uiDisabled;

  InfluxDBv2Parameters({
    this.fluxLogEnabled,
    this.httpIdleTimeout,
    this.httpReadHeaderTimeout,
    this.httpReadTimeout,
    this.httpWriteTimeout,
    this.influxqlMaxSelectBuckets,
    this.influxqlMaxSelectPoint,
    this.influxqlMaxSelectSeries,
    this.logLevel,
    this.metricsDisabled,
    this.noTasks,
    this.pprofDisabled,
    this.queryConcurrency,
    this.queryInitialMemoryBytes,
    this.queryMaxMemoryBytes,
    this.queryMemoryBytes,
    this.queryQueueSize,
    this.sessionLength,
    this.sessionRenewDisabled,
    this.storageCacheMaxMemorySize,
    this.storageCacheSnapshotMemorySize,
    this.storageCacheSnapshotWriteColdDuration,
    this.storageCompactFullWriteColdDuration,
    this.storageCompactThroughputBurst,
    this.storageMaxConcurrentCompactions,
    this.storageMaxIndexLogFileSize,
    this.storageNoValidateFieldSize,
    this.storageRetentionCheckInterval,
    this.storageSeriesFileMaxConcurrentSnapshotCompactions,
    this.storageSeriesIdSetCacheSize,
    this.storageWalMaxConcurrentWrites,
    this.storageWalMaxWriteDelay,
    this.tracingType,
    this.uiDisabled,
  });

  factory InfluxDBv2Parameters.fromJson(Map<String, dynamic> json) {
    return InfluxDBv2Parameters(
      fluxLogEnabled: json['fluxLogEnabled'] as bool?,
      httpIdleTimeout: json['httpIdleTimeout'] != null
          ? Duration.fromJson(json['httpIdleTimeout'] as Map<String, dynamic>)
          : null,
      httpReadHeaderTimeout: json['httpReadHeaderTimeout'] != null
          ? Duration.fromJson(
              json['httpReadHeaderTimeout'] as Map<String, dynamic>)
          : null,
      httpReadTimeout: json['httpReadTimeout'] != null
          ? Duration.fromJson(json['httpReadTimeout'] as Map<String, dynamic>)
          : null,
      httpWriteTimeout: json['httpWriteTimeout'] != null
          ? Duration.fromJson(json['httpWriteTimeout'] as Map<String, dynamic>)
          : null,
      influxqlMaxSelectBuckets: json['influxqlMaxSelectBuckets'] as int?,
      influxqlMaxSelectPoint: json['influxqlMaxSelectPoint'] as int?,
      influxqlMaxSelectSeries: json['influxqlMaxSelectSeries'] as int?,
      logLevel: (json['logLevel'] as String?)?.let(LogLevel.fromString),
      metricsDisabled: json['metricsDisabled'] as bool?,
      noTasks: json['noTasks'] as bool?,
      pprofDisabled: json['pprofDisabled'] as bool?,
      queryConcurrency: json['queryConcurrency'] as int?,
      queryInitialMemoryBytes: json['queryInitialMemoryBytes'] as int?,
      queryMaxMemoryBytes: json['queryMaxMemoryBytes'] as int?,
      queryMemoryBytes: json['queryMemoryBytes'] as int?,
      queryQueueSize: json['queryQueueSize'] as int?,
      sessionLength: json['sessionLength'] as int?,
      sessionRenewDisabled: json['sessionRenewDisabled'] as bool?,
      storageCacheMaxMemorySize: json['storageCacheMaxMemorySize'] as int?,
      storageCacheSnapshotMemorySize:
          json['storageCacheSnapshotMemorySize'] as int?,
      storageCacheSnapshotWriteColdDuration:
          json['storageCacheSnapshotWriteColdDuration'] != null
              ? Duration.fromJson(json['storageCacheSnapshotWriteColdDuration']
                  as Map<String, dynamic>)
              : null,
      storageCompactFullWriteColdDuration:
          json['storageCompactFullWriteColdDuration'] != null
              ? Duration.fromJson(json['storageCompactFullWriteColdDuration']
                  as Map<String, dynamic>)
              : null,
      storageCompactThroughputBurst:
          json['storageCompactThroughputBurst'] as int?,
      storageMaxConcurrentCompactions:
          json['storageMaxConcurrentCompactions'] as int?,
      storageMaxIndexLogFileSize: json['storageMaxIndexLogFileSize'] as int?,
      storageNoValidateFieldSize: json['storageNoValidateFieldSize'] as bool?,
      storageRetentionCheckInterval:
          json['storageRetentionCheckInterval'] != null
              ? Duration.fromJson(
                  json['storageRetentionCheckInterval'] as Map<String, dynamic>)
              : null,
      storageSeriesFileMaxConcurrentSnapshotCompactions:
          json['storageSeriesFileMaxConcurrentSnapshotCompactions'] as int?,
      storageSeriesIdSetCacheSize: json['storageSeriesIdSetCacheSize'] as int?,
      storageWalMaxConcurrentWrites:
          json['storageWalMaxConcurrentWrites'] as int?,
      storageWalMaxWriteDelay: json['storageWalMaxWriteDelay'] != null
          ? Duration.fromJson(
              json['storageWalMaxWriteDelay'] as Map<String, dynamic>)
          : null,
      tracingType:
          (json['tracingType'] as String?)?.let(TracingType.fromString),
      uiDisabled: json['uiDisabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final fluxLogEnabled = this.fluxLogEnabled;
    final httpIdleTimeout = this.httpIdleTimeout;
    final httpReadHeaderTimeout = this.httpReadHeaderTimeout;
    final httpReadTimeout = this.httpReadTimeout;
    final httpWriteTimeout = this.httpWriteTimeout;
    final influxqlMaxSelectBuckets = this.influxqlMaxSelectBuckets;
    final influxqlMaxSelectPoint = this.influxqlMaxSelectPoint;
    final influxqlMaxSelectSeries = this.influxqlMaxSelectSeries;
    final logLevel = this.logLevel;
    final metricsDisabled = this.metricsDisabled;
    final noTasks = this.noTasks;
    final pprofDisabled = this.pprofDisabled;
    final queryConcurrency = this.queryConcurrency;
    final queryInitialMemoryBytes = this.queryInitialMemoryBytes;
    final queryMaxMemoryBytes = this.queryMaxMemoryBytes;
    final queryMemoryBytes = this.queryMemoryBytes;
    final queryQueueSize = this.queryQueueSize;
    final sessionLength = this.sessionLength;
    final sessionRenewDisabled = this.sessionRenewDisabled;
    final storageCacheMaxMemorySize = this.storageCacheMaxMemorySize;
    final storageCacheSnapshotMemorySize = this.storageCacheSnapshotMemorySize;
    final storageCacheSnapshotWriteColdDuration =
        this.storageCacheSnapshotWriteColdDuration;
    final storageCompactFullWriteColdDuration =
        this.storageCompactFullWriteColdDuration;
    final storageCompactThroughputBurst = this.storageCompactThroughputBurst;
    final storageMaxConcurrentCompactions =
        this.storageMaxConcurrentCompactions;
    final storageMaxIndexLogFileSize = this.storageMaxIndexLogFileSize;
    final storageNoValidateFieldSize = this.storageNoValidateFieldSize;
    final storageRetentionCheckInterval = this.storageRetentionCheckInterval;
    final storageSeriesFileMaxConcurrentSnapshotCompactions =
        this.storageSeriesFileMaxConcurrentSnapshotCompactions;
    final storageSeriesIdSetCacheSize = this.storageSeriesIdSetCacheSize;
    final storageWalMaxConcurrentWrites = this.storageWalMaxConcurrentWrites;
    final storageWalMaxWriteDelay = this.storageWalMaxWriteDelay;
    final tracingType = this.tracingType;
    final uiDisabled = this.uiDisabled;
    return {
      if (fluxLogEnabled != null) 'fluxLogEnabled': fluxLogEnabled,
      if (httpIdleTimeout != null) 'httpIdleTimeout': httpIdleTimeout,
      if (httpReadHeaderTimeout != null)
        'httpReadHeaderTimeout': httpReadHeaderTimeout,
      if (httpReadTimeout != null) 'httpReadTimeout': httpReadTimeout,
      if (httpWriteTimeout != null) 'httpWriteTimeout': httpWriteTimeout,
      if (influxqlMaxSelectBuckets != null)
        'influxqlMaxSelectBuckets': influxqlMaxSelectBuckets,
      if (influxqlMaxSelectPoint != null)
        'influxqlMaxSelectPoint': influxqlMaxSelectPoint,
      if (influxqlMaxSelectSeries != null)
        'influxqlMaxSelectSeries': influxqlMaxSelectSeries,
      if (logLevel != null) 'logLevel': logLevel.value,
      if (metricsDisabled != null) 'metricsDisabled': metricsDisabled,
      if (noTasks != null) 'noTasks': noTasks,
      if (pprofDisabled != null) 'pprofDisabled': pprofDisabled,
      if (queryConcurrency != null) 'queryConcurrency': queryConcurrency,
      if (queryInitialMemoryBytes != null)
        'queryInitialMemoryBytes': queryInitialMemoryBytes,
      if (queryMaxMemoryBytes != null)
        'queryMaxMemoryBytes': queryMaxMemoryBytes,
      if (queryMemoryBytes != null) 'queryMemoryBytes': queryMemoryBytes,
      if (queryQueueSize != null) 'queryQueueSize': queryQueueSize,
      if (sessionLength != null) 'sessionLength': sessionLength,
      if (sessionRenewDisabled != null)
        'sessionRenewDisabled': sessionRenewDisabled,
      if (storageCacheMaxMemorySize != null)
        'storageCacheMaxMemorySize': storageCacheMaxMemorySize,
      if (storageCacheSnapshotMemorySize != null)
        'storageCacheSnapshotMemorySize': storageCacheSnapshotMemorySize,
      if (storageCacheSnapshotWriteColdDuration != null)
        'storageCacheSnapshotWriteColdDuration':
            storageCacheSnapshotWriteColdDuration,
      if (storageCompactFullWriteColdDuration != null)
        'storageCompactFullWriteColdDuration':
            storageCompactFullWriteColdDuration,
      if (storageCompactThroughputBurst != null)
        'storageCompactThroughputBurst': storageCompactThroughputBurst,
      if (storageMaxConcurrentCompactions != null)
        'storageMaxConcurrentCompactions': storageMaxConcurrentCompactions,
      if (storageMaxIndexLogFileSize != null)
        'storageMaxIndexLogFileSize': storageMaxIndexLogFileSize,
      if (storageNoValidateFieldSize != null)
        'storageNoValidateFieldSize': storageNoValidateFieldSize,
      if (storageRetentionCheckInterval != null)
        'storageRetentionCheckInterval': storageRetentionCheckInterval,
      if (storageSeriesFileMaxConcurrentSnapshotCompactions != null)
        'storageSeriesFileMaxConcurrentSnapshotCompactions':
            storageSeriesFileMaxConcurrentSnapshotCompactions,
      if (storageSeriesIdSetCacheSize != null)
        'storageSeriesIdSetCacheSize': storageSeriesIdSetCacheSize,
      if (storageWalMaxConcurrentWrites != null)
        'storageWalMaxConcurrentWrites': storageWalMaxConcurrentWrites,
      if (storageWalMaxWriteDelay != null)
        'storageWalMaxWriteDelay': storageWalMaxWriteDelay,
      if (tracingType != null) 'tracingType': tracingType.value,
      if (uiDisabled != null) 'uiDisabled': uiDisabled,
    };
  }
}

/// All the customer-modifiable InfluxDB v3 Core parameters in Timestream for
/// InfluxDB.
///
/// @nodoc
class InfluxDBv3CoreParameters {
  /// Provides custom configuration to DataFusion as a comma-separated list of
  /// key:value pairs.
  final String? dataFusionConfig;

  /// When multiple parquet files are required in a sorted way (deduplication for
  /// example), specifies the maximum fanout.
  ///
  /// Default: 1000
  final int? dataFusionMaxParquetFanout;

  /// Sets the maximum number of DataFusion runtime threads to use.
  final int? dataFusionNumThreads;

  /// Disables the LIFO slot of the DataFusion runtime.
  final bool? dataFusionRuntimeDisableLifoSlot;

  /// Sets the number of scheduler ticks after which the scheduler of the
  /// DataFusion tokio runtime polls for external events–for example: timers, I/O.
  final int? dataFusionRuntimeEventInterval;

  /// Sets the number of scheduler ticks after which the scheduler of the
  /// DataFusion runtime polls the global task queue.
  final int? dataFusionRuntimeGlobalQueueInterval;

  /// Specifies the limit for additional threads spawned by the DataFusion
  /// runtime.
  final int? dataFusionRuntimeMaxBlockingThreads;

  /// Configures the maximum number of events processed per tick by the tokio
  /// DataFusion runtime.
  final int? dataFusionRuntimeMaxIoEventsPerTick;

  /// Sets a custom timeout for a thread in the blocking pool of the tokio
  /// DataFusion runtime.
  final Duration? dataFusionRuntimeThreadKeepAlive;

  /// Sets the thread priority for tokio DataFusion runtime workers.
  ///
  /// Default: 10
  final int? dataFusionRuntimeThreadPriority;

  /// Specifies the DataFusion tokio runtime type.
  ///
  /// Default: multi-thread
  final DataFusionRuntimeType? dataFusionRuntimeType;

  /// Uses a cached parquet loader when reading parquet files from the object
  /// store.
  final bool? dataFusionUseCachedParquetLoader;

  /// Specifies the grace period before permanently deleting data.
  ///
  /// Default: 24h
  final Duration? deleteGracePeriod;

  /// Disables the in-memory Parquet cache. By default, the cache is enabled.
  final bool? disableParquetMemCache;

  /// Specifies the interval to evict expired entries from the distinct value
  /// cache, expressed as a human-readable duration–for example: 20s, 1m, 1h.
  ///
  /// Default: 10s
  final Duration? distinctCacheEvictionInterval;

  /// Specifies the size of memory pool used during query execution. Can be given
  /// as absolute value in bytes or as a percentage of the total available
  /// memory–for example: 8000000000 or 10%.
  ///
  /// Default: 20%
  final PercentOrAbsoluteLong? execMemPoolBytes;

  /// Specifies the threshold for the internal memory buffer. Supports either a
  /// percentage (portion of available memory) or absolute value in MB–for
  /// example: 70% or 100
  ///
  /// Default: 70%
  final PercentOrAbsoluteLong? forceSnapshotMemThreshold;

  /// Specifies the duration that Parquet files are arranged into. Data timestamps
  /// land each row into a file of this duration. Supported durations are 1m, 5m,
  /// and 10m. These files are known as “generation 1” files that the compactor in
  /// InfluxDB 3 Enterprise can merge into larger generations.
  ///
  /// Default: 10m
  final Duration? gen1Duration;

  /// Specifies how far back to look when creating generation 1 Parquet files.
  ///
  /// Default: 24h
  final Duration? gen1LookbackDuration;

  /// Sets the default duration for hard deletion of data.
  ///
  /// Default: 90d
  final Duration? hardDeleteDefaultDuration;

  /// Specifies the interval to evict expired entries from the Last-N-Value cache,
  /// expressed as a human-readable duration–for example: 20s, 1m, 1h.
  ///
  /// Default: 10s
  final Duration? lastCacheEvictionInterval;

  /// Sets the filter directive for logs.
  final String? logFilter;

  /// Defines the message format for logs.
  ///
  /// Default: full
  final LogFormats? logFormat;

  /// Specifies the maximum size of HTTP requests.
  ///
  /// Default: 10485760
  final int? maxHttpRequestSize;

  /// Sets the interval to check if the in-memory Parquet cache needs to be
  /// pruned.
  ///
  /// Default: 1s
  final Duration? parquetMemCachePruneInterval;

  /// Specifies the percentage of entries to prune during a prune operation on the
  /// in-memory Parquet cache.
  ///
  /// Default: 0.1
  final double? parquetMemCachePrunePercentage;

  /// Specifies the time window for caching recent Parquet files in memory.
  ///
  /// Default: 5h
  final Duration? parquetMemCacheQueryPathDuration;

  /// Specifies the size of the in-memory Parquet cache in megabytes or percentage
  /// of total available memory.
  ///
  /// Default: 20%
  final PercentOrAbsoluteLong? parquetMemCacheSize;

  /// Specifies the interval to prefetch into the Parquet cache during compaction.
  ///
  /// Default: 3d
  final Duration? preemptiveCacheAge;

  /// Limits the number of Parquet files a query can access. If a query attempts
  /// to read more than this limit, InfluxDB 3 returns an error.
  ///
  /// Default: 432
  final int? queryFileLimit;

  /// Defines the size of the query log. Up to this many queries remain in the log
  /// before older queries are evicted to make room for new ones.
  ///
  /// Default: 1000
  final int? queryLogSize;

  /// The interval at which retention policies are checked and enforced. Enter as
  /// a human-readable time–for example: 30m or 1h.
  ///
  /// Default: 30m
  final Duration? retentionCheckInterval;

  /// Specifies the number of snapshotted WAL files to retain in the object store.
  /// Flushing the WAL files does not clear the WAL files immediately; they are
  /// deleted when the number of snapshotted WAL files exceeds this number.
  ///
  /// Default: 300
  final int? snapshottedWalFilesToKeep;

  /// Limits the concurrency level for table index cache operations.
  ///
  /// Default: 8
  final int? tableIndexCacheConcurrencyLimit;

  /// Specifies the maximum number of entries in the table index cache.
  ///
  /// Default: 1000
  final int? tableIndexCacheMaxEntries;

  /// Specifies the maximum number of write requests that can be buffered before a
  /// flush must be executed and succeed.
  ///
  /// Default: 100000
  final int? walMaxWriteBufferSize;

  /// Concurrency limit during WAL replay. Setting this number too high can lead
  /// to OOM. The default is dynamically determined.
  ///
  /// Default: max(num_cpus, 10)
  final int? walReplayConcurrencyLimit;

  /// Determines whether WAL replay should fail when encountering errors.
  ///
  /// Default: false
  final bool? walReplayFailOnError;

  /// Defines the number of WAL files to attempt to remove in a snapshot. This,
  /// multiplied by the interval, determines how often snapshots are taken.
  ///
  /// Default: 600
  final int? walSnapshotSize;

  InfluxDBv3CoreParameters({
    this.dataFusionConfig,
    this.dataFusionMaxParquetFanout,
    this.dataFusionNumThreads,
    this.dataFusionRuntimeDisableLifoSlot,
    this.dataFusionRuntimeEventInterval,
    this.dataFusionRuntimeGlobalQueueInterval,
    this.dataFusionRuntimeMaxBlockingThreads,
    this.dataFusionRuntimeMaxIoEventsPerTick,
    this.dataFusionRuntimeThreadKeepAlive,
    this.dataFusionRuntimeThreadPriority,
    this.dataFusionRuntimeType,
    this.dataFusionUseCachedParquetLoader,
    this.deleteGracePeriod,
    this.disableParquetMemCache,
    this.distinctCacheEvictionInterval,
    this.execMemPoolBytes,
    this.forceSnapshotMemThreshold,
    this.gen1Duration,
    this.gen1LookbackDuration,
    this.hardDeleteDefaultDuration,
    this.lastCacheEvictionInterval,
    this.logFilter,
    this.logFormat,
    this.maxHttpRequestSize,
    this.parquetMemCachePruneInterval,
    this.parquetMemCachePrunePercentage,
    this.parquetMemCacheQueryPathDuration,
    this.parquetMemCacheSize,
    this.preemptiveCacheAge,
    this.queryFileLimit,
    this.queryLogSize,
    this.retentionCheckInterval,
    this.snapshottedWalFilesToKeep,
    this.tableIndexCacheConcurrencyLimit,
    this.tableIndexCacheMaxEntries,
    this.walMaxWriteBufferSize,
    this.walReplayConcurrencyLimit,
    this.walReplayFailOnError,
    this.walSnapshotSize,
  });

  factory InfluxDBv3CoreParameters.fromJson(Map<String, dynamic> json) {
    return InfluxDBv3CoreParameters(
      dataFusionConfig: json['dataFusionConfig'] as String?,
      dataFusionMaxParquetFanout: json['dataFusionMaxParquetFanout'] as int?,
      dataFusionNumThreads: json['dataFusionNumThreads'] as int?,
      dataFusionRuntimeDisableLifoSlot:
          json['dataFusionRuntimeDisableLifoSlot'] as bool?,
      dataFusionRuntimeEventInterval:
          json['dataFusionRuntimeEventInterval'] as int?,
      dataFusionRuntimeGlobalQueueInterval:
          json['dataFusionRuntimeGlobalQueueInterval'] as int?,
      dataFusionRuntimeMaxBlockingThreads:
          json['dataFusionRuntimeMaxBlockingThreads'] as int?,
      dataFusionRuntimeMaxIoEventsPerTick:
          json['dataFusionRuntimeMaxIoEventsPerTick'] as int?,
      dataFusionRuntimeThreadKeepAlive:
          json['dataFusionRuntimeThreadKeepAlive'] != null
              ? Duration.fromJson(json['dataFusionRuntimeThreadKeepAlive']
                  as Map<String, dynamic>)
              : null,
      dataFusionRuntimeThreadPriority:
          json['dataFusionRuntimeThreadPriority'] as int?,
      dataFusionRuntimeType: (json['dataFusionRuntimeType'] as String?)
          ?.let(DataFusionRuntimeType.fromString),
      dataFusionUseCachedParquetLoader:
          json['dataFusionUseCachedParquetLoader'] as bool?,
      deleteGracePeriod: json['deleteGracePeriod'] != null
          ? Duration.fromJson(json['deleteGracePeriod'] as Map<String, dynamic>)
          : null,
      disableParquetMemCache: json['disableParquetMemCache'] as bool?,
      distinctCacheEvictionInterval:
          json['distinctCacheEvictionInterval'] != null
              ? Duration.fromJson(
                  json['distinctCacheEvictionInterval'] as Map<String, dynamic>)
              : null,
      execMemPoolBytes: json['execMemPoolBytes'] != null
          ? PercentOrAbsoluteLong.fromJson(
              json['execMemPoolBytes'] as Map<String, dynamic>)
          : null,
      forceSnapshotMemThreshold: json['forceSnapshotMemThreshold'] != null
          ? PercentOrAbsoluteLong.fromJson(
              json['forceSnapshotMemThreshold'] as Map<String, dynamic>)
          : null,
      gen1Duration: json['gen1Duration'] != null
          ? Duration.fromJson(json['gen1Duration'] as Map<String, dynamic>)
          : null,
      gen1LookbackDuration: json['gen1LookbackDuration'] != null
          ? Duration.fromJson(
              json['gen1LookbackDuration'] as Map<String, dynamic>)
          : null,
      hardDeleteDefaultDuration: json['hardDeleteDefaultDuration'] != null
          ? Duration.fromJson(
              json['hardDeleteDefaultDuration'] as Map<String, dynamic>)
          : null,
      lastCacheEvictionInterval: json['lastCacheEvictionInterval'] != null
          ? Duration.fromJson(
              json['lastCacheEvictionInterval'] as Map<String, dynamic>)
          : null,
      logFilter: json['logFilter'] as String?,
      logFormat: (json['logFormat'] as String?)?.let(LogFormats.fromString),
      maxHttpRequestSize: json['maxHttpRequestSize'] as int?,
      parquetMemCachePruneInterval: json['parquetMemCachePruneInterval'] != null
          ? Duration.fromJson(
              json['parquetMemCachePruneInterval'] as Map<String, dynamic>)
          : null,
      parquetMemCachePrunePercentage:
          json['parquetMemCachePrunePercentage'] as double?,
      parquetMemCacheQueryPathDuration:
          json['parquetMemCacheQueryPathDuration'] != null
              ? Duration.fromJson(json['parquetMemCacheQueryPathDuration']
                  as Map<String, dynamic>)
              : null,
      parquetMemCacheSize: json['parquetMemCacheSize'] != null
          ? PercentOrAbsoluteLong.fromJson(
              json['parquetMemCacheSize'] as Map<String, dynamic>)
          : null,
      preemptiveCacheAge: json['preemptiveCacheAge'] != null
          ? Duration.fromJson(
              json['preemptiveCacheAge'] as Map<String, dynamic>)
          : null,
      queryFileLimit: json['queryFileLimit'] as int?,
      queryLogSize: json['queryLogSize'] as int?,
      retentionCheckInterval: json['retentionCheckInterval'] != null
          ? Duration.fromJson(
              json['retentionCheckInterval'] as Map<String, dynamic>)
          : null,
      snapshottedWalFilesToKeep: json['snapshottedWalFilesToKeep'] as int?,
      tableIndexCacheConcurrencyLimit:
          json['tableIndexCacheConcurrencyLimit'] as int?,
      tableIndexCacheMaxEntries: json['tableIndexCacheMaxEntries'] as int?,
      walMaxWriteBufferSize: json['walMaxWriteBufferSize'] as int?,
      walReplayConcurrencyLimit: json['walReplayConcurrencyLimit'] as int?,
      walReplayFailOnError: json['walReplayFailOnError'] as bool?,
      walSnapshotSize: json['walSnapshotSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataFusionConfig = this.dataFusionConfig;
    final dataFusionMaxParquetFanout = this.dataFusionMaxParquetFanout;
    final dataFusionNumThreads = this.dataFusionNumThreads;
    final dataFusionRuntimeDisableLifoSlot =
        this.dataFusionRuntimeDisableLifoSlot;
    final dataFusionRuntimeEventInterval = this.dataFusionRuntimeEventInterval;
    final dataFusionRuntimeGlobalQueueInterval =
        this.dataFusionRuntimeGlobalQueueInterval;
    final dataFusionRuntimeMaxBlockingThreads =
        this.dataFusionRuntimeMaxBlockingThreads;
    final dataFusionRuntimeMaxIoEventsPerTick =
        this.dataFusionRuntimeMaxIoEventsPerTick;
    final dataFusionRuntimeThreadKeepAlive =
        this.dataFusionRuntimeThreadKeepAlive;
    final dataFusionRuntimeThreadPriority =
        this.dataFusionRuntimeThreadPriority;
    final dataFusionRuntimeType = this.dataFusionRuntimeType;
    final dataFusionUseCachedParquetLoader =
        this.dataFusionUseCachedParquetLoader;
    final deleteGracePeriod = this.deleteGracePeriod;
    final disableParquetMemCache = this.disableParquetMemCache;
    final distinctCacheEvictionInterval = this.distinctCacheEvictionInterval;
    final execMemPoolBytes = this.execMemPoolBytes;
    final forceSnapshotMemThreshold = this.forceSnapshotMemThreshold;
    final gen1Duration = this.gen1Duration;
    final gen1LookbackDuration = this.gen1LookbackDuration;
    final hardDeleteDefaultDuration = this.hardDeleteDefaultDuration;
    final lastCacheEvictionInterval = this.lastCacheEvictionInterval;
    final logFilter = this.logFilter;
    final logFormat = this.logFormat;
    final maxHttpRequestSize = this.maxHttpRequestSize;
    final parquetMemCachePruneInterval = this.parquetMemCachePruneInterval;
    final parquetMemCachePrunePercentage = this.parquetMemCachePrunePercentage;
    final parquetMemCacheQueryPathDuration =
        this.parquetMemCacheQueryPathDuration;
    final parquetMemCacheSize = this.parquetMemCacheSize;
    final preemptiveCacheAge = this.preemptiveCacheAge;
    final queryFileLimit = this.queryFileLimit;
    final queryLogSize = this.queryLogSize;
    final retentionCheckInterval = this.retentionCheckInterval;
    final snapshottedWalFilesToKeep = this.snapshottedWalFilesToKeep;
    final tableIndexCacheConcurrencyLimit =
        this.tableIndexCacheConcurrencyLimit;
    final tableIndexCacheMaxEntries = this.tableIndexCacheMaxEntries;
    final walMaxWriteBufferSize = this.walMaxWriteBufferSize;
    final walReplayConcurrencyLimit = this.walReplayConcurrencyLimit;
    final walReplayFailOnError = this.walReplayFailOnError;
    final walSnapshotSize = this.walSnapshotSize;
    return {
      if (dataFusionConfig != null) 'dataFusionConfig': dataFusionConfig,
      if (dataFusionMaxParquetFanout != null)
        'dataFusionMaxParquetFanout': dataFusionMaxParquetFanout,
      if (dataFusionNumThreads != null)
        'dataFusionNumThreads': dataFusionNumThreads,
      if (dataFusionRuntimeDisableLifoSlot != null)
        'dataFusionRuntimeDisableLifoSlot': dataFusionRuntimeDisableLifoSlot,
      if (dataFusionRuntimeEventInterval != null)
        'dataFusionRuntimeEventInterval': dataFusionRuntimeEventInterval,
      if (dataFusionRuntimeGlobalQueueInterval != null)
        'dataFusionRuntimeGlobalQueueInterval':
            dataFusionRuntimeGlobalQueueInterval,
      if (dataFusionRuntimeMaxBlockingThreads != null)
        'dataFusionRuntimeMaxBlockingThreads':
            dataFusionRuntimeMaxBlockingThreads,
      if (dataFusionRuntimeMaxIoEventsPerTick != null)
        'dataFusionRuntimeMaxIoEventsPerTick':
            dataFusionRuntimeMaxIoEventsPerTick,
      if (dataFusionRuntimeThreadKeepAlive != null)
        'dataFusionRuntimeThreadKeepAlive': dataFusionRuntimeThreadKeepAlive,
      if (dataFusionRuntimeThreadPriority != null)
        'dataFusionRuntimeThreadPriority': dataFusionRuntimeThreadPriority,
      if (dataFusionRuntimeType != null)
        'dataFusionRuntimeType': dataFusionRuntimeType.value,
      if (dataFusionUseCachedParquetLoader != null)
        'dataFusionUseCachedParquetLoader': dataFusionUseCachedParquetLoader,
      if (deleteGracePeriod != null) 'deleteGracePeriod': deleteGracePeriod,
      if (disableParquetMemCache != null)
        'disableParquetMemCache': disableParquetMemCache,
      if (distinctCacheEvictionInterval != null)
        'distinctCacheEvictionInterval': distinctCacheEvictionInterval,
      if (execMemPoolBytes != null) 'execMemPoolBytes': execMemPoolBytes,
      if (forceSnapshotMemThreshold != null)
        'forceSnapshotMemThreshold': forceSnapshotMemThreshold,
      if (gen1Duration != null) 'gen1Duration': gen1Duration,
      if (gen1LookbackDuration != null)
        'gen1LookbackDuration': gen1LookbackDuration,
      if (hardDeleteDefaultDuration != null)
        'hardDeleteDefaultDuration': hardDeleteDefaultDuration,
      if (lastCacheEvictionInterval != null)
        'lastCacheEvictionInterval': lastCacheEvictionInterval,
      if (logFilter != null) 'logFilter': logFilter,
      if (logFormat != null) 'logFormat': logFormat.value,
      if (maxHttpRequestSize != null) 'maxHttpRequestSize': maxHttpRequestSize,
      if (parquetMemCachePruneInterval != null)
        'parquetMemCachePruneInterval': parquetMemCachePruneInterval,
      if (parquetMemCachePrunePercentage != null)
        'parquetMemCachePrunePercentage': parquetMemCachePrunePercentage,
      if (parquetMemCacheQueryPathDuration != null)
        'parquetMemCacheQueryPathDuration': parquetMemCacheQueryPathDuration,
      if (parquetMemCacheSize != null)
        'parquetMemCacheSize': parquetMemCacheSize,
      if (preemptiveCacheAge != null) 'preemptiveCacheAge': preemptiveCacheAge,
      if (queryFileLimit != null) 'queryFileLimit': queryFileLimit,
      if (queryLogSize != null) 'queryLogSize': queryLogSize,
      if (retentionCheckInterval != null)
        'retentionCheckInterval': retentionCheckInterval,
      if (snapshottedWalFilesToKeep != null)
        'snapshottedWalFilesToKeep': snapshottedWalFilesToKeep,
      if (tableIndexCacheConcurrencyLimit != null)
        'tableIndexCacheConcurrencyLimit': tableIndexCacheConcurrencyLimit,
      if (tableIndexCacheMaxEntries != null)
        'tableIndexCacheMaxEntries': tableIndexCacheMaxEntries,
      if (walMaxWriteBufferSize != null)
        'walMaxWriteBufferSize': walMaxWriteBufferSize,
      if (walReplayConcurrencyLimit != null)
        'walReplayConcurrencyLimit': walReplayConcurrencyLimit,
      if (walReplayFailOnError != null)
        'walReplayFailOnError': walReplayFailOnError,
      if (walSnapshotSize != null) 'walSnapshotSize': walSnapshotSize,
    };
  }
}

/// All the customer-modifiable InfluxDB v3 Enterprise parameters in Timestream
/// for InfluxDB.
///
/// @nodoc
class InfluxDBv3EnterpriseParameters {
  /// Specifies if the compactor instance should be a standalone instance or not.
  final bool dedicatedCompactor;

  /// Specifies number of instances in the DbCluster which can both ingest and
  /// query.
  final int ingestQueryInstances;

  /// Specifies number of instances in the DbCluster which can only query.
  final int queryOnlyInstances;

  /// Defines how often the catalog synchronizes across cluster nodes.
  ///
  /// Default: 10s
  final Duration? catalogSyncInterval;

  /// Specifies how often the compactor checks for new compaction work to perform.
  ///
  /// Default: 10s
  final Duration? compactionCheckInterval;

  /// Specifies the amount of time that the compactor waits after finishing a
  /// compaction run to delete files marked as needing deletion during that
  /// compaction run.
  ///
  /// Default: 10m
  final Duration? compactionCleanupWait;

  /// Specifies the duration of the first level of compaction (gen2). Later levels
  /// of compaction are multiples of this duration. This value should be equal to
  /// or greater than the gen1 duration.
  ///
  /// Default: 20m
  final Duration? compactionGen2Duration;

  /// Sets the maximum number of files included in any compaction plan.
  ///
  /// Default: 500
  final int? compactionMaxNumFilesPerPlan;

  /// Specifies a comma-separated list of multiples defining the duration of each
  /// level of compaction. The number of elements in the list determines the
  /// number of compaction levels. The first element specifies the duration of the
  /// first level (gen3); subsequent levels are multiples of the previous level.
  ///
  /// Default: 3,4,6,5
  final String? compactionMultipliers;

  /// Specifies the soft limit for the number of rows per file that the compactor
  /// writes. The compactor may write more rows than this limit.
  ///
  /// Default: 1000000
  final int? compactionRowLimit;

  /// Provides custom configuration to DataFusion as a comma-separated list of
  /// key:value pairs.
  final String? dataFusionConfig;

  /// When multiple parquet files are required in a sorted way (deduplication for
  /// example), specifies the maximum fanout.
  ///
  /// Default: 1000
  final int? dataFusionMaxParquetFanout;

  /// Sets the maximum number of DataFusion runtime threads to use.
  final int? dataFusionNumThreads;

  /// Disables the LIFO slot of the DataFusion runtime.
  final bool? dataFusionRuntimeDisableLifoSlot;

  /// Sets the number of scheduler ticks after which the scheduler of the
  /// DataFusion tokio runtime polls for external events–for example: timers, I/O.
  final int? dataFusionRuntimeEventInterval;

  /// Sets the number of scheduler ticks after which the scheduler of the
  /// DataFusion runtime polls the global task queue.
  final int? dataFusionRuntimeGlobalQueueInterval;

  /// Specifies the limit for additional threads spawned by the DataFusion
  /// runtime.
  final int? dataFusionRuntimeMaxBlockingThreads;

  /// Configures the maximum number of events processed per tick by the tokio
  /// DataFusion runtime.
  final int? dataFusionRuntimeMaxIoEventsPerTick;

  /// Sets a custom timeout for a thread in the blocking pool of the tokio
  /// DataFusion runtime.
  final Duration? dataFusionRuntimeThreadKeepAlive;

  /// Sets the thread priority for tokio DataFusion runtime workers.
  ///
  /// Default: 10
  final int? dataFusionRuntimeThreadPriority;

  /// Specifies the DataFusion tokio runtime type.
  ///
  /// Default: multi-thread
  final DataFusionRuntimeType? dataFusionRuntimeType;

  /// Uses a cached parquet loader when reading parquet files from the object
  /// store.
  final bool? dataFusionUseCachedParquetLoader;

  /// Specifies the grace period before permanently deleting data.
  ///
  /// Default: 24h
  final Duration? deleteGracePeriod;

  /// Disables the in-memory Parquet cache. By default, the cache is enabled.
  final bool? disableParquetMemCache;

  /// Specifies the interval to evict expired entries from the distinct value
  /// cache, expressed as a human-readable duration–for example: 20s, 1m, 1h.
  ///
  /// Default: 10s
  final Duration? distinctCacheEvictionInterval;

  /// Disables populating the distinct value cache from historical data. If
  /// disabled, the cache is still populated with data from the write-ahead log
  /// (WAL).
  final bool? distinctValueCacheDisableFromHistory;

  /// Specifies the size of memory pool used during query execution. Can be given
  /// as absolute value in bytes or as a percentage of the total available
  /// memory–for example: 8000000000 or 10%.
  ///
  /// Default: 20%
  final PercentOrAbsoluteLong? execMemPoolBytes;

  /// Specifies the threshold for the internal memory buffer. Supports either a
  /// percentage (portion of available memory) or absolute value in MB–for
  /// example: 70% or 100
  ///
  /// Default: 70%
  final PercentOrAbsoluteLong? forceSnapshotMemThreshold;

  /// Specifies the duration that Parquet files are arranged into. Data timestamps
  /// land each row into a file of this duration. Supported durations are 1m, 5m,
  /// and 10m. These files are known as “generation 1” files, which the compactor
  /// can merge into larger generations.
  ///
  /// Default: 10m
  final Duration? gen1Duration;

  /// Specifies how far back to look when creating generation 1 Parquet files.
  ///
  /// Default: 24h
  final Duration? gen1LookbackDuration;

  /// Sets the default duration for hard deletion of data.
  ///
  /// Default: 90d
  final Duration? hardDeleteDefaultDuration;

  /// Specifies the interval to evict expired entries from the Last-N-Value cache,
  /// expressed as a human-readable duration–for example: 20s, 1m, 1h.
  ///
  /// Default: 10s
  final Duration? lastCacheEvictionInterval;

  /// Disables populating the last-N-value cache from historical data. If
  /// disabled, the cache is still populated with data from the write-ahead log
  /// (WAL).
  final bool? lastValueCacheDisableFromHistory;

  /// Sets the filter directive for logs.
  final String? logFilter;

  /// Defines the message format for logs.
  ///
  /// Default: full
  final LogFormats? logFormat;

  /// Specifies the maximum size of HTTP requests.
  ///
  /// Default: 10485760
  final int? maxHttpRequestSize;

  /// Sets the interval to check if the in-memory Parquet cache needs to be
  /// pruned.
  ///
  /// Default: 1s
  final Duration? parquetMemCachePruneInterval;

  /// Specifies the percentage of entries to prune during a prune operation on the
  /// in-memory Parquet cache.
  ///
  /// Default: 0.1
  final double? parquetMemCachePrunePercentage;

  /// Specifies the time window for caching recent Parquet files in memory.
  ///
  /// Default: 5h
  final Duration? parquetMemCacheQueryPathDuration;

  /// Specifies the size of the in-memory Parquet cache in megabytes or percentage
  /// of total available memory.
  ///
  /// Default: 20%
  final PercentOrAbsoluteLong? parquetMemCacheSize;

  /// Specifies the interval to prefetch into the Parquet cache during compaction.
  ///
  /// Default: 3d
  final Duration? preemptiveCacheAge;

  /// Limits the number of Parquet files a query can access. If a query attempts
  /// to read more than this limit, InfluxDB 3 returns an error.
  ///
  /// Default: 432
  final int? queryFileLimit;

  /// Defines the size of the query log. Up to this many queries remain in the log
  /// before older queries are evicted to make room for new ones.
  ///
  /// Default: 1000
  final int? queryLogSize;

  /// Specifies the interval at which data replication occurs between cluster
  /// nodes.
  ///
  /// Default: 250ms
  final Duration? replicationInterval;

  /// The interval at which retention policies are checked and enforced. Enter as
  /// a human-readable time–for example: 30m or 1h.
  ///
  /// Default: 30m
  final Duration? retentionCheckInterval;

  /// Specifies the number of snapshotted WAL files to retain in the object store.
  /// Flushing the WAL files does not clear the WAL files immediately; they are
  /// deleted when the number of snapshotted WAL files exceeds this number.
  ///
  /// Default: 300
  final int? snapshottedWalFilesToKeep;

  /// Limits the concurrency level for table index cache operations.
  ///
  /// Default: 8
  final int? tableIndexCacheConcurrencyLimit;

  /// Specifies the maximum number of entries in the table index cache.
  ///
  /// Default: 1000
  final int? tableIndexCacheMaxEntries;

  /// Specifies the maximum number of write requests that can be buffered before a
  /// flush must be executed and succeed.
  ///
  /// Default: 100000
  final int? walMaxWriteBufferSize;

  /// Concurrency limit during WAL replay. Setting this number too high can lead
  /// to OOM. The default is dynamically determined.
  ///
  /// Default: max(num_cpus, 10)
  final int? walReplayConcurrencyLimit;

  /// Determines whether WAL replay should fail when encountering errors.
  ///
  /// Default: false
  final bool? walReplayFailOnError;

  /// Defines the number of WAL files to attempt to remove in a snapshot. This,
  /// multiplied by the interval, determines how often snapshots are taken.
  ///
  /// Default: 600
  final int? walSnapshotSize;

  InfluxDBv3EnterpriseParameters({
    required this.dedicatedCompactor,
    required this.ingestQueryInstances,
    required this.queryOnlyInstances,
    this.catalogSyncInterval,
    this.compactionCheckInterval,
    this.compactionCleanupWait,
    this.compactionGen2Duration,
    this.compactionMaxNumFilesPerPlan,
    this.compactionMultipliers,
    this.compactionRowLimit,
    this.dataFusionConfig,
    this.dataFusionMaxParquetFanout,
    this.dataFusionNumThreads,
    this.dataFusionRuntimeDisableLifoSlot,
    this.dataFusionRuntimeEventInterval,
    this.dataFusionRuntimeGlobalQueueInterval,
    this.dataFusionRuntimeMaxBlockingThreads,
    this.dataFusionRuntimeMaxIoEventsPerTick,
    this.dataFusionRuntimeThreadKeepAlive,
    this.dataFusionRuntimeThreadPriority,
    this.dataFusionRuntimeType,
    this.dataFusionUseCachedParquetLoader,
    this.deleteGracePeriod,
    this.disableParquetMemCache,
    this.distinctCacheEvictionInterval,
    this.distinctValueCacheDisableFromHistory,
    this.execMemPoolBytes,
    this.forceSnapshotMemThreshold,
    this.gen1Duration,
    this.gen1LookbackDuration,
    this.hardDeleteDefaultDuration,
    this.lastCacheEvictionInterval,
    this.lastValueCacheDisableFromHistory,
    this.logFilter,
    this.logFormat,
    this.maxHttpRequestSize,
    this.parquetMemCachePruneInterval,
    this.parquetMemCachePrunePercentage,
    this.parquetMemCacheQueryPathDuration,
    this.parquetMemCacheSize,
    this.preemptiveCacheAge,
    this.queryFileLimit,
    this.queryLogSize,
    this.replicationInterval,
    this.retentionCheckInterval,
    this.snapshottedWalFilesToKeep,
    this.tableIndexCacheConcurrencyLimit,
    this.tableIndexCacheMaxEntries,
    this.walMaxWriteBufferSize,
    this.walReplayConcurrencyLimit,
    this.walReplayFailOnError,
    this.walSnapshotSize,
  });

  factory InfluxDBv3EnterpriseParameters.fromJson(Map<String, dynamic> json) {
    return InfluxDBv3EnterpriseParameters(
      dedicatedCompactor: (json['dedicatedCompactor'] as bool?) ?? false,
      ingestQueryInstances: (json['ingestQueryInstances'] as int?) ?? 0,
      queryOnlyInstances: (json['queryOnlyInstances'] as int?) ?? 0,
      catalogSyncInterval: json['catalogSyncInterval'] != null
          ? Duration.fromJson(
              json['catalogSyncInterval'] as Map<String, dynamic>)
          : null,
      compactionCheckInterval: json['compactionCheckInterval'] != null
          ? Duration.fromJson(
              json['compactionCheckInterval'] as Map<String, dynamic>)
          : null,
      compactionCleanupWait: json['compactionCleanupWait'] != null
          ? Duration.fromJson(
              json['compactionCleanupWait'] as Map<String, dynamic>)
          : null,
      compactionGen2Duration: json['compactionGen2Duration'] != null
          ? Duration.fromJson(
              json['compactionGen2Duration'] as Map<String, dynamic>)
          : null,
      compactionMaxNumFilesPerPlan:
          json['compactionMaxNumFilesPerPlan'] as int?,
      compactionMultipliers: json['compactionMultipliers'] as String?,
      compactionRowLimit: json['compactionRowLimit'] as int?,
      dataFusionConfig: json['dataFusionConfig'] as String?,
      dataFusionMaxParquetFanout: json['dataFusionMaxParquetFanout'] as int?,
      dataFusionNumThreads: json['dataFusionNumThreads'] as int?,
      dataFusionRuntimeDisableLifoSlot:
          json['dataFusionRuntimeDisableLifoSlot'] as bool?,
      dataFusionRuntimeEventInterval:
          json['dataFusionRuntimeEventInterval'] as int?,
      dataFusionRuntimeGlobalQueueInterval:
          json['dataFusionRuntimeGlobalQueueInterval'] as int?,
      dataFusionRuntimeMaxBlockingThreads:
          json['dataFusionRuntimeMaxBlockingThreads'] as int?,
      dataFusionRuntimeMaxIoEventsPerTick:
          json['dataFusionRuntimeMaxIoEventsPerTick'] as int?,
      dataFusionRuntimeThreadKeepAlive:
          json['dataFusionRuntimeThreadKeepAlive'] != null
              ? Duration.fromJson(json['dataFusionRuntimeThreadKeepAlive']
                  as Map<String, dynamic>)
              : null,
      dataFusionRuntimeThreadPriority:
          json['dataFusionRuntimeThreadPriority'] as int?,
      dataFusionRuntimeType: (json['dataFusionRuntimeType'] as String?)
          ?.let(DataFusionRuntimeType.fromString),
      dataFusionUseCachedParquetLoader:
          json['dataFusionUseCachedParquetLoader'] as bool?,
      deleteGracePeriod: json['deleteGracePeriod'] != null
          ? Duration.fromJson(json['deleteGracePeriod'] as Map<String, dynamic>)
          : null,
      disableParquetMemCache: json['disableParquetMemCache'] as bool?,
      distinctCacheEvictionInterval:
          json['distinctCacheEvictionInterval'] != null
              ? Duration.fromJson(
                  json['distinctCacheEvictionInterval'] as Map<String, dynamic>)
              : null,
      distinctValueCacheDisableFromHistory:
          json['distinctValueCacheDisableFromHistory'] as bool?,
      execMemPoolBytes: json['execMemPoolBytes'] != null
          ? PercentOrAbsoluteLong.fromJson(
              json['execMemPoolBytes'] as Map<String, dynamic>)
          : null,
      forceSnapshotMemThreshold: json['forceSnapshotMemThreshold'] != null
          ? PercentOrAbsoluteLong.fromJson(
              json['forceSnapshotMemThreshold'] as Map<String, dynamic>)
          : null,
      gen1Duration: json['gen1Duration'] != null
          ? Duration.fromJson(json['gen1Duration'] as Map<String, dynamic>)
          : null,
      gen1LookbackDuration: json['gen1LookbackDuration'] != null
          ? Duration.fromJson(
              json['gen1LookbackDuration'] as Map<String, dynamic>)
          : null,
      hardDeleteDefaultDuration: json['hardDeleteDefaultDuration'] != null
          ? Duration.fromJson(
              json['hardDeleteDefaultDuration'] as Map<String, dynamic>)
          : null,
      lastCacheEvictionInterval: json['lastCacheEvictionInterval'] != null
          ? Duration.fromJson(
              json['lastCacheEvictionInterval'] as Map<String, dynamic>)
          : null,
      lastValueCacheDisableFromHistory:
          json['lastValueCacheDisableFromHistory'] as bool?,
      logFilter: json['logFilter'] as String?,
      logFormat: (json['logFormat'] as String?)?.let(LogFormats.fromString),
      maxHttpRequestSize: json['maxHttpRequestSize'] as int?,
      parquetMemCachePruneInterval: json['parquetMemCachePruneInterval'] != null
          ? Duration.fromJson(
              json['parquetMemCachePruneInterval'] as Map<String, dynamic>)
          : null,
      parquetMemCachePrunePercentage:
          json['parquetMemCachePrunePercentage'] as double?,
      parquetMemCacheQueryPathDuration:
          json['parquetMemCacheQueryPathDuration'] != null
              ? Duration.fromJson(json['parquetMemCacheQueryPathDuration']
                  as Map<String, dynamic>)
              : null,
      parquetMemCacheSize: json['parquetMemCacheSize'] != null
          ? PercentOrAbsoluteLong.fromJson(
              json['parquetMemCacheSize'] as Map<String, dynamic>)
          : null,
      preemptiveCacheAge: json['preemptiveCacheAge'] != null
          ? Duration.fromJson(
              json['preemptiveCacheAge'] as Map<String, dynamic>)
          : null,
      queryFileLimit: json['queryFileLimit'] as int?,
      queryLogSize: json['queryLogSize'] as int?,
      replicationInterval: json['replicationInterval'] != null
          ? Duration.fromJson(
              json['replicationInterval'] as Map<String, dynamic>)
          : null,
      retentionCheckInterval: json['retentionCheckInterval'] != null
          ? Duration.fromJson(
              json['retentionCheckInterval'] as Map<String, dynamic>)
          : null,
      snapshottedWalFilesToKeep: json['snapshottedWalFilesToKeep'] as int?,
      tableIndexCacheConcurrencyLimit:
          json['tableIndexCacheConcurrencyLimit'] as int?,
      tableIndexCacheMaxEntries: json['tableIndexCacheMaxEntries'] as int?,
      walMaxWriteBufferSize: json['walMaxWriteBufferSize'] as int?,
      walReplayConcurrencyLimit: json['walReplayConcurrencyLimit'] as int?,
      walReplayFailOnError: json['walReplayFailOnError'] as bool?,
      walSnapshotSize: json['walSnapshotSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dedicatedCompactor = this.dedicatedCompactor;
    final ingestQueryInstances = this.ingestQueryInstances;
    final queryOnlyInstances = this.queryOnlyInstances;
    final catalogSyncInterval = this.catalogSyncInterval;
    final compactionCheckInterval = this.compactionCheckInterval;
    final compactionCleanupWait = this.compactionCleanupWait;
    final compactionGen2Duration = this.compactionGen2Duration;
    final compactionMaxNumFilesPerPlan = this.compactionMaxNumFilesPerPlan;
    final compactionMultipliers = this.compactionMultipliers;
    final compactionRowLimit = this.compactionRowLimit;
    final dataFusionConfig = this.dataFusionConfig;
    final dataFusionMaxParquetFanout = this.dataFusionMaxParquetFanout;
    final dataFusionNumThreads = this.dataFusionNumThreads;
    final dataFusionRuntimeDisableLifoSlot =
        this.dataFusionRuntimeDisableLifoSlot;
    final dataFusionRuntimeEventInterval = this.dataFusionRuntimeEventInterval;
    final dataFusionRuntimeGlobalQueueInterval =
        this.dataFusionRuntimeGlobalQueueInterval;
    final dataFusionRuntimeMaxBlockingThreads =
        this.dataFusionRuntimeMaxBlockingThreads;
    final dataFusionRuntimeMaxIoEventsPerTick =
        this.dataFusionRuntimeMaxIoEventsPerTick;
    final dataFusionRuntimeThreadKeepAlive =
        this.dataFusionRuntimeThreadKeepAlive;
    final dataFusionRuntimeThreadPriority =
        this.dataFusionRuntimeThreadPriority;
    final dataFusionRuntimeType = this.dataFusionRuntimeType;
    final dataFusionUseCachedParquetLoader =
        this.dataFusionUseCachedParquetLoader;
    final deleteGracePeriod = this.deleteGracePeriod;
    final disableParquetMemCache = this.disableParquetMemCache;
    final distinctCacheEvictionInterval = this.distinctCacheEvictionInterval;
    final distinctValueCacheDisableFromHistory =
        this.distinctValueCacheDisableFromHistory;
    final execMemPoolBytes = this.execMemPoolBytes;
    final forceSnapshotMemThreshold = this.forceSnapshotMemThreshold;
    final gen1Duration = this.gen1Duration;
    final gen1LookbackDuration = this.gen1LookbackDuration;
    final hardDeleteDefaultDuration = this.hardDeleteDefaultDuration;
    final lastCacheEvictionInterval = this.lastCacheEvictionInterval;
    final lastValueCacheDisableFromHistory =
        this.lastValueCacheDisableFromHistory;
    final logFilter = this.logFilter;
    final logFormat = this.logFormat;
    final maxHttpRequestSize = this.maxHttpRequestSize;
    final parquetMemCachePruneInterval = this.parquetMemCachePruneInterval;
    final parquetMemCachePrunePercentage = this.parquetMemCachePrunePercentage;
    final parquetMemCacheQueryPathDuration =
        this.parquetMemCacheQueryPathDuration;
    final parquetMemCacheSize = this.parquetMemCacheSize;
    final preemptiveCacheAge = this.preemptiveCacheAge;
    final queryFileLimit = this.queryFileLimit;
    final queryLogSize = this.queryLogSize;
    final replicationInterval = this.replicationInterval;
    final retentionCheckInterval = this.retentionCheckInterval;
    final snapshottedWalFilesToKeep = this.snapshottedWalFilesToKeep;
    final tableIndexCacheConcurrencyLimit =
        this.tableIndexCacheConcurrencyLimit;
    final tableIndexCacheMaxEntries = this.tableIndexCacheMaxEntries;
    final walMaxWriteBufferSize = this.walMaxWriteBufferSize;
    final walReplayConcurrencyLimit = this.walReplayConcurrencyLimit;
    final walReplayFailOnError = this.walReplayFailOnError;
    final walSnapshotSize = this.walSnapshotSize;
    return {
      'dedicatedCompactor': dedicatedCompactor,
      'ingestQueryInstances': ingestQueryInstances,
      'queryOnlyInstances': queryOnlyInstances,
      if (catalogSyncInterval != null)
        'catalogSyncInterval': catalogSyncInterval,
      if (compactionCheckInterval != null)
        'compactionCheckInterval': compactionCheckInterval,
      if (compactionCleanupWait != null)
        'compactionCleanupWait': compactionCleanupWait,
      if (compactionGen2Duration != null)
        'compactionGen2Duration': compactionGen2Duration,
      if (compactionMaxNumFilesPerPlan != null)
        'compactionMaxNumFilesPerPlan': compactionMaxNumFilesPerPlan,
      if (compactionMultipliers != null)
        'compactionMultipliers': compactionMultipliers,
      if (compactionRowLimit != null) 'compactionRowLimit': compactionRowLimit,
      if (dataFusionConfig != null) 'dataFusionConfig': dataFusionConfig,
      if (dataFusionMaxParquetFanout != null)
        'dataFusionMaxParquetFanout': dataFusionMaxParquetFanout,
      if (dataFusionNumThreads != null)
        'dataFusionNumThreads': dataFusionNumThreads,
      if (dataFusionRuntimeDisableLifoSlot != null)
        'dataFusionRuntimeDisableLifoSlot': dataFusionRuntimeDisableLifoSlot,
      if (dataFusionRuntimeEventInterval != null)
        'dataFusionRuntimeEventInterval': dataFusionRuntimeEventInterval,
      if (dataFusionRuntimeGlobalQueueInterval != null)
        'dataFusionRuntimeGlobalQueueInterval':
            dataFusionRuntimeGlobalQueueInterval,
      if (dataFusionRuntimeMaxBlockingThreads != null)
        'dataFusionRuntimeMaxBlockingThreads':
            dataFusionRuntimeMaxBlockingThreads,
      if (dataFusionRuntimeMaxIoEventsPerTick != null)
        'dataFusionRuntimeMaxIoEventsPerTick':
            dataFusionRuntimeMaxIoEventsPerTick,
      if (dataFusionRuntimeThreadKeepAlive != null)
        'dataFusionRuntimeThreadKeepAlive': dataFusionRuntimeThreadKeepAlive,
      if (dataFusionRuntimeThreadPriority != null)
        'dataFusionRuntimeThreadPriority': dataFusionRuntimeThreadPriority,
      if (dataFusionRuntimeType != null)
        'dataFusionRuntimeType': dataFusionRuntimeType.value,
      if (dataFusionUseCachedParquetLoader != null)
        'dataFusionUseCachedParquetLoader': dataFusionUseCachedParquetLoader,
      if (deleteGracePeriod != null) 'deleteGracePeriod': deleteGracePeriod,
      if (disableParquetMemCache != null)
        'disableParquetMemCache': disableParquetMemCache,
      if (distinctCacheEvictionInterval != null)
        'distinctCacheEvictionInterval': distinctCacheEvictionInterval,
      if (distinctValueCacheDisableFromHistory != null)
        'distinctValueCacheDisableFromHistory':
            distinctValueCacheDisableFromHistory,
      if (execMemPoolBytes != null) 'execMemPoolBytes': execMemPoolBytes,
      if (forceSnapshotMemThreshold != null)
        'forceSnapshotMemThreshold': forceSnapshotMemThreshold,
      if (gen1Duration != null) 'gen1Duration': gen1Duration,
      if (gen1LookbackDuration != null)
        'gen1LookbackDuration': gen1LookbackDuration,
      if (hardDeleteDefaultDuration != null)
        'hardDeleteDefaultDuration': hardDeleteDefaultDuration,
      if (lastCacheEvictionInterval != null)
        'lastCacheEvictionInterval': lastCacheEvictionInterval,
      if (lastValueCacheDisableFromHistory != null)
        'lastValueCacheDisableFromHistory': lastValueCacheDisableFromHistory,
      if (logFilter != null) 'logFilter': logFilter,
      if (logFormat != null) 'logFormat': logFormat.value,
      if (maxHttpRequestSize != null) 'maxHttpRequestSize': maxHttpRequestSize,
      if (parquetMemCachePruneInterval != null)
        'parquetMemCachePruneInterval': parquetMemCachePruneInterval,
      if (parquetMemCachePrunePercentage != null)
        'parquetMemCachePrunePercentage': parquetMemCachePrunePercentage,
      if (parquetMemCacheQueryPathDuration != null)
        'parquetMemCacheQueryPathDuration': parquetMemCacheQueryPathDuration,
      if (parquetMemCacheSize != null)
        'parquetMemCacheSize': parquetMemCacheSize,
      if (preemptiveCacheAge != null) 'preemptiveCacheAge': preemptiveCacheAge,
      if (queryFileLimit != null) 'queryFileLimit': queryFileLimit,
      if (queryLogSize != null) 'queryLogSize': queryLogSize,
      if (replicationInterval != null)
        'replicationInterval': replicationInterval,
      if (retentionCheckInterval != null)
        'retentionCheckInterval': retentionCheckInterval,
      if (snapshottedWalFilesToKeep != null)
        'snapshottedWalFilesToKeep': snapshottedWalFilesToKeep,
      if (tableIndexCacheConcurrencyLimit != null)
        'tableIndexCacheConcurrencyLimit': tableIndexCacheConcurrencyLimit,
      if (tableIndexCacheMaxEntries != null)
        'tableIndexCacheMaxEntries': tableIndexCacheMaxEntries,
      if (walMaxWriteBufferSize != null)
        'walMaxWriteBufferSize': walMaxWriteBufferSize,
      if (walReplayConcurrencyLimit != null)
        'walReplayConcurrencyLimit': walReplayConcurrencyLimit,
      if (walReplayFailOnError != null)
        'walReplayFailOnError': walReplayFailOnError,
      if (walSnapshotSize != null) 'walSnapshotSize': walSnapshotSize,
    };
  }
}

/// @nodoc
class LogFormats {
  static const full = LogFormats._('full');

  final String value;

  const LogFormats._(this.value);

  static const values = [full];

  static LogFormats fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogFormats._(value));

  @override
  bool operator ==(other) => other is LogFormats && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DataFusionRuntimeType {
  static const multiThread = DataFusionRuntimeType._('multi-thread');
  static const multiThreadAlt = DataFusionRuntimeType._('multi-thread-alt');

  final String value;

  const DataFusionRuntimeType._(this.value);

  static const values = [multiThread, multiThreadAlt];

  static DataFusionRuntimeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataFusionRuntimeType._(value));

  @override
  bool operator ==(other) =>
      other is DataFusionRuntimeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Duration for InfluxDB parameters in Timestream for InfluxDB.
///
/// @nodoc
class Duration {
  /// The type of duration for InfluxDB parameters.
  final DurationType durationType;

  /// The value of duration for InfluxDB parameters.
  final int value;

  Duration({
    required this.durationType,
    required this.value,
  });

  factory Duration.fromJson(Map<String, dynamic> json) {
    return Duration(
      durationType:
          DurationType.fromString((json['durationType'] as String?) ?? ''),
      value: (json['value'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final durationType = this.durationType;
    final value = this.value;
    return {
      'durationType': durationType.value,
      'value': value,
    };
  }
}

/// Percent or Absolute Long for InfluxDB parameters
///
/// @nodoc
class PercentOrAbsoluteLong {
  /// Absolute long for InfluxDB parameters.
  final int? absolute;

  /// Percent for InfluxDB parameters.
  final String? percent;

  PercentOrAbsoluteLong({
    this.absolute,
    this.percent,
  });

  factory PercentOrAbsoluteLong.fromJson(Map<String, dynamic> json) {
    return PercentOrAbsoluteLong(
      absolute: json['absolute'] as int?,
      percent: json['percent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final absolute = this.absolute;
    final percent = this.percent;
    return {
      if (absolute != null) 'absolute': absolute,
      if (percent != null) 'percent': percent,
    };
  }
}

/// @nodoc
class DurationType {
  static const hours = DurationType._('hours');
  static const minutes = DurationType._('minutes');
  static const seconds = DurationType._('seconds');
  static const milliseconds = DurationType._('milliseconds');
  static const days = DurationType._('days');

  final String value;

  const DurationType._(this.value);

  static const values = [hours, minutes, seconds, milliseconds, days];

  static DurationType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DurationType._(value));

  @override
  bool operator ==(other) => other is DurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LogLevel {
  static const debug = LogLevel._('debug');
  static const info = LogLevel._('info');
  static const error = LogLevel._('error');

  final String value;

  const LogLevel._(this.value);

  static const values = [debug, info, error];

  static LogLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogLevel._(value));

  @override
  bool operator ==(other) => other is LogLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TracingType {
  static const log = TracingType._('log');
  static const jaeger = TracingType._('jaeger');
  static const disabled = TracingType._('disabled');

  final String value;

  const TracingType._(this.value);

  static const values = [log, jaeger, disabled];

  static TracingType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TracingType._(value));

  @override
  bool operator ==(other) => other is TracingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Status {
  static const creating = Status._('CREATING');
  static const available = Status._('AVAILABLE');
  static const deleting = Status._('DELETING');
  static const modifying = Status._('MODIFYING');
  static const updating = Status._('UPDATING');
  static const deleted = Status._('DELETED');
  static const failed = Status._('FAILED');
  static const updatingDeploymentType = Status._('UPDATING_DEPLOYMENT_TYPE');
  static const updatingInstanceType = Status._('UPDATING_INSTANCE_TYPE');
  static const maintenance = Status._('MAINTENANCE');
  static const rebooting = Status._('REBOOTING');
  static const rebootFailed = Status._('REBOOT_FAILED');

  final String value;

  const Status._(this.value);

  static const values = [
    creating,
    available,
    deleting,
    modifying,
    updating,
    deleted,
    failed,
    updatingDeploymentType,
    updatingInstanceType,
    maintenance,
    rebooting,
    rebootFailed
  ];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

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

/// @nodoc
class DbInstanceType {
  static const dbInfluxMedium = DbInstanceType._('db.influx.medium');
  static const dbInfluxLarge = DbInstanceType._('db.influx.large');
  static const dbInfluxXlarge = DbInstanceType._('db.influx.xlarge');
  static const dbInflux_2xlarge = DbInstanceType._('db.influx.2xlarge');
  static const dbInflux_4xlarge = DbInstanceType._('db.influx.4xlarge');
  static const dbInflux_8xlarge = DbInstanceType._('db.influx.8xlarge');
  static const dbInflux_12xlarge = DbInstanceType._('db.influx.12xlarge');
  static const dbInflux_16xlarge = DbInstanceType._('db.influx.16xlarge');
  static const dbInflux_24xlarge = DbInstanceType._('db.influx.24xlarge');

  final String value;

  const DbInstanceType._(this.value);

  static const values = [
    dbInfluxMedium,
    dbInfluxLarge,
    dbInfluxXlarge,
    dbInflux_2xlarge,
    dbInflux_4xlarge,
    dbInflux_8xlarge,
    dbInflux_12xlarge,
    dbInflux_16xlarge,
    dbInflux_24xlarge
  ];

  static DbInstanceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DbInstanceType._(value));

  @override
  bool operator ==(other) => other is DbInstanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DbStorageType {
  static const influxIOIncludedT1 = DbStorageType._('InfluxIOIncludedT1');
  static const influxIOIncludedT2 = DbStorageType._('InfluxIOIncludedT2');
  static const influxIOIncludedT3 = DbStorageType._('InfluxIOIncludedT3');

  final String value;

  const DbStorageType._(this.value);

  static const values = [
    influxIOIncludedT1,
    influxIOIncludedT2,
    influxIOIncludedT3
  ];

  static DbStorageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DbStorageType._(value));

  @override
  bool operator ==(other) => other is DbStorageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DeploymentType {
  static const singleAz = DeploymentType._('SINGLE_AZ');
  static const withMultiazStandby = DeploymentType._('WITH_MULTIAZ_STANDBY');

  final String value;

  const DeploymentType._(this.value);

  static const values = [singleAz, withMultiazStandby];

  static DeploymentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeploymentType._(value));

  @override
  bool operator ==(other) => other is DeploymentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for sending InfluxDB engine logs to send to specified S3
/// bucket.
///
/// @nodoc
class LogDeliveryConfiguration {
  /// Configuration for S3 bucket log delivery.
  final S3Configuration s3Configuration;

  LogDeliveryConfiguration({
    required this.s3Configuration,
  });

  factory LogDeliveryConfiguration.fromJson(Map<String, dynamic> json) {
    return LogDeliveryConfiguration(
      s3Configuration: S3Configuration.fromJson(
          (json['s3Configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Configuration = this.s3Configuration;
    return {
      's3Configuration': s3Configuration,
    };
  }
}

/// @nodoc
class InstanceMode {
  static const primary = InstanceMode._('PRIMARY');
  static const standby = InstanceMode._('STANDBY');
  static const replica = InstanceMode._('REPLICA');
  static const ingest = InstanceMode._('INGEST');
  static const query = InstanceMode._('QUERY');
  static const compact = InstanceMode._('COMPACT');
  static const process = InstanceMode._('PROCESS');

  final String value;

  const InstanceMode._(this.value);

  static const values = [
    primary,
    standby,
    replica,
    ingest,
    query,
    compact,
    process
  ];

  static InstanceMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InstanceMode._(value));

  @override
  bool operator ==(other) => other is InstanceMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the maintenance schedule for a DB instance or cluster, defining
/// when maintenance operations such as patching can be performed.
///
/// @nodoc
class MaintenanceSchedule {
  /// The preferred maintenance window in the format ddd:HH:MM-ddd:HH:MM (UTC).
  /// Day must be one of: Mon, Tue, Wed, Thu, Fri, Sat, Sun. For example,
  /// Sun:02:00-Sun:06:00. Provide an empty string to let the system choose a
  /// window.
  final String preferredMaintenanceWindow;

  /// The IANA timezone identifier for the maintenance window. Format: Region/City
  /// or UTC. For example, America/New_York or UTC.
  final String timezone;

  MaintenanceSchedule({
    required this.preferredMaintenanceWindow,
    required this.timezone,
  });

  factory MaintenanceSchedule.fromJson(Map<String, dynamic> json) {
    return MaintenanceSchedule(
      preferredMaintenanceWindow:
          (json['preferredMaintenanceWindow'] as String?) ?? '',
      timezone: (json['timezone'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final timezone = this.timezone;
    return {
      'preferredMaintenanceWindow': preferredMaintenanceWindow,
      'timezone': timezone,
    };
  }
}

/// Configuration for S3 bucket log delivery.
///
/// @nodoc
class S3Configuration {
  /// The name of the S3 bucket to deliver logs to.
  final String bucketName;

  /// Indicates whether log delivery to the S3 bucket is enabled.
  final bool enabled;

  S3Configuration({
    required this.bucketName,
    required this.enabled,
  });

  factory S3Configuration.fromJson(Map<String, dynamic> json) {
    return S3Configuration(
      bucketName: (json['bucketName'] as String?) ?? '',
      enabled: (json['enabled'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final enabled = this.enabled;
    return {
      'bucketName': bucketName,
      'enabled': enabled,
    };
  }
}

/// Contains a summary of a DB instance.
///
/// @nodoc
class DbInstanceSummary {
  /// The Amazon Resource Name (ARN) of the DB instance.
  final String arn;

  /// The service-generated unique identifier of the DB instance.
  final String id;

  /// This customer-supplied name uniquely identifies the DB instance when
  /// interacting with the Amazon Timestream for InfluxDB API and CLI commands.
  final String name;

  /// The amount of storage to allocate for your DbStorageType in GiB (gibibytes).
  final int? allocatedStorage;

  /// The Timestream for InfluxDB instance type to run InfluxDB on.
  final DbInstanceType? dbInstanceType;

  /// The storage type for your DB instance.
  final DbStorageType? dbStorageType;

  /// Single-Instance or with a MultiAZ Standby for High availability.
  final DeploymentType? deploymentType;

  /// The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
  final String? endpoint;

  /// Specifies whether the networkType of the Timestream for InfluxDB instance is
  /// IPV4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  final NetworkType? networkType;

  /// The port number on which InfluxDB accepts connections.
  final int? port;

  /// The status of the DB instance.
  final Status? status;

  DbInstanceSummary({
    required this.arn,
    required this.id,
    required this.name,
    this.allocatedStorage,
    this.dbInstanceType,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.networkType,
    this.port,
    this.status,
  });

  factory DbInstanceSummary.fromJson(Map<String, dynamic> json) {
    return DbInstanceSummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      allocatedStorage: json['allocatedStorage'] as int?,
      dbInstanceType:
          (json['dbInstanceType'] as String?)?.let(DbInstanceType.fromString),
      dbStorageType:
          (json['dbStorageType'] as String?)?.let(DbStorageType.fromString),
      deploymentType:
          (json['deploymentType'] as String?)?.let(DeploymentType.fromString),
      endpoint: json['endpoint'] as String?,
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      port: json['port'] as int?,
      status: (json['status'] as String?)?.let(Status.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final allocatedStorage = this.allocatedStorage;
    final dbInstanceType = this.dbInstanceType;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final networkType = this.networkType;
    final port = this.port;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
      if (deploymentType != null) 'deploymentType': deploymentType.value,
      if (endpoint != null) 'endpoint': endpoint,
      if (networkType != null) 'networkType': networkType.value,
      if (port != null) 'port': port,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ClusterStatus {
  static const creating = ClusterStatus._('CREATING');
  static const updating = ClusterStatus._('UPDATING');
  static const deleting = ClusterStatus._('DELETING');
  static const available = ClusterStatus._('AVAILABLE');
  static const failed = ClusterStatus._('FAILED');
  static const deleted = ClusterStatus._('DELETED');
  static const maintenance = ClusterStatus._('MAINTENANCE');
  static const updatingInstanceType = ClusterStatus._('UPDATING_INSTANCE_TYPE');
  static const rebooting = ClusterStatus._('REBOOTING');
  static const rebootFailed = ClusterStatus._('REBOOT_FAILED');
  static const partiallyAvailable = ClusterStatus._('PARTIALLY_AVAILABLE');

  final String value;

  const ClusterStatus._(this.value);

  static const values = [
    creating,
    updating,
    deleting,
    available,
    failed,
    deleted,
    maintenance,
    updatingInstanceType,
    rebooting,
    rebootFailed,
    partiallyAvailable
  ];

  static ClusterStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClusterStatus._(value));

  @override
  bool operator ==(other) => other is ClusterStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains a summary of a DB instance belonging to a DB cluster.
///
/// @nodoc
class DbInstanceForClusterSummary {
  /// The Amazon Resource Name (ARN) of the DB instance.
  final String arn;

  /// The service-generated unique identifier of the DB instance.
  final String id;

  /// A service-generated name for the DB instance based on the customer-supplied
  /// name for the DB cluster.
  final String name;

  /// The amount of storage allocated for your DB storage type in GiB (gibibytes).
  final int? allocatedStorage;

  /// The Timestream for InfluxDB instance type to run InfluxDB on.
  final DbInstanceType? dbInstanceType;

  /// The storage type for your DB instance.
  final DbStorageType? dbStorageType;

  /// Specifies the deployment type if applicable.
  final DeploymentType? deploymentType;

  /// The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
  final String? endpoint;

  /// Specifies the DB instance's role in the cluster.
  final InstanceMode? instanceMode;

  /// Specifies the DB instance's roles in the cluster.
  final List<InstanceMode>? instanceModes;

  /// Specifies whether the network type of the Timestream for InfluxDB instance
  /// is IPv4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  final NetworkType? networkType;

  /// The port number on which InfluxDB accepts connections.
  final int? port;

  /// The status of the DB instance.
  final Status? status;

  DbInstanceForClusterSummary({
    required this.arn,
    required this.id,
    required this.name,
    this.allocatedStorage,
    this.dbInstanceType,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.instanceMode,
    this.instanceModes,
    this.networkType,
    this.port,
    this.status,
  });

  factory DbInstanceForClusterSummary.fromJson(Map<String, dynamic> json) {
    return DbInstanceForClusterSummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      allocatedStorage: json['allocatedStorage'] as int?,
      dbInstanceType:
          (json['dbInstanceType'] as String?)?.let(DbInstanceType.fromString),
      dbStorageType:
          (json['dbStorageType'] as String?)?.let(DbStorageType.fromString),
      deploymentType:
          (json['deploymentType'] as String?)?.let(DeploymentType.fromString),
      endpoint: json['endpoint'] as String?,
      instanceMode:
          (json['instanceMode'] as String?)?.let(InstanceMode.fromString),
      instanceModes: (json['instanceModes'] as List?)
          ?.nonNulls
          .map((e) => InstanceMode.fromString((e as String)))
          .toList(),
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      port: json['port'] as int?,
      status: (json['status'] as String?)?.let(Status.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final allocatedStorage = this.allocatedStorage;
    final dbInstanceType = this.dbInstanceType;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final instanceMode = this.instanceMode;
    final instanceModes = this.instanceModes;
    final networkType = this.networkType;
    final port = this.port;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
      if (deploymentType != null) 'deploymentType': deploymentType.value,
      if (endpoint != null) 'endpoint': endpoint,
      if (instanceMode != null) 'instanceMode': instanceMode.value,
      if (instanceModes != null)
        'instanceModes': instanceModes.map((e) => e.value).toList(),
      if (networkType != null) 'networkType': networkType.value,
      if (port != null) 'port': port,
      if (status != null) 'status': status.value,
    };
  }
}

/// Describes a summary of a Timestream for InfluxDB cluster.
///
/// @nodoc
class DbClusterSummary {
  /// The Amazon Resource Name (ARN) of the DB cluster.
  final String arn;

  /// Service-generated unique identifier of the DB cluster to retrieve.
  final String id;

  /// Customer supplied name of the Timestream for InfluxDB cluster.
  final String name;

  /// The amount of storage allocated for your DB storage type (in gibibytes).
  final int? allocatedStorage;

  /// The Timestream for InfluxDB DB instance type that InfluxDB runs on.
  final DbInstanceType? dbInstanceType;

  /// The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
  final DbStorageType? dbStorageType;

  /// Deployment type of the DB cluster
  final ClusterDeploymentType? deploymentType;

  /// The endpoint used to connect to the Timestream for InfluxDB cluster for
  /// write and read operations.
  final String? endpoint;

  /// The engine type of your DB cluster.
  final EngineType? engineType;

  /// Specifies whether the network type of the Timestream for InfluxDB Cluster is
  /// IPv4, which can communicate over IPv4 protocol only, or DUAL, which can
  /// communicate over both IPv4 and IPv6 protocols.
  final NetworkType? networkType;

  /// The port number on which InfluxDB accepts connections.
  final int? port;

  /// The endpoint used to connect to the Timestream for InfluxDB cluster for
  /// read-only operations.
  final String? readerEndpoint;

  /// The status of the DB cluster.
  final ClusterStatus? status;

  DbClusterSummary({
    required this.arn,
    required this.id,
    required this.name,
    this.allocatedStorage,
    this.dbInstanceType,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.engineType,
    this.networkType,
    this.port,
    this.readerEndpoint,
    this.status,
  });

  factory DbClusterSummary.fromJson(Map<String, dynamic> json) {
    return DbClusterSummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      allocatedStorage: json['allocatedStorage'] as int?,
      dbInstanceType:
          (json['dbInstanceType'] as String?)?.let(DbInstanceType.fromString),
      dbStorageType:
          (json['dbStorageType'] as String?)?.let(DbStorageType.fromString),
      deploymentType: (json['deploymentType'] as String?)
          ?.let(ClusterDeploymentType.fromString),
      endpoint: json['endpoint'] as String?,
      engineType: (json['engineType'] as String?)?.let(EngineType.fromString),
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
      port: json['port'] as int?,
      readerEndpoint: json['readerEndpoint'] as String?,
      status: (json['status'] as String?)?.let(ClusterStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final allocatedStorage = this.allocatedStorage;
    final dbInstanceType = this.dbInstanceType;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final engineType = this.engineType;
    final networkType = this.networkType;
    final port = this.port;
    final readerEndpoint = this.readerEndpoint;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.value,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.value,
      if (deploymentType != null) 'deploymentType': deploymentType.value,
      if (endpoint != null) 'endpoint': endpoint,
      if (engineType != null) 'engineType': engineType.value,
      if (networkType != null) 'networkType': networkType.value,
      if (port != null) 'port': port,
      if (readerEndpoint != null) 'readerEndpoint': readerEndpoint,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ClusterDeploymentType {
  static const multiNodeReadReplicas =
      ClusterDeploymentType._('MULTI_NODE_READ_REPLICAS');

  final String value;

  const ClusterDeploymentType._(this.value);

  static const values = [multiNodeReadReplicas];

  static ClusterDeploymentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClusterDeploymentType._(value));

  @override
  bool operator ==(other) =>
      other is ClusterDeploymentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EngineType {
  static const influxdbV2 = EngineType._('INFLUXDB_V2');
  static const influxdbV3Core = EngineType._('INFLUXDB_V3_CORE');
  static const influxdbV3Enterprise = EngineType._('INFLUXDB_V3_ENTERPRISE');

  final String value;

  const EngineType._(this.value);

  static const values = [influxdbV2, influxdbV3Core, influxdbV3Enterprise];

  static EngineType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EngineType._(value));

  @override
  bool operator ==(other) => other is EngineType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FailoverMode {
  static const automatic = FailoverMode._('AUTOMATIC');
  static const noFailover = FailoverMode._('NO_FAILOVER');

  final String value;

  const FailoverMode._(this.value);

  static const values = [automatic, noFailover];

  static FailoverMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FailoverMode._(value));

  @override
  bool operator ==(other) => other is FailoverMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for node modes in the DbCluster.
///
/// @nodoc
class ClusterConfiguration {
  /// Indicates if the compactor instance is a standalone instance or not.
  final bool? dedicatedCompactor;

  /// The number of instances in the DbCluster which can both ingest and query.
  final int? ingestQueryInstances;

  /// The number of instances in the DbCluster which can only query.
  final int? queryOnlyInstances;

  ClusterConfiguration({
    this.dedicatedCompactor,
    this.ingestQueryInstances,
    this.queryOnlyInstances,
  });

  factory ClusterConfiguration.fromJson(Map<String, dynamic> json) {
    return ClusterConfiguration(
      dedicatedCompactor: json['dedicatedCompactor'] as bool?,
      ingestQueryInstances: json['ingestQueryInstances'] as int?,
      queryOnlyInstances: json['queryOnlyInstances'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dedicatedCompactor = this.dedicatedCompactor;
    final ingestQueryInstances = this.ingestQueryInstances;
    final queryOnlyInstances = this.queryOnlyInstances;
    return {
      if (dedicatedCompactor != null) 'dedicatedCompactor': dedicatedCompactor,
      if (ingestQueryInstances != null)
        'ingestQueryInstances': ingestQueryInstances,
      if (queryOnlyInstances != null) 'queryOnlyInstances': queryOnlyInstances,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
