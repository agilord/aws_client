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

/// AWS Database Migration Service (AWS DMS) can migrate your data to and from
/// the most widely used commercial and open-source databases such as Oracle,
/// PostgreSQL, Microsoft SQL Server, Amazon Redshift, MariaDB, Amazon Aurora,
/// MySQL, and SAP Adaptive Server Enterprise (ASE). The service supports
/// homogeneous migrations such as Oracle to Oracle, as well as heterogeneous
/// migrations between different database platforms, such as Oracle to MySQL or
/// SQL Server to PostgreSQL.
class DatabaseMigration {
  final _s.JsonProtocol _protocol;
  DatabaseMigration({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'dms',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds metadata tags to an AWS DMS resource, including replication instance,
  /// endpoint, security group, and migration task. These tags can also be used
  /// with cost allocation reporting to track cost associated with DMS
  /// resources, or used in a Condition statement in an IAM policy for DMS. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_Tag.html">
  /// <code>Tag</code> </a> data type description.
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
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.AddTagsToResource'
    };
    await _protocol.send(
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
    required String applyAction,
    required String optInType,
    required String replicationInstanceArn,
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

  /// Cancels a single premigration assessment run.
  ///
  /// This operation prevents any individual assessments from running if they
  /// haven't started running. It also attempts to cancel any individual
  /// assessments that are currently running.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationTaskAssessmentRunArn] :
  /// Amazon Resource Name (ARN) of the premigration assessment run to be
  /// canceled.
  Future<CancelReplicationTaskAssessmentRunResponse>
      cancelReplicationTaskAssessmentRun({
    required String replicationTaskAssessmentRunArn,
  }) async {
    ArgumentError.checkNotNull(
        replicationTaskAssessmentRunArn, 'replicationTaskAssessmentRunArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.CancelReplicationTaskAssessmentRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskAssessmentRunArn': replicationTaskAssessmentRunArn,
      },
    );

    return CancelReplicationTaskAssessmentRunResponse.fromJson(
        jsonResponse.body);
  }

  /// Creates an endpoint using the provided settings.
  ///
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [ResourceAlreadyExistsFault].
  /// May throw [ResourceQuotaExceededFault].
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [AccessDeniedFault].
  /// May throw [S3AccessDeniedFault].
  ///
  /// Parameter [endpointIdentifier] :
  /// The database endpoint identifier. Identifiers must begin with a letter and
  /// must contain only ASCII letters, digits, and hyphens. They can't end with
  /// a hyphen, or contain two consecutive hyphens.
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
  /// <code>"elasticsearch"</code>, <code>"docdb"</code>,
  /// <code>"sqlserver"</code>, and <code>"neptune"</code>.
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
  /// in the <i>AWS Database Migration Service User Guide</i>.
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
  /// Parameter [iBMDb2Settings] :
  /// Settings in JSON format for the source IBM Db2 LUW endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.DB2.html">Extra
  /// connection attributes when using Db2 LUW as a source for AWS DMS</a> in
  /// the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [kafkaSettings] :
  /// Settings in JSON format for the target Apache Kafka endpoint. For more
  /// information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html">Using
  /// Apache Kafka as a Target for AWS Database Migration Service</a> in the
  /// <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [kinesisSettings] :
  /// Settings in JSON format for the target endpoint for Amazon Kinesis Data
  /// Streams. For more information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html">Using
  /// Amazon Kinesis Data Streams as a Target for AWS Database Migration
  /// Service</a> in the <i>AWS Database Migration Service User Guide.</i>
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
  /// Parameter [microsoftSQLServerSettings] :
  /// Settings in JSON format for the source and target Microsoft SQL Server
  /// endpoint. For information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.SQLServer.html">Extra
  /// connection attributes when using SQL Server as a source for AWS DMS</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.SQLServer.html">
  /// Extra connection attributes when using SQL Server as a target for AWS
  /// DMS</a> in the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [mongoDbSettings] :
  /// Settings in JSON format for the source MongoDB endpoint. For more
  /// information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html#CHAP_Source.MongoDB.Configuration">Using
  /// MongoDB as a Target for AWS Database Migration Service</a> in the <i>AWS
  /// Database Migration Service User Guide.</i>
  ///
  /// Parameter [mySQLSettings] :
  /// Settings in JSON format for the source and target MySQL endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MySQL.html">Extra
  /// connection attributes when using MySQL as a source for AWS DMS</a> and <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.MySQL.html">Extra
  /// connection attributes when using a MySQL-compatible database as a target
  /// for AWS DMS</a> in the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [neptuneSettings] :
  /// Settings in JSON format for the target Amazon Neptune endpoint. For more
  /// information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html#CHAP_Target.Neptune.EndpointSettings">Specifying
  /// Endpoint Settings for Amazon Neptune as a Target</a> in the <i>AWS
  /// Database Migration Service User Guide.</i>
  ///
  /// Parameter [oracleSettings] :
  /// Settings in JSON format for the source and target Oracle endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html">Extra
  /// connection attributes when using Oracle as a source for AWS DMS</a> and <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Oracle.html">
  /// Extra connection attributes when using Oracle as a target for AWS DMS</a>
  /// in the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [password] :
  /// The password to be used to log in to the endpoint database.
  ///
  /// Parameter [port] :
  /// The port used by the endpoint database.
  ///
  /// Parameter [postgreSQLSettings] :
  /// Settings in JSON format for the source and target PostgreSQL endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html">Extra
  /// connection attributes when using PostgreSQL as a source for AWS DMS</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.PostgreSQL.html">
  /// Extra connection attributes when using PostgreSQL as a target for AWS
  /// DMS</a> in the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [resourceIdentifier] :
  /// A friendly name for the resource identifier at the end of the
  /// <code>EndpointArn</code> response parameter that is returned in the
  /// created <code>Endpoint</code> object. The value for this parameter can
  /// have up to 31 characters. It can contain only ASCII letters, digits, and
  /// hyphen ('-'). Also, it can't end with a hyphen or contain two consecutive
  /// hyphens, and can only begin with a letter, such as
  /// <code>Example-App-ARN1</code>. For example, this value might result in the
  /// <code>EndpointArn</code> value
  /// <code>arn:aws:dms:eu-west-1:012345678901:rep:Example-App-ARN1</code>. If
  /// you don't specify a <code>ResourceIdentifier</code> value, AWS DMS
  /// generates a default identifier value for the end of
  /// <code>EndpointArn</code>.
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
  /// Parameter [sybaseSettings] :
  /// Settings in JSON format for the source and target SAP ASE endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.SAP.html">Extra
  /// connection attributes when using SAP ASE as a source for AWS DMS</a> and
  /// <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.SAP.html">Extra
  /// connection attributes when using SAP ASE as a target for AWS DMS</a> in
  /// the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the endpoint.
  ///
  /// Parameter [username] :
  /// The user name to be used to log in to the endpoint database.
  Future<CreateEndpointResponse> createEndpoint({
    required String endpointIdentifier,
    required ReplicationEndpointTypeValue endpointType,
    required String engineName,
    String? certificateArn,
    String? databaseName,
    DmsTransferSettings? dmsTransferSettings,
    DocDbSettings? docDbSettings,
    DynamoDbSettings? dynamoDbSettings,
    ElasticsearchSettings? elasticsearchSettings,
    String? externalTableDefinition,
    String? extraConnectionAttributes,
    IBMDb2Settings? iBMDb2Settings,
    KafkaSettings? kafkaSettings,
    KinesisSettings? kinesisSettings,
    String? kmsKeyId,
    MicrosoftSQLServerSettings? microsoftSQLServerSettings,
    MongoDbSettings? mongoDbSettings,
    MySQLSettings? mySQLSettings,
    NeptuneSettings? neptuneSettings,
    OracleSettings? oracleSettings,
    String? password,
    int? port,
    PostgreSQLSettings? postgreSQLSettings,
    RedshiftSettings? redshiftSettings,
    String? resourceIdentifier,
    S3Settings? s3Settings,
    String? serverName,
    String? serviceAccessRoleArn,
    DmsSslModeValue? sslMode,
    SybaseSettings? sybaseSettings,
    List<Tag>? tags,
    String? username,
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
        'EndpointType': endpointType.toValue(),
        'EngineName': engineName,
        if (certificateArn != null) 'CertificateArn': certificateArn,
        if (databaseName != null) 'DatabaseName': databaseName,
        if (dmsTransferSettings != null)
          'DmsTransferSettings': dmsTransferSettings,
        if (docDbSettings != null) 'DocDbSettings': docDbSettings,
        if (dynamoDbSettings != null) 'DynamoDbSettings': dynamoDbSettings,
        if (elasticsearchSettings != null)
          'ElasticsearchSettings': elasticsearchSettings,
        if (externalTableDefinition != null)
          'ExternalTableDefinition': externalTableDefinition,
        if (extraConnectionAttributes != null)
          'ExtraConnectionAttributes': extraConnectionAttributes,
        if (iBMDb2Settings != null) 'IBMDb2Settings': iBMDb2Settings,
        if (kafkaSettings != null) 'KafkaSettings': kafkaSettings,
        if (kinesisSettings != null) 'KinesisSettings': kinesisSettings,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (microsoftSQLServerSettings != null)
          'MicrosoftSQLServerSettings': microsoftSQLServerSettings,
        if (mongoDbSettings != null) 'MongoDbSettings': mongoDbSettings,
        if (mySQLSettings != null) 'MySQLSettings': mySQLSettings,
        if (neptuneSettings != null) 'NeptuneSettings': neptuneSettings,
        if (oracleSettings != null) 'OracleSettings': oracleSettings,
        if (password != null) 'Password': password,
        if (port != null) 'Port': port,
        if (postgreSQLSettings != null)
          'PostgreSQLSettings': postgreSQLSettings,
        if (redshiftSettings != null) 'RedshiftSettings': redshiftSettings,
        if (resourceIdentifier != null)
          'ResourceIdentifier': resourceIdentifier,
        if (s3Settings != null) 'S3Settings': s3Settings,
        if (serverName != null) 'ServerName': serverName,
        if (serviceAccessRoleArn != null)
          'ServiceAccessRoleArn': serviceAccessRoleArn,
        if (sslMode != null) 'SslMode': sslMode.toValue(),
        if (sybaseSettings != null) 'SybaseSettings': sybaseSettings,
        if (tags != null) 'Tags': tags,
        if (username != null) 'Username': username,
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
    required String snsTopicArn,
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    List<String>? sourceIds,
    String? sourceType,
    List<Tag>? tags,
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
        if (enabled != null) 'Enabled': enabled,
        if (eventCategories != null) 'EventCategories': eventCategories,
        if (sourceIds != null) 'SourceIds': sourceIds,
        if (sourceType != null) 'SourceType': sourceType,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateEventSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Creates the replication instance using the specified parameters.
  ///
  /// AWS DMS requires that your account have certain roles with appropriate
  /// permissions before you can create a replication instance. For information
  /// on the required roles, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#CHAP_Security.APIRole">Creating
  /// the IAM Roles to Use With the AWS CLI and AWS DMS API</a>. For information
  /// on the required permissions, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#CHAP_Security.IAMPermissions">IAM
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
  /// The compute and memory capacity of the replication instance as defined for
  /// the specified replication instance class. For example to specify the
  /// instance class dms.c4.large, set this parameter to
  /// <code>"dms.c4.large"</code>.
  ///
  /// For more information on the settings and capacities for the available
  /// replication instance classes, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth">
  /// Selecting the right AWS DMS replication instance for your migration</a>.
  ///
  /// Parameter [replicationInstanceIdentifier] :
  /// The replication instance identifier. This parameter is stored as a
  /// lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1-63 alphanumeric characters or hyphens.
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
  /// A list of custom DNS name servers supported for the replication instance
  /// to access your on-premise source or target database. This list overrides
  /// the default name servers supported by the replication instance. You can
  /// specify a comma-separated list of internet addresses for up to four
  /// on-premise DNS name servers. For example:
  /// <code>"1.1.1.1,2.2.2.2,3.3.3.3,4.4.4.4"</code>
  ///
  /// Parameter [engineVersion] :
  /// The engine version number of the replication instance.
  ///
  /// If an engine version number is not specified when a replication instance
  /// is created, the default is the latest engine version available.
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
  /// Parameter [resourceIdentifier] :
  /// A friendly name for the resource identifier at the end of the
  /// <code>EndpointArn</code> response parameter that is returned in the
  /// created <code>Endpoint</code> object. The value for this parameter can
  /// have up to 31 characters. It can contain only ASCII letters, digits, and
  /// hyphen ('-'). Also, it can't end with a hyphen or contain two consecutive
  /// hyphens, and can only begin with a letter, such as
  /// <code>Example-App-ARN1</code>. For example, this value might result in the
  /// <code>EndpointArn</code> value
  /// <code>arn:aws:dms:eu-west-1:012345678901:rep:Example-App-ARN1</code>. If
  /// you don't specify a <code>ResourceIdentifier</code> value, AWS DMS
  /// generates a default identifier value for the end of
  /// <code>EndpointArn</code>.
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the replication instance.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// Specifies the VPC security group to be used with the replication instance.
  /// The VPC security group must work with the VPC containing the replication
  /// instance.
  Future<CreateReplicationInstanceResponse> createReplicationInstance({
    required String replicationInstanceClass,
    required String replicationInstanceIdentifier,
    int? allocatedStorage,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    String? dnsNameServers,
    String? engineVersion,
    String? kmsKeyId,
    bool? multiAZ,
    String? preferredMaintenanceWindow,
    bool? publiclyAccessible,
    String? replicationSubnetGroupIdentifier,
    String? resourceIdentifier,
    List<Tag>? tags,
    List<String>? vpcSecurityGroupIds,
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
        if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
        if (autoMinorVersionUpgrade != null)
          'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
        if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
        if (dnsNameServers != null) 'DnsNameServers': dnsNameServers,
        if (engineVersion != null) 'EngineVersion': engineVersion,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (multiAZ != null) 'MultiAZ': multiAZ,
        if (preferredMaintenanceWindow != null)
          'PreferredMaintenanceWindow': preferredMaintenanceWindow,
        if (publiclyAccessible != null)
          'PubliclyAccessible': publiclyAccessible,
        if (replicationSubnetGroupIdentifier != null)
          'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
        if (resourceIdentifier != null)
          'ResourceIdentifier': resourceIdentifier,
        if (tags != null) 'Tags': tags,
        if (vpcSecurityGroupIds != null)
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
    required String replicationSubnetGroupDescription,
    required String replicationSubnetGroupIdentifier,
    required List<String> subnetIds,
    List<Tag>? tags,
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
        if (tags != null) 'Tags': tags,
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
  /// Must contain 1-255 alphanumeric characters or hyphens.
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
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.html">Using
  /// Table Mapping to Specify Task Settings</a> in the <i>AWS Database
  /// Migration Service User Guide.</i>
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
  /// Server time example: --cdc-stop-position “server_time:2018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 2018-02-09T12:12:12
  /// “
  ///
  /// Parameter [replicationTaskSettings] :
  /// Overall settings for the task, in JSON format. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.html">Specifying
  /// Task Settings for AWS Database Migration Service Tasks</a> in the <i>AWS
  /// Database Migration User Guide.</i>
  ///
  /// Parameter [resourceIdentifier] :
  /// A friendly name for the resource identifier at the end of the
  /// <code>EndpointArn</code> response parameter that is returned in the
  /// created <code>Endpoint</code> object. The value for this parameter can
  /// have up to 31 characters. It can contain only ASCII letters, digits, and
  /// hyphen ('-'). Also, it can't end with a hyphen or contain two consecutive
  /// hyphens, and can only begin with a letter, such as
  /// <code>Example-App-ARN1</code>. For example, this value might result in the
  /// <code>EndpointArn</code> value
  /// <code>arn:aws:dms:eu-west-1:012345678901:rep:Example-App-ARN1</code>. If
  /// you don't specify a <code>ResourceIdentifier</code> value, AWS DMS
  /// generates a default identifier value for the end of
  /// <code>EndpointArn</code>.
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the replication task.
  ///
  /// Parameter [taskData] :
  /// Supplemental information that the task requires to migrate the data for
  /// certain source and target endpoints. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html">Specifying
  /// Supplemental Data for Task Settings</a> in the <i>AWS Database Migration
  /// Service User Guide.</i>
  Future<CreateReplicationTaskResponse> createReplicationTask({
    required MigrationTypeValue migrationType,
    required String replicationInstanceArn,
    required String replicationTaskIdentifier,
    required String sourceEndpointArn,
    required String tableMappings,
    required String targetEndpointArn,
    String? cdcStartPosition,
    DateTime? cdcStartTime,
    String? cdcStopPosition,
    String? replicationTaskSettings,
    String? resourceIdentifier,
    List<Tag>? tags,
    String? taskData,
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
        'MigrationType': migrationType.toValue(),
        'ReplicationInstanceArn': replicationInstanceArn,
        'ReplicationTaskIdentifier': replicationTaskIdentifier,
        'SourceEndpointArn': sourceEndpointArn,
        'TableMappings': tableMappings,
        'TargetEndpointArn': targetEndpointArn,
        if (cdcStartPosition != null) 'CdcStartPosition': cdcStartPosition,
        if (cdcStartTime != null)
          'CdcStartTime': unixTimestampToJson(cdcStartTime),
        if (cdcStopPosition != null) 'CdcStopPosition': cdcStopPosition,
        if (replicationTaskSettings != null)
          'ReplicationTaskSettings': replicationTaskSettings,
        if (resourceIdentifier != null)
          'ResourceIdentifier': resourceIdentifier,
        if (tags != null) 'Tags': tags,
        if (taskData != null) 'TaskData': taskData,
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
    required String certificateArn,
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
    required String endpointArn,
    required String replicationInstanceArn,
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
    required String endpointArn,
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
    required String subscriptionName,
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
    required String replicationInstanceArn,
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
    required String replicationSubnetGroupIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        replicationSubnetGroupIdentifier, 'replicationSubnetGroupIdentifier');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DeleteReplicationSubnetGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
      },
    );
  }

  /// Deletes the specified replication task.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name (ARN) of the replication task to be deleted.
  Future<DeleteReplicationTaskResponse> deleteReplicationTask({
    required String replicationTaskArn,
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

  /// Deletes the record of a single premigration assessment run.
  ///
  /// This operation removes all metadata that AWS DMS maintains about this
  /// assessment run. However, the operation leaves untouched all information
  /// about this assessment run that is stored in your Amazon S3 bucket.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationTaskAssessmentRunArn] :
  /// Amazon Resource Name (ARN) of the premigration assessment run to be
  /// deleted.
  Future<DeleteReplicationTaskAssessmentRunResponse>
      deleteReplicationTaskAssessmentRun({
    required String replicationTaskAssessmentRunArn,
  }) async {
    ArgumentError.checkNotNull(
        replicationTaskAssessmentRunArn, 'replicationTaskAssessmentRunArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DeleteReplicationTaskAssessmentRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskAssessmentRunArn': replicationTaskAssessmentRunArn,
      },
    );

    return DeleteReplicationTaskAssessmentRunResponse.fromJson(
        jsonResponse.body);
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

  /// Provides a list of individual assessments that you can specify for a new
  /// premigration assessment run, given one or more parameters.
  ///
  /// If you specify an existing migration task, this operation provides the
  /// default individual assessments you can specify for that task. Otherwise,
  /// the specified parameters model elements of a possible migration task on
  /// which to base a premigration assessment run.
  ///
  /// To use these migration task modeling parameters, you must specify an
  /// existing replication instance, a source database engine, a target database
  /// engine, and a migration type. This combination of parameters potentially
  /// limits the default individual assessments available for an assessment run
  /// created for a corresponding migration task.
  ///
  /// If you specify no parameters, this operation provides a list of all
  /// possible individual assessments that you can specify for an assessment
  /// run. If you specify any one of the task modeling parameters, you must
  /// specify all of them or the operation cannot provide a list of individual
  /// assessments. The only parameter that you can specify alone is for an
  /// existing migration task. The specified task definition then determines the
  /// default list of individual assessments that you can specify in an
  /// assessment run for the task.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [marker] :
  /// Optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [maxRecords] :
  /// Maximum number of records to include in the response. If more records
  /// exist than the specified <code>MaxRecords</code> value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Parameter [migrationType] :
  /// Name of the migration type that each provided individual assessment must
  /// support.
  ///
  /// Parameter [replicationInstanceArn] :
  /// ARN of a replication instance on which you want to base the default list
  /// of individual assessments.
  ///
  /// Parameter [replicationTaskArn] :
  /// Amazon Resource Name (ARN) of a migration task on which you want to base
  /// the default list of individual assessments.
  ///
  /// Parameter [sourceEngineName] :
  /// Name of a database engine that the specified replication instance supports
  /// as a source.
  ///
  /// Parameter [targetEngineName] :
  /// Name of a database engine that the specified replication instance supports
  /// as a target.
  Future<DescribeApplicableIndividualAssessmentsResponse>
      describeApplicableIndividualAssessments({
    String? marker,
    int? maxRecords,
    MigrationTypeValue? migrationType,
    String? replicationInstanceArn,
    String? replicationTaskArn,
    String? sourceEngineName,
    String? targetEngineName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonDMSv20160101.DescribeApplicableIndividualAssessments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
        if (migrationType != null) 'MigrationType': migrationType.toValue(),
        if (replicationInstanceArn != null)
          'ReplicationInstanceArn': replicationInstanceArn,
        if (replicationTaskArn != null)
          'ReplicationTaskArn': replicationTaskArn,
        if (sourceEngineName != null) 'SourceEngineName': sourceEngineName,
        if (targetEngineName != null) 'TargetEngineName': targetEngineName,
      },
    );

    return DescribeApplicableIndividualAssessmentsResponse.fromJson(
        jsonResponse.body);
  }

  /// Provides a description of the certificate.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to the certificates described in the form of key-value
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
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
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
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
      },
    );

    return DescribeConnectionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the possible endpoint settings available when
  /// you create an endpoint for a specific database engine.
  ///
  /// Parameter [engineName] :
  /// The databse engine used for your source or target endpoint.
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
  Future<DescribeEndpointSettingsResponse> describeEndpointSettings({
    required String engineName,
    String? marker,
    int? maxRecords,
  }) async {
    ArgumentError.checkNotNull(engineName, 'engineName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeEndpointSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EngineName': engineName,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
      },
    );

    return DescribeEndpointSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the type of endpoints available.
  ///
  /// Parameter [filters] :
  /// Filters applied to the endpoint types.
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
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
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
  /// Filters applied to the endpoints.
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
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
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
  /// Filters applied to the event categories.
  ///
  /// Parameter [sourceType] :
  /// The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-task
  Future<DescribeEventCategoriesResponse> describeEventCategories({
    List<Filter>? filters,
    String? sourceType,
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
        if (filters != null) 'Filters': filters,
        if (sourceType != null) 'SourceType': sourceType,
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
  /// Filters applied to event subscriptions.
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
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? subscriptionName,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
        if (subscriptionName != null) 'SubscriptionName': subscriptionName,
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
  /// Filters applied to events.
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
    int? duration,
    DateTime? endTime,
    List<String>? eventCategories,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? sourceIdentifier,
    SourceType? sourceType,
    DateTime? startTime,
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
        if (duration != null) 'Duration': duration,
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (eventCategories != null) 'EventCategories': eventCategories,
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
        if (sourceIdentifier != null) 'SourceIdentifier': sourceIdentifier,
        if (sourceType != null) 'SourceType': sourceType.toValue(),
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
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
    String? marker,
    int? maxRecords,
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
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
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
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    String? replicationInstanceArn,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
        if (replicationInstanceArn != null)
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
    required String endpointArn,
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
    required String replicationInstanceArn,
    String? marker,
    int? maxRecords,
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
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
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
  /// Filters applied to replication instances.
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
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
      },
    );

    return DescribeReplicationInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the replication subnet groups.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to replication subnet groups.
  ///
  /// Valid filter names: replication-subnet-group-id
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
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
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
    String? marker,
    int? maxRecords,
    String? replicationTaskArn,
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
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
        if (replicationTaskArn != null)
          'ReplicationTaskArn': replicationTaskArn,
      },
    );

    return DescribeReplicationTaskAssessmentResultsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a paginated list of premigration assessment runs based on filter
  /// settings.
  ///
  /// These filter settings can specify a combination of premigration assessment
  /// runs, migration tasks, replication instances, and assessment run status
  /// values.
  /// <note>
  /// This operation doesn't return information about individual assessments.
  /// For this information, see the
  /// <code>DescribeReplicationTaskIndividualAssessments</code> operation.
  /// </note>
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to the premigration assessment runs described in the form
  /// of key-value pairs.
  ///
  /// Valid filter names: <code>replication-task-assessment-run-arn</code>,
  /// <code>replication-task-arn</code>, <code>replication-instance-arn</code>,
  /// <code>status</code>
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
  Future<DescribeReplicationTaskAssessmentRunsResponse>
      describeReplicationTaskAssessmentRuns({
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.DescribeReplicationTaskAssessmentRuns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
      },
    );

    return DescribeReplicationTaskAssessmentRunsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a paginated list of individual assessments based on filter
  /// settings.
  ///
  /// These filter settings can specify a combination of premigration assessment
  /// runs, migration tasks, and assessment status values.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to the individual assessments described in the form of
  /// key-value pairs.
  ///
  /// Valid filter names: <code>replication-task-assessment-run-arn</code>,
  /// <code>replication-task-arn</code>, <code>status</code>
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
  Future<DescribeReplicationTaskIndividualAssessmentsResponse>
      describeReplicationTaskIndividualAssessments({
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonDMSv20160101.DescribeReplicationTaskIndividualAssessments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
      },
    );

