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

/// Amazon Timestream for InfluxDB is a managed time-series database engine that
/// makes it easy for application developers and DevOps teams to run InfluxDB
/// databases on AWS for near real-time time-series applications using
/// open-source APIs. With Amazon Timestream for InfluxDB, it is easy to set up,
/// operate, and scale time-series workloads that can answer queries with
/// single-digit millisecond query response time.
class TimestreamInfluxDB {
  final _s.JsonProtocol _protocol;
  TimestreamInfluxDB({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'timestream-influxdb',
            signingName: 'timestream-influxdb',
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

  /// Creates a new Timestream for InfluxDB DB instance.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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
  /// The password of the initial admin user created in InfluxDB. This password
  /// will allow you to access the InfluxDB UI to perform various administrative
  /// tasks and also use the InfluxDB CLI to create an operator token. These
  /// attributes will be stored in a Secret created in AWS SecretManager in your
  /// account.
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
  /// Parameter [organization] :
  /// The name of the initial organization for the initial admin user in
  /// InfluxDB. An InfluxDB organization is a workspace for a group of users.
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
    String? organization,
    bool? publiclyAccessible,
    Map<String, String>? tags,
    String? username,
  }) async {
    _s.validateNumRange(
      'allocatedStorage',
      allocatedStorage,
      20,
      16384,
      isRequired: true,
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
        'dbInstanceType': dbInstanceType.toValue(),
        'name': name,
        'password': password,
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
        'vpcSubnetIds': vpcSubnetIds,
        if (bucket != null) 'bucket': bucket,
        if (dbParameterGroupIdentifier != null)
          'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
        if (dbStorageType != null) 'dbStorageType': dbStorageType.toValue(),
        if (deploymentType != null) 'deploymentType': deploymentType.toValue(),
        if (logDeliveryConfiguration != null)
          'logDeliveryConfiguration': logDeliveryConfiguration,
        if (organization != null) 'organization': organization,
        if (publiclyAccessible != null)
          'publiclyAccessible': publiclyAccessible,
        if (tags != null) 'tags': tags,
        if (username != null) 'username': username,
      },
    );

