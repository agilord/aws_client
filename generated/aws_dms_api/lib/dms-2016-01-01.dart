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
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'dms-2016-01-01.g.dart';

/// AWS Database Migration Service (AWS DMS) can migrate your data to and from
/// the most widely used commercial and open-source databases such as Oracle,
/// PostgreSQL, Microsoft SQL Server, Amazon Redshift, MariaDB, Amazon Aurora,
/// MySQL, and SAP Adaptive Server Enterprise (ASE). The service supports
/// homogeneous migrations such as Oracle to Oracle, as well as heterogeneous
/// migrations between different database platforms, such as Oracle to MySQL or
/// SQL Server to PostgreSQL.
class DatabaseMigrationService {
  final _s.JsonProtocol _protocol;
  DatabaseMigrationService({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'dms',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds metadata tags to an AWS DMS resource, including replication instance,
  /// endpoint, security group, and migration task. These tags can also be used
  /// with cost allocation reporting to track cost associated with DMS
  /// resources, or used in a Condition statement in an IAM policy for DMS.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [resourceArn] :
  /// Identifies the AWS DMS resource to which tags should be added. The value
  /// for this parameter is an Amazon Resource Name (ARN).
  ///
  /// For AWS DMS, you can tag a replication instance, an endpoint, or a
  /// replication task.
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the resource.
  Future<void> addTagsToResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.AddTagsToResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );

    return AddTagsToResourceResponse.fromJson(jsonResponse.body);
  }

  /// Applies a pending maintenance action to a resource (for example, to a
  /// replication instance).
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [applyAction] :
  /// The pending maintenance action to apply to this resource.
  ///
  /// Parameter [optInType] :
  /// A value that specifies the type of opt-in request, or undoes an opt-in
  /// request. You can't undo an opt-in request of type <code>immediate</code>.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>immediate</code> - Apply the maintenance action immediately.
  /// </li>
  /// <li>
  /// <code>next-maintenance</code> - Apply the maintenance action during the
  /// next maintenance window for the resource.
  /// </li>
  /// <li>
  /// <code>undo-opt-in</code> - Cancel any existing
  /// <code>next-maintenance</code> opt-in requests.
  /// </li>
  /// </ul>
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the AWS DMS resource that the pending
  /// maintenance action applies to.
  Future<ApplyPendingMaintenanceActionResponse> applyPendingMaintenanceAction({
    @_s.required String applyAction,
    @_s.required String optInType,
    @_s.required String replicationInstanceArn,
  }) async {
    ArgumentError.checkNotNull(applyAction, 'applyAction');
    ArgumentError.checkNotNull(optInType, 'optInType');
    ArgumentError.checkNotNull(
        replicationInstanceArn, 'replicationInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.ApplyPendingMaintenanceAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplyAction': applyAction,
        'OptInType': optInType,
        'ReplicationInstanceArn': replicationInstanceArn,
      },
    );

    return ApplyPendingMaintenanceActionResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint using the provided settings.
  ///
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [ResourceQuotaExceededFault].
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [AccessDeniedFault].
  ///
  /// Parameter [endpointIdentifier] :
  /// The database endpoint identifier. Identifiers must begin with a letter and
  /// must contain only ASCII letters, digits, and hyphens. They can't end with
  /// a hyphen or contain two consecutive hyphens.
  ///
  /// Parameter [endpointType] :
  /// The type of endpoint. Valid values are <code>source</code> and
  /// <code>target</code>.
  ///
  /// Parameter [engineName] :
  /// The type of engine for the endpoint. Valid values, depending on the
  /// <code>EndpointType</code> value, include <code>"mysql"</code>,
  /// <code>"oracle"</code>, <code>"postgres"</code>, <code>"mariadb"</code>,
  /// <code>"aurora"</code>, <code>"aurora-postgresql"</code>,
  /// <code>"redshift"</code>, <code>"s3"</code>, <code>"db2"</code>,
  /// <code>"azuredb"</code>, <code>"sybase"</code>, <code>"dynamodb"</code>,
  /// <code>"mongodb"</code>, <code>"kinesis"</code>, <code>"kafka"</code>,
  /// <code>"elasticsearch"</code>, <code>"documentdb"</code>, and
  /// <code>"sqlserver"</code>.
  ///
  /// Parameter [certificateArn] :
  /// The Amazon Resource Name (ARN) for the certificate.
  ///
  /// Parameter [databaseName] :
  /// The name of the endpoint database.
  ///
  /// Parameter [dmsTransferSettings] :
  /// The settings in JSON format for the DMS transfer type of source endpoint.
  ///
  /// Possible settings include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ServiceAccessRoleArn</code> - The IAM role that has permission to
  /// access the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>BucketName</code> - The name of the S3 bucket to use.
  /// </li>
  /// <li>
  /// <code>CompressionType</code> - An optional parameter to use GZIP to
  /// compress the target files. To use GZIP, set this value to
  /// <code>NONE</code> (the default). To keep the files uncompressed, don't use
  /// this value.
  /// </li>
  /// </ul>
  /// Shorthand syntax for these settings is as follows:
  /// <code>ServiceAccessRoleArn=string,BucketName=string,CompressionType=string</code>
  ///
  /// JSON syntax for these settings is as follows: <code>{
  /// "ServiceAccessRoleArn": "string", "BucketName": "string",
  /// "CompressionType": "none"|"gzip" } </code>
  ///
  /// Parameter [dynamoDbSettings] :
  /// Settings in JSON format for the target Amazon DynamoDB endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html">Using
  /// Object Mapping to Migrate Data to DynamoDB</a> in the <i>AWS Database
  /// Migration Service User Guide.</i>
  ///
  /// Parameter [elasticsearchSettings] :
  /// Settings in JSON format for the target Elasticsearch endpoint. For more
  /// information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration">Extra
  /// Connection Attributes When Using Elasticsearch as a Target for AWS DMS</a>
  /// in the <i>AWS Database Migration User Guide.</i>
  ///
  /// Parameter [externalTableDefinition] :
  /// The external table definition.
  ///
  /// Parameter [extraConnectionAttributes] :
  /// Additional attributes associated with the connection. Each attribute is
  /// specified as a name-value pair associated by an equal sign (=). Multiple
  /// attributes are separated by a semicolon (;) with no additional white
  /// space. For information on the attributes available for connecting your
  /// source or target endpoint, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Endpoints.html">Working
  /// with AWS DMS Endpoints</a> in the <i>AWS Database Migration Service User
  /// Guide.</i>
  ///
  /// Parameter [kafkaSettings] :
  /// Settings in JSON format for the target Apache Kafka endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html#CHAP_Target.Kafka.ObjectMapping">Using
  /// Object Mapping to Migrate Data to Apache Kafka</a> in the <i>AWS Database
  /// Migration User Guide.</i>
  ///
  /// Parameter [kinesisSettings] :
  /// Settings in JSON format for the target endpoint for Amazon Kinesis Data
  /// Streams. For information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html#CHAP_Target.Kinesis.ObjectMapping">Using
  /// Object Mapping to Migrate Data to a Kinesis Data Stream</a> in the <i>AWS
  /// Database Migration User Guide.</i>
  ///
  /// Parameter [kmsKeyId] :
  /// An AWS KMS key identifier that is used to encrypt the connection
  /// parameters for the endpoint.
  ///
  /// If you don't specify a value for the <code>KmsKeyId</code> parameter, then
  /// AWS DMS uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  ///
  /// Parameter [mongoDbSettings] :
  /// Settings in JSON format for the source MongoDB endpoint. For more
  /// information about the available settings, see the configuration properties
  /// section in <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html">Using
  /// MongoDB as a Target for AWS Database Migration Service</a> in the <i>AWS
  /// Database Migration Service User Guide.</i>
  ///
  /// Parameter [password] :
  /// The password to be used to log in to the endpoint database.
  ///
  /// Parameter [port] :
  /// The port used by the endpoint database.
  ///
  /// Parameter [s3Settings] :
  /// Settings in JSON format for the target Amazon S3 endpoint. For more
  /// information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring">Extra
  /// Connection Attributes When Using Amazon S3 as a Target for AWS DMS</a> in
  /// the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [serverName] :
  /// The name of the server where the endpoint database resides.
  ///
  /// Parameter [serviceAccessRoleArn] :
  /// The Amazon Resource Name (ARN) for the service access role that you want
  /// to use to create the endpoint.
  ///
  /// Parameter [sslMode] :
  /// The Secure Sockets Layer (SSL) mode to use for the SSL connection. The
  /// default is <code>none</code>
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the endpoint.
  ///
  /// Parameter [username] :
  /// The user name to be used to log in to the endpoint database.
  Future<CreateEndpointResponse> createEndpoint({
    @_s.required String endpointIdentifier,
    @_s.required ReplicationEndpointTypeValue endpointType,
    @_s.required String engineName,
    String certificateArn,
    String databaseName,
    DmsTransferSettings dmsTransferSettings,
    DynamoDbSettings dynamoDbSettings,
    ElasticsearchSettings elasticsearchSettings,
    String externalTableDefinition,
    String extraConnectionAttributes,
    KafkaSettings kafkaSettings,
    KinesisSettings kinesisSettings,
    String kmsKeyId,
    MongoDbSettings mongoDbSettings,
    String password,
    int port,
    RedshiftSettings redshiftSettings,
    S3Settings s3Settings,
    String serverName,
    String serviceAccessRoleArn,
    DmsSslModeValue sslMode,
    List<Tag> tags,
    String username,
  }) async {
    ArgumentError.checkNotNull(endpointIdentifier, 'endpointIdentifier');
    ArgumentError.checkNotNull(endpointType, 'endpointType');
    ArgumentError.checkNotNull(engineName, 'engineName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.CreateEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointIdentifier': endpointIdentifier,
        'EndpointType': endpointType,
        'EngineName': engineName,
        'CertificateArn': certificateArn,
        'DatabaseName': databaseName,
        'DmsTransferSettings': dmsTransferSettings,
        'DynamoDbSettings': dynamoDbSettings,
        'ElasticsearchSettings': elasticsearchSettings,
        'ExternalTableDefinition': externalTableDefinition,
        'ExtraConnectionAttributes': extraConnectionAttributes,
        'KafkaSettings': kafkaSettings,
        'KinesisSettings': kinesisSettings,
        'KmsKeyId': kmsKeyId,
        'MongoDbSettings': mongoDbSettings,
        'Password': password,
        'Port': port,
        'RedshiftSettings': redshiftSettings,
        'S3Settings': s3Settings,
        'ServerName': serverName,
        'ServiceAccessRoleArn': serviceAccessRoleArn,
        'SslMode': sslMode,
        'Tags': tags,
        'Username': username,
      },
    );

    return CreateEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Creates an AWS DMS event notification subscription.
  ///
  /// You can specify the type of source (<code>SourceType</code>) you want to
  /// be notified of, provide a list of AWS DMS source IDs
  /// (<code>SourceIds</code>) that triggers the events, and provide a list of
  /// event categories (<code>EventCategories</code>) for events you want to be
  /// notified of. If you specify both the <code>SourceType</code> and
  /// <code>SourceIds</code>, such as <code>SourceType =
  /// replication-instance</code> and <code>SourceIdentifier =
  /// my-replinstance</code>, you will be notified of all the replication
  /// instance events for the specified source. If you specify a
  /// <code>SourceType</code> but don't specify a <code>SourceIdentifier</code>,
  /// you receive notice of the events for that source type for all your AWS DMS
  /// sources. If you don't specify either <code>SourceType</code> nor
  /// <code>SourceIdentifier</code>, you will be notified of events generated
  /// from all AWS DMS sources belonging to your customer account.
  ///
  /// For more information about AWS DMS events, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working
  /// with Events and Notifications</a> in the <i>AWS Database Migration Service
  /// User Guide.</i>
  ///
  /// May throw [ResourceQuotaExceededFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [KMSAccessDeniedFault].
  /// May throw [KMSDisabledFault].
  /// May throw [KMSInvalidStateFault].
  /// May throw [KMSNotFoundFault].
  /// May throw [KMSThrottlingFault].
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic created for event
  /// notification. The ARN is created by Amazon SNS when you create a topic and
  /// subscribe to it.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the AWS DMS event notification subscription. This name must be
  /// less than 255 characters.
  ///
  /// Parameter [enabled] :
  /// A Boolean value; set to <code>true</code> to activate the subscription, or
  /// set to <code>false</code> to create the subscription but not activate it.
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories for a source type that you want to subscribe
  /// to. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working
  /// with Events and Notifications</a> in the <i>AWS Database Migration Service
  /// User Guide.</i>
  ///
  /// Parameter [sourceIds] :
  /// A list of identifiers for which AWS DMS provides notification events.
  ///
  /// If you don't specify a value, notifications are provided for all sources.
  ///
  /// If you specify multiple values, they must be of the same type. For
  /// example, if you specify a database instance ID, then all of the other
  /// values must be database instance IDs.
  ///
  /// Parameter [sourceType] :
  /// The type of AWS DMS resource that generates the events. For example, if
  /// you want to be notified of events generated by a replication instance, you
  /// set this parameter to <code>replication-instance</code>. If this value
  /// isn't specified, all events are returned.
  ///
  /// Valid values: <code>replication-instance</code> |
  /// <code>replication-task</code>
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the event subscription.
  Future<CreateEventSubscriptionResponse> createEventSubscription({
    @_s.required String snsTopicArn,
    @_s.required String subscriptionName,
    bool enabled,
    List<String> eventCategories,
    List<String> sourceIds,
    String sourceType,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(snsTopicArn, 'snsTopicArn');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.CreateEventSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SnsTopicArn': snsTopicArn,
        'SubscriptionName': subscriptionName,
        'Enabled': enabled,
        'EventCategories': eventCategories,
        'SourceIds': sourceIds,
        'SourceType': sourceType,
        'Tags': tags,
      },
    );

    return CreateEventSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Creates the replication instance using the specified parameters.
  ///
  /// AWS DMS requires that your account have certain roles with appropriate
  /// permissions before you can create a replication instance. For information
  /// on the required roles, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.APIRole.html">Creating
  /// the IAM Roles to Use With the AWS CLI and AWS DMS API</a>. For information
  /// on the required permissions, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.IAMPermissions.html">IAM
  /// Permissions Needed to Use AWS DMS</a>.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [InsufficientResourceCapacityFault].
  /// May throw [ResourceQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [ReplicationSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidResourceStateFault].
  /// May throw [InvalidSubnet].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [replicationInstanceClass] :
  /// The compute and memory capacity of the replication instance as specified
  /// by the replication instance class.
  ///
  /// Valid Values: <code>dms.t2.micro | dms.t2.small | dms.t2.medium |
  /// dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge |
  /// dms.c4.4xlarge </code>
  ///
  /// Parameter [replicationInstanceIdentifier] :
  /// The replication instance identifier. This parameter is stored as a
  /// lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>myrepinstance</code>
  ///
  /// Parameter [allocatedStorage] :
  /// The amount of storage (in gigabytes) to be initially allocated for the
  /// replication instance.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// A value that indicates whether minor engine upgrades are applied
  /// automatically to the replication instance during the maintenance window.
  /// This parameter defaults to <code>true</code>.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone where the replication instance will be created. The
  /// default value is a random, system-chosen Availability Zone in the
  /// endpoint's AWS Region, for example: <code>us-east-1d</code>
  ///
  /// Parameter [dnsNameServers] :
  /// A list of DNS name servers supported for the replication instance.
  ///
  /// Parameter [engineVersion] :
  /// The engine version number of the replication instance.
  ///
  /// Parameter [kmsKeyId] :
  /// An AWS KMS key identifier that is used to encrypt the data on the
  /// replication instance.
  ///
  /// If you don't specify a value for the <code>KmsKeyId</code> parameter, then
  /// AWS DMS uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  ///
  /// Parameter [multiAZ] :
  /// Specifies whether the replication instance is a Multi-AZ deployment. You
  /// can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ
  /// parameter is set to <code>true</code>.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Format: <code>ddd:hh24:mi-ddd:hh24:mi</code>
  ///
  /// Default: A 30-minute window selected at random from an 8-hour block of
  /// time per AWS Region, occurring on a random day of the week.
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// Parameter [publiclyAccessible] :
  /// Specifies the accessibility options for the replication instance. A value
  /// of <code>true</code> represents an instance with a public IP address. A
  /// value of <code>false</code> represents an instance with a private IP
  /// address. The default value is <code>true</code>.
  ///
  /// Parameter [replicationSubnetGroupIdentifier] :
  /// A subnet group to associate with the replication instance.
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the replication instance.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// Specifies the VPC security group to be used with the replication instance.
  /// The VPC security group must work with the VPC containing the replication
  /// instance.
  Future<CreateReplicationInstanceResponse> createReplicationInstance({
    @_s.required String replicationInstanceClass,
    @_s.required String replicationInstanceIdentifier,
    int allocatedStorage,
    bool autoMinorVersionUpgrade,
    String availabilityZone,
    String dnsNameServers,
    String engineVersion,
    String kmsKeyId,
    bool multiAZ,
    String preferredMaintenanceWindow,
    bool publiclyAccessible,
    String replicationSubnetGroupIdentifier,
    List<Tag> tags,
    List<String> vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(
        replicationInstanceClass, 'replicationInstanceClass');
    ArgumentError.checkNotNull(
        replicationInstanceIdentifier, 'replicationInstanceIdentifier');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.CreateReplicationInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationInstanceClass': replicationInstanceClass,
        'ReplicationInstanceIdentifier': replicationInstanceIdentifier,
        'AllocatedStorage': allocatedStorage,
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
        'AvailabilityZone': availabilityZone,
        'DnsNameServers': dnsNameServers,
        'EngineVersion': engineVersion,
        'KmsKeyId': kmsKeyId,
        'MultiAZ': multiAZ,
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
        'PubliclyAccessible': publiclyAccessible,
        'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
        'Tags': tags,
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      },
    );