    return DescribeReplicationTaskIndividualAssessmentsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns information about replication tasks for your account in the
  /// current region.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [filters] :
  /// Filters applied to replication tasks.
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
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
    bool? withoutSettings,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
        if (withoutSettings != null) 'WithoutSettings': withoutSettings,
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
    required String endpointArn,
    String? marker,
    int? maxRecords,
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
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
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
  /// Filters applied to table statistics.
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
    required String replicationTaskArn,
    List<Filter>? filters,
    String? marker,
    int? maxRecords,
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
        if (filters != null) 'Filters': filters,
        if (marker != null) 'Marker': marker,
        if (maxRecords != null) 'MaxRecords': maxRecords,
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
    required String certificateIdentifier,
    String? certificatePem,
    Uint8List? certificateWallet,
    List<Tag>? tags,
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
        if (certificatePem != null) 'CertificatePem': certificatePem,
        if (certificateWallet != null)
          'CertificateWallet': base64Encode(certificateWallet),
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Lists all metadata tags attached to an AWS DMS resource, including
  /// replication instance, endpoint, security group, and migration task. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_Tag.html">
  /// <code>Tag</code> </a> data type description.
  ///
  /// May throw [ResourceNotFoundFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the AWS DMS
  /// resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
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
  /// Parameter [docDbSettings] :
  /// Settings in JSON format for the source DocumentDB endpoint. For more
  /// information about the available settings, see the configuration properties
  /// section in <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.DocumentDB.html">
  /// Using DocumentDB as a Target for AWS Database Migration Service</a> in the
  /// <i>AWS Database Migration Service User Guide.</i>
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
  /// in the <i>AWS Database Migration Service User Guide.</i>
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
  /// <code>"elasticsearch"</code>, <code>"documentdb"</code>,
  /// <code>"sqlserver"</code>, and <code>"neptune"</code>.
  ///
  /// Parameter [externalTableDefinition] :
  /// The external table definition.
  ///
  /// Parameter [extraConnectionAttributes] :
  /// Additional attributes associated with the connection. To reset this
  /// parameter, pass the empty string ("") as an argument.
  ///
  /// Parameter [iBMDb2Settings] :
  /// Settings in JSON format for the source IBM Db2 LUW endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.DB2.ConnectionAttrib">Extra
  /// connection attributes when using Db2 LUW as a source for AWS DMS</a> in
  /// the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [kafkaSettings] :
  /// Settings in JSON format for the target Apache Kafka endpoint. For more
  /// information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html">Using
  /// Apache Kafka as a Target for AWS Database Migration Service</a> in the
  /// <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [kinesisSettings] :
  /// Settings in JSON format for the target endpoint for Amazon Kinesis Data
  /// Streams. For more information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html">Using
  /// Amazon Kinesis Data Streams as a Target for AWS Database Migration
  /// Service</a> in the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [microsoftSQLServerSettings] :
  /// Settings in JSON format for the source and target Microsoft SQL Server
  /// endpoint. For information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.SQLServer.ConnectionAttrib">Extra
  /// connection attributes when using SQL Server as a source for AWS DMS</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.SQLServer.ConnectionAttrib">
  /// Extra connection attributes when using SQL Server as a target for AWS
  /// DMS</a> in the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [mongoDbSettings] :
  /// Settings in JSON format for the source MongoDB endpoint. For more
  /// information about the available settings, see the configuration properties
  /// section in <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html">
  /// Using MongoDB as a Target for AWS Database Migration Service</a> in the
  /// <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [mySQLSettings] :
  /// Settings in JSON format for the source and target MySQL endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MySQL.ConnectionAttrib">Extra
  /// connection attributes when using MySQL as a source for AWS DMS</a> and <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.MySQL.ConnectionAttrib">Extra
  /// connection attributes when using a MySQL-compatible database as a target
  /// for AWS DMS</a> in the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [neptuneSettings] :
  /// Settings in JSON format for the target Amazon Neptune endpoint. For more
  /// information about the available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html#CHAP_Target.Neptune.EndpointSettings">Specifying
  /// Endpoint Settings for Amazon Neptune as a Target</a> in the <i>AWS
  /// Database Migration Service User Guide.</i>
  ///
  /// Parameter [oracleSettings] :
  /// Settings in JSON format for the source and target Oracle endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.ConnectionAttrib">Extra
  /// connection attributes when using Oracle as a source for AWS DMS</a> and <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Oracle.ConnectionAttrib">
  /// Extra connection attributes when using Oracle as a target for AWS DMS</a>
  /// in the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [password] :
  /// The password to be used to login to the endpoint database.
  ///
  /// Parameter [port] :
  /// The port used by the endpoint database.
  ///
  /// Parameter [postgreSQLSettings] :
  /// Settings in JSON format for the source and target PostgreSQL endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.ConnectionAttrib">Extra
  /// connection attributes when using PostgreSQL as a source for AWS DMS</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.PostgreSQL.ConnectionAttrib">
  /// Extra connection attributes when using PostgreSQL as a target for AWS
  /// DMS</a> in the <i>AWS Database Migration Service User Guide.</i>
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
  /// Parameter [sybaseSettings] :
  /// Settings in JSON format for the source and target SAP ASE endpoint. For
  /// information about other available settings, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.SAP.ConnectionAttrib">Extra
  /// connection attributes when using SAP ASE as a source for AWS DMS</a> and
  /// <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.SAP.ConnectionAttrib">Extra
  /// connection attributes when using SAP ASE as a target for AWS DMS</a> in
  /// the <i>AWS Database Migration Service User Guide.</i>
  ///
  /// Parameter [username] :
  /// The user name to be used to login to the endpoint database.
  Future<ModifyEndpointResponse> modifyEndpoint({
    required String endpointArn,
    String? certificateArn,
    String? databaseName,
    DmsTransferSettings? dmsTransferSettings,
    DocDbSettings? docDbSettings,
    DynamoDbSettings? dynamoDbSettings,
    ElasticsearchSettings? elasticsearchSettings,
    String? endpointIdentifier,
    ReplicationEndpointTypeValue? endpointType,
    String? engineName,
    String? externalTableDefinition,
    String? extraConnectionAttributes,
    IBMDb2Settings? iBMDb2Settings,
    KafkaSettings? kafkaSettings,
    KinesisSettings? kinesisSettings,
    MicrosoftSQLServerSettings? microsoftSQLServerSettings,
    MongoDbSettings? mongoDbSettings,
    MySQLSettings? mySQLSettings,
    NeptuneSettings? neptuneSettings,
    OracleSettings? oracleSettings,
    String? password,
    int? port,
    PostgreSQLSettings? postgreSQLSettings,
    RedshiftSettings? redshiftSettings,
    S3Settings? s3Settings,
    String? serverName,
    String? serviceAccessRoleArn,
    DmsSslModeValue? sslMode,
    SybaseSettings? sybaseSettings,
    String? username,
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
        if (certificateArn != null) 'CertificateArn': certificateArn,
        if (databaseName != null) 'DatabaseName': databaseName,
        if (dmsTransferSettings != null)
          'DmsTransferSettings': dmsTransferSettings,
        if (docDbSettings != null) 'DocDbSettings': docDbSettings,
        if (dynamoDbSettings != null) 'DynamoDbSettings': dynamoDbSettings,
        if (elasticsearchSettings != null)
          'ElasticsearchSettings': elasticsearchSettings,
        if (endpointIdentifier != null)
          'EndpointIdentifier': endpointIdentifier,
        if (endpointType != null) 'EndpointType': endpointType.toValue(),
        if (engineName != null) 'EngineName': engineName,
        if (externalTableDefinition != null)
          'ExternalTableDefinition': externalTableDefinition,
        if (extraConnectionAttributes != null)
          'ExtraConnectionAttributes': extraConnectionAttributes,
        if (iBMDb2Settings != null) 'IBMDb2Settings': iBMDb2Settings,
        if (kafkaSettings != null) 'KafkaSettings': kafkaSettings,
        if (kinesisSettings != null) 'KinesisSettings': kinesisSettings,
        if (microsoftSQLServerSettings != null)
          'MicrosoftSQLServerSettings': microsoftSQLServerSettings,
        if (mongoDbSettings != null) 'MongoDbSettings': mongoDbSettings,
        if (mySQLSettings != null) 'MySQLSettings': mySQLSettings,
        if (neptuneSettings != null) 'NeptuneSettings': neptuneSettings,
        if (oracleSettings != null) 'OracleSettings': oracleSettings,
        if (password != null) 'Password': password,
        if (port != null) 'Port': port,
        if (postgreSQLSettings != null)
          'PostgreSQLSettings': postgreSQLSettings,
        if (redshiftSettings != null) 'RedshiftSettings': redshiftSettings,
        if (s3Settings != null) 'S3Settings': s3Settings,
        if (serverName != null) 'ServerName': serverName,
        if (serviceAccessRoleArn != null)
          'ServiceAccessRoleArn': serviceAccessRoleArn,
        if (sslMode != null) 'SslMode': sslMode.toValue(),
        if (sybaseSettings != null) 'SybaseSettings': sybaseSettings,
        if (username != null) 'Username': username,
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
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    String? snsTopicArn,
    String? sourceType,
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
        if (enabled != null) 'Enabled': enabled,
        if (eventCategories != null) 'EventCategories': eventCategories,
        if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
        if (sourceType != null) 'SourceType': sourceType,
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
  /// described following. The change is asynchronously applied as soon as
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
  /// When modifying a major engine version of an instance, also set
  /// <code>AllowMajorVersionUpgrade</code> to <code>true</code>.
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
  /// The compute and memory capacity of the replication instance as defined for
  /// the specified replication instance class. For example to specify the
  /// instance class dms.c4.large, set this parameter to
  /// <code>"dms.c4.large"</code>.
  ///
  /// For more information on the settings and capacities for the available
  /// replication instance classes, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth">
  /// Selecting the right AWS DMS replication instance for your migration</a>.
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
    required String replicationInstanceArn,
    int? allocatedStorage,
    bool? allowMajorVersionUpgrade,
    bool? applyImmediately,
    bool? autoMinorVersionUpgrade,
    String? engineVersion,
    bool? multiAZ,
    String? preferredMaintenanceWindow,
    String? replicationInstanceClass,
    String? replicationInstanceIdentifier,
    List<String>? vpcSecurityGroupIds,
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
        if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
        if (allowMajorVersionUpgrade != null)
          'AllowMajorVersionUpgrade': allowMajorVersionUpgrade,
        if (applyImmediately != null) 'ApplyImmediately': applyImmediately,
        if (autoMinorVersionUpgrade != null)
          'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
        if (engineVersion != null) 'EngineVersion': engineVersion,
        if (multiAZ != null) 'MultiAZ': multiAZ,
        if (preferredMaintenanceWindow != null)
          'PreferredMaintenanceWindow': preferredMaintenanceWindow,
        if (replicationInstanceClass != null)
          'ReplicationInstanceClass': replicationInstanceClass,
        if (replicationInstanceIdentifier != null)
          'ReplicationInstanceIdentifier': replicationInstanceIdentifier,
        if (vpcSecurityGroupIds != null)
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
    required String replicationSubnetGroupIdentifier,
    required List<String> subnetIds,
    String? replicationSubnetGroupDescription,
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
        if (replicationSubnetGroupDescription != null)
          'ReplicationSubnetGroupDescription':
              replicationSubnetGroupDescription,
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
  /// Server time example: --cdc-stop-position “server_time:2018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 2018-02-09T12:12:12
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
  /// Must contain 1-255 alphanumeric characters or hyphens.
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
  /// JSON file that contains settings for the task, such as task metadata
  /// settings.
  ///
  /// Parameter [tableMappings] :
  /// When using the AWS CLI or boto3, provide the path of the JSON file that
  /// contains the table mappings. Precede the path with <code>file://</code>.
  /// For example, <code>--table-mappings file://mappingfile.json</code>. When
  /// working with the DMS API, provide the JSON as the parameter value.
  ///
  /// Parameter [taskData] :
  /// Supplemental information that the task requires to migrate the data for
  /// certain source and target endpoints. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html">Specifying
  /// Supplemental Data for Task Settings</a> in the <i>AWS Database Migration
  /// Service User Guide.</i>
  Future<ModifyReplicationTaskResponse> modifyReplicationTask({
    required String replicationTaskArn,
    String? cdcStartPosition,
    DateTime? cdcStartTime,
    String? cdcStopPosition,
    MigrationTypeValue? migrationType,
    String? replicationTaskIdentifier,
    String? replicationTaskSettings,
    String? tableMappings,
    String? taskData,
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
        if (cdcStartPosition != null) 'CdcStartPosition': cdcStartPosition,
        if (cdcStartTime != null)
          'CdcStartTime': unixTimestampToJson(cdcStartTime),
        if (cdcStopPosition != null) 'CdcStopPosition': cdcStopPosition,
        if (migrationType != null) 'MigrationType': migrationType.toValue(),
        if (replicationTaskIdentifier != null)
          'ReplicationTaskIdentifier': replicationTaskIdentifier,
        if (replicationTaskSettings != null)
          'ReplicationTaskSettings': replicationTaskSettings,
        if (tableMappings != null) 'TableMappings': tableMappings,
        if (taskData != null) 'TaskData': taskData,
      },
    );

    return ModifyReplicationTaskResponse.fromJson(jsonResponse.body);
  }

  /// Moves a replication task from its current replication instance to a
  /// different target replication instance using the specified parameters. The
  /// target replication instance must be created with the same or later AWS DMS
  /// version as the current replication instance.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [InvalidResourceStateFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name (ARN) of the task that you want to move.
  ///
  /// Parameter [targetReplicationInstanceArn] :
  /// The ARN of the replication instance where you want to move the task to.
  Future<MoveReplicationTaskResponse> moveReplicationTask({
    required String replicationTaskArn,
    required String targetReplicationInstanceArn,
  }) async {
    ArgumentError.checkNotNull(replicationTaskArn, 'replicationTaskArn');
    ArgumentError.checkNotNull(
        targetReplicationInstanceArn, 'targetReplicationInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.MoveReplicationTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationTaskArn': replicationTaskArn,
        'TargetReplicationInstanceArn': targetReplicationInstanceArn,
      },
    );

    return MoveReplicationTaskResponse.fromJson(jsonResponse.body);
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
    required String replicationInstanceArn,
    bool? forceFailover,
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
        if (forceFailover != null) 'ForceFailover': forceFailover,
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
    required String endpointArn,
    required String replicationInstanceArn,
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
    required String replicationTaskArn,
    required List<TableToReload> tablesToReload,
    ReloadOptionValue? reloadOption,
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
        if (reloadOption != null) 'ReloadOption': reloadOption.toValue(),
      },
    );

    return ReloadTablesResponse.fromJson(jsonResponse.body);
  }

  /// Removes metadata tags from an AWS DMS resource, including replication
  /// instance, endpoint, security group, and migration task. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_Tag.html">
  /// <code>Tag</code> </a> data type description.
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.RemoveTagsFromResource'
    };
    await _protocol.send(
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
  /// A type of replication task.
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
  /// Server time example: --cdc-stop-position “server_time:2018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 2018-02-09T12:12:12
  /// “
  Future<StartReplicationTaskResponse> startReplicationTask({
    required String replicationTaskArn,
    required StartReplicationTaskTypeValue startReplicationTaskType,
    String? cdcStartPosition,
    DateTime? cdcStartTime,
    String? cdcStopPosition,
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
        'StartReplicationTaskType': startReplicationTaskType.toValue(),
        if (cdcStartPosition != null) 'CdcStartPosition': cdcStartPosition,
        if (cdcStartTime != null)
          'CdcStartTime': unixTimestampToJson(cdcStartTime),
        if (cdcStopPosition != null) 'CdcStopPosition': cdcStopPosition,
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
    required String replicationTaskArn,
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

  /// Starts a new premigration assessment run for one or more individual
  /// assessments of a migration task.
  ///
  /// The assessments that you can specify depend on the source and target
  /// database engine and the migration type defined for the given task. To run
  /// this operation, your migration task must already be created. After you run
  /// this operation, you can review the status of each individual assessment.
  /// You can also run the migration task manually after the assessment run and
  /// its individual assessments complete.
  ///
  /// May throw [AccessDeniedFault].
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  /// May throw [KMSAccessDeniedFault].
  /// May throw [KMSDisabledFault].
  /// May throw [KMSFault].
  /// May throw [KMSInvalidStateFault].
  /// May throw [KMSNotFoundFault].
  /// May throw [KMSKeyNotAccessibleFault].
  /// May throw [S3AccessDeniedFault].
  /// May throw [S3ResourceNotFoundFault].
  /// May throw [ResourceAlreadyExistsFault].
  ///
  /// Parameter [assessmentRunName] :
  /// Unique name to identify the assessment run.
  ///
  /// Parameter [replicationTaskArn] :
  /// Amazon Resource Name (ARN) of the migration task associated with the
  /// premigration assessment run that you want to start.
  ///
  /// Parameter [resultLocationBucket] :
  /// Amazon S3 bucket where you want AWS DMS to store the results of this
  /// assessment run.
  ///
  /// Parameter [serviceAccessRoleArn] :
  /// ARN of a service role needed to start the assessment run.
  ///
  /// Parameter [exclude] :
  /// Space-separated list of names for specific individual assessments that you
  /// want to exclude. These names come from the default list of individual
  /// assessments that AWS DMS supports for the associated migration task. This
  /// task is specified by <code>ReplicationTaskArn</code>.
  /// <note>
  /// You can't set a value for <code>Exclude</code> if you also set a value for
  /// <code>IncludeOnly</code> in the API operation.
  ///
  /// To identify the names of the default individual assessments that AWS DMS
  /// supports for the associated migration task, run the
  /// <code>DescribeApplicableIndividualAssessments</code> operation using its
  /// own <code>ReplicationTaskArn</code> request parameter.
  /// </note>
  ///
  /// Parameter [includeOnly] :
  /// Space-separated list of names for specific individual assessments that you
  /// want to include. These names come from the default list of individual
  /// assessments that AWS DMS supports for the associated migration task. This
  /// task is specified by <code>ReplicationTaskArn</code>.
  /// <note>
  /// You can't set a value for <code>IncludeOnly</code> if you also set a value
  /// for <code>Exclude</code> in the API operation.
  ///
  /// To identify the names of the default individual assessments that AWS DMS
  /// supports for the associated migration task, run the
  /// <code>DescribeApplicableIndividualAssessments</code> operation using its
  /// own <code>ReplicationTaskArn</code> request parameter.
  /// </note>
  ///
  /// Parameter [resultEncryptionMode] :
  /// Encryption mode that you can specify to encrypt the results of this
  /// assessment run. If you don't specify this request parameter, AWS DMS
  /// stores the assessment run results without encryption. You can specify one
  /// of the options following:
  ///
  /// <ul>
  /// <li>
  /// <code>"SSE_S3"</code> – The server-side encryption provided as a default
  /// by Amazon S3.
  /// </li>
  /// <li>
  /// <code>"SSE_KMS"</code> – AWS Key Management Service (AWS KMS) encryption.
  /// This encryption can use either a custom KMS encryption key that you
  /// specify or the default KMS encryption key that DMS provides.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resultKmsKeyArn] :
  /// ARN of a custom KMS encryption key that you specify when you set
  /// <code>ResultEncryptionMode</code> to <code>"SSE_KMS</code>".
  ///
  /// Parameter [resultLocationFolder] :
  /// Folder within an Amazon S3 bucket where you want AWS DMS to store the
  /// results of this assessment run.
  Future<StartReplicationTaskAssessmentRunResponse>
      startReplicationTaskAssessmentRun({
    required String assessmentRunName,
    required String replicationTaskArn,
    required String resultLocationBucket,
    required String serviceAccessRoleArn,
    List<String>? exclude,
    List<String>? includeOnly,
    String? resultEncryptionMode,
    String? resultKmsKeyArn,
    String? resultLocationFolder,
  }) async {
    ArgumentError.checkNotNull(assessmentRunName, 'assessmentRunName');
    ArgumentError.checkNotNull(replicationTaskArn, 'replicationTaskArn');
    ArgumentError.checkNotNull(resultLocationBucket, 'resultLocationBucket');
    ArgumentError.checkNotNull(serviceAccessRoleArn, 'serviceAccessRoleArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonDMSv20160101.StartReplicationTaskAssessmentRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssessmentRunName': assessmentRunName,
        'ReplicationTaskArn': replicationTaskArn,
        'ResultLocationBucket': resultLocationBucket,
        'ServiceAccessRoleArn': serviceAccessRoleArn,
        if (exclude != null) 'Exclude': exclude,
        if (includeOnly != null) 'IncludeOnly': includeOnly,
        if (resultEncryptionMode != null)
          'ResultEncryptionMode': resultEncryptionMode,
        if (resultKmsKeyArn != null) 'ResultKmsKeyArn': resultKmsKeyArn,
        if (resultLocationFolder != null)
          'ResultLocationFolder': resultLocationFolder,
      },
    );

    return StartReplicationTaskAssessmentRunResponse.fromJson(
        jsonResponse.body);
  }

  /// Stops the replication task.
  ///
  /// May throw [ResourceNotFoundFault].
  /// May throw [InvalidResourceStateFault].
  ///
  /// Parameter [replicationTaskArn] :
  /// The Amazon Resource Name(ARN) of the replication task to be stopped.
  Future<StopReplicationTaskResponse> stopReplicationTask({
    required String replicationTaskArn,
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
  /// May throw [AccessDeniedFault].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  ///
  /// Parameter [replicationInstanceArn] :
  /// The Amazon Resource Name (ARN) of the replication instance.
  Future<TestConnectionResponse> testConnection({
    required String endpointArn,
    required String replicationInstanceArn,
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
class AccountQuota {
  /// The name of the AWS DMS quota for this AWS account.
  final String? accountQuotaName;

  /// The maximum allowed value for the quota.
  final int? max;

  /// The amount currently used toward the quota maximum.
  final int? used;

  AccountQuota({
    this.accountQuotaName,
    this.max,
    this.used,
  });

  factory AccountQuota.fromJson(Map<String, dynamic> json) {
    return AccountQuota(
      accountQuotaName: json['AccountQuotaName'] as String?,
      max: json['Max'] as int?,
      used: json['Used'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountQuotaName = this.accountQuotaName;
    final max = this.max;
    final used = this.used;
    return {
      if (accountQuotaName != null) 'AccountQuotaName': accountQuotaName,
      if (max != null) 'Max': max,
      if (used != null) 'Used': used,
    };
  }
}

/// <p/>
class AddTagsToResourceResponse {
  AddTagsToResourceResponse();

  factory AddTagsToResourceResponse.fromJson(Map<String, dynamic> _) {
    return AddTagsToResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
class ApplyPendingMaintenanceActionResponse {
  /// The AWS DMS resource that the pending maintenance action will be applied to.
  final ResourcePendingMaintenanceActions? resourcePendingMaintenanceActions;

  ApplyPendingMaintenanceActionResponse({
    this.resourcePendingMaintenanceActions,
  });

  factory ApplyPendingMaintenanceActionResponse.fromJson(
      Map<String, dynamic> json) {
    return ApplyPendingMaintenanceActionResponse(
      resourcePendingMaintenanceActions:
          json['ResourcePendingMaintenanceActions'] != null
              ? ResourcePendingMaintenanceActions.fromJson(
                  json['ResourcePendingMaintenanceActions']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePendingMaintenanceActions =
        this.resourcePendingMaintenanceActions;
    return {
      if (resourcePendingMaintenanceActions != null)
        'ResourcePendingMaintenanceActions': resourcePendingMaintenanceActions,
    };
  }
}

enum AuthMechanismValue {
  $default,
  mongodbCr,
  scramSha_1,
}

extension on AuthMechanismValue {
  String toValue() {
    switch (this) {
      case AuthMechanismValue.$default:
        return 'default';
      case AuthMechanismValue.mongodbCr:
        return 'mongodb_cr';
      case AuthMechanismValue.scramSha_1:
        return 'scram_sha_1';
    }
  }
}

extension on String {
  AuthMechanismValue toAuthMechanismValue() {
    switch (this) {
      case 'default':
        return AuthMechanismValue.$default;
      case 'mongodb_cr':
        return AuthMechanismValue.mongodbCr;
      case 'scram_sha_1':
        return AuthMechanismValue.scramSha_1;
    }
    throw Exception('$this is not known in enum AuthMechanismValue');
  }
}

enum AuthTypeValue {
  no,
  password,
}

extension on AuthTypeValue {
  String toValue() {
    switch (this) {
      case AuthTypeValue.no:
        return 'no';
      case AuthTypeValue.password:
        return 'password';
    }
  }
}

extension on String {
  AuthTypeValue toAuthTypeValue() {
    switch (this) {
      case 'no':
        return AuthTypeValue.no;
      case 'password':
        return AuthTypeValue.password;
    }
    throw Exception('$this is not known in enum AuthTypeValue');
  }
}

/// The name of an Availability Zone for use during database migration.
/// <code>AvailabilityZone</code> is an optional parameter to the <a
/// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_CreateReplicationInstance.html">
/// <code>CreateReplicationInstance</code> </a> operation, and it’s value
/// relates to the AWS Region of an endpoint. For example, the availability zone
/// of an endpoint in the us-east-1 region might be us-east-1a, us-east-1b,
/// us-east-1c, or us-east-1d.
class AvailabilityZone {
  /// The name of the Availability Zone.
  final String? name;

  AvailabilityZone({
    this.name,
  });

  factory AvailabilityZone.fromJson(Map<String, dynamic> json) {
    return AvailabilityZone(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// <p/>
class CancelReplicationTaskAssessmentRunResponse {
  /// The <code>ReplicationTaskAssessmentRun</code> object for the canceled
  /// assessment run.
  final ReplicationTaskAssessmentRun? replicationTaskAssessmentRun;

  CancelReplicationTaskAssessmentRunResponse({
    this.replicationTaskAssessmentRun,
  });

  factory CancelReplicationTaskAssessmentRunResponse.fromJson(
      Map<String, dynamic> json) {
    return CancelReplicationTaskAssessmentRunResponse(
      replicationTaskAssessmentRun: json['ReplicationTaskAssessmentRun'] != null
          ? ReplicationTaskAssessmentRun.fromJson(
              json['ReplicationTaskAssessmentRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTaskAssessmentRun = this.replicationTaskAssessmentRun;
    return {
      if (replicationTaskAssessmentRun != null)
        'ReplicationTaskAssessmentRun': replicationTaskAssessmentRun,
    };
  }
}

/// The SSL certificate that can be used to encrypt connections between the
/// endpoints and the replication instance.
class Certificate {
  /// The Amazon Resource Name (ARN) for the certificate.
  final String? certificateArn;

  /// The date that the certificate was created.
  final DateTime? certificateCreationDate;

  /// A customer-assigned name for the certificate. Identifiers must begin with a
  /// letter and must contain only ASCII letters, digits, and hyphens. They can't
  /// end with a hyphen or contain two consecutive hyphens.
  final String? certificateIdentifier;

  /// The owner of the certificate.
  final String? certificateOwner;

  /// The contents of a <code>.pem</code> file, which contains an X.509
  /// certificate.
  final String? certificatePem;

  /// The location of an imported Oracle Wallet certificate for use with SSL.
  final Uint8List? certificateWallet;

  /// The key length of the cryptographic algorithm being used.
  final int? keyLength;

  /// The signing algorithm for the certificate.
  final String? signingAlgorithm;

  /// The beginning date that the certificate is valid.
  final DateTime? validFromDate;

  /// The final date that the certificate is valid.
  final DateTime? validToDate;

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

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      certificateArn: json['CertificateArn'] as String?,
      certificateCreationDate:
          timeStampFromJson(json['CertificateCreationDate']),
      certificateIdentifier: json['CertificateIdentifier'] as String?,
      certificateOwner: json['CertificateOwner'] as String?,
      certificatePem: json['CertificatePem'] as String?,
      certificateWallet:
          _s.decodeNullableUint8List(json['CertificateWallet'] as String?),
      keyLength: json['KeyLength'] as int?,
      signingAlgorithm: json['SigningAlgorithm'] as String?,
      validFromDate: timeStampFromJson(json['ValidFromDate']),
      validToDate: timeStampFromJson(json['ValidToDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final certificateCreationDate = this.certificateCreationDate;
    final certificateIdentifier = this.certificateIdentifier;
    final certificateOwner = this.certificateOwner;
    final certificatePem = this.certificatePem;
    final certificateWallet = this.certificateWallet;
    final keyLength = this.keyLength;
    final signingAlgorithm = this.signingAlgorithm;
    final validFromDate = this.validFromDate;
    final validToDate = this.validToDate;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (certificateCreationDate != null)
        'CertificateCreationDate': unixTimestampToJson(certificateCreationDate),
      if (certificateIdentifier != null)
        'CertificateIdentifier': certificateIdentifier,
      if (certificateOwner != null) 'CertificateOwner': certificateOwner,
      if (certificatePem != null) 'CertificatePem': certificatePem,
      if (certificateWallet != null)
        'CertificateWallet': base64Encode(certificateWallet),
      if (keyLength != null) 'KeyLength': keyLength,
      if (signingAlgorithm != null) 'SigningAlgorithm': signingAlgorithm,
      if (validFromDate != null)
        'ValidFromDate': unixTimestampToJson(validFromDate),
      if (validToDate != null) 'ValidToDate': unixTimestampToJson(validToDate),
    };
  }
}

enum CharLengthSemantics {
  $default,
  char,
  byte,
}

extension on CharLengthSemantics {
  String toValue() {
    switch (this) {
      case CharLengthSemantics.$default:
        return 'default';
      case CharLengthSemantics.char:
        return 'char';
      case CharLengthSemantics.byte:
        return 'byte';
    }
  }
}

extension on String {
  CharLengthSemantics toCharLengthSemantics() {
    switch (this) {
      case 'default':
        return CharLengthSemantics.$default;
      case 'char':
        return CharLengthSemantics.char;
      case 'byte':
        return CharLengthSemantics.byte;
    }
    throw Exception('$this is not known in enum CharLengthSemantics');
  }
}

enum CompressionTypeValue {
  none,
  gzip,
}

extension on CompressionTypeValue {
  String toValue() {
    switch (this) {
      case CompressionTypeValue.none:
        return 'none';
      case CompressionTypeValue.gzip:
        return 'gzip';
    }
  }
}

extension on String {
  CompressionTypeValue toCompressionTypeValue() {
    switch (this) {
      case 'none':
        return CompressionTypeValue.none;
      case 'gzip':
        return CompressionTypeValue.gzip;
    }
    throw Exception('$this is not known in enum CompressionTypeValue');
  }
}

/// Status of the connection between an endpoint and a replication instance,
/// including Amazon Resource Names (ARNs) and the last error message issued.
class Connection {
  /// The ARN string that uniquely identifies the endpoint.
  final String? endpointArn;

  /// The identifier of the endpoint. Identifiers must begin with a letter and
  /// must contain only ASCII letters, digits, and hyphens. They can't end with a
  /// hyphen or contain two consecutive hyphens.
  final String? endpointIdentifier;

  /// The error message when the connection last failed.
  final String? lastFailureMessage;

  /// The ARN of the replication instance.
  final String? replicationInstanceArn;

  /// The replication instance identifier. This parameter is stored as a lowercase
  /// string.
  final String? replicationInstanceIdentifier;

  /// The connection status. This parameter can return one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>"successful"</code>
  /// </li>
  /// <li>
  /// <code>"testing"</code>
  /// </li>
  /// <li>
  /// <code>"failed"</code>
  /// </li>
  /// <li>
  /// <code>"deleting"</code>
  /// </li>
  /// </ul>
  final String? status;

  Connection({
    this.endpointArn,
    this.endpointIdentifier,
    this.lastFailureMessage,
    this.replicationInstanceArn,
    this.replicationInstanceIdentifier,
    this.status,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      endpointArn: json['EndpointArn'] as String?,
      endpointIdentifier: json['EndpointIdentifier'] as String?,
      lastFailureMessage: json['LastFailureMessage'] as String?,
      replicationInstanceArn: json['ReplicationInstanceArn'] as String?,
      replicationInstanceIdentifier:
          json['ReplicationInstanceIdentifier'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointArn = this.endpointArn;
    final endpointIdentifier = this.endpointIdentifier;
    final lastFailureMessage = this.lastFailureMessage;
    final replicationInstanceArn = this.replicationInstanceArn;
    final replicationInstanceIdentifier = this.replicationInstanceIdentifier;
    final status = this.status;
    return {
      if (endpointArn != null) 'EndpointArn': endpointArn,
      if (endpointIdentifier != null) 'EndpointIdentifier': endpointIdentifier,
      if (lastFailureMessage != null) 'LastFailureMessage': lastFailureMessage,
      if (replicationInstanceArn != null)
        'ReplicationInstanceArn': replicationInstanceArn,
      if (replicationInstanceIdentifier != null)
        'ReplicationInstanceIdentifier': replicationInstanceIdentifier,
      if (status != null) 'Status': status,
    };
  }
}

/// <p/>
class CreateEndpointResponse {
  /// The endpoint that was created.
  final Endpoint? endpoint;

  CreateEndpointResponse({
    this.endpoint,
  });

  factory CreateEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateEndpointResponse(
      endpoint: json['Endpoint'] != null
          ? Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
    };
  }
}

/// <p/>
class CreateEventSubscriptionResponse {
  /// The event subscription that was created.
  final EventSubscription? eventSubscription;

  CreateEventSubscriptionResponse({
    this.eventSubscription,
  });

  factory CreateEventSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventSubscriptionResponse(
      eventSubscription: json['EventSubscription'] != null
          ? EventSubscription.fromJson(
              json['EventSubscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

/// <p/>
class CreateReplicationInstanceResponse {
  /// The replication instance that was created.
  final ReplicationInstance? replicationInstance;

  CreateReplicationInstanceResponse({
    this.replicationInstance,
  });

  factory CreateReplicationInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateReplicationInstanceResponse(
      replicationInstance: json['ReplicationInstance'] != null
          ? ReplicationInstance.fromJson(
              json['ReplicationInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationInstance = this.replicationInstance;
    return {
      if (replicationInstance != null)
        'ReplicationInstance': replicationInstance,
    };
  }
}

/// <p/>
class CreateReplicationSubnetGroupResponse {
  /// The replication subnet group that was created.
  final ReplicationSubnetGroup? replicationSubnetGroup;

  CreateReplicationSubnetGroupResponse({
    this.replicationSubnetGroup,
  });

  factory CreateReplicationSubnetGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateReplicationSubnetGroupResponse(
      replicationSubnetGroup: json['ReplicationSubnetGroup'] != null
          ? ReplicationSubnetGroup.fromJson(
              json['ReplicationSubnetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationSubnetGroup = this.replicationSubnetGroup;
    return {
      if (replicationSubnetGroup != null)
        'ReplicationSubnetGroup': replicationSubnetGroup,
    };
  }
}

/// <p/>
class CreateReplicationTaskResponse {
  /// The replication task that was created.
  final ReplicationTask? replicationTask;

  CreateReplicationTaskResponse({
    this.replicationTask,
  });

  factory CreateReplicationTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateReplicationTaskResponse(
      replicationTask: json['ReplicationTask'] != null
          ? ReplicationTask.fromJson(
              json['ReplicationTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTask = this.replicationTask;
    return {
      if (replicationTask != null) 'ReplicationTask': replicationTask,
    };
  }
}

enum DataFormatValue {
  csv,
  parquet,
}

extension on DataFormatValue {
  String toValue() {
    switch (this) {
      case DataFormatValue.csv:
        return 'csv';
      case DataFormatValue.parquet:
        return 'parquet';
    }
  }
}

extension on String {
  DataFormatValue toDataFormatValue() {
    switch (this) {
      case 'csv':
        return DataFormatValue.csv;
      case 'parquet':
        return DataFormatValue.parquet;
    }
    throw Exception('$this is not known in enum DataFormatValue');
  }
}

enum DatePartitionDelimiterValue {
  slash,
  underscore,
  dash,
  none,
}

extension on DatePartitionDelimiterValue {
  String toValue() {
    switch (this) {
      case DatePartitionDelimiterValue.slash:
        return 'SLASH';
      case DatePartitionDelimiterValue.underscore:
        return 'UNDERSCORE';
      case DatePartitionDelimiterValue.dash:
        return 'DASH';
      case DatePartitionDelimiterValue.none:
        return 'NONE';
    }
  }
}

extension on String {
  DatePartitionDelimiterValue toDatePartitionDelimiterValue() {
    switch (this) {
      case 'SLASH':
        return DatePartitionDelimiterValue.slash;
      case 'UNDERSCORE':
        return DatePartitionDelimiterValue.underscore;
      case 'DASH':
        return DatePartitionDelimiterValue.dash;
      case 'NONE':
        return DatePartitionDelimiterValue.none;
    }
    throw Exception('$this is not known in enum DatePartitionDelimiterValue');
  }
}

enum DatePartitionSequenceValue {
  yyyymmdd,
  yyyymmddhh,
  yyyymm,
  mmyyyydd,
  ddmmyyyy,
}

extension on DatePartitionSequenceValue {
  String toValue() {
    switch (this) {
      case DatePartitionSequenceValue.yyyymmdd:
        return 'YYYYMMDD';
      case DatePartitionSequenceValue.yyyymmddhh:
        return 'YYYYMMDDHH';
      case DatePartitionSequenceValue.yyyymm:
        return 'YYYYMM';
      case DatePartitionSequenceValue.mmyyyydd:
        return 'MMYYYYDD';
      case DatePartitionSequenceValue.ddmmyyyy:
        return 'DDMMYYYY';
    }
  }
}

extension on String {
  DatePartitionSequenceValue toDatePartitionSequenceValue() {
    switch (this) {
      case 'YYYYMMDD':
        return DatePartitionSequenceValue.yyyymmdd;
      case 'YYYYMMDDHH':
        return DatePartitionSequenceValue.yyyymmddhh;
      case 'YYYYMM':
        return DatePartitionSequenceValue.yyyymm;
      case 'MMYYYYDD':
        return DatePartitionSequenceValue.mmyyyydd;
      case 'DDMMYYYY':
        return DatePartitionSequenceValue.ddmmyyyy;
    }
    throw Exception('$this is not known in enum DatePartitionSequenceValue');
  }
}

class DeleteCertificateResponse {
  /// The Secure Sockets Layer (SSL) certificate.
  final Certificate? certificate;

  DeleteCertificateResponse({
    this.certificate,
  });

  factory DeleteCertificateResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCertificateResponse(
      certificate: json['Certificate'] != null
          ? Certificate.fromJson(json['Certificate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    return {
      if (certificate != null) 'Certificate': certificate,
    };
  }
}

/// <p/>
class DeleteConnectionResponse {
  /// The connection that is being deleted.
  final Connection? connection;

  DeleteConnectionResponse({
    this.connection,
  });

  factory DeleteConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConnectionResponse(
      connection: json['Connection'] != null
          ? Connection.fromJson(json['Connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'Connection': connection,
    };
  }
}

/// <p/>
class DeleteEndpointResponse {
  /// The endpoint that was deleted.
  final Endpoint? endpoint;

  DeleteEndpointResponse({
    this.endpoint,
  });

  factory DeleteEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEndpointResponse(
      endpoint: json['Endpoint'] != null
          ? Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
    };
  }
}

/// <p/>
class DeleteEventSubscriptionResponse {
  /// The event subscription that was deleted.
  final EventSubscription? eventSubscription;

  DeleteEventSubscriptionResponse({
    this.eventSubscription,
  });

  factory DeleteEventSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEventSubscriptionResponse(
      eventSubscription: json['EventSubscription'] != null
          ? EventSubscription.fromJson(
              json['EventSubscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

/// <p/>
class DeleteReplicationInstanceResponse {
  /// The replication instance that was deleted.
  final ReplicationInstance? replicationInstance;

  DeleteReplicationInstanceResponse({
    this.replicationInstance,
  });

  factory DeleteReplicationInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteReplicationInstanceResponse(
      replicationInstance: json['ReplicationInstance'] != null
          ? ReplicationInstance.fromJson(
              json['ReplicationInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationInstance = this.replicationInstance;
    return {
      if (replicationInstance != null)
        'ReplicationInstance': replicationInstance,
    };
  }
}

/// <p/>
class DeleteReplicationSubnetGroupResponse {
  DeleteReplicationSubnetGroupResponse();

  factory DeleteReplicationSubnetGroupResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteReplicationSubnetGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
class DeleteReplicationTaskAssessmentRunResponse {
  /// The <code>ReplicationTaskAssessmentRun</code> object for the deleted
  /// assessment run.
  final ReplicationTaskAssessmentRun? replicationTaskAssessmentRun;

  DeleteReplicationTaskAssessmentRunResponse({
    this.replicationTaskAssessmentRun,
  });

  factory DeleteReplicationTaskAssessmentRunResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteReplicationTaskAssessmentRunResponse(
      replicationTaskAssessmentRun: json['ReplicationTaskAssessmentRun'] != null
          ? ReplicationTaskAssessmentRun.fromJson(
              json['ReplicationTaskAssessmentRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTaskAssessmentRun = this.replicationTaskAssessmentRun;
    return {
      if (replicationTaskAssessmentRun != null)
        'ReplicationTaskAssessmentRun': replicationTaskAssessmentRun,
    };
  }
}

/// <p/>
class DeleteReplicationTaskResponse {
  /// The deleted replication task.
  final ReplicationTask? replicationTask;

  DeleteReplicationTaskResponse({
    this.replicationTask,
  });

  factory DeleteReplicationTaskResponse.fromJson(Map<String, dynamic> json) {
    return DeleteReplicationTaskResponse(
      replicationTask: json['ReplicationTask'] != null
          ? ReplicationTask.fromJson(
              json['ReplicationTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTask = this.replicationTask;
    return {
      if (replicationTask != null) 'ReplicationTask': replicationTask,
    };
  }
}

/// <p/>
class DescribeAccountAttributesResponse {
  /// Account quota information.
  final List<AccountQuota>? accountQuotas;

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
  final String? uniqueAccountIdentifier;

  DescribeAccountAttributesResponse({
    this.accountQuotas,
    this.uniqueAccountIdentifier,
  });

  factory DescribeAccountAttributesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAccountAttributesResponse(
      accountQuotas: (json['AccountQuotas'] as List?)
          ?.whereNotNull()
          .map((e) => AccountQuota.fromJson(e as Map<String, dynamic>))
          .toList(),
      uniqueAccountIdentifier: json['UniqueAccountIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountQuotas = this.accountQuotas;
    final uniqueAccountIdentifier = this.uniqueAccountIdentifier;
    return {
      if (accountQuotas != null) 'AccountQuotas': accountQuotas,
      if (uniqueAccountIdentifier != null)
        'UniqueAccountIdentifier': uniqueAccountIdentifier,
    };
  }
}

/// <p/>
class DescribeApplicableIndividualAssessmentsResponse {
  /// List of names for the individual assessments supported by the premigration
  /// assessment run that you start based on the specified request parameters. For
  /// more information on the available individual assessments, including
  /// compatibility with different migration task configurations, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.AssessmentReport.html">Working
  /// with premigration assessment runs</a> in the <i>AWS Database Migration
  /// Service User Guide.</i>
  final List<String>? individualAssessmentNames;

  /// Pagination token returned for you to pass to a subsequent request. If you
  /// pass this token as the <code>Marker</code> value in a subsequent request,
  /// the response includes only records beyond the marker, up to the value
  /// specified in the request by <code>MaxRecords</code>.
  final String? marker;

  DescribeApplicableIndividualAssessmentsResponse({
    this.individualAssessmentNames,
    this.marker,
  });

  factory DescribeApplicableIndividualAssessmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeApplicableIndividualAssessmentsResponse(
      individualAssessmentNames: (json['IndividualAssessmentNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final individualAssessmentNames = this.individualAssessmentNames;
    final marker = this.marker;
    return {
      if (individualAssessmentNames != null)
        'IndividualAssessmentNames': individualAssessmentNames,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DescribeCertificatesResponse {
  /// The Secure Sockets Layer (SSL) certificates associated with the replication
  /// instance.
  final List<Certificate>? certificates;

  /// The pagination token.
  final String? marker;

  DescribeCertificatesResponse({
    this.certificates,
    this.marker,
  });

  factory DescribeCertificatesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCertificatesResponse(
      certificates: (json['Certificates'] as List?)
          ?.whereNotNull()
          .map((e) => Certificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificates = this.certificates;
    final marker = this.marker;
    return {
      if (certificates != null) 'Certificates': certificates,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// <p/>
class DescribeConnectionsResponse {
  /// A description of the connections.
  final List<Connection>? connections;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DescribeConnectionsResponse({
    this.connections,
    this.marker,
  });

  factory DescribeConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConnectionsResponse(
      connections: (json['Connections'] as List?)
          ?.whereNotNull()
          .map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final marker = this.marker;
    return {
      if (connections != null) 'Connections': connections,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DescribeEndpointSettingsResponse {
  /// Descriptions of the endpoint settings available for your source or target
  /// database engine.
  final List<EndpointSetting>? endpointSettings;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DescribeEndpointSettingsResponse({
    this.endpointSettings,
    this.marker,
  });

  factory DescribeEndpointSettingsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointSettingsResponse(
      endpointSettings: (json['EndpointSettings'] as List?)
          ?.whereNotNull()
          .map((e) => EndpointSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointSettings = this.endpointSettings;
    final marker = this.marker;
    return {
      if (endpointSettings != null) 'EndpointSettings': endpointSettings,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// <p/>
class DescribeEndpointTypesResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// The types of endpoints that are supported.
  final List<SupportedEndpointType>? supportedEndpointTypes;

  DescribeEndpointTypesResponse({
    this.marker,
    this.supportedEndpointTypes,
  });

  factory DescribeEndpointTypesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointTypesResponse(
      marker: json['Marker'] as String?,
      supportedEndpointTypes: (json['SupportedEndpointTypes'] as List?)
          ?.whereNotNull()
          .map((e) => SupportedEndpointType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final supportedEndpointTypes = this.supportedEndpointTypes;
    return {
      if (marker != null) 'Marker': marker,
      if (supportedEndpointTypes != null)
        'SupportedEndpointTypes': supportedEndpointTypes,
    };
  }
}

/// <p/>
class DescribeEndpointsResponse {
  /// Endpoint description.
  final List<Endpoint>? endpoints;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DescribeEndpointsResponse({
    this.endpoints,
    this.marker,
  });

  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointsResponse(
      endpoints: (json['Endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final marker = this.marker;
    return {
      if (endpoints != null) 'Endpoints': endpoints,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// <p/>
class DescribeEventCategoriesResponse {
  /// A list of event categories.
  final List<EventCategoryGroup>? eventCategoryGroupList;

  DescribeEventCategoriesResponse({
    this.eventCategoryGroupList,
  });

  factory DescribeEventCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventCategoriesResponse(
      eventCategoryGroupList: (json['EventCategoryGroupList'] as List?)
          ?.whereNotNull()
          .map((e) => EventCategoryGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventCategoryGroupList = this.eventCategoryGroupList;
    return {
      if (eventCategoryGroupList != null)
        'EventCategoryGroupList': eventCategoryGroupList,
    };
  }
}

/// <p/>
class DescribeEventSubscriptionsResponse {
  /// A list of event subscriptions.
  final List<EventSubscription>? eventSubscriptionsList;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DescribeEventSubscriptionsResponse({
    this.eventSubscriptionsList,
    this.marker,
  });

  factory DescribeEventSubscriptionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEventSubscriptionsResponse(
      eventSubscriptionsList: (json['EventSubscriptionsList'] as List?)
          ?.whereNotNull()
          .map((e) => EventSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscriptionsList = this.eventSubscriptionsList;
    final marker = this.marker;
    return {
      if (eventSubscriptionsList != null)
        'EventSubscriptionsList': eventSubscriptionsList,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// <p/>
class DescribeEventsResponse {
  /// The events described.
  final List<Event>? events;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  DescribeEventsResponse({
    this.events,
    this.marker,
  });

  factory DescribeEventsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventsResponse(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final marker = this.marker;
    return {
      if (events != null) 'Events': events,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// <p/>
class DescribeOrderableReplicationInstancesResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// The order-able replication instances available.
  final List<OrderableReplicationInstance>? orderableReplicationInstances;

  DescribeOrderableReplicationInstancesResponse({
    this.marker,
    this.orderableReplicationInstances,
  });

  factory DescribeOrderableReplicationInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrderableReplicationInstancesResponse(
      marker: json['Marker'] as String?,
      orderableReplicationInstances: (json['OrderableReplicationInstances']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              OrderableReplicationInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final orderableReplicationInstances = this.orderableReplicationInstances;
    return {
      if (marker != null) 'Marker': marker,
      if (orderableReplicationInstances != null)
        'OrderableReplicationInstances': orderableReplicationInstances,
    };
  }
}

/// <p/>
class DescribePendingMaintenanceActionsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// The pending maintenance action.
  final List<ResourcePendingMaintenanceActions>? pendingMaintenanceActions;

  DescribePendingMaintenanceActionsResponse({
    this.marker,
    this.pendingMaintenanceActions,
  });

  factory DescribePendingMaintenanceActionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePendingMaintenanceActionsResponse(
      marker: json['Marker'] as String?,
      pendingMaintenanceActions: (json['PendingMaintenanceActions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePendingMaintenanceActions.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final pendingMaintenanceActions = this.pendingMaintenanceActions;
    return {
      if (marker != null) 'Marker': marker,
      if (pendingMaintenanceActions != null)
        'PendingMaintenanceActions': pendingMaintenanceActions,
    };
  }
}

/// <p/>
class DescribeRefreshSchemasStatusResponse {
  /// The status of the schema.
  final RefreshSchemasStatus? refreshSchemasStatus;

  DescribeRefreshSchemasStatusResponse({
    this.refreshSchemasStatus,
  });

  factory DescribeRefreshSchemasStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRefreshSchemasStatusResponse(
      refreshSchemasStatus: json['RefreshSchemasStatus'] != null
          ? RefreshSchemasStatus.fromJson(
              json['RefreshSchemasStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final refreshSchemasStatus = this.refreshSchemasStatus;
    return {
      if (refreshSchemasStatus != null)
        'RefreshSchemasStatus': refreshSchemasStatus,
    };
  }
}

class DescribeReplicationInstanceTaskLogsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// The Amazon Resource Name (ARN) of the replication instance.
  final String? replicationInstanceArn;

  /// An array of replication task log metadata. Each member of the array contains
  /// the replication task name, ARN, and task log size (in bytes).
  final List<ReplicationInstanceTaskLog>? replicationInstanceTaskLogs;

  DescribeReplicationInstanceTaskLogsResponse({
    this.marker,
    this.replicationInstanceArn,
    this.replicationInstanceTaskLogs,
  });

  factory DescribeReplicationInstanceTaskLogsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReplicationInstanceTaskLogsResponse(
      marker: json['Marker'] as String?,
      replicationInstanceArn: json['ReplicationInstanceArn'] as String?,
      replicationInstanceTaskLogs: (json['ReplicationInstanceTaskLogs']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ReplicationInstanceTaskLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final replicationInstanceArn = this.replicationInstanceArn;
    final replicationInstanceTaskLogs = this.replicationInstanceTaskLogs;
    return {
      if (marker != null) 'Marker': marker,
      if (replicationInstanceArn != null)
        'ReplicationInstanceArn': replicationInstanceArn,
      if (replicationInstanceTaskLogs != null)
        'ReplicationInstanceTaskLogs': replicationInstanceTaskLogs,
    };
  }
}

/// <p/>
class DescribeReplicationInstancesResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// The replication instances described.
  final List<ReplicationInstance>? replicationInstances;

  DescribeReplicationInstancesResponse({
    this.marker,
    this.replicationInstances,
  });

  factory DescribeReplicationInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReplicationInstancesResponse(
      marker: json['Marker'] as String?,
      replicationInstances: (json['ReplicationInstances'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final replicationInstances = this.replicationInstances;
    return {
      if (marker != null) 'Marker': marker,
      if (replicationInstances != null)
        'ReplicationInstances': replicationInstances,
    };
  }
}

/// <p/>
class DescribeReplicationSubnetGroupsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// A description of the replication subnet groups.
  final List<ReplicationSubnetGroup>? replicationSubnetGroups;

  DescribeReplicationSubnetGroupsResponse({
    this.marker,
    this.replicationSubnetGroups,
  });

  factory DescribeReplicationSubnetGroupsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReplicationSubnetGroupsResponse(
      marker: json['Marker'] as String?,
      replicationSubnetGroups: (json['ReplicationSubnetGroups'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ReplicationSubnetGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final replicationSubnetGroups = this.replicationSubnetGroups;
    return {
      if (marker != null) 'Marker': marker,
      if (replicationSubnetGroups != null)
        'ReplicationSubnetGroups': replicationSubnetGroups,
    };
  }
}

/// <p/>
class DescribeReplicationTaskAssessmentResultsResponse {
  /// - The Amazon S3 bucket where the task assessment report is located.
  final String? bucketName;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// The task assessment report.
  final List<ReplicationTaskAssessmentResult>? replicationTaskAssessmentResults;

  DescribeReplicationTaskAssessmentResultsResponse({
    this.bucketName,
    this.marker,
    this.replicationTaskAssessmentResults,
  });

  factory DescribeReplicationTaskAssessmentResultsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReplicationTaskAssessmentResultsResponse(
      bucketName: json['BucketName'] as String?,
      marker: json['Marker'] as String?,
      replicationTaskAssessmentResults:
          (json['ReplicationTaskAssessmentResults'] as List?)
              ?.whereNotNull()
              .map((e) => ReplicationTaskAssessmentResult.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final marker = this.marker;
    final replicationTaskAssessmentResults =
        this.replicationTaskAssessmentResults;
    return {
      if (bucketName != null) 'BucketName': bucketName,
      if (marker != null) 'Marker': marker,
      if (replicationTaskAssessmentResults != null)
        'ReplicationTaskAssessmentResults': replicationTaskAssessmentResults,
    };
  }
}

/// <p/>
class DescribeReplicationTaskAssessmentRunsResponse {
  /// A pagination token returned for you to pass to a subsequent request. If you
  /// pass this token as the <code>Marker</code> value in a subsequent request,
  /// the response includes only records beyond the marker, up to the value
  /// specified in the request by <code>MaxRecords</code>.
  final String? marker;

  /// One or more premigration assessment runs as specified by
  /// <code>Filters</code>.
  final List<ReplicationTaskAssessmentRun>? replicationTaskAssessmentRuns;

  DescribeReplicationTaskAssessmentRunsResponse({
    this.marker,
    this.replicationTaskAssessmentRuns,
  });

  factory DescribeReplicationTaskAssessmentRunsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReplicationTaskAssessmentRunsResponse(
      marker: json['Marker'] as String?,
      replicationTaskAssessmentRuns: (json['ReplicationTaskAssessmentRuns']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ReplicationTaskAssessmentRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final replicationTaskAssessmentRuns = this.replicationTaskAssessmentRuns;
    return {
      if (marker != null) 'Marker': marker,
      if (replicationTaskAssessmentRuns != null)
        'ReplicationTaskAssessmentRuns': replicationTaskAssessmentRuns,
    };
  }
}

/// <p/>
class DescribeReplicationTaskIndividualAssessmentsResponse {
  /// A pagination token returned for you to pass to a subsequent request. If you
  /// pass this token as the <code>Marker</code> value in a subsequent request,
  /// the response includes only records beyond the marker, up to the value
  /// specified in the request by <code>MaxRecords</code>.
  final String? marker;

  /// One or more individual assessments as specified by <code>Filters</code>.
  final List<ReplicationTaskIndividualAssessment>?
      replicationTaskIndividualAssessments;

  DescribeReplicationTaskIndividualAssessmentsResponse({
    this.marker,
    this.replicationTaskIndividualAssessments,
  });

  factory DescribeReplicationTaskIndividualAssessmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReplicationTaskIndividualAssessmentsResponse(
      marker: json['Marker'] as String?,
      replicationTaskIndividualAssessments:
          (json['ReplicationTaskIndividualAssessments'] as List?)
              ?.whereNotNull()
              .map((e) => ReplicationTaskIndividualAssessment.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final replicationTaskIndividualAssessments =
        this.replicationTaskIndividualAssessments;
    return {
      if (marker != null) 'Marker': marker,
      if (replicationTaskIndividualAssessments != null)
        'ReplicationTaskIndividualAssessments':
            replicationTaskIndividualAssessments,
    };
  }
}

/// <p/>
class DescribeReplicationTasksResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// A description of the replication tasks.
  final List<ReplicationTask>? replicationTasks;

  DescribeReplicationTasksResponse({
    this.marker,
    this.replicationTasks,
  });

  factory DescribeReplicationTasksResponse.fromJson(Map<String, dynamic> json) {
    return DescribeReplicationTasksResponse(
      marker: json['Marker'] as String?,
      replicationTasks: (json['ReplicationTasks'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final replicationTasks = this.replicationTasks;
    return {
      if (marker != null) 'Marker': marker,
      if (replicationTasks != null) 'ReplicationTasks': replicationTasks,
    };
  }
}

/// <p/>
class DescribeSchemasResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// The described schema.
  final List<String>? schemas;

  DescribeSchemasResponse({
    this.marker,
    this.schemas,
  });

  factory DescribeSchemasResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSchemasResponse(
      marker: json['Marker'] as String?,
      schemas: (json['Schemas'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final schemas = this.schemas;
    return {
      if (marker != null) 'Marker': marker,
      if (schemas != null) 'Schemas': schemas,
    };
  }
}

/// <p/>
class DescribeTableStatisticsResponse {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by <code>MaxRecords</code>.
  final String? marker;

  /// The Amazon Resource Name (ARN) of the replication task.
  final String? replicationTaskArn;

  /// The table statistics.
  final List<TableStatistics>? tableStatistics;

  DescribeTableStatisticsResponse({
    this.marker,
    this.replicationTaskArn,
    this.tableStatistics,
  });

  factory DescribeTableStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTableStatisticsResponse(
      marker: json['Marker'] as String?,
      replicationTaskArn: json['ReplicationTaskArn'] as String?,
      tableStatistics: (json['TableStatistics'] as List?)
          ?.whereNotNull()
          .map((e) => TableStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final replicationTaskArn = this.replicationTaskArn;
    final tableStatistics = this.tableStatistics;
    return {
      if (marker != null) 'Marker': marker,
      if (replicationTaskArn != null) 'ReplicationTaskArn': replicationTaskArn,
      if (tableStatistics != null) 'TableStatistics': tableStatistics,
    };
  }
}

enum DmsSslModeValue {
  none,
  require,
  verifyCa,
  verifyFull,
}

extension on DmsSslModeValue {
  String toValue() {
    switch (this) {
      case DmsSslModeValue.none:
        return 'none';
      case DmsSslModeValue.require:
        return 'require';
      case DmsSslModeValue.verifyCa:
        return 'verify-ca';
      case DmsSslModeValue.verifyFull:
        return 'verify-full';
    }
  }
}

extension on String {
  DmsSslModeValue toDmsSslModeValue() {
    switch (this) {
      case 'none':
        return DmsSslModeValue.none;
      case 'require':
        return DmsSslModeValue.require;
      case 'verify-ca':
        return DmsSslModeValue.verifyCa;
      case 'verify-full':
        return DmsSslModeValue.verifyFull;
    }
    throw Exception('$this is not known in enum DmsSslModeValue');
  }
}

/// The settings in JSON format for the DMS Transfer type source endpoint.
class DmsTransferSettings {
  /// The name of the S3 bucket to use.
  final String? bucketName;

  /// The IAM role that has permission to access the Amazon S3 bucket.
  final String? serviceAccessRoleArn;

  DmsTransferSettings({
    this.bucketName,
    this.serviceAccessRoleArn,
  });

  factory DmsTransferSettings.fromJson(Map<String, dynamic> json) {
    return DmsTransferSettings(
      bucketName: json['BucketName'] as String?,
      serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final serviceAccessRoleArn = this.serviceAccessRoleArn;
    return {
      if (bucketName != null) 'BucketName': bucketName,
      if (serviceAccessRoleArn != null)
        'ServiceAccessRoleArn': serviceAccessRoleArn,
    };
  }
}

/// Provides information that defines a DocumentDB endpoint.
class DocDbSettings {
  /// The database name on the DocumentDB source endpoint.
  final String? databaseName;

  /// Indicates the number of documents to preview to determine the document
  /// organization. Use this setting when <code>NestingLevel</code> is set to
  /// <code>"one"</code>.
  ///
  /// Must be a positive value greater than <code>0</code>. Default value is
  /// <code>1000</code>.
  final int? docsToInvestigate;

  /// Specifies the document ID. Use this setting when <code>NestingLevel</code>
  /// is set to <code>"none"</code>.
  ///
  /// Default value is <code>"false"</code>.
  final bool? extractDocId;

  /// The AWS KMS key identifier that is used to encrypt the content on the
  /// replication instance. If you don't specify a value for the
  /// <code>KmsKeyId</code> parameter, then AWS DMS uses your default encryption
  /// key. AWS KMS creates the default encryption key for your AWS account. Your
  /// AWS account has a different default encryption key for each AWS Region.
  final String? kmsKeyId;

  /// Specifies either document or table mode.
  ///
  /// Default value is <code>"none"</code>. Specify <code>"none"</code> to use
  /// document mode. Specify <code>"one"</code> to use table mode.
  final NestingLevelValue? nestingLevel;

  /// The password for the user account you use to access the DocumentDB source
  /// endpoint.
  final String? password;

  /// The port value for the DocumentDB source endpoint.
  final int? port;

  /// The full Amazon Resource Name (ARN) of the IAM role that specifies AWS DMS
  /// as the trusted entity and grants the required permissions to access the
  /// value in <code>SecretsManagerSecret</code>.
  /// <code>SecretsManagerSecret</code> has the value of the AWS Secrets Manager
  /// secret that allows access to the DocumentDB endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and <code>SecretsManagerSecretId</code>.
  /// Or you can specify clear-text values for <code>UserName</code>,
  /// <code>Password</code>, <code>ServerName</code>, and <code>Port</code>. You
  /// can't specify both. For more information on creating this
  /// <code>SecretsManagerSecret</code> and the
  /// <code>SecretsManagerAccessRoleArn</code> and
  /// <code>SecretsManagerSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerAccessRoleArn;

  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerSecret</code> that contains the DocumentDB endpoint
  /// connection details.
  final String? secretsManagerSecretId;

  /// The name of the server on the DocumentDB source endpoint.
  final String? serverName;

  /// The user name you use to access the DocumentDB source endpoint.
  final String? username;

  DocDbSettings({
    this.databaseName,
    this.docsToInvestigate,
    this.extractDocId,
    this.kmsKeyId,
    this.nestingLevel,
    this.password,
    this.port,
    this.secretsManagerAccessRoleArn,
    this.secretsManagerSecretId,
    this.serverName,
    this.username,
  });

  factory DocDbSettings.fromJson(Map<String, dynamic> json) {
    return DocDbSettings(
      databaseName: json['DatabaseName'] as String?,
      docsToInvestigate: json['DocsToInvestigate'] as int?,
      extractDocId: json['ExtractDocId'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      nestingLevel: (json['NestingLevel'] as String?)?.toNestingLevelValue(),
      password: json['Password'] as String?,
      port: json['Port'] as int?,
      secretsManagerAccessRoleArn:
          json['SecretsManagerAccessRoleArn'] as String?,
      secretsManagerSecretId: json['SecretsManagerSecretId'] as String?,
      serverName: json['ServerName'] as String?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final docsToInvestigate = this.docsToInvestigate;
    final extractDocId = this.extractDocId;
    final kmsKeyId = this.kmsKeyId;
    final nestingLevel = this.nestingLevel;
    final password = this.password;
    final port = this.port;
    final secretsManagerAccessRoleArn = this.secretsManagerAccessRoleArn;
    final secretsManagerSecretId = this.secretsManagerSecretId;
    final serverName = this.serverName;
    final username = this.username;
    return {
      if (databaseName != null) 'DatabaseName': databaseName,
      if (docsToInvestigate != null) 'DocsToInvestigate': docsToInvestigate,
      if (extractDocId != null) 'ExtractDocId': extractDocId,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (nestingLevel != null) 'NestingLevel': nestingLevel.toValue(),
      if (password != null) 'Password': password,
      if (port != null) 'Port': port,
      if (secretsManagerAccessRoleArn != null)
        'SecretsManagerAccessRoleArn': secretsManagerAccessRoleArn,
      if (secretsManagerSecretId != null)
        'SecretsManagerSecretId': secretsManagerSecretId,
      if (serverName != null) 'ServerName': serverName,
      if (username != null) 'Username': username,
    };
  }
}

/// Provides the Amazon Resource Name (ARN) of the AWS Identity and Access
/// Management (IAM) role used to define an Amazon DynamoDB target endpoint.
class DynamoDbSettings {
  /// The Amazon Resource Name (ARN) used by the service access IAM role.
  final String serviceAccessRoleArn;

  DynamoDbSettings({
    required this.serviceAccessRoleArn,
  });

  factory DynamoDbSettings.fromJson(Map<String, dynamic> json) {
    return DynamoDbSettings(
      serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceAccessRoleArn = this.serviceAccessRoleArn;
    return {
      'ServiceAccessRoleArn': serviceAccessRoleArn,
    };
  }
}

/// Provides information that defines an Elasticsearch endpoint.
class ElasticsearchSettings {
  /// The endpoint for the Elasticsearch cluster. AWS DMS uses HTTPS if a
  /// transport protocol (http/https) is not specified.
  final String endpointUri;

  /// The Amazon Resource Name (ARN) used by service to access the IAM role.
  final String serviceAccessRoleArn;

  /// The maximum number of seconds for which DMS retries failed API requests to
  /// the Elasticsearch cluster.
  final int? errorRetryDuration;

  /// The maximum percentage of records that can fail to be written before a full
  /// load operation stops.
  ///
  /// To avoid early failure, this counter is only effective after 1000 records
  /// are transferred. Elasticsearch also has the concept of error monitoring
  /// during the last 10 minutes of an Observation Window. If transfer of all
  /// records fail in the last 10 minutes, the full load operation stops.
  final int? fullLoadErrorPercentage;

  ElasticsearchSettings({
    required this.endpointUri,
    required this.serviceAccessRoleArn,
    this.errorRetryDuration,
    this.fullLoadErrorPercentage,
  });

  factory ElasticsearchSettings.fromJson(Map<String, dynamic> json) {
    return ElasticsearchSettings(
      endpointUri: json['EndpointUri'] as String,
      serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
      errorRetryDuration: json['ErrorRetryDuration'] as int?,
      fullLoadErrorPercentage: json['FullLoadErrorPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointUri = this.endpointUri;
    final serviceAccessRoleArn = this.serviceAccessRoleArn;
    final errorRetryDuration = this.errorRetryDuration;
    final fullLoadErrorPercentage = this.fullLoadErrorPercentage;
    return {
      'EndpointUri': endpointUri,
      'ServiceAccessRoleArn': serviceAccessRoleArn,
      if (errorRetryDuration != null) 'ErrorRetryDuration': errorRetryDuration,
      if (fullLoadErrorPercentage != null)
        'FullLoadErrorPercentage': fullLoadErrorPercentage,
    };
  }
}

enum EncodingTypeValue {
  plain,
  plainDictionary,
  rleDictionary,
}

extension on EncodingTypeValue {
  String toValue() {
    switch (this) {
      case EncodingTypeValue.plain:
        return 'plain';
      case EncodingTypeValue.plainDictionary:
        return 'plain-dictionary';
      case EncodingTypeValue.rleDictionary:
        return 'rle-dictionary';
    }
  }
}

extension on String {
  EncodingTypeValue toEncodingTypeValue() {
    switch (this) {
      case 'plain':
        return EncodingTypeValue.plain;
      case 'plain-dictionary':
        return EncodingTypeValue.plainDictionary;
      case 'rle-dictionary':
        return EncodingTypeValue.rleDictionary;
    }
    throw Exception('$this is not known in enum EncodingTypeValue');
  }
}

enum EncryptionModeValue {
  sseS3,
  sseKms,
}

extension on EncryptionModeValue {
  String toValue() {
    switch (this) {
      case EncryptionModeValue.sseS3:
        return 'sse-s3';
      case EncryptionModeValue.sseKms:
        return 'sse-kms';
    }
  }
}

extension on String {
  EncryptionModeValue toEncryptionModeValue() {
    switch (this) {
      case 'sse-s3':
        return EncryptionModeValue.sseS3;
      case 'sse-kms':
        return EncryptionModeValue.sseKms;
    }
    throw Exception('$this is not known in enum EncryptionModeValue');
  }
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
class Endpoint {
  /// The Amazon Resource Name (ARN) used for SSL connection to the endpoint.
  final String? certificateArn;

  /// The name of the database at the endpoint.
  final String? databaseName;

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
  final DmsTransferSettings? dmsTransferSettings;
  final DocDbSettings? docDbSettings;

  /// The settings for the DynamoDB target endpoint. For more information, see the
  /// <code>DynamoDBSettings</code> structure.
  final DynamoDbSettings? dynamoDbSettings;

  /// The settings for the Elasticsearch source endpoint. For more information,
  /// see the <code>ElasticsearchSettings</code> structure.
  final ElasticsearchSettings? elasticsearchSettings;

  /// The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.
  final String? endpointArn;

  /// The database endpoint identifier. Identifiers must begin with a letter and
  /// must contain only ASCII letters, digits, and hyphens. They can't end with a
  /// hyphen or contain two consecutive hyphens.
  final String? endpointIdentifier;

  /// The type of endpoint. Valid values are <code>source</code> and
  /// <code>target</code>.
  final ReplicationEndpointTypeValue? endpointType;

  /// The expanded name for the engine name. For example, if the
  /// <code>EngineName</code> parameter is "aurora," this value would be "Amazon
  /// Aurora MySQL."
  final String? engineDisplayName;

  /// The database engine name. Valid values, depending on the EndpointType,
  /// include <code>"mysql"</code>, <code>"oracle"</code>,
  /// <code>"postgres"</code>, <code>"mariadb"</code>, <code>"aurora"</code>,
  /// <code>"aurora-postgresql"</code>, <code>"redshift"</code>,
  /// <code>"s3"</code>, <code>"db2"</code>, <code>"azuredb"</code>,
  /// <code>"sybase"</code>, <code>"dynamodb"</code>, <code>"mongodb"</code>,
  /// <code>"kinesis"</code>, <code>"kafka"</code>, <code>"elasticsearch"</code>,
  /// <code>"documentdb"</code>, <code>"sqlserver"</code>, and
  /// <code>"neptune"</code>.
  final String? engineName;

  /// Value returned by a call to CreateEndpoint that can be used for
  /// cross-account validation. Use it on a subsequent call to CreateEndpoint to
  /// create the endpoint with a cross-account.
  final String? externalId;

  /// The external table definition.
  final String? externalTableDefinition;

  /// Additional connection attributes used to connect to the endpoint.
  final String? extraConnectionAttributes;

  /// The settings for the IBM Db2 LUW source endpoint. For more information, see
  /// the <code>IBMDb2Settings</code> structure.
  final IBMDb2Settings? iBMDb2Settings;

  /// The settings for the Apache Kafka target endpoint. For more information, see
  /// the <code>KafkaSettings</code> structure.
  final KafkaSettings? kafkaSettings;

  /// The settings for the Amazon Kinesis target endpoint. For more information,
  /// see the <code>KinesisSettings</code> structure.
  final KinesisSettings? kinesisSettings;

  /// An AWS KMS key identifier that is used to encrypt the connection parameters
  /// for the endpoint.
  ///
  /// If you don't specify a value for the <code>KmsKeyId</code> parameter, then
  /// AWS DMS uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  final String? kmsKeyId;

  /// The settings for the Microsoft SQL Server source and target endpoint. For
  /// more information, see the <code>MicrosoftSQLServerSettings</code> structure.
  final MicrosoftSQLServerSettings? microsoftSQLServerSettings;

  /// The settings for the MongoDB source endpoint. For more information, see the
  /// <code>MongoDbSettings</code> structure.
  final MongoDbSettings? mongoDbSettings;

  /// The settings for the MySQL source and target endpoint. For more information,
  /// see the <code>MySQLSettings</code> structure.
  final MySQLSettings? mySQLSettings;

  /// The settings for the Amazon Neptune target endpoint. For more information,
  /// see the <code>NeptuneSettings</code> structure.
  final NeptuneSettings? neptuneSettings;

  /// The settings for the Oracle source and target endpoint. For more
  /// information, see the <code>OracleSettings</code> structure.
  final OracleSettings? oracleSettings;

  /// The port value used to access the endpoint.
  final int? port;

  /// The settings for the PostgreSQL source and target endpoint. For more
  /// information, see the <code>PostgreSQLSettings</code> structure.
  final PostgreSQLSettings? postgreSQLSettings;

  /// Settings for the Amazon Redshift endpoint.
  final RedshiftSettings? redshiftSettings;

  /// The settings for the S3 target endpoint. For more information, see the
  /// <code>S3Settings</code> structure.
  final S3Settings? s3Settings;

  /// The name of the server at the endpoint.
  final String? serverName;

  /// The Amazon Resource Name (ARN) used by the service access IAM role.
  final String? serviceAccessRoleArn;

  /// The SSL mode used to connect to the endpoint. The default value is
  /// <code>none</code>.
  final DmsSslModeValue? sslMode;

  /// The status of the endpoint.
  final String? status;

  /// The settings for the SAP ASE source and target endpoint. For more
  /// information, see the <code>SybaseSettings</code> structure.
  final SybaseSettings? sybaseSettings;

  /// The user name used to connect to the endpoint.
  final String? username;

  Endpoint({
    this.certificateArn,
    this.databaseName,
    this.dmsTransferSettings,
    this.docDbSettings,
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
    this.iBMDb2Settings,
    this.kafkaSettings,
    this.kinesisSettings,
    this.kmsKeyId,
    this.microsoftSQLServerSettings,
    this.mongoDbSettings,
    this.mySQLSettings,
    this.neptuneSettings,
    this.oracleSettings,
    this.port,
    this.postgreSQLSettings,
    this.redshiftSettings,
    this.s3Settings,
    this.serverName,
    this.serviceAccessRoleArn,
    this.sslMode,
    this.status,
    this.sybaseSettings,
    this.username,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      certificateArn: json['CertificateArn'] as String?,
      databaseName: json['DatabaseName'] as String?,
      dmsTransferSettings: json['DmsTransferSettings'] != null
          ? DmsTransferSettings.fromJson(
              json['DmsTransferSettings'] as Map<String, dynamic>)
          : null,
      docDbSettings: json['DocDbSettings'] != null
          ? DocDbSettings.fromJson(
              json['DocDbSettings'] as Map<String, dynamic>)
          : null,
      dynamoDbSettings: json['DynamoDbSettings'] != null
          ? DynamoDbSettings.fromJson(
              json['DynamoDbSettings'] as Map<String, dynamic>)
          : null,
      elasticsearchSettings: json['ElasticsearchSettings'] != null
          ? ElasticsearchSettings.fromJson(
              json['ElasticsearchSettings'] as Map<String, dynamic>)
          : null,
      endpointArn: json['EndpointArn'] as String?,
      endpointIdentifier: json['EndpointIdentifier'] as String?,
      endpointType:
          (json['EndpointType'] as String?)?.toReplicationEndpointTypeValue(),
      engineDisplayName: json['EngineDisplayName'] as String?,
      engineName: json['EngineName'] as String?,
      externalId: json['ExternalId'] as String?,
      externalTableDefinition: json['ExternalTableDefinition'] as String?,
      extraConnectionAttributes: json['ExtraConnectionAttributes'] as String?,
      iBMDb2Settings: json['IBMDb2Settings'] != null
          ? IBMDb2Settings.fromJson(
              json['IBMDb2Settings'] as Map<String, dynamic>)
          : null,
      kafkaSettings: json['KafkaSettings'] != null
          ? KafkaSettings.fromJson(
              json['KafkaSettings'] as Map<String, dynamic>)
          : null,
      kinesisSettings: json['KinesisSettings'] != null
          ? KinesisSettings.fromJson(
              json['KinesisSettings'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['KmsKeyId'] as String?,
      microsoftSQLServerSettings: json['MicrosoftSQLServerSettings'] != null
          ? MicrosoftSQLServerSettings.fromJson(
              json['MicrosoftSQLServerSettings'] as Map<String, dynamic>)
          : null,
      mongoDbSettings: json['MongoDbSettings'] != null
          ? MongoDbSettings.fromJson(
              json['MongoDbSettings'] as Map<String, dynamic>)
          : null,
      mySQLSettings: json['MySQLSettings'] != null
          ? MySQLSettings.fromJson(
              json['MySQLSettings'] as Map<String, dynamic>)
          : null,
      neptuneSettings: json['NeptuneSettings'] != null
          ? NeptuneSettings.fromJson(
              json['NeptuneSettings'] as Map<String, dynamic>)
          : null,
      oracleSettings: json['OracleSettings'] != null
          ? OracleSettings.fromJson(
              json['OracleSettings'] as Map<String, dynamic>)
          : null,
      port: json['Port'] as int?,
      postgreSQLSettings: json['PostgreSQLSettings'] != null
          ? PostgreSQLSettings.fromJson(
              json['PostgreSQLSettings'] as Map<String, dynamic>)
          : null,
      redshiftSettings: json['RedshiftSettings'] != null
          ? RedshiftSettings.fromJson(
              json['RedshiftSettings'] as Map<String, dynamic>)
          : null,
      s3Settings: json['S3Settings'] != null
          ? S3Settings.fromJson(json['S3Settings'] as Map<String, dynamic>)
          : null,
      serverName: json['ServerName'] as String?,
      serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String?,
      sslMode: (json['SslMode'] as String?)?.toDmsSslModeValue(),
      status: json['Status'] as String?,
      sybaseSettings: json['SybaseSettings'] != null
          ? SybaseSettings.fromJson(
              json['SybaseSettings'] as Map<String, dynamic>)
          : null,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final databaseName = this.databaseName;
    final dmsTransferSettings = this.dmsTransferSettings;
    final docDbSettings = this.docDbSettings;
    final dynamoDbSettings = this.dynamoDbSettings;
    final elasticsearchSettings = this.elasticsearchSettings;
    final endpointArn = this.endpointArn;
    final endpointIdentifier = this.endpointIdentifier;
    final endpointType = this.endpointType;
    final engineDisplayName = this.engineDisplayName;
    final engineName = this.engineName;
    final externalId = this.externalId;
    final externalTableDefinition = this.externalTableDefinition;
    final extraConnectionAttributes = this.extraConnectionAttributes;
    final iBMDb2Settings = this.iBMDb2Settings;
    final kafkaSettings = this.kafkaSettings;
    final kinesisSettings = this.kinesisSettings;
    final kmsKeyId = this.kmsKeyId;
    final microsoftSQLServerSettings = this.microsoftSQLServerSettings;
    final mongoDbSettings = this.mongoDbSettings;
    final mySQLSettings = this.mySQLSettings;
    final neptuneSettings = this.neptuneSettings;
    final oracleSettings = this.oracleSettings;
    final port = this.port;
    final postgreSQLSettings = this.postgreSQLSettings;
    final redshiftSettings = this.redshiftSettings;
    final s3Settings = this.s3Settings;
    final serverName = this.serverName;
    final serviceAccessRoleArn = this.serviceAccessRoleArn;
    final sslMode = this.sslMode;
    final status = this.status;
    final sybaseSettings = this.sybaseSettings;
    final username = this.username;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (dmsTransferSettings != null)
        'DmsTransferSettings': dmsTransferSettings,
      if (docDbSettings != null) 'DocDbSettings': docDbSettings,
      if (dynamoDbSettings != null) 'DynamoDbSettings': dynamoDbSettings,
      if (elasticsearchSettings != null)
        'ElasticsearchSettings': elasticsearchSettings,
      if (endpointArn != null) 'EndpointArn': endpointArn,
      if (endpointIdentifier != null) 'EndpointIdentifier': endpointIdentifier,
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (engineDisplayName != null) 'EngineDisplayName': engineDisplayName,
      if (engineName != null) 'EngineName': engineName,
      if (externalId != null) 'ExternalId': externalId,
      if (externalTableDefinition != null)
        'ExternalTableDefinition': externalTableDefinition,
      if (extraConnectionAttributes != null)
        'ExtraConnectionAttributes': extraConnectionAttributes,
      if (iBMDb2Settings != null) 'IBMDb2Settings': iBMDb2Settings,
      if (kafkaSettings != null) 'KafkaSettings': kafkaSettings,
      if (kinesisSettings != null) 'KinesisSettings': kinesisSettings,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (microsoftSQLServerSettings != null)
        'MicrosoftSQLServerSettings': microsoftSQLServerSettings,
      if (mongoDbSettings != null) 'MongoDbSettings': mongoDbSettings,
      if (mySQLSettings != null) 'MySQLSettings': mySQLSettings,
      if (neptuneSettings != null) 'NeptuneSettings': neptuneSettings,
      if (oracleSettings != null) 'OracleSettings': oracleSettings,
      if (port != null) 'Port': port,
      if (postgreSQLSettings != null) 'PostgreSQLSettings': postgreSQLSettings,
      if (redshiftSettings != null) 'RedshiftSettings': redshiftSettings,
      if (s3Settings != null) 'S3Settings': s3Settings,
      if (serverName != null) 'ServerName': serverName,
      if (serviceAccessRoleArn != null)
        'ServiceAccessRoleArn': serviceAccessRoleArn,
      if (sslMode != null) 'SslMode': sslMode.toValue(),
      if (status != null) 'Status': status,
      if (sybaseSettings != null) 'SybaseSettings': sybaseSettings,
      if (username != null) 'Username': username,
    };
  }
}

/// Endpoint settings.
class EndpointSetting {
  /// The relevance or validity of an endpoint setting for an engine name and its
  /// endpoint type.
  final String? applicability;

  /// Enumerated values to use for this endpoint.
  final List<String>? enumValues;

  /// The maximum value of an endpoint setting that is of type <code>int</code>.
  final int? intValueMax;

  /// The minimum value of an endpoint setting that is of type <code>int</code>.
  final int? intValueMin;

  /// The name that you want to give the endpoint settings.
  final String? name;

  /// A value that marks this endpoint setting as sensitive.
  final bool? sensitive;

  /// The type of endpoint. Valid values are <code>source</code> and
  /// <code>target</code>.
  final EndpointSettingTypeValue? type;

  /// The unit of measure for this endpoint setting.
  final String? units;

  EndpointSetting({
    this.applicability,
    this.enumValues,
    this.intValueMax,
    this.intValueMin,
    this.name,
    this.sensitive,
    this.type,
    this.units,
  });

  factory EndpointSetting.fromJson(Map<String, dynamic> json) {
    return EndpointSetting(
      applicability: json['Applicability'] as String?,
      enumValues: (json['EnumValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      intValueMax: json['IntValueMax'] as int?,
      intValueMin: json['IntValueMin'] as int?,
      name: json['Name'] as String?,
      sensitive: json['Sensitive'] as bool?,
      type: (json['Type'] as String?)?.toEndpointSettingTypeValue(),
      units: json['Units'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicability = this.applicability;
    final enumValues = this.enumValues;
    final intValueMax = this.intValueMax;
    final intValueMin = this.intValueMin;
    final name = this.name;
    final sensitive = this.sensitive;
    final type = this.type;
    final units = this.units;
    return {
      if (applicability != null) 'Applicability': applicability,
      if (enumValues != null) 'EnumValues': enumValues,
      if (intValueMax != null) 'IntValueMax': intValueMax,
      if (intValueMin != null) 'IntValueMin': intValueMin,
      if (name != null) 'Name': name,
      if (sensitive != null) 'Sensitive': sensitive,
      if (type != null) 'Type': type.toValue(),
      if (units != null) 'Units': units,
    };
  }
}

enum EndpointSettingTypeValue {
  string,
  boolean,
  integer,
  $enum,
}

extension on EndpointSettingTypeValue {
  String toValue() {
    switch (this) {
      case EndpointSettingTypeValue.string:
        return 'string';
      case EndpointSettingTypeValue.boolean:
        return 'boolean';
      case EndpointSettingTypeValue.integer:
        return 'integer';
      case EndpointSettingTypeValue.$enum:
        return 'enum';
    }
  }
}

extension on String {
  EndpointSettingTypeValue toEndpointSettingTypeValue() {
    switch (this) {
      case 'string':
        return EndpointSettingTypeValue.string;
      case 'boolean':
        return EndpointSettingTypeValue.boolean;
      case 'integer':
        return EndpointSettingTypeValue.integer;
      case 'enum':
        return EndpointSettingTypeValue.$enum;
    }
    throw Exception('$this is not known in enum EndpointSettingTypeValue');
  }
}

/// Describes an identifiable significant activity that affects a replication
/// instance or task. This object can provide the message, the available event
/// categories, the date and source of the event, and the AWS DMS resource type.
class Event {
  /// The date of the event.
  final DateTime? date;

  /// The event categories available for the specified source type.
  final List<String>? eventCategories;

  /// The event message.
  final String? message;

  /// The identifier of an event source.
  final String? sourceIdentifier;

  /// The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | endpoint | replication-task
  final SourceType? sourceType;

  Event({
    this.date,
    this.eventCategories,
    this.message,
    this.sourceIdentifier,
    this.sourceType,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: timeStampFromJson(json['Date']),
      eventCategories: (json['EventCategories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      message: json['Message'] as String?,
      sourceIdentifier: json['SourceIdentifier'] as String?,
      sourceType: (json['SourceType'] as String?)?.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final eventCategories = this.eventCategories;
    final message = this.message;
    final sourceIdentifier = this.sourceIdentifier;
    final sourceType = this.sourceType;
    return {
      if (date != null) 'Date': unixTimestampToJson(date),
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (message != null) 'Message': message,
      if (sourceIdentifier != null) 'SourceIdentifier': sourceIdentifier,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
    };
  }
}

/// Lists categories of events subscribed to, and generated by, the applicable
/// AWS DMS resource type. This data type appears in response to the <a
/// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_EventCategoryGroup.html">
/// <code>DescribeEventCategories</code> </a> action.
class EventCategoryGroup {
  /// A list of event categories from a source type that you've chosen.
  final List<String>? eventCategories;

  /// The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-server | security-group |
  /// replication-task
  final String? sourceType;

  EventCategoryGroup({
    this.eventCategories,
    this.sourceType,
  });

  factory EventCategoryGroup.fromJson(Map<String, dynamic> json) {
    return EventCategoryGroup(
      eventCategories: (json['EventCategories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sourceType: json['SourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventCategories = this.eventCategories;
    final sourceType = this.sourceType;
    return {
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (sourceType != null) 'SourceType': sourceType,
    };
  }
}

/// Describes an event notification subscription created by the
/// <code>CreateEventSubscription</code> operation.
class EventSubscription {
  /// The AWS DMS event notification subscription Id.
  final String? custSubscriptionId;

  /// The AWS customer account associated with the AWS DMS event notification
  /// subscription.
  final String? customerAwsId;

  /// Boolean value that indicates if the event subscription is enabled.
  final bool? enabled;

  /// A lists of event categories.
  final List<String>? eventCategoriesList;

  /// The topic ARN of the AWS DMS event notification subscription.
  final String? snsTopicArn;

  /// A list of source Ids for the event subscription.
  final List<String>? sourceIdsList;

  /// The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-server | security-group |
  /// replication-task
  final String? sourceType;

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
  final String? status;

  /// The time the AWS DMS event notification subscription was created.
  final String? subscriptionCreationTime;

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

  factory EventSubscription.fromJson(Map<String, dynamic> json) {
    return EventSubscription(
      custSubscriptionId: json['CustSubscriptionId'] as String?,
      customerAwsId: json['CustomerAwsId'] as String?,
      enabled: json['Enabled'] as bool?,
      eventCategoriesList: (json['EventCategoriesList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      snsTopicArn: json['SnsTopicArn'] as String?,
      sourceIdsList: (json['SourceIdsList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sourceType: json['SourceType'] as String?,
      status: json['Status'] as String?,
      subscriptionCreationTime: json['SubscriptionCreationTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final custSubscriptionId = this.custSubscriptionId;
    final customerAwsId = this.customerAwsId;
    final enabled = this.enabled;
    final eventCategoriesList = this.eventCategoriesList;
    final snsTopicArn = this.snsTopicArn;
    final sourceIdsList = this.sourceIdsList;
    final sourceType = this.sourceType;
    final status = this.status;
    final subscriptionCreationTime = this.subscriptionCreationTime;
    return {
      if (custSubscriptionId != null) 'CustSubscriptionId': custSubscriptionId,
      if (customerAwsId != null) 'CustomerAwsId': customerAwsId,
      if (enabled != null) 'Enabled': enabled,
      if (eventCategoriesList != null)
        'EventCategoriesList': eventCategoriesList,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (sourceIdsList != null) 'SourceIdsList': sourceIdsList,
      if (sourceType != null) 'SourceType': sourceType,
      if (status != null) 'Status': status,
      if (subscriptionCreationTime != null)
        'SubscriptionCreationTime': subscriptionCreationTime,
    };
  }
}

/// Identifies the name and value of a filter object. This filter is used to
/// limit the number and type of AWS DMS objects that are returned for a
/// particular <code>Describe*</code> call or similar operation. Filters are
/// used as an optional parameter for certain API operations.
class Filter {
  /// The name of the filter as specified for a <code>Describe*</code> or similar
  /// operation.
  final String name;

  /// The filter value, which can specify one or more values used to narrow the
  /// returned results.
  final List<String> values;

  Filter({
    required this.name,
    required this.values,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      name: json['Name'] as String,
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name,
      'Values': values,
    };
  }
}

/// Provides information that defines an IBM Db2 LUW endpoint.
class IBMDb2Settings {
  /// For ongoing replication (CDC), use CurrentLSN to specify a log sequence
  /// number (LSN) where you want the replication to start.
  final String? currentLsn;

  /// Database name for the endpoint.
  final String? databaseName;

  /// Maximum number of bytes per read, as a NUMBER value. The default is 64 KB.
  final int? maxKBytesPerRead;

  /// Endpoint connection password.
  final String? password;

  /// Endpoint TCP port.
  final int? port;

  /// The full Amazon Resource Name (ARN) of the IAM role that specifies AWS DMS
  /// as the trusted entity and grants the required permissions to access the
  /// value in <code>SecretsManagerSecret</code>.
  /// <code>SecretsManagerSecret</code> has the value of the AWS Secrets Manager
  /// secret that allows access to the Db2 LUW endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and <code>SecretsManagerSecretId</code>.
  /// Or you can specify clear-text values for <code>UserName</code>,
  /// <code>Password</code>, <code>ServerName</code>, and <code>Port</code>. You
  /// can't specify both. For more information on creating this
  /// <code>SecretsManagerSecret</code> and the
  /// <code>SecretsManagerAccessRoleArn</code> and
  /// <code>SecretsManagerSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerAccessRoleArn;

  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerSecret</code> that contains the Db2 LUW endpoint
  /// connection details.
  final String? secretsManagerSecretId;

  /// Fully qualified domain name of the endpoint.
  final String? serverName;

  /// Enables ongoing replication (CDC) as a BOOLEAN value. The default is true.
  final bool? setDataCaptureChanges;

  /// Endpoint connection user name.
  final String? username;

  IBMDb2Settings({
    this.currentLsn,
    this.databaseName,
    this.maxKBytesPerRead,
    this.password,
    this.port,
    this.secretsManagerAccessRoleArn,
    this.secretsManagerSecretId,
    this.serverName,
    this.setDataCaptureChanges,
    this.username,
  });

  factory IBMDb2Settings.fromJson(Map<String, dynamic> json) {
    return IBMDb2Settings(
      currentLsn: json['CurrentLsn'] as String?,
      databaseName: json['DatabaseName'] as String?,
      maxKBytesPerRead: json['MaxKBytesPerRead'] as int?,
      password: json['Password'] as String?,
      port: json['Port'] as int?,
      secretsManagerAccessRoleArn:
          json['SecretsManagerAccessRoleArn'] as String?,
      secretsManagerSecretId: json['SecretsManagerSecretId'] as String?,
      serverName: json['ServerName'] as String?,
      setDataCaptureChanges: json['SetDataCaptureChanges'] as bool?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentLsn = this.currentLsn;
    final databaseName = this.databaseName;
    final maxKBytesPerRead = this.maxKBytesPerRead;
    final password = this.password;
    final port = this.port;
    final secretsManagerAccessRoleArn = this.secretsManagerAccessRoleArn;
    final secretsManagerSecretId = this.secretsManagerSecretId;
    final serverName = this.serverName;
    final setDataCaptureChanges = this.setDataCaptureChanges;
    final username = this.username;
    return {
      if (currentLsn != null) 'CurrentLsn': currentLsn,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (maxKBytesPerRead != null) 'MaxKBytesPerRead': maxKBytesPerRead,
      if (password != null) 'Password': password,
      if (port != null) 'Port': port,
      if (secretsManagerAccessRoleArn != null)
        'SecretsManagerAccessRoleArn': secretsManagerAccessRoleArn,
      if (secretsManagerSecretId != null)
        'SecretsManagerSecretId': secretsManagerSecretId,
      if (serverName != null) 'ServerName': serverName,
      if (setDataCaptureChanges != null)
        'SetDataCaptureChanges': setDataCaptureChanges,
      if (username != null) 'Username': username,
    };
  }
}

class ImportCertificateResponse {
  /// The certificate to be uploaded.
  final Certificate? certificate;

  ImportCertificateResponse({
    this.certificate,
  });

  factory ImportCertificateResponse.fromJson(Map<String, dynamic> json) {
    return ImportCertificateResponse(
      certificate: json['Certificate'] != null
          ? Certificate.fromJson(json['Certificate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    return {
      if (certificate != null) 'Certificate': certificate,
    };
  }
}

enum KafkaSecurityProtocol {
  plaintext,
  sslAuthentication,
  sslEncryption,
  saslSsl,
}

extension on KafkaSecurityProtocol {
  String toValue() {
    switch (this) {
      case KafkaSecurityProtocol.plaintext:
        return 'plaintext';
      case KafkaSecurityProtocol.sslAuthentication:
        return 'ssl-authentication';
      case KafkaSecurityProtocol.sslEncryption:
        return 'ssl-encryption';
      case KafkaSecurityProtocol.saslSsl:
        return 'sasl-ssl';
    }
  }
}

extension on String {
  KafkaSecurityProtocol toKafkaSecurityProtocol() {
    switch (this) {
      case 'plaintext':
        return KafkaSecurityProtocol.plaintext;
      case 'ssl-authentication':
        return KafkaSecurityProtocol.sslAuthentication;
      case 'ssl-encryption':
        return KafkaSecurityProtocol.sslEncryption;
      case 'sasl-ssl':
        return KafkaSecurityProtocol.saslSsl;
    }
    throw Exception('$this is not known in enum KafkaSecurityProtocol');
  }
}

/// Provides information that describes an Apache Kafka endpoint. This
/// information includes the output format of records applied to the endpoint
/// and details of transaction and control table data information.
class KafkaSettings {
  /// A comma-separated list of one or more broker locations in your Kafka cluster
  /// that host your Kafka instance. Specify each broker location in the form
  /// <code> <i>broker-hostname-or-ip</i>:<i>port</i> </code>. For example,
  /// <code>"ec2-12-345-678-901.compute-1.amazonaws.com:2345"</code>. For more
  /// information and examples of specifying a list of broker locations, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html">Using
  /// Apache Kafka as a target for AWS Database Migration Service</a> in the
  /// <i>AWS Data Migration Service User Guide</i>.
  final String? broker;

  /// Shows detailed control information for table definition, column definition,
  /// and table and column changes in the Kafka message output. The default is
  /// <code>false</code>.
  final bool? includeControlDetails;

  /// Include NULL and empty columns for records migrated to the endpoint. The
  /// default is <code>false</code>.
  final bool? includeNullAndEmpty;

  /// Shows the partition value within the Kafka message output, unless the
  /// partition type is <code>schema-table-type</code>. The default is
  /// <code>false</code>.
  final bool? includePartitionValue;

  /// Includes any data definition language (DDL) operations that change the table
  /// in the control data, such as <code>rename-table</code>,
  /// <code>drop-table</code>, <code>add-column</code>, <code>drop-column</code>,
  /// and <code>rename-column</code>. The default is <code>false</code>.
  final bool? includeTableAlterOperations;

  /// Provides detailed transaction information from the source database. This
  /// information includes a commit timestamp, a log position, and values for
  /// <code>transaction_id</code>, previous <code>transaction_id</code>, and
  /// <code>transaction_record_id</code> (the record offset within a transaction).
  /// The default is <code>false</code>.
  final bool? includeTransactionDetails;

  /// The output format for the records created on the endpoint. The message
  /// format is <code>JSON</code> (default) or <code>JSON_UNFORMATTED</code> (a
  /// single line with no tab).
  final MessageFormatValue? messageFormat;

  /// The maximum size in bytes for records created on the endpoint The default is
  /// 1,000,000.
  final int? messageMaxBytes;

  /// Prefixes schema and table names to partition values, when the partition type
  /// is <code>primary-key-type</code>. Doing this increases data distribution
  /// among Kafka partitions. For example, suppose that a SysBench schema has
  /// thousands of tables and each table has only limited range for a primary key.
  /// In this case, the same primary key is sent from thousands of tables to the
  /// same partition, which causes throttling. The default is <code>false</code>.
  final bool? partitionIncludeSchemaTable;

  /// The secure password you created when you first set up your MSK cluster to
  /// validate a client identity and make an encrypted connection between server
  /// and client using SASL-SSL authentication.
  final String? saslPassword;

  /// The secure username you created when you first set up your MSK cluster to
  /// validate a client identity and make an encrypted connection between server
  /// and client using SASL-SSL authentication.
  final String? saslUsername;

  /// Set secure connection to a Kafka target endpoint using Transport Layer
  /// Security (TLS). Options include <code>ssl-encryption</code>,
  /// <code>ssl-authentication</code>, and <code>sasl-ssl</code>.
  /// <code>sasl-ssl</code> requires <code>SaslUsername</code> and
  /// <code>SaslPassword</code>.
  final KafkaSecurityProtocol? securityProtocol;

  /// The Amazon Resource Name (ARN) for the private Certification Authority (CA)
  /// cert that AWS DMS uses to securely connect to your Kafka target endpoint.
  final String? sslCaCertificateArn;

  /// The Amazon Resource Name (ARN) of the client certificate used to securely
  /// connect to a Kafka target endpoint.
  final String? sslClientCertificateArn;

  /// The Amazon Resource Name (ARN) for the client private key used to securely
  /// connect to a Kafka target endpoint.
  final String? sslClientKeyArn;

  /// The password for the client private key used to securely connect to a Kafka
  /// target endpoint.
  final String? sslClientKeyPassword;

  /// The topic to which you migrate the data. If you don't specify a topic, AWS
  /// DMS specifies <code>"kafka-default-topic"</code> as the migration topic.
  final String? topic;

  KafkaSettings({
    this.broker,
    this.includeControlDetails,
    this.includeNullAndEmpty,
    this.includePartitionValue,
    this.includeTableAlterOperations,
    this.includeTransactionDetails,
    this.messageFormat,
    this.messageMaxBytes,
    this.partitionIncludeSchemaTable,
    this.saslPassword,
    this.saslUsername,
    this.securityProtocol,
    this.sslCaCertificateArn,
    this.sslClientCertificateArn,
    this.sslClientKeyArn,
    this.sslClientKeyPassword,
    this.topic,
  });

  factory KafkaSettings.fromJson(Map<String, dynamic> json) {
    return KafkaSettings(
      broker: json['Broker'] as String?,
      includeControlDetails: json['IncludeControlDetails'] as bool?,
      includeNullAndEmpty: json['IncludeNullAndEmpty'] as bool?,
      includePartitionValue: json['IncludePartitionValue'] as bool?,
      includeTableAlterOperations: json['IncludeTableAlterOperations'] as bool?,
      includeTransactionDetails: json['IncludeTransactionDetails'] as bool?,
      messageFormat: (json['MessageFormat'] as String?)?.toMessageFormatValue(),
      messageMaxBytes: json['MessageMaxBytes'] as int?,
      partitionIncludeSchemaTable: json['PartitionIncludeSchemaTable'] as bool?,
      saslPassword: json['SaslPassword'] as String?,
      saslUsername: json['SaslUsername'] as String?,
      securityProtocol:
          (json['SecurityProtocol'] as String?)?.toKafkaSecurityProtocol(),
      sslCaCertificateArn: json['SslCaCertificateArn'] as String?,
      sslClientCertificateArn: json['SslClientCertificateArn'] as String?,
      sslClientKeyArn: json['SslClientKeyArn'] as String?,
      sslClientKeyPassword: json['SslClientKeyPassword'] as String?,
      topic: json['Topic'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final broker = this.broker;
    final includeControlDetails = this.includeControlDetails;
    final includeNullAndEmpty = this.includeNullAndEmpty;
    final includePartitionValue = this.includePartitionValue;
    final includeTableAlterOperations = this.includeTableAlterOperations;
    final includeTransactionDetails = this.includeTransactionDetails;
    final messageFormat = this.messageFormat;
    final messageMaxBytes = this.messageMaxBytes;
    final partitionIncludeSchemaTable = this.partitionIncludeSchemaTable;
    final saslPassword = this.saslPassword;
    final saslUsername = this.saslUsername;
    final securityProtocol = this.securityProtocol;
    final sslCaCertificateArn = this.sslCaCertificateArn;
    final sslClientCertificateArn = this.sslClientCertificateArn;
    final sslClientKeyArn = this.sslClientKeyArn;
    final sslClientKeyPassword = this.sslClientKeyPassword;
    final topic = this.topic;
    return {
      if (broker != null) 'Broker': broker,
      if (includeControlDetails != null)
        'IncludeControlDetails': includeControlDetails,
      if (includeNullAndEmpty != null)
        'IncludeNullAndEmpty': includeNullAndEmpty,
      if (includePartitionValue != null)
        'IncludePartitionValue': includePartitionValue,
      if (includeTableAlterOperations != null)
        'IncludeTableAlterOperations': includeTableAlterOperations,
      if (includeTransactionDetails != null)
        'IncludeTransactionDetails': includeTransactionDetails,
      if (messageFormat != null) 'MessageFormat': messageFormat.toValue(),
      if (messageMaxBytes != null) 'MessageMaxBytes': messageMaxBytes,
      if (partitionIncludeSchemaTable != null)
        'PartitionIncludeSchemaTable': partitionIncludeSchemaTable,
      if (saslPassword != null) 'SaslPassword': saslPassword,
      if (saslUsername != null) 'SaslUsername': saslUsername,
      if (securityProtocol != null)
        'SecurityProtocol': securityProtocol.toValue(),
      if (sslCaCertificateArn != null)
        'SslCaCertificateArn': sslCaCertificateArn,
      if (sslClientCertificateArn != null)
        'SslClientCertificateArn': sslClientCertificateArn,
      if (sslClientKeyArn != null) 'SslClientKeyArn': sslClientKeyArn,
      if (sslClientKeyPassword != null)
        'SslClientKeyPassword': sslClientKeyPassword,
      if (topic != null) 'Topic': topic,
    };
  }
}

/// Provides information that describes an Amazon Kinesis Data Stream endpoint.
/// This information includes the output format of records applied to the
/// endpoint and details of transaction and control table data information.
class KinesisSettings {
  /// Shows detailed control information for table definition, column definition,
  /// and table and column changes in the Kinesis message output. The default is
  /// <code>false</code>.
  final bool? includeControlDetails;

  /// Include NULL and empty columns for records migrated to the endpoint. The
  /// default is <code>false</code>.
  final bool? includeNullAndEmpty;

  /// Shows the partition value within the Kinesis message output, unless the
  /// partition type is <code>schema-table-type</code>. The default is
  /// <code>false</code>.
  final bool? includePartitionValue;

  /// Includes any data definition language (DDL) operations that change the table
  /// in the control data, such as <code>rename-table</code>,
  /// <code>drop-table</code>, <code>add-column</code>, <code>drop-column</code>,
  /// and <code>rename-column</code>. The default is <code>false</code>.
  final bool? includeTableAlterOperations;

  /// Provides detailed transaction information from the source database. This
  /// information includes a commit timestamp, a log position, and values for
  /// <code>transaction_id</code>, previous <code>transaction_id</code>, and
  /// <code>transaction_record_id</code> (the record offset within a transaction).
  /// The default is <code>false</code>.
  final bool? includeTransactionDetails;

  /// The output format for the records created on the endpoint. The message
  /// format is <code>JSON</code> (default) or <code>JSON_UNFORMATTED</code> (a
  /// single line with no tab).
  final MessageFormatValue? messageFormat;

  /// Prefixes schema and table names to partition values, when the partition type
  /// is <code>primary-key-type</code>. Doing this increases data distribution
  /// among Kinesis shards. For example, suppose that a SysBench schema has
  /// thousands of tables and each table has only limited range for a primary key.
  /// In this case, the same primary key is sent from thousands of tables to the
  /// same shard, which causes throttling. The default is <code>false</code>.
  final bool? partitionIncludeSchemaTable;

  /// The Amazon Resource Name (ARN) for the AWS Identity and Access Management
  /// (IAM) role that AWS DMS uses to write to the Kinesis data stream.
  final String? serviceAccessRoleArn;

  /// The Amazon Resource Name (ARN) for the Amazon Kinesis Data Streams endpoint.
  final String? streamArn;

  KinesisSettings({
    this.includeControlDetails,
    this.includeNullAndEmpty,
    this.includePartitionValue,
    this.includeTableAlterOperations,
    this.includeTransactionDetails,
    this.messageFormat,
    this.partitionIncludeSchemaTable,
    this.serviceAccessRoleArn,
    this.streamArn,
  });

  factory KinesisSettings.fromJson(Map<String, dynamic> json) {
    return KinesisSettings(
      includeControlDetails: json['IncludeControlDetails'] as bool?,
      includeNullAndEmpty: json['IncludeNullAndEmpty'] as bool?,
      includePartitionValue: json['IncludePartitionValue'] as bool?,
      includeTableAlterOperations: json['IncludeTableAlterOperations'] as bool?,
      includeTransactionDetails: json['IncludeTransactionDetails'] as bool?,
      messageFormat: (json['MessageFormat'] as String?)?.toMessageFormatValue(),
      partitionIncludeSchemaTable: json['PartitionIncludeSchemaTable'] as bool?,
      serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String?,
      streamArn: json['StreamArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final includeControlDetails = this.includeControlDetails;
    final includeNullAndEmpty = this.includeNullAndEmpty;
    final includePartitionValue = this.includePartitionValue;
    final includeTableAlterOperations = this.includeTableAlterOperations;
    final includeTransactionDetails = this.includeTransactionDetails;
    final messageFormat = this.messageFormat;
    final partitionIncludeSchemaTable = this.partitionIncludeSchemaTable;
    final serviceAccessRoleArn = this.serviceAccessRoleArn;
    final streamArn = this.streamArn;
    return {
      if (includeControlDetails != null)
        'IncludeControlDetails': includeControlDetails,
      if (includeNullAndEmpty != null)
        'IncludeNullAndEmpty': includeNullAndEmpty,
      if (includePartitionValue != null)
        'IncludePartitionValue': includePartitionValue,
      if (includeTableAlterOperations != null)
        'IncludeTableAlterOperations': includeTableAlterOperations,
      if (includeTransactionDetails != null)
        'IncludeTransactionDetails': includeTransactionDetails,
      if (messageFormat != null) 'MessageFormat': messageFormat.toValue(),
      if (partitionIncludeSchemaTable != null)
        'PartitionIncludeSchemaTable': partitionIncludeSchemaTable,
      if (serviceAccessRoleArn != null)
        'ServiceAccessRoleArn': serviceAccessRoleArn,
      if (streamArn != null) 'StreamArn': streamArn,
    };
  }
}

/// <p/>
class ListTagsForResourceResponse {
  /// A list of tags for the resource.
  final List<Tag>? tagList;

  ListTagsForResourceResponse({
    this.tagList,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

enum MessageFormatValue {
  json,
  jsonUnformatted,
}

extension on MessageFormatValue {
  String toValue() {
    switch (this) {
      case MessageFormatValue.json:
        return 'json';
      case MessageFormatValue.jsonUnformatted:
        return 'json-unformatted';
    }
  }
}

extension on String {
  MessageFormatValue toMessageFormatValue() {
    switch (this) {
      case 'json':
        return MessageFormatValue.json;
      case 'json-unformatted':
        return MessageFormatValue.jsonUnformatted;
    }
    throw Exception('$this is not known in enum MessageFormatValue');
  }
}

/// Provides information that defines a Microsoft SQL Server endpoint.
class MicrosoftSQLServerSettings {
  /// The maximum size of the packets (in bytes) used to transfer data using BCP.
  final int? bcpPacketSize;

  /// Specifies a file group for the AWS DMS internal tables. When the replication
  /// task starts, all the internal AWS DMS control tables (awsdms_
  /// apply_exception, awsdms_apply, awsdms_changes) are created for the specified
  /// file group.
  final String? controlTablesFileGroup;

  /// Database name for the endpoint.
  final String? databaseName;

  /// Endpoint connection password.
  final String? password;

  /// Endpoint TCP port.
  final int? port;

  /// Cleans and recreates table metadata information on the replication instance
  /// when a mismatch occurs. An example is a situation where running an alter DDL
  /// statement on a table might result in different information about the table
  /// cached in the replication instance.
  final bool? querySingleAlwaysOnNode;

  /// When this attribute is set to <code>Y</code>, AWS DMS only reads changes
  /// from transaction log backups and doesn't read from the active transaction
  /// log file during ongoing replication. Setting this parameter to
  /// <code>Y</code> enables you to control active transaction log file growth
  /// during full load and ongoing replication tasks. However, it can add some
  /// source latency to ongoing replication.
  final bool? readBackupOnly;

  /// Use this attribute to minimize the need to access the backup log and enable
  /// AWS DMS to prevent truncation using one of the following two methods.
  ///
  /// <i>Start transactions in the database:</i> This is the default method. When
  /// this method is used, AWS DMS prevents TLOG truncation by mimicking a
  /// transaction in the database. As long as such a transaction is open, changes
  /// that appear after the transaction started aren't truncated. If you need
  /// Microsoft Replication to be enabled in your database, then you must choose
  /// this method.
  ///
  /// <i>Exclusively use sp_repldone within a single task</i>: When this method is
  /// used, AWS DMS reads the changes and then uses sp_repldone to mark the TLOG
  /// transactions as ready for truncation. Although this method doesn't involve
  /// any transactional activities, it can only be used when Microsoft Replication
  /// isn't running. Also, when using this method, only one AWS DMS task can
  /// access the database at any given time. Therefore, if you need to run
  /// parallel AWS DMS tasks against the same database, use the default method.
  final SafeguardPolicy? safeguardPolicy;

  /// The full Amazon Resource Name (ARN) of the IAM role that specifies AWS DMS
  /// as the trusted entity and grants the required permissions to access the
  /// value in <code>SecretsManagerSecret</code>.
  /// <code>SecretsManagerSecret</code> has the value of the AWS Secrets Manager
  /// secret that allows access to the SQL Server endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and <code>SecretsManagerSecretId</code>.
  /// Or you can specify clear-text values for <code>UserName</code>,
  /// <code>Password</code>, <code>ServerName</code>, and <code>Port</code>. You
  /// can't specify both. For more information on creating this
  /// <code>SecretsManagerSecret</code> and the
  /// <code>SecretsManagerAccessRoleArn</code> and
  /// <code>SecretsManagerSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerAccessRoleArn;

  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerSecret</code> that contains the SQL Server endpoint
  /// connection details.
  final String? secretsManagerSecretId;

  /// Fully qualified domain name of the endpoint.
  final String? serverName;

  /// Use this to attribute to transfer data for full-load operations using BCP.
  /// When the target table contains an identity column that does not exist in the
  /// source table, you must disable the use BCP for loading table option.
  final bool? useBcpFullLoad;

  /// When this attribute is set to <code>Y</code>, DMS processes third-party
  /// transaction log backups if they are created in native format.
  final bool? useThirdPartyBackupDevice;

  /// Endpoint connection user name.
  final String? username;

  MicrosoftSQLServerSettings({
    this.bcpPacketSize,
    this.controlTablesFileGroup,
    this.databaseName,
    this.password,
    this.port,
    this.querySingleAlwaysOnNode,
    this.readBackupOnly,
    this.safeguardPolicy,
    this.secretsManagerAccessRoleArn,
    this.secretsManagerSecretId,
    this.serverName,
    this.useBcpFullLoad,
    this.useThirdPartyBackupDevice,
    this.username,
  });

  factory MicrosoftSQLServerSettings.fromJson(Map<String, dynamic> json) {
    return MicrosoftSQLServerSettings(
      bcpPacketSize: json['BcpPacketSize'] as int?,
      controlTablesFileGroup: json['ControlTablesFileGroup'] as String?,
      databaseName: json['DatabaseName'] as String?,
      password: json['Password'] as String?,
      port: json['Port'] as int?,
      querySingleAlwaysOnNode: json['QuerySingleAlwaysOnNode'] as bool?,
      readBackupOnly: json['ReadBackupOnly'] as bool?,
      safeguardPolicy:
          (json['SafeguardPolicy'] as String?)?.toSafeguardPolicy(),
      secretsManagerAccessRoleArn:
          json['SecretsManagerAccessRoleArn'] as String?,
      secretsManagerSecretId: json['SecretsManagerSecretId'] as String?,
      serverName: json['ServerName'] as String?,
      useBcpFullLoad: json['UseBcpFullLoad'] as bool?,
      useThirdPartyBackupDevice: json['UseThirdPartyBackupDevice'] as bool?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bcpPacketSize = this.bcpPacketSize;
    final controlTablesFileGroup = this.controlTablesFileGroup;
    final databaseName = this.databaseName;
    final password = this.password;
    final port = this.port;
    final querySingleAlwaysOnNode = this.querySingleAlwaysOnNode;
    final readBackupOnly = this.readBackupOnly;
    final safeguardPolicy = this.safeguardPolicy;
    final secretsManagerAccessRoleArn = this.secretsManagerAccessRoleArn;
    final secretsManagerSecretId = this.secretsManagerSecretId;
    final serverName = this.serverName;
    final useBcpFullLoad = this.useBcpFullLoad;
    final useThirdPartyBackupDevice = this.useThirdPartyBackupDevice;
    final username = this.username;
    return {
      if (bcpPacketSize != null) 'BcpPacketSize': bcpPacketSize,
      if (controlTablesFileGroup != null)
        'ControlTablesFileGroup': controlTablesFileGroup,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (password != null) 'Password': password,
      if (port != null) 'Port': port,
      if (querySingleAlwaysOnNode != null)
        'QuerySingleAlwaysOnNode': querySingleAlwaysOnNode,
      if (readBackupOnly != null) 'ReadBackupOnly': readBackupOnly,
      if (safeguardPolicy != null) 'SafeguardPolicy': safeguardPolicy.toValue(),
      if (secretsManagerAccessRoleArn != null)
        'SecretsManagerAccessRoleArn': secretsManagerAccessRoleArn,
      if (secretsManagerSecretId != null)
        'SecretsManagerSecretId': secretsManagerSecretId,
      if (serverName != null) 'ServerName': serverName,
      if (useBcpFullLoad != null) 'UseBcpFullLoad': useBcpFullLoad,
      if (useThirdPartyBackupDevice != null)
        'UseThirdPartyBackupDevice': useThirdPartyBackupDevice,
      if (username != null) 'Username': username,
    };
  }
}

enum MigrationTypeValue {
  fullLoad,
  cdc,
  fullLoadAndCdc,
}

extension on MigrationTypeValue {
  String toValue() {
    switch (this) {
      case MigrationTypeValue.fullLoad:
        return 'full-load';
      case MigrationTypeValue.cdc:
        return 'cdc';
      case MigrationTypeValue.fullLoadAndCdc:
        return 'full-load-and-cdc';
    }
  }
}

extension on String {
  MigrationTypeValue toMigrationTypeValue() {
    switch (this) {
      case 'full-load':
        return MigrationTypeValue.fullLoad;
      case 'cdc':
        return MigrationTypeValue.cdc;
      case 'full-load-and-cdc':
        return MigrationTypeValue.fullLoadAndCdc;
    }
    throw Exception('$this is not known in enum MigrationTypeValue');
  }
}

/// <p/>
class ModifyEndpointResponse {
  /// The modified endpoint.
  final Endpoint? endpoint;

  ModifyEndpointResponse({
    this.endpoint,
  });

  factory ModifyEndpointResponse.fromJson(Map<String, dynamic> json) {
    return ModifyEndpointResponse(
      endpoint: json['Endpoint'] != null
          ? Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
    };
  }
}

/// <p/>
class ModifyEventSubscriptionResponse {
  /// The modified event subscription.
  final EventSubscription? eventSubscription;

  ModifyEventSubscriptionResponse({
    this.eventSubscription,
  });

  factory ModifyEventSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return ModifyEventSubscriptionResponse(
      eventSubscription: json['EventSubscription'] != null
          ? EventSubscription.fromJson(
              json['EventSubscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

/// <p/>
class ModifyReplicationInstanceResponse {
  /// The modified replication instance.
  final ReplicationInstance? replicationInstance;

  ModifyReplicationInstanceResponse({
    this.replicationInstance,
  });

  factory ModifyReplicationInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return ModifyReplicationInstanceResponse(
      replicationInstance: json['ReplicationInstance'] != null
          ? ReplicationInstance.fromJson(
              json['ReplicationInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationInstance = this.replicationInstance;
    return {
      if (replicationInstance != null)
        'ReplicationInstance': replicationInstance,
    };
  }
}

/// <p/>
class ModifyReplicationSubnetGroupResponse {
  /// The modified replication subnet group.
  final ReplicationSubnetGroup? replicationSubnetGroup;

  ModifyReplicationSubnetGroupResponse({
    this.replicationSubnetGroup,
  });

  factory ModifyReplicationSubnetGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return ModifyReplicationSubnetGroupResponse(
      replicationSubnetGroup: json['ReplicationSubnetGroup'] != null
          ? ReplicationSubnetGroup.fromJson(
              json['ReplicationSubnetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationSubnetGroup = this.replicationSubnetGroup;
    return {
      if (replicationSubnetGroup != null)
        'ReplicationSubnetGroup': replicationSubnetGroup,
    };
  }
}

/// <p/>
class ModifyReplicationTaskResponse {
  /// The replication task that was modified.
  final ReplicationTask? replicationTask;

  ModifyReplicationTaskResponse({
    this.replicationTask,
  });

  factory ModifyReplicationTaskResponse.fromJson(Map<String, dynamic> json) {
    return ModifyReplicationTaskResponse(
      replicationTask: json['ReplicationTask'] != null
          ? ReplicationTask.fromJson(
              json['ReplicationTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTask = this.replicationTask;
    return {
      if (replicationTask != null) 'ReplicationTask': replicationTask,
    };
  }
}

/// Provides information that defines a MongoDB endpoint.
class MongoDbSettings {
  /// The authentication mechanism you use to access the MongoDB source endpoint.
  ///
  /// For the default value, in MongoDB version 2.x, <code>"default"</code> is
  /// <code>"mongodb_cr"</code>. For MongoDB version 3.x or later,
  /// <code>"default"</code> is <code>"scram_sha_1"</code>. This setting isn't
  /// used when <code>AuthType</code> is set to <code>"no"</code>.
  final AuthMechanismValue? authMechanism;

  /// The MongoDB database name. This setting isn't used when
  /// <code>AuthType</code> is set to <code>"no"</code>.
  ///
  /// The default is <code>"admin"</code>.
  final String? authSource;

  /// The authentication type you use to access the MongoDB source endpoint.
  ///
  /// When when set to <code>"no"</code>, user name and password parameters are
  /// not used and can be empty.
  final AuthTypeValue? authType;

  /// The database name on the MongoDB source endpoint.
  final String? databaseName;

  /// Indicates the number of documents to preview to determine the document
  /// organization. Use this setting when <code>NestingLevel</code> is set to
  /// <code>"one"</code>.
  ///
  /// Must be a positive value greater than <code>0</code>. Default value is
  /// <code>1000</code>.
  final String? docsToInvestigate;

  /// Specifies the document ID. Use this setting when <code>NestingLevel</code>
  /// is set to <code>"none"</code>.
  ///
  /// Default value is <code>"false"</code>.
  final String? extractDocId;

  /// The AWS KMS key identifier that is used to encrypt the content on the
  /// replication instance. If you don't specify a value for the
  /// <code>KmsKeyId</code> parameter, then AWS DMS uses your default encryption
  /// key. AWS KMS creates the default encryption key for your AWS account. Your
  /// AWS account has a different default encryption key for each AWS Region.
  final String? kmsKeyId;

  /// Specifies either document or table mode.
  ///
  /// Default value is <code>"none"</code>. Specify <code>"none"</code> to use
  /// document mode. Specify <code>"one"</code> to use table mode.
  final NestingLevelValue? nestingLevel;

  /// The password for the user account you use to access the MongoDB source
  /// endpoint.
  final String? password;

  /// The port value for the MongoDB source endpoint.
  final int? port;

  /// The full Amazon Resource Name (ARN) of the IAM role that specifies AWS DMS
  /// as the trusted entity and grants the required permissions to access the
  /// value in <code>SecretsManagerSecret</code>.
  /// <code>SecretsManagerSecret</code> has the value of the AWS Secrets Manager
  /// secret that allows access to the MongoDB endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and <code>SecretsManagerSecretId</code>.
  /// Or you can specify clear-text values for <code>UserName</code>,
  /// <code>Password</code>, <code>ServerName</code>, and <code>Port</code>. You
  /// can't specify both. For more information on creating this
  /// <code>SecretsManagerSecret</code> and the
  /// <code>SecretsManagerAccessRoleArn</code> and
  /// <code>SecretsManagerSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerAccessRoleArn;

  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerSecret</code> that contains the MongoDB endpoint
  /// connection details.
  final String? secretsManagerSecretId;

  /// The name of the server on the MongoDB source endpoint.
  final String? serverName;

  /// The user name you use to access the MongoDB source endpoint.
  final String? username;

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
    this.secretsManagerAccessRoleArn,
    this.secretsManagerSecretId,
    this.serverName,
    this.username,
  });

  factory MongoDbSettings.fromJson(Map<String, dynamic> json) {
    return MongoDbSettings(
      authMechanism: (json['AuthMechanism'] as String?)?.toAuthMechanismValue(),
      authSource: json['AuthSource'] as String?,
      authType: (json['AuthType'] as String?)?.toAuthTypeValue(),
      databaseName: json['DatabaseName'] as String?,
      docsToInvestigate: json['DocsToInvestigate'] as String?,
      extractDocId: json['ExtractDocId'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      nestingLevel: (json['NestingLevel'] as String?)?.toNestingLevelValue(),
      password: json['Password'] as String?,
      port: json['Port'] as int?,
      secretsManagerAccessRoleArn:
          json['SecretsManagerAccessRoleArn'] as String?,
      secretsManagerSecretId: json['SecretsManagerSecretId'] as String?,
      serverName: json['ServerName'] as String?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authMechanism = this.authMechanism;
    final authSource = this.authSource;
    final authType = this.authType;
    final databaseName = this.databaseName;
    final docsToInvestigate = this.docsToInvestigate;
    final extractDocId = this.extractDocId;
    final kmsKeyId = this.kmsKeyId;
    final nestingLevel = this.nestingLevel;
    final password = this.password;
    final port = this.port;
    final secretsManagerAccessRoleArn = this.secretsManagerAccessRoleArn;
    final secretsManagerSecretId = this.secretsManagerSecretId;
    final serverName = this.serverName;
    final username = this.username;
    return {
      if (authMechanism != null) 'AuthMechanism': authMechanism.toValue(),
      if (authSource != null) 'AuthSource': authSource,
      if (authType != null) 'AuthType': authType.toValue(),
      if (databaseName != null) 'DatabaseName': databaseName,
      if (docsToInvestigate != null) 'DocsToInvestigate': docsToInvestigate,
      if (extractDocId != null) 'ExtractDocId': extractDocId,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (nestingLevel != null) 'NestingLevel': nestingLevel.toValue(),
      if (password != null) 'Password': password,
      if (port != null) 'Port': port,
      if (secretsManagerAccessRoleArn != null)
        'SecretsManagerAccessRoleArn': secretsManagerAccessRoleArn,
      if (secretsManagerSecretId != null)
        'SecretsManagerSecretId': secretsManagerSecretId,
      if (serverName != null) 'ServerName': serverName,
      if (username != null) 'Username': username,
    };
  }
}

/// <p/>
class MoveReplicationTaskResponse {
  /// The replication task that was moved.
  final ReplicationTask? replicationTask;

  MoveReplicationTaskResponse({
    this.replicationTask,
  });

  factory MoveReplicationTaskResponse.fromJson(Map<String, dynamic> json) {
    return MoveReplicationTaskResponse(
      replicationTask: json['ReplicationTask'] != null
          ? ReplicationTask.fromJson(
              json['ReplicationTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTask = this.replicationTask;
    return {
      if (replicationTask != null) 'ReplicationTask': replicationTask,
    };
  }
}

/// Provides information that defines a MySQL endpoint.
class MySQLSettings {
  /// Specifies a script to run immediately after AWS DMS connects to the
  /// endpoint. The migration task continues running regardless if the SQL
  /// statement succeeds or fails.
  final String? afterConnectScript;

  /// Adjusts the behavior of DMS when migrating from an SQL Server source
  /// database that is hosted as part of an Always On availability group cluster.
  /// If you need DMS to poll all the nodes in the Always On cluster for
  /// transaction backups, set this attribute to <code>false</code>.
  final bool? cleanSourceMetadataOnMismatch;

  /// Database name for the endpoint.
  final String? databaseName;

  /// Specifies how often to check the binary log for new changes/events when the
  /// database is idle.
  ///
  /// Example: <code>eventsPollInterval=5;</code>
  ///
  /// In the example, AWS DMS checks for changes in the binary logs every five
  /// seconds.
  final int? eventsPollInterval;

  /// Specifies the maximum size (in KB) of any .csv file used to transfer data to
  /// a MySQL-compatible database.
  ///
  /// Example: <code>maxFileSize=512</code>
  final int? maxFileSize;

  /// Improves performance when loading data into the MySQL-compatible target
  /// database. Specifies how many threads to use to load the data into the
  /// MySQL-compatible target database. Setting a large number of threads can have
  /// an adverse effect on database performance, because a separate connection is
  /// required for each thread.
  ///
  /// Example: <code>parallelLoadThreads=1</code>
  final int? parallelLoadThreads;

  /// Endpoint connection password.
  final String? password;

  /// Endpoint TCP port.
  final int? port;

  /// The full Amazon Resource Name (ARN) of the IAM role that specifies AWS DMS
  /// as the trusted entity and grants the required permissions to access the
  /// value in <code>SecretsManagerSecret</code>.
  /// <code>SecretsManagerSecret</code> has the value of the AWS Secrets Manager
  /// secret that allows access to the MySQL endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and <code>SecretsManagerSecretId</code>.
  /// Or you can specify clear-text values for <code>UserName</code>,
  /// <code>Password</code>, <code>ServerName</code>, and <code>Port</code>. You
  /// can't specify both. For more information on creating this
  /// <code>SecretsManagerSecret</code> and the
  /// <code>SecretsManagerAccessRoleArn</code> and
  /// <code>SecretsManagerSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerAccessRoleArn;

  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerSecret</code> that contains the MySQL endpoint
  /// connection details.
  final String? secretsManagerSecretId;

  /// Fully qualified domain name of the endpoint.
  final String? serverName;

  /// Specifies the time zone for the source MySQL database.
  ///
  /// Example: <code>serverTimezone=US/Pacific;</code>
  ///
  /// Note: Do not enclose time zones in single quotes.
  final String? serverTimezone;

  /// Specifies where to migrate source tables on the target, either to a single
  /// database or multiple databases.
  ///
  /// Example: <code>targetDbType=MULTIPLE_DATABASES</code>
  final TargetDbType? targetDbType;

  /// Endpoint connection user name.
  final String? username;

  MySQLSettings({
    this.afterConnectScript,
    this.cleanSourceMetadataOnMismatch,
    this.databaseName,
    this.eventsPollInterval,
    this.maxFileSize,
    this.parallelLoadThreads,
    this.password,
    this.port,
    this.secretsManagerAccessRoleArn,
    this.secretsManagerSecretId,
    this.serverName,
    this.serverTimezone,
    this.targetDbType,
    this.username,
  });

  factory MySQLSettings.fromJson(Map<String, dynamic> json) {
    return MySQLSettings(
      afterConnectScript: json['AfterConnectScript'] as String?,
      cleanSourceMetadataOnMismatch:
          json['CleanSourceMetadataOnMismatch'] as bool?,
      databaseName: json['DatabaseName'] as String?,
      eventsPollInterval: json['EventsPollInterval'] as int?,
      maxFileSize: json['MaxFileSize'] as int?,
      parallelLoadThreads: json['ParallelLoadThreads'] as int?,
      password: json['Password'] as String?,
      port: json['Port'] as int?,
      secretsManagerAccessRoleArn:
          json['SecretsManagerAccessRoleArn'] as String?,
      secretsManagerSecretId: json['SecretsManagerSecretId'] as String?,
      serverName: json['ServerName'] as String?,
      serverTimezone: json['ServerTimezone'] as String?,
      targetDbType: (json['TargetDbType'] as String?)?.toTargetDbType(),
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final afterConnectScript = this.afterConnectScript;
    final cleanSourceMetadataOnMismatch = this.cleanSourceMetadataOnMismatch;
    final databaseName = this.databaseName;
    final eventsPollInterval = this.eventsPollInterval;
    final maxFileSize = this.maxFileSize;
    final parallelLoadThreads = this.parallelLoadThreads;
    final password = this.password;
    final port = this.port;
    final secretsManagerAccessRoleArn = this.secretsManagerAccessRoleArn;
    final secretsManagerSecretId = this.secretsManagerSecretId;
    final serverName = this.serverName;
    final serverTimezone = this.serverTimezone;
    final targetDbType = this.targetDbType;
    final username = this.username;
    return {
      if (afterConnectScript != null) 'AfterConnectScript': afterConnectScript,
      if (cleanSourceMetadataOnMismatch != null)
        'CleanSourceMetadataOnMismatch': cleanSourceMetadataOnMismatch,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (eventsPollInterval != null) 'EventsPollInterval': eventsPollInterval,
      if (maxFileSize != null) 'MaxFileSize': maxFileSize,
      if (parallelLoadThreads != null)
        'ParallelLoadThreads': parallelLoadThreads,
      if (password != null) 'Password': password,
      if (port != null) 'Port': port,
      if (secretsManagerAccessRoleArn != null)
        'SecretsManagerAccessRoleArn': secretsManagerAccessRoleArn,
      if (secretsManagerSecretId != null)
        'SecretsManagerSecretId': secretsManagerSecretId,
      if (serverName != null) 'ServerName': serverName,
      if (serverTimezone != null) 'ServerTimezone': serverTimezone,
      if (targetDbType != null) 'TargetDbType': targetDbType.toValue(),
      if (username != null) 'Username': username,
    };
  }
}

/// Provides information that defines an Amazon Neptune endpoint.
class NeptuneSettings {
  /// A folder path where you want AWS DMS to store migrated graph data in the S3
  /// bucket specified by <code>S3BucketName</code>
  final String s3BucketFolder;

  /// The name of the Amazon S3 bucket where AWS DMS can temporarily store
  /// migrated graph data in .csv files before bulk-loading it to the Neptune
  /// target database. AWS DMS maps the SQL source data to graph data before
  /// storing it in these .csv files.
  final String s3BucketName;

  /// The number of milliseconds for AWS DMS to wait to retry a bulk-load of
  /// migrated graph data to the Neptune target database before raising an error.
  /// The default is 250.
  final int? errorRetryDuration;

  /// If you want AWS Identity and Access Management (IAM) authorization enabled
  /// for this endpoint, set this parameter to <code>true</code>. Then attach the
  /// appropriate IAM policy document to your service role specified by
  /// <code>ServiceAccessRoleArn</code>. The default is <code>false</code>.
  final bool? iamAuthEnabled;

  /// The maximum size in kilobytes of migrated graph data stored in a .csv file
  /// before AWS DMS bulk-loads the data to the Neptune target database. The
  /// default is 1,048,576 KB. If the bulk load is successful, AWS DMS clears the
  /// bucket, ready to store the next batch of migrated graph data.
  final int? maxFileSize;

  /// The number of times for AWS DMS to retry a bulk load of migrated graph data
  /// to the Neptune target database before raising an error. The default is 5.
  final int? maxRetryCount;

  /// The Amazon Resource Name (ARN) of the service role that you created for the
  /// Neptune target endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html#CHAP_Target.Neptune.ServiceRole">Creating
  /// an IAM Service Role for Accessing Amazon Neptune as a Target</a> in the
  /// <i>AWS Database Migration Service User Guide. </i>
  final String? serviceAccessRoleArn;

  NeptuneSettings({
    required this.s3BucketFolder,
    required this.s3BucketName,
    this.errorRetryDuration,
    this.iamAuthEnabled,
    this.maxFileSize,
    this.maxRetryCount,
    this.serviceAccessRoleArn,
  });

  factory NeptuneSettings.fromJson(Map<String, dynamic> json) {
    return NeptuneSettings(
      s3BucketFolder: json['S3BucketFolder'] as String,
      s3BucketName: json['S3BucketName'] as String,
      errorRetryDuration: json['ErrorRetryDuration'] as int?,
      iamAuthEnabled: json['IamAuthEnabled'] as bool?,
      maxFileSize: json['MaxFileSize'] as int?,
      maxRetryCount: json['MaxRetryCount'] as int?,
      serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketFolder = this.s3BucketFolder;
    final s3BucketName = this.s3BucketName;
    final errorRetryDuration = this.errorRetryDuration;
    final iamAuthEnabled = this.iamAuthEnabled;
    final maxFileSize = this.maxFileSize;
    final maxRetryCount = this.maxRetryCount;
    final serviceAccessRoleArn = this.serviceAccessRoleArn;
    return {
      'S3BucketFolder': s3BucketFolder,
      'S3BucketName': s3BucketName,
      if (errorRetryDuration != null) 'ErrorRetryDuration': errorRetryDuration,
      if (iamAuthEnabled != null) 'IamAuthEnabled': iamAuthEnabled,
      if (maxFileSize != null) 'MaxFileSize': maxFileSize,
      if (maxRetryCount != null) 'MaxRetryCount': maxRetryCount,
      if (serviceAccessRoleArn != null)
        'ServiceAccessRoleArn': serviceAccessRoleArn,
    };
  }
}

enum NestingLevelValue {
  none,
  one,
}

extension on NestingLevelValue {
  String toValue() {
    switch (this) {
      case NestingLevelValue.none:
        return 'none';
      case NestingLevelValue.one:
        return 'one';
    }
  }
}

extension on String {
  NestingLevelValue toNestingLevelValue() {
    switch (this) {
      case 'none':
        return NestingLevelValue.none;
      case 'one':
        return NestingLevelValue.one;
    }
    throw Exception('$this is not known in enum NestingLevelValue');
  }
}

/// Provides information that defines an Oracle endpoint.
class OracleSettings {
  /// Set this attribute to <code>false</code> in order to use the Binary Reader
  /// to capture change data for an Amazon RDS for Oracle as the source. This
  /// tells the DMS instance to not access redo logs through any specified path
  /// prefix replacement using direct file access.
  final bool? accessAlternateDirectly;

  /// Set this attribute to set up table-level supplemental logging for the Oracle
  /// database. This attribute enables PRIMARY KEY supplemental logging on all
  /// tables selected for a migration task.
  ///
  /// If you use this option, you still need to enable database-level supplemental
  /// logging.
  final bool? addSupplementalLogging;

  /// Set this attribute with <code>archivedLogDestId</code> in a primary/ standby
  /// setup. This attribute is useful in the case of a switchover. In this case,
  /// AWS DMS needs to know which destination to get archive redo logs from to
  /// read changes. This need arises because the previous primary instance is now
  /// a standby instance after switchover.
  final int? additionalArchivedLogDestId;

  /// Set this attribute to <code>true</code> to enable replication of Oracle
  /// tables containing columns that are nested tables or defined types.
  final bool? allowSelectNestedTables;

  /// Specifies the destination of the archived redo logs. The value should be the
  /// same as the DEST_ID number in the v$archived_log table. When working with
  /// multiple log destinations (DEST_ID), we recommend that you to specify an
  /// archived redo logs location identifier. Doing this improves performance by
  /// ensuring that the correct logs are accessed from the outset.
  final int? archivedLogDestId;

  /// When this field is set to <code>Y</code>, AWS DMS only accesses the archived
  /// redo logs. If the archived redo logs are stored on Oracle ASM only, the AWS
  /// DMS user account needs to be granted ASM privileges.
  final bool? archivedLogsOnly;

  /// For an Oracle source endpoint, your Oracle Automatic Storage Management
  /// (ASM) password. You can set this value from the <code>
  /// <i>asm_user_password</i> </code> value. You set this value as part of the
  /// comma-separated value that you set to the <code>Password</code> request
  /// parameter when you create the endpoint to access transaction logs using
  /// Binary Reader. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.CDC.Configuration">Configuration
  /// for change data capture (CDC) on an Oracle source database</a>.
  final String? asmPassword;

  /// For an Oracle source endpoint, your ASM server address. You can set this
  /// value from the <code>asm_server</code> value. You set
  /// <code>asm_server</code> as part of the extra connection attribute string to
  /// access an Oracle server with Binary Reader that uses ASM. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.CDC.Configuration">Configuration
  /// for change data capture (CDC) on an Oracle source database</a>.
  final String? asmServer;

  /// For an Oracle source endpoint, your ASM user name. You can set this value
  /// from the <code>asm_user</code> value. You set <code>asm_user</code> as part
  /// of the extra connection attribute string to access an Oracle server with
  /// Binary Reader that uses ASM. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.CDC.Configuration">Configuration
  /// for change data capture (CDC) on an Oracle source database</a>.
  final String? asmUser;

  /// Specifies whether the length of a character column is in bytes or in
  /// characters. To indicate that the character column length is in characters,
  /// set this attribute to <code>CHAR</code>. Otherwise, the character column
  /// length is in bytes.
  ///
  /// Example: <code>charLengthSemantics=CHAR;</code>
  final CharLengthSemantics? charLengthSemantics;

  /// Database name for the endpoint.
  final String? databaseName;

  /// When set to <code>true</code>, this attribute helps to increase the commit
  /// rate on the Oracle target database by writing directly to tables and not
  /// writing a trail to database logs.
  final bool? directPathNoLog;

  /// When set to <code>true</code>, this attribute specifies a parallel load when
  /// <code>useDirectPathFullLoad</code> is set to <code>Y</code>. This attribute
  /// also only applies when you use the AWS DMS parallel load feature. Note that
  /// the target table cannot have any constraints or indexes.
  final bool? directPathParallelLoad;

  /// Set this attribute to enable homogenous tablespace replication and create
  /// existing tables or indexes under the same tablespace on the target.
  final bool? enableHomogenousTablespace;

  /// When set to <code>true</code>, this attribute causes a task to fail if the
  /// actual size of an LOB column is greater than the specified
  /// <code>LobMaxSize</code>.
  ///
  /// If a task is set to limited LOB mode and this option is set to
  /// <code>true</code>, the task fails instead of truncating the LOB data.
  final bool? failTasksOnLobTruncation;

  /// Specifies the number scale. You can select a scale up to 38, or you can
  /// select FLOAT. By default, the NUMBER data type is converted to precision 38,
  /// scale 10.
  ///
  /// Example: <code>numberDataTypeScale=12</code>
  final int? numberDatatypeScale;

  /// Set this string attribute to the required value in order to use the Binary
  /// Reader to capture change data for an Amazon RDS for Oracle as the source.
  /// This value specifies the default Oracle root used to access the redo logs.
  final String? oraclePathPrefix;

  /// Set this attribute to change the number of threads that DMS configures to
  /// perform a Change Data Capture (CDC) load using Oracle Automatic Storage
  /// Management (ASM). You can specify an integer value between 2 (the default)
  /// and 8 (the maximum). Use this attribute together with the
  /// <code>readAheadBlocks</code> attribute.
  final int? parallelAsmReadThreads;

  /// Endpoint connection password.
  final String? password;

  /// Endpoint TCP port.
  final int? port;

  /// Set this attribute to change the number of read-ahead blocks that DMS
  /// configures to perform a Change Data Capture (CDC) load using Oracle
  /// Automatic Storage Management (ASM). You can specify an integer value between
  /// 1000 (the default) and 200,000 (the maximum).
  final int? readAheadBlocks;

  /// When set to <code>true</code>, this attribute supports tablespace
  /// replication.
  final bool? readTableSpaceName;

  /// Set this attribute to true in order to use the Binary Reader to capture
  /// change data for an Amazon RDS for Oracle as the source. This setting tells
  /// DMS instance to replace the default Oracle root with the specified
  /// <code>usePathPrefix</code> setting to access the redo logs.
  final bool? replacePathPrefix;

  /// Specifies the number of seconds that the system waits before resending a
  /// query.
  ///
  /// Example: <code>retryInterval=6;</code>
  final int? retryInterval;

  /// The full Amazon Resource Name (ARN) of the IAM role that specifies AWS DMS
  /// as the trusted entity and grants the required permissions to access the
  /// value in <code>SecretsManagerSecret</code>.
  /// <code>SecretsManagerSecret</code> has the value of the AWS Secrets Manager
  /// secret that allows access to the Oracle endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and <code>SecretsManagerSecretId</code>.
  /// Or you can specify clear-text values for <code>UserName</code>,
  /// <code>Password</code>, <code>ServerName</code>, and <code>Port</code>. You
  /// can't specify both. For more information on creating this
  /// <code>SecretsManagerSecret</code> and the
  /// <code>SecretsManagerAccessRoleArn</code> and
  /// <code>SecretsManagerSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerAccessRoleArn;

  /// Required only if your Oracle endpoint uses Advanced Storage Manager (ASM).
  /// The full ARN of the IAM role that specifies AWS DMS as the trusted entity
  /// and grants the required permissions to access the
  /// <code>SecretsManagerOracleAsmSecret</code>. This
  /// <code>SecretsManagerOracleAsmSecret</code> has the secret value that allows
  /// access to the Oracle ASM of the endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and
  /// <code>SecretsManagerOracleAsmSecretId</code>. Or you can specify clear-text
  /// values for <code>AsmUserName</code>, <code>AsmPassword</code>, and
  /// <code>AsmServerName</code>. You can't specify both. For more information on
  /// creating this <code>SecretsManagerOracleAsmSecret</code> and the
  /// <code>SecretsManagerOracleAsmAccessRoleArn</code> and
  /// <code>SecretsManagerOracleAsmSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerOracleAsmAccessRoleArn;

  /// Required only if your Oracle endpoint uses Advanced Storage Manager (ASM).
  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerOracleAsmSecret</code> that contains the Oracle ASM
  /// connection details for the Oracle endpoint.
  final String? secretsManagerOracleAsmSecretId;

  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerSecret</code> that contains the Oracle endpoint
  /// connection details.
  final String? secretsManagerSecretId;

  /// For an Oracle source endpoint, the transparent data encryption (TDE)
  /// password required by AWM DMS to access Oracle redo logs encrypted by TDE
  /// using Binary Reader. It is also the <code> <i>TDE_Password</i> </code> part
  /// of the comma-separated value you set to the <code>Password</code> request
  /// parameter when you create the endpoint. The
  /// <code>SecurityDbEncryptian</code> setting is related to this
  /// <code>SecurityDbEncryptionName</code> setting. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.Encryption">
  /// Supported encryption methods for using Oracle as a source for AWS DMS</a> in
  /// the <i>AWS Database Migration Service User Guide</i>.
  final String? securityDbEncryption;

  /// For an Oracle source endpoint, the name of a key used for the transparent
  /// data encryption (TDE) of the columns and tablespaces in an Oracle source
  /// database that is encrypted using TDE. The key value is the value of the
  /// <code>SecurityDbEncryption</code> setting. For more information on setting
  /// the key name value of <code>SecurityDbEncryptionName</code>, see the
  /// information and example for setting the
  /// <code>securityDbEncryptionName</code> extra connection attribute in <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.Encryption">
  /// Supported encryption methods for using Oracle as a source for AWS DMS</a> in
  /// the <i>AWS Database Migration Service User Guide</i>.
  final String? securityDbEncryptionName;

  /// Fully qualified domain name of the endpoint.
  final String? serverName;

  /// Use this attribute to convert <code>SDO_GEOMETRY</code> to
  /// <code>GEOJSON</code> format. By default, DMS calls the
  /// <code>SDO2GEOJSON</code> custom function if present and accessible. Or you
  /// can create your own custom function that mimics the operation of
  /// <code>SDOGEOJSON</code> and set
  /// <code>SpatialDataOptionToGeoJsonFunctionName</code> to call it instead.
  final String? spatialDataOptionToGeoJsonFunctionName;

  /// Set this attribute to <code>true</code> in order to use the Binary Reader to
  /// capture change data for an Amazon RDS for Oracle as the source. This tells
  /// the DMS instance to use any specified prefix replacement to access all
  /// online redo logs.
  final bool? useAlternateFolderForOnline;

  /// Set this string attribute to the required value in order to use the Binary
  /// Reader to capture change data for an Amazon RDS for Oracle as the source.
  /// This value specifies the path prefix used to replace the default Oracle root
  /// to access the redo logs.
  final String? usePathPrefix;

  /// Endpoint connection user name.
  final String? username;

  OracleSettings({
    this.accessAlternateDirectly,
    this.addSupplementalLogging,
    this.additionalArchivedLogDestId,
    this.allowSelectNestedTables,
    this.archivedLogDestId,
    this.archivedLogsOnly,
    this.asmPassword,
    this.asmServer,
    this.asmUser,
    this.charLengthSemantics,
    this.databaseName,
    this.directPathNoLog,
    this.directPathParallelLoad,
    this.enableHomogenousTablespace,
    this.failTasksOnLobTruncation,
    this.numberDatatypeScale,
    this.oraclePathPrefix,
    this.parallelAsmReadThreads,
    this.password,
    this.port,
    this.readAheadBlocks,
    this.readTableSpaceName,
    this.replacePathPrefix,
    this.retryInterval,
    this.secretsManagerAccessRoleArn,
    this.secretsManagerOracleAsmAccessRoleArn,
    this.secretsManagerOracleAsmSecretId,
    this.secretsManagerSecretId,
    this.securityDbEncryption,
    this.securityDbEncryptionName,
    this.serverName,
    this.spatialDataOptionToGeoJsonFunctionName,
    this.useAlternateFolderForOnline,
    this.usePathPrefix,
    this.username,
  });

  factory OracleSettings.fromJson(Map<String, dynamic> json) {
    return OracleSettings(
      accessAlternateDirectly: json['AccessAlternateDirectly'] as bool?,
      addSupplementalLogging: json['AddSupplementalLogging'] as bool?,
      additionalArchivedLogDestId: json['AdditionalArchivedLogDestId'] as int?,
      allowSelectNestedTables: json['AllowSelectNestedTables'] as bool?,
      archivedLogDestId: json['ArchivedLogDestId'] as int?,
      archivedLogsOnly: json['ArchivedLogsOnly'] as bool?,
      asmPassword: json['AsmPassword'] as String?,
      asmServer: json['AsmServer'] as String?,
      asmUser: json['AsmUser'] as String?,
      charLengthSemantics:
          (json['CharLengthSemantics'] as String?)?.toCharLengthSemantics(),
      databaseName: json['DatabaseName'] as String?,
      directPathNoLog: json['DirectPathNoLog'] as bool?,
      directPathParallelLoad: json['DirectPathParallelLoad'] as bool?,
      enableHomogenousTablespace: json['EnableHomogenousTablespace'] as bool?,
      failTasksOnLobTruncation: json['FailTasksOnLobTruncation'] as bool?,
      numberDatatypeScale: json['NumberDatatypeScale'] as int?,
      oraclePathPrefix: json['OraclePathPrefix'] as String?,
      parallelAsmReadThreads: json['ParallelAsmReadThreads'] as int?,
      password: json['Password'] as String?,
      port: json['Port'] as int?,
      readAheadBlocks: json['ReadAheadBlocks'] as int?,
      readTableSpaceName: json['ReadTableSpaceName'] as bool?,
      replacePathPrefix: json['ReplacePathPrefix'] as bool?,
      retryInterval: json['RetryInterval'] as int?,
      secretsManagerAccessRoleArn:
          json['SecretsManagerAccessRoleArn'] as String?,
      secretsManagerOracleAsmAccessRoleArn:
          json['SecretsManagerOracleAsmAccessRoleArn'] as String?,
      secretsManagerOracleAsmSecretId:
          json['SecretsManagerOracleAsmSecretId'] as String?,
      secretsManagerSecretId: json['SecretsManagerSecretId'] as String?,
      securityDbEncryption: json['SecurityDbEncryption'] as String?,
      securityDbEncryptionName: json['SecurityDbEncryptionName'] as String?,
      serverName: json['ServerName'] as String?,
      spatialDataOptionToGeoJsonFunctionName:
          json['SpatialDataOptionToGeoJsonFunctionName'] as String?,
      useAlternateFolderForOnline: json['UseAlternateFolderForOnline'] as bool?,
      usePathPrefix: json['UsePathPrefix'] as String?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessAlternateDirectly = this.accessAlternateDirectly;
    final addSupplementalLogging = this.addSupplementalLogging;
    final additionalArchivedLogDestId = this.additionalArchivedLogDestId;
    final allowSelectNestedTables = this.allowSelectNestedTables;
    final archivedLogDestId = this.archivedLogDestId;
    final archivedLogsOnly = this.archivedLogsOnly;
    final asmPassword = this.asmPassword;
    final asmServer = this.asmServer;
    final asmUser = this.asmUser;
    final charLengthSemantics = this.charLengthSemantics;
    final databaseName = this.databaseName;
    final directPathNoLog = this.directPathNoLog;
    final directPathParallelLoad = this.directPathParallelLoad;
    final enableHomogenousTablespace = this.enableHomogenousTablespace;
    final failTasksOnLobTruncation = this.failTasksOnLobTruncation;
    final numberDatatypeScale = this.numberDatatypeScale;
    final oraclePathPrefix = this.oraclePathPrefix;
    final parallelAsmReadThreads = this.parallelAsmReadThreads;
    final password = this.password;
    final port = this.port;
    final readAheadBlocks = this.readAheadBlocks;
    final readTableSpaceName = this.readTableSpaceName;
    final replacePathPrefix = this.replacePathPrefix;
    final retryInterval = this.retryInterval;
    final secretsManagerAccessRoleArn = this.secretsManagerAccessRoleArn;
    final secretsManagerOracleAsmAccessRoleArn =
        this.secretsManagerOracleAsmAccessRoleArn;
    final secretsManagerOracleAsmSecretId =
        this.secretsManagerOracleAsmSecretId;
    final secretsManagerSecretId = this.secretsManagerSecretId;
    final securityDbEncryption = this.securityDbEncryption;
    final securityDbEncryptionName = this.securityDbEncryptionName;
    final serverName = this.serverName;
    final spatialDataOptionToGeoJsonFunctionName =
        this.spatialDataOptionToGeoJsonFunctionName;
    final useAlternateFolderForOnline = this.useAlternateFolderForOnline;
    final usePathPrefix = this.usePathPrefix;
    final username = this.username;
    return {
      if (accessAlternateDirectly != null)
        'AccessAlternateDirectly': accessAlternateDirectly,
      if (addSupplementalLogging != null)
        'AddSupplementalLogging': addSupplementalLogging,
      if (additionalArchivedLogDestId != null)
        'AdditionalArchivedLogDestId': additionalArchivedLogDestId,
      if (allowSelectNestedTables != null)
        'AllowSelectNestedTables': allowSelectNestedTables,
      if (archivedLogDestId != null) 'ArchivedLogDestId': archivedLogDestId,
      if (archivedLogsOnly != null) 'ArchivedLogsOnly': archivedLogsOnly,
      if (asmPassword != null) 'AsmPassword': asmPassword,
      if (asmServer != null) 'AsmServer': asmServer,
      if (asmUser != null) 'AsmUser': asmUser,
      if (charLengthSemantics != null)
        'CharLengthSemantics': charLengthSemantics.toValue(),
      if (databaseName != null) 'DatabaseName': databaseName,
      if (directPathNoLog != null) 'DirectPathNoLog': directPathNoLog,
      if (directPathParallelLoad != null)
        'DirectPathParallelLoad': directPathParallelLoad,
      if (enableHomogenousTablespace != null)
        'EnableHomogenousTablespace': enableHomogenousTablespace,
      if (failTasksOnLobTruncation != null)
        'FailTasksOnLobTruncation': failTasksOnLobTruncation,
      if (numberDatatypeScale != null)
        'NumberDatatypeScale': numberDatatypeScale,
      if (oraclePathPrefix != null) 'OraclePathPrefix': oraclePathPrefix,
      if (parallelAsmReadThreads != null)
        'ParallelAsmReadThreads': parallelAsmReadThreads,
      if (password != null) 'Password': password,
      if (port != null) 'Port': port,
      if (readAheadBlocks != null) 'ReadAheadBlocks': readAheadBlocks,
      if (readTableSpaceName != null) 'ReadTableSpaceName': readTableSpaceName,
      if (replacePathPrefix != null) 'ReplacePathPrefix': replacePathPrefix,
      if (retryInterval != null) 'RetryInterval': retryInterval,
      if (secretsManagerAccessRoleArn != null)
        'SecretsManagerAccessRoleArn': secretsManagerAccessRoleArn,
      if (secretsManagerOracleAsmAccessRoleArn != null)
        'SecretsManagerOracleAsmAccessRoleArn':
            secretsManagerOracleAsmAccessRoleArn,
      if (secretsManagerOracleAsmSecretId != null)
        'SecretsManagerOracleAsmSecretId': secretsManagerOracleAsmSecretId,
      if (secretsManagerSecretId != null)
        'SecretsManagerSecretId': secretsManagerSecretId,
      if (securityDbEncryption != null)
        'SecurityDbEncryption': securityDbEncryption,
      if (securityDbEncryptionName != null)
        'SecurityDbEncryptionName': securityDbEncryptionName,
      if (serverName != null) 'ServerName': serverName,
      if (spatialDataOptionToGeoJsonFunctionName != null)
        'SpatialDataOptionToGeoJsonFunctionName':
            spatialDataOptionToGeoJsonFunctionName,
      if (useAlternateFolderForOnline != null)
        'UseAlternateFolderForOnline': useAlternateFolderForOnline,
      if (usePathPrefix != null) 'UsePathPrefix': usePathPrefix,
      if (username != null) 'Username': username,
    };
  }
}

/// In response to the <code>DescribeOrderableReplicationInstances</code>
/// operation, this object describes an available replication instance. This
/// description includes the replication instance's type, engine version, and
/// allocated storage.
class OrderableReplicationInstance {
  /// List of Availability Zones for this replication instance.
  final List<String>? availabilityZones;

  /// The default amount of storage (in gigabytes) that is allocated for the
  /// replication instance.
  final int? defaultAllocatedStorage;

  /// The version of the replication engine.
  final String? engineVersion;

  /// The amount of storage (in gigabytes) that is allocated for the replication
  /// instance.
  final int? includedAllocatedStorage;

  /// The minimum amount of storage (in gigabytes) that can be allocated for the
  /// replication instance.
  final int? maxAllocatedStorage;

  /// The minimum amount of storage (in gigabytes) that can be allocated for the
  /// replication instance.
  final int? minAllocatedStorage;

  /// The value returned when the specified <code>EngineVersion</code> of the
  /// replication instance is in Beta or test mode. This indicates some features
  /// might not work as expected.
  /// <note>
  /// AWS DMS supports the <code>ReleaseStatus</code> parameter in versions 3.1.4
  /// and later.
  /// </note>
  final ReleaseStatusValues? releaseStatus;

  /// The compute and memory capacity of the replication instance as defined for
  /// the specified replication instance class. For example to specify the
  /// instance class dms.c4.large, set this parameter to
  /// <code>"dms.c4.large"</code>.
  ///
  /// For more information on the settings and capacities for the available
  /// replication instance classes, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth">
  /// Selecting the right AWS DMS replication instance for your migration</a>.
  final String? replicationInstanceClass;

  /// The type of storage used by the replication instance.
  final String? storageType;

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

  factory OrderableReplicationInstance.fromJson(Map<String, dynamic> json) {
    return OrderableReplicationInstance(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      defaultAllocatedStorage: json['DefaultAllocatedStorage'] as int?,
      engineVersion: json['EngineVersion'] as String?,
      includedAllocatedStorage: json['IncludedAllocatedStorage'] as int?,
      maxAllocatedStorage: json['MaxAllocatedStorage'] as int?,
      minAllocatedStorage: json['MinAllocatedStorage'] as int?,
      releaseStatus:
          (json['ReleaseStatus'] as String?)?.toReleaseStatusValues(),
      replicationInstanceClass: json['ReplicationInstanceClass'] as String?,
      storageType: json['StorageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final defaultAllocatedStorage = this.defaultAllocatedStorage;
    final engineVersion = this.engineVersion;
    final includedAllocatedStorage = this.includedAllocatedStorage;
    final maxAllocatedStorage = this.maxAllocatedStorage;
    final minAllocatedStorage = this.minAllocatedStorage;
    final releaseStatus = this.releaseStatus;
    final replicationInstanceClass = this.replicationInstanceClass;
    final storageType = this.storageType;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (defaultAllocatedStorage != null)
        'DefaultAllocatedStorage': defaultAllocatedStorage,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (includedAllocatedStorage != null)
        'IncludedAllocatedStorage': includedAllocatedStorage,
      if (maxAllocatedStorage != null)
        'MaxAllocatedStorage': maxAllocatedStorage,
      if (minAllocatedStorage != null)
        'MinAllocatedStorage': minAllocatedStorage,
      if (releaseStatus != null) 'ReleaseStatus': releaseStatus.toValue(),
      if (replicationInstanceClass != null)
        'ReplicationInstanceClass': replicationInstanceClass,
      if (storageType != null) 'StorageType': storageType,
    };
  }
}

enum ParquetVersionValue {
  parquet_1_0,
  parquet_2_0,
}

extension on ParquetVersionValue {
  String toValue() {
    switch (this) {
      case ParquetVersionValue.parquet_1_0:
        return 'parquet-1-0';
      case ParquetVersionValue.parquet_2_0:
        return 'parquet-2-0';
    }
  }
}

extension on String {
  ParquetVersionValue toParquetVersionValue() {
    switch (this) {
      case 'parquet-1-0':
        return ParquetVersionValue.parquet_1_0;
      case 'parquet-2-0':
        return ParquetVersionValue.parquet_2_0;
    }
    throw Exception('$this is not known in enum ParquetVersionValue');
  }
}

/// Describes a maintenance action pending for an AWS DMS resource, including
/// when and how it will be applied. This data type is a response element to the
/// <code>DescribePendingMaintenanceActions</code> operation.
class PendingMaintenanceAction {
  /// The type of pending maintenance action that is available for the resource.
  final String? action;

  /// The date of the maintenance window when the action is to be applied. The
  /// maintenance action is applied to the resource during its first maintenance
  /// window after this date. If this date is specified, any
  /// <code>next-maintenance</code> opt-in requests are ignored.
  final DateTime? autoAppliedAfterDate;

  /// The effective date when the pending maintenance action will be applied to
  /// the resource. This date takes into account opt-in requests received from the
  /// <code>ApplyPendingMaintenanceAction</code> API operation, and also the
  /// <code>AutoAppliedAfterDate</code> and <code>ForcedApplyDate</code> parameter
  /// values. This value is blank if an opt-in request has not been received and
  /// nothing has been specified for <code>AutoAppliedAfterDate</code> or
  /// <code>ForcedApplyDate</code>.
  final DateTime? currentApplyDate;

  /// A description providing more detail about the maintenance action.
  final String? description;

  /// The date when the maintenance action will be automatically applied. The
  /// maintenance action is applied to the resource on this date regardless of the
  /// maintenance window for the resource. If this date is specified, any
  /// <code>immediate</code> opt-in requests are ignored.
  final DateTime? forcedApplyDate;

  /// The type of opt-in request that has been received for the resource.
  final String? optInStatus;

  PendingMaintenanceAction({
    this.action,
    this.autoAppliedAfterDate,
    this.currentApplyDate,
    this.description,
    this.forcedApplyDate,
    this.optInStatus,
  });

  factory PendingMaintenanceAction.fromJson(Map<String, dynamic> json) {
    return PendingMaintenanceAction(
      action: json['Action'] as String?,
      autoAppliedAfterDate: timeStampFromJson(json['AutoAppliedAfterDate']),
      currentApplyDate: timeStampFromJson(json['CurrentApplyDate']),
      description: json['Description'] as String?,
      forcedApplyDate: timeStampFromJson(json['ForcedApplyDate']),
      optInStatus: json['OptInStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final autoAppliedAfterDate = this.autoAppliedAfterDate;
    final currentApplyDate = this.currentApplyDate;
    final description = this.description;
    final forcedApplyDate = this.forcedApplyDate;
    final optInStatus = this.optInStatus;
    return {
      if (action != null) 'Action': action,
      if (autoAppliedAfterDate != null)
        'AutoAppliedAfterDate': unixTimestampToJson(autoAppliedAfterDate),
      if (currentApplyDate != null)
        'CurrentApplyDate': unixTimestampToJson(currentApplyDate),
      if (description != null) 'Description': description,
      if (forcedApplyDate != null)
        'ForcedApplyDate': unixTimestampToJson(forcedApplyDate),
      if (optInStatus != null) 'OptInStatus': optInStatus,
    };
  }
}

/// Provides information that defines a PostgreSQL endpoint.
class PostgreSQLSettings {
  /// For use with change data capture (CDC) only, this attribute has AWS DMS
  /// bypass foreign keys and user triggers to reduce the time it takes to bulk
  /// load data.
  ///
  /// Example: <code>afterConnectScript=SET
  /// session_replication_role='replica'</code>
  final String? afterConnectScript;

  /// To capture DDL events, AWS DMS creates various artifacts in the PostgreSQL
  /// database when the task starts. You can later remove these artifacts.
  ///
  /// If this value is set to <code>N</code>, you don't have to create tables or
  /// triggers on the source database.
  final bool? captureDdls;

  /// Database name for the endpoint.
  final String? databaseName;

  /// The schema in which the operational DDL database artifacts are created.
  ///
  /// Example: <code>ddlArtifactsSchema=xyzddlschema;</code>
  final String? ddlArtifactsSchema;

  /// Sets the client statement timeout for the PostgreSQL instance, in seconds.
  /// The default value is 60 seconds.
  ///
  /// Example: <code>executeTimeout=100;</code>
  final int? executeTimeout;

  /// When set to <code>true</code>, this value causes a task to fail if the
  /// actual size of a LOB column is greater than the specified
  /// <code>LobMaxSize</code>.
  ///
  /// If task is set to Limited LOB mode and this option is set to true, the task
  /// fails instead of truncating the LOB data.
  final bool? failTasksOnLobTruncation;

  /// Specifies the maximum size (in KB) of any .csv file used to transfer data to
  /// PostgreSQL.
  ///
  /// Example: <code>maxFileSize=512</code>
  final int? maxFileSize;

  /// Endpoint connection password.
  final String? password;

  /// Endpoint TCP port.
  final int? port;

  /// The full Amazon Resource Name (ARN) of the IAM role that specifies AWS DMS
  /// as the trusted entity and grants the required permissions to access the
  /// value in <code>SecretsManagerSecret</code>.
  /// <code>SecretsManagerSecret</code> has the value of the AWS Secrets Manager
  /// secret that allows access to the PostgreSQL endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and <code>SecretsManagerSecretId</code>.
  /// Or you can specify clear-text values for <code>UserName</code>,
  /// <code>Password</code>, <code>ServerName</code>, and <code>Port</code>. You
  /// can't specify both. For more information on creating this
  /// <code>SecretsManagerSecret</code> and the
  /// <code>SecretsManagerAccessRoleArn</code> and
  /// <code>SecretsManagerSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerAccessRoleArn;

  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerSecret</code> that contains the PostgreSQL endpoint
  /// connection details.
  final String? secretsManagerSecretId;

  /// Fully qualified domain name of the endpoint.
  final String? serverName;

  /// Sets the name of a previously created logical replication slot for a CDC
  /// load of the PostgreSQL source instance.
  ///
  /// When used with the AWS DMS API <code>CdcStartPosition</code> request
  /// parameter, this attribute also enables using native CDC start points.
  final String? slotName;

  /// Endpoint connection user name.
  final String? username;

  PostgreSQLSettings({
    this.afterConnectScript,
    this.captureDdls,
    this.databaseName,
    this.ddlArtifactsSchema,
    this.executeTimeout,
    this.failTasksOnLobTruncation,
    this.maxFileSize,
    this.password,
    this.port,
    this.secretsManagerAccessRoleArn,
    this.secretsManagerSecretId,
    this.serverName,
    this.slotName,
    this.username,
  });

  factory PostgreSQLSettings.fromJson(Map<String, dynamic> json) {
    return PostgreSQLSettings(
      afterConnectScript: json['AfterConnectScript'] as String?,
      captureDdls: json['CaptureDdls'] as bool?,
      databaseName: json['DatabaseName'] as String?,
      ddlArtifactsSchema: json['DdlArtifactsSchema'] as String?,
      executeTimeout: json['ExecuteTimeout'] as int?,
      failTasksOnLobTruncation: json['FailTasksOnLobTruncation'] as bool?,
      maxFileSize: json['MaxFileSize'] as int?,
      password: json['Password'] as String?,
      port: json['Port'] as int?,
      secretsManagerAccessRoleArn:
          json['SecretsManagerAccessRoleArn'] as String?,
      secretsManagerSecretId: json['SecretsManagerSecretId'] as String?,
      serverName: json['ServerName'] as String?,
      slotName: json['SlotName'] as String?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final afterConnectScript = this.afterConnectScript;
    final captureDdls = this.captureDdls;
    final databaseName = this.databaseName;
    final ddlArtifactsSchema = this.ddlArtifactsSchema;
    final executeTimeout = this.executeTimeout;
    final failTasksOnLobTruncation = this.failTasksOnLobTruncation;
    final maxFileSize = this.maxFileSize;
    final password = this.password;
    final port = this.port;
    final secretsManagerAccessRoleArn = this.secretsManagerAccessRoleArn;
    final secretsManagerSecretId = this.secretsManagerSecretId;
    final serverName = this.serverName;
    final slotName = this.slotName;
    final username = this.username;
    return {
      if (afterConnectScript != null) 'AfterConnectScript': afterConnectScript,
      if (captureDdls != null) 'CaptureDdls': captureDdls,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (ddlArtifactsSchema != null) 'DdlArtifactsSchema': ddlArtifactsSchema,
      if (executeTimeout != null) 'ExecuteTimeout': executeTimeout,
      if (failTasksOnLobTruncation != null)
        'FailTasksOnLobTruncation': failTasksOnLobTruncation,
      if (maxFileSize != null) 'MaxFileSize': maxFileSize,
      if (password != null) 'Password': password,
      if (port != null) 'Port': port,
      if (secretsManagerAccessRoleArn != null)
        'SecretsManagerAccessRoleArn': secretsManagerAccessRoleArn,
      if (secretsManagerSecretId != null)
        'SecretsManagerSecretId': secretsManagerSecretId,
      if (serverName != null) 'ServerName': serverName,
      if (slotName != null) 'SlotName': slotName,
      if (username != null) 'Username': username,
    };
  }
}

class RebootReplicationInstanceResponse {
  /// The replication instance that is being rebooted.
  final ReplicationInstance? replicationInstance;

  RebootReplicationInstanceResponse({
    this.replicationInstance,
  });

  factory RebootReplicationInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return RebootReplicationInstanceResponse(
      replicationInstance: json['ReplicationInstance'] != null
          ? ReplicationInstance.fromJson(
              json['ReplicationInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationInstance = this.replicationInstance;
    return {
      if (replicationInstance != null)
        'ReplicationInstance': replicationInstance,
    };
  }
}

/// Provides information that defines an Amazon Redshift endpoint.
class RedshiftSettings {
  /// A value that indicates to allow any date format, including invalid formats
  /// such as 00/00/00 00:00:00, to be loaded without generating an error. You can
  /// choose <code>true</code> or <code>false</code> (the default).
  ///
  /// This parameter applies only to TIMESTAMP and DATE columns. Always use
  /// ACCEPTANYDATE with the DATEFORMAT parameter. If the date format for the data
  /// doesn't match the DATEFORMAT specification, Amazon Redshift inserts a NULL
  /// value into that field.
  final bool? acceptAnyDate;

  /// Code to run after connecting. This parameter should contain the code itself,
  /// not the name of a file containing the code.
  final String? afterConnectScript;

  /// An S3 folder where the comma-separated-value (.csv) files are stored before
  /// being uploaded to the target Redshift cluster.
  ///
  /// For full load mode, AWS DMS converts source records into .csv files and
  /// loads them to the <i>BucketFolder/TableID</i> path. AWS DMS uses the
  /// Redshift <code>COPY</code> command to upload the .csv files to the target
  /// table. The files are deleted once the <code>COPY</code> operation has
  /// finished. For more information, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html">COPY</a>
  /// in the <i>Amazon Redshift Database Developer Guide</i>.
  ///
  /// For change-data-capture (CDC) mode, AWS DMS creates a <i>NetChanges</i>
  /// table, and loads the .csv files to this
  /// <i>BucketFolder/NetChangesTableID</i> path.
  final String? bucketFolder;

  /// The name of the intermediate S3 bucket used to store .csv files before
  /// uploading data to Redshift.
  final String? bucketName;

  /// If Amazon Redshift is configured to support case sensitive schema names, set
  /// <code>CaseSensitiveNames</code> to <code>true</code>. The default is
  /// <code>false</code>.
  final bool? caseSensitiveNames;

  /// If you set <code>CompUpdate</code> to <code>true</code> Amazon Redshift
  /// applies automatic compression if the table is empty. This applies even if
  /// the table columns already have encodings other than <code>RAW</code>. If you
  /// set <code>CompUpdate</code> to <code>false</code>, automatic compression is
  /// disabled and existing column encodings aren't changed. The default is
  /// <code>true</code>.
  final bool? compUpdate;

  /// A value that sets the amount of time to wait (in milliseconds) before timing
  /// out, beginning from when you initially establish a connection.
  final int? connectionTimeout;

  /// The name of the Amazon Redshift data warehouse (service) that you are
  /// working with.
  final String? databaseName;

  /// The date format that you are using. Valid values are <code>auto</code>
  /// (case-sensitive), your date format string enclosed in quotes, or NULL. If
  /// this parameter is left unset (NULL), it defaults to a format of
  /// 'YYYY-MM-DD'. Using <code>auto</code> recognizes most strings, even some
  /// that aren't supported when you use a date format string.
  ///
  /// If your date and time values use formats different from each other, set this
  /// to <code>auto</code>.
  final String? dateFormat;

  /// A value that specifies whether AWS DMS should migrate empty CHAR and VARCHAR
  /// fields as NULL. A value of <code>true</code> sets empty CHAR and VARCHAR
  /// fields to null. The default is <code>false</code>.
  final bool? emptyAsNull;

  /// The type of server-side encryption that you want to use for your data. This
  /// encryption type is part of the endpoint settings or the extra connections
  /// attributes for Amazon S3. You can choose either <code>SSE_S3</code> (the
  /// default) or <code>SSE_KMS</code>.
  /// <note>
  /// For the <code>ModifyEndpoint</code> operation, you can change the existing
  /// value of the <code>EncryptionMode</code> parameter from <code>SSE_KMS</code>
  /// to <code>SSE_S3</code>. But you can’t change the existing value from
  /// <code>SSE_S3</code> to <code>SSE_KMS</code>.
  /// </note>
  /// To use <code>SSE_S3</code>, create an AWS Identity and Access Management
  /// (IAM) role with a policy that allows <code>"arn:aws:s3:::*"</code> to use
  /// the following actions: <code>"s3:PutObject", "s3:ListBucket"</code>
  final EncryptionModeValue? encryptionMode;

  /// This setting is only valid for a full-load migration task. Set
  /// <code>ExplicitIds</code> to <code>true</code> to have tables with
  /// <code>IDENTITY</code> columns override their auto-generated values with
  /// explicit values loaded from the source data files used to populate the
  /// tables. The default is <code>false</code>.
  final bool? explicitIds;

  /// The number of threads used to upload a single file. This parameter accepts a
  /// value from 1 through 64. It defaults to 10.
  ///
  /// The number of parallel streams used to upload a single .csv file to an S3
  /// bucket using S3 Multipart Upload. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html">Multipart
  /// upload overview</a>.
  ///
  /// <code>FileTransferUploadStreams</code> accepts a value from 1 through 64. It
  /// defaults to 10.
  final int? fileTransferUploadStreams;

  /// The amount of time to wait (in milliseconds) before timing out of operations
  /// performed by AWS DMS on a Redshift cluster, such as Redshift COPY, INSERT,
  /// DELETE, and UPDATE.
  final int? loadTimeout;

  /// The maximum size (in KB) of any .csv file used to load data on an S3 bucket
  /// and transfer data to Amazon Redshift. It defaults to 1048576KB (1 GB).
  final int? maxFileSize;

  /// The password for the user named in the <code>username</code> property.
  final String? password;

  /// The port number for Amazon Redshift. The default value is 5439.
  final int? port;

  /// A value that specifies to remove surrounding quotation marks from strings in
  /// the incoming data. All characters within the quotation marks, including
  /// delimiters, are retained. Choose <code>true</code> to remove quotation
  /// marks. The default is <code>false</code>.
  final bool? removeQuotes;

  /// A value that specifies to replaces the invalid characters specified in
  /// <code>ReplaceInvalidChars</code>, substituting the specified characters
  /// instead. The default is <code>"?"</code>.
  final String? replaceChars;

  /// A list of characters that you want to replace. Use with
  /// <code>ReplaceChars</code>.
  final String? replaceInvalidChars;

  /// The full Amazon Resource Name (ARN) of the IAM role that specifies AWS DMS
  /// as the trusted entity and grants the required permissions to access the
  /// value in <code>SecretsManagerSecret</code>.
  /// <code>SecretsManagerSecret</code> has the value of the AWS Secrets Manager
  /// secret that allows access to the Amazon Redshift endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and <code>SecretsManagerSecretId</code>.
  /// Or you can specify clear-text values for <code>UserName</code>,
  /// <code>Password</code>, <code>ServerName</code>, and <code>Port</code>. You
  /// can't specify both. For more information on creating this
  /// <code>SecretsManagerSecret</code> and the
  /// <code>SecretsManagerAccessRoleArn</code> and
  /// <code>SecretsManagerSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerAccessRoleArn;

  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerSecret</code> that contains the Amazon Redshift endpoint
  /// connection details.
  final String? secretsManagerSecretId;

  /// The name of the Amazon Redshift cluster you are using.
  final String? serverName;

  /// The AWS KMS key ID. If you are using <code>SSE_KMS</code> for the
  /// <code>EncryptionMode</code>, provide this key ID. The key that you use needs
  /// an attached policy that enables IAM user permissions and allows use of the
  /// key.
  final String? serverSideEncryptionKmsKeyId;

  /// The Amazon Resource Name (ARN) of the IAM role that has access to the Amazon
  /// Redshift service.
  final String? serviceAccessRoleArn;

  /// The time format that you want to use. Valid values are <code>auto</code>
  /// (case-sensitive), <code>'timeformat_string'</code>,
  /// <code>'epochsecs'</code>, or <code>'epochmillisecs'</code>. It defaults to
  /// 10. Using <code>auto</code> recognizes most strings, even some that aren't
  /// supported when you use a time format string.
  ///
  /// If your date and time values use formats different from each other, set this
  /// parameter to <code>auto</code>.
  final String? timeFormat;

  /// A value that specifies to remove the trailing white space characters from a
  /// VARCHAR string. This parameter applies only to columns with a VARCHAR data
  /// type. Choose <code>true</code> to remove unneeded white space. The default
  /// is <code>false</code>.
  final bool? trimBlanks;

  /// A value that specifies to truncate data in columns to the appropriate number
  /// of characters, so that the data fits in the column. This parameter applies
  /// only to columns with a VARCHAR or CHAR data type, and rows with a size of 4
  /// MB or less. Choose <code>true</code> to truncate data. The default is
  /// <code>false</code>.
  final bool? truncateColumns;

  /// An Amazon Redshift user name for a registered user.
  final String? username;

  /// The size (in KB) of the in-memory file write buffer used when generating
  /// .csv files on the local disk at the DMS replication instance. The default
  /// value is 1000 (buffer size is 1000KB).
  final int? writeBufferSize;

  RedshiftSettings({
    this.acceptAnyDate,
    this.afterConnectScript,
    this.bucketFolder,
    this.bucketName,
    this.caseSensitiveNames,
    this.compUpdate,
    this.connectionTimeout,
    this.databaseName,
    this.dateFormat,
    this.emptyAsNull,
    this.encryptionMode,
    this.explicitIds,
    this.fileTransferUploadStreams,
    this.loadTimeout,
    this.maxFileSize,
    this.password,
    this.port,
    this.removeQuotes,
    this.replaceChars,
    this.replaceInvalidChars,
    this.secretsManagerAccessRoleArn,
    this.secretsManagerSecretId,
    this.serverName,
    this.serverSideEncryptionKmsKeyId,
    this.serviceAccessRoleArn,
    this.timeFormat,
    this.trimBlanks,
    this.truncateColumns,
    this.username,
    this.writeBufferSize,
  });

  factory RedshiftSettings.fromJson(Map<String, dynamic> json) {
    return RedshiftSettings(
      acceptAnyDate: json['AcceptAnyDate'] as bool?,
      afterConnectScript: json['AfterConnectScript'] as String?,
      bucketFolder: json['BucketFolder'] as String?,
      bucketName: json['BucketName'] as String?,
      caseSensitiveNames: json['CaseSensitiveNames'] as bool?,
      compUpdate: json['CompUpdate'] as bool?,
      connectionTimeout: json['ConnectionTimeout'] as int?,
      databaseName: json['DatabaseName'] as String?,
      dateFormat: json['DateFormat'] as String?,
      emptyAsNull: json['EmptyAsNull'] as bool?,
      encryptionMode:
          (json['EncryptionMode'] as String?)?.toEncryptionModeValue(),
      explicitIds: json['ExplicitIds'] as bool?,
      fileTransferUploadStreams: json['FileTransferUploadStreams'] as int?,
      loadTimeout: json['LoadTimeout'] as int?,
      maxFileSize: json['MaxFileSize'] as int?,
      password: json['Password'] as String?,
      port: json['Port'] as int?,
      removeQuotes: json['RemoveQuotes'] as bool?,
      replaceChars: json['ReplaceChars'] as String?,
      replaceInvalidChars: json['ReplaceInvalidChars'] as String?,
      secretsManagerAccessRoleArn:
          json['SecretsManagerAccessRoleArn'] as String?,
      secretsManagerSecretId: json['SecretsManagerSecretId'] as String?,
      serverName: json['ServerName'] as String?,
      serverSideEncryptionKmsKeyId:
          json['ServerSideEncryptionKmsKeyId'] as String?,
      serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String?,
      timeFormat: json['TimeFormat'] as String?,
      trimBlanks: json['TrimBlanks'] as bool?,
      truncateColumns: json['TruncateColumns'] as bool?,
      username: json['Username'] as String?,
      writeBufferSize: json['WriteBufferSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptAnyDate = this.acceptAnyDate;
    final afterConnectScript = this.afterConnectScript;
    final bucketFolder = this.bucketFolder;
    final bucketName = this.bucketName;
    final caseSensitiveNames = this.caseSensitiveNames;
    final compUpdate = this.compUpdate;
    final connectionTimeout = this.connectionTimeout;
    final databaseName = this.databaseName;
    final dateFormat = this.dateFormat;
    final emptyAsNull = this.emptyAsNull;
    final encryptionMode = this.encryptionMode;
    final explicitIds = this.explicitIds;
    final fileTransferUploadStreams = this.fileTransferUploadStreams;
    final loadTimeout = this.loadTimeout;
    final maxFileSize = this.maxFileSize;
    final password = this.password;
    final port = this.port;
    final removeQuotes = this.removeQuotes;
    final replaceChars = this.replaceChars;
    final replaceInvalidChars = this.replaceInvalidChars;
    final secretsManagerAccessRoleArn = this.secretsManagerAccessRoleArn;
    final secretsManagerSecretId = this.secretsManagerSecretId;
    final serverName = this.serverName;
    final serverSideEncryptionKmsKeyId = this.serverSideEncryptionKmsKeyId;
    final serviceAccessRoleArn = this.serviceAccessRoleArn;
    final timeFormat = this.timeFormat;
    final trimBlanks = this.trimBlanks;
    final truncateColumns = this.truncateColumns;
    final username = this.username;
    final writeBufferSize = this.writeBufferSize;
    return {
      if (acceptAnyDate != null) 'AcceptAnyDate': acceptAnyDate,
      if (afterConnectScript != null) 'AfterConnectScript': afterConnectScript,
      if (bucketFolder != null) 'BucketFolder': bucketFolder,
      if (bucketName != null) 'BucketName': bucketName,
      if (caseSensitiveNames != null) 'CaseSensitiveNames': caseSensitiveNames,
      if (compUpdate != null) 'CompUpdate': compUpdate,
      if (connectionTimeout != null) 'ConnectionTimeout': connectionTimeout,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (dateFormat != null) 'DateFormat': dateFormat,
      if (emptyAsNull != null) 'EmptyAsNull': emptyAsNull,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (explicitIds != null) 'ExplicitIds': explicitIds,
      if (fileTransferUploadStreams != null)
        'FileTransferUploadStreams': fileTransferUploadStreams,
      if (loadTimeout != null) 'LoadTimeout': loadTimeout,
      if (maxFileSize != null) 'MaxFileSize': maxFileSize,
      if (password != null) 'Password': password,
      if (port != null) 'Port': port,
      if (removeQuotes != null) 'RemoveQuotes': removeQuotes,
      if (replaceChars != null) 'ReplaceChars': replaceChars,
      if (replaceInvalidChars != null)
        'ReplaceInvalidChars': replaceInvalidChars,
      if (secretsManagerAccessRoleArn != null)
        'SecretsManagerAccessRoleArn': secretsManagerAccessRoleArn,
      if (secretsManagerSecretId != null)
        'SecretsManagerSecretId': secretsManagerSecretId,
      if (serverName != null) 'ServerName': serverName,
      if (serverSideEncryptionKmsKeyId != null)
        'ServerSideEncryptionKmsKeyId': serverSideEncryptionKmsKeyId,
      if (serviceAccessRoleArn != null)
        'ServiceAccessRoleArn': serviceAccessRoleArn,
      if (timeFormat != null) 'TimeFormat': timeFormat,
      if (trimBlanks != null) 'TrimBlanks': trimBlanks,
      if (truncateColumns != null) 'TruncateColumns': truncateColumns,
      if (username != null) 'Username': username,
      if (writeBufferSize != null) 'WriteBufferSize': writeBufferSize,
    };
  }
}

/// <p/>
class RefreshSchemasResponse {
  /// The status of the refreshed schema.
  final RefreshSchemasStatus? refreshSchemasStatus;

  RefreshSchemasResponse({
    this.refreshSchemasStatus,
  });

  factory RefreshSchemasResponse.fromJson(Map<String, dynamic> json) {
    return RefreshSchemasResponse(
      refreshSchemasStatus: json['RefreshSchemasStatus'] != null
          ? RefreshSchemasStatus.fromJson(
              json['RefreshSchemasStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final refreshSchemasStatus = this.refreshSchemasStatus;
    return {
      if (refreshSchemasStatus != null)
        'RefreshSchemasStatus': refreshSchemasStatus,
    };
  }
}

/// Provides information that describes status of a schema at an endpoint
/// specified by the <code>DescribeRefreshSchemaStatus</code> operation.
class RefreshSchemasStatus {
  /// The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.
  final String? endpointArn;

  /// The last failure message for the schema.
  final String? lastFailureMessage;

  /// The date the schema was last refreshed.
  final DateTime? lastRefreshDate;

  /// The Amazon Resource Name (ARN) of the replication instance.
  final String? replicationInstanceArn;

  /// The status of the schema.
  final RefreshSchemasStatusTypeValue? status;

  RefreshSchemasStatus({
    this.endpointArn,
    this.lastFailureMessage,
    this.lastRefreshDate,
    this.replicationInstanceArn,
    this.status,
  });

  factory RefreshSchemasStatus.fromJson(Map<String, dynamic> json) {
    return RefreshSchemasStatus(
      endpointArn: json['EndpointArn'] as String?,
      lastFailureMessage: json['LastFailureMessage'] as String?,
      lastRefreshDate: timeStampFromJson(json['LastRefreshDate']),
      replicationInstanceArn: json['ReplicationInstanceArn'] as String?,
      status: (json['Status'] as String?)?.toRefreshSchemasStatusTypeValue(),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointArn = this.endpointArn;
    final lastFailureMessage = this.lastFailureMessage;
    final lastRefreshDate = this.lastRefreshDate;
    final replicationInstanceArn = this.replicationInstanceArn;
    final status = this.status;
    return {
      if (endpointArn != null) 'EndpointArn': endpointArn,
      if (lastFailureMessage != null) 'LastFailureMessage': lastFailureMessage,
      if (lastRefreshDate != null)
        'LastRefreshDate': unixTimestampToJson(lastRefreshDate),
      if (replicationInstanceArn != null)
        'ReplicationInstanceArn': replicationInstanceArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum RefreshSchemasStatusTypeValue {
  successful,
  failed,
  refreshing,
}

extension on RefreshSchemasStatusTypeValue {
  String toValue() {
    switch (this) {
      case RefreshSchemasStatusTypeValue.successful:
        return 'successful';
      case RefreshSchemasStatusTypeValue.failed:
        return 'failed';
      case RefreshSchemasStatusTypeValue.refreshing:
        return 'refreshing';
    }
  }
}

extension on String {
  RefreshSchemasStatusTypeValue toRefreshSchemasStatusTypeValue() {
    switch (this) {
      case 'successful':
        return RefreshSchemasStatusTypeValue.successful;
      case 'failed':
        return RefreshSchemasStatusTypeValue.failed;
      case 'refreshing':
        return RefreshSchemasStatusTypeValue.refreshing;
    }
    throw Exception('$this is not known in enum RefreshSchemasStatusTypeValue');
  }
}

enum ReleaseStatusValues {
  beta,
}

extension on ReleaseStatusValues {
  String toValue() {
    switch (this) {
      case ReleaseStatusValues.beta:
        return 'beta';
    }
  }
}

extension on String {
  ReleaseStatusValues toReleaseStatusValues() {
    switch (this) {
      case 'beta':
        return ReleaseStatusValues.beta;
    }
    throw Exception('$this is not known in enum ReleaseStatusValues');
  }
}

enum ReloadOptionValue {
  dataReload,
  validateOnly,
}

extension on ReloadOptionValue {
  String toValue() {
    switch (this) {
      case ReloadOptionValue.dataReload:
        return 'data-reload';
      case ReloadOptionValue.validateOnly:
        return 'validate-only';
    }
  }
}

extension on String {
  ReloadOptionValue toReloadOptionValue() {
    switch (this) {
      case 'data-reload':
        return ReloadOptionValue.dataReload;
      case 'validate-only':
        return ReloadOptionValue.validateOnly;
    }
    throw Exception('$this is not known in enum ReloadOptionValue');
  }
}

class ReloadTablesResponse {
  /// The Amazon Resource Name (ARN) of the replication task.
  final String? replicationTaskArn;

  ReloadTablesResponse({
    this.replicationTaskArn,
  });

  factory ReloadTablesResponse.fromJson(Map<String, dynamic> json) {
    return ReloadTablesResponse(
      replicationTaskArn: json['ReplicationTaskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTaskArn = this.replicationTaskArn;
    return {
      if (replicationTaskArn != null) 'ReplicationTaskArn': replicationTaskArn,
    };
  }
}

/// <p/>
class RemoveTagsFromResourceResponse {
  RemoveTagsFromResourceResponse();

  factory RemoveTagsFromResourceResponse.fromJson(Map<String, dynamic> _) {
    return RemoveTagsFromResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum ReplicationEndpointTypeValue {
  source,
  target,
}

extension on ReplicationEndpointTypeValue {
  String toValue() {
    switch (this) {
      case ReplicationEndpointTypeValue.source:
        return 'source';
      case ReplicationEndpointTypeValue.target:
        return 'target';
    }
  }
}

extension on String {
  ReplicationEndpointTypeValue toReplicationEndpointTypeValue() {
    switch (this) {
      case 'source':
        return ReplicationEndpointTypeValue.source;
      case 'target':
        return ReplicationEndpointTypeValue.target;
    }
    throw Exception('$this is not known in enum ReplicationEndpointTypeValue');
  }
}

/// Provides information that defines a replication instance.
class ReplicationInstance {
  /// The amount of storage (in gigabytes) that is allocated for the replication
  /// instance.
  final int? allocatedStorage;

  /// Boolean value indicating if minor version upgrades will be automatically
  /// applied to the instance.
  final bool? autoMinorVersionUpgrade;

  /// The Availability Zone for the instance.
  final String? availabilityZone;

  /// The DNS name servers supported for the replication instance to access your
  /// on-premise source or target database.
  final String? dnsNameServers;

  /// The engine version number of the replication instance.
  ///
  /// If an engine version number is not specified when a replication instance is
  /// created, the default is the latest engine version available.
  ///
  /// When modifying a major engine version of an instance, also set
  /// <code>AllowMajorVersionUpgrade</code> to <code>true</code>.
  final String? engineVersion;

  /// The expiration date of the free replication instance that is part of the
  /// Free DMS program.
  final DateTime? freeUntil;

  /// The time the replication instance was created.
  final DateTime? instanceCreateTime;

  /// An AWS KMS key identifier that is used to encrypt the data on the
  /// replication instance.
  ///
  /// If you don't specify a value for the <code>KmsKeyId</code> parameter, then
  /// AWS DMS uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  final String? kmsKeyId;

  /// Specifies whether the replication instance is a Multi-AZ deployment. You
  /// can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ
  /// parameter is set to <code>true</code>.
  final bool? multiAZ;

  /// The pending modification values.
  final ReplicationPendingModifiedValues? pendingModifiedValues;

  /// The maintenance window times for the replication instance. Any pending
  /// upgrades to the replication instance are performed during this time.
  final String? preferredMaintenanceWindow;

  /// Specifies the accessibility options for the replication instance. A value of
  /// <code>true</code> represents an instance with a public IP address. A value
  /// of <code>false</code> represents an instance with a private IP address. The
  /// default value is <code>true</code>.
  final bool? publiclyAccessible;

  /// The Amazon Resource Name (ARN) of the replication instance.
  final String? replicationInstanceArn;

  /// The compute and memory capacity of the replication instance as defined for
  /// the specified replication instance class. It is a required parameter,
  /// although a defualt value is pre-selected in the DMS console.
  ///
  /// For more information on the settings and capacities for the available
  /// replication instance classes, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth">
  /// Selecting the right AWS DMS replication instance for your migration</a>.
  final String? replicationInstanceClass;

  /// The replication instance identifier is a required parameter. This parameter
  /// is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1-63 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  /// Example: <code>myrepinstance</code>
  final String? replicationInstanceIdentifier;

  /// The private IP address of the replication instance.
  final String? replicationInstancePrivateIpAddress;

  /// One or more private IP addresses for the replication instance.
  final List<String>? replicationInstancePrivateIpAddresses;

  /// The public IP address of the replication instance.
  final String? replicationInstancePublicIpAddress;

  /// One or more public IP addresses for the replication instance.
  final List<String>? replicationInstancePublicIpAddresses;

  /// The status of the replication instance. The possible return values include:
  ///
  /// <ul>
  /// <li>
  /// <code>"available"</code>
  /// </li>
  /// <li>
  /// <code>"creating"</code>
  /// </li>
  /// <li>
  /// <code>"deleted"</code>
  /// </li>
  /// <li>
  /// <code>"deleting"</code>
  /// </li>
  /// <li>
  /// <code>"failed"</code>
  /// </li>
  /// <li>
  /// <code>"modifying"</code>
  /// </li>
  /// <li>
  /// <code>"upgrading"</code>
  /// </li>
  /// <li>
  /// <code>"rebooting"</code>
  /// </li>
  /// <li>
  /// <code>"resetting-master-credentials"</code>
  /// </li>
  /// <li>
  /// <code>"storage-full"</code>
  /// </li>
  /// <li>
  /// <code>"incompatible-credentials"</code>
  /// </li>
  /// <li>
  /// <code>"incompatible-network"</code>
  /// </li>
  /// <li>
  /// <code>"maintenance"</code>
  /// </li>
  /// </ul>
  final String? replicationInstanceStatus;

  /// The subnet group for the replication instance.
  final ReplicationSubnetGroup? replicationSubnetGroup;

  /// The Availability Zone of the standby replication instance in a Multi-AZ
  /// deployment.
  final String? secondaryAvailabilityZone;

  /// The VPC security group for the instance.
  final List<VpcSecurityGroupMembership>? vpcSecurityGroups;

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

  factory ReplicationInstance.fromJson(Map<String, dynamic> json) {
    return ReplicationInstance(
      allocatedStorage: json['AllocatedStorage'] as int?,
      autoMinorVersionUpgrade: json['AutoMinorVersionUpgrade'] as bool?,
      availabilityZone: json['AvailabilityZone'] as String?,
      dnsNameServers: json['DnsNameServers'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      freeUntil: timeStampFromJson(json['FreeUntil']),
      instanceCreateTime: timeStampFromJson(json['InstanceCreateTime']),
      kmsKeyId: json['KmsKeyId'] as String?,
      multiAZ: json['MultiAZ'] as bool?,
      pendingModifiedValues: json['PendingModifiedValues'] != null
          ? ReplicationPendingModifiedValues.fromJson(
              json['PendingModifiedValues'] as Map<String, dynamic>)
          : null,
      preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String?,
      publiclyAccessible: json['PubliclyAccessible'] as bool?,
      replicationInstanceArn: json['ReplicationInstanceArn'] as String?,
      replicationInstanceClass: json['ReplicationInstanceClass'] as String?,
      replicationInstanceIdentifier:
          json['ReplicationInstanceIdentifier'] as String?,
      replicationInstancePrivateIpAddress:
          json['ReplicationInstancePrivateIpAddress'] as String?,
      replicationInstancePrivateIpAddresses:
          (json['ReplicationInstancePrivateIpAddresses'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      replicationInstancePublicIpAddress:
          json['ReplicationInstancePublicIpAddress'] as String?,
      replicationInstancePublicIpAddresses:
          (json['ReplicationInstancePublicIpAddresses'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      replicationInstanceStatus: json['ReplicationInstanceStatus'] as String?,
      replicationSubnetGroup: json['ReplicationSubnetGroup'] != null
          ? ReplicationSubnetGroup.fromJson(
              json['ReplicationSubnetGroup'] as Map<String, dynamic>)
          : null,
      secondaryAvailabilityZone: json['SecondaryAvailabilityZone'] as String?,
      vpcSecurityGroups: (json['VpcSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              VpcSecurityGroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final availabilityZone = this.availabilityZone;
    final dnsNameServers = this.dnsNameServers;
    final engineVersion = this.engineVersion;
    final freeUntil = this.freeUntil;
    final instanceCreateTime = this.instanceCreateTime;
    final kmsKeyId = this.kmsKeyId;
    final multiAZ = this.multiAZ;
    final pendingModifiedValues = this.pendingModifiedValues;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final publiclyAccessible = this.publiclyAccessible;
    final replicationInstanceArn = this.replicationInstanceArn;
    final replicationInstanceClass = this.replicationInstanceClass;
    final replicationInstanceIdentifier = this.replicationInstanceIdentifier;
    final replicationInstancePrivateIpAddress =
        this.replicationInstancePrivateIpAddress;
    final replicationInstancePrivateIpAddresses =
        this.replicationInstancePrivateIpAddresses;
    final replicationInstancePublicIpAddress =
        this.replicationInstancePublicIpAddress;
    final replicationInstancePublicIpAddresses =
        this.replicationInstancePublicIpAddresses;
    final replicationInstanceStatus = this.replicationInstanceStatus;
    final replicationSubnetGroup = this.replicationSubnetGroup;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (dnsNameServers != null) 'DnsNameServers': dnsNameServers,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (freeUntil != null) 'FreeUntil': unixTimestampToJson(freeUntil),
      if (instanceCreateTime != null)
        'InstanceCreateTime': unixTimestampToJson(instanceCreateTime),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (pendingModifiedValues != null)
        'PendingModifiedValues': pendingModifiedValues,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (replicationInstanceArn != null)
        'ReplicationInstanceArn': replicationInstanceArn,
      if (replicationInstanceClass != null)
        'ReplicationInstanceClass': replicationInstanceClass,
      if (replicationInstanceIdentifier != null)
        'ReplicationInstanceIdentifier': replicationInstanceIdentifier,
      if (replicationInstancePrivateIpAddress != null)
        'ReplicationInstancePrivateIpAddress':
            replicationInstancePrivateIpAddress,
      if (replicationInstancePrivateIpAddresses != null)
        'ReplicationInstancePrivateIpAddresses':
            replicationInstancePrivateIpAddresses,
      if (replicationInstancePublicIpAddress != null)
        'ReplicationInstancePublicIpAddress':
            replicationInstancePublicIpAddress,
      if (replicationInstancePublicIpAddresses != null)
        'ReplicationInstancePublicIpAddresses':
            replicationInstancePublicIpAddresses,
      if (replicationInstanceStatus != null)
        'ReplicationInstanceStatus': replicationInstanceStatus,
      if (replicationSubnetGroup != null)
        'ReplicationSubnetGroup': replicationSubnetGroup,
      if (secondaryAvailabilityZone != null)
        'SecondaryAvailabilityZone': secondaryAvailabilityZone,
      if (vpcSecurityGroups != null) 'VpcSecurityGroups': vpcSecurityGroups,
    };
  }
}

/// Contains metadata for a replication instance task log.
class ReplicationInstanceTaskLog {
  /// The size, in bytes, of the replication task log.
  final int? replicationInstanceTaskLogSize;

  /// The Amazon Resource Name (ARN) of the replication task.
  final String? replicationTaskArn;

  /// The name of the replication task.
  final String? replicationTaskName;

  ReplicationInstanceTaskLog({
    this.replicationInstanceTaskLogSize,
    this.replicationTaskArn,
    this.replicationTaskName,
  });

  factory ReplicationInstanceTaskLog.fromJson(Map<String, dynamic> json) {
    return ReplicationInstanceTaskLog(
      replicationInstanceTaskLogSize:
          json['ReplicationInstanceTaskLogSize'] as int?,
      replicationTaskArn: json['ReplicationTaskArn'] as String?,
      replicationTaskName: json['ReplicationTaskName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationInstanceTaskLogSize = this.replicationInstanceTaskLogSize;
    final replicationTaskArn = this.replicationTaskArn;
    final replicationTaskName = this.replicationTaskName;
    return {
      if (replicationInstanceTaskLogSize != null)
        'ReplicationInstanceTaskLogSize': replicationInstanceTaskLogSize,
      if (replicationTaskArn != null) 'ReplicationTaskArn': replicationTaskArn,
      if (replicationTaskName != null)
        'ReplicationTaskName': replicationTaskName,
    };
  }
}

/// Provides information about the values of pending modifications to a
/// replication instance. This data type is an object of the <a
/// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_ReplicationInstance.html">
/// <code>ReplicationInstance</code> </a> user-defined data type.
class ReplicationPendingModifiedValues {
  /// The amount of storage (in gigabytes) that is allocated for the replication
  /// instance.
  final int? allocatedStorage;

  /// The engine version number of the replication instance.
  final String? engineVersion;

  /// Specifies whether the replication instance is a Multi-AZ deployment. You
  /// can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ
  /// parameter is set to <code>true</code>.
  final bool? multiAZ;

  /// The compute and memory capacity of the replication instance as defined for
  /// the specified replication instance class.
  ///
  /// For more information on the settings and capacities for the available
  /// replication instance classes, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth">
  /// Selecting the right AWS DMS replication instance for your migration</a>.
  final String? replicationInstanceClass;

  ReplicationPendingModifiedValues({
    this.allocatedStorage,
    this.engineVersion,
    this.multiAZ,
    this.replicationInstanceClass,
  });

  factory ReplicationPendingModifiedValues.fromJson(Map<String, dynamic> json) {
    return ReplicationPendingModifiedValues(
      allocatedStorage: json['AllocatedStorage'] as int?,
      engineVersion: json['EngineVersion'] as String?,
      multiAZ: json['MultiAZ'] as bool?,
      replicationInstanceClass: json['ReplicationInstanceClass'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final engineVersion = this.engineVersion;
    final multiAZ = this.multiAZ;
    final replicationInstanceClass = this.replicationInstanceClass;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (replicationInstanceClass != null)
        'ReplicationInstanceClass': replicationInstanceClass,
    };
  }
}

/// Describes a subnet group in response to a request by the
/// <code>DescribeReplicationSubnetGroups</code> operation.
class ReplicationSubnetGroup {
  /// A description for the replication subnet group.
  final String? replicationSubnetGroupDescription;

  /// The identifier of the replication instance subnet group.
  final String? replicationSubnetGroupIdentifier;

  /// The status of the subnet group.
  final String? subnetGroupStatus;

  /// The subnets that are in the subnet group.
  final List<Subnet>? subnets;

  /// The ID of the VPC.
  final String? vpcId;

  ReplicationSubnetGroup({
    this.replicationSubnetGroupDescription,
    this.replicationSubnetGroupIdentifier,
    this.subnetGroupStatus,
    this.subnets,
    this.vpcId,
  });

  factory ReplicationSubnetGroup.fromJson(Map<String, dynamic> json) {
    return ReplicationSubnetGroup(
      replicationSubnetGroupDescription:
          json['ReplicationSubnetGroupDescription'] as String?,
      replicationSubnetGroupIdentifier:
          json['ReplicationSubnetGroupIdentifier'] as String?,
      subnetGroupStatus: json['SubnetGroupStatus'] as String?,
      subnets: (json['Subnets'] as List?)
          ?.whereNotNull()
          .map((e) => Subnet.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationSubnetGroupDescription =
        this.replicationSubnetGroupDescription;
    final replicationSubnetGroupIdentifier =
        this.replicationSubnetGroupIdentifier;
    final subnetGroupStatus = this.subnetGroupStatus;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (replicationSubnetGroupDescription != null)
        'ReplicationSubnetGroupDescription': replicationSubnetGroupDescription,
      if (replicationSubnetGroupIdentifier != null)
        'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
      if (subnetGroupStatus != null) 'SubnetGroupStatus': subnetGroupStatus,
      if (subnets != null) 'Subnets': subnets,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Provides information that describes a replication task created by the
/// <code>CreateReplicationTask</code> operation.
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
  final String? cdcStartPosition;

  /// Indicates when you want a change data capture (CDC) operation to stop. The
  /// value can be either server time or commit time.
  ///
  /// Server time example: --cdc-stop-position “server_time:2018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 2018-02-09T12:12:12 “
  final String? cdcStopPosition;

  /// The last error (failure) message generated for the replication task.
  final String? lastFailureMessage;

  /// The type of migration.
  final MigrationTypeValue? migrationType;

  /// Indicates the last checkpoint that occurred during a change data capture
  /// (CDC) operation. You can provide this value to the
  /// <code>CdcStartPosition</code> parameter to start a CDC operation that begins
  /// at that checkpoint.
  final String? recoveryCheckpoint;

  /// The ARN of the replication instance.
  final String? replicationInstanceArn;

  /// The Amazon Resource Name (ARN) of the replication task.
  final String? replicationTaskArn;

  /// The date the replication task was created.
  final DateTime? replicationTaskCreationDate;

  /// The user-assigned replication task identifier or name.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1-255 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Cannot end with a hyphen or contain two consecutive hyphens.
  /// </li>
  /// </ul>
  final String? replicationTaskIdentifier;

  /// The settings for the replication task.
  final String? replicationTaskSettings;

  /// The date the replication task is scheduled to start.
  final DateTime? replicationTaskStartDate;

  /// The statistics for the task, including elapsed time, tables loaded, and
  /// table errors.
  final ReplicationTaskStats? replicationTaskStats;

  /// The Amazon Resource Name (ARN) that uniquely identifies the endpoint.
  final String? sourceEndpointArn;

  /// The status of the replication task. This response parameter can return one
  /// of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>"moving"</code> – The task is being moved in response to running the
  /// <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_MoveReplicationTask.html">
  /// <code>MoveReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"creating"</code> – The task is being created in response to running
  /// the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_CreateReplicationTask.html">
  /// <code>CreateReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"deleting"</code> – The task is being deleted in response to running
  /// the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_DeleteReplicationTask.html">
  /// <code>DeleteReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"failed"</code> – The task failed to successfully complete the
  /// database migration in response to running the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html">
  /// <code>StartReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"failed-move"</code> – The task failed to move in response to running
  /// the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_MoveReplicationTask.html">
  /// <code>MoveReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"modifying"</code> – The task definition is being modified in response
  /// to running the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_ModifyReplicationTask.html">
  /// <code>ModifyReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"ready"</code> – The task is in a <code>ready</code> state where it
  /// can respond to other task operations, such as <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html">
  /// <code>StartReplicationTask</code> </a> or <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_DeleteReplicationTask.html">
  /// <code>DeleteReplicationTask</code> </a>.
  /// </li>
  /// <li>
  /// <code>"running"</code> – The task is performing a database migration in
  /// response to running the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html">
  /// <code>StartReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"starting"</code> – The task is preparing to perform a database
  /// migration in response to running the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html">
  /// <code>StartReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"stopped"</code> – The task has stopped in response to running the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StopReplicationTask.html">
  /// <code>StopReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"stopping"</code> – The task is preparing to stop in response to
  /// running the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StopReplicationTask.html">
  /// <code>StopReplicationTask</code> </a> operation.
  /// </li>
  /// <li>
  /// <code>"testing"</code> – The database migration specified for this task is
  /// being tested in response to running either the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessmentRun.html">
  /// <code>StartReplicationTaskAssessmentRun</code> </a> or the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessment.html">
  /// <code>StartReplicationTaskAssessment</code> </a> operation.
  /// <note>
  /// <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessmentRun.html">
  /// <code>StartReplicationTaskAssessmentRun</code> </a> is an improved
  /// premigration task assessment operation. The <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessment.html">
  /// <code>StartReplicationTaskAssessment</code> </a> operation assesses data
  /// type compatibility only between the source and target database of a given
  /// migration task. In contrast, <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessmentRun.html">
  /// <code>StartReplicationTaskAssessmentRun</code> </a> enables you to specify a
  /// variety of premigration task assessments in addition to data type
  /// compatibility. These assessments include ones for the validity of primary
  /// key definitions and likely issues with database migration performance, among
  /// others.
  /// </note> </li>
  /// </ul>
  final String? status;

  /// The reason the replication task was stopped. This response parameter can
  /// return one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>"STOP_REASON_FULL_LOAD_COMPLETED"</code> – Full-load migration
  /// completed.
  /// </li>
  /// <li>
  /// <code>"STOP_REASON_CACHED_CHANGES_APPLIED"</code> – Change data capture
  /// (CDC) load completed.
  /// </li>
  /// <li>
  /// <code>"STOP_REASON_CACHED_CHANGES_NOT_APPLIED"</code> – In a full-load and
  /// CDC migration, the full load stopped as specified before starting the CDC
  /// migration.
  /// </li>
  /// <li>
  /// <code>"STOP_REASON_SERVER_TIME"</code> – The migration stopped at the
  /// specified server time.
  /// </li>
  /// </ul>
  final String? stopReason;

  /// Table mappings specified in the task.
  final String? tableMappings;

  /// The ARN that uniquely identifies the endpoint.
  final String? targetEndpointArn;

  /// The ARN of the replication instance to which this task is moved in response
  /// to running the <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_MoveReplicationTask.html">
  /// <code>MoveReplicationTask</code> </a> operation. Otherwise, this response
  /// parameter isn't a member of the <code>ReplicationTask</code> object.
  final String? targetReplicationInstanceArn;

  /// Supplemental information that the task requires to migrate the data for
  /// certain source and target endpoints. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html">Specifying
  /// Supplemental Data for Task Settings</a> in the <i>AWS Database Migration
  /// Service User Guide.</i>
  final String? taskData;

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
    this.targetReplicationInstanceArn,
    this.taskData,
  });

  factory ReplicationTask.fromJson(Map<String, dynamic> json) {
    return ReplicationTask(
      cdcStartPosition: json['CdcStartPosition'] as String?,
      cdcStopPosition: json['CdcStopPosition'] as String?,
      lastFailureMessage: json['LastFailureMessage'] as String?,
      migrationType: (json['MigrationType'] as String?)?.toMigrationTypeValue(),
      recoveryCheckpoint: json['RecoveryCheckpoint'] as String?,
      replicationInstanceArn: json['ReplicationInstanceArn'] as String?,
      replicationTaskArn: json['ReplicationTaskArn'] as String?,
      replicationTaskCreationDate:
          timeStampFromJson(json['ReplicationTaskCreationDate']),
      replicationTaskIdentifier: json['ReplicationTaskIdentifier'] as String?,
      replicationTaskSettings: json['ReplicationTaskSettings'] as String?,
      replicationTaskStartDate:
          timeStampFromJson(json['ReplicationTaskStartDate']),
      replicationTaskStats: json['ReplicationTaskStats'] != null
          ? ReplicationTaskStats.fromJson(
              json['ReplicationTaskStats'] as Map<String, dynamic>)
          : null,
      sourceEndpointArn: json['SourceEndpointArn'] as String?,
      status: json['Status'] as String?,
      stopReason: json['StopReason'] as String?,
      tableMappings: json['TableMappings'] as String?,
      targetEndpointArn: json['TargetEndpointArn'] as String?,
      targetReplicationInstanceArn:
          json['TargetReplicationInstanceArn'] as String?,
      taskData: json['TaskData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cdcStartPosition = this.cdcStartPosition;
    final cdcStopPosition = this.cdcStopPosition;
    final lastFailureMessage = this.lastFailureMessage;
    final migrationType = this.migrationType;
    final recoveryCheckpoint = this.recoveryCheckpoint;
    final replicationInstanceArn = this.replicationInstanceArn;
    final replicationTaskArn = this.replicationTaskArn;
    final replicationTaskCreationDate = this.replicationTaskCreationDate;
    final replicationTaskIdentifier = this.replicationTaskIdentifier;
    final replicationTaskSettings = this.replicationTaskSettings;
    final replicationTaskStartDate = this.replicationTaskStartDate;
    final replicationTaskStats = this.replicationTaskStats;
    final sourceEndpointArn = this.sourceEndpointArn;
    final status = this.status;
    final stopReason = this.stopReason;
    final tableMappings = this.tableMappings;
    final targetEndpointArn = this.targetEndpointArn;
    final targetReplicationInstanceArn = this.targetReplicationInstanceArn;
    final taskData = this.taskData;
    return {
      if (cdcStartPosition != null) 'CdcStartPosition': cdcStartPosition,
      if (cdcStopPosition != null) 'CdcStopPosition': cdcStopPosition,
      if (lastFailureMessage != null) 'LastFailureMessage': lastFailureMessage,
      if (migrationType != null) 'MigrationType': migrationType.toValue(),
      if (recoveryCheckpoint != null) 'RecoveryCheckpoint': recoveryCheckpoint,
      if (replicationInstanceArn != null)
        'ReplicationInstanceArn': replicationInstanceArn,
      if (replicationTaskArn != null) 'ReplicationTaskArn': replicationTaskArn,
      if (replicationTaskCreationDate != null)
        'ReplicationTaskCreationDate':
            unixTimestampToJson(replicationTaskCreationDate),
      if (replicationTaskIdentifier != null)
        'ReplicationTaskIdentifier': replicationTaskIdentifier,
      if (replicationTaskSettings != null)
        'ReplicationTaskSettings': replicationTaskSettings,
      if (replicationTaskStartDate != null)
        'ReplicationTaskStartDate':
            unixTimestampToJson(replicationTaskStartDate),
      if (replicationTaskStats != null)
        'ReplicationTaskStats': replicationTaskStats,
      if (sourceEndpointArn != null) 'SourceEndpointArn': sourceEndpointArn,
      if (status != null) 'Status': status,
      if (stopReason != null) 'StopReason': stopReason,
      if (tableMappings != null) 'TableMappings': tableMappings,
      if (targetEndpointArn != null) 'TargetEndpointArn': targetEndpointArn,
      if (targetReplicationInstanceArn != null)
        'TargetReplicationInstanceArn': targetReplicationInstanceArn,
      if (taskData != null) 'TaskData': taskData,
    };
  }
}

/// The task assessment report in JSON format.
class ReplicationTaskAssessmentResult {
  /// The task assessment results in JSON format.
  final String? assessmentResults;

  /// The file containing the results of the task assessment.
  final String? assessmentResultsFile;

  /// The status of the task assessment.
  final String? assessmentStatus;

  /// The Amazon Resource Name (ARN) of the replication task.
  final String? replicationTaskArn;

  /// The replication task identifier of the task on which the task assessment was
  /// run.
  final String? replicationTaskIdentifier;

  /// The date the task assessment was completed.
  final DateTime? replicationTaskLastAssessmentDate;

  /// The URL of the S3 object containing the task assessment results.
  final String? s3ObjectUrl;

  ReplicationTaskAssessmentResult({
    this.assessmentResults,
    this.assessmentResultsFile,
    this.assessmentStatus,
    this.replicationTaskArn,
    this.replicationTaskIdentifier,
    this.replicationTaskLastAssessmentDate,
    this.s3ObjectUrl,
  });

  factory ReplicationTaskAssessmentResult.fromJson(Map<String, dynamic> json) {
    return ReplicationTaskAssessmentResult(
      assessmentResults: json['AssessmentResults'] as String?,
      assessmentResultsFile: json['AssessmentResultsFile'] as String?,
      assessmentStatus: json['AssessmentStatus'] as String?,
      replicationTaskArn: json['ReplicationTaskArn'] as String?,
      replicationTaskIdentifier: json['ReplicationTaskIdentifier'] as String?,
      replicationTaskLastAssessmentDate:
          timeStampFromJson(json['ReplicationTaskLastAssessmentDate']),
      s3ObjectUrl: json['S3ObjectUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentResults = this.assessmentResults;
    final assessmentResultsFile = this.assessmentResultsFile;
    final assessmentStatus = this.assessmentStatus;
    final replicationTaskArn = this.replicationTaskArn;
    final replicationTaskIdentifier = this.replicationTaskIdentifier;
    final replicationTaskLastAssessmentDate =
        this.replicationTaskLastAssessmentDate;
    final s3ObjectUrl = this.s3ObjectUrl;
    return {
      if (assessmentResults != null) 'AssessmentResults': assessmentResults,
      if (assessmentResultsFile != null)
        'AssessmentResultsFile': assessmentResultsFile,
      if (assessmentStatus != null) 'AssessmentStatus': assessmentStatus,
      if (replicationTaskArn != null) 'ReplicationTaskArn': replicationTaskArn,
      if (replicationTaskIdentifier != null)
        'ReplicationTaskIdentifier': replicationTaskIdentifier,
      if (replicationTaskLastAssessmentDate != null)
        'ReplicationTaskLastAssessmentDate':
            unixTimestampToJson(replicationTaskLastAssessmentDate),
      if (s3ObjectUrl != null) 'S3ObjectUrl': s3ObjectUrl,
    };
  }
}

/// Provides information that describes a premigration assessment run that you
/// have started using the <code>StartReplicationTaskAssessmentRun</code>
/// operation.
///
/// Some of the information appears based on other operations that can return
/// the <code>ReplicationTaskAssessmentRun</code> object.
class ReplicationTaskAssessmentRun {
  /// Indication of the completion progress for the individual assessments
  /// specified to run.
  final ReplicationTaskAssessmentRunProgress? assessmentProgress;

  /// Unique name of the assessment run.
  final String? assessmentRunName;

  /// Last message generated by an individual assessment failure.
  final String? lastFailureMessage;

  /// ARN of the migration task associated with this premigration assessment run.
  final String? replicationTaskArn;

  /// Amazon Resource Name (ARN) of this assessment run.
  final String? replicationTaskAssessmentRunArn;

  /// Date on which the assessment run was created using the
  /// <code>StartReplicationTaskAssessmentRun</code> operation.
  final DateTime? replicationTaskAssessmentRunCreationDate;

  /// Encryption mode used to encrypt the assessment run results.
  final String? resultEncryptionMode;

  /// ARN of the AWS KMS encryption key used to encrypt the assessment run
  /// results.
  final String? resultKmsKeyArn;

  /// Amazon S3 bucket where AWS DMS stores the results of this assessment run.
  final String? resultLocationBucket;

  /// Folder in an Amazon S3 bucket where AWS DMS stores the results of this
  /// assessment run.
  final String? resultLocationFolder;

  /// ARN of the service role used to start the assessment run using the
  /// <code>StartReplicationTaskAssessmentRun</code> operation.
  final String? serviceAccessRoleArn;

  /// Assessment run status.
  ///
  /// This status can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>"cancelling"</code> – The assessment run was canceled by the
  /// <code>CancelReplicationTaskAssessmentRun</code> operation.
  /// </li>
  /// <li>
  /// <code>"deleting"</code> – The assessment run was deleted by the
  /// <code>DeleteReplicationTaskAssessmentRun</code> operation.
  /// </li>
  /// <li>
  /// <code>"failed"</code> – At least one individual assessment completed with a
  /// <code>failed</code> status.
  /// </li>
  /// <li>
  /// <code>"error-provisioning"</code> – An internal error occurred while
  /// resources were provisioned (during <code>provisioning</code> status).
  /// </li>
  /// <li>
  /// <code>"error-executing"</code> – An internal error occurred while individual
  /// assessments ran (during <code>running</code> status).
  /// </li>
  /// <li>
  /// <code>"invalid state"</code> – The assessment run is in an unknown state.
  /// </li>
  /// <li>
  /// <code>"passed"</code> – All individual assessments have completed, and none
  /// has a <code>failed</code> status.
  /// </li>
  /// <li>
  /// <code>"provisioning"</code> – Resources required to run individual
  /// assessments are being provisioned.
  /// </li>
  /// <li>
  /// <code>"running"</code> – Individual assessments are being run.
  /// </li>
  /// <li>
  /// <code>"starting"</code> – The assessment run is starting, but resources are
  /// not yet being provisioned for individual assessments.
  /// </li>
  /// </ul>
  final String? status;

  ReplicationTaskAssessmentRun({
    this.assessmentProgress,
    this.assessmentRunName,
    this.lastFailureMessage,
    this.replicationTaskArn,
    this.replicationTaskAssessmentRunArn,
    this.replicationTaskAssessmentRunCreationDate,
    this.resultEncryptionMode,
    this.resultKmsKeyArn,
    this.resultLocationBucket,
    this.resultLocationFolder,
    this.serviceAccessRoleArn,
    this.status,
  });

  factory ReplicationTaskAssessmentRun.fromJson(Map<String, dynamic> json) {
    return ReplicationTaskAssessmentRun(
      assessmentProgress: json['AssessmentProgress'] != null
          ? ReplicationTaskAssessmentRunProgress.fromJson(
              json['AssessmentProgress'] as Map<String, dynamic>)
          : null,
      assessmentRunName: json['AssessmentRunName'] as String?,
      lastFailureMessage: json['LastFailureMessage'] as String?,
      replicationTaskArn: json['ReplicationTaskArn'] as String?,
      replicationTaskAssessmentRunArn:
          json['ReplicationTaskAssessmentRunArn'] as String?,
      replicationTaskAssessmentRunCreationDate:
          timeStampFromJson(json['ReplicationTaskAssessmentRunCreationDate']),
      resultEncryptionMode: json['ResultEncryptionMode'] as String?,
      resultKmsKeyArn: json['ResultKmsKeyArn'] as String?,
      resultLocationBucket: json['ResultLocationBucket'] as String?,
      resultLocationFolder: json['ResultLocationFolder'] as String?,
      serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentProgress = this.assessmentProgress;
    final assessmentRunName = this.assessmentRunName;
    final lastFailureMessage = this.lastFailureMessage;
    final replicationTaskArn = this.replicationTaskArn;
    final replicationTaskAssessmentRunArn =
        this.replicationTaskAssessmentRunArn;
    final replicationTaskAssessmentRunCreationDate =
        this.replicationTaskAssessmentRunCreationDate;
    final resultEncryptionMode = this.resultEncryptionMode;
    final resultKmsKeyArn = this.resultKmsKeyArn;
    final resultLocationBucket = this.resultLocationBucket;
    final resultLocationFolder = this.resultLocationFolder;
    final serviceAccessRoleArn = this.serviceAccessRoleArn;
    final status = this.status;
    return {
      if (assessmentProgress != null) 'AssessmentProgress': assessmentProgress,
      if (assessmentRunName != null) 'AssessmentRunName': assessmentRunName,
      if (lastFailureMessage != null) 'LastFailureMessage': lastFailureMessage,
      if (replicationTaskArn != null) 'ReplicationTaskArn': replicationTaskArn,
      if (replicationTaskAssessmentRunArn != null)
        'ReplicationTaskAssessmentRunArn': replicationTaskAssessmentRunArn,
      if (replicationTaskAssessmentRunCreationDate != null)
        'ReplicationTaskAssessmentRunCreationDate':
            unixTimestampToJson(replicationTaskAssessmentRunCreationDate),
      if (resultEncryptionMode != null)
        'ResultEncryptionMode': resultEncryptionMode,
      if (resultKmsKeyArn != null) 'ResultKmsKeyArn': resultKmsKeyArn,
      if (resultLocationBucket != null)
        'ResultLocationBucket': resultLocationBucket,
      if (resultLocationFolder != null)
        'ResultLocationFolder': resultLocationFolder,
      if (serviceAccessRoleArn != null)
        'ServiceAccessRoleArn': serviceAccessRoleArn,
      if (status != null) 'Status': status,
    };
  }
}

/// The progress values reported by the <code>AssessmentProgress</code> response
/// element.
class ReplicationTaskAssessmentRunProgress {
  /// The number of individual assessments that have completed, successfully or
  /// not.
  final int? individualAssessmentCompletedCount;

  /// The number of individual assessments that are specified to run.
  final int? individualAssessmentCount;

  ReplicationTaskAssessmentRunProgress({
    this.individualAssessmentCompletedCount,
    this.individualAssessmentCount,
  });

  factory ReplicationTaskAssessmentRunProgress.fromJson(
      Map<String, dynamic> json) {
    return ReplicationTaskAssessmentRunProgress(
      individualAssessmentCompletedCount:
          json['IndividualAssessmentCompletedCount'] as int?,
      individualAssessmentCount: json['IndividualAssessmentCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final individualAssessmentCompletedCount =
        this.individualAssessmentCompletedCount;
    final individualAssessmentCount = this.individualAssessmentCount;
    return {
      if (individualAssessmentCompletedCount != null)
        'IndividualAssessmentCompletedCount':
            individualAssessmentCompletedCount,
      if (individualAssessmentCount != null)
        'IndividualAssessmentCount': individualAssessmentCount,
    };
  }
}

/// Provides information that describes an individual assessment from a
/// premigration assessment run.
class ReplicationTaskIndividualAssessment {
  /// Name of this individual assessment.
  final String? individualAssessmentName;

  /// ARN of the premigration assessment run that is created to run this
  /// individual assessment.
  final String? replicationTaskAssessmentRunArn;

  /// Amazon Resource Name (ARN) of this individual assessment.
  final String? replicationTaskIndividualAssessmentArn;

  /// Date when this individual assessment was started as part of running the
  /// <code>StartReplicationTaskAssessmentRun</code> operation.
  final DateTime? replicationTaskIndividualAssessmentStartDate;

  /// Individual assessment status.
  ///
  /// This status can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>"cancelled"</code>
  /// </li>
  /// <li>
  /// <code>"error"</code>
  /// </li>
  /// <li>
  /// <code>"failed"</code>
  /// </li>
  /// <li>
  /// <code>"passed"</code>
  /// </li>
  /// <li>
  /// <code>"pending"</code>
  /// </li>
  /// <li>
  /// <code>"running"</code>
  /// </li>
  /// </ul>
  final String? status;

  ReplicationTaskIndividualAssessment({
    this.individualAssessmentName,
    this.replicationTaskAssessmentRunArn,
    this.replicationTaskIndividualAssessmentArn,
    this.replicationTaskIndividualAssessmentStartDate,
    this.status,
  });

  factory ReplicationTaskIndividualAssessment.fromJson(
      Map<String, dynamic> json) {
    return ReplicationTaskIndividualAssessment(
      individualAssessmentName: json['IndividualAssessmentName'] as String?,
      replicationTaskAssessmentRunArn:
          json['ReplicationTaskAssessmentRunArn'] as String?,
      replicationTaskIndividualAssessmentArn:
          json['ReplicationTaskIndividualAssessmentArn'] as String?,
      replicationTaskIndividualAssessmentStartDate: timeStampFromJson(
          json['ReplicationTaskIndividualAssessmentStartDate']),
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final individualAssessmentName = this.individualAssessmentName;
    final replicationTaskAssessmentRunArn =
        this.replicationTaskAssessmentRunArn;
    final replicationTaskIndividualAssessmentArn =
        this.replicationTaskIndividualAssessmentArn;
    final replicationTaskIndividualAssessmentStartDate =
        this.replicationTaskIndividualAssessmentStartDate;
    final status = this.status;
    return {
      if (individualAssessmentName != null)
        'IndividualAssessmentName': individualAssessmentName,
      if (replicationTaskAssessmentRunArn != null)
        'ReplicationTaskAssessmentRunArn': replicationTaskAssessmentRunArn,
      if (replicationTaskIndividualAssessmentArn != null)
        'ReplicationTaskIndividualAssessmentArn':
            replicationTaskIndividualAssessmentArn,
      if (replicationTaskIndividualAssessmentStartDate != null)
        'ReplicationTaskIndividualAssessmentStartDate':
            unixTimestampToJson(replicationTaskIndividualAssessmentStartDate),
      if (status != null) 'Status': status,
    };
  }
}

/// In response to a request by the <code>DescribeReplicationTasks</code>
/// operation, this object provides a collection of statistics about a
/// replication task.
class ReplicationTaskStats {
  /// The elapsed time of the task, in milliseconds.
  final int? elapsedTimeMillis;

  /// The date the replication task was started either with a fresh start or a
  /// target reload.
  final DateTime? freshStartDate;

  /// The date the replication task full load was completed.
  final DateTime? fullLoadFinishDate;

  /// The percent complete for the full load migration task.
  final int? fullLoadProgressPercent;

  /// The date the replication task full load was started.
  final DateTime? fullLoadStartDate;

  /// The date the replication task was started either with a fresh start or a
  /// resume. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html#DMS-StartReplicationTask-request-StartReplicationTaskType">StartReplicationTaskType</a>.
  final DateTime? startDate;

  /// The date the replication task was stopped.
  final DateTime? stopDate;

  /// The number of errors that have occurred during this task.
  final int? tablesErrored;

  /// The number of tables loaded for this task.
  final int? tablesLoaded;

  /// The number of tables currently loading for this task.
  final int? tablesLoading;

  /// The number of tables queued for this task.
  final int? tablesQueued;

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

  factory ReplicationTaskStats.fromJson(Map<String, dynamic> json) {
    return ReplicationTaskStats(
      elapsedTimeMillis: json['ElapsedTimeMillis'] as int?,
      freshStartDate: timeStampFromJson(json['FreshStartDate']),
      fullLoadFinishDate: timeStampFromJson(json['FullLoadFinishDate']),
      fullLoadProgressPercent: json['FullLoadProgressPercent'] as int?,
      fullLoadStartDate: timeStampFromJson(json['FullLoadStartDate']),
      startDate: timeStampFromJson(json['StartDate']),
      stopDate: timeStampFromJson(json['StopDate']),
      tablesErrored: json['TablesErrored'] as int?,
      tablesLoaded: json['TablesLoaded'] as int?,
      tablesLoading: json['TablesLoading'] as int?,
      tablesQueued: json['TablesQueued'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final elapsedTimeMillis = this.elapsedTimeMillis;
    final freshStartDate = this.freshStartDate;
    final fullLoadFinishDate = this.fullLoadFinishDate;
    final fullLoadProgressPercent = this.fullLoadProgressPercent;
    final fullLoadStartDate = this.fullLoadStartDate;
    final startDate = this.startDate;
    final stopDate = this.stopDate;
    final tablesErrored = this.tablesErrored;
    final tablesLoaded = this.tablesLoaded;
    final tablesLoading = this.tablesLoading;
    final tablesQueued = this.tablesQueued;
    return {
      if (elapsedTimeMillis != null) 'ElapsedTimeMillis': elapsedTimeMillis,
      if (freshStartDate != null)
        'FreshStartDate': unixTimestampToJson(freshStartDate),
      if (fullLoadFinishDate != null)
        'FullLoadFinishDate': unixTimestampToJson(fullLoadFinishDate),
      if (fullLoadProgressPercent != null)
        'FullLoadProgressPercent': fullLoadProgressPercent,
      if (fullLoadStartDate != null)
        'FullLoadStartDate': unixTimestampToJson(fullLoadStartDate),
      if (startDate != null) 'StartDate': unixTimestampToJson(startDate),
      if (stopDate != null) 'StopDate': unixTimestampToJson(stopDate),
      if (tablesErrored != null) 'TablesErrored': tablesErrored,
      if (tablesLoaded != null) 'TablesLoaded': tablesLoaded,
      if (tablesLoading != null) 'TablesLoading': tablesLoading,
      if (tablesQueued != null) 'TablesQueued': tablesQueued,
    };
  }
}

/// Identifies an AWS DMS resource and any pending actions for it.
class ResourcePendingMaintenanceActions {
  /// Detailed information about the pending maintenance action.
  final List<PendingMaintenanceAction>? pendingMaintenanceActionDetails;

  /// The Amazon Resource Name (ARN) of the DMS resource that the pending
  /// maintenance action applies to. For information about creating an ARN, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.AWS.ARN.html">
  /// Constructing an Amazon Resource Name (ARN) for AWS DMS</a> in the DMS
  /// documentation.
  final String? resourceIdentifier;

  ResourcePendingMaintenanceActions({
    this.pendingMaintenanceActionDetails,
    this.resourceIdentifier,
  });

  factory ResourcePendingMaintenanceActions.fromJson(
      Map<String, dynamic> json) {
    return ResourcePendingMaintenanceActions(
      pendingMaintenanceActionDetails:
          (json['PendingMaintenanceActionDetails'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  PendingMaintenanceAction.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceIdentifier: json['ResourceIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pendingMaintenanceActionDetails =
        this.pendingMaintenanceActionDetails;
    final resourceIdentifier = this.resourceIdentifier;
    return {
      if (pendingMaintenanceActionDetails != null)
        'PendingMaintenanceActionDetails': pendingMaintenanceActionDetails,
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
    };
  }
}

/// Settings for exporting data to Amazon S3.
class S3Settings {
  /// An optional parameter to set a folder name in the S3 bucket. If provided,
  /// tables are created in the path <code>
  /// <i>bucketFolder</i>/<i>schema_name</i>/<i>table_name</i>/</code>. If this
  /// parameter isn't specified, then the path used is <code>
  /// <i>schema_name</i>/<i>table_name</i>/</code>.
  final String? bucketFolder;

  /// The name of the S3 bucket.
  final String? bucketName;

  /// A value that enables a change data capture (CDC) load to write INSERT and
  /// UPDATE operations to .csv or .parquet (columnar storage) output files. The
  /// default setting is <code>false</code>, but when
  /// <code>CdcInsertsAndUpdates</code> is set to <code>true</code> or
  /// <code>y</code>, only INSERTs and UPDATEs from the source database are
  /// migrated to the .csv or .parquet file.
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
  final bool? cdcInsertsAndUpdates;

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
  final bool? cdcInsertsOnly;

  /// Specifies the folder path of CDC files. For an S3 source, this setting is
  /// required if a task captures change data; otherwise, it's optional. If
  /// <code>CdcPath</code> is set, AWS DMS reads CDC files from this path and
  /// replicates the data changes to the target endpoint. For an S3 target if you
  /// set <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-PreserveTransactions">
  /// <code>PreserveTransactions</code> </a> to <code>true</code>, AWS DMS
  /// verifies that you have set this parameter to a folder path on your S3 target
  /// where AWS DMS can save the transaction order for the CDC load. AWS DMS
  /// creates this CDC folder path in either your S3 target working directory or
  /// the S3 target location specified by <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-BucketFolder">
  /// <code>BucketFolder</code> </a> and <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-BucketName">
  /// <code>BucketName</code> </a>.
  ///
  /// For example, if you specify <code>CdcPath</code> as
  /// <code>MyChangedData</code>, and you specify <code>BucketName</code> as
  /// <code>MyTargetBucket</code> but do not specify <code>BucketFolder</code>,
  /// AWS DMS creates the CDC folder path following:
  /// <code>MyTargetBucket/MyChangedData</code>.
  ///
  /// If you specify the same <code>CdcPath</code>, and you specify
  /// <code>BucketName</code> as <code>MyTargetBucket</code> and
  /// <code>BucketFolder</code> as <code>MyTargetData</code>, AWS DMS creates the
  /// CDC folder path following:
  /// <code>MyTargetBucket/MyTargetData/MyChangedData</code>.
  ///
  /// For more information on CDC including transaction order on an S3 target, see
  /// <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.EndpointSettings.CdcPath">Capturing
  /// data changes (CDC) including transaction order on the S3 target</a>.
  /// <note>
  /// This setting is supported in AWS DMS versions 3.4.2 and later.
  /// </note>
  final String? cdcPath;

  /// An optional parameter to use GZIP to compress the target files. Set to GZIP
  /// to compress the target files. Either set this parameter to NONE (the
  /// default) or don't use it to leave the files uncompressed. This parameter
  /// applies to both .csv and .parquet file formats.
  final CompressionTypeValue? compressionType;

  /// The delimiter used to separate columns in the .csv file for both source and
  /// target. The default is a comma.
  final String? csvDelimiter;

  /// This setting only applies if your Amazon S3 output files during a change
  /// data capture (CDC) load are written in .csv format. If <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-UseCsvNoSupValue">
  /// <code>UseCsvNoSupValue</code> </a> is set to true, specify a string value
  /// that you want AWS DMS to use for all columns not included in the
  /// supplemental log. If you do not specify a string value, AWS DMS uses the
  /// null value for these columns regardless of the <code>UseCsvNoSupValue</code>
  /// setting.
  /// <note>
  /// This setting is supported in AWS DMS versions 3.4.1 and later.
  /// </note>
  final String? csvNoSupValue;

  /// The delimiter used to separate rows in the .csv file for both source and
  /// target. The default is a carriage return (<code>\n</code>).
  final String? csvRowDelimiter;

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
  final DataFormatValue? dataFormat;

  /// The size of one data page in bytes. This parameter defaults to 1024 * 1024
  /// bytes (1 MiB). This number is used for .parquet file format only.
  final int? dataPageSize;

  /// Specifies a date separating delimiter to use during folder partitioning. The
  /// default value is <code>SLASH</code>. Use this parameter when
  /// <code>DatePartitionedEnabled</code> is set to <code>true</code>.
  final DatePartitionDelimiterValue? datePartitionDelimiter;

  /// When set to <code>true</code>, this parameter partitions S3 bucket folders
  /// based on transaction commit dates. The default value is <code>false</code>.
  /// For more information about date-based folder partitoning, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.DatePartitioning">Using
  /// date-based folder partitioning</a>.
  final bool? datePartitionEnabled;

  /// Identifies the sequence of the date format to use during folder
  /// partitioning. The default value is <code>YYYYMMDD</code>. Use this parameter
  /// when <code>DatePartitionedEnabled</code> is set to <code>true</code>.
  final DatePartitionSequenceValue? datePartitionSequence;

  /// The maximum size of an encoded dictionary page of a column. If the
  /// dictionary page exceeds this, this column is stored using an encoding type
  /// of <code>PLAIN</code>. This parameter defaults to 1024 * 1024 bytes (1 MiB),
  /// the maximum size of a dictionary page before it reverts to
  /// <code>PLAIN</code> encoding. This size is used for .parquet file format
  /// only.
  final int? dictPageSizeLimit;

  /// A value that enables statistics for Parquet pages and row groups. Choose
  /// <code>true</code> to enable statistics, <code>false</code> to disable.
  /// Statistics include <code>NULL</code>, <code>DISTINCT</code>,
  /// <code>MAX</code>, and <code>MIN</code> values. This parameter defaults to
  /// <code>true</code>. This value is used for .parquet file format only.
  final bool? enableStatistics;

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
  final EncodingTypeValue? encodingType;

  /// The type of server-side encryption that you want to use for your data. This
  /// encryption type is part of the endpoint settings or the extra connections
  /// attributes for Amazon S3. You can choose either <code>SSE_S3</code> (the
  /// default) or <code>SSE_KMS</code>.
  /// <note>
  /// For the <code>ModifyEndpoint</code> operation, you can change the existing
  /// value of the <code>EncryptionMode</code> parameter from <code>SSE_KMS</code>
  /// to <code>SSE_S3</code>. But you can’t change the existing value from
  /// <code>SSE_S3</code> to <code>SSE_KMS</code>.
  /// </note>
  /// To use <code>SSE_S3</code>, you need an AWS Identity and Access Management
  /// (IAM) role with permission to allow <code>"arn:aws:s3:::dms-*"</code> to use
  /// the following actions:
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
  final EncryptionModeValue? encryptionMode;

  /// Specifies how tables are defined in the S3 source files only.
  final String? externalTableDefinition;

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
  final bool? includeOpForFullLoad;

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
  final bool? parquetTimestampInMillisecond;

  /// The version of the Apache Parquet format that you want to use:
  /// <code>parquet_1_0</code> (the default) or <code>parquet_2_0</code>.
  final ParquetVersionValue? parquetVersion;

  /// If set to <code>true</code>, AWS DMS saves the transaction order for a
  /// change data capture (CDC) load on the Amazon S3 target specified by <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-CdcPath">
  /// <code>CdcPath</code> </a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.EndpointSettings.CdcPath">Capturing
  /// data changes (CDC) including transaction order on the S3 target</a>.
  /// <note>
  /// This setting is supported in AWS DMS versions 3.4.2 and later.
  /// </note>
  final bool? preserveTransactions;

  /// The number of rows in a row group. A smaller row group size provides faster
  /// reads. But as the number of row groups grows, the slower writes become. This
  /// parameter defaults to 10,000 rows. This number is used for .parquet file
  /// format only.
  ///
  /// If you choose a value larger than the maximum, <code>RowGroupLength</code>
  /// is set to the max row group length in bytes (64 * 1024 * 1024).
  final int? rowGroupLength;

  /// If you are using <code>SSE_KMS</code> for the <code>EncryptionMode</code>,
  /// provide the AWS KMS key ID. The key that you use needs an attached policy
  /// that enables AWS Identity and Access Management (IAM) user permissions and
  /// allows use of the key.
  ///
  /// Here is a CLI example: <code>aws dms create-endpoint --endpoint-identifier
  /// <i>value</i> --endpoint-type target --engine-name s3 --s3-settings
  /// ServiceAccessRoleArn=<i>value</i>,BucketFolder=<i>value</i>,BucketName=<i>value</i>,EncryptionMode=SSE_KMS,ServerSideEncryptionKmsKeyId=<i>value</i>
  /// </code>
  final String? serverSideEncryptionKmsKeyId;

  /// The Amazon Resource Name (ARN) used by the service access IAM role. It is a
  /// required parameter that enables DMS to write and read objects from an S3
  /// bucket.
  final String? serviceAccessRoleArn;

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
  final String? timestampColumnName;

  /// This setting applies if the S3 output files during a change data capture
  /// (CDC) load are written in .csv format. If set to <code>true</code> for
  /// columns not included in the supplemental log, AWS DMS uses the value
  /// specified by <a
  /// href="https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-CsvNoSupValue">
  /// <code>CsvNoSupValue</code> </a>. If not set or set to <code>false</code>,
  /// AWS DMS uses the null value for these columns.
  /// <note>
  /// This setting is supported in AWS DMS versions 3.4.1 and later.
  /// </note>
  final bool? useCsvNoSupValue;

  S3Settings({
    this.bucketFolder,
    this.bucketName,
    this.cdcInsertsAndUpdates,
    this.cdcInsertsOnly,
    this.cdcPath,
    this.compressionType,
    this.csvDelimiter,
    this.csvNoSupValue,
    this.csvRowDelimiter,
    this.dataFormat,
    this.dataPageSize,
    this.datePartitionDelimiter,
    this.datePartitionEnabled,
    this.datePartitionSequence,
    this.dictPageSizeLimit,
    this.enableStatistics,
    this.encodingType,
    this.encryptionMode,
    this.externalTableDefinition,
    this.includeOpForFullLoad,
    this.parquetTimestampInMillisecond,
    this.parquetVersion,
    this.preserveTransactions,
    this.rowGroupLength,
    this.serverSideEncryptionKmsKeyId,
    this.serviceAccessRoleArn,
    this.timestampColumnName,
    this.useCsvNoSupValue,
  });

  factory S3Settings.fromJson(Map<String, dynamic> json) {
    return S3Settings(
      bucketFolder: json['BucketFolder'] as String?,
      bucketName: json['BucketName'] as String?,
      cdcInsertsAndUpdates: json['CdcInsertsAndUpdates'] as bool?,
      cdcInsertsOnly: json['CdcInsertsOnly'] as bool?,
      cdcPath: json['CdcPath'] as String?,
      compressionType:
          (json['CompressionType'] as String?)?.toCompressionTypeValue(),
      csvDelimiter: json['CsvDelimiter'] as String?,
      csvNoSupValue: json['CsvNoSupValue'] as String?,
      csvRowDelimiter: json['CsvRowDelimiter'] as String?,
      dataFormat: (json['DataFormat'] as String?)?.toDataFormatValue(),
      dataPageSize: json['DataPageSize'] as int?,
      datePartitionDelimiter: (json['DatePartitionDelimiter'] as String?)
          ?.toDatePartitionDelimiterValue(),
      datePartitionEnabled: json['DatePartitionEnabled'] as bool?,
      datePartitionSequence: (json['DatePartitionSequence'] as String?)
          ?.toDatePartitionSequenceValue(),
      dictPageSizeLimit: json['DictPageSizeLimit'] as int?,
      enableStatistics: json['EnableStatistics'] as bool?,
      encodingType: (json['EncodingType'] as String?)?.toEncodingTypeValue(),
      encryptionMode:
          (json['EncryptionMode'] as String?)?.toEncryptionModeValue(),
      externalTableDefinition: json['ExternalTableDefinition'] as String?,
      includeOpForFullLoad: json['IncludeOpForFullLoad'] as bool?,
      parquetTimestampInMillisecond:
          json['ParquetTimestampInMillisecond'] as bool?,
      parquetVersion:
          (json['ParquetVersion'] as String?)?.toParquetVersionValue(),
      preserveTransactions: json['PreserveTransactions'] as bool?,
      rowGroupLength: json['RowGroupLength'] as int?,
      serverSideEncryptionKmsKeyId:
          json['ServerSideEncryptionKmsKeyId'] as String?,
      serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String?,
      timestampColumnName: json['TimestampColumnName'] as String?,
      useCsvNoSupValue: json['UseCsvNoSupValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketFolder = this.bucketFolder;
    final bucketName = this.bucketName;
    final cdcInsertsAndUpdates = this.cdcInsertsAndUpdates;
    final cdcInsertsOnly = this.cdcInsertsOnly;
    final cdcPath = this.cdcPath;
    final compressionType = this.compressionType;
    final csvDelimiter = this.csvDelimiter;
    final csvNoSupValue = this.csvNoSupValue;
    final csvRowDelimiter = this.csvRowDelimiter;
    final dataFormat = this.dataFormat;
    final dataPageSize = this.dataPageSize;
    final datePartitionDelimiter = this.datePartitionDelimiter;
    final datePartitionEnabled = this.datePartitionEnabled;
    final datePartitionSequence = this.datePartitionSequence;
    final dictPageSizeLimit = this.dictPageSizeLimit;
    final enableStatistics = this.enableStatistics;
    final encodingType = this.encodingType;
    final encryptionMode = this.encryptionMode;
    final externalTableDefinition = this.externalTableDefinition;
    final includeOpForFullLoad = this.includeOpForFullLoad;
    final parquetTimestampInMillisecond = this.parquetTimestampInMillisecond;
    final parquetVersion = this.parquetVersion;
    final preserveTransactions = this.preserveTransactions;
    final rowGroupLength = this.rowGroupLength;
    final serverSideEncryptionKmsKeyId = this.serverSideEncryptionKmsKeyId;
    final serviceAccessRoleArn = this.serviceAccessRoleArn;
    final timestampColumnName = this.timestampColumnName;
    final useCsvNoSupValue = this.useCsvNoSupValue;
    return {
      if (bucketFolder != null) 'BucketFolder': bucketFolder,
      if (bucketName != null) 'BucketName': bucketName,
      if (cdcInsertsAndUpdates != null)
        'CdcInsertsAndUpdates': cdcInsertsAndUpdates,
      if (cdcInsertsOnly != null) 'CdcInsertsOnly': cdcInsertsOnly,
      if (cdcPath != null) 'CdcPath': cdcPath,
      if (compressionType != null) 'CompressionType': compressionType.toValue(),
      if (csvDelimiter != null) 'CsvDelimiter': csvDelimiter,
      if (csvNoSupValue != null) 'CsvNoSupValue': csvNoSupValue,
      if (csvRowDelimiter != null) 'CsvRowDelimiter': csvRowDelimiter,
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (dataPageSize != null) 'DataPageSize': dataPageSize,
      if (datePartitionDelimiter != null)
        'DatePartitionDelimiter': datePartitionDelimiter.toValue(),
      if (datePartitionEnabled != null)
        'DatePartitionEnabled': datePartitionEnabled,
      if (datePartitionSequence != null)
        'DatePartitionSequence': datePartitionSequence.toValue(),
      if (dictPageSizeLimit != null) 'DictPageSizeLimit': dictPageSizeLimit,
      if (enableStatistics != null) 'EnableStatistics': enableStatistics,
      if (encodingType != null) 'EncodingType': encodingType.toValue(),
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (externalTableDefinition != null)
        'ExternalTableDefinition': externalTableDefinition,
      if (includeOpForFullLoad != null)
        'IncludeOpForFullLoad': includeOpForFullLoad,
      if (parquetTimestampInMillisecond != null)
        'ParquetTimestampInMillisecond': parquetTimestampInMillisecond,
      if (parquetVersion != null) 'ParquetVersion': parquetVersion.toValue(),
      if (preserveTransactions != null)
        'PreserveTransactions': preserveTransactions,
      if (rowGroupLength != null) 'RowGroupLength': rowGroupLength,
      if (serverSideEncryptionKmsKeyId != null)
        'ServerSideEncryptionKmsKeyId': serverSideEncryptionKmsKeyId,
      if (serviceAccessRoleArn != null)
        'ServiceAccessRoleArn': serviceAccessRoleArn,
      if (timestampColumnName != null)
        'TimestampColumnName': timestampColumnName,
      if (useCsvNoSupValue != null) 'UseCsvNoSupValue': useCsvNoSupValue,
    };
  }
}

enum SafeguardPolicy {
  relyOnSqlServerReplicationAgent,
  exclusiveAutomaticTruncation,
  sharedAutomaticTruncation,
}

extension on SafeguardPolicy {
  String toValue() {
    switch (this) {
      case SafeguardPolicy.relyOnSqlServerReplicationAgent:
        return 'rely-on-sql-server-replication-agent';
      case SafeguardPolicy.exclusiveAutomaticTruncation:
        return 'exclusive-automatic-truncation';
      case SafeguardPolicy.sharedAutomaticTruncation:
        return 'shared-automatic-truncation';
    }
  }
}

extension on String {
  SafeguardPolicy toSafeguardPolicy() {
    switch (this) {
      case 'rely-on-sql-server-replication-agent':
        return SafeguardPolicy.relyOnSqlServerReplicationAgent;
      case 'exclusive-automatic-truncation':
        return SafeguardPolicy.exclusiveAutomaticTruncation;
      case 'shared-automatic-truncation':
        return SafeguardPolicy.sharedAutomaticTruncation;
    }
    throw Exception('$this is not known in enum SafeguardPolicy');
  }
}

enum SourceType {
  replicationInstance,
}

extension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.replicationInstance:
        return 'replication-instance';
    }
  }
}

extension on String {
  SourceType toSourceType() {
    switch (this) {
      case 'replication-instance':
        return SourceType.replicationInstance;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

/// <p/>
class StartReplicationTaskAssessmentResponse {
  /// The assessed replication task.
  final ReplicationTask? replicationTask;

  StartReplicationTaskAssessmentResponse({
    this.replicationTask,
  });

  factory StartReplicationTaskAssessmentResponse.fromJson(
      Map<String, dynamic> json) {
    return StartReplicationTaskAssessmentResponse(
      replicationTask: json['ReplicationTask'] != null
          ? ReplicationTask.fromJson(
              json['ReplicationTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTask = this.replicationTask;
    return {
      if (replicationTask != null) 'ReplicationTask': replicationTask,
    };
  }
}

/// <p/>
class StartReplicationTaskAssessmentRunResponse {
  /// The premigration assessment run that was started.
  final ReplicationTaskAssessmentRun? replicationTaskAssessmentRun;

  StartReplicationTaskAssessmentRunResponse({
    this.replicationTaskAssessmentRun,
  });

  factory StartReplicationTaskAssessmentRunResponse.fromJson(
      Map<String, dynamic> json) {
    return StartReplicationTaskAssessmentRunResponse(
      replicationTaskAssessmentRun: json['ReplicationTaskAssessmentRun'] != null
          ? ReplicationTaskAssessmentRun.fromJson(
              json['ReplicationTaskAssessmentRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTaskAssessmentRun = this.replicationTaskAssessmentRun;
    return {
      if (replicationTaskAssessmentRun != null)
        'ReplicationTaskAssessmentRun': replicationTaskAssessmentRun,
    };
  }
}

/// <p/>
class StartReplicationTaskResponse {
  /// The replication task started.
  final ReplicationTask? replicationTask;

  StartReplicationTaskResponse({
    this.replicationTask,
  });

  factory StartReplicationTaskResponse.fromJson(Map<String, dynamic> json) {
    return StartReplicationTaskResponse(
      replicationTask: json['ReplicationTask'] != null
          ? ReplicationTask.fromJson(
              json['ReplicationTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTask = this.replicationTask;
    return {
      if (replicationTask != null) 'ReplicationTask': replicationTask,
    };
  }
}

enum StartReplicationTaskTypeValue {
  startReplication,
  resumeProcessing,
  reloadTarget,
}

extension on StartReplicationTaskTypeValue {
  String toValue() {
    switch (this) {
      case StartReplicationTaskTypeValue.startReplication:
        return 'start-replication';
      case StartReplicationTaskTypeValue.resumeProcessing:
        return 'resume-processing';
      case StartReplicationTaskTypeValue.reloadTarget:
        return 'reload-target';
    }
  }
}

extension on String {
  StartReplicationTaskTypeValue toStartReplicationTaskTypeValue() {
    switch (this) {
      case 'start-replication':
        return StartReplicationTaskTypeValue.startReplication;
      case 'resume-processing':
        return StartReplicationTaskTypeValue.resumeProcessing;
      case 'reload-target':
        return StartReplicationTaskTypeValue.reloadTarget;
    }
    throw Exception('$this is not known in enum StartReplicationTaskTypeValue');
  }
}

/// <p/>
class StopReplicationTaskResponse {
  /// The replication task stopped.
  final ReplicationTask? replicationTask;

  StopReplicationTaskResponse({
    this.replicationTask,
  });

  factory StopReplicationTaskResponse.fromJson(Map<String, dynamic> json) {
    return StopReplicationTaskResponse(
      replicationTask: json['ReplicationTask'] != null
          ? ReplicationTask.fromJson(
              json['ReplicationTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationTask = this.replicationTask;
    return {
      if (replicationTask != null) 'ReplicationTask': replicationTask,
    };
  }
}

/// In response to a request by the <code>DescribeReplicationSubnetGroups</code>
/// operation, this object identifies a subnet by its given Availability Zone,
/// subnet identifier, and status.
class Subnet {
  /// The Availability Zone of the subnet.
  final AvailabilityZone? subnetAvailabilityZone;

  /// The subnet identifier.
  final String? subnetIdentifier;

  /// The status of the subnet.
  final String? subnetStatus;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetStatus,
  });

  factory Subnet.fromJson(Map<String, dynamic> json) {
    return Subnet(
      subnetAvailabilityZone: json['SubnetAvailabilityZone'] != null
          ? AvailabilityZone.fromJson(
              json['SubnetAvailabilityZone'] as Map<String, dynamic>)
          : null,
      subnetIdentifier: json['SubnetIdentifier'] as String?,
      subnetStatus: json['SubnetStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetIdentifier = this.subnetIdentifier;
    final subnetStatus = this.subnetStatus;
    return {
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetIdentifier != null) 'SubnetIdentifier': subnetIdentifier,
      if (subnetStatus != null) 'SubnetStatus': subnetStatus,
    };
  }
}

/// Provides information about types of supported endpoints in response to a
/// request by the <code>DescribeEndpointTypes</code> operation. This
/// information includes the type of endpoint, the database engine name, and
/// whether change data capture (CDC) is supported.
class SupportedEndpointType {
  /// The type of endpoint. Valid values are <code>source</code> and
  /// <code>target</code>.
  final ReplicationEndpointTypeValue? endpointType;

  /// The expanded name for the engine name. For example, if the
  /// <code>EngineName</code> parameter is "aurora," this value would be "Amazon
  /// Aurora MySQL."
  final String? engineDisplayName;

  /// The database engine name. Valid values, depending on the EndpointType,
  /// include <code>"mysql"</code>, <code>"oracle"</code>,
  /// <code>"postgres"</code>, <code>"mariadb"</code>, <code>"aurora"</code>,
  /// <code>"aurora-postgresql"</code>, <code>"redshift"</code>,
  /// <code>"s3"</code>, <code>"db2"</code>, <code>"azuredb"</code>,
  /// <code>"sybase"</code>, <code>"dynamodb"</code>, <code>"mongodb"</code>,
  /// <code>"kinesis"</code>, <code>"kafka"</code>, <code>"elasticsearch"</code>,
  /// <code>"documentdb"</code>, <code>"sqlserver"</code>, and
  /// <code>"neptune"</code>.
  final String? engineName;

  /// The earliest AWS DMS engine version that supports this endpoint engine. Note
  /// that endpoint engines released with AWS DMS versions earlier than 3.1.1 do
  /// not return a value for this parameter.
  final String? replicationInstanceEngineMinimumVersion;

  /// Indicates if Change Data Capture (CDC) is supported.
  final bool? supportsCDC;

  SupportedEndpointType({
    this.endpointType,
    this.engineDisplayName,
    this.engineName,
    this.replicationInstanceEngineMinimumVersion,
    this.supportsCDC,
  });

  factory SupportedEndpointType.fromJson(Map<String, dynamic> json) {
    return SupportedEndpointType(
      endpointType:
          (json['EndpointType'] as String?)?.toReplicationEndpointTypeValue(),
      engineDisplayName: json['EngineDisplayName'] as String?,
      engineName: json['EngineName'] as String?,
      replicationInstanceEngineMinimumVersion:
          json['ReplicationInstanceEngineMinimumVersion'] as String?,
      supportsCDC: json['SupportsCDC'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointType = this.endpointType;
    final engineDisplayName = this.engineDisplayName;
    final engineName = this.engineName;
    final replicationInstanceEngineMinimumVersion =
        this.replicationInstanceEngineMinimumVersion;
    final supportsCDC = this.supportsCDC;
    return {
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (engineDisplayName != null) 'EngineDisplayName': engineDisplayName,
      if (engineName != null) 'EngineName': engineName,
      if (replicationInstanceEngineMinimumVersion != null)
        'ReplicationInstanceEngineMinimumVersion':
            replicationInstanceEngineMinimumVersion,
      if (supportsCDC != null) 'SupportsCDC': supportsCDC,
    };
  }
}

/// Provides information that defines a SAP ASE endpoint.
class SybaseSettings {
  /// Database name for the endpoint.
  final String? databaseName;

  /// Endpoint connection password.
  final String? password;

  /// Endpoint TCP port.
  final int? port;

  /// The full Amazon Resource Name (ARN) of the IAM role that specifies AWS DMS
  /// as the trusted entity and grants the required permissions to access the
  /// value in <code>SecretsManagerSecret</code>.
  /// <code>SecretsManagerSecret</code> has the value of the AWS Secrets Manager
  /// secret that allows access to the SAP ASE endpoint.
  /// <note>
  /// You can specify one of two sets of values for these permissions. You can
  /// specify the values for this setting and <code>SecretsManagerSecretId</code>.
  /// Or you can specify clear-text values for <code>UserName</code>,
  /// <code>Password</code>, <code>ServerName</code>, and <code>Port</code>. You
  /// can't specify both. For more information on creating this
  /// <code>SecretsManagerSecret</code> and the
  /// <code>SecretsManagerAccessRoleArn</code> and
  /// <code>SecretsManagerSecretId</code> required to access it, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager">Using
  /// secrets to access AWS Database Migration Service resources</a> in the <i>AWS
  /// Database Migration Service User Guide</i>.
  /// </note>
  final String? secretsManagerAccessRoleArn;

  /// The full ARN, partial ARN, or friendly name of the
  /// <code>SecretsManagerSecret</code> that contains the SAP SAE endpoint
  /// connection details.
  final String? secretsManagerSecretId;

  /// Fully qualified domain name of the endpoint.
  final String? serverName;

  /// Endpoint connection user name.
  final String? username;

  SybaseSettings({
    this.databaseName,
    this.password,
    this.port,
    this.secretsManagerAccessRoleArn,
    this.secretsManagerSecretId,
    this.serverName,
    this.username,
  });

  factory SybaseSettings.fromJson(Map<String, dynamic> json) {
    return SybaseSettings(
      databaseName: json['DatabaseName'] as String?,
      password: json['Password'] as String?,
      port: json['Port'] as int?,
      secretsManagerAccessRoleArn:
          json['SecretsManagerAccessRoleArn'] as String?,
      secretsManagerSecretId: json['SecretsManagerSecretId'] as String?,
      serverName: json['ServerName'] as String?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final password = this.password;
    final port = this.port;
    final secretsManagerAccessRoleArn = this.secretsManagerAccessRoleArn;
    final secretsManagerSecretId = this.secretsManagerSecretId;
    final serverName = this.serverName;
    final username = this.username;
    return {
      if (databaseName != null) 'DatabaseName': databaseName,
      if (password != null) 'Password': password,
      if (port != null) 'Port': port,
      if (secretsManagerAccessRoleArn != null)
        'SecretsManagerAccessRoleArn': secretsManagerAccessRoleArn,
      if (secretsManagerSecretId != null)
        'SecretsManagerSecretId': secretsManagerSecretId,
      if (serverName != null) 'ServerName': serverName,
      if (username != null) 'Username': username,
    };
  }
}

/// Provides a collection of table statistics in response to a request by the
/// <code>DescribeTableStatistics</code> operation.
class TableStatistics {
  /// The data definition language (DDL) used to build and modify the structure of
  /// your tables.
  final int? ddls;

  /// The number of delete actions performed on a table.
  final int? deletes;

  /// The number of rows that failed conditional checks during the full load
  /// operation (valid only for migrations where DynamoDB is the target).
  final int? fullLoadCondtnlChkFailedRows;

  /// The time when the full load operation completed.
  final DateTime? fullLoadEndTime;

  /// The number of rows that failed to load during the full load operation (valid
  /// only for migrations where DynamoDB is the target).
  final int? fullLoadErrorRows;

  /// A value that indicates if the table was reloaded (<code>true</code>) or
  /// loaded as part of a new full load operation (<code>false</code>).
  final bool? fullLoadReloaded;

  /// The number of rows added during the full load operation.
  final int? fullLoadRows;

  /// The time when the full load operation started.
  final DateTime? fullLoadStartTime;

  /// The number of insert actions performed on a table.
  final int? inserts;

  /// The last time a table was updated.
  final DateTime? lastUpdateTime;

  /// The schema name.
  final String? schemaName;

  /// The name of the table.
  final String? tableName;

  /// The state of the tables described.
  ///
  /// Valid states: Table does not exist | Before load | Full load | Table
  /// completed | Table cancelled | Table error | Table all | Table updates |
  /// Table is being reloaded
  final String? tableState;

  /// The number of update actions performed on a table.
  final int? updates;

  /// The number of records that failed validation.
  final int? validationFailedRecords;

  /// The number of records that have yet to be validated.
  final int? validationPendingRecords;

  /// The validation state of the table.
  ///
  /// This parameter can have the following values:
  ///
  /// <ul>
  /// <li>
  /// Not enabled – Validation isn't enabled for the table in the migration task.
  /// </li>
  /// <li>
  /// Pending records – Some records in the table are waiting for validation.
  /// </li>
  /// <li>
  /// Mismatched records – Some records in the table don't match between the
  /// source and target.
  /// </li>
  /// <li>
  /// Suspended records – Some records in the table couldn't be validated.
  /// </li>
  /// <li>
  /// No primary key –The table couldn't be validated because it has no primary
  /// key.
  /// </li>
  /// <li>
  /// Table error – The table wasn't validated because it's in an error state and
  /// some data wasn't migrated.
  /// </li>
  /// <li>
  /// Validated – All rows in the table are validated. If the table is updated,
  /// the status can change from Validated.
  /// </li>
  /// <li>
  /// Error – The table couldn't be validated because of an unexpected error.
  /// </li>
  /// <li>
  /// Pending validation – The table is waiting validation.
  /// </li>
  /// <li>
  /// Preparing table – Preparing the table enabled in the migration task for
  /// validation.
  /// </li>
  /// <li>
  /// Pending revalidation – All rows in the table are pending validation after
  /// the table was updated.
  /// </li>
  /// </ul>
  final String? validationState;

  /// Additional details about the state of validation.
  final String? validationStateDetails;

  /// The number of records that couldn't be validated.
  final int? validationSuspendedRecords;

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

  factory TableStatistics.fromJson(Map<String, dynamic> json) {
    return TableStatistics(
      ddls: json['Ddls'] as int?,
      deletes: json['Deletes'] as int?,
      fullLoadCondtnlChkFailedRows:
          json['FullLoadCondtnlChkFailedRows'] as int?,
      fullLoadEndTime: timeStampFromJson(json['FullLoadEndTime']),
      fullLoadErrorRows: json['FullLoadErrorRows'] as int?,
      fullLoadReloaded: json['FullLoadReloaded'] as bool?,
      fullLoadRows: json['FullLoadRows'] as int?,
      fullLoadStartTime: timeStampFromJson(json['FullLoadStartTime']),
      inserts: json['Inserts'] as int?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      schemaName: json['SchemaName'] as String?,
      tableName: json['TableName'] as String?,
      tableState: json['TableState'] as String?,
      updates: json['Updates'] as int?,
      validationFailedRecords: json['ValidationFailedRecords'] as int?,
      validationPendingRecords: json['ValidationPendingRecords'] as int?,
      validationState: json['ValidationState'] as String?,
      validationStateDetails: json['ValidationStateDetails'] as String?,
      validationSuspendedRecords: json['ValidationSuspendedRecords'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ddls = this.ddls;
    final deletes = this.deletes;
    final fullLoadCondtnlChkFailedRows = this.fullLoadCondtnlChkFailedRows;
    final fullLoadEndTime = this.fullLoadEndTime;
    final fullLoadErrorRows = this.fullLoadErrorRows;
    final fullLoadReloaded = this.fullLoadReloaded;
    final fullLoadRows = this.fullLoadRows;
    final fullLoadStartTime = this.fullLoadStartTime;
    final inserts = this.inserts;
    final lastUpdateTime = this.lastUpdateTime;
    final schemaName = this.schemaName;
    final tableName = this.tableName;
    final tableState = this.tableState;
    final updates = this.updates;
    final validationFailedRecords = this.validationFailedRecords;
    final validationPendingRecords = this.validationPendingRecords;
    final validationState = this.validationState;
    final validationStateDetails = this.validationStateDetails;
    final validationSuspendedRecords = this.validationSuspendedRecords;
    return {
      if (ddls != null) 'Ddls': ddls,
      if (deletes != null) 'Deletes': deletes,
      if (fullLoadCondtnlChkFailedRows != null)
        'FullLoadCondtnlChkFailedRows': fullLoadCondtnlChkFailedRows,
      if (fullLoadEndTime != null)
        'FullLoadEndTime': unixTimestampToJson(fullLoadEndTime),
      if (fullLoadErrorRows != null) 'FullLoadErrorRows': fullLoadErrorRows,
      if (fullLoadReloaded != null) 'FullLoadReloaded': fullLoadReloaded,
      if (fullLoadRows != null) 'FullLoadRows': fullLoadRows,
      if (fullLoadStartTime != null)
        'FullLoadStartTime': unixTimestampToJson(fullLoadStartTime),
      if (inserts != null) 'Inserts': inserts,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (schemaName != null) 'SchemaName': schemaName,
      if (tableName != null) 'TableName': tableName,
      if (tableState != null) 'TableState': tableState,
      if (updates != null) 'Updates': updates,
      if (validationFailedRecords != null)
        'ValidationFailedRecords': validationFailedRecords,
      if (validationPendingRecords != null)
        'ValidationPendingRecords': validationPendingRecords,
      if (validationState != null) 'ValidationState': validationState,
      if (validationStateDetails != null)
        'ValidationStateDetails': validationStateDetails,
      if (validationSuspendedRecords != null)
        'ValidationSuspendedRecords': validationSuspendedRecords,
    };
  }
}

/// Provides the name of the schema and table to be reloaded.
class TableToReload {
  /// The schema name of the table to be reloaded.
  final String schemaName;

  /// The table name of the table to be reloaded.
  final String tableName;

  TableToReload({
    required this.schemaName,
    required this.tableName,
  });

  factory TableToReload.fromJson(Map<String, dynamic> json) {
    return TableToReload(
      schemaName: json['SchemaName'] as String,
      tableName: json['TableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaName = this.schemaName;
    final tableName = this.tableName;
    return {
      'SchemaName': schemaName,
      'TableName': tableName,
    };
  }
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
class Tag {
  /// A key is the required name of the tag. The string value can be 1-128 Unicode
  /// characters in length and can't be prefixed with "aws:" or "dms:". The string
  /// can only contain only the set of Unicode letters, digits, white-space, '_',
  /// '.', '/', '=', '+', '-' (Java regular expressions:
  /// "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  final String? key;

  /// A value is the optional value of the tag. The string value can be 1-256
  /// Unicode characters in length and can't be prefixed with "aws:" or "dms:".
  /// The string can only contain only the set of Unicode letters, digits,
  /// white-space, '_', '.', '/', '=', '+', '-' (Java regular expressions:
  /// "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

enum TargetDbType {
  specificDatabase,
  multipleDatabases,
}

extension on TargetDbType {
  String toValue() {
    switch (this) {
      case TargetDbType.specificDatabase:
        return 'specific-database';
      case TargetDbType.multipleDatabases:
        return 'multiple-databases';
    }
  }
}

extension on String {
  TargetDbType toTargetDbType() {
    switch (this) {
      case 'specific-database':
        return TargetDbType.specificDatabase;
      case 'multiple-databases':
        return TargetDbType.multipleDatabases;
    }
    throw Exception('$this is not known in enum TargetDbType');
  }
}

/// <p/>
class TestConnectionResponse {
  /// The connection tested.
  final Connection? connection;

  TestConnectionResponse({
    this.connection,
  });

  factory TestConnectionResponse.fromJson(Map<String, dynamic> json) {
    return TestConnectionResponse(
      connection: json['Connection'] != null
          ? Connection.fromJson(json['Connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'Connection': connection,
    };
  }
}

/// Describes the status of a security group associated with the virtual private
/// cloud (VPC) hosting your replication and DB instances.
class VpcSecurityGroupMembership {
  /// The status of the VPC security group.
  final String? status;

  /// The VPC security group ID.
  final String? vpcSecurityGroupId;

  VpcSecurityGroupMembership({
    this.status,
    this.vpcSecurityGroupId,
  });

  factory VpcSecurityGroupMembership.fromJson(Map<String, dynamic> json) {
    return VpcSecurityGroupMembership(
      status: json['Status'] as String?,
      vpcSecurityGroupId: json['VpcSecurityGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final vpcSecurityGroupId = this.vpcSecurityGroupId;
    return {
      if (status != null) 'Status': status,
      if (vpcSecurityGroupId != null) 'VpcSecurityGroupId': vpcSecurityGroupId,
    };
  }
}

class AccessDeniedFault extends _s.GenericAwsException {
  AccessDeniedFault({String? type, String? message})
      : super(type: type, code: 'AccessDeniedFault', message: message);
}

class InsufficientResourceCapacityFault extends _s.GenericAwsException {
  InsufficientResourceCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientResourceCapacityFault',
            message: message);
}

class InvalidCertificateFault extends _s.GenericAwsException {
  InvalidCertificateFault({String? type, String? message})
      : super(type: type, code: 'InvalidCertificateFault', message: message);
}

class InvalidResourceStateFault extends _s.GenericAwsException {
  InvalidResourceStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidResourceStateFault', message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String? type, String? message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class KMSAccessDeniedFault extends _s.GenericAwsException {
  KMSAccessDeniedFault({String? type, String? message})
      : super(type: type, code: 'KMSAccessDeniedFault', message: message);
}

class KMSDisabledFault extends _s.GenericAwsException {
  KMSDisabledFault({String? type, String? message})
      : super(type: type, code: 'KMSDisabledFault', message: message);
}

class KMSFault extends _s.GenericAwsException {
  KMSFault({String? type, String? message})
      : super(type: type, code: 'KMSFault', message: message);
}

class KMSInvalidStateFault extends _s.GenericAwsException {
  KMSInvalidStateFault({String? type, String? message})
      : super(type: type, code: 'KMSInvalidStateFault', message: message);
}

class KMSKeyNotAccessibleFault extends _s.GenericAwsException {
  KMSKeyNotAccessibleFault({String? type, String? message})
      : super(type: type, code: 'KMSKeyNotAccessibleFault', message: message);
}

class KMSNotFoundFault extends _s.GenericAwsException {
  KMSNotFoundFault({String? type, String? message})
      : super(type: type, code: 'KMSNotFoundFault', message: message);
}

class KMSThrottlingFault extends _s.GenericAwsException {
  KMSThrottlingFault({String? type, String? message})
      : super(type: type, code: 'KMSThrottlingFault', message: message);
}

class ReplicationSubnetGroupDoesNotCoverEnoughAZs
    extends _s.GenericAwsException {
  ReplicationSubnetGroupDoesNotCoverEnoughAZs({String? type, String? message})
      : super(
            type: type,
            code: 'ReplicationSubnetGroupDoesNotCoverEnoughAZs',
            message: message);
}

class ResourceAlreadyExistsFault extends _s.GenericAwsException {
  ResourceAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'ResourceAlreadyExistsFault', message: message);
}

class ResourceNotFoundFault extends _s.GenericAwsException {
  ResourceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundFault', message: message);
}

class ResourceQuotaExceededFault extends _s.GenericAwsException {
  ResourceQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'ResourceQuotaExceededFault', message: message);
}

class S3AccessDeniedFault extends _s.GenericAwsException {
  S3AccessDeniedFault({String? type, String? message})
      : super(type: type, code: 'S3AccessDeniedFault', message: message);
}

class S3ResourceNotFoundFault extends _s.GenericAwsException {
  S3ResourceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'S3ResourceNotFoundFault', message: message);
}

class SNSInvalidTopicFault extends _s.GenericAwsException {
  SNSInvalidTopicFault({String? type, String? message})
      : super(type: type, code: 'SNSInvalidTopicFault', message: message);
}

class SNSNoAuthorizationFault extends _s.GenericAwsException {
  SNSNoAuthorizationFault({String? type, String? message})
      : super(type: type, code: 'SNSNoAuthorizationFault', message: message);
}

class StorageQuotaExceededFault extends _s.GenericAwsException {
  StorageQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'StorageQuotaExceededFault', message: message);
}

class SubnetAlreadyInUse extends _s.GenericAwsException {
  SubnetAlreadyInUse({String? type, String? message})
      : super(type: type, code: 'SubnetAlreadyInUse', message: message);
}

class UpgradeDependencyFailureFault extends _s.GenericAwsException {
  UpgradeDependencyFailureFault({String? type, String? message})
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
  'KMSFault': (type, message) => KMSFault(type: type, message: message),
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
  'S3AccessDeniedFault': (type, message) =>
      S3AccessDeniedFault(type: type, message: message),
  'S3ResourceNotFoundFault': (type, message) =>
      S3ResourceNotFoundFault(type: type, message: message),
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