    return CreateDbInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new Timestream for InfluxDB DB parameter group to associate with
  /// DB instances.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Deletes a Timestream for InfluxDB DB instance.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Returns a Timestream for InfluxDB DB instance.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Returns a Timestream for InfluxDB DB parameter group.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Returns a list of Timestream for InfluxDB DB instances.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Returns a list of Timestream for InfluxDB DB parameter groups.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Updates a Timestream for InfluxDB DB instance.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identifier] :
  /// The id of the DB instance.
  ///
  /// Parameter [dbParameterGroupIdentifier] :
  /// The id of the DB parameter group to assign to your DB instance. DB
  /// parameter groups specify how the database is configured. For example, DB
  /// parameter groups can specify the limit for query concurrency.
  ///
  /// Parameter [logDeliveryConfiguration] :
  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  Future<UpdateDbInstanceOutput> updateDbInstance({
    required String identifier,
    String? dbParameterGroupIdentifier,
    LogDeliveryConfiguration? logDeliveryConfiguration,
  }) async {
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
        if (dbParameterGroupIdentifier != null)
          'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
        if (logDeliveryConfiguration != null)
          'logDeliveryConfiguration': logDeliveryConfiguration,
      },
    );

    return UpdateDbInstanceOutput.fromJson(jsonResponse.body);
  }
}

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

  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret containing
  /// the initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

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
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.influxAuthParametersSecretArn,
    this.logDeliveryConfiguration,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.status,
    this.vpcSecurityGroupIds,
  });

  factory CreateDbInstanceOutput.fromJson(Map<String, dynamic> json) {
    return CreateDbInstanceOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      vpcSubnetIds: (json['vpcSubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allocatedStorage: json['allocatedStorage'] as int?,
      availabilityZone: json['availabilityZone'] as String?,
      dbInstanceType: (json['dbInstanceType'] as String?)?.toDbInstanceType(),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType: (json['dbStorageType'] as String?)?.toDbStorageType(),
      deploymentType: (json['deploymentType'] as String?)?.toDeploymentType(),
      endpoint: json['endpoint'] as String?,
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      status: (json['status'] as String?)?.toStatus(),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.whereNotNull()
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
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
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
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.toValue(),
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.toValue(),
      if (deploymentType != null) 'deploymentType': deploymentType.toValue(),
      if (endpoint != null) 'endpoint': endpoint,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (status != null) 'status': status.toValue(),
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
  }
}

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
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
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

/// Contains a summary of a DB instance.
class DbInstanceSummary {
  /// The Amazon Resource Name (ARN) of the DB instance.
  final String arn;

  /// The service-generated unique identifier of the DB instance.
  final String id;

  /// This customer-supplied name uniquely identifies the DB instance when
  /// interacting with the Amazon Timestream for InfluxDB API and AWS CLI
  /// commands.
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
    this.status,
  });

  factory DbInstanceSummary.fromJson(Map<String, dynamic> json) {
    return DbInstanceSummary(
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      allocatedStorage: json['allocatedStorage'] as int?,
      dbInstanceType: (json['dbInstanceType'] as String?)?.toDbInstanceType(),
      dbStorageType: (json['dbStorageType'] as String?)?.toDbStorageType(),
      deploymentType: (json['deploymentType'] as String?)?.toDeploymentType(),
      endpoint: json['endpoint'] as String?,
      status: (json['status'] as String?)?.toStatus(),
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
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (allocatedStorage != null) 'allocatedStorage': allocatedStorage,
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.toValue(),
      if (dbStorageType != null) 'dbStorageType': dbStorageType.toValue(),
      if (deploymentType != null) 'deploymentType': deploymentType.toValue(),
      if (endpoint != null) 'endpoint': endpoint,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum DbInstanceType {
  dbInfluxMedium,
  dbInfluxLarge,
  dbInfluxXlarge,
  dbInflux_2xlarge,
  dbInflux_4xlarge,
  dbInflux_8xlarge,
  dbInflux_12xlarge,
  dbInflux_16xlarge,
}

extension DbInstanceTypeValueExtension on DbInstanceType {
  String toValue() {
    switch (this) {
      case DbInstanceType.dbInfluxMedium:
        return 'db.influx.medium';
      case DbInstanceType.dbInfluxLarge:
        return 'db.influx.large';
      case DbInstanceType.dbInfluxXlarge:
        return 'db.influx.xlarge';
      case DbInstanceType.dbInflux_2xlarge:
        return 'db.influx.2xlarge';
      case DbInstanceType.dbInflux_4xlarge:
        return 'db.influx.4xlarge';
      case DbInstanceType.dbInflux_8xlarge:
        return 'db.influx.8xlarge';
      case DbInstanceType.dbInflux_12xlarge:
        return 'db.influx.12xlarge';
      case DbInstanceType.dbInflux_16xlarge:
        return 'db.influx.16xlarge';
    }
  }
}

extension DbInstanceTypeFromString on String {
  DbInstanceType toDbInstanceType() {
    switch (this) {
      case 'db.influx.medium':
        return DbInstanceType.dbInfluxMedium;
      case 'db.influx.large':
        return DbInstanceType.dbInfluxLarge;
      case 'db.influx.xlarge':
        return DbInstanceType.dbInfluxXlarge;
      case 'db.influx.2xlarge':
        return DbInstanceType.dbInflux_2xlarge;
      case 'db.influx.4xlarge':
        return DbInstanceType.dbInflux_4xlarge;
      case 'db.influx.8xlarge':
        return DbInstanceType.dbInflux_8xlarge;
      case 'db.influx.12xlarge':
        return DbInstanceType.dbInflux_12xlarge;
      case 'db.influx.16xlarge':
        return DbInstanceType.dbInflux_16xlarge;
    }
    throw Exception('$this is not known in enum DbInstanceType');
  }
}

/// Contains a summary of a DB parameter group.
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
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
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

enum DbStorageType {
  influxIOIncludedT1,
  influxIOIncludedT2,
  influxIOIncludedT3,
}

extension DbStorageTypeValueExtension on DbStorageType {
  String toValue() {
    switch (this) {
      case DbStorageType.influxIOIncludedT1:
        return 'InfluxIOIncludedT1';
      case DbStorageType.influxIOIncludedT2:
        return 'InfluxIOIncludedT2';
      case DbStorageType.influxIOIncludedT3:
        return 'InfluxIOIncludedT3';
    }
  }
}

extension DbStorageTypeFromString on String {
  DbStorageType toDbStorageType() {
    switch (this) {
      case 'InfluxIOIncludedT1':
        return DbStorageType.influxIOIncludedT1;
      case 'InfluxIOIncludedT2':
        return DbStorageType.influxIOIncludedT2;
      case 'InfluxIOIncludedT3':
        return DbStorageType.influxIOIncludedT3;
    }
    throw Exception('$this is not known in enum DbStorageType');
  }
}

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

  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret containing
  /// the initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

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
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.influxAuthParametersSecretArn,
    this.logDeliveryConfiguration,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.status,
    this.vpcSecurityGroupIds,
  });

  factory DeleteDbInstanceOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDbInstanceOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      vpcSubnetIds: (json['vpcSubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allocatedStorage: json['allocatedStorage'] as int?,
      availabilityZone: json['availabilityZone'] as String?,
      dbInstanceType: (json['dbInstanceType'] as String?)?.toDbInstanceType(),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType: (json['dbStorageType'] as String?)?.toDbStorageType(),
      deploymentType: (json['deploymentType'] as String?)?.toDeploymentType(),
      endpoint: json['endpoint'] as String?,
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      status: (json['status'] as String?)?.toStatus(),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.whereNotNull()
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
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
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
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.toValue(),
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.toValue(),
      if (deploymentType != null) 'deploymentType': deploymentType.toValue(),
      if (endpoint != null) 'endpoint': endpoint,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (status != null) 'status': status.toValue(),
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
  }
}