    return CreateReplicationInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a replication subnet group given a list of the subnet IDs in a
  /// VPC.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [ResourceQuotaExceededFault].
  /// May throw [ReplicationSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  ///
  /// Parameter [replicationSubnetGroupDescription] :
  /// The description for the subnet group.
  ///
  /// Parameter [replicationSubnetGroupIdentifier] :
  /// The name for the replication subnet group. This value is stored as a
  /// lowercase string.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters,
  /// periods, spaces, underscores, or hyphens. Must not be "default".
  ///
  /// Example: <code>mySubnetgroup</code>
  ///
  /// Parameter [subnetIds] :
  /// One or more subnet IDs to be assigned to the subnet group.
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the subnet group.
  Future<CreateReplicationSubnetGroupResponse> createReplicationSubnetGroup({
    @_s.required String replicationSubnetGroupDescription,
    @_s.required String replicationSubnetGroupIdentifier,
    @_s.required List<String> subnetIds,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        replicationSubnetGroupDescription, 'replicationSubnetGroupDescription');
    ArgumentError.checkNotNull(
        replicationSubnetGroupIdentifier, 'replicationSubnetGroupIdentifier');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.CreateReplicationSubnetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationSubnetGroupDescription': replicationSubnetGroupDescription,
        'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
        'SubnetIds': subnetIds,
        'Tags': tags,
      },
    );

    return CreateReplicationSubnetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a replication task using the specified parameters.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [ResourceQuotaExceededFault].
  ///
  /// Parameter [migrationType] :
  /// The migration type. Valid values: <code>full-load</code> |
  /// <code>cdc</code> | <code>full-load-and-cdc</code>
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of a replication instance.
  ///
  /// Parameter [replicationTaskIdentifier] :
  /// An identifier for the replication task.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceEndpointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies the source
  /// endpoint.
  ///
  /// Parameter [tableMappings] :
  /// The table mappings for the task, in JSON format. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.html">Table
  /// Mapping</a> in the <i>AWS Database Migration User Guide.</i>
  ///
  /// Parameter [targetEndpointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies the target
  /// endpoint.
  ///
  /// Parameter [cdcStartPosition] :
  /// Indicates when you want a change data capture (CDC) operation to start.
  /// Use either CdcStartPosition or CdcStartTime to specify when you want a CDC
  /// operation to start. Specifying both values results in an error.
  ///
  /// The value can be in date, checkpoint, or LSN/SCN format.
  ///
  /// Date Example: --cdc-start-position “2018-03-08T12:12:12”
  ///
  /// Checkpoint Example: --cdc-start-position
  /// "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
  ///
  /// LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”
  /// <note>
  /// When you use this task setting with a source PostgreSQL database, a
  /// logical replication slot should already be created and associated with the
  /// source endpoint. You can verify this by setting the <code>slotName</code>
  /// extra connection attribute to the name of this logical replication slot.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib">Extra
  /// Connection Attributes When Using PostgreSQL as a Source for AWS DMS</a>.
  /// </note>
  ///
  /// Parameter [cdcStartTime] :
  /// Indicates the start time for a change data capture (CDC) operation. Use
  /// either CdcStartTime or CdcStartPosition to specify when you want a CDC
  /// operation to start. Specifying both values results in an error.
  ///
  /// Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”
  ///
  /// Parameter [cdcStopPosition] :
  /// Indicates when you want a change data capture (CDC) operation to stop. The
  /// value can be either server time or commit time.
  ///
  /// Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12
  /// “
  ///
  /// Parameter [replicationTaskSettings] :
  /// Overall settings for the task, in JSON format. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.html">Task
  /// Settings</a> in the <i>AWS Database Migration User Guide.</i>
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the replication task.
  Future<CreateReplicationTaskResponse> createReplicationTask({
    @_s.required MigrationTypeValue migrationType,
    @_s.required String replicationInstanceArn,
    @_s.required String replicationTaskIdentifier,
    @_s.required String sourceEndpointArn,
    @_s.required String tableMappings,
    @_s.required String targetEndpointArn,
    String cdcStartPosition,
    DateTime cdcStartTime,
    String cdcStopPosition,
    String replicationTaskSettings,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(migrationType, 'migrationType');
    ArgumentError.checkNotNull(
        replicationInstanceArn, 'replicationInstanceArn');
    ArgumentError.checkNotNull(
        replicationTaskIdentifier, 'replicationTaskIdentifier');
    ArgumentError.checkNotNull(sourceEndpointArn, 'sourceEndpointArn');
    ArgumentError.checkNotNull(tableMappings, 'tableMappings');
    ArgumentError.checkNotNull(targetEndpointArn, 'targetEndpointArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.CreateReplicationTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MigrationType': migrationType,
        'ReplicationInstanceArn': replicationInstanceArn,
        'ReplicationTaskIdentifier': replicationTaskIdentifier,
        'SourceEndpointArn': sourceEndpointArn,
        'TableMappings': tableMappings,
        'TargetEndpointArn': targetEndpointArn,
        'CdcStartPosition': cdcStartPosition,
        'CdcStartTime': cdcStartTime,
        'CdcStopPosition': cdcStopPosition,
        'ReplicationTaskSettings': replicationTaskSettings,
        'Tags': tags,
      },
    );

    return CreateReplicationTaskResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified certificate.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [certificateArn] :
  /// The Amazon Resource Name (ARN) of the deleted certificate.
  Future<DeleteCertificateResponse> deleteCertificate({
    @_s.required String certificateArn,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DeleteCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
      },
    );

    return DeleteCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the connection between a replication instance and an endpoint.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the replication instance.
  Future<DeleteConnectionResponse> deleteConnection({
    @_s.required String endpointArn,
    @_s.required String replicationInstanceArn,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    ArgumentError.checkNotNull(
        replicationInstanceArn, 'replicationInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DeleteConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
        'ReplicationInstanceArn': replicationInstanceArn,
      },
    );

    return DeleteConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified endpoint.
  /// <note>
  /// All tasks associated with the endpoint must be deleted before you can
  /// delete the endpoint.
  /// </note> <p/>
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  Future<DeleteEndpointResponse> deleteEndpoint({
    @_s.required String endpointArn,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DeleteEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
      },
    );

    return DeleteEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an AWS DMS event subscription.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [subscriptionName] :
  /// The name of the DMS event notification subscription to be deleted.
  Future<DeleteEventSubscriptionResponse> deleteEventSubscription({
    @_s.required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DeleteEventSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubscriptionName': subscriptionName,
      },
    );

    return DeleteEventSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified replication instance.
  /// <note>
  /// You must delete any migration tasks that are associated with the
  /// replication instance before you can delete it.
  /// </note> <p/>
  ///
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the replication instance to be deleted.
  Future<DeleteReplicationInstanceResponse> deleteReplicationInstance({
    @_s.required String replicationInstanceArn,
  }) async {
    ArgumentError.checkNotNull(
        replicationInstanceArn, 'replicationInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DeleteReplicationInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationInstanceArn': replicationInstanceArn,
      },
    );

    return DeleteReplicationInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a subnet group.
  ///
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [replicationSubnetGroupIdentifier] :
  /// The subnet group name of the replication instance.
  Future<void> deleteReplicationSubnetGroup({
    @_s.required String replicationSubnetGroupIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        replicationSubnetGroupIdentifier, 'replicationSubnetGroupIdentifier');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DeleteReplicationSubnetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
      },
    );

    return DeleteReplicationSubnetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified replication task.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name (ARN) of the replication task to be deleted.
  Future<DeleteReplicationTaskResponse> deleteReplicationTask({
    @_s.required String replicationTaskArn,
  }) async {
    ArgumentError.checkNotNull(replicationTaskArn, 'replicationTaskArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DeleteReplicationTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskArn': replicationTaskArn,
      },
    );

    return DeleteReplicationTaskResponse.fromJson(jsonResponse.body);
  }

  /// Lists all of the AWS DMS attributes for a customer account. These
  /// attributes include AWS DMS quotas for the account and a unique account
  /// identifier in a particular DMS region. DMS quotas include a list of
  /// resource quotas supported by the account, such as the number of
  /// replication instances allowed. The description for each resource quota,
  /// includes the quota name, current usage toward that quota, and the quota's
  /// maximum value. DMS uses the unique account identifier to name each
  /// artifact used by DMS in the given region.
  ///
  /// This command does not take any parameters.
  Future<DescribeAccountAttributesResponse> describeAccountAttributes() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeAccountAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeAccountAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Provides a description of the certificate.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to the certificate described in the form of key-value
  /// pairs.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 10
  Future<DescribeCertificatesResponse> describeCertificates({
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeCertificates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeCertificatesResponse.fromJson(jsonResponse.body);
  }

  /// Describes the status of the connections that have been made between the
  /// replication instance and an endpoint. Connections are created when you
  /// test an endpoint.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// The filters applied to the connection.
  ///
  /// Valid filter names: endpoint-arn | replication-instance-arn
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeConnectionsResponse> describeConnections({
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeConnectionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the type of endpoints available.
  ///
  /// Parameter [filters] :
  /// Filters applied to the describe action.
  ///
  /// Valid filter names: engine-name | endpoint-type
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeEndpointTypesResponse> describeEndpointTypes({
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeEndpointTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeEndpointTypesResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the endpoints for your account in the current
  /// region.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to the describe action.
  ///
  /// Valid filter names: endpoint-arn | endpoint-type | endpoint-id |
  /// engine-name
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeEndpointsResponse> describeEndpoints({
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Lists categories for all event source types, or, if specified, for a
  /// specified source type. You can see a list of the event categories and
  /// source types in <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working
  /// with Events and Notifications</a> in the <i>AWS Database Migration Service
  /// User Guide.</i>
  ///
  /// Parameter [filters] :
  /// Filters applied to the action.
  ///
  /// Parameter [sourceType] :
  /// The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-task
  Future<DescribeEventCategoriesResponse> describeEventCategories({
    List<Filter> filters,
    String sourceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeEventCategories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'SourceType': sourceType,
      },
    );

    return DescribeEventCategoriesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the event subscriptions for a customer account. The description
  /// of a subscription includes <code>SubscriptionName</code>,
  /// <code>SNSTopicARN</code>, <code>CustomerID</code>,
  /// <code>SourceType</code>, <code>SourceID</code>, <code>CreationTime</code>,
  /// and <code>Status</code>.
  ///
  /// If you specify <code>SubscriptionName</code>, this action lists the
  /// description for that subscription.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to the action.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [subscriptionName] :
  /// The name of the AWS DMS event subscription to be described.
  Future<DescribeEventSubscriptionsResponse> describeEventSubscriptions({
    List<Filter> filters,
    String marker,
    int maxRecords,
    String subscriptionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeEventSubscriptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
        'SubscriptionName': subscriptionName,
      },
    );

    return DescribeEventSubscriptionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists events for a given source identifier and source type. You can also
  /// specify a start and end time. For more information on AWS DMS events, see
  /// <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working
  /// with Events and Notifications</a> in the <i>AWS Database Migration User
  /// Guide.</i>
  ///
  /// Parameter [duration] :
  /// The duration of the events to be listed.
  ///
  /// Parameter [endTime] :
  /// The end time for the events to be listed.
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories for the source type that you've chosen.
  ///
  /// Parameter [filters] :
  /// Filters applied to the action.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [sourceIdentifier] :
  /// The identifier of an event source.
  ///
  /// Parameter [sourceType] :
  /// The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-task
  ///
  /// Parameter [startTime] :
  /// The start time for the events to be listed.
  Future<DescribeEventsResponse> describeEvents({
    int duration,
    DateTime endTime,
    List<String> eventCategories,
    List<Filter> filters,
    String marker,
    int maxRecords,
    String sourceIdentifier,
    SourceType sourceType,
    DateTime startTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Duration': duration,
        'EndTime': endTime,
        'EventCategories': eventCategories,
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
        'SourceIdentifier': sourceIdentifier,
        'SourceType': sourceType,
        'StartTime': startTime,
      },
    );

    return DescribeEventsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the replication instance types that can be
  /// created in the specified region.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeOrderableReplicationInstancesResponse>
      describeOrderableReplicationInstances({
    String marker,
    int maxRecords,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeOrderableReplicationInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeOrderableReplicationInstancesResponse.fromJson(
        jsonResponse.body);
  }

  /// For internal use only
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// <p/>
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the replication instance.
  Future<DescribePendingMaintenanceActionsResponse>
      describePendingMaintenanceActions({
    List<Filter> filters,
    String marker,
    int maxRecords,
    String replicationInstanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribePendingMaintenanceActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
        'ReplicationInstanceArn': replicationInstanceArn,
      },
    );

    return DescribePendingMaintenanceActionsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the status of the RefreshSchemas operation.
  ///
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  Future<DescribeRefreshSchemasStatusResponse> describeRefreshSchemasStatus({
    @_s.required String endpointArn,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeRefreshSchemasStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
      },
    );

    return DescribeRefreshSchemasStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the task logs for the specified task.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the replication instance.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeReplicationInstanceTaskLogsResponse>
      describeReplicationInstanceTaskLogs({
    @_s.required String replicationInstanceArn,
    String marker,
    int maxRecords,
  }) async {
    ArgumentError.checkNotNull(
        replicationInstanceArn, 'replicationInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeReplicationInstanceTaskLogs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationInstanceArn': replicationInstanceArn,
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeReplicationInstanceTaskLogsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns information about replication instances for your account in the
  /// current region.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to the describe action.
  ///
  /// Valid filter names: replication-instance-arn | replication-instance-id |
  /// replication-instance-class | engine-version
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeReplicationInstancesResponse> describeReplicationInstances({
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeReplicationInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeReplicationInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the replication subnet groups.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to the describe action.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeReplicationSubnetGroupsResponse>
      describeReplicationSubnetGroups({
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeReplicationSubnetGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeReplicationSubnetGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the task assessment results from Amazon S3. This action always
  /// returns the latest results.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the task.
  /// When this input parameter is specified, the API returns only one result
  /// and ignore the values of the <code>MaxRecords</code> and
  /// <code>Marker</code> parameters.
  Future<DescribeReplicationTaskAssessmentResultsResponse>
      describeReplicationTaskAssessmentResults({
    String marker,
    int maxRecords,
    String replicationTaskArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonDMSv20160101.DescribeReplicationTaskAssessmentResults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Marker': marker,
        'MaxRecords': maxRecords,
        'ReplicationTaskArn': replicationTaskArn,
      },
    );

    return DescribeReplicationTaskAssessmentResultsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns information about replication tasks for your account in the
  /// current region.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to the describe action.
  ///
  /// Valid filter names: replication-task-arn | replication-task-id |
  /// migration-type | endpoint-arn | replication-instance-arn
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// Parameter [withoutSettings] :
  /// An option to set to avoid returning information about settings. Use this
  /// to reduce overhead when setting information is too large. To use this
  /// option, choose <code>true</code>; otherwise, choose <code>false</code>
  /// (the default).
  Future<DescribeReplicationTasksResponse> describeReplicationTasks({
    List<Filter> filters,
    String marker,
    int maxRecords,
    bool withoutSettings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeReplicationTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
        'WithoutSettings': withoutSettings,
      },
    );

    return DescribeReplicationTasksResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the schema for the specified endpoint.
  /// <p/>
  ///
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribeSchemasResponse> describeSchemas({
    @_s.required String endpointArn,
    String marker,
    int maxRecords,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeSchemas'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeSchemasResponse.fromJson(jsonResponse.body);
  }

  /// Returns table statistics on the database migration task, including table
  /// name, rows inserted, rows updated, and rows deleted.
  ///
  /// Note that the "last updated" column the DMS console only indicates the
  /// time that AWS DMS last updated the table statistics record for a table. It
  /// does not indicate the time of the last update to the table.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name (ARN) of the replication task.
  ///
  /// Parameter [filters] :
  /// Filters applied to the describe table statistics action.
  ///
  /// Valid filter names: schema-name | table-name | table-state
  ///
  /// A combination of filters creates an AND condition where each record
  /// matches all specified filters.
  ///
  /// Parameter [marker] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 500.
  Future<DescribeTableStatisticsResponse> describeTableStatistics({
    @_s.required String replicationTaskArn,
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    ArgumentError.checkNotNull(replicationTaskArn, 'replicationTaskArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeTableStatistics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskArn': replicationTaskArn,
        'Filters': filters,
        'Marker': marker,
        'MaxRecords': maxRecords,
      },
    );

    return DescribeTableStatisticsResponse.fromJson(jsonResponse.body);
  }

  /// Uploads the specified certificate.
  ///
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [InvalidCertificateFault].
  /// May throw [ResourceQuotaExceededFault].
  ///
  /// Parameter [certificateIdentifier] :
  /// A customer-assigned name for the certificate. Identifiers must begin with
  /// a letter and must contain only ASCII letters, digits, and hyphens. They
  /// can't end with a hyphen or contain two consecutive hyphens.
  ///
  /// Parameter [certificatePem] :
  /// The contents of a <code>.pem</code> file, which contains an X.509
  /// certificate.
  ///
  /// Parameter [certificateWallet] :
  /// The location of an imported Oracle Wallet certificate for use with SSL.
  ///
  /// Parameter [tags] :
  /// The tags associated with the certificate.
  Future<ImportCertificateResponse> importCertificate({
    @_s.required String certificateIdentifier,
    String certificatePem,
    Uint8List certificateWallet,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(certificateIdentifier, 'certificateIdentifier');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.ImportCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateIdentifier': certificateIdentifier,
        'CertificatePem': certificatePem,
        'CertificateWallet': certificateWallet,
        'Tags': tags,
      },
    );

    return ImportCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags for an AWS DMS resource.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the AWS DMS
  /// resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the specified endpoint.
  ///
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [AccessDeniedFault].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  ///
  /// Parameter [certificateArn] :
  /// The Amazon Resource Name (ARN) of the certificate used for SSL connection.
  ///
  /// Parameter [databaseName] :
  /// The name of the endpoint database.
  ///
  /// Parameter [dmsTransferSettings] :
  /// The settings in JSON format for the DMS transfer type of source endpoint.
  ///
  /// Attributes include the following:
  ///
  /// <ul>
  /// <li>
  /// serviceAccessRoleArn - The AWS Identity and Access Management (IAM) role
  /// that has permission to access the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// BucketName - The name of the S3 bucket to use.
  /// </li>
  /// <li>
  /// compressionType - An optional parameter to use GZIP to compress the target
  /// files. Either set this parameter to NONE (the default) or don't use it to
  /// leave the files uncompressed.
  /// </li>
  /// </ul>
  /// Shorthand syntax for these settings is as follows:
  /// <code>ServiceAccessRoleArn=string
  /// ,BucketName=string,CompressionType=string</code>
  ///
  /// JSON syntax for these settings is as follows: <code>{
  /// "ServiceAccessRoleArn": "string", "BucketName": "string",
  /// "CompressionType": "none"|"gzip" } </code>
  ///
  /// Parameter [dynamoDbSettings] :
  /// Settings in JSON format for the target Amazon DynamoDB endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html">Using
  /// Object Mapping to Migrate Data to DynamoDB</a> in the <i>AWS Database
  /// Migration Service User Guide.</i>
  ///
  /// Parameter [elasticsearchSettings] :
  /// Settings in JSON format for the target Elasticsearch endpoint. For more
  /// information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration">Extra
  /// Connection Attributes When Using Elasticsearch as a Target for AWS DMS</a>
  /// in the <i>AWS Database Migration User Guide.</i>
  ///
  /// Parameter [endpointIdentifier] :
  /// The database endpoint identifier. Identifiers must begin with a letter and
  /// must contain only ASCII letters, digits, and hyphens. They can't end with
  /// a hyphen or contain two consecutive hyphens.
  ///
  /// Parameter [endpointType] :
  /// The type of endpoint. Valid values are <code>source</code> and
  /// <code>target</code>.
  ///
  /// Parameter [engineName] :
  /// The type of engine for the endpoint. Valid values, depending on the
  /// EndpointType, include <code>"mysql"</code>, <code>"oracle"</code>,
  /// <code>"postgres"</code>, <code>"mariadb"</code>, <code>"aurora"</code>,
  /// <code>"aurora-postgresql"</code>, <code>"redshift"</code>,
  /// <code>"s3"</code>, <code>"db2"</code>, <code>"azuredb"</code>,
  /// <code>"sybase"</code>, <code>"dynamodb"</code>, <code>"mongodb"</code>,
  /// <code>"kinesis"</code>, <code>"kafka"</code>,
  /// <code>"elasticsearch"</code>, <code>"documentdb"</code>, and
  /// <code>"sqlserver"</code>.
  ///
  /// Parameter [externalTableDefinition] :
  /// The external table definition.
  ///
  /// Parameter [extraConnectionAttributes] :
  /// Additional attributes associated with the connection. To reset this
  /// parameter, pass the empty string ("") as an argument.
  ///
  /// Parameter [kafkaSettings] :
  /// Settings in JSON format for the target Apache Kafka endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html#CHAP_Target.Kafka.ObjectMapping">Using
  /// Object Mapping to Migrate Data to Apache Kafka</a> in the <i>AWS Database
  /// Migration User Guide.</i>
  ///
  /// Parameter [kinesisSettings] :
  /// Settings in JSON format for the target endpoint for Amazon Kinesis Data
  /// Streams. For information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html#CHAP_Target.Kinesis.ObjectMapping">Using
  /// Object Mapping to Migrate Data to a Kinesis Data Stream</a> in the <i>AWS
  /// Database Migration User Guide.</i>
  ///
  /// Parameter [mongoDbSettings] :
  /// Settings in JSON format for the source MongoDB endpoint. For more
  /// information about the available settings, see the configuration properties
  /// section in <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html">
  /// Using MongoDB as a Target for AWS Database Migration Service</a> in the
  /// <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [password] :
  /// The password to be used to login to the endpoint database.
  ///
  /// Parameter [port] :
  /// The port used by the endpoint database.
  ///
  /// Parameter [s3Settings] :
  /// Settings in JSON format for the target Amazon S3 endpoint. For more
  /// information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring">Extra
  /// Connection Attributes When Using Amazon S3 as a Target for AWS DMS</a> in
  /// the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [serverName] :
  /// The name of the server where the endpoint database resides.
  ///
  /// Parameter [serviceAccessRoleArn] :
  /// The Amazon Resource Name (ARN) for the service access role you want to use
  /// to modify the endpoint.
  ///
  /// Parameter [sslMode] :
  /// The SSL mode used to connect to the endpoint. The default value is
  /// <code>none</code>.
  ///
  /// Parameter [username] :
  /// The user name to be used to login to the endpoint database.
  Future<ModifyEndpointResponse> modifyEndpoint({
    @_s.required String endpointArn,
    String certificateArn,
    String databaseName,
    DmsTransferSettings dmsTransferSettings,
    DynamoDbSettings dynamoDbSettings,
    ElasticsearchSettings elasticsearchSettings,
    String endpointIdentifier,
    ReplicationEndpointTypeValue endpointType,
    String engineName,
    String externalTableDefinition,
    String extraConnectionAttributes,
    KafkaSettings kafkaSettings,
    KinesisSettings kinesisSettings,
    MongoDbSettings mongoDbSettings,
    String password,
    int port,
    RedshiftSettings redshiftSettings,
    S3Settings s3Settings,
    String serverName,
    String serviceAccessRoleArn,
    DmsSslModeValue sslMode,
    String username,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.ModifyEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
        'CertificateArn': certificateArn,
        'DatabaseName': databaseName,
        'DmsTransferSettings': dmsTransferSettings,
        'DynamoDbSettings': dynamoDbSettings,
        'ElasticsearchSettings': elasticsearchSettings,
        'EndpointIdentifier': endpointIdentifier,
        'EndpointType': endpointType,
        'EngineName': engineName,
        'ExternalTableDefinition': externalTableDefinition,
        'ExtraConnectionAttributes': extraConnectionAttributes,
        'KafkaSettings': kafkaSettings,
        'KinesisSettings': kinesisSettings,
        'MongoDbSettings': mongoDbSettings,
        'Password': password,
        'Port': port,
        'RedshiftSettings': redshiftSettings,
        'S3Settings': s3Settings,
        'ServerName': serverName,
        'ServiceAccessRoleArn': serviceAccessRoleArn,
        'SslMode': sslMode,
        'Username': username,
      },
    );

    return ModifyEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Modifies an existing AWS DMS event notification subscription.
  ///
  /// May throw [ResourceQuotaExceededFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [KMSAccessDeniedFault].
  /// May throw [KMSDisabledFault].
  /// May throw [KMSInvalidStateFault].
  /// May throw [KMSNotFoundFault].
  /// May throw [KMSThrottlingFault].
  ///
  /// Parameter [subscriptionName] :
  /// The name of the AWS DMS event notification subscription to be modified.
  ///
  /// Parameter [enabled] :
  /// A Boolean value; set to <b>true</b> to activate the subscription.
  ///
  /// Parameter [eventCategories] :
  /// A list of event categories for a source type that you want to subscribe
  /// to. Use the <code>DescribeEventCategories</code> action to see a list of
  /// event categories.
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic created for event
  /// notification. The ARN is created by Amazon SNS when you create a topic and
  /// subscribe to it.
  ///
  /// Parameter [sourceType] :
  /// The type of AWS DMS resource that generates the events you want to
  /// subscribe to.
  ///
  /// Valid values: replication-instance | replication-task
  Future<ModifyEventSubscriptionResponse> modifyEventSubscription({
    @_s.required String subscriptionName,
    bool enabled,
    List<String> eventCategories,
    String snsTopicArn,
    String sourceType,
  }) async {
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.ModifyEventSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SubscriptionName': subscriptionName,
        'Enabled': enabled,
        'EventCategories': eventCategories,
        'SnsTopicArn': snsTopicArn,
        'SourceType': sourceType,
      },
    );

    return ModifyEventSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the replication instance to apply new settings. You can change
  /// one or more parameters by specifying these parameters and the new values
  /// in the request.
  ///
  /// Some settings are applied during the maintenance window.
  /// <p/>
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [InsufficientResourceCapacityFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [UpgradeDependencyFailureFault].
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the replication instance.
  ///
  /// Parameter [allocatedStorage] :
  /// The amount of storage (in gigabytes) to be allocated for the replication
  /// instance.
  ///
  /// Parameter [allowMajorVersionUpgrade] :
  /// Indicates that major version upgrades are allowed. Changing this parameter
  /// does not result in an outage, and the change is asynchronously applied as
  /// soon as possible.
  ///
  /// This parameter must be set to <code>true</code> when specifying a value
  /// for the <code>EngineVersion</code> parameter that is a different major
  /// version than the replication instance's current version.
  ///
  /// Parameter [applyImmediately] :
  /// Indicates whether the changes should be applied immediately or during the
  /// next maintenance window.
  ///
  /// Parameter [autoMinorVersionUpgrade] :
  /// A value that indicates that minor version upgrades are applied
  /// automatically to the replication instance during the maintenance window.
  /// Changing this parameter doesn't result in an outage, except in the case
  /// dsecribed following. The change is asynchronously applied as soon as
  /// possible.
  ///
  /// An outage does result if these factors apply:
  ///
  /// <ul>
  /// <li>
  /// This parameter is set to <code>true</code> during the maintenance window.
  /// </li>
  /// <li>
  /// A newer minor version is available.
  /// </li>
  /// <li>
  /// AWS DMS has enabled automatic patching for the given engine version.
  /// </li>
  /// </ul>
  ///
  /// Parameter [engineVersion] :
  /// The engine version number of the replication instance.
  ///
  /// Parameter [multiAZ] :
  /// Specifies whether the replication instance is a Multi-AZ deployment. You
  /// can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ
  /// parameter is set to <code>true</code>.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range (in UTC) during which system maintenance can occur,
  /// which might result in an outage. Changing this parameter does not result
  /// in an outage, except in the following situation, and the change is
  /// asynchronously applied as soon as possible. If moving this window to the
  /// current time, there must be at least 30 minutes between the current time
  /// and end of the window to ensure pending changes are applied.
  ///
  /// Default: Uses existing setting
  ///
  /// Format: ddd:hh24:mi-ddd:hh24:mi
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Must be at least 30 minutes
  ///
  /// Parameter [replicationInstanceClass] :
  /// The compute and memory capacity of the replication instance.
  ///
  /// Valid Values: <code>dms.t2.micro | dms.t2.small | dms.t2.medium |
  /// dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge |
  /// dms.c4.4xlarge </code>
  ///
  /// Parameter [replicationInstanceIdentifier] :
  /// The replication instance identifier. This parameter is stored as a
  /// lowercase string.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// Specifies the VPC security group to be used with the replication instance.
  /// The VPC security group must work with the VPC containing the replication
  /// instance.
  Future<ModifyReplicationInstanceResponse> modifyReplicationInstance({
    @_s.required String replicationInstanceArn,
    int allocatedStorage,
    bool allowMajorVersionUpgrade,
    bool applyImmediately,
    bool autoMinorVersionUpgrade,
    String engineVersion,
    bool multiAZ,
    String preferredMaintenanceWindow,
    String replicationInstanceClass,
    String replicationInstanceIdentifier,
    List<String> vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(
        replicationInstanceArn, 'replicationInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.ModifyReplicationInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationInstanceArn': replicationInstanceArn,
        'AllocatedStorage': allocatedStorage,
        'AllowMajorVersionUpgrade': allowMajorVersionUpgrade,
        'ApplyImmediately': applyImmediately,
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
        'EngineVersion': engineVersion,
        'MultiAZ': multiAZ,
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
        'ReplicationInstanceClass': replicationInstanceClass,
        'ReplicationInstanceIdentifier': replicationInstanceIdentifier,
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      },
    );

    return ModifyReplicationInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the settings for the specified replication subnet group.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [ResourceQuotaExceededFault].
  /// May throw [SubnetAlreadyInUse].
  /// May throw [ReplicationSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  ///
  /// Parameter [replicationSubnetGroupIdentifier] :
  /// The name of the replication instance subnet group.
  ///
  /// Parameter [subnetIds] :
  /// A list of subnet IDs.
  ///
  /// Parameter [replicationSubnetGroupDescription] :
  /// A description for the replication instance subnet group.
  Future<ModifyReplicationSubnetGroupResponse> modifyReplicationSubnetGroup({
    @_s.required String replicationSubnetGroupIdentifier,
    @_s.required List<String> subnetIds,
    String replicationSubnetGroupDescription,
  }) async {
    ArgumentError.checkNotNull(
        replicationSubnetGroupIdentifier, 'replicationSubnetGroupIdentifier');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.ModifyReplicationSubnetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
        'SubnetIds': subnetIds,
        'ReplicationSubnetGroupDescription': replicationSubnetGroupDescription,
      },
    );

    return ModifyReplicationSubnetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the specified replication task.
  ///
  /// You can't modify the task endpoints. The task must be stopped before you
  /// can modify it.
  ///
  /// For more information about AWS DMS tasks, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working
  /// with Migration Tasks</a> in the <i>AWS Database Migration Service User
  /// Guide</i>.
  ///
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name (ARN) of the replication task.
  ///
  /// Parameter [cdcStartPosition] :
  /// Indicates when you want a change data capture (CDC) operation to start.
  /// Use either CdcStartPosition or CdcStartTime to specify when you want a CDC
  /// operation to start. Specifying both values results in an error.
  ///
  /// The value can be in date, checkpoint, or LSN/SCN format.
  ///
  /// Date Example: --cdc-start-position “2018-03-08T12:12:12”
  ///
  /// Checkpoint Example: --cdc-start-position
  /// "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
  ///
  /// LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”
  /// <note>
  /// When you use this task setting with a source PostgreSQL database, a
  /// logical replication slot should already be created and associated with the
  /// source endpoint. You can verify this by setting the <code>slotName</code>
  /// extra connection attribute to the name of this logical replication slot.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib">Extra
  /// Connection Attributes When Using PostgreSQL as a Source for AWS DMS</a>.
  /// </note>
  ///
  /// Parameter [cdcStartTime] :
  /// Indicates the start time for a change data capture (CDC) operation. Use
  /// either CdcStartTime or CdcStartPosition to specify when you want a CDC
  /// operation to start. Specifying both values results in an error.
  ///
  /// Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”
  ///
  /// Parameter [cdcStopPosition] :
  /// Indicates when you want a change data capture (CDC) operation to stop. The
  /// value can be either server time or commit time.
  ///
  /// Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12
  /// “
  ///
  /// Parameter [migrationType] :
  /// The migration type. Valid values: <code>full-load</code> |
  /// <code>cdc</code> | <code>full-load-and-cdc</code>
  ///
  /// Parameter [replicationTaskIdentifier] :
  /// The replication task identifier.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [replicationTaskSettings] :
  /// JSON file that contains settings for the task, such as target metadata
  /// settings.
  ///
  /// Parameter [tableMappings] :
  /// When using the AWS CLI or boto3, provide the path of the JSON file that
  /// contains the table mappings. Precede the path with <code>file://</code>.
  /// When working with the DMS API, provide the JSON as the parameter value,
  /// for example: <code>--table-mappings file://mappingfile.json</code>
  Future<ModifyReplicationTaskResponse> modifyReplicationTask({
    @_s.required String replicationTaskArn,
    String cdcStartPosition,
    DateTime cdcStartTime,
    String cdcStopPosition,
    MigrationTypeValue migrationType,
    String replicationTaskIdentifier,
    String replicationTaskSettings,
    String tableMappings,
  }) async {
    ArgumentError.checkNotNull(replicationTaskArn, 'replicationTaskArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.ModifyReplicationTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskArn': replicationTaskArn,
        'CdcStartPosition': cdcStartPosition,
        'CdcStartTime': cdcStartTime,
        'CdcStopPosition': cdcStopPosition,
        'MigrationType': migrationType,
        'ReplicationTaskIdentifier': replicationTaskIdentifier,
        'ReplicationTaskSettings': replicationTaskSettings,
        'TableMappings': tableMappings,
      },
    );

    return ModifyReplicationTaskResponse.fromJson(jsonResponse.body);
  }

  /// Reboots a replication instance. Rebooting results in a momentary outage,
  /// until the replication instance becomes available again.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the replication instance.
  ///
  /// Parameter [forceFailover] :
  /// If this parameter is <code>true</code>, the reboot is conducted through a
  /// Multi-AZ failover. (If the instance isn't configured for Multi-AZ, then
  /// you can't specify <code>true</code>.)
  Future<RebootReplicationInstanceResponse> rebootReplicationInstance({
    @_s.required String replicationInstanceArn,
    bool forceFailover,
  }) async {
    ArgumentError.checkNotNull(
        replicationInstanceArn, 'replicationInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.RebootReplicationInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationInstanceArn': replicationInstanceArn,
        'ForceFailover': forceFailover,
      },
    );

    return RebootReplicationInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Populates the schema for the specified endpoint. This is an asynchronous
  /// operation and can take several minutes. You can check the status of this
  /// operation by calling the DescribeRefreshSchemasStatus operation.
  ///
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [ResourceQuotaExceededFault].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the replication instance.
  Future<RefreshSchemasResponse> refreshSchemas({
    @_s.required String endpointArn,
    @_s.required String replicationInstanceArn,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    ArgumentError.checkNotNull(
        replicationInstanceArn, 'replicationInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.RefreshSchemas'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
        'ReplicationInstanceArn': replicationInstanceArn,
      },
    );

    return RefreshSchemasResponse.fromJson(jsonResponse.body);
  }

  /// Reloads the target database table with the source data.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name (ARN) of the replication task.
  ///
  /// Parameter [tablesToReload] :
  /// The name and schema of the table to be reloaded.
  ///
  /// Parameter [reloadOption] :
  /// Options for reload. Specify <code>data-reload</code> to reload the data
  /// and re-validate it if validation is enabled. Specify
  /// <code>validate-only</code> to re-validate the table. This option applies
  /// only when validation is enabled for the task.
  ///
  /// Valid values: data-reload, validate-only
  ///
  /// Default value is data-reload.
  Future<ReloadTablesResponse> reloadTables({
    @_s.required String replicationTaskArn,
    @_s.required List<TableToReload> tablesToReload,
    ReloadOptionValue reloadOption,
  }) async {
    ArgumentError.checkNotNull(replicationTaskArn, 'replicationTaskArn');
    ArgumentError.checkNotNull(tablesToReload, 'tablesToReload');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.ReloadTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskArn': replicationTaskArn,
        'TablesToReload': tablesToReload,
        'ReloadOption': reloadOption,
      },
    );

    return ReloadTablesResponse.fromJson(jsonResponse.body);
  }

  /// Removes metadata tags from a DMS resource.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [resourceArn] :
  /// An AWS DMS resource from which you want to remove tag(s). The value for
  /// this parameter is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// The tag key (name) of the tag to be removed.
  Future<void> removeTagsFromResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.RemoveTagsFromResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );

    return RemoveTagsFromResourceResponse.fromJson(jsonResponse.body);
  }

  /// Starts the replication task.
  ///
  /// For more information about AWS DMS tasks, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html">Working
  /// with Migration Tasks </a> in the <i>AWS Database Migration Service User
  /// Guide.</i>
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  /// May throw [AccessDeniedFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name (ARN) of the replication task to be started.
  ///
  /// Parameter [startReplicationTaskType] :
  /// The type of replication task.
  ///
  /// Parameter [cdcStartPosition] :
  /// Indicates when you want a change data capture (CDC) operation to start.
  /// Use either CdcStartPosition or CdcStartTime to specify when you want a CDC
  /// operation to start. Specifying both values results in an error.
  ///
  /// The value can be in date, checkpoint, or LSN/SCN format.
  ///
  /// Date Example: --cdc-start-position “2018-03-08T12:12:12”
  ///
  /// Checkpoint Example: --cdc-start-position
  /// "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
  ///
  /// LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”
  /// <note>
  /// When you use this task setting with a source PostgreSQL database, a
  /// logical replication slot should already be created and associated with the
  /// source endpoint. You can verify this by setting the <code>slotName</code>
  /// extra connection attribute to the name of this logical replication slot.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib">Extra
  /// Connection Attributes When Using PostgreSQL as a Source for AWS DMS</a>.
  /// </note>
  ///
  /// Parameter [cdcStartTime] :
  /// Indicates the start time for a change data capture (CDC) operation. Use
  /// either CdcStartTime or CdcStartPosition to specify when you want a CDC
  /// operation to start. Specifying both values results in an error.
  ///
  /// Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”
  ///
  /// Parameter [cdcStopPosition] :
  /// Indicates when you want a change data capture (CDC) operation to stop. The
  /// value can be either server time or commit time.
  ///
  /// Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12
  /// “
  Future<StartReplicationTaskResponse> startReplicationTask({
    @_s.required String replicationTaskArn,
    @_s.required StartReplicationTaskTypeValue startReplicationTaskType,
    String cdcStartPosition,
    DateTime cdcStartTime,
    String cdcStopPosition,
  }) async {
    ArgumentError.checkNotNull(replicationTaskArn, 'replicationTaskArn');
    ArgumentError.checkNotNull(
        startReplicationTaskType, 'startReplicationTaskType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.StartReplicationTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskArn': replicationTaskArn,
        'StartReplicationTaskType': startReplicationTaskType,
        'CdcStartPosition': cdcStartPosition,
        'CdcStartTime': cdcStartTime,
        'CdcStopPosition': cdcStopPosition,
      },
    );

    return StartReplicationTaskResponse.fromJson(jsonResponse.body);
  }

  /// Starts the replication task assessment for unsupported data types in the
  /// source database.
  ///
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name (ARN) of the replication task.
  Future<StartReplicationTaskAssessmentResponse>
      startReplicationTaskAssessment({
    @_s.required String replicationTaskArn,
  }) async {
    ArgumentError.checkNotNull(replicationTaskArn, 'replicationTaskArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.StartReplicationTaskAssessment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskArn': replicationTaskArn,
      },
    );

    return StartReplicationTaskAssessmentResponse.fromJson(jsonResponse.body);
  }

  /// Stops the replication task.
  /// <p/>
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name(ARN) of the replication task to be stopped.
  Future<StopReplicationTaskResponse> stopReplicationTask({
    @_s.required String replicationTaskArn,
  }) async {
    ArgumentError.checkNotNull(replicationTaskArn, 'replicationTaskArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.StopReplicationTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskArn': replicationTaskArn,
      },
    );

    return StopReplicationTaskResponse.fromJson(jsonResponse.body);
  }

  /// Tests the connection between the replication instance and the endpoint.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [ResourceQuotaExceededFault].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the replication instance.
  Future<TestConnectionResponse> testConnection({
    @_s.required String endpointArn,
    @_s.required String replicationInstanceArn,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    ArgumentError.checkNotNull(
        replicationInstanceArn, 'replicationInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.TestConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
        'ReplicationInstanceArn': replicationInstanceArn,
      },
    );

    return TestConnectionResponse.fromJson(jsonResponse.body);
  }
}

/// Describes a quota for an AWS account, for example, the number of replication
/// instances allowed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountQuota {
  /// The name of the AWS DMS quota for this AWS account.
  @_s.JsonKey(name: 'AccountQuotaName')
  final String accountQuotaName;

  /// The maximum allowed value for the quota.
  @_s.JsonKey(name: 'Max')
  final int max;

  /// The amount currently used toward the quota maximum.
  @_s.JsonKey(name: 'Used')
  final int used;

  AccountQuota({
    this.accountQuotaName,
    this.max,
    this.used,
  });
  factory AccountQuota.fromJson(Map<String, dynamic> json) =>
      _$AccountQuotaFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddTagsToResourceResponse {
  AddTagsToResourceResponse();
  factory AddTagsToResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$AddTagsToResourceResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplyPendingMaintenanceActionResponse {
  /// The AWS DMS resource that the pending maintenance action will be applied to.
  @_s.JsonKey(name: 'ResourcePendingMaintenanceActions')
  final ResourcePendingMaintenanceActions resourcePendingMaintenanceActions;

  ApplyPendingMaintenanceActionResponse({
    this.resourcePendingMaintenanceActions,
  });
  factory ApplyPendingMaintenanceActionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ApplyPendingMaintenanceActionResponseFromJson(json);
}

enum AuthMechanismValue {
  @_s.JsonValue('default')
  $default,
  @_s.JsonValue('mongodb_cr')
  mongodbCr,
  @_s.JsonValue('scram_sha_1')
  scramSha_1,
}

enum AuthTypeValue {
  @_s.JsonValue('no')
  no,
  @_s.JsonValue('password')
  password,
}

/// The name of the Availability Zone for use during database migration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AvailabilityZone {
  /// The name of the Availability Zone.
  @_s.JsonKey(name: 'Name')
  final String name;

  AvailabilityZone({
    this.name,
  });
  factory AvailabilityZone.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityZoneFromJson(json);
}

/// The SSL certificate that can be used to encrypt connections between the
/// endpoints and the replication instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Certificate {
  /// The Amazon Resource Name (ARN) for the certificate.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  /// The date that the certificate was created.
  @_s.JsonKey(
      name: 'CertificateCreationDate',
      fromJson: unixFromJson,
      toJson: unixToJson)
  final DateTime certificateCreationDate;

  /// A customer-assigned name for the certificate. Identifiers must begin with a
  /// letter and must contain only ASCII letters, digits, and hyphens. They can't
  /// end with a hyphen or contain two consecutive hyphens.
  @_s.JsonKey(name: 'CertificateIdentifier')
  final String certificateIdentifier;

  /// The owner of the certificate.
  @_s.JsonKey(name: 'CertificateOwner')
  final String certificateOwner;

  /// The contents of a <code>.pem</code> file, which contains an X.509
  /// certificate.
  @_s.JsonKey(name: 'CertificatePem')
  final String certificatePem;

  /// The location of an imported Oracle Wallet certificate for use with SSL.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'CertificateWallet')
  final Uint8List certificateWallet;

  /// The key length of the cryptographic algorithm being used.
  @_s.JsonKey(name: 'KeyLength')
  final int keyLength;

  /// The signing algorithm for the certificate.
  @_s.JsonKey(name: 'SigningAlgorithm')
  final String signingAlgorithm;

  /// The beginning date that the certificate is valid.
  @_s.JsonKey(name: 'ValidFromDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime validFromDate;

  /// The final date that the certificate is valid.
  @_s.JsonKey(name: 'ValidToDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime validToDate;

  Certificate({
    this.certificateArn,
    this.certificateCreationDate,
    this.certificateIdentifier,
    this.certificateOwner,
    this.certificatePem,
    this.certificateWallet,
    this.keyLength,
    this.signingAlgorithm,
    this.validFromDate,
    this.validToDate,
  });
  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);
}

enum CompressionTypeValue {
  @_s.JsonValue('none')
  none,
  @_s.JsonValue('gzip')
  gzip,
}

/// Status of the connection between an endpoint and a replication instance,
/// including Amazon Resource Names (ARNs) and the last error message issued.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Connection {
  /// The ARN string that uniquely identifies the endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  /// The identifier of the endpoint. Identifiers must begin with a letter and
  /// must contain only ASCII letters, digits, and hyphens. They can't end with a
  /// hyphen or contain two consecutive hyphens.
  @_s.JsonKey(name: 'EndpointIdentifier')
  final String endpointIdentifier;

  /// The error message when the connection last failed.
  @_s.JsonKey(name: 'LastFailureMessage')
  final String lastFailureMessage;

  /// The ARN of the replication instance.
  @_s.JsonKey(name: 'ReplicationInstanceArn')
  final String replicationInstanceArn;

  /// The replication instance identifier. This parameter is stored as a lowercase
  /// string.
  @_s.JsonKey(name: 'ReplicationInstanceIdentifier')
  final String replicationInstanceIdentifier;

  /// The connection status.
  @_s.JsonKey(name: 'Status')
  final String status;

  Connection({
    this.endpointArn,
    this.endpointIdentifier,
    this.lastFailureMessage,
    this.replicationInstanceArn,
    this.replicationInstanceIdentifier,
    this.status,
  });
  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEndpointResponse {
  /// The endpoint that was created.
  @_s.JsonKey(name: 'Endpoint')
  final Endpoint endpoint;

  CreateEndpointResponse({
    this.endpoint,
  });
  factory CreateEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEndpointResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEventSubscriptionResponse {
  /// The event subscription that was created.
  @_s.JsonKey(name: 'EventSubscription')
  final EventSubscription eventSubscription;

  CreateEventSubscriptionResponse({
    this.eventSubscription,
  });
  factory CreateEventSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEventSubscriptionResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateReplicationInstanceResponse {
  /// The replication instance that was created.
  @_s.JsonKey(name: 'ReplicationInstance')
  final ReplicationInstance replicationInstance;

  CreateReplicationInstanceResponse({
    this.replicationInstance,
  });
  factory CreateReplicationInstanceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateReplicationInstanceResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateReplicationSubnetGroupResponse {
  /// The replication subnet group that was created.
  @_s.JsonKey(name: 'ReplicationSubnetGroup')
  final ReplicationSubnetGroup replicationSubnetGroup;

  CreateReplicationSubnetGroupResponse({
    this.replicationSubnetGroup,
  });
  factory CreateReplicationSubnetGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateReplicationSubnetGroupResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateReplicationTaskResponse {
  /// The replication task that was created.
  @_s.JsonKey(name: 'ReplicationTask')
  final ReplicationTask replicationTask;

  CreateReplicationTaskResponse({
    this.replicationTask,
  });
  factory CreateReplicationTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReplicationTaskResponseFromJson(json);
}

enum DataFormatValue {
  @_s.JsonValue('csv')
  csv,
  @_s.JsonValue('parquet')
  parquet,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCertificateResponse {
  /// The Secure Sockets Layer (SSL) certificate.
  @_s.JsonKey(name: 'Certificate')
  final Certificate certificate;

  DeleteCertificateResponse({
    this.certificate,
  });
  factory DeleteCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCertificateResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConnectionResponse {
  /// The connection that is being deleted.
  @_s.JsonKey(name: 'Connection')
  final Connection connection;

  DeleteConnectionResponse({
    this.connection,
  });
  factory DeleteConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteConnectionResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEndpointResponse {
  /// The endpoint that was deleted.
  @_s.JsonKey(name: 'Endpoint')
  final Endpoint endpoint;

  DeleteEndpointResponse({
    this.endpoint,
  });
  factory DeleteEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEndpointResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEventSubscriptionResponse {
  /// The event subscription that was deleted.
  @_s.JsonKey(name: 'EventSubscription')
  final EventSubscription eventSubscription;

  DeleteEventSubscriptionResponse({
    this.eventSubscription,
  });
  factory DeleteEventSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEventSubscriptionResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteReplicationInstanceResponse {
  /// The replication instance that was deleted.
  @_s.JsonKey(name: 'ReplicationInstance')
  final ReplicationInstance replicationInstance;

  DeleteReplicationInstanceResponse({
    this.replicationInstance,
  });
  factory DeleteReplicationInstanceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteReplicationInstanceResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteReplicationSubnetGroupResponse {
  DeleteReplicationSubnetGroupResponse();
  factory DeleteReplicationSubnetGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteReplicationSubnetGroupResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteReplicationTaskResponse {
  /// The deleted replication task.
  @_s.JsonKey(name: 'ReplicationTask')
  final ReplicationTask replicationTask;

  DeleteReplicationTaskResponse({
    this.replicationTask,
  });
  factory DeleteReplicationTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteReplicationTaskResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountAttributesResponse {
  /// Account quota information.
  @_s.JsonKey(name: 'AccountQuotas')
  final List<AccountQuota> accountQuotas;

  /// A unique AWS DMS identifier for an account in a particular AWS Region. The
  /// value of this identifier has the following format:
  /// <code>c99999999999</code>. DMS uses this identifier to name artifacts. For
  /// example, DMS uses this identifier to name the default Amazon S3 bucket for
  /// storing task assessment reports in a given AWS Region. The format of this S3
  /// bucket name is the following:
  /// <code>dms-<i>AccountNumber</i>-<i>UniqueAccountIdentifier</i>.</code> Here
  /// is an example name for this default S3 bucket:
  /// <code>dms-111122223333-c44445555666</code>.
  /// <note>
  /// AWS DMS supports the <code>UniqueAccountIdentifier</code> parameter in
  /// versions 3.1.4 and later.
  /// </note>
  @_s.JsonKey(name: 'UniqueAccountIdentifier')
  final String uniqueAccountIdentifier;

  DescribeAccountAttributesResponse({
    this.accountQuotas,
    this.uniqueAccountIdentifier,
  });
  factory DescribeAccountAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAccountAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCertificatesResponse {
  /// The Secure Sockets Layer (SSL) certificates associated with the replication
  /// instance.
  @_s.JsonKey(name: 'Certificates')
  final List<Certificate> certificates;

  /// The pagination token.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeCertificatesResponse({
    this.certificates,
    this.marker,
  });
  factory DescribeCertificatesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCertificatesResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConnectionsResponse {
  /// A description of the connections.
  @_s.JsonKey(name: 'Connections')
  final List<Connection> connections;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeConnectionsResponse({
    this.connections,
    this.marker,
  });
  factory DescribeConnectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeConnectionsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointTypesResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The types of endpoints that are supported.
  @_s.JsonKey(name: 'SupportedEndpointTypes')
  final List<SupportedEndpointType> supportedEndpointTypes;

  DescribeEndpointTypesResponse({
    this.marker,
    this.supportedEndpointTypes,
  });
  factory DescribeEndpointTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointTypesResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointsResponse {
  /// Endpoint description.
  @_s.JsonKey(name: 'Endpoints')
  final List<Endpoint> endpoints;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeEndpointsResponse({
    this.endpoints,
    this.marker,
  });
  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventCategoriesResponse {
  /// A list of event categories.
  @_s.JsonKey(name: 'EventCategoryGroupList')
  final List<EventCategoryGroup> eventCategoryGroupList;

  DescribeEventCategoriesResponse({
    this.eventCategoryGroupList,
  });
  factory DescribeEventCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventCategoriesResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventSubscriptionsResponse {
  /// A list of event subscriptions.
  @_s.JsonKey(name: 'EventSubscriptionsList')
  final List<EventSubscription> eventSubscriptionsList;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeEventSubscriptionsResponse({
    this.eventSubscriptionsList,
    this.marker,
  });
  factory DescribeEventSubscriptionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeEventSubscriptionsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventsResponse {
  /// The events described.
  @_s.JsonKey(name: 'Events')
  final List<Event> events;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeEventsResponse({
    this.events,
    this.marker,
  });
  factory DescribeEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrderableReplicationInstancesResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The order-able replication instances available.
  @_s.JsonKey(name: 'OrderableReplicationInstances')
  final List<OrderableReplicationInstance> orderableReplicationInstances;

  DescribeOrderableReplicationInstancesResponse({
    this.marker,
    this.orderableReplicationInstances,
  });
  factory DescribeOrderableReplicationInstancesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOrderableReplicationInstancesResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePendingMaintenanceActionsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The pending maintenance action.
  @_s.JsonKey(name: 'PendingMaintenanceActions')
  final List<ResourcePendingMaintenanceActions> pendingMaintenanceActions;

  DescribePendingMaintenanceActionsResponse({
    this.marker,
    this.pendingMaintenanceActions,
  });
  factory DescribePendingMaintenanceActionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribePendingMaintenanceActionsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRefreshSchemasStatusResponse {
  /// The status of the schema.
  @_s.JsonKey(name: 'RefreshSchemasStatus')
  final RefreshSchemasStatus refreshSchemasStatus;

  DescribeRefreshSchemasStatusResponse({
    this.refreshSchemasStatus,
  });
  factory DescribeRefreshSchemasStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRefreshSchemasStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReplicationInstanceTaskLogsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The Amazon Resource Name (ARN) of the replication instance.
  @_s.JsonKey(name: 'ReplicationInstanceArn')
  final String replicationInstanceArn;

  /// An array of replication task log metadata. Each member of the array contains
  /// the replication task name, ARN, and task log size (in bytes).
  @_s.JsonKey(name: 'ReplicationInstanceTaskLogs')
  final List<ReplicationInstanceTaskLog> replicationInstanceTaskLogs;

  DescribeReplicationInstanceTaskLogsResponse({
    this.marker,
    this.replicationInstanceArn,
    this.replicationInstanceTaskLogs,
  });
  factory DescribeReplicationInstanceTaskLogsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeReplicationInstanceTaskLogsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReplicationInstancesResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The replication instances described.
  @_s.JsonKey(name: 'ReplicationInstances')
  final List<ReplicationInstance> replicationInstances;

  DescribeReplicationInstancesResponse({
    this.marker,
    this.replicationInstances,
  });
  factory DescribeReplicationInstancesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeReplicationInstancesResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReplicationSubnetGroupsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// A description of the replication subnet groups.
  @_s.JsonKey(name: 'ReplicationSubnetGroups')
  final List<ReplicationSubnetGroup> replicationSubnetGroups;

  DescribeReplicationSubnetGroupsResponse({
    this.marker,
    this.replicationSubnetGroups,
  });
  factory DescribeReplicationSubnetGroupsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeReplicationSubnetGroupsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReplicationTaskAssessmentResultsResponse {
  /// - The Amazon S3 bucket where the task assessment report is located.
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The task assessment report.
  @_s.JsonKey(name: 'ReplicationTaskAssessmentResults')
  final List<ReplicationTaskAssessmentResult> replicationTaskAssessmentResults;

  DescribeReplicationTaskAssessmentResultsResponse({
    this.bucketName,
    this.marker,
    this.replicationTaskAssessmentResults,
  });
  factory DescribeReplicationTaskAssessmentResultsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeReplicationTaskAssessmentResultsResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReplicationTasksResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// A description of the replication tasks.
  @_s.JsonKey(name: 'ReplicationTasks')
  final List<ReplicationTask> replicationTasks;

  DescribeReplicationTasksResponse({
    this.marker,
    this.replicationTasks,
  });
  factory DescribeReplicationTasksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeReplicationTasksResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSchemasResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The described schema.
  @_s.JsonKey(name: 'Schemas')
  final List<String> schemas;

  DescribeSchemasResponse({
    this.marker,
    this.schemas,
  });
  factory DescribeSchemasResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSchemasResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTableStatisticsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The Amazon Resource Name (ARN) of the replication task.
  @_s.JsonKey(name: 'ReplicationTaskArn')
  final String replicationTaskArn;

  /// The table statistics.
  @_s.JsonKey(name: 'TableStatistics')
  final List<TableStatistics> tableStatistics;

  DescribeTableStatisticsResponse({
    this.marker,
    this.replicationTaskArn,
    this.tableStatistics,
  });
  factory DescribeTableStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTableStatisticsResponseFromJson(json);
}

enum DmsSslModeValue {
  @_s.JsonValue('none')
  none,
  @_s.JsonValue('require')
  require,
  @_s.JsonValue('verify-ca')
  verifyCa,
  @_s.JsonValue('verify-full')
  verifyFull,
}

/// The settings in JSON format for the DMS Transfer type source endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DmsTransferSettings {
  /// The name of the S3 bucket to use.
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// The IAM role that has permission to access the Amazon S3 bucket.
  @_s.JsonKey(name: 'ServiceAccessRoleArn')
  final String serviceAccessRoleArn;

  DmsTransferSettings({
    this.bucketName,
    this.serviceAccessRoleArn,
  });
  factory DmsTransferSettings.fromJson(Map<String, dynamic> json) =>
      _$DmsTransferSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DmsTransferSettingsToJson(this);
}

/// Provides the Amazon Resource Name (ARN) of the AWS Identity and Access
/// Management (IAM) role used to define an Amazon DynamoDB target endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DynamoDbSettings {
  /// The Amazon Resource Name (ARN) used by the service access IAM role.
  @_s.JsonKey(name: 'ServiceAccessRoleArn')
  final String serviceAccessRoleArn;

  DynamoDbSettings({
    @_s.required this.serviceAccessRoleArn,
  });
  factory DynamoDbSettings.fromJson(Map<String, dynamic> json) =>
      _$DynamoDbSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DynamoDbSettingsToJson(this);
}

/// Provides information that defines an Elasticsearch endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ElasticsearchSettings {
  /// The endpoint for the Elasticsearch cluster.
  @_s.JsonKey(name: 'EndpointUri')
  final String endpointUri;

  /// The Amazon Resource Name (ARN) used by service to access the IAM role.
  @_s.JsonKey(name: 'ServiceAccessRoleArn')
  final String serviceAccessRoleArn;

  /// The maximum number of seconds for which DMS retries failed API requests to
  /// the Elasticsearch cluster.
  @_s.JsonKey(name: 'ErrorRetryDuration')
  final int errorRetryDuration;

  /// The maximum percentage of records that can fail to be written before a full
  /// load operation stops.
  @_s.JsonKey(name: 'FullLoadErrorPercentage')
  final int fullLoadErrorPercentage;

  ElasticsearchSettings({
    @_s.required this.endpointUri,
    @_s.required this.serviceAccessRoleArn,
    this.errorRetryDuration,
    this.fullLoadErrorPercentage,
  });
  factory ElasticsearchSettings.fromJson(Map<String, dynamic> json) =>
      _$ElasticsearchSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticsearchSettingsToJson(this);
}

enum EncodingTypeValue {
  @_s.JsonValue('plain')
  plain,
  @_s.JsonValue('plain-dictionary')
  plainDictionary,
  @_s.JsonValue('rle-dictionary')
  rleDictionary,
}

enum EncryptionModeValue {
  @_s.JsonValue('sse-s3')
  sseS3,
  @_s.JsonValue('sse-kms')
  sseKms,
}

/// Describes an endpoint of a database instance in response to operations such
/// as the following:
///
/// <ul>
/// <li>
/// <code>CreateEndpoint</code>
/// </li>
/// <li>
/// <code>DescribeEndpoint</code>
/// </li>
/// <li>
/// <code>DescribeEndpointTypes</code>
/// </li>
/// <li>
/// <code>ModifyEndpoint</code>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Endpoint {
  /// The Amazon Resource Name (ARN) used for SSL connection to the endpoint.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  /// The name of the database at the endpoint.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The settings in JSON format for the DMS transfer type of source endpoint.
  ///
  /// Possible settings include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ServiceAccessRoleArn</code> - The IAM role that has permission to
  /// access the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>BucketName</code> - The name of the S3 bucket to use.
  /// </li>
  /// <li>
  /// <code>CompressionType</code> - An optional parameter to use GZIP to compress
  /// the target files. To use GZIP, set this value to <code>NONE</code> (the
  /// default). To keep the files uncompressed, don't use this value.
  /// </li>
  /// </ul>
  /// Shorthand syntax for these settings is as follows:
  /// <code>ServiceAccessRoleArn=string,BucketName=string,CompressionType=string</code>
  ///
  /// JSON syntax for these settings is as follows: <code>{
  /// "ServiceAccessRoleArn": "string", "BucketName": "string", "CompressionType":
  /// "none"|"gzip" } </code>
  @_s.JsonKey(name: 'DmsTransferSettings')
  final DmsTransferSettings dmsTransferSettings;

  /// The settings for the target DynamoDB database. For more information, see the
  /// <code>DynamoDBSettings</code> structure.
  @_s.JsonKey(name: 'DynamoDbSettings')
  final DynamoDbSettings dynamoDbSettings;

  /// The settings for the Elasticsearch source endpoint. For more information,
  /// see the <code>ElasticsearchSettings</code> structure.
  @_s.JsonKey(name: 'ElasticsearchSettings')
  final ElasticsearchSettings elasticsearchSettings;

  /// The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  /// The database endpoint identifier. Identifiers must begin with a letter and
  /// must contain only ASCII letters, digits, and hyphens. They can't end with a
  /// hyphen or contain two consecutive hyphens.
  @_s.JsonKey(name: 'EndpointIdentifier')
  final String endpointIdentifier;

  /// The type of endpoint. Valid values are <code>source</code> and
  /// <code>target</code>.
  @_s.JsonKey(name: 'EndpointType')
  final ReplicationEndpointTypeValue endpointType;

  /// The expanded name for the engine name. For example, if the
  /// <code>EngineName</code> parameter is "aurora," this value would be "Amazon
  /// Aurora MySQL."
  @_s.JsonKey(name: 'EngineDisplayName')
  final String engineDisplayName;

  /// The database engine name. Valid values, depending on the EndpointType,
  /// include <code>"mysql"</code>, <code>"oracle"</code>,
  /// <code>"postgres"</code>, <code>"mariadb"</code>, <code>"aurora"</code>,
  /// <code>"aurora-postgresql"</code>, <code>"redshift"</code>,
  /// <code>"s3"</code>, <code>"db2"</code>, <code>"azuredb"</code>,
  /// <code>"sybase"</code>, <code>"dynamodb"</code>, <code>"mongodb"</code>,
  /// <code>"kinesis"</code>, <code>"kafka"</code>, <code>"elasticsearch"</code>,
  /// <code>"documentdb"</code>, and <code>"sqlserver"</code>.
  @_s.JsonKey(name: 'EngineName')
  final String engineName;

  /// Value returned by a call to CreateEndpoint that can be used for
  /// cross-account validation. Use it on a subsequent call to CreateEndpoint to
  /// create the endpoint with a cross-account.
  @_s.JsonKey(name: 'ExternalId')
  final String externalId;

  /// The external table definition.
  @_s.JsonKey(name: 'ExternalTableDefinition')
  final String externalTableDefinition;

  /// Additional connection attributes used to connect to the endpoint.
  @_s.JsonKey(name: 'ExtraConnectionAttributes')
  final String extraConnectionAttributes;

  /// The settings for the Apache Kafka target endpoint. For more information, see
  /// the <code>KafkaSettings</code> structure.
  @_s.JsonKey(name: 'KafkaSettings')
  final KafkaSettings kafkaSettings;

  /// The settings for the Amazon Kinesis target endpoint. For more information,
  /// see the <code>KinesisSettings</code> structure.
  @_s.JsonKey(name: 'KinesisSettings')
  final KinesisSettings kinesisSettings;

  /// An AWS KMS key identifier that is used to encrypt the connection parameters
  /// for the endpoint.
  ///
  /// If you don't specify a value for the <code>KmsKeyId</code> parameter, then
  /// AWS DMS uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The settings for the MongoDB source endpoint. For more information, see the
  /// <code>MongoDbSettings</code> structure.
  @_s.JsonKey(name: 'MongoDbSettings')
  final MongoDbSettings mongoDbSettings;

  /// The port value used to access the endpoint.
  @_s.JsonKey(name: 'Port')
  final int port;

  /// Settings for the Amazon Redshift endpoint.
  @_s.JsonKey(name: 'RedshiftSettings')
  final RedshiftSettings redshiftSettings;

  /// The settings for the S3 target endpoint. For more information, see the
  /// <code>S3Settings</code> structure.
  @_s.JsonKey(name: 'S3Settings')
  final S3Settings s3Settings;

  /// The name of the server at the endpoint.
  @_s.JsonKey(name: 'ServerName')
  final String serverName;

  /// The Amazon Resource Name (ARN) used by the service access IAM role.
  @_s.JsonKey(name: 'ServiceAccessRoleArn')
  final String serviceAccessRoleArn;

  /// The SSL mode used to connect to the endpoint. The default value is
  /// <code>none</code>.
  @_s.JsonKey(name: 'SslMode')
  final DmsSslModeValue sslMode;

  /// The status of the endpoint.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The user name used to connect to the endpoint.
  @_s.JsonKey(name: 'Username')
  final String username;

  Endpoint({
    this.certificateArn,
    this.databaseName,
    this.dmsTransferSettings,
    this.dynamoDbSettings,
    this.elasticsearchSettings,
    this.endpointArn,
    this.endpointIdentifier,
    this.endpointType,
    this.engineDisplayName,
    this.engineName,
    this.externalId,
    this.externalTableDefinition,
    this.extraConnectionAttributes,
    this.kafkaSettings,
    this.kinesisSettings,
    this.kmsKeyId,
    this.mongoDbSettings,
    this.port,
    this.redshiftSettings,
    this.s3Settings,
    this.serverName,
    this.serviceAccessRoleArn,
    this.sslMode,
    this.status,
    this.username,
  });
  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
}

/// Describes an identifiable significant activity that affects a replication
/// instance or task. This object can provide the message, the available event
/// categories, the date and source of the event, and the AWS DMS resource type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Event {
  /// The date of the event.
  @_s.JsonKey(name: 'Date', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime date;

  /// The event categories available for the specified source type.
  @_s.JsonKey(name: 'EventCategories')
  final List<String> eventCategories;

  /// The event message.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The identifier of an event source.
  @_s.JsonKey(name: 'SourceIdentifier')
  final String sourceIdentifier;

  /// The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | endpoint | replication-task
  @_s.JsonKey(name: 'SourceType')
  final SourceType sourceType;

  Event({
    this.date,
    this.eventCategories,
    this.message,
    this.sourceIdentifier,
    this.sourceType,
  });
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

/// Lists categories of events subscribed to, and generated by, the applicable
/// AWS DMS resource type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventCategoryGroup {
  /// A list of event categories from a source type that you've chosen.
  @_s.JsonKey(name: 'EventCategories')
  final List<String> eventCategories;

  /// The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-server | security-group |
  /// replication-task
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  EventCategoryGroup({
    this.eventCategories,
    this.sourceType,
  });
  factory EventCategoryGroup.fromJson(Map<String, dynamic> json) =>
      _$EventCategoryGroupFromJson(json);
}

/// Describes an event notification subscription created by the
/// <code>CreateEventSubscription</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventSubscription {
  /// The AWS DMS event notification subscription Id.
  @_s.JsonKey(name: 'CustSubscriptionId')
  final String custSubscriptionId;

  /// The AWS customer account associated with the AWS DMS event notification
  /// subscription.
  @_s.JsonKey(name: 'CustomerAwsId')
  final String customerAwsId;

  /// Boolean value that indicates if the event subscription is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// A lists of event categories.
  @_s.JsonKey(name: 'EventCategoriesList')
  final List<String> eventCategoriesList;

  /// The topic ARN of the AWS DMS event notification subscription.
  @_s.JsonKey(name: 'SnsTopicArn')
  final String snsTopicArn;

  /// A list of source Ids for the event subscription.
  @_s.JsonKey(name: 'SourceIdsList')
  final List<String> sourceIdsList;

  /// The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-server | security-group |
  /// replication-task
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  /// The status of the AWS DMS event notification subscription.
  ///
  /// Constraints:
  ///
  /// Can be one of the following: creating | modifying | deleting | active |
  /// no-permission | topic-not-exist
  ///
  /// The status "no-permission" indicates that AWS DMS no longer has permission
  /// to post to the SNS topic. The status "topic-not-exist" indicates that the
  /// topic was deleted after the subscription was created.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The time the RDS event notification subscription was created.
  @_s.JsonKey(name: 'SubscriptionCreationTime')
  final String subscriptionCreationTime;

  EventSubscription({
    this.custSubscriptionId,
    this.customerAwsId,
    this.enabled,
    this.eventCategoriesList,
    this.snsTopicArn,
    this.sourceIdsList,
    this.sourceType,
    this.status,
    this.subscriptionCreationTime,
  });
  factory EventSubscription.fromJson(Map<String, dynamic> json) =>
      _$EventSubscriptionFromJson(json);
}

/// Identifies the name and value of a source filter object used to limit the
/// number and type of records transferred from your source to your target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The name of the filter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The filter value.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportCertificateResponse {
  /// The certificate to be uploaded.
  @_s.JsonKey(name: 'Certificate')
  final Certificate certificate;

  ImportCertificateResponse({
    this.certificate,
  });
  factory ImportCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportCertificateResponseFromJson(json);
}

/// Provides information that describes an Apache Kafka endpoint. This
/// information includes the output format of records applied to the endpoint
/// and details of transaction and control table data information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KafkaSettings {
  /// The broker location and port of the Kafka broker that hosts your Kafka
  /// instance. Specify the broker in the form <code>
  /// <i>broker-hostname-or-ip</i>:<i>port</i> </code>. For example,
  /// <code>"ec2-12-345-678-901.compute-1.amazonaws.com:2345"</code>.
  @_s.JsonKey(name: 'Broker')
  final String broker;

  /// The topic to which you migrate the data. If you don't specify a topic, AWS
  /// DMS specifies <code>"kafka-default-topic"</code> as the migration topic.
  @_s.JsonKey(name: 'Topic')
  final String topic;

  KafkaSettings({
    this.broker,
    this.topic,
  });
  factory KafkaSettings.fromJson(Map<String, dynamic> json) =>
      _$KafkaSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$KafkaSettingsToJson(this);
}

/// Provides information that describes an Amazon Kinesis Data Stream endpoint.
/// This information includes the output format of records applied to the
/// endpoint and details of transaction and control table data information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisSettings {
  /// Shows detailed control information for table definition, column definition,
  /// and table and column changes in the Kinesis message output. The default is
  /// <code>False</code>.
  @_s.JsonKey(name: 'IncludeControlDetails')
  final bool includeControlDetails;

  /// Shows the partition value within the Kinesis message output, unless the
  /// partition type is <code>schema-table-type</code>. The default is
  /// <code>False</code>.
  @_s.JsonKey(name: 'IncludePartitionValue')
  final bool includePartitionValue;

  /// Includes any data definition language (DDL) operations that change the table
  /// in the control data, such as <code>rename-table</code>,
  /// <code>drop-table</code>, <code>add-column</code>, <code>drop-column</code>,
  /// and <code>rename-column</code>. The default is <code>False</code>.
  @_s.JsonKey(name: 'IncludeTableAlterOperations')
  final bool includeTableAlterOperations;

  /// Provides detailed transaction information from the source database. This
  /// information includes a commit timestamp, a log position, and values for
  /// <code>transaction_id</code>, previous <code>transaction_id</code>, and
  /// <code>transaction_record_id</code> (the record offset within a transaction).
  /// The default is <code>False</code>.
  @_s.JsonKey(name: 'IncludeTransactionDetails')
  final bool includeTransactionDetails;

  /// The output format for the records created on the endpoint. The message
  /// format is <code>JSON</code> (default) or <code>JSON_UNFORMATTED</code> (a
  /// single line with no tab).
  @_s.JsonKey(name: 'MessageFormat')
  final MessageFormatValue messageFormat;

  /// Prefixes schema and table names to partition values, when the partition type
  /// is <code>primary-key-type</code>. Doing this increases data distribution
  /// among Kinesis shards. For example, suppose that a SysBench schema has
  /// thousands of tables and each table has only limited range for a primary key.
  /// In this case, the same primary key is sent from thousands of tables to the
  /// same shard, which causes throttling. The default is <code>False</code>.
  @_s.JsonKey(name: 'PartitionIncludeSchemaTable')
  final bool partitionIncludeSchemaTable;

  /// The Amazon Resource Name (ARN) for the AWS Identity and Access Management
  /// (IAM) role that AWS DMS uses to write to the Kinesis data stream.
  @_s.JsonKey(name: 'ServiceAccessRoleArn')
  final String serviceAccessRoleArn;

  /// The Amazon Resource Name (ARN) for the Amazon Kinesis Data Streams endpoint.
  @_s.JsonKey(name: 'StreamArn')
  final String streamArn;

  KinesisSettings({
    this.includeControlDetails,
    this.includePartitionValue,
    this.includeTableAlterOperations,
    this.includeTransactionDetails,
    this.messageFormat,
    this.partitionIncludeSchemaTable,
    this.serviceAccessRoleArn,
    this.streamArn,
  });
  factory KinesisSettings.fromJson(Map<String, dynamic> json) =>
      _$KinesisSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisSettingsToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A list of tags for the resource.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  ListTagsForResourceResponse({
    this.tagList,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum MessageFormatValue {
  @_s.JsonValue('json')
  json,
  @_s.JsonValue('json-unformatted')
  jsonUnformatted,
}

enum MigrationTypeValue {
  @_s.JsonValue('full-load')
  fullLoad,
  @_s.JsonValue('cdc')
  cdc,
  @_s.JsonValue('full-load-and-cdc')
  fullLoadAndCdc,
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyEndpointResponse {
  /// The modified endpoint.
  @_s.JsonKey(name: 'Endpoint')
  final Endpoint endpoint;

  ModifyEndpointResponse({
    this.endpoint,
  });
  factory ModifyEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyEndpointResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyEventSubscriptionResponse {
  /// The modified event subscription.
  @_s.JsonKey(name: 'EventSubscription')
  final EventSubscription eventSubscription;

  ModifyEventSubscriptionResponse({
    this.eventSubscription,
  });
  factory ModifyEventSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyEventSubscriptionResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyReplicationInstanceResponse {
  /// The modified replication instance.
  @_s.JsonKey(name: 'ReplicationInstance')
  final ReplicationInstance replicationInstance;

  ModifyReplicationInstanceResponse({
    this.replicationInstance,
  });
  factory ModifyReplicationInstanceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ModifyReplicationInstanceResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyReplicationSubnetGroupResponse {
  /// The modified replication subnet group.
  @_s.JsonKey(name: 'ReplicationSubnetGroup')
  final ReplicationSubnetGroup replicationSubnetGroup;

  ModifyReplicationSubnetGroupResponse({
    this.replicationSubnetGroup,
  });
  factory ModifyReplicationSubnetGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ModifyReplicationSubnetGroupResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyReplicationTaskResponse {
  /// The replication task that was modified.
  @_s.JsonKey(name: 'ReplicationTask')
  final ReplicationTask replicationTask;

  ModifyReplicationTaskResponse({
    this.replicationTask,
  });
  factory ModifyReplicationTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyReplicationTaskResponseFromJson(json);
}

/// Provides information that defines a MongoDB endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MongoDbSettings {
  /// The authentication mechanism you use to access the MongoDB source endpoint.
  ///
  /// Valid values: DEFAULT, MONGODB_CR, SCRAM_SHA_1
  ///
  /// DEFAULT – For MongoDB version 2.x, use MONGODB_CR. For MongoDB version 3.x,
  /// use SCRAM_SHA_1. This setting isn't used when authType=No.
  @_s.JsonKey(name: 'AuthMechanism')
  final AuthMechanismValue authMechanism;

  /// The MongoDB database name. This setting isn't used when
  /// <code>authType=NO</code>.
  ///
  /// The default is admin.
  @_s.JsonKey(name: 'AuthSource')
  final String authSource;

  /// The authentication type you use to access the MongoDB source endpoint.
  ///
  /// Valid values: NO, PASSWORD
  ///
  /// When NO is selected, user name and password parameters are not used and can
  /// be empty.
  @_s.JsonKey(name: 'AuthType')
  final AuthTypeValue authType;

  /// The database name on the MongoDB source endpoint.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// Indicates the number of documents to preview to determine the document
  /// organization. Use this setting when <code>NestingLevel</code> is set to ONE.
  ///
  /// Must be a positive value greater than 0. Default value is 1000.
  @_s.JsonKey(name: 'DocsToInvestigate')
  final String docsToInvestigate;

  /// Specifies the document ID. Use this setting when <code>NestingLevel</code>
  /// is set to NONE.
  ///
  /// Default value is false.
  @_s.JsonKey(name: 'ExtractDocId')
  final String extractDocId;

  /// The AWS KMS key identifier that is used to encrypt the content on the
  /// replication instance. If you don't specify a value for the
  /// <code>KmsKeyId</code> parameter, then AWS DMS uses your default encryption
  /// key. AWS KMS creates the default encryption key for your AWS account. Your
  /// AWS account has a different default encryption key for each AWS Region.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// Specifies either document or table mode.
  ///
  /// Valid values: NONE, ONE
  ///
  /// Default value is NONE. Specify NONE to use document mode. Specify ONE to use
  /// table mode.
  @_s.JsonKey(name: 'NestingLevel')
  final NestingLevelValue nestingLevel;

  /// The password for the user account you use to access the MongoDB source
  /// endpoint.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The port value for the MongoDB source endpoint.
  @_s.JsonKey(name: 'Port')
  final int port;

  /// The name of the server on the MongoDB source endpoint.
  @_s.JsonKey(name: 'ServerName')
  final String serverName;

  /// The user name you use to access the MongoDB source endpoint.
  @_s.JsonKey(name: 'Username')
  final String username;

  MongoDbSettings({
    this.authMechanism,
    this.authSource,
    this.authType,
    this.databaseName,
    this.docsToInvestigate,
    this.extractDocId,
    this.kmsKeyId,
    this.nestingLevel,
    this.password,
    this.port,
    this.serverName,
    this.username,
  });
  factory MongoDbSettings.fromJson(Map<String, dynamic> json) =>
      _$MongoDbSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MongoDbSettingsToJson(this);
}

enum NestingLevelValue {
  @_s.JsonValue('none')
  none,
  @_s.JsonValue('one')
  one,
}

/// In response to the <code>DescribeOrderableReplicationInstances</code>
/// operation, this object describes an available replication instance. This
/// description includes the replication instance's type, engine version, and
/// allocated storage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrderableReplicationInstance {
  /// List of Availability Zones for this replication instance.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// The default amount of storage (in gigabytes) that is allocated for the
  /// replication instance.
  @_s.JsonKey(name: 'DefaultAllocatedStorage')
  final int defaultAllocatedStorage;

  /// The version of the replication engine.
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;

  /// The amount of storage (in gigabytes) that is allocated for the replication
  /// instance.
  @_s.JsonKey(name: 'IncludedAllocatedStorage')
  final int includedAllocatedStorage;

  /// The minimum amount of storage (in gigabytes) that can be allocated for the
  /// replication instance.
  @_s.JsonKey(name: 'MaxAllocatedStorage')
  final int maxAllocatedStorage;

  /// The minimum amount of storage (in gigabytes) that can be allocated for the
  /// replication instance.
  @_s.JsonKey(name: 'MinAllocatedStorage')
  final int minAllocatedStorage;

  /// The value returned when the specified <code>EngineVersion</code> of the
  /// replication instance is in Beta or test mode. This indicates some features
  /// might not work as expected.
  /// <note>
  /// AWS DMS supports the <code>ReleaseStatus</code> parameter in versions 3.1.4
  /// and later.
  /// </note>
  @_s.JsonKey(name: 'ReleaseStatus')
  final ReleaseStatusValues releaseStatus;

  /// The compute and memory capacity of the replication instance.
  ///
  /// Valid Values: <code>dms.t2.micro | dms.t2.small | dms.t2.medium |
  /// dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge |
  /// dms.c4.4xlarge </code>
  @_s.JsonKey(name: 'ReplicationInstanceClass')
  final String replicationInstanceClass;

  /// The type of storage used by the replication instance.
  @_s.JsonKey(name: 'StorageType')
  final String storageType;

  OrderableReplicationInstance({
    this.availabilityZones,
    this.defaultAllocatedStorage,
    this.engineVersion,
    this.includedAllocatedStorage,
    this.maxAllocatedStorage,
    this.minAllocatedStorage,
    this.releaseStatus,
    this.replicationInstanceClass,
    this.storageType,
  });
  factory OrderableReplicationInstance.fromJson(Map<String, dynamic> json) =>
      _$OrderableReplicationInstanceFromJson(json);
}

enum ParquetVersionValue {
  @_s.JsonValue('parquet-1-0')
  parquet_1_0,
  @_s.JsonValue('parquet-2-0')
  parquet_2_0,
}

/// Describes a maintenance action pending for an AWS DMS resource, including
/// when and how it will be applied. This data type is a response element to the
/// <code>DescribePendingMaintenanceActions</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PendingMaintenanceAction {
  /// The type of pending maintenance action that is available for the resource.
  @_s.JsonKey(name: 'Action')
  final String action;

  /// The date of the maintenance window when the action is to be applied. The
  /// maintenance action is applied to the resource during its first maintenance
  /// window after this date. If this date is specified, any
  /// <code>next-maintenance</code> opt-in requests are ignored.
  @_s.JsonKey(
      name: 'AutoAppliedAfterDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime autoAppliedAfterDate;

  /// The effective date when the pending maintenance action will be applied to
  /// the resource. This date takes into account opt-in requests received from the
  /// <code>ApplyPendingMaintenanceAction</code> API operation, and also the
  /// <code>AutoAppliedAfterDate</code> and <code>ForcedApplyDate</code> parameter
  /// values. This value is blank if an opt-in request has not been received and
  /// nothing has been specified for <code>AutoAppliedAfterDate</code> or
  /// <code>ForcedApplyDate</code>.
  @_s.JsonKey(
      name: 'CurrentApplyDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime currentApplyDate;

  /// A description providing more detail about the maintenance action.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The date when the maintenance action will be automatically applied. The
  /// maintenance action is applied to the resource on this date regardless of the
  /// maintenance window for the resource. If this date is specified, any
  /// <code>immediate</code> opt-in requests are ignored.
  @_s.JsonKey(
      name: 'ForcedApplyDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime forcedApplyDate;

  /// The type of opt-in request that has been received for the resource.
  @_s.JsonKey(name: 'OptInStatus')
  final String optInStatus;

  PendingMaintenanceAction({
    this.action,
    this.autoAppliedAfterDate,
    this.currentApplyDate,
    this.description,
    this.forcedApplyDate,
    this.optInStatus,
  });
  factory PendingMaintenanceAction.fromJson(Map<String, dynamic> json) =>
      _$PendingMaintenanceActionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RebootReplicationInstanceResponse {
  /// The replication instance that is being rebooted.
  @_s.JsonKey(name: 'ReplicationInstance')
  final ReplicationInstance replicationInstance;

  RebootReplicationInstanceResponse({
    this.replicationInstance,
  });
  factory RebootReplicationInstanceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RebootReplicationInstanceResponseFromJson(json);
}

/// Provides information that defines an Amazon Redshift endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RedshiftSettings {
  /// A value that indicates to allow any date format, including invalid formats
  /// such as 00/00/00 00:00:00, to be loaded without generating an error. You can
  /// choose <code>true</code> or <code>false</code> (the default).
  ///
  /// This parameter applies only to TIMESTAMP and DATE columns. Always use
  /// ACCEPTANYDATE with the DATEFORMAT parameter. If the date format for the data
  /// doesn't match the DATEFORMAT specification, Amazon Redshift inserts a NULL
  /// value into that field.
  @_s.JsonKey(name: 'AcceptAnyDate')
  final bool acceptAnyDate;

  /// Code to run after connecting. This parameter should contain the code itself,
  /// not the name of a file containing the code.
  @_s.JsonKey(name: 'AfterConnectScript')
  final String afterConnectScript;

  /// The location where the comma-separated value (.csv) files are stored before
  /// being uploaded to the S3 bucket.
  @_s.JsonKey(name: 'BucketFolder')
  final String bucketFolder;

  /// The name of the S3 bucket you want to use
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// A value that sets the amount of time to wait (in milliseconds) before timing
  /// out, beginning from when you initially establish a connection.
  @_s.JsonKey(name: 'ConnectionTimeout')
  final int connectionTimeout;

  /// The name of the Amazon Redshift data warehouse (service) that you are
  /// working with.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The date format that you are using. Valid values are <code>auto</code>
  /// (case-sensitive), your date format string enclosed in quotes, or NULL. If
  /// this parameter is left unset (NULL), it defaults to a format of
  /// 'YYYY-MM-DD'. Using <code>auto</code> recognizes most strings, even some
  /// that aren't supported when you use a date format string.
  ///
  /// If your date and time values use formats different from each other, set this
  /// to <code>auto</code>.
  @_s.JsonKey(name: 'DateFormat')
  final String dateFormat;

  /// A value that specifies whether AWS DMS should migrate empty CHAR and VARCHAR
  /// fields as NULL. A value of <code>true</code> sets empty CHAR and VARCHAR
  /// fields to null. The default is <code>false</code>.
  @_s.JsonKey(name: 'EmptyAsNull')
  final bool emptyAsNull;

  /// The type of server-side encryption that you want to use for your data. This
  /// encryption type is part of the endpoint settings or the extra connections
  /// attributes for Amazon S3. You can choose either <code>SSE_S3</code> (the
  /// default) or <code>SSE_KMS</code>. To use <code>SSE_S3</code>, create an AWS
  /// Identity and Access Management (IAM) role with a policy that allows
  /// <code>"arn:aws:s3:::*"</code> to use the following actions:
  /// <code>"s3:PutObject", "s3:ListBucket"</code>
  @_s.JsonKey(name: 'EncryptionMode')
  final EncryptionModeValue encryptionMode;

  /// The number of threads used to upload a single file. This parameter accepts a
  /// value from 1 through 64. It defaults to 10.
  @_s.JsonKey(name: 'FileTransferUploadStreams')
  final int fileTransferUploadStreams;

  /// The amount of time to wait (in milliseconds) before timing out, beginning
  /// from when you begin loading.
  @_s.JsonKey(name: 'LoadTimeout')
  final int loadTimeout;

  /// The maximum size (in KB) of any .csv file used to transfer data to Amazon
  /// Redshift. This accepts a value from 1 through 1,048,576. It defaults to
  /// 32,768 KB (32 MB).
  @_s.JsonKey(name: 'MaxFileSize')
  final int maxFileSize;

  /// The password for the user named in the <code>username</code> property.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The port number for Amazon Redshift. The default value is 5439.
  @_s.JsonKey(name: 'Port')
  final int port;

  /// A value that specifies to remove surrounding quotation marks from strings in
  /// the incoming data. All characters within the quotation marks, including
  /// delimiters, are retained. Choose <code>true</code> to remove quotation
  /// marks. The default is <code>false</code>.
  @_s.JsonKey(name: 'RemoveQuotes')
  final bool removeQuotes;

  /// A value that specifies to replaces the invalid characters specified in
  /// <code>ReplaceInvalidChars</code>, substituting the specified characters
  /// instead. The default is <code>"?"</code>.
  @_s.JsonKey(name: 'ReplaceChars')
  final String replaceChars;

  /// A list of characters that you want to replace. Use with
  /// <code>ReplaceChars</code>.
  @_s.JsonKey(name: 'ReplaceInvalidChars')
  final String replaceInvalidChars;

  /// The name of the Amazon Redshift cluster you are using.
  @_s.JsonKey(name: 'ServerName')
  final String serverName;

  /// The AWS KMS key ID. If you are using <code>SSE_KMS</code> for the
  /// <code>EncryptionMode</code>, provide this key ID. The key that you use needs
  /// an attached policy that enables IAM user permissions and allows use of the
  /// key.
  @_s.JsonKey(name: 'ServerSideEncryptionKmsKeyId')
  final String serverSideEncryptionKmsKeyId;

  /// The Amazon Resource Name (ARN) of the IAM role that has access to the Amazon
  /// Redshift service.
  @_s.JsonKey(name: 'ServiceAccessRoleArn')
  final String serviceAccessRoleArn;

  /// The time format that you want to use. Valid values are <code>auto</code>
  /// (case-sensitive), <code>'timeformat_string'</code>,
  /// <code>'epochsecs'</code>, or <code>'epochmillisecs'</code>. It defaults to
  /// 10. Using <code>auto</code> recognizes most strings, even some that aren't
  /// supported when you use a time format string.
  ///
  /// If your date and time values use formats different from each other, set this
  /// parameter to <code>auto</code>.
  @_s.JsonKey(name: 'TimeFormat')
  final String timeFormat;

  /// A value that specifies to remove the trailing white space characters from a
  /// VARCHAR string. This parameter applies only to columns with a VARCHAR data
  /// type. Choose <code>true</code> to remove unneeded white space. The default
  /// is <code>false</code>.
  @_s.JsonKey(name: 'TrimBlanks')
  final bool trimBlanks;

  /// A value that specifies to truncate data in columns to the appropriate number
  /// of characters, so that the data fits in the column. This parameter applies
  /// only to columns with a VARCHAR or CHAR data type, and rows with a size of 4
  /// MB or less. Choose <code>true</code> to truncate data. The default is
  /// <code>false</code>.
  @_s.JsonKey(name: 'TruncateColumns')
  final bool truncateColumns;

  /// An Amazon Redshift user name for a registered user.
  @_s.JsonKey(name: 'Username')
  final String username;

  /// The size of the write buffer to use in rows. Valid values range from 1
  /// through 2,048. The default is 1,024. Use this setting to tune performance.
  @_s.JsonKey(name: 'WriteBufferSize')
  final int writeBufferSize;

  RedshiftSettings({
    this.acceptAnyDate,
    this.afterConnectScript,
    this.bucketFolder,
    this.bucketName,
    this.connectionTimeout,
    this.databaseName,
    this.dateFormat,
    this.emptyAsNull,
    this.encryptionMode,
    this.fileTransferUploadStreams,
    this.loadTimeout,
    this.maxFileSize,
    this.password,
    this.port,
    this.removeQuotes,
    this.replaceChars,
    this.replaceInvalidChars,
    this.serverName,
    this.serverSideEncryptionKmsKeyId,
    this.serviceAccessRoleArn,
    this.timeFormat,
    this.trimBlanks,
    this.truncateColumns,
    this.username,
    this.writeBufferSize,
  });
  factory RedshiftSettings.fromJson(Map<String, dynamic> json) =>
      _$RedshiftSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RedshiftSettingsToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RefreshSchemasResponse {
  /// The status of the refreshed schema.
  @_s.JsonKey(name: 'RefreshSchemasStatus')
  final RefreshSchemasStatus refreshSchemasStatus;

  RefreshSchemasResponse({
    this.refreshSchemasStatus,
  });
  factory RefreshSchemasResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshSchemasResponseFromJson(json);
}

/// Provides information that describes status of a schema at an endpoint
/// specified by the <code>DescribeRefreshSchemaStatus</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RefreshSchemasStatus {
  /// The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  /// The last failure message for the schema.
  @_s.JsonKey(name: 'LastFailureMessage')
  final String lastFailureMessage;

  /// The date the schema was last refreshed.
  @_s.JsonKey(
      name: 'LastRefreshDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastRefreshDate;

  /// The Amazon Resource Name (ARN) of the replication instance.
  @_s.JsonKey(name: 'ReplicationInstanceArn')
  final String replicationInstanceArn;

  /// The status of the schema.
  @_s.JsonKey(name: 'Status')
  final RefreshSchemasStatusTypeValue status;

  RefreshSchemasStatus({
    this.endpointArn,
    this.lastFailureMessage,
    this.lastRefreshDate,
    this.replicationInstanceArn,
    this.status,
  });
  factory RefreshSchemasStatus.fromJson(Map<String, dynamic> json) =>
      _$RefreshSchemasStatusFromJson(json);
}

enum RefreshSchemasStatusTypeValue {
  @_s.JsonValue('successful')
  successful,
  @_s.JsonValue('failed')
  failed,
  @_s.JsonValue('refreshing')
  refreshing,
}

enum ReleaseStatusValues {
  @_s.JsonValue('beta')
  beta,
}

enum ReloadOptionValue {
  @_s.JsonValue('data-reload')
  dataReload,
  @_s.JsonValue('validate-only')
  validateOnly,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReloadTablesResponse {
  /// The Amazon Resource Name (ARN) of the replication task.
  @_s.JsonKey(name: 'ReplicationTaskArn')
  final String replicationTaskArn;

  ReloadTablesResponse({
    this.replicationTaskArn,
  });
  factory ReloadTablesResponse.fromJson(Map<String, dynamic> json) =>
      _$ReloadTablesResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveTagsFromResourceResponse {
  RemoveTagsFromResourceResponse();
  factory RemoveTagsFromResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveTagsFromResourceResponseFromJson(json);
}

enum ReplicationEndpointTypeValue {
  @_s.JsonValue('source')
  source,
  @_s.JsonValue('target')
  target,
}

/// Provides information that defines a replication instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationInstance {
  /// The amount of storage (in gigabytes) that is allocated for the replication
  /// instance.
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;

  /// Boolean value indicating if minor version upgrades will be automatically
  /// applied to the instance.
  @_s.JsonKey(name: 'AutoMinorVersionUpgrade')
  final bool autoMinorVersionUpgrade;

  /// The Availability Zone for the instance.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The DNS name servers for the replication instance.
  @_s.JsonKey(name: 'DnsNameServers')
  final String dnsNameServers;

  /// The engine version number of the replication instance.
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;

  /// The expiration date of the free replication instance that is part of the
  /// Free DMS program.
  @_s.JsonKey(name: 'FreeUntil', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime freeUntil;

  /// The time the replication instance was created.
  @_s.JsonKey(
      name: 'InstanceCreateTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime instanceCreateTime;

  /// An AWS KMS key identifier that is used to encrypt the data on the
  /// replication instance.
  ///
  /// If you don't specify a value for the <code>KmsKeyId</code> parameter, then
  /// AWS DMS uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// Specifies whether the replication instance is a Multi-AZ deployment. You
  /// can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ
  /// parameter is set to <code>true</code>.
  @_s.JsonKey(name: 'MultiAZ')
  final bool multiAZ;

  /// The pending modification values.
  @_s.JsonKey(name: 'PendingModifiedValues')
  final ReplicationPendingModifiedValues pendingModifiedValues;

  /// The maintenance window times for the replication instance.
  @_s.JsonKey(name: 'PreferredMaintenanceWindow')
  final String preferredMaintenanceWindow;

  /// Specifies the accessibility options for the replication instance. A value of
  /// <code>true</code> represents an instance with a public IP address. A value
  /// of <code>false</code> represents an instance with a private IP address. The
  /// default value is <code>true</code>.
  @_s.JsonKey(name: 'PubliclyAccessible')
  final bool publiclyAccessible;

  /// The Amazon Resource Name (ARN) of the replication instance.
  @_s.JsonKey(name: 'ReplicationInstanceArn')
  final String replicationInstanceArn;

  /// The compute and memory capacity of the replication instance.
  ///
  /// Valid Values: <code>dms.t2.micro | dms.t2.small | dms.t2.medium |
  /// dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge |
  /// dms.c4.4xlarge </code>
  @_s.JsonKey(name: 'ReplicationInstanceClass')
  final String replicationInstanceClass;

  /// The replication instance identifier. This parameter is stored as a lowercase
  /// string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>myrepinstance</code>
  @_s.JsonKey(name: 'ReplicationInstanceIdentifier')
  final String replicationInstanceIdentifier;

  /// The private IP address of the replication instance.
  @_s.JsonKey(name: 'ReplicationInstancePrivateIpAddress')
  final String replicationInstancePrivateIpAddress;

  /// One or more private IP addresses for the replication instance.
  @_s.JsonKey(name: 'ReplicationInstancePrivateIpAddresses')
  final List<String> replicationInstancePrivateIpAddresses;

  /// The public IP address of the replication instance.
  @_s.JsonKey(name: 'ReplicationInstancePublicIpAddress')
  final String replicationInstancePublicIpAddress;

  /// One or more public IP addresses for the replication instance.
  @_s.JsonKey(name: 'ReplicationInstancePublicIpAddresses')
  final List<String> replicationInstancePublicIpAddresses;

  /// The status of the replication instance.
  @_s.JsonKey(name: 'ReplicationInstanceStatus')
  final String replicationInstanceStatus;

  /// The subnet group for the replication instance.
  @_s.JsonKey(name: 'ReplicationSubnetGroup')
  final ReplicationSubnetGroup replicationSubnetGroup;

  /// The Availability Zone of the standby replication instance in a Multi-AZ
  /// deployment.
  @_s.JsonKey(name: 'SecondaryAvailabilityZone')
  final String secondaryAvailabilityZone;

  /// The VPC security group for the instance.
  @_s.JsonKey(name: 'VpcSecurityGroups')
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  ReplicationInstance({
    this.allocatedStorage,
    this.autoMinorVersionUpgrade,
    this.availabilityZone,
    this.dnsNameServers,
    this.engineVersion,
    this.freeUntil,
    this.instanceCreateTime,
    this.kmsKeyId,
    this.multiAZ,
    this.pendingModifiedValues,
    this.preferredMaintenanceWindow,
    this.publiclyAccessible,
    this.replicationInstanceArn,
    this.replicationInstanceClass,
    this.replicationInstanceIdentifier,
    this.replicationInstancePrivateIpAddress,
    this.replicationInstancePrivateIpAddresses,
    this.replicationInstancePublicIpAddress,
    this.replicationInstancePublicIpAddresses,
    this.replicationInstanceStatus,
    this.replicationSubnetGroup,
    this.secondaryAvailabilityZone,
    this.vpcSecurityGroups,
  });
  factory ReplicationInstance.fromJson(Map<String, dynamic> json) =>
      _$ReplicationInstanceFromJson(json);
}

/// Contains metadata for a replication instance task log.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationInstanceTaskLog {
  /// The size, in bytes, of the replication task log.
  @_s.JsonKey(name: 'ReplicationInstanceTaskLogSize')
  final int replicationInstanceTaskLogSize;

  /// The Amazon Resource Name (ARN) of the replication task.
  @_s.JsonKey(name: 'ReplicationTaskArn')
  final String replicationTaskArn;

  /// The name of the replication task.
  @_s.JsonKey(name: 'ReplicationTaskName')
  final String replicationTaskName;

  ReplicationInstanceTaskLog({
    this.replicationInstanceTaskLogSize,
    this.replicationTaskArn,
    this.replicationTaskName,
  });
  factory ReplicationInstanceTaskLog.fromJson(Map<String, dynamic> json) =>
      _$ReplicationInstanceTaskLogFromJson(json);
}

/// Provides information about the values of pending modifications to a
/// replication instance. This data type is an object of the
/// <code>ReplicationInstance</code> user-defined data type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationPendingModifiedValues {
  /// The amount of storage (in gigabytes) that is allocated for the replication
  /// instance.
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;

  /// The engine version number of the replication instance.
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;

  /// Specifies whether the replication instance is a Multi-AZ deployment. You
  /// can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ
  /// parameter is set to <code>true</code>.
  @_s.JsonKey(name: 'MultiAZ')
  final bool multiAZ;

  /// The compute and memory capacity of the replication instance.
  ///
  /// Valid Values: <code>dms.t2.micro | dms.t2.small | dms.t2.medium |
  /// dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge |
  /// dms.c4.4xlarge </code>
  @_s.JsonKey(name: 'ReplicationInstanceClass')
  final String replicationInstanceClass;

  ReplicationPendingModifiedValues({
    this.allocatedStorage,
    this.engineVersion,
    this.multiAZ,
    this.replicationInstanceClass,
  });
  factory ReplicationPendingModifiedValues.fromJson(
          Map<String, dynamic> json) =>
      _$ReplicationPendingModifiedValuesFromJson(json);
}

/// Describes a subnet group in response to a request by the
/// <code>DescribeReplicationSubnetGroup</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationSubnetGroup {
  /// A description for the replication subnet group.
  @_s.JsonKey(name: 'ReplicationSubnetGroupDescription')
  final String replicationSubnetGroupDescription;

  /// The identifier of the replication instance subnet group.
  @_s.JsonKey(name: 'ReplicationSubnetGroupIdentifier')
  final String replicationSubnetGroupIdentifier;

  /// The status of the subnet group.
  @_s.JsonKey(name: 'SubnetGroupStatus')
  final String subnetGroupStatus;

  /// The subnets that are in the subnet group.
  @_s.JsonKey(name: 'Subnets')
  final List<Subnet> subnets;

  /// The ID of the VPC.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  ReplicationSubnetGroup({
    this.replicationSubnetGroupDescription,
    this.replicationSubnetGroupIdentifier,
    this.subnetGroupStatus,
    this.subnets,
    this.vpcId,
  });
  factory ReplicationSubnetGroup.fromJson(Map<String, dynamic> json) =>
      _$ReplicationSubnetGroupFromJson(json);
}

/// Provides information that describes a replication task created by the
/// <code>CreateReplicationTask</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationTask {
  /// Indicates when you want a change data capture (CDC) operation to start. Use
  /// either <code>CdcStartPosition</code> or <code>CdcStartTime</code> to specify
  /// when you want the CDC operation to start. Specifying both values results in
  /// an error.
  ///
  /// The value can be in date, checkpoint, or LSN/SCN format.
  ///
  /// Date Example: --cdc-start-position “2018-03-08T12:12:12”
  ///
  /// Checkpoint Example: --cdc-start-position
  /// "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
  ///
  /// LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”
  @_s.JsonKey(name: 'CdcStartPosition')
  final String cdcStartPosition;

  /// Indicates when you want a change data capture (CDC) operation to stop. The
  /// value can be either server time or commit time.
  ///
  /// Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12 “
  @_s.JsonKey(name: 'CdcStopPosition')
  final String cdcStopPosition;

  /// The last error (failure) message generated for the replication instance.
  @_s.JsonKey(name: 'LastFailureMessage')
  final String lastFailureMessage;

  /// The type of migration.
  @_s.JsonKey(name: 'MigrationType')
  final MigrationTypeValue migrationType;

  /// Indicates the last checkpoint that occurred during a change data capture
  /// (CDC) operation. You can provide this value to the
  /// <code>CdcStartPosition</code> parameter to start a CDC operation that begins
  /// at that checkpoint.
  @_s.JsonKey(name: 'RecoveryCheckpoint')
  final String recoveryCheckpoint;

  /// The Amazon Resource Name (ARN) of the replication instance.
  @_s.JsonKey(name: 'ReplicationInstanceArn')
  final String replicationInstanceArn;

  /// The Amazon Resource Name (ARN) of the replication task.
  @_s.JsonKey(name: 'ReplicationTaskArn')
  final String replicationTaskArn;

  /// The date the replication task was created.
  @_s.JsonKey(
      name: 'ReplicationTaskCreationDate',
      fromJson: unixFromJson,
      toJson: unixToJson)
  final DateTime replicationTaskCreationDate;

  /// The user-assigned replication task identifier or name.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ReplicationTaskIdentifier')
  final String replicationTaskIdentifier;

  /// The settings for the replication task.
  @_s.JsonKey(name: 'ReplicationTaskSettings')
  final String replicationTaskSettings;

  /// The date the replication task is scheduled to start.
  @_s.JsonKey(
      name: 'ReplicationTaskStartDate',
      fromJson: unixFromJson,
      toJson: unixToJson)
  final DateTime replicationTaskStartDate;

  /// The statistics for the task, including elapsed time, tables loaded, and
  /// table errors.
  @_s.JsonKey(name: 'ReplicationTaskStats')
  final ReplicationTaskStats replicationTaskStats;

  /// The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.
  @_s.JsonKey(name: 'SourceEndpointArn')
  final String sourceEndpointArn;

  /// The status of the replication task.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The reason the replication task was stopped.
  @_s.JsonKey(name: 'StopReason')
  final String stopReason;

  /// Table mappings specified in the task.
  @_s.JsonKey(name: 'TableMappings')
  final String tableMappings;

  /// The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.
  @_s.JsonKey(name: 'TargetEndpointArn')
  final String targetEndpointArn;

  ReplicationTask({
    this.cdcStartPosition,
    this.cdcStopPosition,
    this.lastFailureMessage,
    this.migrationType,
    this.recoveryCheckpoint,
    this.replicationInstanceArn,
    this.replicationTaskArn,
    this.replicationTaskCreationDate,
    this.replicationTaskIdentifier,
    this.replicationTaskSettings,
    this.replicationTaskStartDate,
    this.replicationTaskStats,
    this.sourceEndpointArn,
    this.status,
    this.stopReason,
    this.tableMappings,
    this.targetEndpointArn,
  });
  factory ReplicationTask.fromJson(Map<String, dynamic> json) =>
      _$ReplicationTaskFromJson(json);
}

/// The task assessment report in JSON format.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationTaskAssessmentResult {
  /// The task assessment results in JSON format.
  @_s.JsonKey(name: 'AssessmentResults')
  final String assessmentResults;

  /// The file containing the results of the task assessment.
  @_s.JsonKey(name: 'AssessmentResultsFile')
  final String assessmentResultsFile;

  /// The status of the task assessment.
  @_s.JsonKey(name: 'AssessmentStatus')
  final String assessmentStatus;

  /// The Amazon Resource Name (ARN) of the replication task.
  @_s.JsonKey(name: 'ReplicationTaskArn')
  final String replicationTaskArn;

  /// The replication task identifier of the task on which the task assessment was
  /// run.
  @_s.JsonKey(name: 'ReplicationTaskIdentifier')
  final String replicationTaskIdentifier;

  /// The date the task assessment was completed.
  @_s.JsonKey(
      name: 'ReplicationTaskLastAssessmentDate',
      fromJson: unixFromJson,
      toJson: unixToJson)
  final DateTime replicationTaskLastAssessmentDate;

  /// The URL of the S3 object containing the task assessment results.
  @_s.JsonKey(name: 'S3ObjectUrl')
  final String s3ObjectUrl;

  ReplicationTaskAssessmentResult({
    this.assessmentResults,
    this.assessmentResultsFile,
    this.assessmentStatus,
    this.replicationTaskArn,
    this.replicationTaskIdentifier,
    this.replicationTaskLastAssessmentDate,
    this.s3ObjectUrl,
  });
  factory ReplicationTaskAssessmentResult.fromJson(Map<String, dynamic> json) =>
      _$ReplicationTaskAssessmentResultFromJson(json);
}

/// In response to a request by the <code>DescribeReplicationTasks</code>
/// operation, this object provides a collection of statistics about a
/// replication task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationTaskStats {
  /// The elapsed time of the task, in milliseconds.
  @_s.JsonKey(name: 'ElapsedTimeMillis')
  final int elapsedTimeMillis;

  /// The date the replication task was started either with a fresh start or a
  /// target reload.
  @_s.JsonKey(
      name: 'FreshStartDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime freshStartDate;

  /// The date the replication task full load was completed.
  @_s.JsonKey(
      name: 'FullLoadFinishDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime fullLoadFinishDate;

  /// The percent complete for the full load migration task.
  @_s.JsonKey(name: 'FullLoadProgressPercent')
  final int fullLoadProgressPercent;

  /// The date the replication task full load was started.
  @_s.JsonKey(
      name: 'FullLoadStartDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime fullLoadStartDate;

  /// The date the replication task was started either with a fresh start or a
  /// resume. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html#DMS-StartReplicationTask-request-StartReplicationTaskType">StartReplicationTaskType</a>.
  @_s.JsonKey(name: 'StartDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startDate;

  /// The date the replication task was stopped.
  @_s.JsonKey(name: 'StopDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime stopDate;

  /// The number of errors that have occurred during this task.
  @_s.JsonKey(name: 'TablesErrored')
  final int tablesErrored;

  /// The number of tables loaded for this task.
  @_s.JsonKey(name: 'TablesLoaded')
  final int tablesLoaded;

  /// The number of tables currently loading for this task.
  @_s.JsonKey(name: 'TablesLoading')
  final int tablesLoading;

  /// The number of tables queued for this task.
  @_s.JsonKey(name: 'TablesQueued')
  final int tablesQueued;

  ReplicationTaskStats({
    this.elapsedTimeMillis,
    this.freshStartDate,
    this.fullLoadFinishDate,
    this.fullLoadProgressPercent,
    this.fullLoadStartDate,
    this.startDate,
    this.stopDate,
    this.tablesErrored,
    this.tablesLoaded,
    this.tablesLoading,
    this.tablesQueued,
  });
  factory ReplicationTaskStats.fromJson(Map<String, dynamic> json) =>
      _$ReplicationTaskStatsFromJson(json);
}

/// Identifies an AWS DMS resource and any pending actions for it.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourcePendingMaintenanceActions {
  /// Detailed information about the pending maintenance action.
  @_s.JsonKey(name: 'PendingMaintenanceActionDetails')
  final List<PendingMaintenanceAction> pendingMaintenanceActionDetails;

  /// The Amazon Resource Name (ARN) of the DMS resource that the pending
  /// maintenance action applies to. For information about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.AWS.ARN.html">
  /// Constructing an Amazon Resource Name (ARN) for AWS DMS</a> in the DMS
  /// documentation.
  @_s.JsonKey(name: 'ResourceIdentifier')
  final String resourceIdentifier;

  ResourcePendingMaintenanceActions({
    this.pendingMaintenanceActionDetails,
    this.resourceIdentifier,
  });
  factory ResourcePendingMaintenanceActions.fromJson(
          Map<String, dynamic> json) =>
      _$ResourcePendingMaintenanceActionsFromJson(json);
}

/// Settings for exporting data to Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Settings {
  /// An optional parameter to set a folder name in the S3 bucket. If provided,
  /// tables are created in the path <code>
  /// <i>bucketFolder</i>/<i>schema_name</i>/<i>table_name</i>/</code>. If this
  /// parameter isn't specified, then the path used is <code>
  /// <i>schema_name</i>/<i>table_name</i>/</code>.
  @_s.JsonKey(name: 'BucketFolder')
  final String bucketFolder;

  /// The name of the S3 bucket.
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// A value that enables a change data capture (CDC) load to write INSERT and
  /// UPDATE operations to .csv or .parquet (columnar storage) output files. The
  /// default setting is <code>false</code>, but when
  /// <code>CdcInsertsAndUpdates</code> is set to <code>true</code>or
  /// <code>y</code>, INSERTs and UPDATEs from the source database are migrated to
  /// the .csv or .parquet file.
  ///
  /// For .csv file format only, how these INSERTs and UPDATEs are recorded
  /// depends on the value of the <code>IncludeOpForFullLoad</code> parameter. If
  /// <code>IncludeOpForFullLoad</code> is set to <code>true</code>, the first
  /// field of every CDC record is set to either <code>I</code> or <code>U</code>
  /// to indicate INSERT and UPDATE operations at the source. But if
  /// <code>IncludeOpForFullLoad</code> is set to <code>false</code>, CDC records
  /// are written without an indication of INSERT or UPDATE operations at the
  /// source. For more information about how these settings work together, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps">Indicating
  /// Source DB Operations in Migrated S3 Data</a> in the <i>AWS Database
  /// Migration Service User Guide.</i>.
  /// <note>
  /// AWS DMS supports the use of the <code>CdcInsertsAndUpdates</code> parameter
  /// in versions 3.3.1 and later.
  ///
  /// <code>CdcInsertsOnly</code> and <code>CdcInsertsAndUpdates</code> can't both
  /// be set to <code>true</code> for the same endpoint. Set either
  /// <code>CdcInsertsOnly</code> or <code>CdcInsertsAndUpdates</code> to
  /// <code>true</code> for the same endpoint, but not both.
  /// </note>
  @_s.JsonKey(name: 'CdcInsertsAndUpdates')
  final bool cdcInsertsAndUpdates;

  /// A value that enables a change data capture (CDC) load to write only INSERT
  /// operations to .csv or columnar storage (.parquet) output files. By default
  /// (the <code>false</code> setting), the first field in a .csv or .parquet
  /// record contains the letter I (INSERT), U (UPDATE), or D (DELETE). These
  /// values indicate whether the row was inserted, updated, or deleted at the
  /// source database for a CDC load to the target.
  ///
  /// If <code>CdcInsertsOnly</code> is set to <code>true</code> or
  /// <code>y</code>, only INSERTs from the source database are migrated to the
  /// .csv or .parquet file. For .csv format only, how these INSERTs are recorded
  /// depends on the value of <code>IncludeOpForFullLoad</code>. If
  /// <code>IncludeOpForFullLoad</code> is set to <code>true</code>, the first
  /// field of every CDC record is set to I to indicate the INSERT operation at
  /// the source. If <code>IncludeOpForFullLoad</code> is set to
  /// <code>false</code>, every CDC record is written without a first field to
  /// indicate the INSERT operation at the source. For more information about how
  /// these settings work together, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps">Indicating
  /// Source DB Operations in Migrated S3 Data</a> in the <i>AWS Database
  /// Migration Service User Guide.</i>.
  /// <note>
  /// AWS DMS supports the interaction described preceding between the
  /// <code>CdcInsertsOnly</code> and <code>IncludeOpForFullLoad</code> parameters
  /// in versions 3.1.4 and later.
  ///
  /// <code>CdcInsertsOnly</code> and <code>CdcInsertsAndUpdates</code> can't both
  /// be set to <code>true</code> for the same endpoint. Set either
  /// <code>CdcInsertsOnly</code> or <code>CdcInsertsAndUpdates</code> to
  /// <code>true</code> for the same endpoint, but not both.
  /// </note>
  @_s.JsonKey(name: 'CdcInsertsOnly')
  final bool cdcInsertsOnly;

  /// An optional parameter to use GZIP to compress the target files. Set to GZIP
  /// to compress the target files. Either set this parameter to NONE (the
  /// default) or don't use it to leave the files uncompressed. This parameter
  /// applies to both .csv and .parquet file formats.
  @_s.JsonKey(name: 'CompressionType')
  final CompressionTypeValue compressionType;

  /// The delimiter used to separate columns in the source files. The default is a
  /// comma.
  @_s.JsonKey(name: 'CsvDelimiter')
  final String csvDelimiter;

  /// The delimiter used to separate rows in the source files. The default is a
  /// carriage return (<code>\n</code>).
  @_s.JsonKey(name: 'CsvRowDelimiter')
  final String csvRowDelimiter;

  /// The format of the data that you want to use for output. You can choose one
  /// of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>csv</code> : This is a row-based file format with comma-separated
  /// values (.csv).
  /// </li>
  /// <li>
  /// <code>parquet</code> : Apache Parquet (.parquet) is a columnar storage file
  /// format that features efficient compression and provides faster query
  /// response.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DataFormat')
  final DataFormatValue dataFormat;

  /// The size of one data page in bytes. This parameter defaults to 1024 * 1024
  /// bytes (1 MiB). This number is used for .parquet file format only.
  @_s.JsonKey(name: 'DataPageSize')
  final int dataPageSize;

  /// The maximum size of an encoded dictionary page of a column. If the
  /// dictionary page exceeds this, this column is stored using an encoding type
  /// of <code>PLAIN</code>. This parameter defaults to 1024 * 1024 bytes (1 MiB),
  /// the maximum size of a dictionary page before it reverts to
  /// <code>PLAIN</code> encoding. This size is used for .parquet file format
  /// only.
  @_s.JsonKey(name: 'DictPageSizeLimit')
  final int dictPageSizeLimit;

  /// A value that enables statistics for Parquet pages and row groups. Choose
  /// <code>true</code> to enable statistics, <code>false</code> to disable.
  /// Statistics include <code>NULL</code>, <code>DISTINCT</code>,
  /// <code>MAX</code>, and <code>MIN</code> values. This parameter defaults to
  /// <code>true</code>. This value is used for .parquet file format only.
  @_s.JsonKey(name: 'EnableStatistics')
  final bool enableStatistics;

  /// The type of encoding you are using:
  ///
  /// <ul>
  /// <li>
  /// <code>RLE_DICTIONARY</code> uses a combination of bit-packing and run-length
  /// encoding to store repeated values more efficiently. This is the default.
  /// </li>
  /// <li>
  /// <code>PLAIN</code> doesn't use encoding at all. Values are stored as they
  /// are.
  /// </li>
  /// <li>
  /// <code>PLAIN_DICTIONARY</code> builds a dictionary of the values encountered
  /// in a given column. The dictionary is stored in a dictionary page for each
  /// column chunk.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'EncodingType')
  final EncodingTypeValue encodingType;

  /// The type of server-side encryption that you want to use for your data. This
  /// encryption type is part of the endpoint settings or the extra connections
  /// attributes for Amazon S3. You can choose either <code>SSE_S3</code> (the
  /// default) or <code>SSE_KMS</code>. To use <code>SSE_S3</code>, you need an
  /// AWS Identity and Access Management (IAM) role with permission to allow
  /// <code>"arn:aws:s3:::dms-*"</code> to use the following actions:
  ///
  /// <ul>
  /// <li>
  /// <code>s3:CreateBucket</code>
  /// </li>
  /// <li>
  /// <code>s3:ListBucket</code>
  /// </li>
  /// <li>
  /// <code>s3:DeleteBucket</code>
  /// </li>
  /// <li>
  /// <code>s3:GetBucketLocation</code>
  /// </li>
  /// <li>
  /// <code>s3:GetObject</code>
  /// </li>
  /// <li>
  /// <code>s3:PutObject</code>
  /// </li>
  /// <li>
  /// <code>s3:DeleteObject</code>
  /// </li>
  /// <li>
  /// <code>s3:GetObjectVersion</code>
  /// </li>
  /// <li>
  /// <code>s3:GetBucketPolicy</code>
  /// </li>
  /// <li>
  /// <code>s3:PutBucketPolicy</code>
  /// </li>
  /// <li>
  /// <code>s3:DeleteBucketPolicy</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'EncryptionMode')
  final EncryptionModeValue encryptionMode;

  /// The external table definition.
  @_s.JsonKey(name: 'ExternalTableDefinition')
  final String externalTableDefinition;

  /// A value that enables a full load to write INSERT operations to the
  /// comma-separated value (.csv) output files only to indicate how the rows were
  /// added to the source database.
  /// <note>
  /// AWS DMS supports the <code>IncludeOpForFullLoad</code> parameter in versions
  /// 3.1.4 and later.
  /// </note>
  /// For full load, records can only be inserted. By default (the
  /// <code>false</code> setting), no information is recorded in these output
  /// files for a full load to indicate that the rows were inserted at the source
  /// database. If <code>IncludeOpForFullLoad</code> is set to <code>true</code>
  /// or <code>y</code>, the INSERT is recorded as an I annotation in the first
  /// field of the .csv file. This allows the format of your target records from a
  /// full load to be consistent with the target records from a CDC load.
  /// <note>
  /// This setting works together with the <code>CdcInsertsOnly</code> and the
  /// <code>CdcInsertsAndUpdates</code> parameters for output to .csv files only.
  /// For more information about how these settings work together, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps">Indicating
  /// Source DB Operations in Migrated S3 Data</a> in the <i>AWS Database
  /// Migration Service User Guide.</i>.
  /// </note>
  @_s.JsonKey(name: 'IncludeOpForFullLoad')
  final bool includeOpForFullLoad;

  /// A value that specifies the precision of any <code>TIMESTAMP</code> column
  /// values that are written to an Amazon S3 object file in .parquet format.
  /// <note>
  /// AWS DMS supports the <code>ParquetTimestampInMillisecond</code> parameter in
  /// versions 3.1.4 and later.
  /// </note>
  /// When <code>ParquetTimestampInMillisecond</code> is set to <code>true</code>
  /// or <code>y</code>, AWS DMS writes all <code>TIMESTAMP</code> columns in a
  /// .parquet formatted file with millisecond precision. Otherwise, DMS writes
  /// them with microsecond precision.
  ///
  /// Currently, Amazon Athena and AWS Glue can handle only millisecond precision
  /// for <code>TIMESTAMP</code> values. Set this parameter to <code>true</code>
  /// for S3 endpoint object files that are .parquet formatted only if you plan to
  /// query or process the data with Athena or AWS Glue.
  /// <note>
  /// AWS DMS writes any <code>TIMESTAMP</code> column values written to an S3
  /// file in .csv format with microsecond precision.
  ///
  /// Setting <code>ParquetTimestampInMillisecond</code> has no effect on the
  /// string format of the timestamp column value that is inserted by setting the
  /// <code>TimestampColumnName</code> parameter.
  /// </note>
  @_s.JsonKey(name: 'ParquetTimestampInMillisecond')
  final bool parquetTimestampInMillisecond;

  /// The version of the Apache Parquet format that you want to use:
  /// <code>parquet_1_0</code> (the default) or <code>parquet_2_0</code>.
  @_s.JsonKey(name: 'ParquetVersion')
  final ParquetVersionValue parquetVersion;

  /// The number of rows in a row group. A smaller row group size provides faster
  /// reads. But as the number of row groups grows, the slower writes become. This
  /// parameter defaults to 10,000 rows. This number is used for .parquet file
  /// format only.
  ///
  /// If you choose a value larger than the maximum, <code>RowGroupLength</code>
  /// is set to the max row group length in bytes (64 * 1024 * 1024).
  @_s.JsonKey(name: 'RowGroupLength')
  final int rowGroupLength;

  /// If you are using <code>SSE_KMS</code> for the <code>EncryptionMode</code>,
  /// provide the AWS KMS key ID. The key that you use needs an attached policy
  /// that enables AWS Identity and Access Management (IAM) user permissions and
  /// allows use of the key.
  ///
  /// Here is a CLI example: <code>aws dms create-endpoint --endpoint-identifier
  /// <i>value</i> --endpoint-type target --engine-name s3 --s3-settings
  /// ServiceAccessRoleArn=<i>value</i>,BucketFolder=<i>value</i>,BucketName=<i>value</i>,EncryptionMode=SSE_KMS,ServerSideEncryptionKmsKeyId=<i>value</i>
  /// </code>
  @_s.JsonKey(name: 'ServerSideEncryptionKmsKeyId')
  final String serverSideEncryptionKmsKeyId;

  /// The Amazon Resource Name (ARN) used by the service access IAM role.
  @_s.JsonKey(name: 'ServiceAccessRoleArn')
  final String serviceAccessRoleArn;

  /// A value that when nonblank causes AWS DMS to add a column with timestamp
  /// information to the endpoint data for an Amazon S3 target.
  /// <note>
  /// AWS DMS supports the <code>TimestampColumnName</code> parameter in versions
  /// 3.1.4 and later.
  /// </note>
  /// DMS includes an additional <code>STRING</code> column in the .csv or
  /// .parquet object files of your migrated data when you set
  /// <code>TimestampColumnName</code> to a nonblank value.
  ///
  /// For a full load, each row of this timestamp column contains a timestamp for
  /// when the data was transferred from the source to the target by DMS.
  ///
  /// For a change data capture (CDC) load, each row of the timestamp column
  /// contains the timestamp for the commit of that row in the source database.
  ///
  /// The string format for this timestamp column value is <code>yyyy-MM-dd
  /// HH:mm:ss.SSSSSS</code>. By default, the precision of this value is in
  /// microseconds. For a CDC load, the rounding of the precision depends on the
  /// commit timestamp supported by DMS for the source database.
  ///
  /// When the <code>AddColumnName</code> parameter is set to <code>true</code>,
  /// DMS also includes a name for the timestamp column that you set with
  /// <code>TimestampColumnName</code>.
  @_s.JsonKey(name: 'TimestampColumnName')
  final String timestampColumnName;

  S3Settings({
    this.bucketFolder,
    this.bucketName,
    this.cdcInsertsAndUpdates,
    this.cdcInsertsOnly,
    this.compressionType,
    this.csvDelimiter,
    this.csvRowDelimiter,
    this.dataFormat,
    this.dataPageSize,
    this.dictPageSizeLimit,
    this.enableStatistics,
    this.encodingType,
    this.encryptionMode,
    this.externalTableDefinition,
    this.includeOpForFullLoad,
    this.parquetTimestampInMillisecond,
    this.parquetVersion,
    this.rowGroupLength,
    this.serverSideEncryptionKmsKeyId,
    this.serviceAccessRoleArn,
    this.timestampColumnName,
  });
  factory S3Settings.fromJson(Map<String, dynamic> json) =>
      _$S3SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$S3SettingsToJson(this);
}

enum SourceType {
  @_s.JsonValue('replication-instance')
  replicationInstance,
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartReplicationTaskAssessmentResponse {
  /// The assessed replication task.
  @_s.JsonKey(name: 'ReplicationTask')
  final ReplicationTask replicationTask;

  StartReplicationTaskAssessmentResponse({
    this.replicationTask,
  });
  factory StartReplicationTaskAssessmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartReplicationTaskAssessmentResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartReplicationTaskResponse {
  /// The replication task started.
  @_s.JsonKey(name: 'ReplicationTask')
  final ReplicationTask replicationTask;

  StartReplicationTaskResponse({
    this.replicationTask,
  });
  factory StartReplicationTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$StartReplicationTaskResponseFromJson(json);
}

enum StartReplicationTaskTypeValue {
  @_s.JsonValue('start-replication')
  startReplication,
  @_s.JsonValue('resume-processing')
  resumeProcessing,
  @_s.JsonValue('reload-target')
  reloadTarget,
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopReplicationTaskResponse {
  /// The replication task stopped.
  @_s.JsonKey(name: 'ReplicationTask')
  final ReplicationTask replicationTask;

  StopReplicationTaskResponse({
    this.replicationTask,
  });
  factory StopReplicationTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$StopReplicationTaskResponseFromJson(json);
}

/// In response to a request by the <code>DescribeReplicationSubnetGroup</code>
/// operation, this object identifies a subnet by its given Availability Zone,
/// subnet identifier, and status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Subnet {
  /// The Availability Zone of the subnet.
  @_s.JsonKey(name: 'SubnetAvailabilityZone')
  final AvailabilityZone subnetAvailabilityZone;

  /// The subnet identifier.
  @_s.JsonKey(name: 'SubnetIdentifier')
  final String subnetIdentifier;

  /// The status of the subnet.
  @_s.JsonKey(name: 'SubnetStatus')
  final String subnetStatus;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetStatus,
  });
  factory Subnet.fromJson(Map<String, dynamic> json) => _$SubnetFromJson(json);
}

/// Provides information about types of supported endpoints in response to a
/// request by the <code>DescribeEndpointTypes</code> operation. This
/// information includes the type of endpoint, the database engine name, and
/// whether change data capture (CDC) is supported.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SupportedEndpointType {
  /// The type of endpoint. Valid values are <code>source</code> and
  /// <code>target</code>.
  @_s.JsonKey(name: 'EndpointType')
  final ReplicationEndpointTypeValue endpointType;

  /// The expanded name for the engine name. For example, if the
  /// <code>EngineName</code> parameter is "aurora," this value would be "Amazon
  /// Aurora MySQL."
  @_s.JsonKey(name: 'EngineDisplayName')
  final String engineDisplayName;

  /// The database engine name. Valid values, depending on the EndpointType,
  /// include <code>"mysql"</code>, <code>"oracle"</code>,
  /// <code>"postgres"</code>, <code>"mariadb"</code>, <code>"aurora"</code>,
  /// <code>"aurora-postgresql"</code>, <code>"redshift"</code>,
  /// <code>"s3"</code>, <code>"db2"</code>, <code>"azuredb"</code>,
  /// <code>"sybase"</code>, <code>"dynamodb"</code>, <code>"mongodb"</code>,
  /// <code>"kinesis"</code>, <code>"kafka"</code>, <code>"elasticsearch"</code>,
  /// <code>"documentdb"</code>, and <code>"sqlserver"</code>.
  @_s.JsonKey(name: 'EngineName')
  final String engineName;

  /// Indicates if Change Data Capture (CDC) is supported.
  @_s.JsonKey(name: 'SupportsCDC')
  final bool supportsCDC;

  SupportedEndpointType({
    this.endpointType,
    this.engineDisplayName,
    this.engineName,
    this.supportsCDC,
  });
  factory SupportedEndpointType.fromJson(Map<String, dynamic> json) =>
      _$SupportedEndpointTypeFromJson(json);
}

/// Provides a collection of table statistics in response to a request by the
/// <code>DescribeTableStatistics</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TableStatistics {
  /// The data definition language (DDL) used to build and modify the structure of
  /// your tables.
  @_s.JsonKey(name: 'Ddls')
  final int ddls;

  /// The number of delete actions performed on a table.
  @_s.JsonKey(name: 'Deletes')
  final int deletes;

  /// The number of rows that failed conditional checks during the full load
  /// operation (valid only for migrations where DynamoDB is the target).
  @_s.JsonKey(name: 'FullLoadCondtnlChkFailedRows')
  final int fullLoadCondtnlChkFailedRows;

  /// The time when the full load operation completed.
  @_s.JsonKey(
      name: 'FullLoadEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime fullLoadEndTime;

  /// The number of rows that failed to load during the full load operation (valid
  /// only for migrations where DynamoDB is the target).
  @_s.JsonKey(name: 'FullLoadErrorRows')
  final int fullLoadErrorRows;

  /// A value that indicates if the table was reloaded (<code>true</code>) or
  /// loaded as part of a new full load operation (<code>false</code>).
  @_s.JsonKey(name: 'FullLoadReloaded')
  final bool fullLoadReloaded;

  /// The number of rows added during the full load operation.
  @_s.JsonKey(name: 'FullLoadRows')
  final int fullLoadRows;

  /// The time when the full load operation started.
  @_s.JsonKey(
      name: 'FullLoadStartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime fullLoadStartTime;

  /// The number of insert actions performed on a table.
  @_s.JsonKey(name: 'Inserts')
  final int inserts;

  /// The last time a table was updated.
  @_s.JsonKey(
      name: 'LastUpdateTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastUpdateTime;

  /// The schema name.
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;

  /// The name of the table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The state of the tables described.
  ///
  /// Valid states: Table does not exist | Before load | Full load | Table
  /// completed | Table cancelled | Table error | Table all | Table updates |
  /// Table is being reloaded
  @_s.JsonKey(name: 'TableState')
  final String tableState;

  /// The number of update actions performed on a table.
  @_s.JsonKey(name: 'Updates')
  final int updates;

  /// The number of records that failed validation.
  @_s.JsonKey(name: 'ValidationFailedRecords')
  final int validationFailedRecords;

  /// The number of records that have yet to be validated.
  @_s.JsonKey(name: 'ValidationPendingRecords')
  final int validationPendingRecords;

  /// The validation state of the table.
  ///
  /// This parameter can have the following values:
  ///
  /// <ul>
  /// <li>
  /// Not enabled - Validation isn't enabled for the table in the migration task.
  /// </li>
  /// <li>
  /// Pending records - Some records in the table are waiting for validation.
  /// </li>
  /// <li>
  /// Mismatched records - Some records in the table don't match between the
  /// source and target.
  /// </li>
  /// <li>
  /// Suspended records - Some records in the table couldn't be validated.
  /// </li>
  /// <li>
  /// No primary key - The table couldn't be validated because it has no primary
  /// key.
  /// </li>
  /// <li>
  /// Table error - The table wasn't validated because it's in an error state and
  /// some data wasn't migrated.
  /// </li>
  /// <li>
  /// Validated - All rows in the table are validated. If the table is updated,
  /// the status can change from Validated.
  /// </li>
  /// <li>
  /// Error - The table couldn't be validated because of an unexpected error.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ValidationState')
  final String validationState;

  /// Additional details about the state of validation.
  @_s.JsonKey(name: 'ValidationStateDetails')
  final String validationStateDetails;

  /// The number of records that couldn't be validated.
  @_s.JsonKey(name: 'ValidationSuspendedRecords')
  final int validationSuspendedRecords;

  TableStatistics({
    this.ddls,
    this.deletes,
    this.fullLoadCondtnlChkFailedRows,
    this.fullLoadEndTime,
    this.fullLoadErrorRows,
    this.fullLoadReloaded,
    this.fullLoadRows,
    this.fullLoadStartTime,
    this.inserts,
    this.lastUpdateTime,
    this.schemaName,
    this.tableName,
    this.tableState,
    this.updates,
    this.validationFailedRecords,
    this.validationPendingRecords,
    this.validationState,
    this.validationStateDetails,
    this.validationSuspendedRecords,
  });
  factory TableStatistics.fromJson(Map<String, dynamic> json) =>
      _$TableStatisticsFromJson(json);
}

/// Provides the name of the schema and table to be reloaded.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TableToReload {
  /// The schema name of the table to be reloaded.
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;

  /// The table name of the table to be reloaded.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  TableToReload({
    this.schemaName,
    this.tableName,
  });
  Map<String, dynamic> toJson() => _$TableToReloadToJson(this);
}

/// A user-defined key-value pair that describes metadata added to an AWS DMS
/// resource and that is used by operations such as the following:
///
/// <ul>
/// <li>
/// <code>AddTagsToResource</code>
/// </li>
/// <li>
/// <code>ListTagsForResource</code>
/// </li>
/// <li>
/// <code>RemoveTagsFromResource</code>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A key is the required name of the tag. The string value can be from 1 to 128
  /// Unicode characters in length and can't be prefixed with "aws:" or "dms:".
  /// The string can only contain only the set of Unicode letters, digits,
  /// white-space, '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  @_s.JsonKey(name: 'Key')
  final String key;

  /// A value is the optional value of the tag. The string value can be from 1 to
  /// 256 Unicode characters in length and can't be prefixed with "aws:" or
  /// "dms:". The string can only contain only the set of Unicode letters, digits,
  /// white-space, '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestConnectionResponse {
  /// The connection tested.
  @_s.JsonKey(name: 'Connection')
  final Connection connection;

  TestConnectionResponse({
    this.connection,
  });
  factory TestConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$TestConnectionResponseFromJson(json);
}

/// Describes status of a security group associated with the virtual private
/// cloud hosting your replication and DB instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcSecurityGroupMembership {
  /// The status of the VPC security group.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The VPC security group Id.
  @_s.JsonKey(name: 'VpcSecurityGroupId')
  final String vpcSecurityGroupId;

  VpcSecurityGroupMembership({
    this.status,
    this.vpcSecurityGroupId,
  });
  factory VpcSecurityGroupMembership.fromJson(Map<String, dynamic> json) =>
      _$VpcSecurityGroupMembershipFromJson(json);
}

class AccessDeniedFault extends _s.GenericAwsException {
  AccessDeniedFault({String type, String message})
      : super(type: type, code: 'AccessDeniedFault', message: message);
}

class InsufficientResourceCapacityFault extends _s.GenericAwsException {
  InsufficientResourceCapacityFault({String type, String message})
      : super(
            type: type,
            code: 'InsufficientResourceCapacityFault',
            message: message);
}

class InvalidCertificateFault extends _s.GenericAwsException {
  InvalidCertificateFault({String type, String message})
      : super(type: type, code: 'InvalidCertificateFault', message: message);
}

class InvalidResourceStateFault extends _s.GenericAwsException {
  InvalidResourceStateFault({String type, String message})
      : super(type: type, code: 'InvalidResourceStateFault', message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String type, String message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class KMSAccessDeniedFault extends _s.GenericAwsException {
  KMSAccessDeniedFault({String type, String message})
      : super(type: type, code: 'KMSAccessDeniedFault', message: message);
}

class KMSDisabledFault extends _s.GenericAwsException {
  KMSDisabledFault({String type, String message})
      : super(type: type, code: 'KMSDisabledFault', message: message);
}

class KMSInvalidStateFault extends _s.GenericAwsException {
  KMSInvalidStateFault({String type, String message})
      : super(type: type, code: 'KMSInvalidStateFault', message: message);
}

class KMSKeyNotAccessibleFault extends _s.GenericAwsException {
  KMSKeyNotAccessibleFault({String type, String message})
      : super(type: type, code: 'KMSKeyNotAccessibleFault', message: message);
}

class KMSNotFoundFault extends _s.GenericAwsException {
  KMSNotFoundFault({String type, String message})
      : super(type: type, code: 'KMSNotFoundFault', message: message);
}

class KMSThrottlingFault extends _s.GenericAwsException {
  KMSThrottlingFault({String type, String message})
      : super(type: type, code: 'KMSThrottlingFault', message: message);
}

class ReplicationSubnetGroupDoesNotCoverEnoughAZs
    extends _s.GenericAwsException {
  ReplicationSubnetGroupDoesNotCoverEnoughAZs({String type, String message})
      : super(
            type: type,
            code: 'ReplicationSubnetGroupDoesNotCoverEnoughAZs',
            message: message);
}

class ResourceAlreadyExistsFault extends _s.GenericAwsException {
  ResourceAlreadyExistsFault({String type, String message})
      : super(type: type, code: 'ResourceAlreadyExistsFault', message: message);
}

class ResourceNotFoundFault extends _s.GenericAwsException {
  ResourceNotFoundFault({String type, String message})
      : super(type: type, code: 'ResourceNotFoundFault', message: message);
}

class ResourceQuotaExceededFault extends _s.GenericAwsException {
  ResourceQuotaExceededFault({String type, String message})
      : super(type: type, code: 'ResourceQuotaExceededFault', message: message);
}

class SNSInvalidTopicFault extends _s.GenericAwsException {
  SNSInvalidTopicFault({String type, String message})
      : super(type: type, code: 'SNSInvalidTopicFault', message: message);
}

class SNSNoAuthorizationFault extends _s.GenericAwsException {
  SNSNoAuthorizationFault({String type, String message})
      : super(type: type, code: 'SNSNoAuthorizationFault', message: message);
}

class StorageQuotaExceededFault extends _s.GenericAwsException {
  StorageQuotaExceededFault({String type, String message})
      : super(type: type, code: 'StorageQuotaExceededFault', message: message);
}

class SubnetAlreadyInUse extends _s.GenericAwsException {
  SubnetAlreadyInUse({String type, String message})
      : super(type: type, code: 'SubnetAlreadyInUse', message: message);
}

class UpgradeDependencyFailureFault extends _s.GenericAwsException {
  UpgradeDependencyFailureFault({String type, String message})
      : super(
            type: type,
            code: 'UpgradeDependencyFailureFault',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedFault': (type, message) =>
      AccessDeniedFault(type: type, message: message),
  'InsufficientResourceCapacityFault': (type, message) =>
      InsufficientResourceCapacityFault(type: type, message: message),
  'InvalidCertificateFault': (type, message) =>
      InvalidCertificateFault(type: type, message: message),
  'InvalidResourceStateFault': (type, message) =>
      InvalidResourceStateFault(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'KMSAccessDeniedFault': (type, message) =>
      KMSAccessDeniedFault(type: type, message: message),
  'KMSDisabledFault': (type, message) =>
      KMSDisabledFault(type: type, message: message),
  'KMSInvalidStateFault': (type, message) =>
      KMSInvalidStateFault(type: type, message: message),
  'KMSKeyNotAccessibleFault': (type, message) =>
      KMSKeyNotAccessibleFault(type: type, message: message),
  'KMSNotFoundFault': (type, message) =>
      KMSNotFoundFault(type: type, message: message),
  'KMSThrottlingFault': (type, message) =>
      KMSThrottlingFault(type: type, message: message),
  'ReplicationSubnetGroupDoesNotCoverEnoughAZs': (type, message) =>
      ReplicationSubnetGroupDoesNotCoverEnoughAZs(type: type, message: message),
  'ResourceAlreadyExistsFault': (type, message) =>
      ResourceAlreadyExistsFault(type: type, message: message),
  'ResourceNotFoundFault': (type, message) =>
      ResourceNotFoundFault(type: type, message: message),
  'ResourceQuotaExceededFault': (type, message) =>
      ResourceQuotaExceededFault(type: type, message: message),
  'SNSInvalidTopicFault': (type, message) =>
      SNSInvalidTopicFault(type: type, message: message),
  'SNSNoAuthorizationFault': (type, message) =>
      SNSNoAuthorizationFault(type: type, message: message),
  'StorageQuotaExceededFault': (type, message) =>
      StorageQuotaExceededFault(type: type, message: message),
  'SubnetAlreadyInUse': (type, message) =>
      SubnetAlreadyInUse(type: type, message: message),
  'UpgradeDependencyFailureFault': (type, message) =>
      UpgradeDependencyFailureFault(type: type, message: message),
};