enum DeploymentType {
  singleAz,
  withMultiazStandby,
}

extension DeploymentTypeValueExtension on DeploymentType {
  String toValue() {
    switch (this) {
      case DeploymentType.singleAz:
        return 'SINGLE_AZ';
      case DeploymentType.withMultiazStandby:
        return 'WITH_MULTIAZ_STANDBY';
    }
  }
}

extension DeploymentTypeFromString on String {
  DeploymentType toDeploymentType() {
    switch (this) {
      case 'SINGLE_AZ':
        return DeploymentType.singleAz;
      case 'WITH_MULTIAZ_STANDBY':
        return DeploymentType.withMultiazStandby;
    }
    throw Exception('$this is not known in enum DeploymentType');
  }
}

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

  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret containing
  /// the initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

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
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.influxAuthParametersSecretArn,
    this.logDeliveryConfiguration,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.status,
    this.vpcSecurityGroupIds,
  });

  factory GetDbInstanceOutput.fromJson(Map<String, dynamic> json) {
    return GetDbInstanceOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      vpcSubnetIds: (json['vpcSubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allocatedStorage: json['allocatedStorage'] as int?,
      availabilityZone: json['availabilityZone'] as String?,
      dbInstanceType: (json['dbInstanceType'] as String?)?.toDbInstanceType(),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType: (json['dbStorageType'] as String?)?.toDbStorageType(),
      deploymentType: (json['deploymentType'] as String?)?.toDeploymentType(),
      endpoint: json['endpoint'] as String?,
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      status: (json['status'] as String?)?.toStatus(),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.whereNotNull()
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
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
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
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.toValue(),
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.toValue(),
      if (deploymentType != null) 'deploymentType': deploymentType.toValue(),
      if (endpoint != null) 'endpoint': endpoint,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (status != null) 'status': status.toValue(),
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
  }
}

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
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
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

/// All the customer-modifiable InfluxDB v2 parameters in Timestream for
/// InfluxDB.
class InfluxDBv2Parameters {
  /// Include option to show detailed logs for Flux queries.
  ///
  /// Default: false
  final bool? fluxLogEnabled;

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

  /// Number of queries allowed to execute concurrently. Setting to 0 allows an
  /// unlimited number of concurrent queries.
  ///
  /// Default: 0
  final int? queryConcurrency;

  /// Maximum number of queries allowed in execution queue. When queue limit is
  /// reached, new queries are rejected. Setting to 0 allows an unlimited number
  /// of queries in the queue.
  ///
  /// Default: 0
  final int? queryQueueSize;

  /// Enable tracing in InfluxDB and specifies the tracing type. Tracing is
  /// disabled by default.
  final TracingType? tracingType;

  InfluxDBv2Parameters({
    this.fluxLogEnabled,
    this.logLevel,
    this.metricsDisabled,
    this.noTasks,
    this.queryConcurrency,
    this.queryQueueSize,
    this.tracingType,
  });

  factory InfluxDBv2Parameters.fromJson(Map<String, dynamic> json) {
    return InfluxDBv2Parameters(
      fluxLogEnabled: json['fluxLogEnabled'] as bool?,
      logLevel: (json['logLevel'] as String?)?.toLogLevel(),
      metricsDisabled: json['metricsDisabled'] as bool?,
      noTasks: json['noTasks'] as bool?,
      queryConcurrency: json['queryConcurrency'] as int?,
      queryQueueSize: json['queryQueueSize'] as int?,
      tracingType: (json['tracingType'] as String?)?.toTracingType(),
    );
  }

  Map<String, dynamic> toJson() {
    final fluxLogEnabled = this.fluxLogEnabled;
    final logLevel = this.logLevel;
    final metricsDisabled = this.metricsDisabled;
    final noTasks = this.noTasks;
    final queryConcurrency = this.queryConcurrency;
    final queryQueueSize = this.queryQueueSize;
    final tracingType = this.tracingType;
    return {
      if (fluxLogEnabled != null) 'fluxLogEnabled': fluxLogEnabled,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (metricsDisabled != null) 'metricsDisabled': metricsDisabled,
      if (noTasks != null) 'noTasks': noTasks,
      if (queryConcurrency != null) 'queryConcurrency': queryConcurrency,
      if (queryQueueSize != null) 'queryQueueSize': queryQueueSize,
      if (tracingType != null) 'tracingType': tracingType.toValue(),
    };
  }
}

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
      items: (json['items'] as List)
          .whereNotNull()
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
      items: (json['items'] as List)
          .whereNotNull()
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

/// Configuration for sending InfluxDB engine logs to send to specified S3
/// bucket.
class LogDeliveryConfiguration {
  /// Configuration for S3 bucket log delivery.
  final S3Configuration s3Configuration;

  LogDeliveryConfiguration({
    required this.s3Configuration,
  });

  factory LogDeliveryConfiguration.fromJson(Map<String, dynamic> json) {
    return LogDeliveryConfiguration(
      s3Configuration: S3Configuration.fromJson(
          json['s3Configuration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Configuration = this.s3Configuration;
    return {
      's3Configuration': s3Configuration,
    };
  }
}

enum LogLevel {
  debug,
  info,
  error,
}

extension LogLevelValueExtension on LogLevel {
  String toValue() {
    switch (this) {
      case LogLevel.debug:
        return 'debug';
      case LogLevel.info:
        return 'info';
      case LogLevel.error:
        return 'error';
    }
  }
}

extension LogLevelFromString on String {
  LogLevel toLogLevel() {
    switch (this) {
      case 'debug':
        return LogLevel.debug;
      case 'info':
        return LogLevel.info;
      case 'error':
        return LogLevel.error;
    }
    throw Exception('$this is not known in enum LogLevel');
  }
}

/// The parameters that comprise the parameter group.
class Parameters {
  /// All the customer-modifiable InfluxDB v2 parameters in Timestream for
  /// InfluxDB.
  final InfluxDBv2Parameters? influxDBv2;

  Parameters({
    this.influxDBv2,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      influxDBv2: json['InfluxDBv2'] != null
          ? InfluxDBv2Parameters.fromJson(
              json['InfluxDBv2'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final influxDBv2 = this.influxDBv2;
    return {
      if (influxDBv2 != null) 'InfluxDBv2': influxDBv2,
    };
  }
}

/// Configuration for S3 bucket log delivery.
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
      bucketName: json['bucketName'] as String,
      enabled: json['enabled'] as bool,
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

enum Status {
  creating,
  available,
  deleting,
  modifying,
  updating,
  deleted,
  failed,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.creating:
        return 'CREATING';
      case Status.available:
        return 'AVAILABLE';
      case Status.deleting:
        return 'DELETING';
      case Status.modifying:
        return 'MODIFYING';
      case Status.updating:
        return 'UPDATING';
      case Status.deleted:
        return 'DELETED';
      case Status.failed:
        return 'FAILED';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'CREATING':
        return Status.creating;
      case 'AVAILABLE':
        return Status.available;
      case 'DELETING':
        return Status.deleting;
      case 'MODIFYING':
        return Status.modifying;
      case 'UPDATING':
        return Status.updating;
      case 'DELETED':
        return Status.deleted;
      case 'FAILED':
        return Status.failed;
    }
    throw Exception('$this is not known in enum Status');
  }
}

enum TracingType {
  log,
  jaeger,
}

extension TracingTypeValueExtension on TracingType {
  String toValue() {
    switch (this) {
      case TracingType.log:
        return 'log';
      case TracingType.jaeger:
        return 'jaeger';
    }
  }
}

extension TracingTypeFromString on String {
  TracingType toTracingType() {
    switch (this) {
      case 'log':
        return TracingType.log;
      case 'jaeger':
        return TracingType.jaeger;
    }
    throw Exception('$this is not known in enum TracingType');
  }
}

class UpdateDbInstanceOutput {
  /// The Amazon Resource Name (ARN) of the DB instance.
  final String arn;

  /// A service-generated unique identifier.
  final String id;

  /// This customer-supplied name uniquely identifies the DB instance when
  /// interacting with the Amazon Timestream for InfluxDB API and AWS CLI
  /// commands.
  final String name;

  /// A list of VPC subnet IDs associated with the DB instance.
  final List<String> vpcSubnetIds;

  /// The amount of storage allocated for your DB storage type (in gibibytes).
  final int? allocatedStorage;

  /// The Availability Zone in which the DB instance resides.
  final String? availabilityZone;

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

  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret containing
  /// the initial InfluxDB authorization parameters. The secret value is a JSON
  /// formatted key-value pair holding InfluxDB authorization values:
  /// organization, bucket, username, and password.
  final String? influxAuthParametersSecretArn;

  /// Configuration for sending InfluxDB engine logs to send to specified S3
  /// bucket.
  final LogDeliveryConfiguration? logDeliveryConfiguration;

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
    this.dbInstanceType,
    this.dbParameterGroupIdentifier,
    this.dbStorageType,
    this.deploymentType,
    this.endpoint,
    this.influxAuthParametersSecretArn,
    this.logDeliveryConfiguration,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.status,
    this.vpcSecurityGroupIds,
  });

  factory UpdateDbInstanceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateDbInstanceOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      vpcSubnetIds: (json['vpcSubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allocatedStorage: json['allocatedStorage'] as int?,
      availabilityZone: json['availabilityZone'] as String?,
      dbInstanceType: (json['dbInstanceType'] as String?)?.toDbInstanceType(),
      dbParameterGroupIdentifier: json['dbParameterGroupIdentifier'] as String?,
      dbStorageType: (json['dbStorageType'] as String?)?.toDbStorageType(),
      deploymentType: (json['deploymentType'] as String?)?.toDeploymentType(),
      endpoint: json['endpoint'] as String?,
      influxAuthParametersSecretArn:
          json['influxAuthParametersSecretArn'] as String?,
      logDeliveryConfiguration: json['logDeliveryConfiguration'] != null
          ? LogDeliveryConfiguration.fromJson(
              json['logDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      status: (json['status'] as String?)?.toStatus(),
      vpcSecurityGroupIds: (json['vpcSecurityGroupIds'] as List?)
          ?.whereNotNull()
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
    final dbInstanceType = this.dbInstanceType;
    final dbParameterGroupIdentifier = this.dbParameterGroupIdentifier;
    final dbStorageType = this.dbStorageType;
    final deploymentType = this.deploymentType;
    final endpoint = this.endpoint;
    final influxAuthParametersSecretArn = this.influxAuthParametersSecretArn;
    final logDeliveryConfiguration = this.logDeliveryConfiguration;
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
      if (dbInstanceType != null) 'dbInstanceType': dbInstanceType.toValue(),
      if (dbParameterGroupIdentifier != null)
        'dbParameterGroupIdentifier': dbParameterGroupIdentifier,
      if (dbStorageType != null) 'dbStorageType': dbStorageType.toValue(),
      if (deploymentType != null) 'deploymentType': deploymentType.toValue(),
      if (endpoint != null) 'endpoint': endpoint,
      if (influxAuthParametersSecretArn != null)
        'influxAuthParametersSecretArn': influxAuthParametersSecretArn,
      if (logDeliveryConfiguration != null)
        'logDeliveryConfiguration': logDeliveryConfiguration,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (status != null) 'status': status.toValue(),
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

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
